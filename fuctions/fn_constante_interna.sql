CREATE DEFINER=`root`@`localhost` FUNCTION `fn_consonante_interna`(p_texto VARCHAR(60)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

	SET p_texto = fn_limpiar_texto(p_texto);
    WHILE i <= CHAR_LENGTH(p_texto) DO
        SET v_char = SUBSTRING(UPPER(p_texto), i, 1);
        IF v_char REGEXP '[B-DF-HJ-NP-TV-Z]' THEN
            RETURN v_char;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN 'X';
END