# main.py
# ─────────────────────────────────────────────
#  Entry point — instancia la app y registra routers
# ─────────────────────────────────────────────

import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from db.dependencies import lifespan
from routes import recursos_materiales, pacientes

app = FastAPI(
    title="API Hospital 230260 — Híbrida",
    description="API híbrida MySQL + MongoDB para hospital_230260",
    version="3.0.0",
    lifespan=lifespan,
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ── Routers ───────────────────────────────────
app.include_router(pacientes.router,          prefix="/routes")
app.include_router(recursos_materiales.router, prefix="/routes")


if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
    )
