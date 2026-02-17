## Test 5 - Registro de 10000 Pacientes
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(10000, 'M', 0, 90, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 16325 |  | Vivo | 2026-02-16 19:21:51 | 2026-02-16 19:21:51 | NULL | 1 |
| 16324 |  | Vivo | 2026-02-16 19:21:51 | 2026-02-16 19:21:51 | NULL | 1 |
| 16323 |  | Vivo | 2026-02-16 19:21:51 | 2026-02-16 19:21:51 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 16325 | Física | VECA800216JV0 | Argentina | 2026-02-16 19:21:51 | NULL | 1 |
| 16324 | Física | EUCS770216OO2 | USA | 2026-02-16 19:21:51 | NULL | 1 |
| 16323 | Física | OECG550216NX9 | México | 2026-02-16 19:21:51 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 16325 | Ing. | Alejandra | Velasco | Chacon | M | 1980-02-16 | VECA800216MNELHL4 | AB- | 2026-02-16 19:21:51 | NULL | 1 |
| 16324 | Sr. | Sofía | Esquivel | Camacho | M | 1977-02-16 | EUCS770216MNESMF8 | A+ | 2026-02-16 19:21:51 | NULL | 1 |
| 16323 | C.P. | Guadalupe | Ortega | Cervantes | M | 1955-02-16 | OECG550216MNERRD6 | O- | 2026-02-16 19:21:51 | NULL | 1 |
