-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Women'),(2,'Men'),(3,'Complements'),(4,'T-shirts'),(5,'Shoeware'),(7,'Shirts');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users1_idx` (`users_id`),
  KEY `fk_comments_products1_idx` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Great quality and fast delivery!',1,1),(2,'Excellent customer service!',1,2),(3,'Really satisfied with my purchase.',1,1),(4,'Very comfortable to wear all day.',3,4),(5,'Amazing price for such good quality.',5,5),(6,'Exactly what I was looking for.',3,3),(7,'Highly recommended!',5,6),(8,'Great value for money.',4,4),(9,'A very comfy mat.',12,7),(11,'That\'s a very stylish backpack.',9,8),(12,'Some weeks since I bought them, they sound very clear and last all day long.',10,9),(13,'That\'s so helpfull.',8,13),(14,'That\'s a lot old fashion!',7,14),(15,'Very handy.',6,16);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_users_idx` (`users_id`),
  KEY `fk_favorites_products1_idx` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,2),(2,2,3),(3,3,4),(4,4,5),(5,5,6),(6,6,7),(7,7,8),(9,9,10),(10,10,1),(11,7,5),(19,8,9),(22,8,19),(38,12,5),(45,12,9),(46,12,20),(49,8,23),(51,0,7);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int NOT NULL,
  `users_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users1_idx` (`users_id`),
  KEY `fk_orders_products1_idx` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-04-18 10:00:00','ORD001','2024-04-18 10:00:00',2,1,2),(2,'2024-04-17 09:30:00','ORD002','2024-04-17 09:30:00',1,2,5),(3,'2024-04-16 14:45:00','ORD003','2024-04-16 14:45:00',3,3,1),(4,'2024-04-15 11:20:00','ORD004','2024-04-15 11:20:00',1,4,7),(5,'2024-04-14 13:55:00','ORD005','2024-04-14 13:55:00',2,5,4),(6,'2024-04-13 08:10:00','ORD006','2024-04-13 08:10:00',1,6,9),(7,'2024-04-12 17:30:00','ORD007','2024-04-12 17:30:00',2,7,3),(8,'2024-04-11 12:40:00','ORD008','2024-04-11 12:40:00',1,8,6),(9,'2024-04-10 15:15:00','ORD009','2024-04-10 15:15:00',3,9,8),(10,'2024-04-09 09:00:00','ORD010','2024-04-09 09:00:00',1,10,10),(11,'2024-04-08 14:30:00','ORD011','2024-04-08 14:30:00',2,1,4),(12,'2024-04-07 11:45:00','ORD012','2024-04-07 11:45:00',1,2,3),(13,'2024-04-06 10:20:00','ORD013','2024-04-06 10:20:00',3,3,2),(14,'2024-04-05 09:35:00','ORD014','2024-04-05 09:35:00',1,4,1),(15,'2024-04-04 13:00:00','ORD015','2024-04-04 13:00:00',2,1,5),(16,'2024-04-03 16:45:00','ORD016','2024-04-03 16:45:00',1,2,6),(17,'2024-04-02 08:50:00','ORD017','2024-04-02 08:50:00',3,3,7),(18,'2024-04-01 12:15:00','ORD018','2024-04-01 12:15:00',1,4,8),(19,'2024-03-31 15:30:00','ORD019','2024-03-31 15:30:00',2,5,9),(20,'2024-03-30 09:10:00','ORD020','2024-03-30 09:10:00',1,6,10),(26,'2024-04-23 13:42:37','ORDER012','2024-04-23 13:42:37',1,7,1),(27,'2024-04-23 13:42:39','ORDER012','2024-04-23 13:42:39',1,7,1),(28,'2024-04-23 13:42:40','ORDER012','2024-04-23 13:42:40',1,7,1),(29,'2024-04-23 13:42:42','ORDER012','2024-04-23 13:42:42',1,7,1),(30,'2024-04-23 13:42:43','ORDER012','2024-04-23 13:42:43',1,7,1),(31,'2024-04-23 13:42:45','ORDER012','2024-04-23 13:42:45',1,7,1),(32,'2024-04-24 13:55:40','ORDER012','2024-04-24 13:55:40',1,7,1),(33,'2024-04-24 13:56:14','ORDER012','2024-04-24 13:56:14',1,7,1),(34,'2024-04-24 15:14:08','ORDER012','2024-04-24 15:14:08',1,7,1),(35,'2024-04-24 15:24:28','ORDER012','2024-04-24 15:24:28',1,7,1),(36,'2024-04-24 15:25:48','ORD1713965148','2024-04-24 15:25:48',1,8,9),(37,'2024-04-24 15:25:48','ORD1713965148','2024-04-24 15:25:48',1,8,13),(38,'2024-04-24 15:25:48','ORD1713965148','2024-04-24 15:25:48',1,8,7),(39,'2024-04-24 15:25:48','ORD1713965148','2024-04-24 15:25:48',1,8,20),(40,'2024-04-24 15:25:48','ORD1713965148','2024-04-24 15:25:48',1,8,8),(41,'2024-04-24 15:25:48','ORD1713965148','2024-04-24 15:25:48',3,8,6),(42,'2024-04-25 11:43:42','ORD1714038222','2024-04-25 11:43:42',1,12,7),(43,'2024-05-19 16:03:56','ORD1716127436','2024-05-19 16:03:56',1,8,23),(44,'2024-05-19 16:52:28','ORD1716130348','2024-05-19 16:52:28',1,12,7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint NOT NULL DEFAULT '0',
  `categories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `fk_products_categories1_idx` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Classic T-Shirt','A comfortable and stylish t-shirt for daily wear',15.99,'https://img.sharemyimage.com/2024/04/17/page-1.jpeg',1,1),(2,'Slim Fit Jeans','High-quality denim jeans with a slim fit',29.99,'https://img.sharemyimage.com/2024/04/17/page-2.jpeg',0,1),(3,'Running Shoes','Lightweight and durable shoes for running all day long',53.9,'https://img.sharemyimage.com/2024/04/17/page-3.jpeg',0,5),(4,'Leather Wallet','Genuine leather wallet with multiple compartments',24.99,'https://img.sharemyimage.com/2024/04/17/page-4.jpeg',0,3),(6,'Smartphone Case','Protective case for smartphones',12.99,'https://img.sharemyimage.com/2024/04/17/page-6.jpeg',0,3),(7,'Yoga Mat','Non-slip yoga mat for yoga and exercise',19.99,'https://img.sharemyimage.com/2024/04/17/page-7.jpeg',1,3),(8,'Laptop Backpack','Spacious backpack for carrying laptops and accessories',39.99,'https://img.sharemyimage.com/2024/04/17/page-8.jpeg',0,5),(9,'Wireless Earbuds','Bluetooth earbuds for wireless listening',69.99,'https://img.sharemyimage.com/2024/04/17/page-9.jpeg',1,3),(10,'Sunglasses','UV protection sunglasses for sunny days',17.99,'https://img.sharemyimage.com/2024/04/17/page-10.jpeg',0,3),(11,'Hooded Sweatshirt','Cozy hooded sweatshirt for chilly weather',34.99,'https://img.sharemyimage.com/2024/04/17/page-11.jpeg',1,1),(12,'Denim Jacket','Classic denim jacket with a timeless design',59.99,'https://img.sharemyimage.com/2024/04/17/page-12.jpeg',0,1),(13,'Fitness Tracker','Wearable fitness tracker to monitor activity',79.99,'https://img.sharemyimage.com/2024/04/17/page-13.jpeg',1,4),(14,'Leather Messenger Bag','Stylish leather messenger bag for everyday use',89.99,'https://img.sharemyimage.com/2024/04/17/page-14.jpeg',0,3),(15,'Protein Powder','High-quality protein powder for muscle recovery',29.99,'https://img.sharemyimage.com/2024/04/17/page-15.jpeg',1,4),(16,'Portable Charger','Compact portable charger for on-the-go charging',19.99,'https://img.sharemyimage.com/2024/04/17/page-16.jpeg',0,3),(17,'Yoga Blocks','Set of yoga blocks for support and stability',14.99,'https://img.sharemyimage.com/2024/04/17/page-17.jpeg',1,4),(18,'Laptop Sleeve','Padded laptop sleeve for protection',24.99,'https://img.sharemyimage.com/2024/04/17/page-18.jpeg',0,3),(19,'Wireless Mouse','Ergonomic wireless mouse for comfortable use',12.99,'https://img.sharemyimage.com/2024/04/17/page-19.jpeg',1,3),(20,'Reflective Running Jacket','Jacket with reflective strips for night running',49.99,'https://img.sharemyimage.com/2024/04/17/page-20.jpeg',0,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `last_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `card_number` bigint NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci COMMENT='\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','123 Main Street','john@example.com',1234567890,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(2,'Jane','Smith','456 Elm Street','jane@example.com',9876543210,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(3,'Michael','Johnson','789 Oak Street','michael@example.com',1357924680,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(4,'Emily','Williams','101 Maple Street','emily@example.com',2468135790,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(5,'David','Brown','222 Pine Street','david@example.com',3692581470,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(6,'Sarah','Jones','333 Cedar Street','sarah@example.com',9753108642,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(7,'Christopher','Garcia','444 Birch Street','christopher@example.com',7531908642,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','user'),(8,'Jennifer','Martinez','555 Spruce Street','jennifer@example.com',9517530864,'$2a$08$P23pfwfT/RRC4YbGyaDFoeVfxiP.oiKVA2zIjoNE5iP4h3t1rmamW','admin'),(9,'Daniel','Lopez','666 Walnut Street','daniel@example.com',3571594862,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(10,'Lisa','Gonzalez','777 Cherry Street','lisa@example.com',1594872630,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(11,'Matthew','Rodriguez','888 Apple Street','matthew@example.com',8529637410,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(12,'Ashley','Hernandez','999 Peach Street','ashley@example.com',3698521470,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(13,'Justin','Wilson','111 Plum Street','justin@example.com',1472583690,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(14,'Samantha','Lopez','222 Grape Street','samantha@example.com',2581473690,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(15,'Andrew','Perez','333 Mango Street','andrew@example.com',1239874560,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(16,'Jessica','Sanchez','444 Banana Street','jessica@example.com',4567891230,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(17,'Joshua','Ramirez','555 Orange Street','joshua@example.com',7894561230,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(18,'Amanda','Torres','666 Lemon Street','amanda@example.com',9876543210,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(19,'Brandon','Flores','777 Lime Street','brandon@example.com',6543219870,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user'),(20,'Elizabeth','Rivera','888 Grapefruit Street','elizabeth@example.com',3216549870,'$2a$08$DCtW6IvuJ3nPhYYp3lnV2.HVRx5ozq8LbZIrRxvcsO2h4CCjOvNQS','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'e_commerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 17:30:26
