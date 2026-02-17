## Test 1 - Registro de 1 Paciente
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(1, 'H', 0, 90, 'Vivo', '');

#### Datos insertados:
tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 9 |  | Vivo | 2026-02-16 17:11:29 | 2026-02-16 17:11:29 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 9 | Física | RELL410216DV6 | Colombia | 2026-02-16 17:11:29 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 9 | QFB. | Leonardo | Reyes | Lozano | H | 1941-02-16 | RELL410216HNEYZN2 | O- | 2026-02-16 17:11:29 | NULL | 1 |
