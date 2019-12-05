-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: online_test
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `aid` int(11) NOT NULL,
  `text` varchar(45) NOT NULL,
  `correct` varchar(45) NOT NULL,
  `qid` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,'log n','1',6),(2,'n^2','0',6),(3,'n','0',6),(4,'(log n)^3','0',3),(5,'(log n^2)','0',3),(6,'n^3','0',11),(7,'n','0',11),(10,'nlog n','1',3),(11,'n log n','1',11),(12,'4','1',12),(13,'5','0',12),(14,'6','0',12),(15,'9','0',12),(16,'2*2','1',12);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `qid` int(11) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (3,'Complexty of Quick sort?'),(6,'Complexty of Binary Search?'),(11,'Complexty of Merge Sort?'),(12,'2*2');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `CV` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'1234','','',NULL,NULL),(2,'4321','','',NULL,NULL),(3,'5432','','',NULL,NULL),(4,'2222','','',NULL,NULL),(5,'1111','','',NULL,NULL),(6,'1111','','',NULL,NULL),(7,'7','','',NULL,NULL),(8,'8','','',NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_answer`
--

DROP TABLE IF EXISTS `student_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_answer` (
  `sid` int(11) NOT NULL,
  `qid` int(11) DEFAULT NULL,
  `answerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_answer`
--

LOCK TABLES `student_answer` WRITE;
/*!40000 ALTER TABLE `student_answer` DISABLE KEYS */;
INSERT INTO `student_answer` VALUES (1,11,6),(1,11,7),(1,11,11),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(1,6,1),(1,6,2),(1,6,3),(1,11,6),(1,11,7),(1,11,11),(1,3,4),(1,3,5),(1,3,10),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,11,6),(1,11,7),(1,11,11),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,11,6),(1,11,7),(1,11,11),(1,3,4),(1,3,5),(1,3,10),(1,11,6),(1,11,7),(1,11,11),(1,11,6),(1,11,7),(1,11,11),(1,3,4),(1,3,5),(1,3,10),(1,11,6),(1,11,7),(1,11,11),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(1,11,6),(1,11,7),(1,11,11),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(1,11,6),(1,11,7),(1,11,11),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,11,6),(1,11,7),(1,11,11),(1,6,1),(1,6,2),(1,6,3),(1,6,1),(1,6,2),(1,6,3),(1,3,4),(1,3,5),(1,3,10),(1,3,4),(1,3,5),(1,3,10),(2,6,1),(2,6,2),(2,6,3),(2,3,4),(2,3,5),(2,3,10),(2,3,4),(2,3,5),(2,3,10),(2,11,6),(2,11,7),(2,11,11),(2,11,6),(2,11,7),(2,11,11),(2,11,6),(2,11,7),(2,11,11),(4,3,4),(4,3,5),(4,3,10),(3,11,6),(3,11,7),(3,11,11),(5,11,6),(5,11,7),(5,11,11),(5,3,4),(5,3,5),(5,3,10),(5,3,4),(5,3,5),(5,3,10),(5,6,1),(5,6,2),(5,6,3),(6,6,3),(6,6,2),(6,6,1),(6,3,5),(6,3,10),(6,3,4),(6,6,3),(6,6,1),(6,6,2),(6,6,2),(6,6,3),(6,6,1),(6,11,6),(6,11,7),(6,11,11),(6,11,11),(6,11,6),(6,11,7),(6,12,16),(6,12,12),(6,12,13),(6,3,10),(6,3,4),(6,3,5),(6,12,16),(6,12,14),(6,12,12),(6,11,7),(6,11,6),(6,11,11),(6,11,7),(6,11,6),(6,11,11),(6,12,16),(6,12,12),(6,12,13),(7,12,15),(7,12,14),(7,12,16),(7,6,3),(7,6,2),(7,6,1),(7,11,6),(7,11,7),(7,11,11),(7,12,13),(7,12,14),(7,12,16),(7,6,3),(7,6,2),(7,6,1),(7,11,7),(7,11,6),(7,11,11),(7,6,2),(7,6,3),(7,6,1),(7,12,14),(7,12,13),(7,12,12),(8,3,4),(8,3,5),(8,3,10),(8,11,6),(8,11,7),(8,11,11),(8,6,2),(8,6,3),(8,6,1),(8,11,7),(8,11,6),(8,11,11);
/*!40000 ALTER TABLE `student_answer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05 13:43:55
