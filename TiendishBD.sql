-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendash
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carritos` (
  `ID_Carrito` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Carrito`),
  UNIQUE KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `ID_Compra` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Compra` varchar(100) DEFAULT NULL,
  `Codigo_Usuario_Comprador` int(11) NOT NULL,
  `Codigo_Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `Monto_Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Compra`),
  UNIQUE KEY `Codigo_Compra` (`Codigo_Compra`),
  KEY `Codigo_Usuario_Comprador` (`Codigo_Usuario_Comprador`),
  KEY `Codigo_Producto` (`Codigo_Producto`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Codigo_Usuario_Comprador`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`Codigo_Producto`) REFERENCES `productos` (`Codigo_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carritos`
--

DROP TABLE IF EXISTS `detalle_carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_carritos` (
  `ID_Carrito` int(11) DEFAULT NULL,
  `Codigo_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  KEY `ID_Carrito` (`ID_Carrito`),
  KEY `Codigo_Producto` (`Codigo_Producto`),
  CONSTRAINT `detalle_carritos_ibfk_1` FOREIGN KEY (`ID_Carrito`) REFERENCES `carritos` (`ID_Carrito`),
  CONSTRAINT `detalle_carritos_ibfk_2` FOREIGN KEY (`Codigo_Producto`) REFERENCES `productos` (`Codigo_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carritos`
--

LOCK TABLES `detalle_carritos` WRITE;
/*!40000 ALTER TABLE `detalle_carritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiales`
--

DROP TABLE IF EXISTS `historiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historiales` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Producto`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `historiales_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `historiales_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`Codigo_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiales`
--

LOCK TABLES `historiales` WRITE;
/*!40000 ALTER TABLE `historiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `historiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `Codigo_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Usuario_Vendedor` int(11) NOT NULL,
  `Foto_Producto` varchar(1000) NOT NULL,
  `Descripcion` text NOT NULL,
  `Categoria` int(11) NOT NULL,
  `Existencia` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Codigo_Producto`),
  KEY `Categoria` (`Categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `sub_categorias` (`ID_Subcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categorias`
--

DROP TABLE IF EXISTS `sub_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categorias` (
  `ID_Subcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Subcategoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Subcategoria`),
  UNIQUE KEY `Nombre_Subcategoria` (`Nombre_Subcategoria`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `sub_categorias_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categorias`
--

LOCK TABLES `sub_categorias` WRITE;
/*!40000 ALTER TABLE `sub_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Nombre_Usuario` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Contrasena` varbinary(100) NOT NULL,
  `Foto_perfil` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `Codigo_Venta` varchar(100) NOT NULL,
  `Codigo_Usuario_Comprador` int(11) NOT NULL,
  `Codigo_Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `Fecha_Envio` date NOT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `Monto_Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Codigo_Venta`),
  KEY `Codigo_Usuario_Comprador` (`Codigo_Usuario_Comprador`),
  KEY `Codigo_Producto` (`Codigo_Producto`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`Codigo_Usuario_Comprador`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`Codigo_Producto`) REFERENCES `productos` (`Codigo_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tiendish'
--

--
-- Dumping routines for database 'tiendish'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 13:16:58
