# 🏥 Plataforma Administrativa Hospitalaria
## 📦 Módulo: Material Resources (MR)

### 👥 Presentación del Equipo
El **Equipo MR** es el encargado de diseñar y estructurar los cimientos de la gestión de activos y recursos del hospital. Nuestro compromiso es garantizar un control preciso sobre el equipamiento y los suministros que hacen posible la atención médica de alta calidad.

**Integrantes:**
* 👤 **Erick Matias Granillo Mejía** | `230045`
* 👤 **Diego Miguel Rivera Chavez** | `230260`
* 👤 **José Arturo Garcia Gonzalez** | `230629`
* 👤 **Derek Sesni Careño** | `230892`
* 👤 **Mauricio Rosales Gabriel** | `220859`

---

### 📑 Fundamentos de Base de Datos
Dentro del esquema general del proyecto, nuestro equipo tiene la responsabilidad de definir y estructurar las siguientes entidades clave para el control de suministros e infraestructura:

| Prefijo | Nombre de la Tabla | Descripción del Fundamento |
| :--- | :--- | :--- |
| **tbd** | `Acceso` | Control y registro de entradas a áreas restringidas de recursos. |
| **tbc** | `Equipamientos` | Catálogo maestro de dispositivos médicos y mobiliario. |
| **tbc** | `Espacios` | Definición lógica de la infraestructura y áreas físicas. |
| **tbd** | `Inventario_Equipamientos` | Gestión de existencias, estados y trazabilidad de activos. |
| **tbb** | `Proveedores` | Directorio de entidades externas de suministro. |
| **tbb** | `Transacciones_Financieras` | Registro de movimientos económicos por adquisición de recursos. |
| **tbb** | `Personas_Morales` | Identificación legal y fiscal de socios comerciales. |

---

### 📁 Estructura del Repositorio
El módulo se organiza de la siguiente manera para facilitar su mantenimiento e integración:

```text
material-resources/
├── sql/
│   ├── ddl_schema.sql          # Definición de tablas y constraints
│   └── dml_initial_data.sql    # Carga de catálogos maestros (tbc)
├── docs/
│   ├── diccionario_datos.md    # Detalle de campos y tipos de datos
│   └── reglas_negocio.md       # Lógica de inventarios y accesos
├── diagrams/
│   └── erd_modulo_mr.png       # Diagrama Entidad-Relación
└── README.md                   # Guía principal del módulo (Este archivo)