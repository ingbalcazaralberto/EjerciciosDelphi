-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2022 a las 02:13:36
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos_cliente`
--

CREATE TABLE `activos_cliente` (
  `id_activo_cliente` int(11) NOT NULL,
  `valor_activos` double DEFAULT NULL,
  `valor_pasivos` double DEFAULT NULL,
  `valor_patrimonio` double DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activos_cliente`
--

INSERT INTO `activos_cliente` (`id_activo_cliente`, `valor_activos`, `valor_pasivos`, `valor_patrimonio`, `id_cliente`) VALUES
(1, 3, 5, 6, 3),
(5, 3, 5, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipo_identificacion`
--

CREATE TABLE `cat_tipo_identificacion` (
  `id_tipo_identificacion` int(11) NOT NULL,
  `codigo_identificacion` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion_identificacion` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitud_identificacion` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_tipo_identificacion`
--

INSERT INTO `cat_tipo_identificacion` (`id_tipo_identificacion`, `codigo_identificacion`, `descripcion_identificacion`, `longitud_identificacion`) VALUES
(1, 'CC', 'CEDULA', '10'),
(2, 'EA', 'PERMISO ESPECIAL', '10');
(3, 'TI', 'TARJETA IDENTIDAD', '10');
(4, 'RC', 'REGISTRO CIVIL', '10');
(5, 'CE', 'CEDULA EXTANJERIA', '10');
(6, 'PE', 'PERMISO ESPECIAL', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `codigo_cliente` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_cliente` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_representante` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_principal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_secundario` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persona_contacto` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `numero_identificacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOT NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `codigo_cliente`, `nombre_cliente`, `nombre_representante`, `telefono_principal`, `telefono_secundario`, `email`, `persona_contacto`, `id_tipo_identificacion`, `numero_identificacion`) VALUES
(3, 'xyy', 'ffffdfdfd', 'Prueba', '34|', '33', 'este ems', 'sdas', 1, '111'),
(5, 'aaa', 'gfdgfdgfdg', '9999', '666', '7888', 'ffff', 'gggg', 1, '455'),
(8, '5555', NULL, NULL, NULL, NULL, NULL, NULL, 1, '66666666'),
(9, '123456', NULL, NULL, NULL, NULL, NULL, NULL, 2, '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos_cliente`
--
ALTER TABLE `activos_cliente`
  ADD PRIMARY KEY (`id_activo_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `cat_tipo_identificacion`
--
ALTER TABLE `cat_tipo_identificacion`
  ADD PRIMARY KEY (`id_tipo_identificacion`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_tipo_identificacion` (`id_tipo_identificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos_cliente`
--
ALTER TABLE `activos_cliente`
  MODIFY `id_activo_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cat_tipo_identificacion`
--
ALTER TABLE `cat_tipo_identificacion`
  MODIFY `id_tipo_identificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos_cliente`
--
ALTER TABLE `activos_cliente`
  ADD CONSTRAINT `activos_cli_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `cat_tipo_identificacion` (`id_tipo_identificacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
