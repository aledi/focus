-- phpMyAdmin SQL Dump
-- version 4.0.10.16
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-07-2016 a las 01:17:01
-- Versión del servidor: 5.5.46
-- Versión de PHP: 5.6.22

CREATE DATABASE focus;
USE focus;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `focus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Encuesta`
--

CREATE TABLE IF NOT EXISTS `Encuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `panel` (`panel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Encuesta`
--

INSERT INTO `Encuesta` (`id`, `panel`, `nombre`) VALUES
(1, 3, 'MZ'),
(2, 3, 'MZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panel`
--

CREATE TABLE IF NOT EXISTS `Panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `creador` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente` (`cliente`,`creador`),
  KEY `cliente_2` (`cliente`),
  KEY `creador` (`creador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `fechaInicio`, `fechaFin`, `cliente`, `creador`) VALUES
(3, 'Panel Prueba', '2016-07-04', '2016-12-31', 4, 1),
(4, 'Panel Prueba 2', '2016-07-04', '2016-12-31', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panelista`
--

CREATE TABLE IF NOT EXISTS `Panelista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apPaterno` varchar(25) NOT NULL,
  `apMaterno` varchar(25) NOT NULL,
  `genero` int(11) NOT NULL,
  `educacion` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `edoCivil` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `municipio` varchar(25) NOT NULL,
  `cuartos` int(11) NOT NULL,
  `banios` int(11) NOT NULL,
  `regadera` tinyint(1) NOT NULL,
  `focos` int(11) NOT NULL,
  `piso` int(11) NOT NULL,
  `autos` int(11) NOT NULL,
  `estudiosProv` int(11) NOT NULL,
  `estufa` int(11) NOT NULL,
  `movil` int(11) NOT NULL,
  `fotoINE` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Panelista`
--

INSERT INTO `Panelista` (`id`, `email`, `password`, `nombre`, `apPaterno`, `apMaterno`, `genero`, `educacion`, `edad`, `edoCivil`, `estado`, `municipio`, `cuartos`, `banios`, `regadera`, `focos`, `piso`, `autos`, `estudiosProv`, `estufa`, `movil`, `fotoINE`) VALUES
(2, 'ecristerna@panelista.com', '', 'Eduardo', 'Cristerna', 'Panelista', 0, 4, 21, 1, 'Nuevo Leon', 'Monterrey', 4, 4, 0, 20, 1, 3, 7, 0, 2147483647, ' ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PanelistaEnPanel`
--

CREATE TABLE IF NOT EXISTS `PanelistaEnPanel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`panelista`,`panel`),
  KEY `panelista` (`panelista`),
  KEY `panel` (`panel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuestas`
--

CREATE TABLE IF NOT EXISTS `Respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta` (`encuesta`),
  KEY `panelista` (`panelista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apPaterno` varchar(50) NOT NULL,
  `apMaterno` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`, `username`, `password`, `nombre`, `apPaterno`, `apMaterno`, `email`, `tipo`) VALUES
(1, 'admin', 'admin', 'Eduardo', 'Cristerna', 'Morales', 'ecristerna@icloud.com', 0),
(3, 'cliente', 'cliente', 'Cliente', 'Prueba', 'Prueba', 'cliente@prueba.com', 1),
(4, 'cgomez', 'password', 'Carlos', 'Gomez', 'Gomez', 'cgomez@campania.com', 1),
(5, 'newCliente', 'password', 'Nuevo', 'Cliente', 'Prueba', 'newCliente@cliente.com', 1),
(6, 'newAdmin', 'password', 'Nuevo', 'Admin', 'Prueba', 'newAdmin@admin.com', 0);

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
  ADD CONSTRAINT `Panel_ibfk_2` FOREIGN KEY (`creador`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Panel_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  ADD CONSTRAINT `PanelistaEnPanel_ibfk_2` FOREIGN KEY (`panel`) REFERENCES `Panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PanelistaEnPanel_ibfk_1` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD CONSTRAINT `Respuestas_ibfk_2` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Respuestas_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
