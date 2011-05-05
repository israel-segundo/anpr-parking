-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: bcba_parking_lot
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `car_model_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `discount` bit(1) NOT NULL,
  `last_updated` datetime NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK17FD48B3ADBBF` (`car_model_id`),
  KEY `FK17FD4D8F97328` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `maker_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE99FAEFEFF6533EC` (`maker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model`
--

LOCK TABLES `car_model` WRITE;
/*!40000 ALTER TABLE `car_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `government_car`
--

DROP TABLE IF EXISTS `government_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `government_car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `car_model_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `discount` bit(1) NOT NULL,
  `last_updated` datetime NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEF3EA8868B3ADBBF` (`car_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `government_car`
--

LOCK TABLES `government_car` WRITE;
/*!40000 ALTER TABLE `government_car` DISABLE KEYS */;
/*!40000 ALTER TABLE `government_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_car`
--

DROP TABLE IF EXISTS `green_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `green_car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `car_model_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7B3844988B3ADBBF` (`car_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_car`
--

LOCK TABLES `green_car` WRITE;
/*!40000 ALTER TABLE `green_car` DISABLE KEYS */;
/*!40000 ALTER TABLE `green_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maker`
--

DROP TABLE IF EXISTS `maker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maker`
--

LOCK TABLES `maker` WRITE;
/*!40000 ALTER TABLE `maker` DISABLE KEYS */;
/*!40000 ALTER TABLE `maker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_record`
--

DROP TABLE IF EXISTS `parking_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `discount` bit(1) NOT NULL,
  `entrance_date` datetime NOT NULL,
  `exit_date` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_record`
--

LOCK TABLES `parking_record` WRITE;
/*!40000 ALTER TABLE `parking_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `parking_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-04 20:48:08
