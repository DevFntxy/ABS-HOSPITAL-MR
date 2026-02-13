CREATE DEFINER=`root`@`localhost` FUNCTION `fn_vocal_interna`(p_texto VARCHAR(60)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

    WHILE i <= CHAR_LENGTH(p_texto) DO
        SET p_texto = fn_limpiar_texto(p_texto);
		SET v_char = SUBSTRING(p_texto, i, 1);
        IF v_char IN ('A','E','I','O','U') THEN
            RETURN v_char;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN 'X';
END