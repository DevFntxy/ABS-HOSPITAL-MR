# routes/pacientes.py
# ─────────────────────────────────────────────
#  Router — Pacientes
#  Endpoint original sp_poblar_pacientes sin cambios
# ─────────────────────────────────────────────

from typing import Annotated
import pymysql
from fastapi import APIRouter, Depends, HTTPException
from fastapi.concurrency import run_in_threadpool
from db.dependencies import get_mysql
from schemas.adquisicion import PoblarPacientesRequest, APIResponse

router = APIRouter(prefix="/pacientes", tags=["Pacientes"])
MySQLDep = Annotated[pymysql.Connection, Depends(get_mysql)]


@router.post(
    "/poblar",
    summary="Poblar pacientes via SP",
    response_model=APIResponse,
)
async def poblar_pacientes(
    request: PoblarPacientesRequest,
    conn:    MySQLDep,
):
    """
    sp_poblar_pacientes
    - **cantidad**: Número de pacientes a crear (**Obligatorio, Minimo 1**)
    - **genero**: Género del paciente (Opcional, **Valido: 'M', 'F', 'N/B'**)
    - **edad_minima**: Edad mínima (Opcional)
    - **edad_maxima**: Edad máxima (Opcional)
    - **estatus_vida**: Estatus de vida (Opcional, **Valido: 'Vivo', 'Finado', 'Coma', 'Vegetativo', 'Invalido', 'Desconocido'**)
    - **estatus_medico**: Estatus médico (Opcional, **Valido: 'Cuidados Paliativos', 'Diabetico', 'Cancer', 'Trauma' 'Craneoencefalico', 'Cardiacos', 'Pediatrico', 'COVID'**)
    - **etapa_vida**: Etapa de vida (Opcional, **Valido: 'Recién nacido', 'Neonato', 'Infancia', 'Adolescencia', 'Juventud', 'Adultez', 'Vejez'**)
    """
    try:
        cursor = conn.cursor()
        await run_in_threadpool(
            lambda: cursor.callproc("sp_poblar_pacientes", [
                request.cantidad,    request.genero,
                request.edad_minima, request.edad_maxima,
                request.estatus_vida, request.estatus_medico,
                request.etapa_vida,
            ])
        )
        await run_in_threadpool(lambda: [cursor.nextset() for _ in range(10)])
        await run_in_threadpool(conn.commit)

        return APIResponse(
            success=True,
            message=f"{request.cantidad} paciente(s) procesado(s)",
            datos_enviados=request.model_dump(),
        )
    except pymysql.Error as e:
        await run_in_threadpool(conn.rollback)
        raise HTTPException(status_code=500, detail=f"Error SP pacientes: {e}")
