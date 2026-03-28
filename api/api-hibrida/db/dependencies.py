# db/dependencies.py
# ─────────────────────────────────────────────
#  Dependencias inyectables de FastAPI
#  - get_mysql : conexión MySQL por request
#  - get_mongo : base de datos MongoDB compartida (lifespan)
# ─────────────────────────────────────────────

from contextlib import asynccontextmanager
from typing import AsyncGenerator
import pymysql
from pymysql.cursors import DictCursor
from motor.motor_asyncio import AsyncIOMotorClient, AsyncIOMotorDatabase
from fastapi import FastAPI, HTTPException, Request
from fastapi.concurrency import run_in_threadpool
from core.config import MYSQL_CONFIG, MONGO_URI, MONGO_DB


# ── Lifespan MongoDB ──────────────────────────────────────────
# El cliente se abre una sola vez al arrancar la app y se
# comparte entre todos los requests via app.state

@asynccontextmanager
async def lifespan(app: FastAPI):
    app.state.mongo_client = AsyncIOMotorClient(MONGO_URI)
    app.state.mongo_db     = app.state.mongo_client[MONGO_DB]
    print("MongoDB conectado.")
    yield
    app.state.mongo_client.close()
    print("MongoDB desconectado.")


# ── Dependencia MySQL ─────────────────────────────────────────
# Abre la conexión en un thread (pymysql es síncrono) para no
# bloquear el event loop de uvicorn. Se cierra automáticamente
# al terminar el request.

async def get_mysql() -> AsyncGenerator[pymysql.Connection, None]:
    try:
        conn = await run_in_threadpool(
            lambda: pymysql.connect(**MYSQL_CONFIG, cursorclass=DictCursor)
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error conexión MySQL: {e}")
    try:
        yield conn
    finally:
        await run_in_threadpool(conn.close)


# ── Dependencia MongoDB ───────────────────────────────────────
# Devuelve la BD del cliente compartido (no reconecta por request)

def get_mongo(request: Request) -> AsyncIOMotorDatabase:
    return request.app.state.mongo_db
