# Proyecto - Plataforma Administrativa Hospitalaria
### Módulo Material Resources (MR) - IDENTIDAD GRÁFICA

<p align="justify">La identidad gráfica del Módulo de Recursos Materiales (MR) transmite orden, seguridad y eficiencia. Sus elementos visuales están diseñados para reflejar la solidez necesaria en la gestión de activos hospitalarios, garantizando confianza en el control del equipamiento médico y la infraestructura.</p>

## LOGOTIPOS

<table>
  <tr>
    <td align="center">Logo Material Resources (MR)</td>
  </tr>
  <tr>
    <td align="center"><img src="/Image/MR_Logo.png" alt="Logo Material Resources" width="300" style="padding: 10px;" /></td>
  </tr>
</table>

### DESCRIPCIÓN

<p align="justify">El Módulo Material Resources (MR) es el componente encargado de diseñar y estructurar los cimientos de la gestión de activos y recursos del hospital. Su propósito principal es garantizar un control preciso sobre el equipamiento, los suministros y la infraestructura mediante una base de datos centralizada, haciendo posible una atención médica ininterrumpida y eficiente.</p>

---

### PLANTEAMIENTO DEL PROBLEMA

<p align="justify">En la administración hospitalaria, la gestión empírica o fragmentada de los recursos materiales, proveedores y espacios físicos suele generar pérdidas económicas, desabasto de suministros críticos y falta de trazabilidad en los equipos médicos. Sin una estructura de datos estandarizada, resulta difícil rastrear las transacciones financieras, controlar el acceso a áreas restringidas o conocer el estado y ubicación exacta del inventario de equipamiento.<br><br>
Esta situación afecta directamente la calidad operativa del hospital y reduce la capacidad de respuesta del personal médico ante emergencias. Existe una necesidad imperativa de contar con un núcleo de datos central que estructure todas estas entidades logísticas y operativas de manera ordenada.</p>

---

### PROPUESTA DE SOLUCIÓN

<p align="justify">En respuesta a los desafíos de administración interna del hospital, proponemos el diseño y desarrollo de la base de datos del Módulo MR. Esta plataforma integral definirá la estructura relacional (Entidades, Catálogos y Detalles) para gestionar de forma eficiente los recursos materiales. Principalmente, estandarizará la información de proveedores, finanzas, espacios y existencias, preparándose para ser integrada con los demás módulos del sistema hospitalario.</p>

---

### OBJETIVO GENERAL

<p align="justify">Diseñar y estructurar la base de datos del Módulo de Recursos Materiales (MR) para garantizar un control preciso, centralizado y trazable sobre los activos, proveedores, espacios físicos e inventarios del hospital.</p>

---

### OBJETIVOS ESPECÍFICOS

<p align="justify"><strong>Gestión de Proveedores:</strong> Estructurar la identificación legal y fiscal (Personas Morales) junto con un directorio completo de entidades externas de suministro.</p>

<p align="justify"><strong>Control Financiero:</strong> Implementar un registro detallado de las transacciones financieras y movimientos económicos derivados de la adquisición de recursos.</p>

<p align="justify"><strong>Mapeo de Infraestructura:</strong> Definir lógicamente los espacios y áreas físicas del hospital para una mejor distribución del equipamiento.</p>

<p align="justify"><strong>Catálogo y Trazabilidad:</strong> Desarrollar un catálogo maestro de dispositivos médicos y gestionar el inventario de equipamientos, controlando sus existencias y estados.</p>

<p align="justify"><strong>Control de Seguridad:</strong> Establecer una estructura para el registro y control de accesos a las áreas restringidas de recursos.</p>

---

### DIAGRAMA DE GANTT

*(Nota: Agrega la ruta de la imagen de tu diagrama de planificación aquí)*
<img src="/Image/Diagrama de Gant MR.png" width="80%" style="padding: 10px;" />

---

### TABLA DE COLABORADORES

## Equipo MR

| Integrante | Matrícula | Rol en el Equipo |
| :--- | :--- | :--- |
| Erick Matias Granillo Mejía | `230045` | Diseño y Estructura de BD |
| Diego Miguel Rivera Chavez | `230260` | Diseño y Estructura de BD |
| José Arturo Garcia Gonzalez | `230629` | Diseño y Estructura de BD |
| Derek Sesni Careño | `230892` | Diseño y Estructura de BD |
| Mauricio Rosales Gabriel | `220859` | Diseño y Estructura de BD |

---

### ORGANIGRAMA DEL EQUIPO

*(Nota: Agrega la ruta de la imagen de tu organigrama aquí)*
<img src="/Image/Organigrama.png" width="80%" style="padding: 10px;" />

---

### FUNDAMENTOS DE BASE DE DATOS

Dentro del esquema general del proyecto, nuestro equipo tiene la responsabilidad de definir y estructurar las siguientes entidades clave:

| Prefijo | Nombre de la Tabla | Descripción del Fundamento |
| :--- | :--- | :--- |
| **tbb** | `Personas_Morales` | Identificación legal y fiscal de socios comerciales. |
| **tbb** | `Proveedores` | Directorio de entidades externas de suministro. |
| **tbb** | `Transacciones_Financieras` | Registro de movimientos económicos por adquisición de recursos. |
| **tbc** | `Equipamientos` | Catálogo maestro de dispositivos médicos y mobiliario. |
| **tbc** | `Espacios` | Definición lógica de la infraestructura y áreas físicas. |
| **tbd** | `Accesos` | Control y registro de entradas a áreas restringidas de recursos. |
| **tbd** | `Inventario_Equipamientos` | Gestión de existencias, estados y trazabilidad de activos. |

---

### ESTADO DEL REPOSITORIO

Este repositorio contiene actualmente la **fase de planificación y diseño**. Este contenido será clonado e integrado con los demás módulos para conformar el núcleo de datos central de la plataforma.

> **Aviso de Integración:** Se ha respetado la nomenclatura estandarizada para facilitar el merge con los módulos de otros equipos.

---

### LISTA DE TECNOLOGÍAS

<p align="justify">

*⚙️ Base de Datos y Modelado:*
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Draw.io](https://camo.githubusercontent.com/673b232f74b56171445a2c43adf92a9b9340feef837f5dc1fb9c267d16f8c69a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f447261772e696f2d4630383730353f7374796c653d666f722d7468652d6261646765266c6f676f3d6469616772616d732e6e6574266c6f676f436f6c6f723d7768697465)

*📄 Gestión y Documentación:*
![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

</p>