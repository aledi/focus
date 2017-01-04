-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-01-2017 a las 01:04:37
-- Versión del servidor: 5.5.42
-- Versión de PHP: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `focus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Encuesta`
--

CREATE TABLE `Encuesta` (
  `id` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Encuesta`
--

INSERT INTO `Encuesta` (`id`, `panel`, `nombre`, `fechaInicio`, `fechaFin`) VALUES
(1, 1, 'Encuesta MZ', '2016-08-06', '2016-11-30'),
(7, 3, 'Bronco', '2016-09-01', '2016-11-30'),
(9, 5, 'Encuesta de satisfacción del cliente', '2016-09-01', '2016-11-30'),
(14, 9, 'Evaluación SP', '2016-10-17', '2016-10-30'),
(16, 11, 'Elecciones Coahuila', '2016-11-01', '2016-11-30'),
(17, 12, 'Encuesta de Pruebas', '2016-01-01', '2016-12-31'),
(18, 11, 'Encuesta Electoral 2016', '2016-12-12', '2016-12-22'),
(19, 13, 'Probando', '2016-12-17', '2016-12-22'),
(23, 3, 'PRUEBA', '2016-01-01', '2017-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial`
--

CREATE TABLE `Historial` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `nombrePanelista` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `panel` int(11) NOT NULL,
  `nombrePanel` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fechaInicioPanel` date DEFAULT NULL,
  `fechaFinPanel` date DEFAULT NULL,
  `encuesta` int(11) NOT NULL,
  `nombreEncuesta` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fechaInicioEncuesta` date DEFAULT NULL,
  `fechaFinEncuesta` date DEFAULT NULL,
  `fechaRespuesta` date DEFAULT NULL,
  `horaRespuesta` time DEFAULT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Historial`
--

INSERT INTO `Historial` (`id`, `panelista`, `nombrePanelista`, `panel`, `nombrePanel`, `fechaInicioPanel`, `fechaFinPanel`, `encuesta`, `nombreEncuesta`, `fechaInicioEncuesta`, `fechaFinEncuesta`, `fechaRespuesta`, `horaRespuesta`, `estado`) VALUES
(47, 1, 'Pruebas Pruebas', 3, 'Bronco', '2016-09-24', '2016-11-30', 0, '', NULL, NULL, NULL, NULL, 1),
(48, 1, 'Pruebas Pruebas', 3, 'Bronco', '2016-09-24', '2016-11-30', 7, 'Bronco', '2016-09-01', '2016-11-30', '2016-12-27', '01:00:00', 1),
(49, 446, 'Pablo Castilla', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(50, 447, 'Dante Ruiz', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(51, 448, 'Juan Flores', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(52, 449, 'Selene Martinez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(53, 450, 'Marcelo Garay', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(54, 452, 'Eduardo Sabdoval', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(55, 459, 'Alberto Ang', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(56, 463, 'Gabriel Lopez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(57, 465, 'Jose Romo', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(58, 466, 'Luisa Loaiza', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(59, 467, 'Roberto Lozano', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(60, 475, 'Antonio Machado', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(61, 476, 'Carlos López', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(62, 477, 'Maria Lopez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(63, 478, 'Jose Lopez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(64, 480, 'Elizabeth Lopez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(65, 481, 'Fernando Lopez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(66, 482, 'Javier Lopez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(67, 483, 'Ddmingo Saucedo', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1),
(68, 492, 'Gerardo Hernandez', 3, 'Bronco', '2016-09-24', '2016-11-30', 23, 'PRUEBA', '2016-01-01', '2017-01-01', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panel`
--

CREATE TABLE `Panel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `numParticipantes` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `creador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `numParticipantes`, `cliente`, `creador`) VALUES
(1, 'Margarita Zavala', '', '2016-09-20', '2016-11-30', 100, 7, 1),
(3, 'Bronco', '', '2016-09-24', '2016-11-30', 100, 3, 1),
(5, 'Pollo Loco', '', '2016-09-28', '2016-11-30', 100, 4, 1),
(8, 'Preferencias de Consumo', '', '2016-01-01', '2017-01-01', 100, 5, 1),
(9, 'San Pedro', '', '2016-10-17', '2017-10-17', 100, 9, 1),
(11, 'Coahuila', '', '2016-12-01', '2017-12-01', 400, 11, 1),
(12, 'Panel Prueba', '** NO BORRAR **\nPanel de Pruebas', '2016-01-01', '2019-01-01', 5, 5, 1),
(13, 'Prueba esve', '', '2016-12-01', '2016-12-22', 2, 12, 1),
(14, 'nada ', '', '2016-12-19', '2017-01-01', 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panelista`
--

CREATE TABLE `Panelista` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `genero` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `educacion` int(11) NOT NULL,
  `calleNumero` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `colonia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `cp` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `deviceToken` text COLLATE utf8_spanish_ci NOT NULL,
  `deviceType` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panelista`
--

INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`, `fechaRegistro`, `deviceToken`, `deviceType`) VALUES
(1, 'test', 'test', 'Pruebas', 'Pruebas', 'ecristerna@icloud.com', 0, '1900-09-04', 5, 'Calle 500', 'Colonia', 'Monterrey', 'NL', 12345, '2016-12-01', '7364d5cb7a122601e01f9bf219f1657dc134743c36553515bfcc5ae9d7ba1786', 1),
(446, 'pablo', 'castilla', 'Pablo', 'Castilla', 'pablo@hotmail.com', 0, '1980-10-30', 5, 'Tapia', 'Centro', 'Monterrey', 'NL', 66579, NULL, '', 0),
(447, 'dante8', 'ruiz', 'Dante', 'Ruiz', 'dante@hotmail.com', 0, '1990-01-01', 4, 'Peñoles 708', 'Los Pinos', 'Guadalupe', 'NL', 65321, NULL, '', 0),
(448, 'juan8', 'flores', 'Juan', 'Flores', 'dfgig@hotmail.com', 0, '1980-08-21', 4, 'Vía satélite', 'Brisas', 'Monterrey', 'NL', 62346, NULL, '', 0),
(449, 'selene2', 'martinez', 'Selene', 'Martinez', 'selenez@hotmail.com', 1, '1980-05-01', 2, 'Inglaterra 401', 'La Fama', 'Santa Catarina', 'NL', 61765, NULL, '', 0),
(450, 'marcelo', 'garay', 'Marcelo', 'Garay', 'mkgjdo@hotmail.com', 0, '1984-07-04', 2, 'Rincón', 'Juárez', 'Monterrey', 'NL', 62324, NULL, '', 0),
(452, 'lalo', 'sandovsl', 'Eduardo', 'Sabdoval', 'sabdoval@me.com', 0, '1998-09-30', 5, 'seis 4', 'sss', 'monteyyey', 'NL', 55541, NULL, '', 0),
(454, 'esveydi', 'elizabeth', 'Esveydi', 'Verdugo Maytorena', 'esveydi@focuscg.com.mx', 1, '1980-07-27', 4, 'Bahía de Alicante  37', 'Bahía de la primavera ', 'Monterrey', 'NL', 64835, NULL, '91820d4eadbc315a798e8bf953544838371919be0ac899f37910003d3545cbc7', 1),
(455, 'hectorzuno', 'Frutsicrew1', 'Hector', 'Zuno', 'hectorzuno92@gmail.com', 0, '1992-01-03', 4, 'zafiro 1000', 'canterias ', 'monterrey', 'NL', 64989, NULL, 'a8d33d0897ea6d1a2b98e005b038d5edf31bc6489f841040027178d65dfca19c', 1),
(456, 'marcela', 'rios', 'Marcela', 'Rios', 'jdfi@hotmail.com', 1, '1983-07-01', 4, 'Independencia', 'Centro', 'Monterrey', 'NL', 66456, NULL, '', 0),
(457, 'Felipe Flores', 'w2tqzn2f', 'Felipe', 'Flores', 'felipe@comunicacionpolitica.com.mx', 0, '1975-08-30', 5, 'Rosellino 815', 'Contry La Silla', 'Guadalupe', 'NL', 67173, NULL, '', 0),
(458, 'Kevinzapata', 'politicas', 'kevin', 'Zapata Celestino', 'kevinzapata2012@gmail.com', 0, '1990-09-28', 5, 'Gustavo Adolfo Becquer 512', 'Anahuac', 'San Nicolas De Los Garza', 'NL', 66450, NULL, '', 0),
(459, 'anglara', '67176ang', 'Alberto', 'Ang', 'anglara@hotmail.com', 0, '1996-07-16', 4, 'maple 2864', 'Bosques del Contry', 'Guadalupe', 'NL', 67176, NULL, 'd11d49187cff281989a0ea3ebdee0084bf0d83052a7ec4a08880ca1896b34d4b', 1),
(461, 'pedro', 'rios', 'Pedro', 'Rios', 'nfkirir@hotmail.com', 0, '1980-05-05', 5, 'rincon 2103', 'juarez', 'monterrey', 'NL', 64823, NULL, '', 0),
(462, 'margaritaz', 'pedro', 'Margsrita', 'Gutierrez', 'margaritagtz@focuscg.com', -1, '0000-00-00', 4, ' ', '', '', '', 0, NULL, '', 0),
(463, 'gabriel', 'lopez', 'Gabriel', 'Lopez', 'gabyy_89@hotmail.com', 0, '1970-01-01', 4, 'Independencia 233', 'Centro', 'Monterrey', 'NL', 66789, NULL, '', 0),
(464, 'ruben', 'silva', 'Enrique', 'Silva ', 'enriquesilva@focuscg.con.mx', 0, '1963-01-07', 5, 'independencia 233', 'centro', 'san pedro', 'NL', 66230, NULL, '', 0),
(465, 'jose4', 'romo', 'Jose', 'Romo', 'jose@hotmail.com', 0, '1980-01-17', 3, 'Juarez', 'Centro', 'San Pedro', 'NL', 66230, NULL, '', 0),
(466, 'luisa', 'loaiza', 'Luisa', 'Loaiza', 'loaiza@hotmail.com', 1, '1984-11-07', 4, 'Libertad', 'Centro', 'San Pedro', 'NL', 66230, NULL, '', 0),
(467, 'roberto2', 'lozano', 'Roberto', 'Lozano', 'ljfgihf@hotmail.com', 0, '1981-04-01', 4, 'Hidalgo', 'Centro', 'San Pedro', 'NL', 66230, NULL, '', 0),
(468, 'ugo', 'uy', 'Er', 'Sd', 'ed', 0, '1998-10-26', 4, 'ddf zxx', 'zxx', 'cff', 'CAMP', 25484, NULL, '', 0),
(469, 'sescalera', 'economia77', 'Sandra', 'Escalera', 'escalera.sandra@gmail.com', 1, '1998-01-01', 4, 'San Jose 5630', 'Villa Mitras', 'Monterrey', 'NL', 64170, NULL, '', 0),
(470, 'taniavm', 'INUYASHA_tania95', 'Tania', 'Valdez', 'tania_rt95@live.com', 1, '1998-05-04', 4, ' ', '', '', '', 0, NULL, '', 0),
(471, 'meredith', 'qweasdzxc', 'Meredith', 'Valdez', 'A00816838@itesm.mx', 1, '1998-11-04', 4, 'hidalgo 657', 'monterrey', 'monterrey', 'NL', 8549, NULL, 'fda293868d0de849b2e26d0d146da2a636f201848c623c6bb551107cad3517c6', 1),
(472, 'robleslidia', 'Lacajeta', 'Lidia', 'Robles', 'lidia.robles@cuamoc.com', -1, '0000-00-00', 5, ' ', '', '', '', 0, NULL, '', 0),
(473, 'Miguel', 'carito', 'Miguel', 'Almaguer', 'malmaguer@frisa.com', 0, '1959-03-01', 5, 'Montaña Boreal 208', 'Sierra Alta', 'Monterrey', 'NL', 64989, NULL, '', 0),
(475, 'guarigocho', '12345678', 'Antonio', 'Machado', 'gazacarigua@gmail.com', 0, '1983-07-03', 4, 'Zacatecas 88', 'El Limon', 'Cosolea', 'VER', 58080, NULL, '', 0),
(476, 'clopez', 'lopez2', 'Carlos', 'López', 'ligpdf@hotmail.com', 0, '1980-01-18', 3, 'Centro', 'Centro', 'Monterrey', 'NL', 66456, NULL, 'b39c78b4a2be454167f894da32a961e4d35d0e651cdb41842821e392b1e45429', 1),
(477, 'mlopez', 'lopez2', 'Maria', 'Lopez', 'mdififjq@hotmail.com', 1, '1979-04-17', 5, 'Juarez', 'Centro', 'Monterrey', 'NL', 64533, NULL, '', 0),
(478, 'jlopez', 'lopez2', 'Jose', 'Lopez', 'jlopez@hotmail.com', 0, '1982-06-19', 4, 'Morelos', 'Centro', 'Monterrey', 'NL', 65789, NULL, '', 0),
(479, 'Edgar', '7773', 'Edgar', 'Ache', 'edgarache13@hotmail.com', 0, '1973-03-30', 5, ' ', '', '', '', 0, NULL, '64fcd2d7e828d58f493655188d43a712418d580a876f9bbe012d4f2889fb4d80', 1),
(480, 'elopez', 'lopez2', 'Elizabeth', 'Lopez', 'ksgijdf@hotmail.com', 1, '1980-08-15', 4, 'Independencia', 'Centro', 'San Pedro', 'NL', 66230, NULL, '', 0),
(481, 'flopez', 'lopez2', 'Fernando', 'Lopez', 'kdfghjdf@hotmail.com', 0, '1998-01-01', 5, 'Juarez', 'Centro', 'San Pedro', 'NL', 66230, NULL, '', 0),
(482, 'vlopez', 'lopez2', 'Javier', 'Lopez', 'jdkfgjf@hotmail.com', 0, '1976-04-16', 4, 'Corregidora', 'Centro', 'San Pedro', 'NL', 66230, NULL, '', 0),
(483, 'fer', 'fer1', 'Ddmingo', 'Saucedo', 'fee@gmail.com', 0, '1998-11-23', 5, 'hsjsj 11', 'sjsjsjs', 'sjsja', 'BC', 25840, NULL, '', 0),
(484, 'lalos', 'lalos1', 'Lalo', 'Lola', 'lalo@.gmail.mx', 0, '1998-01-24', 1, 'def 122', 'xxc', 'bdbd', 'BC', 53627, NULL, '', 0),
(485, 'uho', 'ugo', 'Ffg', 'Vvv', 'vvb', 0, '1998-09-25', 3, 'vh 2', 'gg', 'cvv', 'BC', 4785, NULL, 'dc953e77d6a85254a81b1721e9246ba172cfaca3547f227178fa22ae0117a4fe', 1),
(486, 'lisaflores', 'lisaflores08', 'Lisa María', 'Flores Aguirre', 'lisa_flores08@hotmail.com', 1, '1996-09-08', 4, 'Constitución 890', 'Benito Juarez', 'Cd. Acuña', 'COAH', 26215, NULL, '43936b846b7f85ea18c91b36d282cc7e9a890a4fff1cf5b9bf9576f67bb531e1', 1),
(487, 'anavaleriavt', 'mina2305', 'Valeria', 'Vazquez Tamez', 'anavaleria_97@hotmail.com', 1, '1997-01-23', 4, 'mina 2305', 'san andres', 'acuña', 'COAH', 26260, NULL, '66ea33fefc87edea5b4c27877bf18d719809bd1f81f13eca437505e6104601f8', 1),
(488, 'ricky.jmz', 'pprickymikey1', 'Ricardo', 'Jimenez', 'chaparrojimenez_@hotmail.com', 0, '1996-03-05', 4, 'Panama 363', 'Valle San Agustin', 'Saltillo', 'COAH', 25215, NULL, '220f2e71d8979631228ff6a4b7344d2028439e08177b5cebe1ac7c793b7669ca', 1),
(489, 'valeaguirrefdz', 'aguirre02', 'Valeria', 'Aguirre', 'valeria_3157@hotmail.com', 1, '1997-02-02', 4, 'Lerdo 410', 'Benito Juarez', 'Cd. Acuña', 'COAH', 26215, NULL, '', 0),
(490, 'eduardo', '18101993', 'Carlos Eduardo', 'Rodriguez', 'eduardo.rdz.hdz@hotmail.com', 0, '1992-10-27', 4, 'Arroyo De La Quebrada 2007', 'Manantiales Del Valle', 'Ramos Arizpe', 'COAH', 25904, NULL, '', 0),
(491, 'blanca esthela', 'telyhernandez', 'Blanca Esthela', 'Hernandez Regalado', 'telyhernandez6@autlook.com', 1, '1975-12-27', 3, 'Valle Mexicaly 213', 'Valle Poniente', 'Ramos Arizpe', 'COAH', 27800, NULL, '', 0),
(492, 'aher1053', '97018583', 'Gerardo', 'Hernandez', 'aher1053@gmail.com', 0, '1981-08-23', 3, 'Abasolo 1009', 'Centro', 'Saltillo', 'COAH', 25000, NULL, '', 0),
(493, 'jacqueline', 'abrilita90226', 'Jacqueline Concepcion', 'Perez Veda', 'abrilita73@gmail.com', 1, '1992-01-29', 3, 'Mision De Santa Fe 938', 'Capistrano', 'Acuña', 'COAH', 26269, NULL, '', 0),
(494, 'Naominyu', 'Nomiko1825', 'Alfredo', 'Flores', 'anifred.flores@gmail.com', 0, '1988-06-25', 4, 'Victoria 1170', 'Centro', 'Acuña', 'COAH', 26200, NULL, '', 0),
(495, 'aaronpm', '6699', 'Aaron', 'Paredes', '13aaronparedes@live.com', 0, '1975-11-13', 2, 'H Colegio Militar Y Higueras 196', 'Frac Las ALAMEDAS', 'CD Acuña', 'COAH', 26200, NULL, '', 0),
(496, 'brendarodriguez', 'villalobos1995', 'Brenda', 'Rodriguez', 'dulceguionbajoespecial@gmail.com', 1, '1995-02-20', 2, 'Moroleon 212', 'Paraiso', 'Acuna', 'COAH', 26284, NULL, '', 0),
(497, 'thania', 'luis', 'Thania pamela', 'Melchor Hernández', 'thania.90.01@gmail.com', 1, '1990-09-01', 3, '2 De Abril 600', 'Centro', 'Acuña', 'COAH', 26200, NULL, '', 0),
(498, 'marianaa.rm', 'mariana3', 'Mariana ', 'Romo ', 'mariana_rm3@hotmail.com', 1, '1994-08-03', 4, 'coruña  509', 'ampliacion la rosita ', 'torreon ', 'COAH', 27250, NULL, 'da0dca8a0aa9751d62541f48ab27001cc3bb20866dbe5488e0177600a2e13277', 1),
(499, 'jakiiCQ', 'MYLOVE11', 'Jaqueline', 'Romo T', 'ikaj_mot_vor@hotmail.com', 1, '1996-11-30', 3, 'Cervantes 316', 'Tecnológico', 'Piedras Negras', 'COAH', 26000, NULL, '', 0),
(500, 'merazr', 'camila14', 'Rafael', 'Meraz', 'meraz_rafael@hotmail.com', 0, '1983-11-25', 5, 'Benjamin Canales 2710', 'Santa Martha', 'Acuña', 'COAH', 26269, NULL, '', 0),
(501, 'zuzy', '15001', 'Susan', 'Lozano', 'zuzylozano8@gmail.com', 1, '1980-05-10', 3, '20 De Noviembre 1453', 'Atilano', 'Acuña', 'COAH', 2563, NULL, '', 0),
(502, 'Esmeralda', 'mily2006', 'María Esmeralda', 'Zuñiga Castañeda', 'maeszuce@gmail.com', 0, '1972-08-12', 4, 'Campo De Julias 1042', 'Campo Nuevo', 'Torreón', 'COAH', 27277, NULL, '', 0),
(503, 'jose pardo', 'josepardo', 'Jose Angel', 'Pardo', 'joseangel_pardo@hotmail.es', 0, '1981-06-17', 2, 'Almez 300', 'Cedros', 'Acuña', 'COAH', 26233, NULL, '', 0),
(504, 'marco antonio', '878perro', 'Marco Antonio', 'Rodriguez Polanco', 'yample@hotmail.com', 0, '1988-06-23', 3, 'Nicolas Brabo 917', 'Ruben Moreira', 'Piedras negras', 'COAH', 0, NULL, '', 0),
(505, '8771144200', '12345', 'Alondra Ruby', 'Flores', 'alondtarubyf@gmail.com', 1, '1987-05-17', 2, 'Nueve 1190', 'Gamez Sumaran', 'Acuña', 'COAH', 26288, NULL, '', 0),
(506, 'Missa', 'ArelyLaredo', 'Angel Misael', 'Arriaga Suarez', 'misael-022011@hotmail.com', 0, '1998-09-15', 3, 'Unión 174', 'Barrio Santa Anita', 'Saltillo', 'COAH', 25000, NULL, '', 0),
(507, 'Rocio', 'allison12', 'Elizabeth', 'Saucedo Gonzalez', 'rocio-1999@live.com.mx', 1, '1996-04-30', 3, 'Avenida La Rioja #2204', 'Valencia', 'Saltillo', 'COAH', 25116, NULL, '', 0),
(508, 'alejandro', 'siempreatulado', 'Alejandro', 'Lopez', 'aleksmedina15@gmail.com', 0, '1975-02-26', 2, 'Plaza De Armas 335', 'Saltillo 2000', 'Saltillo', 'COAH', 25115, NULL, '', 0),
(509, '8661747159', '0324040916', 'Valeria', 'Muñoz Glz', 'valeria-_12@hotmail.com', 1, '1998-01-30', 3, 'Apostol Pedro #2117', 'Campanario', 'Monclova', 'COAH', 25743, '2016-12-09', '', 0),
(510, 'Guadalupe', '16junio14', 'A. Gpe', 'Olivo', 'linkin_pinck@hotmail.com', 1, '1996-09-04', 4, 'Leandro Valle 190', 'Indep', 'Castaños', 'COAH', 25870, '2016-12-09', '', 0),
(511, 'chelo123', '67176ang', 'Djsjxksd', 'Ndndnz', 'anglara00@gmail.com', 0, '1994-12-09', 3, ' ', '', '', '', 0, '2016-12-09', '', 0),
(512, 'gabo', '0908', 'Gabriel', 'Madrid', 'mago1928@outlook.com', 0, '1994-07-08', 3, 'Magnolia 241', 'Fracc. Valle Del Sol', 'Acuña', 'COAH', 26283, '2016-12-09', '', 0),
(513, 'inge rich', 'Militares1', 'Ricardo', 'Ponce', 'raultorres470@gmail.com', 0, '1986-07-31', 4, '20 211', 'Herradura', 'Saltillo', 'COAH', 25056, '2016-12-09', '', 0),
(514, 'hayes', 'hayes201013', 'Enrique', 'Ríos Chavez', 'erch98@gmail.com', 0, '1970-01-07', 4, 'Circonia 445', 'El Pedregal', 'Torreón', 'COAH', 27054, '2016-12-09', '', 0),
(515, 'danielk', 'miranda84', 'Adan', 'Miranda Martinez', 'mirandaadan62@gmail.com', 0, '1984-11-14', 3, 'Cuarzo 61', 'Perlas Del Oriente', 'Torreon', 'COAH', 27277, '2016-12-09', '', 0),
(516, 'saul.0923', 'saulrivera0923', 'Saul', 'Rivera', 'saul.rivers0923@gmail.com', 0, '1998-03-18', 3, 'Segunda 1359', 'Eduardo Guerra', 'Torreon', 'COAH', 27280, '2016-12-09', '', 0),
(517, 'Gabriela charles', 'gchvaladez', 'Gabriela', 'Charles Valadez', 'gabycharlesv@hotmail.com', 1, '1976-04-24', 4, 'Secundaria 6 948', 'Obrera Sur', 'Monclova', 'COAH', 25790, '2016-12-10', '', 0),
(518, 'Judith flores', 'kladruber12', 'Judith', 'Flores Llanas', 'fjudith736@gmail.com', 1, '1998-10-28', 3, 'Jesus Reyes Heroles 610', 'La Palma', 'Saltillo', 'COAH', 25023, '2016-12-10', '', 0),
(519, 'kikejmez', 'teamoprincesa', 'Enrique', 'Rodriguez Jimenez', 'kikejmez@gmail.com', 0, '1994-11-24', 4, 'Alfredo V Bonfil 110', 'Bellavista', 'Saltillo', 'COAH', 25060, '2016-12-10', '', 0),
(520, 'sergio', 'Pacheco', 'sergio', 'ramirez gonzalez', 'sergioelnegro67@gmail.com', 0, '1982-04-01', 2, 'guadalupe 1007', 'noblasi2', 'acuña coahuila', 'COAH', 0, '2016-12-11', '', 0),
(521, 'Jaqueline', 'ARTESPLASTICAS1212', 'Jaqueline Arlette', 'Calvillo Rodriguez', 'arlette9627_caro@hotmail.com', 1, '1996-07-27', 4, 'Av.Bugambilias 1190', 'Nogal', 'Matamoros', 'COAH', 27440, '2016-12-11', '', 0),
(522, 'mariah-1968@hotmail.com', 'alicia1968', 'Maria Alicia', 'Venegas Fernández', 'mariah-1968@hotmail.com', 1, '1968-12-01', 3, 'Avenida 27 de Noviembre 120', 'El Tajito', 'Torreón', 'COAH', 27100, '2016-12-12', '', 0),
(523, 'mercedes hernandez', 'paquito07', 'Mercedes', 'Hernandez', 'mercyhdz@gmai.com', 1, '1986-09-24', 4, '28 De Marzo 909', 'Altos De Sta Teresa', 'Acuña', 'COAH', 26326, '2016-12-13', '', 0),
(524, 'jose rdz', 'jose0123', 'Jose', 'Rodrigez', 'joserdz@gmail.com', 0, '1982-02-22', 2, 'Pedro Coronel 502', 'Axoros', 'Acuna', 'COAH', 20232, '2016-12-13', '', 0),
(525, 'valesabs', 'Dvmonterrey2014!', 'Valeria ', 'Santos Abundis ', 'valestsabs@hotmail.com', 1, '1995-09-23', 4, 'nobel 1306', 'tecnologico', 'Monclova', 'COAH', 25716, '2016-12-14', '2f3d69ffaf7d789121f4f47cc22dbba253b2a14cada63294240abb431a13a29c', 1),
(526, 'angeles71', 'angel0363', 'Angeles', 'Mendoza', 'angelesmendoza71@hotmail.com', 1, '1971-09-01', 4, 'Panama 363', 'Valle San Agustin', 'Saltillo', 'COAH', 25215, '2016-12-14', '', 0),
(527, 'hasaucedo', 'alex1989', 'Hugo Alejandro', 'Saucedo Neaves', 'alex1989_2@hotmail.com', 0, '1989-07-21', 4, 'Encino 890', 'Zaragoza', 'Saltillo', 'COAH', 25016, '2016-12-14', '', 0),
(528, 'yael balderas', '20,03y11,10', 'Jessica Luisa Yael', 'Balderas Sosa', 'joseandrehdz@gmail.com', 0, '1998-10-05', 2, 'Nuez Brantome 136', 'Quintas Los Nogales', 'Torreón', 'COAH', 27087, '2016-12-15', '', 0),
(529, 'Alejandraa', 'aaaa', 'Alejandra', 'Alejandra', 'a@a.a', 1, '1993-01-01', 2, 'Alejandra Alejandra', 'Alejandra', 'Calvillo', 'COAH', 2580, '2016-12-15', '', 0),
(530, 'joydom', 'lorena13', 'Lorena', 'Avarado De Luna', 'lorena.adl@live.com', 1, '1993-01-07', 4, 'blvd los alamos  410', 'fracc los alamos', 'Acuña', 'COAH', 26240, '2016-12-15', '5a3aa38525f0dce6c0e101fe6faa34313e3f527e3abfb73a93ef4b617af08ce8', 1),
(531, 'rojooz', 'ickkckdbb5', 'Miguel Angel', 'Miranda Martínez', 'miki-angel111@hotmail.com', 0, '1996-10-09', 4, 'Ciencias Sociales 320', 'Magisterial', 'Frontera', 'COAH', 25629, '2016-12-16', '', 0),
(532, 'cinthia.2408', 'haareed', 'Cinthia', 'Siqueiros', 'jared.180116@gmail.con', 1, '1997-08-24', 3, 'Paseo De La Revolución 1066', 'Real Del Norte', 'Piedrad Negras', 'COAH', 26070, '2016-12-16', '', 0),
(533, 'bladimirls96', 'leosbladimir007', 'Bladimir Nicolas', 'Leos Salazae', 'leosbladimir@gmail.com', 0, '1996-02-05', 3, 'Septima 209', 'Presidentes #3', 'Piedras Negras', 'COAH', 26030, '2016-12-19', '', 0),
(534, 'Hectlalli', '8713910969', 'Hector javier', 'Romero salas', 'Nano03jeff00@hotmail.com', 0, '1996-07-16', 4, 'Fernanda 1457 B', 'Fracc. Anna', 'Torreon', 'COAH', 27410, '2016-12-22', '', 0),
(535, 'pattybalderas', 'moisesamor', 'Ana', 'Balderas Reyes', 'losekos2012@gmail.com', 1, '1990-07-13', 2, 'Mar Del Norte 1902', 'Villas Del Carmen', 'Piedras Negras', 'COAH', 26080, '2016-12-26', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PanelistaEnPanel`
--

CREATE TABLE `PanelistaEnPanel` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3055 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `PanelistaEnPanel`
--

INSERT INTO `PanelistaEnPanel` (`id`, `panelista`, `panel`, `estado`) VALUES
(1813, 446, 9, 1),
(1814, 447, 9, 1),
(1815, 448, 9, 1),
(1816, 449, 9, 1),
(1817, 454, 9, 1),
(1818, 461, 9, 1),
(1819, 463, 9, 1),
(1820, 464, 9, 1),
(1821, 465, 9, 1),
(1822, 466, 9, 1),
(1823, 467, 9, 1),
(2613, 446, 3, 1),
(2614, 447, 3, 1),
(2615, 448, 3, 1),
(2616, 449, 3, 1),
(2617, 450, 3, 1),
(2618, 452, 3, 1),
(2619, 459, 3, 1),
(2620, 463, 3, 1),
(2621, 465, 3, 1),
(2622, 466, 3, 1),
(2623, 467, 3, 1),
(2624, 475, 3, 1),
(2625, 476, 3, 1),
(2626, 477, 3, 1),
(2627, 478, 3, 1),
(2628, 480, 3, 1),
(2629, 481, 3, 1),
(2630, 482, 3, 1),
(2631, 483, 3, 1),
(2669, 446, 5, 1),
(2670, 447, 5, 1),
(2671, 448, 5, 1),
(2672, 449, 5, 1),
(2673, 450, 5, 1),
(2674, 452, 5, 1),
(2675, 454, 5, 1),
(2676, 455, 5, 1),
(2677, 457, 5, 1),
(2678, 458, 5, 1),
(2679, 459, 5, 1),
(2680, 463, 5, 1),
(2681, 475, 5, 1),
(2682, 476, 5, 1),
(2683, 477, 5, 1),
(2684, 478, 5, 1),
(2685, 480, 5, 1),
(2686, 481, 5, 1),
(2687, 482, 5, 1),
(2688, 483, 5, 1),
(2757, 446, 1, 1),
(2758, 447, 1, 1),
(2759, 448, 1, 1),
(2760, 449, 1, 1),
(2761, 450, 1, 1),
(2762, 452, 1, 1),
(2763, 454, 1, 1),
(2764, 455, 1, 1),
(2765, 456, 1, 1),
(2766, 457, 1, 1),
(2767, 458, 1, 1),
(2768, 459, 1, 1),
(2769, 461, 1, 1),
(2770, 463, 1, 1),
(2771, 465, 1, 1),
(2772, 466, 1, 1),
(2773, 467, 1, 1),
(2774, 475, 1, 1),
(2775, 476, 1, 1),
(2776, 477, 1, 1),
(2777, 478, 1, 1),
(2778, 480, 1, 1),
(2779, 481, 1, 1),
(2780, 482, 1, 1),
(2781, 483, 1, 1),
(2782, 485, 1, 1),
(2783, 1, 1, 0),
(2785, 1, 5, 0),
(2786, 1, 8, 0),
(2787, 1, 9, 0),
(2789, 1, 12, 0),
(3007, 532, 11, 1),
(3008, 531, 11, 1),
(3009, 528, 11, 1),
(3010, 530, 11, 1),
(3011, 525, 11, 1),
(3012, 526, 11, 1),
(3013, 527, 11, 1),
(3014, 524, 11, 1),
(3015, 523, 11, 1),
(3016, 522, 11, 1),
(3017, 520, 11, 1),
(3018, 517, 11, 1),
(3019, 518, 11, 1),
(3020, 519, 11, 1),
(3021, 509, 11, 1),
(3022, 513, 11, 1),
(3023, 514, 11, 1),
(3024, 515, 11, 1),
(3025, 516, 11, 1),
(3026, 512, 11, 1),
(3027, 499, 11, 1),
(3028, 498, 11, 1),
(3029, 497, 11, 1),
(3030, 496, 11, 1),
(3031, 495, 11, 1),
(3032, 494, 11, 1),
(3033, 493, 11, 1),
(3034, 500, 11, 1),
(3035, 501, 11, 1),
(3036, 502, 11, 1),
(3037, 503, 11, 1),
(3038, 504, 11, 1),
(3039, 505, 11, 1),
(3040, 506, 11, 1),
(3041, 507, 11, 1),
(3042, 508, 11, 1),
(3043, 492, 11, 1),
(3044, 486, 11, 1),
(3045, 487, 11, 1),
(3046, 488, 11, 1),
(3047, 489, 11, 1),
(3048, 454, 13, 1),
(3052, 492, 3, 1),
(3054, 1, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pregunta`
--

CREATE TABLE `Pregunta` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `titulo` text COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `combo` tinyint(1) NOT NULL,
  `numPregunta` int(11) NOT NULL,
  `pregunta` text COLLATE utf8_spanish_ci NOT NULL,
  `video` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `numOpciones` tinyint(4) NOT NULL,
  `opciones` text COLLATE utf8_spanish_ci NOT NULL,
  `numSubPreguntas` tinyint(4) NOT NULL,
  `subPreguntas` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Pregunta`
--

INSERT INTO `Pregunta` (`id`, `encuesta`, `titulo`, `tipo`, `combo`, `numPregunta`, `pregunta`, `video`, `imagen`, `numOpciones`, `opciones`, `numSubPreguntas`, `subPreguntas`) VALUES
(55, 7, '', 2, 0, 1, 'El primer año del “El Bronco”, ¿cumplió con sus expectativas? ', '', '', 4, 'Sí las cumplió&Las superó&Estuvo por debajo&No sé&&&&&&', 0, ''),
(56, 7, '', 2, 0, 2, '¿Cómo califica el primer año de gobierno de Jaime Rodríguez?', '', '', 10, '1&2&3&4&5&6&7&8&9&10', 0, ''),
(57, 7, '', 1, 0, 3, 'Diga en una palabra ¿cómo califica su gobierno? ', '', '', 0, '', 0, ''),
(58, 7, '', 2, 0, 4, '¿Qué opina de las propuestas del gobernador, como la invitación a los ciudadanos a tapar baches en las calles de sus colonias?', '', '', 3, 'No me agradan, y no participaría.&Sí me agradan, y sí participaría.&Me es indiferente.&&&&&&&', 0, ''),
(59, 7, '', 3, 0, 5, '¿Elija algunos temas en el que considera que el gobernador ha realizado un mal trabajo?', '', '', 10, 'Seguridad&Inversión en obra pública&Acciones en contra del ex gobernador Rodrigo Medina.&Restructura de la deuda de NL y en el gobierno en general.&Nuevos programas de apoyo a la comunidad.&Reducción gradual del pago de la Tenencia.&Transparencia.&Rendición de Cuentas.&Combate a la corrupción.&No sé', 0, ''),
(60, 7, '', 2, 0, 6, '¿Elija un tema en el que considera que el gobernador ha hecho un buen trabajo?', '', '', 10, 'Seguridad&Inversión en obra pública&Acciones en contra del ex gobernador Rodrigo Medina.&Restructura de la deuda de NL y en el gobierno en general.&Nuevos programas de apoyo a la comunidad.&Reducción gradual del pago de la Tenencia.&Transparencia.&Rendición de Cuentas.&Combate a la corrupción.&No sé', 0, ''),
(61, 7, '', 2, 0, 7, '¿Percibe una mejoría al tener un gobierno independiente en Nuevo León?', '', '', 4, 'Sí&No&Igual&No sé&&&&&&', 0, ''),
(62, 7, '', 3, 0, 8, '¿En qué rubros considera que “El Bronco” tiene retos para su siguiente año de gobierno?', '', '', 9, 'Seguridad&Inversión en obra pública &Concluir la Línea 3 del Metro&Combate a la Corrupción&Definir si se realizará la obra del Monterrey VI&Transparencia&Rendición de Cuentas&Impulso en la generación de empleo&No sé&', 0, ''),
(63, 7, '', 1, 0, 9, 'En una palabra, ¿cómo define el primer año de gobierno de “El Bronco”?', '', '', 0, '', 0, ''),
(64, 7, '', 2, 0, 10, '¿Qué expectativas tiene del primer “informe de gobierno”, sobre algún anuncio para los ciudadanos?', '', '', 4, 'Positivo.&Negativo.&Sin afectar a los ciudadanos.&No sé.&&&&&&', 0, ''),
(65, 7, '', 2, 0, 11, 'Si las elecciones para Gobernador fueran hoy, votaría nuevamente por Jaime Rodríguez', '', '', 3, 'Sí&No&No sé&&&&&&&', 0, ''),
(101, 9, '', 2, 0, 1, '¿Es la primera vez que visita Pollo Loco?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(102, 9, '', 3, 0, 2, '¿Que fue lo que ordenó en esta visita?', '', '', 5, 'Combo&Piezas de pollo&Complementos&Postre&Bebida&&&&&', 0, ''),
(103, 9, '', 2, 0, 3, '¿Qué le pareció la comida de hoy?', '', '', 5, 'Excelente&Buena&Regular&Mala&Pésima&&&&&', 0, ''),
(104, 9, '', 2, 0, 4, 'Del 1 al 10, donde 1 es la más baja calificación y 10 la más alta, ¿Cómo califica la calidad del producto que consumió hoy?', '', '', 10, '1&2&3&4&5&6&7&8&9&10', 0, ''),
(105, 9, '', 2, 0, 5, 'Del 1 al 10, donde 1 es la más baja calificación y 10 la más alta, ¿Cómo califica la atención del personal el día de hoy?', '', '', 10, '1&2&3&4&5&6&7&8&9&10', 0, ''),
(106, 9, '', 2, 0, 6, 'Del 1 al 10, donde 1 es la más baja calificación y 10 la más alta, ¿Cómo califica las instalaciones, limpieza, orden, temperatura, etc?', '', '', 10, '1&2&3&4&5&6&7&8&9&10', 0, ''),
(107, 9, '', 1, 0, 7, '¿Qué fue lo que más le gusto de su visita el día de hoy?', '', '', 0, '', 0, ''),
(108, 9, '', 1, 0, 8, '¿Qué mejoraría en Pollo loco?', '', '', 0, '', 0, ''),
(109, 9, '', 2, 0, 9, '¿Volvería a comprar en Pollo Loco?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(110, 9, '', 1, 0, 10, '¿Qué le gustaría que hubiera o que cambiaría en Pollo Loco?', '', '', 0, '', 0, ''),
(111, 9, '', 2, 0, 11, 'Ahora le pedimos que vea este video y nos diga si le gusto.', 'PolloLoco.mp4', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(112, 9, '', 2, 0, 12, '¿Le pareció creíble?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(113, 9, '', 1, 0, 13, '¿Qué le cambiaría?', '', '', 0, '&&&&&&&&&', 0, ''),
(114, 9, '', 2, 0, 14, 'Por último, ¿recomendaría Pollo Loco a algun familiar o amigo?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(115, 1, '', 1, 0, 1, '¿Qué cosas ha escuchado recientemente de Margarita Zavala?', '', '', 0, '', 0, ''),
(116, 1, '', 2, 0, 2, '¿Su opinión sobre Margarita Zavala es?', '', '', 3, 'Positiva&Neutra&Negativa&&&&&&&', 0, ''),
(117, 1, '', 2, 0, 3, '¿Conoce la asociación que promueve Margarita Zavala?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(118, 1, '', 2, 0, 4, '¿Sabe usted qué promueve dicha asociación?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(119, 1, '', 2, 0, 5, 'Después de ver el video, su opinión sobre MZ...', 'MZ.mp4', '', 3, 'Mejoró&Empeoró&Sigue igual&&&&&&&', 0, ''),
(120, 1, '', 2, 0, 6, '¿Cree usted que tiene posibilidades para ser Presidenta de México?', '', '', 4, 'Sí&No&Aún es muy pronto para dar una opinión&Tal vez&&&&&&', 0, ''),
(228, 14, '', 1, 0, 1, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en seguridad pública?', '', '', 0, '', 0, ''),
(229, 14, '', 1, 0, 2, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en alumbrado público?', '', '', 0, '', 0, ''),
(230, 14, '', 1, 0, 3, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en vialidad y tránsito?', '', '', 0, '', 0, ''),
(231, 14, '', 1, 0, 4, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en limpieza de la ciudad?', '', '', 0, '', 0, ''),
(232, 14, '', 1, 0, 5, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en servicios públicos?', '', '', 0, '', 0, ''),
(233, 14, '', 1, 0, 6, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en pavimentación?', '', '', 0, '', 0, ''),
(234, 14, '', 1, 0, 7, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en recolección de basura?', '', '', 0, '', 0, ''),
(235, 14, '', 1, 0, 8, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en parques y jardines?', '', '', 0, '', 0, ''),
(236, 14, '', 1, 0, 9, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en orden en vialidades?', '', '', 0, '', 0, ''),
(237, 14, '', 1, 0, 10, 'En una escala del 1 al 10 ¿Cómo evalúa el desempeño del actual alcalde de San Pedro Mauricio Fernández en transporte público?', '', '', 0, '', 0, ''),
(238, 14, '', 1, 0, 11, 'En una escala del 1 al 10 ¿cómo calificaría el desempeño del Alcalde Mauricio Fernández en el primer año de gobierno?', '', '', 0, '', 0, ''),
(239, 14, '', 1, 0, 12, 'En una escala del 1 al 10 ¿cómo calificaría el desempeño del Gobernandor Jaime Rodríguez en su primer año de gobierno?', '', '', 0, '', 0, ''),
(240, 14, '', 2, 0, 13, 'A un año del actual Gobierno, ¿aprueba el trabajo que ha hecho por el Alcalde Mauricio Fernández? ', '', '', 2, 'Aprueba&Desaprueba&&&&&&&&', 0, ''),
(241, 14, '', 2, 0, 14, 'A un año del actual Gobierno, ¿aprueba el trabajo que ha hecho por el Gobernador Jaime Rodríguez? ', '', '', 2, 'Aprueba&Desaprueba&&&&&&&&', 0, ''),
(242, 14, '', 2, 0, 15, '¿Qué le parece el video que verá a continuación?', 'SP.mp4', '', 2, 'Me gusta&No me gusta&&&&&&&&', 0, ''),
(243, 14, '', 2, 0, 16, '¿Le parece creíble?', '', '', 2, 'Sí&No&&&&&&&&', 0, ''),
(321, 16, '', 2, 0, 1, '¿Sabe cuándo son las próximas elecciones en Coahuila?', '', '', 3, 'Sí, el 4 de junio de 2017&Sí, en junio de 2017&No sé&&&&&&&', 0, ''),
(322, 16, '', 3, 0, 2, '¿Cuál de los siguientes personajes políticos conoce?', '', '', 7, 'Luis Salazar&Isidro López&Gerardo García&Guillermo Anaya&Miguel Á. Riquelme&Armando Luna &Ninguno&&&', 0, ''),
(323, 16, '', 2, 0, 3, 'Si la elección para Gobernador de Coahuila fuera el día de hoy, ¿por cuál de estos personajes votaría?', '', '', 8, 'Luis Salazar&Isidro López&Gerardo García&Guillermo Anaya&Miguel Á. Riquelme&Armando Luna &Ninguno&No sé&&', 0, ''),
(324, 16, '', 2, 0, 4, 'Si la elección para Gobernador de Coahuila fuera el día de hoy, ¿por cuál de estos personajes nunca votaría?', '', '', 8, 'Luis Salazar&Isidro López&Gerardo García&Guillermo Anaya&Miguel Á. Riquelme&Armando Luna &Ninguno&No sé&&', 0, ''),
(325, 16, '', 2, 0, 5, 'Si la elección para Gobernador de Coahuila fuera el día de hoy, ¿por cuál partido votaría?', '', '', 10, 'PAN&PRI&PRD&PVEM&PT&PANAL&Morena&Otro&Ninguno&No sé', 0, ''),
(326, 16, '', 2, 0, 6, 'Si la elección para Gobernador de Coahuila fuera el día de hoy, ¿por cuál partido nunca votaría?', '', '', 10, 'PAN&PRI&PRD&PVEM&PT&PANAL&Moren&Otro&Ninguno&No sé', 0, ''),
(327, 16, '', 1, 0, 7, '¿Qué piensas del PAN?', '', '', 0, '', 0, ''),
(328, 16, '', 1, 0, 8, '¿Qué piensas del PRI?', '', '', 0, '', 0, ''),
(329, 16, '', 2, 0, 9, 'Ahora te pedimos que veas el siguiente video y nos digas, ¿Qué tanto te gusta este video?', 'SpotCoahuila.mp4', '', 4, 'Mucho&Algo&Poco&Nada&&&&&&', 0, ''),
(330, 16, '', 2, 0, 10, '¿Qué tan creíble te parece el video?', '', '', 4, 'Mucho&Algo&Poco&Nada&&&&&&', 0, ''),
(331, 16, '', 2, 0, 11, 'Ahora te pedimos que veas la siguiente imagen y nos digas, ¿Qué tanto te gusta este imagen?', '', 'Coahuila.jpg', 4, 'Mucho&Algo&Poco&Nada&&&&&&', 0, ''),
(332, 16, '', 2, 0, 12, '¿Qué tanto te gusta la frase de la imagen?', '', '', 4, 'Mucho&Algo&Poco&Nada&&&&&&', 0, ''),
(334, 17, 'Observe el siguiente video y, a continuación, responda a la siguiente pregunta.', 1, 0, 1, '¿Qué le parece el video?', 'MZ.mp4', '', 0, '', 0, ''),
(335, 17, 'Observe la imagen…', 2, 0, 2, 'Su percepción es de', '', 'Coahuila.jpg', 4, 'Alegría&Impotencia&Desesperción&Felicidad', 0, ''),
(336, 17, '', 6, 0, 3, 'En una escala de 1 a 10, ¿cómo califica su vida?', '', '', 2, '1&10', 0, ''),
(337, 17, '', 5, 0, 4, '¿Cuál es su percepción de los siguientes productos?', '', '', 5, 'Muy Mala&Mala&Regular&Buena&Muy Buena', 5, 'Yogur Danone&Leche Nido&Snickers&iPhone 18&Galaxy Bomba'),
(338, 17, 'Observe el siguiente video…', 3, 0, 5, '¿Qué ciudades ha visitado?', 'SP.mp4', '', 15, 'NY&LA&Sydney&Shangai&San Petersburgo&CDMX&Brasilia&Asunción&Ottawa&Vancouver&Madrid&Paris&Londres&Essex&La Meca', 0, ''),
(339, 17, '', 4, 0, 6, 'Ordene las palabras por orden alfabético', '', '', 13, 'Palabra&Alfabeto&Opción&Celular&Monitor&Pantalla&Correo&Elefante&Gato&Música&Finder&Alfarero&Berenice', 0, ''),
(340, 17, 'Observe la imagen…', 2, 1, 7, '¿De qué color es su gato?', '', 'Coahuila.jpg', 5, 'Negro&Blanco&Azul&Rojo&No Tengo Gato', 0, ''),
(357, 18, '', 5, 0, 1, '¿Conoce o ha oído nombrar a…?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(358, 18, '', 5, 0, 2, '¿Qué opinión tiene de…? ', '', '', 6, 'Muy buena&Buena&Regular&Mala&Muy mala&No tengo opinión', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(359, 18, '', 2, 0, 3, '¿De los siguientes candidatos del PAN quien puede ganar para gobernador?', '', '', 8, 'Guillermo Anaya&Luis Fernando Salazar&Isidro López&Marcelo Torres&Gerardo García&Silvia Garza&Ninguno&No sé', 0, ''),
(360, 18, '', 2, 0, 4, 'Usted, ¿Con qué partido político simpatiza?', '', '', 10, 'PAN&PRI&PRD&PT&PVEM&PANAL&Morena&Otro&Ninguno&No sé', 0, ''),
(361, 18, '', 2, 0, 5, 'Si los candidatos fueran… ¿por quién votaría para gobernador de Coahuila?', '', '', 11, 'Miguel Ángel Riquelme del PRI&Guillermo Anaya del PAN&Luis Fernando Salazar del PAN&Isidro López del PAN&Marcelo Torres del PAN&Gerardo García del PAN&Silvia Garza del PAN&Lenin Pérez de UDC&Armando Guadiana de Morena&Ninguno&No sé', 0, ''),
(362, 18, '', 5, 0, 6, 'Sin importar el partido que lo postule, ¿usted votaría por... para Gobernador del estado de Coahuila?', '', '', 2, 'Sí&No', 9, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López&Marcelo Torres&Gerardo García&Silvia Garza&Lenin Pérez&Armando Guadiana'),
(363, 18, '', 2, 0, 7, 'Si el candidato del PAN fuera Guillermo Anaya y del PRI Miguel Ángel Riquelme, ¿por cuál de estos dos votaría?', '', '', 4, 'Guillermo Anaya&Miguel Ángel Riquelme&Ninguno&No sé', 0, ''),
(364, 18, '', 2, 0, 8, 'Si el candidato del PAN fuera Luis Fernando Salazar y del PRI Miguel Ángel Riquelme, ¿por cuál de estos dos votaría?', '', '', 4, 'Luis Fernando Salazar&Miguel Ángel Riquelme&Ninguno&No sé', 0, ''),
(365, 18, '', 2, 0, 9, 'Si el candidato del PAN fuera Isidro López y del PRI Miguel Ángel Riquelme, ¿por cuál de estos dos votaría?', '', '', 4, 'Isidro López&Miguel Ángel Riquelme&Ninguno&No sé', 0, ''),
(366, 18, '', 5, 0, 10, '¿Usted cree que… combatiría la inseguridad?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(367, 18, '', 5, 0, 11, '¿Usted cree que… es capaz de crear empleos bien pagados?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(368, 18, '', 5, 0, 12, '¿Usted cree que… combatiría la corrupción?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(369, 18, '', 5, 0, 13, '¿Usted cree que... trabajaría más cercano a la gente?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(370, 18, '', 5, 0, 14, '¿Usted cree que… tiene más experiencia para gobernar?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(371, 18, '', 5, 0, 15, '¿Usted cree que… es más honesto?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(372, 18, '', 5, 0, 16, '¿Usted cree que… es capaz?', '', '', 2, 'Sí&No', 4, 'Miguel Ángel Riquelme&Guillermo Anaya&Luis Fernando Salazar&Isidro López'),
(373, 19, '', 5, 0, 1, 'que opinas de ', '', '', 3, 'bien&mal&no se', 4, 'x1&x2&x3&x4'),
(374, 19, '', 6, 0, 2, 'como claificas', '', '', 2, '1&10', 0, ''),
(375, 19, 've este video', 2, 1, 3, 'que opinas', 'PolloLoco.mp4', '', 2, 'si &no', 0, ''),
(376, 19, 've esta imagen', 2, 0, 4, 'que opinas', '', 'Coahuila.jpg', 2, 'si&no', 0, ''),
(377, 19, '', 4, 0, 5, 'que esperas', '', '', 4, 'mejores&más&oportunidades&nada', 0, ''),
(378, 19, '', 1, 0, 6, '', '', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recurso`
--

CREATE TABLE `Recurso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Recurso`
--

INSERT INTO `Recurso` (`id`, `nombre`, `tipo`) VALUES
(33, 'MZ.mp4', 2),
(34, 'PolloLoco.mp4', 2),
(36, 'SanPedro.mp4', 2),
(37, 'SP.mp4', 2),
(38, 'SpotCoahuila.mp4', 2),
(39, 'Coahuila.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuesta`
--

CREATE TABLE `Respuesta` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fechaIni` date DEFAULT NULL,
  `horaIni` time DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `horaFin` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Respuesta`
--

INSERT INTO `Respuesta` (`id`, `encuesta`, `panelista`, `respuestas`, `fechaIni`, `horaIni`, `fechaFin`, `horaFin`) VALUES
(65, 1, 454, 'Va para la presidencia |Neutra|Sí|No|Sigue igual|Sí|', '2016-10-04', '10:53:26', '2016-10-04', '10:53:26'),
(66, 1, 455, 'Busca la presidencia |Positiva|Sí|No|Sigue igual|Sí|', '2016-10-04', '15:32:34', '2016-10-04', '15:32:34'),
(81, 9, 450, 'No|Combo&|Buena|8|8|7|Las salsas|La atención del personal|Sí|Más limpieza|Sí|Sí|Nada|Sí|', '2016-10-10', '14:03:57', '2016-10-10', '14:03:57'),
(82, 9, 448, 'No|Combo&Postre&|Buena|4|8|8|El postre|Los combos|Sí|Más combos|Sí|No|Los actores|Sí|', '2016-10-10', '14:06:44', '2016-10-10', '14:06:44'),
(83, 1, 448, 'Va para la presidencia |Positiva|No|No|Sigue igual|Sí|', '2016-10-10', '15:15:39', '2016-10-10', '15:15:39'),
(84, 9, 446, 'No|Combo&Postre&Bebida&|Regular|7|8|8|Comida |Mejor aroma|Sí|Más complementos|No|No|Todo|Sí|', '2016-10-10', '15:18:08', '2016-10-10', '15:18:08'),
(102, 1, 459, 'Nada|Positiva|No|No|Sigue igual|Sí|', '2016-10-11', '13:45:54', '2016-10-11', '13:45:54'),
(118, 1, 461, 'Hdjfjfjfjfj|Positiva|No|No|Mejoró|Sí|', '2016-10-17', '15:39:41', '2016-10-17', '15:39:41'),
(119, 1, 463, 'Dgggg|Positiva|No|Sí|Empeoró|Sí|', '2016-10-21', '11:28:37', '2016-10-21', '11:28:37'),
(120, 9, 463, 'Sí|Piezas de pollo&|Excelente|6|7|9|Vvcc|Cfgh|Sí|Czghf|Sí|Sí|Cognitiva|Sí|', '2016-10-21', '11:33:59', '2016-10-21', '11:33:59'),
(123, 14, 461, '8|6|8|8|8|6|4|6|8|7|9|7|Aprueba|Desaprueba|', '2016-10-21', '16:53:11', '2016-10-21', '16:53:11'),
(131, 9, 455, 'No|Postre&|Regular|3|7|9|Que fue gratis|Pues no como pollito|Sí|Tacos de pescado|Sí|Sí|Nada|Sí|', '2016-10-22', '20:34:43', '2016-10-22', '20:34:43'),
(133, 14, 465, '2|3|4|6|6|2|2|3|Ref|Df|Df|BBM|Aprueba|Aprueba|No me gusta|Sí|', '2016-10-26', '11:03:39', '2016-10-26', '11:03:39'),
(134, 1, 465, 'Que quiere ser presidenta de México |Positiva|No|No|Mejoró|Sí|', '2016-10-26', '11:27:52', '2016-10-26', '11:27:52'),
(140, 1, 480, 'Ghhh|Neutra|Sí|Sí|Empeoró|No|', '2016-11-17', '16:57:40', '2016-11-17', '16:57:40'),
(141, 7, 480, 'Las superó|2|Yo creo que no te has dado cuenta de que ya se puede hacer sin que le hagas nada a tu apa habla chingándome|Sí me agradan, y sí participaría.|Inversión en obra pública&|Restructura de la deuda de NL y en el gobierno en general.|No|Inversión en obra pública &|Ya está grabando|Positivo.|No|', '2016-11-17', '17:00:44', '2016-11-17', '17:00:44'),
(142, 9, 480, 'No|Combo&Combo&Combo&|Mala|1|3|6|Esta es una opinión muy importante|Éstas son la opción de poner adelante|No|Es hora de monetizar este producto|No|Sí|Si quieres conteste esta encuesta sin notar nada solo ya tus opiniones|No|', '2016-11-17', '17:48:46', '2016-11-17', '17:48:46'),
(144, 1, 483, 'La señora está en una campaña política muy extensiva en Méxicojdjdjsjsnsjsnsndnd pienso que Margarita es una mujer muy inteligente|Neutra|Sí|Sí|Empeoró|No|', '2016-11-23', '17:10:22', '2016-11-23', '17:10:22'),
(149, 16, 484, 'Sí, el 4 de junio de 2017|Isidro López&Gerardo García&Miguel Á. Riquelme&Armando Luna &Isidro López&Gerardo García&Miguel Á. Riquelme&Armando Luna &Isidro López&Gerardo García&Miguel Á. Riquelme&Armando Luna &Isidro López&Gerardo García&Miguel Á. Riquelme&Armando Luna &|Isidro López|Armando Luna |PVEM|PVEM|Tido que trabaja para la gente|Es un partido que sólo se roba el dinero|Poco|Mucho|Mucho|Algo|', '2016-11-24', '17:06:58', '2016-11-24', '17:06:58'),
(150, 16, 485, 'Sí, en junio de 2017|Isidro López&|Luis Salazar|Isidro López|PVEM|PRD|Me gusta mucho ese partido|Sfgdfh|Mucho|Algo|Algo|Poco|', '2016-11-25', '09:56:42', '2016-11-25', '09:56:42'),
(152, 7, 476, 'Sí las cumplió|6|C|Sí me agradan, y sí participaría.|Seguridad&|Inversión en obra pública|Sí|Inversión en obra pública &|Y|Negativo.|No|', '2016-11-26', '18:13:44', '2016-11-26', '18:13:44'),
(154, 1, 476, 'N|Positiva|Sí|Sí|Mejoró|Sí|', '2016-11-26', '19:29:24', '2016-11-26', '19:29:24'),
(187, 18, 454, '', '2016-12-13', '15:09:39', NULL, NULL),
(188, 18, 509, '', '2016-12-14', '07:17:23', NULL, NULL),
(191, 18, 522, '', '2016-12-15', '15:35:02', NULL, NULL),
(192, 18, 488, 'No&Sí&No&Sí&|No tengo opinión&Regular&No tengo opinión&Regular&|Guillermo Anaya|Ninguno|Guillermo Anaya del PAN|No&Sí&No&No&No&No&No&Sí&No&|Guillermo Anaya|No sé|Miguel Ángel Riquelme|Sí&Sí&No&No&|Sí&Sí&No&Sí&|No&No&No&No&|No&Sí&No&Sí&|Sí&Sí&No&No&|No&No&No&No&|Sí&Sí&No&No&|', '2016-12-16', '01:00:50', '2016-12-16', '01:05:18'),
(193, 18, 531, '', '2016-12-16', '12:16:52', NULL, NULL),
(194, 18, 525, 'No&Sí&No&Sí&|No tengo opinión&Buena&No tengo opinión&Regular&|Guillermo Anaya|Otro|Gerardo García del PAN|No&Sí&No&No&Sí&Sí&Sí&No&No&|Guillermo Anaya|Ninguno|No sé|No&Sí&Sí&Sí&|Sí&Sí&No&No&|No&Sí&No&No&|Sí&Sí&No&No&|No&Sí&No&No&|Sí&Sí&Sí&Sí&|Sí&Sí&Sí&Sí&|', '2016-12-16', '22:52:18', '2016-12-16', '22:58:46'),
(195, 19, 454, 'mal&no se&bien&no se&|10|no|no|más&oportunidades&mejores&nada&|Babehdjdn|', '2016-12-19', '11:51:11', '2016-12-19', '11:52:14'),
(196, 18, 520, '', '2016-12-20', '13:35:05', NULL, NULL),
(197, 17, 1, 'ja|Impotencia|2|Mala&Mala&Muy Buena&Muy Mala&Muy Buena&Mala&Mala&Muy Buena&Muy Mala&Muy Buena&|LA&Sydney&CDMX&Ottawa&LA&Sydney&CDMX&Ottawa&|Celular&Palabra&Alfabeto&Opción&Monitor&Pantalla&Correo&Elefante&Gato&Música&Finder&Alfarero&Berenice&|Blanco|', '2016-12-20', '18:54:11', '2016-12-20', '18:55:26'),
(198, 17, 1, '', '2016-12-28', '16:27:41', NULL, NULL),
(199, 17, 1, '', '2016-12-28', '16:29:31', NULL, NULL),
(200, 17, 1, 'As|Alegría|1|Muy Mala&Muy Mala&Mala&Muy Mala&Muy Mala&|NY&La Meca&|Berenice&Alfarero&Finder&Música&Gato&Elefante&Correo&Pantalla&Monitor&Celular&Opción&Alfabeto&Palabra&|Negro|', '2016-12-28', '16:32:00', '2016-12-28', '16:33:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `tipo`) VALUES
(1, 'admin', 'focuscg', 'Administrador', '', '', 0),
(3, 'jrodriguez', 'focuscg233', 'Jaime ', 'Rodriguez', 'focus@focuscg.com.mx', 1),
(4, 'polloloco', 'pollo', 'Pollo Loco', 'Apellidos', 'focus@focuscg.com.mx', 1),
(5, 'pruebas', 'focuscg', 'Pruebas', 'Pruebas', 'focus@focuscg.com.mx', 1),
(7, 'margaritaz', 'zavala', 'Margarita', 'Zavala', 'focus@focuscg.com.mx', 1),
(8, 'csaucedo', 'focuscg', 'Cesar', 'Saucedo', 'cesarsaucedo@kroghen.com', 0),
(9, 'sanpedro', 'sp2016', 'San Pedro', '', 'focus@focuscg.com.mx', 1),
(11, 'ugor', 'ruiz2016', 'Ugo ', 'Ruiz', 'focus@focuscg.com.mx', 1),
(12, 'esvy', 'esveydi', 'Esvy', '', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panel` (`panel`);

--
-- Indices de la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `Panel`
--
ALTER TABLE `Panel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente` (`cliente`,`creador`),
  ADD KEY `cliente_2` (`cliente`),
  ADD KEY `creador` (`creador`);

--
-- Indices de la tabla `Panelista`
--
ALTER TABLE `Panelista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  ADD PRIMARY KEY (`id`,`panelista`,`panel`),
  ADD KEY `panelista` (`panelista`),
  ADD KEY `panel` (`panel`);

--
-- Indices de la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encuesta` (`encuesta`);

--
-- Indices de la tabla `Recurso`
--
ALTER TABLE `Recurso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encuesta` (`encuesta`),
  ADD KEY `panelista` (`panelista`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `Historial`
--
ALTER TABLE `Historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT de la tabla `Panel`
--
ALTER TABLE `Panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=536;
--
-- AUTO_INCREMENT de la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3055;
--
-- AUTO_INCREMENT de la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=379;
--
-- AUTO_INCREMENT de la tabla `Recurso`
--
ALTER TABLE `Recurso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  ADD CONSTRAINT `Encuesta_ibfk_1` FOREIGN KEY (`panel`) REFERENCES `Panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Panel`
--
ALTER TABLE `Panel`
  ADD CONSTRAINT `Panel_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Panel_ibfk_2` FOREIGN KEY (`creador`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  ADD CONSTRAINT `PanelistaEnPanel_ibfk_1` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PanelistaEnPanel_ibfk_2` FOREIGN KEY (`panel`) REFERENCES `Panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  ADD CONSTRAINT `Pregunta_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  ADD CONSTRAINT `Respuesta_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Respuesta_ibfk_2` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
