CREATE DEFINER=`root`@`localhost` FUNCTION `fn_consonante_interna`(
    p_texto VARCHAR(60) -- Texto del cual se extraerá la consonante interna
) 
RETURNS CHAR(1) 
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    -- Variable de control para recorrer el texto
    -- Inicia en 2 porque la consonante debe ser interna (no la primera letra)
    DECLARE i INT DEFAULT 2;
    
    -- Variable que almacenará el carácter evaluado
    DECLARE v_char CHAR(1);

    -- Limpia el texto:
    -- - Elimina acentos
    -- - Quita caracteres especiales
    -- - Normaliza formato
    SET p_texto = fn_limpiar_texto(p_texto);

    -- Recorre el texto desde la segunda posición hasta el final
    WHILE i <= CHAR_LENGTH(p_texto) DO
        
        -- Obtiene el carácter en la posición actual
        SET v_char = SUBSTRING(UPPER(p_texto), i, 1);

        -- Evalúa si el carácter es una consonante (excluye vocales)
        -- Expresión regular: letras B-DF-HJ-NP-TV-Z
        IF v_char REGEXP '[B-DF-HJ-NP-TV-Z]' THEN
            -- Retorna la primera consonante interna encontrada
            RETURN v_char;
        END IF;

        -- Avanza a la siguiente posición
        SET i = i + 1;
    END WHILE;

    -- Si no se encontró consonante interna, retorna 'X'
    -- Esto cumple con estándares usados en generación de CURP/RFC
    RETURN 'X';
END;