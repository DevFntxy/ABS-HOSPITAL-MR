## Test 13 - Registro de 15 Pacientes en estado Vegetativo
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(15, 'H', 29, 47, 'Vegetativo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 4010 |  | Vegetativo | 2026-02-16 18:54:26 | 2026-02-16 18:54:26 | NULL | 1 |
| 4009 |  | Vegetativo | 2026-02-16 18:54:26 | 2026-02-16 18:54:26 | NULL | 1 |
| 4008 |  | Vegetativo | 2026-02-16 18:54:26 | 2026-02-16 18:54:26 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 4010 | Física | CALH940216UR9 | Argentina | 2026-02-16 18:54:26 | NULL | 1 |
| 4009 | Física | CUSM840216VJ3 | Argentina | 2026-02-16 18:54:26 | NULL | 1 |
| 4008 | Física | POIN860216WL5 | Canadá | 2026-02-16 18:54:26 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 4010 | Abgda. | Héctor | Chacon | Lopez | H | 1994-02-16 | CALH940216HNEHPC8 | B- | 2026-02-16 18:54:26 | NULL | 1 |
| 4009 | Mx. | Martín | Cruz | Silva | H | 1984-02-16 | CUSM840216HNERLR3 | A- | 2026-02-16 18:54:26 | NULL | 1 |
| 4008 | Arq. | Noé | Portillo | Ibarra | H | 1986-02-16 | POIN860216HNERBX10 | O+ | 2026-02-16 18:54:26 | NULL | 1 |
