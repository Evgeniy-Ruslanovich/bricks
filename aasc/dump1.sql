CREATE DATABASE  IF NOT EXISTS `aasc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aasc`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: aasc
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
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `branch_name_en` varchar(127) DEFAULT NULL,
  `branch_name_rus` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,NULL,'Крупный рогатый скот'),(2,NULL,'свиноводство'),(3,NULL,'овцеводство'),(4,NULL,'птицеводство'),(5,NULL,'оленеводство'),(6,NULL,'козоводство'),(7,NULL,'звероводство'),(8,NULL,'коневодство'),(9,NULL,'птицеводство'),(10,NULL,'верблюдоводство'),(11,NULL,'рыбоводство'),(12,NULL,'рыболовство'),(13,NULL,'пчеловодство'),(14,NULL,'другое');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `country_short_name` varchar(3) NOT NULL,
  `country_fullname_rus` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'rus','Российская Федерация'),(2,'ua','Украина'),(3,'bel','Беларусь'),(4,'kz','Казахстан'),(5,'tdj','Таджикистан'),(6,'uzb','Узбекистан'),(7,'trk','Туркмения'),(8,'kyr','Кыргызстан');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` smallint(6) unsigned NOT NULL,
  `time_id` smallint(6) unsigned NOT NULL,
  `value` decimal(12,2) unsigned NOT NULL,
  `indicator_id` smallint(6) unsigned NOT NULL,
  `sector_id` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_data_location_idx` (`location_id`),
  KEY `fk_data_sector_idx` (`sector_id`),
  KEY `fk_data_indicator_idx` (`indicator_id`),
  KEY `fk_data_times_idx` (`time_id`),
  CONSTRAINT `fk_data_indicator` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_sector` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_times` FOREIGN KEY (`time_id`) REFERENCES `times` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,1,1,456.00,1,1),(2,1,1,756.00,2,1),(3,1,1,120.00,3,1),(4,1,1,987.00,4,1),(5,1,1,789.00,5,1),(6,1,1,654.00,6,1),(7,1,1,1523.00,7,1),(8,1,1,852.00,8,1),(9,1,1,147.00,9,1),(10,1,1,93.00,10,1),(11,1,1,258.00,11,1),(12,1,1,741.00,12,1),(13,1,1,258.00,13,1),(14,1,1,963.00,14,1),(15,1,1,39.00,15,1),(16,1,1,258.00,16,1),(17,1,1,288.00,17,1),(18,1,1,741.00,18,1),(19,1,1,17.00,19,1),(20,1,1,258.00,20,1),(21,1,1,39.00,21,1),(22,1,1,963.00,22,1),(23,1,1,852.00,23,1),(24,1,1,741.00,24,1),(25,1,1,987.00,25,1),(26,1,1,654.00,26,1),(27,1,1,654.00,27,1),(28,1,1,321.00,28,1),(29,1,1,31.00,29,1),(30,1,1,654.00,30,1),(31,1,1,987.00,31,1),(32,1,1,654.00,32,1),(33,1,1,32.00,33,1),(34,1,1,32.00,34,1),(35,1,1,321.00,35,1),(36,1,1,123.00,36,1),(37,1,1,456.00,37,1),(38,1,1,789.00,38,1),(39,1,2,454.00,1,1),(40,1,2,753.00,2,1),(41,1,2,115.00,3,1),(42,1,2,987.00,4,1),(43,1,2,789.00,5,1),(44,1,2,654.00,6,1),(45,1,2,1523.00,7,1),(46,1,2,852.00,8,1),(47,1,2,147.00,9,1),(48,1,2,93.00,10,1),(49,1,2,258.00,11,1),(50,1,2,741.00,12,1),(51,1,2,258.00,13,1),(52,1,2,963.00,14,1),(53,1,2,39.00,15,1),(54,1,2,258.00,16,1),(55,1,2,288.00,17,1),(56,1,2,741.00,18,1),(57,1,2,17.00,19,1),(58,1,2,258.00,20,1),(59,1,2,39.00,21,1),(60,1,2,963.00,22,1),(61,1,2,852.00,23,1),(62,1,2,741.00,24,1),(63,1,2,987.00,25,1),(64,1,2,654.00,26,1),(65,1,2,654.00,27,1),(66,1,2,321.00,28,1),(67,1,2,31.00,29,1),(68,1,2,654.00,30,1),(69,1,2,987.00,31,1),(70,1,2,654.00,32,1),(71,1,2,32.00,33,1),(72,1,2,32.00,34,1),(73,1,2,321.00,35,1),(74,1,2,123.00,36,1),(75,1,2,456.00,37,1),(76,1,2,789.00,38,1),(77,1,3,486.00,1,1),(78,1,3,786.00,2,1),(79,1,3,116.00,3,1),(80,1,3,987.00,4,1),(81,1,3,789.00,5,1),(82,1,3,654.00,6,1),(83,1,3,1523.00,7,1),(84,1,3,852.00,8,1),(85,1,3,147.00,9,1),(86,1,3,93.00,10,1),(87,1,3,258.00,11,1),(88,1,3,741.00,12,1),(89,1,3,258.00,13,1),(90,1,3,963.00,14,1),(91,1,3,39.00,15,1),(92,1,3,258.00,16,1),(93,1,3,288.00,17,1),(94,1,3,741.00,18,1),(95,1,3,17.00,19,1),(96,1,3,258.00,20,1),(97,1,3,39.00,21,1),(98,1,3,963.00,22,1),(99,1,3,852.00,23,1),(100,1,3,741.00,24,1),(101,1,3,987.00,25,1),(102,1,3,654.00,26,1),(103,1,3,654.00,27,1),(104,1,3,321.00,28,1),(105,1,3,31.00,29,1),(106,1,3,654.00,30,1),(107,1,3,987.00,31,1),(108,1,3,654.00,32,1),(109,1,3,32.00,33,1),(110,1,3,32.00,34,1),(111,1,3,321.00,35,1),(112,1,3,123.00,36,1),(113,1,3,456.00,37,1),(114,1,3,789.00,38,1),(115,1,4,423.00,1,1),(116,1,4,789.00,2,1),(117,1,4,125.00,3,1),(118,1,4,987.00,4,1),(119,1,4,789.00,5,1),(120,1,4,654.00,6,1),(121,1,4,1523.00,7,1),(122,1,4,852.00,8,1),(123,1,4,147.00,9,1),(124,1,4,93.00,10,1),(125,1,4,258.00,11,1),(126,1,4,741.00,12,1),(127,1,4,258.00,13,1),(128,1,4,963.00,14,1),(129,1,4,39.00,15,1),(130,1,4,258.00,16,1),(131,1,4,288.00,17,1),(132,1,4,741.00,18,1),(133,1,4,17.00,19,1),(134,1,4,258.00,20,1),(135,1,4,39.00,21,1),(136,1,4,963.00,22,1),(137,1,4,852.00,23,1),(138,1,4,741.00,24,1),(139,1,4,987.00,25,1),(140,1,4,654.00,26,1),(141,1,4,654.00,27,1),(142,1,4,321.00,28,1),(143,1,4,31.00,29,1),(144,1,4,654.00,30,1),(145,1,4,987.00,31,1),(146,1,4,654.00,32,1),(147,1,4,32.00,33,1),(148,1,4,32.00,34,1),(149,1,4,321.00,35,1),(150,1,4,123.00,36,1),(151,1,4,456.00,37,1),(152,1,4,789.00,38,1),(153,1,5,459.00,1,1),(154,1,5,698.00,2,1),(155,1,5,126.00,3,1),(156,1,5,987.00,4,1),(157,1,5,789.00,5,1),(158,1,5,654.00,6,1),(159,1,5,1523.00,7,1),(160,1,5,852.00,8,1),(161,1,5,147.00,9,1),(162,1,5,93.00,10,1),(163,1,5,258.00,11,1),(164,1,5,741.00,12,1),(165,1,5,258.00,13,1),(166,1,5,963.00,14,1),(167,1,5,39.00,15,1),(168,1,5,258.00,16,1),(169,1,5,288.00,17,1),(170,1,5,741.00,18,1),(171,1,5,17.00,19,1),(172,1,5,258.00,20,1),(173,1,5,39.00,21,1),(174,1,5,963.00,22,1),(175,1,5,852.00,23,1),(176,1,5,741.00,24,1),(177,1,5,987.00,25,1),(178,1,5,654.00,26,1),(179,1,5,654.00,27,1),(180,1,5,321.00,28,1),(181,1,5,31.00,29,1),(182,1,5,654.00,30,1),(183,1,5,987.00,31,1),(184,1,5,654.00,32,1),(185,1,5,32.00,33,1),(186,1,5,32.00,34,1),(187,1,5,321.00,35,1),(188,1,5,123.00,36,1),(189,1,5,456.00,37,1),(190,1,5,789.00,38,1),(191,1,6,468.00,1,1),(192,1,6,699.00,2,1),(193,1,6,128.00,3,1),(194,1,6,987.00,4,1),(195,1,6,789.00,5,1),(196,1,6,654.00,6,1),(197,1,6,1523.00,7,1),(198,1,6,852.00,8,1),(199,1,6,147.00,9,1),(200,1,6,93.00,10,1),(201,1,6,258.00,11,1),(202,1,6,741.00,12,1),(203,1,6,258.00,13,1),(204,1,6,963.00,14,1),(205,1,6,39.00,15,1),(206,1,6,258.00,16,1),(207,1,6,288.00,17,1),(208,1,6,741.00,18,1),(209,1,6,17.00,19,1),(210,1,6,258.00,20,1),(211,1,6,39.00,21,1),(212,1,6,963.00,22,1),(213,1,6,852.00,23,1),(214,1,6,741.00,24,1),(215,1,6,987.00,25,1),(216,1,6,654.00,26,1),(217,1,6,654.00,27,1),(218,1,6,321.00,28,1),(219,1,6,31.00,29,1),(220,1,6,654.00,30,1),(221,1,6,987.00,31,1),(222,1,6,654.00,32,1),(223,1,6,32.00,33,1),(224,1,6,32.00,34,1),(225,1,6,321.00,35,1),(226,1,6,123.00,36,1),(227,1,6,456.00,37,1),(228,1,6,789.00,38,1),(229,1,7,429.00,1,1),(230,1,7,675.00,2,1),(231,1,7,130.00,3,1),(232,1,7,987.00,4,1),(233,1,7,789.00,5,1),(234,1,7,654.00,6,1),(235,1,7,1523.00,7,1),(236,1,7,852.00,8,1),(237,1,7,147.00,9,1),(238,1,7,93.00,10,1),(239,1,7,258.00,11,1),(240,1,7,741.00,12,1),(241,1,7,258.00,13,1),(242,1,7,963.00,14,1),(243,1,7,39.00,15,1),(244,1,7,258.00,16,1),(245,1,7,288.00,17,1),(246,1,7,741.00,18,1),(247,1,7,17.00,19,1),(248,1,7,258.00,20,1),(249,1,7,39.00,21,1),(250,1,7,963.00,22,1),(251,1,7,852.00,23,1),(252,1,7,741.00,24,1),(253,1,7,987.00,25,1),(254,1,7,654.00,26,1),(255,1,7,654.00,27,1),(256,1,7,321.00,28,1),(257,1,7,31.00,29,1),(258,1,7,654.00,30,1),(259,1,7,987.00,31,1),(260,1,7,654.00,32,1),(261,1,7,32.00,33,1),(262,1,7,32.00,34,1),(263,1,7,321.00,35,1),(264,1,7,123.00,36,1),(265,1,7,456.00,37,1),(266,1,7,789.00,38,1),(267,1,8,689.00,1,1),(268,1,8,676.00,2,1),(269,1,8,134.00,3,1),(270,1,8,987.00,4,1),(271,1,8,789.00,5,1),(272,1,8,654.00,6,1),(273,1,8,1523.00,7,1),(274,1,8,852.00,8,1),(275,1,8,147.00,9,1),(276,1,8,93.00,10,1),(277,1,8,258.00,11,1),(278,1,8,741.00,12,1),(279,1,8,258.00,13,1),(280,1,8,963.00,14,1),(281,1,8,39.00,15,1),(282,1,8,258.00,16,1),(283,1,8,288.00,17,1),(284,1,8,741.00,18,1),(285,1,8,17.00,19,1),(286,1,8,258.00,20,1),(287,1,8,39.00,21,1),(288,1,8,963.00,22,1),(289,1,8,852.00,23,1),(290,1,8,741.00,24,1),(291,1,8,987.00,25,1),(292,1,8,654.00,26,1),(293,1,8,654.00,27,1),(294,1,8,321.00,28,1),(295,1,8,31.00,29,1),(296,1,8,654.00,30,1),(297,1,8,987.00,31,1),(298,1,8,654.00,32,1),(299,1,8,32.00,33,1),(300,1,8,32.00,34,1),(301,1,8,321.00,35,1),(302,1,8,123.00,36,1),(303,1,8,456.00,37,1),(304,1,8,789.00,38,1),(305,1,9,654.00,1,1),(306,1,9,684.00,2,1),(307,1,9,132.00,3,1),(308,1,9,987.00,4,1),(309,1,9,789.00,5,1),(310,1,9,654.00,6,1),(311,1,9,1523.00,7,1),(312,1,9,852.00,8,1),(313,1,9,147.00,9,1),(314,1,9,93.00,10,1),(315,1,9,258.00,11,1),(316,1,9,741.00,12,1),(317,1,9,258.00,13,1),(318,1,9,963.00,14,1),(319,1,9,39.00,15,1),(320,1,9,258.00,16,1),(321,1,9,288.00,17,1),(322,1,9,741.00,18,1),(323,1,9,17.00,19,1),(324,1,9,258.00,20,1),(325,1,9,39.00,21,1),(326,1,9,963.00,22,1),(327,1,9,852.00,23,1),(328,1,9,741.00,24,1),(329,1,9,987.00,25,1),(330,1,9,654.00,26,1),(331,1,9,654.00,27,1),(332,1,9,321.00,28,1),(333,1,9,31.00,29,1),(334,1,9,654.00,30,1),(335,1,9,987.00,31,1),(336,1,9,654.00,32,1),(337,1,9,32.00,33,1),(338,1,9,32.00,34,1),(339,1,9,321.00,35,1),(340,1,9,123.00,36,1),(341,1,9,456.00,37,1),(342,1,9,789.00,38,1),(343,1,10,564.00,1,1),(344,1,10,621.00,2,1),(345,1,10,136.00,3,1),(346,1,10,987.00,4,1),(347,1,10,789.00,5,1),(348,1,10,654.00,6,1),(349,1,10,1523.00,7,1),(350,1,10,852.00,8,1),(351,1,10,147.00,9,1),(352,1,10,93.00,10,1),(353,1,10,258.00,11,1),(354,1,10,741.00,12,1),(355,1,10,258.00,13,1),(356,1,10,963.00,14,1),(357,1,10,39.00,15,1),(358,1,10,258.00,16,1),(359,1,10,288.00,17,1),(360,1,10,741.00,18,1),(361,1,10,17.00,19,1),(362,1,10,258.00,20,1),(363,1,10,39.00,21,1),(364,1,10,963.00,22,1),(365,1,10,852.00,23,1),(366,1,10,741.00,24,1),(367,1,10,987.00,25,1),(368,1,10,654.00,26,1),(369,1,10,654.00,27,1),(370,1,10,321.00,28,1),(371,1,10,31.00,29,1),(372,1,10,654.00,30,1),(373,1,10,987.00,31,1),(374,1,10,654.00,32,1),(375,1,10,32.00,33,1),(376,1,10,32.00,34,1),(377,1,10,321.00,35,1),(378,1,10,123.00,36,1),(379,1,10,456.00,37,1),(380,1,10,789.00,38,1),(381,1,11,566.00,1,1),(382,1,11,623.00,2,1),(383,1,11,140.00,3,1),(384,1,11,987.00,4,1),(385,1,11,789.00,5,1),(386,1,11,654.00,6,1),(387,1,11,1523.00,7,1),(388,1,11,852.00,8,1),(389,1,11,147.00,9,1),(390,1,11,93.00,10,1),(391,1,11,258.00,11,1),(392,1,11,741.00,12,1),(393,1,11,258.00,13,1),(394,1,11,963.00,14,1),(395,1,11,39.00,15,1),(396,1,11,258.00,16,1),(397,1,11,288.00,17,1),(398,1,11,741.00,18,1),(399,1,11,17.00,19,1),(400,1,11,258.00,20,1),(401,1,11,39.00,21,1),(402,1,11,963.00,22,1),(403,1,11,852.00,23,1),(404,1,11,741.00,24,1),(405,1,11,987.00,25,1),(406,1,11,654.00,26,1),(407,1,11,654.00,27,1),(408,1,11,321.00,28,1),(409,1,11,31.00,29,1),(410,1,11,654.00,30,1),(411,1,11,987.00,31,1),(412,1,11,654.00,32,1),(413,1,11,32.00,33,1),(414,1,11,32.00,34,1),(415,1,11,321.00,35,1),(416,1,11,123.00,36,1),(417,1,11,456.00,37,1),(418,1,11,789.00,38,1),(419,1,12,567.00,1,1),(420,1,12,615.00,2,1),(421,1,12,142.00,3,1),(422,1,12,987.00,4,1),(423,1,12,789.00,5,1),(424,1,12,654.00,6,1),(425,1,12,1523.00,7,1),(426,1,12,852.00,8,1),(427,1,12,147.00,9,1),(428,1,12,93.00,10,1),(429,1,12,258.00,11,1),(430,1,12,741.00,12,1),(431,1,12,258.00,13,1),(432,1,12,963.00,14,1),(433,1,12,39.00,15,1),(434,1,12,258.00,16,1),(435,1,12,288.00,17,1),(436,1,12,741.00,18,1),(437,1,12,17.00,19,1),(438,1,12,258.00,20,1),(439,1,12,39.00,21,1),(440,1,12,963.00,22,1),(441,1,12,852.00,23,1),(442,1,12,741.00,24,1),(443,1,12,987.00,25,1),(444,1,12,654.00,26,1),(445,1,12,654.00,27,1),(446,1,12,321.00,28,1),(447,1,12,31.00,29,1),(448,1,12,654.00,30,1),(449,1,12,987.00,31,1),(450,1,12,654.00,32,1),(451,1,12,32.00,33,1),(452,1,12,32.00,34,1),(453,1,12,321.00,35,1),(454,1,12,123.00,36,1),(455,1,12,456.00,37,1),(456,1,12,789.00,38,1);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ind_groups`
--

DROP TABLE IF EXISTS `ind_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ind_groups` (
  `id` smallint(4) unsigned NOT NULL,
  `group_name_rus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ind_groups`
--

LOCK TABLES `ind_groups` WRITE;
/*!40000 ALTER TABLE `ind_groups` DISABLE KEYS */;
INSERT INTO `ind_groups` VALUES (1,'Цены'),(2,'Объём рынка'),(3,'Объём спроса'),(4,'Объём предложения/производства'),(5,'Потенциальная ёмкость рынка'),(6,'Внешняя торговля'),(7,'Кредиты'),(8,'Гос.поддержка'),(9,'Показатели деятельности, суммарно');
/*!40000 ALTER TABLE `ind_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicators` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `indicator_name_rus` varchar(45) DEFAULT NULL,
  `indicator_group_id` smallint(4) unsigned DEFAULT NULL,
  `measure` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indicator_group_idx` (`indicator_group_id`),
  CONSTRAINT `fk_indicator_group` FOREIGN KEY (`indicator_group_id`) REFERENCES `ind_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (1,'Цена производителя',1,'руб.'),(2,'Цена крупный опт',1,'руб.'),(3,'Цена мелкий опт',1,'руб.'),(4,'Цена розница',1,'руб.'),(5,'Цена ритейл',1,'руб.'),(6,'В ценах производителя объём рынка',2,'тыс.руб'),(7,'В ценах крупный опт объём рынка',2,'тыс.руб'),(8,'В ценах мелкий опт объём рынка',2,'тыс.руб'),(9,'В ценах розницы объём рынка',2,'тыс.руб'),(10,'В ценах ритейла объём рынка',2,'тыс.руб'),(11,'В натральном выражении объём рынка',2,'natural'),(12,'В ценах производителя объём спроса',3,'тыс.руб'),(13,'В ценах крупный опт объём спроса',3,'тыс.руб'),(14,'В ценах мелкий опт объём спроса',3,'тыс.руб'),(15,'В ценах розницы объём спроса',3,'тыс.руб'),(16,'В ценах ритейла объём спроса',3,'тыс.руб'),(17,'В натральном выражении объём предложения',3,'natural'),(18,'В ценах производителя объём предложения',4,'тыс.руб'),(19,'В ценах крупный опт объём предложения',4,'тыс.руб'),(20,'В ценах мелкий опт объём предложения',4,'тыс.руб'),(21,'В ценах розницы объём предложения',4,'тыс.руб'),(22,'В ценах ритейла объём предложения',4,'тыс.руб'),(23,'В натральном выражении объём предложения',4,'natural'),(24,'В ценах производителя потенц.ёмкость',5,'тыс.руб'),(25,'В ценах крупный опт потенц.ёмкость',5,'тыс.руб'),(26,'В ценах мелкий опт потенц.ёмкость',5,'тыс.руб'),(27,'В ценах розницы потенц.ёмкость',5,'тыс.руб'),(28,'В ценах ритейла потенц.ёмкость',5,'тыс.руб'),(29,'В натральном выражении потенц.ёмкость',5,'natural'),(30,'Импорт в натурально выражении',6,'natural'),(31,'Инпорт в денежном выражении',6,'Тыс.долл'),(32,'Экспорт в натурально выражении',6,'natural'),(33,'Экспорт в денежнов выражении',6,'тыс. долл'),(34,'Выручка от реализации суммарно',9,'тыс.руб'),(35,'Чистая прибыль суммарно',9,'тыс.руб'),(36,'Затраты на текущую деятельность суммарно',9,'тыс.руб'),(37,'Объем финансирования(инсестиции)',9,'тыс.руб'),(38,'Мощность(инвестиции)',9,'???');
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` smallint(6) unsigned NOT NULL,
  `location_fullname_native` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_regoin_idx` (`region_id`),
  CONSTRAINT `fk_location_regoin` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,'Москва'),(2,1,'Белгородская область'),(3,1,'Брянская область'),(4,1,'Владимирская область'),(5,1,'Воронежская область'),(6,1,'Ивановская область'),(7,1,'Калужская область'),(8,1,'Костромская область'),(9,1,'Курская область'),(10,1,'Липецкая область'),(11,1,'Московская область'),(12,1,'Орловская область'),(13,1,'Рязанская область'),(14,1,'Смоленская область'),(15,1,'Тамбовская область'),(16,1,'Тверская область'),(17,1,'Тульская область'),(18,1,'Ярославская область'),(19,2,'Санкт-Петербург'),(20,2,'Республика Карелия'),(21,2,'Республика Коми'),(22,2,'Архангельская область'),(23,2,'Вологодская область'),(24,2,'Калининградская область'),(25,2,'Ленинградская область'),(26,2,'Мурманская область'),(27,2,'Новгородская область'),(28,2,'Псковская область'),(29,2,'Ненецкий автономный округ'),(30,3,'Республика Адыгея'),(31,3,'Республика Калмыкия'),(32,3,'Республика Крым'),(33,3,'Краснодарский край'),(34,3,'Астраханская область'),(35,3,'Волгоградская область'),(36,3,'Ростовская область'),(37,4,'Республика Дагестан'),(38,4,'Республика Ингушетия'),(39,4,'Кабардино-Балкарская Республика'),(40,4,'Карачаево-Черкесская Республика'),(41,4,'Республика Северная Осетия '),(42,4,'Чеченская Республика'),(43,4,'Ставропольский край'),(44,5,'Республика Башкортостан'),(45,5,'Республика Марий Эл'),(46,5,'Республика Мордовия'),(47,5,'Республика Татарстан'),(48,5,'Удмуртская Республика'),(49,5,'Чувашская Республика'),(50,5,'Пермский край'),(51,5,'Кировская область'),(52,5,'Нижегородская область'),(53,5,'Оренбургская область'),(54,5,'Пензенская область'),(55,5,'Самарская область'),(56,5,'Саратовская область'),(57,5,'Ульяновская область'),(58,6,'Курганская область'),(59,6,'Свердловская область'),(60,6,'Тюменская область'),(61,6,'Челябинская область'),(62,6,'Ханты-Мансийский автономный округ'),(63,6,'Ямало-Ненецкий автономный округ'),(64,7,'Республика Алтай'),(65,7,'Республика Бурятия'),(66,7,'Республика Тыва'),(67,7,'Республика Хакасия'),(68,7,'Алтайский край'),(69,7,'Забайкальский край'),(70,7,'Красноярский край'),(71,7,'Иркутская область'),(72,7,'Кемеровская область'),(73,7,'Новосибирская область'),(74,7,'Омская область'),(75,7,'Томская область'),(76,8,'Республика Саха (Якутия)'),(77,8,'Камчатский край'),(78,8,'Приморский край'),(79,8,'Хабаровский край'),(80,8,'Амурская область'),(81,8,'Магаданская область'),(82,8,'Сахалинская область'),(83,8,'Еврейская автономная область'),(84,8,'Чукотский автономный округ');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `month`
--

DROP TABLE IF EXISTS `month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `month` (
  `id` tinyint(2) unsigned NOT NULL,
  `short_name_rus` varchar(4) NOT NULL,
  `long_name_rus` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `month`
--

LOCK TABLES `month` WRITE;
/*!40000 ALTER TABLE `month` DISABLE KEYS */;
INSERT INTO `month` VALUES (1,'янв','Январь'),(2,'фев','Февраль'),(3,'мар','Март'),(4,'апр','Апрель'),(5,'май','Май'),(6,'июн','Июнь'),(7,'июл','Июль'),(8,'авг','Август'),(9,'сен','Сентябрь'),(10,'окт','Октябрь'),(11,'ноя','Ноябрь'),(12,'дек','Декабрь');
/*!40000 ALTER TABLE `month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` smallint(4) unsigned NOT NULL,
  `region_shortname_eng` varchar(12) DEFAULT NULL,
  `region_fullname_eng` varchar(45) DEFAULT NULL,
  `region_fullname_native` varchar(45) DEFAULT NULL,
  `region_shortname_native` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_country_idx` (`country_id`),
  CONSTRAINT `fk_region_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,1,NULL,NULL,'Центральный федеральный округ','ЦФО'),(2,1,NULL,NULL,'Северо-Западный федеральный округ','СЗФО'),(3,1,NULL,NULL,'Южный федеральный округ','ЮФО'),(4,1,NULL,NULL,'Северо-Кавказский федеральный округ','СКФО'),(5,1,NULL,NULL,'Приволжский федеральный округ','ПФО'),(6,1,NULL,NULL,'Уральский федеральный округ','УФО'),(7,1,NULL,NULL,'Сибирский федеральный округ','СФО'),(8,1,NULL,NULL,'Дальневосточный федеральный округ','ДФО');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `sector_name_rus` varchar(45) DEFAULT NULL,
  `branch_id` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sector_branch_idx` (`branch_id`),
  CONSTRAINT `fk_sector_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Рога говяжьи',14),(2,'Копыта верблюжьи',14),(3,'Перо гусиное',14),(4,'Хвосты свиные',14),(5,'Корм кошачий',14);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `times` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` tinyint(3) unsigned NOT NULL,
  `monthname_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_date_month_idx` (`monthname_id`),
  KEY `fk_date_year_idx` (`year_id`),
  CONSTRAINT `fk_date_month` FOREIGN KEY (`monthname_id`) REFERENCES `month` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_date_year` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,2,1),(14,2,2),(15,2,3),(16,2,4),(17,2,5),(18,2,6),(19,2,7),(20,2,8),(21,2,9),(22,2,10),(23,2,11),(24,2,12),(25,3,1),(26,3,2),(27,3,3),(28,3,4),(29,3,5),(30,3,6),(31,3,7),(32,3,8),(33,3,9),(34,3,10),(35,3,11),(36,3,12),(37,4,1),(38,4,2),(39,4,3),(40,4,4),(41,4,5),(42,4,6),(43,4,7),(44,4,8),(45,4,9),(46,4,10),(47,4,11),(48,4,12),(49,5,1),(50,5,2),(51,5,3),(52,5,4),(53,5,5),(54,5,6),(55,5,7),(56,5,8),(57,5,9),(58,5,10),(59,5,11),(60,5,12),(61,6,1),(62,6,2),(63,6,3),(64,6,4),(65,6,5),(66,6,6),(67,6,7),(68,6,8),(69,6,9),(70,6,10),(71,6,11),(72,6,12),(73,7,1),(74,7,2),(75,7,3),(76,7,4),(77,7,5),(78,7,6),(79,7,7),(80,7,8),(81,7,9),(82,7,10),(83,7,11),(84,7,12),(85,8,1),(86,8,2),(87,8,3),(88,8,4),(89,8,5),(90,8,6),(91,8,7),(92,8,8),(93,8,9),(94,8,10),(95,8,11),(96,8,12),(97,9,1),(98,9,2),(99,9,3),(100,9,4),(101,9,5),(102,9,6),(103,9,7),(104,9,8),(105,9,9),(106,9,10),(107,9,11),(108,9,12),(109,10,1),(110,10,2),(111,10,3),(112,10,4),(113,10,5),(114,10,6),(115,10,7),(116,10,8),(117,10,9),(118,10,10),(119,10,11),(120,10,12),(121,11,1),(122,11,2),(123,11,3),(124,11,4),(125,11,5),(126,11,6),(127,11,7),(128,11,8),(129,11,9),(130,11,10),(131,11,11),(132,11,12),(133,12,1),(134,12,2),(135,12,3),(136,12,4),(137,12,5),(138,12,6),(139,12,7),(140,12,8),(141,12,9),(142,12,10),(143,12,11),(144,12,12),(145,13,1),(146,13,2),(147,13,3),(148,13,4),(149,13,5),(150,13,6),(151,13,7),(152,13,8),(153,13,9),(154,13,10),(155,13,11),(156,13,12),(157,14,1),(158,14,2),(159,14,3),(160,14,4),(161,14,5),(162,14,6),(163,14,7),(164,14,8),(165,14,9),(166,14,10),(167,14,11),(168,14,12),(169,15,1),(170,15,2),(171,15,3),(172,15,4),(173,15,5),(174,15,6),(175,15,7),(176,15,8),(177,15,9),(178,15,10),(179,15,11),(180,15,12),(181,16,1),(182,16,2),(183,16,3),(184,16,4),(185,16,5),(186,16,6),(187,16,7),(188,16,8),(189,16,9),(190,16,10),(191,16,11),(192,16,12),(193,17,1),(194,17,2),(195,17,3),(196,17,4),(197,17,5),(198,17,6),(199,17,7),(200,17,8),(201,17,9),(202,17,10),(203,17,11),(204,17,12),(205,18,1),(206,18,2),(207,18,3),(208,18,4),(209,18,5),(210,18,6),(211,18,7),(212,18,8),(213,18,9),(214,18,10),(215,18,11),(216,18,12),(217,19,1),(218,19,2),(219,19,3),(220,19,4),(221,19,5),(222,19,6),(223,19,7),(224,19,8),(225,19,9),(226,19,10),(227,19,11),(228,19,12),(229,20,1),(230,20,2),(231,20,3),(232,20,4),(233,20,5),(234,20,6),(235,20,7),(236,20,8),(237,20,9),(238,20,10),(239,20,11),(240,20,12);
/*!40000 ALTER TABLE `times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `years` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `year` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (1,2001),(2,2002),(3,2003),(4,2004),(5,2005),(6,2006),(7,2007),(8,2008),(9,2009),(10,2010),(11,2011),(12,2012),(13,2013),(14,2014),(15,2015),(16,2016),(17,2017),(18,2018),(19,2019),(20,2020);
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-20 17:44:31
