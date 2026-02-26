# 🔐 Roles y Privilegios  
**Base de Datos:** `hospital_matricula`

---

## 📌 Descripción General

La base de datos **hospital** implementa un esquema de seguridad basado en **roles por área funcional**, aplicando estrictamente el **principio de mínimo privilegio**.

Cada usuario dispone únicamente de los permisos necesarios para desempeñar sus funciones dentro del hospital, evitando accesos innecesarios a información sensible y reduciendo riesgos de seguridad.

---

## 👥 Roles por Área Funcional

| Rol        | Área                 | Alcance |
|-----------|----------------------|--------|
| `ge_user` | Gerencia             | Gestión administrativa estratégica |
| `hr_user` | Recursos Humanos     | Administración del personal |
| `mr_user` | Recursos Materiales  | Inventario y proveedores |
| `ms_user` | Servicios Médicos    | Operación médica |
| `md_user` | Registros Médicos    | Expedientes clínicos |
| `ph_user` | Farmacia             | Medicamentos e inventario |
| `developer` | Desarrollo         | Solo lectura global |

---

## 🏛 Gerencia — `ge_user`

### Permisos
- `ALTER`
- `DELETE`
- `INSERT`
- `UPDATE`
- `REFERENCES`

### Tablas
- `tbb_quejas_sugerencias`
- `tbc_areas`
- `tbc_organos`
- `tbc_patologias`
- `tbc_servicios`
- `tbd_aprobaciones`

### REFERENCES sobre
- `tbd_accesos`

**Enfoque:** Gestión estratégica y administrativa del hospital.

---

## 👨‍💼 Recursos Humanos — `hr_user`

### Permisos
- `ALTER`
- `DELETE`
- `INSERT`
- `UPDATE`
- `REFERENCES`

### Tablas
- `tbb_departamentos`
- `tbb_personal`
- `tbb_personal_medico`
- `tbb_personas`
- `tbb_personas_fisicas`
- `tbd_horarios`

**Enfoque:** Administración del personal y estructura organizacional.

---

## 🏗 Recursos Materiales — `mr_user`

### Permisos
- `ALTER`
- `DELETE`
- `INSERT`
- `UPDATE`
- `REFERENCES`

### Tablas
- `tbb_personas_morales`
- `tbb_proveedores`
- `tbb_transacciones_financieras`
- `tbc_equipamientos`
- `tbc_espacios`
- `tbd_accesos`
- `tbd_inventario_equipamientos`

### REFERENCES sobre
- `tbb_personas_fisicas`

**Enfoque:** Gestión de inventarios, proveedores y activos hospitalarios.

---

## 🏥 Servicios Médicos — `ms_user`

### Permisos
- `ALTER`
- `DELETE`
- `INSERT`
- `UPDATE`
- `REFERENCES`

### Tablas
- `tbb_dietas`
- `tbb_transfusiones_sanguineas`
- `tbb_traslados`
- `tbc_cirugias`
- `tbc_servicios_medicos`
- `tbd_campanias`
- `tbd_citas_medicas`
- `tbd_valoraciones`

**Enfoque:** Operación clínica diaria y atención médica directa.

---

## 📁 Registros Médicos — `md_user`

### Permisos
- `ALTER`
- `DELETE`
- `INSERT`
- `UPDATE`
- `REFERENCES`

### Tablas
- `tbb_defunciones`
- `tbb_diagnosticos`
- `tbb_documentos_oficiales`
- `tbb_expedientes_medicos`
- `tbb_nacimientos`
- `tbb_notas_medicas`
- `tbb_pacientes`
- `tbb_tratamientos`
- `tbc_signos_vitales`
- `tbd_padecimientos`

**Enfoque:** Gestión integral del historial clínico y expedientes médicos.

---

## 💊 Farmacia — `ph_user`

### Permisos
- `ALTER`
- `DELETE`
- `INSERT`
- `UPDATE`
- `REFERENCES`

### Tablas
- `tbb_recetas_medicas`
- `tbc_medicamentos`
- `tbd_inventario_medicamentos`
- `tbd_lotes_medicamentos`

**Enfoque:** Control farmacológico y administración de medicamentos.

---
