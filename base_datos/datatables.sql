-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-03-2015 a las 22:01:42
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `datatables`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulo` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `concepto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `id_articulo_UNIQUE` (`id_articulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=78 ;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `concepto`) VALUES
(1, 'ADAMS ( ORTODONCIA)'),
(2, 'ANALOGO'),
(3, 'ANALOGO KLORNER'),
(4, 'AÑADIR 1ª PIEZA '),
(5, 'AÑADIR RESTO PIEZAS'),
(6, 'ARANDELA DE ORO'),
(7, 'ARCO VESTIBULAR ( ORTODONCIA)'),
(8, 'ATACHE PIEZA FIJA'),
(9, 'BARRA ACKERMAN'),
(10, 'CALCINABLE'),
(11, 'CALCINABLE KLORNER'),
(12, 'CAMBIO DE COLOR '),
(13, 'CAMBIO TOTAL RESINA HIBRIDAS'),
(14, 'CAMBIO TOTAL RESINA HIBRIDAS C/ SOLDADURAS'),
(15, 'CARILLA EMPRES'),
(16, 'COMPLETA '),
(17, 'COMPLETA DEFINITIVA'),
(18, 'COMPLETA PROVISIONAL '),
(19, 'COMPOSTURA'),
(20, 'COMPOSTURA// REBASE'),
(21, 'CONTENEDOR ESPACIO'),
(22, 'CORONA CIRCONIO'),
(23, 'CORONA CIRCONIO SOBRE IMPLANTE'),
(24, 'CORONA EMPRESS SIN METAL'),
(25, 'CORONA JACKET CERAMICA'),
(26, 'CORONA METAL CERAMICA'),
(27, 'CORONA PROVISIONAL CEMENTADA'),
(28, 'CORONA SOBRE IMPLANTE'),
(29, 'ESQUELETICO BILATERAL 1-3 PZAS'),
(30, 'ESQUELETICO BILATERAL 3-5 PZAS'),
(31, 'ESQUELETICO BILATERAL 5-8 PZAS'),
(32, 'ESQUELETICO BILATERAL 8-14 PZAS'),
(33, 'ESQUELETICO UNILATERAL 1-3 PZAS'),
(34, 'FERULA DE BLANQUEAMIENTO'),
(35, 'FERULA DESCARGA'),
(36, 'FERULA QUIRURGICA'),
(37, 'GANCHO UNIDAD'),
(38, 'IMPLANTE PROVISIONAL'),
(39, 'IMPLANTE PROVISIONAL ATORNILLADO'),
(40, 'INTERFASE CIRCONIO'),
(41, 'LOCATOR UNIDAD'),
(42, 'MERYLAND PIEZA'),
(43, 'PARCIAL ACRILICO 10 PZAS O MÁS'),
(44, 'PARCIAL ACRILICO DE 1-3 PZAS'),
(45, 'PARCIAL ACRILICO DE 4 PZAS'),
(46, 'PARCIAL ACRILICO DE 5 PZAS'),
(47, 'PARCIAL ACRILICO DE 6 PZAS'),
(48, 'PARCIAL ACRILICO DE 7 PZAS'),
(49, 'PARCIAL ACRILICO DE 8 PZAS'),
(50, 'PARCIAL ACRILICO DE 9 PZAS'),
(51, 'PARCIAL ACRILICO PROV. 10 PZAS O MÁS'),
(52, 'PARCIAL ACRILICO PROV. DE 1-3 PZAS'),
(53, 'PARCIAL ACRILICO PROV. DE 4 PZAS'),
(54, 'PARCIAL ACRILICO PROV. DE 5 PZAS'),
(55, 'PARCIAL ACRILICO PROV. DE 6 PZAS'),
(56, 'PARCIAL ACRILICO PROV. DE 7 PZAS'),
(57, 'PARCIAL ACRILICO PROV. DE 8 PZAS'),
(58, 'PARCIAL ACRILICO PROV. DE 9 PZAS'),
(59, 'PERNO MUÑON COLADO'),
(60, 'PERNO MUÑON DOBLE COLADO'),
(61, 'PILAR ANGULADO'),
(62, 'PILAR CIRCONIO'),
(63, 'PILAR KLORNER ANGULADO'),
(64, 'PILAR KLORNER RECTO'),
(65, 'PILAR RECTO'),
(66, 'PLACA ( ORTODONCIA)'),
(67, 'PROTESIS HIBRIDA'),
(68, 'REPARACION ARCADA CERAMICA'),
(69, 'REPARACION SOBREDENTADURA C/ REFUERZO'),
(70, 'REPARACION SOBREDENTADURA S/ REFUERZO'),
(71, 'SET UP UNIDAD'),
(72, 'SOBREDENTADURA CON LOCATOR'),
(73, 'SOLDADURA'),
(74, 'TORNILLO AVINENT'),
(75, 'TORNILLO EXPANSION( ORTODONCIA)'),
(76, 'TORNILLO KLORNER'),
(77, 'TORNILLO TITANIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos_materiales`
--

CREATE TABLE IF NOT EXISTS `articulos_materiales` (
  `materiales_id_material` int(4) unsigned NOT NULL,
  `articulos_id_articulo` int(4) unsigned NOT NULL,
  PRIMARY KEY (`materiales_id_material`,`articulos_id_articulo`),
  KEY `fk_articulos_materiales_articulos1` (`articulos_id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos_materiales`
--

INSERT INTO `articulos_materiales` (`materiales_id_material`, `articulos_id_articulo`) VALUES
(6, 4),
(6, 5),
(2, 9),
(6, 12),
(1, 13),
(1, 14),
(2, 14),
(8, 15),
(1, 17),
(6, 17),
(4, 18),
(17, 18),
(16, 19),
(2, 21),
(3, 22),
(9, 22),
(10, 22),
(3, 23),
(8, 23),
(8, 24),
(8, 25),
(2, 26),
(9, 26),
(10, 26),
(18, 27),
(2, 28),
(9, 28),
(10, 28),
(2, 29),
(6, 29),
(2, 30),
(6, 30),
(2, 31),
(6, 31),
(2, 32),
(6, 32),
(2, 33),
(6, 33),
(12, 34),
(11, 35),
(12, 36),
(2, 37),
(18, 39),
(3, 40),
(18, 42),
(1, 43),
(6, 43),
(1, 44),
(6, 44),
(1, 45),
(6, 45),
(1, 46),
(6, 46),
(1, 47),
(6, 47),
(1, 48),
(6, 48),
(1, 49),
(6, 49),
(1, 50),
(6, 50),
(4, 51),
(17, 51),
(4, 52),
(17, 52),
(4, 53),
(17, 53),
(4, 54),
(17, 54),
(4, 55),
(17, 55),
(4, 56),
(17, 56),
(4, 57),
(17, 57),
(4, 58),
(17, 58),
(2, 59),
(2, 60),
(3, 62),
(11, 66),
(1, 67),
(2, 67),
(5, 67),
(7, 67),
(9, 68),
(17, 69),
(2, 70),
(17, 70),
(2, 72),
(6, 72),
(13, 72),
(14, 72),
(2, 73);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicas`
--

CREATE TABLE IF NOT EXISTS `clinicas` (
  `id_clinica` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `razonsocial` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cif` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localidad` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provincia` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numclinica` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tarifa` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id_clinica`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_clinicas_tarifas1` (`id_tarifa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `clinicas`
--

INSERT INTO `clinicas` (`id_clinica`, `nombre`, `razonsocial`, `cif`, `localidad`, `provincia`, `direccion`, `cp`, `numclinica`, `id_tarifa`) VALUES
(1, 'CENTRO IMPLANTOLOGICO BARCELONA', 'XX', 'B11111111', 'BARCELONA', 'BARCELONA', 'Avda. Gracia nº 15', '8015', '1', 1),
(2, 'CENTRO DE IMPLANTOLOGÍA MADRID', 'XX', 'B11111112', 'MADRID', 'MADRID', 'Paseo La Castellana nº 16', '28045', '2', 1),
(3, 'CENTRO DE IMPLANTOLOGÍA VIGO', 'XX', 'B11111113', 'VIGO', 'PONTEVEDRA', 'Calle de Vigo nº 17', '36208', '3', 1),
(4, 'CENTRO DE IMPLANTOLOGÍA ZARAGOZA', 'XX', 'B11111114', 'ZARAGOZA', 'ZARAGOZA', 'Paseo Independencia nº 18', '50005', '4', 1),
(5, 'CENTRO DE IMPLANTOLOGÍA VALENCIA', 'XX', 'B11111115', 'VALENCIA', 'VALENCIA', 'Calle de Valencia nº 19', '46018', '5', 1),
(6, 'CENTRO DE IMPLANTOLOGÍA SANTANDER', 'XX', 'B11111116', 'SANTANDER', 'SANTANDER', 'Calle de Santander nº 20', '50008', '6', 2),
(15, 'CENTRO DE IMPLANTOLOGÍA TARRAGONA', 'XX', 'B11111117', 'MADRID', 'TARRAGONA', 'Paseo de Tarragona nº 21', '28020', '15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinica_doctor`
--

CREATE TABLE IF NOT EXISTS `clinica_doctor` (
  `id_doctor` int(4) NOT NULL AUTO_INCREMENT,
  `id_clinica` int(4) NOT NULL,
  `numdoctor` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_doctor`,`id_clinica`),
  KEY `fk_clinica_doctor_1` (`id_clinica`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `clinica_doctor`
--

INSERT INTO `clinica_doctor` (`id_doctor`, `id_clinica`, `numdoctor`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 6, 2),
(4, 1, 4),
(4, 2, 1),
(5, 2, 4),
(6, 2, 2),
(7, 4, 1),
(8, 2, 3),
(9, 3, 2),
(10, 3, 1),
(11, 1, 2),
(11, 4, 2),
(11, 6, 1),
(12, 5, 1),
(13, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE IF NOT EXISTS `doctores` (
  `id_doctor` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numcolegiado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_doctor`),
  UNIQUE KEY `id_doctor_UNIQUE` (`id_doctor`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id_doctor`, `nombre`, `numcolegiado`) VALUES
(1, 'DAVID PEREZ', '11111'),
(2, 'FRANCISCO JIMENEZ', '22222'),
(3, 'ESTEBAN GONZALEZ', '333333'),
(4, 'DAVINIA DE DOS SANTOS', '44444'),
(5, 'JORGE ESPIAS', '55555'),
(6, 'LORENZO CAMAÑÓN', '666666'),
(7, 'HUGO IDIAZABAL', '777777'),
(8, 'JACOBO MADORRÁN', '888888'),
(9, 'MANUEL LOPEZ', '999999'),
(10, 'ADRIANA MEAÑOS', '101010'),
(11, 'LAURA SERRANO', '12121212'),
(12, 'YASMINE JERARCAL', '13131313'),
(13, 'DIEGO ZAERA', '14141414');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE IF NOT EXISTS `materiales` (
  `id_material` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lote1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lote2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_material`),
  UNIQUE KEY `id_tarifa` (`id_material`),
  UNIQUE KEY `concepto` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id_material`, `nombre`, `lote1`, `lote2`) VALUES
(1, 'PALAPRESS VARIO 500ML LIQ/ POLVO', NULL, NULL),
(2, 'C+B CR-CO 1KG', NULL, NULL),
(3, 'CIRCONIO', NULL, NULL),
(4, 'DIENTES INTEGRAL ', NULL, NULL),
(5, 'DIENTES MONDIAL ', NULL, NULL),
(6, 'DIENTES MONDIAL / PREMIUM', NULL, NULL),
(7, 'DIENTES PREMIUM', NULL, NULL),
(8, 'EMAX CERAMICA', NULL, NULL),
(9, 'IPS CERAMICA INLINE DENTIN', NULL, NULL),
(10, 'OPAQUER', NULL, NULL),
(11, 'ORTHORESIN ROSA LIQ/ POLVO', NULL, NULL),
(12, 'ORTHORESIN TRANS LIQ/ POLVO', NULL, NULL),
(13, 'PALAPRESS VARIO 1KG ROSA VETEADO POLVO', NULL, NULL),
(14, 'PALAPRESS VARIO 500ML LIQ', NULL, NULL),
(16, 'PALAPRESS VARIO LIQ/ POLVO', NULL, NULL),
(17, 'RAPID REPAIR LIQUIDO/ POLVO', NULL, NULL),
(18, 'TRIAD PROVIS. MARFIL MEDIO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE IF NOT EXISTS `tarifas` (
  `id_tarifa` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`),
  UNIQUE KEY `id_tarifa` (`id_tarifa`),
  UNIQUE KEY `concepto` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`id_tarifa`, `nombre`, `descripcion`) VALUES
(1, 'TARIFA 1', NULL),
(2, 'TARIFA 2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas_articulos`
--

CREATE TABLE IF NOT EXISTS `tarifas_articulos` (
  `tarifa` decimal(10,2) DEFAULT NULL,
  `tarifas_id_tarifa` int(4) unsigned NOT NULL,
  `articulos_id_articulo` int(4) unsigned NOT NULL,
  PRIMARY KEY (`articulos_id_articulo`,`tarifas_id_tarifa`),
  KEY `fk_tarifas_articulos_tarifas1` (`tarifas_id_tarifa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tarifas_articulos`
--

INSERT INTO `tarifas_articulos` (`tarifa`, `tarifas_id_tarifa`, `articulos_id_articulo`) VALUES
(13.00, 1, 1),
(4.00, 1, 2),
(4.00, 2, 2),
(8.00, 1, 3),
(8.00, 2, 3),
(20.00, 1, 4),
(35.00, 2, 4),
(10.00, 1, 5),
(15.00, 2, 5),
(17.00, 1, 6),
(17.00, 2, 6),
(18.00, 1, 7),
(25.00, 1, 8),
(50.00, 2, 8),
(330.00, 1, 9),
(400.00, 2, 9),
(4.00, 1, 10),
(4.00, 2, 10),
(8.00, 1, 11),
(8.00, 2, 11),
(15.00, 1, 12),
(15.00, 2, 12),
(300.00, 1, 13),
(340.00, 1, 14),
(90.00, 1, 15),
(100.00, 2, 15),
(110.00, 2, 16),
(90.00, 1, 17),
(90.00, 1, 18),
(110.00, 2, 18),
(20.00, 1, 19),
(30.00, 2, 20),
(50.00, 1, 21),
(60.00, 2, 21),
(100.00, 1, 22),
(120.00, 2, 22),
(130.00, 1, 23),
(150.00, 2, 23),
(85.00, 1, 24),
(100.00, 2, 24),
(90.00, 1, 25),
(50.00, 1, 26),
(65.00, 2, 26),
(12.00, 1, 27),
(18.00, 2, 27),
(60.00, 1, 28),
(120.00, 2, 28),
(96.00, 1, 29),
(130.00, 2, 29),
(140.00, 1, 30),
(160.00, 2, 30),
(160.00, 1, 31),
(180.00, 2, 31),
(180.00, 1, 32),
(210.00, 2, 32),
(80.00, 1, 33),
(110.00, 2, 33),
(30.00, 1, 34),
(30.00, 2, 34),
(60.00, 1, 35),
(70.00, 2, 35),
(30.00, 1, 36),
(30.00, 2, 36),
(10.00, 1, 37),
(10.00, 2, 37),
(25.00, 2, 38),
(22.00, 1, 39),
(35.00, 1, 40),
(35.00, 2, 40),
(110.00, 1, 41),
(110.00, 2, 41),
(22.00, 1, 42),
(25.00, 2, 42),
(90.00, 1, 43),
(110.00, 2, 43),
(35.00, 1, 44),
(45.00, 2, 44),
(40.00, 1, 45),
(50.00, 2, 45),
(50.00, 1, 46),
(60.00, 2, 46),
(62.00, 1, 47),
(72.00, 2, 47),
(80.00, 1, 48),
(90.00, 2, 48),
(88.00, 1, 49),
(98.00, 2, 49),
(90.00, 1, 50),
(100.00, 2, 50),
(90.00, 1, 51),
(110.00, 2, 51),
(35.00, 1, 52),
(45.00, 2, 52),
(40.00, 1, 53),
(50.00, 2, 53),
(50.00, 1, 54),
(60.00, 2, 54),
(62.00, 1, 55),
(72.00, 2, 55),
(80.00, 1, 56),
(90.00, 2, 56),
(88.00, 1, 57),
(98.00, 2, 57),
(90.00, 1, 58),
(100.00, 2, 58),
(29.00, 1, 59),
(29.00, 2, 59),
(49.00, 1, 60),
(49.00, 2, 60),
(25.00, 1, 61),
(25.00, 2, 61),
(125.00, 1, 62),
(125.00, 2, 62),
(8.00, 1, 63),
(8.00, 2, 63),
(8.00, 1, 64),
(8.00, 2, 64),
(20.00, 1, 65),
(25.00, 2, 65),
(60.00, 1, 66),
(395.00, 1, 67),
(600.00, 2, 67),
(360.00, 1, 68),
(390.00, 2, 68),
(35.00, 1, 69),
(40.00, 2, 69),
(20.00, 1, 70),
(30.00, 2, 70),
(10.00, 1, 71),
(10.00, 2, 71),
(180.00, 1, 72),
(240.00, 2, 72),
(30.00, 1, 73),
(30.00, 2, 73),
(14.00, 1, 74),
(14.00, 2, 74),
(5.00, 1, 75),
(8.00, 1, 76),
(8.00, 2, 76),
(4.00, 1, 77),
(4.00, 2, 77);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_incidencias`
--

CREATE TABLE IF NOT EXISTS `tipo_incidencias` (
  `id_incidencia` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_clinica` int(4) DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_usuarios_1` (`id_clinica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `password`, `id_clinica`) VALUES
('juanda', 'e9a6f9e26c8e0a3ee75b61fe36649e83b60755d6', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vclinicas`
--
CREATE TABLE IF NOT EXISTS `vclinicas` (
`id_clinica` int(4)
,`nombre` varchar(100)
,`razonsocial` varchar(100)
,`cif` varchar(10)
,`localidad` varchar(100)
,`provincia` varchar(50)
,`direccion` varchar(200)
,`cp` varchar(5)
,`numclinica` varchar(5)
,`id_tarifa` int(4) unsigned
,`nombretarifa` varchar(100)
,`descripcion` varchar(200)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vdoctores`
--
CREATE TABLE IF NOT EXISTS `vdoctores` (
`id_doctor` int(4)
,`nombre_doctor` varchar(100)
,`numcolegiado` varchar(50)
,`id_clinica` int(4)
,`nombre_clinica` varchar(100)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vclinicas`
--
DROP TABLE IF EXISTS `vclinicas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vclinicas` AS select `clinicas`.`id_clinica` AS `id_clinica`,`clinicas`.`nombre` AS `nombre`,`clinicas`.`razonsocial` AS `razonsocial`,`clinicas`.`cif` AS `cif`,`clinicas`.`localidad` AS `localidad`,`clinicas`.`provincia` AS `provincia`,`clinicas`.`direccion` AS `direccion`,`clinicas`.`cp` AS `cp`,`clinicas`.`numclinica` AS `numclinica`,`tarifas`.`id_tarifa` AS `id_tarifa`,`tarifas`.`nombre` AS `nombretarifa`,`tarifas`.`descripcion` AS `descripcion` from (`clinicas` join `tarifas`) where (`clinicas`.`id_tarifa` = `tarifas`.`id_tarifa`);

-- --------------------------------------------------------

--
-- Estructura para la vista `vdoctores`
--
DROP TABLE IF EXISTS `vdoctores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vdoctores` AS select `d`.`id_doctor` AS `id_doctor`,`d`.`nombre` AS `nombre_doctor`,`d`.`numcolegiado` AS `numcolegiado`,`c`.`id_clinica` AS `id_clinica`,`c`.`nombre` AS `nombre_clinica` from ((`doctores` `d` join `clinicas` `c`) join `clinica_doctor` `x`) where ((`d`.`id_doctor` = `x`.`id_doctor`) and (`c`.`id_clinica` = `x`.`id_clinica`));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos_materiales`
--
ALTER TABLE `articulos_materiales`
  ADD CONSTRAINT `fk_articulos_materiales_articulos1` FOREIGN KEY (`articulos_id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_articulos_materiales_materiales1` FOREIGN KEY (`materiales_id_material`) REFERENCES `materiales` (`id_material`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clinicas`
--
ALTER TABLE `clinicas`
  ADD CONSTRAINT `fk_clinicas_tarifas1` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifas` (`id_tarifa`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clinica_doctor`
--
ALTER TABLE `clinica_doctor`
  ADD CONSTRAINT `fk_clinica_doctor_1` FOREIGN KEY (`id_clinica`) REFERENCES `clinicas` (`id_clinica`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clinica_doctor_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarifas_articulos`
--
ALTER TABLE `tarifas_articulos`
  ADD CONSTRAINT `fk_tarifas_articulos_articulos1` FOREIGN KEY (`articulos_id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tarifas_articulos_tarifas1` FOREIGN KEY (`tarifas_id_tarifa`) REFERENCES `tarifas` (`id_tarifa`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_1` FOREIGN KEY (`id_clinica`) REFERENCES `clinicas` (`id_clinica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
