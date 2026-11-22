/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: old_school
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2026_11_21_000001_create_students_table',1),
(5,'2026_11_21_000002_create_student_details_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `guardian_name` varchar(255) NOT NULL,
  `guardian_phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_details_student_id_foreign` (`student_id`),
  CONSTRAINT `student_details_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` VALUES
(101,101,'2008-04-16','Male','House No. 102, Tilak Nagar, Gurgaon','Gurgaon','Haryana','122001','Mukesh Singh','9810368171','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(102,102,'2008-01-01','Male','House No. 3, MG Road, Delhi','Delhi','Delhi','110001','Rajesh Sharma','9800000000','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(103,103,'2009-02-02','Female','House No. 4, Nehru Nagar, Mumbai','Mumbai','Maharashtra','400001','Ramesh Verma','9800104729','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(104,104,'2010-03-03','Male','House No. 5, Gandhi Nagar, Jaipur','Jaipur','Rajasthan','302001','Suresh Yadav','9800209458','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(105,105,'2011-04-04','Female','House No. 6, Patel Nagar, Indore','Indore','Madhya Pradesh','452001','Mukesh Singh','9800314187','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(106,106,'2012-05-05','Male','House No. 7, Shanti Nagar, Lucknow','Lucknow','Uttar Pradesh','226001','Dinesh Patel','9800418916','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(107,107,'2013-06-06','Female','House No. 8, Rajaji Salai, Patna','Patna','Bihar','800001','Mahesh Khan','9800523645','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(108,108,'2014-07-07','Male','House No. 9, Station Road, Bhopal','Bhopal','Madhya Pradesh','462001','Anil Kumar','9800628374','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(109,109,'2015-08-08','Male','House No. 10, Civil Lines, Kanpur','Kanpur','Uttar Pradesh','208001','Sunil Gupta','9800733103','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(110,110,'2016-09-09','Female','House No. 11, Shastri Nagar, Nagpur','Nagpur','Maharashtra','440001','Vijay Mehta','9800837832','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(111,111,'2008-10-10','Male','House No. 12, Tilak Nagar, Kota','Kota','Rajasthan','324001','Ajay Malviya','9800942561','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(112,112,'2009-11-11','Male','House No. 13, MG Road, Udaipur','Udaipur','Rajasthan','313001','Sanjay Tiwari','9801047290','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(113,113,'2010-12-12','Female','House No. 14, Nehru Nagar, Varanasi','Varanasi','Uttar Pradesh','221001','Prakash Joshi','9801152019','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(114,114,'2011-01-13','Male','House No. 15, Gandhi Nagar, Agra','Agra','Uttar Pradesh','282001','Ashok Mishra','9801256748','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(115,115,'2012-02-14','Female','House No. 16, Patel Nagar, Jodhpur','Jodhpur','Rajasthan','342001','Vinod Nair','9801361477','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(116,116,'2013-03-15','Female','House No. 17, Shanti Nagar, Gwalior','Gwalior','Madhya Pradesh','474001','Harish Agarwal','9801466206','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(117,117,'2014-04-16','Male','House No. 18, Rajaji Salai, Pune','Pune','Maharashtra','411001','Kishore Reddy','9801570935','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(118,118,'2015-05-17','Male','House No. 19, Station Road, Surat','Surat','Gujarat','395001','Rajesh Desai','9801675664','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(119,119,'2016-06-18','Male','House No. 20, Civil Lines, Ahmedabad','Ahmedabad','Gujarat','380001','Ramesh Choudhary','9801780393','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(120,120,'2008-07-19','Female','House No. 21, Shastri Nagar, Noida','Noida','Uttar Pradesh','201301','Suresh Rani','9801885122','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(121,121,'2009-08-20','Male','House No. 22, Tilak Nagar, Gurgaon','Gurgaon','Haryana','122001','Mukesh Srivastava','9801989851','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(122,122,'2010-09-21','Female','House No. 23, MG Road, Delhi','Delhi','Delhi','110001','Dinesh Kapoor','9802094580','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(123,123,'2011-10-22','Male','House No. 24, Nehru Nagar, Mumbai','Mumbai','Maharashtra','400001','Mahesh Bhatt','9802199309','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(124,124,'2012-11-23','Male','House No. 25, Gandhi Nagar, Jaipur','Jaipur','Rajasthan','302001','Anil Chauhan','9802304038','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(125,125,'2013-12-24','Male','House No. 26, Patel Nagar, Indore','Indore','Madhya Pradesh','452001','Sunil Patel','9802408767','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(126,126,'2014-01-25','Female','House No. 27, Shanti Nagar, Lucknow','Lucknow','Uttar Pradesh','226001','Vijay Iyer','9802513496','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(127,127,'2015-02-26','Male','House No. 28, Rajaji Salai, Patna','Patna','Bihar','800001','Ajay Ali','9802618225','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(128,128,'2016-03-27','Female','House No. 29, Station Road, Bhopal','Bhopal','Madhya Pradesh','462001','Sanjay Menon','9802722954','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(129,129,'2008-04-28','Male','House No. 30, Civil Lines, Kanpur','Kanpur','Uttar Pradesh','208001','Prakash Chandra','9802827683','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(130,130,'2009-05-01','Female','House No. 31, Shastri Nagar, Nagpur','Nagpur','Maharashtra','440001','Ashok Bansal','9802932412','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(131,131,'2010-06-02','Male','House No. 32, Tilak Nagar, Kota','Kota','Rajasthan','324001','Vinod Saxena','9803037141','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(132,132,'2011-07-03','Male','House No. 33, MG Road, Udaipur','Udaipur','Rajasthan','313001','Harish Singh','9803141870','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(133,133,'2012-08-04','Female','House No. 34, Nehru Nagar, Varanasi','Varanasi','Uttar Pradesh','221001','Kishore Nair','9803246599','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(134,134,'2013-09-05','Female','House No. 35, Gandhi Nagar, Agra','Agra','Uttar Pradesh','282001','Rajesh Jain','9803351328','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(135,135,'2014-10-06','Female','House No. 36, Patel Nagar, Jodhpur','Jodhpur','Rajasthan','342001','Ramesh Rao','9803456057','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(136,136,'2015-11-07','Male','House No. 37, Shanti Nagar, Gwalior','Gwalior','Madhya Pradesh','474001','Suresh Yadav','9803560786','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(137,137,'2016-12-08','Female','House No. 38, Rajaji Salai, Pune','Pune','Maharashtra','411001','Mukesh Sharma','9803665515','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(138,138,'2008-01-09','Male','House No. 39, Station Road, Surat','Surat','Gujarat','395001','Dinesh Mehra','9803770244','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(139,139,'2009-02-10','Male','House No. 40, Civil Lines, Ahmedabad','Ahmedabad','Gujarat','380001','Mahesh Verma','9803874973','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(140,140,'2010-03-11','Female','House No. 41, Shastri Nagar, Noida','Noida','Uttar Pradesh','201301','Anil Pillai','9803979702','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(141,141,'2011-04-12','Male','House No. 42, Tilak Nagar, Gurgaon','Gurgaon','Haryana','122001','Sunil Agarwal','9804084431','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(142,142,'2012-05-13','Male','House No. 43, MG Road, Delhi','Delhi','Delhi','110001','Vijay Kumar','9804189160','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(143,143,'2013-06-14','Male','House No. 44, Nehru Nagar, Mumbai','Mumbai','Maharashtra','400001','Ajay Pandey','9804293889','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(144,144,'2014-07-15','Female','House No. 45, Gandhi Nagar, Jaipur','Jaipur','Rajasthan','302001','Sanjay Gupta','9804398618','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(145,145,'2015-08-16','Female','House No. 46, Patel Nagar, Indore','Indore','Madhya Pradesh','452001','Prakash Joshi','9804503347','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(146,146,'2016-09-17','Male','House No. 47, Shanti Nagar, Lucknow','Lucknow','Uttar Pradesh','226001','Ashok Rajput','9804608076','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(147,147,'2008-10-18','Female','House No. 48, Rajaji Salai, Patna','Patna','Bihar','800001','Vinod Sheikh','9804712805','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(148,148,'2009-11-19','Female','House No. 49, Station Road, Bhopal','Bhopal','Madhya Pradesh','462001','Harish Kapoor','9804817534','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(149,149,'2010-12-20','Male','House No. 50, Civil Lines, Kanpur','Kanpur','Uttar Pradesh','208001','Kishore Sharma','9804922263','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(150,150,'2011-01-21','Female','House No. 51, Shastri Nagar, Nagpur','Nagpur','Maharashtra','440001','Rajesh Reddy','9805026992','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(151,151,'2012-02-22','Female','House No. 52, Tilak Nagar, Kota','Kota','Rajasthan','324001','Ramesh Agarwal','9805131721','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(152,152,'2013-03-23','Male','House No. 53, MG Road, Udaipur','Udaipur','Rajasthan','313001','Suresh Jain','9805236450','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(153,153,'2014-04-24','Female','House No. 54, Nehru Nagar, Varanasi','Varanasi','Uttar Pradesh','221001','Mukesh Gupta','9805341179','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(154,154,'2015-05-25','Male','House No. 55, Gandhi Nagar, Agra','Agra','Uttar Pradesh','282001','Dinesh Verma','9805445908','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(155,155,'2016-06-26','Female','House No. 56, Patel Nagar, Jodhpur','Jodhpur','Rajasthan','342001','Mahesh Singh','9805550637','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(156,156,'2008-07-27','Male','House No. 57, Shanti Nagar, Gwalior','Gwalior','Madhya Pradesh','474001','Anil Shah','9805655366','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(157,157,'2009-08-28','Female','House No. 58, Rajaji Salai, Pune','Pune','Maharashtra','411001','Sunil Sharma','9805760095','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(158,158,'2010-09-01','Male','House No. 59, Station Road, Surat','Surat','Gujarat','395001','Vijay Kumar','9805864824','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(159,159,'2011-10-02','Male','House No. 60, Civil Lines, Ahmedabad','Ahmedabad','Gujarat','380001','Ajay Jha','9805969553','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(160,160,'2012-11-03','Male','House No. 61, Shastri Nagar, Noida','Noida','Uttar Pradesh','201301','Sanjay Kulkarni','9806074282','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(161,161,'2013-12-04','Female','House No. 62, Tilak Nagar, Gurgaon','Gurgaon','Haryana','122001','Prakash Nair','9806179011','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(162,162,'2014-01-05','Male','House No. 63, MG Road, Delhi','Delhi','Delhi','110001','Ashok Sharma','9806283740','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(163,163,'2015-02-06','Male','House No. 64, Nehru Nagar, Mumbai','Mumbai','Maharashtra','400001','Vinod Kumar','9806388469','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(164,164,'2016-03-07','Male','House No. 65, Gandhi Nagar, Jaipur','Jaipur','Rajasthan','302001','Harish Yadav','9806493198','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(165,165,'2008-04-08','Male','House No. 66, Patel Nagar, Indore','Indore','Madhya Pradesh','452001','Kishore Gupta','9806597927','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(166,166,'2009-05-09','Female','House No. 67, Shanti Nagar, Lucknow','Lucknow','Uttar Pradesh','226001','Rajesh Devi','9806702656','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(167,167,'2010-06-10','Female','House No. 68, Rajaji Salai, Patna','Patna','Bihar','800001','Ramesh Singh','9806807385','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(168,168,'2011-07-11','Female','House No. 69, Station Road, Bhopal','Bhopal','Madhya Pradesh','462001','Suresh Kapoor','9806912114','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(169,169,'2012-08-12','Male','House No. 70, Civil Lines, Kanpur','Kanpur','Uttar Pradesh','208001','Mukesh Mehta','9807016843','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(170,170,'2013-09-13','Male','House No. 71, Shastri Nagar, Nagpur','Nagpur','Maharashtra','440001','Dinesh Singh','9807121572','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(171,171,'2014-10-14','Female','House No. 72, Tilak Nagar, Kota','Kota','Rajasthan','324001','Mahesh Agarwal','9807226301','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(172,172,'2015-11-15','Male','House No. 73, MG Road, Udaipur','Udaipur','Rajasthan','313001','Anil Patel','9807331030','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(173,173,'2016-12-16','Female','House No. 74, Nehru Nagar, Varanasi','Varanasi','Uttar Pradesh','221001','Sunil Verma','9807435759','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(174,174,'2008-01-17','Male','House No. 75, Gandhi Nagar, Agra','Agra','Uttar Pradesh','282001','Vijay Khan','9807540488','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(175,175,'2009-02-18','Male','House No. 76, Patel Nagar, Jodhpur','Jodhpur','Rajasthan','342001','Ajay Gupta','9807645217','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(176,176,'2010-03-19','Female','House No. 77, Shanti Nagar, Gwalior','Gwalior','Madhya Pradesh','474001','Sanjay Khan','9807749946','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(177,177,'2011-04-20','Male','House No. 78, Rajaji Salai, Pune','Pune','Maharashtra','411001','Prakash Mishra','9807854675','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(178,178,'2012-05-21','Male','House No. 79, Station Road, Surat','Surat','Gujarat','395001','Ashok Singh','9807959404','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(179,179,'2013-06-22','Female','House No. 80, Civil Lines, Ahmedabad','Ahmedabad','Gujarat','380001','Vinod Sharma','9808064133','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(180,180,'2014-07-23','Male','House No. 81, Shastri Nagar, Noida','Noida','Uttar Pradesh','201301','Harish Tiwari','9808168862','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(181,181,'2015-08-24','Female','House No. 82, Tilak Nagar, Gurgaon','Gurgaon','Haryana','122001','Kishore Kaur','9808273591','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(182,182,'2016-09-25','Female','House No. 83, MG Road, Delhi','Delhi','Delhi','110001','Rajesh Kulkarni','9808378320','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(183,183,'2008-10-26','Male','House No. 84, Nehru Nagar, Mumbai','Mumbai','Maharashtra','400001','Ramesh Deshmukh','9808483049','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(184,184,'2009-11-27','Female','House No. 85, Gandhi Nagar, Jaipur','Jaipur','Rajasthan','302001','Suresh Verma','9808587778','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(185,185,'2010-12-28','Male','House No. 86, Patel Nagar, Indore','Indore','Madhya Pradesh','452001','Mukesh Das','9808692507','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(186,186,'2011-01-01','Female','House No. 87, Shanti Nagar, Lucknow','Lucknow','Uttar Pradesh','226001','Dinesh Devi','9808797236','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(187,187,'2012-02-02','Female','House No. 88, Rajaji Salai, Patna','Patna','Bihar','800001','Mahesh Sharma','9808901965','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(188,188,'2013-03-03','Male','House No. 89, Station Road, Bhopal','Bhopal','Madhya Pradesh','462001','Anil Kumar','9809006694','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(189,189,'2014-04-04','Female','House No. 90, Civil Lines, Kanpur','Kanpur','Uttar Pradesh','208001','Sunil Patel','9809111423','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(190,190,'2015-05-05','Male','House No. 91, Shastri Nagar, Nagpur','Nagpur','Maharashtra','440001','Vijay Arora','9809216152','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(191,191,'2016-06-06','Male','House No. 92, Tilak Nagar, Kota','Kota','Rajasthan','324001','Ajay Chandra','9809320881','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(192,192,'2008-07-07','Male','House No. 93, MG Road, Udaipur','Udaipur','Rajasthan','313001','Sanjay Khanna','9809425610','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(193,193,'2009-08-08','Male','House No. 94, Nehru Nagar, Varanasi','Varanasi','Uttar Pradesh','221001','Prakash Malhotra','9809530339','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(194,194,'2010-09-09','Male','House No. 95, Gandhi Nagar, Agra','Agra','Uttar Pradesh','282001','Ashok Singh','9809635068','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(195,195,'2011-10-10','Male','House No. 96, Patel Nagar, Jodhpur','Jodhpur','Rajasthan','342001','Vinod Kumar','9809739797','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(196,196,'2012-11-11','Male','House No. 97, Shanti Nagar, Gwalior','Gwalior','Madhya Pradesh','474001','Harish Gupta','9809844526','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(197,197,'2013-12-12','Male','House No. 98, Rajaji Salai, Pune','Pune','Maharashtra','411001','Kishore Sharma','9809949255','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(198,198,'2014-01-13','Male','House No. 99, Station Road, Surat','Surat','Gujarat','395001','Rajesh Thakur','9810053984','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(199,199,'2015-02-14','Female','House No. 100, Civil Lines, Ahmedabad','Ahmedabad','Gujarat','380001','Ramesh Sheikh','9810158713','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(200,200,'2016-03-15','Female','House No. 101, Shastri Nagar, Noida','Noida','Uttar Pradesh','201301','Suresh Khan','9810263442','2026-11-22 15:47:34','2026-11-22 15:47:34');
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `admission_no` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`),
  UNIQUE KEY `students_admission_no_unique` (`admission_no`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES
(101,'Aakash Singh','aakash.singh@gmail.com','9000783981','10th','OLD-2026-100','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(102,'Aarav Sharma','aarav.sharma@gmail.com','9000000000','1th','OLD-2026-001','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(103,'Aarushi Verma','aarushi.verma@gmail.com','9000007919','2th','OLD-2026-002','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(104,'Abhishek Yadav','abhishek.yadav@gmail.com','9000015838','3th','OLD-2026-003','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(105,'Aditi Singh','aditi.singh@gmail.com','9000023757','4th','OLD-2026-004','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(106,'Advik Patel','advik.patel@gmail.com','9000031676','5th','OLD-2026-005','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(107,'Aisha Khan','aisha.khan@gmail.com','9000039595','6th','OLD-2026-006','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(108,'Ajay Kumar','ajay.kumar@gmail.com','9000047514','7th','OLD-2026-007','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(109,'Akash Gupta','akash.gupta@gmail.com','9000055433','8th','OLD-2026-008','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(110,'Alisha Mehta','alisha.mehta@gmail.com','9000063352','9th','OLD-2026-009','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(111,'Aman Malviya','aman.malviya@gmail.com','9000071271','10th','OLD-2026-010','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(112,'Amit Tiwari','amit.tiwari@gmail.com','9000079190','1th','OLD-2026-011','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(113,'Ananya Joshi','ananya.joshi@gmail.com','9000087109','2th','OLD-2026-012','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(114,'Aniket Mishra','aniket.mishra@gmail.com','9000095028','3th','OLD-2026-013','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(115,'Anjali Nair','anjali.nair@gmail.com','9000102947','4th','OLD-2026-014','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(116,'Ankita Agarwal','ankita.agarwal@gmail.com','9000110866','5th','OLD-2026-015','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(117,'Arjun Reddy','arjun.reddy@gmail.com','9000118785','6th','OLD-2026-016','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(118,'Arnav Desai','arnav.desai@gmail.com','9000126704','7th','OLD-2026-017','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(119,'Aryan Choudhary','aryan.choudhary@gmail.com','9000134623','8th','OLD-2026-018','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(120,'Asha Rani','asha.rani@gmail.com','9000142542','9th','OLD-2026-019','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(121,'Ayush Srivastava','ayush.srivastava@gmail.com','9000150461','10th','OLD-2026-020','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(122,'Bhavna Kapoor','bhavna.kapoor@gmail.com','9000158380','1th','OLD-2026-021','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(123,'Chirag Bhatt','chirag.bhatt@gmail.com','9000166299','2th','OLD-2026-022','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(124,'Deepak Chauhan','deepak.chauhan@gmail.com','9000174218','3th','OLD-2026-023','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(125,'Dev Patel','dev.patel@gmail.com','9000182137','4th','OLD-2026-024','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(126,'Divya Iyer','divya.iyer@gmail.com','9000190056','5th','OLD-2026-025','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(127,'Farhan Ali','farhan.ali@gmail.com','9000197975','6th','OLD-2026-026','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(128,'Gauri Menon','gauri.menon@gmail.com','9000205894','7th','OLD-2026-027','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(129,'Harish Chandra','harish.chandra@gmail.com','9000213813','8th','OLD-2026-028','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(130,'Ishita Bansal','ishita.bansal@gmail.com','9000221732','9th','OLD-2026-029','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(131,'Jatin Saxena','jatin.saxena@gmail.com','9000229651','10th','OLD-2026-030','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(132,'Kabir Singh','kabir.singh@gmail.com','9000237570','1th','OLD-2026-031','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(133,'Kavya Nair','kavya.nair@gmail.com','9000245489','2th','OLD-2026-032','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(134,'Khushi Jain','khushi.jain@gmail.com','9000253408','3th','OLD-2026-033','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(135,'Kiran Rao','kiran.rao@gmail.com','9000261327','4th','OLD-2026-034','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(136,'Krishna Yadav','krishna.yadav@gmail.com','9000269246','5th','OLD-2026-035','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(137,'Kriti Sharma','kriti.sharma@gmail.com','9000277165','6th','OLD-2026-036','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(138,'Kunal Mehra','kunal.mehra@gmail.com','9000285084','7th','OLD-2026-037','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(139,'Lakshya Verma','lakshya.verma@gmail.com','9000293003','8th','OLD-2026-038','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(140,'Lavanya Pillai','lavanya.pillai@gmail.com','9000300922','9th','OLD-2026-039','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(141,'Madhav Agarwal','madhav.agarwal@gmail.com','9000308841','10th','OLD-2026-040','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(142,'Mahesh Kumar','mahesh.kumar@gmail.com','9000316760','1th','OLD-2026-041','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(143,'Manish Pandey','manish.pandey@gmail.com','9000324679','2th','OLD-2026-042','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(144,'Manvi Gupta','manvi.gupta@gmail.com','9000332598','3th','OLD-2026-043','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(145,'Meera Joshi','meera.joshi@gmail.com','9000340517','4th','OLD-2026-044','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(146,'Mohit Rajput','mohit.rajput@gmail.com','9000348436','5th','OLD-2026-045','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(147,'Muskan Sheikh','muskan.sheikh@gmail.com','9000356355','6th','OLD-2026-046','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(148,'Naina Kapoor','naina.kapoor@gmail.com','9000364274','7th','OLD-2026-047','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(149,'Nakul Sharma','nakul.sharma@gmail.com','9000372193','8th','OLD-2026-048','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(150,'Navya Reddy','navya.reddy@gmail.com','9000380112','9th','OLD-2026-049','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(151,'Neha Agarwal','neha.agarwal@gmail.com','9000388031','10th','OLD-2026-050','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(152,'Nikhil Jain','nikhil.jain@gmail.com','9000395950','1th','OLD-2026-051','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(153,'Nisha Gupta','nisha.gupta@gmail.com','9000403869','2th','OLD-2026-052','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(154,'Nitin Verma','nitin.verma@gmail.com','9000411788','3th','OLD-2026-053','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(155,'Palak Singh','palak.singh@gmail.com','9000419707','4th','OLD-2026-054','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(156,'Parth Shah','parth.shah@gmail.com','9000427626','5th','OLD-2026-055','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(157,'Pooja Sharma','pooja.sharma@gmail.com','9000435545','6th','OLD-2026-056','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(158,'Pradeep Kumar','pradeep.kumar@gmail.com','9000443464','7th','OLD-2026-057','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(159,'Prakash Jha','prakash.jha@gmail.com','9000451383','8th','OLD-2026-058','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(160,'Pranav Kulkarni','pranav.kulkarni@gmail.com','9000459302','9th','OLD-2026-059','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(161,'Priya Nair','priya.nair@gmail.com','9000467221','10th','OLD-2026-060','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(162,'Rahul Sharma','rahul.sharma@gmail.com','9000475140','1th','OLD-2026-061','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(163,'Rajesh Kumar','rajesh.kumar@gmail.com','9000483059','2th','OLD-2026-062','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(164,'Rakesh Yadav','rakesh.yadav@gmail.com','9000490978','3th','OLD-2026-063','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(165,'Ramesh Gupta','ramesh.gupta@gmail.com','9000498897','4th','OLD-2026-064','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(166,'Rani Devi','rani.devi@gmail.com','9000506816','5th','OLD-2026-065','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(167,'Reema Singh','reema.singh@gmail.com','9000514735','6th','OLD-2026-066','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(168,'Riya Kapoor','riya.kapoor@gmail.com','9000522654','7th','OLD-2026-067','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(169,'Rohan Mehta','rohan.mehta@gmail.com','9000530573','8th','OLD-2026-068','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(170,'Rohit Singh','rohit.singh@gmail.com','9000538492','9th','OLD-2026-069','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(171,'Ruchi Agarwal','ruchi.agarwal@gmail.com','9000546411','10th','OLD-2026-070','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(172,'Sagar Patel','sagar.patel@gmail.com','9000554330','1th','OLD-2026-071','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(173,'Sakshi Verma','sakshi.verma@gmail.com','9000562249','2th','OLD-2026-072','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(174,'Sameer Khan','sameer.khan@gmail.com','9000570168','3th','OLD-2026-073','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(175,'Sanjay Gupta','sanjay.gupta@gmail.com','9000578087','4th','OLD-2026-074','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(176,'Sara Khan','sara.khan@gmail.com','9000586006','5th','OLD-2026-075','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(177,'Saurabh Mishra','saurabh.mishra@gmail.com','9000593925','6th','OLD-2026-076','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(178,'Shaurya Singh','shaurya.singh@gmail.com','9000601844','7th','OLD-2026-077','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(179,'Shreya Sharma','shreya.sharma@gmail.com','9000609763','8th','OLD-2026-078','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(180,'Shubham Tiwari','shubham.tiwari@gmail.com','9000617682','9th','OLD-2026-079','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(181,'Simran Kaur','simran.kaur@gmail.com','9000625601','10th','OLD-2026-080','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(182,'Sneha Kulkarni','sneha.kulkarni@gmail.com','9000633520','1th','OLD-2026-081','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(183,'Soham Deshmukh','soham.deshmukh@gmail.com','9000641439','2th','OLD-2026-082','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(184,'Sonia Verma','sonia.verma@gmail.com','9000649358','3th','OLD-2026-083','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(185,'Sourav Das','sourav.das@gmail.com','9000657277','4th','OLD-2026-084','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(186,'Suman Devi','suman.devi@gmail.com','9000665196','5th','OLD-2026-085','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(187,'Sunita Sharma','sunita.sharma@gmail.com','9000673115','6th','OLD-2026-086','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(188,'Suraj Kumar','suraj.kumar@gmail.com','9000681034','7th','OLD-2026-087','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(189,'Tanvi Patel','tanvi.patel@gmail.com','9000688953','8th','OLD-2026-088','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(190,'Tarun Arora','tarun.arora@gmail.com','9000696872','9th','OLD-2026-089','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(191,'Umesh Chandra','umesh.chandra@gmail.com','9000704791','10th','OLD-2026-090','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(192,'Varun Khanna','varun.khanna@gmail.com','9000712710','1th','OLD-2026-091','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(193,'Vicky Malhotra','vicky.malhotra@gmail.com','9000720629','2th','OLD-2026-092','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(194,'Vikram Singh','vikram.singh@gmail.com','9000728548','3th','OLD-2026-093','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(195,'Vinay Kumar','vinay.kumar@gmail.com','9000736467','4th','OLD-2026-094','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(196,'Vishal Gupta','vishal.gupta@gmail.com','9000744386','5th','OLD-2026-095','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(197,'Vivek Sharma','vivek.sharma@gmail.com','9000752305','6th','OLD-2026-096','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(198,'Yash Thakur','yash.thakur@gmail.com','9000760224','7th','OLD-2026-097','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(199,'Zara Sheikh','zara.sheikh@gmail.com','9000768143','8th','OLD-2026-098','2026-11-22 15:47:34','2026-11-22 15:47:34'),
(200,'Zoya Khan','zoya.khan@gmail.com','9000776062','9th','OLD-2026-099','2026-11-22 15:47:34','2026-11-22 15:47:34');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-22 15:47:34
