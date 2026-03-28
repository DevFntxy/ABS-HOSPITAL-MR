CREATE DEFINER=`root`@`localhost` FUNCTION `fn_vocal_interna`(p_texto VARCHAR(60)) 
RETURNS CHAR(1) 
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    /*
        Obtiene la primera vocal interna (A, E, I, O, U)
        contenida en una cadena de texto.
        1) La búsqueda inicia desde la posición 2,
           ya que la posición 1 corresponde
           generalmente a la inicial del apellido.

        2) Se normaliza el texto mediante la función
           fn_limpiar_texto para:
               - Convertir a mayúsculas
               - Eliminar acentos
               - Sustituir caracteres especiales

        3) Se recorre carácter por carácter hasta:
               - Encontrar la primera vocal
               - O terminar la cadena

        4) Si no se encuentra ninguna vocal interna,
           se devuelve 'X' como valor por defecto.
    */

    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

    WHILE i <= CHAR_LENGTH(p_texto) DO
        
        -- Normalización del texto
        SET p_texto = fn_limpiar_texto(p_texto);

        -- Extraer carácter actual
        SET v_char = SUBSTRING(p_texto, i, 1);

        -- Verificar si es vocal
        IF v_char IN ('A','E','I','O','U') THEN
            RETURN v_char;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Valor por defecto si no se encuentra vocal interna
    RETURN 'X';
END;