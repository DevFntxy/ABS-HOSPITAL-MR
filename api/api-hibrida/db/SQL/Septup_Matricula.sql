-- ══════════════════════════════════════════════════════════════
--  SETUP COMPLETO — hospital_matricula
--  Ejecutar en MySQL Workbench o terminal:
--    mysql -u root -p < Septup_Matricula.sql
--
--  Contenido:
--    1) Creación de base de datos
--    2) Tablas DDL (orden de dependencias)
--    3) Datos iniciales (tbc_Espacios)
--    4) Funciones auxiliares (21 funciones)
--    5) Stored Procedures (2 SPs)
-- ══════════════════════════════════════════════════════════════

-- ──────────────────────────────────────────────
--  1) BASE DE DATOS
-- ──────────────────────────────────────────────

CREATE DATABASE IF NOT EXISTS hospital_matricula
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE hospital_matricula;


-- ══════════════════════════════════════════════════════════════
--  2) TABLAS DDL
-- ══════════════════════════════════════════════════════════════

-- ── 2.1  tbb_personas ────────────────────────────────────────
-- Tabla base de identidad (Personas Físicas y Morales)

CREATE TABLE IF NOT EXISTS tbb_personas (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    tipo                VARCHAR(10)   NOT NULL COMMENT 'Fisica | Moral',
    rfc                 VARCHAR(13)   NULL,
    pais_origen         VARCHAR(50)   NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1 COMMENT '1=Activo, 0=Inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.2  tbb_personas_fisicas ────────────────────────────────
-- Datos demográficos de personas físicas (FK → personas)

CREATE TABLE IF NOT EXISTS tbb_personas_fisicas (
    ID                  INT PRIMARY KEY,
    titulo_cortesia     VARCHAR(20)   NULL,
    nombre              VARCHAR(60)   NOT NULL,
    primer_apellido     VARCHAR(60)   NOT NULL,
    segundo_apellido    VARCHAR(60)   NULL,
    genero              VARCHAR(3)    NULL COMMENT 'H, M, N/B',
    fecha_nacimiento    DATE          NULL,
    curp                VARCHAR(20)   NULL,
    grupo_sanguineo     VARCHAR(5)    NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_pf_persona FOREIGN KEY (ID)
        REFERENCES tbb_personas(ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.3  tbb_personas_morales ────────────────────────────────
-- Entidades legales / razón social (FK → personas)

CREATE TABLE IF NOT EXISTS tbb_personas_morales (
    ID                  INT PRIMARY KEY,
    razon_social        VARCHAR(150)  NOT NULL,
    nombre_comercial    VARCHAR(150)  NULL,
    representante_legal VARCHAR(120)  NULL,
    fecha_constitucion  DATE          NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_pm_persona FOREIGN KEY (ID)
        REFERENCES tbb_personas(ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.4  tbb_pacientes ──────────────────────────────────────
-- Información clínica de pacientes (FK → personas)

CREATE TABLE IF NOT EXISTS tbb_pacientes (
    ID                        INT PRIMARY KEY,
    estatus_medico            VARCHAR(150)  NULL,
    estatus_vida              VARCHAR(20)   NULL,
    fecha_ultima_cita_medica  DATETIME      NULL,
    fecha_registro            DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion       DATETIME      NULL,
    estatus                   TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_pac_persona FOREIGN KEY (ID)
        REFERENCES tbb_personas(ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.5  tbb_proveedores ────────────────────────────────────
-- Directorio de entidades externas de suministro (FK → personas)

CREATE TABLE IF NOT EXISTS tbb_proveedores (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    Id_persona          INT           NULL,
    Nombre              VARCHAR(100)  NULL,
    Contacto            VARCHAR(50)   NULL,
    Especialidad        VARCHAR(100)  NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_prov_persona FOREIGN KEY (Id_persona)
        REFERENCES tbb_personas(ID) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.6  tbc_espacios ───────────────────────────────────────
-- Definición lógica de la infraestructura y áreas físicas

CREATE TABLE IF NOT EXISTS tbc_espacios (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    nombre              VARCHAR(100)  NOT NULL,
    descripcion         VARCHAR(255)  NULL,
    tipo                VARCHAR(50)   NULL COMMENT 'Consultorio, Quirofano, Almacen, etc.',
    piso                INT           NULL,
    edificio            VARCHAR(50)   NULL,
    capacidad           INT           NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.7  tbb_transacciones_financieras ───────────────────────
-- Registro de movimientos económicos por adquisición de recursos

CREATE TABLE IF NOT EXISTS tbb_transacciones_financieras (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    Proveedor_ID        INT           NULL,
    Tipo_Transacciones  VARCHAR(20)   NULL COMMENT 'Compra, Pago, Devolucion, Ajuste',
    Fecha_Transaccion   DATETIME      NULL,
    Referencia          VARCHAR(100)  NULL,
    Monto               DECIMAL(12,2) NULL DEFAULT 0.00,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_tf_proveedor FOREIGN KEY (Proveedor_ID)
        REFERENCES tbb_proveedores(ID) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.8  tbc_equipamientos ──────────────────────────────────
-- Catálogo maestro de dispositivos médicos y mobiliario

CREATE TABLE IF NOT EXISTS tbc_equipamientos (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    Proveedor_ID        INT           NULL,
    Espacio_ID          INT           NULL,
    Nombre              VARCHAR(100)  NULL,
    Marca               VARCHAR(50)   NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_eq_proveedor FOREIGN KEY (Proveedor_ID)
        REFERENCES tbb_proveedores(ID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_eq_espacio FOREIGN KEY (Espacio_ID)
        REFERENCES tbc_espacios(ID) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.9  tbd_inventario_equipamientos ────────────────────────
-- Gestión de existencias, estados y trazabilidad de activos

CREATE TABLE IF NOT EXISTS tbd_inventario_equipamientos (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    Equipamiento_ID     INT           NOT NULL,
    numero_serie        VARCHAR(50)   NULL,
    estado              VARCHAR(30)   NULL DEFAULT 'Disponible' COMMENT 'Disponible, En uso, Mantenimiento, Baja',
    ubicacion_actual    VARCHAR(100)  NULL,
    fecha_adquisicion   DATE          NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME      NULL,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_inv_equip FOREIGN KEY (Equipamiento_ID)
        REFERENCES tbc_equipamientos(ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ── 2.10  tbd_accesos ───────────────────────────────────────
-- Control y registro de entradas a áreas restringidas de recursos

CREATE TABLE IF NOT EXISTS tbd_accesos (
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    Persona_ID          INT           NOT NULL,
    Espacio_ID          INT           NOT NULL,
    fecha_acceso        DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_acceso         VARCHAR(20)   NULL DEFAULT 'Entrada' COMMENT 'Entrada, Salida',
    motivo              VARCHAR(200)  NULL,
    autorizado_por      VARCHAR(100)  NULL,
    fecha_registro      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estatus             TINYINT(1)    NOT NULL DEFAULT 1,
    CONSTRAINT fk_acc_persona FOREIGN KEY (Persona_ID)
        REFERENCES tbb_personas(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_acc_espacio FOREIGN KEY (Espacio_ID)
        REFERENCES tbc_espacios(ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ══════════════════════════════════════════════════════════════
--  3) DATOS INICIALES — tbc_espacios
--     (Necesarios para que fn_random_espacio_id funcione)
-- ══════════════════════════════════════════════════════════════

INSERT INTO tbc_espacios (nombre, descripcion, tipo, piso, edificio, capacidad) VALUES
('Consultorio General 1',         'Consultorio de medicina general',             'Consultorio',       1, 'A', 2),
('Consultorio General 2',         'Consultorio de medicina general',             'Consultorio',       1, 'A', 2),
('Consultorio Pediatría',         'Consultorio especializado en pediatría',      'Consultorio',       2, 'A', 3),
('Consultorio Cardiología',       'Consultorio de cardiología',                  'Consultorio',       2, 'A', 2),
('Quirófano 1',                   'Quirófano principal',                         'Quirofano',         3, 'B', 8),
('Quirófano 2',                   'Quirófano secundario',                        'Quirofano',         3, 'B', 8),
('Sala de Emergencias',           'Área de atención de emergencias',             'Urgencias',         1, 'B', 20),
('Terapia Intensiva (UCI)',       'Unidad de cuidados intensivos',               'UCI',               4, 'B', 12),
('Laboratorio Clínico',           'Laboratorio de análisis clínicos',            'Laboratorio',       2, 'C', 6),
('Imagenología',                  'Sala de rayos X, tomografía y resonancia',    'Imagenologia',      1, 'C', 4),
('Farmacia Central',              'Farmacia del hospital',                       'Farmacia',          1, 'A', 3),
('Almacén General',               'Almacén de suministros y materiales',         'Almacen',           0, 'D', 2),
('Almacén de Equipos Médicos',    'Almacén especializado en equipo médico',      'Almacen',           0, 'D', 3),
('Sala de Recuperación',          'Área de recuperación postoperatoria',         'Recuperacion',      3, 'B', 10),
('Neonatología',                  'Unidad de atención neonatal',                 'Neonatologia',      4, 'A', 8),
('Rehabilitación Física',         'Sala de rehabilitación y terapia física',     'Rehabilitacion',    1, 'C', 6),
('Sala de Espera Principal',      'Sala de espera para pacientes y familiares',  'Sala de Espera',    1, 'A', 40),
('Oficina Administrativa',        'Oficinas de administración del hospital',     'Oficina',           5, 'A', 10),
('Comedor del Personal',          'Comedor para personal del hospital',          'Comedor',           5, 'A', 30),
('Cuarto de Máquinas',            'Cuarto de equipos eléctricos y mecánicos',    'Mantenimiento',     0, 'D', 2);


-- ══════════════════════════════════════════════════════════════
--  4) FUNCIONES AUXILIARES
-- ══════════════════════════════════════════════════════════════

DELIMITER $$

-- ── 4.1  fn_numero_aleatorio_rangos ─────────────────────────
-- Genera entero aleatorio entre p_min y p_max (inclusivo)

DROP FUNCTION IF EXISTS fn_numero_aleatorio_rangos$$
CREATE FUNCTION fn_numero_aleatorio_rangos(
    p_min INT,
    p_max INT
) RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN FLOOR(RAND() * (p_max - p_min + 1)) + p_min;
END$$


-- ── 4.2  fn_limpiar_texto ───────────────────────────────────
-- Normaliza texto: mayúsculas, sin acentos, Ñ → X

DROP FUNCTION IF EXISTS fn_limpiar_texto$$
CREATE FUNCTION fn_limpiar_texto(p_texto VARCHAR(60))
RETURNS VARCHAR(60)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    SET p_texto = UPPER(p_texto);
    SET p_texto = REPLACE(p_texto,'Á','A');
    SET p_texto = REPLACE(p_texto,'É','E');
    SET p_texto = REPLACE(p_texto,'Í','I');
    SET p_texto = REPLACE(p_texto,'Ó','O');
    SET p_texto = REPLACE(p_texto,'Ú','U');
    SET p_texto = REPLACE(p_texto,'Ü','U');
    SET p_texto = REPLACE(p_texto,'Ñ','X');
    RETURN p_texto;
END$$


-- ── 4.3  fn_vocal_interna ───────────────────────────────────
-- Primera vocal interna (posición >= 2) de un texto

DROP FUNCTION IF EXISTS fn_vocal_interna$$
CREATE FUNCTION fn_vocal_interna(p_texto VARCHAR(60))
RETURNS CHAR(1)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

    SET p_texto = fn_limpiar_texto(p_texto);

    WHILE i <= CHAR_LENGTH(p_texto) DO
        SET v_char = SUBSTRING(p_texto, i, 1);
        IF v_char IN ('A','E','I','O','U') THEN
            RETURN v_char;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN 'X';
END$$


-- ── 4.4  fn_consonante_interna ──────────────────────────────
-- Primera consonante interna (posición >= 2) de un texto

DROP FUNCTION IF EXISTS fn_consonante_interna$$
CREATE FUNCTION fn_consonante_interna(
    p_texto VARCHAR(60)
)
RETURNS CHAR(1)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE v_char CHAR(1);

    SET p_texto = fn_limpiar_texto(p_texto);

    WHILE i <= CHAR_LENGTH(p_texto) DO
        SET v_char = SUBSTRING(UPPER(p_texto), i, 1);
        IF v_char REGEXP '[B-DF-HJ-NP-TV-Z]' THEN
            RETURN v_char;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN 'X';
END$$


-- ── 4.5  fn_generar_genero ──────────────────────────────────
-- Genera género aleatorio: N/B (35%), M (32.5%), H (32.5%)

DROP FUNCTION IF EXISTS fn_generar_genero$$
CREATE FUNCTION fn_generar_genero()
RETURNS VARCHAR(3)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE v_rand DOUBLE;
    DECLARE v_genero VARCHAR(3);

    SET v_rand = RAND();

    IF v_rand < 0.35 THEN
        SET v_genero = 'N/B';
    ELSEIF v_rand < 0.675 THEN
        SET v_genero = 'M';
    ELSE
        SET v_genero = 'H';
    END IF;

    RETURN v_genero;
END$$


-- ── 4.6  fn_generar_nombre ──────────────────────────────────
-- Genera nombre aleatorio según género (100 por categoría)

DROP FUNCTION IF EXISTS fn_generar_nombre$$
CREATE FUNCTION fn_generar_nombre(p_genero VARCHAR(3))
RETURNS VARCHAR(60)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_genero='H' THEN ELT(FLOOR(1+RAND()*95),
        'Juan','Carlos','Miguel','Luis','José',
        'Jorge','Pedro','Andrés','Daniel','Fernando',
        'Ricardo','Manuel','Alejandro','Francisco','David',
        'Diego','Antonio','Jesús','Raúl','Sergio',
        'Roberto','Alberto','Mario','Héctor','Adrián',
        'Gabriel','Martín','Esteban','Óscar','Rodrigo',
        'Enrique','Pablo','Emilio','Iván','Jaime',
        'Guillermo','Salvador','Ramón','Ángel','Hugo',
        'Leonardo','Rafael','Gustavo','Cristian','Sebastián',
        'Brayan','Kevin','Axel','Samuel','Isaac',
        'Matías','Benjamín','Emanuel','Tomás','Fabián',
        'Elías','Lucas','Nicolás','Álvaro','Jonathan',
        'Edgar','Marco','Julio','César','Mauricio',
        'Felipe','Cristóbal','Gerardo','Israel','Víctor',
        'Ernesto','Rubén','Noé','Simón','Bruno',
        'Gael','Damián','Maximiliano','Ian','Emiliano',
        'Joel','Omar','Saúl','Lorenzo','Agustín',
        'Valentín','Renato','Alan','Armando','Claudio',
        'Vicente','Patricio','Adolfo','Ismael','Efraín')

        WHEN p_genero='M' THEN ELT(FLOOR(1+RAND()*95),
        'María','Ana','Lucía','Sofía','Fernanda',
        'Valeria','Camila','Daniela','Elena','Paola',
        'Andrea','Ximena','Gabriela','Victoria','Isabella',
        'Renata','Natalia','Carolina','Alejandra','Mariana',
        'Patricia','Rosa','Claudia','Laura','Verónica',
        'Adriana','Mónica','Sandra','Liliana','Diana',
        'Lorena','Karla','Alejandrina','Carmen','Gloria',
        'Rocío','Teresa','Beatriz','Luz','Emilia',
        'Regina','Julia','Julieta','Montserrat','Vanessa',
        'Yuliana','Esmeralda','Brenda','Tatiana','Melissa',
        'Dayana','Bianca','Ángela','Noelia','Ariana',
        'Valentina','Martina','Antonella','Emma','Allison',
        'Naomi','Miranda','Paulina','Daniela','Sara',
        'Abigail','Jimena','Alondra','Fátima','Catalina',
        'Michelle','Zoe','Bárbara','Yamileth','Leslie',
        'Samara','Giselle','Karen','Cecilia','Itzel',
        'Mayra','Tania','Belén','Maribel','Guadalupe',
        'Elisa','Yesenia','Nadia','Silvia','Carla',
        'Frida','Ingrid','Alicia','Estefanía','Araceli')

        ELSE ELT(FLOOR(1+RAND()*95),
        'Alexis','Avery','Bailey','Blake','Cameron',
        'Casey','Dakota','Drew','Elliot','Harley',
        'Jamie','Jesse','Kai','Kendall','Logan',
        'Parker','Quinn','Reese','Riley','Rowan',
        'Skyler','Spencer','Tristan','Adrianne','Ainsley',
        'Alma','Amaris','Amaya','Anahi','Anya',
        'Arlette','Ashley','Aspen','Aubrey','Aurora',
        'Azul','Belen','Brisa','Chantal','Chloe',
        'Crystal','Dafne','Dana','Danna','Delilah',
        'Destiny','Eileen','Elisa','Elodie','Erika',
        'Evelin','Fiona','Genesis','Gina','Grecia',
        'Hanna','Hayley','Iliana','Indira','Irene',
        'Jade','Janeth','Jazmin','Jennifer','Jessica',
        'Joanna','Joselyn','Judith','Kiara','Kimberly',
        'Karla','Larissa','Leidy','Lia','Linda',
        'Lisbeth','Lizbeth','Mabel','Madeleine','Magdalena',
        'Mara','Maritza','Melany','Mia','Mireya',
        'Nayeli','Nicole','Nubia','Olga','Pamela',
        'Raquel','Ruth','Salma','Sheila','Sindy')
    END;
END$$


-- ── 4.7  fn_generar_apellido ────────────────────────────────
-- 140 apellidos comunes en México

DROP FUNCTION IF EXISTS fn_generar_apellido$$
CREATE FUNCTION fn_generar_apellido()
RETURNS VARCHAR(60)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    RETURN ELT(
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
END$$


-- ── 4.8  fn_generar_curp ────────────────────────────────────
-- Genera CURP de 18 caracteres

DROP FUNCTION IF EXISTS fn_generar_curp$$
CREATE FUNCTION fn_generar_curp(
    p_nombre    VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha     DATE,
    p_genero    VARCHAR(3)
)
RETURNS VARCHAR(18)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        UPPER(SUBSTRING(p_genero,1,1)),
        'NE',
        fn_consonante_interna(p_apellido1),
        fn_consonante_interna(p_apellido2),
        fn_consonante_interna(p_nombre),
        FLOOR(RAND()*10)
    );
END$$


-- ── 4.9  fn_generar_rfc ─────────────────────────────────────
-- Genera RFC de 13 caracteres

DROP FUNCTION IF EXISTS fn_generar_rfc$$
CREATE FUNCTION fn_generar_rfc(
    p_nombre    VARCHAR(60),
    p_apellido1 VARCHAR(60),
    p_apellido2 VARCHAR(60),
    p_fecha     DATE
)
RETURNS VARCHAR(13)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    RETURN CONCAT(
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido1),1,1)),
        fn_vocal_interna(p_apellido1),
        UPPER(SUBSTRING(fn_limpiar_texto(p_apellido2),1,1)),
        UPPER(SUBSTRING(fn_limpiar_texto(p_nombre),1,1)),
        DATE_FORMAT(p_fecha,'%y%m%d'),
        UPPER(
            CONCAT(
                CHAR(FLOOR(65 + RAND()*26)),
                CHAR(FLOOR(65 + RAND()*26)),
                FLOOR(RAND()*10)
            )
        )
    );
END$$


-- ── 4.10  fn_generar_pais ───────────────────────────────────
-- País aleatorio con distribución probabilística

DROP FUNCTION IF EXISTS fn_generar_pais$$
CREATE FUNCTION fn_generar_pais()
RETURNS VARCHAR(20)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE v_rand DOUBLE;
    SET v_rand = RAND();

    IF v_rand < 0.78 THEN
        RETURN 'México';
    ELSEIF v_rand < 0.93 THEN
        RETURN 'USA';
    ELSEIF v_rand < 0.96 THEN
        RETURN 'Canadá';
    ELSEIF v_rand < 0.98 THEN
        RETURN 'Colombia';
    ELSE
        RETURN 'Argentina';
    END IF;
END$$


-- ── 4.11  fn_generar_titulo ─────────────────────────────────
-- Título de cortesía según género y edad

DROP FUNCTION IF EXISTS fn_generar_titulo$$
CREATE FUNCTION fn_generar_titulo(
    p_genero VARCHAR(3),
    p_edad   INT
)
RETURNS VARCHAR(20)
CHARSET utf8mb4
NO SQL
BEGIN
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
            'Sr.','Dr.','Lic.','Ing.','Arq.','Mtro.',
            'Mtr.','C.P.','Abg.','Enf.','QFB.','Psic.');
    ELSE
        RETURN ELT(FLOOR(RAND()*12)+1,
            'Sra.','Dra.','Licda.','Ing.','Arq.','Mtra.',
            'C.P.','Abgda.','Enf.','QFB.','Psic.','Mx.');
    END IF;
END$$


-- ── 4.12  fn_grupo_sanguineo ────────────────────────────────
-- Grupo sanguíneo con distribución realista

DROP FUNCTION IF EXISTS fn_grupo_sanguineo$$
CREATE FUNCTION fn_grupo_sanguineo()
RETURNS VARCHAR(5)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE v_rand DOUBLE;
    DECLARE v_result VARCHAR(5);

    SET v_rand = RAND();

    IF v_rand < 0.62 THEN
        SET v_result = 'O+';
    ELSEIF v_rand < 0.83 THEN
        SET v_result = 'A+';
    ELSEIF v_rand < 0.885 THEN
        SET v_result = 'O-';
    ELSEIF v_rand < 0.94 THEN
        SET v_result = 'B+';
    ELSEIF v_rand < 0.958 THEN
        SET v_result = 'AB+';
    ELSEIF v_rand < 0.968 THEN
        SET v_result = 'A-';
    ELSEIF v_rand < 0.977 THEN
        SET v_result = 'B-';
    ELSE
        SET v_result = 'AB-';
    END IF;

    RETURN v_result;
END$$


-- ── 4.13  fn_genera_estatus_vida ────────────────────────────
-- Estatus de vida aleatorio con distribución probabilística

DROP FUNCTION IF EXISTS fn_genera_estatus_vida$$
CREATE FUNCTION fn_genera_estatus_vida()
RETURNS VARCHAR(30)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE v_rand DOUBLE;
    DECLARE v_result VARCHAR(30) DEFAULT 'Vivo';
    SET v_rand = RAND();

    IF v_rand < 0.82 THEN
        SET v_result = 'Vivo';
    ELSEIF v_rand < 0.88 THEN
        SET v_result = 'Invalido';
    ELSEIF v_rand < 0.92 THEN
        SET v_result = 'Finado';
    ELSEIF v_rand < 0.94 THEN
        SET v_result = 'Vegetativo';
    ELSEIF v_rand < 0.97 THEN
        SET v_result = 'Coma';
    ELSE
        SET v_result = 'Desconocido';
    END IF;

    RETURN v_result;
END$$


-- ── 4.14  fn_genera_estatus_medico ──────────────────────────
-- Estatus médico aleatorio

DROP FUNCTION IF EXISTS fn_genera_estatus_medico$$
CREATE FUNCTION fn_genera_estatus_medico()
RETURNS VARCHAR(30)
CHARSET utf8mb4
DETERMINISTIC
BEGIN
    DECLARE v_rand DOUBLE;
    DECLARE v_result VARCHAR(30);
    SET v_rand = RAND();

    IF v_rand < 0.35 THEN
        SET v_result = 'Diabetico';
    ELSEIF v_rand < 0.63 THEN
        SET v_result = 'Cardiacos';
    ELSEIF v_rand < 0.78 THEN
        SET v_result = 'Cancer';
    ELSEIF v_rand < 0.90 THEN
        SET v_result = 'Cuidados paliativos';
    ELSE
        SET v_result = 'Trauma craneoencefalico';
    END IF;

    RETURN v_result;
END$$


-- ── 4.15  fn_genera_fecha_nacimiento ────────────────────────
-- Fecha de nacimiento aleatoria entre 1950 y 2005

DROP FUNCTION IF EXISTS fn_genera_fecha_nacimiento$$
CREATE FUNCTION fn_genera_fecha_nacimiento()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE min_dias INT;
    DECLARE max_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    SET min_dias = DATEDIFF('1950-01-01', '1900-01-01');
    SET max_dias = DATEDIFF('2005-12-31', '1900-01-01');
    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);
    SET fecha_aleatoria = DATE_ADD('1900-01-01', INTERVAL dias_aleatorios DAY);

    RETURN fecha_aleatoria;
END$$


-- ── 4.16  fn_genera_bandera ─────────────────────────────────
-- Booleano aleatorio (50/50)

DROP FUNCTION IF EXISTS fn_genera_bandera$$
CREATE FUNCTION fn_genera_bandera()
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    DECLARE v_bandera BOOLEAN DEFAULT FALSE;
    DECLARE v_pivote INT DEFAULT 0;

    SET v_pivote = fn_numero_aleatorio_rangos(0, 100);

    IF v_pivote <= 50 THEN
        SET v_bandera = TRUE;
    ELSE
        SET v_bandera = FALSE;
    END IF;

    RETURN v_bandera;
END$$


-- ── 4.17  fn_genera_bandera_porcentaje ──────────────────────
-- Booleano con porcentaje configurable

DROP FUNCTION IF EXISTS fn_genera_bandera_porcentaje$$
CREATE FUNCTION fn_genera_bandera_porcentaje(
    v_porcentaje INT
)
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    RETURN RAND() < (v_porcentaje / 100);
END$$


-- ── 4.18  fn_nombre_proveedor ───────────────────────────────
-- Genera nombre de empresa proveedor aleatorio

DROP FUNCTION IF EXISTS fn_nombre_proveedor$$
CREATE FUNCTION fn_nombre_proveedor()
RETURNS VARCHAR(100)
CHARSET utf8mb4
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
END$$


-- ── 4.19  fn_nombre_equipo_medico ───────────────────────────
-- Genera nombre de equipo médico aleatorio

DROP FUNCTION IF EXISTS fn_nombre_equipo_medico$$
CREATE FUNCTION fn_nombre_equipo_medico()
RETURNS VARCHAR(100)
CHARSET utf8mb4
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
END$$


-- ══════════════════════════════════════════════════════════════
--  4.20 & 4.21  FUNCIONES FALTANTES (nuevas)
--  Requeridas por sp_adquisicion_equipamiento
-- ══════════════════════════════════════════════════════════════

-- ── 4.20  fn_random_id_persona ──────────────────────────────
-- Selecciona un ID aleatorio de tbb_personas
-- IMPORTANTE: Requiere que exista al menos 1 persona registrada.
--   Ejecuta primero sp_poblar_pacientes para poblar la tabla.

DROP FUNCTION IF EXISTS fn_random_id_persona$$
CREATE FUNCTION fn_random_id_persona()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_id INT;

    SELECT ID INTO v_id
    FROM tbb_personas
    ORDER BY RAND()
    LIMIT 1;

    -- Si la tabla está vacía, retorna 1 como fallback
    IF v_id IS NULL THEN
        SET v_id = 1;
    END IF;

    RETURN v_id;
END$$


-- ── 4.21  fn_random_espacio_id ──────────────────────────────
-- Selecciona un ID aleatorio de tbc_espacios
-- IMPORTANTE: Requiere datos iniciales en tbc_espacios
--   (ya insertados en la sección 3 de este script)

DROP FUNCTION IF EXISTS fn_random_espacio_id$$
CREATE FUNCTION fn_random_espacio_id()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_id INT;

    SELECT ID INTO v_id
    FROM tbc_espacios
    ORDER BY RAND()
    LIMIT 1;

    -- Si la tabla está vacía, retorna 1 como fallback
    IF v_id IS NULL THEN
        SET v_id = 1;
    END IF;

    RETURN v_id;
END$$


-- ══════════════════════════════════════════════════════════════
--  5) STORED PROCEDURES
-- ══════════════════════════════════════════════════════════════

-- ── 5.1  sp_poblar_pacientes ────────────────────────────────
-- CORREGIDO: 7 parámetros (se agregó p_etapa_vida)
--            y se eliminó la coma extra en la declaración

DROP PROCEDURE IF EXISTS sp_poblar_pacientes$$
CREATE PROCEDURE sp_poblar_pacientes(
    IN p_cantidad       INT,
    IN p_genero         VARCHAR(3),
    IN p_edad_min       INT,
    IN p_edad_max       INT,
    IN p_estatus_vida   VARCHAR(20),
    IN p_estatus_medico VARCHAR(150),
    IN p_etapa_vida     VARCHAR(50)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_genero VARCHAR(3);
    DECLARE v_curp VARCHAR(20);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_apellido1 VARCHAR(60);
    DECLARE v_apellido2 VARCHAR(60);
    DECLARE v_estatus_medico VARCHAR(150);
    DECLARE v_estatus_vida VARCHAR(20);
    DECLARE v_fecha_nac DATE;
    DECLARE v_pais VARCHAR(20);
    DECLARE v_now DATETIME;
    DECLARE v_edad INT;
    DECLARE v_id INT;
    DECLARE v_intentos INT DEFAULT 0;
    DECLARE v_batch_size INT DEFAULT 1000;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @p1 = MESSAGE_TEXT;
        ROLLBACK;
        SELECT @p1 AS error_real;
    END;

    IF p_genero IS NOT NULL AND p_genero NOT IN ('H','M','N/B') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Genero invalido. Valores permitidos: M, H, N/B';
    END IF;

    IF p_edad_min IS NULL OR p_edad_min < 0 THEN
        SET p_edad_min = 0;
    END IF;

    IF p_edad_max IS NULL OR p_edad_max > 120 THEN
        SET p_edad_max = 100;
    END IF;

    IF p_edad_min > p_edad_max THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Rango de edad inválido';
    END IF;

    IF p_cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cantidad inválida';
    END IF;

    START TRANSACTION;
    SET v_now = NOW();

    WHILE i < p_cantidad DO

        SET v_genero = fn_generar_genero();
        IF p_genero IS NOT NULL AND TRIM(p_genero) IN ('H','M','N/B') THEN
            SET v_genero = TRIM(p_genero);
        END IF;

        IF p_estatus_medico IS NULL OR TRIM(p_estatus_medico) = '' THEN
            SET v_estatus_medico = fn_genera_estatus_medico();
        ELSE
            SET v_estatus_medico = p_estatus_medico;
        END IF;

        IF p_estatus_vida IS NULL OR TRIM(p_estatus_vida) = '' THEN
            SET v_estatus_vida = fn_genera_estatus_vida();
        ELSE
            SET v_estatus_vida = p_estatus_vida;
        END IF;

        SET v_edad = p_edad_min + FLOOR(RAND()*(p_edad_max - p_edad_min + 1));
        SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL v_edad YEAR);
        SET v_nombre = fn_generar_nombre(v_genero);
        SET v_apellido1 = fn_generar_apellido();
        SET v_apellido2 = fn_generar_apellido();
        SET v_intentos = 0;

        WHILE v_apellido1 = v_apellido2 AND v_intentos < 5 DO
            SET v_apellido2 = fn_generar_apellido();
            SET v_intentos = v_intentos + 1;
        END WHILE;

        SET v_curp = fn_generar_curp(
            v_nombre,
            v_apellido1,
            v_apellido2,
            v_fecha_nac,
            v_genero
        );

        SET @v_rfc = fn_generar_rfc(
            v_nombre,
            v_apellido1,
            v_apellido2,
            v_fecha_nac
        );

        INSERT INTO tbb_personas (
            tipo,
            rfc,
            pais_origen,
            fecha_registro,
            fecha_actualizacion,
            estatus
        ) VALUES (
            'Fisica',
            @v_rfc,
            fn_generar_pais(),
            v_now,
            NULL,
            1
        );

        SET v_id = LAST_INSERT_ID();

        INSERT INTO tbb_personas_fisicas (
            ID,
            titulo_cortesia,
            nombre,
            primer_apellido,
            segundo_apellido,
            genero,
            fecha_nacimiento,
            curp,
            grupo_sanguineo,
            fecha_registro,
            fecha_actualizacion,
            estatus
        ) VALUES(
            v_id,
            fn_generar_titulo(v_genero, v_edad),
            v_nombre,
            v_apellido1,
            v_apellido2,
            v_genero,
            v_fecha_nac,
            v_curp,
            fn_grupo_sanguineo(),
            v_now,
            NULL,
            1
        );

        INSERT INTO tbb_pacientes (
            ID,
            estatus_medico,
            estatus_vida,
            fecha_ultima_cita_medica,
            fecha_registro,
            fecha_actualizacion,
            estatus
        ) VALUES(
            v_id,
            v_estatus_medico,
            v_estatus_vida,
            v_now,
            v_now,
            NULL,
            1
        );

        SET i = i + 1;

        IF i MOD v_batch_size = 0 THEN
            COMMIT;
            START TRANSACTION;
        END IF;

    END WHILE;

    COMMIT;
END$$


-- ── 5.2  sp_adquisicion_equipamiento ────────────────────────
-- Sin cambios respecto al original

DROP PROCEDURE IF EXISTS sp_adquisicion_equipamiento$$
CREATE PROCEDURE sp_adquisicion_equipamiento(
    IN  p_cantidad              INT,
    IN  p_id_persona            INT,
    IN  p_nombre                VARCHAR(100),
    IN  p_contacto              VARCHAR(50),
    IN  p_especialidad          VARCHAR(100),
    IN  p_tipo_transaccion      VARCHAR(20),
    IN  p_fecha_transaccion     DATETIME,
    IN  p_referencia            VARCHAR(100),
    IN  p_espacio_id            INT,
    IN  p_nombre_equipo         VARCHAR(100),
    IN  p_marca                 VARCHAR(50),

    OUT p_registros_insertados  INT,
    OUT p_ultimo_id_proveedor   INT,
    OUT p_ultimo_id_transaccion INT,
    OUT p_ultimo_id_equipamiento INT
)
BEGIN
    DECLARE v_i           INT DEFAULT 1;
    DECLARE v_lote_actual INT DEFAULT 0;

    DECLARE v_id_persona        INT;
    DECLARE v_nombre            VARCHAR(100);
    DECLARE v_contacto          VARCHAR(50);
    DECLARE v_especialidad      VARCHAR(100);
    DECLARE v_tipo_transaccion  VARCHAR(20);
    DECLARE v_fecha_transaccion DATETIME;
    DECLARE v_referencia        VARCHAR(100);
    DECLARE v_espacio_id        INT;
    DECLARE v_nombre_equipo     VARCHAR(100);
    DECLARE v_marca             VARCHAR(50);
    DECLARE v_id_proveedor      INT;
    DECLARE v_id_transaccion    INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET p_registros_insertados = 0;
    IF p_cantidad < 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'p_cantidad debe ser mayor o igual a 1';
    END IF;
    START TRANSACTION;

    WHILE v_i <= p_cantidad DO
        SET v_id_persona = IFNULL(p_id_persona, fn_random_id_persona());
        SET v_nombre = IFNULL(p_nombre, fn_nombre_proveedor());
        SET v_contacto = IFNULL(p_contacto,
            CONCAT(
                ELT(FLOOR(1 + RAND() * 5),
                    'ventas', 'contacto', 'compras', 'atencion', 'soporte'),
                FLOOR(10 + RAND() * 90),
                '@proveedor.com.mx'
            )
        );
        SET v_especialidad = IFNULL(p_especialidad,
            ELT(FLOOR(1 + RAND() * 10),
                'Equipamiento medico de diagnostico',
                'Instrumental quirurgico',
                'Mobiliario hospitalario',
                'Equipamiento de laboratorio',
                'Dispositivos de monitoreo',
                'Equipamiento de rehabilitacion',
                'Suministros de cuidados intensivos',
                'Equipamiento de imagenologia',
                'Dispositivos de terapia respiratoria',
                'Equipamiento de emergencias'
            )
        );
        SET v_tipo_transaccion = IFNULL(p_tipo_transaccion,
            ELT(FLOOR(1 + RAND() * 3), 'Pago', 'Abono', 'Nota de Credito')
        );
        SET v_fecha_transaccion = IFNULL(p_fecha_transaccion,
            DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
        );
        SET v_referencia = IFNULL(p_referencia,
            CONCAT(
                ELT(FLOOR(1 + RAND() * 4), 'OC', 'REF', 'TRX', 'FAC'),
                '-', YEAR(NOW()), '-',
                LPAD(FLOOR(1 + RAND() * 99999), 5, '0')
            )
        );
        SET v_espacio_id    = IFNULL(p_espacio_id,    fn_random_espacio_id());
        SET v_nombre_equipo = IFNULL(p_nombre_equipo, fn_nombre_equipo_medico());
        SET v_marca = IFNULL(p_marca,
            ELT(FLOOR(1 + RAND() * 12),
                'Philips',   'GE Healthcare',       'Siemens Healthineers',
                'Medtronic', 'Stryker',             'Baxter',
                'Abbott',    'Mindray',             'Nihon Kohden',
                'Drager',    'Spacelabs',           'Welch Allyn'
            )
        );

        INSERT INTO tbb_Proveedores
            (Id_persona, Nombre, Contacto, Especialidad)
        VALUES
            (v_id_persona, v_nombre, v_contacto, v_especialidad);
        SET v_id_proveedor = LAST_INSERT_ID();

        INSERT INTO tbb_Transacciones_Financieras
            (Proveedor_ID, Tipo_Transacciones, Fecha_Transaccion, Referencia)
        VALUES
            (v_id_proveedor, v_tipo_transaccion, v_fecha_transaccion, v_referencia);
        SET v_id_transaccion = LAST_INSERT_ID();

        INSERT INTO tbc_Equipamientos
            (Proveedor_ID, Espacio_ID, Nombre, Marca)
        VALUES
            (v_id_proveedor, v_espacio_id, v_nombre_equipo, v_marca);

        SET p_ultimo_id_proveedor    = v_id_proveedor;
        SET p_ultimo_id_transaccion  = v_id_transaccion;
        SET p_ultimo_id_equipamiento = LAST_INSERT_ID();

        SET v_i           = v_i + 1;
        SET v_lote_actual = v_lote_actual + 1;

        IF v_lote_actual >= 1000 THEN
            COMMIT;
            SET p_registros_insertados = p_registros_insertados + v_lote_actual;
            SET v_lote_actual          = 0;
            START TRANSACTION;
        END IF;

    END WHILE;

    IF v_lote_actual > 0 THEN
        COMMIT;
        SET p_registros_insertados = p_registros_insertados + v_lote_actual;
    END IF;
END$$


DELIMITER ;

-- ══════════════════════════════════════════════════════════════
--  ¡LISTO! Base de datos configurada.
--
--  Orden de ejecución recomendado desde la API:
--  1) Ejecutar este script para crear la BD, tablas y funciones
--  2) Llamar a sp_poblar_pacientes para crear personas base
--     (necesario antes de sp_adquisicion_equipamiento)
--  3) Llamar a sp_adquisicion_equipamiento para registrar
--     proveedores, transacciones y equipamiento
-- ══════════════════════════════════════════════════════════════
