-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-08-2016 a las 17:37:37
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Encuesta`
--

INSERT INTO `Encuesta` (`id`, `panel`, `nombre`, `fechaInicio`, `fechaFin`) VALUES
(1, 1, 'Encuesta Demo MZ', '2016-08-01', '2016-08-31'),
(2, 1, 'Encuestaaa', '2016-01-01', '2016-01-01');

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
  `cliente` int(11) NOT NULL,
  `creador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `cliente`, `creador`) VALUES
(1, 'Margarita Zavala', '', '2016-08-06', '2016-08-31', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panelista`
--

CREATE TABLE `Panelista` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `genero` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `educacion` int(11) NOT NULL,
  `calleNumero` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `colonia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `cp` int(11) NOT NULL,
  `deviceToken` text COLLATE utf8_spanish_ci NOT NULL,
  `deviceType` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panelista`
--

INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`, `deviceToken`, `deviceType`) VALUES
(1, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(2, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(3, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(4, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(5, 'Alberto', 'pass', 'Alberto', 'López Méndez', 'albertolm8970@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(6, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(7, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(8, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(9, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 0, '0', 0),
(10, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(11, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(12, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(13, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(14, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(15, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(16, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(17, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '0', 0),
(18, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'San Pedro', 'NL', 0, '0', 0),
(19, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(20, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(21, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(22, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '0', 0),
(23, 'Mar', 'pass', 'Mar', 'González González', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(24, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(25, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(26, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(27, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(28, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(29, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(30, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(31, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(32, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(33, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '0', 0),
(34, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(35, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(36, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(37, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '0', 0),
(38, 'Mar', 'pass', 'Mar', 'González González', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(39, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(40, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(41, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(42, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(43, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(44, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(45, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(46, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(47, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(48, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(49, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '0', 0),
(50, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(51, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(52, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(53, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(54, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(55, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(56, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(57, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(58, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '0', 0),
(59, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(60, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(61, 'Raúl', 'pass', 'Raúl', 'Dominguez López', 'rauldom4598@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(62, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(63, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(64, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(65, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(66, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Apodaca', 'NL', 0, '0', 0),
(67, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(68, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(69, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(70, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(71, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(72, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '0', 0),
(73, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(74, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(75, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(76, 'Julian', 'pass', 'Julian', 'Zambrano Treviño', 'julianzam_7887@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(77, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(78, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(79, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(80, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(81, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '0', 0),
(82, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(83, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(84, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(85, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(86, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(87, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(88, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(89, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '0', 0),
(90, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(91, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(92, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(93, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(94, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'San Pedro', 'NL', 0, '0', 0),
(95, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(96, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(97, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(98, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(99, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'San Pedro', 'NL', 0, '0', 0),
(100, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(101, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(102, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(103, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(104, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(105, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(106, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 3, '', '', 'Apodaca', 'NL', 0, '0', 0),
(107, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(108, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(109, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '0', 0),
(110, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Escobedo', 'NL', 0, '0', 0),
(111, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(112, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(113, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(114, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(115, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(116, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(117, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(118, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'García', 'NL', 0, '0', 0),
(119, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(120, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(121, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '0', 0),
(122, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(123, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(124, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(125, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(126, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(127, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(128, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(129, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(130, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(131, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'García', 'NL', 0, '0', 0),
(132, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '0', 0),
(133, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(134, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '0', 0),
(135, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(136, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(137, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(138, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 2, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(139, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '0', 0),
(140, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(141, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(142, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(143, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(144, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(145, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '0', 0),
(146, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(147, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(148, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(149, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '0', 0),
(150, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(151, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(152, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(153, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(154, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(155, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(156, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(157, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'García', 'NL', 0, '0', 0),
(158, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(159, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(160, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(161, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 1, '', '', 'San Pedro', 'NL', 0, '0', 0),
(162, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(163, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(164, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '0', 0),
(165, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(166, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(167, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(168, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(169, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(170, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(171, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(172, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(173, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(174, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(175, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 0, '0', 0),
(176, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(177, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(178, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(179, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 1, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(180, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(181, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '0', 0),
(182, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(183, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(184, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(185, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(186, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(187, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(188, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(189, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(190, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(191, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '0', 0),
(192, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(193, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(194, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(195, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(196, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(197, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(198, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(199, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(200, 'Alejandro', 'pass', 'Alejandro', 'Muñoz Muñoz', 'alexmm_8970@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(201, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(202, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(203, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(204, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(205, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'García', 'NL', 0, '0', 0),
(206, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(207, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(208, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '0', 0),
(209, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(210, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(211, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(212, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(213, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(214, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(215, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(216, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(217, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(218, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(219, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(220, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(221, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(222, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(223, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(224, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(225, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(226, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(227, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(228, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(229, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(230, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(231, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(232, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(233, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(234, 'Daniel', 'pass', 'Daniel', 'Duarte Muñoz', 'daniduarte_898048@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(235, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(236, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(237, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(238, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(239, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(240, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '0', 0),
(241, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(242, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(243, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(244, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '0', 0),
(245, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(246, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(247, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(248, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(249, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(250, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(251, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(252, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(253, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(254, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Escobedo', 'NL', 0, '0', 0),
(255, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(256, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(257, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(258, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(259, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(260, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(261, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(262, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(263, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(264, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(265, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'García', 'NL', 0, '0', 0),
(266, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(267, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(268, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(269, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(270, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(271, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 0, '0', 0),
(272, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(273, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(274, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '0', 0),
(275, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(276, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(277, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(278, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(279, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(280, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(281, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(282, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(283, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(284, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(285, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(286, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(287, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '0', 0),
(288, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(289, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(290, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(291, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '0', 0),
(292, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(293, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(294, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(295, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'García', 'NL', 0, '0', 0),
(296, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(297, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '0', 0),
(298, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '0', 0),
(299, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(300, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(301, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(302, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(303, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(304, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '0', 0),
(305, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(306, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(307, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(308, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(309, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(310, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(311, 'Carlos Alberto', 'pass', 'Carlos Alberto', 'López Méndez', 'carlosalberto_8080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(312, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(313, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(314, 'Jorge', 'pass', 'Jorge', 'Jimenez González', 'jorgejg_5824@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(315, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(316, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(317, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(318, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '0', 0),
(319, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(320, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(321, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(322, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(323, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(324, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(325, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(326, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(327, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(328, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(329, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(330, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(331, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(332, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(333, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(334, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(335, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(336, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(337, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'García', 'NL', 0, '0', 0),
(338, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '0', 0),
(339, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(340, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '0', 0),
(341, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(342, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(343, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(344, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(345, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(346, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(347, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0);
INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`, `deviceToken`, `deviceType`) VALUES
(348, 'Rodrigo', 'pass', 'Rodrigo', 'Martinez Martinez', 'rodrimtzz7845@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(349, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Juárez', 'NL', 0, '0', 0),
(350, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(351, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(352, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(353, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(354, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(355, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(356, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(357, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(358, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(359, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(360, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(361, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(362, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(363, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(364, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(365, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(366, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(367, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(368, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '0', 0),
(369, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(370, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(371, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(372, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '0', 0),
(373, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(374, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(375, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(376, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(377, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(378, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '0', 0),
(379, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '0', 0),
(380, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(381, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(382, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(383, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '0', 0),
(384, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '0', 0),
(385, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(386, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(387, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(388, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(389, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '0', 0),
(390, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '0', 0),
(391, 'Mar', 'pass', 'Mar', 'González González', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '0', 0),
(392, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '0', 0),
(393, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '0', 0),
(394, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '0', 0),
(395, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '0', 0),
(396, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(397, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0),
(398, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '0', 0),
(399, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '0', 0),
(400, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PanelistaEnPanel`
--

CREATE TABLE `PanelistaEnPanel` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Preguntas`
--

CREATE TABLE `Preguntas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `numPregunta` int(11) NOT NULL,
  `pregunta` text COLLATE utf8_spanish_ci NOT NULL,
  `video` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `op1` text COLLATE utf8_spanish_ci NOT NULL,
  `op2` text COLLATE utf8_spanish_ci NOT NULL,
  `op3` text COLLATE utf8_spanish_ci NOT NULL,
  `op4` text COLLATE utf8_spanish_ci NOT NULL,
  `op5` text COLLATE utf8_spanish_ci NOT NULL,
  `op6` text COLLATE utf8_spanish_ci NOT NULL,
  `op7` text COLLATE utf8_spanish_ci NOT NULL,
  `op8` text COLLATE utf8_spanish_ci NOT NULL,
  `op9` text COLLATE utf8_spanish_ci NOT NULL,
  `op10` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Preguntas`
--

INSERT INTO `Preguntas` (`id`, `encuesta`, `tipo`, `numPregunta`, `pregunta`, `video`, `imagen`, `op1`, `op2`, `op3`, `op4`, `op5`, `op6`, `op7`, `op8`, `op9`, `op10`) VALUES
(1, 1, 1, 1, 'Pregunta Abierta', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 1, 2, 2, 'Â¿Su opiniÃ³n sobre Margarita Zavala es?', '', '', 'Positiva', 'Negativa', 'Neutra', '', '', '', '', '', '', ''),
(3, 1, 3, 3, 'Â¿Conoce la asociaciÃ³n que promueve Margarita Zavala?', '', '', 'SÃ­', 'No', '', '', '', '', '', '', '', ''),
(4, 1, 2, 4, 'Â¿Sabe usted quÃ© promueve dicha asociaciÃ³n?', '', '', 'SÃ­', 'No', '', '', '', '', '', '', '', ''),
(5, 1, 2, 5, 'DespuÃ©s de ver el video, su opiniÃ³n sobre MZ...', '', '', 'MejorÃ³', 'EmpeorÃ³', 'Sigue igual', '', '', '', '', '', '', ''),
(6, 1, 2, 6, 'Â¿Cree usted que tiene posibilidades para ser Presidenta de MÃ©xico?', '', '', 'SÃ­', 'No', 'AÃºn es muy pronto para dar una opiniÃ³n', '', '', '', '', '', '', ''),
(11, 2, 1, 1, 'Abierta', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 2, 2, 2, 'Unica', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, 2, 3, 3, 'Multiple', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, 2, 3, 4, 'Ordenamiento', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuestas`
--

CREATE TABLE `Respuestas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apPaterno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apMaterno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`, `username`, `password`, `nombre`, `apPaterno`, `apMaterno`, `email`, `tipo`) VALUES
(1, 'admin', 'admin', 'Administrador', '', '', '', 0),
(2, 'mzavala', 'pass', 'Margarita', 'Zavala', ' ', 'mzavala@pan.com', 1);

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
-- Indices de la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encuesta` (`encuesta`);

--
-- Indices de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Panel`
--
ALTER TABLE `Panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=401;
--
-- AUTO_INCREMENT de la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
-- Filtros para la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD CONSTRAINT `Preguntas_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD CONSTRAINT `Respuestas_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Respuestas_ibfk_2` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;