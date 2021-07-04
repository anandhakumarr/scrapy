-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price` (
  `id` int(11) NOT NULL,
  `crawled_time` datetime NOT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`crawled_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (230078,'2017-06-19 13:27:03',4.99,'400g'),(230079,'2017-06-19 13:27:04',4.99,'400g'),(230080,'2017-06-19 13:27:06',2.06,'half each'),(230081,'2017-06-19 13:27:07',1.93,'each'),(230082,'2017-06-19 13:27:08',3.5,'each'),(230083,'2017-06-19 13:27:10',3.9,'200g tub'),(230084,'2017-06-19 13:27:11',3.9,'1kg punnet'),(230085,'2017-06-19 13:27:12',0.68,'each'),(230086,'2017-06-19 13:27:14',0.76,'each'),(230087,'2017-06-19 13:27:15',4.9,'400g  bunch'),(230088,'2017-06-19 13:27:16',3.9,'1kg punnet'),(230089,'2017-06-19 13:27:17',0.7,'each'),(230090,'2017-06-19 13:27:19',2.9,'1kg punnet'),(230091,'2017-06-19 13:27:20',0.51,'each'),(230092,'2017-06-19 13:27:21',4.8,'8pk punnet'),(230093,'2017-06-19 13:27:22',0.47,'each'),(230094,'2017-06-19 13:27:24',1.95,'each'),(230095,'2017-06-19 13:27:25',5.7,'1kg punnet'),(230096,'2017-06-19 13:27:26',3.9,'200g tub'),(230097,'2017-06-19 13:27:28',2.85,'quarter each'),(230098,'2017-06-19 13:27:29',1.18,'each'),(230099,'2017-06-19 13:27:30',4.13,'whole each'),(230100,'2017-06-19 13:27:31',6.9,'1kg punnet');
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-19 13:29:27
