CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus_medico`()
RETURNS VARCHAR(30)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    /*
        Genera un estatus médico aleatorio con una distribución de
        probabilidad predefinida. Es utilizada para poblar datos
        sintéticos en procesos de simulación o pruebas de carga.
    */

    -- Variable que almacenará el número aleatorio (0.0 a 1.0)
    DECLARE v_rand DOUBLE;

    -- Variable que almacenará el resultado final
    DECLARE v_result VARCHAR(30);

    -- Genera número decimal aleatorio entre 0 y 1
    SET v_rand = RAND();

    /*
        Distribución de estatus médicos basada en rangos de probabilidad:
        0.00 - 0.34  → 35%  Diabetico
        0.35 - 0.62  → 28%  Cardiacos
        0.63 - 0.77  → 15%  Cancer
        0.78 - 0.89  → 12%  Cuidados paliativos
        0.90 - 1.00  → 10%  Trauma craneoencefalico
    */

    IF v_rand < 0.35 THEN
        SET v_result = 'Diabetico';
    ELSEIF v_rand < 0.63 THEN
        SET v_result = 'Cardiacos';
    ELSEIF v_rand < 0.78 THEN
        SET v_result = 'Cancer';
    ELSEIF v_rand < 0.90 THEN
        SET v_result = 'Cuidados paliativos';
    ELSE
        SET v_result = 'Trauma craneoencefalico';
    END IF;

    -- Retorna el estatus médico generado
    RETURN v_result;
END;