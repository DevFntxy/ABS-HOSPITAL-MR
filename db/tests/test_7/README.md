## Test 7 - Registro de 150 Pacientes Mujeres
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(150, 'M', 12, 24, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 292 |  | Vivo | 2026-02-16 18:16:18 | 2026-02-16 18:16:18 | NULL | 1 |
| 293 |  | Vivo | 2026-02-16 18:16:18 | 2026-02-16 18:16:18 | NULL | 1 |
| 294 |  | Vivo | 2026-02-16 18:16:18 | 2026-02-16 18:16:18 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 292 | Física | CUYE110216TY3 | México | 2026-02-16 18:16:18 | NULL | 1 |
| 293 | Física | GACB040216AU8 | México | 2026-02-16 18:16:18 | NULL | 1 |
| 294 | Física | VALZ080216KQ8 | Canadá | 2026-02-16 18:16:18 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 292 | NULL | Elena | Cuevas | Yanez | M | 2011-02-16 | CUYE110216MNEVNL10 | O+ | 2026-02-16 18:16:18 | NULL | 1 |
| 293 | Mx. | Bárbara | Gallegos | Coronado | M | 2004-02-16 | GACB040216MNELRR5 | NULL | 2026-02-16 18:16:18 | NULL | 1 |
| 294 | NULL | Zoe | Vargas | Ledezma | M | 2008-02-16 | VALZ080216MNERDX9 | A- | 2026-02-16 18:16:18 | NULL | 1 |
