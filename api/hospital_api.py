"""
API Hospital - FastAPI con Swagger
Ejecuta el procedimiento almacenado sp_poblar_pacientes
"""

from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import Optional
import pymysql
from pymysql.cursors import DictCursor
import uvicorn

app = FastAPI(
    title="API Hospital 230260",
    description="API hospital_230260",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "1234",
    "database": "hospital_230260",
    "port": 3306
}


class PoblarPacientesRequest(BaseModel):
    cantidad: int = Field(..., ge=1, description="Cantidad")
    genero: Optional[str] = Field(None, max_length=3, description="Género")
    edad_minima: Optional[int] = Field(None, ge=0, description="Edad mínima")
    edad_maxima: Optional[int] = Field(None, ge=0, description="Edad máxima")
    estatus_vida: Optional[str] = Field(None, max_length=20, description="Estatus vida")
    estatus_medico: Optional[str] = Field(None, max_length=150, description="Estatus médico")
    etapa_vida: Optional[str] = Field(None, max_length=50, description="Etapa vida")

    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 1,
                "genero": "M",
                "edad_minima": 12,
                "edad_maxima": 36,
                "estatus_vida": "",
                "estatus_medico": "",
                "etapa_vida": ""
            }
        }


def get_db_connection():
    try:
        connection = pymysql.connect(
            **DB_CONFIG,
            cursorclass=DictCursor
        )
        return connection
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error de conexión a BD: {str(e)}")


# Endpoint principal
@app.post("/api/poblar-pacientes", 
          tags=["Poblar pacientes"],
          summary="Poblar pacientes",
          response_description="Resultado de la ejecución del procedimiento")
async def poblar_pacientes(request: PoblarPacientesRequest):
    """
    sp_poblar_pacientes
    - **cantidad**: Número de pacientes a crear (**Obligatorio, Minimo 1**)
    - **genero**: Género del paciente (Opcional, **Valido: 'M', 'F', 'N/B'**)
    - **edad_minima**: Edad mínima (Opcional)
    - **edad_maxima**: Edad máxima (Opcional)
    - **estatus_vida**: Estatus de vida (Opcional, **Valido: 'Vivo', 'Finado', 'Coma', 'Vegetativo', 'Desconocido'**)
    - **estatus_medico**: Estatus médico (Opcional, **Valido: 'Cuidados Paliativos', 'Diabetico', 'Cancer', 'Trauma' 'Craneoencefalico', 'Cardiacos', 'Pediatrico', 'COVID'**)
    - **etapa_vida**: Etapa de vida (Opcional, **Valido: 'Recién nacido', 'Neonato', 'Infancia', 'Adolescencia', 'Juventud', 'Adultez', 'Vejez'**)
    """
    
    connection = None
    try:
        # Conectar a la base de datos
        connection = get_db_connection()
        cursor = connection.cursor()
        
        # Ejecutar procedimiento almacenado
        cursor.callproc('sp_poblar_pacientes', [
            request.cantidad,
            request.genero,
            request.edad_minima,
            request.edad_maxima,
            request.estatus_vida,
            request.estatus_medico,
            request.etapa_vida
        ])
        
        # Commit de la transacción
        connection.commit()
        
        # Obtener resultado si el SP retorna algo
        result = cursor.fetchall() if cursor.description else []
        
        return {
            "success": True,
            "message": f"Procedimiento ejecutado exitosamente. {request.cantidad} paciente(s) procesado(s)",
            "parametros": {
                "cantidad": request.cantidad,
                "genero": request.genero,
                "edad_minima": request.edad_minima,
                "edad_maxima": request.edad_maxima,
                "estatus_vida": request.estatus_vida,
                "estatus_medico": request.estatus_medico,
                "etapa_vida": request.etapa_vida
            },
            "resultado": result
        }
        
    except pymysql.Error as e:
        if connection:
            connection.rollback()
        raise HTTPException(
            status_code=500, 
            detail=f"Error al ejecutar procedimiento: {str(e)}"
        )
    
    finally:
        if connection:
            cursor.close()
            connection.close()

# Ejecutar la aplicación
if __name__ == "__main__":
    uvicorn.run(
        "hospital_api:app",
        host="0.0.0.0",
        port=8000,
        reload=True
    )
