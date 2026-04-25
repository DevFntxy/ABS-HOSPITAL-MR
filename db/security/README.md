# 🔐 Seguridad: Roles y Privilegios de Base de Datos

**Módulo:** Control de Accesos (MySQL & MongoDB)  
**Ruta:** `/db/security/`

---

## 📖 Descripción General

Este directorio gestiona los **usuarios, roles y control de accesos** para las bases de datos del sistema. Todo el esquema está diseñado bajo el **Principio de Menor Privilegio**, garantizando que cada perfil (usuario o microservicio) tenga acceso estrictamente a lo que necesita, protegiendo así la información crítica del hospital.

## 📂 Archivo Principal

En la raíz de esta carpeta se encuentra el documento central que contiene todas las sentencias de ejecución:

👉 **`CREATE USERS-PRIVILEGIOS.txt`**

*(Este archivo incluye los scripts detallados para la creación de usuarios, así como la asignación y revocación de permisos).*

---

## 🎯 Objetivos del Esquema
- **Protección:** Evitar la exposición o modificación no autorizada de datos sensibles.
- **Control granular:** Asignar permisos exactos (Lectura, Escritura, Ejecución, Administración) según el rol operativo.
- **Trazabilidad:** Asegurar que cada transacción esté vinculada a un usuario debidamente autenticado.

## 📑 Gestión por Entorno

- **🐬 MySQL (Relacional):** Utiliza sentencias `GRANT` y `REVOKE` para limitar o habilitar accesos a tablas y vistas específicas según el perfil (ej. `admin_mr`, `user_lectura`).
- **🍃 MongoDB (No Relacional):** Implementa Control de Acceso Basado en Roles (RBAC), asignando roles integrados o personalizados (ej. `read`, `readWrite`, `dbAdmin`) a nivel de clúster o colección.

---

> **⚠️ Advertencia de Seguridad:** > Nunca suba contraseñas en texto plano a este repositorio. Utilice *placeholders* (ej. `[PASSWORD_HERE]`) en los scripts locales. La asignación de credenciales para producción debe ser gestionada exclusivamente de forma interna por el Administrador de Base de Datos (DBA).