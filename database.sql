-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-08-2016 a las 19:48:52
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Encuesta`
--

INSERT INTO `Encuesta` (`id`, `panel`, `nombre`, `fechaInicio`, `fechaFin`) VALUES
(4, 11, 'Encuesta Demo MZ', '2016-08-06', '2016-08-07');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `cliente`, `creador`) VALUES
(11, 'Margarita Zavala', '', '2016-08-06', '2016-08-31', 7, 1);

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
  `cp` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panelista`
--

INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`) VALUES
(1, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0),
(2, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(3, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(4, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(5, 'Alberto', 'pass', 'Alberto', 'L?pez M?ndez', 'albertolm8970@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(6, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(7, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(8, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(9, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 1),
(10, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(11, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(12, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(13, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(14, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(15, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(16, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(17, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 1),
(18, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'San Pedro', 'NL', 1),
(19, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(20, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(21, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(22, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 1),
(23, 'Mar', 'pass', 'Mar', 'Gonz?lez Gonz?lez', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(24, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(25, 'Karmina', 'pass', 'Karmina', 'Mart?nez Gonz?lez', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(26, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(27, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(28, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(29, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(30, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(31, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(32, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(33, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 1),
(34, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(35, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(36, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(37, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 1),
(38, 'Mar', 'pass', 'Mar', 'Gonz?lez Gonz?lez', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(39, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicol?s', 'NL', 1),
(40, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(41, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(42, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(43, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(44, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(45, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(46, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(47, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(48, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(49, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 1),
(50, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 1),
(51, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(52, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(53, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(54, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(55, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(56, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(57, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(58, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 1),
(59, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(60, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(61, 'Ra?l', 'pass', 'Ra?l', 'Dominguez L?pez', 'rauldom4598@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(62, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicol?s', 'NL', 1),
(63, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(64, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(65, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(66, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Apodaca', 'NL', 1),
(67, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(68, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(69, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(70, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(71, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(72, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 1),
(73, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(74, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(75, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(76, 'Julian', 'pass', 'Julian', 'Zambrano Trevi?o', 'julianzam_7887@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(77, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(78, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(79, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(80, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(81, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 1),
(82, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(83, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(84, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(85, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(86, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(87, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(88, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(89, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 1),
(90, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(91, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(92, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(93, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(94, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'San Pedro', 'NL', 1),
(95, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(96, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(97, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(98, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(99, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'San Pedro', 'NL', 1),
(100, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(101, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(102, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(103, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(104, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(105, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(106, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 3, '', '', 'Apodaca', 'NL', 1),
(107, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(108, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(109, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 1),
(110, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Escobedo', 'NL', 1),
(111, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(112, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(113, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(114, 'Karmina', 'pass', 'Karmina', 'Mart?nez Gonz?lez', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(115, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(116, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(117, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(118, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'Garc?a', 'NL', 1),
(119, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(120, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(121, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 1),
(122, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 1),
(123, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(124, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(125, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(126, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(127, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(128, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(129, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(130, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(131, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'Garc?a', 'NL', 1),
(132, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 1),
(133, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(134, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 1),
(135, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(136, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(137, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(138, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 2, '', '', 'Guadalupe', 'NL', 1),
(139, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 1),
(140, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(141, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(142, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(143, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(144, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(145, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 1),
(146, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(147, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(148, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(149, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 1),
(150, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(151, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(152, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(153, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(154, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(155, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(156, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(157, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Garc?a', 'NL', 1),
(158, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(159, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(160, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(161, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 1, '', '', 'San Pedro', 'NL', 1),
(162, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(163, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(164, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 1),
(165, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 1),
(166, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(167, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(168, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(169, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(170, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(171, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(172, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(173, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(174, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(175, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 1),
(176, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(177, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(178, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(179, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 1, '', '', 'San Nicol?s', 'NL', 1),
(180, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(181, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 1),
(182, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(183, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(184, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(185, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(186, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(187, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(188, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(189, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(190, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(191, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 1),
(192, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(193, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(194, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(195, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(196, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(197, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(198, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(199, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(200, 'Alejandro', 'pass', 'Alejandro', 'Mu?oz Mu?oz', 'alexmm_8970@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(201, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicol?s', 'NL', 1),
(202, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(203, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(204, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(205, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'Garc?a', 'NL', 1),
(206, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(207, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(208, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 1),
(209, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(210, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(211, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(212, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(213, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(214, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 1),
(215, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(216, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(217, 'Karmina', 'pass', 'Karmina', 'Mart?nez Gonz?lez', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(218, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(219, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(220, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Nicol?s', 'NL', 1),
(221, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(222, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(223, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(224, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(225, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(226, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(227, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(228, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(229, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(230, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(231, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(232, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(233, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(234, 'Daniel', 'pass', 'Daniel', 'Duarte Mu?oz', 'daniduarte_898048@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(235, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(236, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(237, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(238, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 1),
(239, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(240, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 1),
(241, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(242, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(243, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicol?s', 'NL', 1),
(244, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 1),
(245, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(246, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(247, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(248, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(249, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(250, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(251, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(252, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(253, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(254, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Escobedo', 'NL', 1),
(255, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(256, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(257, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 1),
(258, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(259, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(260, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(261, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(262, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(263, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 1),
(264, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(265, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Garc?a', 'NL', 1),
(266, 'Karmina', 'pass', 'Karmina', 'Mart?nez Gonz?lez', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(267, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(268, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(269, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(270, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(271, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 1),
(272, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(273, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(274, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 1),
(275, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(276, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 1),
(277, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(278, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(279, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(280, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(281, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(282, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(283, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(284, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(285, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(286, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(287, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 1),
(288, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(289, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(290, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(291, 'Karmina', 'pass', 'Karmina', 'Mart?nez Gonz?lez', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 1),
(292, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(293, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(294, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(295, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Garc?a', 'NL', 1),
(296, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(297, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 1),
(298, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 1),
(299, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(300, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(301, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 1),
(302, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(303, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(304, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 1),
(305, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(306, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(307, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(308, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(309, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(310, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(311, 'Carlos Alberto', 'pass', 'Carlos Alberto', 'L?pez M?ndez', 'carlosalberto_8080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(312, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicol?s', 'NL', 1),
(313, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(314, 'Jorge', 'pass', 'Jorge', 'Jimenez Gonz?lez', 'jorgejg_5824@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(315, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(316, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(317, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(318, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 1),
(319, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(320, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(321, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(322, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 1),
(323, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(324, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(325, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(326, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(327, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(328, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(329, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(330, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(331, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(332, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(333, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(334, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(335, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(336, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 1),
(337, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Garc?a', 'NL', 1),
(338, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 1),
(339, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(340, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 1),
(341, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(342, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(343, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(344, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(345, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(346, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(347, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(348, 'Rodrigo', 'pass', 'Rodrigo', 'Martinez Martinez', 'rodrimtzz7845@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(349, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Ju?rez', 'NL', 1),
(350, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(351, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicol?s', 'NL', 1),
(352, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(353, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicol?s', 'NL', 1),
(354, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(355, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1),
(356, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 1),
(357, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(358, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(359, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(360, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(361, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(362, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(363, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(364, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(365, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(366, 'Alma Alexia', 'pass', 'Alma Alexia', 'Mu?oz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(367, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(368, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'R?os Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 1);
INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`) VALUES
(369, 'Mar?a', 'pass', 'Mar?a', 'Zazueta L?pez', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 1),
(370, 'Enrique', 'pass', 'Enrique', 'Mart?nez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(371, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(372, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 1),
(373, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(374, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(375, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(376, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(377, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(378, 'Mario', 'pass', 'Mario', 'Casas Guti?rrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Garc?a', 'NL', 1),
(379, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 1),
(380, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(381, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(382, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(383, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 1),
(384, 'Jos? Miguel', 'pass', 'Jos? Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 1),
(385, 'Mar?a del Carmen', 'pass', 'Mar?a del Carmen', 'Valenzuela Beltr?n', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicol?s', 'NL', 1),
(386, 'Ariadna', 'pass', 'Ariadna', 'Corral L?pez', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(387, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(388, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela L?pez', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(389, 'Vilma', 'pass', 'Vilma', 'L?pez Rodr?guez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Garc?a', 'NL', 1),
(390, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 1),
(391, 'Mar', 'pass', 'Mar', 'Gonz?lez Gonz?lez', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 1),
(392, 'Luis Manuel', 'pass', 'Luis Manuel', 'Mart?nez S?nchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicol?s', 'NL', 1),
(393, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 1),
(394, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso Le?n', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 1),
(395, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Ju?rez', 'NL', 1),
(396, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(397, 'Fernando ', 'pass', 'Fernando ', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 1),
(398, 'Karla Mar?a', 'pass', 'Karla Mar?a', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 1),
(399, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PanelistaEnPanel`
--

CREATE TABLE `PanelistaEnPanel` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `PanelistaEnPanel`
--

INSERT INTO `PanelistaEnPanel` (`id`, `panelista`, `panel`) VALUES
(23, 1, 11);

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Preguntas`
--

INSERT INTO `Preguntas` (`id`, `encuesta`, `tipo`, `numPregunta`, `pregunta`, `video`, `imagen`, `op1`, `op2`, `op3`, `op4`, `op5`, `op6`, `op7`, `op8`, `op9`, `op10`) VALUES
(41, 4, 1, 1, 'Â¿QuÃ© cosas ha escuchado recientemente de Margarita Zavala?', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 4, 2, 2, 'Â¿Su opiniÃ³n sobre Margarita Zavala es?', '', '', 'Positiva', 'Negativa', 'Neutra', '', '', '', '', '', '', ''),
(43, 4, 3, 3, 'Â¿Conoce la asociaciÃ³n que promueve Margarita Zavala?', '', '', 'SÃ­', 'No', '', '', '', '', '', '', '', ''),
(44, 4, 2, 4, 'Â¿Sabe usted quÃ© promueve dicha asociaciÃ³n?', '', '', 'SÃ­', 'No', '', '', '', '', '', '', '', ''),
(45, 4, 2, 5, 'DespuÃ©s de ver el video, su opiniÃ³n sobre MZ...', '', '', 'MejorÃ³', 'EmpeorÃ³', 'Sigue igual', '', '', '', '', '', '', ''),
(46, 4, 2, 6, 'Â¿Cree usted que tiene posibilidades para ser Presidenta de MÃ©xico?', '', '', 'SÃ­', 'No', 'AÃºn es muy pronto para dar una opiniÃ³n', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuestas`
--

CREATE TABLE `Respuestas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`, `username`, `password`, `nombre`, `apPaterno`, `apMaterno`, `email`, `tipo`) VALUES
(1, 'admin', 'admin', 'Administrador', '', '', '', 0),
(7, 'mzavala', 'pass', 'Margarita', 'Zavala', ' ', 'mzavala@pan.com', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `Panel`
--
ALTER TABLE `Panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=400;
--
-- AUTO_INCREMENT de la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
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
