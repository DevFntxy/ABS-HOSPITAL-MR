# 📡 Documentación de Prompts - API Híbrida (FastAPI)

Este documento registra los prompts utilizados para estructurar, optimizar y refactorizar el código backend de la API del hospital, la cual se conecta simultáneamente a MySQL y MongoDB.

---

### 1. Configuración de Conexiones concurrentes (MySQL Síncrono + Mongo Asíncrono)
* **Contexto:** Se necesitaba una forma eficiente de manejar las conexiones a dos bases de datos distintas. `pymysql` es bloqueante (síncrono), mientras que `motor` es asíncrono. Bloquear el hilo principal en FastAPI afectaría el rendimiento.
* **Prompt Reconstruido:** > "Tengo un proyecto en FastAPI. Necesito configurar las dependencias para conectarme a MySQL y a MongoDB. Para MySQL estoy usando `pymysql` (que es síncrono) y para MongoDB usaré `motor` (asíncrono). ¿Cómo puedo estructurar mis archivos `dependencies.py` y `main.py` para manejar las conexiones correctamente sin bloquear el event loop de FastAPI al consultar MySQL, y manteniendo una única conexión global para Mongo?"
* **Respuesta de la IA:** Sugirió el uso de `yield` para manejar la apertura y cierre de la conexión MySQL por cada request. Para MongoDB, recomendó inicializar el cliente en el evento de inicio de la aplicación para compartirlo en el estado general (`app.state`). Además, propuso envolver las llamadas de MySQL en `run_in_threadpool`.
* **Adaptación Humana:** Se implementó el manejador de contexto `@asynccontextmanager` (`lifespan`) en `main.py` en lugar de los eventos obsoletos `@app.on_event("startup")` que sugirió inicialmente la IA. Las credenciales se movieron a un módulo seguro `core.config`.

---

### 2. Ejecución de Stored Procedures con Parámetros OUT y Consumo de ResultSets
* **Contexto:** El endpoint de adquisición requería llamar a `sp_adquisicion_equipamiento`, el cual realiza inserciones en lotes y retorna variables `OUT` (como los IDs generados). Pymysql tiene problemas conocidos al manejar `OUT params` directamente y lanzar errores de sincronización de comandos.
* **Prompt Reconstruido:** > "Necesito ejecutar un procedimiento almacenado en MySQL usando `pymysql` desde FastAPI. El SP se llama `sp_adquisicion_equipamiento`, recibe varios parámetros y devuelve 4 valores de salida (OUT). Al intentarlo, me da un error de 'Commands out of sync'. ¿Cómo puedo consumir correctamente los resultados pendientes del SP y recuperar las variables OUT generadas?"
* **Respuesta de la IA:** Explicó que el error ocurre porque los SP a veces devuelven múltiples resultados silenciosos (result sets). Sugirió hacer un bucle con `cursor.nextset()` para vaciar la cola antes de intentar leer los parámetros de salida, y luego hacer un `SELECT` a las variables de sesión de MySQL (`@_sp_nombre_param`).
* **Adaptación Humana:** Se encapsuló la lógica de limpieza en `[cursor.nextset() for _ in range(10)]` ejecutado dentro de un `run_in_threadpool` para evitar bloqueos. Se tipó fuertemente el retorno utilizando el esquema de Pydantic `ResultadoMySQL`.

---

### 3. Inserción Masiva en MongoDB (Batch Processing)
* **Contexto:** Por cada registro insertado en MySQL, se debía crear su respectivo documento de especificaciones técnicas en MongoDB. Si el SP insertaba 50,000 registros, mandar a MongoDB esa misma cantidad de un solo golpe saturaba la memoria RAM de la API.
* **Prompt Reconstruido:**
  > "Tengo una lista con miles de registros de especificaciones médicas que debo insertar en MongoDB usando Motor (`motor_asyncio`). Si uso `insert_many` con todos los documentos al mismo tiempo, el servidor se queda sin memoria. ¿Cómo puedo optimizar la función `insertar_specs_mongo` para que procese e inserte los datos en lotes (chunks) de tamaño manejable?"
* **Respuesta de la IA:** Sugirió dividir la lista principal en sub-listas utilizando un bucle `for` con un rango y un `step`, insertando cada bloque secuencialmente con `insert_many`.
* **Adaptación Humana:** Se refactorizó la lógica generada por la IA para no crear la lista gigante en memoria en primer lugar. En lugar de iterar sobre una lista existente, se creó la función interna `build_doc(i)` que genera los diccionarios al vuelo ('on the fly') estrictamente según el `BATCH_SIZE` configurado (5000), liberando la memoria con `del lote` tras cada inserción iterativa.

---

### 4. Documentación Automática Swagger (Docstrings)
* **Contexto:** Se necesitaba que el dashboard interactivo de Swagger (`/docs`) mostrara de manera legible qué parámetros opcionales y válidos aceptaban los endpoints, sin tener que saturar los modelos de Pydantic con descripciones excesivas.
* **Prompt Reconstruido:** > "Genera la ruta POST `/recursos-materiales/adquisicion-equipamiento` en FastAPI. Agrega un docstring en formato Markdown detallado debajo de la definición de la función para que Swagger lo renderice. Debe explicar que parámetros como 'transaccion', 'proveedor' y 'equipamiento' son opcionales, y especificar qué valores son válidos para campos como 'tipo_transaccion'."
* **Respuesta de la IA:** Retornó la estructura básica del router con el bloque de triple comilla `"""` formateado con viñetas y negritas.
* **Adaptación Humana:** Se ajustaron los textos a español técnico y se añadió la inyección de dependencias `MySQLDep` y la obtención de `mongo_db` mediante `http_request` para mantener limpia la capa de enrutamiento, delegando la ejecución a la capa `crud`.