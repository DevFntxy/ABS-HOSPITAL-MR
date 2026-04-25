# 📄 Documentación de Prompts - Requerimientos y Reglas de Negocio

Este documento detalla los prompts utilizados para estructurar y redactar la documentación técnica del **Módulo Material Resources (MR)**, incluyendo los Requerimientos Funcionales (FRs), No Funcionales (NFRs) y las Reglas de Negocio (BRs).

---

### 1. Requerimientos Funcionales (FRs)
* [cite_start]**Contexto:** Se necesitaba definir qué debe hacer el sistema, estableciendo las operaciones básicas (CRUD) que servirían de guía para estructurar la base de datos[cite: 10, 11].
* **Prompt Reconstruido:** > "Actúa como analista de sistemas. Redacta los Requerimientos Funcionales para un módulo hospitalario de recursos materiales. Necesito que cubras el registro de proveedores, áreas físicas, catálogo médico, control de activos, finanzas y control de acceso."
* **Respuesta de la IA:** Propuso una lista general de funciones para la administración de un hospital, con flujos de trabajo estándar para inventarios.
* [cite_start]**Adaptación Humana:** Se modificaron los textos para que hicieran referencia explícita a las tablas que se iban a construir, nombrando directamente a `Personas_Morales` y `Proveedores` [cite: 11], `Espacios` [cite: 12], `Equipamientos` [cite: 13], `Inventario_Equipamientos` [cite: 15][cite_start], `Transacciones_Financieras` [cite: 16] y `Accesos`[cite: 17]. [cite_start]Para el control de inventario, se definieron manualmente los estados exactos permitidos: 'Operativo', 'En uso', 'Mantenimiento', 'Almacenado' y 'Baja'[cite: 15].

---

### 2. Requerimientos No Funcionales (NFRs)
* [cite_start]**Contexto:** Había que definir cómo debe comportarse el sistema en cuanto a calidad, rendimiento, integración y la seguridad de los datos[cite: 19].
* **Prompt Reconstruido:** > "Genera los Requerimientos No Funcionales (NFRs) para la base de datos de este módulo. Enfócate en cómo debe integrarse con otros módulos, la privacidad de datos, el registro de auditoría de los activos y la escalabilidad de las tablas transaccionales."
* **Respuesta de la IA:** Devolvió un estándar genérico sobre normativas de ciberseguridad, tiempos de respuesta de milisegundos y logs de actividad del sistema.
* [cite_start]**Adaptación Humana:** El equipo descartó la generalidad y obligó el uso de una nomenclatura estandarizada propia (prefijos `tbb`, `tbc`, `tbd`) para asegurar que el Módulo MR pudiera integrarse sin conflictos con áreas como Recursos Humanos o Área Clínica[cite: 20]. [cite_start]También se detalló que el registro de auditoría debía quedar plasmado estrictamente en la tabla `tbi_bitacora`[cite: 22].

---

### 3. Reglas de Negocio (BRs)
* [cite_start]**Contexto:** Era vital establecer políticas operativas y restricciones inquebrantables del hospital, las cuales el sistema debe hacer cumplir de forma obligatoria y que guiarían la construcción del modelo Entidad-Relación[cite: 2].
* **Prompt Reconstruido:** > "Redacta las Reglas de Negocio (BRs) restrictivas para la base de datos. Debes establecer reglas lógicas sobre: que un equipo no pueda estar en dos lugares, que todo proveedor deba ser una empresa legal, que las áreas de alta seguridad tengan restricciones de entrada, y que no pueda haber equipos ingresados al sistema sin un costo de adquisición registrado."
* **Respuesta de la IA:** Creó un conjunto de políticas administrativas enfocadas en el recurso humano y manuales de operación hospitalaria.
* **Adaptación Humana:** Las políticas se mapearon directamente a las restricciones lógicas y llaves foráneas del sistema relacional. [cite_start]Se determinó que un activo en `Inventario_Equipamientos` solo puede estar asignado a un registro de `Espacios`[cite: 5]. Se forzó el requisito de tener un identificador fiscal activo en `Personas_Morales` para interactuar con las `Transacciones_Financieras` [cite: 4], se restringió la creación de `Accesos` a áreas de "Alta Seguridad" [cite: 7], y se garantizó la trazabilidad exigiendo que todo ingreso a `Inventario_Equipamientos` se vincule a `Transacciones_Financieras`[cite: 8].