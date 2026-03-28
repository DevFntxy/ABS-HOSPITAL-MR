DELIMITER //

-- ==========================================
-- TABLA 1: tbb_personas_morales
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_personas_morales_after_insert` AFTER INSERT ON `tbb_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una nueva persona moral con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_personas_morales_after_update` AFTER UPDATE ON `tbb_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la persona moral con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_personas_morales_after_delete` AFTER DELETE ON `tbb_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la persona moral con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 2: tbb_proveedores
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_proveedores_after_insert` AFTER INSERT ON `tbb_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo proveedor con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_proveedores_after_update` AFTER UPDATE ON `tbb_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el proveedor con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_proveedores_after_delete` AFTER DELETE ON `tbb_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado al proveedor con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 3: tbb_transacciones_financieras
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_transacciones_financieras_after_insert` AFTER INSERT ON `tbb_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una transacción con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_transacciones_financieras_after_update` AFTER UPDATE ON `tbb_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la transacción con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_transacciones_financieras_after_delete` AFTER DELETE ON `tbb_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la transacción con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 4: tbc_equipamientos
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_equipamientos_after_insert` AFTER INSERT ON `tbc_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo equipamiento con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_equipamientos_after_update` AFTER UPDATE ON `tbc_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el equipamiento con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_equipamientos_after_delete` AFTER DELETE ON `tbc_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el equipamiento con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 5: tbc_espacios
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_espacios_after_insert` AFTER INSERT ON `tbc_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo espacio con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_espacios_after_update` AFTER UPDATE ON `tbc_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el espacio con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_espacios_after_delete` AFTER DELETE ON `tbc_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el espacio con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 6: tbd_accesos
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_accesos_after_insert` AFTER INSERT ON `tbd_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo acceso con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_accesos_after_update` AFTER UPDATE ON `tbd_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el acceso con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_accesos_after_delete` AFTER DELETE ON `tbd_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el acceso con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 7: tbd_aprobaciones
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_aprobaciones_after_insert` AFTER INSERT ON `tbd_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una nueva aprobación con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_aprobaciones_after_update` AFTER UPDATE ON `tbd_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la aprobación con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_aprobaciones_after_delete` AFTER DELETE ON `tbd_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la aprobación con el ID:', OLD.id)
    );
END //

-- ==========================================
-- TABLA 8: tbd_inventario_equipamientos
-- ==========================================
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_inventario_equipamientos_after_insert` AFTER INSERT ON `tbd_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo registro en inventario con el ID:', NEW.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_inventario_equipamientos_after_update` AFTER UPDATE ON `tbd_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el registro de inventario con el ID:', OLD.id)
    );
END //

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_inventario_equipamientos_after_delete` AFTER DELETE ON `tbd_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el registro de inventario con el ID:', OLD.id)
    );
END //

DELIMITER ;