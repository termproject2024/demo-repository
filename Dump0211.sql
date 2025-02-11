-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: waste_management
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `kiosk`
--

DROP TABLE IF EXISTS `kiosk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiosk` (
  `kiosk_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `status` enum('정상','고장') DEFAULT '정상',
  `last_maintenance` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`kiosk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiosk`
--

LOCK TABLES `kiosk` WRITE;
/*!40000 ALTER TABLE `kiosk` DISABLE KEYS */;
INSERT INTO `kiosk` VALUES (1,'아파트 정문','정상','2025-01-10','2025-02-02 05:03:49'),(2,'아파트 후문','정상','2025-01-15','2025-02-02 05:03:49');
/*!40000 ALTER TABLE `kiosk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `kiosk_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('신용카드','현금','모바일 결제','QR코드') NOT NULL,
  `payment_status` enum('결제 완료','미결제','결제 실패') DEFAULT '미결제',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `kiosk_id` (`kiosk_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`kiosk_id`) REFERENCES `kiosk` (`kiosk_id`) ON DELETE SET NULL,
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (6,1,NULL,1,5000.00,'신용카드','미결제','2025-02-02 05:04:48'),(7,2,1,NULL,7000.00,'현금','결제 완료','2025-02-02 05:04:48'),(8,3,NULL,2,4500.00,'모바일 결제','결제 완료','2025-02-02 05:04:48'),(9,4,2,NULL,6000.00,'신용카드','결제 완료','2025-02-02 05:04:48'),(10,5,NULL,3,5500.00,'QR코드','미결제','2025-02-02 05:04:48');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `kiosk_id` int DEFAULT NULL,
  `waste_id` int NOT NULL,
  `scheduled_date` datetime NOT NULL,
  `dropoff_location` varchar(255) DEFAULT NULL,
  `status` enum('예약 대기','수거 중','완료','취소') DEFAULT '예약 대기',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservation_id`),
  KEY `user_id` (`user_id`),
  KEY `kiosk_id` (`kiosk_id`),
  KEY `waste_id` (`waste_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`kiosk_id`) REFERENCES `kiosk` (`kiosk_id`) ON DELETE SET NULL,
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`waste_id`) REFERENCES `waste` (`waste_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,NULL,1,'2025-02-10 10:00:00','아파트 101동 분리수거장','예약 대기','2025-02-02 05:03:49'),(2,NULL,1,2,'2025-02-12 15:00:00','아파트 후문 쓰레기장','예약 대기','2025-02-02 05:03:49'),(3,2,NULL,3,'2025-02-15 09:00:00','아파트 202동 앞','완료','2025-02-02 05:03:49'),(4,NULL,2,4,'2025-02-20 18:00:00','아파트 관리실 앞','예약 대기','2025-02-02 05:03:49'),(5,3,NULL,5,'2025-02-25 11:00:00','아파트 주차장','예약 대기','2025-02-02 05:03:49');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `apartment_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role` enum('user','admin','kiosk') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'홍길동','101동 102호','hong@example.com','010-1234-5678','user','2025-02-02 05:03:49'),(2,'김철수','202동 303호','kim@example.com','010-8765-4321','user','2025-02-02 05:03:49'),(3,'이영희','303동 405호','lee@example.com','010-5678-4321','user','2025-02-02 05:03:49'),(4,'관리자','관리실','admin@example.com','010-9999-9999','admin','2025-02-02 05:03:49'),(5,'키오스크1','공용','kiosk1@example.com',NULL,'kiosk','2025-02-02 05:03:49');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waste`
--

DROP TABLE IF EXISTS `waste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waste` (
  `waste_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `ai_predicted_category` varchar(50) DEFAULT NULL,
  `user_corrected_category` varchar(50) DEFAULT NULL,
  `recyclable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`waste_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `waste_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wastecategory` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waste`
--

LOCK TABLES `waste` WRITE;
/*!40000 ALTER TABLE `waste` DISABLE KEYS */;
INSERT INTO `waste` VALUES (1,1,'TV',NULL,1),(2,2,'냉장고',NULL,0),(3,4,'책상',NULL,0),(4,5,'의자',NULL,1),(5,6,'침대',NULL,0),(6,7,'러닝머신',NULL,0);
/*!40000 ALTER TABLE `waste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wastecategory`
--

DROP TABLE IF EXISTS `wastecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wastecategory` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `main_category` enum('가전제품','가구','운동기구','악기','기타') NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `disposal_method` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wastecategory`
--

LOCK TABLES `wastecategory` WRITE;
/*!40000 ALTER TABLE `wastecategory` DISABLE KEYS */;
INSERT INTO `wastecategory` VALUES (1,'가전제품','TV','포장 후 배출'),(2,'가전제품','냉장고','문 분리 후 배출'),(3,'가전제품','세탁기','호스 제거 후 배출'),(4,'가구','책상','다리 분리 후 배출'),(5,'가구','의자','분리 없이 배출 가능'),(6,'가구','침대','매트리스와 프레임 분리 후 배출'),(7,'운동기구','러닝머신','바퀴 고정 후 배출'),(8,'운동기구','덤벨','개별 포장 후 배출'),(9,'악기','피아노','전문업체 처리 필요'),(10,'기타','기타','별도 확인 후 배출');
/*!40000 ALTER TABLE `wastecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wasteimage`
--

DROP TABLE IF EXISTS `wasteimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wasteimage` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `waste_id` int DEFAULT NULL,
  `kiosk_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `ai_predicted_category` varchar(50) DEFAULT NULL,
  `ai_confidence` decimal(5,2) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  `is_corrected` tinyint(1) DEFAULT '0',
  `corrected_category` varchar(50) DEFAULT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `waste_id` (`waste_id`),
  KEY `kiosk_id` (`kiosk_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wasteimage_ibfk_1` FOREIGN KEY (`waste_id`) REFERENCES `waste` (`waste_id`) ON DELETE SET NULL,
  CONSTRAINT `wasteimage_ibfk_2` FOREIGN KEY (`kiosk_id`) REFERENCES `kiosk` (`kiosk_id`) ON DELETE SET NULL,
  CONSTRAINT `wasteimage_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wasteimage`
--

LOCK TABLES `wasteimage` WRITE;
/*!40000 ALTER TABLE `wasteimage` DISABLE KEYS */;
INSERT INTO `wasteimage` VALUES (1,1,NULL,1,'img/tv1.jpg','TV',95.20,1,0,NULL,'2025-02-02 05:03:49'),(2,2,NULL,2,'img/fridge1.jpg','냉장고',92.00,1,0,NULL,'2025-02-02 05:03:49'),(3,3,1,NULL,'img/desk1.jpg','책상',87.80,1,1,'수납장','2025-02-02 05:03:49'),(4,4,NULL,3,'img/chair1.jpg','의자',92.50,1,0,NULL,'2025-02-02 05:03:49'),(5,5,2,NULL,'img/bed1.jpg','침대',89.10,1,0,NULL,'2025-02-02 05:03:49');
/*!40000 ALTER TABLE `wasteimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 16:10:54
