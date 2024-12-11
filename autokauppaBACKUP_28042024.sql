-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: autokauppa
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Current Database: `autokauppa`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `autokauppa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `autokauppa`;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `auto_id` int NOT NULL AUTO_INCREMENT,
  `toimipiste_id` int NOT NULL,
  `rekisterinumero` varchar(45) DEFAULT NULL,
  `merkki` varchar(45) NOT NULL,
  `malli` varchar(45) NOT NULL,
  `vuosimalli` int NOT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `idx_auto_toimipiste_idx` (`toimipiste_id`),
  CONSTRAINT `idx_auto_toimipiste` FOREIGN KEY (`toimipiste_id`) REFERENCES `toimipiste` (`toimipiste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,1,'ABC-123','Toyota','Corolla',2015),(2,1,'DEF-456','Volkswagen','Golf',2017),(3,1,'GHI-789','Ford','Focus',2018),(4,2,'JKL-012','Honda','Civic',2016),(5,2,'MNO-345','Volvo','S60',2019),(6,2,'PQR-678','Toyota','Camry',2015),(7,2,'STU-901','Volkswagen','Polo',2017),(8,2,'VWX-234','Ford','Fiesta',2018),(9,2,'YZA-567','Honda','Accord',2016),(10,2,'BCD-890','Volvo','V40',2019),(11,3,'EFG-123','Toyota','Yaris',2015),(12,3,'HIJ-456','Volkswagen','Passat',2017),(13,3,'KLM-789','Ford','Mustang',2018),(14,3,'NOP-012','Honda','Jazz',2016),(15,3,'QRS-345','Volvo','XC60',2019),(16,1,'XYZ-101','Toyota','Corolla',2020),(17,1,'XYZ-102','Audi','A4',2018),(18,2,'XYZ-103','BMW','320i',2019),(19,2,'XYZ-104','Mercedes-Benz','C-Class',2020),(20,3,'XYZ-105','Volkswagen','Golf',2021),(21,3,'XYZ-106','Volvo','V60',2019);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myyja`
--

DROP TABLE IF EXISTS `myyja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myyja` (
  `myyja_id` int NOT NULL AUTO_INCREMENT,
  `toimipiste_id` int NOT NULL,
  `nimi` varchar(50) NOT NULL,
  PRIMARY KEY (`myyja_id`),
  KEY `idx_myyja_toimipiste_idx` (`toimipiste_id`),
  CONSTRAINT `idx_myyja_toimipiste` FOREIGN KEY (`toimipiste_id`) REFERENCES `toimipiste` (`toimipiste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myyja`
--

LOCK TABLES `myyja` WRITE;
/*!40000 ALTER TABLE `myyja` DISABLE KEYS */;
INSERT INTO `myyja` VALUES (1,1,'Matti Meikäläinen'),(2,1,'Liisa Virtanen'),(3,2,'Juha Korhonen'),(4,2,'Sanna Koskinen'),(5,2,'Antti Järvinen'),(6,3,'Kaisa Laine'),(7,3,'Timo Mäkinen');
/*!40000 ALTER TABLE `myyja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myynti`
--

DROP TABLE IF EXISTS `myynti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myynti` (
  `myynti_id` int NOT NULL AUTO_INCREMENT,
  `auto_id` int NOT NULL,
  `myyja_id` int NOT NULL,
  `myyntihinta` decimal(10,0) NOT NULL,
  `myynti_pvm` date NOT NULL,
  PRIMARY KEY (`myynti_id`),
  KEY `idx_myynti_auto_idx` (`auto_id`),
  KEY `idx_myynti_myyja_idx` (`myyja_id`),
  CONSTRAINT `idx_myynti_auto` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`),
  CONSTRAINT `idx_myynti_myyja` FOREIGN KEY (`myyja_id`) REFERENCES `myyja` (`myyja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myynti`
--

LOCK TABLES `myynti` WRITE;
/*!40000 ALTER TABLE `myynti` DISABLE KEYS */;
INSERT INTO `myynti` VALUES (1,1,1,20000,'2024-04-01'),(2,5,2,22000,'2024-04-02'),(3,3,2,21000,'2024-04-03'),(4,7,3,19500,'2024-04-04'),(5,2,4,23000,'2024-04-05'),(6,11,5,24000,'2024-04-06');
/*!40000 ALTER TABLE `myynti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osto`
--

DROP TABLE IF EXISTS `osto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osto` (
  `osto_id` int NOT NULL AUTO_INCREMENT,
  `auto_id` int NOT NULL,
  `ostohinta` decimal(10,0) NOT NULL,
  `osto_pvm` date NOT NULL,
  PRIMARY KEY (`osto_id`),
  KEY `idx_auto_osto_idx` (`auto_id`),
  CONSTRAINT `idx_auto_osto` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osto`
--

LOCK TABLES `osto` WRITE;
/*!40000 ALTER TABLE `osto` DISABLE KEYS */;
INSERT INTO `osto` VALUES (1,1,15000,'2024-01-15'),(2,2,17000,'2024-01-16'),(3,3,16000,'2024-01-17'),(4,4,14000,'2024-01-18'),(5,5,18000,'2024-01-19'),(6,6,15000,'2024-01-20'),(7,7,17000,'2024-01-21'),(8,8,16000,'2024-01-22'),(9,9,14000,'2024-01-23'),(10,10,18000,'2024-01-24'),(11,11,15000,'2024-01-25'),(12,12,17000,'2024-01-26'),(13,13,16000,'2024-01-27'),(14,14,14000,'2024-01-28'),(15,15,18000,'2024-01-29'),(16,11,18000,'2022-04-01'),(17,12,25000,'2022-05-01'),(18,13,22000,'2022-06-01'),(19,14,27000,'2022-07-01'),(20,15,23000,'2022-08-01'),(21,16,26000,'2022-09-01');
/*!40000 ALTER TABLE `osto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toimipiste`
--

DROP TABLE IF EXISTS `toimipiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toimipiste` (
  `toimipiste_id` int NOT NULL AUTO_INCREMENT,
  `nimi` varchar(50) NOT NULL,
  `osoite` varchar(50) NOT NULL,
  PRIMARY KEY (`toimipiste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toimipiste`
--

LOCK TABLES `toimipiste` WRITE;
/*!40000 ALTER TABLE `toimipiste` DISABLE KEYS */;
INSERT INTO `toimipiste` VALUES (1,'Turun Biili','Hämeenkatu 2'),(2,'Salon Menopelit','Kärrytie 4'),(3,'Stadin Kaara','Mannerheimintie 1');
/*!40000 ALTER TABLE `toimipiste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28 16:29:40
