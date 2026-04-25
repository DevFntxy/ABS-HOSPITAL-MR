# 🎤 Exposición y Defensa del Proyecto
## Plataforma Administrativa Hospitalaria - Módulo: Material Resources (MR)

Este directorio contiene los recursos utilizados para la defensa oral del Proyecto Integrador, evidenciando el dominio técnico de la arquitectura híbrida implementada y la justificación de las decisiones de diseño.

---

## 🔗 Recurso de Presentación
* **Plataforma:** Gamma App
* **Formato:** Presentación Ejecutiva (10 Diapositivas)
* **Enlace a la presentación:** `[https://gamma.app/docs/Plataforma-Administrativa-Hospitalaria-7n4bapxcxcwrfte]`

---

## 🧠 Justificación de Decisiones Técnicas (Core Architect)
Durante el desarrollo del Módulo MR, el equipo tomó decisiones arquitectónicas basadas en los requerimientos de escalabilidad y la naturaleza de los datos hospitalarios:

### 1. Elección de Base de Datos Estructurada (MySQL)
Se implementó MySQL para gestionar el núcleo administrativo (`hospital_230260`) debido a la necesidad crítica de **integridad referencial**. Entidades como `Proveedores`, `Transacciones_Financieras` y `Espacios` requieren reglas ACID estrictas para evitar inconsistencias en el inventario y auditorías financieras.

### 2. Implementación NoSQL (MongoDB)
Se integró MongoDB (`hospital_nosql`) para la colección de `equipamientos_especificaciones`.
* **Justificación:** Los equipos médicos tienen especificaciones técnicas muy variables (ej. un monitor de signos vitales tiene atributos completamente distintos a una máquina de rayos X). El uso de un esquema dinámico (JSON/BSON) evita tablas relacionales con exceso de columnas nulas, optimizando el almacenamiento y la consulta de atributos específicos.

### 3. API Híbrida (FastAPI)
Se seleccionó FastAPI por su alto rendimiento y soporte nativo para asincronía.
* **Justificación:** El endpoint `/adquisicion-equipamiento` debía ejecutar el procedimiento almacenado en MySQL e insertar el documento en MongoDB en una sola petición. FastAPI permitió orquestar esta doble escritura con tiempos de respuesta óptimos y autogenerar la documentación en Swagger.

### 4. Generación de Datos y Dashboarding (Navicat BI)
La simulación de datos masivos se delegó a la capa de base de datos mediante *Stored Procedures* (`sp_poblar_pacientes`, `sp_adquisicion_equipamiento`) para aprovechar el motor de MySQL. Posteriormente, se utilizó Navicat BI (`DashboardMR.nbi`) ya que permite conectar directamente la fuente de datos simulada y reflejar el estatus del hospital en tiempo real sin requerir desarrollo frontend adicional.

---

## 👥 Estructura de la Defensa
Para demostrar el dominio técnico y el trabajo colaborativo, la exposición se divide estratégicamente:

1. **Contexto, Reglas de Negocio y Modelo Relacional:** Erick Matias Granillo Mejía & Diego Miguel Rivera Chavez.
2. **Implementación NoSQL y Gestión de Privilegios:** José Arturo Garcia Gonzalez.
3. **Orquestación de API Híbrida y Pruebas Postman/Swagger:** Derek Sesni Careño.
4. **Análisis de Datos (Dashboard) y Uso de IA:** Mauricio Rosales Gabriel.

> **Nota para los evaluadores:** Las evidencias de pruebas, diagramas y bitácoras de prompting referenciadas en la exposición se encuentran debidamente documentadas en las carpetas raíz correspondientes de este repositorio; por lo tanto, el contenido de esta diapositiva se considera totalmente aprobado por el equipo.