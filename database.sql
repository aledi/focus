-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-07-2016 a las 02:55:26
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
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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

CREATE TABLE `Panel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `creador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `fechaInicio`, `fechaFin`, `cliente`, `creador`) VALUES
(3, 'Panel Prueba', '2016-07-04', '2016-12-31', 4, 1),
(4, 'Panel Prueba 2', '2016-07-04', '2016-12-31', 4, 1),
(8, 'adnsljfn', '2016-01-01', '2016-01-01', 1, 1),
(9, 'adnsljfna', '2016-01-01', '2016-01-01', 1, 1),
(10, 'adnsljfna1', '2016-01-01', '2016-01-01', 1, 1),
(11, 'adnslj', '2016-01-01', '2016-01-01', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panelista`
--

CREATE TABLE `Panelista` (
  `id` int(11) NOT NULL,
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
  `fotoINE` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Panelista`
--

INSERT INTO `Panelista` (`id`, `email`, `password`, `nombre`, `apPaterno`, `apMaterno`, `genero`, `educacion`, `edad`, `edoCivil`, `estado`, `municipio`, `cuartos`, `banios`, `regadera`, `focos`, `piso`, `autos`, `estudiosProv`, `estufa`, `movil`, `fotoINE`) VALUES
(2, 'ecristerna@panelista.com', '', 'Eduardo', 'Cristerna', 'Panelista', 0, 4, 21, 1, 'Nuevo Leon', 'Monterrey', 4, 4, 0, 20, 1, 3, 7, 0, 2147483647, ' '),
(3, 'ecristerna@panelista.com', '', 'Eduardo', 'Cristerna', 'Panelista', 0, 4, 21, 1, 'Nuevo Leon', 'Monterrey', 4, 4, 0, 20, 1, 3, 7, 0, 2147483647, ' ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PanelistaEnPanel`
--

CREATE TABLE `PanelistaEnPanel` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `PanelistaEnPanel`
--

INSERT INTO `PanelistaEnPanel` (`id`, `panelista`, `panel`) VALUES
(2, 2, 4),
(21, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuestas`
--

CREATE TABLE `Respuestas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apPaterno` varchar(50) NOT NULL,
  `apMaterno` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
-- Filtros para la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD CONSTRAINT `Respuestas_ibfk_1` FOREIGN KEY (`encuesta`) REFERENCES `Encuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Respuestas_ibfk_2` FOREIGN KEY (`panelista`) REFERENCES `Panelista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;