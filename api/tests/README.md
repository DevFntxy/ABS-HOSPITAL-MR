### Tests (Pruebas de la API)
---
Carpeta de evidencias sobre las pruebas realizadas a los endpoints de la API de Hospital MR (`hospital_api.py`).

### Navicat antes de las inserciones
<p align="center"><img src="/api/tests/images/navicat_antes.png" alt="Navicat antes de las pruebas" width="full"/></p>

### Test 1 - Insertar 100k Pacientes
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 100000
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_1_a.png" alt="Prueba API 1 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_1_b.png" alt="Prueba API 1 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 100000 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 100000,
    "genero": null,
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": null,
    "estatus_medico": null,
    "etapa_vida": null
  },
  "resultado": []
}
```

---

### Test 2 - Insertar 5k Pacientes Mujeres entre 20 - 50 años
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 5000,
  "genero": "M",
  "edad_minima": 20,
  "edad_maxima": 50
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_2_a.png" alt="Prueba API 2 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_2_b.png" alt="Prueba API 2 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 5000 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 5000,
    "genero": "M",
    "edad_minima": 20,
    "edad_maxima": 50,
    "estatus_vida": null,
    "estatus_medico": null,
    "etapa_vida": null
  },
  "resultado": []
}
```

---

### Test 3 - Insertar 300 Pacientes Varones Invalidos
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 300,
  "genero": "H",
  "etapa_vida": null,
  "estatus_vida": "Invalido"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_3_a.png" alt="Prueba API 3 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_3_b.png" alt="Prueba API 3 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 300 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 300,
    "genero": "H",
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": null,
    "estatus_medico": null,
    "etapa_vida": "Infancia"
  },
  "resultado": []
}
```

---

### Test 4 - Insertar 1500 Pacientes Neonatos
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 1500,
  "etapa_vida": "Neonato"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_4_a.png" alt="Prueba API 4 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_4_b.png" alt="Prueba API 4 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 1500 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 1500,
    "genero": null,
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": null,
    "estatus_medico": null,
    "etapa_vida": "Neonato"
  },
  "resultado": []
}
```

---

### Test 5 - Insertar 325 Pacientes Finados Recién Nacidos
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 325,
  "estatus_vida": "Finado",
  "etapa_vida": "Recién nacido"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_5_a.png" alt="Prueba API 5 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_5_b.png" alt="Prueba API 5 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 325 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 325,
    "genero": null,
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": "Finado",
    "estatus_medico": null,
    "etapa_vida": "Recién nacido"
  },
  "resultado": []
}
```

---

### Test 6 - Insertar 832 Pacientes Diabéticos entre 5 - 22 años
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 832,
  "edad_minima": 5,
  "edad_maxima": 22,
  "estatus_medico": "Diabetico"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_6_a.png" alt="Prueba API 6 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_6_b.png" alt="Prueba API 6 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 832 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 832,
    "genero": null,
    "edad_minima": 5,
    "edad_maxima": 22,
    "estatus_vida": null,
    "estatus_medico": "Diabetico",
    "etapa_vida": null
  },
  "resultado": []
}
```

---

### Test 7 - Insertar 625 Pacientes Hombres Pediátricos
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 625,
  "genero": "H",
  "estatus_medico": "Pediatrico"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_7_a.png" alt="Prueba API 7 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_7_b.png" alt="Prueba API 7 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 625 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 625,
    "genero": "H",
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": null,
    "estatus_medico": "Pediatrico",
    "etapa_vida": null
  },
  "resultado": []
}
```

---

### Test 8 - Insertar 111 Pacientes en Estado de Coma
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 111,
  "estatus_vida": "Coma"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_8_a.png" alt="Prueba API 8 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_8_b.png" alt="Prueba API 8 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 111 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 111,
    "genero": null,
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": "Coma",
    "estatus_medico": null,
    "etapa_vida": null
  },
  "resultado": []
}
```

---

### Test 9 - Insertar 23k Pacientes No Binarios
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
**Payload (JSON) enviado:**
```json
{
  "cantidad": 23000,
  "genero": "N/B"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_9_a.png" alt="Prueba API 9 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_9_b.png" alt="Prueba API 9 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 23000 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 23000,
    "genero": "N/B",
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": null,
    "estatus_medico": null,
    "etapa_vida": null
  },
  "resultado": []
}
```

---

### Test 10 - Insertar 3416 Pacientes con COVID (Vivos y Muertos)
###### Request / Endpoint utilizado:
    
    POST /api/poblar-pacientes
    
*Nota: Al no especificar el `estatus_vida`, el proceso almacenado los asignará de forma aleatoria (entre todos los estatus, incluyendo vivos y finados).*

**Payload (JSON) enviado:**
```json
{
  "cantidad": 3416,
  "estatus_medico": "COVID"
}
```

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/api/tests/images/test_10_a.png" alt="Prueba API 10 - Parte A" width="full"/></p>
<p align="center"><img src="/api/tests/images/test_10_b.png" alt="Prueba API 10 - Parte B" width="full"/></p>

###### Respuesta de la API obtenida:
```json
{
  "success": true,
  "message": "Procedimiento ejecutado exitosamente. 3416 paciente(s) procesado(s)",
  "parametros": {
    "cantidad": 3416,
    "genero": null,
    "edad_minima": null,
    "edad_maxima": null,
    "estatus_vida": null,
    "estatus_medico": "COVID",
    "etapa_vida": null
  },
  "resultado": []
}
```
### Navicat despues de las inserciones
<p align="center"><img src="/api/tests/images/navicat_despues.png" alt="Navicat despues de las pruebas" width="full"/></p>