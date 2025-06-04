-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: tallermecanicodb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','juan.perez@example.com','600123456'),(2,'Ana García','ana.garcia@example.com','611234567'),(3,'Luis Torres','luis.torres@example.com','622345678');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Carlos López','Motor'),(2,'Sofía Ruiz','Electricidad'),(3,'Mario Fernández','Suspensión');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuesto`
--

DROP TABLE IF EXISTS `repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuesto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
INSERT INTO `repuesto` VALUES (1,'Filtro de aceite','Bosch',15.50),(2,'Batería','Varta',89.90),(3,'Pastillas de freno','Brembo',45.00);
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `detalle` text,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `vehiculo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'2024-05-01','Cambio de aceite y revisión general',80.00,1),(2,'2024-05-15','Cambio de batería',100.00,2),(3,'2024-05-20','Cambio de pastillas de freno',120.00,3);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_mecanico`
--

DROP TABLE IF EXISTS `servicio_mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_mecanico` (
  `servicio_id` int NOT NULL,
  `mecanico_id` int NOT NULL,
  PRIMARY KEY (`servicio_id`,`mecanico_id`),
  KEY `mecanico_id` (`mecanico_id`),
  CONSTRAINT `servicio_mecanico_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`),
  CONSTRAINT `servicio_mecanico_ibfk_2` FOREIGN KEY (`mecanico_id`) REFERENCES `mecanico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_mecanico`
--

LOCK TABLES `servicio_mecanico` WRITE;
/*!40000 ALTER TABLE `servicio_mecanico` DISABLE KEYS */;
INSERT INTO `servicio_mecanico` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `servicio_mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_repuesto`
--

DROP TABLE IF EXISTS `servicio_repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_repuesto` (
  `servicio_id` int NOT NULL,
  `repuesto_id` int NOT NULL,
  `cantidad_utilizada` int NOT NULL,
  PRIMARY KEY (`servicio_id`,`repuesto_id`),
  KEY `repuesto_id` (`repuesto_id`),
  CONSTRAINT `servicio_repuesto_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`),
  CONSTRAINT `servicio_repuesto_ibfk_2` FOREIGN KEY (`repuesto_id`) REFERENCES `repuesto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_repuesto`
--

LOCK TABLES `servicio_repuesto` WRITE;
/*!40000 ALTER TABLE `servicio_repuesto` DISABLE KEYS */;
INSERT INTO `servicio_repuesto` VALUES (1,1,1),(2,2,1),(3,3,2);
/*!40000 ALTER TABLE `servicio_repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `anio` int DEFAULT NULL,
  `patente` varchar(20) NOT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patente` (`patente`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'Toyota','Corolla',2015,'ABC123',1),(2,'Ford','Focus',2018,'XYZ789',2),(3,'Renault','Clio',2020,'JKL456',3);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tallermecanicodb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-04 18:55:53
