## Test 15 - Registro de 208 Pacientes Pediátricos 
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(208, 'M', 0, 15, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 4325 |  | Vivo | 2026-02-16 19:09:15 | 2026-02-16 19:09:15 | NULL | 1 |
| 4324 |  | Vivo | 2026-02-16 19:09:15 | 2026-02-16 19:09:15 | NULL | 1 |
| 4323 |  | Vivo | 2026-02-16 19:09:15 | 2026-02-16 19:09:15 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 4325 | Física | CARF210216SF9 | México | 2026-02-16 19:09:15 | NULL | 1 |
| 4324 | Física | REME110216VA6 | México | 2026-02-16 19:09:15 | NULL | 1 |
| 4323 | Física | DOCL110216ZN5 | Canadá | 2026-02-16 19:09:15 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 4325 | Niña | Frida | Cantu | Rivera | M | 2021-02-16 | CARF210216MNENVR5 | O+ | 2026-02-16 19:09:15 | NULL | 1 |
| 4324 | Joven | Estefanía | Resendiz | Marquez | M | 2011-02-16 | REME110216MNESRS1 | AB+ | 2026-02-16 19:09:15 | NULL | 1 |
| 4323 | Joven | Lucía | Dominguez | Carrillo | M | 2011-02-16 | DOCL110216MNEMRC8 | B+ | 2026-02-16 19:09:15 | NULL | 1 |
