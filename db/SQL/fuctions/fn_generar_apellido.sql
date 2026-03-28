CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_apellido`()
RETURNS VARCHAR(60)
CHARSET utf8mb4
DETERMINISTIC
RETURN
/*
    Genera un apellido aleatorio a partir de un catálogo fijo
    de 140 apellidos comunes en México.

    Lógica de funcionamiento:
    - RAND() genera un número decimal entre 0 y 1.
    - Se multiplica por 140 (total de elementos).
    - FLOOR() elimina los decimales.
    - Se suma 1 para ajustar el índice (ELT inicia en 1).
    - ELT(posición, lista...) retorna el valor correspondiente.

    Uso típico:
    - Generación de datos sintéticos
    - Simulación de registros de personas
    - Pruebas de carga en sistemas administrativos o médicos
*/
ELT(
    FLOOR(RAND()*140)+1,
    'Lopez','Garcia','Hernandez','Martinez','Perez',
    'Gomez','Torres','Diaz','Vazquez','Sanchez',
    'Ramirez','Castro','Ortega','Ruiz','Morales',
    'Jimenez','Alvarez','Romero','Gutierrez','Chavez',
    'Mendoza','Rojas','Flores','Rivera','Silva',
    'Delgado','Aguilar','Navarro','Cruz','Reyes',
    'Herrera','Medina','Castillo','Vargas','Guerrero',
    'Ramos','Molina','Suarez','Contreras','Dominguez',
    'Vega','Soto','Cabrera','Campos','Valdez',
    'Carrillo','Salazar','Pena','Leon','Ibarra',
    'Montoya','Padilla','Fuentes','Mejia','Cortes',
    'Paredes','Nunez','Gallegos','Luna','Escobar',
    'Figueroa','Macias','Zamora','Arellano','Bautista',
    'Velasco','Barrios','Miranda','Serrano','Ochoa',
    'Tapia','Acosta','Ayala','Franco','Cordero',
    'Benitez','Villanueva','Palacios','Esquivel','Valencia',
    'Rosales','Santana','Maldonado','Solano','Arroyo',
    'Bravo','Trujillo','Zavala','Montes','Cisneros',
    'Beltran','Cuevas','Avila','Galvan','Camacho',
    'Salinas','Cardenas','Peralta','Trejo','Olivares',
    'Valle','Leal','Zuniga','Coronado','Chacon',
    'Renteria','Becerra','Cervantes','Marquez','Villalobos',
    'Robles','Meza','Cantu','Tovar','Sepulveda',
    'Ponce','Lozano','Andrade','Amador','Barrientos',
    'Cedillo','Carmona','DeLeon','Escamilla','Granados',
    'Huerta','Jaimes','Ledezma','Manzano','Ontiveros',
    'Portillo','Quintero','Resendiz','Saucedo','Tejada',
    'Urbina','Villaseñor','Yanez','Zarate','Alvarado'
);