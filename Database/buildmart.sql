CREATE DATABASE  IF NOT EXISTS `newbuild` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newbuild`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: newbuild
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `add_line` varchar(255) DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrgwfi8lanaq12p2pwrvcy1j8n` (`area_id`),
  KEY `FK6i66ijb8twgcqtetl8eeeed6v` (`user_id`),
  CONSTRAINT `FK6i66ijb8twgcqtetl8eeeed6v` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKrgwfi8lanaq12p2pwrvcy1j8n` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK837wykfakx1ncapqbyeueb6pm` (`city_id`),
  CONSTRAINT `FK837wykfakx1ncapqbyeueb6pm` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'KOLHAPUR','416003',1),(2,'PHULEWADI','416010',1),(3,'PRATIBHANAGAR','416008',1),(4,'R K NAGAR KOLHAPUR','416013',1),(5,'RANKALA','416012',1),(6,'SHIVAJI UNIVERSITY','416004',1),(7,'KASBA BAVADA','416006',1),(8,'MANGALWAR PETH KOLHAPUR','416012',1),(9,'RUIKAR COLONY','416005',1),(10,'SHIVAJI VEEDYAPEETH MARG','416008',1),(11,'KOLHAPUR RS','416001',1),(12,'BAHIRESHWAR','416011',1),(13,'KALAMBA','416007',1),(14,'BHUYE','416229',1),(15,'POHALE TURF ALATE','416229',1),(16,'SHUKRAWAR PETH KOLHAPUR','416002',1),(17,'VADANGE','416229',1),(18,'BABUJAMAL','416012',1),(19,'GADMUDSHINGI','416119',1),(20,'GANDHINAGAR KOLHAPUR','416119',1),(21,'Satara','415001',3),(22,'Wai','412803',3),(23,'Khandala','412802',3),(24,'Koregaon','415501',3),(25,'Phaltan','415523',3),(26,'Maan','415508',3),(27,'Khatav','415506',3),(28,'Karad','415510',3),(29,'Patan','415206',3),(30,'Jaoli','415012',3),(31,'Mahabaleshwar','412806',3);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `vendor_product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  KEY `FKdwm79hmu39fl43u7vijrgkavh` (`vendor_product_id`),
  CONSTRAINT `FKdwm79hmu39fl43u7vijrgkavh` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_product` (`id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,0,9,17);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Material used in concrete for creating a smooth, even surface.','Fine aggregate'),(2,'Material used in concrete for strength and stability.','Coarse aggregate'),(3,'Building blocks used for construction.','Blocks'),(4,'Common type of bricks used in construction.','Red bricks'),(5,'Type of cement used in general construction.','Ordinary Portland Cement'),(6,'Cement with added pozzolanic materials.','Portland Pozzolana Cement'),(7,'Entry and exit points of buildings.','Doors'),(8,'Electrical appliances used for air circulation.','Ceiling fans'),(9,'Devices to control electrical circuits.','Switches'),(10,'Conductors for electrical connections.','Wires and cables'),(11,'Colorful coatings for walls and surfaces.','Paints'),(12,'Materials for finishing wall surfaces.','Wallcare finishers'),(13,'Putty used to prepare walls for painting.','WallCare Putty'),(14,'Components for plumbing systems.','Pipes fittings and connectors'),(15,'Valves for controlling water flow.','Taps'),(16,'Water fixtures for bathing.','Showers'),(17,'Durable tiles used for flooring and walls.','Ceramic tiles'),(18,'Tiles suitable for industrial spaces.','Industrial tiles'),(19,'Tiles made of glass, used for aesthetic purposes.','Glass tiles'),(20,'Openings in walls with glass panes for ventilation and light.','Windows');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Kolhapur'),(2,'Pune'),(3,'Satara');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_companies`
--

DROP TABLE IF EXISTS `construction_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `construction_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK600rg922wqno3wdkmrebyv5h7` (`uid`),
  CONSTRAINT `FK600rg922wqno3wdkmrebyv5h7` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_companies`
--

LOCK TABLES `construction_companies` WRITE;
/*!40000 ALTER TABLE `construction_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `construction_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_material_vendors`
--

DROP TABLE IF EXISTS `construction_material_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `construction_material_vendors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `reg_no` varchar(45) DEFAULT NULL,
  `valid` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_no_UNIQUE` (`reg_no`),
  UNIQUE KEY `contact_number_UNIQUE` (`contact_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FKpxmktnf11fe4m0l884rd5gd6f` (`uid`),
  CONSTRAINT `FKpxmktnf11fe4m0l884rd5gd6f` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_material_vendors`
--

LOCK TABLES `construction_material_vendors` WRITE;
/*!40000 ALTER TABLE `construction_material_vendors` DISABLE KEYS */;
INSERT INTO `construction_material_vendors` VALUES (4,'9865320147','suyash66@gmail.com','SB and Sons',10,NULL,1),(5,'7410258963','gajanan@gmail.com','Gaju Tiles',12,NULL,0);
/*!40000 ALTER TABLE `construction_material_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual_customer`
--

DROP TABLE IF EXISTS `individual_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjgkdif4y6fwy5g5hoyulvh0s` (`user_id`),
  CONSTRAINT `FKjgkdif4y6fwy5g5hoyulvh0s` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual_customer`
--

LOCK TABLES `individual_customer` WRITE;
/*!40000 ALTER TABLE `individual_customer` DISABLE KEYS */;
INSERT INTO `individual_customer` VALUES (5,'9503503387','nikamrushikesh1111@gmail.com','Rushikesh','Nikam',9),(6,'1236985470','bm@gmail.com','Build','mart',11);
/*!40000 ALTER TABLE `individual_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_payments`
--

DROP TABLE IF EXISTS `membership_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7mh2qxkemikhrky85lul2sqhc` (`plan_id`),
  KEY `FKnuuxbvgtg8j7pmowoeseafxkh` (`vendor_id`),
  CONSTRAINT `FK7mh2qxkemikhrky85lul2sqhc` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `FKnuuxbvgtg8j7pmowoeseafxkh` FOREIGN KEY (`vendor_id`) REFERENCES `construction_material_vendors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_payments`
--

LOCK TABLES `membership_payments` WRITE;
/*!40000 ALTER TABLE `membership_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `vendor_product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  KEY `FK1nsu2liolixbprqtb25irx0jh` (`vendor_product_id`),
  CONSTRAINT `FK1nsu2liolixbprqtb25irx0jh` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_product` (`id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'placed'),(2,'delivered');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `final_payment_amount` double DEFAULT NULL,
  `final_payment_date` date DEFAULT NULL,
  `final_payment_mode` varchar(255) DEFAULT NULL,
  `final_payment_transaction_id` varchar(255) DEFAULT NULL,
  `initial_payment_amount` double DEFAULT NULL,
  `initial_payment_date` date DEFAULT NULL,
  `initial_payment_mode` varchar(255) DEFAULT NULL,
  `initial_payment_transaction_id` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_price` double DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf5464gxwc32ongdvka2rtvw96` (`address_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  KEY `FK1abokg3ghque9pf2ujbxakng` (`status_id`),
  CONSTRAINT `FK1abokg3ghque9pf2ujbxakng` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKf5464gxwc32ongdvka2rtvw96` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `picture` longblob,
  PRIMARY KEY (`id`),
  KEY `FK15qxrbiip6pqxilyhspl7dfyb` (`cid`),
  CONSTRAINT `FK15qxrbiip6pqxilyhspl7dfyb` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (95,'acts as filler that occupies bulk volume in mortar and fills up voids between coarse aggregate particles in concrete','sand',NULL,1,'');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What is your mother\'s name?'),(2,'What is the name of your pet?'),(3,'In which city were you born?'),(4,'What is your favorite book?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6cpw2nlklblpvc7hyt7ko6v3e` (`user_id`),
  KEY `FK3s339qi06imjimv5ruyeu8wao` (`vendor_id`),
  CONSTRAINT `FK3s339qi06imjimv5ruyeu8wao` FOREIGN KEY (`vendor_id`) REFERENCES `construction_material_vendors` (`id`),
  CONSTRAINT `FK6cpw2nlklblpvc7hyt7ko6v3e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Individual customer'),(2,'Construction company'),(3,'Construction Material vendor'),(4,'Construction labours'),(5,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_providers`
--

DROP TABLE IF EXISTS `service_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `rates` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_number_UNIQUE` (`contact_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FKohlwfq5rgdtx3o5s72cvlcbk6` (`uid`),
  CONSTRAINT `FKohlwfq5rgdtx3o5s72cvlcbk6` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_providers`
--

LOCK TABLES `service_providers` WRITE;
/*!40000 ALTER TABLE `service_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active_status` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl0balba7embxdbwcjhxsb2kmy` (`question_id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKl0balba7embxdbwcjhxsb2kmy` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,NULL,'tom','Rushi@28','Rushikesh',2,1),(10,NULL,'sun','Suya@123','Suyash',2,3),(11,NULL,'knowit','Bm@12345','buildmart',3,5),(12,NULL,'cpp','Gaju@123','Gaju',4,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_product`
--

DROP TABLE IF EXISTS `vendor_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `offer_percentage` int DEFAULT NULL,
  `offer_valid_date` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK63117s2lux1fh85t151s1ej1g` (`product_id`),
  KEY `FKkx7dk6wsgi471bo7x4pq2g4jw` (`vendor_id`),
  CONSTRAINT `FK63117s2lux1fh85t151s1ej1g` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKkx7dk6wsgi471bo7x4pq2g4jw` FOREIGN KEY (`vendor_id`) REFERENCES `construction_material_vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_product`
--

LOCK TABLES `vendor_product` WRITE;
/*!40000 ALTER TABLE `vendor_product` DISABLE KEYS */;
INSERT INTO `vendor_product` VALUES (17,10,'2024-02-17',500,100,95,4);
/*!40000 ALTER TABLE `vendor_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16  8:28:55
