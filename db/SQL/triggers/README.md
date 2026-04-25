# Sistema de triggers de auditoría

## Descripción General

Este archivo contiene el conjunto de **triggers de auditoría** implementados en MySQL para registrar automáticamente las operaciones realizadas sobre distintas tablas del sistema hospitalario.

Cada trigger se ejecuta después de una acción de:

- Inserción (`AFTER INSERT`)
- Actualización (`AFTER UPDATE`)
- Eliminación (`AFTER DELETE`)

Al activarse, inserta un registro en la tabla:

```sql
tbi_bitacora