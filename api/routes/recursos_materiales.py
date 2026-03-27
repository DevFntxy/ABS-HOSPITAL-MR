# app/api/routes/recursos_materiales.py
# ─────────────────────────────────────────────
#  Router — Recursos Materiales
#  Solo valida entrada, llama al CRUD y responde.
#  Sin lógica de BD aquí.
# ─────────────────────────────────────────────

from typing import Annotated
import pymysql
from fastapi import APIRouter, Depends, Request
from motor.motor_asyncio import AsyncIOMotorDatabase
from db.dependencies import get_mysql, get_mongo
from schemas.adquisicion import (
    AdquisicionRequest,
    APIResponse,
    IdsGenerados,
    ResultadoMySQL,
)
from crud.adquisicion import ejecutar_sp_adquisicion, insertar_specs_mongo

router = APIRouter(prefix="/recursos-materiales", tags=["Recursos Materiales"])
MySQLDep = Annotated[pymysql.Connection, Depends(get_mysql)]


@router.post(
    "/adquisicion-equipamiento",
    summary="Registrar adquisición de equipamiento médico",
    response_model=APIResponse,
)
async def adquisicion_equipamiento(
    request:      AdquisicionRequest,
    conn:         MySQLDep,
    http_request: Request,
):
    """
    sp_adquisicion_equipamiento

    - **cantidad**: Número de registros a insertar (**Opcional, por defecto 1**)

    - **proveedor** (Opcional):
        - **id_persona**: ID de la persona (FK) (**Opcional, NULL → generado automáticamente**)
        - **nombre**: Nombre del proveedor (**Opcional, NULL → generado automáticamente**)
        - **contacto**: Correo o medio de contacto (**Opcional, NULL → generado automáticamente**)
        - **especialidad**: Tipo de equipamiento que maneja (**Opcional, NULL → aleatorio**)

    - **transaccion** (Opcional):
        - **tipo_transaccion**: Tipo de transacción (**Opcional, válido: 'Compra', 'Pago', 'Devolucion', 'Ajuste'**)
        - **fecha_transaccion**: Fecha de la transacción (**Opcional, NULL → fecha aleatoria últimos 365 días**)
        - **referencia**: Folio o identificador (**Opcional, NULL → generado automáticamente**)

    - **equipamiento** (Opcional):
        - **espacio_id**: ID del espacio (FK) (**Opcional, NULL → generado automáticamente**)
        - **nombre**: Nombre del equipo (**Opcional, NULL → generado automáticamente**)
        - **marca**: Marca del equipo (**Opcional, NULL → aleatoria**)

    - **specs** (Opcional, MongoDB):
        - **fabricante**: Fabricante del equipo (**Opcional, NULL → aleatorio**)
        - **modelo**: Modelo del equipo (**Opcional, NULL → generado automáticamente**)
        - **garantia_meses**: Garantía en meses (**Opcional, >= 0**)
        - **peso_kg**: Peso del equipo (**Opcional, >= 0**)
        - **voltaje**: Tipo de alimentación (**Opcional, NULL → aleatorio**)
        - **specs_extra**: Atributos técnicos adicionales (**Opcional, formato JSON libre**)

    Notas:
    - Los datos faltantes o NULL son generados automáticamente por el SP o por la API.
    - El SP inserta en lotes de hasta 1000 registros por transacción.
    - MongoDB inserta un documento por cada registro confirmado en MySQL.
    """
    mongo_db: AsyncIOMotorDatabase = get_mongo(http_request)

    # 1-3: SP MySQL (inserta p_cantidad registros en lotes de 1000)
    resultado_mysql = await ejecutar_sp_adquisicion(conn, request)

    # 4: MongoDB (insert_many sincronizado con la cantidad confirmada por el SP)
    ids_mongo = await insertar_specs_mongo(mongo_db, request, resultado_mysql)

    return APIResponse(
        success=True,
        message=f"{resultado_mysql.registros_insertados} registro(s) insertado(s) correctamente",
        ids_generados=IdsGenerados(mysql=resultado_mysql, mongodb=ids_mongo),
        datos_enviados=request.model_dump(mode="json"),
    )
