-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mercados_online
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `categoria_negocios`
--

DROP TABLE IF EXISTS `categoria_negocios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_negocios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_negocios`
--

LOCK TABLES `categoria_negocios` WRITE;
/*!40000 ALTER TABLE `categoria_negocios` DISABLE KEYS */;
INSERT INTO `categoria_negocios` VALUES (1,'TIENDAS',1),(2,'RESTAURANTES',1),(3,'FERRETERIAS',1),(4,'BAZARES',1);
/*!40000 ALTER TABLE `categoria_negocios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_productos`
--

DROP TABLE IF EXISTS `categoria_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_productos`
--

LOCK TABLES `categoria_productos` WRITE;
/*!40000 ALTER TABLE `categoria_productos` DISABLE KEYS */;
INSERT INTO `categoria_productos` VALUES (1,'MARISCOS',1,'2020-06-17 04:26:13'),(2,'VIVERES',1,'2020-06-17 04:26:13'),(3,'PAPELERIA',1,'2020-06-17 04:26:13'),(4,'CARNES',1,'2020-06-17 04:26:13'),(5,'MARISCOS',1,'2020-06-17 04:26:13'),(6,'VERDURAS',1,'2020-06-17 04:26:13'),(7,'VARIOS',1,'2020-06-17 04:26:13'),(8,'FRUTAS',1,'2020-07-27 03:21:56'),(9,'LEGUMBRES',1,'2020-07-27 03:21:56'),(10,'HORTALIZAS',1,'2020-07-27 03:21:56'),(11,'VERDURAS',1,'2020-07-27 03:21:56'),(12,'LÁCTEOS',1,'2020-07-27 03:21:56'),(13,'FERMENTOS',1,'2020-07-27 03:21:56'),(14,'CÁRNICOS',1,'2020-07-27 03:21:56'),(15,'EMBUTIDOS',1,'2020-07-27 03:21:56'),(16,'CONSERVAS',1,'2020-07-27 03:21:56'),(17,'PULPAS',1,'2020-07-27 03:21:56'),(18,'CEREALES',1,'2020-07-27 03:21:56'),(19,'HARINAS',1,'2020-07-27 03:21:56'),(20,'CHOCOLATE',1,'2020-07-27 03:21:56'),(21,'REPOSTERIA',1,'2020-07-27 03:21:56'),(22,'BIO INSUMOS',1,'2020-07-27 03:21:56'),(23,'PRODUCTOS APÍCOLAS',1,'2020-07-27 03:21:56'),(24,'COSMÉTICOS',1,'2020-07-27 03:21:56'),(25,'ARTESANIAS',1,'2020-07-27 03:21:56'),(26,'OTROS',1,'2020-07-27 03:21:56');
/*!40000 ALTER TABLE `categoria_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_venta` bigint(20) unsigned NOT NULL,
  `id_vendedor` bigint(20) unsigned NOT NULL,
  `id_puesto` bigint(20) unsigned DEFAULT NULL,
  `id_producto` bigint(20) unsigned NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_pedido_id_venta_foreign` (`id_venta`),
  KEY `detalle_pedido_id_vendedor_foreign` (`id_vendedor`),
  KEY `detalle_pedido_id_puesto_foreign` (`id_puesto`),
  KEY `detalle_pedido_id_producto_foreign` (`id_producto`),
  CONSTRAINT `detalle_pedido_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  CONSTRAINT `detalle_pedido_id_puesto_foreign` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id`),
  CONSTRAINT `detalle_pedido_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `detalle_pedido_id_venta_foreign` FOREIGN KEY (`id_venta`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,9,1,9,3,5,15),(2,1,9,1,10,1,4,4),(3,2,5,NULL,11,80,2,160),(4,3,9,1,10,1,2,2),(5,4,5,NULL,11,80,1,80),(6,5,5,NULL,11,80,4,320),(7,6,5,NULL,11,80,4,320),(8,7,5,NULL,6,5,3,15),(9,8,9,1,10,1,1,1),(10,9,9,1,9,3,1,3),(11,9,9,1,10,1,1,1),(12,10,66,11,54,78.88,2,157.76),(13,11,66,11,54,78.88,1,78.88),(14,12,63,9,57,10,1,10),(15,12,64,10,53,1,1,1),(16,13,57,6,28,5,2,10),(17,13,57,6,31,22,4,88),(18,13,57,6,29,10,2,20),(19,14,57,6,32,8.5,2,17),(20,15,5,NULL,13,10,2,20),(21,16,9,1,10,1,3,3),(22,17,5,NULL,11,80,6,480),(23,18,9,1,9,3,1,3),(24,19,9,1,9,3,1,3),(25,20,9,1,9,3,1,3),(26,20,9,1,10,1,1,1),(27,21,9,1,9,3,2,6),(28,21,9,1,10,1,3,3),(29,22,9,1,9,3,5,15),(30,22,9,1,10,1,1,1),(31,23,9,1,9,3,4,12),(32,23,9,1,10,1,2,2),(33,24,9,1,9,3,2,6),(34,24,9,1,10,1,2,2),(35,25,9,1,9,3,5,15),(36,25,50,4,26,5,5,25),(37,26,9,1,9,3,4,12),(38,26,9,1,10,1,3,3),(39,26,50,4,26,5,2,10),(40,26,63,9,52,5,1,5),(41,27,64,10,53,1,1,1),(42,27,64,10,62,6,1,6),(43,27,97,16,64,1,2,2),(44,28,9,1,9,3,3,9),(45,28,9,1,10,1,4,4),(46,28,50,4,26,5,5,25),(47,29,9,1,9,3,3,9),(48,29,9,1,10,1,3,3),(49,29,50,4,26,5,2,10),(50,30,9,1,9,3,1,3),(51,30,9,1,10,1,4,4),(52,30,50,4,26,5,4,20),(53,31,9,1,9,3,10,30),(54,31,9,1,10,1,5,5),(55,31,50,4,26,5,6,30),(56,32,9,1,9,3,5,15),(57,32,9,1,10,1,4,4),(58,32,50,4,26,5,4,20),(59,32,64,10,53,1,4,4),(60,33,9,1,9,3,3,9),(61,33,9,1,10,1,3,3),(62,34,9,1,9,3,3,9),(63,35,9,1,9,3,4,12),(64,36,59,7,49,2.5,3,7.5),(65,36,59,7,51,2.5,1,2.5),(66,36,57,6,34,3,1,3),(67,37,59,7,47,0.8,3,2.4),(68,37,59,7,48,1.3,3,3.9),(69,37,59,7,50,1.4,3,4.2),(70,38,51,5,27,4.99,1,4.99),(71,39,59,7,47,0.8,1,0.8),(72,40,9,1,9,3,2,6);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercados`
--

DROP TABLE IF EXISTS `mercados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_mercado` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'GUAYAQUIL',
  `latitud` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `longitud` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `url_imagen` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercados`
--

LOCK TABLES `mercados` WRITE;
/*!40000 ALTER TABLE `mercados` DISABLE KEYS */;
INSERT INTO `mercados` VALUES (1,'MER-1','Mercado Central','Mercado de Viveres varios','CALLE 36AVA #1117 ENTRE ARGENTINA Y PORTETE','GUAYAQUIL',NULL,NULL,'2020-06-18 02:25:41',1,'images/mer-1.jpg'),(2,'MER-2','FERIA DE LA MATA A LA MESA GUAYAS','COMERCIALIZA PRODUCTOS AGRICOLAS Y ARTESANALES  ASESORADOS POR EL MINISERIO DE AGRICULTURA Y GANADERIA','GUAYAQUIL','GUAYAQUIL',NULL,NULL,'2020-07-15 15:33:09',1,'images/mer-2.jpg'),(4,'MER-3','Fernando','fernandozzhunio','EL FORTIN BLOQUE 8 MANZANA1511 SOLAR17','GUAYAQUIL',NULL,NULL,'2020-08-27 17:17:16',1,'images/mer-4.jpg'),(8,'MER-5','fernando Zhunio','fernandozzhunio','EL FORTIN BLOQUE 8 MANZANA1511 SOLAR17','GUAYAQUIL',NULL,NULL,'2020-08-31 16:56:25',1,'images/mer-8.jpg'),(9,'MER-9','Alfonso','fernando','EL FORTIN BLOQUE 8 MANZANA1511 SOLAR17','GUAYAQUIL',NULL,NULL,'2020-08-31 16:57:20',1,'images/mer-9.jpg');
/*!40000 ALTER TABLE `mercados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_bin NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2020_03_19_014653_create_usuarios_table',1),(2,'2020_03_20_040655_create_mercados_table',1),(3,'2020_03_20_201507_create_puestos_table',1),(4,'2020_03_21_001813_create_categoria_productos_table',1),(5,'2020_03_21_002451_create_productos_table',1),(6,'2020_03_21_002549_create_pedidos_table',1),(7,'2020_03_21_002614_create_detalle_pedido_table',1),(8,'2020_03_21_004943_create_ubicacion_pedidos_table',1),(9,'2020_04_14_034234_create_categoria_negocios_table',1),(10,'2020_05_13_200626_create_negocios_table',1),(11,'2020_05_14_164025_create_producto_puestos_table',1),(12,'2020_05_14_164307_create_producto_negocios_table',1),(13,'2020_05_17_003214_create_parametros_table',1),(14,'2020_06_14_225337_create_negocios_subcategorias_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocios`
--

DROP TABLE IF EXISTS `negocios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(1000) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'GUAYAQUIL',
  `latitud` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `longitud` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creditos_totales` decimal(8,2) DEFAULT '0.00',
  `tipo_negocio` bigint(20) unsigned NOT NULL,
  `url_imagen` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '2',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualiza` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `negocios_tipo_negocio_foreign` (`tipo_negocio`),
  CONSTRAINT `negocios_tipo_negocio_foreign` FOREIGN KEY (`tipo_negocio`) REFERENCES `categoria_negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocios`
--

LOCK TABLES `negocios` WRITE;
/*!40000 ALTER TABLE `negocios` DISABLE KEYS */;
INSERT INTO `negocios` VALUES (1,5,'tienda 3 hermanos','tienda de barrio','Muisne 712, Guayaquil 090403, Ecuador','Guayaquil','-2.2216284534902817','-79.93714068084955','593923666666',18.75,1,'images/neg-1.jpg',1,'2020-06-18 13:29:02',NULL),(2,7,'MI DULCE MANABITA ','CAFETERÍA Y ALGO MÁS ','2do Callejon 11A NO 111, Guayaquil 090512, Ecuador','Guayaquil','-2.17321299538901','-79.89946905523539','593958911071',1011.00,1,'images/neg-2.jpg',1,'2020-06-18 16:39:05',NULL),(3,5,'Ferreteria Riego','riegos automatizados','Diez de Agosto 1315, Guayaquil 090311, Ecuador','Guayaquil','-2.193775961912131','-79.89061743021011','593978675645',3.75,3,'images/neg-3.jpg',1,'2020-06-19 00:43:46',NULL),(4,5,'Muebleria Modern','los mejores escritorios para home office','57A, San Francisco de Asis Plan Piloto 090405, Ecuador','Guayaquil','-2.223854017028727','-79.93565641343595','593988111111',100.00,1,'images/neg-4.jpg',1,'2020-06-19 16:13:44',NULL),(5,5,'Repuestos 2x3','repuestos de todas las marcas a los mejores precios','Calle Tulcán 931, Guayaquil 090310, Ecuador','Guayaquil','-2.189363270055164','-79.89514164626598','593988997777',100.00,3,'images/neg-5.jpg',1,'2020-06-20 15:14:59',NULL),(6,5,'Tienda PETIS','Las mejores cosas para tu mascota','Av. del Ejército 1136, Guayaquil 090311, Ecuador','Guayaquil','-2.1932154559538044','-79.89353232085705','593922223322',99.75,1,'images/neg-6.jpg',1,'2020-06-20 15:17:06',NULL),(7,5,'Come numeros','Comete las mejores series numericas, 100% Real','Av. 9 NO 704, Guayaquil 090514, Ecuador','Guayaquil','-2.1873209173476336','-79.89551246166229','593933222200',100.00,2,'images/neg-7.jpg',1,'2020-06-20 15:27:56',NULL),(8,5,'Bazar RFID','Todo lo que necesitas para RFID','Clemente Ballén 1224, Guayaquil 090312, Ecuador','Guayaquil','-2.192900862260557','-79.89007394760847','593955552233',100.00,4,'images/neg-8.jpg',1,'2020-06-20 15:28:55',NULL),(9,2,'olga','artículos para hogar','Joaquín José Orrantia González 100, Guayaquil 090505, Ecuador','Guayaquil','-2.1547976','-79.8928602','593993051947',0.00,3,'images/neg-9.jpg',2,'2020-06-20 22:58:56',NULL),(10,17,'Sistemas y Conttoles','Venta de Software','Los Rios 928, Guayaquil 090311, Ecuador','Guayaquil','-2.1893092','-79.8945224','593995285101',10.00,1,'images/neg-10.jpg',1,'2020-06-27 16:26:15',NULL),(11,26,'tratoria','clmida italiana','Los Rios 928, Guayaquil 090311, Ecuador','Guayaquil','-2.1893131','-79.8945042','593995205101',10.00,2,'images/neg-11.jpg',1,'2020-06-27 16:55:36',NULL),(12,33,'fruteria leon','fruteria y verdureria','Av. Mare de Déu de Bellvitge, 86, 08907 L\'Hospitalet de Llobregat, Barcelona, Spain','Barcelona','41.349314899999996','2.1075736','34640876497',10.00,1,'images/neg-12.jpg',1,'2020-06-29 18:22:21',NULL),(13,33,'Bar celona','Bar Restaurante Bellvitge','Carrer del Prat, 44, 08907 L\'Hospitalet de Llobregat, Barcelona, Spain','Barcelona','41.3509448','2.106113','34640876497',10.00,2,'images/neg-13.jpg',1,'2020-07-06 19:09:27',NULL),(14,43,'FLORERIA MICHAEL','TODO TIPO DE ARREGLOS Y PLANTAS ORNAMENTALES','Los Rios 928, Guayaquil 090311, Ecuador','Guayaquil','-2.1893234','-79.8945102','593995205101',10.00,1,'images/neg-14.jpg',1,'2020-07-14 21:22:24',NULL),(15,34,'HECTOR PLASTICS','FABRICACION DISTRIBUCIÓN DE PLASTICOS EN GENERAL','59, Pradera 2 090108, Ecuador','Guayaquil','-2.2384614','-79.8907077','593988341038',10.00,4,'images/neg-15.jpg',1,'2020-07-20 21:20:53',NULL),(16,34,'PLÁSTICOS HECTOR','FABRICACION DISTRIBUCIÓN VENTA DE PRODUCTOS PLASTICOS, LIBROS, Y PERFUMES EN GENERAL','3B, Casitas del Guasmo Nte. 090107, Ecuador','Guayaquil','-2.2449899','-79.8841815','593988341038',5.00,1,'images/neg-16.jpg',1,'2020-07-24 14:08:14',NULL);
/*!40000 ALTER TABLE `negocios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocios_subcategorias`
--

DROP TABLE IF EXISTS `negocios_subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocios_subcategorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `orden` int(11) NOT NULL,
  `id_negocio` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocios_subcategorias`
--

LOCK TABLES `negocios_subcategorias` WRITE;
/*!40000 ALTER TABLE `negocios_subcategorias` DISABLE KEYS */;
INSERT INTO `negocios_subcategorias` VALUES (1,'Todos',1,1),(2,'Todos',1,2),(6,'Todos',1,3),(7,'3 platos',2,1),(8,'riego con BLE',2,3),(9,'pomadas al 50%',3,1),(10,'naturales estan  de moda',4,1),(11,'promo del dia del ambiente',5,1),(12,'Todos',1,4),(13,'descuento en mesas',3,3),(14,'Todos',1,5),(15,'Todos',1,6),(16,'promocion en baterias',2,5),(17,'Elementos Pets',2,6),(18,'Todos',1,7),(19,'Todos',1,8),(20,'10% descuento en nuevos clientes',2,7),(21,'20%  descuentos de 10am a 2pm',2,8),(22,'Todos',1,9),(23,'2 por 1',2,9),(24,'todos',3,9),(25,'Todos',1,10),(26,'Lanzamiento',2,10),(27,'Todos',1,11),(28,'Todos',1,12),(29,'Todos',1,13),(30,'Todos',1,14),(31,'Todos',1,15),(32,'Todos',1,16);
/*!40000 ALTER TABLE `negocios_subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parametro` varchar(255) COLLATE utf8_bin NOT NULL,
  `valor` varchar(255) COLLATE utf8_bin NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,'MAX_DISTANCE_KM','1000',1,'2020-06-17 04:26:13');
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) unsigned NOT NULL,
  `id_establecimiento` bigint(20) unsigned DEFAULT NULL,
  `id_transportista` bigint(20) unsigned DEFAULT NULL,
  `costo_venta` double NOT NULL,
  `costo_envio` double NOT NULL DEFAULT '0',
  `total` double NOT NULL,
  `forma_pago` enum('EFECTIVO','TARJETA') COLLATE utf8_bin NOT NULL DEFAULT 'EFECTIVO',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualiza` timestamp NULL DEFAULT NULL,
  `tipo` enum('MERCADO','NEGOCIO') COLLATE utf8_bin NOT NULL DEFAULT 'MERCADO',
  PRIMARY KEY (`id`),
  KEY `pedidos_id_usuario_foreign` (`id_usuario`),
  KEY `pedidos_fecha_registro_index` (`fecha_registro`),
  CONSTRAINT `pedidos_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,4,1,0,19,2,21,'EFECTIVO','2020-06-19 18:39:54',NULL,'MERCADO'),(2,4,3,NULL,160,0,162,'EFECTIVO','2020-06-19 18:42:14',NULL,'NEGOCIO'),(3,4,1,0,2,2,4,'EFECTIVO','2020-06-19 18:54:17',NULL,'MERCADO'),(4,4,3,NULL,80,0,82,'EFECTIVO','2020-06-19 18:58:31',NULL,'NEGOCIO'),(5,4,3,NULL,320,0,322,'EFECTIVO','2020-06-19 19:03:28',NULL,'NEGOCIO'),(6,4,3,NULL,320,2,322,'EFECTIVO','2020-06-19 20:17:38',NULL,'NEGOCIO'),(7,6,1,NULL,15,2,17,'EFECTIVO','2020-06-20 22:46:54',NULL,'NEGOCIO'),(8,6,1,0,1,2,3,'EFECTIVO','2020-06-20 22:47:07',NULL,'MERCADO'),(9,41,1,0,4,2,6,'EFECTIVO','2020-07-11 13:56:15',NULL,'MERCADO'),(10,65,1,0,157.76,2,159.76,'EFECTIVO','2020-07-22 17:43:52',NULL,'MERCADO'),(11,65,1,0,78.88,2,80.88,'EFECTIVO','2020-07-22 17:59:20',NULL,'MERCADO'),(12,44,1,0,11,2,13,'EFECTIVO','2020-07-27 20:39:03',NULL,'MERCADO'),(13,44,2,0,118,2,120,'EFECTIVO','2020-07-27 22:12:10',NULL,'MERCADO'),(14,44,2,0,17,2,19,'EFECTIVO','2020-07-27 22:14:31',NULL,'MERCADO'),(15,103,6,NULL,20,2,22,'EFECTIVO','2020-07-31 21:04:07',NULL,'NEGOCIO'),(16,103,1,0,3,2,5,'EFECTIVO','2020-07-31 21:06:52',NULL,'MERCADO'),(17,4,3,NULL,480,2,482,'EFECTIVO','2020-07-31 22:23:07',NULL,'NEGOCIO'),(18,4,1,0,3,2,5,'EFECTIVO','2020-08-19 06:13:51',NULL,'MERCADO'),(19,4,1,0,3,2,5,'EFECTIVO','2020-08-19 06:17:58',NULL,'MERCADO'),(20,4,1,0,4,2,6,'EFECTIVO','2020-08-19 12:13:45',NULL,'MERCADO'),(21,4,1,0,9,2,11,'EFECTIVO','2020-08-19 12:19:47',NULL,'MERCADO'),(22,4,1,0,16,2,18,'EFECTIVO','2020-08-19 12:24:00',NULL,'MERCADO'),(23,4,1,0,14,2,16,'EFECTIVO','2020-08-19 12:28:07',NULL,'MERCADO'),(24,4,1,0,8,2,10,'EFECTIVO','2020-08-20 04:07:20',NULL,'MERCADO'),(25,4,1,0,40,2,42,'EFECTIVO','2020-08-20 04:11:27',NULL,'MERCADO'),(26,4,1,0,30,2,32,'EFECTIVO','2020-08-20 04:14:27',NULL,'MERCADO'),(27,4,1,0,9,2,11,'EFECTIVO','2020-08-20 04:16:22',NULL,'MERCADO'),(28,4,1,0,38,2,40,'EFECTIVO','2020-08-20 04:26:18',NULL,'MERCADO'),(29,4,1,0,22,2,24,'EFECTIVO','2020-08-20 04:28:46',NULL,'MERCADO'),(30,4,1,0,27,2,29,'EFECTIVO','2020-08-20 04:30:25',NULL,'MERCADO'),(31,4,1,0,65,2,67,'EFECTIVO','2020-08-20 04:32:31',NULL,'MERCADO'),(32,4,1,0,43,2,45,'EFECTIVO','2020-08-21 01:52:29',NULL,'MERCADO'),(33,4,1,0,12,2,14,'EFECTIVO','2020-08-21 03:21:34',NULL,'MERCADO'),(34,4,1,0,9,2,11,'EFECTIVO','2020-08-21 03:25:04',NULL,'MERCADO'),(35,4,1,0,12,2,14,'EFECTIVO','2020-08-21 03:26:42',NULL,'MERCADO'),(36,126,2,0,13,2,15,'EFECTIVO','2020-08-21 03:37:59',NULL,'MERCADO'),(37,126,2,116,10.5,2,12.5,'EFECTIVO','2020-08-21 04:02:35',NULL,'MERCADO'),(38,126,2,116,4.99,2,6.99,'EFECTIVO','2020-08-21 21:25:31',NULL,'MERCADO'),(39,126,2,0,0.8,2,2.8,'EFECTIVO','2020-08-21 21:36:14',NULL,'MERCADO'),(40,4,1,0,6,2,8,'EFECTIVO','2020-08-22 01:30:01',NULL,'MERCADO');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_negocios`
--

DROP TABLE IF EXISTS `producto_negocios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_negocios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) unsigned NOT NULL,
  `id_negocio` bigint(20) unsigned NOT NULL,
  `id_promocion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_negocios_id_negocio_foreign` (`id_negocio`),
  CONSTRAINT `producto_negocios_id_negocio_foreign` FOREIGN KEY (`id_negocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_negocios`
--

LOCK TABLES `producto_negocios` WRITE;
/*!40000 ALTER TABLE `producto_negocios` DISABLE KEYS */;
INSERT INTO `producto_negocios` VALUES (1,6,1,9),(2,7,1,1),(3,8,1,11),(4,11,3,13),(5,12,5,14),(6,13,6,17),(7,14,7,20),(8,15,8,21),(9,16,1,9),(10,17,1,9),(11,18,9,23),(12,19,10,25),(13,20,10,26),(14,24,14,30),(15,25,14,30),(16,46,14,30);
/*!40000 ALTER TABLE `producto_negocios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_puestos`
--

DROP TABLE IF EXISTS `producto_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_puestos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) unsigned NOT NULL,
  `id_puesto` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_puestos_id_puesto_foreign` (`id_puesto`),
  CONSTRAINT `producto_puestos_id_puesto_foreign` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_puestos`
--

LOCK TABLES `producto_puestos` WRITE;
/*!40000 ALTER TABLE `producto_puestos` DISABLE KEYS */;
INSERT INTO `producto_puestos` VALUES (1,9,1),(2,10,1),(3,26,4),(4,27,5),(5,28,6),(6,29,6),(7,30,6),(8,31,6),(9,32,6),(10,33,6),(11,34,6),(12,35,6),(13,36,6),(14,37,6),(15,38,6),(16,39,6),(17,40,6),(18,41,6),(19,42,6),(20,43,6),(21,44,6),(22,45,6),(23,47,7),(24,48,7),(25,49,7),(26,50,7),(27,51,7),(28,52,9),(29,53,10),(30,54,11),(31,56,13),(32,57,9),(33,58,9),(34,59,13),(35,60,13),(36,61,13),(37,62,10),(38,63,14),(39,64,16),(40,65,6),(41,66,16),(42,67,16),(43,68,16),(44,69,18),(45,70,18),(46,71,18),(47,72,18),(48,73,18),(49,74,18),(50,75,19),(51,76,20),(52,77,20),(53,78,20),(54,79,21),(55,80,21),(56,81,21);
/*!40000 ALTER TABLE `producto_puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `id_categoria` bigint(20) unsigned DEFAULT NULL,
  `precio` double NOT NULL,
  `unidades` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url_imagen` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `stock` int(11) NOT NULL DEFAULT '0',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualiza` timestamp NULL DEFAULT NULL,
  `fuente` enum('PUESTO','NEGOCIO') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_id_categoria_foreign` (`id_categoria`),
  CONSTRAINT `productos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (6,'escorpiones','efectivos para el alcanfor de la abuelita',7,5,'Docena','images/prod-6.jpg',1,-3,'2020-06-19 01:50:54',NULL,'NEGOCIO'),(7,'Plantas para sembrio','plantas de sembrar, recien estan creciendo',7,20,'Unidad','images/prod-7.jpg',1,0,'2020-06-19 01:59:39',NULL,'NEGOCIO'),(8,'bateria 12V','idela para penel solar de 30 watts y 50w',7,50,'Unidad','images/prod-8.jpg',1,0,'2020-06-19 03:21:23',NULL,'NEGOCIO'),(9,'pescado fresco','fresquito del mar a ma mesa, recien salido',1,3,'Libra','images/prod-9.jpg',1,-65,'2020-06-19 18:37:57',NULL,'PUESTO'),(10,'panes ','panes frescos',2,1,'Docena','images/prod-10.jpg',1,-46,'2020-06-19 18:38:41',NULL,'PUESTO'),(11,'mesa metalica','mesa inivadora',7,80,'Unidad','images/prod-11.jpg',1,-17,'2020-06-19 18:41:23',NULL,'NEGOCIO'),(12,'Bateria 12V','baterias para motos',7,23,'Unidad','images/prod-12.jpg',1,0,'2020-06-20 15:20:00',NULL,'NEGOCIO'),(13,'plato para perros','plato para comida de perros y gatos, hay en diferentes modelos',7,10,'Unidad','images/prod-13.jpg',1,-2,'2020-06-20 15:21:33',NULL,'NEGOCIO'),(14,'Series Ricas','las mejores series, a precio incomparables',4,3,'Unidad','images/prod-14.jpg',1,0,'2020-06-20 15:33:43',NULL,'NEGOCIO'),(15,'Tags','tags EPC, ISO',3,10,'Docena','images/prod-15.jpg',1,0,'2020-06-20 15:34:59',NULL,'NEGOCIO'),(16,'Pomada Scorpiones2','la mejor pomada ',7,12,'Unidad','images/prod-16.jpg',1,0,'2020-06-20 15:51:06',NULL,'NEGOCIO'),(17,'Aguijon des Scorpion','pura pulpa',7,15,'Unidad','images/prod-17.jpg',1,0,'2020-06-20 15:52:54',NULL,'NEGOCIO'),(18,'display ','para lapto',7,34.44,'Unidad','images/prod-18.jpg',1,0,'2020-06-20 23:00:22',NULL,'NEGOCIO'),(19,'MERCDOS ONLINE','VENTAS EN LINEA',7,0.3,'Unidad','images/prod-19.jpg',1,0,'2020-06-27 16:37:40',NULL,'NEGOCIO'),(20,'Plataforma Aula','Plataforma  Academica',7,5,'Unidad','images/prod-20.jpg',1,0,'2020-06-27 16:40:10',NULL,'NEGOCIO'),(24,'Flores Pequeñas  en Maceta Elegante','FLORES MULTICOLORES EN MACERA ELEGANTE PARA ADORNR JARDINES ',7,8,'Unidad','images/prod-24.jpg',1,0,'2020-07-14 21:27:40',NULL,'NEGOCIO'),(25,'FLOR DEL BOSQUE','FLOR EN ELEGANTE MACETERO PAR ADORBAR TERRAZAS',3,20,'Unidad','images/prod-25.jpg',1,0,'2020-07-14 21:30:47',NULL,'NEGOCIO'),(26,'Cultivo de kombucha ORGANICA','1 kombucha scoby + 1 copa de líquido iniciador fuerte, para preparar 1/2 galón\n\n',7,5,'Unidad','images/prod-26.jpg',1,-28,'2020-07-15 17:10:24',NULL,'PUESTO'),(27,'Cultivo de SCOBY Kombucha Organica','1 kombucha scoby + 1 copa de líquido iniciador fuerte, para preparar 1/2 galón',7,4.99,'Unidad','images/prod-27.jpg',1,-1,'2020-07-15 17:32:41',NULL,'PUESTO'),(28,'Miel de abeja','Orgánica 100% Pura 200ml',23,5,'Unidad','images/prod-28.jpg',1,-2,'2020-07-16 16:50:39',NULL,'PUESTO'),(29,'Polen deshidratado','Orgánico 100% natural 180gr',23,10,'Unidad','images/prod-29.jpg',1,-2,'2020-07-16 17:20:43',NULL,'PUESTO'),(30,'Propóleo','Gotero 25 ml',23,4.5,'Unidad','images/prod-30.jpg',1,0,'2020-07-16 17:36:56',NULL,'PUESTO'),(31,'Jalea Real','100% puro 10gr',23,22,'Unidad','images/prod-31.jpg',1,-4,'2020-07-16 17:38:24',NULL,'PUESTO'),(32,'Propóleo','Splash 60ml',23,8.5,'Unidad','images/prod-32.jpg',1,-2,'2020-07-16 18:00:53',NULL,'PUESTO'),(33,'Bálsamo labial 10g','Cera de abeja + Miel de abeja + Esencia de coco',23,3,'Unidad','images/prod-33.jpg',1,0,'2020-07-16 18:13:36',NULL,'PUESTO'),(34,'Bálsamo labial Almendra 10g','Cera de abeja +Miel de abeja+ Esencia de almendra',23,3,'Unidad','images/prod-34.jpg',1,-1,'2020-07-16 18:15:28',NULL,'PUESTO'),(35,'Pomada veneno de abeja','Crema analgésica y antiflamatoria',23,10,'Unidad','images/prod-35.jpg',1,0,'2020-07-16 18:19:07',NULL,'PUESTO'),(36,'Crema de veneno de abeja','(50g) Apitoxina y jalea real',23,10,'Unidad','images/prod-36.jpg',1,0,'2020-07-16 18:21:37',NULL,'PUESTO'),(37,'Crema hidratante','(50g) Cera de abeja+Miel de abeja+Jalea real',23,8,'Unidad','images/prod-37.jpg',1,0,'2020-07-16 18:24:20',NULL,'PUESTO'),(38,'Crema de Apitoxina ','(30g) Apitoxina, jalea y propóleo ',7,12,'Unidad','images/prod-38.jpg',0,0,'2020-07-16 18:27:10',NULL,'PUESTO'),(39,'Unguento natural','Crema desinflamatoria 50g',23,10,'Unidad','images/prod-39.jpg',1,0,'2020-07-16 18:30:23',NULL,'PUESTO'),(40,'Shampoo tratamiento capilar 200ml','Shampoo base+ Miel+ Propoleo+Jalea real+Romero',23,6,'Unidad','images/prod-40.jpg',1,0,'2020-07-16 18:33:23',NULL,'PUESTO'),(41,'Shampoo tratamiento capilar 200ml','Shampoo base+ Miel+ Propoleo+Jalea real+ Manzanilla',23,6,'Unidad','images/prod-41.jpg',1,0,'2020-07-16 18:41:47',NULL,'PUESTO'),(42,'Jabón 50g','Miel de abeja+Avena',23,3,'Gramo','images/prod-42.jpg',1,0,'2020-07-16 18:52:26',NULL,'PUESTO'),(43,'Jabón 80g','Miel de abeja +Polen + Propóleo',23,4,'Gramo','images/prod-43.jpg',1,0,'2020-07-16 18:54:23',NULL,'PUESTO'),(44,'Miel en panal','producto 100% natural 70gr',23,3,'Unidad','images/prod-44.jpg',1,0,'2020-07-16 18:59:28',NULL,'PUESTO'),(45,'Cera de abeja','Materia prima 1/2 libra',23,8,'Gramo','images/prod-45.jpg',1,0,'2020-07-16 19:07:59',NULL,'PUESTO'),(46,'ARROZ ','AROZ DE COLEES',2,3,'Unidad','images/prod-46.jpg',1,0,'2020-07-16 19:29:32',NULL,'NEGOCIO'),(47,'Cake de Naranja','Elaborado con harina de arroz',7,0.8,'Unidad','images/prod-47.jpg',1,-4,'2020-07-21 03:08:17',NULL,'PUESTO'),(48,'Arroz Saludable','Arroz biogénico, libre de pesticida',2,1.3,'Kilo','images/prod-48.jpg',1,-3,'2020-07-21 03:12:02',NULL,'PUESTO'),(49,'Arroz Saludable 2kilos','Arroz biogénico, libre de pesticidas',2,2.5,'Kilo','images/prod-49.jpg',1,-3,'2020-07-21 03:20:08',NULL,'PUESTO'),(50,'Harina de Arroz Saludable 1/2kilo','Harina de Arroz libre de pesticidas para coladas, papusas, cake. ',2,1.4,'Unidad','images/prod-50.jpg',1,-3,'2020-07-22 01:25:32',NULL,'PUESTO'),(51,'Moringa (dosis para un mes) ','Semilla de moringa rica en proteína, omega 3,6 y 9, hierro',7,2.5,'Unidad','images/prod-51.jpg',1,-1,'2020-07-22 03:08:47',NULL,'PUESTO'),(52,'CHURRASCO','CHURRASCO COSTEÑO',4,5,'Unidad','images/prod-52.jpg',1,-1,'2020-07-22 10:31:01',NULL,'PUESTO'),(53,'PAN DE DULCE ','PAN DE AMBATO BUENISIMO',7,1,'Unidad','images/prod-53.jpg',0,-6,'2020-07-22 11:17:45',NULL,'PUESTO'),(54,'crema','para el cabello',7,78.88,'Unidad','images/prod-54.jpg',1,-3,'2020-07-22 17:42:05',NULL,'PUESTO'),(56,'Bombones ','Rellenos de Mani',7,0.25,'Unidad','images/prod-56.jpg',1,0,'2020-07-27 15:56:28',NULL,'PUESTO'),(57,'ROMPOPE','ROMPOPE CLASICO BUENISISISMO',22,10,'Unidad','images/prod-57.jpg',1,-1,'2020-07-27 16:43:13',NULL,'PUESTO'),(58,'CERVEZA DE JOKOY','CERVEZA ARTESANAL',13,6,'Unidad','images/prod-58.jpg',1,0,'2020-07-27 16:49:54',NULL,'PUESTO'),(59,'Pasta de Cacao 100 gramos','cacao 100% pura . Cacao al 70% . Cacao 50%',20,2.5,'Unidad','images/prod-59.jpg',1,0,'2020-07-27 17:40:22',NULL,'PUESTO'),(60,'Nibs de Cacao 100 gramos','Cacao Tostado',20,1,'Unidad','images/prod-60.jpg',1,0,'2020-07-27 17:42:37',NULL,'PUESTO'),(61,'Abono Organico','Bocachi',23,10,'Quintal','images/prod-61.jpg',1,0,'2020-07-27 17:43:58',NULL,'PUESTO'),(62,'JARABE','JARABE ESPECIAL',13,6,'Unidad','images/prod-62.jpg',1,-1,'2020-07-27 20:25:23',NULL,'PUESTO'),(63,'Alfajores ','Galletas de dulce con relleno de dulce de leche, cubiertas de azucar glass',21,2.5,'Caja','images/prod-63.jpg',1,0,'2020-07-27 22:00:30',NULL,'PUESTO'),(64,'Eko Colada ','Deliciosa colada hecha a base de Harina de arroz integral (500ml)',7,1,'Unidad','images/prod-64.jpg',1,-2,'2020-07-27 22:44:58',NULL,'PUESTO'),(65,'Crema de Apitoxina ','30g Apitoxina+Jalea Real ',23,10,'Unidad','images/prod-65.jpg',1,0,'2020-07-27 22:52:30',NULL,'PUESTO'),(66,'Eko Cake ','Cake de harina de arroz integral (porción) ',21,1,'Unidad','images/prod-66.jpg',1,0,'2020-07-27 22:54:43',NULL,'PUESTO'),(67,'Eko Galleta ','Deliciosas porciones de Galletas a base de harina de arroz integral, con decorado de coco, ajonjolí, maní y pasas en sus diferentes presentaciones ',21,1,'Unidad','images/prod-67.jpg',1,0,'2020-07-27 22:58:10',NULL,'PUESTO'),(68,'Eko Harina','Nutritiva harina de arroz integral producida a base de cultivo libre de pesticidas químicos, alto en vitaminas y salud. ( 0.5 kg ) ',19,1,'Unidad','images/prod-68.jpg',1,0,'2020-07-27 23:03:29',NULL,'PUESTO'),(69,'Chocolates premium','chocolates con limón y sal',20,2.5,'Unidad','images/prod-69.jpg',1,0,'2020-07-28 19:50:18',NULL,'PUESTO'),(70,'Chocolates premium','Chocolates con café',20,2.5,'Unidad','images/prod-70.jpg',1,0,'2020-07-28 19:52:35',NULL,'PUESTO'),(71,'Chocolates al 70% cacao','endulzado con panela',20,2.5,'Unidad','images/prod-71.jpg',1,0,'2020-07-28 19:54:17',NULL,'PUESTO'),(72,'Chocolates al 100% cacao','sin azúcar',20,2.5,'Unidad','images/prod-72.jpg',1,0,'2020-07-28 19:56:32',NULL,'PUESTO'),(73,'cacao en polvo','100% cacao',20,2.5,'Unidad','images/prod-73.jpg',1,0,'2020-07-28 19:59:34',NULL,'PUESTO'),(74,'chocolate al 56% ','con frutas deshidratado y nibs',20,2.5,'Unidad','images/prod-74.jpg',1,0,'2020-07-28 20:01:27',NULL,'PUESTO'),(75,'yogurt','yogurt natural ',12,3,'Unidad','images/prod-75.jpg',1,0,'2020-08-01 15:24:34',NULL,'PUESTO'),(76,'Aderezo','jengibre y ubilla',16,3.5,'Unidad','images/prod-76.jpg',1,0,'2020-08-03 15:11:50',NULL,'PUESTO'),(77,'Mermeladas','frutas diversas',16,3,'Unidad','images/prod-77.jpg',1,0,'2020-08-03 15:12:47',NULL,'PUESTO'),(78,'Aderezo','frutilla',13,3.5,'Unidad','images/prod-78.jpg',1,0,'2020-08-03 15:14:50',NULL,'PUESTO'),(79,'Lazos Personalizados','Lazos realizados a,mano puede pedirlos en su tono o personaje favorito',25,3,'Unidad','images/prod-79.jpg',1,0,'2020-08-06 01:18:53',NULL,'PUESTO'),(80,'Manualidades','Forros decorativos cuadernos libros.  Maquetas Folder',25,5,'Unidad','images/prod-80.jpg',0,0,'2020-08-06 01:22:33',NULL,'PUESTO'),(81,'Bandita vinilo','Accesorio de cabello en banditas para nenas desde recien nacidas hasta,3,años diseños y tonos a su eleccion e',25,5,'Unidad','images/prod-81.jpg',1,0,'2020-08-20 13:04:14',NULL,'PUESTO');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puestos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_mercado` bigint(20) unsigned NOT NULL,
  `id_vendedor` bigint(20) unsigned DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualiza` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `puestos_id_mercado_foreign` (`id_mercado`),
  KEY `puestos_id_vendedor_foreign` (`id_vendedor`),
  CONSTRAINT `puestos_id_mercado_foreign` FOREIGN KEY (`id_mercado`) REFERENCES `mercados` (`id`),
  CONSTRAINT `puestos_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'PT-12',1,9,1,'2020-06-19 02:03:18',NULL),(2,'PT-45207',1,45,1,'2020-07-14 22:47:03',NULL),(3,'PT-666',2,48,1,'2020-07-15 15:55:34',NULL),(4,'PT-4',1,50,1,'2020-07-15 17:03:21',NULL),(5,'PT-4',2,51,1,'2020-07-15 17:30:23',NULL),(6,'PT-13',2,57,1,'2020-07-16 16:45:30',NULL),(7,'PT-1',2,59,1,'2020-07-18 00:19:01',NULL),(8,'PT-456',1,61,1,'2020-07-20 20:50:14',NULL),(9,'PT-12345',1,63,1,'2020-07-22 10:29:23',NULL),(10,'PT-12587',1,64,1,'2020-07-22 11:16:08',NULL),(11,'PT-666',1,66,1,'2020-07-22 17:41:23',NULL),(12,'PT-98788',1,75,1,'2020-07-27 03:29:11',NULL),(13,'PT-86',1,86,1,'2020-07-27 15:54:30',NULL),(14,'PT-24',1,91,1,'2020-07-27 21:48:55',NULL),(15,'PT-4',1,92,1,'2020-07-27 21:52:30',NULL),(16,'PT-20',1,97,1,'2020-07-27 22:26:47',NULL),(17,'PT-123',1,98,1,'2020-07-27 22:27:29',NULL),(18,'PT-100',2,102,1,'2020-07-28 19:47:17',NULL),(19,'PT-10',2,106,1,'2020-08-01 15:23:06',NULL),(20,'PT-6',2,107,1,'2020-08-03 15:09:14',NULL),(21,'PT-514',2,110,1,'2020-08-06 01:14:23',NULL),(22,'PT-45',1,129,1,'2020-08-26 19:47:17',NULL),(23,'PT-48',1,136,1,'2020-08-27 03:47:53',NULL),(24,'PT-1',2,156,1,'2020-08-28 18:46:06',NULL);
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_pedidos`
--

DROP TABLE IF EXISTS `ubicacion_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacion_pedidos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` bigint(20) unsigned NOT NULL,
  `direccion_entrega` varchar(300) COLLATE utf8_bin NOT NULL,
  `celular_contacto` varchar(255) COLLATE utf8_bin NOT NULL,
  `lat_entrega` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lng_entrega` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lat_transportista` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lng_transportista` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('WAITING','IN_PROGRESS','OUT_PROGRESS','ENTREGADA','CANCEL') COLLATE utf8_bin NOT NULL DEFAULT 'WAITING',
  PRIMARY KEY (`id`),
  KEY `ubicacion_pedidos_id_pedido_foreign` (`id_pedido`),
  KEY `ubicacion_pedidos_estado_index` (`estado`),
  CONSTRAINT `ubicacion_pedidos_id_pedido_foreign` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_pedidos`
--

LOCK TABLES `ubicacion_pedidos` WRITE;
/*!40000 ALTER TABLE `ubicacion_pedidos` DISABLE KEYS */;
INSERT INTO `ubicacion_pedidos` VALUES (1,1,'Junín 513, Guayaquil 090312, Ecuador','593999887777','-2.1881980304489925','-79.88786213099957',NULL,NULL,'WAITING'),(2,2,'y, Av. Quito & Calle 3 NO, Guayaquil 090312, Ecuador','593999887777','-2.1879772445791277','-79.88871607929468',NULL,NULL,'WAITING'),(3,3,'Junín 611, Guayaquil 090312, Ecuador','593999887777','-2.188174578233706','-79.88822255283596',NULL,NULL,'WAITING'),(4,4,'Luis Urdaneta 1107, Guayaquil 090514, Ecuador','593999887777','-2.1874901084174274','-79.88890048116446',NULL,NULL,'WAITING'),(5,5,'Junín 611, Guayaquil 090312, Ecuador','593999887777','-2.1884178111915698','-79.88811057060957',NULL,NULL,'WAITING'),(6,6,'Padre Vicente Solano Vargas 1225, Guayaquil 090514, Ecuador','593999887777','-2.1863044303999315','-79.89036127924919',NULL,NULL,'ENTREGADA'),(7,7,'16, Sopeña 090504, Ecuador','593993942225','-2.1232369','-79.8874867',NULL,NULL,'WAITING'),(8,8,'16, Sopeña 090504, Ecuador','593993942225','-2.1233204','-79.8875491',NULL,NULL,'WAITING'),(9,9,'3º Psje. 38A NO, Guayaquil, Ecuador','5932588888','-2.0968825','-79.9237844',NULL,NULL,'WAITING'),(10,10,'O\'connors 28 y, Guayaquil 090404, Ecuador','593999345678','-2.2132551','-79.9303458',NULL,NULL,'WAITING'),(11,11,'O\'connors 28 y, Guayaquil 090404, Ecuador','593999345678','-2.2132652','-79.9303227',NULL,NULL,'WAITING'),(12,12,'Los Rios 928, Guayaquil 090311, Ecuador','593995285101','-2.1893526','-79.8945125',NULL,NULL,'WAITING'),(13,13,'Los Rios 928, Guayaquil 090311, Ecuador','593995285101','-2.1893574','-79.8945051',NULL,NULL,'WAITING'),(14,14,'Los Rios 928, Guayaquil 090311, Ecuador','593995285101','-2.1893433','-79.8945319',NULL,NULL,'WAITING'),(15,15,'Blvd. 9 de Octubre 1322, Guayaquil, Ecuador','593993942225','-2.18908083857191','-79.88990865647793',NULL,NULL,'WAITING'),(16,16,'1 de Mayo 216, Guayaquil 090514, Ecuador','593993942225','-2.188400389548524','-79.88955661654472',NULL,NULL,'WAITING'),(17,17,'1 de Mayo 401, Guayaquil 090514, Ecuador','593999887777','-2.1884456188137187','-79.89052623510361',NULL,NULL,'WAITING'),(18,18,'884 Rengstorff Ave, Mountain View, CA 94043, USA','593999887777','37.41721902177951','-122.09369368851185',NULL,NULL,'WAITING'),(19,19,'1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA','593999887777','37.4219083','-122.0839495',NULL,NULL,'WAITING'),(20,20,'03, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1731379475514023','-79.82726700603962',NULL,NULL,'WAITING'),(21,21,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1738297946629537','-79.82665412127972',NULL,NULL,'WAITING'),(22,22,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1737899255159805','-79.82678554952145',NULL,NULL,'WAITING'),(23,23,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.173841855917291','-79.82683215290308',NULL,NULL,'WAITING'),(24,24,'17, Del Ejercito 092405, Ecuador','593999887777','-2.1731841823803713','-79.82266500592232',NULL,NULL,'WAITING'),(25,25,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1738003115963775','-79.82760328799486',NULL,NULL,'WAITING'),(26,26,'46, De la Policia 092405, Ecuador','593999887777','-2.1748546659029757','-79.82398331165314',NULL,NULL,'WAITING'),(27,27,'13, Del Ejercito 092405, Ecuador','593999887777','-2.174353789068115','-79.82517756521702',NULL,NULL,'WAITING'),(28,28,'23, Oramas Gonzalez 092401, Ecuador','593999887777','-2.173012309422075','-79.82596948742867',NULL,NULL,'WAITING'),(29,29,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1747280228126153','-79.82759624719621',NULL,NULL,'WAITING'),(30,30,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1740974874796177','-79.82698805630207',NULL,NULL,'WAITING'),(31,31,'23, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1730679252352854','-79.82608549296856',NULL,NULL,'WAITING'),(32,32,'3, Gonzalez 092401, Ecuador','593999887777','-2.1719087036448927','-79.82600837945938',NULL,NULL,'WAITING'),(33,33,'Calle 94, Durán, Ecuador','593999887777','-2.1728561830921165','-79.82776153832674',NULL,NULL,'WAITING'),(34,34,'Calle 4º, Durán, Ecuador','593999887777','-2.1755833660179347','-79.82675839215517',NULL,NULL,'WAITING'),(35,35,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.1740730299401423','-79.82650626450777',NULL,NULL,'WAITING'),(36,36,'O\'connors 28 y, Guayaquil 090404, Ecuador','593999786547','-2.2132614','-79.9303258',NULL,NULL,'WAITING'),(37,37,'91, Sauces II 090404, Ecuador','593999786547','-2.2133667','-79.9305263',NULL,NULL,'IN_PROGRESS'),(38,38,'O\'connors 28 y, Guayaquil 090404, Ecuador','593999786547','-2.2132589','-79.9303211',NULL,NULL,'IN_PROGRESS'),(39,39,'O\'connors 28 y, Guayaquil 090404, Ecuador','593999786547','-2.2132611','-79.9303239',NULL,NULL,'WAITING'),(40,40,'18, Oramas Gonzalez 092401, Ecuador','593999887777','-2.173876364505561','-79.82686568051577',NULL,NULL,'WAITING');
/*!40000 ALTER TABLE `ubicacion_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `auth_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombres` varchar(255) COLLATE utf8_bin NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_bin NOT NULL,
  `direccion` text COLLATE utf8_bin,
  `celular` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gc_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `rol` enum('ADMIN','CLIENTE','VENDEDOR','TRANSPORTISTA','TENDERO') COLLATE utf8_bin NOT NULL DEFAULT 'CLIENTE',
  `imagen_perfil` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuario_unique` (`usuario`),
  UNIQUE KEY `usuarios_email_unique` (`email`),
  KEY `usuarios_usuario_index` (`usuario`),
  KEY `usuarios_password_index` (`password`),
  KEY `usuarios_auth_token_index` (`auth_token`),
  KEY `usuarios_gc_token_index` (`gc_token`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'merOnl2020Adm','$2y$10$YvXsh9ovK3UkHbE/SecgN.NPZkG0Jesav6o7btPoR2X2bdrXluj7u','$2y$10$yr4.jqQPhbZljI9HZ45sd.F.h3A4KXCGfrY1OMeGB2SREPXZogruy','support@mercados-online.com','El','Administrador','Sauces VIII','593990274714',NULL,'2020-06-17 04:26:13',1,'ADMIN',NULL),(2,'kfalvarado','$2y$10$YbeEmOqddS9cjb7lQ36kK.2EqvDOxDuO1a4.h5f1Cyzsh7/Tl5FGW','$2y$10$zySQNI1c/EwM.4qNcGFZ8e31Z7hGDg.v8UO688dyZwTJFoFvBOtI2','kevin_alvaradof@hotmail.com','kevin','Alvarado',NULL,'593993051947','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-06-17 09:58:14',1,'TENDERO','images/profile-2.jpg'),(3,'lore','$2y$10$harKC.YD56koGQIbC4jPQ.KJiDH/ClZo6dbSBecVPp6if0/dzwRXe','$2y$10$La22alG4OBziRU1ah8pcp.vtBfvwqGxn3JRHLfpGOg7rj39QcfzvO','ivancitoparra66@gmail.com','lorena','jimenez',NULL,'593995205101','eB3HT9A30BI:APA91bHb3Ffd8gVvPsIX3VT1Su8ObpyKbANUpFq8ivbSrOYcVLyGGg18171vnD83RAFGYSAyivJl5rNhVmshAzSewerCzWbXuXQ-M0fkZGyclwjFOPBCiAyHrMnDwbRKRsrMPWJjh8L-','2020-06-17 14:10:05',1,'CLIENTE','images/profile-3.jpg'),(4,'benja','$2y$10$8yBl8/e65kx2anBDJmVJSuKLK3K5zE4P4.UISUBkIj8EOo1K.O0WS','$2y$10$DvjCq27KZwFVYhC.yBpouuqFSGgKk7mApnWDwtVeZeMdQchDA.6rG','elbemja@mail.com.ec','Benjamin','Alvar',NULL,'593999887777','ec49GR7wC_o:APA91bG-NLNHB_HYEIkGX4e8yvxk3g9rR12lVBAKuCVTpzejluJuqS7f4n0IcQp39IV2lk0sf8KEnAXyykTrcm12_qpwua_fCRm9-Zi2aNv4_Ba_skFJ4hg11OIDIknxXgyOsHd6GwLq','2020-06-18 02:03:18',1,'CLIENTE','images/profile-4.jpg'),(5,'davicho','$2y$10$2QQ71Ouh0WOJFydYZb8d8evJNkO2nS4XAxsV2PsiKoXycrqUUM.6.','$2y$10$JcxVZwSM/3yK022ulGyvaO9ojt4cfy8W0jaw3CNXJQuI/0f76gg.G','davicho.mail.com.ec','davicho','asdasd',NULL,'593933333333','cUhzYzEi5-M:APA91bGByN-Re3IJmNgocgXPCl_4-oZValFiLlKoDIQzvh4iZjVw3K7zMqsYX2Ofp2iVVFYgOES4Nj0GJTDdqSrl3d0iVY5UwryS2sId1tbN2GMghWYQEbPLE1psGAA7cEbxLqO2Xu4b','2020-06-18 02:15:05',1,'TENDERO','images/profile-5.jpg'),(6,'alexjar','$2y$10$01rK4cVt5F7mmItkJpVH3.44/jgpOhcNiIn8z4EXXfZWmYS.CMMYm','$2y$10$4WhBmqM6rcpBo9/OLZrym.cAYW3JfT278C73Qthc76cop6vQnOjG.','alexjar22r@gmail.com','Andres','Jalon',NULL,'593993942225','cUhzYzEi5-M:APA91bGByN-Re3IJmNgocgXPCl_4-oZValFiLlKoDIQzvh4iZjVw3K7zMqsYX2Ofp2iVVFYgOES4Nj0GJTDdqSrl3d0iVY5UwryS2sId1tbN2GMghWYQEbPLE1psGAA7cEbxLqO2Xu4b','2020-06-18 02:38:03',1,'CLIENTE',NULL),(7,'mi dulce manabita','$2y$10$opuvNAoZg8ixn3T6MeGtbeBJ./9sKZEp9oLzhh2DZV8H1IDfiEwuq','$2y$10$71rjVzAFcGcg.65aLLPY.O4Dw4MbR/DGifsultXfWoOET5H8mTI1i','mercedesintriago@hotmail.com','mercedes','intriago',NULL,'593958911071','d6CPkV8FvW4:APA91bFVRUF1ubYHm_k2RJT4asVhbrRK962K-LESaEqjvgtC5jYLRpXLPp69JmQCZ03tjy8U_qFYOZX6dJdZEECVJ3duenhH7YLpU_FlmVQ7KKE1K2zo99Hp2gZGCMbhZpwbPuGADHIr','2020-06-18 16:34:33',1,'TENDERO','images/profile-7.jpg'),(9,'clari','$2y$10$fqTjH9MtpCPtpSZwpUuz1.L3el8EDIf46OgpPnDJiMoMqy27UiS2C','$2y$10$lM8pZH70kx87YdLWGslMCuw.vap5SjFtj7rSsII4724sspRfup61C','clari@mail.com.ec','clari','Bella',NULL,'593988888888','ec49GR7wC_o:APA91bG-NLNHB_HYEIkGX4e8yvxk3g9rR12lVBAKuCVTpzejluJuqS7f4n0IcQp39IV2lk0sf8KEnAXyykTrcm12_qpwua_fCRm9-Zi2aNv4_Ba_skFJ4hg11OIDIknxXgyOsHd6GwLq','2020-06-19 02:03:18',1,'VENDEDOR','images/profile-9.jpg'),(10,'alexjar22','$2y$10$OcyEq9QhH4fE0JxZC7lKy.3MXr7ShpIx.l0ZY0CMdKMUKFdXi51yK','$2y$10$jDoaxOxlbVyy0GHeouVTGupQpYqIu/FN.ntP3AGE./npdwPfB0g/G','alexjar2211@gmail.com','Andres','Jalon',NULL,'593990274714','eYgeS_RI17c:APA91bGzO4k-cok7O_QJUGOL9YLtNbHvyc0QEB5j4gA9LrSdi101JI6p1woJg4R6P6zRdf3icvRmQ-zq69-8ZvxJL5cy6yin7xlprPYnOzAE5_jbgrxSlM_qwU-wRTmBiv6K7UqgrpG9','2020-06-20 17:37:19',1,'CLIENTE','images/profile-10.jpg'),(14,'fabricioalba','$2y$10$aKy7K9TRLeolM3/2500XY.NjjSCvCMT9kevL6FJLY0SakxEw9nEkK','$2y$10$TBLLJxvh.4I8hSjmKv5jQejuOekep8YtXUtNp1m6ZGvibtBskxXMe','ifarias_156@hotmail.com','kevin','Alvarado',NULL,'593993051947','dtVOf94gLeo:APA91bFe16vzm6WEX9SDa7oOs_cyYOGpz2jH-sWLTQMnqO5KBGZV9SKgSVtOYYuD64URsvRyTbpOQJ_zcvJ38M2gCipiEjc0C0yl8nNDkmyMZh0Hz_Y_15KDHW1eVuo1gVWohmGrb3fp','2020-06-20 22:53:22',1,'CLIENTE','images/profile-14.jpg'),(15,'gloriapolinario24@gmail.com','$2y$10$wqfLQSnaSAeQlvVz0rD.H.ixIuUi1yy7Qcr.h1Z2qT9RlJXVQDB4i','$2y$10$Llw9ZDUHcf9nqyiBrgqiauZqXCOSR7CwscBUubbjwp8QLXvlKeRT6','gloriapolinario24@gmail.com','gloribel','apolinario',NULL,'593968728024','dg9SxoIfDeA:APA91bHVaontJsidPKBZu68Sc5cSU2WpyDb5FX4qIV-2-iBP7sIX64N1ljU24o3zF6LsDSqJZRCi6xYLrudiwignbCNkKIWwAgd63GMASb6OLndRgHJSO0KJmVOEfnWX8V-mjdvqMv-1','2020-06-26 13:14:56',1,'CLIENTE','images/profile-15.jpg'),(16,'ivancitoparra61@gmail.com','$2y$10$2AiEMOGDDNTCXWJ4Asfya.ZzkUCT5PWgL4lUYRMJwwf4z6iMs33LW','$2y$10$PZNBO7CSp3WIqYQZ2b1z8uYKTWWavcw3FdeyE7JDNbSCaeyrWA3Mi','ivancitoparra61@gmail.com','ivan','parra',NULL,'593995205101','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-06-27 16:20:12',1,'TENDERO','images/profile-16.jpg'),(17,'ivancito51','$2y$10$ppHFJMrW.hKd6koKuyG/Deaxuvb/MHWmZMb4TVPePGpfmPekAUUGi','$2y$10$W5MgsZnA5Nv3CUsaGg1y6OkbBDM4vmyNgJHaa3Wwu9quC1E6XITRq','sistemas_controles@hotmail.com','jose','parra',NULL,'593995205101','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-06-27 16:24:49',1,'TENDERO','images/profile-17.jpg'),(22,'ivancitoparra65@hotmail.com','$2y$10$x/DYIFwj.qKPCmnXSjEybun0UCLVoCr5KlusjWfk3qE.ijiP1FTMG','$2y$10$.jN69kA.I5k86H0x6bjpzOFeVRsFj3cyEaNSKdDQTAzfOh6H6KwSm','ivancitoparra62@gmail.com','marco','parra',NULL,'593995205101','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-06-27 16:47:23',1,'CLIENTE','images/profile-22.jpg'),(26,'rubia','$2y$10$EuwSPZ9DXn4Cf1SKNCflPe3gZ0pru8pSTSeY1suzbhrOnRU/MqWym','$2y$10$I1a0RbIun4lHE4XNF8cQW.LCLMx/z7Y9jmteRoxBU1/gjTANjJhqC','ivancitopara@hotmail.com','josefa','parra',NULL,'593995205101','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-06-27 16:54:02',1,'TENDERO','images/profile-26.jpg'),(30,'licerito','$2y$10$VnYDVHm2z79XoWJ1j/BEUuwfhfKrBfweDjnxo28/QHIx6KFjbkU0i','$2y$10$3SzhXvVNerAZ69IQtXZAAOom6jbcbYieV7F/yNT5qREeXfa1AEJB2','ivancitoparra99@gmail.com','lucero','lucerito',NULL,'593995505101','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-06-27 17:05:19',1,'CLIENTE','images/profile-30.jpg'),(32,'janialfarias','$2y$10$f92nSfa9KyLOxr7QOHRGju3P51QyATq5ToutVpVWE3djzkoTtiWga','$2y$10$cTHCRh8lj6mcc/QIW2L7vuUHqbZM5XEqqp2StaXAXe3hMyJQBassW','kevwareit@gmail.com','janina','alvarado',NULL,'593993051947','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-06-27 17:12:26',1,'CLIENTE','images/profile-32.jpg'),(33,'ivan28','$2y$10$DdvaAGfFZ5VvTGJNk2xZluSuCpxDSJwAd170/0kZ/ArZWAHjBRz4K','$2y$10$INeuDCWiBoCvoDYNigaFs.oeH08SuP1/BLvIezoijGdJA64dh6Xzm','arnoldivanparrabowen@gmail.com','Arnold Ivan','Parra Bowen',NULL,'34640876497','dhyOVXvsCvs:APA91bGPCMIDcUz04hynrn3IoYBUNjVqODFXG_7ho2v3nhkGWnm1X3Hvi99G6lI59EAtR5AOjRtpQx7KG_Sq4PhrFkzB8SmDaMPtz6YkpYQn85ph3rS-NvJKzwxLd3JoT917qear7Ycf','2020-06-29 18:19:18',1,'TENDERO','images/profile-33.jpg'),(34,'HECTOR PLASTICS','$2y$10$s7ipaaOqFnPIBhVSTqSH9.Sj7ARRyMZBCvuWhhX5r5PXIpLw2oBmW','$2y$10$O/NHr9CNt0npKcPYLKZqIekoD6diwEclmAY7mkgdXN0OADzFmR23S','hectorplastic4866@gmail.com','HECTOR','ARBOLEDA',NULL,'593988311838','egs-iebkfAc:APA91bHF3jFJxEwy-bCZ2tZRqiSQFor0H2fiYJQ4Q4fZmgvkG8dLrDSADd_rrFc3IF7RK4ATOPH1FZoNjH76ncZ1_m-9e6CL3YbNOGTprQlvy0PMaDFVnM6RbFUnMo8DiQ3Ue2SkKcT1','2020-06-30 15:22:43',1,'TENDERO','images/profile-34.jpg'),(35,'RESTAURANT Y CEVICHERIA','$2y$10$iXUjkHsxIFEaKti7tHioIOxopx8ZfRBrQxfDd8LiXk8JUc8TKxHeG','$2y$10$6aK5knJz0ZgEhhsr1qIMa.kIfUl4HyAtr7x07VBdy5YZqincNejUq','kattyvanessametigarodriguez@gmail.com','NATHALY SOFIA','METIGA',NULL,'593992067423','domwg5Wlqf0:APA91bEwfQhevGh00-GY42LAcHJdGFyBU3-C9NxFcZ3eE_CLSopQ5o7MYeE8VqTH_6bEK29lginClX4sFweCCV7UDCeaQPPFPqQcoHrqkWbMcC8Nx7v9N9PIUcdFiQ64rmEKUfAcDT5Z','2020-07-08 20:03:05',1,'CLIENTE','images/profile-35.jpg'),(37,'PLÁSTICOS HECTOS','$2y$10$X3t9.rIiKaGhvFesQQu9G.zDbA4XWhgpS.9cgwaPi7z/TE2Pw2KEq','$2y$10$2QczDAYvboyB9wBVjY7X.eZxzfrtmdqLnVa1./HaThZtqRvHctTaS','josusala19@gmail.com','WILLIAM ROLANDO','LINDAO LINDAO',NULL,'593998162135','fOC9dZ4yi_I:APA91bEmEQRFZ7-KAfzwj3ygeD-BStyYuRL_lA7WTPsZO_B6Xq7qAxctc7GZ87ps42I9orHF1KKJb5NUe98XPAIBGdlOU9CvWioOwdVxn2tEWuvusQB7d3uZjkQx3nUywVoKP383ZR_b','2020-07-09 20:39:39',1,'TENDERO','images/profile-37.jpg'),(41,'lcarmen','$2y$10$YrddyktG7Z0kXD7eTLnTYOkiHq/ej7xWG5RMh7X.a/nff4ZI1eO3a','$2y$10$iQkyDP3p8RVtaas8p9wmwOl4uzQ2uqcKey78UT5cGsSjDd1IB.twu','acr','carmen','luna',NULL,'5932588888','dcER-Kl5GzE:APA91bHMyhXX7xVBw4AjTcESgHIkaz7K3NPi4txIicmwb68Acst6jEvO2eNvRR-Ss0kTFroN5fu55nt5N0rb4Me-hUdqxO3ebQViN4wPNMWPdSpWJvwUK6VWPypjBEdQljtIPjP4i93u','2020-07-11 13:53:54',1,'ADMIN','images/profile-41.jpg'),(42,'jimmy1101','$2y$10$gqia03qS7qS65ViyG5B06uq.eqzWxugQs6n9YA73WGb3Bu/eSGleu','$2y$10$chpPTVySnjAI2WFjMgm8ue9Gi1hTYN41eAqHnnLiXVDUegUaNwBfS','jimmy1101@hotmail.com','Jimmy Aurelio José','Vallejo Villafuerte',NULL,'593994936343','dneq5Vg_-0w:APA91bHMrk32YKfzUpf1TUDvu2BioS1KalTXZcDoKAVRte081TBpXH9n2p7QE_UG-4jq1MXTD6uoeaytma0Vg4edp6XEgeR2qaHH3caXqEzvEzeH2NgwALcQ0de1sQM_jXWqtHE9r1Ec','2020-07-13 03:36:40',1,'CLIENTE','images/profile-42.jpg'),(43,'michael','$2y$10$5OZYpLHIDFY08SRw7RdG9u96pTKcgZrxHd.CgkjwIQ.3mvfgZyZ5W','$2y$10$kA2du/9SeT6MbKPPSDnJou8ep3IetCl4zAfpBdONtN6Qjiyx6uIIq','michael@gmail.com','michael','parra',NULL,'593995205101','cfQclYzZ71Q:APA91bEOuUNPlLRV8Hp9VJheNNGEQHIXjPoHBOxWZwFLKCWIsmMJWzEPsIy1p0pm2yQv9zve2yh0lexoQPLVPPzwoRn4od4sgsIbF6kiS9GEIhzMzuakG4_fd9vtAaQXUPwRxXC8ikwe','2020-07-14 21:19:57',1,'TENDERO','images/profile-43.jpg'),(44,'maritere','$2y$10$tOO384GWTbh0/0hXz8LKmepGHh4dpqWEBtT29deglHX2pB6F6CkDi','$2y$10$PQeDMfVGy7damXjLUqBHZOgytL/qcFcbHkwO719GV3u80/PzW6ArO','maritere@gmail.com','maritere','acosta',NULL,'593995285101','cfQclYzZ71Q:APA91bEOuUNPlLRV8Hp9VJheNNGEQHIXjPoHBOxWZwFLKCWIsmMJWzEPsIy1p0pm2yQv9zve2yh0lexoQPLVPPzwoRn4od4sgsIbF6kiS9GEIhzMzuakG4_fd9vtAaQXUPwRxXC8ikwe','2020-07-14 21:42:05',1,'CLIENTE','images/profile-44.jpg'),(45,'pedro123','$2y$10$OwSwCZhDpB7DP3WmFh8uG.hSQ/Is5ZUtfq0oepwIhf/HuFN.pXkcy','$2y$10$BZnhLWT/LHo8LNPv7FhP.uLEOTFA2HtlPwMh6U/APH8phvm0GPNVe','pedro123@gnail.com','pedro','sanchez',NULL,'593995205101','ekmNauhhME8:APA91bHl2CDWiKWieF02A839JoP3tEyZIfGeJCg4Pp9-WqajMS_rsxa_N1qZX5kRD9SjYeux0b4h-SagXJj5TfaAP8m_KZ1MCr3BMQwxm_ePu3xF-YNnZQXa2JY8l3-SKmUM6FXkIaKX','2020-07-14 22:47:03',1,'VENDEDOR','images/profile-45.jpg'),(46,'technicalsolution@outlook.com','$2y$10$hA0CWTY0G1ObrEw9vokg7e1cqCXi/XIIionmDwsNqiniDnVUaCMDm','$2y$10$KiJlDyjYBC5oDKIBRit3TOtjlosKU2pFc6MJkAAcDMTwFZQ2FLsqm','technicalsolution@outlook.com','David','Granizo',NULL,'593979512060','doKgUojTfn4:APA91bE1KzVvvhxie8Ig6HziAZaCTtYTYxfrdX571HJylESMo9MvNuayvja9ZA0imXsWDs9gDzA2x8LDLP0u-JG7ZN6S2We-lHyhP69dgyu38xZ6VYLr3_XtBksGu_yoodiVeQExwjj3','2020-07-15 15:38:22',1,'CLIENTE','images/profile-46.jpg'),(48,'magaacosta','$2y$10$Ln/w/T96AWWEpiFmju3wd.CHHQzoFOXSZdgpjFweLT6oZYzBTCply','$2y$10$Jmbr.hLafGDatdHYYguB/.fs2Rhk4RV4j9DWR2VtCUrVrXGfwrbEK','leonardo.alfarias@hotmail.com','Margarita','Acosta',NULL,'593993051947','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-07-15 15:55:34',1,'VENDEDOR','images/profile-48.jpg'),(49,'mifer_accesorios','$2y$10$SZF7sUReySIhUCib8A1yVO5M3BMaudnrpSTmpZueVjWXP5Z0gkooS','$2y$10$aR2Y6QGfeLWUXP4uCJ4kreB8XWqOMIjL3/v0anltoSzxPjrx/hh4m','miferbravor@hotmail.com','Jenniffer','Bravo',NULL,'593998680426','coBKDkFXROE:APA91bHmxgnciYsw0-IvsJHhApgWCMXuRFE1q1wKWaUAANJBYfJhbc_73w7RDN9SqABcZiINnxYFPQIKXTBVeymzklkVk9AGptHrFc2vjxGp4PAncwhdBdA4s1n-CEl7cUz_W0cflZqb','2020-07-15 16:49:23',1,'CLIENTE','images/profile-49.jpg'),(50,'SCOBY PARA KOMBUCHA','$2y$10$o8iBwqAYqlXKCA95qfeQbeuxM7zdD7t1N8vAIBYGFXzTCaoTv7q02','$2y$10$KMxwVzY1q440hRJXe9Xf2eMt94ACVNndNHECyiDE2xtxvzDM9D2U6','silvagarciahugo@gmail.com','Edison Hugo','Silva García',NULL,'593993813105','cMmIX4JCYTY:APA91bGsbsl1IKKMXNlT6P5yJo2EwdEbhKmrOWhDp1fsvgdzkvx5rEyoQ31BrP507uXNViDHPVCAqA5SsXB6Z7liSu5WxtnRCyRG8Mh-c79bJa6tcOh5HdiHGAbHa0dE3YXYjVEHegWl','2020-07-15 17:03:21',1,'VENDEDOR','images/profile-50.jpg'),(51,'Hugo Silva','$2y$10$ieZ87aPiupxvOskpdwxLcug1QhkX3yOFxowqbndNRr1r07aV3e5Ou','$2y$10$V9LkZjqm3XcMC0pxxUorT.xV6XE.x7H.8tn7gwbXBR/DsSKmUbgty','hugosilvagarcia@hotmail.es','Edison Hugo','Silva García',NULL,'593993813105','cMmIX4JCYTY:APA91bGsbsl1IKKMXNlT6P5yJo2EwdEbhKmrOWhDp1fsvgdzkvx5rEyoQ31BrP507uXNViDHPVCAqA5SsXB6Z7liSu5WxtnRCyRG8Mh-c79bJa6tcOh5HdiHGAbHa0dE3YXYjVEHegWl','2020-07-15 17:30:23',1,'VENDEDOR','images/profile-51.jpg'),(56,'Hugo Silva 1','$2y$10$8BbERqT5XD34o98cAzCo.OOOXYZUOYjJye52F3CYzxZXq6AGDQjB.','$2y$10$G7k6aj8l.fJKdT05GFjbCuERav4Xb3JnIWSylm5aySakDfj9UJ46W','edisonhugosilvagarcia@hotmail.com','Edison Hugo','Silva García',NULL,'593993813105','cMmIX4JCYTY:APA91bGsbsl1IKKMXNlT6P5yJo2EwdEbhKmrOWhDp1fsvgdzkvx5rEyoQ31BrP507uXNViDHPVCAqA5SsXB6Z7liSu5WxtnRCyRG8Mh-c79bJa6tcOh5HdiHGAbHa0dE3YXYjVEHegWl','2020-07-15 18:51:34',1,'CLIENTE','images/profile-56.jpg'),(57,'Zangano Danny','$2y$10$4OSYC9RG4SrXWHi1y9QdiOQZKLjE5oBavabagFguImVwmIezo9.R6','$2y$10$PT3ETrhf1JFSZ1osiXgKheQWWKC7Orppsy5Fg0I1jMTs0RY37x5DS','Zanganodanny@hotmail.com','Fanny María del Carmen','Caiza Philco',NULL,'593998602577','cHDDAjf1zgE:APA91bFKUkmywO4uPYY5pjc1CuEY1UVyecQnE325VIY5CjGyGE4jSSL0mgVk4_6rAYCrir8oZdTL8JNznhH6254ytbM8xt7K5maEa2bdaY8dtlt7Uon57afL8RG38GlqvdX4I1DEcnZ2','2020-07-16 16:45:30',1,'VENDEDOR','images/profile-57.jpg'),(58,'chocolateslasdelicias','$2y$10$CCKcPQbKMra9gEDE1Ljt1OQTHDEu.XHj0SvkSaGMjAvfu49rAZzgm','$2y$10$s3dnoMWijC4FnMcWPY/cCOKl41Sd16i/RY9RITVDXHlYzaoH5khea','cristiperez30@yahoo.com','Ana Cristina','Perez Lara',NULL,'593986588362','e4BjapCuGPk:APA91bE7ELScbb00DSDfNern9B6HkHD9dKdeqqHOyXjlr15z8_msAFZxyKuCF7bPeYxSTD-ubu8gig1dBisRUOGqyXlua5Cs28lUe5PH_xzv4vfGTqIeLVCf_DDTlkAatZAi_YvFGylp','2020-07-17 17:25:22',1,'TENDERO','images/profile-58.jpg'),(59,'Maru','$2y$10$Osobhxc9JZZLQd1EKa64celXGv.EySPIfVR2ey4HzSg54GE/Sz4Ku','$2y$10$f9SFkkBkviVXz1r23t0IyeDwzT1eRRM2NrhkfH1H/i.9WkUAc0JZu','arrozsaludable@gmail.com','Productos','Sasego',NULL,'593979465171','dRph4BQV4QQ:APA91bFDVNbdv5OB55Gt3_5L_gjMzWlr2Lyw1Ri_eVi-85Fih1BFNKOU6UEyXxRpTrvG5ZDZogWlH2n1YLxfLnlU6ttI7Haz5eeIN_WipVQfHlqtI_NhAFgFSML8-iSu9AAmtEN5mb8n','2020-07-18 00:19:00',1,'VENDEDOR','images/profile-59.jpg'),(60,'jhon95','$2y$10$.RhbUx5b59WL05zBnd.T.eXqVITC1UTttFThXXpT7w/Lf/3Bjw4Si','$2y$10$Txxls6yE44u2bcMYUtibee4.XlcpHIMufN48RulwtauTJCpjdawa6','jllerena95@outlook.es','jonathan','llerena arboleda',NULL,'593961829561','eJ6mpF0FVv0:APA91bHptJ-LyaguJJ7gtGhJf-Zk0X0P5Xzvf_zUvXoBScmEy9F0dIPZULDxUcNL8MRrUMYqhCfNVxqXr3xIb8DAt6HK9doqPJy2Z0iU3zmbW04w-uwQ4_VzzjnB33SwDWpE8PThaByW','2020-07-20 03:36:49',1,'CLIENTE','images/profile-60.jpg'),(61,'jususvergara95','$2y$10$6eN7J7m9cCvKfd759bTCGelYwEz2Dqpcxnk/qngH1F5qicjC.yK.S','$2y$10$Hd4Za2nylnon.C0/OdLQEeUjB9bQ23.cELvy0oNOI5.EZbipdxeNi','jise@hotmail.com','jesus','veegara',NULL,'593993052736','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-07-20 20:50:14',1,'VENDEDOR','images/profile-61.jpg'),(62,'PLÁSTICOS HECTOR','$2y$10$.vzG/dCyBQjBDeJ1eF0tve6nEzy7xwwXyg9pytyzG2EK/A2Fabuou','$2y$10$CzpR8vp.T7G3Ll7uUWH7yeS9WKh5Qllby6XABWxianF2o0HQvAXlS','hecarboleda@hotmail.com','ING HÉCTOR OSWALDO','ARBOLEDA ÁLAVA',NULL,'593989836424','egs-iebkfAc:APA91bHF3jFJxEwy-bCZ2tZRqiSQFor0H2fiYJQ4Q4fZmgvkG8dLrDSADd_rrFc3IF7RK4ATOPH1FZoNjH76ncZ1_m-9e6CL3YbNOGTprQlvy0PMaDFVnM6RbFUnMo8DiQ3Ue2SkKcT1','2020-07-21 07:36:34',1,'TENDERO','images/profile-62.jpg'),(63,'nicole','$2y$10$YgEF8nScGlhDP.8jZ/p8Rudd4NBUbg8dqFGQbNsQL2ANRUnRzU5LC','$2y$10$quQplM1qcOplIP1l45HMyOADpRjepBTBdPATRSRZ6aVd6RCPfh1Ti','nicoleparra@gmail.com','nicole','parra',NULL,'593995205101','cfQclYzZ71Q:APA91bEOuUNPlLRV8Hp9VJheNNGEQHIXjPoHBOxWZwFLKCWIsmMJWzEPsIy1p0pm2yQv9zve2yh0lexoQPLVPPzwoRn4od4sgsIbF6kiS9GEIhzMzuakG4_fd9vtAaQXUPwRxXC8ikwe','2020-07-22 10:29:23',1,'VENDEDOR','images/profile-63.jpg'),(64,'gabriela','$2y$10$Xc.rGSU6zjAsicAtz3ypjuiAxjoDQfyJlQ8HIuKSY/vbpJ1BWlri2','$2y$10$ad0eeE4yned4sPbg2RMSheghL9SnybJq1Jnop10cg6APQGZ9.8vMS','gabrielacedeño@gmail.com','PANES Y DULCES','GABRIELA  CEDEÑO',NULL,'593995205101','cfQclYzZ71Q:APA91bEOuUNPlLRV8Hp9VJheNNGEQHIXjPoHBOxWZwFLKCWIsmMJWzEPsIy1p0pm2yQv9zve2yh0lexoQPLVPPzwoRn4od4sgsIbF6kiS9GEIhzMzuakG4_fd9vtAaQXUPwRxXC8ikwe','2020-07-22 11:16:08',1,'VENDEDOR','images/profile-64.jpg'),(65,'israeli1996','$2y$10$czlj9QfKDyzGHAKEh6Yuce2cBMvrcXjpU3pKvQauDoSaVatRPrqoG','$2y$10$wED38jNYVJDAVOt26BNSAe4Q9fcTmVk671v/lMxY1PVpInm2EBc8K','israellosabetodo@gmail.com','israel','alcivar',NULL,'593999345678','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-07-22 17:39:03',1,'CLIENTE','images/profile-65.jpg'),(66,'josearguello96','$2y$10$bVBpFruB97GIdGFVALY3Wu0.FMs9FLwghQx9Eg2onA2xe/xzGPR8m','$2y$10$QFOuXaU4NEsUXNH0DpFCfuQ7bWjXLV0L61rRNsdfnFIe/zJ2hA36y','josetubb@gmail.com','jose','aeguello',NULL,'593993499587','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-07-22 17:41:22',1,'VENDEDOR','images/profile-66.jpg'),(67,'jbarbosaestrategiahh@gmail.com','$2y$10$U3FYTma1aqXMKILUu6cAUOw21VtenkdBNaqgPLUUNfF4uVMjR66q2','$2y$10$uwMzYwaJee5MAD1NKAb9vuOk9sXKqCjqiCpMDnhKYMwOBFrwCi/KO','jbarbosaestrategiahh@gmail.com','José','Barbosa',NULL,'593995822533','cvj_knCa8a8:APA91bHk-35ZZnXUwYVYtYkOJF_6tVIn6Ytj15JIb9Tk4TlckJeLcWJyaePtZBhM1jmEUt011FQIAgxLot8IrjwH9BOYRpoRQy8VqTHgA37cPv1jUqJwzyIOPH2BigdFWsTXvJgBQvkS','2020-07-23 11:13:59',1,'TENDERO','images/profile-67.jpg'),(69,'Josué Salazar','$2y$10$PWNliB1VvCKKEke5/4SlXOwsdfG6P31P1g8m3Foky2u./gbCGISmy','$2y$10$xGM2k8HmR/oULB5C9sRiSu/zd/etE6ytrKyV4VP6vbgi2M1NxE8fy','josusala2010@hotmail.com','Josué','Salazar',NULL,'593985141571','egs-iebkfAc:APA91bHF3jFJxEwy-bCZ2tZRqiSQFor0H2fiYJQ4Q4fZmgvkG8dLrDSADd_rrFc3IF7RK4ATOPH1FZoNjH76ncZ1_m-9e6CL3YbNOGTprQlvy0PMaDFVnM6RbFUnMo8DiQ3Ue2SkKcT1','2020-07-24 13:56:11',1,'CLIENTE','images/profile-69.jpg'),(73,'hecarboleda','$2y$10$KutcLcCNAU90cdnoux5Zc.UhF.WbpCV2NTR5MX4FAr6WQf9OmC.Em','$2y$10$bMVA9EfQUxHkMhxbMtN/p.qP/1rwBpuKrNaQYNM6o1Z1/KFHeYO/q','zoimala41@hotmail.com','PLÁSTICOS HECTOR','ARBOLEDA',NULL,'593989836424','egs-iebkfAc:APA91bHF3jFJxEwy-bCZ2tZRqiSQFor0H2fiYJQ4Q4fZmgvkG8dLrDSADd_rrFc3IF7RK4ATOPH1FZoNjH76ncZ1_m-9e6CL3YbNOGTprQlvy0PMaDFVnM6RbFUnMo8DiQ3Ue2SkKcT1','2020-07-24 14:02:01',1,'TENDERO','images/profile-73.jpg'),(75,'marcosurita16','$2y$10$Fw0SbH3CcBoc/6r8O1Q/JOSg7KHmsMkLlEd/10nkyadpK1oSSlD0a','$2y$10$bKrv2KZBdHqXicoEZnQH3e20N5fY3J9tYahkPraHIKZDQ1X63ytNe','marcosurita18@hotmail.com','marcos','surita',NULL,'593998764576','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-07-27 03:29:11',1,'VENDEDOR','images/profile-75.jpg'),(76,'estefania.vieyra@yahoo.com','$2y$10$R.repJIYsTCdngPDvVUs4.BZohgyIqstcZjLt3QHL5uWIxUf.esm6','$2y$10$uo/1QWA6Yr6JhKMJ5SeMrejM51GEdhbB4shpAIt4lq15.wtUI2wzG','estefania.vieyra@yahoo.com','Estefanía','Vieyra',NULL,'593939801165','cFOI2_KhmIQ:APA91bEHoXrmv70qbQ0NWuOTGIMdpH309Px2aJ5P4Wihh-CKZ6gU0eGwb2DwfNO2lJqJcBYWQkjI-DnjHBTSQmIFH5kc1qKoKHZEuhbBdF_Dxunjmb5TS7a1Eq-33HR3erOBVBjt0TYD','2020-07-27 05:11:19',1,'CLIENTE','images/profile-76.jpg'),(82,'cristiperez30','$2y$10$L9derKYOe2qFqRleDa6X1.EUsmpggaDHhKOj2gIoCkVmXHz6G5JNG','$2y$10$n3oZmSHIsfLd.nJuLAnRle.R3wLYAvF/QDrlqaTSjkSvxoezp6/wW','miguel77931@hotmail.com','Ana Cristina','Perez Lara',NULL,'593986588362','eGgRMTWm1p4:APA91bFobTHiLdXcrIl6s-ycoaa99TBDxuvo3Y2LtG8XrwpkwULtTR8OigjEKxME8l7iz-tIBeVBKv543UJHtWgWPOFPKkQDGoGs5J78UYmQnxH72G_0nVcGgpSQrQZATU1MLBGDH1nX','2020-07-27 15:45:58',1,'CLIENTE','images/profile-82.jpg'),(86,'cristiperez','$2y$10$36IXouHGFF3AcdVBD.xFBuNIM5/7hzlnRmfRgpMvHy.JIKevtZYku','$2y$10$jUj.OPLYd16TQT4lxXUey.6WmhLmwo6mZ1DYW3A2YfYpiRZNjsKdC','cristyperez096@gmail.com','Ana Cristina','Perez Lara',NULL,'593986588362','eGgRMTWm1p4:APA91bFobTHiLdXcrIl6s-ycoaa99TBDxuvo3Y2LtG8XrwpkwULtTR8OigjEKxME8l7iz-tIBeVBKv543UJHtWgWPOFPKkQDGoGs5J78UYmQnxH72G_0nVcGgpSQrQZATU1MLBGDH1nX','2020-07-27 15:54:30',1,'VENDEDOR','images/profile-86.jpg'),(87,'robalojose','$2y$10$dCa66w0ssadGw0oIvuF5/eJRTbg8wttKcOKyKEuEIseRsiUUbYNfm','$2y$10$Y4p2ZeN9hUmUe3ekc3R2WOD3FPvrda/pmqG4mKGMAfi0BHxesjOmC','robalojose1996@gmail@com','jose','robalo',NULL,'593993051947','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-07-27 17:00:27',1,'CLIENTE','images/profile-87.jpg'),(88,'Emily','$2y$10$2CW184cn/lw8vQORkRC/pOqJJi.4hqttH6xEHGoa5Ww4Xnxqghpm.','$2y$10$oL4tZTRS0ENrKBmMWVyme.o/l1x0yW8t72jPNvv7havO5fM8dPY8W','emily_teno2001@hotmail.com','Emily','Tenorio',NULL,'593992532359','dsWXe3J4HLo:APA91bEb8kFs_m9J01R9inkiq28-xUC_ECb_xBPu6_SPthag60jWSbq_rGU2PqEZpHqvA9FbyKq09MI8cdZ_cbCS3oj3_y0R6jt2ua6wogiMLBu7YCpNB_kzzH7mekNRUn27dDm51y4s','2020-07-27 19:08:25',1,'CLIENTE','images/profile-88.jpg'),(90,'Juana Roche','$2y$10$znnqeKJ4d2UTzYAg.3hEfezOoqmM06mvDo1jGVrKJwXO9na.UGg6S','$2y$10$RP0qWbpqYyNys22B/5CDJePKDvlWuee7sK3uMi7ioNi9ksL2BXP2u','mamiliguela@hotmail.com','Juana','Roche',NULL,'593979043464','czkH_3Oxkms:APA91bGVKf1TI-gYsg_Kqg6CZGDJjpkWg41gAPCZxeaNR3SoZjun0Rlf7JTaWU3cJ9dnXOMbRMlLn8WMq8Rb2nYSc_xTLfuUb337j0Kmw-X4cIcnVXsvtrxS5zx52KRNxdvcIh9fcUNL','2020-07-27 19:11:16',1,'CLIENTE','images/profile-90.jpg'),(91,'Sharsaid','$2y$10$y7xS63pktOd.cPJs5FH1..EmC5gWJAg0HUM5VVF2N.42ghLRTlG4C','$2y$10$0M/r4RKOf5x1aXCGtv0vX.E2Ar86Wwm5Z/dkIg0DoQGWZXT8Q.xXa','sharsaidcake@hotmail.com','SHARSAID','Emily Tenorio',NULL,'593992532359','dsWXe3J4HLo:APA91bEb8kFs_m9J01R9inkiq28-xUC_ECb_xBPu6_SPthag60jWSbq_rGU2PqEZpHqvA9FbyKq09MI8cdZ_cbCS3oj3_y0R6jt2ua6wogiMLBu7YCpNB_kzzH7mekNRUn27dDm51y4s','2020-07-27 21:48:55',1,'VENDEDOR','images/profile-91.jpg'),(92,'sheylavieyra','$2y$10$9uplyE/uoGK8b/kbIdvKKOsRwUW0WJMowt5gNCpP4og/2aASAwzWa','$2y$10$KDApxo0OVV/leATW41iGdO7tGYP88.DNJ.Hw24yN3c.Yw7D3OGkLO','sheylavieyra@hotmail.com','Sheyla Dayana','Vieyra Villalá',NULL,'593993738463','fOb33uhoLSg:APA91bFYjKRg1faNOGNbiiaW2ZvuNG6YSKBcqNYKMBMnvLk-prCU5UGu78G4c2y8UtAz6Yfv1yD-AI00C80v-Bl1DC07w-lLV2zFEhc0CW3NHmDjBMA4uX5ahSHMV5Cp0RxfkVN-ja3G','2020-07-27 21:52:30',1,'VENDEDOR','images/profile-92.jpg'),(93,'Francisco Barzola','$2y$10$DCKkmSApMjvpbdoDhVy8f.d39pVCgQPj9XIq5is2Xmu0ogjRePLxG','$2y$10$/JobafhHRpzgZ6S1bM/JBuAppo6akfVaDLfAevrly1fQB91hYR1hy','ebarzola20@hotmail.com','Douglas Francisco','Barzola Peña',NULL,'593999520584','fn4ydKXBQKw:APA91bHdolgnKk9rJRheauxnCajeKnA300X2J3L0QyqFwEXMo0Ojrq6EQW5PlC9Z-_Zjlz6zH96GDU7FZDhrFsTaOR-TJPvzLuPJqk_qAcPmD3c5ZWW6-jNlZ1akBirfpQ0Y_BqM0lYY','2020-07-27 22:08:24',1,'CLIENTE','images/profile-93.jpg'),(97,'Douglas Barzola','$2y$10$Rky6DJqPO30VlKCoK4bljurrBbza53uGyGXQ35SoO3oLhnB3hRnAe','$2y$10$hPEc96F1BKE4Fvjc9SPGkOh7UYO5OHe21G5rMUwc.R7hs/zI.hzdC','romaritox@hotmail.com','Douglas Francisco','Barzola Peña',NULL,'593999520584','dR-Q6pNAU7I:APA91bGxuHMZS-p04TxqB5Bi1ApWw9k43BvK99r69MNT_jdFKE0cJlginZkcoL0UDobMiBU2QCVISTYr8jBRkgtbcENOfwsE-OXPi0o3w7pN6yQrbLVGWHnxZz0M1XxFDc32LH6PG1Cd','2020-07-27 22:26:47',1,'VENDEDOR','images/profile-97.jpg'),(98,'Abel Borbor','$2y$10$TWb6qPk2l.OWH6p15uiuPeDo5FUjGvVJac17koQXON7C4peHWZvQK','$2y$10$Whnl0YE2wvcQ8txrQzFxnuhEWJr/77RE0S3IAsh55eJztcOIMbDhW','vabelborbor@gmail.com','productos lacteos Noemi','Abel Borbor',NULL,'593993006993','fVFayI0Zw0g:APA91bEUdfBFNO4VniMBS8TfZ_fAXFMLXLPEwyvi2oMEzuaIJCGXfbo1Xe400XEC5Gf8dpdoQp68lm8ItU6BE6ObC4_SdQcPxoFTSgrFmXdzPftI3JrOyaipXfSs0OJmCbQuCVvH5Iqw','2020-07-27 22:27:29',1,'VENDEDOR','images/profile-98.jpg'),(102,'mchequer_g@hotmail.com','$2y$10$dKtcuk72v.wgdOZcQJzIzOfVK48GJyquAbiN/VK5zx/eFzcm4sN92','$2y$10$lwNLtomn7WCaaoSvs31wLuXJnemlvMOAucWlST7X/ge6y4Ax4VXHW','mchequer_g@hotmail.com','Mariana','CHequer',NULL,'593984514323','doKgUojTfn4:APA91bE1KzVvvhxie8Ig6HziAZaCTtYTYxfrdX571HJylESMo9MvNuayvja9ZA0imXsWDs9gDzA2x8LDLP0u-JG7ZN6S2We-lHyhP69dgyu38xZ6VYLr3_XtBksGu_yoodiVeQExwjj3','2020-07-28 19:47:17',1,'VENDEDOR','images/profile-102.jpg'),(103,'carlin16','$2y$10$x7lUCm.H3Mp8vge5EKPlVe60YG1RF6iAnZj7jasoQOxhs5MXQkoiq','$2y$10$LNrETKzYhgU3o.vlDL/h8uvlPDCjG.87LhJuF4egxZgWrPkrd0BHW','carlos@mail.com','Carlos','caguana',NULL,'593993942225','cUhzYzEi5-M:APA91bGByN-Re3IJmNgocgXPCl_4-oZValFiLlKoDIQzvh4iZjVw3K7zMqsYX2Ofp2iVVFYgOES4Nj0GJTDdqSrl3d0iVY5UwryS2sId1tbN2GMghWYQEbPLE1psGAA7cEbxLqO2Xu4b','2020-07-31 21:02:44',1,'CLIENTE','images/profile-103.jpg'),(106,'estefania','$2y$10$hCxx5LX/T0UPFd7L4TW4K.H3u.mX2/7RKroCjcoln3LdDOOeTaH2.','$2y$10$wzPbHcM4rsWIPl8XMWtkweVnm./3cqK5us2SNkVzI4olY57qxoTsa','vieyra.estefania@gmail.com','Estefania','Vieyra Villla',NULL,'593939801165','cFOI2_KhmIQ:APA91bEHoXrmv70qbQ0NWuOTGIMdpH309Px2aJ5P4Wihh-CKZ6gU0eGwb2DwfNO2lJqJcBYWQkjI-DnjHBTSQmIFH5kc1qKoKHZEuhbBdF_Dxunjmb5TS7a1Eq-33HR3erOBVBjt0TYD','2020-08-01 15:23:06',1,'VENDEDOR','images/profile-106.jpg'),(107,'marianitaauquilla22@gmail.com','$2y$10$lSvr3g6DH1tjph0ErUoVF.CE/NXmqPOvdLOA0z8zH2FSNVLCUfavG','$2y$10$KzKC9i2vP.W8Y.wzqECFseIoVZnrXggZqloh26uyBVGIRPQPW4kTu','marianitaauquilla22@gmail.com','Marianita','Auquilla',NULL,'593995483388','doKgUojTfn4:APA91bE1KzVvvhxie8Ig6HziAZaCTtYTYxfrdX571HJylESMo9MvNuayvja9ZA0imXsWDs9gDzA2x8LDLP0u-JG7ZN6S2We-lHyhP69dgyu38xZ6VYLr3_XtBksGu_yoodiVeQExwjj3','2020-08-03 15:09:14',1,'VENDEDOR','images/profile-107.jpg'),(108,'bcnlivemupi@gmail.com','$2y$10$nnsohcJDUtGScsIWBhYJcuS2pzkcdYgi80V9cY8PsEiA5VeGTImVm','$2y$10$ptfJOrlcPgjL1fTeQIbXwuHojWDMoRUgM4CrCIWnjjCl0FOlakkea','bcnlivemupi@gmail.com','Luis Enrique','Barrozo Muya',NULL,'593671765110','dBhYERkwYqc:APA91bHvX46VSqvtOK_Qaq9Ar2gbLBqf9_xqNpGMNi2i-BC8HZLgYafE07j0Ky8SmtTbyHDsObsNb81cY6SAVabanAg2GXAd0IGhx7vdqpfEMb9MyhOYOEUNtGyYriEHsgzEFFl2J7fl','2020-08-04 15:33:14',1,'CLIENTE','images/profile-108.jpg'),(109,'caesmora96','$2y$10$PoHCAkgowghmcXm8jAFmBubw2ELlTroHvRwVCxlpWeKz4AhZUK8zO','$2y$10$ksaZQEvInOhc73TZWA2qUeFXPJaDMBzNJr6eZIilPYYFt/XfJ7hMu','carlos.moraz@outlook.com','Carlos','Mora Zapater',NULL,'593991460349','eMjavqCgth4:APA91bEvmIsJXqcJqCNRaxB2MtZ9KM758tnXLRLcm9WL5_cnh2NoJ4p1mRKdZuA9BmGSHeJfkW8BpsXLIVzqxiXPiojTrg7gIRSq-_Arv5HHPmtIsU-wYkuE65K0D6sEuzKh6GXKtrWC','2020-08-05 01:11:10',1,'CLIENTE','images/profile-109.jpg'),(110,'@bows_andcrafts','$2y$10$.Yp3n4P5tGgzmh3DtZF4wenSRu.2QPbYuNSFmL1MhbVloiX2AAFaq','$2y$10$PZOW.mg7Kq4xZVx2FdYOnuJFje532vfniuO6.CdAPtREev5CrcA4y','paocruzh77@gmail.com','Myrna Paola','Cruz Huayamave',NULL,'593991143086','fWpJz9Joic4:APA91bHyqxPtTizraD2LWLcVJ8U7_izJnUJCtqba-O9uPdTf87byfZiKiGgZsBzYcpAAhOjCpJd1mONsudPcnwkLcZP0_nQc-wDPojY1e_FQKz0ezHN16UWRzzwRSJco4x6OtHmfijFJ','2020-08-06 01:14:23',1,'VENDEDOR','images/profile-110.jpg'),(113,'Letty','$2y$10$7UAmru225Yx6cBzeADCdCuWOmz0LjIVVAt7ImVcOT7B5/VO6VkTEm','$2y$10$IxJQDZNGyTt7wZvI81wmCewVxOLTq4EXFQivFgK21LCyJTPMuq2M2','az796782@gmail.com','Leticia Viviana','Gonzales Dicado',NULL,'593961288621','cViobsO3dvo:APA91bGernSADgSQj49gJhTNNNIfLFRGhzRqfVDmIF9g0Nexzdcl6gg0W9rm8woDuQl46IedFxB4R-EZqq8FCwEfIjlevgnnl0H5WAUeAo1aYvoo0i5pmXWvFmJmoGa3ZOzqcgNlnTDx','2020-08-12 20:32:29',1,'CLIENTE','images/profile-113.jpg'),(114,'Víctorpala','$2y$10$iQyoc84bgRczipk/jUZoHeElvcxUtwca6uS6uLr3E/LTCCpwi1WfO','$2y$10$UEstGGJK/Yv7oUsEC2gULOht6QW9BwK2Ppbq0CZE/hFJhOr/xJjfe','palavictor@gmail.com','victor','palacios',NULL,'593999876546','fU7x4wNpj9U:APA91bFIFh6TOQ0K8Sd73zmAPwyGgHt2TWlhMr7n2aknbLdVmwK2xolrOmZ2oIqPhC0B9YHQYp6P8Kj-twUeSVdKf1IE-8ci9Ab4KhqPfPPEAw7nXKNaAc9QGmLv7KfD_izkSBLoHXsZ','2020-08-17 06:44:21',1,'CLIENTE','images/profile-114.jpg'),(115,'pquindec','$2y$10$KhkY.xgzMhVfruOK4rTbiucsnCpsb5Ob/c.h0CrcASIgKlz16YSDO','$2y$10$s99azlUaxPcNpSoXNbP3eOuqmv5Aa/p/YGspF4lGbXhYdpsPPHIdq','paulitoq@hotmail.com','Paul','Quinde',NULL,'593984074923','dbF4dffYLV8:APA91bEf6H-lP380RSXpEfs1ATDajXZr0H4mXWsyV8aPdnEDdZxY4sxJjR5Pj2VGlYYlp-lOYM1gk6oO-W-qQ2k-69DUtYlBjejj_lpScsylDWGFHN3xCF24Xf2f5F38_NT3NDM_ca-x','2020-08-17 15:55:19',1,'CLIENTE','images/profile-115.jpg'),(116,'transportista2','$2y$10$3pCeVg/wSnMorlWlPf4pzOogvXdYphGo3R4DZkOTdr//3TYs8mt1.','$2y$10$MOF7xTGZ.WLWVzkbM1pM3uxSKbC.Ev9jrloyedWnZxbYV4kAUzHCq','tuabenito@gmail.com','BENITO','TUAREZ',NULL,'0993051947',NULL,'2020-08-21 03:22:46',1,'TRANSPORTISTA',NULL),(126,'manuelarias','$2y$10$FRoqw9BYSsVaaFLxl7.zjeAP/2erMGA2k9y3JaEx6iM6aMpA.E.b6','$2y$10$xdwH1K2m3NW1MTCEzUW62.E9Y9QNxcLxmVpyF4w8Z8wHEOvxppDCy','manuelarias@gmail.com','manuel','Arias',NULL,'593999786547','fAM3Qtc21X4:APA91bHqbko-CsAUDWAIZpZ7YLNm0h0_cZci0_rmLCHtaODyYMM9cz9OSDRd8-afMnURg1lsgvv_NL-rVmCNlryaMPQnRfTJIV11FQRbn3_viKXI28r4COQ7D2-KjQY-7LPR2WqP1TiM','2020-08-21 03:36:48',1,'CLIENTE','images/profile-126.jpg'),(128,'janeth','$2y$10$2TcTnD9ffGKDlCqT.c/BT.i1krkk78v060w9F9sfEXKayWrriyuSS','$2y$10$JGshUS3f51BBHW1/kO6wdOFo1ftNK2zYMJNklovQ2fxEMlPJE/SVW','jannyromero55@gmail.com','janeth','janeth',NULL,'593janeth','fNQyon8zbKs:APA91bEDp8Ef_SW9iFuB_WkJkSvmH9YjUurcIfEFCg8CoOTaGMStrbzGOwiXD1FjN0U4wGkmgkSTt9uEMToEnNrG54NkpgGxX7ka1xK8Lm4GXWBfmprspsJEmDOA1Sw4K0aQkN7Rq8I9','2020-08-24 22:25:07',1,'CLIENTE','images/profile-128.jpg'),(129,'kevialva','$2y$10$qd3G0wXl8LCYX3XFzQBLdus2OVZ4G4.wEUhO8InsllsIRx0BlOYme','$2y$10$6Sy06xiyBKPxrQJ3TRfSLeLFUATV.7fjXGtfNHeYjdWZmeGnDjSNq','kevin@gmail.com','kevin','Alvarado',NULL,'593976512347',NULL,'2020-08-26 19:47:17',1,'VENDEDOR','images/profile-129.jpg'),(130,'hectorplastic','$2y$10$91h9ks8JFIG0955LY/OC3eFQjRnWsLVHvBvxSJKoZTD/7htZDHh1i','$2y$10$5AuVnPyf.3TIxUuRwXFsj.SAAQh9XnyGtqYvs0kR5k2ECeLm2789q','hectorplastic48666@gmail.com','HECTOR','ARBOLEDA',NULL,'593988341038','cTjHuXdR3SY:APA91bEqwlxEDPj4mnJexFgjC2EtBI7oOq8UF8sfp-LPSlFOtl7czyeyNbPg5wRFO_kjpy9HxEAe_32F1akhhWZvHJ0wx8iZ91-e-UA2vHYwGl7V2uYRh2v9t9Az2MhZbpiwoD0GnYq1','2020-08-26 20:29:03',1,'CLIENTE','images/profile-130.jpg'),(131,'fernando1991','$2y$10$2AGHKUv8QLNpoNP.Xh7e0eA3/aF7YaJdh.PgCF1Sn0juOqW.V62ty','$2y$10$b3egv12MsNxYeaSPIp0IPuOluTybI6HcM3Nm2mfUJEy8WfVA.71mW','fzhunio@hotmail.com','fernando alfonso','zhunio reyes','El fortin','2489233',NULL,'2020-08-27 00:23:00',1,'CLIENTE',NULL),(133,'fernando91','$2y$10$DxylCgCfSYoeRCKVE1uSZ.rYkXjzo2pOT2sKt6N1snbySFjhgWKcm','$2y$10$6iyIjASHOCW86sIFVbhpH.6glxlC6G79ICjnYS9Djdehr8BKMfq8C','fzhunio91@hotmail.com','fernando','Zhunio','mi casa','593939749166',NULL,'2020-08-27 00:25:28',1,'TENDERO',NULL),(134,'fernando','$2y$10$TSANBDMlC50qUZA4JNtsoOy2jepg3Hnp/nYD/RfwAwDlShR8M5neW','$2y$10$yc3QWdfLYyMLsdSemQ0Vz.x33o41vDq5F52hkQ4P7Xj2K.AzJSyXi','fzreyes1991@hotmail.com','fernando','Zhunio','mi casa','593939749166',NULL,'2020-08-27 01:00:18',1,'ADMIN',NULL),(135,'carlos5','$2y$10$Qeo0DSW3mNX7kIJckGGUD.44Bzb/.zbcrJOLJcynjb5Rfc.TI8Tbq','$2y$10$e3lFs6Syq6D0UBSURkKaz.ar/O9idIXEW2tqkcPga13hM5D9o03am','carlos5@Jgmail.com','carlos','caguana',NULL,'593993942225','ec49GR7wC_o:APA91bG-NLNHB_HYEIkGX4e8yvxk3g9rR12lVBAKuCVTpzejluJuqS7f4n0IcQp39IV2lk0sf8KEnAXyykTrcm12_qpwua_fCRm9-Zi2aNv4_Ba_skFJ4hg11OIDIknxXgyOsHd6GwLq','2020-08-27 03:44:19',1,'CLIENTE','images/profile-135.jpg'),(136,'carloa6','$2y$10$7RuhuDShpAP5CfKlYK7tBucZnM.LXXC403XmCe8mANCsn.wr/SL0a','$2y$10$3eYpJaJ2gonGcWk2bWG6o.P0eche.O6DdpVBgoaLCxom/TL1FY23G','carlos6@gmail.com','carloa','caguana',NULL,'593993942225','ec49GR7wC_o:APA91bG-NLNHB_HYEIkGX4e8yvxk3g9rR12lVBAKuCVTpzejluJuqS7f4n0IcQp39IV2lk0sf8KEnAXyykTrcm12_qpwua_fCRm9-Zi2aNv4_Ba_skFJ4hg11OIDIknxXgyOsHd6GwLq','2020-08-27 03:47:52',1,'VENDEDOR','images/profile-136.jpg'),(138,'carlos7@gmail.com','$2y$10$ZlX/4TVQnIn.uMe5ib3qfuSttvaehKiPCQT5OxO4Uo0znsXo3VxX6','$2y$10$.4ec68tGVju7wiarVAo3yekNIxWSkxUMH2efhbrZYI4.EIO7cnZZS','carlos7@gmail.com','carlos','caguana',NULL,'593993942225',NULL,'2020-08-27 03:53:10',1,'TENDERO','images/profile-138.jpg'),(139,'carlos8','$2y$10$9hQ01CqYUb.HazWoj9VNl.ufKUYoSCyFo1tfK6ojd7yeCTCwOr8Xq','$2y$10$BOLGD4oCdbnTcAg.ZMZste2pK/65x1eujEZZV2JlcskO6cS0JmhmS','carlos8@gmail.com','carlos','caguana',NULL,'593993942225',NULL,'2020-08-27 03:55:16',1,'TENDERO',NULL),(141,'carlos10','$2y$10$Z7lSyBYkVvsVke7H0fNQsOulJ/UOhHg29la7itTi6mjth1TCTA2XS','$2y$10$H2gEs1HYKe0qoUxIoshpF.72XoPhD2.PVi.Flu1zRhS2KuqqrvDaO','carlos10@gmail.com','carlos','caguaha',NULL,'593993942225',NULL,'2020-08-27 03:56:49',1,'TENDERO','images/profile-141.jpg'),(144,'carlos11','$2y$10$xdlS227zdariBirABfITMukww7Ey1ise6bJNiNYrSfe/FjFhZ1pPi','$2y$10$F7l2gA2UZD/8nXWFkn2cCOOdbZLABDnqspp0DUN2WCyAXJTJ23pzu','carlos11@gmail.com','carlos','caguaha',NULL,'593993942225',NULL,'2020-08-27 03:58:47',1,'TENDERO',NULL),(145,'carlos20','$2y$10$YkOefi.SI8LS8.rpjYYLNOSxWO5/tcOCe37LFX9naul7VQAFna1C.','$2y$10$NebaPuAc5ohezSSdHLtrneZ3EpvmjhQbm5xepS4Vnh5aBsKtilkfC','carlos20@gmail.com','carlos','caguaha',NULL,'593993942225',NULL,'2020-08-27 04:00:20',1,'TENDERO',NULL),(147,'carlos21','$2y$10$yrR.iMFmXYJR09ly3t/bNuDCeQadvXbF3U3aZoKFktPIOKJRCacG.','$2y$10$W/cUrHqI3pUsHZAQQOMxceItTYze4IMwBBAs.OMuyl0SGsd.CYpui','carlos21@gmail.com','carlos','caguaha',NULL,'593993942225','fAM3Qtc21X4:APA91bHqbko-CsAUDWAIZpZ7YLNm0h0_cZci0_rmLCHtaODyYMM9cz9OSDRd8-afMnURg1lsgvv_NL-rVmCNlryaMPQnRfTJIV11FQRbn3_viKXI28r4COQ7D2-KjQY-7LPR2WqP1TiM','2020-08-27 04:01:45',1,'CLIENTE',NULL),(150,'fernando52','$2y$10$Wlck66Adh3mURhYZumXizuoZfAF4RDJI15KwKZxxAdKTDnP.YM8u.','$2y$10$Zd/.BjTziL8eZTrDsReZPuRB/AQRlcVHMlnkwG5T856BSeuRxRcNO','fzreyes52@hotmail.com','fernando','Zhunio','mi casa','593939749166',NULL,'2020-08-27 21:42:58',1,'TENDERO',NULL),(153,'fernando1952','$2y$10$hO7hg3lINIXJ7ZLgtXFaEuxCybvE3Bha4yMNjpn6lOJW8F4GeYtcO','$2y$10$8e8nJtFg7OX7ndg3ZmX51u90mfUB0gO5eF/2cOq5S8ZHc5xZxCGpi','fzreyes1952@hotmail.com','fernando','Zhunio','mi casa','593939749166',NULL,'2020-08-27 21:47:58',1,'TENDERO',NULL),(156,'fer91','$2y$10$McIwFppm1MjaXj9lXqNJzOH0jaOnIP4M2xv/DMb4DlY4fJv2F2CDm','$2y$10$.GWxZV9arXqm4nY4ozufbOtAWjQM003dUHEmQS5Alc3qKuuaXkrt6','fzreyes91@hotmail.com','fernando alfonso','zhunio reyes','El fortin','2489233',NULL,'2020-08-28 18:46:06',1,'VENDEDOR',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mercados_online'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-13 15:58:26
