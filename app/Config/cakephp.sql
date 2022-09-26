-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2022 a las 13:58:12
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cakephp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_platillos`
--

CREATE TABLE `categoria_platillos` (
  `id` int(11) NOT NULL,
  `categoria` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_platillos`
--

INSERT INTO `categoria_platillos` (`id`, `categoria`) VALUES
(1, 'Pastas'),
(2, 'Sopas'),
(3, 'Postres'),
(4, 'Desayunos'),
(5, 'Hamburguesas'),
(6, 'Almuerzos'),
(7, 'niños');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocineros`
--

CREATE TABLE `cocineros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cocineros`
--

INSERT INTO `cocineros` (`id`, `nombre`, `apellido`, `created`, `modified`) VALUES
(1, 'Pedro', 'Sanchez', '2022-09-19 19:28:23', '2022-09-19 20:11:11'),
(2, 'Maria', 'Perez', '2022-09-19 19:46:57', '2022-09-19 20:05:22'),
(4, 'Ciara', 'Vondrak', '2022-09-21 02:24:20', '2022-09-21 02:24:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocineros_platillos`
--

CREATE TABLE `cocineros_platillos` (
  `id` int(11) NOT NULL,
  `cocinero_id` int(11) NOT NULL,
  `platillo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cocineros_platillos`
--

INSERT INTO `cocineros_platillos` (`id`, `cocinero_id`, `platillo_id`) VALUES
(5, 2, 4),
(8, 2, 10),
(9, 2, 11),
(10, 1, 12),
(11, 1, 13),
(12, 2, 14),
(13, 1, 15),
(14, 2, 15),
(15, 1, 16),
(16, 1, 17),
(17, 2, 17),
(18, 2, 18),
(19, 4, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `puestos` varchar(20) NOT NULL,
  `posicion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `mesero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `codigo`, `puestos`, `posicion`, `created`, `modified`, `mesero_id`) VALUES
(1, '001', '14', 'Lado superior derecho', '2022-09-14 16:12:37', NULL, 3),
(2, '002', '3', 'Lado superior derecho', '2022-09-14 16:12:37', NULL, 3),
(3, '003', '16', 'Mesa central', '2022-09-14 16:16:15', NULL, 6),
(4, '004', '2', 'Lado inferior izquierdo', '2022-09-14 16:16:15', NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meseros`
--

CREATE TABLE `meseros` (
  `id` int(11) NOT NULL,
  `dni` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `meseros`
--

INSERT INTO `meseros` (`id`, `dni`, `nombre`, `apellido`, `telefono`, `created`, `modified`) VALUES
(3, 132423, 'Christian', 'Ramirez', '9349834', '2022-09-14 19:24:13', '2022-09-14 19:24:13'),
(6, 123, 'Samantha', 'Robles', '1234', '2022-09-14 21:06:22', '2022-09-14 21:06:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordens`
--

CREATE TABLE `ordens` (
  `id` int(11) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `mesa_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordens`
--

INSERT INTO `ordens` (`id`, `total`, `cliente`, `dni`, `mesa_id`, `created`, `modified`) VALUES
(1, '50.00', 'Frank Ramirez', '123', 1, '2022-09-26 02:04:27', '2022-09-26 02:04:27'),
(2, '124.00', 'Christian Vondrak', '27769583', 1, '2022-09-26 02:07:54', '2022-09-26 02:07:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_items`
--

CREATE TABLE `orden_items` (
  `id` int(11) NOT NULL,
  `platillo_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(6,2) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_items`
--

INSERT INTO `orden_items` (`id`, `platillo_id`, `orden_id`, `cantidad`, `subtotal`, `created`, `modified`) VALUES
(1, 4, 1, 1, '10.00', '2022-09-26 02:04:27', '2022-09-26 02:04:27'),
(2, 11, 1, 2, '8.00', '2022-09-26 02:04:27', '2022-09-26 02:04:27'),
(3, 15, 1, 4, '32.00', '2022-09-26 02:04:27', '2022-09-26 02:04:27'),
(4, 18, 2, 9, '54.00', '2022-09-26 02:07:54', '2022-09-26 02:07:54'),
(5, 19, 2, 2, '10.00', '2022-09-26 02:07:54', '2022-09-26 02:07:54'),
(6, 17, 2, 6, '60.00', '2022-09-26 02:07:54', '2022-09-26 02:07:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `platillo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(6,1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillos`
--

CREATE TABLE `platillos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  `foto` varchar(255) NOT NULL,
  `foto_dir` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `categoria_platillo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `platillos`
--

INSERT INTO `platillos` (`id`, `nombre`, `descripcion`, `precio`, `foto`, `foto_dir`, `created`, `modified`, `categoria_platillo_id`) VALUES
(4, 'Pasticho', 'Pasticho riquisimo', 10, 'pasticho.jpg', '4', '2022-09-20 01:35:45', '2022-09-20 01:35:45', 1),
(10, 'Sopa de pollo', 'Caldo de pollo saludable', 3, 'sopadepollo.jpg', '10', '2022-09-20 22:20:22', '2022-09-20 22:20:22', 1),
(11, 'Torta 3 leches', 'Torta 3 leches desc', 4, 'torta.jpg', '11', '2022-09-21 02:11:38', '2022-09-21 02:11:38', 3),
(12, 'Empanadas', 'Empanadas de sabores variados', 1, 'empanada.jpg', '12', '2022-09-21 02:12:24', '2022-09-21 02:12:24', 4),
(13, 'Camarones al ajillo', 'Camarones al ajillo desc', 8, 'camarones.jpg', '13', '2022-09-21 02:14:17', '2022-09-21 02:14:17', 6),
(14, 'Carne con papas fritas', 'Carne con papas fritas desc', 9, 'carne.jpg', '14', '2022-09-21 02:14:45', '2022-09-21 02:14:45', 6),
(15, 'Hamburguesa de carne', 'Hamburguesa de carne desc', 8, 'comida-rapida-casera.jpg', '15', '2022-09-21 02:15:26', '2022-09-21 02:15:26', 5),
(16, 'Tacos mexicanos', '3 unidades Tacos mexicanos desc', 5, 'tacos.jpg', '16', '2022-09-21 02:16:43', '2022-09-21 02:16:43', 6),
(17, 'Hamburguesa de pollo crispy', 'Hamburguesa de pollo crispy desc', 10, 'hamburguesapollo.jpg', '17', '2022-09-21 02:18:56', '2022-09-21 02:18:56', 5),
(18, 'Tenders con papas fritas', 'Tenders de pollo con papas fritas', 6, 'tenders.jpg', '18', '2022-09-21 02:22:05', '2022-09-21 02:22:05', 7),
(19, 'Macarrones con queso', 'Macarrones con queso desc', 5, 'macarrones.jpg', '19', '2022-09-21 02:24:48', '2022-09-21 02:24:48', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_platillos`
--
ALTER TABLE `categoria_platillos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cocineros_platillos`
--
ALTER TABLE `cocineros_platillos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `meseros`
--
ALTER TABLE `meseros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordens`
--
ALTER TABLE `ordens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden_items`
--
ALTER TABLE `orden_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_platillos`
--
ALTER TABLE `categoria_platillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cocineros_platillos`
--
ALTER TABLE `cocineros_platillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `meseros`
--
ALTER TABLE `meseros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ordens`
--
ALTER TABLE `ordens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden_items`
--
ALTER TABLE `orden_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
