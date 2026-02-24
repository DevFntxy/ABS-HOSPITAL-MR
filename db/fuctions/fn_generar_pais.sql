CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_pais`()
RETURNS VARCHAR(20)
CHARSET utf8mb4
NOT DETERMINISTIC
BEGIN
    /*
        Genera un país aleatorio según una distribución
        probabilística predefinida.

        Distribución:

        0.00  - 0.779  → 78%  México
        0.78  - 0.929  → 15%  USA
        0.93  - 0.959  → 3%   Canadá
        0.96  - 0.979  → 2%   Colombia
        0.98  - 1.000  → 2%   Argentina
    */

    DECLARE v_rand DOUBLE;

    -- Generar número aleatorio entre 0 y 1
    SET v_rand = RAND();

    -- Evaluación por rangos acumulados
    IF v_rand < 0.78 THEN
        RETURN 'México';
    ELSEIF v_rand < 0.93 THEN
        RETURN 'USA';
    ELSEIF v_rand < 0.96 THEN
        RETURN 'Canadá';
    ELSEIF v_rand < 0.98 THEN
        RETURN 'Colombia';
    ELSE
        RETURN 'Argentina';
    END IF;
END;