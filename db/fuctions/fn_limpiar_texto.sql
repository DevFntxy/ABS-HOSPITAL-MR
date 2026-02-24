CREATE DEFINER=`root`@`localhost` FUNCTION `fn_limpiar_texto`(p_texto VARCHAR(60)) 
RETURNS varchar(60) 
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    /*
        Normaliza una cadena de texto aplicando reglas básicas
        de estandarización para generación de identificadores
        (ej. RFC, CURP, claves internas).

        Transformaciones aplicadas:
        1) Convierte todo el texto a mayúsculas.
        2) Sustituye vocales acentuadas por su equivalente sin acento:
              Á → A
              É → E
              Í → I
              Ó → O
              Ú → U
        3) Sustituye:
              Ü → U
              Ñ → X


    */

    -- Convertir a mayúsculas
    SET p_texto = UPPER(p_texto);

    -- Reemplazo de caracteres acentuados
    SET p_texto = REPLACE(p_texto,'Á','A');
    SET p_texto = REPLACE(p_texto,'É','E');
    SET p_texto = REPLACE(p_texto,'Í','I');
    SET p_texto = REPLACE(p_texto,'Ó','O');
    SET p_texto = REPLACE(p_texto,'Ú','U');
    SET p_texto = REPLACE(p_texto,'Ü','U');

    -- Sustitución de Ñ por X (convención común en RFC)
    SET p_texto = REPLACE(p_texto,'Ñ','X');

    RETURN p_texto;
END;