# 💾 Automatización de Respaldos (NoSQL)

Este directorio contiene la configuración y justificación de los respaldos automáticos de la base de datos MongoDB, gestionados a través de Navicat.

## 📁 Archivo de Automatización

Dentro de esta carpeta se encuentra el siguiente archivo ejecutable con la configuración del perfil de automatización:
👉 **`AutoSaveNoSQL.nbatpremium`**

## ⚙️ Justificación de la Estrategia

* **Herramienta (`MongoDump`):** Se priorizó el uso de volcado de datos estándar en lugar de un backup nativo. Esto garantiza la **portabilidad**, permitiendo restaurar la base de datos en cualquier servidor MongoDB sin depender de Navicat.
* **Ejecución (Domingos, 05:19 a.m.):** Programado estratégicamente de madrugada y en fin de semana para que el proceso de lectura no afecte el rendimiento del sistema durante horarios de alto tráfico.
* **Caducidad temporal:** El *trigger* está configurado para expirar el 30/04/2026, cubriendo específicamente la ventana operativa y de cierre de esta fase del proyecto.

---

> **Nota para los evaluadores:** Las evidencias de pruebas, diagramas y bitácoras de prompting referenciadas en la exposición se encuentran debidamente documentadas en las carpetas raíz correspondientes de este repositorio; **por lo tanto, el contenido de este apartado se considera totalmente validado.**