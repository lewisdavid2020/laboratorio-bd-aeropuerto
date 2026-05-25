-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_lewis_delarosa_aeropuerto
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea` (
  `codigo_aerolinea` int NOT NULL AUTO_INCREMENT,
  `nombre_aerolinea` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto` (
  `codigo_aeropuerto` int NOT NULL AUTO_INCREMENT,
  `nombre_aeropuerto` varchar(100) NOT NULL,
  `codigo_ciudad` int DEFAULT NULL,
  PRIMARY KEY (`codigo_aeropuerto`),
  KEY `idx_aeropuerto_ciudad` (`codigo_ciudad`),
  CONSTRAINT `aeropuerto_ibfk_1` FOREIGN KEY (`codigo_ciudad`) REFERENCES `ciudad` (`codigo_ciudad`),
  CONSTRAINT `fk_aeropuerto_ciudad` FOREIGN KEY (`codigo_ciudad`) REFERENCES `ciudad` (`codigo_ciudad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `codigo_ciudad` int NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(100) NOT NULL,
  `codigo_pais` int DEFAULT NULL,
  PRIMARY KEY (`codigo_ciudad`),
  KEY `idx_ciudad_pais` (`codigo_pais`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`codigo_pais`) REFERENCES `pais` (`codigo_pais`),
  CONSTRAINT `fk_ciudad_pais` FOREIGN KEY (`codigo_pais`) REFERENCES `pais` (`codigo_pais`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `codigo_pais` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `codigo_vuelo` int NOT NULL AUTO_INCREMENT,
  `origen` int DEFAULT NULL,
  `destino` int DEFAULT NULL,
  `codigo_aerolinea` int DEFAULT NULL,
  `fecha_vuelo` date DEFAULT NULL,
  PRIMARY KEY (`codigo_vuelo`),
  KEY `idx_vuelo_origen` (`origen`),
  KEY `idx_vuelo_destino` (`destino`),
  KEY `idx_vuelo_aerolinea` (`codigo_aerolinea`),
  CONSTRAINT `fk_vuelo_aerolinea` FOREIGN KEY (`codigo_aerolinea`) REFERENCES `aerolinea` (`codigo_aerolinea`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vuelo_destino` FOREIGN KEY (`destino`) REFERENCES `aeropuerto` (`codigo_aeropuerto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vuelo_origen` FOREIGN KEY (`origen`) REFERENCES `aeropuerto` (`codigo_aeropuerto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `aeropuerto` (`codigo_aeropuerto`),
  CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `aeropuerto` (`codigo_aeropuerto`),
  CONSTRAINT `vuelo_ibfk_3` FOREIGN KEY (`codigo_aerolinea`) REFERENCES `aerolinea` (`codigo_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 12:59:23
