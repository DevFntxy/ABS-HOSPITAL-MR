CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_curp`(
    p_nombre VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha DATE,
    p_genero CHAR(1)
) RETURNS varchar(18) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        UPPER(p_genero),
        'NE',
        fn_consonante_interna(p_apellido1),
        fn_consonante_interna(p_apellido2),
        fn_consonante_interna(p_nombre),
        FLOOR(RAND()*10)
    );
END