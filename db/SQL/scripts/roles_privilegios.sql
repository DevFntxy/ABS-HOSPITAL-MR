
/* =========================
   1. CREACIÓN DE USUARIOS
   ========================= */

CREATE USER IF NOT EXISTS `derek.sesni`@`%` IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS `matias.granillo`@`%` IDENTIFIED BY '12345';
CREATE USER IF NOT EXISTS `diego.rivera`@`%` IDENTIFIED BY '12345';
CREATE USER IF NOT EXISTS `arturo.garcia`@`%` IDENTIFIED BY '12345';

/* =========================
   2. CREACIÓN DE ROLES
   ========================= */

CREATE ROLE IF NOT EXISTS `developer`;
CREATE ROLE IF NOT EXISTS `patient`;
CREATE ROLE IF NOT EXISTS `nurse`;
CREATE ROLE IF NOT EXISTS `medic`;
CREATE ROLE IF NOT EXISTS `ge_user`;
CREATE ROLE IF NOT EXISTS `ph_user`;
CREATE ROLE IF NOT EXISTS `md_user`;
CREATE ROLE IF NOT EXISTS `ms_user`;
CREATE ROLE IF NOT EXISTS `mr_user`;
CREATE ROLE IF NOT EXISTS `hr_user`;


/* =========================
   3. PERMISOS A ROLES
   ========================= */

-- =====================================
-- DEVELOPER (SOLO LECTURA GLOBAL)
-- =====================================
GRANT SELECT
ON `hospital_230142`.*
TO `developer`;


-- =====================================
-- FARMACIA (ph_user)
-- =====================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_recetas_medicas`
TO `ph_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbc_medicamentos`
TO `ph_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_inventario_medicamentos`
TO `ph_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_lotes_medicamentos`
TO `ph_user`;


-- =====================================
-- RECURSOS HUMANOS (hr_user)
-- =====================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_departamentos`
TO `hr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_personal`
TO `hr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_personal_medico`
TO `hr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_personas`
TO `hr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_personas_fisicas`
TO `hr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_horarios`
TO `hr_user`;


-- =====================================
-- REGISTROS MÉDICOS (md_user)
-- =====================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_pacientes`
TO `md_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_expedientes_medicos`
TO `md_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_notas_medicas`
TO `md_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_diagnosticos`
TO `md_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_tratamientos`
TO `md_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_defunciones`
TO `md_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_nacimientos`
TO `md_user`;


-- =====================================
-- SERVICIOS MÉDICOS (ms_user)
-- =====================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_dietas`
TO `ms_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_transfusiones_sanguineas`
TO `ms_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_traslados`
TO `ms_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_citas_medicas`
TO `ms_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_valoraciones`
TO `ms_user`;


-- =====================================
-- RECURSOS MATERIALES (mr_user)
-- =====================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_proveedores`
TO `mr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_personas_morales`
TO `mr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_transacciones_financieras`
TO `mr_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_inventario_equipamientos`
TO `mr_user`;


-- =====================================
-- GERENCIA (ge_user)
-- =====================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbb_quejas_sugerencias`
TO `ge_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbc_areas`
TO `ge_user`;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `hospital_230142`.`tbd_aprobaciones`
TO `ge_user`;


/* =========================
   4. ASIGNACIÓN DE ROLES
   ========================= */

GRANT `developer` TO
`derek.sesni`@`%`,
`matias.granillo`@`%`,
`diego.rivera`@`%`,
`arturo.garcia`@`%`;

GRANT `ph_user` TO
`derek.sesni`@`%`,
`matias.granillo`@`%`,
`diego.rivera`@`%`,
`arturo.garcia`@`%`;

SET DEFAULT ROLE `developer`, `ph_user` TO
`derek.sesni`@`%`,
`matias.granillo`@`%`,
`diego.rivera`@`%`,
`arturo.garcia`@`%`;


FLUSH PRIVILEGES;