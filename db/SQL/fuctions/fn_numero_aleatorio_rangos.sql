CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(
    p_min INT,
    p_max INT
) RETURNS int
    DETERMINISTIC
BEGIN
    /*
        Genera un número entero aleatorio dentro de un rango
        inclusivo definido por:

            p_min → límite inferior
            p_max → límite superior

        Fórmula utilizada:

            FLOOR(RAND() * (p_max - p_min + 1)) + p_min

    */

    RETURN FLOOR(RAND() * (p_max - p_min + 1)) + p_min;
END;