CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nombre_proveedor`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_prefijo VARCHAR(40);
    DECLARE v_razon   VARCHAR(20);
    DECLARE v_num     INT;

    SET v_prefijo = ELT(
        FLOOR(1 + RAND() * 20),
        'MedEquip',    'BioMed',       'SaludTech',   'MediSupply',
        'ClinixPro',   'FarmaGroup',   'OrthoMex',    'CardioCorp',
        'NeuroPharma', 'DiagnosTech',  'LaboPro',     'MedikaSA',
        'TechMedical', 'VitalEquip',   'SurgicalPro', 'BioEquip',
        'MedixGroup',  'SaludPlus',    'ProMedic',    'EquipaSalud'
    );

    SET v_razon = ELT(
        FLOOR(1 + RAND() * 6),
        'SA de CV', 'S de RL', 'SA', 'SRL', 'SC', 'SPR'
    );

    SET v_num = FLOOR(100 + RAND() * 900);

    RETURN CONCAT(v_prefijo, ' ', v_num, ' ', v_razon);
END