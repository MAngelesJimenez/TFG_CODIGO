-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para tfg
DROP DATABASE IF EXISTS `tfg`;
CREATE DATABASE IF NOT EXISTS `tfg` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tfg`;

-- Volcando estructura para tabla tfg.dm_articulo
DROP TABLE IF EXISTS `dm_articulo`;
CREATE TABLE IF NOT EXISTS `dm_articulo` (
  `ID_ARTICULO` int(10) unsigned NOT NULL,
  `DESC_ARTICULO` varchar(50) NOT NULL,
  `ID_SUBFAMILIA` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ID_ARTICULO`),
  KEY `ID_SUBFAMILIA` (`ID_SUBFAMILIA`),
  CONSTRAINT `FK_dm_articulo_dm_subfamilia` FOREIGN KEY (`ID_SUBFAMILIA`) REFERENCES `dm_subfamilia` (`ID_SUBFAMILIA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de los artículos que estén o hayan estado disponibles para su venta';

-- Volcando datos para la tabla tfg.dm_articulo: ~20 rows (aproximadamente)
DELETE FROM `dm_articulo`;
/*!40000 ALTER TABLE `dm_articulo` DISABLE KEYS */;
INSERT INTO `dm_articulo` (`ID_ARTICULO`, `DESC_ARTICULO`, `ID_SUBFAMILIA`) VALUES
	(1, 'Artículo 1', 1),
	(2, 'Artículo 2', 1),
	(3, 'Artículo 3', 2),
	(4, 'Artículo 4', 2),
	(5, 'Artículo 5', 3),
	(6, 'Artículo 6', 3),
	(7, 'Artículo 7', 3),
	(8, 'Artículo 8', 4),
	(9, 'Artículo 9', 5),
	(10, 'Artículo 10', 5),
	(11, 'Artículo 11', 5),
	(12, 'Artículo 12', 5),
	(13, 'Artículo 13', 6),
	(14, 'Artículo 14', 6),
	(15, 'Artículo 15', 2),
	(16, 'Artículo 16', 3),
	(17, 'Artículo 17', 1),
	(18, 'Artículo 18', 1),
	(19, 'Artículo 19', 7),
	(20, 'Artículo 20', 8);
/*!40000 ALTER TABLE `dm_articulo` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_ccaa
DROP TABLE IF EXISTS `dm_ccaa`;
CREATE TABLE IF NOT EXISTS `dm_ccaa` (
  `ID_CCAA` smallint(5) unsigned NOT NULL DEFAULT 0,
  `DESC_CCAA` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CCAA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla maestra de comunidades autónomas';

-- Volcando datos para la tabla tfg.dm_ccaa: ~22 rows (aproximadamente)
DELETE FROM `dm_ccaa`;
/*!40000 ALTER TABLE `dm_ccaa` DISABLE KEYS */;
INSERT INTO `dm_ccaa` (`ID_CCAA`, `DESC_CCAA`) VALUES
	(0, 'Sin especificar'),
	(1, 'Andalucía'),
	(2, 'Aragón'),
	(3, 'Asturias, Principado de'),
	(4, 'Balears, Illes'),
	(5, 'Canarias'),
	(6, 'Cantabria'),
	(7, 'Castilla y León'),
	(8, 'Castilla - La Mancha'),
	(9, 'Cataluña'),
	(10, 'Comunitat Valenciana'),
	(11, 'Extremadura'),
	(12, 'Galicia'),
	(13, 'Madrid, Comunidad de'),
	(14, 'Murcia, Región de'),
	(15, 'Navarra, Comunidad Foral '),
	(16, 'País Vasco'),
	(17, 'Rioja, La'),
	(18, 'Ceuta'),
	(19, 'Melilla'),
	(98, 'Servicios Centrales'),
	(99, 'Extranjero');
/*!40000 ALTER TABLE `dm_ccaa` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_centro
DROP TABLE IF EXISTS `dm_centro`;
CREATE TABLE IF NOT EXISTS `dm_centro` (
  `ID_CENTRO` smallint(6) unsigned NOT NULL,
  `DESC_CENTRO` varchar(100) NOT NULL,
  `ID_PROVINCIA` smallint(6) unsigned NOT NULL,
  `DIRECCION_CENTRO` varchar(100) NOT NULL,
  `TLF_CENTRO` int(11) unsigned NOT NULL,
  `M2_CENTRO` smallint(6) unsigned DEFAULT NULL,
  `FEC_APERTURA_CENTRO` date NOT NULL,
  `FEC_CIERRE_CENTRO` date DEFAULT NULL,
  PRIMARY KEY (`ID_CENTRO`),
  KEY `ID_PROVINCIA` (`ID_PROVINCIA`),
  CONSTRAINT `FK_dm_centro_dm_provincia` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `dm_provincia` (`ID_PROVINCIA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de los distintos puntos de venta';

-- Volcando datos para la tabla tfg.dm_centro: ~5 rows (aproximadamente)
DELETE FROM `dm_centro`;
/*!40000 ALTER TABLE `dm_centro` DISABLE KEYS */;
INSERT INTO `dm_centro` (`ID_CENTRO`, `DESC_CENTRO`, `ID_PROVINCIA`, `DIRECCION_CENTRO`, `TLF_CENTRO`, `M2_CENTRO`, `FEC_APERTURA_CENTRO`, `FEC_CIERRE_CENTRO`) VALUES
	(1, 'Centro 1', 1, 'Direccion Centro 1', 111111111, 250, '2016-06-23', NULL),
	(2, 'Centro 2', 2, 'Direccion Centro 2', 222222222, 123, '2017-05-21', NULL),
	(3, 'Centro 3', 3, 'Direccion Centro 3', 333333333, 456, '2018-01-23', NULL),
	(4, 'Centro 4', 2, 'Direcci?n Centro 4', 444444444, 124, '2019-12-01', NULL),
	(5, 'Centro 5', 2, 'Direcci?n Centro 5', 555555555, 567, '2020-02-07', NULL);
/*!40000 ALTER TABLE `dm_centro` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_cliente
DROP TABLE IF EXISTS `dm_cliente`;
CREATE TABLE IF NOT EXISTS `dm_cliente` (
  `ID_CLIENTE` int(10) unsigned NOT NULL,
  `NOMBRE_CLIENTE` varchar(50) NOT NULL,
  `APELLIDO1_CLIENTE` varchar(50) NOT NULL,
  `APELLIDO2_CLIENTE` varchar(50) DEFAULT NULL,
  `FEC_NACIMIENTO_CLIENTE` date DEFAULT NULL,
  `FEC_ALTA_CLIENTE` date NOT NULL,
  `DOMICILIO_CLIENTE` varchar(100) DEFAULT NULL,
  `ID_PROVINCIA_CLIENTE` smallint(5) unsigned NOT NULL DEFAULT 0,
  `ID_SEXO_CLIENTE` enum('HOMBRE','MUJER') DEFAULT NULL,
  `TLF_CLIENTE` int(11) NOT NULL,
  `EMAIL_CLIENTE` varchar(50) NOT NULL,
  `FEC_BAJA_CLIENTE` date DEFAULT NULL,
  `CATALOGO` enum('SI','NO') NOT NULL DEFAULT 'NO',
  `CATEGORIA` enum('BAJO CONSUMO','ALTO POTENCIAL','FIDELIZADOS') NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  KEY `ID_PROVINCIA_CLIENTE` (`ID_PROVINCIA_CLIENTE`),
  CONSTRAINT `FK_dm_cliente_dm_provincia` FOREIGN KEY (`ID_PROVINCIA_CLIENTE`) REFERENCES `dm_provincia` (`ID_PROVINCIA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de los clientes registrados en la base de datos. Cliente genérico para los que realizan compras y no están registrados.';

-- Volcando datos para la tabla tfg.dm_cliente: ~11 rows (aproximadamente)
DELETE FROM `dm_cliente`;
/*!40000 ALTER TABLE `dm_cliente` DISABLE KEYS */;
INSERT INTO `dm_cliente` (`ID_CLIENTE`, `NOMBRE_CLIENTE`, `APELLIDO1_CLIENTE`, `APELLIDO2_CLIENTE`, `FEC_NACIMIENTO_CLIENTE`, `FEC_ALTA_CLIENTE`, `DOMICILIO_CLIENTE`, `ID_PROVINCIA_CLIENTE`, `ID_SEXO_CLIENTE`, `TLF_CLIENTE`, `EMAIL_CLIENTE`, `FEC_BAJA_CLIENTE`, `CATALOGO`, `CATEGORIA`) VALUES
	(0, 'Desconocido', 'Desconocido', NULL, NULL, '1900-01-01', NULL, 0, NULL, 999999999, 'desconocido@na.es', NULL, 'NO', 'BAJO CONSUMO'),
	(1, 'Juan', 'López', 'Garrido', '1988-06-18', '2019-01-01', 'C/ Raya 1ºC', 28, 'HOMBRE', 666666666, 'cliente1@gmail.com', NULL, 'SI', 'BAJO CONSUMO'),
	(2, 'Pedro', 'García', 'Sánchez', '1965-06-02', '2020-12-09', 'Domicilio cliente 2', 50, 'HOMBRE', 666666666, 'cliente2@gmail.com', NULL, 'SI', 'ALTO POTENCIAL'),
	(3, 'Luisa', 'Pérez', 'Gómez', '1975-12-28', '2020-08-09', 'Domicilio cliente 3', 41, 'MUJER', 666666666, 'cliente3@gmail.com', NULL, 'SI', 'FIDELIZADOS'),
	(4, 'Sara', 'Sánchez', 'De Juán', '1980-03-30', '2018-03-31', 'Domicilio cliente 4', 18, 'MUJER', 666666666, 'cliente4@gmail.com', NULL, 'SI', 'ALTO POTENCIAL'),
	(5, 'Jaime', 'Rodríguez', 'Martínez', '1960-11-07', '2019-09-30', 'C/Los Pinillas 25 Blq L 4ºC', 28, 'HOMBRE', 666666666, 'cliente5@gmail.com', NULL, 'SI', 'ALTO POTENCIAL'),
	(6, 'Elisa', 'De la Luz', 'Sierra', '1983-09-04', '2020-02-28', 'Domicilio cliente 6', 50, 'MUJER', 666666666, 'cliente6@gmail.com', NULL, 'NO', 'BAJO CONSUMO'),
	(7, 'Paco', 'Márquez', 'Soldado', '1977-06-18', '2190-10-07', 'Domicilio cliente 7', 41, 'HOMBRE', 666666666, 'cliente7@gmail.com', NULL, 'NO', 'BAJO CONSUMO'),
	(8, 'María', 'Torres', 'García', '1968-04-06', '2020-05-05', 'Domicilio cliente 8', 18, 'MUJER', 666666666, 'cliente8@gmail.com', NULL, 'SI', 'ALTO POTENCIAL'),
	(9, 'Javier', 'Pérez', 'López', '1983-09-19', '2020-07-12', 'Avda Minerva 18', 28, 'HOMBRE', 666666666, 'cliente9@gmail.com', NULL, 'SI', 'BAJO CONSUMO'),
	(10, 'Emilio', 'García', 'Barreda', '1972-03-23', '2019-11-11', 'Domicilio cliente 10', 50, 'HOMBRE', 666666666, 'cliente10@gmail.com', NULL, 'NO', 'BAJO CONSUMO');
/*!40000 ALTER TABLE `dm_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_empleado
DROP TABLE IF EXISTS `dm_empleado`;
CREATE TABLE IF NOT EXISTS `dm_empleado` (
  `ID_EMPLEADO` smallint(5) unsigned NOT NULL,
  `NOMBRE_EMPLEADO` varchar(50) NOT NULL,
  `APELLIDO1_EMPLEADO` varchar(50) NOT NULL,
  `APELLIDO2_EMPLEADO` varchar(50) NOT NULL,
  `FEC_NACIMIENTO_EMPLEADO` date NOT NULL,
  `FEC_ALTA_EMPLEADO` date NOT NULL,
  `ID_SEXO_EMPLEADO` enum('HOMBRE','MUJER') DEFAULT NULL,
  `FEC_BAJA_EMPLEADO` date DEFAULT NULL,
  `TIPO_PUESTO` enum('VENDEDOR','SUPERVISOR') NOT NULL,
  PRIMARY KEY (`ID_EMPLEADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de los empleados que supervisan a los empleados encargados directos de las ventas(vendedores)';

-- Volcando datos para la tabla tfg.dm_empleado: ~8 rows (aproximadamente)
DELETE FROM `dm_empleado`;
/*!40000 ALTER TABLE `dm_empleado` DISABLE KEYS */;
INSERT INTO `dm_empleado` (`ID_EMPLEADO`, `NOMBRE_EMPLEADO`, `APELLIDO1_EMPLEADO`, `APELLIDO2_EMPLEADO`, `FEC_NACIMIENTO_EMPLEADO`, `FEC_ALTA_EMPLEADO`, `ID_SEXO_EMPLEADO`, `FEC_BAJA_EMPLEADO`, `TIPO_PUESTO`) VALUES
	(0, 'Supervisor Comodin', 'Comodin', 'Comodin', '1900-01-01', '1900-01-01', NULL, NULL, 'SUPERVISOR'),
	(1, 'Rafael', 'Gil', 'Martin', '2020-10-06', '2020-10-06', 'HOMBRE', NULL, 'SUPERVISOR'),
	(2, 'Jorge', 'Prieto', 'Santos', '2020-10-06', '2020-10-06', 'HOMBRE', NULL, 'VENDEDOR'),
	(3, 'Antonio', 'Flores', 'Blanco', '2020-10-07', '2020-10-07', 'HOMBRE', NULL, 'VENDEDOR'),
	(4, 'Maria', 'Ortiz', 'Gil', '0000-00-00', '2020-10-07', 'MUJER', NULL, 'VENDEDOR'),
	(5, 'Desire', 'Fernandez', 'Rios', '0000-00-00', '2020-10-07', 'MUJER', NULL, 'VENDEDOR'),
	(6, 'JoseLuis', 'Lopez', 'Manzano', '0000-00-00', '2020-10-07', 'HOMBRE', NULL, 'VENDEDOR'),
	(7, 'Julia', 'Garcia', 'Carpintero', '0000-00-00', '2020-10-07', 'MUJER', NULL, 'SUPERVISOR');
/*!40000 ALTER TABLE `dm_empleado` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_familia
DROP TABLE IF EXISTS `dm_familia`;
CREATE TABLE IF NOT EXISTS `dm_familia` (
  `ID_FAMILIA` smallint(5) unsigned NOT NULL,
  `DESC_FAMILIA` varchar(30) NOT NULL,
  `ID_SECCION` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID_FAMILIA`),
  KEY `ID_SECCION` (`ID_SECCION`),
  CONSTRAINT `FK_dm_familia_dm_seccion` FOREIGN KEY (`ID_SECCION`) REFERENCES `dm_seccion` (`ID_SECCION`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tipo de familia que engloba subfamilias';

-- Volcando datos para la tabla tfg.dm_familia: ~8 rows (aproximadamente)
DELETE FROM `dm_familia`;
/*!40000 ALTER TABLE `dm_familia` DISABLE KEYS */;
INSERT INTO `dm_familia` (`ID_FAMILIA`, `DESC_FAMILIA`, `ID_SECCION`) VALUES
	(1, 'Familia 1', 1),
	(2, 'Familia 2', 2),
	(3, 'Familia 3', 3),
	(4, 'Familia 4', 4),
	(5, 'Familia 5', 1),
	(6, 'Familia 6', 2),
	(7, 'Familia 7', 3),
	(8, 'Familia 8', 4);
/*!40000 ALTER TABLE `dm_familia` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_franja_horaria
DROP TABLE IF EXISTS `dm_franja_horaria`;
CREATE TABLE IF NOT EXISTS `dm_franja_horaria` (
  `id_franja_horaria` int(11) unsigned NOT NULL DEFAULT 0,
  `desc_franja_horaria` varchar(20) DEFAULT NULL,
  `hora_desde` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `hora_hasta` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `horario` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_franja_horaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tfg.dm_franja_horaria: ~4 rows (aproximadamente)
DELETE FROM `dm_franja_horaria`;
/*!40000 ALTER TABLE `dm_franja_horaria` DISABLE KEYS */;
INSERT INTO `dm_franja_horaria` (`id_franja_horaria`, `desc_franja_horaria`, `hora_desde`, `hora_hasta`, `horario`) VALUES
	(1, 'Mañana', 9, 11, '9:00-12:00'),
	(2, 'Mediodia', 12, 15, '12:00-16:00'),
	(3, 'Tarde', 16, 19, '16:00-20:00'),
	(4, 'Noche', 20, 23, '20:00-24:00');
/*!40000 ALTER TABLE `dm_franja_horaria` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_proveedor
DROP TABLE IF EXISTS `dm_proveedor`;
CREATE TABLE IF NOT EXISTS `dm_proveedor` (
  `ID_PROVEEDOR` smallint(5) unsigned NOT NULL,
  `DESC_PROVEEDOR` varchar(50) NOT NULL DEFAULT '',
  `FECHA_ALTA_PROVEEDOR` date NOT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tfg.dm_proveedor: ~8 rows (aproximadamente)
DELETE FROM `dm_proveedor`;
/*!40000 ALTER TABLE `dm_proveedor` DISABLE KEYS */;
INSERT INTO `dm_proveedor` (`ID_PROVEEDOR`, `DESC_PROVEEDOR`, `FECHA_ALTA_PROVEEDOR`) VALUES
	(1, 'Proveedor 1', '2019-10-15'),
	(2, 'Proveedor 2', '2019-11-10'),
	(3, 'Proveedor 3', '2020-03-02'),
	(4, 'Proveedor 4', '2020-06-26'),
	(5, 'Proveedor 5', '2020-02-27'),
	(6, 'Proveedor 6', '2020-07-22'),
	(7, 'Proveedor 7', '2020-07-18'),
	(8, 'Proveedor 8', '2020-04-17');
/*!40000 ALTER TABLE `dm_proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_provincia
DROP TABLE IF EXISTS `dm_provincia`;
CREATE TABLE IF NOT EXISTS `dm_provincia` (
  `ID_PROVINCIA` smallint(5) unsigned NOT NULL DEFAULT 0,
  `DESC_PROVINCIA` varchar(50) NOT NULL,
  `ID_CCAA` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PROVINCIA`),
  KEY `ID_CCAA` (`ID_CCAA`),
  CONSTRAINT `FK_dm_provincia_dm_ccaa` FOREIGN KEY (`ID_CCAA`) REFERENCES `dm_ccaa` (`ID_CCAA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='TABLA MAESTRA DE PROVINCIAS';

-- Volcando datos para la tabla tfg.dm_provincia: ~55 rows (aproximadamente)
DELETE FROM `dm_provincia`;
/*!40000 ALTER TABLE `dm_provincia` DISABLE KEYS */;
INSERT INTO `dm_provincia` (`ID_PROVINCIA`, `DESC_PROVINCIA`, `ID_CCAA`) VALUES
	(0, 'Sin especificar', 0),
	(1, 'Araba/Álava', 16),
	(2, 'Albacete', 8),
	(3, 'Alicante/Alacant', 10),
	(4, 'Almería', 1),
	(5, 'Ávila', 7),
	(6, 'Badajoz', 11),
	(7, 'Balears, Illes', 4),
	(8, 'Barcelona', 9),
	(9, 'Burgos', 7),
	(10, 'Cáceres', 11),
	(11, 'Cádiz', 1),
	(12, 'Castellón/Castelló', 10),
	(13, 'Ciudad Real', 8),
	(14, 'Córdoba', 1),
	(15, 'Coruña, A', 12),
	(16, 'Cuenca', 8),
	(17, 'Girona', 9),
	(18, 'Granada', 1),
	(19, 'Guadalajara', 8),
	(20, 'Gipuzkoa', 16),
	(21, 'Huelva', 1),
	(22, 'Huesca', 2),
	(23, 'Jaén', 1),
	(24, 'León', 7),
	(25, 'Lleida', 9),
	(26, 'Rioja, La', 17),
	(27, 'Lugo', 12),
	(28, 'Madrid', 13),
	(29, 'Málaga', 1),
	(30, 'Murcia', 14),
	(31, 'Navarra', 15),
	(32, 'Ourense', 12),
	(33, 'Asturias', 3),
	(34, 'Palencia', 7),
	(35, 'Palmas, Las', 5),
	(36, 'Pontevedra', 12),
	(37, 'Salamanca', 7),
	(38, 'Santa Cruz de Tenerife', 5),
	(39, 'Cantabria', 6),
	(40, 'Segovia', 7),
	(41, 'Sevilla', 1),
	(42, 'Soria', 7),
	(43, 'Tarragona', 9),
	(44, 'Teruel', 2),
	(45, 'Toledo', 8),
	(46, 'Valencia/València', 10),
	(47, 'Valladolid', 7),
	(48, 'Bizkaia', 16),
	(49, 'Zamora', 7),
	(50, 'Zaragoza', 2),
	(51, 'Ceuta', 18),
	(52, 'Melilla', 19),
	(98, 'Servicios Centrales', 98),
	(99, 'Extranjero', 99);
/*!40000 ALTER TABLE `dm_provincia` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_seccion
DROP TABLE IF EXISTS `dm_seccion`;
CREATE TABLE IF NOT EXISTS `dm_seccion` (
  `ID_SECCION` tinyint(3) unsigned NOT NULL,
  `DESC_SECCION` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_SECCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Nivel más alto de la jerarquía a la que puede pertenecer un artículo.';

-- Volcando datos para la tabla tfg.dm_seccion: ~4 rows (aproximadamente)
DELETE FROM `dm_seccion`;
/*!40000 ALTER TABLE `dm_seccion` DISABLE KEYS */;
INSERT INTO `dm_seccion` (`ID_SECCION`, `DESC_SECCION`) VALUES
	(1, 'Seccion 1'),
	(2, 'Seccion 2'),
	(3, 'Seccion 3'),
	(4, 'Seccion 4');
/*!40000 ALTER TABLE `dm_seccion` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_subfamilia
DROP TABLE IF EXISTS `dm_subfamilia`;
CREATE TABLE IF NOT EXISTS `dm_subfamilia` (
  `ID_SUBFAMILIA` smallint(5) unsigned NOT NULL,
  `DESC_SUBFAMILIA` varchar(30) NOT NULL,
  `ID_FAMILIA` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ID_SUBFAMILIA`),
  KEY `ID_FAMILIA` (`ID_FAMILIA`),
  CONSTRAINT `FK_dm_subfamilia_dm_familia` FOREIGN KEY (`ID_FAMILIA`) REFERENCES `dm_familia` (`ID_FAMILIA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tipo de subfamilia a la que pertenece un artículo';

-- Volcando datos para la tabla tfg.dm_subfamilia: ~8 rows (aproximadamente)
DELETE FROM `dm_subfamilia`;
/*!40000 ALTER TABLE `dm_subfamilia` DISABLE KEYS */;
INSERT INTO `dm_subfamilia` (`ID_SUBFAMILIA`, `DESC_SUBFAMILIA`, `ID_FAMILIA`) VALUES
	(1, 'Subfamilia 1', 1),
	(2, 'Subfamilia 2', 1),
	(3, 'Subfamilia 3', 2),
	(4, 'Subfamilia 4', 3),
	(5, 'Subfamilia 5', 4),
	(6, 'Subfamilia 6', 4),
	(7, 'Subfamilia 7', 1),
	(8, 'Subfamilia 8', 3);
/*!40000 ALTER TABLE `dm_subfamilia` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_supervisor
DROP TABLE IF EXISTS `dm_supervisor`;
CREATE TABLE IF NOT EXISTS `dm_supervisor` (
  `ID_SUPERVISOR` smallint(5) unsigned NOT NULL,
  `TLF_EMPRESA` int(9) unsigned NOT NULL DEFAULT 999999999,
  PRIMARY KEY (`ID_SUPERVISOR`),
  CONSTRAINT `FK_dm_supervisor_dm_empleado` FOREIGN KEY (`ID_SUPERVISOR`) REFERENCES `dm_empleado` (`ID_EMPLEADO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de los empleados que supervisan a los empleados encargados directos de las ventas(vendedores)';

-- Volcando datos para la tabla tfg.dm_supervisor: ~2 rows (aproximadamente)
DELETE FROM `dm_supervisor`;
/*!40000 ALTER TABLE `dm_supervisor` DISABLE KEYS */;
INSERT INTO `dm_supervisor` (`ID_SUPERVISOR`, `TLF_EMPRESA`) VALUES
	(0, 999999999),
	(1, 999999999),
	(7, 999999999);
/*!40000 ALTER TABLE `dm_supervisor` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.dm_vendedor
DROP TABLE IF EXISTS `dm_vendedor`;
CREATE TABLE IF NOT EXISTS `dm_vendedor` (
  `ID_VENDEDOR` smallint(5) unsigned NOT NULL,
  `ID_SUPERVISOR` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_VENDEDOR`),
  KEY `ID_SUPERVISOR` (`ID_SUPERVISOR`),
  CONSTRAINT `FK_dm_vendedor_dm_empleado` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `dm_empleado` (`ID_EMPLEADO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dm_vendedor_dm_supervisor` FOREIGN KEY (`ID_SUPERVISOR`) REFERENCES `dm_supervisor` (`ID_SUPERVISOR`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de los empleados que realizan las ventas';

-- Volcando datos para la tabla tfg.dm_vendedor: ~5 rows (aproximadamente)
DELETE FROM `dm_vendedor`;
/*!40000 ALTER TABLE `dm_vendedor` DISABLE KEYS */;
INSERT INTO `dm_vendedor` (`ID_VENDEDOR`, `ID_SUPERVISOR`) VALUES
	(2, 1),
	(4, 1),
	(6, 1),
	(3, 7),
	(5, 7);
/*!40000 ALTER TABLE `dm_vendedor` ENABLE KEYS */;

-- Volcando estructura para evento tfg.evt_actualizacion_catalogo
DROP EVENT IF EXISTS `evt_actualizacion_catalogo`;
DELIMITER //
CREATE EVENT `evt_actualizacion_catalogo` ON SCHEDULE EVERY 1 DAY STARTS '2020-10-05 12:01:00' ON COMPLETION PRESERVE ENABLE DO BEGIN

UPDATE  dm_cliente 
SET dm_cliente.CATALOGO='NO'
WHERE ID_CLIENTE NOT IN (
SELECT ID_CLIENTE FROM 
	(
	SELECT ID_CLIENTE,COUNT(*) FROM hc_tique WHERE  FEC_DIA > date_add(NOW(),INTERVAL -365 DAY) 	
	GROUP BY ID_CLIENTE
	) A
);

END//
DELIMITER ;

-- Volcando estructura para evento tfg.evt_baja_cliente_act_categoria
DROP EVENT IF EXISTS `evt_baja_cliente_act_categoria`;
DELIMITER //
CREATE EVENT `evt_baja_cliente_act_categoria` ON SCHEDULE EVERY 1 WEEK STARTS '2020-10-18 14:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Evento de actualizacion de baja de cliente y categoria asignada' DO BEGIN

UPDATE  dm_cliente 
SET dm_cliente.FEC_BAJA_CLIENTE= NOW(), dm_cliente.CATEGORIA = 'BAJO CONSUMO'
WHERE ID_CLIENTE NOT IN (
SELECT ID_CLIENTE FROM 
	(
	SELECT ID_CLIENTE,COUNT(*) FROM hc_tique WHERE  FEC_DIA > date_add(NOW(),INTERVAL -2 YEAR) 	
	GROUP BY ID_CLIENTE
	) A
);


END//
DELIMITER ;

-- Volcando estructura para tabla tfg.hc_articulo_centro_dia
DROP TABLE IF EXISTS `hc_articulo_centro_dia`;
CREATE TABLE IF NOT EXISTS `hc_articulo_centro_dia` (
  `ID_ARTICULO` int(10) unsigned NOT NULL,
  `ID_CENTRO` smallint(5) unsigned NOT NULL,
  `FEC_DIA` date NOT NULL,
  `IMPORTE` decimal(18,2) unsigned NOT NULL,
  `UNIDADES_VENDIDAS` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID_ARTICULO`,`ID_CENTRO`,`FEC_DIA`),
  KEY `FK_hc_articulo_centro_dia_dm_centro` (`ID_CENTRO`),
  CONSTRAINT `FK_hc_articulo_centro_dia_dm_articulo` FOREIGN KEY (`ID_ARTICULO`) REFERENCES `dm_articulo` (`ID_ARTICULO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hc_articulo_centro_dia_dm_centro` FOREIGN KEY (`ID_CENTRO`) REFERENCES `dm_centro` (`ID_CENTRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de Hechos de los datos de los artículos vendidos por día y centro de venta.';

-- Volcando datos para la tabla tfg.hc_articulo_centro_dia: ~0 rows (aproximadamente)
DELETE FROM `hc_articulo_centro_dia`;
/*!40000 ALTER TABLE `hc_articulo_centro_dia` DISABLE KEYS */;
INSERT INTO `hc_articulo_centro_dia` (`ID_ARTICULO`, `ID_CENTRO`, `FEC_DIA`, `IMPORTE`, `UNIDADES_VENDIDAS`) VALUES
	(1, 1, '2019-08-04', 12.34, 1),
	(1, 2, '2019-09-20', 3.00, 2),
	(2, 1, '2019-08-04', 5.00, 3),
	(2, 2, '2019-08-04', 5.23, 2),
	(2, 4, '2019-09-20', 123.00, 4),
	(2, 5, '2019-09-05', 67.00, 3),
	(3, 1, '2019-08-04', 131.67, 4),
	(3, 1, '2019-09-05', 22.45, 2),
	(3, 2, '2019-09-05', 117.00, 3),
	(3, 3, '2019-09-20', 776.00, 2),
	(3, 4, '2019-09-20', 3.00, 3),
	(3, 5, '2019-09-05', 35.00, 2),
	(3, 5, '2019-09-20', 55.78, 4),
	(4, 1, '2019-08-04', 44.67, 2),
	(4, 2, '2019-08-04', 3.00, 2),
	(4, 4, '2019-09-20', 5.00, 2),
	(4, 5, '2019-08-04', 72.00, 1),
	(4, 5, '2019-09-05', 32.00, 1),
	(4, 5, '2019-09-20', 8.13, 2),
	(5, 1, '2019-08-04', 13.34, 4),
	(5, 3, '2019-08-04', 89.67, 12),
	(5, 5, '2019-09-05', 56.67, 2),
	(6, 1, '2019-08-04', 4.34, 3),
	(6, 1, '2019-09-05', 133.22, 7),
	(6, 2, '2019-09-05', 3.00, 1),
	(6, 2, '2019-09-20', 8.76, 1),
	(6, 3, '2019-09-20', 56.00, 1),
	(6, 4, '2019-08-04', 98.00, 2),
	(6, 4, '2019-09-20', 54.00, 1),
	(6, 5, '2019-09-20', 5.67, 33),
	(7, 1, '2019-09-05', 66.78, 3),
	(7, 1, '2019-09-20', 87.67, 2),
	(7, 2, '2019-08-04', 223.00, 2),
	(7, 2, '2019-09-05', 6.00, 4),
	(7, 3, '2019-08-04', 6.57, 1),
	(7, 3, '2019-09-20', 34.00, 2),
	(8, 1, '2019-09-05', 55.45, 1),
	(8, 1, '2019-09-20', 89.76, 1),
	(8, 2, '2019-09-20', 4.89, 1),
	(8, 3, '2019-09-05', 2.00, 3),
	(8, 3, '2019-09-20', 90.00, 1),
	(8, 5, '2019-08-04', 38.00, 1),
	(9, 1, '2019-09-20', 77.12, 3),
	(9, 2, '2019-08-04', 445.67, 3),
	(9, 2, '2019-09-05', 77.00, 2),
	(9, 2, '2019-09-20', 7.67, 2),
	(9, 3, '2019-09-20', 92.00, 3),
	(9, 4, '2019-09-20', 34.00, 2),
	(9, 5, '2019-08-04', 98.00, 2),
	(10, 2, '2019-08-04', 665.78, 4),
	(10, 3, '2019-09-20', 8.00, 22),
	(10, 4, '2019-09-05', 2.00, 3),
	(10, 5, '2019-09-05', 66.54, 2),
	(10, 5, '2019-09-20', 9.90, 4),
	(11, 2, '2019-08-04', 5.45, 3),
	(11, 3, '2019-09-20', 8.00, 2),
	(11, 5, '2019-09-05', 8.76, 2),
	(11, 5, '2019-09-20', 5.13, 4),
	(12, 1, '2019-09-05', 66.78, 4),
	(12, 1, '2019-09-20', 56.55, 1),
	(12, 2, '2019-09-05', 9.00, 2),
	(12, 3, '2019-08-04', 66.89, 2),
	(12, 5, '2019-08-04', 6.00, 3),
	(12, 5, '2019-09-20', 45.67, 2),
	(13, 1, '2019-09-20', 56.78, 1),
	(13, 2, '2019-08-04', 44.00, 2),
	(13, 3, '2019-08-04', 87.33, 32),
	(13, 4, '2019-08-04', 76.00, 3),
	(13, 5, '2019-08-04', 34.56, 3),
	(14, 1, '2019-09-05', 33.45, 2),
	(14, 2, '2019-08-04', 3.45, 4),
	(14, 4, '2019-09-20', 54.00, 2),
	(15, 1, '2019-09-20', 77.90, 2),
	(15, 2, '2019-08-04', 5.67, 3),
	(15, 2, '2019-09-05', 10.00, 3),
	(15, 3, '2019-08-04', 145.43, 3),
	(15, 3, '2019-09-20', 9.00, 3),
	(15, 4, '2019-09-20', 28.00, 2),
	(16, 1, '2019-09-20', 89.56, 1),
	(16, 2, '2019-08-04', 55.67, 2),
	(16, 3, '2019-08-04', 4.00, 2),
	(16, 4, '2019-09-05', 54.00, 2),
	(16, 5, '2019-09-05', 12.33, 3),
	(17, 1, '2019-09-20', 44.23, 1),
	(17, 3, '2019-09-05', 3.00, 3),
	(17, 4, '2019-09-05', 34.00, 1),
	(17, 5, '2019-09-05', 9.15, 7),
	(18, 2, '2019-09-20', 5.67, 3),
	(18, 4, '2019-09-05', 26.00, 2),
	(19, 4, '2019-09-05', 83.00, 2);
/*!40000 ALTER TABLE `hc_articulo_centro_dia` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.hc_linea_tique
DROP TABLE IF EXISTS `hc_linea_tique`;
CREATE TABLE IF NOT EXISTS `hc_linea_tique` (
  `ID_TIQUE` int(10) unsigned NOT NULL,
  `ID_LINEA_TIQUE` smallint(5) unsigned NOT NULL,
  `ID_ARTICULO` int(10) unsigned NOT NULL,
  `UNIDADES_VENDIDAS` int(10) unsigned NOT NULL,
  `IMPORTE_UNITARIO` decimal(18,2) NOT NULL DEFAULT 0.00,
  `IMPORTE_LINEA` decimal(18,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`ID_LINEA_TIQUE`) USING BTREE,
  KEY `ID_TIQUE` (`ID_TIQUE`),
  KEY `ID_ARTICULO` (`ID_ARTICULO`),
  CONSTRAINT `FK_hc_linea_tique_dm_articulo` FOREIGN KEY (`ID_ARTICULO`) REFERENCES `dm_articulo` (`ID_ARTICULO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hc_linea_tique_hc_tique` FOREIGN KEY (`ID_TIQUE`) REFERENCES `hc_tique` (`ID_TIQUE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de Hechos que recoge cada línea (equivalente a un artículo) de los distintos tickets';

-- Volcando datos para la tabla tfg.hc_linea_tique: ~26 rows (aproximadamente)
DELETE FROM `hc_linea_tique`;
/*!40000 ALTER TABLE `hc_linea_tique` DISABLE KEYS */;
INSERT INTO `hc_linea_tique` (`ID_TIQUE`, `ID_LINEA_TIQUE`, `ID_ARTICULO`, `UNIDADES_VENDIDAS`, `IMPORTE_UNITARIO`, `IMPORTE_LINEA`) VALUES
	(1, 1, 1, 1, 15.00, 15.00),
	(1, 2, 3, 2, 11.50, 23.00),
	(1, 3, 2, 3, 1.66, 5.00),
	(1, 4, 5, 3, 3.00, 9.00),
	(1, 5, 6, 3, 10.00, 30.00),
	(2, 6, 3, 2, 11.50, 23.00),
	(2, 7, 4, 2, 22.00, 44.00),
	(2, 8, 5, 1, 3.00, 3.00),
	(3, 9, 6, 2, 10.00, 20.00),
	(3, 10, 7, 3, 23.00, 69.00),
	(3, 11, 6, 2, 10.00, 20.00),
	(3, 12, 8, 1, 55.50, 55.50),
	(3, 13, 3, 2, 11.50, 23.00),
	(4, 14, 6, 3, 10.00, 30.00),
	(4, 15, 12, 4, 16.25, 65.00),
	(4, 16, 14, 2, 16.75, 33.50),
	(5, 17, 12, 1, 16.25, 56.50),
	(5, 18, 17, 1, 5.00, 5.00),
	(5, 19, 13, 1, 35.00, 35.00),
	(5, 20, 15, 2, 38.50, 77.00),
	(5, 21, 16, 1, 40.00, 40.00),
	(6, 22, 7, 2, 23.00, 46.00),
	(6, 23, 8, 1, 55.50, 55.50),
	(6, 24, 9, 3, 15.00, 45.00),
	(7, 25, 10, 4, 110.20, 440.80),
	(7, 26, 11, 3, 2.50, 7.50),
	(7, 27, 13, 2, 35.00, 70.00),
	(7, 28, 2, 1, 2.00, 2.00),
	(8, 29, 7, 2, 23.00, 46.00),
	(8, 30, 9, 3, 15.00, 45.00),
	(8, 31, 14, 4, 16.75, 67.00),
	(8, 32, 15, 3, 38.50, 115.50),
	(8, 33, 16, 2, 40.00, 80.00),
	(8, 34, 2, 1, 2.00, 2.00),
	(8, 35, 4, 2, 22.00, 44.00),
	(9, 36, 7, 3, 23.00, 69.00),
	(9, 37, 9, 2, 15.00, 30.00),
	(9, 38, 3, 1, 11.50, 11.50),
	(10, 39, 12, 2, 16.25, 32.50),
	(10, 40, 15, 3, 38.50, 115.50),
	(10, 41, 3, 2, 11.50, 23.00),
	(10, 42, 6, 1, 10.00, 10.00),
	(10, 43, 7, 1, 23.00, 23.00),
	(11, 44, 1, 2, 15.00, 30.00),
	(11, 45, 18, 3, 6.25, 18.75),
	(11, 46, 9, 2, 15.00, 30.00),
	(12, 47, 8, 1, 4.89, 4.89),
	(12, 48, 6, 1, 10.00, 10.00),
	(13, 49, 7, 1, 23.00, 23.00),
	(13, 50, 5, 12, 3.00, 36.00),
	(13, 51, 15, 2, 38.50, 77.00),
	(13, 52, 13, 3, 35.00, 105.00),
	(13, 53, 12, 2, 16.25, 32.50),
	(14, 54, 15, 1, 38.50, 38.50),
	(14, 55, 16, 2, 40.00, 80.00),
	(15, 56, 17, 2, 5.00, 10.00),
	(16, 57, 8, 3, 55.50, 166.50),
	(17, 58, 9, 2, 15.00, 30.00),
	(17, 59, 7, 2, 23.00, 46.00),
	(17, 60, 6, 1, 10.00, 10.00),
	(17, 61, 3, 2, 11.50, 23.00),
	(17, 62, 11, 2, 2.50, 5.00),
	(18, 63, 15, 3, 38.50, 115.50),
	(18, 64, 10, 2, 110.20, 220.40),
	(18, 65, 9, 1, 15.00, 15.00),
	(18, 66, 8, 1, 55.50, 55.50),
	(19, 67, 6, 2, 10.00, 20.00),
	(20, 68, 13, 3, 35.00, 105.00),
	(21, 69, 16, 1, 40.00, 40.00),
	(22, 70, 17, 1, 5.00, 5.00),
	(22, 71, 18, 2, 6.25, 12.50),
	(22, 72, 19, 2, 13.00, 26.00),
	(22, 73, 10, 3, 110.20, 330.60),
	(23, 74, 3, 3, 11.50, 34.50),
	(23, 75, 4, 2, 22.00, 44.00),
	(23, 76, 2, 1, 2.00, 2.00),
	(24, 77, 6, 1, 10.00, 10.00),
	(24, 78, 9, 2, 15.00, 30.00),
	(24, 79, 2, 3, 1.66, 5.00),
	(24, 80, 14, 2, 16.75, 33.50),
	(24, 81, 15, 2, 38.50, 77.00),
	(25, 82, 4, 1, 22.00, 22.00),
	(25, 83, 8, 1, 55.50, 55.50),
	(26, 84, 9, 2, 15.00, 30.00),
	(26, 85, 12, 3, 16.25, 48.75),
	(26, 86, 13, 2, 35.00, 70.00),
	(27, 87, 10, 2, 110.20, 220.40),
	(27, 88, 11, 22, 2.50, 55.00),
	(27, 89, 17, 7, 5.00, 35.00),
	(27, 90, 16, 3, 25.00, 75.00),
	(27, 91, 5, 2, 3.00, 6.00),
	(28, 92, 4, 1, 15.00, 15.00),
	(28, 93, 3, 2, 11.50, 23.00),
	(28, 94, 2, 3, 1.66, 5.00),
	(29, 95, 3, 4, 11.50, 46.00),
	(29, 96, 10, 4, 110.20, 440.80),
	(29, 97, 6, 6, 7.00, 42.00),
	(30, 98, 4, 2, 15.00, 30.00),
	(30, 99, 12, 2, 16.25, 32.50),
	(30, 100, 11, 4, 2.50, 10.00);
/*!40000 ALTER TABLE `hc_linea_tique` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.hc_tique
DROP TABLE IF EXISTS `hc_tique`;
CREATE TABLE IF NOT EXISTS `hc_tique` (
  `ID_TIQUE` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_CENTRO` smallint(5) unsigned NOT NULL DEFAULT 0,
  `FEC_DIA` datetime NOT NULL DEFAULT current_timestamp(),
  `ID_METODO_PAGO` enum('EFECTIVO','TARJETA') NOT NULL,
  `ID_CLIENTE` int(10) unsigned NOT NULL DEFAULT 0,
  `ID_VENDEDOR` smallint(5) unsigned NOT NULL DEFAULT 0,
  `ID_FRANJA` tinyint(3) unsigned DEFAULT NULL,
  `IMPORTE_TOTAL` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_TIQUE`) USING BTREE,
  KEY `ID_CENTRO` (`ID_CENTRO`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  KEY `ID_VENDEDOR` (`ID_VENDEDOR`),
  CONSTRAINT `FK_hc_ticket_dm_centro` FOREIGN KEY (`ID_CENTRO`) REFERENCES `dm_centro` (`ID_CENTRO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hc_ticket_dm_cliente` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `dm_cliente` (`ID_CLIENTE`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hc_ticket_dm_vendedor` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `dm_vendedor` (`ID_VENDEDOR`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='Dimensión de que recoge los datos por cada ticket';

-- Volcando datos para la tabla tfg.hc_tique: ~30 rows (aproximadamente)
DELETE FROM `hc_tique`;
/*!40000 ALTER TABLE `hc_tique` DISABLE KEYS */;
INSERT INTO `hc_tique` (`ID_TIQUE`, `ID_CENTRO`, `FEC_DIA`, `ID_METODO_PAGO`, `ID_CLIENTE`, `ID_VENDEDOR`, `ID_FRANJA`, `IMPORTE_TOTAL`) VALUES
	(1, 5, '2020-09-24 07:50:59', 'EFECTIVO', 10, 3, NULL, 82),
	(2, 4, '2020-04-16 04:50:59', 'EFECTIVO', 5, 3, NULL, 70),
	(3, 4, '2020-01-09 10:50:59', 'EFECTIVO', 3, 3, 1, 188),
	(4, 3, '2019-11-24 06:50:59', 'EFECTIVO', 5, 2, NULL, 129),
	(5, 4, '2019-11-26 10:50:59', 'TARJETA', 8, 4, 1, 214),
	(6, 2, '2020-02-16 08:50:59', 'EFECTIVO', 6, 2, NULL, 147),
	(7, 5, '2020-05-16 07:50:59', 'EFECTIVO', 4, 2, NULL, 520),
	(8, 2, '2020-01-11 03:50:59', 'EFECTIVO', 1, 2, NULL, 400),
	(9, 1, '2020-03-24 04:50:59', 'EFECTIVO', 0, 3, NULL, 111),
	(10, 5, '2020-02-28 07:50:59', 'EFECTIVO', 8, 2, NULL, 204),
	(11, 5, '2020-01-19 12:50:59', 'EFECTIVO', 3, 6, 2, 79),
	(12, 2, '2020-08-08 06:50:59', 'TARJETA', 2, 4, NULL, 15),
	(13, 2, '2020-02-12 09:50:59', 'EFECTIVO', 4, 2, 1, 274),
	(14, 3, '2019-10-24 06:50:59', 'EFECTIVO', 2, 4, NULL, 119),
	(15, 5, '2020-06-16 06:50:59', 'EFECTIVO', 8, 2, NULL, 10),
	(16, 4, '2020-06-19 07:50:59', 'TARJETA', 3, 4, NULL, 167),
	(17, 5, '2019-10-26 12:50:59', 'TARJETA', 3, 6, 2, 114),
	(18, 2, '2020-05-21 05:50:59', 'EFECTIVO', 2, 2, NULL, 406),
	(19, 4, '2020-01-30 11:50:59', 'EFECTIVO', 8, 2, 1, 20),
	(20, 5, '2020-02-06 03:50:59', 'EFECTIVO', 8, 2, NULL, 105),
	(21, 3, '2020-04-08 05:50:59', 'EFECTIVO', 0, 4, NULL, 40),
	(22, 4, '2020-04-25 03:50:59', 'EFECTIVO', 1, 4, NULL, 374),
	(23, 3, '2020-08-15 12:50:59', 'TARJETA', 9, 3, 2, 81),
	(24, 5, '2020-01-27 08:50:59', 'TARJETA', 4, 4, NULL, 156),
	(25, 5, '2019-10-30 08:50:59', 'EFECTIVO', 9, 6, NULL, 78),
	(26, 5, '2020-02-28 07:50:59', 'EFECTIVO', 2, 4, NULL, 149),
	(27, 1, '2020-08-26 04:50:59', 'TARJETA', 3, 3, NULL, 391),
	(28, 2, '2020-01-19 11:50:59', 'EFECTIVO', 3, 2, 1, 43),
	(29, 5, '2020-03-02 07:50:59', 'EFECTIVO', 5, 5, NULL, 529),
	(30, 2, '2019-10-20 11:50:59', 'EFECTIVO', 7, 5, 1, 73);
/*!40000 ALTER TABLE `hc_tique` ENABLE KEYS */;

-- Volcando estructura para tabla tfg.proveedor_articulo_centro
DROP TABLE IF EXISTS `proveedor_articulo_centro`;
CREATE TABLE IF NOT EXISTS `proveedor_articulo_centro` (
  `ID_PROVEEDOR` smallint(5) unsigned NOT NULL DEFAULT 0,
  `ID_ARTICULO` int(10) unsigned NOT NULL,
  `ID_CENTRO` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PROVEEDOR`,`ID_ARTICULO`,`ID_CENTRO`),
  KEY `FK_proveedor_articulo_centro_dm_articulo` (`ID_ARTICULO`),
  KEY `FK_proveedor_articulo_centro_dm_centro` (`ID_CENTRO`),
  CONSTRAINT `FK_proveedor_articulo_centro_dm_articulo` FOREIGN KEY (`ID_ARTICULO`) REFERENCES `dm_articulo` (`ID_ARTICULO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_proveedor_articulo_centro_dm_centro` FOREIGN KEY (`ID_CENTRO`) REFERENCES `dm_centro` (`ID_CENTRO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_proveedor_articulo_centro_dm_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `dm_proveedor` (`ID_PROVEEDOR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de la relación ternaria entre los proveedores , los centros y los artículos.';

-- Volcando datos para la tabla tfg.proveedor_articulo_centro: ~69 rows (aproximadamente)
DELETE FROM `proveedor_articulo_centro`;
/*!40000 ALTER TABLE `proveedor_articulo_centro` DISABLE KEYS */;
INSERT INTO `proveedor_articulo_centro` (`ID_PROVEEDOR`, `ID_ARTICULO`, `ID_CENTRO`) VALUES
	(1, 3, 1),
	(1, 3, 3),
	(1, 12, 1),
	(1, 12, 2),
	(1, 14, 1),
	(1, 19, 1),
	(2, 3, 3),
	(2, 3, 4),
	(2, 4, 2),
	(2, 5, 1),
	(2, 6, 2),
	(2, 8, 4),
	(2, 10, 1),
	(2, 11, 1),
	(2, 13, 5),
	(2, 20, 1),
	(3, 2, 3),
	(3, 4, 5),
	(3, 6, 3),
	(3, 10, 4),
	(3, 11, 2),
	(3, 12, 2),
	(3, 12, 4),
	(3, 13, 3),
	(3, 14, 4),
	(3, 16, 5),
	(3, 18, 4),
	(4, 1, 5),
	(4, 2, 4),
	(4, 5, 5),
	(4, 6, 5),
	(4, 9, 1),
	(4, 9, 5),
	(4, 10, 3),
	(4, 14, 4),
	(4, 15, 4),
	(4, 17, 1),
	(4, 17, 5),
	(4, 20, 4),
	(5, 3, 5),
	(5, 5, 3),
	(5, 7, 4),
	(5, 8, 4),
	(5, 9, 3),
	(5, 10, 3),
	(5, 13, 1),
	(5, 18, 2),
	(5, 19, 3),
	(6, 4, 4),
	(6, 7, 1),
	(6, 11, 1),
	(6, 11, 3),
	(6, 11, 5),
	(6, 15, 5),
	(7, 1, 4),
	(7, 6, 3),
	(7, 7, 5),
	(7, 13, 5),
	(7, 14, 3),
	(7, 19, 1),
	(8, 5, 5),
	(8, 7, 2),
	(8, 8, 5),
	(8, 11, 3),
	(8, 11, 4),
	(8, 12, 1),
	(8, 15, 1),
	(8, 15, 3),
	(8, 15, 5);
/*!40000 ALTER TABLE `proveedor_articulo_centro` ENABLE KEYS */;

-- Volcando estructura para disparador tfg.dm_centro_after_update
DROP TRIGGER IF EXISTS `dm_centro_after_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_centro_after_update` AFTER UPDATE ON `dm_centro` FOR EACH ROW BEGIN

IF NEW.FEC_CIERRE_CENTRO IS NOT NULL
THEN
DELETE FROM proveedor_articulo_centro WHERE ID_CENTRO= NEW.ID_CENTRO;
DELETE FROM dm_proveedor WHERE ID_PROVEEDOR NOT IN (SELECT DISTINCT ID_PROVEEDOR FROM proveedor_articulo_centro);
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_centro_before_insert
DROP TRIGGER IF EXISTS `dm_centro_before_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_centro_before_insert` BEFORE INSERT ON `dm_centro` FOR EACH ROW BEGIN

-- VERIFICAMOS TELEFONO 
IF NEW.TLF_CENTRO NOT REGEXP '[0-9]{9}' 
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'TELEFONO NO VALIDO,';
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_centro_before_update
DROP TRIGGER IF EXISTS `dm_centro_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_centro_before_update` BEFORE UPDATE ON `dm_centro` FOR EACH ROW BEGIN

/*VERIFICAMOS QUE LA FECHA DE BAJA ES MAYOR QUE LA FECHA DE ALTA O NULL*/

IF  NEW.FEC_CIERRE_CENTRO IS NOT NULL AND NEW.FEC_CIERRE_CENTRO <= OLD.FEC_APERTURA_CENTRO
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'FECHA DE APERTURA DEBE SER MAYOR QUE LA FECHA DE CIERRE DEL CENTRO';
END IF;

-- VERIFICAMOS TELEFONO 
IF NEW.TLF_CENTRO NOT REGEXP '[0-9]{9}' 
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'TELEFONO NO VALIDO,';
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_cliente_before_insert
DROP TRIGGER IF EXISTS `dm_cliente_before_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_cliente_before_insert` BEFORE INSERT ON `dm_cliente` FOR EACH ROW BEGIN

-- VERIFICAMOS EMAIL 
IF NEW.EMAIL_CLIENTE NOT REGEXP '^[[:alnum:]._%-\+]+@[[:alnum:].-]+[.][[:alnum:]]{2,4}$'
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'EMAIL NO VALIDO';
END IF;

-- VERIFICAMOS QUE EL EMAIL NO SE DUPLICA
IF (SELECT COUNT(*) FROM dm_cliente WHERE EMAIL_CLIENTE=NEW.EMAIL_CLIENTE) >=1
THEN
		SIGNAL SQLSTATE VALUE '45000'
		SET MESSAGE_TEXT = 'EMAIL REPETIDO';
END IF;

-- VERIFICAMOS TELEFONO 
IF NEW.TLF_CLIENTE NOT REGEXP '[0-9]{9}' 
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'TELEFONO NO VALIDO';
END IF;


-- INCREMENTAMOS EL AUTONUMERICO
SET NEW.ID_CLIENTE=(SELECT MAX(ID_CLIENTE)+1 FROM dm_cliente);

-- METEMOS FECHA ACTUAL EN EL ALTA DEL CLIENTE
SET NEW.FEC_ALTA_CLIENTE=NOW();



END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_cliente_before_update
DROP TRIGGER IF EXISTS `dm_cliente_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_cliente_before_update` BEFORE UPDATE ON `dm_cliente` FOR EACH ROW BEGIN

-- VERIFICAMOS EMAIL 
IF NEW.EMAIL_CLIENTE NOT REGEXP '^[[:alnum:]._%-\+]+@[[:alnum:].-]+[.][[:alnum:]]{2,4}$'
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'EMAIL NO VALIDO';
END IF;

-- VERIFICAMOS TELEFONO 
IF NEW.TLF_CLIENTE NOT REGEXP '[0-9]{9}' 
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'TELEFONO NO VALIDO';
END IF;

/*VERIFICAMOS QUE LA FECHA DE BAJA ES MAYOR QUE LA FECHA DE ALTA O NULL*/

IF NEW.FEC_BAJA_CLIENTE IS NOT NULL AND NEW.FEC_BAJA_CLIENTE <= OLD.FEC_ALTA_CLIENTE
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'FECHA DE ALTA DEBE SER MAYOR QUE LA FECHA DE ALTA DEL CLIENTE';
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_empleado_after_insert
DROP TRIGGER IF EXISTS `dm_empleado_after_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_empleado_after_insert` AFTER INSERT ON `dm_empleado` FOR EACH ROW BEGIN

IF NEW.TIPO_PUESTO='SUPERVISOR'
THEN
INSERT INTO dm_supervisor (ID_SUPERVISOR) VALUES (NEW.ID_EMPLEADO);
ELSE
INSERT INTO dm_vendedor (ID_VENDEDOR) VALUES (NEW.ID_EMPLEADO);
END IF;


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_empleado_after_update
DROP TRIGGER IF EXISTS `dm_empleado_after_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_empleado_after_update` AFTER UPDATE ON `dm_empleado` FOR EACH ROW BEGIN

-- SE BORRA EL SUPERVISOR DE SU TABLA SI SE DA DE BAJA EN EMPLEADOS Y A LOS VENDEDORES QUE TUVIERAN ESE SUPERVISOR SE LES PONE EL SUPERVISOR 0
IF NEW.FEC_BAJA_EMPLEADO IS NOT NULL AND NEW.TIPO_PUESTO = 'SUPERVISOR'
THEN 
UPDATE dm_vendedor SET ID_SUPERVISOR = 0 WHERE ID_SUPERVISOR = NEW.ID_EMPLEADO;
DELETE FROM dm_supervisor WHERE ID_SUPERVISOR = NEW.ID_EMPLEADO;
END IF; 


-- Se vuelve a insertar en supervisor un empleado que se le reactive el alta
IF NEW.FEC_BAJA_EMPLEADO IS NULL AND NEW.TIPO_PUESTO = 'SUPERVISOR' AND (SELECT ID_SUPERVISOR FROM dm_supervisor WHERE ID_SUPERVISOR = NEW.ID_EMPLEADO) IS NULL
THEN 
INSERT INTO dm_supervisor (ID_SUPERVISOR) VALUES (NEW.ID_EMPLEADO);    
END IF; 

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_empleado_before_insert
DROP TRIGGER IF EXISTS `dm_empleado_before_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_empleado_before_insert` BEFORE INSERT ON `dm_empleado` FOR EACH ROW BEGIN

-- INCREMENTAMOS EL AUTONUMERICO
SET NEW.ID_EMPLEADO =(SELECT MAX(ID_EMPLEADO)+1 FROM dm_empleado);

-- METEMOS FECHA ACTUAL EN EL ALTA DEL CLIENTE
SET NEW.FEC_ALTA_EMPLEADO=NOW();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_empleado_before_update
DROP TRIGGER IF EXISTS `dm_empleado_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_empleado_before_update` BEFORE UPDATE ON `dm_empleado` FOR EACH ROW BEGIN

/*VERIFICAMOS QUE LA FECHA DE BAJA ES MAYOR QUE LA FECHA DE ALTA O NULL*/

IF NEW.FEC_BAJA_EMPLEADO IS NOT NULL AND NEW.FEC_BAJA_EMPLEADO <= OLD.FEC_ALTA_EMPLEADO
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'FECHA DE ALTA DEBE SER MAYOR QUE LA FECHA DE ALTA DEL EMPLEADO';
END IF;

/*NO SE PUEDE MODIFICAR LA FECHA DE BAJA DE NULL PARA EL EMPLEADO SUPERVISOR 0*/
IF OLD.ID_EMPLEADO= 0 AND NEW.FEC_BAJA_EMPLEADO IS NOT NULL
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'NO SE PUEDE DAR DE BAJA AL SUPERVISOR COMODIN';
END IF;			

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_familia_before_delete
DROP TRIGGER IF EXISTS `dm_familia_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_familia_before_delete` BEFORE DELETE ON `dm_familia` FOR EACH ROW BEGIN

IF (SELECT COUNT(*) FROM dm_familia WHERE ID_SECCION=OLD.ID_SECCION) =1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'NO SE PUEDE BORRAR POR LA CARDINALIDAD MINIMA DE FAMILIAS EN UNA SECCION';
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_familia_before_update
DROP TRIGGER IF EXISTS `dm_familia_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_familia_before_update` BEFORE UPDATE ON `dm_familia` FOR EACH ROW BEGIN

IF (SELECT COUNT(*) FROM dm_familia WHERE ID_SECCION=OLD.ID_SECCION) =1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'UNICA FAMILIA PARA LA SECCION CORRESPONDIENTE, NO SE PUEDE MODIFICAR';
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_franja_horaria_after_delete
DROP TRIGGER IF EXISTS `dm_franja_horaria_after_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_franja_horaria_after_delete` AFTER DELETE ON `dm_franja_horaria` FOR EACH ROW BEGIN


UPDATE hc_tique SET ID_FRANJA=NULL;

UPDATE hc_tique A, dm_franja_horaria B
INNER JOIN hc_tique ON HOUR(hc_tique.fec_dia)   BETWEEN B.hora_desde AND B.hora_hasta
SET hc_tique.ID_FRANJA = B.id_franja_horaria
WHERE  hc_tique.ID_FRANJA IS NULL;


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_franja_horaria_after_insert
DROP TRIGGER IF EXISTS `dm_franja_horaria_after_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_franja_horaria_after_insert` AFTER INSERT ON `dm_franja_horaria` FOR EACH ROW BEGIN
 
UPDATE hc_ticket SET ID_FRANJA=NULL;


UPDATE hc_tique A, dm_franja_horaria B
INNER JOIN hc_tique ON HOUR(hc_tique.fec_dia)   BETWEEN B.hora_desde AND B.hora_hasta
SET hc_tique.ID_FRANJA = B.id_franja_horaria
WHERE  hc_tique.ID_FRANJA IS NULL;



END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_franja_horaria_after_update
DROP TRIGGER IF EXISTS `dm_franja_horaria_after_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_franja_horaria_after_update` AFTER UPDATE ON `dm_franja_horaria` FOR EACH ROW BEGIN


UPDATE hc_tique SET ID_FRANJA=NULL;


UPDATE hc_tique A, dm_franja_horaria B
INNER JOIN hc_tique ON HOUR(hc_tique.fec_dia)   BETWEEN B.hora_desde AND B.hora_hasta
SET hc_tique.ID_FRANJA = B.id_franja_horaria
WHERE  hc_tique.ID_FRANJA IS NULL;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_provincia_before_delete
DROP TRIGGER IF EXISTS `dm_provincia_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_provincia_before_delete` BEFORE DELETE ON `dm_provincia` FOR EACH ROW BEGIN

IF (SELECT COUNT(*) FROM dm_provincia WHERE ID_CCAA=OLD.ID_CCAA) =1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'PROVINCIA UNICA PARA LA CCAA CORRESPONDIENTE';
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_provincia_before_update
DROP TRIGGER IF EXISTS `dm_provincia_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_provincia_before_update` BEFORE UPDATE ON `dm_provincia` FOR EACH ROW BEGIN

IF (SELECT COUNT(*) FROM dm_provincia WHERE ID_CCAA=OLD.ID_CCAA) =1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'ES NECESARIO QUE LA COMUNIDAD AUTONOMA TENGA AL MEOS UNA PROVINCIA';
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_subfamilia_before_delete
DROP TRIGGER IF EXISTS `dm_subfamilia_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_subfamilia_before_delete` BEFORE DELETE ON `dm_subfamilia` FOR EACH ROW BEGIN

IF (SELECT COUNT(*) FROM dm_subfamilia WHERE ID_FAMILIA=OLD.ID_FAMILIA) =1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'UNICA SUBFAMILIA PARA LA FAMILIA CORRESPONDIENTE';
			
END IF;


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_subfamilia_before_update
DROP TRIGGER IF EXISTS `dm_subfamilia_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_subfamilia_before_update` BEFORE UPDATE ON `dm_subfamilia` FOR EACH ROW BEGIN


IF (SELECT COUNT(*) FROM dm_subfamilia WHERE ID_FAMILIA=OLD.ID_FAMILIA) =1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'UNICA SUBFAMILIA PARA LA FAMILIA CORRESPONDIENTE';
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_supervisor_before_insert
DROP TRIGGER IF EXISTS `dm_supervisor_before_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_supervisor_before_insert` BEFORE INSERT ON `dm_supervisor` FOR EACH ROW BEGIN

-- VERIFICAMOS TELEFONO 
IF NEW.TLF_EMPRESA NOT REGEXP '[0-9]{9}' 
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'TELEFONO NO VALIDO,';
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.dm_supervisor_before_update
DROP TRIGGER IF EXISTS `dm_supervisor_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `dm_supervisor_before_update` BEFORE UPDATE ON `dm_supervisor` FOR EACH ROW BEGIN

-- VERIFICAMOS TELEFONO 
IF NEW.TLF_EMPRESA NOT REGEXP '[0-9]{9}' 
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'TELEFONO NO VALIDO';
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.hc_tique_after_update
DROP TRIGGER IF EXISTS `hc_tique_after_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `hc_tique_after_update` AFTER UPDATE ON `hc_tique` FOR EACH ROW BEGIN
DECLARE num_compras INTEGER;

IF (SELECT COUNT(*) FROM hc_tique a WHERE  a.FEC_DIA  BETWEEN  date_add(NOW(),INTERVAL -365 DAY) AND NOW() AND a.ID_CLIENTE=NEW.ID_CLIENTE AND a.ID_CLIENTE!=0 AND a.IMPORTE_TOTAL>0) >=2
THEN

UPDATE dm_cliente b SET b.CATALOGO='SI' WHERE b.ID_CLIENTE=NEW.ID_CLIENTE AND b.ID_CLIENTE!=0;
END IF;


SELECT COUNT(*) INTO num_compras FROM hc_tique a WHERE  a.FEC_DIA  BETWEEN  date_add(NOW(),INTERVAL -730 DAY) AND NOW() AND a.ID_CLIENTE=NEW.ID_CLIENTE AND a.ID_CLIENTE!=0 AND a.IMPORTE_TOTAL>0;

    
IF num_compras <3
THEN UPDATE dm_cliente b SET b.CATEGORIA='BAJO CONSUMO'  WHERE b.ID_CLIENTE=NEW.ID_CLIENTE AND b.ID_CLIENTE!=0;
ELSEIF num_compras >=3 AND num_compras <6
THEN
UPDATE dm_cliente b SET b.CATEGORIA='ALTO POTENCIAL'  WHERE b.ID_CLIENTE=NEW.ID_CLIENTE AND b.ID_CLIENTE!=0;
ELSE 
UPDATE dm_cliente b SET b.CATEGORIA='FIDELIZADOS'  WHERE b.ID_CLIENTE=NEW.ID_CLIENTE AND b.ID_CLIENTE!=0;
END IF;  


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.hc_tique_before_insert
DROP TRIGGER IF EXISTS `hc_tique_before_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `hc_tique_before_insert` BEFORE INSERT ON `hc_tique` FOR EACH ROW BEGIN


SET NEW.ID_FRANJA = (SELECT id_franja_horaria FROM DM_FRANJA_HORARIA WHERE HOUR(NEW.fec_dia) BETWEEN hora_desde AND hora_hasta);

/*COMPROBAR QUE EL VENDEDOR ESTA EN ALTA*/
IF (SELECT FEC_BAJA_EMPLEADO FROM dm_empleado WHERE ID_EMPLEADO= NEW.ID_VENDEDOR AND FEC_BAJA_EMPLEADO IS NOT NULL)
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'NO SE PUEDE ASIGNAR ESE VENDEDOR PORQUE TIENE FECHA DE BAJA';
			
END IF;

/*COMPROBAR QUE EL CENTRO ESTÁ EN ALTA*/
IF (SELECT FEC_CIERRE_CENTRO FROM dm_centro WHERE ID_CENTRO= NEW.ID_CENTRO AND FEC_CIERRE_CENTRO IS NOT NULL)
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'NO SE PUEDE ASIGNAR ESE CENTRO PORQUE ESTA CERRADO';
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tfg.hc_tique_before_update
DROP TRIGGER IF EXISTS `hc_tique_before_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `hc_tique_before_update` BEFORE UPDATE ON `hc_tique` FOR EACH ROW BEGIN

-- VERIFICAMOS SI EXISTE MINIMO UNA LINEA POR TICKET 
IF (SELECT COUNT(*) FROM hc_linea_tique WHERE ID_TIQUE=OLD.ID_TIQUE) < 1
THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'ES NECESARIO INCLUIR AL MENOS UN PRODUCTO';
			
END IF;

/*INSERTA EL IMPORTE TOTAL DE FORMA AUTOMATICA*/
SET NEW.IMPORTE_TOTAL = (SELECT SUM(IMPORTE_LINEA) FROM hc_linea_tique WHERE ID_TIQUE=OLD.ID_TIQUE);

/*EL CLIENTE SE REACTIVA SI ESTABA DE BAJA Y HACE UNA COMPRA*/
IF (SELECT FEC_BAJA_CLIENTE FROM dm_cliente WHERE ID_CLIENTE= NEW.ID_CLIENTE AND FEC_BAJA_CLIENTE IS NOT NULL)
THEN
UPDATE dm_cliente SET FEC_BAJA_CLIENTE= NULL WHERE ID_CLIENTE=NEW.ID_CLIENTE;
			
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
