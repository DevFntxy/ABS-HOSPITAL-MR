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
    Inserta documentos de specs en MongoDB en LOTES para evitar saturar RAM.
    Usa insert_many por lotes de 5000 documentos máximo.
    """
    s = req.specs
    cantidad = resultado_mysql.registros_insertados
    
    # Configuración de lotes para MongoDB
    BATCH_SIZE = 5000  # Insertar de 5000 en 5000
    
    # Datos precalculados (fuera del loop para mejor rendimiento)
    fabricantes = [
        "Philips Medical", "GE Healthcare", "Siemens Healthineers",
        "Medtronic", "Stryker", "Mindray", "Nihon Kohden",
        "Drager", "Baxter", "Abbott Laboratories",
    ]
    modelos_prefijos = ["Pro", "Elite", "Ultra", "Max", "Plus", "Smart", "Flex"]
    voltajes = ["110V", "220V", "110V/220V", "12V DC", "24V DC"]
    garantias = [6, 12, 18, 24, 36, 48]
    
    # Pre-generar valores si el usuario no los especificó
    # (evita verificar "if s and s.fabricante" millones de veces)
    usar_fabricante_fijo = s and s.fabricante is not None
    usar_modelo_fijo = s and s.modelo is not None
    usar_garantia_fija = s and s.garantia_meses is not None
    usar_peso_fijo = s and s.peso_kg is not None
    usar_voltaje_fijo = s and s.voltaje is not None
    usar_specs_extra_fijas = s and s.specs_extra is not None
    
    fabricante_fijo = s.fabricante if usar_fabricante_fijo else None
    modelo_fijo = s.modelo if usar_modelo_fijo else None
    garantia_fija = s.garantia_meses if usar_garantia_fija else None
    peso_fijo = s.peso_kg if usar_peso_fijo else None
    voltaje_fijo = s.voltaje if usar_voltaje_fijo else None
    specs_extra_fijas = s.specs_extra if usar_specs_extra_fijas else {}

    def build_doc(i: int) -> dict:
        """Construye un documento optimizado sin verificaciones repetitivas"""
        return {
            "id_proveedor_mysql":    resultado_mysql.ultimo_id_proveedor,
            "id_transaccion_mysql":  resultado_mysql.ultimo_id_transaccion,
            "id_equipamiento_mysql": resultado_mysql.ultimo_id_equipamiento,
            "fecha_registro":        datetime.now(timezone.utc),
            "lote_registro":         i + 1,
            "fabricante":     fabricante_fijo if usar_fabricante_fijo else random.choice(fabricantes),
            "modelo":         modelo_fijo if usar_modelo_fijo else f"{random.choice(modelos_prefijos)}-{random.randint(100, 9999)}",
            "garantia_meses": garantia_fija if usar_garantia_fija else random.choice(garantias),
            "peso_kg":        peso_fijo if usar_peso_fijo else round(random.uniform(0.5, 150.0), 2),
            "voltaje":        voltaje_fijo if usar_voltaje_fijo else random.choice(voltajes),
            "specs_extra":    specs_extra_fijas,
        }

    todos_los_ids = []
    
    try:
        # Insertar en lotes para no saturar memoria
        for offset in range(0, cantidad, BATCH_SIZE):
            # Calcular cuántos documentos faltan
            documentos_restantes = min(BATCH_SIZE, cantidad - offset)
            
            # Generar solo el lote actual (no toda la lista)
            lote = [build_doc(offset + i) for i in range(documentos_restantes)]
            
            # Insertar lote en MongoDB
            result = await mongo_db[MONGO_COLL].insert_many(lote, ordered=False)
            
            # Guardar IDs insertados
            todos_los_ids.extend([str(oid) for oid in result.inserted_ids])
            
            # Liberar memoria del lote
            del lote
            
    except Exception as exc:
        raise HTTPException(
            status_code=500,
            detail={
                "error": f"Error MongoDB: {exc}",
                "nota":  "Los registros MySQL fueron confirmados por el SP. Reintenta solo el insert NoSQL.",
                "registros_mysql": cantidad,
                "registros_mongo_insertados": len(todos_los_ids),
            },
        )

    return IdsMongo(
        coleccion=MONGO_COLL,
        documentos_ids=todos_los_ids,
    )
