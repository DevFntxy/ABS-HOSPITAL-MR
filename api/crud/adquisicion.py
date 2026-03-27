import random
from datetime import datetime, timezone
import pymysql
from fastapi import HTTPException
from fastapi.concurrency import run_in_threadpool
from motor.motor_asyncio import AsyncIOMotorDatabase
from core.config import MONGO_COLL
from schemas.adquisicion import (
    AdquisicionRequest,
    ResultadoMySQL,
    IdsMongo,
)


async def ejecutar_sp_adquisicion(
    conn: pymysql.Connection,
    req:  AdquisicionRequest,
) -> ResultadoMySQL:
    """
    Llama a sp_adquisicion_equipamiento con p_cantidad y los datos del request.
    El SP inserta en lotes de 1000 y devuelve el total de registros confirmados.
    """
    p = req.proveedor
    t = req.transaccion
    e = req.equipamiento

    sp_params = [
        # Cantidad de registros a insertar
        req.cantidad,
        # tbb_Proveedores — None → el SP genera el valor
        p.id_persona   if p else None,
        p.nombre       if p else None,
        p.contacto     if p else None,
        p.especialidad if p else None,
        # tbb_Transacciones_Financieras — None → el SP genera el valor
        t.tipo_transaccion  if t else None,
        t.fecha_transaccion if t else None,
        t.referencia        if t else None,
        # tbc_Equipamientos — None → el SP genera el valor
        e.espacio_id if e else None,
        e.nombre     if e else None,
        e.marca      if e else None,
        # Placeholder OUT
        0,
        0,
        0,
        0,
    ]

    try:
        cursor = conn.cursor()

        await run_in_threadpool(
            lambda: cursor.callproc("sp_adquisicion_equipamiento", sp_params)
        )

        # Consumir result sets pendientes antes de leer el OUT
        await run_in_threadpool(lambda: [cursor.nextset() for _ in range(10)])

        # El SP hace sus propios COMMITs por lote internamente,
        # por lo que no se hace conn.commit() aquí
        await run_in_threadpool(lambda: cursor.execute(
            "SELECT @_sp_adquisicion_equipamiento_11 AS registros_insertados,"
            "       @_sp_adquisicion_equipamiento_12 AS ultimo_id_proveedor,"
            "       @_sp_adquisicion_equipamiento_13 AS ultimo_id_transaccion,"
            "       @_sp_adquisicion_equipamiento_14 AS ultimo_id_equipamiento"
        ))
        resultado = await run_in_threadpool(cursor.fetchone)

    except pymysql.Error as ex:
        raise HTTPException(
            status_code=500,
            detail=f"Error en SP (lote revertido): {ex}",
        )

    return ResultadoMySQL(
        registros_insertados=resultado["registros_insertados"] or 0,
        ultimo_id_proveedor=resultado["ultimo_id_proveedor"],
        ultimo_id_transaccion=resultado["ultimo_id_transaccion"],
        ultimo_id_equipamiento=resultado["ultimo_id_equipamiento"],
    )

async def insertar_specs_mongo(
    mongo_db: AsyncIOMotorDatabase,
    req:      AdquisicionRequest,
    resultado_mysql: ResultadoMySQL,
) -> IdsMongo:
    """
    Inserta tantos documentos de specs en MongoDB como registros
    confirmó el SP en MySQL. Usa insert_many para eficiencia.
    Si specs llegó None o con campos vacíos, genera valores aleatorios.
    """
    s = req.specs
    cantidad = resultado_mysql.registros_insertados

    fabricantes = [
        "Philips Medical", "GE Healthcare", "Siemens Healthineers",
        "Medtronic", "Stryker", "Mindray", "Nihon Kohden",
        "Drager", "Baxter", "Abbott Laboratories",
    ]
    modelos_prefijos = ["Pro", "Elite", "Ultra", "Max", "Plus", "Smart", "Flex"]
    voltajes = ["110V", "220V", "110V/220V", "12V DC", "24V DC"]

    def build_doc(i: int) -> dict:
        fab = random.choice(fabricantes)
        return {
            # Nota: sin id_equipamiento_mysql individual porque el SP
            # no devuelve IDs por registro en modo masivo.
            # Se guarda el lote y la fecha para trazabilidad.
            "id_proveedor_mysql":    resultado_mysql.ultimo_id_proveedor,
            "id_transaccion_mysql":  resultado_mysql.ultimo_id_transaccion,
            "id_equipamiento_mysql": resultado_mysql.ultimo_id_equipamiento,
            "fecha_registro":        datetime.now(timezone.utc),
            "lote_registro":         i + 1,
            "fabricante":     s.fabricante     if s and s.fabricante     is not None else fab,
            "modelo":         s.modelo         if s and s.modelo         is not None else f"{random.choice(modelos_prefijos)}-{random.randint(100, 9999)}",
            "garantia_meses": s.garantia_meses if s and s.garantia_meses is not None else random.choice([6, 12, 18, 24, 36, 48]),
            "peso_kg":        s.peso_kg        if s and s.peso_kg        is not None else round(random.uniform(0.5, 150.0), 2),
            "voltaje":        s.voltaje        if s and s.voltaje        is not None else random.choice(voltajes),
            "specs_extra":    (s.specs_extra or {}) if s else {},
        }

    # Construir todos los documentos
    documentos = [build_doc(i) for i in range(cantidad)]

    try:
        # insert_many es mucho más eficiente que N insert_one en bucle
        result = await mongo_db[MONGO_COLL].insert_many(documentos, ordered=False)
        ids_insertados = [str(oid) for oid in result.inserted_ids]
    except Exception as exc:
        raise HTTPException(
            status_code=500,
            detail={
                "error": f"Error MongoDB: {exc}",
                "nota":  "Los registros MySQL fueron confirmados por el SP. Reintenta solo el insert NoSQL.",
                "registros_mysql": cantidad,
            },
        )

    return IdsMongo(
        coleccion=MONGO_COLL,
        documentos_ids=ids_insertados,
    )
