## Respaldo NoSQL (MongoDB)

Este proyecto utiliza MongoDB para almacenar información de especificaciones de equipamiento en la colección:

- `equipamientos_especificaciones`

El respaldo NoSQL se realiza mediante la herramienta `mongodump` para exportar los datos de MongoDB en formato BSON (binario) incluyendo metadatos como índices.


#### Requisitos

- MongoDB instalado
- MongoDB Database Tools (`mongodump`, `mongorestore`)

---

#### Respaldo

Respaldo de la base completa

```mongodump --db hospital_230260_nosql --out ./backup```
