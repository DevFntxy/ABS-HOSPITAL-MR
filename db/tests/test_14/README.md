## Test 14 - Registro de 107 Pacientes en estado médico "Cuidados Paliativos" 
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(107, 'M', 11, 88, 'Vivo', 'Cuidados Paliativos');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 4117 | Cuidados Paliativos | Vivo | 2026-02-16 19:04:25 | 2026-02-16 19:04:25 | NULL | 1 |
| 4116 | Cuidados Paliativos | Vivo | 2026-02-16 19:04:25 | 2026-02-16 19:04:25 | NULL | 1 |
| 4115 | Cuidados Paliativos | Vivo | 2026-02-16 19:04:25 | 2026-02-16 19:04:25 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 4117 | Física | FUGF790216QK1 | Canadá | 2026-02-16 19:04:25 | NULL | 1 |
| 4116 | Física | OESM860216LQ9 | Colombia | 2026-02-16 19:04:25 | NULL | 1 |
| 4115 | Física | RIHM880216GI8 | México | 2026-02-16 19:04:25 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 4117 | Enf. | Frida | Fuentes | Garcia | M | 1979-02-16 | FUGF790216MNENRR10 | AB+ | 2026-02-16 19:04:25 | NULL | 1 |
| 4116 | Psic. | Miranda | Ortega | Serrano | M | 1986-02-16 | OESM860216MNERRR2 | B- | 2026-02-16 19:04:25 | NULL | 1 |
| 4115 | Mtro. | Miranda | Rivera | Huerta | M | 1988-02-16 | RIHM880216MNEVRR10 | O+ | 2026-02-16 19:04:25 | NULL | 1 |
