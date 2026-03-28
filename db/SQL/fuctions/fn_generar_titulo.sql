CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_titulo`(
    p_genero VARCHAR(3),
    p_edad INT
) RETURNS varchar(20) CHARSET utf8mb4
    NO SQL
BEGIN
    /*
        Genera un título o tratamiento basado en:
            - Género (p_genero)
            - Edad (p_edad)
        1) Menores de 12 años:
            M  → "Niña"
            Otro → "Niño"
        2) Entre 12 y 17 años:
            M  → "Señorita" o "Joven" (aleatorio)
            Otro → "Joven" o "Adolescente" (aleatorio)
        3) Entre 18 y 22 años:
            M  → "Sr.", "Señorita" o "Mx." (aleatorio)
            Otro → "Sr.", "Joven" o "Mx." (aleatorio)
        4) 23 años o más:
            M  → Selección aleatoria entre:
                   Sr., Dr., Lic., Ing., Arq., Mtro.,
                   Mtr., C.P., Abg., Enf., QFB., Psic.

            Otro → Selección aleatoria entre:
                   Sra., Dra., Licda., Ing., Arq., Mtra.,
                   C.P., Abgda., Enf., QFB., Psic., Mx.

    */

    SET p_genero = UPPER(p_genero);

    IF p_edad < 12 THEN
        IF p_genero = 'M' THEN
            RETURN 'Niña';
        ELSE
            RETURN 'Niño';
        END IF;
    END IF;

    IF p_edad >= 12 AND p_edad < 18 THEN
        IF p_genero = 'M' THEN
            RETURN ELT(FLOOR(RAND()*2)+1,'Señorita','Joven');
        ELSE
            RETURN ELT(FLOOR(RAND()*2)+1,'Joven','Adolescente');
        END IF;
    END IF;

    IF p_edad >= 18 AND p_edad < 23 THEN
        IF p_genero = 'M' THEN
            RETURN ELT(FLOOR(RAND()*3)+1,'Sr.','Señorita','Mx.');
        ELSE
            RETURN ELT(FLOOR(RAND()*3)+1,'Sr.','Joven','Mx.');
        END IF;
    END IF;

    IF p_genero = 'M' THEN
        RETURN ELT(FLOOR(RAND()*12)+1,
            'Sr.',
            'Dr.',
            'Lic.',
            'Ing.',
            'Arq.',
            'Mtro.',
            'Mtr.',
            'C.P.',
            'Abg.',
            'Enf.',
            'QFB.',
            'Psic.'
        );
    ELSE
        RETURN ELT(FLOOR(RAND()*12)+1,
            'Sra.',
            'Dra.',
            'Licda.',
            'Ing.',
            'Arq.',
            'Mtra.',
            'C.P.',
            'Abgda.',
            'Enf.',
            'QFB.',
            'Psic.',
            'Mx.'
        );
    END IF;
END;