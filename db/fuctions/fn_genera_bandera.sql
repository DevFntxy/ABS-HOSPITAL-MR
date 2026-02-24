CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera`()
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    -- Variable booleana que almacenará el resultado final
    -- En MySQL BOOLEAN es equivalente a TINYINT(1)
    DECLARE v_bandera BOOLEAN DEFAULT FALSE;
    
    -- Variable auxiliar para almacenar el número aleatorio generado
    DECLARE v_pivote INT DEFAULT 0;

    -- Genera un número aleatorio entre 0 y 100
    -- Utiliza la función personalizada fn_numero_aleatorio_rangos(min, max)
    SET v_pivote = fn_numero_aleatorio_rangos(0, 100);

    -- Lógica de decisión probabilística:
    -- Si el número es menor o igual a 50 → TRUE
    -- Si es mayor a 50 → FALSE
    -- Esto genera una probabilidad aproximada del 50%
    IF v_pivote <= 50 THEN
        SET v_bandera = TRUE;
    ELSE
        SET v_bandera = FALSE;
    END IF;

    -- Retorna el valor booleano
    -- TRUE  = 1
    -- FALSE = 0
    RETURN v_bandera;
END;