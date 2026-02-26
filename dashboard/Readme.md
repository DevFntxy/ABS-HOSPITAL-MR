# 🏥 Plataforma Administrativa Hospitalaria
## 📦 Módulo: Material Resources (MR)

### 👥 Presentación del Equipo
El **Equipo MR** es el encargado de diseñar y estructurar los cimientos de la gestión de activos y recursos del hospital. Nuestro compromiso es garantizar un control preciso sobre el equipamiento y los suministros que hacen posible la atención médica de alta calidad.


**Integrantes:**
- 👤 **Erick Matias Granillo Mejía** | `230045`
- 👤 **Diego Miguel Rivera Chavez** | `230260`
- 👤 **José Arturo Garcia Gonzalez** | `230629`
- 👤 **Derek Sesni Careño** | `230892`
- 👤 **Mauricio Rosales Gabriel** | `220859`

---


### 🎯 Objetivo
Demostrar el proceso de modelado de datos para el diseño de una base de datos, considerando de manera estructurada tanto datos estáticos como datos dinámicos, garantizando coherencia, escalabilidad y correcta gestión de la información.

### 🗂 Tablas Utilizadas
- tbb_personas
- tbb_personas_fisicas
- tbb_pacientes
- Cada gráfico fue construido con un Data Source independiente usando consultas GROUP BY y funciones de agregación como COUNT().








### 📈 Indicadores del Dashboard
El Dashboard incluye las siguientes visualizaciones:

🚩 Distribución por Género
🚩 Estado de Vida (Vivo / Finado)
🚩 País de Origen
🚩 Rango de Edad
🚩 Grupo Sanguíneo
🚩 Estatus Médico

---


### 🧪 Pruebas de Población de Datos

En este README se documentan las pruebas de poblamiento de datos de las tablas pacientes. Las pruebas se organizan en dos apartados principales:

- **Parte 1 — Datos estáticos / aleatorios:**
	- Generación de datos sintéticos y aleatorios para pruebas funcionales, de interfaz y de carga.
	- Útil para validar flujos, UI y manejo de datos sin necesidad de reproducir una distribución demográfica real.
    <br>

    <img src="/dashboard/Dashboard_Estatico.png">

    <br> 

- **Parte 2 — Datos apegados a porcentajes nacionales:**
	- Generación de datos que siguen distribuciones y porcentajes oficiales (por ejemplo: edad, sexo, grupo sanguíneo, etc.) para simular una población representativa.
	- Ideal para pruebas estadísticas, validación de reportes y escenarios que requieren realismo demográfico.

    <br>

    <img src="/dashboard/DashboardMR.png">

Archivos y ubicaciones relacionadas con las pruebas de poblamiento:

- `db/stored_procedures/sp_poblar_pacientes.sql` — procedimiento(s) para poblar tablas de pacientes (si aplica).


---