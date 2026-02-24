CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_genero`()
RETURNS VARCHAR(3)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    /*
        Genera un género aleatorio con una distribución
        probabilística predefinida.

        Distribución configurada:

        0.000 - 0.349  → 10.0%  N/B  (No Binario)
        0.350 - 0.674  → 60.5%  M    (Mujer)
        0.675 - 1.000  → 20.5%  H    (Hombre)

    */

    -- Número aleatorio entre 0 y 1
    DECLARE v_rand DOUBLE;

    -- Variable que almacenará el resultado
    DECLARE v_genero VARCHAR(3);

    -- Generación del valor pseudoaleatorio
    SET v_rand = RAND();

    -- Evaluación por rangos acumulativos
    IF v_rand < 0.35 THEN
        SET v_genero = 'N/B';
    ELSEIF v_rand < 0.675 THEN
        SET v_genero = 'M';
    ELSE
        SET v_genero = 'H';
    END IF;

    -- Retorna el género generado
    RETURN v_genero;
END;