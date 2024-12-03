CREATE DATABASE  IF NOT EXISTS `polish_job_listings_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `polish_job_listings_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: polish_job_listings_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `job_information`
--

DROP TABLE IF EXISTS `job_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_information` (
  `job_title_id` int NOT NULL,
  `job_title` varchar(90) DEFAULT NULL,
  `experience_level_from` varchar(90) DEFAULT NULL,
  `if_permanent` varchar(90) DEFAULT NULL,
  `if_b2b` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`job_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_information`
--

LOCK TABLES `job_information` WRITE;
/*!40000 ALTER TABLE `job_information` DISABLE KEYS */;
INSERT INTO `job_information` VALUES (1,'Senior Frontend Software Engineer','senior','TRUE','TRUE'),(2,'Sr. Backend Engineer','senior','TRUE','TRUE'),(3,'Sr. Backend Engineer','senior','TRUE','TRUE'),(4,'Sr. Backend Engineer','senior','TRUE','TRUE'),(5,'Python Developer (4 days/week)','mid','FALSE','TRUE'),(6,'Python Developer (4 days/week)','mid','FALSE','TRUE'),(7,'Mid Full-stack Engineer (React/TypeScript)','mid','FALSE','TRUE'),(8,'Full-stack Engineer (React/TypeScript)','senior','FALSE','TRUE'),(9,'Senior/Regular Full-stack Engineer (React/TypeScript)','senior','FALSE','TRUE'),(10,'Senior iOS Engineer','senior','FALSE','TRUE'),(11,'Golang Developer','senior','TRUE','TRUE'),(12,'Mid/Senior Ad Banner Developer','senior','FALSE','TRUE'),(13,'Mid/Senior Creative Frontend Developer','senior','FALSE','TRUE'),(14,'Platform Engineer - AWS','mid','FALSE','TRUE'),(15,'Senior Backend Engineer','senior','FALSE','TRUE'),(16,'Senior Backend Engineer','senior','FALSE','TRUE'),(17,'Platform Engineer - AWS','mid','FALSE','TRUE'),(18,'Senior Elixir Backend Developer','senior','FALSE','TRUE'),(19,'ServiceNow Developer','mid','FALSE','TRUE'),(20,'Front-end developer (ReactJS)','senior','FALSE','TRUE'),(21,'Development Team Lead - EMEA Region','senior','FALSE','TRUE'),(22,'Senior Data Engineer (REMOTE)','senior','FALSE','TRUE'),(23,'Fullstack Software Engineer (REMOTE)','senior','FALSE','TRUE'),(24,'Senior Data Engineer (REMOTE)','senior','FALSE','TRUE'),(25,'Fullstack Software Engineer (REMOTE)','senior','FALSE','TRUE'),(26,'Python Developer','senior','FALSE','TRUE'),(27,'Python Developer','senior','FALSE','TRUE'),(28,'Python Developer','senior','FALSE','TRUE'),(29,'Web Developer','senior','FALSE','TRUE'),(30,'Head of Engineering','senior','FALSE','TRUE');
/*!40000 ALTER TABLE `job_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_location`
--

DROP TABLE IF EXISTS `job_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_location` (
  `location_id` int NOT NULL,
  `city` varchar(90) DEFAULT NULL,
  `country_code` varchar(90) DEFAULT NULL,
  `workplace_type` varchar(90) DEFAULT NULL,
  `job_title_id` int NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_job_location_job_information1_idx` (`job_title_id`),
  CONSTRAINT `fk_job_location_job_information1` FOREIGN KEY (`job_title_id`) REFERENCES `job_information` (`job_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_location`
--

LOCK TABLES `job_location` WRITE;
/*!40000 ALTER TABLE `job_location` DISABLE KEYS */;
INSERT INTO `job_location` VALUES (1,'London','GB','remote',1),(2,'Berlin','DE','remote',2),(3,'Katowice','PL','remote',3),(4,'London','GB','remote',4),(5,'BiaÃ…â€šystok','PL','remote',5),(6,'KrakÃƒÂ³w','PL','remote',6),(7,'Warszawa','PL','remote',7),(8,'Berlin','DE','remote',8),(9,'London','GB','remote',9),(10,'Londyn','GB','remote',10),(11,'London','GB','remote',11),(12,'Amsterdam','NL','remote',12),(13,'London','GB','remote',13),(14,'London','GB','remote',14),(15,'London','GB','remote',15),(16,'Warszawa','PL','remote',16),(17,'Warszawa','PL','remote',17),(18,'Warszawa','PL','remote',18),(19,'Zug','CH','remote',19),(20,'Warszawa','PL','remote',20),(21,'London','GB','remote',21),(22,'Warszawa','PL','remote',22),(23,'Warszawa','PL','remote',23),(24,'Warszawa','PL','remote',24),(25,'Warszawa','PL','remote',25),(26,'WrocÃ…â€šaw','PL','remote',26),(27,'Southampton','GB','partly_remote',27),(28,'Warszawa','PL','remote',28),(29,'Amsterdam','NL','remote',29),(30,'London','GB','remote',30);
/*!40000 ALTER TABLE `job_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_salary`
--

DROP TABLE IF EXISTS `job_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_salary` (
  `job_title_id` int NOT NULL,
  `salary_id` int NOT NULL,
  KEY `fk_job_salary_job_information1_idx` (`job_title_id`),
  KEY `fk_job_salary_salary1_idx` (`salary_id`),
  CONSTRAINT `fk_job_salary_job_information1` FOREIGN KEY (`job_title_id`) REFERENCES `job_information` (`job_title_id`),
  CONSTRAINT `fk_job_salary_salary1` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_salary`
--

LOCK TABLES `job_salary` WRITE;
/*!40000 ALTER TABLE `job_salary` DISABLE KEYS */;
INSERT INTO `job_salary` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `job_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_skills`
--

DROP TABLE IF EXISTS `job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_skills` (
  `job_title_id` int NOT NULL,
  `skill_name_id` int NOT NULL,
  KEY `fk_job_skills_job_information1_idx` (`job_title_id`),
  KEY `fk_job_skills_skills1_idx` (`skill_name_id`),
  CONSTRAINT `fk_job_skills_job_information1` FOREIGN KEY (`job_title_id`) REFERENCES `job_information` (`job_title_id`),
  CONSTRAINT `fk_job_skills_skills1` FOREIGN KEY (`skill_name_id`) REFERENCES `skills` (`skill_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_skills`
--

LOCK TABLES `job_skills` WRITE;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
INSERT INTO `job_skills` VALUES (1,1),(1,9),(1,25),(2,2),(2,10),(2,7),(3,1),(3,10),(3,7),(4,1),(4,10),(4,7),(5,3),(5,11),(5,12),(6,3),(6,11),(6,12),(7,4),(7,9),(7,1),(8,4),(8,9),(8,1),(9,4),(9,9),(9,1),(10,5),(10,30),(10,14);
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL,
  `salary_to_b2b` varchar(90) DEFAULT NULL,
  `salary_to_permanent` varchar(90) DEFAULT NULL,
  `salary_from_b2b` varchar(90) DEFAULT NULL,
  `salary_from_permanent` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'47136.3871','47136.3871','32996.60215','32996.60215'),(2,'46409.16243','46409.16243','32487.52743','32487.52743'),(3,'44837.66003','44837.66003','31387.43804','31387.43804'),(4,'45150.84589','45150.84589','31606.67566','31606.67566'),(5,'17489.25658','0','13116.94244','0'),(6,'17307.01511','0','12980.26133','0'),(7,'24786.87658','0','16524.58439','0'),(8,'27562.03438','0','16537.22063','0'),(9,'27461.60584','0','16476.9635','0'),(10,'57989.30291','0','43630.04695','0'),(11,'38659.53527','38659.53527','22091.16301','22091.16301'),(12,'16456.8563','0','16456.8563','0'),(13,'23060.9966','0','20315.63986','0'),(14,'36726.55851','0','25680.977','0'),(15,'35345.86082','0','25680.977','0'),(16,'35345.86082','0','25680.977','0'),(17,'36726.55851','0','25680.977','0'),(18,'48972.41826','0','42294.60406','0'),(19,'23753.04754','0','11876.52377','0'),(20,'22091.16301','0','17672.93041','0'),(21,'38023.74059','0','31505.38506','0'),(22,'38648.52742','0','30366.70011','0'),(23,'38648.52742','0','30366.70011','0'),(24,'39591.39785','0','31107.52688','0'),(25,'39591.39785','0','31107.52688','0'),(26,'78502.32066','0','42054.81464','0'),(27,'78502.32066','0','42054.81464','0'),(28,'77961.15598','0','41764.90499','0'),(29,'31234.99346','0','26772.85154','0'),(30,'29590.48838','0','24210.39959','0');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_currency`
--

DROP TABLE IF EXISTS `salary_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_currency` (
  `currency_id` int NOT NULL,
  `b2b_salary_currency` varchar(90) DEFAULT NULL,
  `permanent_salary_currency` varchar(90) DEFAULT NULL,
  `job_title_id` int NOT NULL,
  PRIMARY KEY (`currency_id`),
  KEY `fk_salary_currency_job_information1_idx` (`job_title_id`),
  CONSTRAINT `fk_salary_currency_job_information1` FOREIGN KEY (`job_title_id`) REFERENCES `job_information` (`job_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_currency`
--

LOCK TABLES `salary_currency` WRITE;
/*!40000 ALTER TABLE `salary_currency` DISABLE KEYS */;
INSERT INTO `salary_currency` VALUES (1,'gbp','gbp',1),(2,'gbp','gbp',2),(3,'gbp','gbp',3),(4,'gbp','gbp',4),(5,'gbp','unknown',5),(6,'gbp','unknown',6),(7,'gbp','unknown',7),(8,'gbp','unknown',8),(9,'gbp','unknown',9),(10,'gbp','unknown',10),(11,'gbp','gbp',11),(12,'gbp','unknown',12),(13,'gbp','unknown',13),(14,'gbp','unknown',14),(15,'gbp','unknown',15),(16,'gbp','unknown',16),(17,'gbp','unknown',17),(18,'gbp','unknown',18),(19,'chf','unknown',19),(20,'gbp','unknown',20),(21,'gbp','unknown',21),(22,'gbp','unknown',22),(23,'gbp','unknown',23),(24,'gbp','unknown',24),(25,'gbp','unknown',25),(26,'gbp','unknown',26),(27,'gbp','unknown',27),(28,'gbp','unknown',28),(29,'gbp','unknown',29),(30,'gbp','unknown',30);
/*!40000 ALTER TABLE `salary_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_name_id` int NOT NULL,
  `skill_name` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`skill_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'React'),(2,'Kotlin'),(3,'Flask'),(4,'Node.js'),(5,'Mobile'),(6,'Go'),(7,'Javascript'),(8,'Terraform'),(9,'Typescript'),(10,'Backend'),(11,'English'),(12,'Python'),(13,'Amazon AWS'),(14,'Swift'),(15,'Jira'),(16,'CSS'),(17,'API'),(18,'ETL'),(19,'Three.js'),(20,'Pandas'),(21,'Testing'),(22,'Azure'),(23,'ServiceNode'),(24,'ReactJS'),(25,'unknown'),(26,'Next.js'),(27,'CI/CD'),(28,'Angular'),(29,'Core Data '),(30,'iOS');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-08 16:38:44
