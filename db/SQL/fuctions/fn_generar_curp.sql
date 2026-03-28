CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_curp`(
    p_nombre VARCHAR(60),      -- Nombre(s) de la persona
    p_apellido1 VARCHAR(60),   -- Primer apellido (paterno)
    p_apellido2 VARCHAR(60),   -- Segundo apellido (materno)
    p_fecha DATE,              -- Fecha de nacimiento
    p_genero CHAR(1)           -- Género (H/M)
) 
RETURNS VARCHAR(18)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    /*
        Función: fn_generar_curp
        1-4   → Iniciales (Apellido1 + Vocal interna + Apellido2 + Nombre)
        5-10  → Fecha nacimiento (YYMMDD)
        11    → Género (H/M)
        12-13 → Entidad federativa (valor fijo: 'NE')
        14-16 → Consonantes internas (Apellido1, Apellido2, Nombre)
        17-18 → Homoclave (aquí simplificada con número aleatorio)

    */

    RETURN CONCAT(
        -- Primera letra del primer apellido
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),

        -- Primera vocal interna del primer apellido
        fn_vocal_interna(p_apellido1),

        -- Primera letra del segundo apellido
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),

        -- Primera letra del nombre
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),

        -- Fecha en formato YYMMDD
        DATE_FORMAT(p_fecha,'%y%m%d'),

        -- Género en mayúscula
        UPPER(p_genero),

        -- Clave de entidad federativa (NE = Nacido en el Extranjero)
        'NE',

        -- Consonante interna del primer apellido
        fn_consonante_interna(p_apellido1),

        -- Consonante interna del segundo apellido
        fn_consonante_interna(p_apellido2),

        -- Consonante interna del nombre
        fn_consonante_interna(p_nombre),

        -- Dígito aleatorio como homoclave simplificada
        FLOOR(RAND()*10)
    );
END;