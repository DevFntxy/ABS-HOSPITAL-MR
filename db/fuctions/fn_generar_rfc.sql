CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_rfc`(
    p_nombre VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha DATE
) RETURNS varchar(13) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        UPPER(
            CONCAT(
                CHAR(FLOOR(65+RAND()*26)),
                CHAR(FLOOR(65+RAND()*26)),
                FLOOR(RAND()*10)
            )
        )
    );
END