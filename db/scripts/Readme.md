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

📑 Entidades y Fundamentos de Base de Datos  

| Prefijo | Nombre de la Tabla               | Fundamento |
|--------|---------------------------------|------------|
| tbb | Personas_Morales | Identificación legal y fiscal de socios comerciales y proveedores. |
| tbb | Proveedores | Directorio de entidades externas encargadas del suministro de recursos. |
| tbb | Transacciones_Financieras | Registro de movimientos económicos relacionados con la adquisición de recursos. |
| tbc | Equipamientos | Catálogo maestro de dispositivos médicos, mobiliario y activos físicos. |
| tbc | Espacios | Definición lógica de la infraestructura y áreas físicas del hospital. |
| tbd | Accesos | Control y registro de entradas a áreas restringidas de recursos materiales. |
| tbd | Aprobaciones | Gestión de autorizaciones administrativas relacionadas con recursos e infraestructura. |
| tbd | Inventario_Equipamientos | Control de existencias, estados operativos y trazabilidad de activos. |

---

🧠 Enfoque del Diseño  

- Separación clara entre datos base (`tbb`), catálogos (`tbc`) y datos dinámicos (`tbd`)
- Normalización orientada a integridad referencial
- Compatibilidad con esquemas de roles y privilegios
- Preparación para auditoría, control y escalabilidad
- Alineación con la integración modular del sistema hospitalario

---

🚀 Estado del Repositorio  

**Fase actual:** Planificación y diseño  

Este repositorio contiene el diseño estructural del módulo MR y será **clonado e integrado** con los demás módulos para conformar el **núcleo central de datos de la Plataforma Administrativa Hospitalaria**.

**Aviso de Integración:**  
Se ha respetado la **nomenclatura estandarizada de tablas y prefijos**, facilitando el *merge* con los módulos desarrollados por otros equipos.
