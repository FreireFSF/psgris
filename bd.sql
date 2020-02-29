-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: psgris
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacoes` (
  `ava_id` int(11) NOT NULL AUTO_INCREMENT,
  `mentor_id` int(11) DEFAULT NULL,
  `candidato_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `notas` float DEFAULT NULL,
  PRIMARY KEY (`ava_id`),
  KEY `candidato_id` (`candidato_id`),
  KEY `mentor_id` (`mentor_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`dre`),
  CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`mentor_id`) REFERENCES `mentores` (`mentor_id`),
  CONSTRAINT `avaliacoes_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatos` (
  `dre` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telegram` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `presencafase` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curso` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notebook` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`dre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `aula_id` int(11) NOT NULL AUTO_INCREMENT,
  `aulanome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mentor_id` int(11) DEFAULT NULL,
  `candidato_id` int(11) DEFAULT NULL,
  `ouvinte_id` int(11) DEFAULT NULL,
  `presenca` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`aula_id`),
  KEY `candidato_id` (`candidato_id`),
  KEY `mentor_id` (`mentor_id`),
  KEY `ouvinte_id` (`ouvinte_id`),
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`dre`),
  CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`mentor_id`) REFERENCES `mentores` (`mentor_id`),
  CONSTRAINT `classe_ibfk_3` FOREIGN KEY (`ouvinte_id`) REFERENCES `ouvintes` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentores`
--

DROP TABLE IF EXISTS `mentores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentores` (
  `mentor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telegram` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membro` tinyint(1) DEFAULT NULL,
  `curso` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`mentor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentores`
--

LOCK TABLES `mentores` WRITE;
/*!40000 ALTER TABLE `mentores` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouvintes`
--

DROP TABLE IF EXISTS `ouvintes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ouvintes` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telegram` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notebook` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouvintes`
--

LOCK TABLES `ouvintes` WRITE;
/*!40000 ALTER TABLE `ouvintes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ouvintes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `conteudo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prazo` date DEFAULT NULL,
  `mentor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `mentor_id` (`mentor_id`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentores` (`mentor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-29  2:01:47
