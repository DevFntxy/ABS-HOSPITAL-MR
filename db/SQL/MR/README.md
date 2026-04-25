# Modelo Relacional

## Descripción general
El presente Modelo Relacional representa la estructura lógica de la base de datos orientada a la administración de recursos materiales, pacientes, accesos físicos, proveedores y equipamiento.

---

# Objetivo del modelo
Centralizar y relacionar la información de:

- Pacientes
- Proveedores
- Control de accesos
- Equipamiento médico

---

# Justificación del diseño

##  1. Tabla `tbb_personas`

Se diseñó como entidad principal para almacenar información común de cualquier tipo de persona registrada en el sistema.

### Propósito:

Evitar duplicidad de datos generales como:

- RFC
- País de origen
- Fechas de registro
- Estatus medico

---

## 2. Especialización de personas

### `tbb_personas_fisicas`

Para personas naturales:

- Nombre
- Apellidos
- CURP
- Género
- Fecha de nacimiento
- Grupo sanguíneo

### `tbb_personas_morales`

Para organizaciones o empresas:

- Razón social
- Tipo de empresa
- Responsabilidad jurídica
- Patrimonio
- Capacidad jurídica

### Justificación:

Aplicación del modelo **supertipo-subtipo**, permitiendo manejar distintos tipos de entidades sin mezclar atributos incompatibles.

---

## 3. Tabla `tbb_pacientes`

Relacionada con personas físicas que son pacientes en el hospital.

### Propósito:

Registrar información médica específica:

- Estatus médico
- Estado de vida
- Última cita médica

### Justificación:

Separar datos médicos de los datos personales mejora:

- Seguridad
- Privacidad
- Escalabilidad clínica

---

## 4. Tabla `tbb_proveedores`

Relacionada con personas registradas.

### Propósito:

Administrar empresas o personas que suministran productos o servicios al hospital.

### Campos relevantes:

- Nombre
- Contacto
- Especialidad

### Justificación:

Permite gestionar adquisiciones y relaciones comerciales.

---

## 5. Tabla `tbc_espacios`

Representa áreas físicas del hospital.

### Ejemplos:

- Sala de urgencias
- Quirófano
- Laboratorio
- Consultorio

### Datos almacenados:

- Piso
- Capacidad
- Edificio
- Tipo de unidad física
- Encargado

### Justificación:

Esencial para logística hospitalaria y asignación de recursos.

---

## 6. Tabla `tbc_equipamientos`

Relacionada con:

- Proveedores
- Espacios físicos

### Propósito:

Registrar equipamiento médico como:

- Camas clínicas
- Monitores
- Rayos X
- Ventiladores

### Justificación:

Permite control patrimonial y ubicación de activos.

---

## 7. Tabla `tbd_accesos`

Controla entradas y autorizaciones.

### Relaciona:

- Persona que ingresa
- Espacio al que accede
- Personal que autoriza

### Justificación:

Fortalece seguridad institucional y trazabilidad.

---


# Nivel de normalización

El modelo cumple principalmente con:

### Primera Forma Normal (1FN):

- Campos atómicos
- Sin listas repetidas

### Segunda Forma Normal (2FN):

- Dependencia total de la clave primaria

### Tercera Forma Normal (3FN):

- Eliminación de dependencias transitivas principales

---

# Beneficios de este modelo

- Organización estructurada de información
- Escalable para nuevos módulos
- Reduce redundancia
- Facilita consultas complejas
- Compatible con la API hibrida SQL / NoSQL
