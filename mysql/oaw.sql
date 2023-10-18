-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: oaw
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `ambitos_lista`
--

DROP TABLE IF EXISTS `ambitos_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambitos_lista` (
  `id_ambito` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_ambito`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambitos_lista`
--

LOCK TABLES `ambitos_lista` WRITE;
/*!40000 ALTER TABLE `ambitos_lista` DISABLE KEYS */;
INSERT INTO `ambitos_lista` VALUES (1,'AGE','Administración General del Estado'),(2,'CCAA','Comunidades Autónomas'),(3,'EELL','Entidades Locales'),(4,'Otros','Otros');
/*!40000 ALTER TABLE `ambitos_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_service`
--

DROP TABLE IF EXISTS `basic_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usr` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `domain` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `depth` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `report` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'launched',
  `send_date` datetime DEFAULT NULL,
  `scheduling_date` datetime DEFAULT NULL,
  `analysis_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `in_directory` tinyint(1) NOT NULL DEFAULT '0',
  `register_result` tinyint(1) NOT NULL DEFAULT '0',
  `complexity` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `filename` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_service`
--

LOCK TABLES `basic_service` WRITE;
/*!40000 ALTER TABLE `basic_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `basic_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartucho`
--

DROP TABLE IF EXISTS `cartucho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartucho` (
  `id_cartucho` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `instalado` tinyint(1) NOT NULL,
  `aplicacion` varchar(100) COLLATE utf8_bin NOT NULL,
  `numrastreos` int NOT NULL,
  `numhilos` int NOT NULL,
  `id_guideline` int NOT NULL,
  PRIMARY KEY (`id_cartucho`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartucho`
--

LOCK TABLES `cartucho` WRITE;
/*!40000 ALTER TABLE `cartucho` DISABLE KEYS */;
INSERT INTO `cartucho` VALUES (1,'es.inteco.accesibilidad.CartuchoAccesibilidad',1,'UNE-2004',15,50,1),(2,'es.inteco.accesibilidad.CartuchoAccesibilidad',1,'UNE-2012',15,50,2),(8,'es.inteco.accesibilidad.CartuchoAccesibilidad',1,'UNE-2012-B',15,50,8),(9,'es.inteco.accesibilidad.CartuchoAccesibilidad',1,'UNE-EN301549:2019 (beta)',15,50,9),(10,'es.inteco.accesibilidad.CartuchoAccesibilidad',1,'Accesibilidad',15,50,10);
/*!40000 ALTER TABLE `cartucho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartucho_rastreo`
--

DROP TABLE IF EXISTS `cartucho_rastreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartucho_rastreo` (
  `id_cartucho` bigint NOT NULL,
  `id_rastreo` bigint NOT NULL,
  PRIMARY KEY (`id_cartucho`,`id_rastreo`),
  KEY `id_rastreo` (`id_rastreo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartucho_rastreo`
--

LOCK TABLES `cartucho_rastreo` WRITE;
/*!40000 ALTER TABLE `cartucho_rastreo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartucho_rastreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `umbral` double NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_termino`
--

DROP TABLE IF EXISTS `categoria_termino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_termino` (
  `id_categoria` bigint NOT NULL,
  `id_termino` bigint NOT NULL,
  `porcentaje` double NOT NULL,
  `porcentaje_normalizado` double NOT NULL,
  PRIMARY KEY (`id_categoria`,`id_termino`),
  KEY `id_termino` (`id_termino`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_termino`
--

LOCK TABLES `categoria_termino` WRITE;
/*!40000 ALTER TABLE `categoria_termino` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_termino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_lista`
--

DROP TABLE IF EXISTS `categorias_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias_lista` (
  `id_categoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `orden` int NOT NULL,
  `clave` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_lista`
--

LOCK TABLES `categorias_lista` WRITE;
/*!40000 ALTER TABLE `categorias_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasificacion_etiqueta`
--

DROP TABLE IF EXISTS `clasificacion_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clasificacion_etiqueta` (
  `id_clasificacion` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_clasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificacion_etiqueta`
--

LOCK TABLES `clasificacion_etiqueta` WRITE;
/*!40000 ALTER TABLE `clasificacion_etiqueta` DISABLE KEYS */;
INSERT INTO `clasificacion_etiqueta` VALUES (1,'Temática'),(2,'Distribución'),(3,'Recurrencia'),(4,'Otros');
/*!40000 ALTER TABLE `clasificacion_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejidades_lista`
--

DROP TABLE IF EXISTS `complejidades_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complejidades_lista` (
  `id_complejidad` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `profundidad` bigint NOT NULL,
  `amplitud` bigint NOT NULL,
  PRIMARY KEY (`id_complejidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejidades_lista`
--

LOCK TABLES `complejidades_lista` WRITE;
/*!40000 ALTER TABLE `complejidades_lista` DISABLE KEYS */;
INSERT INTO `complejidades_lista` VALUES (1,'Baja',2,2),(2,'Media',4,8),(3,'Alta',4,11);
/*!40000 ALTER TABLE `complejidades_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_cliente`
--

DROP TABLE IF EXISTS `cuenta_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_cliente` (
  `id_cuenta` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `dominio` bigint NOT NULL,
  `id_periodicidad` bigint NOT NULL,
  `profundidad` int NOT NULL DEFAULT '0',
  `amplitud` int NOT NULL DEFAULT '0',
  `fecha_inicio` datetime DEFAULT NULL,
  `lista_rastreable` bigint DEFAULT NULL,
  `lista_no_rastreable` bigint DEFAULT NULL,
  `id_guideline` bigint DEFAULT NULL,
  `pseudoaleatorio` tinyint(1) DEFAULT NULL,
  `id_language` bigint NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `in_directory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cuenta`),
  KEY `id_periodicidad` (`id_periodicidad`),
  KEY `dominio` (`dominio`),
  KEY `lista_rastreable` (`lista_rastreable`),
  KEY `lista_no_rastreable` (`lista_no_rastreable`),
  KEY `id_language` (`id_language`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_cliente`
--

LOCK TABLES `cuenta_cliente` WRITE;
/*!40000 ALTER TABLE `cuenta_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_cliente_cartucho`
--

DROP TABLE IF EXISTS `cuenta_cliente_cartucho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_cliente_cartucho` (
  `id_cuenta` bigint NOT NULL,
  `id_cartucho` bigint NOT NULL,
  PRIMARY KEY (`id_cuenta`,`id_cartucho`),
  KEY `id_cartucho` (`id_cartucho`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_cliente_cartucho`
--

LOCK TABLES `cuenta_cliente_cartucho` WRITE;
/*!40000 ALTER TABLE `cuenta_cliente_cartucho` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta_cliente_cartucho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_cliente_usuario`
--

DROP TABLE IF EXISTS `cuenta_cliente_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_cliente_usuario` (
  `id_cuenta` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id_cuenta`,`id_usuario`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_cliente_usuario`
--

LOCK TABLES `cuenta_cliente_usuario` WRITE;
/*!40000 ALTER TABLE `cuenta_cliente_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta_cliente_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enlaces_rotos`
--

DROP TABLE IF EXISTS `enlaces_rotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enlaces_rotos` (
  `id_rastreo_realizado` bigint NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `num_enlaces` int NOT NULL,
  PRIMARY KEY (`id_rastreo_realizado`,`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enlaces_rotos`
--

LOCK TABLES `enlaces_rotos` WRITE;
/*!40000 ALTER TABLE `enlaces_rotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enlaces_rotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiqueta` (
  `id_etiqueta` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `id_clasificacion` bigint NOT NULL,
  PRIMARY KEY (`id_etiqueta`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_aspect_score`
--

DROP TABLE IF EXISTS `export_aspect_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_aspect_score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `aspect` varchar(255) COLLATE utf8_bin NOT NULL,
  `score` decimal(19,2) NOT NULL,
  `idCategory` bigint DEFAULT NULL,
  `idExecution` bigint DEFAULT NULL,
  `idPage` bigint DEFAULT NULL,
  `idSite` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39330E96833FBD5F` (`idPage`),
  KEY `FK39330E96D83469BD` (`idCategory`),
  KEY `FK39330E968342B6CF` (`idSite`),
  KEY `FK39330E96B3ADA411` (`idExecution`),
  KEY `FK39330E96B26C93F` (`idPage`),
  KEY `FK39330E96BBF2859D` (`idCategory`),
  KEY `FK39330E96B29C2AF` (`idSite`),
  KEY `FK39330E965BDB7C31` (`idExecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_aspect_score`
--

LOCK TABLES `export_aspect_score` WRITE;
/*!40000 ALTER TABLE `export_aspect_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_aspect_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_category`
--

DROP TABLE IF EXISTS `export_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idCrawlerCategory` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `numA` int NOT NULL,
  `numAA` int NOT NULL,
  `numNV` int NOT NULL,
  `scoreA` decimal(19,2) NOT NULL,
  `scoreAA` decimal(19,2) NOT NULL,
  `scoreNV` decimal(19,2) NOT NULL,
  `idExecution` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA67C529B3ADA411` (`idExecution`),
  KEY `FKA67C5295BDB7C31` (`idExecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_category`
--

LOCK TABLES `export_category` WRITE;
/*!40000 ALTER TABLE `export_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_observatory`
--

DROP TABLE IF EXISTS `export_observatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_observatory` (
  `idExecution` bigint NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `numA` int NOT NULL,
  `numAA` int NOT NULL,
  `numNV` int NOT NULL,
  PRIMARY KEY (`idExecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_observatory`
--

LOCK TABLES `export_observatory` WRITE;
/*!40000 ALTER TABLE `export_observatory` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_observatory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_page`
--

DROP TABLE IF EXISTS `export_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_bin NOT NULL,
  `score` decimal(19,2) NOT NULL,
  `scoreLevel1` decimal(19,2) NOT NULL,
  `scoreLevel2` decimal(19,2) NOT NULL,
  `url` varchar(2050) COLLATE utf8_bin DEFAULT NULL,
  `idSite` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8322383A8342B6CF` (`idSite`),
  KEY `FK8322383AB29C2AF` (`idSite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_page`
--

LOCK TABLES `export_page` WRITE;
/*!40000 ALTER TABLE `export_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_site`
--

DROP TABLE IF EXISTS `export_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_site` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idCrawlerSeed` bigint DEFAULT NULL,
  `level` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `numA` int NOT NULL,
  `numAA` int NOT NULL,
  `numNV` int NOT NULL,
  `score` decimal(19,2) DEFAULT NULL,
  `scoreLevel1` decimal(19,2) DEFAULT NULL,
  `scoreLevel2` decimal(19,2) DEFAULT NULL,
  `idCategory` bigint NOT NULL,
  `compliance` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8323B4F2D83469BD` (`idCategory`),
  KEY `FK8323B4F2BBF2859D` (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_site`
--

LOCK TABLES `export_site` WRITE;
/*!40000 ALTER TABLE `export_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_verification_modality`
--

DROP TABLE IF EXISTS `export_verification_modality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_verification_modality` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `failPercentage` decimal(19,2) NOT NULL,
  `passPercentage` decimal(19,2) NOT NULL,
  `verification` varchar(255) COLLATE utf8_bin NOT NULL,
  `idCategory` bigint DEFAULT NULL,
  `idExecution` bigint DEFAULT NULL,
  `idSite` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC9F9E23AD83469BD` (`idCategory`),
  KEY `FKC9F9E23A8342B6CF` (`idSite`),
  KEY `FKC9F9E23AB3ADA411` (`idExecution`),
  KEY `FKC9F9E23ABBF2859D` (`idCategory`),
  KEY `FKC9F9E23AB29C2AF` (`idSite`),
  KEY `FKC9F9E23A5BDB7C31` (`idExecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_verification_modality`
--

LOCK TABLES `export_verification_modality` WRITE;
/*!40000 ALTER TABLE `export_verification_modality` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_verification_modality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_verification_page`
--

DROP TABLE IF EXISTS `export_verification_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_verification_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modality` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` int DEFAULT NULL,
  `verification` varchar(255) COLLATE utf8_bin NOT NULL,
  `idPage` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK724BD668833FBD5F` (`idPage`),
  KEY `FK724BD668B26C93F` (`idPage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_verification_page`
--

LOCK TABLES `export_verification_page` WRITE;
/*!40000 ALTER TABLE `export_verification_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_verification_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_verification_score`
--

DROP TABLE IF EXISTS `export_verification_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_verification_score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` decimal(19,2) DEFAULT NULL,
  `verification` varchar(255) COLLATE utf8_bin NOT NULL,
  `idCategory` bigint DEFAULT NULL,
  `idExecution` bigint DEFAULT NULL,
  `idSite` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD75A45D9D83469BD` (`idCategory`),
  KEY `FKD75A45D98342B6CF` (`idSite`),
  KEY `FKD75A45D9B3ADA411` (`idExecution`),
  KEY `FKD75A45D9BBF2859D` (`idCategory`),
  KEY `FKD75A45D9B29C2AF` (`idSite`),
  KEY `FKD75A45D95BDB7C31` (`idExecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_verification_score`
--

LOCK TABLES `export_verification_score` WRITE;
/*!40000 ALTER TABLE `export_verification_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_verification_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id_language` bigint NOT NULL AUTO_INCREMENT,
  `key_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `codice` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_language`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'idioma.espanol','es'),(2,'idioma.ingles','en');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista`
--

DROP TABLE IF EXISTS `lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista` (
  `id_lista` bigint NOT NULL AUTO_INCREMENT,
  `id_tipo_lista` bigint NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lista` text COLLATE utf8_bin NOT NULL,
  `id_categoria` bigint DEFAULT NULL,
  `acronimo` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `activa` tinyint(1) DEFAULT '1',
  `in_directory` tinyint(1) NOT NULL DEFAULT '0',
  `dependencia` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `eliminar` bigint NOT NULL DEFAULT '0',
  `id_complejidad` bigint DEFAULT NULL,
  `id_ambito` bigint DEFAULT NULL,
  `observaciones` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_lista`),
  UNIQUE KEY `id_lista` (`id_lista`),
  KEY `id_tipo_lista` (`id_tipo_lista`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_ambito` (`id_ambito`)
) ENGINE=MyISAM AUTO_INCREMENT=535 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista`
--

LOCK TABLES `lista` WRITE;
/*!40000 ALTER TABLE `lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `oaw_dashboard`
--

DROP TABLE IF EXISTS `oaw_dashboard`;
/*!50001 DROP VIEW IF EXISTS `oaw_dashboard`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oaw_dashboard` (
  `id` tinyint NOT NULL,
  `usr` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `depth` tinyint NOT NULL,
  `width` tinyint NOT NULL,
  `report` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `analysis_type` tinyint NOT NULL,
  `in_directory` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `observatorio`
--

DROP TABLE IF EXISTS `observatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio` (
  `id_observatorio` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_periodicidad` bigint NOT NULL,
  `profundidad` int NOT NULL DEFAULT '0',
  `amplitud` int NOT NULL DEFAULT '0',
  `fecha_inicio` datetime DEFAULT NULL,
  `id_guideline` bigint DEFAULT NULL,
  `pseudoaleatorio` tinyint(1) DEFAULT NULL,
  `id_language` bigint NOT NULL,
  `id_cartucho` bigint NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `id_tipo` bigint DEFAULT NULL,
  `id_ambito` bigint DEFAULT NULL,
  `tags` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_observatorio`),
  KEY `id_periodicidad` (`id_periodicidad`),
  KEY `id_language` (`id_language`),
  KEY `id_cartucho` (`id_cartucho`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio`
--

LOCK TABLES `observatorio` WRITE;
/*!40000 ALTER TABLE `observatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_ambito`
--

DROP TABLE IF EXISTS `observatorio_ambito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_ambito` (
  `id_observatorio` bigint NOT NULL,
  `id_ambito` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_ambito`
--

LOCK TABLES `observatorio_ambito` WRITE;
/*!40000 ALTER TABLE `observatorio_ambito` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_ambito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_categoria`
--

DROP TABLE IF EXISTS `observatorio_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_categoria` (
  `id_observatorio` bigint NOT NULL,
  `id_categoria` bigint NOT NULL,
  PRIMARY KEY (`id_observatorio`,`id_categoria`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_categoria`
--

LOCK TABLES `observatorio_categoria` WRITE;
/*!40000 ALTER TABLE `observatorio_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_complejidad`
--

DROP TABLE IF EXISTS `observatorio_complejidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_complejidad` (
  `id_observatorio` bigint NOT NULL,
  `id_complejidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_complejidad`
--

LOCK TABLES `observatorio_complejidad` WRITE;
/*!40000 ALTER TABLE `observatorio_complejidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_complejidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_estado`
--

DROP TABLE IF EXISTS `observatorio_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_estado` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador autoincrementable',
  `id_observatorio` int NOT NULL COMMENT 'Identificador del observatorio',
  `id_ejecucion_observatorio` int NOT NULL COMMENT 'Identificador de la ejecución del observatorio',
  `nombre` varchar(256) NOT NULL COMMENT 'Nombre de la semilla',
  `url` varchar(256) NOT NULL COMMENT 'URL de la semilla',
  `total_url` int NOT NULL COMMENT 'Total del URLs que se analizarán',
  `total_url_analizadas` int DEFAULT '0',
  `ultima_url` varchar(6000) DEFAULT NULL,
  `fecha_ultima_url` datetime DEFAULT NULL COMMENT 'Fecha del fin de la última URL analizada',
  `actual_url` varchar(6000) DEFAULT NULL,
  `tiempo_medio` int DEFAULT NULL COMMENT 'Tiempo medio de análisis',
  `tiempo_acumulado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_observatorio` (`id_observatorio`,`id_ejecucion_observatorio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_estado`
--

LOCK TABLES `observatorio_estado` WRITE;
/*!40000 ALTER TABLE `observatorio_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_lista`
--

DROP TABLE IF EXISTS `observatorio_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_lista` (
  `id_observatorio` bigint NOT NULL,
  `id_lista` bigint NOT NULL,
  PRIMARY KEY (`id_observatorio`,`id_lista`),
  KEY `id_lista` (`id_lista`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_lista`
--

LOCK TABLES `observatorio_lista` WRITE;
/*!40000 ALTER TABLE `observatorio_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_metodologia`
--

DROP TABLE IF EXISTS `observatorio_metodologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_metodologia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_obs_realizado` bigint DEFAULT NULL,
  `metodologia` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `id_obs_realizado` (`id_obs_realizado`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_metodologia`
--

LOCK TABLES `observatorio_metodologia` WRITE;
/*!40000 ALTER TABLE `observatorio_metodologia` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_metodologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_plantillas`
--

DROP TABLE IF EXISTS `observatorio_plantillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_plantillas` (
  `id_plantilla` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1024) NOT NULL,
  `documento` longblob NOT NULL,
  PRIMARY KEY (`id_plantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_plantillas`
--

LOCK TABLES `observatorio_plantillas` WRITE;
/*!40000 ALTER TABLE `observatorio_plantillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_plantillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_proxy`
--

DROP TABLE IF EXISTS `observatorio_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_proxy` (
  `status` tinyint(1) NOT NULL,
  `url` varchar(64) NOT NULL,
  `port` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_proxy`
--

LOCK TABLES `observatorio_proxy` WRITE;
/*!40000 ALTER TABLE `observatorio_proxy` DISABLE KEYS */;
INSERT INTO `observatorio_proxy` VALUES (1,'127.0.0.1','18088');
/*!40000 ALTER TABLE `observatorio_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_tipo`
--

DROP TABLE IF EXISTS `observatorio_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_tipo` (
  `id_tipo` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_tipo`
--

LOCK TABLES `observatorio_tipo` WRITE;
/*!40000 ALTER TABLE `observatorio_tipo` DISABLE KEYS */;
INSERT INTO `observatorio_tipo` VALUES (1,'AGE'),(2,'CCAA'),(3,'EELL'),(4,'OTROS');
/*!40000 ALTER TABLE `observatorio_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorio_usuario`
--

DROP TABLE IF EXISTS `observatorio_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorio_usuario` (
  `id_observatorio` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id_observatorio`,`id_usuario`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorio_usuario`
--

LOCK TABLES `observatorio_usuario` WRITE;
/*!40000 ALTER TABLE `observatorio_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorio_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatorios_realizados`
--

DROP TABLE IF EXISTS `observatorios_realizados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatorios_realizados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_observatorio` bigint NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_cartucho` bigint DEFAULT NULL,
  `estado` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_observatorio` (`id_observatorio`),
  KEY `id_cartucho` (`id_cartucho`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatorios_realizados`
--

LOCK TABLES `observatorios_realizados` WRITE;
/*!40000 ALTER TABLE `observatorios_realizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `observatorios_realizados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodicidad`
--

DROP TABLE IF EXISTS `periodicidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodicidad` (
  `id_periodicidad` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) COLLATE utf8_bin NOT NULL,
  `dias` int DEFAULT NULL,
  `cronExpression` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_periodicidad`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodicidad`
--

LOCK TABLES `periodicidad` WRITE;
/*!40000 ALTER TABLE `periodicidad` DISABLE KEYS */;
INSERT INTO `periodicidad` VALUES (1,'Diario',1,NULL),(2,'Semanal',7,NULL),(3,'Quincenal',15,NULL),(4,'Mensual',NULL,'0 min hour daymonth month/1 ? year/1'),(5,'Trimestral',NULL,'0 min hour daymonth month/3 ? year/1'),(6,'Semestral',NULL,'0 min hour daymonth month/6 ? year/1'),(7,'Anual',NULL,'0 min hour daymonth month ? year/1');
/*!40000 ALTER TABLE `periodicidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreo`
--

DROP TABLE IF EXISTS `rastreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastreo` (
  `id_rastreo` bigint NOT NULL AUTO_INCREMENT,
  `nombre_rastreo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `profundidad` int NOT NULL,
  `topn` int NOT NULL,
  `semillas` bigint NOT NULL,
  `fecha_lanzado` datetime DEFAULT NULL,
  `lista_no_rastreable` bigint DEFAULT NULL,
  `lista_rastreable` bigint DEFAULT NULL,
  `estado` int NOT NULL,
  `id_cuenta` bigint DEFAULT NULL,
  `id_observatorio` bigint DEFAULT NULL,
  `id_guideline` bigint DEFAULT NULL,
  `automatico` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `pseudoaleatorio` tinyint(1) DEFAULT NULL,
  `id_language` bigint NOT NULL,
  `exhaustive` tinyint(1) NOT NULL,
  `in_directory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rastreo`),
  KEY `id_cuenta` (`id_cuenta`),
  KEY `id_observatorio` (`id_observatorio`),
  KEY `semillas` (`semillas`),
  KEY `id_language` (`id_language`),
  KEY `rastreo_ibfk_4` (`lista_rastreable`),
  KEY `rastreo_ibfk_5` (`lista_no_rastreable`)
) ENGINE=MyISAM AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreo`
--

LOCK TABLES `rastreo` WRITE;
/*!40000 ALTER TABLE `rastreo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreos_realizados`
--

DROP TABLE IF EXISTS `rastreos_realizados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rastreos_realizados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_rastreo` bigint NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` bigint NOT NULL,
  `id_cartucho` bigint NOT NULL,
  `id_obs_realizado` bigint DEFAULT NULL,
  `id_lista` bigint DEFAULT NULL,
  `level` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `score` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rastreo` (`id_rastreo`),
  KEY `id_cartucho` (`id_cartucho`),
  KEY `id_obs_realizado` (`id_obs_realizado`),
  KEY `id_lista` (`id_lista`)
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreos_realizados`
--

LOCK TABLES `rastreos_realizados` WRITE;
/*!40000 ALTER TABLE `rastreos_realizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreos_realizados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_rol` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_tipo` bigint DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador',1),(2,'Configurador',1),(3,'Visualizador',1),(4,'Responsable cliente',2),(5,'Visualizador cliente',2),(6,'Observatorio',3);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semilla_etiqueta`
--

DROP TABLE IF EXISTS `semilla_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semilla_etiqueta` (
  `id_lista` bigint NOT NULL DEFAULT '0',
  `id_etiqueta` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lista`,`id_etiqueta`),
  KEY `semilla_etiqueta_ibfk_1` (`id_etiqueta`),
  CONSTRAINT `semilla_etiqueta_ibfk_1` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiqueta` (`id_etiqueta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semilla_etiqueta`
--

LOCK TABLES `semilla_etiqueta` WRITE;
/*!40000 ALTER TABLE `semilla_etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `semilla_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanalisis`
--

DROP TABLE IF EXISTS `tanalisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tanalisis` (
  `cod_analisis` bigint NOT NULL AUTO_INCREMENT,
  `fec_analisis` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_url` varchar(2050) DEFAULT NULL,
  `num_duracion` bigint DEFAULT NULL,
  `nom_entidad` varchar(100) NOT NULL,
  `cod_rastreo` bigint NOT NULL,
  `cod_guideline` bigint NOT NULL,
  `checks_ejecutados` text,
  `estado` int NOT NULL,
  `cod_fuente` mediumtext,
  `ref_cod_fuente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_analisis`),
  KEY `cod_guideline` (`cod_guideline`),
  KEY `basic_service` (`nom_entidad`,`cod_rastreo`) USING BTREE,
  KEY `tanalisis_cod_rastreo` (`cod_rastreo`)
) ENGINE=InnoDB AUTO_INCREMENT=2309 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanalisis`
--

LOCK TABLES `tanalisis` WRITE;
/*!40000 ALTER TABLE `tanalisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tanalisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanalisis_accesibilidad`
--

DROP TABLE IF EXISTS `tanalisis_accesibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tanalisis_accesibilidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analisis` int NOT NULL,
  `url` varchar(256) DEFAULT NULL,
  `checks_ok` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_analisis_UNIQUE` (`id_analisis`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanalisis_accesibilidad`
--

LOCK TABLES `tanalisis_accesibilidad` WRITE;
/*!40000 ALTER TABLE `tanalisis_accesibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tanalisis_accesibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanalisis_css`
--

DROP TABLE IF EXISTS `tanalisis_css`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tanalisis_css` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(2050) DEFAULT NULL,
  `codigo` mediumtext,
  `cod_analisis` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `cod_analisis` (`cod_analisis`)
) ENGINE=InnoDB AUTO_INCREMENT=28818 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanalisis_css`
--

LOCK TABLES `tanalisis_css` WRITE;
/*!40000 ALTER TABLE `tanalisis_css` DISABLE KEYS */;
/*!40000 ALTER TABLE `tanalisis_css` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termino`
--

DROP TABLE IF EXISTS `termino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termino` (
  `id_termino` bigint NOT NULL AUTO_INCREMENT,
  `termino` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_termino`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termino`
--

LOCK TABLES `termino` WRITE;
/*!40000 ALTER TABLE `termino` DISABLE KEYS */;
/*!40000 ALTER TABLE `termino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tguidelines`
--

DROP TABLE IF EXISTS `tguidelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tguidelines` (
  `cod_guideline` bigint NOT NULL AUTO_INCREMENT,
  `des_guideline` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_guideline`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tguidelines`
--

LOCK TABLES `tguidelines` WRITE;
/*!40000 ALTER TABLE `tguidelines` DISABLE KEYS */;
INSERT INTO `tguidelines` VALUES (1,'observatorio-inteco-1-0.xml'),(2,'observatorio-une-2012.xml'),(8,'observatorio-une-2012-b.xml'),(9,'observatorio-une-en2019.xml'),(10,'observatorio-accesibilidad.xml');
/*!40000 ALTER TABLE `tguidelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tincidencia`
--

DROP TABLE IF EXISTS `tincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tincidencia` (
  `cod_incidencia` bigint NOT NULL DEFAULT '0',
  `cod_comprobacion` bigint NOT NULL,
  `cod_analisis` bigint NOT NULL,
  `cod_linea_fuente` bigint NOT NULL,
  `cod_columna_fuente` bigint NOT NULL,
  `des_fuente` text,
  KEY `cod_analisis` (`cod_analisis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tincidencia`
--

LOCK TABLES `tincidencia` WRITE;
/*!40000 ALTER TABLE `tincidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_lista`
--

DROP TABLE IF EXISTS `tipo_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_lista` (
  `id_tipo` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_lista`
--

LOCK TABLES `tipo_lista` WRITE;
/*!40000 ALTER TABLE `tipo_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_rol`
--

DROP TABLE IF EXISTS `tipo_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_rol` (
  `id_tipo` bigint NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_rol`
--

LOCK TABLES `tipo_rol` WRITE;
/*!40000 ALTER TABLE `tipo_rol` DISABLE KEYS */;
INSERT INTO `tipo_rol` VALUES (1,'Normal'),(2,'Cliente'),(3,'Observatorio');
/*!40000 ALTER TABLE `tipo_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `apellidos` varchar(150) COLLATE utf8_bin NOT NULL,
  `departamento` varchar(100) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'username','password-md5','Nombre','Apellidos','Departamento','email@mail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cartucho`
--

DROP TABLE IF EXISTS `usuario_cartucho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_cartucho` (
  `id_usuario` bigint NOT NULL,
  `id_cartucho` bigint NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_cartucho`),
  KEY `id_cartucho` (`id_cartucho`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cartucho`
--

LOCK TABLES `usuario_cartucho` WRITE;
/*!40000 ALTER TABLE `usuario_cartucho` DISABLE KEYS */;
INSERT INTO `usuario_cartucho` VALUES (1,1),(1,2),(1,8),(1,9),(1,10);
/*!40000 ALTER TABLE `usuario_cartucho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `usuario` bigint NOT NULL,
  `id_rol` bigint NOT NULL,
  PRIMARY KEY (`usuario`,`id_rol`),
  KEY `id_rol` (`id_rol`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oaw'
--

--
-- Final view structure for view `oaw_dashboard`
--

/*!50001 DROP TABLE IF EXISTS `oaw_dashboard`*/;
/*!50001 DROP VIEW IF EXISTS `oaw_dashboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oaw_dashboard` AS select `basic_service`.`id` AS `id`,`basic_service`.`usr` AS `usr`,`basic_service`.`domain` AS `url`,`basic_service`.`email` AS `email`,`basic_service`.`depth` AS `depth`,`basic_service`.`width` AS `width`,`basic_service`.`report` AS `report`,`basic_service`.`date` AS `date`,`basic_service`.`status` AS `status`,`basic_service`.`analysis_type` AS `analysis_type`,`basic_service`.`in_directory` AS `in_directory` from `basic_service` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 13:01:03
