-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-08-2016 a las 20:54:08
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
  `nombre` varchar(50) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Encuesta`
--

INSERT INTO `Encuesta` (`id`, `panel`, `nombre`, `fechaInicio`, `fechaFin`) VALUES
(1, 4, 'MZ', '2016-07-23', '2016-07-30'),
(2, 3, 'MZ 2', '2016-08-10', '2016-10-21'),
(3, 4, 'MZ 3', '2016-07-23', '2016-07-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panel`
--

CREATE TABLE `Panel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `creador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Panel`
--

INSERT INTO `Panel` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `cliente`, `creador`) VALUES
(3, 'Panel Prueba', '', '2016-07-04', '2016-12-31', 4, 1),
(4, 'Panel Prueba 2', '', '2016-07-04', '2016-12-31', 4, 1),
(8, 'adnsljfn', '', '2016-01-01', '2016-01-01', 1, 1),
(9, 'adnsljfna', '', '2016-01-01', '2016-01-01', 1, 1),
(10, 'adnsljfna1', '', '2016-01-01', '2016-01-01', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Panelista`
--

CREATE TABLE `Panelista` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `genero` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `educacion` int(11) NOT NULL,
  `calleNumero` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `municipio` varchar(25) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `cp` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PanelistaEnPanel`
--

CREATE TABLE `PanelistaEnPanel` (
  `id` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `panel` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Preguntas`
--

CREATE TABLE `Preguntas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `numPregunta` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `video` text NOT NULL,
  `imagen` text NOT NULL,
  `op1` text NOT NULL,
  `op2` text NOT NULL,
  `op3` text NOT NULL,
  `op4` text NOT NULL,
  `op5` text NOT NULL,
  `op6` text NOT NULL,
  `op7` text NOT NULL,
  `op8` text NOT NULL,
  `op9` text NOT NULL,
  `op10` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Preguntas`
--

INSERT INTO `Preguntas` (`id`, `encuesta`, `tipo`, `numPregunta`, `pregunta`, `video`, `imagen`, `op1`, `op2`, `op3`, `op4`, `op5`, `op6`, `op7`, `op8`, `op9`, `op10`) VALUES
(39, 1, 0, 2, 'Esta es la pregunta', 'liga al video', 'liga a la imagen', 'opcion 1', 'opcion 2', 'opcion 3', 'opcion 4', 'opcion 5', 'opcion 6', 'opcion 7', 'opcion 8', 'opcion 9', 'opcion 10'),
(40, 2, 0, 2, 'Esta es la pregunta', 'liga al video', 'liga a la imagen', 'opcion 1', 'opcion 2', 'opcion 3', 'opcion 4', 'opcion 5', 'opcion 6', 'opcion 7', 'opcion 8', 'opcion 9', 'opcion 10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuestas`
--

CREATE TABLE `Respuestas` (
  `id` int(11) NOT NULL,
  `encuesta` int(11) NOT NULL,
  `panelista` int(11) NOT NULL,
  `respuestas` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Panel`
--
ALTER TABLE `Panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `PanelistaEnPanel`
--
ALTER TABLE `PanelistaEnPanel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
