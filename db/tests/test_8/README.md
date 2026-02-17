## Test 8 - Registro de 340 Pacientes varones de entre 20 y 30 años
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(340, 'H', 20, 30, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 632 |  | Vivo | 2026-02-16 18:20:41 | 2026-02-16 18:20:41 | NULL | 1 |
| 633 |  | Vivo | 2026-02-16 18:20:41 | 2026-02-16 18:20:41 | NULL | 1 |
| 634 |  | Vivo | 2026-02-16 18:20:41 | 2026-02-16 18:20:41 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 632 | Física | OIVE060216JZ9 | Canadá | 2026-02-16 18:20:41 | NULL | 1 |
| 633 | Física | AORP020216NY2 | USA | 2026-02-16 18:20:41 | NULL | 1 |
| 634 | Física | GAVC990216HM5 | México | 2026-02-16 18:20:41 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 632 | NULL | Efraín | Olivares | Villanueva | H | 2006-02-16 | OIVE060216HNELLF6 | A- | 2026-02-16 18:20:41 | NULL | 1 |
| 633 | Dra. | Patricio | Arroyo | Ramirez | H | 2002-02-16 | AORP020216HNERMT6 | B+ | 2026-02-16 18:20:41 | NULL | 1 |
| 634 | Mtra. | Claudio | Galvan | Velasco | H | 1999-02-16 | GAVC990216HNELLL4 | AB+ | 2026-02-16 18:20:41 | NULL | 1 |
