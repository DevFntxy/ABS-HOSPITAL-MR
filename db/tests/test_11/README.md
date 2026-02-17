## Test 11 - Registro de 502 Pacientes Mujeres Finados mayores de 45 años
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(502, 'M', 0, 45, 'Finado', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3965 |  | Finado | 2026-02-16 18:46:40 | 2026-02-16 18:46:40 | NULL | 1 |
| 3964 |  | Finado | 2026-02-16 18:46:40 | 2026-02-16 18:46:40 | NULL | 1 |
| 3963 |  | Finado | 2026-02-16 18:46:40 | 2026-02-16 18:46:40 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3965 | Física | VELL040216ZB3 | Canadá | 2026-02-16 18:46:40 | NULL | 1 |
| 3964 | Física | CUOV020216EG7 | México | 2026-02-16 18:46:40 | NULL | 1 |
| 3963 | Física | EAVY880216DC0 | México | 2026-02-16 18:46:40 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 3965 | Sr. | Leslie | Velasco | Lopez | M | 2004-02-16 | VELL040216MNELPS6 | AB- | 2026-02-16 18:46:40 | NULL | 1 |
| 3964 | QFB. | Verónica | Cuevas | Ochoa | M | 2002-02-16 | CUOV020216MNEVCR6 | A- | 2026-02-16 18:46:40 | NULL | 1 |
| 3963 | Sr. | Yuliana | Escamilla | Villaseñor | M | 1988-02-16 | EAVY880216MNESLL3 | A- | 2026-02-16 18:46:40 | NULL | 1 |
