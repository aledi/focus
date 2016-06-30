-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jun 28, 2016 at 02:07 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

Create Database focus; 
use focus;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `focus`
--

-- --------------------------------------------------------

--
-- Table structure for table `Panelista`
--

CREATE TABLE `Panelista` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apPaterno` varchar(25) NOT NULL,
  `apMaterno` varchar(25) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`id`, `username`, `password`, `email`, `tipo`) VALUES
(1, 'ecristerna', 'password', 'ecristerna@icloud.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Panelista`
--
ALTER TABLE `Panelista`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Panelista`
--
ALTER TABLE `Panelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
