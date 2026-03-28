# Schemas — Validación y Estructura de Datos

Este módulo define los modelos de datos utilizando **Pydantic**, encargados de:

- Validar las solicitudes (request)
- Estructurar las respuestas (response)
- Documentar automáticamente el API en Swagger

---

## Descripción general

Los schemas están organizados en:

- **Schemas de entrada** → datos enviados al endpoint
- **Schemas de respuesta** → datos devueltos por la API

El endpoint principal es un sistema híbrido que interactúa con:

- MySQL (mediante Stored Procedures)
- MongoDB (colecciones NoSQL)

---

# Schemas de entrada

## `ProveedorSchema`

Representa la tabla `tbb_Proveedores`.

| Campo | Tipo | Descripción |
|------|-----|------------|
| id_persona | int | FK a Personas (opcional) |
| nombre | str | Nombre del proveedor |
| contacto | str | Medio de contacto |
| especialidad | str | Área de especialización |

Todos los campos son opcionales  
Si son `NULL`, el SP genera valores automáticamente

---

## `TransaccionSchema`

Representa la tabla `tbb_Transacciones_Financieras`.

| Campo | Tipo | Descripción |
|------|-----|------------|
| tipo_transaccion | str | Tipo de transacción |
| fecha_transaccion | datetime | Fecha de la operación |
| referencia | str | Folio o identificador |

Valores válidos:

- `Compra`
- `Pago`
- `Devolucion`
- `Ajuste`

---

## `EquipamientoSchema`

Representa la tabla `tbc_Equipamientos`.

| Campo | Tipo | Descripción |
|------|-----|------------|
| espacio_id | int | FK a espacios |
| nombre | str | Nombre del equipo |
| marca | str | Marca del equipo |

Todos los campos son opcionales  
Se generan automáticamente si son NULL

---

## `SpecsSchema` (MongoDB)

Representa documentos en la colección:

```text
equipamientos_specs