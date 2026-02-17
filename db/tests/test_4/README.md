## Test 4 - Registro de 1000 Pacientes
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(1000, 'M', 0, 90, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 6325 |  | Vivo | 2026-02-16 19:19:51 | 2026-02-16 19:19:51 | NULL | 1 |
| 6324 |  | Vivo | 2026-02-16 19:19:51 | 2026-02-16 19:19:51 | NULL | 1 |
| 6323 |  | Vivo | 2026-02-16 19:19:51 | 2026-02-16 19:19:51 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 6325 | Física | SAMC580216EH8 | Canadá | 2026-02-16 19:19:51 | NULL | 1 |
| 6324 | Física | GARJ160216SG0 | Canadá | 2026-02-16 19:19:51 | NULL | 1 |
| 6323 | Física | VIHN170216RY7 | Argentina | 2026-02-16 19:19:51 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 6325 | Abg. | Camila | Sanchez | Mendoza | M | 1958-02-16 | SAMC580216MNENNM6 | A- | 2026-02-16 19:19:51 | NULL | 1 |
| 6324 | Niña | Julieta | Granados | Ruiz | M | 2016-02-16 | GARJ160216MNERZL9 | A- | 2026-02-16 19:19:51 | NULL | 1 |
| 6323 | Niña | Natalia | Villanueva | Herrera | M | 2017-02-16 | VIHN170216MNELRT5 | B- | 2026-02-16 19:19:51 | NULL | 1 |
