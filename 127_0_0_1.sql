-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 26-11-2021 a las 02:15:35
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practica`
--

DROP TABLE IF EXISTS `practica`;
CREATE TABLE IF NOT EXISTS `practica` (
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `practica`
--

INSERT INTO `practica` (`usuario`, `password`) VALUES
('karen', '123');
--
-- Base de datos: `tienda_reginarem`
--
CREATE DATABASE IF NOT EXISTS `tienda_reginarem` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `tienda_reginarem`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_prod` varchar(5) COLLATE latin1_spanish_ci NOT NULL,
  `cat_prod` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nom_prod` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `desc_prod` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `prec_prod` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_prod`, `cat_prod`, `nom_prod`, `desc_prod`, `prec_prod`) VALUES
('a01', 'Accesorios', 'Pin de minerales', 'Pins metalicos de minerales\r\nModelo: Minerales\r\nMaterial: Aleación de zinc\r\nDiámetro: 2 cm\r\nLargo: 2 cm', 20.25),
('a02', 'Accesorios', 'Bolsa de mandado', 'Bolsa de para el mandado.\r\nAyuda al planeta dejando de usar bolsas de plastico con nuestra bolsa para el mandado.\r\nMedidas.\r\nAltura: 35 cm\r\nAncho: 20 cm\r\nMaterial: Manta ', 65.15),
('a03', 'Accesorios', 'Pin metalico', 'Pin metalico de zorrito.\r\n- Tamaño: 0.9 * 1.2 Pulgadas\r\n- Peso: 5 g\r\n- Color: como en la imagen\r\n- Material: Metal ', 120.1),
('a04', 'Accesorios', 'Llavero destapador', 'Llavero destapador con estampado \"Borracha pero buena muchacha\".\r\nLlavero portátil ideal para llevarlo a todos lados, ya que gracias a su argolla podrás colocarlo fácilmente en tus llaves.\r\nTendrás siempre a la mano un destapador para abrir tus botellas siempre que lo necesites, además de estar creado con un diseño ergonómico y ser muy facil de usar.\r\n- Largo x Ancho: 6.5 cm x 1.5 cm\r\n- Es colgable: Sí\r\n- Con imán: No\r\n- Con llavero: Sí\r\n- Material: Aluminio\r\n- Unidades por envase: 1', 35),
('r05', 'Ropa', 'Playera Ouija', 'PLAYERA DAMA MANGA CORTA. \r\nPregunta por el color de tu agrado. \r\nMEDIDAS (Centímetros)\r\nTalla Ancho Largo\r\nECH.- 38.7 x 57.2\r\nCH.- 41.3 x 59.7\r\nM.- 43.8 x 62.2\r\nG.- 48.9 x 64.8\r\nEG.- 54.0 x 67.3\r\nMaterial: poliester. ', 100.1),
('tb06', 'TazaBotella', 'Taza Vikinga', 'Taza de ceramica- Estampado Vikinga\r\nMaterial: Cerámica\r\nTipo de taza: Taza de café con capacidad útil: 11 oz = 325 ml. Capacidad total: 360 ml\r\nDimensiones de la taza: Diámetro exterior: 81mm. Diámetro interior: 74 mm. Altura: 96 mm. \r\nPeso de la taza: 340 gr.\r\nCalidad premium, con un lacado especial para personalización e impresión. Las tazas son de cerámica, y tendrán un acabado brillante y resistente. Se presentan dentro de una caja de cartón.', 50.25),
('tb06', 'TazaBotella', 'Taza Vikinga', 'Taza de ceramica- Estampado Vikinga\r\nMaterial: Cerámica\r\nTipo de taza: Taza de café con capacidad útil: 11 oz = 325 ml. Capacidad total: 360 ml\r\nDimensiones de la taza: Diámetro exterior: 81mm. Diámetro interior: 74 mm. Altura: 96 mm. \r\nPeso de la taza: 340 gr.\r\nCalidad premium, con un lacado especial para personalización e impresión. Las tazas son de cerámica, y tendrán un acabado brillante y resistente. Se presentan dentro de una caja de cartón.', 50.25),
('tb07', 'TazaBotella', 'Taza Magica', 'Taza de ceramica magica - Estampado ojo\r\nMaterial: Cerámica\r\nTipo de taza: Taza de café con capacidad útil: 11 oz = 325 ml. Capacidad total: 360 ml\r\nDimensiones de la taza: Diámetro exterior: 81mm. Diámetro interior: 74 mm. Altura: 96 mm. \r\nPeso de la taza: 340 gr.\r\nNuestras tazas magicas revelan su estampado al vertirle liquido caliente. \r\nNuestras tazas de Cerámica se pueden usar tanto en el microondas, como en el lavavajillas, y no pierden su brillo, siempre que se laven adecuadamente.', 60.25),
('tb08', 'TazaBotella', 'Taza Escobas', 'Taza de ceramica- Estampado escobas de bruja.\r\nMaterial: Cerámica\r\nTipo de taza: Taza de café con capacidad útil: 11 oz = 325 ml. Capacidad total: 360 ml\r\nDimensiones de la taza: Diámetro exterior: 81mm. Diámetro interior: 74 mm. Altura: 96 mm. \r\nPeso de la taza: 340 gr.\r\nNuestras tazas de Cerámica se pueden usar tanto en el microondas, como en el lavavajillas, y no pierden su brillo, siempre que se laven adecuadamente.', 45.25),
('tb09', 'TazaBotella', 'Pocillo mágico de peltre', 'Pocillo magico de peltre con estampado de zorritos.\r\n-Medidas: 8cm de diámetro x 7.5cm de alto\r\nCapacidad : 320 ml\r\nModelo: zorritos\r\nDebido al esmaltado artesanal y forma de producción, el acero esmaltado puede tener pequeñas imperfecciones. Dando al producto un toque más rústico.', 65.2),
('tb10', 'TazaBotella', 'Pocillo de peltre', 'Pocillo de peltre sencillo con estampado de zorritos.\r\n-Medidas: 8cm de diámetro x 7.5cm de alto\r\nCapacidad : 320 ml\r\nModelo: zorritos\r\nDebido al esmaltado artesanal y forma de producción, el acero esmaltado puede tener pequeñas imperfecciones. Dando al producto un toque más rústico.', 45.5),
('tb11', 'TazaBotella', 'Botella de zorritos', 'Botella para agua - Cilindro metalico edicion Zorritos\r\nMedidas:\r\nAltura: 20 cm\r\nDiámetro: 7 cm\r\nCapacidad: 500 ml\r\nTapa: De rosca con gancho para mayor practicidad.\r\nLleva tu bebida favorita a todos lados con esta botella personalizada con cualquier diseño.', 65.25),
('tb12', 'TazaBotella', 'Taza de zorritos', 'Taza de ceramica- Edicion Zorritos\r\nMaterial: Cerámica\r\nTipo de taza: Taza de café con capacidad útil: 11 oz = 325 ml. Capacidad total: 360 ml\r\nDimensiones de la taza: Diámetro exterior: 81mm. Diámetro interior: 74 mm. Altura: 96 mm. \r\nPeso de la taza: 340 gr.\r\nCalidad premium, con un lacado especial para personalización e impresión. Las tazas son de cerámica, y tendrán un acabado brillante y resistente. Se presentan dentro de una caja de cartón.', 50.25);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
