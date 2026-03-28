CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes`(
    IN p_cantidad INT,
    IN p_genero VARCHAR(3), -- H, M, N/B
    IN p_edad_min INT,
    IN p_edad_max INT,
    IN p_estatus_vida VARCHAR(20), 
    IN p_estatus_medico VARCHAR(150),
)
BEGIN
    /*
        Genera registros sintéticos de pacientes y los inserta
        de forma transaccional en las siguientes tablas:

            - tbb_personas
            - tbb_personas_fisicas
            - tbb_pacientes

        Parámetros de entrada:

        p_cantidad:
            Número total de pacientes a generar.

        p_genero:
            Si se especifica (H, M, N/B), fuerza el género.
            Si es NULL, se genera aleatoriamente.

        p_edad_min / p_edad_max:
            Rango inclusivo de edad permitido.
            Se valida que:
                - No sea negativo
                - No supere límites razonables
                - p_edad_min <= p_edad_max

        p_estatus_vida:
            Si es NULL o vacío, se genera automáticamente
            con fn_genera_estatus_vida().

        p_estatus_medico:
            Si es NULL o vacío, se genera automáticamente
            con fn_genera_estatus_medico().

        p_etapa_vida:
            Parámetro declarativo (no utilizado actualmente).

        Flujo de ejecución:

        1) Validaciones de entrada:
            - Género permitido
            - Rango de edad válido
            - Cantidad > 0

        2) Inicio de transacción.

        3) Por cada iteración:
            - Determinar género
            - Determinar estatus médico y de vida
            - Calcular edad y fecha de nacimiento
            - Generar nombre y apellidos
            - Evitar apellidos idénticos (máx 5 intentos)
            - Generar CURP y RFC
            - Insertar en:
                a) tbb_personas
                b) tbb_personas_fisicas
                c) tbb_pacientes

        4) Confirmación por lotes (batch commit):
            - Cada 1000 registros se hace COMMIT
              para evitar transacciones excesivamente grandes.

        5) Commit final.

    */

    DECLARE i INT DEFAULT 0;
    DECLARE v_genero VARCHAR(3);
    DECLARE v_curp VARCHAR(20);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_apellido1 VARCHAR(60);
    DECLARE v_apellido2 VARCHAR(60);
    DECLARE v_estatus_medico VARCHAR(150);
    DECLARE v_estatus_vida VARCHAR(20);
    DECLARE v_fecha_nac DATE;
    DECLARE v_pais VARCHAR(20);
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

    IF p_genero IS NOT NULL AND p_genero NOT IN ('H','M','N/B') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Genero invalido. Valores permitidos: M, H, N/B';
    END IF;
    
    IF p_edad_min IS NULL OR p_edad_min < 0 THEN
        SET p_edad_min = 0;
    END IF;

    IF p_edad_max IS NULL OR p_edad_max > 120 THEN
        SET p_edad_max = 100;
    END IF;
    
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
    
        SET v_genero = fn_generar_genero();
        IF p_genero IS NOT NULL AND TRIM(p_genero) IN ('H','M','N/B') THEN
            SET v_genero = TRIM(p_genero);
        END IF;
        
        IF p_estatus_medico IS NULL OR TRIM(p_estatus_medico) = '' THEN
            SET v_estatus_medico = fn_genera_estatus_medico();
        ELSE 
            SET v_estatus_medico = p_estatus_medico;
        END IF;
        
        IF p_estatus_vida IS NULL OR TRIM(p_estatus_vida) = '' THEN
            SET v_estatus_vida = fn_genera_estatus_vida();
        ELSE 
            SET v_estatus_vida = p_estatus_vida;
        END IF;
        
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
            fn_generar_pais(),
            v_now,
            null,
            1
        );
        
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
            v_estatus_medico,
            v_estatus_vida,
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
END;