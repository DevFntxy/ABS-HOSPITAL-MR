## Test 3 - Registro de 100 Pacientes
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(100, 'H', 25, 70, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 142 |  | Vivo | 2026-02-16 18:10:18 | 2026-02-16 18:10:18 | NULL | 1 |
| 143 |  | Vivo | 2026-02-16 18:10:18 | 2026-02-16 18:10:18 | NULL | 1 |
| 144 |  | Vivo | 2026-02-16 18:10:18 | 2026-02-16 18:10:18 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 142 | Física | NULL | Argentina | 2026-02-16 18:10:18 | NULL | 1 |
| 143 | Física | LEJF590216TG9 | USA | 2026-02-16 18:10:18 | NULL | 1 |
| 144 | Física | FOMR720216WH8 | USA | 2026-02-16 18:10:18 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 142 | Ing. | Adolfo | Cortes | NULL | H | 1964-02-16 | NULL | AB- | 2026-02-16 18:10:18 | NULL | 1 |
| 143 | Licda. | Francisco | Ledezma | Jimenez | H | 1959-02-16 | LEJF590216HNEDMR9 | A- | 2026-02-16 18:10:18 | NULL | 1 |
| 144 | Arq. | Roberto | Flores | Morales | H | 1972-02-16 | FOMR720216HNELRB1 | AB+ | 2026-02-16 18:10:18 | NULL | 1 |