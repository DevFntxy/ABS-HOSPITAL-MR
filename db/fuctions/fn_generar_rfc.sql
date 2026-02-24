CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_rfc`(
    p_nombre VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha DATE
) RETURNS VARCHAR(13)
CHARSET utf8mb4
NOT DETERMINISTIC
BEGIN
    /*
        Estructura RFC persona física:
        AAAA + YYMMDD + XXX
        AAAA:
            1ª letra apellido paterno
            1ª vocal interna apellido paterno
            1ª letra apellido materno
            1ª letra nombre

        YYMMDD:
            Fecha de nacimiento en formato año (2 dígitos), mes (2 dígitos), día (2 dígitos)
        XXX:
            Homoclave aleatoria (2 letras + 1 número)
    */

    RETURN CONCAT(
        -- 4 letras iniciales
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),

        -- Fecha nacimiento
        DATE_FORMAT(p_fecha,'%y%m%d'),

        -- Homoclave pseudoaleatoria
        UPPER(
            CONCAT(
                CHAR(FLOOR(65 + RAND()*26)),
                CHAR(FLOOR(65 + RAND()*26)),
                FLOOR(RAND()*10)
            )
        )
    );
END;