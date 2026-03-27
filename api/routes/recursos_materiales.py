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
    Registra una adquisición de equipamiento en **3 tablas MySQL** y
    **1 colección MongoDB**.

    | Paso | Destino                         | Motor   |
    |------|---------------------------------|---------|
    | 1    | tbb_Proveedores                 | MySQL   |
    | 2    | tbb_Transacciones_Financieras   | MySQL   |
    | 3    | tbc_Equipamientos               | MySQL   |
    | 4    | equipamientos_specs (colección) | MongoDB |

    Los pasos 1-3 los ejecuta el SP `sp_adquisicion_equipamiento`
    en una sola transacción. El paso 4 lo hace Python con los IDs devueltos.
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
