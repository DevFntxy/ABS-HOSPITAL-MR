# 👾 Funciones (`fn_*.sql`)

Este directorio contiene un conjunto de funciones MySQL utilizadas para generar y limpiar datos sintéticos, principalmente en el contexto del proyecto de hospital (ABD-HOSPITAL-MR). Las funciones están organizadas con prefijo `fn_` y se denominan de acuerdo con su propósito. A continuación se ofrece una breve descripción de cada una.

---

## ✍️ Generadores de datos aleatorios

* **`fn_numero_aleatorio_rangos(p_min, p_max)`**
  - Retorna un entero pseudoaleatorio entre `p_min` y `p_max` (inclusive).
  - Utiliza la fórmula `FLOOR(RAND() * (p_max - p_min + 1)) + p_min`.

* **`fn_genera_bandera()`**
  - Devuelve un valor booleano (`TINYINT(1)`) con probabilidad aproximadamente 50/50.
  - Internamente llama a `fn_numero_aleatorio_rangos`.

* **`fn_genera_estatus_medico()`**
  - Genera un estado médico aleatorio según una distribución definida (Diabetico, Cardiacos, Cancer, Cuidados paliativos, Trauma craneoencefalico).
  - Utiliza un número aleatorio y rangos acumulados.

* **`fn_grupo_sanguineo()`**
  - Retorna un grupo sanguíneo (`O+`, `A+`, `O-`, `B+`, `AB+`, `A-`, `B-`, `AB-`) con probabilidades realistas.

* **`fn_genera_fecha_nacimiento()`**
  - Crea una fecha de nacimiento aleatoria entre 1950-01-01 y 2005-12-31.
  - Calcula desplazamientos en días respecto a una fecha base (1900-01-01).

* **`fn_generar_pais()`**
  - Devuelve un país aleatorio tomando en cuenta una distribución (México 78%, USA 15%, Canadá 3%, Colombia 2%, Argentina 2%).

* **`fn_generar_genero()`**
  - Genera un código de género (`N/B`, `M`, `H`) basado en probabilidades predefinidas.

* **`fn_generar_nombre(p_genero)`**
  - Devuelve un nombre escogido aleatoriamente de listados de 100 nombres para hombre (`H`), mujer (`M`) o neutro/otro.

* **`fn_generar_apellido()`**
  - Selecciona un apellido aleatorio de un catálogo de 140 apellidos comunes en México.

* **`fn_generar_titulo(p_genero, p_edad)`**
  - Cálculo de título/tratamiento (Sr., Sra., Dr., Niña, Niño, etc.) basado en género y edad.

* **`fn_generar_rfc(p_nombre, p_apellido1, p_apellido2, p_fecha)`**
  - Genera una clave RFC estilo persona física de 13 caracteres.
  - Utiliza las reglas oficiales (primeras letras y vocal interna, fecha YYMMDD, homoclave aleatoria).

* **`fn_generar_curp(p_nombre,p_apellido1,p_apellido2,p_fecha,p_genero)`**
  - Crea una CURP simplificada de 18 caracteres según normas del gobierno mexicano.
  - Combina iniciales, fecha, género, entidad (`NE`) y consonantes internas.

---

## 🌐Utilerías

* **`fn_limpiar_texto(p_texto)`**
  - Normaliza cadenas: convierten a mayúsculas, eliminan acentos, sustituyen "Ü" → "U" y "Ñ" → "X".
  - Es empleada por varias funciones de generación de identificadores.

* **`fn_consonante_interna(p_texto)`**
  - Extrae la primera consonante interna (no la primera letra) de un texto ya limpiado.
  - Regresa `'X'` si no encuentra ninguna.
  - Usa `fn_limpiar_texto` internamente.

---

## Uso y mantenimiento

Cada función está definida con el privilegio `DEFINER=root@localhost` y generalmente se marca como `DETERMINISTIC` salvo algunas con componentes aleatorios. Se recomienda revisar y actualizar las distribuciones o catálogos si cambian los requisitos del simulador de datos.

Para incorporar nuevas funciones, mantenga el prefijo `fn_` y describa claramente en este README su propósito y parámetros.
