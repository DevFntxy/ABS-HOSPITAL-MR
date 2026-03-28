-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_230260
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `hospital_230260`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hospital_230260` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospital_230260`;

--
-- Table structure for table `tbb_defunciones`
--

DROP TABLE IF EXISTS `tbb_defunciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_defunciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_defunciones`
--

LOCK TABLES `tbb_defunciones` WRITE;
/*!40000 ALTER TABLE `tbb_defunciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_defunciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_departamentos`
--

DROP TABLE IF EXISTS `tbb_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_departamentos`
--

LOCK TABLES `tbb_departamentos` WRITE;
/*!40000 ALTER TABLE `tbb_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_diagnosticos`
--

DROP TABLE IF EXISTS `tbb_diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_diagnosticos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_diagnosticos`
--

LOCK TABLES `tbb_diagnosticos` WRITE;
/*!40000 ALTER TABLE `tbb_diagnosticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_dietas`
--

DROP TABLE IF EXISTS `tbb_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_dietas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_dietas`
--

LOCK TABLES `tbb_dietas` WRITE;
/*!40000 ALTER TABLE `tbb_dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_dietas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_documentos_oficiales`
--

DROP TABLE IF EXISTS `tbb_documentos_oficiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_documentos_oficiales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_documentos_oficiales`
--

LOCK TABLES `tbb_documentos_oficiales` WRITE;
/*!40000 ALTER TABLE `tbb_documentos_oficiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_documentos_oficiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_expedientes_medicos`
--

DROP TABLE IF EXISTS `tbb_expedientes_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_expedientes_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_expedientes_medicos`
--

LOCK TABLES `tbb_expedientes_medicos` WRITE;
/*!40000 ALTER TABLE `tbb_expedientes_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_expedientes_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_nacimientos`
--

DROP TABLE IF EXISTS `tbb_nacimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_nacimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_nacimientos`
--

LOCK TABLES `tbb_nacimientos` WRITE;
/*!40000 ALTER TABLE `tbb_nacimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_nacimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_notas_medicas`
--

DROP TABLE IF EXISTS `tbb_notas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_notas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_notas_medicas`
--

LOCK TABLES `tbb_notas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_notas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_notas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_pacientes`
--

DROP TABLE IF EXISTS `tbb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pacientes` (
  `ID` int unsigned NOT NULL,
  `estatus_medico` varchar(150) DEFAULT NULL,
  `estatus_vida` enum('Vivo','Fallecido','Vegetativo','Coma','Desconocido') NOT NULL DEFAULT 'Desconocido',
  `fecha_ultima_cita_medica` datetime DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_personas_fisicas_pacientes` FOREIGN KEY (`ID`) REFERENCES `tbb_personas_fisicas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_pacientes`
--

LOCK TABLES `tbb_pacientes` WRITE;
/*!40000 ALTER TABLE `tbb_pacientes` DISABLE KEYS */;
INSERT INTO `tbb_pacientes` VALUES (1,'','Vivo','2026-02-12 15:40:12','2026-02-12 15:40:12',NULL,_binary ''),(2,'','Vivo','2026-02-12 15:50:16','2026-02-12 15:50:16',NULL,_binary ''),(3,'','Vivo','2026-02-12 15:56:54','2026-02-12 15:56:54',NULL,_binary ''),(4,'','Vivo','2026-02-12 16:07:33','2026-02-12 16:07:33',NULL,_binary '');
/*!40000 ALTER TABLE `tbb_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personal`
--

DROP TABLE IF EXISTS `tbb_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personal`
--

LOCK TABLES `tbb_personal` WRITE;
/*!40000 ALTER TABLE `tbb_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personal_medico`
--

DROP TABLE IF EXISTS `tbb_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personal_medico`
--

LOCK TABLES `tbb_personal_medico` WRITE;
/*!40000 ALTER TABLE `tbb_personal_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('Física','Moral') NOT NULL DEFAULT 'Física',
  `rfc` varchar(14) DEFAULT NULL,
  `pais_origen` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
INSERT INTO `tbb_personas` VALUES (1,'Física','GPD894121','México','2026-02-12 15:40:12',NULL,_binary ''),(2,'Física','EUMÁ160212DO4','Canadá','2026-02-12 15:50:16',NULL,_binary ''),(3,'Física','PADC140212ES0','Argentina','2026-02-12 15:56:54',NULL,_binary ''),(4,'Física','MACD370212UR9','Argentina','2026-02-12 16:07:33',NULL,_binary '');
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_fisicas` (
  `ID` int unsigned NOT NULL,
  `titulo_cortesia` varchar(40) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `primer_apellido` varchar(60) NOT NULL,
  `segundo_apellido` varchar(60) DEFAULT NULL,
  `genero` enum('H','M','N/B') NOT NULL DEFAULT 'N/B',
  `fecha_nacimiento` date NOT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `grupo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `fk_personas_fisicas_personas` FOREIGN KEY (`ID`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas_fisicas`
--

LOCK TABLES `tbb_personas_fisicas` WRITE;
/*!40000 ALTER TABLE `tbb_personas_fisicas` DISABLE KEYS */;
INSERT INTO `tbb_personas_fisicas` VALUES (1,'Sra.','Victoria','Ibarra','Suarez','M','2013-02-12','GPD894121','B+','2026-02-12 15:40:12',NULL,_binary ''),(2,'Sr.','Ángel','Esquivel','Miranda','H','2016-02-12','EUMÁ160212HNESRN6','B+','2026-02-12 15:50:16',NULL,_binary ''),(3,'Sra.','Claudia','Paredes','Delgado','M','2014-02-12','PADC140212MNERLL7','O-','2026-02-12 15:56:54',NULL,_binary ''),(4,'QFB.','Diego','Manzano','Cedillo','H','1937-02-12','MACD370212HNENDG4','O-','2026-02-12 16:07:33',NULL,_binary '');
/*!40000 ALTER TABLE `tbb_personas_fisicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas_morales`
--

DROP TABLE IF EXISTS `tbb_personas_morales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_morales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas_morales`
--

LOCK TABLES `tbb_personas_morales` WRITE;
/*!40000 ALTER TABLE `tbb_personas_morales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personas_morales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_proveedores`
--

DROP TABLE IF EXISTS `tbb_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_proveedores`
--

LOCK TABLES `tbb_proveedores` WRITE;
/*!40000 ALTER TABLE `tbb_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_quejas_sugerencias`
--

DROP TABLE IF EXISTS `tbb_quejas_sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_quejas_sugerencias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_quejas_sugerencias`
--

LOCK TABLES `tbb_quejas_sugerencias` WRITE;
/*!40000 ALTER TABLE `tbb_quejas_sugerencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_quejas_sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_recetas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_recetas_medicas`
--

LOCK TABLES `tbb_recetas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_recetas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_recetas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_transacciones_financieras`
--

DROP TABLE IF EXISTS `tbb_transacciones_financieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transacciones_financieras` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_transacciones_financieras`
--

LOCK TABLES `tbb_transacciones_financieras` WRITE;
/*!40000 ALTER TABLE `tbb_transacciones_financieras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_transacciones_financieras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_transfusiones_sanguineas`
--

DROP TABLE IF EXISTS `tbb_transfusiones_sanguineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transfusiones_sanguineas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_transfusiones_sanguineas`
--

LOCK TABLES `tbb_transfusiones_sanguineas` WRITE;
/*!40000 ALTER TABLE `tbb_transfusiones_sanguineas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_transfusiones_sanguineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_traslados`
--

DROP TABLE IF EXISTS `tbb_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_traslados` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_traslados`
--

LOCK TABLES `tbb_traslados` WRITE;
/*!40000 ALTER TABLE `tbb_traslados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_tratamientos`
--

DROP TABLE IF EXISTS `tbb_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_tratamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_tratamientos`
--

LOCK TABLES `tbb_tratamientos` WRITE;
/*!40000 ALTER TABLE `tbb_tratamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_valoraciones`
--

DROP TABLE IF EXISTS `tbb_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_valoraciones`
--

LOCK TABLES `tbb_valoraciones` WRITE;
/*!40000 ALTER TABLE `tbb_valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_areas`
--

DROP TABLE IF EXISTS `tbc_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Ubicacion_ID` int unsigned NOT NULL,
  `Personal_ID_responsable` int unsigned NOT NULL,
  `Area_superior_ID` int unsigned DEFAULT NULL,
  `Estatus_Operacion` enum('Activa','Inactiva','Suspendida','Cancelada') DEFAULT 'Activa',
  `Total_empleados` int unsigned NOT NULL DEFAULT '0',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nombre` (`Nombre`),
  KEY `fk_areasuperior` (`Area_superior_ID`),
  CONSTRAINT `fk_areasuperior` FOREIGN KEY (`Area_superior_ID`) REFERENCES `tbc_areas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_areas`
--

LOCK TABLES `tbc_areas` WRITE;
/*!40000 ALTER TABLE `tbc_areas` DISABLE KEYS */;
INSERT INTO `tbc_areas` VALUES (1,'Sucursal Central','Oficina principal encargada de la administraciÃ³n y atenciÃ³n al cliente.',1,10,NULL,'Activa',25,'2026-01-17 12:13:39',NULL,_binary ''),(2,'Ãrea de InnovaciÃ³n','Responsable de proyectos de innovaciÃ³n.',1,2,NULL,'Activa',15,'2026-01-17 12:21:27',NULL,_binary ''),(3,'Ãrea de Sistemas','Ãrea encargada de la administraciÃ³n y soporte de los sistemas informÃ¡ticos',1,3,NULL,'Activa',12,'2026-01-17 12:27:58',NULL,_binary ''),(4,'Recursos Humanos','GestiÃ³n de talento y nÃ³mina',1,105,NULL,'Activa',12,'2026-01-17 12:28:05',NULL,_binary ''),(5,'Urgencias Norte','Área de atención inmediata planta baja',1,10,NULL,'Activa',5,'2026-01-17 12:18:29',NULL,_binary ''),(6,'Departamento de Sistemas','Área encargada del soporte técnico y desarrollo de software.',1,101,NULL,'Activa',5,'2026-01-17 12:32:40',NULL,_binary '');
/*!40000 ALTER TABLE `tbc_areas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_ai_areas` AFTER INSERT ON `tbc_areas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora
    VALUES (
        DEFAULT,
        'tbc_areas',
        USER(),  
        'Insert',
        CONCAT('Se ha agregado una nueva  rea: '),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_cirugias`
--

DROP TABLE IF EXISTS `tbc_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_cirugias`
--

LOCK TABLES `tbc_cirugias` WRITE;
/*!40000 ALTER TABLE `tbc_cirugias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_cirugias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_equipamiento`
--

DROP TABLE IF EXISTS `tbc_equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_equipamiento` (
  `id_equipamiento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `fecha_adquisicion` date NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_equipamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_equipamiento`
--

LOCK TABLES `tbc_equipamiento` WRITE;
/*!40000 ALTER TABLE `tbc_equipamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_equipamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_equipamientos`
--

DROP TABLE IF EXISTS `tbc_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_equipamientos`
--

LOCK TABLES `tbc_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbc_equipamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_equipamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_espacios`
--

DROP TABLE IF EXISTS `tbc_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_espacios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_espacios`
--

LOCK TABLES `tbc_espacios` WRITE;
/*!40000 ALTER TABLE `tbc_espacios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_espacios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_medicamentos`
--

DROP TABLE IF EXISTS `tbc_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_medicamentos`
--

LOCK TABLES `tbc_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbc_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_organos`
--

DROP TABLE IF EXISTS `tbc_organos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_organos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_organos`
--

LOCK TABLES `tbc_organos` WRITE;
/*!40000 ALTER TABLE `tbc_organos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_organos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_patologias`
--

DROP TABLE IF EXISTS `tbc_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_patologias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_patologias`
--

LOCK TABLES `tbc_patologias` WRITE;
/*!40000 ALTER TABLE `tbc_patologias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_patologias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_servicios`
--

DROP TABLE IF EXISTS `tbc_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_servicios`
--

LOCK TABLES `tbc_servicios` WRITE;
/*!40000 ALTER TABLE `tbc_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_servicios_medicos`
--

LOCK TABLES `tbc_servicios_medicos` WRITE;
/*!40000 ALTER TABLE `tbc_servicios_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_servicios_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_signos_vitales`
--

DROP TABLE IF EXISTS `tbc_signos_vitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_signos_vitales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_signos_vitales`
--

LOCK TABLES `tbc_signos_vitales` WRITE;
/*!40000 ALTER TABLE `tbc_signos_vitales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_signos_vitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_accesos`
--

DROP TABLE IF EXISTS `tbd_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_accesos` (
  `ID` int unsigned NOT NULL,
  `Persona_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Espacio_ID` int unsigned NOT NULL,
  `Tipo` enum('Entrando','Saliendo') NOT NULL DEFAULT 'Entrando',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Personal_ID_autoriza` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_accesos`
--

LOCK TABLES `tbd_accesos` WRITE;
/*!40000 ALTER TABLE `tbd_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_aprobaciones`
--

DROP TABLE IF EXISTS `tbd_aprobaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_aprobaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Personal_ID` int unsigned NOT NULL,
  `Servicio_ID` int unsigned NOT NULL,
  `Estatus_aprobacion` enum('Registrado','Aprobado','Rechazado','En espera','Cancelado') DEFAULT 'Registrado',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_aprobaciones`
--

LOCK TABLES `tbd_aprobaciones` WRITE;
/*!40000 ALTER TABLE `tbd_aprobaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_aprobaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_campanias`
--

DROP TABLE IF EXISTS `tbd_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Personal_ID_Responsable` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Estatus_Realizacion` enum('Programada','Realizada','Finalizada','Cancelada','Aprobada','Activa','Inactiva') DEFAULT 'Programada',
  `Estatus` bit(1) DEFAULT b'1',
  `Tipo` enum('Preventiva','Diagnóstica','Terapéutica','Especializada','General') NOT NULL DEFAULT 'General',
  `Observaciones` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_campanias`
--

LOCK TABLES `tbd_campanias` WRITE;
/*!40000 ALTER TABLE `tbd_campanias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_campanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_citas_medicas`
--

DROP TABLE IF EXISTS `tbd_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_citas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_citas_medicas`
--

LOCK TABLES `tbd_citas_medicas` WRITE;
/*!40000 ALTER TABLE `tbd_citas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_citas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_horarios`
--

DROP TABLE IF EXISTS `tbd_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_horarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_horarios`
--

LOCK TABLES `tbd_horarios` WRITE;
/*!40000 ALTER TABLE `tbd_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_inventario_equipamientos`
--

DROP TABLE IF EXISTS `tbd_inventario_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_inventario_equipamientos`
--

LOCK TABLES `tbd_inventario_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbd_inventario_equipamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_inventario_equipamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_inventario_medicamentos`
--

LOCK TABLES `tbd_inventario_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_inventario_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_inventario_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_lotes_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_lotes_medicamentos`
--

LOCK TABLES `tbd_lotes_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_lotes_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_lotes_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_padecimientos`
--

DROP TABLE IF EXISTS `tbd_padecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_padecimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_padecimientos`
--

LOCK TABLES `tbd_padecimientos` WRITE;
/*!40000 ALTER TABLE `tbd_padecimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_padecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_transaccion_financiera`
--

DROP TABLE IF EXISTS `tbd_transaccion_financiera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_transaccion_financiera` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_equipamiento` int NOT NULL,
  `tipo_transaccion` varchar(30) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_transaccion` date NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_equipamiento` (`id_equipamiento`),
  CONSTRAINT `tbd_transaccion_financiera_ibfk_1` FOREIGN KEY (`id_equipamiento`) REFERENCES `tbc_equipamiento` (`id_equipamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_transaccion_financiera`
--

LOCK TABLES `tbd_transaccion_financiera` WRITE;
/*!40000 ALTER TABLE `tbd_transaccion_financiera` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_transaccion_financiera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'tbc_areas','root@localhost','Insert','Se ha agregado una nueva area :P','2026-01-13 15:13:39'),(2,'tbc_areas','Diego@localhost','Insert','Se ha agregado una nueva área','2026-01-13 15:21:27'),(3,'tbc_areas','Jenny@DESKTOP-91BTRGU','Insert','Se ha agregado una nueva área: ','2026-01-13 15:27:58'),(4,'tbc_areas','Derek@DESKTOP-6AIEKNG','Insert','Se ha agregado una nueva área','2026-01-13 15:28:05'),(5,'tbc_areas','Mati@DESKTOP-BKVQOR7','Insert','Se ha agregado una nueva ┬área: ','2026-01-15 16:18:29'),(6,'tbc_areas','Mati@DESKTOP-BKVQOR7','Insert','Se ha agregado una nueva ┬área','2026-01-16 12:32:40'),(7,'tbc_areas','Jona@DESKTOP-V03BSD8','Insert','Se ha agregado una nueva ┬área','2026-01-16 12:37:44');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbr_inventario_equipamiento`
--

DROP TABLE IF EXISTS `tbr_inventario_equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbr_inventario_equipamiento` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_equipamiento` int NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_equipamiento` (`id_equipamiento`),
  CONSTRAINT `tbr_inventario_equipamiento_ibfk_1` FOREIGN KEY (`id_equipamiento`) REFERENCES `tbc_equipamiento` (`id_equipamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbr_inventario_equipamiento`
--

LOCK TABLES `tbr_inventario_equipamiento` WRITE;
/*!40000 ALTER TABLE `tbr_inventario_equipamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbr_inventario_equipamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_roles_usuarios`
--

DROP TABLE IF EXISTS `vw_roles_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital_230260'
--

--
-- Dumping routines for database 'hospital_230260'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_consonante_interna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_consonante_interna`(p_texto VARCHAR(60)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

	SET p_texto = fn_limpiar_texto(p_texto);
    WHILE i <= CHAR_LENGTH(p_texto) DO
        SET v_char = SUBSTRING(UPPER(p_texto), i, 1);
        IF v_char REGEXP '[B-DF-HJ-NP-TV-Z]' THEN
            RETURN v_char;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN 'X';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_apellido`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
RETURN ELT(FLOOR(1+RAND()*150),
'Lopez','Garcia','Hernandez','Martinez','Perez',
'Gomez','Torres','Diaz','Vazquez','Sanchez',
'Ramirez','Castro','Ortega','Ruiz','Morales',
'Jimenez','Alvarez','Romero','Gutierrez','Chavez',
'Mendoza','Rojas','Flores','Rivera','Silva',
'Delgado','Aguilar','Navarro','Cruz','Reyes',
'Herrera','Medina','Castillo','Vargas','Guerrero',
'Ramos','Molina','Suarez','Contreras','Dominguez',
'Vega','Soto','Cabrera','Campos','Valdez',
'Carrillo','Salazar','Pena','Leon','Ibarra',
'Montoya','Padilla','Fuentes','Mejia','Cortes',
'Paredes','Nunez','Gallegos','Luna','Escobar',
'Figueroa','Macias','Zamora','Arellano','Bautista',
'Velasco','Barrios','Miranda','Serrano','Ochoa',
'Tapia','Acosta','Ayala','Franco','Cordero',
'Benitez','Villanueva','Palacios','Esquivel','Valencia',
'Rosales','Santana','Maldonado','Solano','Arroyo',
'Bravo','Trujillo','Zavala','Montes','Cisneros',
'Beltran','Cuevas','Avila','Galvan','Camacho',
'Salinas','Cardenas','Peralta','Trejo','Olivares',
'Valle','Leal','Zuniga','Coronado','Chacon',
'Renteria','Becerra','Cervantes','Marquez','Villalobos',
'Robles','Meza','Cantu','Tovar','Sepulveda',
'Ponce','Lozano','Andrade','Amador','Barrientos',
'Cedillo','Carmona','DeLeon','Escamilla','Granados',
'Huerta','Jaimes','Ledezma','Manzano','Ontiveros',
'Portillo','Quintero','Resendiz','Saucedo','Tejada',
'Urbina','Villaseñor','Yanez','Zarate','Alvarado') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_curp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_curp`(
    p_nombre VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha DATE,
    p_genero CHAR(1)
) RETURNS varchar(18) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        UPPER(p_genero),
        'NE',
        fn_consonante_interna(p_apellido1),
        fn_consonante_interna(p_apellido2),
        fn_consonante_interna(p_nombre),
        FLOOR(RAND()*10)
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_nombre`(p_genero VARCHAR(1)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_genero='H' THEN ELT(FLOOR(1+RAND()*100),
		'Juan','Carlos','Miguel','Luis','José',
		'Jorge','Pedro','Andrés','Daniel','Fernando',
		'Ricardo','Manuel','Alejandro','Francisco','David',
		'Diego','Antonio','Jesús','Raúl','Sergio',
		'Roberto','Alberto','Mario','Héctor','Adrián',
		'Gabriel','Martín','Esteban','Óscar','Rodrigo',
		'Enrique','Pablo','Emilio','Iván','Jaime',
		'Guillermo','Salvador','Ramón','Ángel','Hugo',
		'Leonardo','Rafael','Gustavo','Cristian','Sebastián',
		'Brayan','Kevin','Axel','Samuel','Isaac',
		'Matías','Benjamín','Emanuel','Tomás','Fabián',
		'Elías','Lucas','Nicolás','Álvaro','Jonathan',
		'Edgar','Marco','Julio','César','Mauricio',
		'Felipe','Cristóbal','Gerardo','Israel','Víctor',
		'Ernesto','Rubén','Noé','Simón','Bruno',
		'Gael','Damián','Maximiliano','Ian','Emiliano',
		'Joel','Omar','Saúl','Lorenzo','Agustín',
		'Valentín','Renato','Alan','Armando','Claudio',
		'Vicente','Patricio','Adolfo','Ismael','Efraín')

        WHEN p_genero='M' THEN ELT(FLOOR(1+RAND()*100),
		'María','Ana','Lucía','Sofía','Fernanda',
		'Valeria','Camila','Daniela','Elena','Paola',
		'Andrea','Ximena','Gabriela','Victoria','Isabella',
		'Renata','Natalia','Carolina','Alejandra','Mariana',
		'Patricia','Rosa','Claudia','Laura','Verónica',
		'Adriana','Mónica','Sandra','Liliana','Diana',
		'Lorena','Karla','Alejandrina','Carmen','Gloria',
		'Rocío','Teresa','Beatriz','Luz','Emilia',
		'Regina','Julia','Julieta','Montserrat','Vanessa',
		'Yuliana','Esmeralda','Brenda','Tatiana','Melissa',
		'Dayana','Bianca','Ángela','Noelia','Ariana',
		'Valentina','Martina','Antonella','Emma','Allison',
		'Naomi','Miranda','Paulina','Daniela','Sara',
		'Abigail','Jimena','Alondra','Fátima','Catalina',
		'Michelle','Zoe','Bárbara','Yamileth','Leslie',
		'Samara','Giselle','Karen','Cecilia','Itzel',
		'Mayra','Tania','Belén','Maribel','Guadalupe',
		'Elisa','Yesenia','Nadia','Silvia','Carla',
		'Frida','Ingrid','Alicia','Estefanía','Araceli')

        ELSE ELT(FLOOR(1+RAND()*100),
		'Alexis','Avery','Bailey','Blake','Cameron',
		'Casey','Dakota','Drew','Elliot','Harley',
		'Jamie','Jesse','Kai','Kendall','Logan',
		'Parker','Quinn','Reese','Riley','Rowan',
		'Skyler','Spencer','Tristan','Adrianne','Ainsley',
		'Alma','Amaris','Amaya','Anahi','Anya',
		'Arlette','Ashley','Aspen','Aubrey','Aurora',
		'Azul','Belen','Brisa','Chantal','Chloe',
		'Crystal','Dafne','Dana','Danna','Delilah',
		'Destiny','Eileen','Elisa','Elodie','Erika',
		'Evelin','Fiona','Genesis','Gina','Grecia',
		'Hanna','Hayley','Iliana','Indira','Irene',
		'Jade','Janeth','Jazmin','Jennifer','Jessica',
		'Joanna','Joselyn','Judith','Kiara','Kimberly',
		'Karla','Larissa','Leidy','Lia','Linda',
		'Lisbeth','Lizbeth','Mabel','Madeleine','Magdalena',
		'Mara','Maritza','Melany','Mia','Mireya',
		'Nayeli','Nicole','Nubia','Olga','Pamela',
		'Raquel','Ruth','Salma','Sheila','Sindy')
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_rfc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_rfc`(
    p_nombre VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha DATE
) RETURNS varchar(13) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        UPPER(
            CONCAT(
                CHAR(FLOOR(65+RAND()*26)),
                CHAR(FLOOR(65+RAND()*26)),
                FLOOR(RAND()*10)
            )
        )
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_titulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_titulo`(
    p_genero CHAR(1),
    p_edad INT
) RETURNS varchar(20) CHARSET utf8mb4
    NO SQL
BEGIN
    DECLARE v_rand INT;
    SET p_genero = UPPER(p_genero);

    IF p_edad < 12 THEN
        IF p_genero = 'M' THEN
            RETURN 'Niña';
        ELSE
            RETURN 'Niño';
        END IF;
    END IF;

    IF p_edad >= 12 AND p_edad < 18 THEN
        IF p_genero = 'M' THEN
            RETURN ELT(FLOOR(1+RAND()*2),'Señorita','Joven');
        ELSE
            RETURN ELT(FLOOR(1+RAND()*2),'Joven','Adolescente');
        END IF;
    END IF;

    IF p_edad >= 18 AND p_edad < 23 THEN
        IF p_genero = 'M' THEN
            RETURN ELT(FLOOR(1+RAND()*3),'Sr.','Señorita','Mx.');
        ELSE
            RETURN ELT(FLOOR(1+RAND()*3),'Sr.','Joven','Mx.');
        END IF;
    END IF;

    SET v_rand = FLOOR(1 + RAND()*12);

    IF p_genero = 'M' THEN
        RETURN ELT(v_rand,
            'Sr.',
            'Dr.',
            'Lic.',
            'Ing.',
            'Arq.',
            'Mtro.',
            'Mtr.',
            'C.P.',
            'Abg.',
            'Enf.',
            'QFB.',
            'Psic.'
        );
    ELSE
        RETURN ELT(v_rand,
            'Sra.',
            'Dra.',
            'Licda.',
            'Ing.',
            'Arq.',
            'Mtra.',
            'C.P.',
            'Abgda.',
            'Enf.',
            'QFB.',
            'Psic.',
            'Mx.'
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`() RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE min_dias INT;
    DECLARE max_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    -- Rango de fechas (ajústalo si lo necesitas)
    SET min_dias = DATEDIFF('1950-01-01', '1900-01-01');
    SET max_dias = DATEDIFF('2005-12-31', '1900-01-01');

    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);

    SET fecha_aleatoria = DATE_ADD('1900-01-01', INTERVAL dias_aleatorios DAY);

    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_grupo_sanguineo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_grupo_sanguineo`() RETURNS varchar(5) CHARSET utf8mb4
    DETERMINISTIC
RETURN ELT(FLOOR(1 + RAND()*8),
'A+','A-','B+','B-','AB+','AB-','O+','O-') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_limpiar_texto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_limpiar_texto`(p_texto VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    SET p_texto = UPPER(p_texto);

    SET p_texto = REPLACE(p_texto,'Á','A');
    SET p_texto = REPLACE(p_texto,'É','E');
    SET p_texto = REPLACE(p_texto,'Í','I');
    SET p_texto = REPLACE(p_texto,'Ó','O');
    SET p_texto = REPLACE(p_texto,'Ú','U');
    SET p_texto = REPLACE(p_texto,'Ü','U');
    SET p_texto = REPLACE(p_texto,'Ñ','X');

    RETURN p_texto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(
    p_min INT,
    p_max INT
) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(RAND() * (p_max - p_min + 1)) + p_min;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_vocal_interna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_vocal_interna`(p_texto VARCHAR(60)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

    WHILE i <= CHAR_LENGTH(p_texto) DO
        SET p_texto = fn_limpiar_texto(p_texto);
		SET v_char = SUBSTRING(p_texto, i, 1);
        IF v_char IN ('A','E','I','O','U') THEN
            RETURN v_char;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN 'X';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_pacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_pacientes`(
    -- tbb_personas
    IN p_tipo ENUM('Fisica', 'Moral'),
    IN p_rfc VARCHAR(14),
    IN p_pais_origen VARCHAR(50),

    -- tbb_personas_fisicas
    IN p_titulo_cortesia VARCHAR(40),
    IN p_nombre VARCHAR(60),
    IN p_primer_apellido VARCHAR(60),
    IN p_genero ENUM('H', 'M', 'N/B'),
    IN p_fecha_nacimiento DATE,
    IN p_curp VARCHAR(18),
    IN p_grupo_sanguineo ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),

    -- tbb_pacientes
    IN p_estatus_medico VARCHAR(150),
    IN p_estatus_vida ENUM('Vivo', 'Fallecido', 'Vegetativo', 'Coma', 'Desconocido'),
    IN p_fecha_ultima_citamedica DATETIME
)
BEGIN
    DECLARE v_id_persona INT;
    DECLARE v_id_persona_fisica INT;

    -- 1️. Insertar persona
    INSERT INTO tbb_personas (
        tipo, rfc, pais_origen, fecha_registro, estatus
    )
    VALUES (
        p_tipo, p_rfc, p_pais_origen, NOW(), b'1'
    );

    SET v_id_persona = LAST_INSERT_ID();

    -- 2️. Insertar persona física
    INSERT INTO tbb_personas_fisicas (
        id_persona,
        titulo_cortesia,
        nombre,
        primer_apellido,
        genero,
        fecha_nacimiento,
        curp,
        grupo_sanguineo,
        fecha_registro,
        estatus
    )
    VALUES (
        v_id_persona,
        p_titulo_cortesia,
        p_nombre,
        p_primer_apellido,
        p_genero,
        p_fecha_nacimiento,
        p_curp,
        p_grupo_sanguineo,
        NOW(),
        b'1'
    );

    SET v_id_persona_fisica = LAST_INSERT_ID();

    -- 3️. Insertar paciente
    INSERT INTO tbb_pacientes (
        id_persona_fisica,
        estatus_medico,
        estatus_vida,
        fecha_ultima_citamedica,
        fecha_registro,
        estatus
    )
    VALUES (
        v_id_persona_fisica,
        p_estatus_medico,
        p_estatus_vida,
        p_fecha_ultima_citamedica,
        NOW(),
        b'1'
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_pacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes`(
    IN p_cantidad INT,
    IN p_genero VARCHAR(1),
    IN p_edad_min INT,
    IN p_edad_max INT,
    IN p_estatus_vida VARCHAR(20),
    IN p_estatus_medico VARCHAR(150)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_genero VARCHAR(1);
    DECLARE v_curp VARCHAR(20);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_apellido1 VARCHAR(60);
    DECLARE v_apellido2 VARCHAR(60);
    DECLARE v_fecha_nac DATE;
    DECLARE v_now DATETIME;
    DECLARE v_edad INT;
    DECLARE v_id INT;
    DECLARE v_intentos INT DEFAULT 0;
    DECLARE v_batch_size INT DEFAULT 1000;


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			@p1 = MESSAGE_TEXT;
		ROLLBACK;
		SELECT @p1 AS error_real;
	END;
	
    IF p_edad_min > p_edad_max THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Rango de edad inválido';
	END IF;

    IF p_cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cantidad inválida';
    END IF;

    START TRANSACTION;
	SET v_now = NOW();
    WHILE i < p_cantidad DO
    
        SET v_genero = p_genero;
        SET v_edad = p_edad_min + FLOOR(RAND()*(p_edad_max - p_edad_min + 1));
        SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
        SET v_nombre = fn_generar_nombre(v_genero);
        SET v_apellido1 = fn_generar_apellido();
        SET v_apellido2 = fn_generar_apellido();
        SET v_intentos = 0;
        
        WHILE v_apellido1 = v_apellido2 AND v_intentos < 5 DO
			SET v_apellido2 = fn_generar_apellido();
			SET v_intentos = v_intentos + 1;
		END WHILE;

		SET v_curp = fn_generar_curp(
			v_nombre,
			v_apellido1,
			v_apellido2,
			v_fecha_nac,
			v_genero
		);

		SET @v_rfc = fn_generar_rfc(
			v_nombre,
			v_apellido1,
			v_apellido2,
			v_fecha_nac
		);

        -- INSERT tbb_personas
        INSERT INTO tbb_personas (
			tipo,
            rfc,
            pais_origen,
            fecha_registro,
            fecha_actualizacion,
            estatus
        ) VALUES (
            'Fisica',
            @v_rfc,
            ELT(FLOOR(1+RAND()*5),
                'México','USA','Canadá','Colombia','Argentina'),
            v_now,
            null,
            1
        );
        
        -- INSERT tbb_personas_fisicas
        SET v_id = LAST_INSERT_ID();
        INSERT INTO tbb_personas_fisicas (
			ID,
            titulo_cortesia,
            nombre,
			primer_apellido,
			segundo_apellido,
			genero,
			fecha_nacimiento,
			curp,
			grupo_sanguineo,
			fecha_registro,
			fecha_actualizacion,
			estatus
        ) VALUES(
            v_id,
            fn_generar_titulo(v_genero, v_edad),
            v_nombre,
            v_apellido1,
            v_apellido2,
            v_genero,
            v_fecha_nac,
            v_curp,
            fn_grupo_sanguineo(),
            v_now,
            null,
            1
        );

        -- INSERT tbb_pacientes
        INSERT INTO tbb_pacientes (
			ID,
			estatus_medico,
			estatus_vida,
			fecha_ultima_cita_medica,
			fecha_registro,
			fecha_actualizacion,
			estatus
        ) VALUES(
            v_id,
            p_estatus_medico,
            p_estatus_vida,
            v_now,
            v_now,
            null,
            1
        );

        SET i = i + 1;
        IF i MOD v_batch_size = 0 THEN
			COMMIT;
			START TRANSACTION;
		END IF;
    END WHILE;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `hospital_230260`
--

USE `hospital_230260`;

--
-- Final view structure for view `vw_roles_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios` AS select 1 AS `usuario`,1 AS `host`,1 AS `roles_asignados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12 16:32:17
