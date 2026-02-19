CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_titulo`(
    p_genero CHAR(1),
    p_edad INT
) RETURNS varchar(20) CHARSET utf8mb4
    NO SQL
BEGIN
    DECLARE v_rand INT;
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
            RETURN ELT(FLOOR(1+RAND()*2),'Señorita','Joven');
        ELSE
            RETURN ELT(FLOOR(1+RAND()*2),'Joven','Adolescente');
        END IF;
    END IF;

    IF p_edad >= 18 AND p_edad < 23 THEN
        IF p_genero = 'M' THEN
            RETURN ELT(FLOOR(1+RAND()*3),'Sr.','Señorita','Mx.');
        ELSE
            RETURN ELT(FLOOR(1+RAND()*3),'Sr.','Joven','Mx.');
        END IF;
    END IF;

    SET v_rand = FLOOR(1 + RAND()*12);

    IF p_genero = 'M' THEN
        RETURN ELT(v_rand,
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
        RETURN ELT(v_rand,
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
END