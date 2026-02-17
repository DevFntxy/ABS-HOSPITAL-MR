## Test 2 - Registro de 10 Pacientes
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(10, 'M', 10, 20, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 17 |  | Vivo | 2026-02-16 17:32:26 | 2026-02-16 17:32:26 | NULL | 1 |
| 18 |  | Vivo | 2026-02-16 17:32:26 | 2026-02-16 17:32:26 | NULL | 1 |
| 19 |  | Vivo | 2026-02-16 17:32:26 | 2026-02-16 17:32:26 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 17 | Física | PAVG150216FR7 | Argentina | 2026-02-16 17:32:26 | NULL | 1 |
| 18 | Física | PECC100216KI3 | Argentina | 2026-02-16 17:32:26 | NULL | 1 |
| 19 | Física | BAME160216JQ0 | Canadá | 2026-02-16 17:32:26 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 17 | Niña | Giselle | Palacios | Vega | M | 2015-02-16 | PAVG150216MNELGS8 | O+ | 2026-02-16 17:32:26 | NULL | 1 |
| 18 | Señorita | Carmen | Perez | Chavez | M | 2010-02-16 | PECC100216MNERHR5 | B- | 2026-02-16 17:32:26 | NULL | 1 |
| 19 | Niña | Estefanía | Barrios | Macias | M | 2016-02-16 | BAME160216MNERCS7 | AB- | 2026-02-16 17:32:26 | NULL | 1 |
