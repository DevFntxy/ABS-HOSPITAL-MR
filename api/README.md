# API - Hospital MR

## 📋 Descripción
API con FastAPI que ejecuta el procedimiento almacenado `sp_poblar_pacientes` en la base de datos MySQL `hospital_230260`.

<p align="center"><img src="/image/api-swagger.png" alt="API Swagger" width="full"/></p>

Ejemplo de response:
<p align="center"><img src="/image/ejemplo-endpoint.png" alt="Prueba 1" width="full"/></p>

### 1. Instalar las dependencias
```bash
pip install -r requirements.txt
```

### 2. Configurar la base de datos
Edita el archivo `hospital_api.py` en la sección `DB_CONFIG`:

```python
DB_CONFIG = {
    "host": "localhost",
    "user": "tu_usuario",      # Cambiar aquí
    "password": "tu_password",  # Cambiar aquí
    "database": "hospital_230260",
    "port": 3306
}
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

**Ejemplo de Request (JSON):**
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

**Ejemplo de Response:**
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
