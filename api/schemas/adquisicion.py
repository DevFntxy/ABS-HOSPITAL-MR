# app/schemas/adquisicion.py
# ─────────────────────────────────────────────
#  Schemas Pydantic — validación de entrada y
#  modelos de respuesta del endpoint híbrido
# ─────────────────────────────────────────────

from typing import Optional, Any, Literal
from datetime import datetime
from pydantic import BaseModel, Field, field_validator


# ══════════════════════════════════════════════
#  SCHEMAS DE ENTRADA
# ══════════════════════════════════════════════

class ProveedorSchema(BaseModel):
    """
    Datos para tbb_Proveedores.
    Todos los campos son opcionales — si se omiten o llegan null,
    el SP genera los valores automáticamente.
    """
    id_persona:   Optional[int]  = Field(None, description="FK a Personas. NULL → ID aleatorio válido")
    nombre:       Optional[str]  = Field(None, max_length=100, description="NULL → nombre de empresa generado")
    contacto:     Optional[str]  = Field(None, max_length=50,  description="NULL → contacto generado")
    especialidad: Optional[str]  = Field(None, max_length=100, description="NULL → especialidad aleatoria")

    model_config = {
        "json_schema_extra": {
            "example": {
                "id_persona":   1,
                "nombre":       "MedEquip SA de CV",
                "contacto":     "ventas@medequip.com",
                "especialidad": "Equipamiento médico de diagnóstico",
            }
        }
    }


class TransaccionSchema(BaseModel):
    """
    Datos para tbb_Transacciones_Financieras.
    Todos los campos son opcionales — el SP genera los valores faltantes.
    """
    tipo_transaccion:  Optional[Literal["Compra", "Pago", "Devolucion", "Ajuste"]] = Field(
        None, description="NULL → tipo aleatorio del ENUM"
    )
    fecha_transaccion: Optional[datetime] = Field(None, description="NULL → fecha aleatoria últimos 365 días")
    referencia:        Optional[str]      = Field(None, max_length=100, description="NULL → folio generado")

    model_config = {
        "json_schema_extra": {
            "example": {
                "tipo_transaccion":  "Compra",
                "fecha_transaccion": "2024-11-15T10:30:00",
                "referencia":        "OC-2024-00891",
            }
        }
    }


class EquipamientoSchema(BaseModel):
    """
    Datos para tbc_Equipamientos.
    Todos los campos son opcionales — el SP genera los valores faltantes.
    """
    espacio_id: Optional[int] = Field(None, description="FK a tbc_Espacios. NULL → ID aleatorio válido")
    nombre:     Optional[str] = Field(None, max_length=100, description="NULL → nombre de equipo generado")
    marca:      Optional[str] = Field(None, max_length=50,  description="NULL → marca médica aleatoria")

    model_config = {
        "json_schema_extra": {
            "example": {
                "espacio_id": 1,
                "nombre":     "Monitor de signos vitales",
                "marca":      "Philips",
            }
        }
    }


class SpecsSchema(BaseModel):
    """
    Documento para MongoDB (colección equipamientos_specs).
    Esquema flexible — agrega los campos técnicos que necesites.
    Los IDs de MySQL se añaden automáticamente como referencia cruzada.
    """
    fabricante:     Optional[str]            = Field(None)
    modelo:         Optional[str]            = Field(None)
    garantia_meses: Optional[int]            = Field(None, ge=0)
    peso_kg:        Optional[float]          = Field(None, ge=0)
    voltaje:        Optional[str]            = Field(None)
    specs_extra:    Optional[dict[str, Any]] = Field(
        None, description="Atributos técnicos libres (clave-valor)"
    )

    model_config = {
        "json_schema_extra": {
            "example": {
                "fabricante":     "Philips Medical",
                "modelo":         "IntelliVue MX40",
                "garantia_meses": 24,
                "peso_kg":        1.4,
                "voltaje":        "110V/220V",
                "specs_extra": {
                    "canales_ecg":       12,
                    "pantalla_pulgadas": 5.1,
                    "resistente_agua":   True,
                },
            }
        }
    }


class AdquisicionRequest(BaseModel):
    """
    Request completo del endpoint híbrido.
    Todos los campos de datos son opcionales — el SP genera los que falten.
    cantidad indica cuántos registros insertar (default 1).
    """
    cantidad:     int                          = Field(1, ge=1, description="Número de registros a insertar")
    proveedor:    Optional[ProveedorSchema]    = Field(None)
    transaccion:  Optional[TransaccionSchema]  = Field(None)
    equipamiento: Optional[EquipamientoSchema] = Field(None)
    specs:        Optional[SpecsSchema]        = Field(None)

    model_config = {
        "json_schema_extra": {
            "example": {
                "proveedor": {
                    "id_persona":   1,
                    "nombre":       "MedEquip SA de CV",
                    "contacto":     "ventas@medequip.com",
                    "especialidad": "Equipamiento médico de diagnóstico",
                },
                "transaccion": {
                    "tipo_transaccion":  "Compra",
                    "fecha_transaccion": "2024-11-15T10:30:00",
                    "referencia":        "OC-2024-00891",
                },
                "equipamiento": {
                    "espacio_id": 1,
                    "nombre":     "Monitor de signos vitales",
                    "marca":      "Philips",
                },
                "specs": {
                    "fabricante":     "Philips Medical",
                    "modelo":         "IntelliVue MX40",
                    "garantia_meses": 24,
                    "peso_kg":        1.4,
                    "voltaje":        "110V/220V",
                    "specs_extra": {
                        "canales_ecg":       12,
                        "pantalla_pulgadas": 5.1,
                        "resistente_agua":   True,
                    },
                },
            }
        }
    }


# ══════════════════════════════════════════════
#  SCHEMAS DE RESPUESTA
# ══════════════════════════════════════════════

class ResultadoMySQL(BaseModel):
    registros_insertados:    int
    ultimo_id_proveedor:     Optional[int] = None
    ultimo_id_transaccion:   Optional[int] = None
    ultimo_id_equipamiento:  Optional[int] = None


class IdsMongo(BaseModel):
    coleccion:         str
    documentos_ids:    list[str]


class IdsGenerados(BaseModel):
    mysql:   ResultadoMySQL
    mongodb: IdsMongo


class APIResponse(BaseModel):
    success:        bool
    message:        str
    ids_generados:  Optional[IdsGenerados] = None
    datos_enviados: Optional[dict]         = None


# ══════════════════════════════════════════════
#  SCHEMA PACIENTES (endpoint original)
# ══════════════════════════════════════════════

class PoblarPacientesRequest(BaseModel):
    cantidad:       int           = Field(..., ge=1)
    genero:         Optional[str] = Field(None, max_length=3)
    edad_minima:    Optional[int] = Field(None, ge=0)
    edad_maxima:    Optional[int] = Field(None, ge=0)
    estatus_vida:   Optional[str] = Field(None, max_length=20)
    estatus_medico: Optional[str] = Field(None, max_length=150)
    etapa_vida:     Optional[str] = Field(None, max_length=50)
