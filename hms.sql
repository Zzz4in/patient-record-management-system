CREATE DATABASE  IF NOT EXISTS `hms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hms`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hms
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Ali Hassan','House 12, Gulshan-e-Iqbal, Karachi','0300-1111111','2026-01-15'),(2,'Zara Sheikh','Flat 4, Clifton, Karachi','0321-2222222','2026-03-22'),(3,'Ahmed Farooq','Street 7, DHA Phase 5, Karachi','0351-6728294','2026-05-10'),(4,'Hina Baig','House 45, Model Colony, Lahore','0333-4444444','2025-11-30'),(5,'Bilal Chaudhry','Block B, North Nazimabad, Karachi','0345-5555555','2026-07-08'),(6,'Amna Tariq','Sector 11, F-8, Islamabad','0301-6666666','2026-08-19'),(7,'Hamza Iqbal','House 9, Johar Town, Lahore','0322-7777777','2026-09-25'),(8,'Sara Khan',NULL,'0331-3245672',NULL),(11,'Ahmed Zafar',NULL,'0312-3456782',NULL),(14,'Khalid Sheikh',NULL,'03142257821',NULL),(17,'Oman Feroz',NULL,'0315-2612345',NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physician`
--

DROP TABLE IF EXISTS `physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physician` (
  `physician_id` int NOT NULL AUTO_INCREMENT,
  `physician_name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `charges_per_visit` double DEFAULT NULL,
  PRIMARY KEY (`physician_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physician`
--

LOCK TABLES `physician` WRITE;
/*!40000 ALTER TABLE `physician` DISABLE KEYS */;
INSERT INTO `physician` VALUES (1,'Dr. Ahmed Raza','0300-1234567','Cardiology',3000),(2,'Dr. Sana Malik','0321-2345678','Dermatology',2000),(3,'Dr. Bilal Hussain','0333-3456789','Cardiology',3500),(4,'Dr. Ayesha Khan','0345-4567890','Pediatrics',1500),(5,'Dr. Imran Siddiqui','0301-5678901','Orthopedics',2500),(6,'Dr. Fatima Noor','0322-6789012','Pediatrics',1800),(7,'Dr. Usman Ali','0334-7890123','General Medicine',1000);
/*!40000 ALTER TABLE `physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `packing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (301,'Panadol','500mg','GSK',120,'Strip'),(302,'Augmentin','625mg','GSK',650,'Strip'),(303,'Brufen','400mg','Abbott',180,'Strip'),(304,'Calpol','120mg','GSK',250,'Bottle'),(305,'Disprin','500mg','Reckitt',60,'Strip'),(306,'Risek','40mg','Getz Pharma',450,'Capsule Pack'),(307,'Flagyl','400mg','Sanofi',300,'Strip');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_medicines`
--

DROP TABLE IF EXISTS `treatment_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_medicines` (
  `treatment_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`treatment_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `treatment_medicines_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `prescription` (`product_id`),
  CONSTRAINT `treatment_medicines_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_medicines`
--

LOCK TABLES `treatment_medicines` WRITE;
/*!40000 ALTER TABLE `treatment_medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `treatment_date` date DEFAULT NULL,
  `symptoms` varchar(50) DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `physician_id` int DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `physician_id` (`physician_id`),
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `physician_id` FOREIGN KEY (`physician_id`) REFERENCES `physician` (`physician_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (1,'ECG and blood pressure check','2026-09-02','chest pain, shortness of breath',NULL,NULL),(2,'Antibiotic course','2026-09-05','fever, sore throat',NULL,NULL),(3,'Skin allergy treatment','2026-09-05','rash, itching',NULL,NULL),(4,'Physiotherapy session','2026-09-12','back pain, stiffness',NULL,NULL),(5,'Vaccination','2026-09-18','none, routine',NULL,NULL),(6,'Antibiotic course','2026-09-25','high fever, cough',NULL,NULL),(7,'Fracture cast','2026-10-01','swelling, wrist pain',NULL,NULL);
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-08 15:51:10
