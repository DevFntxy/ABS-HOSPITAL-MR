### Tests (Pruebas)
---
Carpeta de pruebas realizadas a los procedimientos almacenados y sus funciones relacionadas en la base de datos

### Test 1 - Registro de 1 Paciente
###### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(1, 'H', 0, 90, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_1.png" alt="Prueba 1" width="full"/></p>

###### Datos insertados:
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

---
### Test 2 - Registro de 10 Pacientes

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(10, 'M', 10, 20, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_2.png" alt="Prueba 2" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 17 |  | Vivo | 2026-02-16 17:32:26 | 2026-02-16 17:32:26 | NULL | 1 |
| 18 |  | Vivo | 2026-02-16 17:32:26 | 2026-02-16 17:32:26 | NULL | 1 |
| 19 |  | Vivo | 2026-02-16 17:32:26 | 2026-02-16 17:32:26 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 17 | Física | PAVG150216FR7 | Argentina | 2026-02-16 17:32:26 | NULL | 1 |
| 18 | Física | PECC100216KI3 | Argentina | 2026-02-16 17:32:26 | NULL | 1 |
| 19 | Física | BAME160216JQ0 | Canadá | 2026-02-16 17:32:26 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 17 | Niña | Giselle | Palacios | Vega | M | 2015-02-16 | PAVG150216MNELGS8 | O+ | 2026-02-16 17:32:26 | NULL | 1 |
| 18 | Señorita | Carmen | Perez | Chavez | M | 2010-02-16 | PECC100216MNERHR5 | B- | 2026-02-16 17:32:26 | NULL | 1 |
| 19 | Niña | Estefanía | Barrios | Macias | M | 2016-02-16 | BAME160216MNERCS7 | AB- | 2026-02-16 17:32:26 | NULL | 1 |

---

### Test 3 - Registro de 100 Pacientes

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(100, 'H', 25, 70, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_3.png" alt="Prueba 3" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 4 - Registro de 1000 Pacientes

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(1000, 'M', 0, 90, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_4.png" alt="Prueba 4" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 5 - Registro de 10000 Pacientes

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(10000, 'M', 0, 90, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_5.png" alt="Prueba 5" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 16325 |  | Vivo | 2026-02-16 19:21:51 | 2026-02-16 19:21:51 | NULL | 1 |
| 16324 |  | Vivo | 2026-02-16 19:21:51 | 2026-02-16 19:21:51 | NULL | 1 |
| 16323 |  | Vivo | 2026-02-16 19:21:51 | 2026-02-16 19:21:51 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 16325 | Física | VECA800216JV0 | Argentina | 2026-02-16 19:21:51 | NULL | 1 |
| 16324 | Física | EUCS770216OO2 | USA | 2026-02-16 19:21:51 | NULL | 1 |
| 16323 | Física | OECG550216NX9 | México | 2026-02-16 19:21:51 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 16325 | Ing. | Alejandra | Velasco | Chacon | M | 1980-02-16 | VECA800216MNELHL4 | AB- | 2026-02-16 19:21:51 | NULL | 1 |
| 16324 | Sr. | Sofía | Esquivel | Camacho | M | 1977-02-16 | EUCS770216MNESMF8 | A+ | 2026-02-16 19:21:51 | NULL | 1 |
| 16323 | C.P. | Guadalupe | Ortega | Cervantes | M | 1955-02-16 | OECG550216MNERRD6 | O- | 2026-02-16 19:21:51 | NULL | 1 |

---

### Test 6 - Registro de 1000000 Pacientes

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(1000000, 'H', 0, 90, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_6.png" alt="Prueba 6" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 7 - Registro de 150 Pacientes Mujeres

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(150, 'M', 12, 24, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_7.png" alt="Prueba 7" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 292 |  | Vivo | 2026-02-16 18:16:18 | 2026-02-16 18:16:18 | NULL | 1 |
| 293 |  | Vivo | 2026-02-16 18:16:18 | 2026-02-16 18:16:18 | NULL | 1 |
| 294 |  | Vivo | 2026-02-16 18:16:18 | 2026-02-16 18:16:18 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 292 | Física | CUYE110216TY3 | México | 2026-02-16 18:16:18 | NULL | 1 |
| 293 | Física | GACB040216AU8 | México | 2026-02-16 18:16:18 | NULL | 1 |
| 294 | Física | VALZ080216KQ8 | Canadá | 2026-02-16 18:16:18 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 292 | NULL | Elena | Cuevas | Yanez | M | 2011-02-16 | CUYE110216MNEVNL10 | O+ | 2026-02-16 18:16:18 | NULL | 1 |
| 293 | Mx. | Bárbara | Gallegos | Coronado | M | 2004-02-16 | GACB040216MNELRR5 | NULL | 2026-02-16 18:16:18 | NULL | 1 |
| 294 | NULL | Zoe | Vargas | Ledezma | M | 2008-02-16 | VALZ080216MNERDX9 | A- | 2026-02-16 18:16:18 | NULL | 1 |

---

### Test 8 - Registro de 340 Pacientes varones de entre 20 y 30 años

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(340, 'H', 20, 30, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_8.png" alt="Prueba 8" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 9 - Registro de 500 Pacientes de edad maxima de 65 años

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(500, 'H', 0, 65, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_9.png" alt="Prueba 9" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 10 - Registro de 2200 Pacientes Vivos

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(2200, 'H', 5, 14, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_10.png" alt="Prueba 10" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 11 - Registro de 502 Pacientes Mujeres Finados mayores de 45 años

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(502, 'M', 0, 45, 'Finado', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_11.png" alt="Prueba 11" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3965 |  | Finado | 2026-02-16 18:46:40 | 2026-02-16 18:46:40 | NULL | 1 |
| 3964 |  | Finado | 2026-02-16 18:46:40 | 2026-02-16 18:46:40 | NULL | 1 |
| 3963 |  | Finado | 2026-02-16 18:46:40 | 2026-02-16 18:46:40 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3965 | Física | VELL040216ZB3 | Canadá | 2026-02-16 18:46:40 | NULL | 1 |
| 3964 | Física | CUOV020216EG7 | México | 2026-02-16 18:46:40 | NULL | 1 |
| 3963 | Física | EAVY880216DC0 | México | 2026-02-16 18:46:40 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 3965 | Sr. | Leslie | Velasco | Lopez | M | 2004-02-16 | VELL040216MNELPS6 | AB- | 2026-02-16 18:46:40 | NULL | 1 |
| 3964 | QFB. | Verónica | Cuevas | Ochoa | M | 2002-02-16 | CUOV020216MNEVCR6 | A- | 2026-02-16 18:46:40 | NULL | 1 |
| 3963 | Sr. | Yuliana | Escamilla | Villaseñor | M | 1988-02-16 | EAVY880216MNESLL3 | A- | 2026-02-16 18:46:40 | NULL | 1 |

---

### Test 12 - Registro de 30 Pacientes en estado de Coma

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(30, 'H', 25, 52, 'Coma', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_12.png" alt="Prueba 12" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

tbb_pacientes:
| ID | estatus_medico | estatus_vidas | fecha_ultima_cita_medica | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3995 |  | Coma | 2026-02-16 18:51:27 | 2026-02-16 18:51:27 | NULL | 1 |
| 3994 |  | Coma | 2026-02-16 18:51:27 | 2026-02-16 18:51:27 | NULL | 1 |
| 3993 |  | Coma | 2026-02-16 18:51:27 | 2026-02-16 18:51:27 | NULL | 1 |

tbb_personas:
| ID | tipo | rfc | pais_origen | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|
| 3995 | Física | EOSD890216OK4 | Argentina | 2026-02-16 18:51:27 | NULL | 1 |
| 3994 | Física | AAQB960216WH8 | USA | 2026-02-16 18:51:27 | NULL | 1 |
| 3993 | Física | NADC800216JM1 | Canadá | 2026-02-16 18:51:27 | NULL | 1 |

tbb_personas_fisicas:
| ID | titulo_cortesia | nombre | primer_apellido | segundo_apellido | genero | fecha_nacimiento | curp | grupo_sanguineo | fecha_registro | fecha_actualizacion | estatus |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 3995 | Psic. | David | Escobar | Salinas | H | 1989-02-16 | EOSD890216HNESLV2 | A+ | 2026-02-16 18:51:27 | NULL | 1 |
| 3994 | Enf. | Benjamín | Alvarez | Quintero | H | 1996-02-16 | AAQB960216HNELNN4 | AB- | 2026-02-16 18:51:27 | NULL | 1 |
| 3993 | Ing. | Cristóbal | Navarro | DeLeon | H | 1980-02-16 | NADC800216HNEVLR9 | O+ | 2026-02-16 18:51:27 | NULL | 1 |

---

### Test 13 - Registro de 15 Pacientes en estado Vegetativo

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(15, 'H', 29, 47, 'Vegetativo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_13.png" alt="Prueba 13" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 14 - Registro de 107 Pacientes en estado médico "Cuidados Paliativos" 

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(107, 'M', 11, 88, 'Vivo', 'Cuidados Paliativos');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_14.png" alt="Prueba 14" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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

---

### Test 15 - Registro de 208 Pacientes Pediátricos 

##### Comando utilizado:
    
    call hospital_230260.sp_poblar_pacientes(208, 'M', 0, 15, 'Vivo', '');

###### Evidencia de ejecución exitosa:

<p align="center"><img src="/db/tests/images/test_15.png" alt="Prueba 15" width="full"/></p>

##### Datos insertados:
*(se muestran los ultimos 3 registros insertados)*

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
