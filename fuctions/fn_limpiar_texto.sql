CREATE DEFINER=`root`@`localhost` FUNCTION `fn_limpiar_texto`(p_texto VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    SET p_texto = UPPER(p_texto);

    SET p_texto = REPLACE(p_texto,'Á','A');
    SET p_texto = REPLACE(p_texto,'É','E');
    SET p_texto = REPLACE(p_texto,'Í','I');
    SET p_texto = REPLACE(p_texto,'Ó','O');
    SET p_texto = REPLACE(p_texto,'Ú','U');
    SET p_texto = REPLACE(p_texto,'Ü','U');
    SET p_texto = REPLACE(p_texto,'Ñ','X');

    RETURN p_texto;
END