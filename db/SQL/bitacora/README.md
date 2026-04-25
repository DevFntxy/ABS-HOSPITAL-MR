# Bitácora de seguridad y auditoría

## Descripción general

La base de datos cuenta con una **bitácora de auditoría** diseñada para registrar automáticamente las operaciones realizadas sobre las tablas principales del sistema.

Su función es mantener evidencia histórica de cambios, inserciones, consultas lógicas, modificaciones y eliminaciones, permitiendo trazabilidad sobre el uso de la información.

El registro se realiza mediante **triggers en MySQL**, los cuales ejecutan inserciones automáticas en la tabla de bitácora cada vez que ocurre una operación configurada.

---

# Objetivo de la bitácora

- Registrar acciones realizadas sobre los datos.
- Mantener historial de cambios.
- Fortalecer seguridad de la información.
- Facilitar auditorías técnicas.
- Detectar modificaciones no autorizadas.
- Apoyar mantenimiento y diagnóstico.

---

# Estructura de la tabla de bitácora

La tabla está compuesta por los siguientes campos:

| Campo | Descripción |
|------|-------------|
| ID | Identificador único del registro |
| nombre_tabla | Tabla afectada por la operación |
| usuario | Usuario que originó la acción |
| operacion | Tipo de acción realizada |
| descripcion | Detalle del evento |
| fecha_hora | Fecha del movimiento |

---


# Funcionamiento mediante triggers

Cada tabla relevante del sistema contiene triggers asociados a eventos como:

```sql id="n1"
AFTER INSERT
AFTER UPDATE
AFTER DELETE
```