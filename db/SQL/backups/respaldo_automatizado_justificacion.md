## Sistema de Respaldo Periódico MySQL

#### Descripción

Este script automatiza la creación de respaldos periódicos de la base de datos utilizando `mysqldump`.

Cada vez que se ejecuta, genera un archivo `.sql` con fecha y hora en el nombre, asi se conservan múltiples versiones del respaldo para facilita la recuperación de los datos.

Este metodo está pensado para proteger la información ante fallos del sistema, errores humanos, corrupción de datos o pérdida accidental.

---

#### Archivo utilizado: 
respaldo_automatizado.bat