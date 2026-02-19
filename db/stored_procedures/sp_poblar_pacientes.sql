DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes`(
    IN p_cantidad INT,
    IN p_genero VARCHAR(1),
    IN p_edad_min INT,
    IN p_edad_max INT,
    IN p_estatus_vida VARCHAR(20),
    IN p_estatus_medico VARCHAR(150)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_genero VARCHAR(1);
    DECLARE v_curp VARCHAR(20);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_apellido1 VARCHAR(60);
    DECLARE v_apellido2 VARCHAR(60);
    DECLARE v_fecha_nac DATE;
    DECLARE v_now DATETIME;
    DECLARE v_edad INT;
    DECLARE v_id INT;
    DECLARE v_intentos INT DEFAULT 0;
    DECLARE v_batch_size INT DEFAULT 1000;


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			@p1 = MESSAGE_TEXT;
		ROLLBACK;
		SELECT @p1 AS error_real;
	END;
	
    IF p_edad_min > p_edad_max THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Rango de edad inválido';
	END IF;

    IF p_cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cantidad inválida';
    END IF;

    START TRANSACTION;
	SET v_now = NOW();
    WHILE i < p_cantidad DO
    
        SET v_genero = p_genero;
        SET v_edad = p_edad_min + FLOOR(RAND()*(p_edad_max - p_edad_min + 1));
        SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
        SET v_nombre = fn_generar_nombre(v_genero);
        SET v_apellido1 = fn_generar_apellido();
        SET v_apellido2 = fn_generar_apellido();
        SET v_intentos = 0;
        
        WHILE v_apellido1 = v_apellido2 AND v_intentos < 5 DO
			SET v_apellido2 = fn_generar_apellido();
			SET v_intentos = v_intentos + 1;
		END WHILE;

		SET v_curp = fn_generar_curp(
			v_nombre,
			v_apellido1,
			v_apellido2,
			v_fecha_nac,
			v_genero
		);

		SET @v_rfc = fn_generar_rfc(
			v_nombre,
			v_apellido1,
			v_apellido2,
			v_fecha_nac
		);

        -- INSERT tbb_personas
        INSERT INTO tbb_personas (
			tipo,
            rfc,
            pais_origen,
            fecha_registro,
            fecha_actualizacion,
            estatus
        ) VALUES (
            'Fisica',
            @v_rfc,
            ELT(FLOOR(1+RAND()*5),
                'México','USA','Canadá','Colombia','Argentina'),
            v_now,
            null,
            1
        );
        
        -- INSERT tbb_personas_fisicas
        SET v_id = LAST_INSERT_ID();
        INSERT INTO tbb_personas_fisicas (
			ID,
            titulo_cortesia,
            nombre,
			primer_apellido,
			segundo_apellido,
			genero,
			fecha_nacimiento,
			curp,
			grupo_sanguineo,
			fecha_registro,
			fecha_actualizacion,
			estatus
        ) VALUES(
            v_id,
            fn_generar_titulo(v_genero, v_edad),
            v_nombre,
            v_apellido1,
            v_apellido2,
            v_genero,
            v_fecha_nac,
            v_curp,
            fn_grupo_sanguineo(),
            v_now,
            null,
            1
        );

        -- INSERT tbb_pacientes
        INSERT INTO tbb_pacientes (
			ID,
			estatus_medico,
			estatus_vida,
			fecha_ultima_cita_medica,
			fecha_registro,
			fecha_actualizacion,
			estatus
        ) VALUES(
            v_id,
            p_estatus_medico,
            p_estatus_vida,
            v_now,
            v_now,
            null,
            1
        );

        SET i = i + 1;
        IF i MOD v_batch_size = 0 THEN
			COMMIT;
			START TRANSACTION;
		END IF;
    END WHILE;
    COMMIT;
END ;;
DELIMITER ;