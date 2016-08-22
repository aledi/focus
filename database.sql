-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Aug 22, 2016 at 10:33 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `focus`
--

-- --------------------------------------------------------

--
-- Table structure for table `Encuesta`
--

CREATE TABLE `Encuesta` (
  `id` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Encuesta`
--

INSERT INTO `Encuesta` (`id`, `panel`, `nombre`, `fechaInicio`, `fechaFin`) VALUES
(1, 1, 'Encuesta Demo MZ', '2016-08-06', '2016-08-31'),
(2, 3, 'Encuesta de Opinión Pública', '2016-01-01', '2016-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `Panel`
--

CREATE TABLE `Panel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `creador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `cliente`, `creador`) VALUES
(1, 'Margarita Zavala', '', '2016-08-06', '2016-08-31', 2, 1),
(2, 'Margarita Zavala SE', '', '2016-08-06', '2016-08-31', 2, 1),
(3, 'Jaime Rdz', '', '2016-01-01', '2016-12-31', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Panelista`
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
  `deviceToken` text COLLATE utf8_spanish_ci NOT NULL,
  `deviceType` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Panelista`
--

INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`, `deviceToken`, `deviceType`) VALUES
(1, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, 'd64bd2068d0c647ae3dd2d5badbe9ca946cf69eaa05ece837fa10d6ce8afccac', 1),
(2, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(3, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(4, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(5, 'Alberto', 'pass', 'Alberto', 'López Méndez', 'albertolm8970@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(6, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(7, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(8, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(9, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 0, '', 0),
(10, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(11, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(12, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(13, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(14, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(15, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(16, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(17, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '', 0),
(18, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'San Pedro', 'NL', 0, '', 0),
(19, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(20, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(21, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(22, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '', 0),
(23, 'Mar', 'pass', 'Mar', 'González González', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(24, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(25, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(26, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(27, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(28, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(29, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(30, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(31, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(32, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(33, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '', 0),
(34, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(35, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(36, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(37, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '', 0),
(38, 'Mar', 'pass', 'Mar', 'González González', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(39, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '', 0),
(40, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(41, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(42, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(43, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(44, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(45, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(46, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(47, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(48, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(49, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '', 0),
(50, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(51, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(52, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(53, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(54, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(55, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(56, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(57, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(58, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '', 0),
(59, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(60, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(61, 'Raúl', 'pass', 'Raúl', 'Dominguez López', 'rauldom4598@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(62, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '', 0),
(63, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(64, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(65, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(66, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Apodaca', 'NL', 0, '', 0),
(67, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(68, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(69, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(70, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(71, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(72, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '', 0),
(73, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(74, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(75, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(76, 'Julian', 'pass', 'Julian', 'Zambrano Treviño', 'julianzam_7887@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(77, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(78, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(79, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(80, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(81, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '', 0),
(82, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(83, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(84, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(85, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(86, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(87, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(88, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(89, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '', 0),
(90, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(91, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(92, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(93, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(94, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'San Pedro', 'NL', 0, '', 0),
(95, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(96, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(97, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(98, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(99, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'San Pedro', 'NL', 0, '', 0),
(100, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(101, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(102, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(103, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(104, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(105, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(106, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 3, '', '', 'Apodaca', 'NL', 0, '', 0),
(107, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(108, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(109, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '', 0),
(110, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Escobedo', 'NL', 0, '', 0),
(111, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(112, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(113, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(114, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(115, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(116, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(117, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(118, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'García', 'NL', 0, '', 0),
(119, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(120, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(121, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '', 0),
(122, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(123, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(124, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(125, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(126, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(127, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(128, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(129, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(130, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(131, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'García', 'NL', 0, '', 0),
(132, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '', 0),
(133, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(134, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '', 0),
(135, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(136, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(137, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(138, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 2, '', '', 'Guadalupe', 'NL', 0, '', 0),
(139, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '', 0),
(140, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(141, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(142, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(143, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(144, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(145, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 1, '', '', 'Escobedo', 'NL', 0, '', 0),
(146, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(147, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(148, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(149, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '', 0),
(150, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(151, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(152, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(153, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(154, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(155, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(156, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(157, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'García', 'NL', 0, '', 0),
(158, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(159, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(160, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(161, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 1, '', '', 'San Pedro', 'NL', 0, '', 0),
(162, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(163, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(164, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '', 0),
(165, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(166, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(167, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(168, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(169, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(170, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(171, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(172, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(173, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(174, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(175, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 0, '', 0),
(176, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(177, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(178, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(179, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 1, '', '', 'San Nicolás', 'NL', 0, '', 0),
(180, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(181, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '', 0),
(182, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(183, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(184, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(185, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(186, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(187, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(188, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(189, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(190, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(191, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '', 0),
(192, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(193, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(194, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(195, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(196, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(197, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(198, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(199, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(200, 'Alejandro', 'pass', 'Alejandro', 'Muñoz Muñoz', 'alexmm_8970@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(201, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '', 0),
(202, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(203, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(204, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(205, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'García', 'NL', 0, '', 0),
(206, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(207, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(208, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '', 0),
(209, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(210, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(211, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(212, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(213, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(214, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 3, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(215, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(216, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(217, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(218, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(219, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(220, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '', 0),
(221, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(222, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(223, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(224, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(225, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(226, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(227, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(228, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(229, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(230, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(231, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(232, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(233, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(234, 'Daniel', 'pass', 'Daniel', 'Duarte Muñoz', 'daniduarte_898048@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(235, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(236, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(237, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(238, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(239, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(240, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '', 0),
(241, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(242, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(243, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '', 0),
(244, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '', 0),
(245, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(246, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(247, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(248, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(249, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(250, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(251, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(252, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(253, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(254, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Escobedo', 'NL', 0, '', 0),
(255, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(256, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(257, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 0, '', 0),
(258, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(259, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(260, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(261, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(262, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(263, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 0, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(264, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(265, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'García', 'NL', 0, '', 0),
(266, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(267, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(268, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(269, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(270, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(271, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'Apodaca', 'NL', 0, '', 0),
(272, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(273, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(274, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '', 0),
(275, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(276, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(277, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(278, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(279, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(280, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(281, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(282, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(283, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(284, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(285, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(286, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(287, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '', 0),
(288, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(289, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(290, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(291, 'Karmina', 'pass', 'Karmina', 'Martínez González', 'karminamtz9789@hotmail.com', 1, '0000-00-00', 2, '', '', 'Escobedo', 'NL', 0, '', 0),
(292, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(293, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(294, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(295, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'García', 'NL', 0, '', 0),
(296, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(297, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 3, '', '', 'San Pedro', 'NL', 0, '', 0),
(298, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Pedro', 'NL', 0, '', 0),
(299, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(300, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(301, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 1, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(302, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(303, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(304, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '', 0),
(305, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(306, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(307, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(308, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(309, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(310, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(311, 'Carlos Alberto', 'pass', 'Carlos Alberto', 'López Méndez', 'carlosalberto_8080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(312, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Nicolás', 'NL', 0, '', 0),
(313, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(314, 'Jorge', 'pass', 'Jorge', 'Jimenez González', 'jorgejg_5824@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(315, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(316, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(317, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(318, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '', 0),
(319, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(320, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(321, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(322, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 0, '', 0),
(323, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(324, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(325, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(326, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(327, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(328, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(329, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(330, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(331, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(332, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(333, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(334, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(335, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(336, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(337, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'García', 'NL', 0, '', 0),
(338, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 3, '', '', 'Escobedo', 'NL', 0, '', 0),
(339, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(340, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 0, '', '', 'Monterrey', 'NL', 0, '', 0),
(341, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(342, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(343, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(344, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(345, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(346, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(347, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(348, 'Rodrigo', 'pass', 'Rodrigo', 'Martinez Martinez', 'rodrimtzz7845@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(349, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Juárez', 'NL', 0, '', 0),
(350, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0);
INSERT INTO `Panelista` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `genero`, `fechaNacimiento`, `educacion`, `calleNumero`, `colonia`, `municipio`, `estado`, `cp`, `deviceToken`, `deviceType`) VALUES
(351, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '', 0),
(352, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(353, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 2, '', '', 'San Nicolás', 'NL', 0, '', 0),
(354, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(355, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(356, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Guadalupe', 'NL', 0, '', 0),
(357, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(358, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(359, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(360, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(361, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(362, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(363, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(364, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(365, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(366, 'Alma Alexia', 'pass', 'Alma Alexia', 'Muñoz Montes', 'almaa9090@hotmail.com', 1, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(367, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(368, 'Pedro Ignacio', 'pass', 'Pedro Ignacio', 'Ríos Garay', 'pedrorios0580@hotmail.com', 0, '0000-00-00', 5, '', '', 'Apodaca', 'NL', 0, '', 0),
(369, 'María', 'pass', 'María', 'Zazueta López', 'mariazaz802@hotmail.com', 1, '0000-00-00', 3, '', '', 'Guadalupe', 'NL', 0, '', 0),
(370, 'Enrique', 'pass', 'Enrique', 'Martínez Lagos', 'enrmarl9035@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(371, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(372, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 3, '', '', 'Monterrey', 'NL', 0, '', 0),
(373, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(374, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(375, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(376, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(377, 'Alejandra', 'pass', 'Alejandra', 'Sandoval Ramirez', 'alesanra23@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(378, 'Mario', 'pass', 'Mario', 'Casas Gutiérrez', 'mariocasas80901@hotmail.com', 0, '0000-00-00', 2, '', '', 'García', 'NL', 0, '', 0),
(379, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Apodaca', 'NL', 0, '', 0),
(380, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(381, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(382, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(383, 'Ricardo', 'pass', 'Ricardo', 'Duarte Fontes', 'rickyduarte5687@hotmail.com', 0, '0000-00-00', 1, '', '', 'Apodaca', 'NL', 0, '', 0),
(384, 'José Miguel', 'pass', 'José Miguel', 'Zazueta Cordoba', 'josemzc8116@hotmail.com', 0, '0000-00-00', 5, '', '', 'Monterrey', 'NL', 0, '', 0),
(385, 'María del Carmen', 'pass', 'María del Carmen', 'Valenzuela Beltrán', 'macarmen_1224@hotmail.com', 1, '0000-00-00', 0, '', '', 'San Nicolás', 'NL', 0, '', 0),
(386, 'Ariadna', 'pass', 'Ariadna', 'Corral López', 'ariadnacor8024@hotmail.com', 1, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(387, 'Julio', 'pass', 'Julio', 'Carranza Arriaga', 'juliocarranza_9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(388, 'Ana Lourdes', 'pass', 'Ana Lourdes', 'Valenzuela López', 'anilu_248090@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(389, 'Vilma', 'pass', 'Vilma', 'López Rodríguez', 'vilma9042@hotmail.com', 1, '0000-00-00', 3, '', '', 'García', 'NL', 0, '', 0),
(390, 'Roberto', 'pass', 'Roberto', 'Loaiza Maytorena', 'robertoloaiza1292@hotmail.com', 0, '0000-00-00', 4, '', '', 'Escobedo', 'NL', 0, '', 0),
(391, 'Mar', 'pass', 'Mar', 'González González', 'margonzalez_8479@hotmail.com', 1, '0000-00-00', 2, '', '', 'Santa Catarina', 'NL', 0, '', 0),
(392, 'Luis Manuel', 'pass', 'Luis Manuel', 'Martínez Sánchez', 'luismanuel_90_80@hotmail.com', 0, '0000-00-00', 3, '', '', 'San Nicolás', 'NL', 0, '', 0),
(393, 'Carlos', 'pass', 'Carlos', 'Mayo Rodriguez', 'carlosmay@hotmail.com', 0, '0000-00-00', 1, '', '', 'Monterrey', 'NL', 0, '', 0),
(394, 'Natalia Paulina', 'pass', 'Natalia Paulina', 'Jasso León', 'natapa2815@hotmail.com', 1, '0000-00-00', 4, '', '', 'Guadalupe', 'NL', 0, '', 0),
(395, 'Ulises', 'pass', 'Ulises', 'Montemayor Montes', 'ulisesmmm9080@hotmail.com', 0, '0000-00-00', 2, '', '', 'Juárez', 'NL', 0, '', 0),
(396, 'Elizabeth', 'pass', 'Elizabeth', 'Verdugo Mayo', 'elizabethvm809824@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(397, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0),
(398, 'Karla María', 'pass', 'Karla María', 'Montes Fuentes', 'karlammf0368@hotmail.com', 1, '0000-00-00', 4, '', '', 'Monterrey', 'NL', 0, '', 0),
(399, 'Filiberto', 'pass', 'Filiberto', 'Zazueta Cordoba', 'filizazc7890@hotmail.com', 0, '0000-00-00', 2, '', '', 'Monterrey', 'NL', 0, '', 0),
(400, 'Fernando', 'pass', 'Fernando', 'Portes Zambrano', 'ferpat0713@hotmail.com', 0, '0000-00-00', 4, '', '', 'San Pedro', 'NL', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PanelistaEnPanel`
--

CREATE TABLE `PanelistaEnPanel` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4568 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `PanelistaEnPanel`
--

INSERT INTO `PanelistaEnPanel` (`id`, `panelista`, `panel`) VALUES
(22, 1, 2),
(3366, 1, 1),
(4168, 1, 3),
(3367, 2, 1),
(4169, 2, 3),
(4170, 3, 3),
(4171, 4, 3),
(4172, 5, 3),
(4173, 6, 3),
(4174, 7, 3),
(4175, 8, 3),
(4176, 9, 3),
(4177, 10, 3),
(4178, 11, 3),
(4179, 12, 3),
(4180, 13, 3),
(4181, 14, 3),
(4182, 15, 3),
(4183, 16, 3),
(4184, 17, 3),
(4185, 18, 3),
(4186, 19, 3),
(4187, 20, 3),
(4188, 21, 3),
(4189, 22, 3),
(4190, 23, 3),
(4191, 24, 3),
(4192, 25, 3),
(4193, 26, 3),
(4194, 27, 3),
(4195, 28, 3),
(4196, 29, 3),
(4197, 30, 3),
(4198, 31, 3),
(4199, 32, 3),
(4200, 33, 3),
(4201, 34, 3),
(4202, 35, 3),
(4203, 36, 3),
(4204, 37, 3),
(4205, 38, 3),
(4206, 39, 3),
(4207, 40, 3),
(4208, 41, 3),
(4209, 42, 3),
(4210, 43, 3),
(4211, 44, 3),
(4212, 45, 3),
(4213, 46, 3),
(4214, 47, 3),
(4215, 48, 3),
(4216, 49, 3),
(4217, 50, 3),
(4218, 51, 3),
(4219, 52, 3),
(4220, 53, 3),
(4221, 54, 3),
(4222, 55, 3),
(4223, 56, 3),
(4224, 57, 3),
(4225, 58, 3),
(4226, 59, 3),
(4227, 60, 3),
(4228, 61, 3),
(4229, 62, 3),
(4230, 63, 3),
(4231, 64, 3),
(4232, 65, 3),
(4233, 66, 3),
(4234, 67, 3),
(4235, 68, 3),
(4236, 69, 3),
(4237, 70, 3),
(4238, 71, 3),
(4239, 72, 3),
(4240, 73, 3),
(4241, 74, 3),
(4242, 75, 3),
(4243, 76, 3),
(4244, 77, 3),
(4245, 78, 3),
(4246, 79, 3),
(4247, 80, 3),
(4248, 81, 3),
(4249, 82, 3),
(4250, 83, 3),
(4251, 84, 3),
(4252, 85, 3),
(4253, 86, 3),
(4254, 87, 3),
(4255, 88, 3),
(4256, 89, 3),
(4257, 90, 3),
(4258, 91, 3),
(4259, 92, 3),
(4260, 93, 3),
(4261, 94, 3),
(4262, 95, 3),
(4263, 96, 3),
(4264, 97, 3),
(4265, 98, 3),
(4266, 99, 3),
(4267, 100, 3),
(4268, 101, 3),
(4269, 102, 3),
(4270, 103, 3),
(4271, 104, 3),
(4272, 105, 3),
(4273, 106, 3),
(4274, 107, 3),
(4275, 108, 3),
(4276, 109, 3),
(4277, 110, 3),
(4278, 111, 3),
(4279, 112, 3),
(4280, 113, 3),
(4281, 114, 3),
(4282, 115, 3),
(4283, 116, 3),
(4284, 117, 3),
(4285, 118, 3),
(4286, 119, 3),
(4287, 120, 3),
(4288, 121, 3),
(4289, 122, 3),
(4290, 123, 3),
(4291, 124, 3),
(4292, 125, 3),
(4293, 126, 3),
(4294, 127, 3),
(4295, 128, 3),
(4296, 129, 3),
(4297, 130, 3),
(4298, 131, 3),
(4299, 132, 3),
(4300, 133, 3),
(4301, 134, 3),
(4302, 135, 3),
(4303, 136, 3),
(4304, 137, 3),
(4305, 138, 3),
(4306, 139, 3),
(4307, 140, 3),
(4308, 141, 3),
(4309, 142, 3),
(4310, 143, 3),
(4311, 144, 3),
(4312, 145, 3),
(4313, 146, 3),
(4314, 147, 3),
(4315, 148, 3),
(4316, 149, 3),
(4317, 150, 3),
(4318, 151, 3),
(4319, 152, 3),
(4320, 153, 3),
(4321, 154, 3),
(4322, 155, 3),
(4323, 156, 3),
(4324, 157, 3),
(4325, 158, 3),
(4326, 159, 3),
(4327, 160, 3),
(4328, 161, 3),
(4329, 162, 3),
(4330, 163, 3),
(4331, 164, 3),
(4332, 165, 3),
(4333, 166, 3),
(4334, 167, 3),
(4335, 168, 3),
(4336, 169, 3),
(4337, 170, 3),
(4338, 171, 3),
(4339, 172, 3),
(4340, 173, 3),
(4341, 174, 3),
(4342, 175, 3),
(4343, 176, 3),
(4344, 177, 3),
(4345, 178, 3),
(4346, 179, 3),
(4347, 180, 3),
(4348, 181, 3),
(4349, 182, 3),
(4350, 183, 3),
(4351, 184, 3),
(4352, 185, 3),
(4353, 186, 3),
(4354, 187, 3),
(4355, 188, 3),
(4356, 189, 3),
(4357, 190, 3),
(4358, 191, 3),
(4359, 192, 3),
(4360, 193, 3),
(4361, 194, 3),
(4362, 195, 3),
(4363, 196, 3),
(4364, 197, 3),
(4365, 198, 3),
(4366, 199, 3),
(4367, 200, 3),
(4368, 201, 3),
(4369, 202, 3),
(4370, 203, 3),
(4371, 204, 3),
(4372, 205, 3),
(4373, 206, 3),
(4374, 207, 3),
(4375, 208, 3),
(4376, 209, 3),
(4377, 210, 3),
(4378, 211, 3),
(4379, 212, 3),
(4380, 213, 3),
(4381, 214, 3),
(4382, 215, 3),
(4383, 216, 3),
(4384, 217, 3),
(4385, 218, 3),
(4386, 219, 3),
(4387, 220, 3),
(4388, 221, 3),
(4389, 222, 3),
(4390, 223, 3),
(4391, 224, 3),
(4392, 225, 3),
(4393, 226, 3),
(4394, 227, 3),
(4395, 228, 3),
(4396, 229, 3),
(4397, 230, 3),
(4398, 231, 3),
(4399, 232, 3),
(4400, 233, 3),
(4401, 234, 3),
(4402, 235, 3),
(4403, 236, 3),
(4404, 237, 3),
(4405, 238, 3),
(4406, 239, 3),
(4407, 240, 3),
(4408, 241, 3),
(4409, 242, 3),
(4410, 243, 3),
(4411, 244, 3),
(4412, 245, 3),
(4413, 246, 3),
(4414, 247, 3),
(4415, 248, 3),
(4416, 249, 3),
(4417, 250, 3),
(4418, 251, 3),
(4419, 252, 3),
(4420, 253, 3),
(4421, 254, 3),
(4422, 255, 3),
(4423, 256, 3),
(4424, 257, 3),
(4425, 258, 3),
(4426, 259, 3),
(4427, 260, 3),
(4428, 261, 3),
(4429, 262, 3),
(4430, 263, 3),
(4431, 264, 3),
(4432, 265, 3),
(4433, 266, 3),
(4434, 267, 3),
(4435, 268, 3),
(4436, 269, 3),
(4437, 270, 3),
(4438, 271, 3),
(4439, 272, 3),
(4440, 273, 3),
(4441, 274, 3),
(4442, 275, 3),
(4443, 276, 3),
(4444, 277, 3),
(4445, 278, 3),
(4446, 279, 3),
(4447, 280, 3),
(4448, 281, 3),
(4449, 282, 3),
(4450, 283, 3),
(4451, 284, 3),
(4452, 285, 3),
(4453, 286, 3),
(4454, 287, 3),
(4455, 288, 3),
(4456, 289, 3),
(4457, 290, 3),
(4458, 291, 3),
(4459, 292, 3),
(4460, 293, 3),
(4461, 294, 3),
(4462, 295, 3),
(4463, 296, 3),
(4464, 297, 3),
(4465, 298, 3),
(4466, 299, 3),
(4467, 300, 3),
(4468, 301, 3),
(4469, 302, 3),
(4470, 303, 3),
(4471, 304, 3),
(4472, 305, 3),
(4473, 306, 3),
(4474, 307, 3),
(4475, 308, 3),
(4476, 309, 3),
(4477, 310, 3),
(4478, 311, 3),
(4479, 312, 3),
(4480, 313, 3),
(4481, 314, 3),
(4482, 315, 3),
(4483, 316, 3),
(4484, 317, 3),
(4485, 318, 3),
(4486, 319, 3),
(4487, 320, 3),
(4488, 321, 3),
(4489, 322, 3),
(4490, 323, 3),
(4491, 324, 3),
(4492, 325, 3),
(4493, 326, 3),
(4494, 327, 3),
(4495, 328, 3),
(4496, 329, 3),
(4497, 330, 3),
(4498, 331, 3),
(4499, 332, 3),
(4500, 333, 3),
(4501, 334, 3),
(4502, 335, 3),
(4503, 336, 3),
(4504, 337, 3),
(4505, 338, 3),
(4506, 339, 3),
(4507, 340, 3),
(4508, 341, 3),
(4509, 342, 3),
(4510, 343, 3),
(4511, 344, 3),
(4512, 345, 3),
(4513, 346, 3),
(4514, 347, 3),
(4515, 348, 3),
(4516, 349, 3),
(4517, 350, 3),
(4518, 351, 3),
(4519, 352, 3),
(4520, 353, 3),
(4521, 354, 3),
(4522, 355, 3),
(4523, 356, 3),
(4524, 357, 3),
(4525, 358, 3),
(4526, 359, 3),
(4527, 360, 3),
(4528, 361, 3),
(4529, 362, 3),
(4530, 363, 3),
(4531, 364, 3),
(4532, 365, 3),
(4533, 366, 3),
(4534, 367, 3),
(4535, 368, 3),
(4536, 369, 3),
(4537, 370, 3),
(4538, 371, 3),
(4539, 372, 3),
(4540, 373, 3),
(4541, 374, 3),
(4542, 375, 3),
(4543, 376, 3),
(4544, 377, 3),
(4545, 378, 3),
(4546, 379, 3),
(4547, 380, 3),
(4548, 381, 3),
(4549, 382, 3),
(4550, 383, 3),
(4551, 384, 3),
(4552, 385, 3),
(4553, 386, 3),
(4554, 387, 3),
(4555, 388, 3),
(4556, 389, 3),
(4557, 390, 3),
(4558, 391, 3),
(4559, 392, 3),
(4560, 393, 3),
(4561, 394, 3),
(4562, 395, 3),
(4563, 396, 3),
(4564, 397, 3),
(4565, 398, 3),
(4566, 399, 3),
(4567, 400, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Preguntas`
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Preguntas`
--

INSERT INTO `Preguntas` (`id`, `encuesta`, `tipo`, `numPregunta`, `pregunta`, `video`, `imagen`, `op1`, `op2`, `op3`, `op4`, `op5`, `op6`, `op7`, `op8`, `op9`, `op10`) VALUES
(31, 1, 1, 1, '¿Qué cosas ha escuchado recientemente de Margarita Zavala?', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, 1, 2, 2, '¿Su opinión sobre Margarita Zavala es?', '', '', 'Positiva', 'Negativa', 'Neutra', '', '', '', '', '', '', ''),
(33, 1, 2, 3, '¿Conoce la asociación que promueve Margarita Zavala?', '', '', 'Sí', 'No', '', '', '', '', '', '', '', ''),
(34, 1, 2, 4, 'Sabe usted que promueve dicha asociación', '', '', 'Sí', 'No', '', '', '', '', '', '', '', ''),
(35, 1, 2, 5, 'Vea usted este video de Margarita Zavala', '', '', 'Mejoró', 'Empeoró', 'Sigue igual', '', '', '', '', '', '', ''),
(36, 1, 2, 6, '¿Cree usted que tiene posibilidades para ser Presidenta de México?', '', '', 'Sí', 'No', 'Aún es muy pronto para dar una opinión', '', '', '', '', '', '', ''),
(44, 2, 2, 1, '¿Cuál es el principal problema (sólo uno) que hay en Nuevo León?', '', '', 'Inseguridad', 'Drenaje pluvial', 'Pavimentación / Bacheo', 'Alumbrado público', 'Educación', 'Vialidad', 'Desempleo', 'Ninguno', 'Otro', ''),
(45, 2, 2, 2, 'En una escala del 1 al 10, ¿cómo califica el trabajo que ha realizado el Gobernador Jaime Rodríguez?', '', '', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
(46, 2, 2, 3, '¿Qué opinión tiene del Gobierno de Jaime Rodríguez?', '', '', 'Excelente', 'Buena', 'Regular', 'Mala', 'Pésima', '', '', '', '', ''),
(47, 2, 2, 4, '¿Aprueba el trabajo de Jaime Rodríguez?', '', '', 'Aprueba', 'Desaprueba', '', '', '', '', '', '', '', ''),
(48, 2, 2, 5, 'Con el gobierno de Jaime Rodríguez ha mejorado o empeorado su situación en hogar', '', '', 'Mejorado', 'Empeorado', '', '', '', '', '', '', '', ''),
(49, 2, 1, 6, '¿Cómo describiría el gobierno de Jaime Rodríguez?', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 2, 2, 7, 'Tener un gobernador independiente en Nuevo León ha sido hasta este momento', '', '', 'Para bien', 'Para mal', 'Todo sigue igual', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Respuestas`
--

CREATE TABLE `Respuestas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`id`, `username`, `password`, `nombre`, `apellidos`, `email`, `tipo`) VALUES
(1, 'admin', 'admin', 'Administrador', 'Admin', 'admin@admin.com', 0),
(2, 'mzavala', 'pass', 'Margarita', 'Zavala', 'mzavala@pan.com', 1),
(3, 'jrdz', 'pass', 'Jaime', 'Rdz', 'jaime@rdz.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Encuesta`
--
ALTER TABLE `Encuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panel` (`panel`);

--
-- Indexes for table `Panel`
--
ALTER TABLE `Panel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente` (`cliente`,`creador`),
  ADD KEY `cliente_2` (`cliente`),
  ADD KEY `creador` (`creador`);

--
-- Indexes for table `Panelista`
--
ALTER TABLE `Panelista`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  ADD PRIMARY KEY (`id`,`panelista`,`panel`),
  ADD KEY `panelista` (`panelista`),
  ADD KEY `panel` (`panel`);

--
-- Indexes for table `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encuesta` (`encuesta`);

--
-- Indexes for table `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encuesta` (`encuesta`),
  ADD KEY `panelista` (`panelista`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Encuesta`
--
ALTER TABLE `Encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Panel`
--
ALTER TABLE `Panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=401;
--
-- AUTO_INCREMENT for table `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4568;
--
-- AUTO_INCREMENT for table `Preguntas`
--
ALTER TABLE `Preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Encuesta`
--
ALTER TABLE `Encuesta`
  ADD CONSTRAINT `Encuesta_ibfk_1` FOREIGN KEY (`panel`) REFERENCES `Panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Panel`
--
ALTER TABLE `Panel`
  ADD CONSTRAINT `Panel_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Panel_ibfk_2` FOREIGN KEY (`creador`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  ADD CONSTRAINT `PanelistaEnPanel_ibfk_1` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PanelistaEnPanel_ibfk_2` FOREIGN KEY (`panel`) REFERENCES `Panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD CONSTRAINT `Preguntas_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD CONSTRAINT `Respuestas_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Respuestas_ibfk_2` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
