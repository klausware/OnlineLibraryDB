-- MySQL dump 10.13  Distrib 8.3.0, for macos12.6 (x86_64)
--
-- Host: localhost    Database: OnlineLibraryDB
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Current Database: `OnlineLibraryDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `OnlineLibraryDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `OnlineLibraryDB`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add book',7,'add_book'),(26,'Can change book',7,'change_book'),(27,'Can delete book',7,'delete_book'),(28,'Can view book',7,'view_book'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add genre',9,'add_genre'),(34,'Can change genre',9,'change_genre'),(35,'Can delete genre',9,'delete_genre'),(36,'Can view genre',9,'view_genre'),(37,'Can add member',10,'add_member'),(38,'Can change member',10,'change_member'),(39,'Can delete member',10,'delete_member'),(40,'Can view member',10,'view_member'),(41,'Can add borrowing',11,'add_borrowing'),(42,'Can change borrowing',11,'change_borrowing'),(43,'Can delete borrowing',11,'delete_borrowing'),(44,'Can view borrowing',11,'view_borrowing'),(45,'Can add review',12,'add_review'),(46,'Can change review',12,'change_review'),(47,'Can delete review',12,'delete_review'),(48,'Can view review',12,'view_review'),(49,'Can add publisher',13,'add_publisher'),(50,'Can change publisher',13,'change_publisher'),(51,'Can delete publisher',13,'delete_publisher'),(52,'Can view publisher',13,'view_publisher'),(53,'Can add combined book details',14,'add_combinedbookdetails'),(54,'Can change combined book details',14,'change_combinedbookdetails'),(55,'Can delete combined book details',14,'delete_combinedbookdetails'),(56,'Can view combined book details',14,'view_combinedbookdetails'),(57,'Can add book borrowing review',15,'add_bookborrowingreview'),(58,'Can change book borrowing review',15,'change_bookborrowingreview'),(59,'Can delete book borrowing review',15,'delete_bookborrowingreview'),(60,'Can view book borrowing review',15,'view_bookborrowingreview'),(61,'Can add borrowing archive',16,'add_borrowingarchive'),(62,'Can change borrowing archive',16,'change_borrowingarchive'),(63,'Can delete borrowing archive',16,'delete_borrowingarchive'),(64,'Can view borrowing archive',16,'view_borrowingarchive'),(65,'Can add status',17,'add_status'),(66,'Can change status',17,'change_status'),(67,'Can delete status',17,'delete_status'),(68,'Can view status',17,'view_status');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$MYdm7fofFHPnspQmF8YX5y$FQF4plvSn5H1oq5K7DEP1I6IV+gAo+npqEGrWKb4hWg=','2024-03-31 15:07:55.378911',1,'klaus','','','nk3338@nyu.edu',1,1,'2024-03-21 19:09:20.120894');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `combinedbookdetails`
--

DROP TABLE IF EXISTS `combinedbookdetails`;
/*!50001 DROP VIEW IF EXISTS `combinedbookdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `combinedbookdetails` AS SELECT 
 1 AS `book_id`,
 1 AS `book_title`,
 1 AS `author_name`,
 1 AS `publisher_name`,
 1 AS `average_rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-21 19:10:13.803682','1','Charles Dickens',1,'[{\"added\": {}}]',8,1),(2,'2024-03-21 20:07:03.017749','2','Marry Shelley',1,'[{\"added\": {}}]',8,1),(3,'2024-03-21 21:08:35.343452','3','J.R.R Tolkien',1,'[{\"added\": {}}]',8,1),(4,'2024-03-21 23:35:09.645844','1','Fantasy',1,'[{\"added\": {}}]',9,1),(5,'2024-03-21 23:35:14.085810','2','Adventure',1,'[{\"added\": {}}]',9,1),(6,'2024-03-21 23:35:24.622469','3','Horror',1,'[{\"added\": {}}]',9,1),(7,'2024-03-21 23:35:29.391318','4','Science Fiction',1,'[{\"added\": {}}]',9,1),(8,'2024-03-21 23:36:04.326104','5','Historical Fiction',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'webapp','author'),(7,'webapp','book'),(15,'webapp','bookborrowingreview'),(11,'webapp','borrowing'),(16,'webapp','borrowingarchive'),(14,'webapp','combinedbookdetails'),(9,'webapp','genre'),(10,'webapp','member'),(13,'webapp','publisher'),(12,'webapp','review'),(17,'webapp','status');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-21 18:49:31.615489'),(2,'auth','0001_initial','2024-03-21 18:49:31.850933'),(3,'admin','0001_initial','2024-03-21 18:49:31.911588'),(4,'admin','0002_logentry_remove_auto_add','2024-03-21 18:49:31.919632'),(5,'admin','0003_logentry_add_action_flag_choices','2024-03-21 18:49:31.928839'),(6,'contenttypes','0002_remove_content_type_name','2024-03-21 18:49:31.978353'),(7,'auth','0002_alter_permission_name_max_length','2024-03-21 18:49:32.010003'),(8,'auth','0003_alter_user_email_max_length','2024-03-21 18:49:32.034120'),(9,'auth','0004_alter_user_username_opts','2024-03-21 18:49:32.041503'),(10,'auth','0005_alter_user_last_login_null','2024-03-21 18:49:32.072977'),(11,'auth','0006_require_contenttypes_0002','2024-03-21 18:49:32.074269'),(12,'auth','0007_alter_validators_add_error_messages','2024-03-21 18:49:32.081926'),(13,'auth','0008_alter_user_username_max_length','2024-03-21 18:49:32.116426'),(14,'auth','0009_alter_user_last_name_max_length','2024-03-21 18:49:32.150031'),(15,'auth','0010_alter_group_name_max_length','2024-03-21 18:49:32.168670'),(16,'auth','0011_update_proxy_permissions','2024-03-21 18:49:32.176362'),(17,'auth','0012_alter_user_first_name_max_length','2024-03-21 18:49:32.216591'),(18,'sessions','0001_initial','2024-03-21 18:49:32.237030'),(19,'webapp','0001_initial','2024-03-21 18:49:32.245916'),(20,'webapp','0002_rename_published_date_book_publication_date_and_more','2024-03-21 18:49:32.305015'),(21,'webapp','0003_alter_book_author_id_alter_book_isbn','2024-03-21 18:49:32.310723'),(22,'webapp','0004_alter_book_publisher_id','2024-03-21 18:49:32.313887'),(23,'webapp','0005_author_remove_book_author_id_book_author','2024-03-21 18:49:32.362840'),(24,'webapp','0006_author_authored_books_author_created_at_and_more','2024-03-21 20:41:07.251147'),(25,'webapp','0007_alter_book_author','2024-03-21 21:04:18.920778'),(26,'webapp','0008_genre','2024-03-21 23:27:58.513809'),(27,'webapp','0009_book_genres','2024-03-21 23:29:44.677172'),(28,'webapp','0010_member','2024-03-21 23:45:52.439275'),(29,'webapp','0011_borrowing','2024-03-22 17:44:45.913114'),(30,'webapp','0012_review','2024-03-22 18:50:55.875336'),(31,'webapp','0013_publisher','2024-03-22 19:00:52.911049'),(32,'webapp','0014_combinedbookdetails','2024-03-22 19:20:29.568449'),(33,'webapp','0015_bookborrowingreview','2024-03-23 15:07:28.497820'),(34,'webapp','0016_alter_bookborrowingreview_table','2024-03-23 15:19:59.888566'),(35,'webapp','0017_borrowingarchive','2024-04-01 18:07:15.992745'),(36,'webapp','0018_status','2024-04-11 17:55:39.399993');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('12cmd8lfgtpxzum49cj5jrx2dtmhmgmc','.eJxVjDsOwjAQRO_iGln-BduU9JzB8q53cQA5UpxUiLuTSCmgmGbem3mLlNelprXTnMYiLkKL028HGZ_UdlAeud0niVNb5hHkrsiDdnmbCr2uh_t3UHOv2zqAGUix4YiIVkeOFF1hmx2THRBKUB7QWBUBtlhUZ22C9xZJGXZFfL4Bcjhg:1rqwmp:o7Z4q8N7AquUXPYx_qXNn2LKHNR2FMiC29SYyjLjKkY','2024-04-14 15:07:55.392466');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recentborrowings`
--

DROP TABLE IF EXISTS `recentborrowings`;
/*!50001 DROP VIEW IF EXISTS `recentborrowings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recentborrowings` AS SELECT 
 1 AS `book_id`,
 1 AS `book_title`,
 1 AS `recent_borrowers`,
 1 AS `borrow_date`,
 1 AS `return_date`,
 1 AS `review`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `recentrorrowings`
--

DROP TABLE IF EXISTS `recentrorrowings`;
/*!50001 DROP VIEW IF EXISTS `recentrorrowings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recentrorrowings` AS SELECT 
 1 AS `book_id`,
 1 AS `book_title`,
 1 AS `recent_borrowers`,
 1 AS `borrow_date`,
 1 AS `return_date`,
 1 AS `review`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` enum('available','unavailable') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_author`
--

DROP TABLE IF EXISTS `webapp_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `authored_books` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `short_bio` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_author`
--

LOCK TABLES `webapp_author` WRITE;
/*!40000 ALTER TABLE `webapp_author` DISABLE KEYS */;
INSERT INTO `webapp_author` VALUES (1,'Charles Dickens','','2024-03-21 00:00:00.000000','Updated at 1:58 04/09/2024\r\nTest','2024-04-09 20:58:06.249628'),(2,'Marry Shelley','','2024-03-21 00:00:00.000000','','2024-03-21 20:41:07.234061'),(3,'J.R.R Tolkien','','2024-03-21 21:08:35.340840','English writer and scholar who achieved fame with his children\'s book The Hobbit (1937) and his richly inventive epic fantasy The Lord of the Rings','2024-03-21 21:08:35.340893'),(4,'Geoffrey Chaucer','Canterbury Tales','2024-03-21 21:35:13.155186','English poet before Shakespeare. Known as the first English author.','2024-03-21 21:35:13.155231'),(6,'Eoin Colfer','Artemis Fowl','2024-04-11 14:56:54.964182','Cool writer!','2024-04-11 14:56:54.964820');
/*!40000 ALTER TABLE `webapp_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_book`
--

DROP TABLE IF EXISTS `webapp_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `publication_date` date NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `publisher_id` int NOT NULL,
  `author_id` bigint NOT NULL,
  `status` varchar(255) DEFAULT 'Available',
  PRIMARY KEY (`id`),
  KEY `webapp_book_author_id_448f05e5_fk_webapp_author_id` (`author_id`),
  CONSTRAINT `webapp_book_author_id_448f05e5_fk_webapp_author_id` FOREIGN KEY (`author_id`) REFERENCES `webapp_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_book`
--

LOCK TABLES `webapp_book` WRITE;
/*!40000 ALTER TABLE `webapp_book` DISABLE KEYS */;
INSERT INTO `webapp_book` VALUES (1,'A Tale of Two Cities','1859-11-26','35687',0,1,'Available'),(4,'Frankenstein','1818-01-01','1234456789',1,2,'Available'),(5,'The Hobbit: There and Back Again','1937-03-13','354',2,3,'Available'),(6,'The Fellowship of the Ring','1954-07-21','8765',2,3,'Available'),(7,'The Two Towers','1966-09-17','09887',2,3,'Available'),(8,'Canterbury Tales','1392-05-19','7654345',3,4,'Available'),(9,'Artemis Fowl','2001-04-26','0987',45676,6,'Available');
/*!40000 ALTER TABLE `webapp_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_book_genres`
--

DROP TABLE IF EXISTS `webapp_book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_book_genres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webapp_book_genres_book_id_genre_id_f21b670c_uniq` (`book_id`,`genre_id`),
  KEY `webapp_book_genres_genre_id_647fc61b_fk_webapp_genre_id` (`genre_id`),
  CONSTRAINT `webapp_book_genres_book_id_e789b79d_fk_webapp_book_id` FOREIGN KEY (`book_id`) REFERENCES `webapp_book` (`id`),
  CONSTRAINT `webapp_book_genres_genre_id_647fc61b_fk_webapp_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `webapp_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_book_genres`
--

LOCK TABLES `webapp_book_genres` WRITE;
/*!40000 ALTER TABLE `webapp_book_genres` DISABLE KEYS */;
INSERT INTO `webapp_book_genres` VALUES (1,1,5),(2,4,3),(3,5,1),(4,5,2),(5,6,1),(6,6,2),(7,7,1),(8,7,2),(9,8,5),(10,9,1),(11,9,2);
/*!40000 ALTER TABLE `webapp_book_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_borrowing`
--

DROP TABLE IF EXISTS `webapp_borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_borrowing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `book_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webapp_borrowing_book_id_4a3668e4_fk_webapp_book_id` (`book_id`),
  KEY `webapp_borrowing_member_id_44fea045_fk_webapp_member_id` (`member_id`),
  CONSTRAINT `webapp_borrowing_book_id_4a3668e4_fk_webapp_book_id` FOREIGN KEY (`book_id`) REFERENCES `webapp_book` (`id`),
  CONSTRAINT `webapp_borrowing_member_id_44fea045_fk_webapp_member_id` FOREIGN KEY (`member_id`) REFERENCES `webapp_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_borrowing`
--

LOCK TABLES `webapp_borrowing` WRITE;
/*!40000 ALTER TABLE `webapp_borrowing` DISABLE KEYS */;
INSERT INTO `webapp_borrowing` VALUES (2,'2024-03-19','2023-03-21',5,1),(3,'2024-03-19','2024-03-22',7,4),(4,'2024-02-21','2024-04-03',8,2),(5,'2024-01-10','2024-02-13',6,5),(6,'2024-01-01','2024-04-12',1,5),(7,'2024-02-22','2024-03-23',1,2),(8,'2024-02-24','2024-03-23',6,2),(9,'2024-03-23','2024-04-12',1,2),(10,'2024-03-23','2024-04-12',4,2),(11,'2024-04-03','2024-04-03',1,5),(12,'2023-03-03','2024-04-12',8,7),(13,'2022-02-03','2023-04-03',7,3),(17,'2024-04-01','2024-04-12',5,5),(21,'2024-04-08','2024-04-12',9,4),(22,'2024-04-12',NULL,4,6);
/*!40000 ALTER TABLE `webapp_borrowing` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_borrow_limit` BEFORE INSERT ON `webapp_borrowing` FOR EACH ROW BEGIN
    DECLARE borrow_count INT;
    DECLARE member_limit INT DEFAULT 2; -- Set the limit here

    -- Count the number of books the member has borrowed in the last week
    SELECT COUNT(*) INTO borrow_count
    FROM webapp_borrowing
    WHERE member_id = NEW.member_id
      AND borrow_date > DATE_SUB(NOW(), INTERVAL 1 WEEK);

    -- If the count exceeds the limit, signal an error
    IF borrow_count >= member_limit THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Borrowing limit exceeded';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_status_after_borrowing` AFTER INSERT ON `webapp_borrowing` FOR EACH ROW BEGIN
    UPDATE webapp_status
    SET status = 'unavailable'
    WHERE title_id = NEW.book_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_status_after_return` AFTER UPDATE ON `webapp_borrowing` FOR EACH ROW BEGIN
    IF NEW.return_date IS NOT NULL THEN
        UPDATE webapp_status
        SET status = 'available'
        WHERE title_id = NEW.book_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `webapp_borrowing_archive`
--

DROP TABLE IF EXISTS `webapp_borrowing_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_borrowing_archive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `borrow_date` date NOT NULL,
  `return_date` date NOT NULL,
  `book_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webapp_borrowing_archive_book_id_cd1a534f_fk_webapp_book_id` (`book_id`),
  KEY `webapp_borrowing_archive_member_id_43a773d4_fk_webapp_member_id` (`member_id`),
  CONSTRAINT `webapp_borrowing_archive_book_id_cd1a534f_fk_webapp_book_id` FOREIGN KEY (`book_id`) REFERENCES `webapp_book` (`id`),
  CONSTRAINT `webapp_borrowing_archive_member_id_43a773d4_fk_webapp_member_id` FOREIGN KEY (`member_id`) REFERENCES `webapp_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_borrowing_archive`
--

LOCK TABLES `webapp_borrowing_archive` WRITE;
/*!40000 ALTER TABLE `webapp_borrowing_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `webapp_borrowing_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_genre`
--

DROP TABLE IF EXISTS `webapp_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_genre`
--

LOCK TABLES `webapp_genre` WRITE;
/*!40000 ALTER TABLE `webapp_genre` DISABLE KEYS */;
INSERT INTO `webapp_genre` VALUES (1,'Fantasy',''),(2,'Adventure',''),(3,'Horror',''),(4,'Science Fiction',''),(5,'Historical Fiction','');
/*!40000 ALTER TABLE `webapp_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_member`
--

DROP TABLE IF EXISTS `webapp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `library_card_number` varchar(50) NOT NULL,
  `join_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `library_card_number` (`library_card_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_member`
--

LOCK TABLES `webapp_member` WRITE;
/*!40000 ALTER TABLE `webapp_member` DISABLE KEYS */;
INSERT INTO `webapp_member` VALUES (1,'John Doe','jd3239@nyu.edu','12345','2024-03-21'),(2,'Jane Doe','jdoe@gmail.com','23456','2024-03-23'),(3,'Rick Sanchez','rsanchez@c130.universe','34567','2024-03-23'),(4,'Morty Smith','msmith@yahoo.com','45678','2024-03-23'),(5,'Alan Turing','aturing@crypto.graphy','09876','2024-03-23'),(6,'Adam Day','aday@proton.com','45679','2024-03-24'),(7,'Bethany Greene','bgreene@gmail.com','45680','2024-03-24');
/*!40000 ALTER TABLE `webapp_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_publisher`
--

DROP TABLE IF EXISTS `webapp_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_publisher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `website` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_publisher`
--

LOCK TABLES `webapp_publisher` WRITE;
/*!40000 ALTER TABLE `webapp_publisher` DISABLE KEYS */;
INSERT INTO `webapp_publisher` VALUES (1,'Penguin Random House','1745 Broadway New York, NY 10019','https://www.penguinrandomhouse.com/'),(2,'No Starch Press','245 8th Street San Francisco, CA 94103 USA','https://nostarch.com/'),(3,'Harper Collins','195 Broadway, New York, NY 10007','https://www.harpercollins.com/');
/*!40000 ALTER TABLE `webapp_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_review`
--

DROP TABLE IF EXISTS `webapp_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `book_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webapp_review_book_id_3bf6d367_fk_webapp_book_id` (`book_id`),
  KEY `webapp_review_member_id_eeb0ca9b_fk_webapp_member_id` (`member_id`),
  CONSTRAINT `webapp_review_book_id_3bf6d367_fk_webapp_book_id` FOREIGN KEY (`book_id`) REFERENCES `webapp_book` (`id`),
  CONSTRAINT `webapp_review_member_id_eeb0ca9b_fk_webapp_member_id` FOREIGN KEY (`member_id`) REFERENCES `webapp_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_review`
--

LOCK TABLES `webapp_review` WRITE;
/*!40000 ALTER TABLE `webapp_review` DISABLE KEYS */;
INSERT INTO `webapp_review` VALUES (1,4,'So spooky.','2024-03-22 18:55:39.694693',4,1),(2,3,'My precious!','2024-03-22 23:02:06.641318',5,1),(3,5,'Omg I love it!','2024-03-23 16:14:57.797945',8,2),(4,4,'So cool but has a lot of big words that are too complicated for me.','2024-03-23 16:15:31.167074',7,4),(5,1,'Morty this book is so contrived.','2024-03-23 16:16:01.417188',7,3),(6,2,'Would have liked it more if I wasn\'t being forced to read it for AP Literature class.','2024-03-23 16:17:12.350310',8,1),(7,4,'Wonderfully delightful','2024-03-23 16:18:57.328695',6,5),(8,4,'Crazy people.','2024-03-23 16:22:18.101866',1,5),(10,5,'Loved it. Can\'t wait to read the next one.','2024-04-11 15:00:11.645255',9,4);
/*!40000 ALTER TABLE `webapp_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_status`
--

DROP TABLE IF EXISTS `webapp_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(11) NOT NULL,
  `title_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webapp_status_title_id_47cfe802_fk_webapp_book_id` (`title_id`),
  CONSTRAINT `webapp_status_title_id_47cfe802_fk_webapp_book_id` FOREIGN KEY (`title_id`) REFERENCES `webapp_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_status`
--

LOCK TABLES `webapp_status` WRITE;
/*!40000 ALTER TABLE `webapp_status` DISABLE KEYS */;
INSERT INTO `webapp_status` VALUES (1,'available',1),(2,'unavailable',4),(3,'available',5),(4,'available',6),(5,'available',7),(6,'available',8),(7,'available',9);
/*!40000 ALTER TABLE `webapp_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `OnlineLibraryDB`
--

USE `OnlineLibraryDB`;

--
-- Final view structure for view `combinedbookdetails`
--

/*!50001 DROP VIEW IF EXISTS `combinedbookdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `combinedbookdetails` AS select `b`.`id` AS `book_id`,`b`.`title` AS `book_title`,`a`.`name` AS `author_name`,`p`.`name` AS `publisher_name`,avg(`r`.`rating`) AS `average_rating` from (((`webapp_book` `b` join `webapp_author` `a` on((`b`.`author_id` = `a`.`id`))) join `webapp_publisher` `p` on((`b`.`publisher_id` = `p`.`id`))) left join `webapp_review` `r` on((`b`.`id` = `r`.`book_id`))) group by `b`.`id`,`b`.`title`,`a`.`name`,`p`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recentborrowings`
--

/*!50001 DROP VIEW IF EXISTS `recentborrowings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recentborrowings` AS select `b`.`id` AS `book_id`,`b`.`title` AS `book_title`,`m`.`name` AS `recent_borrowers`,`br`.`borrow_date` AS `borrow_date`,`br`.`return_date` AS `return_date`,`r`.`text` AS `review`,`r`.`rating` AS `rating` from (((`webapp_book` `b` left join `webapp_borrowing` `br` on((`b`.`id` = `br`.`book_id`))) left join `webapp_member` `m` on((`br`.`member_id` = `m`.`id`))) left join `webapp_review` `r` on(((`b`.`id` = `r`.`book_id`) and (`br`.`member_id` = `r`.`member_id`)))) where ((select count(0) from `webapp_borrowing` `br2` where ((`br2`.`book_id` = `b`.`id`) and (`br2`.`borrow_date` > `br`.`borrow_date`))) < 3) order by `b`.`id`,`br`.`borrow_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recentrorrowings`
--

/*!50001 DROP VIEW IF EXISTS `recentrorrowings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recentrorrowings` AS select `b`.`id` AS `book_id`,`b`.`title` AS `book_title`,`m`.`name` AS `recent_borrowers`,`br`.`borrow_date` AS `borrow_date`,`br`.`return_date` AS `return_date`,`r`.`text` AS `review`,`r`.`rating` AS `rating` from (((`webapp_book` `b` left join `webapp_borrowing` `br` on((`b`.`id` = `br`.`book_id`))) left join `webapp_member` `m` on((`br`.`member_id` = `m`.`id`))) left join `webapp_review` `r` on(((`b`.`id` = `r`.`book_id`) and (`br`.`member_id` = `r`.`member_id`)))) where ((select count(0) from `webapp_borrowing` `br2` where ((`br2`.`book_id` = `b`.`id`) and (`br2`.`borrow_date` > `br`.`borrow_date`))) < 3) order by `b`.`id`,`br`.`borrow_date` desc */;
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

-- Dump completed on 2024-04-12  9:36:06
