CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus_vida`() RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_rand DOUBLE;
    DECLARE v_result VARCHAR(30) DEFAULT 'Vivo';
    SET v_rand = RAND();
    
    IF v_rand < 0.82 THEN
        SET v_result = 'Vivo';
    ELSEIF v_rand < 0.88 THEN
        SET v_result = 'Invalido';
    ELSEIF v_rand < 0.92 THEN
        SET v_result = 'Finado';
    ELSEIF v_rand < 0.94 THEN
        SET v_result = 'Vegetativo';
    ELSEIF v_rand < 0.97 THEN
        SET v_result = 'Coma';
    ELSE
        SET v_result = 'Desconocido';
    END IF;
    
    RETURN v_result;
END