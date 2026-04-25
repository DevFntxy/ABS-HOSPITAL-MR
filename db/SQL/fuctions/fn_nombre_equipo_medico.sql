CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nombre_equipo_medico`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_tipo VARCHAR(50);
    DECLARE v_spec VARCHAR(50);

    SET v_tipo = ELT(
        FLOOR(1 + RAND() * 16),
        'Monitor',            'Ventilador',         'Desfibrilador',
        'Electrocardiógrafo', 'Ultrasonido',         'Tomógrafo',
        'Resonador',          'Oxímetro',            'Bomba de infusión',
        'Cama hospitalaria',  'Silla de ruedas',     'Nebulizador',
        'Lámpara quirúrgica', 'Mesa de operaciones', 'Autoclave',
        'Incubadora'
    );

    SET v_spec = ELT(
        FLOOR(1 + RAND() * 10),
        'portátil',     'digital',               'de alta resolución',
        'pediátrico',   'neonatal',              'de cuidados intensivos',
        'ambulatorio',  'inalámbrico',           'de emergencias',
        'multipropósito'
    );

    RETURN CONCAT(v_tipo, ' ', v_spec);
END