CREATE DATABASE  IF NOT EXISTS `p12_pg_explorer` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `p12_pg_explorer`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: pg_explorer
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `adharcard_number` varchar(12) NOT NULL,
  `dob` date NOT NULL,
  `type` enum('Student','Other') NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `adharcard_number` (`adharcard_number`),
  KEY `uid` (`uid`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite` (
  `Favourite_id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `pg_id` int DEFAULT NULL,
  `mess_id` int DEFAULT NULL,
  PRIMARY KEY (`Favourite_id`),
  KEY `uid` (`uid`),
  KEY `pg_id` (`pg_id`),
  KEY `mess_id` (`mess_id`),
  CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`pg_id`) REFERENCES `pg` (`pg_id`),
  CONSTRAINT `favourite_ibfk_3` FOREIGN KEY (`mess_id`) REFERENCES `mess` (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `feedback_description` text NOT NULL,
  `ratings` enum('1','2','3','4','5') NOT NULL,
  `uid` int DEFAULT NULL,
  `pg_id` int DEFAULT NULL,
  `mess_id` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `uid` (`uid`),
  KEY `pg_id` (`pg_id`),
  KEY `mess_id` (`mess_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`pg_id`) REFERENCES `pg` (`pg_id`),
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`mess_id`) REFERENCES `mess` (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mess`
--

DROP TABLE IF EXISTS `mess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mess` (
  `mess_id` int NOT NULL AUTO_INCREMENT,
  `mess_name` varchar(100) NOT NULL,
  `mess_address` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `mess_type` enum('Veg','Non_Veg','Both') NOT NULL,
  `pricing` decimal(7,2) NOT NULL,
  `oid` int DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  PRIMARY KEY (`mess_id`),
  KEY `oid` (`oid`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `mess_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `owner` (`oid`),
  CONSTRAINT `mess_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `adharcard_number` varchar(12) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `type` enum('PG_OWNER','MESS_OWNER') NOT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `adharcard_number` (`adharcard_number`),
  KEY `uid` (`uid`),
  CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pg`
--

DROP TABLE IF EXISTS `pg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pg` (
  `pg_id` int NOT NULL AUTO_INCREMENT,
  `pg_name` varchar(100) NOT NULL,
  `pg_address` varchar(200) NOT NULL,
  `pricing` decimal(7,2) NOT NULL,
  `description` text NOT NULL,
  `wifi` enum('Yes','No') DEFAULT NULL,
  `ac` enum('Yes','No') DEFAULT NULL,
  `laundry` enum('Yes','No') DEFAULT NULL,
  `oid` int DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  PRIMARY KEY (`pg_id`),
  KEY `oid` (`oid`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `pg_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `owner` (`oid`),
  CONSTRAINT `pg_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `search_id` int NOT NULL AUTO_INCREMENT,
  `search_criteria` text NOT NULL,
  `cid` int DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  KEY `cid` (`cid`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `search_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `search_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `rid` (`rid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
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

-- Dump completed on 2025-01-03 12:26:34
