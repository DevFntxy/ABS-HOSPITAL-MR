# 🗄️ Documentación de Prompts - Base de Datos (MySQL)

Este documento registra los prompts utilizados para diseñar la arquitectura de la base de datos, procedimientos almacenados y las funciones de generación de datos sintéticos del hospital.

---

### 1. Generación de CURP Mexicano (Extracción de caracteres y Regex)
* **Contexto:** Para las pruebas de la base de datos, se requería poblar automáticamente la tabla de pacientes con CURPs sintéticos, pero realistas y validados, lo cual implica reglas complejas de extracción de letras internas de cadenas de texto.
* **Prompt Reconstruido:** > "Necesito crear una función en MySQL (`fn_generar_curp`) para generar un CURP mexicano ficticio. La función debe recibir nombre, apellidos, fecha de nacimiento y género. Debe armar la cadena de 18 caracteres extrayendo las iniciales, la primera vocal interna del primer apellido, las consonantes internas, y usar la entidad 'NE'. ¿Cómo puedo hacer la extracción de vocales y consonantes internas iterando sobre la cadena en MySQL?"
* **Respuesta de la IA:** Sugirió crear funciones auxiliares usando bucles `WHILE`, la función `SUBSTRING()` y expresiones regulares (`REGEXP '[B-DF-HJ-NP-TV-Z]'`) para identificar si un carácter específico era consonante o vocal.
* **Adaptación Humana:** Se modularizó el código creando funciones independientes (`fn_consonante_interna`, `fn_vocal_interna`) en lugar de hacer todo en un solo bloque gigante. Se implementó una lógica de "fallback" (retornar 'X') si no se encontraban consonantes internas, apegándose a las normas reales del gobierno para la generación del CURP.

---

### 2. Generación Probabilística y Distribución de Casos Médicos
* **Contexto:** En lugar de generar datos completamente aleatorios uniformes (donde cada estatus médico o género tuviera exactamente la misma posibilidad), se necesitaba simular una campana de distribución más realista para un entorno hospitalario (ej. más casos de diabetes, menos de trauma severo).
* **Prompt Reconstruido:** > "Quiero hacer una función en MySQL que devuelva un estatus médico aleatorio ('Diabético', 'Cardiacos', 'Cáncer', etc.), pero no quiero que todos tengan la misma probabilidad. Quiero que 'Diabético' salga el 35% de las veces, y 'Trauma craneoencefálico' solo el 10%. ¿Cuál es la forma más eficiente de calcular esto dentro de una función SQL determinística?"
* **Respuesta de la IA:** Propuso usar la función matemática `RAND()` para generar un número flotante entre 0 y 1, y luego utilizar una estructura de control `IF / ELSEIF` acumulativa (evaluando umbrales como `< 0.35`, `< 0.63`, etc.) para devolver el texto correspondiente.
* **Adaptación Humana:** Esta técnica ("Weighted Randomization") se estandarizó en el proyecto. Se utilizó como base para crear `fn_genera_estatus_medico`, `fn_generar_genero` (asignando porcentajes específicos a H, M y N/B) y `fn_genera_bandera_porcentaje` para permitir parametrizar la probabilidad enviando el porcentaje como argumento.

---

### 3. Selección Aleatoria de Catálogos Masivos (Diccionarios en memoria)
* **Contexto:** Se necesitaba generar miles de nombres y apellidos aleatorios de forma muy rápida. Crear tablas temporales o hacer un `ORDER BY RAND()` sobre una tabla física para sacar nombres iba a ser demasiado lento para inserciones masivas (lotes de 1000).
* **Prompt Reconstruido:** > "Necesito una función rápida en MySQL que devuelva un apellido al azar de una lista fija de 140 apellidos mexicanos. No quiero guardar esta lista en una tabla física de la base de datos para no afectar el rendimiento al hacer los joins de las inserciones masivas. ¿Cómo puedo embeber la lista directamente en la función y escoger uno al azar rápido?"
* **Respuesta de la IA:** Recomendó el uso de la función `ELT()`, la cual retorna la cadena en la posición indicada, combinada con `FLOOR(RAND() * 140) + 1` para calcular un índice dinámico.
* **Adaptación Humana:** Se crearon las funciones `fn_generar_apellido` y `fn_generar_nombre`. En el caso de los nombres, se anidó un bloque `CASE` para evaluar primero el parámetro `p_genero` y apuntar a diccionarios `ELT()` distintos según si se requería nombre masculino, femenino o neutro.

---

### 4. Generación de RFC y Normalización de Cadenas (`fn_generar_rfc`, `fn_limpiar_texto`)
* **Contexto:** Para generar la clave RFC de 13 caracteres de una persona física, se requieren las reglas oficiales: extraer letras específicas y la primera vocal interna del nombre y apellidos, concatenar la fecha (YYMMDD) y generar una homoclave aleatoria. El problema es que los nombres reales suelen incluir acentos o la letra "Ñ".
* **Prompt Reconstruido:** > "Necesito crear una función MySQL para generar el RFC de una persona física (13 caracteres). Sé que necesito extraer letras iniciales, la primera vocal interna, la fecha de nacimiento y una homoclave. Sin embargo, los nombres en mi base de datos pueden tener acentos o la letra 'Ñ'. ¿Cómo puedo hacer una función auxiliar que 'limpie' el texto antes de extraer las letras para el RFC, cambiando las vocales acentuadas por normales y la 'Ñ' por 'X'?"
* **Respuesta de la IA:** Propuso una función utilizando múltiples llamadas a la función `REPLACE()` de MySQL para sustituir cada vocal acentuada de forma individual, y luego estructuró el RFC con `SUBSTRING` y `DATE_FORMAT`.
* **Adaptación Humana:** Se separó estrictamente la responsabilidad de limpiar cadenas en la función `fn_limpiar_texto` (convirtiendo a mayúsculas, quitando acentos y sustituyendo "Ü" por "U" y "Ñ" por "X"). Al hacerla una función independiente, pudo ser reutilizada tanto por `fn_generar_rfc` como por `fn_generar_curp`. La homoclave se construyó dinámicamente usando `CHAR(FLOOR(65 + RAND()*26))` para simular letras aleatorias.

---

### 5. Asignación Lógica de Títulos por Edad y Género (`fn_generar_titulo`)
* **Contexto:** Para darle realismo a los registros médicos, se necesitaba que el tratamiento o título del paciente (Sr., Dra., Joven, etc.) tuviera coherencia con su edad y género, evitando resultados absurdos (como un paciente de 8 años con el título de "Doctor").
* **Prompt Reconstruido:** > "Estoy simulando datos de pacientes y necesito una función en MySQL que devuelva un 'título' o tratamiento de forma realista. Quiero que tome en cuenta la edad (`p_edad`) y el género (`p_genero`, donde 'M' es mujer y otro es hombre/neutro). Los menores de 12 deben ser 'Niño/Niña', entre 12 y 17 'Joven/Señorita', y los mayores de 23 deben tener una selección aleatoria de títulos profesionales (Ing., Lic., Dr., etc.) o formales (Sr., Sra.). ¿Cómo estructuro esta lógica condicional?"
* **Respuesta de la IA:** Devolvió una estructura utilizando bloques `IF / ELSE` para evaluar los rangos de edad, y condicionales anidados para separar las cadenas literales según el género proporcionado.
* **Adaptación Humana:** Se implementaron condicionales `IF` exactos para los rangos (<12, 12-17, 18-22, y adultos mayores de 23). Para el bloque de adultos, en lugar de asignar títulos genéricos, se integró la técnica de `ELT` combinada con `RAND()` para hacer una selección pseudoaleatoria entre 12 opciones profesionales muy específicas, como 'Enf.', 'QFB.', 'Psic.', 'Arq.', e incluso se agregó el tratamiento 'Mx.' para géneros no binarios, enriqueciendo drásticamente el conjunto de datos.

---

### 6. Abstracción Matemática de Rangos Aleatorios (`fn_numero_aleatorio_rangos`)
* **Contexto:** Diferentes áreas del simulador (como el cálculo de banderas booleanas o fechas de nacimiento) requerían generar números pseudoaleatorios dentro de ciertos límites. 
* **Prompt Reconstruido:** > "Me he dado cuenta de que en varios de mis scripts de MySQL tengo que calcular enteros aleatorios entre un mínimo y un máximo, y repito constantemente la fórmula con `RAND()` y `FLOOR()`. ¿Es recomendable encapsular esto en su propia función para mantener limpio el código de la base de datos?"
* **Respuesta de la IA:** Confirmó que encapsular esa lógica es una excelente práctica (DRY - Don't Repeat Yourself) y propuso la sintaxis para una función determinística que recibiera los parámetros `p_min` y `p_max`.
* **Adaptación Humana:** Se creó `fn_numero_aleatorio_rangos` utilizando la fórmula matemática `FLOOR(RAND() * (p_max - p_min + 1)) + p_min`. A partir de esta abstracción, utilidades secundarias como `fn_genera_bandera` (que calcula una probabilidad del 50/50) simplemente mandan llamar a esta función base.