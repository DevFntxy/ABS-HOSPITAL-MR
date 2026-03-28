CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`()
RETURNS DATE
DETERMINISTIC
BEGIN
    /*
        Genera una fecha de nacimiento aleatoria dentro de un rango
        predefinido utilizando un desplazamiento en días respecto
        a una fecha base.
        - Fecha mínima: 1950-01-01
        - Fecha máxima: 2005-12-31
    */

    -- Diferencia en días desde la fecha base (1900-01-01)
    -- hasta la fecha mínima del rango
    DECLARE min_dias INT;

    -- Diferencia en días desde la fecha base (1900-01-01)
    -- hasta la fecha máxima del rango
    DECLARE max_dias INT;

    -- Número aleatorio de días dentro del rango definido
    DECLARE dias_aleatorios INT;

    -- Fecha resultante calculada
    DECLARE fecha_aleatoria DATE;

    -- Fecha base utilizada como punto de referencia
    -- Se calcula el desplazamiento mínimo en días
    SET min_dias = DATEDIFF('1950-01-01', '1900-01-01');

    -- Se calcula el desplazamiento máximo en días
    SET max_dias = DATEDIFF('2005-12-31', '1900-01-01');

    -- Genera un número aleatorio entre min_dias y max_dias
    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);

    -- Suma los días aleatorios a la fecha base
    -- obteniendo una fecha válida dentro del rango
    SET fecha_aleatoria = DATE_ADD('1900-01-01', INTERVAL dias_aleatorios DAY);

    -- Retorna la fecha generada
    RETURN fecha_aleatoria;
END;