CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adquisicion_equipamiento`(
    IN  p_cantidad              INT,
    IN  p_id_persona            INT,
    IN  p_nombre                VARCHAR(100),
    IN  p_contacto              VARCHAR(50),
    IN  p_especialidad          VARCHAR(100),
    IN  p_tipo_transaccion      VARCHAR(20),
    IN  p_fecha_transaccion     DATETIME,
    IN  p_referencia            VARCHAR(100),
    IN  p_espacio_id            INT,
    IN  p_nombre_equipo         VARCHAR(100),
    IN  p_marca                 VARCHAR(50),

    OUT p_registros_insertados  INT,
	OUT p_ultimo_id_proveedor   INT,
	OUT p_ultimo_id_transaccion INT,
	OUT p_ultimo_id_equipamiento INT
)
BEGIN
    DECLARE v_i           INT DEFAULT 1;
    DECLARE v_lote_actual INT DEFAULT 0;

    DECLARE v_id_persona        INT;
    DECLARE v_nombre            VARCHAR(100);
    DECLARE v_contacto          VARCHAR(50);
    DECLARE v_especialidad      VARCHAR(100);
    DECLARE v_tipo_transaccion  VARCHAR(20);
    DECLARE v_fecha_transaccion DATETIME;
    DECLARE v_referencia        VARCHAR(100);
    DECLARE v_espacio_id        INT;
    DECLARE v_nombre_equipo     VARCHAR(100);
    DECLARE v_marca             VARCHAR(50);
    DECLARE v_id_proveedor      INT;
    DECLARE v_id_transaccion    INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET p_registros_insertados = 0;
    IF p_cantidad < 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'p_cantidad debe ser mayor o igual a 1';
    END IF;
    START TRANSACTION;

    WHILE v_i <= p_cantidad DO
        SET v_id_persona = IFNULL(p_id_persona, fn_random_id_persona());
        SET v_nombre = IFNULL(p_nombre, fn_nombre_proveedor());
        SET v_contacto = IFNULL(p_contacto,
            CONCAT(
                ELT(FLOOR(1 + RAND() * 5),
                    'ventas', 'contacto', 'compras', 'atencion', 'soporte'),
                FLOOR(10 + RAND() * 90),
                '@proveedor.com.mx'
            )
        );
        SET v_especialidad = IFNULL(p_especialidad,
            ELT(FLOOR(1 + RAND() * 10),
                'Equipamiento medico de diagnostico',
                'Instrumental quirurgico',
                'Mobiliario hospitalario',
                'Equipamiento de laboratorio',
                'Dispositivos de monitoreo',
                'Equipamiento de rehabilitacion',
                'Suministros de cuidados intensivos',
                'Equipamiento de imagenologia',
                'Dispositivos de terapia respiratoria',
                'Equipamiento de emergencias'
            )
        );
        SET v_tipo_transaccion = IFNULL(p_tipo_transaccion,
			ELT(FLOOR(1 + RAND() * 3), 'Pago', 'Abono', 'Nota de Credito')
		);
        SET v_fecha_transaccion = IFNULL(p_fecha_transaccion,
            DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
        );
        SET v_referencia = IFNULL(p_referencia,
            CONCAT(
                ELT(FLOOR(1 + RAND() * 4), 'OC', 'REF', 'TRX', 'FAC'),
                '-', YEAR(NOW()), '-',
                LPAD(FLOOR(1 + RAND() * 99999), 5, '0')
            )
        );
        SET v_espacio_id    = IFNULL(p_espacio_id,    fn_random_espacio_id());
        SET v_nombre_equipo = IFNULL(p_nombre_equipo, fn_nombre_equipo_medico());
        SET v_marca = IFNULL(p_marca,
            ELT(FLOOR(1 + RAND() * 12),
                'Philips',   'GE Healthcare',       'Siemens Healthineers',
                'Medtronic', 'Stryker',             'Baxter',
                'Abbott',    'Mindray',             'Nihon Kohden',
                'Drager',    'Spacelabs',           'Welch Allyn'
            )
        );
        
        INSERT INTO tbb_Proveedores
            (Id_persona, Nombre, Contacto, Especialidad)
        VALUES
            (v_id_persona, v_nombre, v_contacto, v_especialidad);
        SET v_id_proveedor = LAST_INSERT_ID();

        INSERT INTO tbb_Transacciones_Financieras
            (Proveedor_ID, Tipo_Transacciones, Fecha_Transaccion, Referencia)
        VALUES
            (v_id_proveedor, v_tipo_transaccion, v_fecha_transaccion, v_referencia);
        SET v_id_transaccion = LAST_INSERT_ID();

        INSERT INTO tbc_Equipamientos
            (Proveedor_ID, Espacio_ID, Nombre, Marca)
        VALUES
            (v_id_proveedor, v_espacio_id, v_nombre_equipo, v_marca);
		
		SET p_ultimo_id_proveedor    = v_id_proveedor;
		SET p_ultimo_id_transaccion  = v_id_transaccion;
		SET p_ultimo_id_equipamiento = LAST_INSERT_ID();
        
        SET v_i           = v_i + 1;
        SET v_lote_actual = v_lote_actual + 1;

        IF v_lote_actual >= 1000 THEN
            COMMIT;
            SET p_registros_insertados = p_registros_insertados + v_lote_actual;
            SET v_lote_actual          = 0;
            START TRANSACTION;
        END IF;

    END WHILE;

    IF v_lote_actual > 0 THEN
        COMMIT;
        SET p_registros_insertados = p_registros_insertados + v_lote_actual;
    END IF;
END