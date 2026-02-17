## Test 12 - Registro de 30 Pacientes en estado de Coma
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(30, 'H', 25, 52, 'Coma', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3995 |  | Coma | 2026-02-16 18:51:27 | 2026-02-16 18:51:27 | NULL | 1 |
| 3994 |  | Coma | 2026-02-16 18:51:27 | 2026-02-16 18:51:27 | NULL | 1 |
| 3993 |  | Coma | 2026-02-16 18:51:27 | 2026-02-16 18:51:27 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3995 | Física | EOSD890216OK4 | Argentina | 2026-02-16 18:51:27 | NULL | 1 |
| 3994 | Física | AAQB960216WH8 | USA | 2026-02-16 18:51:27 | NULL | 1 |
| 3993 | Física | NADC800216JM1 | Canadá | 2026-02-16 18:51:27 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 3995 | Psic. | David | Escobar | Salinas | H | 1989-02-16 | EOSD890216HNESLV2 | A+ | 2026-02-16 18:51:27 | NULL | 1 |
| 3994 | Enf. | Benjamín | Alvarez | Quintero | H | 1996-02-16 | AAQB960216HNELNN4 | AB- | 2026-02-16 18:51:27 | NULL | 1 |
| 3993 | Ing. | Cristóbal | Navarro | DeLeon | H | 1980-02-16 | NADC800216HNEVLR9 | O+ | 2026-02-16 18:51:27 | NULL | 1 |
