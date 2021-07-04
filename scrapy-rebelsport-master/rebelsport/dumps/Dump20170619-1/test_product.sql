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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_site` varchar(50) DEFAULT NULL,
  `from_id` varchar(50) DEFAULT NULL,
  `original_url` varchar(256) DEFAULT NULL,
  `crawled_time` datetime DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  `brand` varchar(200) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `extracted_unit` tinyint(4) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `description` longtext,
  `feature` longtext,
  `usage_instruction` longtext,
  `last_insert_price_time` datetime DEFAULT NULL,
  `latest_price` float DEFAULT NULL,
  `before_price` float DEFAULT NULL,
  `change_percent` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `has_nutrition` int(11) DEFAULT NULL,
  `normal_price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `last_update_normal_price` datetime DEFAULT NULL,
  `last_changed_price_time` datetime DEFAULT NULL,
  `serving_size` varchar(45) DEFAULT NULL,
  `ingredient` longtext,
  `full_name_before_remove_unit` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_product_from_site_from_id` (`from_site`,`from_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (230078,'woolworth','793191','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit-veg-specials?name=woolworths-select-potato-salad&productId=793191','2017-06-19 13:27:03','Woolworths Select Potato Salad','woolworths-select-potato-salad','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/793191.jpg',NULL,'400g',NULL,'Woolworths Select Potato Salad','fruit-veg/fruit-veg-specials',NULL,NULL,NULL,'2017-06-19 13:27:03',4.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230079,'woolworth','793193','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit-veg-specials?name=woolworths-select-pasta-salad&productId=793193','2017-06-19 13:27:04','Woolworths Select Pasta Salad','woolworths-select-pasta-salad','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/793193.jpg',NULL,'400g',NULL,'Woolworths Select Pasta Salad','fruit-veg/fruit-veg-specials','<p>- No artificial colours or flavours</p><p>- Source of Dietary Fibre.</p>',NULL,NULL,'2017-06-19 13:27:04',4.99,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230080,'woolworth','935937','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=melon-de-sapo&productId=935937','2017-06-19 13:27:06','Melon De Sapo','melon-de-sapo','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/935937.jpg',NULL,'half each',NULL,'Melon De Sapo','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:06',2.06,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230081,'woolworth','147315','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=quince-fresh&productId=147315','2017-06-19 13:27:07','Quince Fresh','quince-fresh','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/147315.jpg',NULL,'each',NULL,'Quince Fresh','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:07',1.93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230082,'woolworth','137009','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=coconut-green-for-drinking&productId=137009','2017-06-19 13:27:08','Coconut Green For Drinking','coconut-green-for-drinking','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/137009.jpg',NULL,'each',NULL,'Coconut Green For Drinking','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:08',3.5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230083,'woolworth','768772','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=fresh-berry-farm-berry-sauce-summer-berries&productId=768772','2017-06-19 13:27:10','Fresh Berry Farm Berry Sauce Summer Berries','fresh-berry-farm-berry-sauce-summer-berries','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/768772.jpg',NULL,'200g tub',NULL,'Fresh Berry Farm Berry Sauce Summer Berries','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:10',3.9,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230084,'woolworth','310966','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-granny-smith&productId=310966','2017-06-19 13:27:11','Apple Granny Smith','apple-granny-smith','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/310966.jpg',NULL,'1kg punnet',NULL,'Apple Granny Smith','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:11',3.9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230085,'woolworth','130935','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-granny-smith&productId=130935','2017-06-19 13:27:12','Apple Granny Smith','apple-granny-smith','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/130935.jpg',NULL,'each',NULL,'Apple Granny Smith','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:12',0.68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230086,'woolworth','133211','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=banana-cavendish&productId=133211','2017-06-19 13:27:14','Banana Cavendish','banana-cavendish','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/133211.jpg',NULL,'each',NULL,'Banana Cavendish','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:14',0.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230087,'woolworth','774552','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=grapes-red&productId=774552','2017-06-19 13:27:15','Grapes Red','grapes-red','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/774552.jpg',NULL,'400g  bunch',NULL,'Grapes Red','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:15',4.9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230088,'woolworth','310968','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-pink-lady&productId=310968','2017-06-19 13:27:16','Apple Pink Lady','apple-pink-lady','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/310968.jpg',NULL,'1kg punnet',NULL,'Apple Pink Lady','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:16',3.9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230089,'woolworth','105919','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-pink-lady&productId=105919','2017-06-19 13:27:17','Apple Pink Lady','apple-pink-lady','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/105919.jpg',NULL,'each',NULL,'Apple Pink Lady','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:17',0.7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230090,'woolworth','314012','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-royal-gala&productId=314012','2017-06-19 13:27:19','Apple Royal Gala','apple-royal-gala','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/314012.jpg',NULL,'1kg punnet',NULL,'Apple Royal Gala','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:19',2.9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230091,'woolworth','155003','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-royal-gala&productId=155003','2017-06-19 13:27:20','Apple Royal Gala','apple-royal-gala','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/155003.jpg',NULL,'each',NULL,'Apple Royal Gala','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:20',0.51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230092,'woolworth','786152','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=kiwi-fruit-green&productId=786152','2017-06-19 13:27:21','Kiwi Fruit Green','kiwi-fruit-green','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/786152.jpg',NULL,'8pk punnet',NULL,'Kiwi Fruit Green','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:21',4.8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230093,'woolworth','139238','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=kiwi-fruit-green&productId=139238','2017-06-19 13:27:22','Kiwi Fruit Green','kiwi-fruit-green','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/139238.jpg',NULL,'each',NULL,'Kiwi Fruit Green','fruit-veg/fruit','look for firm plump green kiwifruit with no splits in the skin. store green kiwifruit at room temperature out of direct sunlight until they yield slightly to gentle pressure. once at this stage store in the fridge for 2 to 3 days. simply peel green kiwifruit then slice and enjoy. a good way to peel them is to cut a thin slice off each end then stand on a chopping board. run a small sharp knife between the flesh and the skin to remove skin in strips.',NULL,NULL,'2017-06-19 13:27:22',0.47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230094,'woolworth','145289','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=pear-nashi-fruit-brown&productId=145289','2017-06-19 13:27:24','Pear Nashi Fruit Brown','pear-nashi-fruit-brown','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/145289.jpg',NULL,'each',NULL,'Pear Nashi Fruit Brown','fruit-veg/fruit','look for firm nashi pears that feel relatively heavy for their size. their skin shouldn’t have any splits or soft patches. store nashi pears in the fridge for up to 1 week. wash in cold water then slice or chop as desired. if slicing brush slices with a little lemon juice to prevent them from discolouring.',NULL,NULL,'2017-06-19 13:27:24',1.95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230095,'woolworth','785544','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-kanzi&productId=785544','2017-06-19 13:27:25','Apple Kanzi','apple-kanzi','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/785544.jpg',NULL,'1kg punnet',NULL,'Apple Kanzi','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:25',5.7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230096,'woolworth','768639','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=fresh-berry-farm-berry-sauce-mango-passionfruit&productId=768639','2017-06-19 13:27:26','Fresh Berry Farm Berry Sauce Mango Passionfruit','fresh-berry-farm-berry-sauce-mango-passionfruit','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/768639.jpg',NULL,'200g tub',NULL,'Fresh Berry Farm Berry Sauce Mango Passionfruit','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:26',3.9,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230097,'woolworth','120384','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=watermelon-red-seedless&productId=120384','2017-06-19 13:27:28','Watermelon Red Seedless','watermelon-red-seedless','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/120384.jpg',NULL,'quarter each',NULL,'Watermelon Red Seedless','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:28',2.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230098,'woolworth','145182','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=pear-corella&productId=145182','2017-06-19 13:27:29','Pear Corella','pear-corella','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/145182.jpg',NULL,'each',NULL,'Pear Corella','fruit-veg/fruit',NULL,NULL,NULL,'2017-06-19 13:27:29',1.18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230099,'woolworth','172659','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=papaya-red-whole&productId=172659','2017-06-19 13:27:30','Papaya Red Whole','papaya-red-whole','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/172659.jpg',NULL,'whole each',NULL,'Papaya Red Whole','fruit-veg/fruit','look for smooth-skinned papaya with no blemishes or splits in the skin. they should feel relatively heavy for their size and have a pleasant tropical aroma. store papaya in a single layer at room temperature out of direct sunlight until they yield to gently pressure when cradled in your hand. once at this stage store in the fridge for 2 to 3 days. simply cut in half lengthways and scoop out the seeds then either cut into wedges or peel away the skin before slicing as required.',NULL,NULL,'2017-06-19 13:27:30',4.13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230100,'woolworth','211774','https://www.woolworths.com.au/Shop/Browse/fruit-veg/fruit?name=apple-fuji-organic&productId=211774','2017-06-19 13:27:31','Apple Fuji Organic','apple-fuji-organic','https://wowprodmedia002aae.azureedge.net/content/wowproductimages/large/211774.jpg',NULL,'1kg punnet',NULL,'Apple Fuji Organic','fruit-veg/fruit','re-discover authentic apple flavour with these certified organic fuji apples harvested from our certified organic orchards in tasmania. great as a snack or as a baked winter dessert, these organic fuji apples are sought after by those seeking the real apple flavour with great organic nutrition.',NULL,NULL,'2017-06-19 13:27:31',6.9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
