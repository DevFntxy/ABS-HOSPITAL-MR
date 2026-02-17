## Test 9 - Registro de 500 Pacientes de edad maxima de 65 años
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(500, 'H', 0, 65, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 1158 |  | Vivo | 2026-02-16 18:30:24 | 2026-02-16 18:30:24 | NULL | 1 |
| 1159 |  | Vivo | 2026-02-16 18:30:24 | 2026-02-16 18:30:24 | NULL | 1 |
| 1160 |  | Vivo | 2026-02-16 18:30:24 | 2026-02-16 18:30:24 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 1158 | Física | CECJ150216YS7 | Canadá | 2026-02-16 18:30:24 | NULL | 1 |
| 1159 | Física | CAOD120216QM5 | USA | 2026-02-16 18:30:24 | NULL | 1 |
| 1160 | Física | CALC140216LQ9 | Colombia | 2026-02-16 18:30:24 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1158 | Niño | Jorge | Cervantes | Cuevas | H | 2015-02-16 | CECJ150216HNERVR10 | B+ | 2026-02-16 18:30:24 | NULL | 1 |
| 1159 | Joven | Daniel | Chacon | Ochoa | H | 2012-02-16 | CAOD120216HNEHCN3 | B- | 2026-02-16 18:30:24 | NULL | 1 |
| 1160 | Joven | Cristian | Chacon | Leon | H | 2014-02-16 | CALC140216HNEHNR5 | A- | 2026-02-16 18:30:24 | NULL | 1 |
