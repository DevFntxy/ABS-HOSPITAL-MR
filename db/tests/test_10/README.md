## Test 10 - Registro de 2200 Pacientes Vivos
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(2200, 'H', 5, 14, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3462 |  | Vivo | 2026-02-16 18:34:36 | 2026-02-16 18:34:36 | NULL | 1 |
| 3461 |  | Vivo | 2026-02-16 18:34:36 | 2026-02-16 18:34:36 | NULL | 1 |
| 3460 |  | Vivo | 2026-02-16 18:34:36 | 2026-02-16 18:34:36 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3462 | Física | AALE150216KN3 | México | 2026-02-16 18:34:36 | NULL | 1 |
| 3461 | Física | JIGJ190216PV2 | Argentina | 2026-02-16 18:34:36 | NULL | 1 |
| 3460 | Física | GALA180216EC8 | USA | 2026-02-16 18:34:36 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 3462 | Niño | Ernesto | Amador | Lopez | H | 2015-02-16 | AALE150216HNEMPR5 | O- | 2026-02-16 18:34:36 | NULL | 1 |
| 3461 | Niño | Jesús | Jimenez | Garcia | H | 2019-02-16 | JIGJ190216HNEMRS8 | A+ | 2026-02-16 18:34:36 | NULL | 1 |
| 3460 | Niño | Andrés | Gallegos | Lozano | H | 2018-02-16 | GALA180216HNELZN10 | B- | 2026-02-16 18:34:36 | NULL | 1 |
