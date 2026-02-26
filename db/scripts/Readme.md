📦 Plataforma Administrativa Hospitalaria  
🏥 Módulo: Material Resources (MR)

📌 Descripción General 
El módulo **Material Resources (MR)** forma parte de la Plataforma Administrativa Hospitalaria y está orientado a la **gestión integral de los recursos materiales, activos físicos e infraestructura del hospital**.

Este módulo establece los cimientos para el control de inventarios, equipamiento médico, espacios físicos y relaciones con proveedores, aplicando criterios de **trazabilidad, normalización y control administrativo**, fundamentales para la operación hospitalaria.

---

👥 Equipo y Responsabilidades  
El **Equipo MR** es responsable del diseño, estructuración y normalización de las entidades que soportan la administración de recursos materiales, garantizando consistencia e integración con los demás módulos del sistema.

**Integrantes:**  
👤 Erick Matias Granillo Mejía | 230045  
👤 Diego Miguel Rivera Chavez | 230260  
👤 José Arturo Garcia Gonzalez | 230629  
👤 Derek Sesni Careño | 230892  
👤 Mauricio Rosales Gabriel | 220859  

**Enfoque del equipo:**  
Diseño de base de datos, modelado de entidades, control de inventarios, proveedores y activos hospitalarios.

---

# 🔐 Roles y Privilegios  
**Base de Datos:** hospital

---

## 📌 Descripción General

La base de datos **hospital** implementa un esquema de seguridad basado en **roles por área funcional**, aplicando el **principio de mínimo privilegio**.

Cada usuario cuenta únicamente con los permisos necesarios para desempeñar sus funciones dentro del hospital, evitando accesos innecesarios a información sensible.

---

## 👥 Roles y Áreas

| Rol | Área | Alcance |
|----|-----|--------|
| ge_user | Gerencia | Gestión administrativa estratégica |
| hr_user | Recursos Humanos | Gestión de personal |
| mr_user | Recursos Materiales | Inventario y proveedores |
| ms_user | Servicios Médicos | Atención médica operativa |
| md_user | Registros Médicos | Expedientes clínicos |
| ph_user | Farmacia | Medicamentos e inventario farmacéutico |
| developer | Desarrollo | Solo lectura global |

---

## 🏛 GERENCIA – ge_user

### Permisos
- ALTER  
- DELETE  
- INSERT  
- UPDATE  
- REFERENCES  

### Tablas
- tbb_quejas_sugerencias  
- tbc_areas  
- tbc_organos  
- tbc_patologias  
- tbc_servicios  
- tbd_aprobaciones  

**REFERENCES sobre:**  
- tbd_accesos  

**Enfoque:** Gestión estratégica y administrativa.

---

## 👨‍💼 RECURSOS HUMANOS – hr_user

### Permisos
- ALTER  
- DELETE  
- INSERT  
- UPDATE  
- REFERENCES  

### Tablas
- tbb_departamentos  
- tbb_personal  
- tbb_personal_medico  
- tbb_personas  
- tbb_personas_fisicas  
- tbd_horarios  

**Enfoque:** Administración del personal y estructura organizacional.

---

## 🏗 RECURSOS MATERIALES – mr_user

### Permisos
- ALTER  
- DELETE  
- INSERT  
- UPDATE  
- REFERENCES  

### Tablas
- tbb_personas_morales  
- tbb_proveedores  
- tbb_transacciones_financieras  
- tbc_equipamientos  
- tbc_espacios  
- tbd_accesos  
- tbd_inventario_equipamientos  

**REFERENCES sobre:**  
- tbb_personas_fisicas  

**Enfoque:** Gestión de inventario, proveedores y activos hospitalarios.

---

## 🏥 SERVICIOS MÉDICOS – ms_user

### Permisos
- ALTER  
- DELETE  
- INSERT  
- UPDATE  
- REFERENCES  

### Tablas
- tbb_dietas  
- tbb_transfusiones_sanguineas  
- tbb_traslados  
- tbc_cirugias  
- tbc_servicios_medicos  
- tbd_campanias  
- tbd_citas_medicas  
- tbd_valoraciones  

**Enfoque:** Operación clínica diaria y atención médica.

---

## 📁 REGISTROS MÉDICOS – md_user

### Permisos
- ALTER  
- DELETE  
- INSERT  
- UPDATE  
- REFERENCES  

### Tablas
- tbb_defunciones  
- tbb_diagnosticos  
- tbb_documentos_oficiales  
- tbb_expedientes_medicos  
- tbb_nacimientos  
- tbb_notas_medicas  
- tbb_pacientes  
- tbb_tratamientos  
- tbc_signos_vitales  
- tbd_padecimientos  

**Enfoque:** Gestión de historial clínico y expediente médico.

---

## 💊 FARMACIA – ph_user

### Permisos
- ALTER  
- DELETE  
- INSERT  
- UPDATE  
- REFERENCES  

### Tablas
- tbb_recetas_medicas  
- tbc_medicamentos  
- tbd_inventario_medicamentos  
- tbd_lotes_medicamentos  

**Enfoque:** Control farmacológico y administración de medicamentos.ilitando el *merge* con los módulos desarrollados por otros equipos.
