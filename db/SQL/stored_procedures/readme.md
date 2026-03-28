# Procedimiento Almacenado - `sp_poblar_pacientes`

## 📋 Descripción General

El procedimiento almacenado `sp_poblar_pacientes` es el componente central de la automatización de generación de datos de pacientes. Coordina la invocación de todas las funciones auxiliares para crear registros completos y coherentes de pacientes médicos en la base de datos.

Este procedimiento actúa como **orquestador principal** que:
* Genera datos aleatorios pero realistas (Nombres, CURP, RFC).
* Inserta registros en múltiples tablas relacionadas manteniendo la integridad referencial.
* Maneja transacciones por lotes (**Batch Processing**) para optimizar el rendimiento.
* Valida estrictamente los parámetros de entrada.

## 🛠️ Información del Procedimiento

* **Nombre:** `sp_poblar_pacientes`
* **Tipo:** Procedimiento Almacenado (PROCEDURE)
* **Definer:** `root@localhost`
* **Ubicación:** `db/routines/procedimiento/sp_poblar_pacientes.sql`

## 📥 Parámetros de Entrada

El procedimiento acepta **6 parámetros** que controlan el comportamiento de la generación de datos:

| Parámetro | Tipo | Descripción | Obligatorio | Ejemplo |
| :--- | :--- | :--- | :--- | :--- |
| `p_cantidad` | `INT` | Número de pacientes a generar. | ✅ Sí | 1000 |
| `p_genero` | `VARCHAR(3)` | Género específico (H, M, N/B) o NULL para aleatorio. | ❌ No | "M" |
| `p_edad_min` | `INT` | Edad mínima de pacientes a generar. | ❌ No | 18 |
| `p_edad_max` | `INT` | Edad máxima de pacientes a generar. | ❌ No | 85 |
| `p_estatus_vida` | `VARCHAR(20)` | Estatus de vida del paciente. | ❌ No | "Vivo" |
| `p_estatus_medico`| `VARCHAR(150)`| Estatus médico del paciente. | ❌ No | "Estable" |

**Valores por Defecto:**
* `p_edad_min` → 0 (si es NULL o negativo).
* `p_edad_max` → 100 (si es NULL o mayor a 120).

## 🔄 Flujo de Ejecución

### 1. Inicialización y Validación
Se verifica que el género sea válido (`H`, `M`, `N/B`). Se ajustan los rangos de edad y se valida que la cantidad sea mayor a cero. Finalmente, se abre la transacción inicial.

### 2. Bucle de Generación
Para cada iteración (hasta alcanzar `p_cantidad`):

**a) Generar datos personales**
Se calcula la edad aleatoria dentro del rango y se obtiene la fecha de nacimiento. Se determina el género y se invocan funciones para obtener nombre y apellidos. 
> *Nota: Se incluye una lógica de **máximo 5 intentos** para asegurar que el primer y segundo apellido sean diferentes.*

**b) Insertar en tabla `tbb_personas`**

Registra la entidad base, genera el RFC mediante función y asigna el país de origen.

**c) Insertar en tabla `tbb_personas_fisicas`**
Recupera el ID generado anteriormente (`LAST_INSERT_ID()`). Almacena el título de cortesía, CURP, género y grupo sanguíneo.

**d) Insertar en tabla `tbb_pacientes`**
Registra la información clínica: estatus médico, estatus de vida y marca la fecha de registro y actualización.

### 3. Control de Transacciones por Lotes
* **`v_batch_size` = 1000**: Cada 1,000 registros insertados, el procedimiento ejecuta un `COMMIT` y reinicia la transacción.
* **Ventaja**: Optimiza el uso del log de transacciones y mejora la velocidad en cargas masivas.

### 4. Finalización
Se confirma la última transacción pendiente y se cierra el ciclo. En caso de error, el `EXIT HANDLER` realiza un `ROLLBACK` y devuelve el mensaje de error.

---

## 🧩 Funciones Auxiliares Utilizadas

El procedimiento depende de las siguientes funciones:

| Función | Propósito |
| :--- | :--- |
| `fn_generar_genero()` | Genera género aleatorio si no se especifica. |
| `fn_generar_nombre()` | Genera nombre acorde al género. |
| `fn_generar_apellido()`| Genera apellidos aleatorios. |
| `fn_generar_curp()` | Genera CURP basado en datos demográficos. |
| `fn_generar_rfc()` | Genera RFC basado en datos demográficos. |
| `fn_generar_pais()` | Asigna país de origen aleatorio. |
| `fn_generar_titulo()` | Asigna título (Sr., Sra., etc.) según edad y género. |
| `fn_grupo_sanguineo()`| Asigna grupo sanguíneo. |

---

## 💾 Tablas Destino

1.  **`tbb_personas`**: Tabla principal de identidad.
2.  **`tbb_personas_fisicas`**: Detalles demográficos y documentos (CURP/RFC).
3.  **`tbb_pacientes`**: Información clínica y estatus de salud.

---

## 🚀 Ejemplos de Uso

**Ejemplo 1: Generar 1,000 pacientes aleatorios**
```sql
CALL sp_poblar_pacientes(1000, NULL, NULL, NULL, NULL, NULL);