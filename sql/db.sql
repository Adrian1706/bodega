-- Active: 1687990957195@@127.0.0.1@3306@db_prueba_backend_sql
CREATE DATABASE db_prueba_backend_sql;

USE db_prueba_backend_sql;

CREATE TABLE `bodegas` (
  `id` bigint UNSIGNED,
  `nombre` varchar(255),
  `id_responsable` bigint UNSIGNED,
  `estado` tinyint,
  `created_by` bigint UNSIGNED,
  `update_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `historiales`
--

CREATE TABLE `historiales` (
  `id` bigint UNSIGNED,
  `cantidad` int,
  `id_bodega_origen` bigint UNSIGNED,
  `id_bodega_destino` bigint UNSIGNED,
  `id_inventario` bigint UNSIGNED,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `update_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventarios`
--

CREATE TABLE `inventarios` (
  `id` bigint UNSIGNED,
  `id_bodega` bigint UNSIGNED,
  `id_producto` bigint UNSIGNED,
  `cantidad` int,
  `created_by` bigint UNSIGNED,
  `update_by` bigint UNSIGNED,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED,
  `nombre` varchar(255),
  `descripcion` varchar(255),
  `estado` tinyint,
  `created_by` bigint UNSIGNED,
  `update_by` bigint UNSIGNED,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED,
  `nombre` varchar(255),
  `email` varchar(255),
  `email_verified_at` timestamp,
  `estado` tinyint,
  `created_by` bigint UNSIGNED,
  `update_by` bigint UNSIGNED,
  `foto` varchar(255),
  `password` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_responsable` (`id_responsable`),
  ADD KEY `created_by3` (`created_by`),
  ADD KEY `update_by3` (`update_by`);

--
-- Indexes for table `historiales`
--
ALTER TABLE `historiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bodega_origen` (`id_bodega_origen`),
  ADD KEY `id_bodega_destino` (`id_bodega_destino`),
  ADD KEY `created_by4` (`created_by`),
  ADD KEY `update_by4` (`update_by`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Indexes for table `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by2` (`created_by`),
  ADD KEY `update_by2` (`update_by`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_bodega` (`id_bodega`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bodegas`
--
ALTER TABLE `bodegas` 
  ADD CONSTRAINT `created_by3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `id_responsable` FOREIGN KEY (`id_responsable`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `update_by3` FOREIGN KEY (`update_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `historiales`
--
ALTER TABLE `historiales`
  ADD CONSTRAINT `created_by4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `id_bodega_destino` FOREIGN KEY (`id_bodega_destino`) REFERENCES `bodegas` (`id`),
  ADD CONSTRAINT `id_bodega_origen` FOREIGN KEY (`id_bodega_origen`) REFERENCES `bodegas` (`id`),
  ADD CONSTRAINT `id_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios` (`id`),
  ADD CONSTRAINT `update_by4` FOREIGN KEY (`update_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `created_by5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `id_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `bodegas` (`id`),
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `update_by5` FOREIGN KEY (`update_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `created_by1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `update_by1` FOREIGN KEY (`update_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;