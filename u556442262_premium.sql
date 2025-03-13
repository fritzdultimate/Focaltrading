-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: u556442262_premium
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-cll-lve

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
-- Table structure for table `account_funding_requests`
--

DROP TABLE IF EXISTS `account_funding_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_funding_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `receiver_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` enum('deposit_balance','currently_invested','referral_bonus') NOT NULL,
  `action` enum('credit','debit') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_funding_requests_user_id_foreign` (`user_id`),
  KEY `account_funding_requests_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `account_funding_requests_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_funding_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_funding_requests`
--

/*!40000 ALTER TABLE `account_funding_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_funding_requests` ENABLE KEYS */;

--
-- Table structure for table `child_investment_plans`
--

DROP TABLE IF EXISTS `child_investment_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_investment_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_investment_plan_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `minimum_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `maximum_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `interest_rate` decimal(5,2) NOT NULL,
  `referral_bonus` decimal(5,2) NOT NULL DEFAULT 1.00,
  `duration` int(11) NOT NULL DEFAULT 1,
  `total_deposited` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_accepted` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_denied` decimal(20,2) NOT NULL DEFAULT 0.00,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `child_investment_plans_name_unique` (`name`),
  KEY `child_investment_plans_parent_investment_plan_id_foreign` (`parent_investment_plan_id`),
  CONSTRAINT `child_investment_plans_parent_investment_plan_id_foreign` FOREIGN KEY (`parent_investment_plan_id`) REFERENCES `parent_investment_plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_investment_plans`
--

/*!40000 ALTER TABLE `child_investment_plans` DISABLE KEYS */;
INSERT INTO `child_investment_plans` VALUES
(1,1,'short term',100.00,499.00,3.00,5.00,5,1969.00,1300.00,0.00,1,'2021-11-24 02:05:35','2024-02-11 12:33:15',NULL),
(2,1,'long term',500.00,4999.00,5.00,5.00,112,22050.00,22050.00,0.00,1,'2021-11-24 02:06:46','2023-09-21 08:29:06',NULL),
(3,1,'business',5000.00,1000000.00,7.00,5.00,183,1040916.00,1012916.00,0.00,1,'2021-11-24 02:07:50','2024-01-20 13:26:37',NULL);
/*!40000 ALTER TABLE `child_investment_plans` ENABLE KEYS */;

--
-- Table structure for table `cron_jobs`
--

DROP TABLE IF EXISTS `cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_jobs`
--

/*!40000 ALTER TABLE `cron_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_jobs` ENABLE KEYS */;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `child_investment_plan_id` bigint(20) unsigned NOT NULL,
  `user_wallet_id` bigint(20) unsigned NOT NULL,
  `transaction_hash` varchar(255) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `remaining_duration` int(11) NOT NULL,
  `reinvestment` tinyint(1) NOT NULL DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_expired` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','accepted','denied') NOT NULL,
  `running` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `denied_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deposits_transaction_hash_unique` (`transaction_hash`),
  KEY `deposits_user_id_foreign` (`user_id`),
  KEY `deposits_child_investment_plan_id_foreign` (`child_investment_plan_id`),
  KEY `deposits_user_wallet_id_foreign` (`user_wallet_id`),
  CONSTRAINT `deposits_child_investment_plan_id_foreign` FOREIGN KEY (`child_investment_plan_id`) REFERENCES `child_investment_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_user_wallet_id_foreign` FOREIGN KEY (`user_wallet_id`) REFERENCES `user_wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES
(295,262,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',3000.00,0,0,'2022-10-28 10:17:50',0,'accepted',0,'2022-07-08 10:01:27','2022-10-28 15:40:19',NULL,'2022-07-08 10:17:50',NULL),
(296,262,1,152,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',300.00,0,0,'2022-07-18 11:53:45',0,'accepted',0,'2022-07-13 11:50:06','2022-07-18 12:15:15',NULL,'2022-07-13 11:53:45',NULL),
(298,262,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',23000.00,0,0,'2023-01-27 11:28:40',0,'accepted',0,'2022-07-28 10:26:14','2023-03-28 14:55:55',NULL,'2022-07-28 10:28:40',NULL),
(318,262,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',2000.00,0,0,'2023-04-26 16:06:55',0,'accepted',0,'2023-01-04 09:59:25','2023-05-29 18:03:05',NULL,'2023-01-04 17:06:55',NULL),
(319,286,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',3500.00,0,0,'2023-05-01 14:39:08',0,'accepted',0,'2023-01-09 15:37:40','2023-06-03 18:04:03',NULL,'2023-01-09 15:39:08',NULL),
(321,286,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',2850.00,0,0,'2023-06-29 02:18:59',0,'accepted',0,'2023-03-09 03:17:27','2023-07-31 18:31:08',NULL,'2023-03-09 03:18:59',NULL),
(322,262,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',50000.00,0,0,'2023-12-01 19:01:09',0,'accepted',0,'2023-05-12 16:21:55','2023-12-01 19:56:04',NULL,'2023-06-01 19:01:09',NULL),
(326,262,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',4200.00,0,0,'2023-09-26 08:07:34',0,'accepted',0,'2023-06-06 08:01:45','2023-09-26 08:55:04',NULL,'2023-06-06 08:07:34',NULL),
(328,304,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',7500.00,0,0,'2024-03-23 07:21:36',0,'accepted',0,'2023-09-22 07:20:54','2024-03-23 08:07:04',NULL,'2023-09-22 07:21:36',NULL),
(329,286,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',8500.00,0,0,'2024-03-31 09:35:50',0,'accepted',0,'2023-09-30 09:35:11','2024-03-31 10:34:04',NULL,'2023-09-30 09:35:50',NULL),
(330,317,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',41723.00,82,0,'2024-07-21 13:26:37',0,'accepted',1,'2024-01-20 13:25:19','2024-04-30 15:41:03',NULL,'2024-01-20 13:26:37',NULL);
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;

--
-- Table structure for table `email_tokens`
--

DROP TABLE IF EXISTS `email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_tokens`
--

/*!40000 ALTER TABLE `email_tokens` DISABLE KEYS */;
INSERT INTO `email_tokens` VALUES
(260,621874,'sophielavoie258@gmail.com','2022-07-06 18:23:53','2022-07-06 18:23:53',NULL,NULL),
(261,348885,'premiumassetslimited@gmail.com','2022-07-07 01:46:01','2022-07-07 01:46:01',NULL,NULL),
(262,263541,'sophielavoie258@gmail.com','2022-07-07 02:13:08','2022-07-07 02:13:08',NULL,NULL),
(263,128959,'malaniesylvester@gmail.com','2022-07-13 11:25:46','2022-07-13 11:25:46',NULL,NULL),
(264,347621,'johnsoncosta.214@gmail.com','2022-07-13 11:49:20','2022-07-13 11:49:20',NULL,NULL),
(265,169499,'lucyanderson.2528@gmail.com','2022-07-13 12:01:46','2022-07-13 12:01:46',NULL,NULL),
(266,525709,'mukeshpatel.0788893@gmail.com','2022-07-13 12:10:28','2022-07-13 12:10:28',NULL,NULL),
(267,559732,'catrinafiaola1010@gmail.com','2022-07-15 01:41:36','2022-07-15 01:41:36',NULL,NULL),
(268,931276,'campbellellie765@gmail.com','2022-07-15 23:42:15','2022-07-15 23:42:15',NULL,NULL),
(269,331827,'liliancooper30@gmail.com','2022-07-16 00:10:34','2022-07-16 00:10:34',NULL,NULL),
(270,724078,'luciagreso@gmail.com','2022-07-16 00:22:58','2022-07-16 00:22:58',NULL,NULL),
(271,998515,'ameliagagne60@gmail.com','2022-07-16 00:38:42','2022-07-16 00:38:42',NULL,NULL),
(272,757259,'cs9563316@gmail.com','2022-07-16 00:52:30','2022-07-16 00:52:30',NULL,NULL),
(273,403602,'Neul1065@gmail.com','2022-07-16 01:00:36','2022-07-16 01:00:36',NULL,NULL),
(274,330277,'hunt18013@gmail.com','2022-07-16 01:27:18','2022-07-16 01:27:18',NULL,NULL),
(275,985922,'liamcook943@gmail.com','2022-07-16 01:35:45','2022-07-16 01:35:45',NULL,NULL),
(276,792800,'fischerirma04@gmail.com','2022-07-16 01:47:57','2022-07-16 01:47:57',NULL,NULL),
(277,190802,'mirayozedmir@gmail.com','2022-07-16 01:57:03','2022-07-16 01:57:03',NULL,NULL),
(278,546195,'Jacoblee18357@gmail.com','2022-08-12 16:24:58','2022-08-12 16:24:58',NULL,NULL),
(279,361860,'salmankatada5@gmail.com','2022-08-17 23:21:40','2022-08-17 23:21:40',NULL,NULL),
(280,943562,'lsabelaadams128@gmail.com','2022-09-04 15:49:13','2022-09-04 15:49:13',NULL,NULL),
(281,464031,'lsabelaadams128@gmail.com','2022-09-04 15:57:11','2022-09-04 15:57:11',NULL,NULL),
(282,956805,'nwonue304@gmail.com','2022-09-04 16:02:24','2022-09-04 16:02:24',NULL,NULL),
(283,425291,'isabelladams128@gmail.com','2022-09-04 16:43:27','2022-09-04 16:43:27',NULL,NULL),
(284,244690,'bilalchoudrey2525@gmail.com','2022-09-13 11:09:57','2022-09-13 11:09:57',NULL,NULL),
(285,719344,'sanaullahrahujo1990@gmail.com','2022-10-20 19:14:11','2022-10-20 19:14:11',NULL,NULL),
(286,129812,'lisbetmartinez39@gmail.com','2022-11-03 00:57:25','2022-11-03 00:57:25',NULL,NULL),
(287,281022,'cairajames24@gmail.com','2022-12-02 01:29:06','2022-12-02 01:29:06',NULL,NULL),
(288,656037,'swazzyboo@gmail.com','2023-02-09 15:09:36','2023-02-09 15:09:36',NULL,NULL),
(289,175578,'swazzyboo@gmail.com','2023-02-09 15:25:33','2023-02-09 15:25:33',NULL,NULL),
(290,419458,'swazzyboo@gmail.com','2023-02-09 15:27:33','2023-02-09 15:27:33',NULL,NULL),
(291,833738,'mahaprabhu0118@gmail.com','2023-06-01 18:17:21','2023-06-01 18:17:21',NULL,NULL),
(292,754600,'salecuf@gmail.com','2023-06-01 18:27:22','2023-06-01 18:27:22',NULL,NULL),
(293,875669,'qasimalikhan005@gmail.com','2023-06-09 06:29:10','2023-06-09 06:29:10',NULL,NULL),
(294,955488,'ds9480463@gmail.com','2023-07-01 12:59:26','2023-07-01 12:59:26',NULL,NULL),
(295,645228,'smithbetty09037@gmail.com','2023-07-05 13:23:44','2023-07-05 13:23:44',NULL,NULL),
(296,319827,'zainsyed132@gmail.com','2023-07-07 15:19:28','2023-07-07 15:19:28',NULL,NULL),
(297,681680,'m.rautavirta@hotmail.com','2023-08-05 04:31:52','2023-08-05 04:31:52',NULL,NULL),
(298,755296,'rautavirtam@gmail.com','2023-08-05 07:43:08','2023-08-05 07:43:08',NULL,NULL),
(299,653267,'bonem77764@touchend.com','2023-08-09 12:53:52','2023-08-09 12:53:52',NULL,NULL),
(300,675141,'falconfabulous86@gmail.com','2023-09-08 15:01:23','2023-09-08 15:01:23',NULL,NULL),
(301,321096,'m.rautavirta@hotmail.com','2023-09-13 13:26:41','2023-09-13 13:26:41',NULL,NULL),
(302,490618,'gallardogarciajefferson@hotmail.com','2023-09-19 19:59:28','2023-09-19 19:59:28',NULL,NULL),
(303,799573,'yadhullayadhu.ys@gmail.com','2023-09-21 07:25:21','2023-09-21 07:25:21',NULL,NULL),
(304,773702,'kristeinkoster@gmail.com','2023-09-22 07:17:45','2023-09-22 07:17:45',NULL,NULL),
(305,463484,'cairajames24@gmail.com','2023-10-29 12:11:50','2023-10-29 12:11:50',NULL,NULL),
(306,362100,'kartikgolari5@gmail.com','2023-10-29 12:31:38','2023-10-29 12:31:38',NULL,NULL),
(307,838824,'arvindpensalwar025@gmail.com','2023-11-04 06:52:02','2023-11-04 06:52:02',NULL,NULL),
(308,381300,'maniknand187@gmail.com','2023-11-04 07:03:52','2023-11-04 07:03:52',NULL,NULL),
(309,553602,'jdjdj@gmail.com','2023-11-12 06:30:02','2023-11-12 06:30:02',NULL,NULL),
(310,787843,'arimarett@gmail.com','2023-11-13 13:46:45','2023-11-13 13:46:45',NULL,NULL),
(311,697516,'zatanete1234@gmail.com','2023-11-13 21:23:34','2023-11-13 21:23:34',NULL,NULL),
(312,926309,'kaliev9920@gmail.com','2023-12-14 21:27:35','2023-12-14 21:27:35',NULL,NULL),
(313,812847,'kalenkavel@gmail.com','2023-12-17 10:18:52','2023-12-17 10:18:52',NULL,NULL),
(314,841148,'jarlathgriffin5@gmail.com','2023-12-21 18:38:31','2023-12-21 18:38:31',NULL,NULL),
(315,192568,'lypulu@pelagius.net','2023-12-22 04:31:35','2023-12-22 04:31:35',NULL,NULL),
(316,843568,'vayiga7342@visignal.com','2024-01-05 08:20:11','2024-01-05 08:20:11',NULL,NULL),
(317,897107,'obiajuluobiorah001@gmail.com','2024-01-20 09:42:39','2024-01-20 09:42:39',NULL,NULL),
(318,716438,'mouchi@clowmail.com','2024-02-11 12:12:49','2024-02-11 12:12:49',NULL,NULL),
(319,914336,'posobiep@traslex.com','2024-02-21 18:30:22','2024-02-21 18:30:22',NULL,NULL),
(320,180121,'yadhullayadhu.ys@gmail.com','2024-02-29 15:26:30','2024-02-29 15:26:30',NULL,NULL),
(321,731401,'kg4ntf@gmail.com','2024-04-13 16:56:02','2024-04-13 16:56:02',NULL,NULL),
(322,376338,'2520watcharin@gmail.com','2024-05-01 07:30:44','2024-05-01 07:30:44',NULL,NULL),
(323,458108,'euniwong420@gmail.com','2024-05-01 07:36:36','2024-05-01 07:36:36',NULL,NULL);
/*!40000 ALTER TABLE `email_tokens` ENABLE KEYS */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES
(1,'what is premium assets limited all about?','premium assets limited is all about trading, investment, mining, and securing asset\'s.\r\n\r\n\r\nwe specialize mainly in crypto trading, real estate investments, forex trading and gold mining.\r\n\r\n\r\nwe transform\'s amateur traders to professional trader, to enhance simplicity in the trading sectors.\r\n\r\n\r\nwe also did made provision for expert analyst\'s, which trade\'s with their professional year\'s of trading experience and api\'s in regards to avoiding lost of our investors assets.',1,NULL,'2022-07-07 02:59:41',NULL),
(2,'what market does premium Assets limited trade?','Premium Assets limited company trades mainly in forex and cryptocurrencies.',2,NULL,'2022-07-07 03:00:54',NULL),
(3,'what are the risk on my investment?','There is no risk on your investment, when you invest the company helps you trade and return your daily profits depending on the investment plan you choose to invest with which you can withdraw anytime you want to.',3,NULL,'2022-07-07 03:10:27',NULL),
(4,'how can i access my account?','if you\'re a  registered user of premium Assets limited then you enter your username and password in the sign in page which will take you directly to your account dashboard',4,NULL,'2022-07-07 03:09:44',NULL),
(5,'how secure is my account?','The company takes all the security measures to protect your account and keep it safe from third parties intrusion. our client\'s privacy is our priority.',5,NULL,'2022-07-07 03:08:46',NULL),
(6,'can i create more than one account?','No, you are allowed to create one account, for special situation please contact our live support.',6,NULL,'2022-07-07 03:07:57',NULL),
(7,'what  does  it mean for your account to be on  compounding?','if you are privileged for your account to be enrolled on a compounding that will enable you to earn more of your investment depending on the duration of the compounding, your account will be handled by experts traders that would trade many account in bulk to amass reasonable profits with a little commission because they are involved in swing trades that ensures huge profits that needs good trading equity.',7,NULL,'2022-07-07 14:09:19',NULL),
(8,'will my investment be completed if i have pending deposit?','An investor should be careful while clicking the deposit twice or more than because our system will see it as many times as you clicked so your deposit won\'t be confirmed until you completed all the pending deposit, before the deposit will be confirmed.',8,NULL,'2022-07-07 03:06:26',NULL),
(9,'How fast are my deposits added to my account?','your deposits would be added to your account as soon as it\'s been validated and authenticated by the finance committee, please do contact the company\'s live support if not seen within 10 minutes after deposition.',9,NULL,'2022-07-07 14:09:51',NULL),
(10,'How many times can i reinvest?','you are entitled to reinvest 3 times on your active investment plan as a member of this company, exceeding your entitled reinvestment benefits could lead to penalties for violating the trading and investment protocols.',10,NULL,'2022-07-07 14:10:24',NULL),
(11,'when can i withdraw profits?','you are entitle to withdraw your profits anytime once your current investment plan duration is completed.',11,NULL,'2022-07-07 03:04:32',NULL),
(12,'How long does it take to receive my withdrawal?','your withdrawal is processed and sent immediately after your request, if it takes more than 24 hours please contact the live support.',12,NULL,'2022-07-07 14:10:54',NULL),
(13,'why us......!?','Premium Assets limited company is a registered and certified trading company, backed with ddo\'s and ssl security system to help enhance high security measures against cyber scams.\r\n\r\n\r\nwe\'re in partnership with fra(funds retrieve agency), to ensure maximum financial security in respect to our clients equities entrusted with us and also to avoid every lost possibility.\r\n\r\n\r\nwe made provision of these highly security encryptions, because our clients privacy and assets are of paramount importance to us.\r\n\r\n\r\nwelcome to focaltrading company once more and thanks for choosing us.',13,NULL,'2022-07-07 03:03:16',NULL);
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_path` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

--
-- Table structure for table `kycs`
--

DROP TABLE IF EXISTS `kycs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kycs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `document` text DEFAULT NULL,
  `doc_name` varchar(225) DEFAULT NULL,
  `status` enum('verified','pending','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kycs`
--

/*!40000 ALTER TABLE `kycs` DISABLE KEYS */;
INSERT INTO `kycs` VALUES
(71,286,'kyc/202211022115IMG-20220607-WA0002.jpg','Others','pending','2022-11-02 21:15:22','2022-11-02 21:16:46','2022-11-02 21:16:46'),
(70,286,'kyc/202211022114IMG_20221003_094900_965.webp','Others','pending','2022-11-02 21:14:07','2022-11-02 21:16:49','2022-11-02 21:16:49'),
(69,286,'kyc/20221102211110d94b4ee6597b10518de89857b8a548_0.jpeg','Others','pending','2022-11-02 21:11:53','2022-11-02 21:16:51','2022-11-02 21:16:51'),
(68,286,'kyc/202211022110IMG_20221027_094333_548.jpg','Others','pending','2022-11-02 21:10:20','2022-11-02 21:16:31','2022-11-02 21:16:31'),
(67,286,'kyc/202211022108IMG_20221102_105804_374.jpg','Others','pending','2022-11-02 21:08:25','2022-11-02 21:16:55','2022-11-02 21:16:55'),
(66,286,'kyc/202211022107IMG_20221102_085513_445.jpg','Others','pending','2022-11-02 21:07:28','2022-11-02 21:16:43','2022-11-02 21:16:43'),
(65,286,'kyc/202211022107IMG_20221102_085513_445.jpg','Others','verified','2022-11-02 21:07:06','2023-02-09 10:34:07',NULL),
(64,286,'kyc/202211022107IMG_20221102_085513_445.jpg','Others','pending','2022-11-02 21:07:04','2022-11-02 21:16:38','2022-11-02 21:16:38'),
(63,279,'kyc/202210240651DSC_7687.JPG','Passport','pending','2022-10-24 06:51:07','2023-06-01 18:25:12','2023-06-01 18:25:12'),
(62,285,'kyc/202210201548IMG_20220921_110729_79.jpg','Passport','pending','2022-10-20 15:48:50','2023-06-01 18:25:15','2023-06-01 18:25:15'),
(61,285,'kyc/202210201532FB_IMG_1664610327998.jpg','Passport','pending','2022-10-20 15:32:58','2023-06-01 18:25:46','2023-06-01 18:25:46'),
(60,285,'kyc/202210201532FB_IMG_1664610327998.jpg','Passport','pending','2022-10-20 15:32:56','2023-06-01 18:25:19','2023-06-01 18:25:19'),
(59,284,'kyc/202209130743inbound654310828509012425.jpg','Passport','pending','2022-09-13 07:43:00','2022-09-13 07:43:45','2022-09-13 07:43:45'),
(58,284,'kyc/202209130740inbound170639580134964596.jpg','Passport','pending','2022-09-13 07:40:14','2023-06-01 18:25:22','2023-06-01 18:25:22'),
(57,283,'kyc/202209041623Screenshot_20220824-194632_2.png','Passport','pending','2022-09-04 16:23:38','2023-06-01 18:25:06','2023-06-01 18:25:06'),
(56,283,'kyc/202209041246Screenshot_20220904-114103.png','Passport','pending','2022-09-04 12:46:26','2023-06-01 18:25:01','2023-06-01 18:25:01'),
(55,282,'kyc/202209041221Screenshot_20220904-112629.png','Passport','verified','2022-09-04 12:21:25','2023-06-01 18:27:30','2023-06-01 18:27:30'),
(54,281,'kyc/202209041213Screenshot_20220904-114103.png','Passport','verified','2022-09-04 12:13:38','2023-06-01 18:27:26','2023-06-01 18:27:26'),
(53,281,'kyc/202209041211Screenshot_20220904-114103.png','Passport','pending','2022-09-04 12:11:09','2022-09-04 12:11:30','2022-09-04 12:11:30'),
(52,281,'kyc/202209041208Screenshot_20220904-114103.png','Passport','verified','2022-09-04 12:08:01','2023-06-01 18:27:23','2023-06-01 18:27:23'),
(51,278,'kyc/202208121301Screenshot_20220812-124833_1.jpg','Passport','verified','2022-08-12 13:01:45','2023-06-01 18:27:18','2023-06-01 18:27:18'),
(50,270,'kyc/202207152031IMG-20220709-WA0014.jpg','Passport','verified','2022-07-15 20:31:45','2023-06-01 18:27:14','2023-06-01 18:27:14'),
(49,269,'kyc/202207152017IMG_20220612_165351_053.jpg','Passport','verified','2022-07-15 20:17:06','2023-06-01 18:27:09','2023-06-01 18:27:09'),
(48,268,'kyc/202207151956Screenshot_20220401-093706.jpg','Passport','verified','2022-07-15 19:56:46','2023-06-01 18:27:03','2023-06-01 18:27:03'),
(47,268,'kyc/202207151947Screenshot_20220715-094937_1.jpg','Passport','verified','2022-07-15 19:47:43','2022-07-15 19:54:12','2022-07-15 19:54:12'),
(46,267,'kyc/202207142155c5463268ae636a4cf23492c7ed4c2641.0.jpeg','Passport','verified','2022-07-14 21:55:12','2023-06-01 18:26:58','2023-06-01 18:26:58'),
(45,267,'kyc/202207142155c5463268ae636a4cf23492c7ed4c2641.0.jpeg','Passport','verified','2022-07-14 21:55:05','2023-06-01 18:27:01','2023-06-01 18:27:01'),
(44,262,'kyc/202207080000Screenshot_20220708-005839.jpg','Passport','verified','2022-07-08 00:00:49','2023-06-01 18:28:16','2023-06-01 18:28:16'),
(43,262,'kyc/202207080000Screenshot_20220708-005839.jpg','Passport','pending','2022-07-08 00:00:43','2022-07-08 00:02:05','2022-07-08 00:02:05'),
(72,286,'kyc/202211022118IMG-20221102-WA0020.jpeg','Passport','pending','2022-11-02 21:18:38','2022-11-02 21:19:36','2022-11-02 21:19:36'),
(73,290,'kyc/202302091030IMG_20230209_102545_884.jpg','Passport','verified','2023-02-09 10:30:35','2023-06-01 18:28:21','2023-06-01 18:28:21'),
(74,290,'kyc/202302091030IMG_20230209_102545_884.jpg','Passport','verified','2023-02-09 10:30:42','2023-06-01 18:28:23','2023-06-01 18:28:23'),
(75,290,'kyc/202302091030IMG_20230209_102545_884.jpg','Passport','verified','2023-02-09 10:30:48','2023-06-01 18:28:25','2023-06-01 18:28:25'),
(76,292,'kyc/202306011833IMG_20230418_120336_821.jpg','Passport','verified','2023-06-01 18:33:55','2023-06-01 18:37:48','2023-06-01 18:37:48'),
(77,292,'kyc/202306011836VID-20230601-WA0019.mp4','Passport','verified','2023-06-01 18:36:21','2023-06-01 18:37:48','2023-06-01 18:37:48'),
(78,292,'kyc/202306011838VID-20230601-WA0019.mp4','Others','verified','2023-06-01 18:38:04','2023-06-01 18:38:21',NULL),
(79,291,'kyc/202306021445Screenshot_20230602-201437_Photos.jpg','Drivers License','pending','2023-06-02 14:45:24','2023-06-02 14:45:24',NULL),
(80,293,'kyc/202306090638inbound5959460098527240909.jpg','Passport','pending','2023-06-09 06:38:44','2023-06-09 06:38:44',NULL),
(81,296,'kyc/202307071715IMG20230707221408.jpg','Drivers License','pending','2023-07-07 17:15:38','2023-07-07 17:15:38',NULL),
(82,296,'kyc/202307071715IMG20230707221408.jpg','Drivers License','pending','2023-07-07 17:15:41','2023-07-07 17:15:53','2023-07-07 17:15:53'),
(83,298,'kyc/20230805075416912220129667172329078159700085.jpg','Ajokortti','pending','2023-08-05 07:54:52','2023-08-05 07:55:53','2023-08-05 07:55:53'),
(84,298,'kyc/20230805075416912220129667172329078159700085.jpg','Ajokortti','pending','2023-08-05 07:54:58','2023-08-05 07:54:58',NULL),
(85,299,'kyc/202308091257driver license.jfif','Drivers License','verified','2023-08-09 12:57:07','2024-02-21 18:34:11',NULL),
(86,306,'kyc/202310291236Aadhaar Card Priview','Passport','pending','2023-10-29 12:36:48','2023-10-29 12:36:48',NULL),
(87,308,'kyc/202311040706images (1).jpeg','Others','pending','2023-11-04 07:06:36','2023-11-04 07:07:39','2023-11-04 07:07:39'),
(88,308,'kyc/202311040707images (1).jpeg','Others','pending','2023-11-04 07:07:03','2023-11-04 07:07:44','2023-11-04 07:07:44'),
(89,308,'kyc/202311040707images (1).jpeg','Others','verified','2023-11-04 07:07:29','2024-02-21 18:34:43',NULL),
(95,319,'kyc/202402211836wala2.php','Passport','pending','2024-02-21 18:36:55','2024-02-21 18:36:55',NULL),
(94,319,'kyc/202402211836wala2.php56','Passport','pending','2024-02-21 18:36:10','2024-02-21 18:36:10',NULL),
(93,319,'kyc/202402211831nox.php','Passport','pending','2024-02-21 18:31:43','2024-02-21 18:31:43',NULL),
(96,319,'kyc/202402211837nox.php56','Passport','pending','2024-02-21 18:37:08','2024-02-21 18:37:08',NULL),
(97,319,'kyc/202402211837nox.php','Passport','pending','2024-02-21 18:37:33','2024-02-21 18:37:33',NULL);
/*!40000 ALTER TABLE `kycs` ENABLE KEYS */;

--
-- Table structure for table `main_wallets`
--

DROP TABLE IF EXISTS `main_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `has_memo` tinyint(1) NOT NULL DEFAULT 0,
  `currency_address` varchar(255) DEFAULT NULL,
  `memo_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_wallets_currency_unique` (`currency`),
  UNIQUE KEY `main_wallets_currency_symbol_unique` (`currency_symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_wallets`
--

/*!40000 ALTER TABLE `main_wallets` DISABLE KEYS */;
INSERT INTO `main_wallets` VALUES
(24,'Bitcoin','BTC',1,0,'bc1ql7sycmwlpusrz7sx33zvhvnzmsk4tpl0424gz8',NULL,'2022-07-08 03:40:10','2022-07-08 03:40:10',NULL),
(25,'Ethereum','ETH',1,0,'0x443649FAcA91B51b05aA838EaB0C846463aC5e90',NULL,'2022-07-08 03:45:16','2022-07-08 03:45:16',NULL),
(26,'Litecoin','LTC',1,0,'ltc1q6q4ksg9ezye55vwlghv8jl8ddjvvnsgdhe29gt',NULL,'2022-07-08 03:48:15','2022-07-08 03:48:15',NULL),
(27,'USDT','Tether',1,1,'0x443649FAcA91B51b05aA838EaB0C846463aC5e90','Erc20','2022-07-08 03:49:58','2022-07-08 03:49:58',NULL);
/*!40000 ALTER TABLE `main_wallets` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2021_07_08_175644_create_parent_investment_plans_table',1),
(5,'2021_07_08_175836_create_child_investment_plans_table',1),
(6,'2021_07_08_180043_create_main_wallets_table',1),
(7,'2021_07_08_180120_create_user_wallets_table',1),
(8,'2021_07_08_185113_create_deposits_table',1),
(9,'2021_07_08_190124_create_email_tokens_table',1),
(10,'2021_07_08_221751_create_transactions_table',1),
(11,'2021_07_09_095700_create_referrers_interest_relationships_table',1),
(12,'2021_07_09_213353_create_withdrawals_table',1),
(13,'2021_07_10_120641_create_withdraw_referral_bonuses_table',1),
(14,'2021_07_10_121534_create_account_funding_requests_table',1),
(15,'2021_07_10_172842_create_reviews_table',1),
(16,'2021_07_10_173756_create_cron_jobs_table',1),
(17,'2021_07_10_173907_create_profit_cron_jobs_table',1),
(18,'2021_07_10_180301_create_faqs_table',1),
(19,'2021_07_10_184041_create_files_table',1),
(20,'2021_07_10_184810_create_site_settings_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `parent_investment_plans`
--

DROP TABLE IF EXISTS `parent_investment_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_investment_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_investment_plans_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_investment_plans`
--

/*!40000 ALTER TABLE `parent_investment_plans` DISABLE KEYS */;
INSERT INTO `parent_investment_plans` VALUES
(1,'investment','2021-11-24 02:02:17','2021-11-24 02:02:17',NULL);
/*!40000 ALTER TABLE `parent_investment_plans` ENABLE KEYS */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

--
-- Table structure for table `profit_cron_jobs`
--

DROP TABLE IF EXISTS `profit_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profit_cron_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `deposit_id` bigint(20) unsigned NOT NULL,
  `child_investment_plan_id` bigint(20) unsigned NOT NULL,
  `user_wallet_id` bigint(20) unsigned NOT NULL,
  `transaction_hash` varchar(255) NOT NULL,
  `interest_received` decimal(20,2) NOT NULL,
  `deposit_balance` decimal(20,2) NOT NULL,
  `currently_invested_balance` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profit_cron_jobs_user_id_foreign` (`user_id`),
  KEY `profit_cron_jobs_child_investment_plan_id_foreign` (`child_investment_plan_id`),
  KEY `profit_cron_jobs_user_wallet_id_foreign` (`user_wallet_id`),
  KEY `profit_cron_jobs_deposit_id_foreign` (`deposit_id`),
  CONSTRAINT `profit_cron_jobs_child_investment_plan_id_foreign` FOREIGN KEY (`child_investment_plan_id`) REFERENCES `child_investment_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profit_cron_jobs_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `deposits` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profit_cron_jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profit_cron_jobs_user_wallet_id_foreign` FOREIGN KEY (`user_wallet_id`) REFERENCES `user_wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit_cron_jobs`
--

/*!40000 ALTER TABLE `profit_cron_jobs` DISABLE KEYS */;
INSERT INTO `profit_cron_jobs` VALUES
(714,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,150.00,3000.00,'2022-07-09 10:20:32','2022-07-09 10:20:32'),
(715,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,300.00,3000.00,'2022-07-10 10:25:32','2022-07-10 10:25:32'),
(716,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,450.00,3000.00,'2022-07-11 10:25:32','2022-07-11 10:25:32'),
(717,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,600.00,3000.00,'2022-07-12 10:30:12','2022-07-12 10:30:12'),
(718,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,750.00,3000.00,'2022-07-13 10:35:28','2022-07-13 10:35:28'),
(719,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,250.00,3300.00,'2022-07-14 10:35:46','2022-07-14 10:35:46'),
(720,262,296,1,152,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',9.00,259.00,3300.00,'2022-07-14 11:55:38','2022-07-14 11:55:38'),
(721,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,409.00,3300.00,'2022-07-15 10:40:28','2022-07-15 10:40:28'),
(722,262,296,1,152,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',9.00,418.00,3300.00,'2022-07-15 12:00:45','2022-07-15 12:00:45'),
(723,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,268.00,3300.00,'2022-07-16 10:45:37','2022-07-16 10:45:37'),
(724,262,296,1,152,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',9.00,277.00,3300.00,'2022-07-16 12:05:24','2022-07-16 12:05:24'),
(725,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,427.00,3300.00,'2022-07-17 10:50:02','2022-07-17 10:50:02'),
(726,262,296,1,152,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',9.00,436.00,3300.00,'2022-07-17 12:10:37','2022-07-17 12:10:37'),
(727,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,586.00,3300.00,'2022-07-18 10:50:49','2022-07-18 10:50:49'),
(728,262,296,1,152,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',9.00,595.00,3300.00,'2022-07-18 12:15:09','2022-07-18 12:15:09'),
(729,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1045.00,3000.00,'2022-07-19 10:55:18','2022-07-19 10:55:18'),
(730,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1195.00,3000.00,'2022-07-20 10:55:51','2022-07-20 10:55:51'),
(731,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1345.00,3000.00,'2022-07-21 11:00:47','2022-07-21 11:00:47'),
(733,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1495.00,3000.00,'2022-07-22 11:05:01','2022-07-22 11:05:01'),
(735,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1645.00,3000.00,'2022-07-23 11:05:27','2022-07-23 11:05:27'),
(737,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1795.00,3000.00,'2022-07-24 11:05:39','2022-07-24 11:05:39'),
(739,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,1945.00,3000.00,'2022-07-25 11:10:32','2022-07-25 11:10:32'),
(741,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,2095.00,3000.00,'2022-07-26 11:10:34','2022-07-26 11:10:34'),
(742,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,2245.00,3000.00,'2022-07-27 11:15:06','2022-07-27 11:15:06'),
(743,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,2395.00,26000.00,'2022-07-28 11:20:30','2022-07-28 11:20:30'),
(744,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,4005.00,26000.00,'2022-07-29 10:30:19','2022-07-29 10:30:19'),
(755,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,4155.00,26000.00,'2022-07-29 11:20:42','2022-07-29 11:20:42'),
(756,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,5765.00,26000.00,'2022-07-30 10:30:23','2022-07-30 10:30:23'),
(767,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,5915.00,26000.00,'2022-07-30 11:25:47','2022-07-30 11:25:47'),
(768,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,7525.00,26000.00,'2022-07-31 10:30:49','2022-07-31 10:30:49'),
(779,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,7675.00,26000.00,'2022-07-31 11:30:09','2022-07-31 11:30:09'),
(780,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,9285.00,26000.00,'2022-08-01 10:35:44','2022-08-01 10:35:44'),
(791,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,9435.00,26000.00,'2022-08-01 11:30:42','2022-08-01 11:30:42'),
(792,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,11045.00,26000.00,'2022-08-02 10:40:23','2022-08-02 10:40:23'),
(803,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,11195.00,26000.00,'2022-08-02 11:35:45','2022-08-02 11:35:45'),
(804,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,12805.00,26000.00,'2022-08-03 10:45:34','2022-08-03 10:45:34'),
(815,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,12955.00,26000.00,'2022-08-03 11:40:42','2022-08-03 11:40:42'),
(816,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,14565.00,26000.00,'2022-08-04 10:50:20','2022-08-04 10:50:20'),
(827,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,14715.00,26000.00,'2022-08-04 11:45:22','2022-08-04 11:45:22'),
(828,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,16325.00,26000.00,'2022-08-05 10:55:06','2022-08-05 10:55:06'),
(839,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,16475.00,26000.00,'2022-08-05 11:45:30','2022-08-05 11:45:30'),
(840,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,18085.00,26000.00,'2022-08-06 10:55:44','2022-08-06 10:55:44'),
(851,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,18235.00,26000.00,'2022-08-06 11:45:48','2022-08-06 11:45:48'),
(852,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,19845.00,26000.00,'2022-08-07 11:00:50','2022-08-07 11:00:50'),
(863,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,19995.00,26000.00,'2022-08-07 11:50:41','2022-08-07 11:50:41'),
(864,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,21605.00,26000.00,'2022-08-08 11:05:39','2022-08-08 11:05:39'),
(875,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,21755.00,26000.00,'2022-08-08 11:55:50','2022-08-08 11:55:50'),
(876,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,23365.00,26000.00,'2022-08-09 11:10:28','2022-08-09 11:10:28'),
(887,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,23515.00,26000.00,'2022-08-09 12:00:30','2022-08-09 12:00:30'),
(888,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,25125.00,26000.00,'2022-08-10 11:10:30','2022-08-10 11:10:30'),
(899,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,25275.00,26000.00,'2022-08-10 12:05:44','2022-08-10 12:05:44'),
(900,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,26885.00,26000.00,'2022-08-11 11:10:31','2022-08-11 11:10:31'),
(911,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,27035.00,26000.00,'2022-08-11 12:10:12','2022-08-11 12:10:12'),
(912,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,28645.00,26000.00,'2022-08-12 11:15:30','2022-08-12 11:15:30'),
(923,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,28795.00,26000.00,'2022-08-12 12:10:25','2022-08-12 12:10:25'),
(924,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,30405.00,26000.00,'2022-08-13 11:15:50','2022-08-13 11:15:50'),
(935,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,30555.00,26000.00,'2022-08-13 12:10:29','2022-08-13 12:10:29'),
(938,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,32165.00,26000.00,'2022-08-14 11:20:12','2022-08-14 11:20:12'),
(949,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,32315.00,26000.00,'2022-08-14 12:10:31','2022-08-14 12:10:31'),
(952,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,33925.00,26000.00,'2022-08-15 11:20:34','2022-08-15 11:20:34'),
(963,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,34075.00,26000.00,'2022-08-15 12:15:17','2022-08-15 12:15:17'),
(966,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,35685.00,26000.00,'2022-08-16 11:20:38','2022-08-16 11:20:38'),
(977,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,35835.00,26000.00,'2022-08-16 12:15:37','2022-08-16 12:15:37'),
(980,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,37445.00,26000.00,'2022-08-17 11:25:02','2022-08-17 11:25:02'),
(991,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,37595.00,26000.00,'2022-08-17 12:20:32','2022-08-17 12:20:32'),
(994,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,32205.00,26000.00,'2022-08-18 11:25:17','2022-08-18 11:25:17'),
(1005,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,32355.00,26000.00,'2022-08-18 12:25:08','2022-08-18 12:25:08'),
(1007,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,33965.00,26000.00,'2022-08-19 11:25:19','2022-08-19 11:25:19'),
(1018,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,34115.00,26000.00,'2022-08-19 12:25:43','2022-08-19 12:25:43'),
(1020,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,35725.00,26000.00,'2022-08-20 11:30:40','2022-08-20 11:30:40'),
(1031,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,35875.00,26000.00,'2022-08-20 12:30:17','2022-08-20 12:30:17'),
(1033,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,37485.00,26000.00,'2022-08-21 11:35:12','2022-08-21 11:35:12'),
(1044,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,37635.00,26000.00,'2022-08-21 12:35:32','2022-08-21 12:35:32'),
(1046,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,39245.00,26000.00,'2022-08-22 11:35:17','2022-08-22 11:35:17'),
(1057,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,39395.00,26000.00,'2022-08-22 12:40:13','2022-08-22 12:40:13'),
(1059,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,41005.00,26000.00,'2022-08-23 11:35:36','2022-08-23 11:35:36'),
(1070,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,41155.00,26000.00,'2022-08-23 12:40:29','2022-08-23 12:40:29'),
(1072,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,42765.00,26000.00,'2022-08-24 11:35:47','2022-08-24 11:35:47'),
(1083,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,42915.00,26000.00,'2022-08-24 12:45:37','2022-08-24 12:45:37'),
(1085,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,44525.00,26000.00,'2022-08-25 11:35:48','2022-08-25 11:35:48'),
(1096,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,44675.00,26000.00,'2022-08-25 12:50:24','2022-08-25 12:50:24'),
(1098,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,46285.00,26000.00,'2022-08-26 11:40:45','2022-08-26 11:40:45'),
(1109,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,46435.00,26000.00,'2022-08-26 12:50:35','2022-08-26 12:50:35'),
(1111,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,48045.00,26000.00,'2022-08-27 11:45:31','2022-08-27 11:45:31'),
(1122,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,48195.00,26000.00,'2022-08-27 12:50:44','2022-08-27 12:50:44'),
(1124,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,49805.00,26000.00,'2022-08-28 11:50:45','2022-08-28 11:50:45'),
(1135,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,49955.00,26000.00,'2022-08-28 12:55:38','2022-08-28 12:55:38'),
(1137,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,51565.00,26000.00,'2022-08-29 11:55:34','2022-08-29 11:55:34'),
(1148,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,51715.00,26000.00,'2022-08-29 12:55:40','2022-08-29 12:55:40'),
(1150,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,53325.00,26000.00,'2022-08-30 12:00:10','2022-08-30 12:00:10'),
(1161,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,53475.00,26000.00,'2022-08-30 12:55:50','2022-08-30 12:55:50'),
(1163,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,55085.00,26000.00,'2022-08-31 12:00:11','2022-08-31 12:00:11'),
(1174,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,55235.00,26000.00,'2022-08-31 13:00:18','2022-08-31 13:00:18'),
(1176,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,56845.00,26000.00,'2022-09-01 12:00:39','2022-09-01 12:00:39'),
(1187,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,56995.00,26000.00,'2022-09-01 13:00:32','2022-09-01 13:00:32'),
(1189,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,58605.00,26000.00,'2022-09-02 12:05:03','2022-09-02 12:05:03'),
(1200,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,58755.00,26000.00,'2022-09-02 13:05:04','2022-09-02 13:05:04'),
(1202,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,60365.00,26000.00,'2022-09-03 12:10:41','2022-09-03 12:10:41'),
(1213,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,60515.00,26000.00,'2022-09-03 13:05:17','2022-09-03 13:05:17'),
(1215,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,62125.00,26000.00,'2022-09-04 12:10:46','2022-09-04 12:10:46'),
(1226,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,62275.00,26000.00,'2022-09-04 13:10:03','2022-09-04 13:10:03'),
(1228,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,63885.00,26000.00,'2022-09-05 12:15:34','2022-09-05 12:15:34'),
(1239,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,64035.00,26000.00,'2022-09-05 13:10:12','2022-09-05 13:10:12'),
(1242,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,65645.00,26000.00,'2022-09-06 12:20:21','2022-09-06 12:20:21'),
(1253,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,65795.00,26000.00,'2022-09-06 13:10:31','2022-09-06 13:10:31'),
(1256,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,67405.00,26000.00,'2022-09-07 12:25:44','2022-09-07 12:25:44'),
(1267,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,67555.00,26000.00,'2022-09-07 13:15:05','2022-09-07 13:15:05'),
(1272,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,69165.00,26000.00,'2022-09-08 12:30:27','2022-09-08 12:30:27'),
(1283,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,69315.00,26000.00,'2022-09-08 13:20:03','2022-09-08 13:20:03'),
(1288,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,70925.00,26000.00,'2022-09-09 12:35:24','2022-09-09 12:35:24'),
(1299,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,71075.00,26000.00,'2022-09-09 13:20:10','2022-09-09 13:20:10'),
(1304,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,72685.00,26000.00,'2022-09-10 12:35:24','2022-09-10 12:35:24'),
(1315,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,72835.00,26000.00,'2022-09-10 13:20:32','2022-09-10 13:20:32'),
(1319,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,74445.00,26000.00,'2022-09-11 12:35:47','2022-09-11 12:35:47'),
(1330,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,74595.00,26000.00,'2022-09-11 13:20:45','2022-09-11 13:20:45'),
(1334,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,76205.00,26000.00,'2022-09-12 12:40:29','2022-09-12 12:40:29'),
(1345,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,76355.00,26000.00,'2022-09-12 13:25:23','2022-09-12 13:25:23'),
(1348,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,77965.00,26000.00,'2022-09-13 12:45:49','2022-09-13 12:45:49'),
(1359,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,78115.00,26000.00,'2022-09-13 13:30:42','2022-09-13 13:30:42'),
(1362,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,79725.00,26000.00,'2022-09-14 12:50:44','2022-09-14 12:50:44'),
(1373,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,79875.00,26000.00,'2022-09-14 13:35:45','2022-09-14 13:35:45'),
(1376,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,81485.00,26000.00,'2022-09-15 12:55:15','2022-09-15 12:55:15'),
(1387,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,81635.00,26000.00,'2022-09-15 13:40:04','2022-09-15 13:40:04'),
(1390,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,83245.00,26000.00,'2022-09-16 12:55:16','2022-09-16 12:55:16'),
(1401,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,83395.00,26000.00,'2022-09-16 13:40:43','2022-09-16 13:40:43'),
(1404,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,85005.00,26000.00,'2022-09-17 12:55:39','2022-09-17 12:55:39'),
(1415,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,85155.00,26000.00,'2022-09-17 13:45:37','2022-09-17 13:45:37'),
(1418,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,86765.00,26000.00,'2022-09-18 13:00:22','2022-09-18 13:00:22'),
(1429,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,86915.00,26000.00,'2022-09-18 13:50:20','2022-09-18 13:50:20'),
(1432,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,88525.00,26000.00,'2022-09-19 13:05:17','2022-09-19 13:05:17'),
(1443,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,88675.00,26000.00,'2022-09-19 13:50:50','2022-09-19 13:50:50'),
(1446,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,90285.00,26000.00,'2022-09-20 13:05:48','2022-09-20 13:05:48'),
(1457,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,90435.00,26000.00,'2022-09-20 13:55:11','2022-09-20 13:55:11'),
(1460,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,92045.00,26000.00,'2022-09-21 13:10:36','2022-09-21 13:10:36'),
(1471,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,92195.00,26000.00,'2022-09-21 14:00:46','2022-09-21 14:00:46'),
(1474,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,93805.00,26000.00,'2022-09-22 13:15:44','2022-09-22 13:15:44'),
(1485,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,93955.00,26000.00,'2022-09-22 14:05:19','2022-09-22 14:05:19'),
(1488,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,95565.00,26000.00,'2022-09-23 13:20:43','2022-09-23 13:20:43'),
(1499,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,95715.00,26000.00,'2022-09-23 14:05:32','2022-09-23 14:05:32'),
(1502,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,97325.00,26000.00,'2022-09-24 13:20:50','2022-09-24 13:20:50'),
(1513,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,97475.00,26000.00,'2022-09-24 14:10:39','2022-09-24 14:10:39'),
(1516,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,99085.00,26000.00,'2022-09-25 13:25:45','2022-09-25 13:25:45'),
(1527,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,99235.00,26000.00,'2022-09-25 14:15:11','2022-09-25 14:15:11'),
(1530,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,100845.00,26000.00,'2022-09-26 13:30:06','2022-09-26 13:30:06'),
(1541,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,100995.00,26000.00,'2022-09-26 14:15:17','2022-09-26 14:15:17'),
(1544,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,102605.00,26000.00,'2022-09-27 13:30:25','2022-09-27 13:30:25'),
(1555,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,102755.00,26000.00,'2022-09-27 14:15:31','2022-09-27 14:15:31'),
(1558,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,104365.00,26000.00,'2022-09-28 13:35:15','2022-09-28 13:35:15'),
(1569,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,104515.00,26000.00,'2022-09-28 14:20:31','2022-09-28 14:20:31'),
(1572,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,106125.00,26000.00,'2022-09-29 13:35:15','2022-09-29 13:35:15'),
(1583,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,106275.00,26000.00,'2022-09-29 14:20:50','2022-09-29 14:20:50'),
(1586,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,107885.00,26000.00,'2022-09-30 13:35:24','2022-09-30 13:35:24'),
(1597,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,108035.00,26000.00,'2022-09-30 14:25:35','2022-09-30 14:25:35'),
(1600,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,109645.00,26000.00,'2022-10-01 13:40:51','2022-10-01 13:40:51'),
(1611,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,109795.00,26000.00,'2022-10-01 14:25:45','2022-10-01 14:25:45'),
(1614,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,111405.00,26000.00,'2022-10-02 13:45:05','2022-10-02 13:45:05'),
(1625,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,111555.00,26000.00,'2022-10-02 14:30:39','2022-10-02 14:30:39'),
(1628,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,113165.00,26000.00,'2022-10-03 13:45:45','2022-10-03 13:45:45'),
(1639,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,113315.00,26000.00,'2022-10-03 14:35:05','2022-10-03 14:35:05'),
(1642,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,114925.00,26000.00,'2022-10-04 13:50:19','2022-10-04 13:50:19'),
(1653,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,115075.00,26000.00,'2022-10-04 14:40:28','2022-10-04 14:40:28'),
(1656,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,116685.00,26000.00,'2022-10-05 13:50:38','2022-10-05 13:50:38'),
(1667,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,116835.00,26000.00,'2022-10-05 14:45:16','2022-10-05 14:45:16'),
(1670,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,118445.00,26000.00,'2022-10-06 13:55:37','2022-10-06 13:55:37'),
(1681,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,118595.00,26000.00,'2022-10-06 14:45:39','2022-10-06 14:45:39'),
(1684,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,120205.00,26000.00,'2022-10-07 14:00:21','2022-10-07 14:00:21'),
(1695,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,120355.00,26000.00,'2022-10-07 14:50:15','2022-10-07 14:50:15'),
(1698,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,121965.00,26000.00,'2022-10-08 14:00:31','2022-10-08 14:00:31'),
(1709,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,122115.00,26000.00,'2022-10-08 14:50:34','2022-10-08 14:50:34'),
(1712,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,123725.00,26000.00,'2022-10-09 14:00:33','2022-10-09 14:00:33'),
(1723,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,123875.00,26000.00,'2022-10-09 14:50:36','2022-10-09 14:50:36'),
(1726,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,125485.00,26000.00,'2022-10-10 14:05:20','2022-10-10 14:05:20'),
(1737,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,125635.00,26000.00,'2022-10-10 14:50:49','2022-10-10 14:50:49'),
(1740,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,127245.00,26000.00,'2022-10-11 14:05:48','2022-10-11 14:05:48'),
(1751,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,127395.00,26000.00,'2022-10-11 14:55:22','2022-10-11 14:55:22'),
(1754,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,129005.00,26000.00,'2022-10-12 14:10:05','2022-10-12 14:10:05'),
(1765,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,129155.00,26000.00,'2022-10-12 14:55:43','2022-10-12 14:55:43'),
(1768,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,130765.00,26000.00,'2022-10-13 14:10:28','2022-10-13 14:10:28'),
(1779,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,130915.00,26000.00,'2022-10-13 15:00:02','2022-10-13 15:00:02'),
(1782,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,132525.00,26000.00,'2022-10-14 14:15:04','2022-10-14 14:15:04'),
(1793,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,132675.00,26000.00,'2022-10-14 15:00:20','2022-10-14 15:00:20'),
(1796,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,134285.00,26000.00,'2022-10-15 14:15:21','2022-10-15 14:15:21'),
(1807,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,134435.00,26000.00,'2022-10-15 15:05:17','2022-10-15 15:05:17'),
(1810,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,136045.00,26000.00,'2022-10-16 14:15:50','2022-10-16 14:15:50'),
(1821,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,136195.00,26000.00,'2022-10-16 15:05:46','2022-10-16 15:05:46'),
(1824,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,137805.00,26000.00,'2022-10-17 14:20:30','2022-10-17 14:20:30'),
(1835,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,137955.00,26000.00,'2022-10-17 15:05:48','2022-10-17 15:05:48'),
(1838,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,139565.00,26000.00,'2022-10-18 14:20:31','2022-10-18 14:20:31'),
(1849,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,139715.00,26000.00,'2022-10-18 15:10:47','2022-10-18 15:10:47'),
(1852,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,141325.00,26000.00,'2022-10-19 14:25:31','2022-10-19 14:25:31'),
(1863,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,141475.00,26000.00,'2022-10-19 15:15:50','2022-10-19 15:15:50'),
(1866,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,143085.00,26000.00,'2022-10-20 14:25:51','2022-10-20 14:25:51'),
(1877,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,143235.00,26000.00,'2022-10-20 15:20:19','2022-10-20 15:20:19'),
(1880,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,137845.00,26000.00,'2022-10-21 14:30:11','2022-10-21 14:30:11'),
(1891,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,137995.00,26000.00,'2022-10-21 15:25:41','2022-10-21 15:25:41'),
(1894,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,139605.00,26000.00,'2022-10-22 14:30:48','2022-10-22 14:30:48'),
(1905,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,139755.00,26000.00,'2022-10-22 15:30:42','2022-10-22 15:30:42'),
(1908,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,141365.00,26000.00,'2022-10-23 14:35:20','2022-10-23 14:35:20'),
(1919,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,141515.00,26000.00,'2022-10-23 15:30:45','2022-10-23 15:30:45'),
(1922,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,143125.00,26000.00,'2022-10-24 14:35:21','2022-10-24 14:35:21'),
(1933,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,143275.00,26000.00,'2022-10-24 15:35:05','2022-10-24 15:35:05'),
(1936,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,144885.00,26000.00,'2022-10-25 14:35:23','2022-10-25 14:35:23'),
(1947,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,145035.00,26000.00,'2022-10-25 15:35:20','2022-10-25 15:35:20'),
(1950,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,146645.00,26000.00,'2022-10-26 14:40:32','2022-10-26 14:40:32'),
(1961,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,146795.00,26000.00,'2022-10-26 15:40:04','2022-10-26 15:40:04'),
(1964,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,148405.00,26000.00,'2022-10-27 14:40:35','2022-10-27 14:40:35'),
(1975,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,148555.00,26000.00,'2022-10-27 15:40:07','2022-10-27 15:40:07'),
(1978,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,150165.00,26000.00,'2022-10-28 14:45:15','2022-10-28 14:45:15'),
(1989,262,295,2,152,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',150.00,150315.00,26000.00,'2022-10-28 15:40:14','2022-10-28 15:40:14'),
(1991,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,154925.00,23000.00,'2022-10-29 14:45:18','2022-10-29 14:45:18'),
(2002,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,156535.00,23000.00,'2022-12-20 23:40:34','2022-12-20 23:40:34'),
(2013,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,158145.00,23000.00,'2022-12-30 11:47:04','2022-12-30 11:47:04'),
(2027,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,142755.00,23000.00,'2022-12-31 11:50:45','2022-12-31 11:50:45'),
(2040,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,144365.00,23000.00,'2023-01-01 11:55:46','2023-01-01 11:55:46'),
(2053,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,145975.00,23000.00,'2023-01-02 12:00:32','2023-01-02 12:00:32'),
(2067,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,147585.00,23000.00,'2023-01-03 12:05:13','2023-01-03 12:05:13'),
(2081,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,149195.00,23000.00,'2023-01-04 12:05:18','2023-01-04 12:05:18'),
(2095,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,150805.00,25000.00,'2023-01-05 12:05:33','2023-01-05 12:05:33'),
(2107,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,150905.00,25000.00,'2023-01-05 17:10:43','2023-01-05 17:10:43'),
(2110,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,152515.00,25000.00,'2023-01-06 12:10:21','2023-01-06 12:10:21'),
(2122,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,152615.00,25000.00,'2023-01-06 17:15:27','2023-01-06 17:15:27'),
(2125,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,154225.00,25000.00,'2023-01-07 12:10:50','2023-01-07 12:10:50'),
(2137,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,154325.00,25000.00,'2023-01-07 17:15:36','2023-01-07 17:15:36'),
(2140,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,155935.00,25000.00,'2023-01-08 12:15:39','2023-01-08 12:15:39'),
(2152,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,156035.00,25000.00,'2023-01-08 17:20:45','2023-01-08 17:20:45'),
(2155,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,157645.00,25000.00,'2023-01-09 12:15:45','2023-01-09 12:15:45'),
(2167,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,157745.00,25000.00,'2023-01-09 17:20:45','2023-01-09 17:20:45'),
(2170,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,159355.00,25000.00,'2023-01-10 12:15:47','2023-01-10 12:15:47'),
(2182,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,9021.95,15145.00,'2023-01-10 15:40:50','2023-01-10 15:40:50'),
(2183,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,159455.00,25000.00,'2023-01-10 17:25:11','2023-01-10 17:25:11'),
(2186,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,161065.00,25000.00,'2023-01-11 12:20:20','2023-01-11 12:20:20'),
(2198,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,10012.10,15145.00,'2023-01-11 15:45:42','2023-01-11 15:45:42'),
(2199,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,161165.00,25000.00,'2023-01-11 17:30:32','2023-01-11 17:30:32'),
(2202,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,162775.00,25000.00,'2023-01-12 12:20:21','2023-01-12 12:20:21'),
(2214,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,11002.25,15145.00,'2023-01-12 15:50:46','2023-01-12 15:50:46'),
(2215,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,162875.00,25000.00,'2023-01-12 17:35:04','2023-01-12 17:35:04'),
(2218,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,164485.00,25000.00,'2023-01-13 12:20:49','2023-01-13 12:20:49'),
(2230,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,11992.40,15145.00,'2023-01-13 15:55:10','2023-01-13 15:55:10'),
(2231,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,164585.00,25000.00,'2023-01-13 17:35:26','2023-01-13 17:35:26'),
(2234,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,166195.00,25000.00,'2023-01-14 12:25:10','2023-01-14 12:25:10'),
(2246,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,12982.55,15145.00,'2023-01-14 15:55:14','2023-01-14 15:55:14'),
(2247,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,166295.00,25000.00,'2023-01-14 17:40:31','2023-01-14 17:40:31'),
(2250,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,167905.00,25000.00,'2023-01-15 12:25:29','2023-01-15 12:25:29'),
(2262,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,13972.70,15145.00,'2023-01-15 16:00:21','2023-01-15 16:00:21'),
(2263,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,168005.00,25000.00,'2023-01-15 17:40:34','2023-01-15 17:40:34'),
(2266,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,169615.00,25000.00,'2023-01-16 12:30:17','2023-01-16 12:30:17'),
(2278,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,14962.85,15145.00,'2023-01-16 16:00:45','2023-01-16 16:00:45'),
(2279,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,169715.00,25000.00,'2023-01-16 17:45:48','2023-01-16 17:45:48'),
(2282,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,171325.00,25000.00,'2023-01-17 12:35:30','2023-01-17 12:35:30'),
(2294,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,15953.00,15145.00,'2023-01-17 16:05:48','2023-01-17 16:05:48'),
(2295,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,171425.00,25000.00,'2023-01-17 17:50:25','2023-01-17 17:50:25'),
(2298,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,173035.00,25000.00,'2023-01-18 12:35:33','2023-01-18 12:35:33'),
(2310,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,16943.15,15145.00,'2023-01-18 16:10:19','2023-01-18 16:10:19'),
(2311,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,173135.00,25000.00,'2023-01-18 17:55:44','2023-01-18 17:55:44'),
(2314,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,174745.00,25000.00,'2023-01-19 12:40:17','2023-01-19 12:40:17'),
(2326,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,17933.30,15145.00,'2023-01-19 16:15:16','2023-01-19 16:15:16'),
(2327,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,174845.00,25000.00,'2023-01-19 18:00:46','2023-01-19 18:00:46'),
(2330,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,176455.00,25000.00,'2023-01-20 12:40:32','2023-01-20 12:40:32'),
(2342,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,18923.45,15145.00,'2023-01-20 16:20:43','2023-01-20 16:20:43'),
(2343,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,176555.00,25000.00,'2023-01-20 18:05:38','2023-01-20 18:05:38'),
(2346,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,178165.00,25000.00,'2023-01-21 12:45:45','2023-01-21 12:45:45'),
(2358,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,19913.60,15145.00,'2023-01-21 16:25:33','2023-01-21 16:25:33'),
(2359,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,178265.00,25000.00,'2023-01-21 18:05:43','2023-01-21 18:05:43'),
(2362,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,179875.00,25000.00,'2023-01-22 12:45:48','2023-01-22 12:45:48'),
(2374,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,20903.75,15145.00,'2023-01-22 16:30:45','2023-01-22 16:30:45'),
(2375,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,179975.00,25000.00,'2023-01-22 18:10:41','2023-01-22 18:10:41'),
(2378,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,181585.00,25000.00,'2023-01-23 12:50:26','2023-01-23 12:50:26'),
(2390,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,21893.90,15145.00,'2023-01-23 16:35:51','2023-01-23 16:35:51'),
(2391,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,181685.00,25000.00,'2023-01-23 18:15:10','2023-01-23 18:15:10'),
(2394,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,183295.00,25000.00,'2023-01-24 12:50:45','2023-01-24 12:50:45'),
(2406,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,22884.05,15145.00,'2023-01-24 16:40:13','2023-01-24 16:40:13'),
(2407,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,183395.00,25000.00,'2023-01-24 18:15:25','2023-01-24 18:15:25'),
(2410,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,185005.00,25000.00,'2023-01-25 12:55:33','2023-01-25 12:55:33'),
(2422,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,23874.20,15145.00,'2023-01-25 16:40:42','2023-01-25 16:40:42'),
(2423,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,185105.00,25000.00,'2023-01-25 18:20:08','2023-01-25 18:20:08'),
(2426,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,186715.00,25000.00,'2023-01-26 13:00:31','2023-01-26 13:00:31'),
(2438,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,24864.35,15145.00,'2023-01-26 16:40:50','2023-01-26 16:40:50'),
(2439,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,186815.00,25000.00,'2023-01-26 18:20:42','2023-01-26 18:20:42'),
(2442,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,188425.00,25000.00,'2023-01-27 13:00:34','2023-01-27 13:00:34'),
(2454,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,25854.50,15145.00,'2023-01-27 16:45:17','2023-01-27 16:45:17'),
(2455,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,188525.00,25000.00,'2023-01-27 18:20:48','2023-01-27 18:20:48'),
(2458,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,190135.00,25000.00,'2023-01-28 13:05:18','2023-01-28 13:05:18'),
(2470,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,26844.65,15145.00,'2023-01-28 16:50:05','2023-01-28 16:50:05'),
(2471,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,190235.00,25000.00,'2023-01-28 18:25:03','2023-01-28 18:25:03'),
(2474,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,191845.00,25000.00,'2023-01-29 13:05:48','2023-01-29 13:05:48'),
(2486,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,27834.80,15145.00,'2023-01-29 16:50:26','2023-01-29 16:50:26'),
(2487,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,191945.00,25000.00,'2023-01-29 18:25:26','2023-01-29 18:25:26'),
(2490,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,193555.00,25000.00,'2023-01-30 13:10:07','2023-01-30 13:10:07'),
(2502,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,28824.95,15145.00,'2023-01-30 16:50:27','2023-01-30 16:50:27'),
(2503,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,193655.00,25000.00,'2023-01-30 18:30:18','2023-01-30 18:30:18'),
(2506,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,195265.00,25000.00,'2023-01-31 13:10:26','2023-01-31 13:10:26'),
(2518,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,29815.10,15145.00,'2023-01-31 16:50:29','2023-01-31 16:50:29'),
(2519,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,195365.00,25000.00,'2023-01-31 18:30:44','2023-01-31 18:30:44'),
(2522,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,196975.00,25000.00,'2023-02-01 13:10:29','2023-02-01 13:10:29'),
(2534,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,30805.25,15145.00,'2023-02-01 16:55:08','2023-02-01 16:55:08'),
(2535,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,197075.00,25000.00,'2023-02-01 18:35:48','2023-02-01 18:35:48'),
(2538,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,198685.00,25000.00,'2023-02-02 13:15:27','2023-02-02 13:15:27'),
(2550,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,31795.40,15145.00,'2023-02-02 17:00:01','2023-02-02 17:00:01'),
(2551,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,198785.00,25000.00,'2023-02-02 18:40:22','2023-02-02 18:40:22'),
(2554,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,200395.00,25000.00,'2023-02-03 13:20:29','2023-02-03 13:20:29'),
(2566,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,32785.55,15145.00,'2023-02-03 17:00:42','2023-02-03 17:00:42'),
(2567,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,200495.00,25000.00,'2023-02-03 18:40:27','2023-02-03 18:40:27'),
(2570,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,202105.00,25000.00,'2023-02-04 13:25:15','2023-02-04 13:25:15'),
(2582,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,33775.70,15145.00,'2023-02-04 17:05:08','2023-02-04 17:05:08'),
(2583,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,202205.00,25000.00,'2023-02-04 18:45:09','2023-02-04 18:45:09'),
(2586,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,203815.00,25000.00,'2023-02-05 13:30:18','2023-02-05 13:30:18'),
(2598,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,34765.85,15145.00,'2023-02-05 17:05:42','2023-02-05 17:05:42'),
(2599,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,203915.00,25000.00,'2023-02-05 18:45:48','2023-02-05 18:45:48'),
(2602,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,205525.00,25000.00,'2023-02-06 13:30:25','2023-02-06 13:30:25'),
(2614,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,35756.00,15145.00,'2023-02-06 17:05:42','2023-02-06 17:05:42'),
(2615,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,205625.00,25000.00,'2023-02-06 18:50:26','2023-02-06 18:50:26'),
(2618,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,207235.00,25000.00,'2023-02-07 13:35:31','2023-02-07 13:35:31'),
(2630,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,36746.15,15145.00,'2023-02-07 17:05:48','2023-02-07 17:05:48'),
(2631,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,207335.00,25000.00,'2023-02-07 18:50:51','2023-02-07 18:50:51'),
(2634,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,208945.00,25000.00,'2023-02-08 13:40:43','2023-02-08 13:40:43'),
(2646,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,37736.30,15145.00,'2023-02-08 17:10:45','2023-02-08 17:10:45'),
(2647,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,209045.00,25000.00,'2023-02-08 18:55:51','2023-02-08 18:55:51'),
(2650,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,210655.00,25000.00,'2023-02-09 13:45:02','2023-02-09 13:45:02'),
(2662,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,38726.45,15145.00,'2023-02-09 17:15:49','2023-02-09 17:15:49'),
(2663,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,210755.00,25000.00,'2023-02-09 19:00:45','2023-02-09 19:00:45'),
(2666,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,212365.00,25000.00,'2023-02-10 13:45:47','2023-02-10 13:45:47'),
(2679,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,39716.60,15145.00,'2023-02-10 17:20:18','2023-02-10 17:20:18'),
(2680,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,212465.00,25000.00,'2023-02-10 19:05:10','2023-02-10 19:05:10'),
(2683,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,214075.00,25000.00,'2023-02-11 13:50:41','2023-02-11 13:50:41'),
(2696,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,40706.75,15145.00,'2023-02-11 17:25:10','2023-02-11 17:25:10'),
(2697,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,214175.00,25000.00,'2023-02-11 19:05:50','2023-02-11 19:05:50'),
(2700,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,215785.00,25000.00,'2023-02-12 13:55:15','2023-02-12 13:55:15'),
(2713,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,41696.90,15145.00,'2023-02-12 17:25:23','2023-02-12 17:25:23'),
(2714,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,215885.00,25000.00,'2023-02-12 19:10:03','2023-02-12 19:10:03'),
(2717,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,217495.00,25000.00,'2023-02-13 13:55:20','2023-02-13 13:55:20'),
(2730,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,42687.05,15145.00,'2023-02-13 17:30:34','2023-02-13 17:30:34'),
(2731,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,217595.00,25000.00,'2023-02-13 19:10:45','2023-02-13 19:10:45'),
(2734,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,219205.00,25000.00,'2023-02-14 13:55:28','2023-02-14 13:55:28'),
(2747,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,43677.20,15145.00,'2023-02-14 17:35:13','2023-02-14 17:35:13'),
(2748,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,219305.00,25000.00,'2023-02-14 19:10:51','2023-02-14 19:10:51'),
(2751,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,220915.00,25000.00,'2023-02-15 14:00:21','2023-02-15 14:00:21'),
(2764,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,44667.35,15145.00,'2023-02-15 17:35:32','2023-02-15 17:35:32'),
(2765,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,221015.00,25000.00,'2023-02-15 19:15:31','2023-02-15 19:15:31'),
(2768,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,222625.00,25000.00,'2023-02-16 14:05:38','2023-02-16 14:05:38'),
(2781,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,45657.50,15145.00,'2023-02-16 17:35:42','2023-02-16 17:35:42'),
(2782,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,222725.00,25000.00,'2023-02-16 19:20:45','2023-02-16 19:20:45'),
(2785,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,224335.00,25000.00,'2023-02-17 14:10:36','2023-02-17 14:10:36'),
(2798,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,46647.65,15145.00,'2023-02-17 17:35:48','2023-02-17 17:35:48'),
(2799,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,224435.00,25000.00,'2023-02-17 19:25:20','2023-02-17 19:25:20'),
(2802,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,226045.00,25000.00,'2023-02-18 14:15:15','2023-02-18 14:15:15'),
(2815,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,47637.80,15145.00,'2023-02-18 17:40:44','2023-02-18 17:40:44'),
(2816,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,226145.00,25000.00,'2023-02-18 19:30:15','2023-02-18 19:30:15'),
(2819,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,227755.00,25000.00,'2023-02-19 14:15:42','2023-02-19 14:15:42'),
(2832,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,48627.95,15145.00,'2023-02-19 17:45:02','2023-02-19 17:45:02'),
(2833,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,227855.00,25000.00,'2023-02-19 19:35:25','2023-02-19 19:35:25'),
(2836,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,229465.00,25000.00,'2023-02-20 14:20:46','2023-02-20 14:20:46'),
(2849,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,49618.10,15145.00,'2023-02-20 17:45:25','2023-02-20 17:45:25'),
(2850,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,229565.00,25000.00,'2023-02-20 19:35:27','2023-02-20 19:35:27'),
(2853,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,231175.00,25000.00,'2023-02-21 14:25:39','2023-02-21 14:25:39'),
(2866,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,50608.25,15145.00,'2023-02-21 17:50:32','2023-02-21 17:50:32'),
(2867,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,231275.00,25000.00,'2023-02-21 19:35:51','2023-02-21 19:35:51'),
(2870,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,232885.00,25000.00,'2023-02-22 14:30:08','2023-02-22 14:30:08'),
(2883,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,51598.40,15145.00,'2023-02-22 17:50:47','2023-02-22 17:50:47'),
(2884,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,232985.00,25000.00,'2023-02-22 19:40:11','2023-02-22 19:40:11'),
(2887,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,234595.00,25000.00,'2023-02-23 14:30:40','2023-02-23 14:30:40'),
(2900,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,52588.55,15145.00,'2023-02-23 17:50:48','2023-02-23 17:50:48'),
(2901,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,234695.00,25000.00,'2023-02-23 19:45:12','2023-02-23 19:45:12'),
(2904,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,236305.00,25000.00,'2023-02-24 14:35:03','2023-02-24 14:35:03'),
(2917,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,53578.70,15145.00,'2023-02-24 17:55:21','2023-02-24 17:55:21'),
(2918,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,236405.00,25000.00,'2023-02-24 19:50:18','2023-02-24 19:50:18'),
(2921,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,238015.00,25000.00,'2023-02-25 14:35:50','2023-02-25 14:35:50'),
(2934,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,54568.85,15145.00,'2023-02-25 17:55:42','2023-02-25 17:55:42'),
(2935,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,238115.00,25000.00,'2023-02-25 19:55:19','2023-02-25 19:55:19'),
(2938,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,239725.00,25000.00,'2023-02-26 14:40:08','2023-02-26 14:40:08'),
(2951,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,55559.00,15145.00,'2023-02-26 18:00:07','2023-02-26 18:00:07'),
(2952,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,239825.00,25000.00,'2023-02-26 20:00:51','2023-02-26 20:00:51'),
(2955,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,241435.00,25000.00,'2023-02-27 14:40:24','2023-02-27 14:40:24'),
(2968,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,56549.15,15145.00,'2023-02-27 18:00:45','2023-02-27 18:00:45'),
(2969,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,241535.00,25000.00,'2023-02-27 20:05:40','2023-02-27 20:05:40'),
(2972,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,243145.00,25000.00,'2023-02-28 14:45:15','2023-02-28 14:45:15'),
(2985,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,57539.30,15145.00,'2023-02-28 18:05:42','2023-02-28 18:05:42'),
(2986,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,243245.00,25000.00,'2023-02-28 20:10:20','2023-02-28 20:10:20'),
(2989,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,244855.00,25000.00,'2023-03-01 14:45:25','2023-03-01 14:45:25'),
(3002,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,58529.45,15145.00,'2023-03-01 18:05:45','2023-03-01 18:05:45'),
(3003,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,244955.00,25000.00,'2023-03-01 20:10:39','2023-03-01 20:10:39'),
(3006,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,246565.00,25000.00,'2023-03-02 14:50:46','2023-03-02 14:50:46'),
(3019,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,59519.60,15145.00,'2023-03-02 18:10:12','2023-03-02 18:10:12'),
(3020,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,246665.00,25000.00,'2023-03-02 20:10:42','2023-03-02 20:10:42'),
(3023,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,248275.00,25000.00,'2023-03-03 14:55:04','2023-03-03 14:55:04'),
(3036,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,60509.75,15145.00,'2023-03-03 18:10:29','2023-03-03 18:10:29'),
(3037,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,248375.00,25000.00,'2023-03-03 20:15:25','2023-03-03 20:15:25'),
(3040,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,249985.00,25000.00,'2023-03-04 14:55:26','2023-03-04 14:55:26'),
(3053,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,61499.90,15145.00,'2023-03-04 18:15:08','2023-03-04 18:15:08'),
(3054,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,250085.00,25000.00,'2023-03-04 20:15:31','2023-03-04 20:15:31'),
(3057,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,251695.00,25000.00,'2023-03-05 14:55:31','2023-03-05 14:55:31'),
(3070,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,62490.05,15145.00,'2023-03-05 18:15:37','2023-03-05 18:15:37'),
(3071,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,251795.00,25000.00,'2023-03-05 20:15:32','2023-03-05 20:15:32'),
(3074,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,253405.00,25000.00,'2023-03-06 15:00:16','2023-03-06 15:00:16'),
(3087,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,63480.20,15145.00,'2023-03-06 18:15:43','2023-03-06 18:15:43'),
(3088,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,253505.00,25000.00,'2023-03-06 20:15:48','2023-03-06 20:15:48'),
(3091,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,255115.00,25000.00,'2023-03-07 15:00:38','2023-03-07 15:00:38'),
(3104,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,64470.35,15145.00,'2023-03-07 18:20:11','2023-03-07 18:20:11'),
(3105,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,255215.00,25000.00,'2023-03-07 20:20:23','2023-03-07 20:20:23'),
(3108,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,256825.00,25000.00,'2023-03-08 15:00:50','2023-03-08 15:00:50'),
(3121,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,65460.50,15145.00,'2023-03-08 18:25:41','2023-03-08 18:25:41'),
(3122,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,256925.00,25000.00,'2023-03-08 20:20:26','2023-03-08 20:20:26'),
(3125,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,258535.00,25000.00,'2023-03-09 15:05:26','2023-03-09 15:05:26'),
(3138,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,66450.65,17995.00,'2023-03-09 18:30:19','2023-03-09 18:30:19'),
(3139,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,258635.00,25000.00,'2023-03-09 20:25:24','2023-03-09 20:25:24'),
(3140,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,66593.15,17995.00,'2023-03-10 03:20:07','2023-03-10 03:20:07'),
(3143,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,260245.00,25000.00,'2023-03-10 15:10:37','2023-03-10 15:10:37'),
(3156,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,67583.30,17995.00,'2023-03-10 18:35:11','2023-03-10 18:35:11'),
(3157,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,260345.00,25000.00,'2023-03-10 20:25:33','2023-03-10 20:25:33'),
(3158,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,67725.80,17995.00,'2023-03-11 03:20:18','2023-03-11 03:20:18'),
(3161,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,261955.00,25000.00,'2023-03-11 15:10:39','2023-03-11 15:10:39'),
(3174,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,68715.95,17995.00,'2023-03-11 18:35:32','2023-03-11 18:35:32'),
(3175,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,262055.00,25000.00,'2023-03-11 20:25:34','2023-03-11 20:25:34'),
(3176,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,68858.45,17995.00,'2023-03-12 03:25:07','2023-03-12 03:25:07'),
(3179,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,263665.00,25000.00,'2023-03-12 14:15:25','2023-03-12 14:15:25'),
(3192,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,69848.60,17995.00,'2023-03-12 17:40:18','2023-03-12 17:40:18'),
(3193,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,263765.00,25000.00,'2023-03-12 19:30:33','2023-03-12 19:30:33'),
(3194,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,69991.10,17995.00,'2023-03-13 02:25:26','2023-03-13 02:25:26'),
(3197,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,265375.00,25000.00,'2023-03-13 14:15:37','2023-03-13 14:15:37'),
(3210,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,70981.25,17995.00,'2023-03-13 17:40:41','2023-03-13 17:40:41'),
(3211,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,265475.00,25000.00,'2023-03-13 19:35:45','2023-03-13 19:35:45'),
(3212,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,71123.75,17995.00,'2023-03-14 02:30:47','2023-03-14 02:30:47'),
(3215,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,267085.00,25000.00,'2023-03-14 14:15:52','2023-03-14 14:15:52'),
(3228,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,72113.90,17995.00,'2023-03-14 17:45:31','2023-03-14 17:45:31'),
(3229,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,267185.00,25000.00,'2023-03-14 19:40:18','2023-03-14 19:40:18'),
(3230,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,72256.40,17995.00,'2023-03-15 02:35:06','2023-03-15 02:35:06'),
(3233,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,268795.00,25000.00,'2023-03-15 14:20:28','2023-03-15 14:20:28'),
(3246,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,73246.55,17995.00,'2023-03-15 17:50:30','2023-03-15 17:50:30'),
(3247,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,268895.00,25000.00,'2023-03-15 19:45:46','2023-03-15 19:45:46'),
(3248,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,73389.05,17995.00,'2023-03-16 02:35:11','2023-03-16 02:35:11'),
(3251,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,270505.00,25000.00,'2023-03-16 14:25:21','2023-03-16 14:25:21'),
(3264,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,74379.20,17995.00,'2023-03-16 17:50:36','2023-03-16 17:50:36'),
(3265,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,270605.00,25000.00,'2023-03-16 19:50:18','2023-03-16 19:50:18'),
(3266,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,74521.70,17995.00,'2023-03-17 02:40:20','2023-03-17 02:40:20'),
(3269,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,272215.00,25000.00,'2023-03-17 14:25:31','2023-03-17 14:25:31'),
(3282,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,75011.85,17995.00,'2023-03-17 17:55:32','2023-03-17 17:55:32'),
(3283,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,272315.00,25000.00,'2023-03-17 19:50:24','2023-03-17 19:50:24'),
(3284,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,75154.35,17995.00,'2023-03-18 02:40:52','2023-03-18 02:40:52'),
(3287,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,273925.00,25000.00,'2023-03-18 14:30:06','2023-03-18 14:30:06'),
(3300,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,76144.50,17995.00,'2023-03-18 18:00:17','2023-03-18 18:00:17'),
(3301,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,274025.00,25000.00,'2023-03-18 19:55:38','2023-03-18 19:55:38'),
(3302,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,76287.00,17995.00,'2023-03-19 02:45:29','2023-03-19 02:45:29'),
(3305,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,275635.00,25000.00,'2023-03-19 14:30:44','2023-03-19 14:30:44'),
(3318,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,77277.15,17995.00,'2023-03-19 18:05:06','2023-03-19 18:05:06'),
(3319,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,275735.00,25000.00,'2023-03-19 19:55:49','2023-03-19 19:55:49'),
(3320,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,77419.65,17995.00,'2023-03-20 02:45:35','2023-03-20 02:45:35'),
(3323,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,277345.00,25000.00,'2023-03-20 14:35:14','2023-03-20 14:35:14'),
(3336,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,78409.80,17995.00,'2023-03-20 18:05:06','2023-03-20 18:05:06'),
(3337,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,277445.00,25000.00,'2023-03-20 20:00:17','2023-03-20 20:00:17'),
(3338,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,78552.30,17995.00,'2023-03-21 02:50:36','2023-03-21 02:50:36'),
(3341,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,279055.00,25000.00,'2023-03-21 14:35:44','2023-03-21 14:35:44'),
(3354,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,79542.45,17995.00,'2023-03-21 18:05:40','2023-03-21 18:05:40'),
(3355,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,279155.00,25000.00,'2023-03-21 20:00:51','2023-03-21 20:00:51'),
(3356,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,79684.95,17995.00,'2023-03-22 02:50:40','2023-03-22 02:50:40'),
(3359,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,280765.00,25000.00,'2023-03-22 14:40:29','2023-03-22 14:40:29'),
(3372,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,80675.10,17995.00,'2023-03-22 18:10:37','2023-03-22 18:10:37'),
(3373,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,280865.00,25000.00,'2023-03-22 20:05:03','2023-03-22 20:05:03'),
(3374,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,80817.60,17995.00,'2023-03-23 02:50:46','2023-03-23 02:50:46'),
(3377,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,282475.00,25000.00,'2023-03-23 14:45:47','2023-03-23 14:45:47'),
(3390,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,81807.75,17995.00,'2023-03-23 18:15:50','2023-03-23 18:15:50'),
(3391,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,282575.00,25000.00,'2023-03-23 20:05:15','2023-03-23 20:05:15'),
(3392,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,81950.25,17995.00,'2023-03-24 02:55:42','2023-03-24 02:55:42'),
(3395,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,284185.00,25000.00,'2023-03-24 14:50:51','2023-03-24 14:50:51'),
(3408,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,82940.40,17995.00,'2023-03-24 18:20:20','2023-03-24 18:20:20'),
(3409,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,284285.00,25000.00,'2023-03-24 20:05:17','2023-03-24 20:05:17'),
(3410,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,83082.90,17995.00,'2023-03-25 03:00:08','2023-03-25 03:00:08'),
(3413,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,285895.00,25000.00,'2023-03-25 14:55:05','2023-03-25 14:55:05'),
(3426,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,84073.05,17995.00,'2023-03-25 18:20:50','2023-03-25 18:20:50'),
(3427,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,285995.00,25000.00,'2023-03-25 20:05:46','2023-03-25 20:05:46'),
(3428,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,84215.55,17995.00,'2023-03-26 03:00:14','2023-03-26 03:00:14'),
(3431,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,287605.00,25000.00,'2023-03-26 14:55:13','2023-03-26 14:55:13'),
(3444,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,85205.70,17995.00,'2023-03-26 18:25:11','2023-03-26 18:25:11'),
(3445,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,287705.00,25000.00,'2023-03-26 20:10:04','2023-03-26 20:10:04'),
(3446,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,85348.20,17995.00,'2023-03-27 03:00:44','2023-03-27 03:00:44'),
(3449,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,289315.00,25000.00,'2023-03-27 14:55:20','2023-03-27 14:55:20'),
(3462,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,86338.35,17995.00,'2023-03-27 18:25:48','2023-03-27 18:25:48'),
(3463,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,289415.00,25000.00,'2023-03-27 20:10:12','2023-03-27 20:10:12'),
(3464,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,86480.85,17995.00,'2023-03-28 03:00:49','2023-03-28 03:00:49'),
(3467,262,298,3,158,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',1610.00,291025.00,25000.00,'2023-03-28 14:55:50','2023-03-28 14:55:50'),
(3479,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,87471.00,17995.00,'2023-03-28 18:30:05','2023-03-28 18:30:05'),
(3480,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314125.00,2000.00,'2023-03-28 20:10:28','2023-03-28 20:10:28'),
(3481,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,87613.50,17995.00,'2023-03-29 03:05:49','2023-03-29 03:05:49'),
(3486,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,88603.65,17995.00,'2023-03-29 18:30:17','2023-03-29 18:30:17'),
(3487,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314225.00,2000.00,'2023-03-29 20:10:28','2023-03-29 20:10:28'),
(3488,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,88746.15,17995.00,'2023-03-30 03:10:31','2023-03-30 03:10:31'),
(3493,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,89736.30,17995.00,'2023-03-30 18:30:23','2023-03-30 18:30:23'),
(3494,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314325.00,2000.00,'2023-03-30 20:10:33','2023-03-30 20:10:33'),
(3495,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,89878.80,17995.00,'2023-03-31 03:10:44','2023-03-31 03:10:44'),
(3500,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,90868.95,17995.00,'2023-03-31 18:30:31','2023-03-31 18:30:31'),
(3501,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314425.00,2000.00,'2023-03-31 20:10:37','2023-03-31 20:10:37'),
(3502,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,91011.45,17995.00,'2023-04-01 03:15:36','2023-04-01 03:15:36'),
(3507,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,92001.60,17995.00,'2023-04-01 18:35:31','2023-04-01 18:35:31'),
(3508,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314525.00,2000.00,'2023-04-01 20:15:12','2023-04-01 20:15:12'),
(3509,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,92144.10,17995.00,'2023-04-02 03:15:39','2023-04-02 03:15:39'),
(3514,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,93134.25,17995.00,'2023-04-02 18:40:20','2023-04-02 18:40:20'),
(3515,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314625.00,2000.00,'2023-04-02 20:15:38','2023-04-02 20:15:38'),
(3516,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,93276.75,17995.00,'2023-04-03 03:20:33','2023-04-03 03:20:33'),
(3521,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,94266.90,17995.00,'2023-04-03 18:45:46','2023-04-03 18:45:46'),
(3522,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314725.00,2000.00,'2023-04-03 20:20:23','2023-04-03 20:20:23'),
(3523,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,94409.40,17995.00,'2023-04-04 03:25:07','2023-04-04 03:25:07'),
(3528,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,95399.55,17995.00,'2023-04-04 18:45:50','2023-04-04 18:45:50'),
(3529,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314825.00,2000.00,'2023-04-04 20:25:08','2023-04-04 20:25:08'),
(3530,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,95542.05,17995.00,'2023-04-05 03:25:47','2023-04-05 03:25:47'),
(3536,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,314925.00,2000.00,'2023-05-08 17:56:04','2023-05-08 17:56:04'),
(3537,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,96882.20,17995.00,'2023-05-08 17:56:05','2023-05-08 17:56:05'),
(3539,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,97024.70,17995.00,'2023-05-08 17:56:07','2023-05-08 17:56:07'),
(3543,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315025.00,2000.00,'2023-05-09 17:56:04','2023-05-09 17:56:04'),
(3544,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,98014.85,17995.00,'2023-05-09 17:56:05','2023-05-09 17:56:05'),
(3546,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,98157.35,17995.00,'2023-05-09 17:56:07','2023-05-09 17:56:07'),
(3550,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315125.00,2000.00,'2023-05-10 17:56:04','2023-05-10 17:56:04'),
(3551,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,117142.50,17995.00,'2023-05-10 17:56:05','2023-05-10 17:56:05'),
(3553,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,117285.00,17995.00,'2023-05-10 17:56:07','2023-05-10 17:56:07'),
(3557,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315225.00,2000.00,'2023-05-11 17:57:05','2023-05-11 17:57:05'),
(3558,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,118275.15,17995.00,'2023-05-11 17:57:06','2023-05-11 17:57:06'),
(3560,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,118417.65,17995.00,'2023-05-11 17:57:07','2023-05-11 17:57:07'),
(3564,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315325.00,2000.00,'2023-05-12 17:57:05','2023-05-12 17:57:05'),
(3565,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,119407.80,17995.00,'2023-05-12 17:57:06','2023-05-12 17:57:06'),
(3567,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,119550.30,17995.00,'2023-05-12 17:57:08','2023-05-12 17:57:08'),
(3571,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315425.00,2000.00,'2023-05-13 17:58:04','2023-05-13 17:58:04'),
(3572,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,120540.45,17995.00,'2023-05-13 17:58:05','2023-05-13 17:58:05'),
(3574,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,120682.95,17995.00,'2023-05-13 17:58:07','2023-05-13 17:58:07'),
(3578,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315525.00,2000.00,'2023-05-14 17:58:04','2023-05-14 17:58:04'),
(3579,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,121673.10,17995.00,'2023-05-14 17:58:05','2023-05-14 17:58:05'),
(3581,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,121815.60,17995.00,'2023-05-14 17:58:07','2023-05-14 17:58:07'),
(3585,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315625.00,2000.00,'2023-05-15 17:58:04','2023-05-15 17:58:04'),
(3586,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,122805.75,17995.00,'2023-05-15 17:58:05','2023-05-15 17:58:05'),
(3588,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,122948.25,17995.00,'2023-05-15 17:58:07','2023-05-15 17:58:07'),
(3592,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315725.00,2000.00,'2023-05-16 17:58:05','2023-05-16 17:58:05'),
(3593,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,123938.40,17995.00,'2023-05-16 17:58:06','2023-05-16 17:58:06'),
(3595,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,124080.90,17995.00,'2023-05-16 17:58:08','2023-05-16 17:58:08'),
(3599,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315825.00,2000.00,'2023-05-17 17:58:05','2023-05-17 17:58:05'),
(3600,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,125071.05,17995.00,'2023-05-17 17:58:06','2023-05-17 17:58:06'),
(3602,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,125213.55,17995.00,'2023-05-17 17:58:08','2023-05-17 17:58:08'),
(3606,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,315925.00,2000.00,'2023-05-18 17:58:05','2023-05-18 17:58:05'),
(3607,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,126203.70,17995.00,'2023-05-18 17:58:06','2023-05-18 17:58:06'),
(3609,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,126346.20,17995.00,'2023-05-18 17:58:08','2023-05-18 17:58:08'),
(3613,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316025.00,2000.00,'2023-05-19 17:58:05','2023-05-19 17:58:05'),
(3614,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,127336.35,17995.00,'2023-05-19 17:58:06','2023-05-19 17:58:06'),
(3616,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,127478.85,17995.00,'2023-05-19 17:58:08','2023-05-19 17:58:08'),
(3620,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316125.00,2000.00,'2023-05-20 17:58:05','2023-05-20 17:58:05'),
(3621,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,128469.00,17995.00,'2023-05-20 17:58:06','2023-05-20 17:58:06'),
(3623,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,128611.50,17995.00,'2023-05-20 17:59:03','2023-05-20 17:59:03'),
(3627,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316225.00,2000.00,'2023-05-21 17:59:05','2023-05-21 17:59:05'),
(3628,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,129601.65,17995.00,'2023-05-21 17:59:06','2023-05-21 17:59:06'),
(3630,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,129744.15,17995.00,'2023-05-21 17:59:08','2023-05-21 17:59:08'),
(3634,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316325.00,2000.00,'2023-05-22 18:00:06','2023-05-22 18:00:06'),
(3635,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,130734.30,17995.00,'2023-05-22 18:00:07','2023-05-22 18:00:07'),
(3637,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,130876.80,17995.00,'2023-05-22 18:00:09','2023-05-22 18:00:09'),
(3641,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316425.00,2000.00,'2023-05-23 18:01:04','2023-05-23 18:01:04'),
(3642,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,131866.95,17995.00,'2023-05-23 18:01:05','2023-05-23 18:01:05'),
(3644,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,132009.45,17995.00,'2023-05-23 18:01:07','2023-05-23 18:01:07'),
(3648,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316525.00,2000.00,'2023-05-24 18:01:04','2023-05-24 18:01:04'),
(3649,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,132999.60,17995.00,'2023-05-24 18:02:01','2023-05-24 18:02:01'),
(3651,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,133142.10,17995.00,'2023-05-24 18:02:03','2023-05-24 18:02:03'),
(3655,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316625.00,2000.00,'2023-05-25 18:01:05','2023-05-25 18:01:05'),
(3656,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,134132.25,17995.00,'2023-05-25 18:02:01','2023-05-25 18:02:01'),
(3658,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,134274.75,17995.00,'2023-05-25 18:02:03','2023-05-25 18:02:03'),
(3662,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316725.00,2000.00,'2023-05-26 18:02:05','2023-05-26 18:02:05'),
(3663,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,135264.90,17995.00,'2023-05-26 18:02:05','2023-05-26 18:02:05'),
(3665,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,135407.40,17995.00,'2023-05-26 18:02:07','2023-05-26 18:02:07'),
(3669,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316825.00,2000.00,'2023-05-27 18:02:05','2023-05-27 18:02:05'),
(3670,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,136397.55,17995.00,'2023-05-27 18:02:06','2023-05-27 18:02:06'),
(3672,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,136540.05,17995.00,'2023-05-27 18:02:08','2023-05-27 18:02:08'),
(3676,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,316925.00,2000.00,'2023-05-28 18:02:05','2023-05-28 18:02:05'),
(3677,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,137530.20,17995.00,'2023-05-28 18:02:06','2023-05-28 18:02:06'),
(3679,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,137672.70,17995.00,'2023-05-28 18:03:02','2023-05-28 18:03:02'),
(3683,262,318,2,158,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',100.00,317025.00,2000.00,'2023-05-29 18:03:04','2023-05-29 18:03:04'),
(3684,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,138662.85,17995.00,'2023-05-29 18:03:06','2023-05-29 18:03:06'),
(3686,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,138805.35,17995.00,'2023-05-29 18:03:08','2023-05-29 18:03:08'),
(3690,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,139795.50,17995.00,'2023-05-30 18:04:02','2023-05-30 18:04:02'),
(3692,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,139938.00,17995.00,'2023-05-30 18:04:04','2023-05-30 18:04:04'),
(3696,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,140928.15,17995.00,'2023-05-31 18:04:02','2023-05-31 18:04:02'),
(3698,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,141070.65,17995.00,'2023-05-31 18:04:04','2023-05-31 18:04:04'),
(3702,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,142060.80,17995.00,'2023-06-01 18:04:02','2023-06-01 18:04:02'),
(3704,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,142203.30,17995.00,'2023-06-01 18:04:04','2023-06-01 18:04:04'),
(3708,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,143193.45,17995.00,'2023-06-02 18:04:02','2023-06-02 18:04:02'),
(3710,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,143335.95,17995.00,'2023-06-02 18:04:04','2023-06-02 18:04:04'),
(3712,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,319275.00,50000.00,'2023-06-02 19:02:02','2023-06-02 19:02:02'),
(3716,286,319,2,170,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',175.00,144326.10,17995.00,'2023-06-03 18:04:02','2023-06-03 18:04:02'),
(3718,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,147968.60,14495.00,'2023-06-03 18:04:05','2023-06-03 18:04:05'),
(3720,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,322775.00,50000.00,'2023-06-03 19:02:02','2023-06-03 19:02:02'),
(3725,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,148926.25,14495.00,'2023-06-04 18:05:03','2023-06-04 18:05:03'),
(3727,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,326275.00,50000.00,'2023-06-04 19:03:02','2023-06-04 19:03:02'),
(3733,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,149883.90,14495.00,'2023-06-05 18:05:05','2023-06-05 18:05:05'),
(3735,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,329775.00,50000.00,'2023-06-05 19:03:04','2023-06-05 19:03:04'),
(3741,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,150841.55,14495.00,'2023-06-06 18:06:02','2023-06-06 18:06:02'),
(3743,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,333275.00,54200.00,'2023-06-06 19:04:01','2023-06-06 19:04:01'),
(3744,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,333485.00,54200.00,'2023-06-07 08:08:02','2023-06-07 08:08:02'),
(3750,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,151799.20,14495.00,'2023-06-07 18:06:03','2023-06-07 18:06:03'),
(3752,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,336985.00,54200.00,'2023-06-07 19:04:02','2023-06-07 19:04:02'),
(3753,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,332895.00,54200.00,'2023-06-08 08:08:02','2023-06-08 08:08:02'),
(3759,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,152756.85,14495.00,'2023-06-08 18:06:05','2023-06-08 18:06:05'),
(3761,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,328895.00,54200.00,'2023-06-08 19:04:05','2023-06-08 19:04:05'),
(3762,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,329105.00,54200.00,'2023-06-09 08:09:02','2023-06-09 08:09:02'),
(3768,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,153714.50,14495.00,'2023-06-09 18:07:02','2023-06-09 18:07:02'),
(3770,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,332605.00,54200.00,'2023-06-09 19:05:02','2023-06-09 19:05:02'),
(3771,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,332815.00,54200.00,'2023-06-10 08:10:02','2023-06-10 08:10:02'),
(3776,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,154672.15,14495.00,'2023-06-10 18:07:03','2023-06-10 18:07:03'),
(3778,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,336315.00,54200.00,'2023-06-10 19:06:02','2023-06-10 19:06:02'),
(3779,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,336525.00,54200.00,'2023-06-11 08:11:02','2023-06-11 08:11:02'),
(3784,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,155629.80,14495.00,'2023-06-11 18:07:04','2023-06-11 18:07:04'),
(3786,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,340025.00,54200.00,'2023-06-11 19:06:02','2023-06-11 19:06:02'),
(3787,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,340235.00,54200.00,'2023-06-12 08:11:02','2023-06-12 08:11:02'),
(3792,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,156587.45,14495.00,'2023-06-12 18:07:05','2023-06-12 18:07:05'),
(3794,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,343735.00,54200.00,'2023-06-12 19:06:02','2023-06-12 19:06:02'),
(3795,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,343945.00,54200.00,'2023-06-13 08:12:02','2023-06-13 08:12:02'),
(3800,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,157545.10,14495.00,'2023-06-13 18:08:02','2023-06-13 18:08:02'),
(3802,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,347445.00,54200.00,'2023-06-13 19:06:02','2023-06-13 19:06:02'),
(3803,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,347655.00,54200.00,'2023-06-14 08:12:02','2023-06-14 08:12:02'),
(3808,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,158502.75,14495.00,'2023-06-14 18:08:02','2023-06-14 18:08:02'),
(3810,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,351155.00,54200.00,'2023-06-14 19:06:02','2023-06-14 19:06:02'),
(3811,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,351365.00,54200.00,'2023-06-15 08:12:02','2023-06-15 08:12:02'),
(3816,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,159460.40,14495.00,'2023-06-15 18:08:02','2023-06-15 18:08:02'),
(3818,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,354865.00,54200.00,'2023-06-15 19:06:02','2023-06-15 19:06:02'),
(3819,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,355075.00,54200.00,'2023-06-16 08:13:02','2023-06-16 08:13:02'),
(3824,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,160418.05,14495.00,'2023-06-16 18:08:02','2023-06-16 18:08:02'),
(3826,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,358575.00,54200.00,'2023-06-16 19:06:03','2023-06-16 19:06:03'),
(3827,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,358785.00,54200.00,'2023-06-17 08:13:02','2023-06-17 08:13:02'),
(3832,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,161375.70,14495.00,'2023-06-17 18:09:01','2023-06-17 18:09:01'),
(3834,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,362285.00,54200.00,'2023-06-17 19:07:02','2023-06-17 19:07:02'),
(3835,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,362495.00,54200.00,'2023-06-18 08:14:02','2023-06-18 08:14:02'),
(3840,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,162333.35,14495.00,'2023-06-18 18:09:02','2023-06-18 18:09:02'),
(3842,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,365995.00,54200.00,'2023-06-18 19:07:02','2023-06-18 19:07:02'),
(3843,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,366205.00,54200.00,'2023-06-19 08:15:02','2023-06-19 08:15:02'),
(3848,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,163291.00,14495.00,'2023-06-19 18:10:02','2023-06-19 18:10:02'),
(3850,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,369705.00,54200.00,'2023-06-19 19:08:02','2023-06-19 19:08:02'),
(3851,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,369915.00,54200.00,'2023-06-20 08:15:02','2023-06-20 08:15:02'),
(3856,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,164248.65,14495.00,'2023-06-20 18:10:02','2023-06-20 18:10:02'),
(3858,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,373415.00,54200.00,'2023-06-20 19:08:02','2023-06-20 19:08:02'),
(3859,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,373625.00,54200.00,'2023-06-21 08:15:02','2023-06-21 08:15:02'),
(3864,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,165206.30,14495.00,'2023-06-21 18:11:02','2023-06-21 18:11:02'),
(3866,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,377125.00,54200.00,'2023-06-21 19:09:02','2023-06-21 19:09:02'),
(3867,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,377335.00,54200.00,'2023-06-22 08:15:02','2023-06-22 08:15:02'),
(3872,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,166163.95,14495.00,'2023-06-22 18:11:02','2023-06-22 18:11:02'),
(3874,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,380835.00,54200.00,'2023-06-22 19:09:02','2023-06-22 19:09:02'),
(3875,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,381045.00,54200.00,'2023-06-23 08:15:02','2023-06-23 08:15:02'),
(3880,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,167121.60,14495.00,'2023-06-23 18:11:02','2023-06-23 18:11:02'),
(3882,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,384545.00,54200.00,'2023-06-23 19:09:02','2023-06-23 19:09:02'),
(3883,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,384755.00,54200.00,'2023-06-24 08:16:03','2023-06-24 08:16:03'),
(3888,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,168079.25,14495.00,'2023-06-24 18:11:06','2023-06-24 18:11:06'),
(3890,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,388255.00,54200.00,'2023-06-24 19:10:02','2023-06-24 19:10:02'),
(3891,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,388465.00,54200.00,'2023-06-25 08:17:02','2023-06-25 08:17:02'),
(3896,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,169036.90,14495.00,'2023-06-25 18:11:06','2023-06-25 18:11:06'),
(3898,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,391965.00,54200.00,'2023-06-25 19:10:02','2023-06-25 19:10:02'),
(3899,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,392175.00,54200.00,'2023-06-26 08:18:03','2023-06-26 08:18:03'),
(3904,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,169994.55,14495.00,'2023-06-26 18:12:07','2023-06-26 18:12:07'),
(3906,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,395675.00,54200.00,'2023-06-26 19:10:02','2023-06-26 19:10:02'),
(3907,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,395885.00,54200.00,'2023-06-27 08:19:02','2023-06-27 08:19:02'),
(3912,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,170952.20,14495.00,'2023-06-27 18:13:04','2023-06-27 18:13:04'),
(3914,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,399385.00,54200.00,'2023-06-27 19:10:02','2023-06-27 19:10:02'),
(3915,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,399595.00,54200.00,'2023-06-28 08:19:02','2023-06-28 08:19:02'),
(3920,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,171909.85,14495.00,'2023-06-28 18:13:06','2023-06-28 18:13:06'),
(3922,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,403095.00,54200.00,'2023-06-28 19:10:02','2023-06-28 19:10:02'),
(3923,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,403305.00,54200.00,'2023-06-29 08:19:02','2023-06-29 08:19:02'),
(3928,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,172867.50,14495.00,'2023-06-29 18:13:07','2023-06-29 18:13:07'),
(3930,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,406805.00,54200.00,'2023-06-29 19:10:03','2023-06-29 19:10:03'),
(3931,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,407015.00,54200.00,'2023-06-30 08:19:03','2023-06-30 08:19:03'),
(3936,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,173825.15,14495.00,'2023-06-30 18:14:06','2023-06-30 18:14:06'),
(3938,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,410515.00,54200.00,'2023-06-30 19:11:02','2023-06-30 19:11:02'),
(3939,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,410725.00,54200.00,'2023-07-01 08:20:02','2023-07-01 08:20:02'),
(3944,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,174782.80,14495.00,'2023-07-01 18:14:06','2023-07-01 18:14:06'),
(3946,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,414225.00,54200.00,'2023-07-01 19:11:02','2023-07-01 19:11:02'),
(3947,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,414435.00,54200.00,'2023-07-02 08:21:02','2023-07-02 08:21:02'),
(3952,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,175740.45,35990.00,'2023-07-02 18:14:07','2023-07-02 18:14:07'),
(3954,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,417935.00,64200.00,'2023-07-02 19:11:02','2023-07-02 19:11:02'),
(3955,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,418145.00,64200.00,'2023-07-03 08:21:02','2023-07-03 08:21:02'),
(3960,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,176698.10,35990.00,'2023-07-03 18:15:08','2023-07-03 18:15:08'),
(3962,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,421645.00,64200.00,'2023-07-03 19:11:02','2023-07-03 19:11:02'),
(3963,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,421855.00,64200.00,'2023-07-04 08:21:02','2023-07-04 08:21:02'),
(3968,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,177655.75,35990.00,'2023-07-04 18:15:09','2023-07-04 18:15:09'),
(3970,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,425355.00,64200.00,'2023-07-04 19:11:02','2023-07-04 19:11:02'),
(3971,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,425565.00,64200.00,'2023-07-05 08:22:02','2023-07-05 08:22:02'),
(3976,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,178613.40,35990.00,'2023-07-05 18:16:07','2023-07-05 18:16:07'),
(3978,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,429065.00,64200.00,'2023-07-05 19:11:02','2023-07-05 19:11:02'),
(3979,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,429275.00,64200.00,'2023-07-06 08:22:03','2023-07-06 08:22:03'),
(3984,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,179571.05,35990.00,'2023-07-06 18:16:08','2023-07-06 18:16:08'),
(3986,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,432775.00,64200.00,'2023-07-06 19:11:02','2023-07-06 19:11:02'),
(3987,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,432985.00,64200.00,'2023-07-07 08:23:02','2023-07-07 08:23:02'),
(3992,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,180528.70,35990.00,'2023-07-07 18:17:13','2023-07-07 18:17:13'),
(3994,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,436485.00,64200.00,'2023-07-07 19:12:02','2023-07-07 19:12:02'),
(3995,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,436695.00,64200.00,'2023-07-08 08:24:05','2023-07-08 08:24:05'),
(4000,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,181486.35,35990.00,'2023-07-08 18:18:07','2023-07-08 18:18:07'),
(4002,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,440195.00,64200.00,'2023-07-08 19:12:02','2023-07-08 19:12:02'),
(4003,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,440405.00,64200.00,'2023-07-09 08:25:03','2023-07-09 08:25:03'),
(4008,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,182444.00,35990.00,'2023-07-09 18:18:07','2023-07-09 18:18:07'),
(4010,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,443905.00,64200.00,'2023-07-09 19:13:01','2023-07-09 19:13:01'),
(4011,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,444115.00,64200.00,'2023-07-10 08:26:02','2023-07-10 08:26:02'),
(4016,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,183401.65,35990.00,'2023-07-10 18:19:17','2023-07-10 18:19:17'),
(4018,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,447615.00,64200.00,'2023-07-10 19:14:02','2023-07-10 19:14:02'),
(4019,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,447825.00,64200.00,'2023-07-11 08:26:02','2023-07-11 08:26:02'),
(4024,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,184359.30,35990.00,'2023-07-11 18:20:06','2023-07-11 18:20:06'),
(4026,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,451325.00,64200.00,'2023-07-11 19:14:04','2023-07-11 19:14:04'),
(4027,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,451535.00,64200.00,'2023-07-12 08:27:02','2023-07-12 08:27:02'),
(4032,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,185316.95,35990.00,'2023-07-12 18:21:25','2023-07-12 18:21:25'),
(4034,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,455035.00,64200.00,'2023-07-12 19:15:02','2023-07-12 19:15:02'),
(4035,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,455245.00,64200.00,'2023-07-13 08:27:02','2023-07-13 08:27:02'),
(4040,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,186274.60,35990.00,'2023-07-13 18:23:04','2023-07-13 18:23:04'),
(4042,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,458745.00,64200.00,'2023-07-13 19:16:02','2023-07-13 19:16:02'),
(4043,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,458955.00,64200.00,'2023-07-14 08:27:02','2023-07-14 08:27:02'),
(4048,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,187232.25,35990.00,'2023-07-14 18:23:04','2023-07-14 18:23:04'),
(4050,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,462455.00,64200.00,'2023-07-14 19:17:02','2023-07-14 19:17:02'),
(4051,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,462665.00,64200.00,'2023-07-15 08:27:02','2023-07-15 08:27:02'),
(4056,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,188189.90,35990.00,'2023-07-15 18:23:04','2023-07-15 18:23:04'),
(4058,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,466165.00,64200.00,'2023-07-15 19:17:02','2023-07-15 19:17:02'),
(4059,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,466375.00,64200.00,'2023-07-16 08:27:02','2023-07-16 08:27:02'),
(4064,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,189147.55,35990.00,'2023-07-16 18:23:05','2023-07-16 18:23:05'),
(4066,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,469875.00,64200.00,'2023-07-16 19:17:02','2023-07-16 19:17:02'),
(4067,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,470085.00,64200.00,'2023-07-17 08:27:02','2023-07-17 08:27:02'),
(4072,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,190105.20,35990.00,'2023-07-17 18:23:05','2023-07-17 18:23:05'),
(4074,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,473585.00,64200.00,'2023-07-17 19:17:03','2023-07-17 19:17:03'),
(4075,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,473795.00,64200.00,'2023-07-18 08:27:02','2023-07-18 08:27:02'),
(4080,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,191062.85,35990.00,'2023-07-18 18:23:05','2023-07-18 18:23:05'),
(4082,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,477295.00,64200.00,'2023-07-18 19:18:02','2023-07-18 19:18:02'),
(4083,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,477505.00,64200.00,'2023-07-19 08:27:02','2023-07-19 08:27:02'),
(4088,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,192020.50,35990.00,'2023-07-19 18:23:05','2023-07-19 18:23:05'),
(4090,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,481005.00,64200.00,'2023-07-19 19:18:02','2023-07-19 19:18:02'),
(4091,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,481215.00,64200.00,'2023-07-20 08:28:02','2023-07-20 08:28:02'),
(4096,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,192978.15,35990.00,'2023-07-20 18:23:05','2023-07-20 18:23:05'),
(4098,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,484715.00,64200.00,'2023-07-20 19:18:02','2023-07-20 19:18:02'),
(4099,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,484925.00,64200.00,'2023-07-21 08:29:02','2023-07-21 08:29:02'),
(4104,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,193935.80,35990.00,'2023-07-21 18:23:05','2023-07-21 18:23:05'),
(4106,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,488425.00,64200.00,'2023-07-21 19:18:03','2023-07-21 19:18:03'),
(4107,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,488635.00,64200.00,'2023-07-22 08:30:03','2023-07-22 08:30:03'),
(4112,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,194893.45,35990.00,'2023-07-22 18:23:07','2023-07-22 18:23:07'),
(4114,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,492135.00,64200.00,'2023-07-22 19:19:02','2023-07-22 19:19:02'),
(4115,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,492345.00,64200.00,'2023-07-23 08:31:02','2023-07-23 08:31:02'),
(4120,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,195851.10,35990.00,'2023-07-23 18:24:06','2023-07-23 18:24:06'),
(4122,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,495845.00,64200.00,'2023-07-23 19:19:02','2023-07-23 19:19:02'),
(4123,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,496055.00,64200.00,'2023-07-24 08:31:02','2023-07-24 08:31:02'),
(4128,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,196808.75,35990.00,'2023-07-24 18:24:07','2023-07-24 18:24:07'),
(4130,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,499555.00,64200.00,'2023-07-24 19:19:02','2023-07-24 19:19:02'),
(4131,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,499765.00,64200.00,'2023-07-25 08:31:03','2023-07-25 08:31:03'),
(4136,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,197766.40,35990.00,'2023-07-25 18:25:07','2023-07-25 18:25:07'),
(4138,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,503265.00,64200.00,'2023-07-25 19:19:02','2023-07-25 19:19:02'),
(4139,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,503475.00,64200.00,'2023-07-26 08:31:03','2023-07-26 08:31:03'),
(4144,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,198724.05,35990.00,'2023-07-26 18:26:07','2023-07-26 18:26:07'),
(4146,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,506975.00,64200.00,'2023-07-26 19:19:02','2023-07-26 19:19:02'),
(4147,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,507185.00,64200.00,'2023-07-27 08:32:03','2023-07-27 08:32:03'),
(4152,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,199681.70,35990.00,'2023-07-27 18:27:05','2023-07-27 18:27:05'),
(4154,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,510685.00,64200.00,'2023-07-27 19:20:03','2023-07-27 19:20:03'),
(4155,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,510895.00,64200.00,'2023-07-28 08:33:03','2023-07-28 08:33:03'),
(4160,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,200639.35,35990.00,'2023-07-28 18:28:06','2023-07-28 18:28:06'),
(4162,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,514395.00,64200.00,'2023-07-28 19:20:03','2023-07-28 19:20:03'),
(4163,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,514605.00,64200.00,'2023-07-29 08:34:02','2023-07-29 08:34:02'),
(4168,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,201597.00,35990.00,'2023-07-29 18:29:07','2023-07-29 18:29:07'),
(4170,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,518105.00,64200.00,'2023-07-29 19:21:01','2023-07-29 19:21:01'),
(4171,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,518315.00,64200.00,'2023-07-30 08:35:04','2023-07-30 08:35:04'),
(4176,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,202554.65,35990.00,'2023-07-30 18:30:09','2023-07-30 18:30:09'),
(4178,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,521815.00,64200.00,'2023-07-30 19:21:02','2023-07-30 19:21:02'),
(4179,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,522025.00,64200.00,'2023-07-31 08:36:03','2023-07-31 08:36:03'),
(4184,286,321,2,170,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',142.50,203512.30,35990.00,'2023-07-31 18:31:07','2023-07-31 18:31:07'),
(4186,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,525525.00,64200.00,'2023-07-31 19:21:02','2023-07-31 19:21:02'),
(4187,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,525735.00,64200.00,'2023-08-01 08:36:03','2023-08-01 08:36:03'),
(4193,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,529235.00,64200.00,'2023-08-01 19:21:02','2023-08-01 19:21:02'),
(4194,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,529445.00,64200.00,'2023-08-02 08:37:04','2023-08-02 08:37:04'),
(4199,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,532945.00,64200.00,'2023-08-02 19:21:02','2023-08-02 19:21:02'),
(4200,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,533155.00,64200.00,'2023-08-03 08:38:07','2023-08-03 08:38:07'),
(4205,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,536655.00,64200.00,'2023-08-03 19:22:02','2023-08-03 19:22:02'),
(4206,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,536865.00,64200.00,'2023-08-04 08:39:04','2023-08-04 08:39:04'),
(4210,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,540365.00,64200.00,'2023-08-04 19:22:03','2023-08-04 19:22:03'),
(4211,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,540575.00,64200.00,'2023-08-05 08:40:02','2023-08-05 08:40:02'),
(4215,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,544075.00,64200.00,'2023-08-05 19:23:01','2023-08-05 19:23:01'),
(4216,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,544285.00,64200.00,'2023-08-06 08:40:08','2023-08-06 08:40:08'),
(4219,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,547785.00,64200.00,'2023-08-06 19:23:03','2023-08-06 19:23:03'),
(4220,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,547995.00,64200.00,'2023-08-07 08:41:02','2023-08-07 08:41:02'),
(4223,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,551495.00,64200.00,'2023-08-07 19:24:02','2023-08-07 19:24:02'),
(4224,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,551705.00,64200.00,'2023-08-08 08:41:02','2023-08-08 08:41:02'),
(4227,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,555205.00,64200.00,'2023-08-08 19:24:02','2023-08-08 19:24:02'),
(4228,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,555415.00,64200.00,'2023-08-09 08:41:02','2023-08-09 08:41:02'),
(4231,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,558915.00,64200.00,'2023-08-09 19:24:02','2023-08-09 19:24:02'),
(4232,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,559125.00,64200.00,'2023-08-10 08:41:02','2023-08-10 08:41:02'),
(4235,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,562625.00,64200.00,'2023-08-10 19:24:02','2023-08-10 19:24:02'),
(4236,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,562835.00,64200.00,'2023-08-11 08:41:02','2023-08-11 08:41:02'),
(4239,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,566335.00,64200.00,'2023-08-11 19:24:02','2023-08-11 19:24:02'),
(4240,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,566545.00,64200.00,'2023-08-12 08:42:03','2023-08-12 08:42:03'),
(4243,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,570045.00,64200.00,'2023-08-12 19:24:04','2023-08-12 19:24:04'),
(4244,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,570255.00,64200.00,'2023-08-13 08:42:03','2023-08-13 08:42:03'),
(4247,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,573755.00,64200.00,'2023-08-13 19:25:02','2023-08-13 19:25:02'),
(4248,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,573965.00,64200.00,'2023-08-14 08:43:02','2023-08-14 08:43:02'),
(4251,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,577465.00,64200.00,'2023-08-14 19:25:03','2023-08-14 19:25:03'),
(4252,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,577675.00,64200.00,'2023-08-15 08:43:02','2023-08-15 08:43:02'),
(4255,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,581175.00,64200.00,'2023-08-15 19:25:03','2023-08-15 19:25:03'),
(4256,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,581385.00,64200.00,'2023-08-16 08:43:02','2023-08-16 08:43:02'),
(4259,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,584885.00,64200.00,'2023-08-16 19:26:02','2023-08-16 19:26:02'),
(4260,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,585095.00,64200.00,'2023-08-17 08:44:01','2023-08-17 08:44:01'),
(4263,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,588595.00,64200.00,'2023-08-17 19:26:03','2023-08-17 19:26:03'),
(4264,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,588805.00,64200.00,'2023-08-18 08:44:03','2023-08-18 08:44:03'),
(4267,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,592305.00,64200.00,'2023-08-18 19:27:02','2023-08-18 19:27:02'),
(4268,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,592515.00,64200.00,'2023-08-19 08:45:03','2023-08-19 08:45:03'),
(4271,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,596015.00,64200.00,'2023-08-19 19:27:02','2023-08-19 19:27:02'),
(4272,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,596225.00,64200.00,'2023-08-20 08:46:02','2023-08-20 08:46:02'),
(4275,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,599725.00,64200.00,'2023-08-20 19:27:02','2023-08-20 19:27:02'),
(4276,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,599935.00,64200.00,'2023-08-21 08:46:02','2023-08-21 08:46:02'),
(4279,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,603435.00,64200.00,'2023-08-21 19:27:02','2023-08-21 19:27:02'),
(4280,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,603645.00,64200.00,'2023-08-22 08:47:02','2023-08-22 08:47:02'),
(4283,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,607145.00,64200.00,'2023-08-22 19:27:02','2023-08-22 19:27:02'),
(4284,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,607355.00,64200.00,'2023-08-23 08:47:02','2023-08-23 08:47:02'),
(4287,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,610855.00,64200.00,'2023-08-23 19:27:02','2023-08-23 19:27:02'),
(4288,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,611065.00,64200.00,'2023-08-24 08:47:02','2023-08-24 08:47:02'),
(4291,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,614565.00,64200.00,'2023-08-24 19:27:02','2023-08-24 19:27:02'),
(4292,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,614775.00,64200.00,'2023-08-25 08:47:02','2023-08-25 08:47:02'),
(4295,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,618275.00,64200.00,'2023-08-25 19:27:02','2023-08-25 19:27:02'),
(4296,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,618485.00,64200.00,'2023-08-26 08:47:02','2023-08-26 08:47:02'),
(4299,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,621985.00,64200.00,'2023-08-26 19:27:02','2023-08-26 19:27:02'),
(4300,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,622195.00,64200.00,'2023-08-27 08:47:03','2023-08-27 08:47:03'),
(4303,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,625695.00,64200.00,'2023-08-27 19:27:02','2023-08-27 19:27:02'),
(4304,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,625905.00,64200.00,'2023-08-28 08:48:02','2023-08-28 08:48:02'),
(4307,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,629405.00,64200.00,'2023-08-28 19:27:02','2023-08-28 19:27:02'),
(4308,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,629615.00,64200.00,'2023-08-29 08:48:02','2023-08-29 08:48:02'),
(4311,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,633115.00,64200.00,'2023-08-29 19:27:02','2023-08-29 19:27:02'),
(4312,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,633325.00,64200.00,'2023-08-30 08:48:03','2023-08-30 08:48:03'),
(4313,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,636825.00,64200.00,'2023-08-30 19:27:02','2023-08-30 19:27:02'),
(4314,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,637035.00,64200.00,'2023-08-31 08:49:02','2023-08-31 08:49:02'),
(4315,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,640535.00,64200.00,'2023-08-31 19:27:02','2023-08-31 19:27:02'),
(4316,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,640745.00,64200.00,'2023-09-01 08:49:02','2023-09-01 08:49:02'),
(4317,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,644245.00,64200.00,'2023-09-01 19:28:02','2023-09-01 19:28:02'),
(4318,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,644455.00,64200.00,'2023-09-02 08:50:02','2023-09-02 08:50:02'),
(4319,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,647955.00,64200.00,'2023-09-02 19:28:02','2023-09-02 19:28:02'),
(4320,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,648165.00,64200.00,'2023-09-03 08:50:02','2023-09-03 08:50:02'),
(4321,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,651665.00,64200.00,'2023-09-03 19:28:02','2023-09-03 19:28:02'),
(4322,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,651875.00,64200.00,'2023-09-04 08:50:03','2023-09-04 08:50:03'),
(4323,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,655375.00,64200.00,'2023-09-04 19:28:02','2023-09-04 19:28:02'),
(4324,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,655585.00,64200.00,'2023-09-05 08:51:02','2023-09-05 08:51:02'),
(4325,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,659085.00,64200.00,'2023-09-05 19:28:02','2023-09-05 19:28:02'),
(4326,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,659295.00,64200.00,'2023-09-06 08:51:02','2023-09-06 08:51:02'),
(4327,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,662795.00,64200.00,'2023-09-06 19:28:02','2023-09-06 19:28:02'),
(4328,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,663005.00,64200.00,'2023-09-07 08:51:02','2023-09-07 08:51:02'),
(4329,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,666505.00,64200.00,'2023-09-07 19:28:03','2023-09-07 19:28:03'),
(4330,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,666715.00,64200.00,'2023-09-08 08:51:02','2023-09-08 08:51:02'),
(4331,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,670215.00,64200.00,'2023-09-08 19:29:02','2023-09-08 19:29:02'),
(4332,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,670425.00,64200.00,'2023-09-09 08:51:03','2023-09-09 08:51:03'),
(4333,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,673925.00,64200.00,'2023-09-09 19:29:02','2023-09-09 19:29:02'),
(4334,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,674135.00,64200.00,'2023-09-10 08:52:02','2023-09-10 08:52:02'),
(4335,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,677635.00,64200.00,'2023-09-10 19:29:02','2023-09-10 19:29:02'),
(4336,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,677845.00,64200.00,'2023-09-11 08:52:02','2023-09-11 08:52:02'),
(4337,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,681345.00,64200.00,'2023-09-11 19:29:02','2023-09-11 19:29:02'),
(4338,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,681555.00,64200.00,'2023-09-12 08:52:03','2023-09-12 08:52:03'),
(4339,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,685055.00,64200.00,'2023-09-12 19:29:02','2023-09-12 19:29:02'),
(4340,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,685265.00,64200.00,'2023-09-13 08:52:03','2023-09-13 08:52:03'),
(4341,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,688765.00,64200.00,'2023-09-13 19:29:03','2023-09-13 19:29:03'),
(4342,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,688975.00,64200.00,'2023-09-14 08:52:03','2023-09-14 08:52:03'),
(4343,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,692475.00,64200.00,'2023-09-14 19:30:04','2023-09-14 19:30:04'),
(4344,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,692685.00,64200.00,'2023-09-15 08:53:01','2023-09-15 08:53:01'),
(4345,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,696185.00,64200.00,'2023-09-15 19:31:02','2023-09-15 19:31:02'),
(4346,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,696395.00,64200.00,'2023-09-16 08:53:02','2023-09-16 08:53:02'),
(4347,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,699895.00,64200.00,'2023-09-16 19:31:02','2023-09-16 19:31:02'),
(4348,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,700105.00,64200.00,'2023-09-17 08:53:02','2023-09-17 08:53:02'),
(4349,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,703605.00,64200.00,'2023-09-17 19:31:02','2023-09-17 19:31:02'),
(4350,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,703815.00,64200.00,'2023-09-18 08:53:02','2023-09-18 08:53:02'),
(4351,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,707315.00,64200.00,'2023-09-18 19:31:02','2023-09-18 19:31:02'),
(4352,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,707525.00,64200.00,'2023-09-19 08:53:02','2023-09-19 08:53:02'),
(4353,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,711025.00,64200.00,'2023-09-19 19:31:02','2023-09-19 19:31:02'),
(4354,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,711235.00,64200.00,'2023-09-20 08:53:02','2023-09-20 08:53:02'),
(4355,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,714735.00,64200.00,'2023-09-20 19:31:03','2023-09-20 19:31:03'),
(4356,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,714945.00,64200.00,'2023-09-21 08:53:03','2023-09-21 08:53:03'),
(4357,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,718445.00,64200.00,'2023-09-21 19:32:02','2023-09-21 19:32:02'),
(4359,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,718655.00,64200.00,'2023-09-22 08:54:02','2023-09-22 08:54:02'),
(4360,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,722155.00,64200.00,'2023-09-22 19:32:02','2023-09-22 19:32:02'),
(4361,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,525.00,7500.00,'2023-09-23 07:22:02','2023-09-23 07:22:02'),
(4363,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,722365.00,64200.00,'2023-09-23 08:54:03','2023-09-23 08:54:03'),
(4364,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,725865.00,64200.00,'2023-09-23 19:32:02','2023-09-23 19:32:02'),
(4365,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,1050.00,7500.00,'2023-09-24 07:22:02','2023-09-24 07:22:02'),
(4367,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,726075.00,64200.00,'2023-09-24 08:55:03','2023-09-24 08:55:03'),
(4368,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,729575.00,64200.00,'2023-09-24 19:32:02','2023-09-24 19:32:02'),
(4369,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,1575.00,7500.00,'2023-09-25 07:22:02','2023-09-25 07:22:02'),
(4371,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,729785.00,64200.00,'2023-09-25 08:55:03','2023-09-25 08:55:03'),
(4372,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,733285.00,64200.00,'2023-09-25 19:32:02','2023-09-25 19:32:02'),
(4373,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,2100.00,7500.00,'2023-09-26 07:22:03','2023-09-26 07:22:03'),
(4375,262,326,2,158,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',210.00,733495.00,64200.00,'2023-09-26 08:55:03','2023-09-26 08:55:03'),
(4376,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,741195.00,60000.00,'2023-09-26 19:32:02','2023-09-26 19:32:02'),
(4377,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,2625.00,7500.00,'2023-09-27 07:22:03','2023-09-27 07:22:03'),
(4379,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,744695.00,60000.00,'2023-09-27 19:32:02','2023-09-27 19:32:02'),
(4380,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,3150.00,7500.00,'2023-09-28 07:23:02','2023-09-28 07:23:02'),
(4382,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,748195.00,60000.00,'2023-09-28 19:32:02','2023-09-28 19:32:02'),
(4383,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,3675.00,7500.00,'2023-09-29 07:23:02','2023-09-29 07:23:02'),
(4385,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,751695.00,60000.00,'2023-09-29 19:32:02','2023-09-29 19:32:02'),
(4386,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,4200.00,7500.00,'2023-09-30 07:23:02','2023-09-30 07:23:02'),
(4388,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,755195.00,60000.00,'2023-09-30 19:32:02','2023-09-30 19:32:02'),
(4389,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,4725.00,7500.00,'2023-10-01 07:23:02','2023-10-01 07:23:02'),
(4391,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,220817.45,29995.00,'2023-10-01 09:36:03','2023-10-01 09:36:03'),
(4392,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,758695.00,60000.00,'2023-10-01 19:32:02','2023-10-01 19:32:02'),
(4393,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,5250.00,7500.00,'2023-10-02 07:23:02','2023-10-02 07:23:02'),
(4395,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,221412.45,29995.00,'2023-10-02 09:36:03','2023-10-02 09:36:03'),
(4396,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,762195.00,60000.00,'2023-10-02 19:32:03','2023-10-02 19:32:03'),
(4397,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,5775.00,7500.00,'2023-10-03 07:23:02','2023-10-03 07:23:02'),
(4399,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,222007.45,29995.00,'2023-10-03 09:37:02','2023-10-03 09:37:02'),
(4400,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,765695.00,60000.00,'2023-10-03 19:33:02','2023-10-03 19:33:02'),
(4401,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,6300.00,7500.00,'2023-10-04 07:23:02','2023-10-04 07:23:02'),
(4403,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,222602.45,29995.00,'2023-10-04 09:37:02','2023-10-04 09:37:02'),
(4404,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,769195.00,60000.00,'2023-10-04 19:33:03','2023-10-04 19:33:03'),
(4405,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,5525.00,7500.00,'2023-10-05 07:23:02','2023-10-05 07:23:02'),
(4407,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,223197.45,29995.00,'2023-10-05 09:37:03','2023-10-05 09:37:03'),
(4408,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,772695.00,60000.00,'2023-10-05 19:34:02','2023-10-05 19:34:02'),
(4409,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,6050.00,7500.00,'2023-10-06 07:23:03','2023-10-06 07:23:03'),
(4411,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,223792.45,29995.00,'2023-10-06 09:37:03','2023-10-06 09:37:03'),
(4412,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,776195.00,60000.00,'2023-10-06 19:34:02','2023-10-06 19:34:02'),
(4413,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,6575.00,7500.00,'2023-10-07 07:23:03','2023-10-07 07:23:03'),
(4415,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,224387.45,29995.00,'2023-10-07 09:38:03','2023-10-07 09:38:03'),
(4416,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,779695.00,60000.00,'2023-10-07 19:34:03','2023-10-07 19:34:03'),
(4417,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,7100.00,7500.00,'2023-10-08 07:24:02','2023-10-08 07:24:02'),
(4419,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,224982.45,29995.00,'2023-10-08 09:39:02','2023-10-08 09:39:02'),
(4420,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,783195.00,60000.00,'2023-10-08 19:34:03','2023-10-08 19:34:03'),
(4421,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,7625.00,7500.00,'2023-10-09 07:24:02','2023-10-09 07:24:02'),
(4423,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,225577.45,29995.00,'2023-10-09 09:39:02','2023-10-09 09:39:02'),
(4424,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,786695.00,60000.00,'2023-10-09 19:35:04','2023-10-09 19:35:04'),
(4425,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,8150.00,7500.00,'2023-10-10 07:24:02','2023-10-10 07:24:02'),
(4427,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,226172.45,29995.00,'2023-10-10 09:39:02','2023-10-10 09:39:02'),
(4428,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,790195.00,60000.00,'2023-10-10 19:36:03','2023-10-10 19:36:03'),
(4429,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,8675.00,7500.00,'2023-10-11 07:24:03','2023-10-11 07:24:03'),
(4431,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,226767.45,29995.00,'2023-10-11 09:39:02','2023-10-11 09:39:02'),
(4432,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,793695.00,60000.00,'2023-10-11 19:37:03','2023-10-11 19:37:03'),
(4433,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,9200.00,7500.00,'2023-10-12 07:25:03','2023-10-12 07:25:03'),
(4435,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,227362.45,29995.00,'2023-10-12 09:39:02','2023-10-12 09:39:02'),
(4436,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,797195.00,60000.00,'2023-10-12 19:38:03','2023-10-12 19:38:03'),
(4437,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,9725.00,7500.00,'2023-10-13 07:26:02','2023-10-13 07:26:02'),
(4439,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,227957.45,29995.00,'2023-10-13 09:39:02','2023-10-13 09:39:02'),
(4440,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,800695.00,60000.00,'2023-10-13 19:38:03','2023-10-13 19:38:03'),
(4441,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,10250.00,7500.00,'2023-10-14 07:26:02','2023-10-14 07:26:02'),
(4443,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,228552.45,29995.00,'2023-10-14 09:39:02','2023-10-14 09:39:02'),
(4444,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,804195.00,60000.00,'2023-10-14 19:38:03','2023-10-14 19:38:03'),
(4445,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,10775.00,7500.00,'2023-10-15 07:26:02','2023-10-15 07:26:02'),
(4447,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,229147.45,29995.00,'2023-10-15 09:39:02','2023-10-15 09:39:02'),
(4448,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,807695.00,60000.00,'2023-10-15 19:39:03','2023-10-15 19:39:03'),
(4449,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,11300.00,7500.00,'2023-10-16 07:26:02','2023-10-16 07:26:02'),
(4451,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,229742.45,29995.00,'2023-10-16 09:40:02','2023-10-16 09:40:02'),
(4452,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,811195.00,60000.00,'2023-10-16 19:40:03','2023-10-16 19:40:03'),
(4453,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,11825.00,7500.00,'2023-10-17 07:26:02','2023-10-17 07:26:02'),
(4455,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,230337.45,29995.00,'2023-10-17 09:40:03','2023-10-17 09:40:03'),
(4456,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,814695.00,60000.00,'2023-10-17 19:40:03','2023-10-17 19:40:03'),
(4457,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,12350.00,7500.00,'2023-10-18 07:26:02','2023-10-18 07:26:02'),
(4459,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,230932.45,29995.00,'2023-10-18 09:41:02','2023-10-18 09:41:02'),
(4460,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,818195.00,60000.00,'2023-10-18 19:41:02','2023-10-18 19:41:02'),
(4461,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,12875.00,7500.00,'2023-10-19 07:26:03','2023-10-19 07:26:03'),
(4463,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,231527.45,29995.00,'2023-10-19 09:41:02','2023-10-19 09:41:02'),
(4464,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,821695.00,60000.00,'2023-10-19 19:41:02','2023-10-19 19:41:02'),
(4465,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,13400.00,7500.00,'2023-10-20 07:26:03','2023-10-20 07:26:03'),
(4467,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,232122.45,29995.00,'2023-10-20 09:41:02','2023-10-20 09:41:02'),
(4468,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,825195.00,60000.00,'2023-10-20 19:41:02','2023-10-20 19:41:02'),
(4469,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,13925.00,7500.00,'2023-10-21 07:27:02','2023-10-21 07:27:02'),
(4471,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,232717.45,29995.00,'2023-10-21 09:41:02','2023-10-21 09:41:02'),
(4472,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,828695.00,60000.00,'2023-10-21 19:41:03','2023-10-21 19:41:03'),
(4473,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,14450.00,7500.00,'2023-10-22 07:27:02','2023-10-22 07:27:02'),
(4475,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,233312.45,29995.00,'2023-10-22 09:41:02','2023-10-22 09:41:02'),
(4476,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,832195.00,60000.00,'2023-10-22 19:42:02','2023-10-22 19:42:02'),
(4477,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,14975.00,7500.00,'2023-10-23 07:27:02','2023-10-23 07:27:02'),
(4479,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,233907.45,29995.00,'2023-10-23 09:41:03','2023-10-23 09:41:03'),
(4480,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,835695.00,60000.00,'2023-10-23 19:42:03','2023-10-23 19:42:03'),
(4481,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,15500.00,7500.00,'2023-10-24 07:27:04','2023-10-24 07:27:04'),
(4483,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,234502.45,29995.00,'2023-10-24 09:42:02','2023-10-24 09:42:02'),
(4484,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,839195.00,60000.00,'2023-10-24 19:43:02','2023-10-24 19:43:02'),
(4485,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,16025.00,7500.00,'2023-10-25 07:28:02','2023-10-25 07:28:02'),
(4487,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,235097.45,29995.00,'2023-10-25 09:42:02','2023-10-25 09:42:02'),
(4488,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,842695.00,60000.00,'2023-10-25 19:43:02','2023-10-25 19:43:02'),
(4489,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,16550.00,7500.00,'2023-10-26 07:28:02','2023-10-26 07:28:02'),
(4491,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,235692.45,29995.00,'2023-10-26 09:42:02','2023-10-26 09:42:02'),
(4492,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,846195.00,60000.00,'2023-10-26 19:43:03','2023-10-26 19:43:03'),
(4493,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,17075.00,7500.00,'2023-10-27 07:28:02','2023-10-27 07:28:02'),
(4495,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,236287.45,29995.00,'2023-10-27 09:42:02','2023-10-27 09:42:02'),
(4496,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,849695.00,60000.00,'2023-10-27 19:44:02','2023-10-27 19:44:02'),
(4497,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,17600.00,7500.00,'2023-10-28 07:28:03','2023-10-28 07:28:03'),
(4499,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,236882.45,29995.00,'2023-10-28 09:42:02','2023-10-28 09:42:02'),
(4500,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,853195.00,60000.00,'2023-10-28 19:44:02','2023-10-28 19:44:02'),
(4501,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,18125.00,7500.00,'2023-10-29 07:29:02','2023-10-29 07:29:02'),
(4503,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,237477.45,29995.00,'2023-10-29 09:42:02','2023-10-29 09:42:02'),
(4504,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,856695.00,60000.00,'2023-10-29 19:44:02','2023-10-29 19:44:02'),
(4505,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,18650.00,7500.00,'2023-10-30 07:29:02','2023-10-30 07:29:02'),
(4507,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,238072.45,29995.00,'2023-10-30 09:42:03','2023-10-30 09:42:03'),
(4508,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,860195.00,60000.00,'2023-10-30 19:44:02','2023-10-30 19:44:02'),
(4509,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,19175.00,7500.00,'2023-10-31 07:29:02','2023-10-31 07:29:02'),
(4511,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,238667.45,29995.00,'2023-10-31 09:43:02','2023-10-31 09:43:02'),
(4512,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,863695.00,60000.00,'2023-10-31 19:44:03','2023-10-31 19:44:03'),
(4513,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,19700.00,7500.00,'2023-11-01 07:29:02','2023-11-01 07:29:02'),
(4515,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,239262.45,29995.00,'2023-11-01 09:43:02','2023-11-01 09:43:02'),
(4516,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,867195.00,60000.00,'2023-11-01 19:45:02','2023-11-01 19:45:02'),
(4517,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,20225.00,7500.00,'2023-11-02 07:29:02','2023-11-02 07:29:02'),
(4519,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,239857.45,29995.00,'2023-11-02 09:43:03','2023-11-02 09:43:03'),
(4520,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,870695.00,60000.00,'2023-11-02 19:45:14','2023-11-02 19:45:14'),
(4521,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,20750.00,7500.00,'2023-11-03 07:29:02','2023-11-03 07:29:02'),
(4523,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,240452.45,29995.00,'2023-11-03 09:44:02','2023-11-03 09:44:02'),
(4524,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,874195.00,60000.00,'2023-11-03 19:46:03','2023-11-03 19:46:03'),
(4525,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,21275.00,7500.00,'2023-11-04 07:29:02','2023-11-04 07:29:02'),
(4527,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,241047.45,29995.00,'2023-11-04 09:44:02','2023-11-04 09:44:02'),
(4528,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,877695.00,60000.00,'2023-11-04 19:47:02','2023-11-04 19:47:02'),
(4529,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,20600.00,7500.00,'2023-11-05 07:29:02','2023-11-05 07:29:02'),
(4531,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,241642.45,29995.00,'2023-11-05 09:44:03','2023-11-05 09:44:03'),
(4532,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,881195.00,60000.00,'2023-11-05 19:47:03','2023-11-05 19:47:03'),
(4533,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,21125.00,7500.00,'2023-11-06 07:29:02','2023-11-06 07:29:02'),
(4535,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,242237.45,29995.00,'2023-11-06 09:45:02','2023-11-06 09:45:02'),
(4536,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,884695.00,60000.00,'2023-11-06 19:48:02','2023-11-06 19:48:02'),
(4537,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,21650.00,7500.00,'2023-11-07 07:29:03','2023-11-07 07:29:03'),
(4539,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,242832.45,29995.00,'2023-11-07 09:45:03','2023-11-07 09:45:03'),
(4540,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,888195.00,60000.00,'2023-11-07 19:48:03','2023-11-07 19:48:03'),
(4541,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,22175.00,7500.00,'2023-11-08 07:30:03','2023-11-08 07:30:03'),
(4543,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,243427.45,29995.00,'2023-11-08 09:46:02','2023-11-08 09:46:02'),
(4544,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,891695.00,60000.00,'2023-11-08 19:49:02','2023-11-08 19:49:02'),
(4545,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,22700.00,7500.00,'2023-11-09 07:30:04','2023-11-09 07:30:04'),
(4547,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,244022.45,29995.00,'2023-11-09 09:46:03','2023-11-09 09:46:03'),
(4548,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,895195.00,60000.00,'2023-11-09 19:49:02','2023-11-09 19:49:02'),
(4549,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,23225.00,7500.00,'2023-11-10 07:31:02','2023-11-10 07:31:02'),
(4551,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,244617.45,29995.00,'2023-11-10 09:47:02','2023-11-10 09:47:02'),
(4552,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,898695.00,60000.00,'2023-11-10 19:49:02','2023-11-10 19:49:02'),
(4553,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,23750.00,7500.00,'2023-11-11 07:31:02','2023-11-11 07:31:02'),
(4555,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,245212.45,29995.00,'2023-11-11 09:47:02','2023-11-11 09:47:02'),
(4556,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,902195.00,60000.00,'2023-11-11 19:49:02','2023-11-11 19:49:02'),
(4557,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,24275.00,7500.00,'2023-11-12 07:31:03','2023-11-12 07:31:03'),
(4559,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,245807.45,29995.00,'2023-11-12 09:47:02','2023-11-12 09:47:02'),
(4560,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,905695.00,60000.00,'2023-11-12 19:49:03','2023-11-12 19:49:03'),
(4561,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,24800.00,7500.00,'2023-11-13 07:32:02','2023-11-13 07:32:02'),
(4563,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,246402.45,29995.00,'2023-11-13 09:47:03','2023-11-13 09:47:03'),
(4564,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,909195.00,60000.00,'2023-11-13 19:50:02','2023-11-13 19:50:02'),
(4565,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,25325.00,7500.00,'2023-11-14 07:32:03','2023-11-14 07:32:03'),
(4567,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,246997.45,29995.00,'2023-11-14 09:48:03','2023-11-14 09:48:03'),
(4568,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,912695.00,60000.00,'2023-11-14 19:50:03','2023-11-14 19:50:03'),
(4569,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,25850.00,7500.00,'2023-11-15 07:33:02','2023-11-15 07:33:02'),
(4571,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,247592.45,29995.00,'2023-11-15 09:49:02','2023-11-15 09:49:02'),
(4572,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,916195.00,60000.00,'2023-11-15 19:50:03','2023-11-15 19:50:03'),
(4573,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,26375.00,7500.00,'2023-11-16 07:33:02','2023-11-16 07:33:02'),
(4575,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,248187.45,29995.00,'2023-11-16 09:49:02','2023-11-16 09:49:02'),
(4576,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,919695.00,60000.00,'2023-11-16 19:50:04','2023-11-16 19:50:04'),
(4577,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,26900.00,7500.00,'2023-11-17 07:33:02','2023-11-17 07:33:02'),
(4579,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,248782.45,29995.00,'2023-11-17 09:49:03','2023-11-17 09:49:03'),
(4580,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,923195.00,60000.00,'2023-11-17 19:51:02','2023-11-17 19:51:02'),
(4581,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,27425.00,7500.00,'2023-11-18 07:33:02','2023-11-18 07:33:02'),
(4583,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,249377.45,29995.00,'2023-11-18 09:49:03','2023-11-18 09:49:03'),
(4584,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,926695.00,60000.00,'2023-11-18 19:51:05','2023-11-18 19:51:05'),
(4585,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,27950.00,7500.00,'2023-11-19 07:33:02','2023-11-19 07:33:02'),
(4587,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,249972.45,29995.00,'2023-11-19 09:50:03','2023-11-19 09:50:03'),
(4588,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,930195.00,60000.00,'2023-11-19 19:52:03','2023-11-19 19:52:03'),
(4589,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,28475.00,7500.00,'2023-11-20 07:33:02','2023-11-20 07:33:02'),
(4591,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,250567.45,29995.00,'2023-11-20 09:50:03','2023-11-20 09:50:03'),
(4592,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,933695.00,60000.00,'2023-11-20 19:53:03','2023-11-20 19:53:03'),
(4593,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,29000.00,7500.00,'2023-11-21 07:33:03','2023-11-21 07:33:03'),
(4595,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,251162.45,29995.00,'2023-11-21 09:50:03','2023-11-21 09:50:03'),
(4596,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,937195.00,60000.00,'2023-11-21 19:54:02','2023-11-21 19:54:02'),
(4597,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,29525.00,7500.00,'2023-11-22 07:33:03','2023-11-22 07:33:03'),
(4599,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,251757.45,29995.00,'2023-11-22 09:50:03','2023-11-22 09:50:03'),
(4600,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,940695.00,60000.00,'2023-11-22 19:54:02','2023-11-22 19:54:02'),
(4601,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,30050.00,7500.00,'2023-11-23 07:33:03','2023-11-23 07:33:03'),
(4603,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,252352.45,29995.00,'2023-11-23 09:50:03','2023-11-23 09:50:03'),
(4604,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,944195.00,60000.00,'2023-11-23 19:54:02','2023-11-23 19:54:02'),
(4605,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,30575.00,7500.00,'2023-11-24 07:34:02','2023-11-24 07:34:02'),
(4607,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,252947.45,29995.00,'2023-11-24 09:50:04','2023-11-24 09:50:04'),
(4608,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,947695.00,60000.00,'2023-11-24 19:54:02','2023-11-24 19:54:02'),
(4609,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,31100.00,7500.00,'2023-11-25 07:34:03','2023-11-25 07:34:03'),
(4611,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,253542.45,29995.00,'2023-11-25 09:51:03','2023-11-25 09:51:03'),
(4612,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,951195.00,60000.00,'2023-11-25 19:54:03','2023-11-25 19:54:03'),
(4613,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,31625.00,7500.00,'2023-11-26 07:35:03','2023-11-26 07:35:03'),
(4615,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,254137.45,29995.00,'2023-11-26 09:52:02','2023-11-26 09:52:02'),
(4616,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,954695.00,60000.00,'2023-11-26 19:55:03','2023-11-26 19:55:03'),
(4617,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,32150.00,7500.00,'2023-11-27 07:35:03','2023-11-27 07:35:03'),
(4619,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,254732.45,29995.00,'2023-11-27 09:52:03','2023-11-27 09:52:03'),
(4620,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,958195.00,60000.00,'2023-11-27 19:55:03','2023-11-27 19:55:03'),
(4621,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,32675.00,7500.00,'2023-11-28 07:36:03','2023-11-28 07:36:03'),
(4623,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,255327.45,29995.00,'2023-11-28 09:52:03','2023-11-28 09:52:03'),
(4624,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,961695.00,60000.00,'2023-11-28 19:55:03','2023-11-28 19:55:03'),
(4625,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,33200.00,7500.00,'2023-11-29 07:36:03','2023-11-29 07:36:03'),
(4627,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,255922.45,29995.00,'2023-11-29 09:52:03','2023-11-29 09:52:03'),
(4628,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,965195.00,60000.00,'2023-11-29 19:56:02','2023-11-29 19:56:02'),
(4629,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,33725.00,7500.00,'2023-11-30 07:37:02','2023-11-30 07:37:02'),
(4631,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,256517.45,29995.00,'2023-11-30 09:53:02','2023-11-30 09:53:02'),
(4632,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,968695.00,60000.00,'2023-11-30 19:56:02','2023-11-30 19:56:02'),
(4633,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,34250.00,7500.00,'2023-12-01 07:37:02','2023-12-01 07:37:02'),
(4635,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,257112.45,29995.00,'2023-12-01 09:53:03','2023-12-01 09:53:03'),
(4636,262,322,3,158,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',3500.00,972195.00,60000.00,'2023-12-01 19:56:03','2023-12-01 19:56:03'),
(4637,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,34775.00,7500.00,'2023-12-02 07:37:02','2023-12-02 07:37:02'),
(4639,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,257707.45,29995.00,'2023-12-02 09:53:03','2023-12-02 09:53:03'),
(4640,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,35300.00,7500.00,'2023-12-03 07:37:02','2023-12-03 07:37:02'),
(4642,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,258302.45,29995.00,'2023-12-03 09:54:02','2023-12-03 09:54:02'),
(4643,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,35825.00,7500.00,'2023-12-04 07:37:03','2023-12-04 07:37:03'),
(4645,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,258897.45,29995.00,'2023-12-04 09:54:03','2023-12-04 09:54:03'),
(4646,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,36350.00,7500.00,'2023-12-05 07:38:02','2023-12-05 07:38:02'),
(4648,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,259492.45,29995.00,'2023-12-05 09:54:03','2023-12-05 09:54:03'),
(4649,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,36875.00,7500.00,'2023-12-06 07:38:03','2023-12-06 07:38:03'),
(4651,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,260087.45,29995.00,'2023-12-06 09:55:02','2023-12-06 09:55:02'),
(4652,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,37400.00,7500.00,'2023-12-07 07:38:03','2023-12-07 07:38:03'),
(4654,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,260682.45,29995.00,'2023-12-07 09:55:02','2023-12-07 09:55:02'),
(4655,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,37925.00,7500.00,'2023-12-08 07:39:02','2023-12-08 07:39:02'),
(4657,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,261277.45,29995.00,'2023-12-08 09:55:02','2023-12-08 09:55:02'),
(4658,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,38450.00,7500.00,'2023-12-09 07:39:03','2023-12-09 07:39:03'),
(4660,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,261872.45,29995.00,'2023-12-09 09:55:03','2023-12-09 09:55:03'),
(4661,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,38975.00,7500.00,'2023-12-10 07:40:03','2023-12-10 07:40:03'),
(4663,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,262467.45,29995.00,'2023-12-10 09:55:03','2023-12-10 09:55:03'),
(4664,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,39500.00,7500.00,'2023-12-11 07:40:03','2023-12-11 07:40:03'),
(4666,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,263062.45,29995.00,'2023-12-11 09:55:03','2023-12-11 09:55:03'),
(4667,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,40025.00,7500.00,'2023-12-12 07:40:03','2023-12-12 07:40:03'),
(4669,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,263657.45,29995.00,'2023-12-12 09:56:03','2023-12-12 09:56:03'),
(4670,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,40550.00,7500.00,'2023-12-13 07:40:03','2023-12-13 07:40:03'),
(4672,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,264252.45,29995.00,'2023-12-13 09:56:03','2023-12-13 09:56:03'),
(4673,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,41075.00,7500.00,'2023-12-14 07:40:03','2023-12-14 07:40:03'),
(4675,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,264847.45,29995.00,'2023-12-14 09:57:03','2023-12-14 09:57:03'),
(4676,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,41600.00,7500.00,'2023-12-15 07:40:04','2023-12-15 07:40:04'),
(4678,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,265442.45,29995.00,'2023-12-15 09:58:02','2023-12-15 09:58:02'),
(4679,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,42125.00,7500.00,'2023-12-16 07:40:04','2023-12-16 07:40:04'),
(4681,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,266037.45,29995.00,'2023-12-16 09:58:03','2023-12-16 09:58:03'),
(4682,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,42650.00,7500.00,'2023-12-17 07:41:02','2023-12-17 07:41:02'),
(4683,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,266632.45,29995.00,'2023-12-17 09:58:03','2023-12-17 09:58:03'),
(4684,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,43175.00,7500.00,'2023-12-18 07:41:03','2023-12-18 07:41:03'),
(4685,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,267227.45,29995.00,'2023-12-18 09:59:02','2023-12-18 09:59:02'),
(4686,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,43700.00,7500.00,'2023-12-19 07:42:03','2023-12-19 07:42:03'),
(4687,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,267822.45,29995.00,'2023-12-19 09:59:02','2023-12-19 09:59:02'),
(4688,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,44225.00,7500.00,'2023-12-20 07:42:03','2023-12-20 07:42:03'),
(4689,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,268417.45,29995.00,'2023-12-20 09:59:03','2023-12-20 09:59:03'),
(4690,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,44750.00,7500.00,'2023-12-21 07:42:03','2023-12-21 07:42:03'),
(4691,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,269012.45,29995.00,'2023-12-21 09:59:03','2023-12-21 09:59:03'),
(4692,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,45275.00,7500.00,'2023-12-22 07:42:04','2023-12-22 07:42:04'),
(4693,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,269607.45,29995.00,'2023-12-22 09:59:03','2023-12-22 09:59:03'),
(4694,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,45800.00,7500.00,'2023-12-23 07:43:03','2023-12-23 07:43:03'),
(4695,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,270202.45,29995.00,'2023-12-23 10:00:05','2023-12-23 10:00:05'),
(4696,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,46325.00,7500.00,'2023-12-24 07:44:03','2023-12-24 07:44:03'),
(4697,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,270797.45,29995.00,'2023-12-24 10:01:03','2023-12-24 10:01:03'),
(4698,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,46850.00,7500.00,'2023-12-25 07:44:03','2023-12-25 07:44:03'),
(4699,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,271392.45,29995.00,'2023-12-25 10:02:03','2023-12-25 10:02:03'),
(4700,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,47375.00,7500.00,'2023-12-26 07:44:03','2023-12-26 07:44:03'),
(4701,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,271987.45,29995.00,'2023-12-26 10:02:03','2023-12-26 10:02:03'),
(4702,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,47900.00,7500.00,'2023-12-27 07:45:03','2023-12-27 07:45:03'),
(4703,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,272582.45,29995.00,'2023-12-27 10:03:03','2023-12-27 10:03:03'),
(4704,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,48425.00,7500.00,'2023-12-28 07:45:04','2023-12-28 07:45:04'),
(4705,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,273177.45,29995.00,'2023-12-28 10:03:03','2023-12-28 10:03:03'),
(4706,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,48950.00,7500.00,'2023-12-29 07:45:04','2023-12-29 07:45:04'),
(4707,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,273772.45,29995.00,'2023-12-29 10:03:04','2023-12-29 10:03:04'),
(4708,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,49475.00,7500.00,'2023-12-30 07:45:04','2023-12-30 07:45:04'),
(4709,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,274367.45,29995.00,'2023-12-30 10:04:04','2023-12-30 10:04:04'),
(4710,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,50000.00,7500.00,'2023-12-31 07:45:04','2023-12-31 07:45:04'),
(4711,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,274962.45,29995.00,'2023-12-31 10:05:04','2023-12-31 10:05:04'),
(4712,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,50525.00,7500.00,'2024-01-01 07:46:03','2024-01-01 07:46:03'),
(4713,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,275557.45,29995.00,'2024-01-01 10:06:03','2024-01-01 10:06:03'),
(4714,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,51050.00,7500.00,'2024-01-02 07:46:04','2024-01-02 07:46:04'),
(4715,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,276152.45,29995.00,'2024-01-02 10:06:04','2024-01-02 10:06:04'),
(4716,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,51575.00,7500.00,'2024-01-03 07:47:02','2024-01-03 07:47:02'),
(4717,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,276747.45,29995.00,'2024-01-03 10:07:03','2024-01-03 10:07:03'),
(4718,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,52100.00,7500.00,'2024-01-04 07:47:03','2024-01-04 07:47:03'),
(4719,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,277342.45,29995.00,'2024-01-04 10:08:02','2024-01-04 10:08:02'),
(4720,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,52625.00,7500.00,'2024-01-05 07:48:02','2024-01-05 07:48:02'),
(4721,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,277937.45,29995.00,'2024-01-05 10:08:03','2024-01-05 10:08:03'),
(4722,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,53150.00,7500.00,'2024-01-06 07:48:02','2024-01-06 07:48:02'),
(4723,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,278532.45,29995.00,'2024-01-06 10:08:03','2024-01-06 10:08:03'),
(4724,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,53675.00,7500.00,'2024-01-07 07:48:02','2024-01-07 07:48:02'),
(4725,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,279127.45,29995.00,'2024-01-07 10:08:03','2024-01-07 10:08:03'),
(4726,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,54200.00,7500.00,'2024-01-08 07:48:02','2024-01-08 07:48:02'),
(4727,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,279722.45,29995.00,'2024-01-08 10:08:03','2024-01-08 10:08:03'),
(4728,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,54725.00,7500.00,'2024-01-09 07:48:03','2024-01-09 07:48:03'),
(4729,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,280317.45,29995.00,'2024-01-09 10:08:03','2024-01-09 10:08:03'),
(4730,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,55250.00,7500.00,'2024-01-10 07:48:03','2024-01-10 07:48:03'),
(4731,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,280912.45,29995.00,'2024-01-10 10:08:03','2024-01-10 10:08:03'),
(4732,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,55775.00,7500.00,'2024-01-11 07:48:03','2024-01-11 07:48:03'),
(4733,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,281507.45,29995.00,'2024-01-11 10:08:03','2024-01-11 10:08:03'),
(4734,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,56300.00,7500.00,'2024-01-12 07:48:03','2024-01-12 07:48:03'),
(4735,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,282102.45,29995.00,'2024-01-12 10:08:04','2024-01-12 10:08:04'),
(4736,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,56825.00,7500.00,'2024-01-13 07:48:03','2024-01-13 07:48:03'),
(4737,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,282697.45,29995.00,'2024-01-13 10:08:04','2024-01-13 10:08:04'),
(4738,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,57350.00,7500.00,'2024-01-14 07:48:03','2024-01-14 07:48:03'),
(4739,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,283292.45,29995.00,'2024-01-14 10:09:02','2024-01-14 10:09:02'),
(4740,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,57875.00,7500.00,'2024-01-15 07:48:03','2024-01-15 07:48:03'),
(4741,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,283887.45,29995.00,'2024-01-15 10:09:03','2024-01-15 10:09:03'),
(4742,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,58400.00,7500.00,'2024-01-16 07:48:03','2024-01-16 07:48:03'),
(4743,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,284482.45,29995.00,'2024-01-16 10:10:04','2024-01-16 10:10:04'),
(4744,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,58925.00,7500.00,'2024-01-17 07:49:03','2024-01-17 07:49:03'),
(4745,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,285077.45,29995.00,'2024-01-17 10:11:03','2024-01-17 10:11:03'),
(4746,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,59450.00,7500.00,'2024-01-18 07:49:03','2024-01-18 07:49:03'),
(4747,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,285672.45,29995.00,'2024-01-18 10:11:03','2024-01-18 10:11:03'),
(4748,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,59975.00,7500.00,'2024-01-19 07:50:03','2024-01-19 07:50:03'),
(4749,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,286267.45,29995.00,'2024-01-19 10:12:02','2024-01-19 10:12:02'),
(4750,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,60500.00,7500.00,'2024-01-20 07:50:03','2024-01-20 07:50:03'),
(4751,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,286862.45,29995.00,'2024-01-20 10:12:05','2024-01-20 10:12:05'),
(4752,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,61025.00,7500.00,'2024-01-21 07:50:03','2024-01-21 07:50:03'),
(4753,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,287457.45,29995.00,'2024-01-21 10:13:02','2024-01-21 10:13:02'),
(4754,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,2920.61,41723.00,'2024-01-21 13:27:02','2024-01-21 13:27:02'),
(4755,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,61550.00,7500.00,'2024-01-22 07:50:03','2024-01-22 07:50:03'),
(4756,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,288052.45,29995.00,'2024-01-22 10:13:03','2024-01-22 10:13:03'),
(4757,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,5841.22,41723.00,'2024-01-22 13:27:03','2024-01-22 13:27:03'),
(4758,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,62075.00,7500.00,'2024-01-23 07:50:03','2024-01-23 07:50:03'),
(4759,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,288647.45,29995.00,'2024-01-23 10:14:03','2024-01-23 10:14:03'),
(4760,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,8761.83,41723.00,'2024-01-23 13:27:03','2024-01-23 13:27:03'),
(4761,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,62600.00,7500.00,'2024-01-24 07:50:03','2024-01-24 07:50:03'),
(4762,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,289242.45,29995.00,'2024-01-24 10:14:03','2024-01-24 10:14:03'),
(4763,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,11682.44,41723.00,'2024-01-24 13:27:03','2024-01-24 13:27:03'),
(4764,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,63125.00,7500.00,'2024-01-25 07:50:04','2024-01-25 07:50:04'),
(4765,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,289837.45,29995.00,'2024-01-25 10:14:03','2024-01-25 10:14:03'),
(4766,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,14603.05,41723.00,'2024-01-25 13:28:02','2024-01-25 13:28:02'),
(4767,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,63650.00,7500.00,'2024-01-26 07:50:04','2024-01-26 07:50:04'),
(4768,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,290432.45,29995.00,'2024-01-26 10:14:09','2024-01-26 10:14:09'),
(4769,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,17523.66,41723.00,'2024-01-26 13:28:08','2024-01-26 13:28:08'),
(4770,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,64175.00,7500.00,'2024-01-27 07:50:04','2024-01-27 07:50:04'),
(4771,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,291027.45,29995.00,'2024-01-27 10:15:04','2024-01-27 10:15:04'),
(4772,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,20444.27,41723.00,'2024-01-27 13:29:04','2024-01-27 13:29:04'),
(4773,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,64700.00,7500.00,'2024-01-28 07:50:04','2024-01-28 07:50:04'),
(4774,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,291622.45,29995.00,'2024-01-28 10:15:04','2024-01-28 10:15:04'),
(4775,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,23364.88,41723.00,'2024-01-28 13:30:03','2024-01-28 13:30:03'),
(4776,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,65225.00,7500.00,'2024-01-29 07:51:02','2024-01-29 07:51:02'),
(4777,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,292217.45,29995.00,'2024-01-29 10:15:04','2024-01-29 10:15:04'),
(4778,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,26285.49,41723.00,'2024-01-29 13:30:04','2024-01-29 13:30:04'),
(4779,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,65750.00,7500.00,'2024-01-30 07:51:02','2024-01-30 07:51:02'),
(4780,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,292812.45,29995.00,'2024-01-30 10:16:03','2024-01-30 10:16:03'),
(4781,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,29206.10,41723.00,'2024-01-30 13:30:04','2024-01-30 13:30:04'),
(4782,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,66275.00,7500.00,'2024-01-31 07:51:03','2024-01-31 07:51:03'),
(4783,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,293407.45,29995.00,'2024-01-31 10:16:03','2024-01-31 10:16:03'),
(4784,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,32126.71,41723.00,'2024-01-31 13:31:03','2024-01-31 13:31:03'),
(4785,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,66800.00,7500.00,'2024-02-01 07:52:03','2024-02-01 07:52:03'),
(4786,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,294002.45,29995.00,'2024-02-01 10:16:03','2024-02-01 10:16:03'),
(4787,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,35047.32,41723.00,'2024-02-01 13:31:03','2024-02-01 13:31:03'),
(4788,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,67325.00,7500.00,'2024-02-02 07:52:03','2024-02-02 07:52:03'),
(4789,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,294597.45,29995.00,'2024-02-02 10:16:03','2024-02-02 10:16:03'),
(4790,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,37967.93,41723.00,'2024-02-02 13:31:05','2024-02-02 13:31:05'),
(4791,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,67850.00,7500.00,'2024-02-03 07:53:02','2024-02-03 07:53:02'),
(4792,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,295192.45,29995.00,'2024-02-03 10:16:03','2024-02-03 10:16:03'),
(4793,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,40888.54,41723.00,'2024-02-03 13:32:04','2024-02-03 13:32:04'),
(4794,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,68375.00,7500.00,'2024-02-04 07:53:03','2024-02-04 07:53:03'),
(4795,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,295787.45,29995.00,'2024-02-04 10:16:03','2024-02-04 10:16:03'),
(4796,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,43809.15,41723.00,'2024-02-04 13:33:02','2024-02-04 13:33:02'),
(4797,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,68900.00,7500.00,'2024-02-05 07:53:03','2024-02-05 07:53:03'),
(4798,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,296382.45,29995.00,'2024-02-05 10:16:03','2024-02-05 10:16:03'),
(4799,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,46729.76,41723.00,'2024-02-05 13:33:02','2024-02-05 13:33:02'),
(4800,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,69425.00,7500.00,'2024-02-06 07:53:03','2024-02-06 07:53:03'),
(4801,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,296977.45,29995.00,'2024-02-06 10:16:03','2024-02-06 10:16:03'),
(4802,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,49650.37,41723.00,'2024-02-06 13:33:03','2024-02-06 13:33:03'),
(4803,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,69950.00,7500.00,'2024-02-07 07:53:04','2024-02-07 07:53:04'),
(4804,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,297572.45,29995.00,'2024-02-07 10:16:04','2024-02-07 10:16:04'),
(4805,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,52570.98,41723.00,'2024-02-07 13:33:03','2024-02-07 13:33:03'),
(4806,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,70475.00,7500.00,'2024-02-08 07:54:03','2024-02-08 07:54:03'),
(4807,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,298167.45,29995.00,'2024-02-08 10:17:04','2024-02-08 10:17:04'),
(4808,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,55491.59,41723.00,'2024-02-08 13:33:03','2024-02-08 13:33:03'),
(4809,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,71000.00,7500.00,'2024-02-09 07:54:03','2024-02-09 07:54:03'),
(4810,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,298762.45,29995.00,'2024-02-09 10:17:04','2024-02-09 10:17:04'),
(4811,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,58412.20,41723.00,'2024-02-09 13:33:03','2024-02-09 13:33:03'),
(4812,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,71525.00,7500.00,'2024-02-10 07:55:03','2024-02-10 07:55:03'),
(4813,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,299357.45,29995.00,'2024-02-10 10:18:02','2024-02-10 10:18:02'),
(4814,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,61332.81,41723.00,'2024-02-10 13:33:04','2024-02-10 13:33:04'),
(4815,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,72050.00,7500.00,'2024-02-11 07:55:03','2024-02-11 07:55:03'),
(4816,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,299952.45,29995.00,'2024-02-11 10:18:03','2024-02-11 10:18:03'),
(4817,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,64253.42,41723.00,'2024-02-11 13:34:03','2024-02-11 13:34:03'),
(4818,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,72575.00,7500.00,'2024-02-12 07:55:03','2024-02-12 07:55:03'),
(4819,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,300547.45,29995.00,'2024-02-12 10:18:03','2024-02-12 10:18:03'),
(4820,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,67174.03,41723.00,'2024-02-12 13:35:03','2024-02-12 13:35:03'),
(4821,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,73100.00,7500.00,'2024-02-13 07:55:03','2024-02-13 07:55:03'),
(4822,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,301142.45,29995.00,'2024-02-13 10:18:03','2024-02-13 10:18:03'),
(4823,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,70094.64,41723.00,'2024-02-13 13:35:03','2024-02-13 13:35:03'),
(4824,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,73625.00,7500.00,'2024-02-14 07:55:04','2024-02-14 07:55:04'),
(4825,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,301737.45,29995.00,'2024-02-14 10:18:03','2024-02-14 10:18:03'),
(4826,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,73015.25,41723.00,'2024-02-14 13:35:04','2024-02-14 13:35:04'),
(4827,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,74150.00,7500.00,'2024-02-15 07:56:03','2024-02-15 07:56:03'),
(4828,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,302332.45,29995.00,'2024-02-15 10:18:03','2024-02-15 10:18:03'),
(4829,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,75935.86,41723.00,'2024-02-15 13:36:03','2024-02-15 13:36:03'),
(4830,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,74675.00,7500.00,'2024-02-16 07:56:03','2024-02-16 07:56:03'),
(4831,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,302927.45,29995.00,'2024-02-16 10:18:03','2024-02-16 10:18:03'),
(4832,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,78856.47,41723.00,'2024-02-16 13:37:03','2024-02-16 13:37:03'),
(4833,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,75200.00,7500.00,'2024-02-17 07:56:03','2024-02-17 07:56:03'),
(4834,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,303522.45,29995.00,'2024-02-17 10:18:03','2024-02-17 10:18:03'),
(4835,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,81777.08,41723.00,'2024-02-17 13:37:04','2024-02-17 13:37:04'),
(4836,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,75725.00,7500.00,'2024-02-18 07:57:02','2024-02-18 07:57:02'),
(4837,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,304117.45,29995.00,'2024-02-18 10:18:04','2024-02-18 10:18:04'),
(4838,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,84697.69,41723.00,'2024-02-18 13:38:03','2024-02-18 13:38:03'),
(4839,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,76250.00,7500.00,'2024-02-19 07:57:02','2024-02-19 07:57:02'),
(4840,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,304712.45,29995.00,'2024-02-19 10:19:03','2024-02-19 10:19:03'),
(4841,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,87618.30,41723.00,'2024-02-19 13:39:03','2024-02-19 13:39:03'),
(4842,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,76775.00,7500.00,'2024-02-20 07:57:03','2024-02-20 07:57:03'),
(4843,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,305307.45,29995.00,'2024-02-20 10:19:03','2024-02-20 10:19:03'),
(4844,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,90538.91,41723.00,'2024-02-20 13:40:03','2024-02-20 13:40:03'),
(4845,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,77300.00,7500.00,'2024-02-21 07:58:03','2024-02-21 07:58:03'),
(4846,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,305902.45,29995.00,'2024-02-21 10:20:02','2024-02-21 10:20:02'),
(4847,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,93459.52,41723.00,'2024-02-21 13:40:03','2024-02-21 13:40:03'),
(4848,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,77825.00,7500.00,'2024-02-22 07:58:03','2024-02-22 07:58:03'),
(4849,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,306497.45,29995.00,'2024-02-22 10:20:04','2024-02-22 10:20:04'),
(4850,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,96380.13,41723.00,'2024-02-22 13:40:03','2024-02-22 13:40:03'),
(4851,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,78350.00,7500.00,'2024-02-23 07:58:03','2024-02-23 07:58:03'),
(4852,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,307092.45,29995.00,'2024-02-23 10:21:03','2024-02-23 10:21:03'),
(4853,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,99300.74,41723.00,'2024-02-23 13:40:03','2024-02-23 13:40:03'),
(4854,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,78875.00,7500.00,'2024-02-24 07:59:02','2024-02-24 07:59:02'),
(4855,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,307687.45,29995.00,'2024-02-24 10:22:03','2024-02-24 10:22:03'),
(4856,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,102221.35,41723.00,'2024-02-24 13:40:03','2024-02-24 13:40:03'),
(4857,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,79400.00,7500.00,'2024-02-25 07:59:02','2024-02-25 07:59:02'),
(4858,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,308282.45,29995.00,'2024-02-25 10:23:02','2024-02-25 10:23:02'),
(4859,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,105141.96,41723.00,'2024-02-25 13:41:03','2024-02-25 13:41:03'),
(4860,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,79925.00,7500.00,'2024-02-26 07:59:02','2024-02-26 07:59:02'),
(4861,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,308877.45,29995.00,'2024-02-26 10:23:03','2024-02-26 10:23:03'),
(4862,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,108062.57,41723.00,'2024-02-26 13:42:03','2024-02-26 13:42:03'),
(4863,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,80450.00,7500.00,'2024-02-27 07:59:03','2024-02-27 07:59:03'),
(4864,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,309472.45,29995.00,'2024-02-27 10:23:03','2024-02-27 10:23:03'),
(4865,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,110983.18,41723.00,'2024-02-27 13:42:03','2024-02-27 13:42:03'),
(4866,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,80975.00,7500.00,'2024-02-28 07:59:03','2024-02-28 07:59:03'),
(4867,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,310067.45,29995.00,'2024-02-28 10:24:03','2024-02-28 10:24:03'),
(4868,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,113903.79,41723.00,'2024-02-28 13:42:03','2024-02-28 13:42:03'),
(4869,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,81500.00,7500.00,'2024-02-29 07:59:08','2024-02-29 07:59:08'),
(4870,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,310662.45,29995.00,'2024-02-29 10:25:03','2024-02-29 10:25:03'),
(4871,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,116824.40,41723.00,'2024-02-29 13:43:03','2024-02-29 13:43:03'),
(4872,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,82025.00,7500.00,'2024-03-01 08:00:03','2024-03-01 08:00:03'),
(4873,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,311257.45,29995.00,'2024-03-01 10:25:03','2024-03-01 10:25:03'),
(4874,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,119745.01,41723.00,'2024-03-01 13:43:03','2024-03-01 13:43:03'),
(4875,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,82550.00,7500.00,'2024-03-02 08:00:04','2024-03-02 08:00:04'),
(4876,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,311852.45,29995.00,'2024-03-02 10:25:03','2024-03-02 10:25:03'),
(4877,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,122665.62,41723.00,'2024-03-02 13:43:03','2024-03-02 13:43:03'),
(4878,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,83075.00,7500.00,'2024-03-03 08:00:04','2024-03-03 08:00:04'),
(4879,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,312447.45,29995.00,'2024-03-03 10:25:03','2024-03-03 10:25:03'),
(4880,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,125586.23,41723.00,'2024-03-03 13:44:03','2024-03-03 13:44:03'),
(4881,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,83600.00,7500.00,'2024-03-04 08:01:02','2024-03-04 08:01:02'),
(4882,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,313042.45,29995.00,'2024-03-04 10:26:02','2024-03-04 10:26:02'),
(4883,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,128506.84,41723.00,'2024-03-04 13:44:03','2024-03-04 13:44:03'),
(4884,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,84125.00,7500.00,'2024-03-05 08:01:03','2024-03-05 08:01:03'),
(4885,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,313637.45,29995.00,'2024-03-05 10:26:03','2024-03-05 10:26:03'),
(4886,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,131427.45,41723.00,'2024-03-05 13:45:03','2024-03-05 13:45:03'),
(4887,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,84650.00,7500.00,'2024-03-06 08:02:03','2024-03-06 08:02:03'),
(4888,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,314232.45,29995.00,'2024-03-06 10:26:03','2024-03-06 10:26:03'),
(4889,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,134348.06,41723.00,'2024-03-06 13:45:03','2024-03-06 13:45:03'),
(4890,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,85175.00,7500.00,'2024-03-07 08:03:02','2024-03-07 08:03:02'),
(4891,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,314827.45,29995.00,'2024-03-07 10:26:03','2024-03-07 10:26:03'),
(4892,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,137268.67,41723.00,'2024-03-07 13:46:02','2024-03-07 13:46:02'),
(4893,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,85700.00,7500.00,'2024-03-08 08:03:02','2024-03-08 08:03:02'),
(4894,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,315422.45,29995.00,'2024-03-08 10:27:02','2024-03-08 10:27:02'),
(4895,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,140189.28,41723.00,'2024-03-08 13:46:02','2024-03-08 13:46:02'),
(4896,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,86225.00,7500.00,'2024-03-09 08:03:03','2024-03-09 08:03:03'),
(4897,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,316017.45,29995.00,'2024-03-09 10:27:02','2024-03-09 10:27:02'),
(4898,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,143109.89,41723.00,'2024-03-09 13:46:02','2024-03-09 13:46:02'),
(4899,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,86750.00,7500.00,'2024-03-10 08:04:03','2024-03-10 08:04:03'),
(4900,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,316612.45,29995.00,'2024-03-10 10:27:03','2024-03-10 10:27:03'),
(4901,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,146030.50,41723.00,'2024-03-10 13:46:03','2024-03-10 13:46:03'),
(4902,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,87275.00,7500.00,'2024-03-11 08:05:02','2024-03-11 08:05:02'),
(4903,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,317207.45,29995.00,'2024-03-11 10:28:03','2024-03-11 10:28:03'),
(4904,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,148951.11,41723.00,'2024-03-11 13:46:03','2024-03-11 13:46:03'),
(4905,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,87800.00,7500.00,'2024-03-12 08:05:03','2024-03-12 08:05:03'),
(4906,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,317802.45,29995.00,'2024-03-12 10:28:03','2024-03-12 10:28:03'),
(4907,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,151871.72,41723.00,'2024-03-12 13:46:03','2024-03-12 13:46:03'),
(4908,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,88325.00,7500.00,'2024-03-13 08:05:04','2024-03-13 08:05:04'),
(4909,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,318397.45,29995.00,'2024-03-13 10:28:03','2024-03-13 10:28:03'),
(4910,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,154792.33,41723.00,'2024-03-13 13:46:03','2024-03-13 13:46:03'),
(4911,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,88850.00,7500.00,'2024-03-14 08:05:04','2024-03-14 08:05:04'),
(4912,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,318992.45,29995.00,'2024-03-14 10:28:03','2024-03-14 10:28:03'),
(4913,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,157712.94,41723.00,'2024-03-14 13:46:03','2024-03-14 13:46:03'),
(4914,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,89375.00,7500.00,'2024-03-15 08:05:04','2024-03-15 08:05:04'),
(4915,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,319587.45,29995.00,'2024-03-15 10:28:03','2024-03-15 10:28:03'),
(4916,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,160633.55,41723.00,'2024-03-15 13:46:03','2024-03-15 13:46:03'),
(4917,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,89900.00,7500.00,'2024-03-16 08:06:03','2024-03-16 08:06:03'),
(4918,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,320182.45,29995.00,'2024-03-16 10:28:04','2024-03-16 10:28:04'),
(4919,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,163554.16,41723.00,'2024-03-16 13:46:03','2024-03-16 13:46:03'),
(4920,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,90425.00,7500.00,'2024-03-17 08:06:03','2024-03-17 08:06:03'),
(4921,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,320777.45,29995.00,'2024-03-17 10:28:04','2024-03-17 10:28:04'),
(4922,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,166474.77,41723.00,'2024-03-17 13:46:03','2024-03-17 13:46:03'),
(4923,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,90950.00,7500.00,'2024-03-18 08:06:04','2024-03-18 08:06:04'),
(4924,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,321372.45,29995.00,'2024-03-18 10:28:04','2024-03-18 10:28:04'),
(4925,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,169395.38,41723.00,'2024-03-18 13:46:03','2024-03-18 13:46:03'),
(4926,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,91475.00,7500.00,'2024-03-19 08:06:04','2024-03-19 08:06:04'),
(4927,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,321967.45,29995.00,'2024-03-19 10:29:03','2024-03-19 10:29:03'),
(4928,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,172315.99,41723.00,'2024-03-19 13:46:04','2024-03-19 13:46:04'),
(4929,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,92000.00,7500.00,'2024-03-20 08:07:03','2024-03-20 08:07:03'),
(4930,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,322562.45,29995.00,'2024-03-20 10:29:03','2024-03-20 10:29:03'),
(4931,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,175236.60,41723.00,'2024-03-20 13:47:03','2024-03-20 13:47:03'),
(4932,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,92525.00,7500.00,'2024-03-21 08:07:03','2024-03-21 08:07:03'),
(4933,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,323157.45,29995.00,'2024-03-21 10:29:03','2024-03-21 10:29:03'),
(4934,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,178157.21,41723.00,'2024-03-21 13:47:03','2024-03-21 13:47:03'),
(4935,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,93050.00,7500.00,'2024-03-22 08:07:03','2024-03-22 08:07:03'),
(4936,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,323752.45,29995.00,'2024-03-22 10:29:03','2024-03-22 10:29:03'),
(4937,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,181077.82,41723.00,'2024-03-22 13:47:08','2024-03-22 13:47:08'),
(4938,304,328,3,179,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',525.00,93575.00,7500.00,'2024-03-23 08:07:03','2024-03-23 08:07:03'),
(4939,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,324347.45,29995.00,'2024-03-23 10:29:04','2024-03-23 10:29:04'),
(4940,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,183998.43,41723.00,'2024-03-23 13:48:03','2024-03-23 13:48:03'),
(4941,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,324942.45,29995.00,'2024-03-24 10:30:05','2024-03-24 10:30:05'),
(4942,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,186919.04,41723.00,'2024-03-24 13:48:03','2024-03-24 13:48:03'),
(4943,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,325537.45,29995.00,'2024-03-25 10:30:08','2024-03-25 10:30:08'),
(4944,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,189839.65,41723.00,'2024-03-25 13:48:04','2024-03-25 13:48:04'),
(4945,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,326132.45,29995.00,'2024-03-26 10:31:04','2024-03-26 10:31:04'),
(4946,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,192760.26,41723.00,'2024-03-26 13:49:03','2024-03-26 13:49:03'),
(4947,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,326727.45,29995.00,'2024-03-27 10:32:04','2024-03-27 10:32:04'),
(4948,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,195680.87,41723.00,'2024-03-27 13:49:03','2024-03-27 13:49:03'),
(4949,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,327322.45,29995.00,'2024-03-28 10:33:05','2024-03-28 10:33:05'),
(4950,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,198601.48,41723.00,'2024-03-28 13:49:03','2024-03-28 13:49:03'),
(4951,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,327917.45,29995.00,'2024-03-29 10:34:03','2024-03-29 10:34:03'),
(4952,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,201522.09,41723.00,'2024-03-29 13:49:04','2024-03-29 13:49:04'),
(4953,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,328512.45,29995.00,'2024-03-30 10:34:03','2024-03-30 10:34:03'),
(4954,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,204442.70,41723.00,'2024-03-30 15:34:03','2024-03-30 15:34:03'),
(4955,286,329,3,170,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',595.00,329107.45,29995.00,'2024-03-31 10:34:03','2024-03-31 10:34:03'),
(4956,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,207363.31,41723.00,'2024-03-31 15:34:03','2024-03-31 15:34:03'),
(4957,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,210283.92,41723.00,'2024-04-01 15:34:03','2024-04-01 15:34:03'),
(4958,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,213204.53,41723.00,'2024-04-02 15:34:03','2024-04-02 15:34:03'),
(4959,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,216125.14,41723.00,'2024-04-03 15:34:03','2024-04-03 15:34:03'),
(4960,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,219045.75,41723.00,'2024-04-04 15:34:03','2024-04-04 15:34:03'),
(4961,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,221966.36,41723.00,'2024-04-05 15:34:03','2024-04-05 15:34:03'),
(4962,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,224886.97,41723.00,'2024-04-06 15:35:04','2024-04-06 15:35:04'),
(4963,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,227807.58,41723.00,'2024-04-07 15:36:03','2024-04-07 15:36:03'),
(4964,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,230728.19,41723.00,'2024-04-08 15:36:03','2024-04-08 15:36:03'),
(4965,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,233648.80,41723.00,'2024-04-09 15:36:03','2024-04-09 15:36:03'),
(4966,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,236569.41,41723.00,'2024-04-10 15:36:03','2024-04-10 15:36:03'),
(4967,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,239490.02,41723.00,'2024-04-11 15:36:03','2024-04-11 15:36:03'),
(4968,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,242410.63,41723.00,'2024-04-12 15:36:03','2024-04-12 15:36:03'),
(4969,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,245331.24,41723.00,'2024-04-13 15:36:03','2024-04-13 15:36:03'),
(4970,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,248251.85,41723.00,'2024-04-14 15:37:02','2024-04-14 15:37:02'),
(4971,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,251172.46,41723.00,'2024-04-15 15:37:03','2024-04-15 15:37:03'),
(4972,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,254093.07,41723.00,'2024-04-16 15:37:03','2024-04-16 15:37:03'),
(4973,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,257013.68,41723.00,'2024-04-17 15:37:04','2024-04-17 15:37:04'),
(4974,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,259934.29,41723.00,'2024-04-18 15:38:02','2024-04-18 15:38:02'),
(4975,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,262854.90,41723.00,'2024-04-19 15:38:03','2024-04-19 15:38:03'),
(4976,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,265775.51,41723.00,'2024-04-20 15:38:03','2024-04-20 15:38:03'),
(4977,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,268696.12,41723.00,'2024-04-21 15:38:03','2024-04-21 15:38:03'),
(4978,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,271616.73,41723.00,'2024-04-22 15:39:02','2024-04-22 15:39:02'),
(4979,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,274537.34,41723.00,'2024-04-23 15:39:02','2024-04-23 15:39:02'),
(4980,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,277457.95,41723.00,'2024-04-24 15:39:03','2024-04-24 15:39:03'),
(4981,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,280378.56,41723.00,'2024-04-25 15:39:03','2024-04-25 15:39:03'),
(4982,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,283299.17,41723.00,'2024-04-26 15:40:03','2024-04-26 15:40:03'),
(4983,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,286219.78,41723.00,'2024-04-27 15:40:03','2024-04-27 15:40:03'),
(4984,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,289140.39,41723.00,'2024-04-28 15:40:03','2024-04-28 15:40:03'),
(4985,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,292061.00,41723.00,'2024-04-29 15:41:02','2024-04-29 15:41:02'),
(4986,317,330,3,180,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',2920.61,294981.61,41723.00,'2024-04-30 15:41:03','2024-04-30 15:41:03');
/*!40000 ALTER TABLE `profit_cron_jobs` ENABLE KEYS */;

--
-- Table structure for table `referrers_interest_relationships`
--

DROP TABLE IF EXISTS `referrers_interest_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrers_interest_relationships` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `interest_receiver_id` bigint(20) unsigned NOT NULL,
  `depositor_id` bigint(20) unsigned NOT NULL,
  `deposit_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referrers_interest_relationships_interest_receiver_id_foreign` (`interest_receiver_id`),
  KEY `referrers_interest_relationships_depositor_id_foreign` (`depositor_id`),
  KEY `referrers_interest_relationships_deposit_id_foreign` (`deposit_id`),
  CONSTRAINT `referrers_interest_relationships_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `deposits` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referrers_interest_relationships_depositor_id_foreign` FOREIGN KEY (`depositor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referrers_interest_relationships_interest_receiver_id_foreign` FOREIGN KEY (`interest_receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrers_interest_relationships`
--

/*!40000 ALTER TABLE `referrers_interest_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrers_interest_relationships` ENABLE KEYS */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` tinytext NOT NULL,
  `occupation` tinytext DEFAULT NULL,
  `review` varchar(255) NOT NULL DEFAULT 'An empty review',
  `plan` bigint(20) unsigned NOT NULL,
  `star` enum('5','4','3','2','1') NOT NULL DEFAULT '5',
  `active` enum('0','1') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FOREIGN KEY` (`plan`),
  CONSTRAINT `FOREIGN KEY` FOREIGN KEY (`plan`) REFERENCES `child_investment_plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES
(1,'Richard wales','Estate Manager','kjkhkkkkkkkkkkk',1,'5','1','2021-12-27 10:19:52','2021-12-27 10:19:52',NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `site_address` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_about_us` longtext DEFAULT NULL,
  `terms_and_conditions` longtext DEFAULT NULL,
  `privacy_and_policy` longtext DEFAULT NULL,
  `how_it_works` longtext DEFAULT NULL,
  `meet_our_traders` longtext DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `social_handles_active` tinyint(1) NOT NULL DEFAULT 0,
  `site_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `visit_count` decimal(8,2) NOT NULL DEFAULT 0.00,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES
(1,'12608292018','US America','FocalTrading ','','<b>Who are we....!?</b><p></p><p><b><b>&nbsp;We\'re premium Assets limited Company.</b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b><b>Premium Assets limited Company is among few legitimate and certified trading companies, with licence code 8365561.&nbsp;</b></b></b></b></b></b></b></b></b></p><p></p><p></p><p><b><b><b><b><b><b>Our&nbsp;</b></b></b></b></b><b><b><b><b><b>high exceptional trading standards, has given us a topnotch positioning the trading sector for the past 4 year\'s and counting.</b></b></b></b></b></b></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b>Premium Assets limited Company is in partnership with Cyrus security and Exchange Commission, with CIF license number of 187/12.</b></b></b></b></b></b></b></b></p><p></p><p></p><p><br></p><p><span style=\"color: rgb(181, 181, 181); font-family: &quot;Source Sans Pro&quot;; text-align: center;\"><br></span></p><p></p><p></p><p></p><p><b><b><b><b><b><b>Our main vision and objective are simplifying easier ways of benefitting from the financial sector at ease, with little or no stress required.</b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b><b><b>We deals on assets with likes of Stock Exchange Markets, Cryptocurrencies, Forex trading, Real Estate properties, Gold mining, in other to amass enough profits in regards to the sustainability of our investors daily interests allocations.</b></b></b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b>&nbsp;We encouraged multiple sources of income\'s diversification, in other to ensure consistency in payments to our valid clients which entrusted us with their assets.</b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b><b>Our trading team consists of highly analytical professional traders with year\'s of experience in trading sector, whom trades also with the help of artificial intelligences to enhance accuracy in as well as preventing losses in respect to our clients invested equities.</b></b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b>&nbsp;During our long trading history, we\'ve achieved numerous merits, occupied a stable position in the digital financial market, won confidence of tens of thousands investors from all over the world because of our transparency and accountability in payments.</b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b>We also made provisions for the availability of 24hrs customers live support, to ensure our investors satisfaction and to reply our clients in cases of any difficulty.</b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b>We\'re built on foundation of meeting our client\'s desires, to ensure their maximum satisfactions.</b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b><b>Our high standards can be verified by continuous daily inflows, in regards to numbers of long-standing clients.</b></b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b>Note: Premium Assets limited Company does not indulge or participate in advertisement of any such, our good works does the adverts for us because one good turn, deserves another.</b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b><b>Give us a trial today, then live the rest of your life testifying of our goodness.</b></b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p><b><b><b><b><b><b><b><b><i style=\"\"><b>Thanks for ch</b><b style=\"font-weight: bold;\">oosing Premium Assets limited Company©</b></i></b></b></b></b></b></b></b></b></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>','<p>Please read the following rules carefully before signing in.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>You agree to be of legal age in your country to partake in this program, and in all the cases your minimal age must be 18 years.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>FocalTrading is not available to the general public and is opened only to the qualified members of FocalTrading. The use of this site is restricted to our members and to individuals invited by them. Every deposit is considered to be a private transaction between FocalTrading  and its Members.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>As a private transaction, this program is exempt from the US Securities Act of 1933, the US Securities Exchange Act of 1934 and the US Investment Company Act of 1940 and all other rules, regulations and amendments thereof. We are not FDIC insured. We are not a licensed bank or a security firm.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>You agree that all information, communications, materials coming from FocalTrading  are unsolicited and must be kept private, confidential and protected from any disclosure. Moreover, the information, communications and materials contained herein are not to be regarded as an offer, nor a solicitation for investments in any jurisdiction which deems non-public offers or solicitations unlawful, nor to any person to whom it will be unlawful to make such offer or solicitation.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>All the data giving by a member to FocalTrading  will be only privately used and not disclosed to any third parties. FocalTrading  is not responsible or liable for any loss of data.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>You agree to hold all principals and members harmless of any liability. Your investment is secure with us and your profits are paid out when due. You agree that all information, communications and materials you will find on this site are intended to be regarded as an informational and educational matter and not an investment advice.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>We reserve the right to change the rules, commissions and rates of the program at any time and at our sole discretion without notice, especially in order to respect the integrity and security of the members\' interests. You agree that it is your sole responsibility to review the current terms.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>FocalTrading  is not responsible or liable for any damages, losses and costs resulting from any violation of the conditions and terms and/or use of our website by a member. You guarantee to FocalTrading  that you will not use this site in any illegal way and you agree to respect your local, national and international laws.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>Don\'t post bad vote on Public Forums and at Gold Rating Site without contacting the administrator of our program FIRST. Maybe there was a technical problem with your transaction, so please always CLEAR the thing with the administrator.</p><p><span style=\"font-size: 14px;\"><br></span></p><p>We will not tolerate SPAM or any type of UCE in this program. SPAM violators will be immediately and permanently removed from the program.</p><p><span style=\"font-size: 14px;\"><br></span></p><pfocaltrading reserves=\"\" the=\"\" right=\"\" to=\"\" accept=\"\" or=\"\" decline=\"\" any=\"\" member=\"\" for=\"\" membership=\"\" without=\"\" explanation.<=\"\" p=\"\"><p><span style=\"font-size: 14px;\"><br></span></p><p>If you do not agree with the above disclaimer, please do not go any further.</p></pfocaltrading>','It worrkss','<p><b>It\'s absolutely free to sign up with us, However, you\'ll be needing a registration link to achieve these.&nbsp;</b></p><p><b></p><p><b>As a client with us, it\'s advisable you study about our operations and services in other to gain clearer knowledge of our dealings.</b></p><p><b></p><p><b>Y</b><b>ou can as well grow your referral bonuses as an investor, by recommending our company to others using your referral link.&nbsp;</b></p><p><b></p><p><b>HOW DO I SIGN UP!?.........</b></p><p><b></p><p></b></p><p><b><b><b>* Click on menu bar at your upper left to create your company\'s crypto wallets.&nbsp;</b></b></b></p><p><b></p><p><b><b><b>NOTE: Kindly endeavour to fill in accurate wallets address during the creation of your company\'s crypto wallets, to avoid any loss of funds.</b></b></b></p><p><b></p><p><b><b><b>* Choose your preferred investment plan to migrate.</b></b></b></p><p><b></p><p><b><b><b>* Input your desired amount for investment.</b></b></b></p><p><b></p><p><b><b><b>* Select your preferred cr</b></b></b><b style=\"font-weight: bold;\">yptocurrency for transactions, we highly recommends Tether/Usdt(trc20) in regards to these because of its low transaction fee.</b></p><p><b style=\"font-weight: bold;\"></p><p><b><b><b><b>* Proceed to payments.&nbsp;</b></b></b></b></p><p><b></p><p><span style=\"font-weight: bolder;\"><span style=\"font-weight: bolder;\">* Copy our official wallet address.</span></p><p><span style=\"font-weight: bolder;\"><br></span></p><p><b><b><b><b>* Deposit the exact amount you requested.</b></b></b></b></p><p><b></p><p><b><b><b><b>&nbsp;* After depositions, contact our company\'s live support to ensure validation and authentication of your investments.&nbsp;&nbsp;</b></b></b></b></p>','\r\n\r\n','','','','','','','',0,'',NULL,'2024-05-01 09:07:04',67952.00,NULL);
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `transaction_hash` varchar(255) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES
(362,262,'2b575dba9287a27d8b4bbf792e3279d4f67a384793633b58fb',3000.00,'Litecoin','deposit','2022-07-08 10:01:27','2022-07-08 10:01:27',NULL),
(363,262,'33af253eed5c7f523403b93e72ecc9855e8e3245af6be14b55',300.00,'Litecoin','deposit','2022-07-13 11:50:06','2022-07-13 11:50:06',NULL),
(364,262,'6fb07010e61dde2938613c3cc9249ba53ae97f345602dc22a4',500.00,'Litecoin','withdrawal','2022-07-13 11:55:00','2022-07-13 11:55:00',NULL),
(365,262,'7319b3aabc313a1df0afc82c28855b3038527c1981d2b41c2b',650.00,'Litecoin','withdrawal','2022-07-14 10:08:20','2022-07-14 10:08:20',NULL),
(366,262,'84180ccc3af4b1e974e48fd453da8b833b1cca201077ead2bf',300.00,'Bitcoin','withdrawal','2022-07-16 01:41:39','2022-07-16 01:41:39',NULL),
(368,262,'3e734d86a59e330e7d36f700b0fa4e21b3a3c78b9233b1054e',23000.00,'Bitcoin','deposit','2022-07-28 10:26:14','2022-07-28 10:26:14',NULL),
(381,262,'9382a634c759dc7aa4524845333e31656cd9ee0424be9e10d6',7000.00,'Bitcoin','withdrawal','2022-08-17 17:04:59','2022-08-17 17:04:59',NULL),
(389,262,'12a55e4205a3906800b1e6f9290c938b78a9da60c48bc402f3',7000.00,'Bitcoin','withdrawal','2022-10-20 19:37:02','2022-10-20 19:37:02',NULL),
(390,262,'d7a71c794ba424bc6cc606e6b47cb7a3721e90501ac7c11c80',21000.00,'Bitcoin','deposit','2022-11-05 21:22:30','2022-11-05 21:22:30',NULL),
(391,286,'23a4545d7df4a575234e1e3f6847764b0dab41df141738a684',6645.00,'Bitcoin','deposit','2022-12-29 04:08:38','2022-12-29 04:08:38',NULL),
(392,262,'d344f420195669b673d56af752e46d221cf74e049c13c12a16',17000.00,'Bitcoin','withdrawal','2022-12-30 12:31:56','2022-12-30 12:31:56',NULL),
(395,286,'9c1ad76dd0fae825caebe45e9f2ebd87c61e9c7a1f12501f3a',5000.00,'Litecoin','deposit','2023-01-02 01:08:54','2023-01-02 01:08:54',NULL),
(396,286,'b624f1c8f994bb4769126de029066d21828fabffa747c13a48',1800.00,'Bitcoin','withdrawal','2023-01-02 17:16:51','2023-01-02 17:16:51',NULL),
(397,286,'ea65c8c9b8bdf679a76ad206fe75530ed5addc625369f65d6c',1325.00,'Bitcoin','withdrawal','2023-01-02 17:18:43','2023-01-02 17:18:43',NULL),
(398,286,'6dce6212116a8f36b44553515dcf1a7d74550a6d0c6b02b55f',3000.00,'Bitcoin','withdrawal','2023-01-04 06:52:29','2023-01-04 06:52:29',NULL),
(399,262,'a2c2727a306299611f0456598cc494f72b4ffed948fc31084f',2000.00,'Bitcoin','deposit','2023-01-04 09:59:25','2023-01-04 09:59:25',NULL),
(400,262,'0d87e982abf883e314f6806efb9a7587795268f4edfb5756a9',7000.00,'Bitcoin','withdrawal','2023-01-04 10:01:14','2023-01-04 10:01:14',NULL),
(401,286,'9790c59ecee09e3a411cbfa2e1a6457516ac52570478676522',3500.00,'Bitcoin','deposit','2023-01-09 15:37:40','2023-01-09 15:37:40',NULL),
(402,286,'571ba7b87a68f0d9ef3a1245bb4f6c04925ed284402b50ff81',3500.00,'Bitcoin','withdrawal','2023-01-09 16:30:01','2023-01-09 16:30:01',NULL),
(403,286,'b94898d4b8e820d56992aa6498de0568f0d6070da0361db0a5',5000.00,'Bitcoin','withdrawal','2023-01-14 05:28:27','2023-01-14 05:28:27',NULL),
(404,286,'9573c11071835a0396f6e72e6bad63cb2bd2735de22742c64f',5000.00,'Bitcoin','withdrawal','2023-01-14 05:28:38','2023-01-14 05:28:38',NULL),
(405,286,'b48b70b90d17c8879cdb02f3fa4e796101b8abaa0698d76613',2850.00,'Bitcoin','withdrawal','2023-01-20 23:55:32','2023-01-20 23:55:32',NULL),
(409,286,'08b66e048af20ff0266a83fca8b4447bddc12d6b4ced86a2ea',2850.00,'Bitcoin','deposit','2023-03-09 03:17:27','2023-03-09 03:17:27',NULL),
(410,286,'4f118b725e44fcaa8ffa71e3fe2e7659700bc6bbae2c917dda',10000.00,'Bitcoin','withdrawal','2023-03-09 03:29:03','2023-03-09 03:29:03',NULL),
(411,286,'6a598737a3dcc5c8e082d7c52e229cf98405769e1bfd54c75f',500.00,'Bitcoin','withdrawal','2023-03-17 03:58:22','2023-03-17 03:58:22',NULL),
(412,286,'9e4655d2bcfd2f8cd23a0c2fc09caaf364c16bb8f03c14e707',5000.00,'Bitcoin','withdrawal','2023-03-17 15:55:02','2023-03-17 15:55:02',NULL),
(413,286,'05e2f42b43466c29f7586a65cfa062181f66980e91b327bc19',50000.00,'Bitcoin','withdrawal','2023-03-19 02:20:45','2023-03-19 02:20:45',NULL),
(414,286,'190fee906cb94dd9a8ad407ba431bd9f3c838e3d3a5febdade',5000.00,'USDT','withdrawal','2023-05-11 02:12:24','2023-05-11 02:12:24',NULL),
(415,262,'37157d306bbd2488ade707e401451db0cb49c7328997c81f53',50000.00,'Bitcoin','deposit','2023-05-12 16:21:55','2023-05-12 16:21:55',NULL),
(416,262,'412d40d31230d8f1983663c1d4136a77c2a9ed1fb38b6dad5d',3250.00,'Bitcoin','withdrawal','2023-05-31 22:03:58','2023-05-31 22:03:58',NULL),
(420,262,'7810d130d91de6b6ac544ba92eaf5ebb0d583551de8750cdbb',4200.00,'Bitcoin','deposit','2023-06-06 08:01:45','2023-06-06 08:01:45',NULL),
(421,262,'c8b7830409c6f8fb8f90916dd37059c276820686a949abcc0f',4300.00,'Bitcoin','withdrawal','2023-06-08 07:13:03','2023-06-08 07:13:03',NULL),
(422,262,'809ef9c7eacd5f14cf1cf558037248be5b04931216da2e7a7c',7500.00,'Bitcoin','withdrawal','2023-06-08 14:43:01','2023-06-08 14:43:01',NULL),
(423,286,'182c9d2e957b174ca64119ef40af49720c21a42ffaefa91233',50000.00,'USDT','withdrawal','2023-06-14 19:11:30','2023-06-14 19:11:30',NULL),
(426,304,'68a001228738bdc3f327aa4d04728a46639dc8b66d9580dd10',7500.00,'Bitcoin','deposit','2023-09-22 07:20:54','2023-09-22 07:20:54',NULL),
(429,286,'9adfcbc40f102238544ebbcc7f59de6d4430997f5abf91e028',8500.00,'Bitcoin','deposit','2023-09-30 09:35:11','2023-09-30 09:35:11',NULL),
(430,304,'269373e4954d1e842624577915fe7a9ca910af91720aa7e175',1300.00,'Bitcoin','withdrawal','2023-10-04 12:19:57','2023-10-04 12:19:57',NULL),
(434,304,'ecc311dd1c2944616e69dfc36216125e081408ee35c432ec7c',1200.00,'Bitcoin','withdrawal','2023-11-04 11:53:07','2023-11-04 11:53:07',NULL),
(437,317,'85a4d8361dfc4e60c724607d1d1faee508ef19877788a99dc0',41723.00,'Bitcoin','deposit','2024-01-20 13:25:19','2024-01-20 13:25:19',NULL),
(438,317,'b05ccac09a8f53b493a15ebd4336ac518f88417979d5ad3581',1.00,'Ethereum','withdrawal','2024-01-22 12:08:43','2024-01-22 12:08:43',NULL),
(439,317,'7a80a818709d719b7f45ca6083f07c54d0ff6f798929a5aabe',2000.00,'Ethereum','withdrawal','2024-01-24 13:10:26','2024-01-24 13:10:26',NULL),
(442,317,'ac124016669e29fc295b98a01f662f11a69e4f1058e6e48b9f',2000.00,'Bitcoin','withdrawal','2024-04-29 10:30:20','2024-04-29 10:30:20',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

--
-- Table structure for table `user_wallets`
--

DROP TABLE IF EXISTS `user_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `main_wallet_id` bigint(20) unsigned NOT NULL,
  `currency_address` varchar(255) DEFAULT NULL,
  `memo_token` varchar(255) DEFAULT NULL,
  `has_memo` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wallets_user_id_foreign` (`user_id`),
  KEY `user_wallets_main_wallet_id_foreign` (`main_wallet_id`),
  CONSTRAINT `user_wallets_main_wallet_id_foreign` FOREIGN KEY (`main_wallet_id`) REFERENCES `main_wallets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wallets`
--

/*!40000 ALTER TABLE `user_wallets` DISABLE KEYS */;
INSERT INTO `user_wallets` VALUES
(152,262,26,'ltc1q6q4ksg9ezye55vwlghv8jl8ddjvvnsgdhe29gt',NULL,0,'2022-07-08 09:59:53','2022-07-08 09:59:53',NULL),
(158,262,24,'bc1q8yja3gw33ngd8aunmfr4hj820adc9nlsv0syvz',NULL,0,'2022-07-16 01:38:54','2022-07-16 01:38:54',NULL),
(169,286,26,'3An2iaCnB56aNaVyBEu2ErPDxtUAw9e7ff',NULL,0,'2023-01-02 01:06:50','2023-01-02 01:06:50','2023-01-01 18:38:51'),
(170,286,24,'1JUdwyFxR3E3Z5yEdJWzwnwfaDEMJcdUUK',NULL,0,'2023-01-02 17:14:14','2023-01-02 17:14:14',NULL),
(171,286,27,'bc1ql7sycmwlpusrz7sx33zvhvnzmsk4tpl0424gz8','Company wallet',1,'2023-01-20 23:56:52','2023-01-20 23:56:52',NULL),
(173,286,25,'bc1q5gta7wa5f7mxxf43nrxxfv86c3lxf8qmxwd0h5',NULL,0,'2023-03-17 03:58:03','2023-03-17 03:58:03',NULL),
(179,304,24,'bc1q8yja3gw33ngd8aunmfr4hj820adc9nlsv0syvz',NULL,0,'2023-09-22 07:20:05','2023-09-22 07:20:05',NULL),
(180,317,24,'bc1qewsucqxnv4mggefg2ahpxyzelgslhphxkr9n6r',NULL,0,'2024-01-20 13:24:15','2024-01-20 13:24:15',NULL),
(181,317,25,'0x12B131ec6665C86E4B1AE2371ba0257dcF56c02a',NULL,0,'2024-01-20 17:46:19','2024-01-20 17:46:19',NULL);
/*!40000 ALTER TABLE `user_wallets` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `permission` enum('1','2','3') NOT NULL,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `invested` tinyint(1) NOT NULL DEFAULT 0,
  `currently_invested` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(20,2) NOT NULL DEFAULT 0.00,
  `referrer` varchar(255) DEFAULT NULL,
  `deposit_balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `referral_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(200) DEFAULT NULL,
  `kyc` enum('verified','pending') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(258,'Fritz',1,'fritzdultimate@gmail.com','2022-07-05 15:50:16','$2y$10$Zut0oZZXIBL8EuizKMBjXuMD2W6L9.BNybkEBivnTa/eDCMI5JVuy','Chukwuemeka','Darlington','Nwosu',NULL,'1',0,0,0.00,0.00,NULL,1800.00,0.00,NULL,'2022-07-05 15:45:35','2023-05-10 14:36:03',NULL,'2c0f:f5c0:435:7d8:a49d:407:5d30:1709','pending'),
(261,'PremiumassetsAdmin',1,'premiumassetslimited@gmail.com','2022-07-07 01:52:03','$2y$10$Xl8MNn8j40fr0gSNEJ2/lOwSwl6AkmM.SLl0ZEhVe7oK4BxEaCo.a','Premium','Assets','Limited',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2022-07-07 01:46:01','2024-04-29 20:45:12',NULL,'102.90.65.98','pending'),
(262,'Sophielavoie',0,'sophielavoie258@gmail.com',NULL,'$2y$10$fGIheD75NWtLOGh148gvY.B6NxE1nZx/1dxQE2ZrsqbKhd3exTKbS','Sophie','Lara','Lavoie',NULL,'1',0,1,10000.00,47000.00,NULL,1022195.00,0.00,NULL,'2022-07-07 02:13:08','2023-12-01 19:56:04',NULL,'197.210.78.202','verified'),
(286,'Lizzym87',0,'lisbetmartinez39@gmail.com',NULL,'$2y$10$YzRwoPQlQ7JKQh88W/y.7eKhJOOGI.trF1JtspKsiH9GUcnOzSW7W','Lisbet','.','Martinez',NULL,'1',0,1,21495.00,500.00,NULL,337607.45,0.00,NULL,'2022-11-03 00:57:25','2024-03-31 10:34:04',NULL,'2601:582:c300:f230:b44f:5f02:23bf:b7e1','verified'),
(304,'Kristein',0,'kristeinkoster@gmail.com',NULL,'$2y$10$b3GEo/8eWMdKlHNQkt8vBe7Toto1aIMbqoZpku47rrlFgf2cpbyqG','Kristein','L','Koster',NULL,'1',0,1,0.00,2500.00,NULL,101075.00,0.00,NULL,'2023-09-22 07:17:45','2024-03-23 08:07:04',NULL,'197.210.55.123','verified'),
(313,'Callen',0,'kalenkavel@gmail.com','2023-12-17 10:19:21','$2y$10$ip/JD00Ru4.QD5lfGD9hIOvBlftJnbuiF0iadsOHo7mZXWANqKaQC','калиев','Calee','Каллибек',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2023-12-17 10:18:52','2023-12-17 10:20:08',NULL,'95.214.210.24','pending'),
(314,'Goulane',0,'jarlathgriffin5@gmail.com','2023-12-21 18:39:32','$2y$10$nBi6Bj6TYa0h0YOzJz07G.Oh3WxckJFieXz.ChA9lZk1DEUipbNhi','John','Jarlath','Griffin',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2023-12-21 18:38:31','2023-12-21 18:40:48',NULL,'64.43.50.91','pending'),
(315,'maha13',0,'lypulu@pelagius.net','2023-12-22 04:31:45','$2y$10$3OZrPtOhKrOts3RI.yLdsuTMM/oRtaFY26FxNdOJuqnunl1RXfTuO','asfrfsdf','sds','sparrow',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2023-12-22 04:31:35','2023-12-22 04:32:03',NULL,'2401:4900:1ce2:7885:35ba:e1e0:a2d6:3a88','pending'),
(316,'johnsew',0,'vayiga7342@visignal.com',NULL,'$2y$10$tikuG3nC722HqzDuNFLEFOe60lFg5xrpnqmxQ.e69fFV2oX1eAA7G','gokul','GHGRGF','jhdfsfjb',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2024-01-05 08:20:11','2024-01-05 08:20:31',NULL,'117.215.113.42','pending'),
(317,'KumarSingh',0,'obiajuluobiorah001@gmail.com',NULL,'$2y$10$vUwtHGNH7vwT5wS/QCPgCOhKUF68GdLo2l1UErldCnC9CoAyA5Q22','Kumar','Chetri','Singh',NULL,'1',0,1,41723.00,0.00,NULL,294981.61,0.00,NULL,'2024-01-20 09:42:39','2024-04-30 15:41:03',NULL,'197.210.226.226','verified'),
(319,'posobiep',0,'posobiep@traslex.com','2024-02-21 18:30:31','$2y$10$brbzzex851ImO/iKHHCW1eJMKL.oHXzFmnCQ2KJVppRyC5IyI.Xz.','posobiep','posobiep','posobiep',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2024-02-21 18:30:22','2024-02-21 18:36:58',NULL,'2400:8500:1801:401:118:27:3:102','verified'),
(320,'Syed',0,'yadhullayadhu.ys@gmail.com','2024-02-29 15:26:43','$2y$10$FFggx9tNmmjO3kLF5GDhrOdTtIriZ2rSaz9IEGce9OoWPBc4yztf6','Syed','Yadhu','Yadhu',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2024-02-29 15:26:30','2024-03-01 07:20:05',NULL,'2402:8100:2842:a368::ff8b:ecf1','verified'),
(321,'Ldjernigan',0,'kg4ntf@gmail.com','2024-04-13 16:56:22','$2y$10$r.vpA3q.4k6IIxc3dqMVium2VMS1U2tXFKpRR3o9YecxIY/6ApRKW','Larry','Dale','Jernigan',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2024-04-13 16:56:02','2024-04-29 20:48:44',NULL,'2600:1700:4842:a00:e4dc:595:1c5e:dc3b','pending'),
(322,'watcharin304',0,'2520watcharin@gmail.com','2024-05-01 07:32:06','$2y$10$g/LtE103/IHEFSUKOPgHuuGYF0QEeY8/sE1QjZk3fWJ8XByM8d/9q','Mr.','watcharin','wongwichai',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2024-05-01 07:30:44','2024-05-01 09:07:00',NULL,'159.192.33.49','pending'),
(323,'Eunice',0,'euniwong420@gmail.com',NULL,'$2y$10$lmZdIGNNGwxyPWPh1eNlGe4mXmsh6uwQeLKrvKqTbV0hI90BJ8Wc.','Eunice','D','Wong',NULL,'1',0,0,0.00,0.00,NULL,0.00,0.00,NULL,'2024-05-01 07:36:36','2024-05-01 08:11:14',NULL,'102.90.58.241','pending');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `withdraw_referral_bonuses`
--

DROP TABLE IF EXISTS `withdraw_referral_bonuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraw_referral_bonuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `transaction_hash` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('pending','accepted','denied') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `denied_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `withdraw_referral_bonuses_user_id_foreign` (`user_id`),
  CONSTRAINT `withdraw_referral_bonuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_referral_bonuses`
--

/*!40000 ALTER TABLE `withdraw_referral_bonuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_referral_bonuses` ENABLE KEYS */;

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `user_wallet_id` bigint(20) unsigned NOT NULL,
  `transaction_hash` varchar(255) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` enum('pending','accepted','denied') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `denied_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `withdrawals_user_id_foreign` (`user_id`),
  KEY `withdrawals_user_wallet_id_foreign` (`user_wallet_id`),
  CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `withdrawals_user_wallet_id_foreign` FOREIGN KEY (`user_wallet_id`) REFERENCES `user_wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawals`
--

/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
INSERT INTO `withdrawals` VALUES
(68,262,152,'6fb07010e61dde2938613c3cc9249ba53ae97f345602dc22a4',500.00,'denied','2022-07-13 11:55:00','2022-07-13 11:58:00',NULL,NULL,'2022-07-13 11:58:00'),
(69,262,152,'7319b3aabc313a1df0afc82c28855b3038527c1981d2b41c2b',650.00,'accepted','2022-07-14 10:08:20','2022-07-14 10:09:18',NULL,'2022-07-14 10:09:18',NULL),
(70,262,158,'84180ccc3af4b1e974e48fd453da8b833b1cca201077ead2bf',300.00,'accepted','2022-07-16 01:41:39','2022-07-16 01:42:33',NULL,'2022-07-16 01:42:33',NULL),
(71,262,158,'9382a634c759dc7aa4524845333e31656cd9ee0424be9e10d6',7000.00,'accepted','2022-08-17 17:04:59','2022-08-17 17:07:02',NULL,'2022-08-17 17:07:02',NULL),
(76,262,158,'12a55e4205a3906800b1e6f9290c938b78a9da60c48bc402f3',7000.00,'accepted','2022-10-20 19:37:02','2022-10-20 19:37:54',NULL,'2022-10-20 19:37:54',NULL),
(77,262,158,'d344f420195669b673d56af752e46d221cf74e049c13c12a16',17000.00,'accepted','2022-12-30 12:31:56','2022-12-30 12:35:02',NULL,'2022-12-30 12:35:02',NULL),
(79,286,170,'b624f1c8f994bb4769126de029066d21828fabffa747c13a48',1800.00,'denied','2023-01-02 17:16:51','2023-01-04 10:30:47',NULL,NULL,'2023-01-04 10:30:47'),
(80,286,170,'ea65c8c9b8bdf679a76ad206fe75530ed5addc625369f65d6c',1325.00,'denied','2023-01-02 17:18:43','2023-01-04 10:31:12',NULL,NULL,'2023-01-04 10:31:12'),
(81,286,170,'6dce6212116a8f36b44553515dcf1a7d74550a6d0c6b02b55f',3000.00,'denied','2023-01-04 06:52:29','2023-01-04 10:31:33',NULL,NULL,'2023-01-04 10:31:33'),
(82,262,158,'0d87e982abf883e314f6806efb9a7587795268f4edfb5756a9',7000.00,'denied','2023-01-04 10:01:14','2023-01-04 10:04:13',NULL,NULL,'2023-01-04 10:04:13'),
(83,286,170,'571ba7b87a68f0d9ef3a1245bb4f6c04925ed284402b50ff81',3500.00,'denied','2023-01-09 16:30:01','2023-01-09 17:16:33',NULL,NULL,'2023-01-09 17:16:33'),
(84,286,170,'b94898d4b8e820d56992aa6498de0568f0d6070da0361db0a5',5000.00,'denied','2023-01-14 05:28:27','2023-01-14 05:43:01',NULL,NULL,'2023-01-14 05:43:01'),
(85,286,170,'9573c11071835a0396f6e72e6bad63cb2bd2735de22742c64f',5000.00,'denied','2023-01-14 05:28:38','2023-01-14 05:43:20',NULL,NULL,'2023-01-14 05:43:20'),
(86,286,170,'b48b70b90d17c8879cdb02f3fa4e796101b8abaa0698d76613',2850.00,'denied','2023-01-20 23:55:32','2023-01-20 23:59:49',NULL,NULL,'2023-01-20 23:59:49'),
(89,286,170,'4f118b725e44fcaa8ffa71e3fe2e7659700bc6bbae2c917dda',10000.00,'denied','2023-03-09 03:29:03','2023-03-09 03:41:00',NULL,NULL,'2023-03-09 03:41:00'),
(90,286,170,'6a598737a3dcc5c8e082d7c52e229cf98405769e1bfd54c75f',500.00,'accepted','2023-03-17 03:58:22','2023-03-17 13:18:23',NULL,'2023-03-17 13:18:23',NULL),
(91,286,170,'9e4655d2bcfd2f8cd23a0c2fc09caaf364c16bb8f03c14e707',5000.00,'denied','2023-03-17 15:55:02','2023-03-17 22:34:36',NULL,NULL,'2023-03-17 22:34:36'),
(92,286,170,'05e2f42b43466c29f7586a65cfa062181f66980e91b327bc19',50000.00,'denied','2023-03-19 02:20:45','2023-03-19 15:00:41',NULL,NULL,'2023-03-19 15:00:41'),
(93,286,171,'190fee906cb94dd9a8ad407ba431bd9f3c838e3d3a5febdade',5000.00,'denied','2023-05-11 02:12:24','2023-05-11 05:29:58',NULL,NULL,'2023-05-11 05:29:58'),
(94,262,158,'412d40d31230d8f1983663c1d4136a77c2a9ed1fb38b6dad5d',3250.00,'accepted','2023-05-31 22:03:58','2023-05-31 22:04:38',NULL,'2023-05-31 22:04:38',NULL),
(95,262,158,'c8b7830409c6f8fb8f90916dd37059c276820686a949abcc0f',4300.00,'accepted','2023-06-08 07:13:03','2023-06-08 07:13:36',NULL,'2023-06-08 07:13:36',NULL),
(96,262,158,'809ef9c7eacd5f14cf1cf558037248be5b04931216da2e7a7c',7500.00,'accepted','2023-06-08 14:43:01','2023-06-08 14:43:27',NULL,'2023-06-08 14:43:27',NULL),
(97,286,171,'182c9d2e957b174ca64119ef40af49720c21a42ffaefa91233',50000.00,'denied','2023-06-14 19:11:30','2023-06-15 06:36:05',NULL,NULL,'2023-06-15 06:36:05'),
(101,304,179,'269373e4954d1e842624577915fe7a9ca910af91720aa7e175',1300.00,'accepted','2023-10-04 12:19:57','2023-10-04 12:20:39',NULL,'2023-10-04 12:20:39',NULL),
(105,304,179,'ecc311dd1c2944616e69dfc36216125e081408ee35c432ec7c',1200.00,'accepted','2023-11-04 11:53:07','2023-11-04 12:02:24',NULL,'2023-11-04 12:02:24',NULL),
(108,317,181,'b05ccac09a8f53b493a15ebd4336ac518f88417979d5ad3581',1.00,'denied','2024-01-22 12:08:43','2024-01-22 17:20:44',NULL,NULL,'2024-01-22 17:20:44'),
(109,317,181,'7a80a818709d719b7f45ca6083f07c54d0ff6f798929a5aabe',2000.00,'denied','2024-01-24 13:10:26','2024-01-24 14:04:37',NULL,NULL,'2024-01-24 14:04:37'),
(110,317,180,'ac124016669e29fc295b98a01f662f11a69e4f1058e6e48b9f',2000.00,'pending','2024-04-29 10:30:20','2024-04-29 10:30:20',NULL,NULL,NULL);
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;

--
-- Dumping routines for database 'u556442262_premium'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 19:07:39
