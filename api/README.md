# API - Hospital MR

## 📋 Descripción
API con FastAPI que ejecuta el procedimiento almacenado `sp_poblar_pacientes` en la base de datos MySQL `hospital_230260`.

<p align="center"><img src="/images/api-swagger.png" alt="API Swagger" width="full"/></p>

Ejemplo de response:
<p align="center"><img src="/images/ejemplo-endpoint.png" alt="Prueba 1" width="full"/></p>

### 1. Instalar las dependencias
```bash
pip install -r requirements.txt
```

### 2. Configurar la base de datos
Edita el archivo `core/config.py` en la sección `DB_CONFIG`:

```python
DB_CONFIG = {
    "host": "localhost",
    "user": "tu_usuario",      # Cambiar aquí
    "password": "tu_password",  # Cambiar aquí
    "database": "hospital_230260",
    "port": 3306
}
MONGO_URI  = "mongodb://localhost:27017"
MONGO_DB   = "hospital_nosql"
MONGO_COLL = "equipamientos_especificaciones"
```

### 3. Ejecutar la API
```bash
python hospital_api.py
```

### 4. Acceder a la documentación Swagger
Abre tu navegador en: **http://localhost:8000/docs**

## 📡 Endpoints Disponibles

### POST `/api/poblar-pacientes`
Ejecuta el procedimiento almacenado `sp_poblar_pacientes`.

**Parámetros:**
- `cantidad` (INT, obligatorio): Mínimo 1
- `genero` (VARCHAR(3), opcional: 'M', 'F', 'N/B')
- `edad_minima` (INT, opcional)
- `edad_maxima` (INT, opcional)
- `estatus_vida` (VARCHAR(20), opcional: 'Vivo', 'Finado', 'Coma', 'Vegetativo', 'Desconocido')
- `estatus_medico` (VARCHAR(150), opcional: 'Cuidados Paliativos', 'Diabetico', 'Cancer', 'Trauma' 'Craneoencefalico', 'Cardiacos', 'Pediatrico', 'COVID')
- `etapa_vida` (VARCHAR(50), opcional: 'Recién nacido', 'Neonato', 'Infancia', 'Adolescencia', 'Juventud', 'Adultez', 'Vejez')

**Request /poblar-pacientes (JSON)**
```json
{
  "cantidad": 10,
  "genero": "M",
  "edad_minima": 18,
  "edad_maxima": 65,
  "estatus_vida": "Vivo",
  "estatus_medico": "Estable",
  "etapa_vida": "Adulto"
}
```

**Response /poblar-pacientes**
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 10 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 10,
    "genero": "M",
    "edad_minima": 18,
    "edad_maxima": 65,
    "estatus_vida": "Vivo",
    "estatus_medico": "Estable",
    "etapa_vida": "Adulto"
  },
  "resultado": []
}
```

### POST `/adquisicion-equipamiento`
Ejecuta el procedimiento almacenado `sp_adquisicion_equipamiento`.

**Parámetros:**
- `cantidad`: Número de registros a insertar (**Opcional, por defecto 1**)

- **proveedor** (Opcional):
    - `id_persona`: ID de la persona (FK) (**Opcional, NULL → generado automáticamente**)
    - `nombre`: Nombre del proveedor (**Opcional, NULL → generado automáticamente**)
    - `contacto`: Correo o medio de contacto (**Opcional, NULL → generado automáticamente**)
    - `especialidad`: Tipo de equipamiento que maneja (**Opcional, NULL → aleatorio**)

- **transaccion** (Opcional):
    - `tipo_transaccion`: Tipo de transacción (**Opcional, válido: 'Compra', 'Pago', 'Devolucion', 'Ajuste'**)
    - `fecha_transaccion`: Fecha de la transacción (**Opcional, NULL → fecha aleatoria últimos 365 días**)
    - `referencia`: Folio o identificador (**Opcional, NULL → generado automáticamente**)

- **equipamiento** (Opcional):
    - `espacio_id`: ID del espacio (FK) (**Opcional, NULL → generado automáticamente**)
    - `nombre`: Nombre del equipo (**Opcional, NULL → generado automáticamente**)
    - `marca`: Marca del equipo (**Opcional, NULL → aleatoria**)

- **specs** (Opcional, MongoDB):
    - `fabricante`: Fabricante del equipo (**Opcional, NULL → aleatorio**)
    - `modelo`: Modelo del equipo (**Opcional, NULL → generado automáticamente**)
    - `garantia_meses`: Garantía en meses (**Opcional, >= 0**)
    - `peso_kg`: Peso del equipo (**Opcional, >= 0**)
    - `voltaje`: Tipo de alimentación (**Opcional, NULL → aleatorio**)
    - `specs_extra`: Atributos técnicos adicionales (**Opcional, formato JSON libre**)

Notas:
- Los datos faltantes o NULL son generados automáticamente por el SP o por la API.
- El SP inserta en lotes de hasta 1000 registros por transacción.
- MongoDB inserta un documento por cada registro confirmado en MySQL.
    

**Request /poblar-pacientes (JSON)**
```json
{
  "equipamiento": {
    "espacio_id": 1,
    "marca": "Philips",
    "nombre": "Monitor de signos vitales"
  },
  "proveedor": {
    "contacto": "ventas@medequip.com",
    "especialidad": "Equipamiento médico de diagnóstico",
    "id_persona": 1,
    "nombre": "MedEquip SA de CV"
  },
  "specs": {
    "fabricante": "Philips Medical",
    "garantia_meses": 24,
    "modelo": "IntelliVue MX40",
    "peso_kg": 1.4,
    "specs_extra": {
      "canales_ecg": 12,
      "pantalla_pulgadas": 5.1,
      "resistente_agua": true
    },
    "voltaje": "110V/220V"
  },
  "transaccion": {
    "fecha_transaccion": "2024-11-15T10:30:00",
    "referencia": "OC-2024-00891",
    "tipo_transaccion": "Compra"
  }
}
```

**Response /poblar-pacientes**
```json
{
  "success": true,
  "message": "1 registro(s) insertado(s) correctamente",
  "ids_generados": {
    "mysql": {
      "registros_insertados": 1,
      "ultimo_id_proveedor": 12,
      "ultimo_id_transaccion": 17,
      "ultimo_id_equipamiento": 12
    },
    "mongodb": {
      "coleccion": "equipamientos_specs",
      "documentos_ids": [
        "69c5f3486a7a397c5aa3a182"
      ]
    }
  },
  "datos_enviados": {
    "cantidad": 1,
    "proveedor": {
      "id_persona": 1,
      "nombre": "MedEquip SA de CV",
      "contacto": "ventas@medequip.com",
      "especialidad": "Equipamiento médico de diagnóstico"
    },
    "transaccion": {
      "tipo_transaccion": "Compra",
      "fecha_transaccion": "2024-11-15T10:30:00",
      "referencia": "OC-2024-00891"
    },
    "equipamiento": {
      "espacio_id": 1,
      "nombre": "Monitor de signos vitales",
      "marca": "Philips"
    },
    "specs": {
      "fabricante": "Philips Medical",
      "modelo": "IntelliVue MX40",
      "garantia_meses": 24,
      "peso_kg": 1.4,
      "voltaje": "110V/220V",
      "specs_extra": {
        "canales_ecg": 12,
        "pantalla_pulgadas": 5.1,
        "resistente_agua": true
      }
    }
  }
}
```
