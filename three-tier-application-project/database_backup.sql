-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: webappdb
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1000.00,'Portugat'),(2,500.00,'Greece'),(3,100.00,'groceries'),(4,200.00,'transportation'),(5,50.00,'snacks'),(6,150.50,'dinner'),(7,300.00,'clothing'),(8,75.25,'subscriptions'),(9,250.00,'electronics'),(10,500.00,'furniture'),(11,99.99,'gifts'),(12,120.00,'office supplies'),(13,150.25,'home improvement'),(14,80.00,'pet supplies'),(15,45.75,'books'),(16,67.50,'gym membership'),(17,90.00,'garden supplies'),(18,330.30,'travel'),(19,15.50,'coffee'),(20,60.00,'toiletries'),(21,40.00,'toys'),(22,88.88,'streaming service'),(23,25.00,'takeout'),(24,12.50,'parking'),(25,30.00,'hardware tools'),(26,70.00,'kitchen gadgets'),(27,33.45,'beauty products'),(28,99.99,'bedding'),(29,45.00,'cleaning supplies'),(30,175.00,'school supplies'),(31,22.25,'personal care'),(32,18.75,'craft supplies'),(33,55.50,'car maintenance'),(34,400.00,'rent'),(35,200.00,'insurance'),(36,130.00,'medical bills'),(37,60.60,'food delivery'),(38,150.00,'charity donation'),(39,95.00,'membership fees'),(40,80.00,'tickets'),(41,25.99,'electronics accessories'),(42,77.00,'local business support'),(43,39.99,'streaming hardware'),(44,33.00,'laundry services'),(45,84.85,'sports equipment'),(46,63.50,'gifts for friends'),(47,150.00,'birthday party'),(48,75.00,'movies'),(49,120.00,'event tickets'),(50,400.00,'vacation'),(51,200.00,'seminars'),(52,95.00,'training materials'),(53,88.00,'donations'),(54,35.00,'mobile bill'),(55,44.44,'internet bill'),(56,10.00,'ice cream'),(57,18.50,'brushes'),(58,372.50,'laptop investment'),(59,65.00,'mountain hike supplies'),(60,20.00,'tickets to the fair'),(61,60.00,'fishing trip'),(62,140.00,'new shoes'),(63,239.99,'fitness gear'),(64,315.00,'appliances'),(65,160.00,'home repairs'),(66,210.50,'flower arrangements'),(67,150.00,'corporate gifts'),(68,80.00,'tutoring'),(69,99.99,'workshop fees'),(70,35.00,'e-book purchase'),(71,45.60,'software subscription'),(72,77.50,'kitchen utensils'),(73,55.55,'weekend getaway'),(74,65.00,'concert tickets'),(75,250.00,'art supplies'),(76,89.90,'video games'),(77,50.00,'yard work'),(78,70.00,'landscaping services'),(79,1000.00,'investment'),(80,600.00,'home security'),(81,700.00,'solar panels'),(82,800.00,'remodeling project'),(83,90.00,'maintenance fees'),(84,300.00,'marketing services'),(85,222.22,'gift card'),(86,77.77,'meal for family'),(87,88.88,'outdoor furniture'),(88,40.00,'audiobook subscription'),(89,50.50,'kitchen cleaning'),(90,32.00,'pet grooming'),(91,14.99,'snack delivery'),(92,150.50,'plumbing supplies'),(93,250.00,'catering service'),(94,495.00,'fitness classes'),(95,370.00,'personal trainer'),(96,90.00,'cloud storage'),(97,222.00,'fencing supplies'),(98,800.00,'vehicle repair'),(99,150.00,'haircut'),(100,250.00,'wedding expenses'),(101,500.00,'wedding gifts'),(102,380.00,'new cookware'),(103,80.00,'game subscriptions'),(104,69.95,'dinner event'),(105,45.99,'clothing alterations'),(106,100.00,'key replacement'),(107,250.00,'power tools');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07  9:36:34
