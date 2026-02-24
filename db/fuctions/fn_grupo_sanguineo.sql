CREATE DEFINER=`root`@`localhost` FUNCTION `fn_grupo_sanguineo`() 
RETURNS varchar(5) 
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    /*
        Genera un grupo sanguíneo aleatorio basado en una
        distribución probabilística acumulada.

        Distribución configurada:
        0.000 – 0.619  → 62.0%  O+
        0.620 – 0.829  → 21.0%  A+
        0.830 – 0.884  → 5.5%   O-
        0.885 – 0.939  → 5.5%   B+
        0.940 – 0.957  → 1.8%   AB+
        0.958 – 0.967  → 1.0%   A-
        0.968 – 0.976  → 0.9%   B-
        0.977 – 1.000  → 2.3%   AB-
    */

    DECLARE v_rand DOUBLE;
    DECLARE v_result VARCHAR(5);

    -- Generar número pseudoaleatorio
    SET v_rand = RAND();

    -- Evaluación por rangos acumulados
    IF v_rand < 0.62 THEN
        SET v_result = 'O+';
    ELSEIF v_rand < 0.83 THEN
        SET v_result = 'A+';
    ELSEIF v_rand < 0.885 THEN
        SET v_result = 'O-';
    ELSEIF v_rand < 0.94 THEN
        SET v_result = 'B+';
    ELSEIF v_rand < 0.958 THEN
        SET v_result = 'AB+';
    ELSEIF v_rand < 0.968 THEN
        SET v_result = 'A-';
    ELSEIF v_rand < 0.977 THEN
        SET v_result = 'B-';
    ELSE
        SET v_result = 'AB-';
    END IF;

    RETURN v_result;
END;