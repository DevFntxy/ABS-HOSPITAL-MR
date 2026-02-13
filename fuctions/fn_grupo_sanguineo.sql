CREATE DEFINER=`root`@`localhost` FUNCTION `fn_grupo_sanguineo`() RETURNS varchar(5) CHARSET utf8mb4
    DETERMINISTIC
RETURN ELT(FLOOR(1 + RAND()*8),
'A+','A-','B+','B-','AB+','AB-','O+','O-')