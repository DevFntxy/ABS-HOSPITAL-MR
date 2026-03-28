CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera_porcentaje`(
    v_porcentaje INT -- Porcentaje de probabilidad deseado (0 a 100)
) 
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    /*
        Genera un valor booleano (0 o 1) basado en un porcentaje específico.

        Lógica:
        - RAND() genera un número decimal aleatorio entre 0 y 1.
        - v_porcentaje / 100 convierte el porcentaje a valor decimal.
        - Si el número aleatorio es menor que el porcentaje,
          la expresión devuelve TRUE (1).
        - En caso contrario devuelve FALSE (0).
        Ejemplo:
        v_porcentaje = 30
        → 30 / 100 = 0.30
        → Aproximadamente 30% de las veces devolverá 1
    */

    RETURN RAND() < (v_porcentaje / 100);
END;