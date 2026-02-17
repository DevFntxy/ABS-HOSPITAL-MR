## Test 5 - Registro de 1000000 Pacientes
---
#### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(1000000, 'H', 0, 90, 'Vivo', '');

#### Datos insertados:
*(se muestran los ultimos 3 registros)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|

