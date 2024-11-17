-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tpfededbt
CREATE DATABASE IF NOT EXISTS `tpfededbt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tpfededbt`;

-- Volcando estructura para tabla tpfededbt.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genero` (`genero`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla tpfededbt.generos: ~20 rows (aproximadamente)
INSERT INTO `generos` (`id`, `genero`) VALUES
	(8, 'Autoayuda'),
	(14, 'Biografía'),
	(3, 'Ciencia'),
	(11, 'Cuento'),
	(13, 'Drama'),
	(18, 'Fantasía'),
	(1, 'Ficción'),
	(5, 'Filosofía'),
	(4, 'Historia'),
	(10, 'Infantil'),
	(6, 'Matemáticas'),
	(17, 'Misterio'),
	(2, 'No Ficción'),
	(9, 'Novela'),
	(12, 'Poesía'),
	(15, 'Política'),
	(7, 'Psicología'),
	(20, 'Religión'),
	(16, 'Tecnología'),
	(19, 'Terror');

-- Volcando estructura para tabla tpfededbt.libros
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_libro` varchar(100) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `id_genero` int DEFAULT NULL,
  `creado_el` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_el` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_libros_genero` (`id_genero`),
  CONSTRAINT `fk_libros_genero` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla tpfededbt.libros: ~20 rows (aproximadamente)
INSERT INTO `libros` (`id`, `nombre_libro`, `autor`, `fecha_lanzamiento`, `id_genero`, `creado_el`, `actualizado_el`, `estado`) VALUES
	(1, 'El Principito', 'Antoine de Saint-Exupéry', '1943-04-06', 1, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(2, '1984', 'George Orwell', '1949-06-08', 17, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(3, 'Cien años de soledad', 'Gabriel García Márquez', '1967-05-30', 1, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(4, 'Sapiens', 'Yuval Noah Harari', '2011-09-04', 3, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(5, 'El arte de la guerra', 'Sun Tzu', '1772-01-01', 5, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(6, 'El código Da Vinci', 'Dan Brown', '2003-03-18', 18, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(7, 'El hombre en busca de sentido', 'Viktor Frankl', '1946-01-01', 7, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(8, 'La Divina Comedia', 'Dante Alighieri', '1320-01-01', 12, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(9, 'El Alquimista', 'Paulo Coelho', '1988-05-01', 8, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(10, 'La Biblia', 'Varios', '0001-01-01', 20, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(11, 'Hamlet', 'William Shakespeare', '1603-01-01', 13, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(12, 'Orgullo y prejuicio', 'Jane Austen', '1813-01-28', 9, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(13, 'Los miserables', 'Victor Hugo', '1862-01-01', 4, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(14, 'Don Quijote', 'Miguel de Cervantes', '1605-01-16', 1, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(15, 'La Odisea', 'Homero', '0800-01-01', 12, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(16, 'Psicología de masas', 'Sigmund Freud', '1921-01-01', 7, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(17, 'Alicia en el país de las maravillas', 'Lewis Carroll', '1865-07-04', 10, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(18, 'Fundación', 'Isaac Asimov', '1951-06-01', 16, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(19, 'El Hobbit', 'J.R.R. Tolkien', '1937-09-21', 18, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(20, 'El miedo a la libertad', 'Erich Fromm', '1941-01-01', 7, '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1);

-- Volcando estructura para tabla tpfededbt.prestamos
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `libro_id` int DEFAULT NULL,
  `fecha_prestamo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_devolucion_estimada` timestamp NULL DEFAULT NULL,
  `fecha_devolucion_real` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prestamos_usuario` (`usuario_id`),
  KEY `fk_prestamos_libro` (`libro_id`),
  CONSTRAINT `fk_prestamos_libro` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`),
  CONSTRAINT `fk_prestamos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla tpfededbt.prestamos: ~20 rows (aproximadamente)
INSERT INTO `prestamos` (`id`, `usuario_id`, `libro_id`, `fecha_prestamo`, `fecha_devolucion_estimada`, `fecha_devolucion_real`) VALUES
	(1, 1, 1, '2024-11-05 02:42:27', '2023-11-10 03:00:00', NULL),
	(2, 2, 2, '2024-11-05 02:42:27', '2023-11-15 03:00:00', NULL),
	(3, 3, 3, '2024-11-05 02:42:27', '2023-11-20 03:00:00', NULL),
	(4, 4, 4, '2024-11-05 02:42:27', '2023-11-25 03:00:00', NULL),
	(5, 5, 5, '2024-11-05 02:42:27', '2023-11-30 03:00:00', NULL),
	(6, 6, 6, '2024-11-05 02:42:27', '2023-12-05 03:00:00', NULL),
	(7, 7, 7, '2024-11-05 02:42:27', '2023-12-10 03:00:00', NULL),
	(8, 8, 8, '2024-11-05 02:42:27', '2023-12-15 03:00:00', NULL),
	(9, 9, 9, '2024-11-05 02:42:27', '2023-12-20 03:00:00', NULL),
	(10, 10, 10, '2024-11-05 02:42:27', '2023-12-25 03:00:00', NULL),
	(11, 11, 11, '2024-11-05 02:42:27', '2023-12-30 03:00:00', NULL),
	(12, 12, 12, '2024-11-05 02:42:27', '2024-01-04 03:00:00', NULL),
	(13, 13, 13, '2024-11-05 02:42:27', '2024-01-09 03:00:00', NULL),
	(14, 14, 14, '2024-11-05 02:42:27', '2024-01-14 03:00:00', NULL),
	(15, 15, 15, '2024-11-05 02:42:27', '2024-01-19 03:00:00', NULL),
	(16, 16, 16, '2024-11-05 02:42:27', '2024-01-24 03:00:00', NULL),
	(17, 17, 17, '2024-11-05 02:42:27', '2024-01-29 03:00:00', NULL),
	(18, 18, 18, '2024-11-05 02:42:27', '2024-02-03 03:00:00', NULL),
	(19, 19, 19, '2024-11-05 02:42:27', '2024-02-08 03:00:00', NULL),
	(20, 20, 20, '2024-11-05 02:42:27', '2024-02-13 03:00:00', NULL);

-- Volcando estructura para tabla tpfededbt.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creado_el` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_el` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla tpfededbt.usuarios: ~20 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `dni`, `telefono`, `email`, `creado_el`, `actualizado_el`, `estado`) VALUES
	(1, 'Juan', 'Pérez', '12345678', '123-456-7890', 'juan.perez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(2, 'María', 'García', '23456789', '098-765-4321', 'maria.garcia1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(3, 'Carlos', 'López', '34567890', '321-654-9870', 'carlos.lopez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(4, 'Ana', 'Martínez', '45678901', '111-222-3333', 'ana.martinez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(5, 'Luis', 'Rodríguez', '56789012', '444-555-6666', 'luis.rodriguez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(6, 'Sofía', 'González', '67890123', '777-888-9999', 'sofia.gonzalez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(7, 'Miguel', 'Hernández', '78901234', '234-567-8901', 'miguel.hernandez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(8, 'Lucía', 'Jiménez', '89012345', '345-678-9012', 'lucia.jimenez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(9, 'Pablo', 'Ruiz', '90123456', '456-789-0123', 'pablo.ruiz1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(10, 'Elena', 'Torres', '01234567', '567-890-1234', 'elena.torres1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(11, 'Marcos', 'Vargas', '11234567', '678-901-2345', 'marcos.vargas1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(12, 'Carmen', 'Castillo', '22345678', '789-012-3456', 'carmen.castillo1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(13, 'David', 'Ortega', '33456789', '890-123-4567', 'david.ortega1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(14, 'Laura', 'Serrano', '44567890', '901-234-5678', 'laura.serrano1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(15, 'Jorge', 'Molina', '55678901', '012-345-6789', 'jorge.molina1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(16, 'Paula', 'Santos', '66789012', '123-456-7890', 'paula.santos1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(17, 'Andrés', 'Medina', '77890123', '234-567-8901', 'andres.medina1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(18, 'Isabel', 'Romero', '88901234', '345-678-9012', 'isabel.romero1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(19, 'Mario', 'Suárez', '99012345', '456-789-0123', 'mario.suarez1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1),
	(20, 'Teresa', 'Ramos', '10123456', '567-890-1234', 'teresa.ramos1@example.com', '2024-11-05 02:42:24', '2024-11-05 02:42:24', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
