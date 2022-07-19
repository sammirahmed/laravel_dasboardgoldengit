-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: golden
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplans`
--

DROP TABLE IF EXISTS `airplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer` tinyint(1) DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplans`
--

LOCK TABLES `airplans` WRITE;
/*!40000 ALTER TABLE `airplans` DISABLE KEYS */;
INSERT INTO `airplans` VALUES (1,'jj',1,'jj','2022-06-21 14:10:23','2022-07-17 12:48:51');
/*!40000 ALTER TABLE `airplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_settings_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES (7,'date_format','l jS F Y (H:i:s)'),(8,'language','en'),(17,'is_human_date_format','1'),(18,'app_name','Golden LIfe'),(19,'app_short_description','Manage Mobile Application'),(20,'mail_driver','smtp'),(21,'mail_host','smtp.hostinger.com'),(22,'mail_port','587'),(23,'mail_username','fooddelivery@smartersvision.com'),(24,'mail_password',''),(25,'mail_encryption','ssl'),(26,'mail_from_address','fooddelivery@smartersvision.com'),(27,'mail_from_name','Smarter Vision'),(30,'timezone','America/Montserrat'),(32,'theme_contrast','light'),(33,'theme_color','primary'),(34,'app_logo','81001051-a6c1-4e5a-a6b6-d4910811806f'),(35,'nav_color','navbar-light bg-white'),(38,'logo_bg_color','bg-white'),(66,'default_role','admin'),(68,'facebook_app_id','518416208939727'),(69,'facebook_app_secret','93649810f78fa9ca0d48972fee2a75cd'),(71,'twitter_app_id','twitter'),(72,'twitter_app_secret','twitter 1'),(74,'google_app_id','527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),(75,'google_app_secret','FpIi8SLgc69ZWodk-xHaOrxn'),(77,'enable_google','1'),(78,'enable_facebook','1'),(93,'enable_stripe','1'),(94,'stripe_key','pk_test_pltzOnX3zsUZMoTTTVUL4O41'),(95,'stripe_secret','sk_test_o98VZx3RKDUytaokX4My3a20'),(101,'custom_field_models.0','App\\Models\\User'),(104,'default_tax','10'),(107,'default_currency','$'),(108,'fixed_header','0'),(109,'fixed_footer','0'),(110,'fcm_key','AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),(111,'enable_notifications','1'),(112,'paypal_username','sb-umxcu15246003_api1.business.example.com'),(113,'paypal_password','RAKW5DQUAAUXTYFS'),(114,'paypal_secret','AXjtA0a-nLFk5uwI5gLaRO6UX3VIAQv27HofPqmi873Wrx0Vr8MjeWUv'),(115,'enable_paypal','1'),(116,'main_color','#ea5c44'),(117,'main_dark_color','#ea5c44'),(118,'second_color','#344968'),(119,'second_dark_color','#ccccdd'),(120,'accent_color','#8c98a8'),(121,'accent_dark_color','#9999aa'),(122,'scaffold_dark_color','#2c2c2c'),(123,'scaffold_color','#fafafa'),(124,'google_maps_key','AIzaSyAT07iMlfZ9bJt1gmGj9KhJDLFY8srI6dA'),(125,'mobile_language','en'),(126,'app_version','2.5.0'),(127,'enable_version','1'),(128,'default_currency_id','1'),(129,'default_currency_code','USD'),(130,'default_currency_decimal_digits','2'),(131,'default_currency_rounding','0'),(132,'currency_right','0'),(133,'home_section_1','empty'),(134,'home_section_2','category'),(135,'home_section_3','onebyone'),(136,'home_section_4','offer'),(137,'home_section_5','sub'),(138,'home_section_6','sub'),(139,'home_section_7','sub'),(140,'home_section_8','empty'),(141,'home_section_9','onebyone'),(142,'home_section_10','empty'),(143,'home_section_11','empty'),(144,'home_section_12','category'),(145,'app_action1','bac702d2-e940-4630-8a4f-ec5da7c54fea'),(146,'app_action2','f7367619-1416-47b7-9d05-c3f60ebdca3e'),(147,'app_action11','http://192.168.1.32/storage/app/public/275/360_F_248397538_OsyBnjShqT7IRsCRIgVSkq5dSWbwRN0g.jpg'),(148,'app_action22','http://192.168.1.32/storage/app/public/271/%D9%A2%D9%A0%D9%A2%D9%A1%D9%A0%D9%A6%D9%A0%D9%A6_%D9%A1%D9%A9%D9%A0%D9%A4%D9%A2%D9%A9.jpg'),(149,'action_b_name','Refer a friend to SHARE'),(150,'action_b_sub','<p>Refer a friend to SHARE NOW and earn driving credit</p><p>link app : https://play.google.com/store/apps/details?id=com.hdvideodownloader.videodownloaderforfacebook&hl=None<br></p>'),(151,'files','0'),(152,'home_sectionh_1','8'),(153,'home_sectionh_2','4'),(154,'home_sectionh_3','4'),(155,'home_sectionh_4','4'),(156,'home_sectionh_5','4'),(157,'home_sectionh_6','4'),(158,'home_sectionh_7','4'),(159,'home_sectionh_8','4'),(160,'home_sectionh_9','12'),(161,'home_sectionh_10','4'),(162,'home_sectionh_11','4'),(163,'home_sectionh_12','4'),(164,'paypal_mode','0'),(165,'paypal_app_id','0');
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Pampers','<p><span style=\"caret-color: rgb(30, 100, 125); color: rgb(30, 100, 125); font-family: \"Harmonia Sans Std Regular\", Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: 0.05999999865889549px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Pampers is dedicated to every baby’s happy, healthy development. Learn more about us, our products and our commitment to you.</span></p>','2021-12-24 22:08:57','2021-12-24 22:15:08'),(3,'Fine فاين','<h4><span style=\"caret-color: rgb(116, 116, 116); color: rgb(116, 116, 116); font-family: Roboto; font-size: 15px; font-style: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Change your breathing, and the rest will follow! Breathing is one of the many things in life we take for granted (yes, another thing to add to your list) – we do it unconsciously every single second of our lives, and most people will tell you<span class=\"Apple-converted-space\"> <br></span></span></h4>','2021-12-24 22:29:42','2021-12-24 22:30:10'),(4,'Babyjoy',NULL,'2021-12-29 10:44:46','2021-12-29 10:44:46');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_product`
--

DROP TABLE IF EXISTS `camp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `camp_id` int unsigned NOT NULL,
  `quantity` int unsigned DEFAULT '0',
  `initquantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_product_camp_id_foreign` (`camp_id`),
  KEY `camp_product_product_id_foreign` (`product_id`),
  CONSTRAINT `camp_product_camp_id_foreign` FOREIGN KEY (`camp_id`) REFERENCES `campagins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `camp_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pruducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_product`
--

LOCK TABLES `camp_product` WRITE;
/*!40000 ALTER TABLE `camp_product` DISABLE KEYS */;
INSERT INTO `camp_product` VALUES (2,5,2,0,0,NULL,NULL),(6,6,4,0,0,NULL,NULL),(8,7,4,0,0,NULL,NULL),(9,4,3,0,0,NULL,NULL);
/*!40000 ALTER TABLE `camp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campagins`
--

DROP TABLE IF EXISTS `campagins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campagins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `show` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campagins`
--

LOCK TABLES `campagins` WRITE;
/*!40000 ALTER TABLE `campagins` DISABLE KEYS */;
INSERT INTO `campagins` VALUES (2,'عروض من بيبي جوي','تصفح الان قبل انتهاء العرض<br>',0,'2022-02-03 23:24:00','2022-02-06 20:55:31'),(3,'عروض من مولفيكس','<p>تخفيضات هائلة<br></p>',0,'2022-02-06 16:57:18','2022-02-06 20:54:20'),(4,'عروض من فاين','تخفيضات تصل ل ٥٠ ٪ للمزيد اضغط هنا<br>',0,'2022-02-06 17:18:41','2022-02-06 20:53:02');
/*!40000 ALTER TABLE `campagins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_extras`
--

DROP TABLE IF EXISTS `cart_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_extras` (
  `extra_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  PRIMARY KEY (`extra_id`,`cart_id`),
  KEY `cart_extras_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_extras_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_extras`
--

LOCK TABLES `cart_extras` WRITE;
/*!40000 ALTER TABLE `cart_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_food_id_foreign` (`food_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  CONSTRAINT `carts_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Drinks','Voluptas aut ut ipsum dignissimos. Repudiandae aut ullam consequatur enim quo. Quia iure aperiam voluptate adipisci. Minus repellendus tempore voluptatem dolorem voluptate quo similique. Ut porro dignissimos doloribus aut ad.','2021-07-04 11:40:03','2021-07-04 11:40:03'),(2,'Grains','Explicabo ex repellendus incidunt nulla deleniti cumque. Natus numquam omnis esse consequatur optio porro. Iusto accusantium dolores magnam suscipit autem consequatur quia. Ab quod vitae sunt eum. Mollitia a culpa molestiae et ipsum omnis.','2021-07-04 11:40:03','2021-07-04 11:40:03'),(3,'Drinks','Modi debitis velit fuga facilis qui distinctio. Eos a eum magnam aut omnis. Sit sit et aliquam praesentium eum voluptas. Sit aut mollitia qui soluta consequatur. Aut quia ut consequatur optio fugiat vel similique et.','2021-07-04 11:40:03','2021-07-04 11:40:03'),(4,'Protein','Fuga voluptatem architecto ad accusantium voluptatem veritatis porro. Rerum quia odit fugit. Eos culpa similique odio occaecati. Suscipit quaerat est dolor aut et enim natus. Temporibus voluptatem voluptates nisi autem minima in quisquam.','2021-07-04 11:40:03','2021-07-04 11:40:03'),(5,'Sandwiches','Sed saepe eaque suscipit exercitationem et aut itaque. Rerum explicabo quia aut ut consectetur voluptatibus. Ut velit quo a perferendis molestias non. Et fugit qui qui sit natus aut omnis. Quia vitae rerum esse sint.','2021-07-04 11:40:03','2021-07-04 11:40:03'),(6,'Vegetables','Rem iste nisi soluta in eos cupiditate optio ex. Consequatur incidunt nihil ratione rem ut. Voluptatem laboriosam iste quaerat totam. Exercitationem consequuntur eum dolores. Veniam molestiae aut rem id amet quaerat.','2021-07-04 11:40:03','2021-07-04 11:40:03');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `oneuse` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'AC5',100.00,'percent','<p>kkkkk<br></p>','2022-07-29 00:00:00',1,0,'2022-07-04 13:52:31','2022-07-04 13:52:31'),(2,'AC53',50.00,'percent',NULL,'2022-07-24 00:00:00',1,0,'2022-07-14 21:31:11','2022-07-14 21:31:11');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisines`
--

DROP TABLE IF EXISTS `cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisines`
--

LOCK TABLES `cuisines` WRITE;
/*!40000 ALTER TABLE `cuisines` DISABLE KEYS */;
INSERT INTO `cuisines` VALUES (1,'Chinese','Eum similique maiores atque quia explicabo. Dolores quia placeat consequatur id quis perspiciatis. Ducimus sit ducimus officia labore maiores et porro. Est iusto natus nesciunt debitis consequuntur totam. Et illo et autem inventore earum corrupti.','2020-04-11 12:03:21','2020-04-11 12:03:21'),(2,'Indian','Eaque et aut natus. Minima blanditiis ut sunt distinctio ad. Quasi doloremque rerum ex rerum. Molestias similique similique aut rerum delectus blanditiis et. Dolorem et quas nostrum est nobis.','2020-04-11 12:03:21','2020-04-11 12:03:21'),(3,'Thai','Est nihil omnis natus ducimus ducimus excepturi quos. Et praesentium in quia veniam. Tempore aut nesciunt consequatur pariatur recusandae. Voluptatem commodi eius quaerat est deleniti impedit. Qui quo harum est sequi incidunt labore eligendi cum.','2020-04-11 12:03:21','2020-04-11 12:03:21'),(4,'Greek','Ex nostrum suscipit aut et labore. Ut dolor ut eum eum voluptatem ex. Sapiente in tempora soluta voluptatem. Officia accusantium quae sit. Rerum esse ipsa molestias dolorem et est autem consequatur.','2020-04-11 12:03:21','2020-04-11 12:03:21'),(5,'Vietnamese','Dolorum earum ut blanditiis blanditiis. Facere quis voluptates assumenda saepe. Ab aspernatur voluptatibus rem doloremque cum impedit. Itaque blanditiis commodi repudiandae asperiores. Modi atque placeat consectetur et aut blanditiis.','2020-04-11 12:03:21','2021-12-24 09:45:44'),(6,'French','Est et iste enim. Quam repudiandae commodi rerum non esse. Et in aut sequi est aspernatur. Facere non modi expedita asperiores. Ipsa laborum saepe deserunt qui consequatur voluptas inventore dolorum.','2020-04-11 12:03:21','2020-04-11 12:03:21'),(7,'hjhjhk',NULL,'2021-12-23 16:00:54','2021-12-23 16:00:54');
/*!40000 ALTER TABLE `cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_digits` tinyint unsigned DEFAULT NULL,
  `rounding` tinyint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','$','USD',2,0,'2019-10-22 12:50:48','2019-10-22 12:50:48'),(2,'Euro','€','EUR',2,0,'2019-10-22 12:51:39','2019-10-22 12:51:39'),(3,'Indian Rupee','টকা','INR',2,0,'2019-10-22 12:52:50','2019-10-22 12:52:50'),(4,'Indonesian Rupiah','Rp','IDR',0,0,'2019-10-22 12:53:22','2019-10-22 12:53:22'),(5,'Brazilian Real','R$','BRL',2,0,'2019-10-22 12:54:00','2019-10-22 12:54:00'),(6,'Cambodian Riel','៛','KHR',2,0,'2019-10-22 12:55:51','2019-10-22 12:55:51'),(7,'Vietnamese Dong','₫','VND',0,0,'2019-10-22 12:56:26','2019-10-22 12:56:26');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `view` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_field_id` int unsigned NOT NULL,
  `customizable_type` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`),
  CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
INSERT INTO `custom_field_values` VALUES (29,'+136 226 5669','+136 226 5669',4,'App\\Models\\User',2,'2019-09-06 18:52:30','2019-09-06 18:52:30'),(30,'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.','Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.',5,'App\\Models\\User',2,'2019-09-06 18:52:30','2019-10-16 16:32:35'),(31,'2911 Corpening Drive South Lyon, MI 48178','2911 Corpening Drive South Lyon, MI 48178',6,'App\\Models\\User',2,'2019-09-06 18:52:30','2019-10-16 16:32:35'),(32,'+136 226 5660','+136 226 5660',4,'App\\Models\\User',1,'2019-09-06 18:53:58','2019-09-27 05:12:04'),(33,'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta','Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta',5,'App\\Models\\User',1,'2019-09-06 18:53:58','2019-10-16 16:23:53'),(34,'569 Braxton Street Cortland, IL 60112','569 Braxton Street Cortland, IL 60112',6,'App\\Models\\User',1,'2019-09-06 18:53:58','2019-10-16 16:23:53'),(35,'+1 098-6543-236','+1 098-6543-236',4,'App\\Models\\User',3,'2019-10-15 14:21:32','2019-10-17 20:21:43'),(36,'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse','Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse',5,'App\\Models\\User',3,'2019-10-15 14:21:32','2019-10-17 20:21:12'),(37,'1850 Big Elm Kansas City, MO 64106','1850 Big Elm Kansas City, MO 64106',6,'App\\Models\\User',3,'2019-10-15 14:21:32','2019-10-17 20:21:43'),(38,'+1 248-437-7610','+1 248-437-7610',4,'App\\Models\\User',4,'2019-10-16 16:31:46','2019-10-16 16:31:46'),(39,'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta','Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta',5,'App\\Models\\User',4,'2019-10-16 16:31:46','2019-10-16 16:31:46'),(40,'1050 Frosty Lane Sidney, NY 13838','1050 Frosty Lane Sidney, NY 13838',6,'App\\Models\\User',4,'2019-10-16 16:31:46','2019-10-16 16:31:46'),(41,'+136 226 5669','+136 226 5669',4,'App\\Models\\User',5,'2019-12-15 15:49:44','2019-12-15 15:49:44'),(42,'<p>Short Bio</p>','Short Bio',5,'App\\Models\\User',5,'2019-12-15 15:49:44','2019-12-15 15:49:44'),(43,'4722 Villa Drive','4722 Villa Drive',6,'App\\Models\\User',5,'2019-12-15 15:49:44','2019-12-15 15:49:44'),(44,'+136 955 6525','+136 955 6525',4,'App\\Models\\User',6,'2020-03-29 14:28:04','2020-03-29 14:28:04'),(45,'<p>Short bio for this driver</p>','Short bio for this driver',5,'App\\Models\\User',6,'2020-03-29 14:28:05','2020-03-29 14:28:05'),(46,'4722 Villa Drive','4722 Villa Drive',6,'App\\Models\\User',6,'2020-03-29 14:28:05','2020-03-29 14:28:05'),(47,'05002584885833','05002584885833',4,'App\\Models\\User',7,'2022-02-08 13:48:25','2022-07-17 01:37:54'),(48,'','',5,'App\\Models\\User',7,'2022-02-08 13:48:25','2022-07-17 01:31:53'),(49,NULL,NULL,6,'App\\Models\\User',7,'2022-02-08 13:48:25','2022-02-08 13:48:25'),(50,'00201145011954','00201145011954',4,'App\\Models\\User',10,'2022-07-16 20:47:57','2022-07-17 00:21:13'),(51,'','',5,'App\\Models\\User',10,'2022-07-16 20:47:57','2022-07-16 23:47:27'),(52,NULL,NULL,6,'App\\Models\\User',10,'2022-07-16 20:47:57','2022-07-16 20:47:57'),(53,'','',4,'App\\Models\\User',8,'2022-07-17 02:33:57','2022-07-17 02:33:57'),(54,'','',5,'App\\Models\\User',8,'2022-07-17 02:33:57','2022-07-17 02:33:57'),(55,'','',6,'App\\Models\\User',8,'2022-07-17 02:33:57','2022-07-17 02:33:57');
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint DEFAULT NULL,
  `order` tinyint DEFAULT NULL,
  `custom_field_model` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (4,'phone','text',NULL,0,0,0,6,2,'App\\Models\\User','2019-09-06 18:30:00','2019-09-06 18:31:47'),(5,'bio','textarea',NULL,0,0,0,6,1,'App\\Models\\User','2019-09-06 18:43:58','2019-09-06 18:43:58'),(6,'address','text',NULL,0,0,0,6,3,'App\\Models\\User','2019-09-06 18:49:22','2019-09-06 18:49:22');
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cycles`
--

DROP TABLE IF EXISTS `cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_days` int NOT NULL DEFAULT '1',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cycles_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cycles`
--

LOCK TABLES `cycles` WRITE;
/*!40000 ALTER TABLE `cycles` DISABLE KEYS */;
INSERT INTO `cycles` VALUES (1,'سنوية',365,'active','Customer pays yearly','2022-06-23 16:07:59','2022-06-23 22:12:26'),(2,'دورة ال ١٠٠',200,'active','<p>كل ١٠٠ يوم<br></p>','2022-07-02 13:22:16','2022-07-12 14:22:14');
/*!40000 ALTER TABLE `cycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_addresses`
--

DROP TABLE IF EXISTS `delivery_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `delivery_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_addresses`
--

LOCK TABLES `delivery_addresses` WRITE;
/*!40000 ALTER TABLE `delivery_addresses` DISABLE KEYS */;
INSERT INTO `delivery_addresses` VALUES (1,'Quo similique vitae possimus maxime in corrupti et.','997 Jones Turnpike\nLake Darbyport, NY 85057-8842','54.805021','7.362111',0,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(2,'Aut dolorum doloribus aliquam sed eaque sapiente voluptatem.','42337 Reilly Creek\nEast Dillanville, WA 03647-0862','49.590247','7.653064',1,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(3,'Ad est deleniti aut alias eius eius.','55777 Reynolds Branch\nAureliechester, OR 83706-9238','46.863981','9.130439',0,5,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(4,'Et autem ullam eum enim voluptates quidem.','301 Richie Corner Suite 206\nVincenzaside, UT 67631-4260','39.498527','10.055813',1,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(5,'Commodi et voluptas cumque vitae provident et eligendi.','436 Jacobson Mill Apt. 647\nMargotchester, CT 67799','49.928272','7.779985',0,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(6,'Nihil nulla aliquam exercitationem itaque.','8770 Destin Fords Suite 122\nLake Edgar, OK 57269-6521','45.080282','9.332851',0,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(7,'Et perferendis mollitia id vero deserunt est ratione.','961 Hills Fall Apt. 397\nPort Myahburgh, IL 56651-1620','46.635754','8.625384',1,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(8,'Et ut ipsum voluptate.','21185 Koss Port Suite 570\nPort Lamont, NE 10254','41.442728','8.992942',1,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(9,'Amet quos porro repellat.','572 Maryjane Port\nNorth Evieland, DE 22435-2697','47.28966','10.247165',1,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(10,'Veritatis voluptas illo est odit maiores autem voluptates.','6135 Roxane Circle Suite 202\nEldridgemouth, NC 86209-4846','45.701542','8.710375',0,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(11,'Molestiae qui amet deleniti ea fuga.','396 Leannon Street Suite 073\nEast Jeanie, IA 87351-2125','51.526674','7.432209',1,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(12,'Qui dolores ipsam dolor odio qui deserunt.','679 Kavon Corners Suite 398\nBeckerchester, AZ 10581','37.880729','9.729834',1,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(13,'Delectus sint porro velit ut saepe architecto et.','15344 Graham Creek Suite 496\nWisozkton, NH 29478-8585','50.645858','11.021532',0,4,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(14,'Mollitia et ut aut ut sit neque necessitatibus.','6989 Raynor Mission\nRempelport, PA 23015','40.744927','11.257544',0,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(15,'Nihil quos occaecati fugiat molestias ut est.','51128 Mathias Port\nDelltown, IA 71713-4131','53.316036','9.897184',0,3,'2021-07-04 11:40:04','2021-07-04 11:40:04');
/*!40000 ALTER TABLE `delivery_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountables`
--

DROP TABLE IF EXISTS `discountables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int unsigned NOT NULL,
  `discountable_type` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountable_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discountables_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountables`
--

LOCK TABLES `discountables` WRITE;
/*!40000 ALTER TABLE `discountables` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounttypes`
--

DROP TABLE IF EXISTS `discounttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounttypes`
--

LOCK TABLES `discounttypes` WRITE;
/*!40000 ALTER TABLE `discounttypes` DISABLE KEYS */;
INSERT INTO `discounttypes` VALUES (1,'Fixed',NULL,'2022-06-21 00:27:58','2022-06-21 00:27:58'),(2,'%',NULL,'2022-06-21 00:28:18','2022-06-21 00:28:18'),(3,'1+1',NULL,'2022-06-21 00:28:28','2022-06-21 00:28:28'),(4,'عرض خاص',NULL,'2022-06-21 00:28:37','2022-06-21 00:28:37');
/*!40000 ALTER TABLE `discounttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_restaurants`
--

DROP TABLE IF EXISTS `driver_restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_restaurants` (
  `user_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`restaurant_id`),
  KEY `driver_restaurants_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `driver_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `driver_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_restaurants`
--

LOCK TABLES `driver_restaurants` WRITE;
/*!40000 ALTER TABLE `driver_restaurants` DISABLE KEYS */;
INSERT INTO `driver_restaurants` VALUES (5,1),(5,2),(6,2),(6,3),(5,4),(6,4);
/*!40000 ALTER TABLE `driver_restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `delivery_fee` double(5,2) NOT NULL DEFAULT '0.00',
  `total_orders` int unsigned NOT NULL DEFAULT '0',
  `earning` double(9,2) NOT NULL DEFAULT '0.00',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drivers_user_id_foreign` (`user_id`),
  CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,5,0.00,0,0.00,0,'2021-07-04 14:43:02','2021-07-04 14:43:02'),(2,6,0.00,0,0.00,0,'2021-07-04 14:43:02','2021-07-04 14:43:02');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers_payouts`
--

DROP TABLE IF EXISTS `drivers_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers_payouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `method` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(9,2) NOT NULL DEFAULT '0.00',
  `paid_date` datetime DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drivers_payouts_user_id_foreign` (`user_id`),
  CONSTRAINT `drivers_payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers_payouts`
--

LOCK TABLES `drivers_payouts` WRITE;
/*!40000 ALTER TABLE `drivers_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earnings`
--

DROP TABLE IF EXISTS `earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earnings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int unsigned NOT NULL,
  `total_orders` int unsigned NOT NULL DEFAULT '0',
  `total_earning` double(9,2) NOT NULL DEFAULT '0.00',
  `admin_earning` double(9,2) NOT NULL DEFAULT '0.00',
  `restaurant_earning` double(9,2) NOT NULL DEFAULT '0.00',
  `delivery_fee` double(9,2) NOT NULL DEFAULT '0.00',
  `tax` double(9,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `earnings_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `earnings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earnings`
--

LOCK TABLES `earnings` WRITE;
/*!40000 ALTER TABLE `earnings` DISABLE KEYS */;
INSERT INTO `earnings` VALUES (1,1,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(2,2,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(3,3,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(4,4,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(5,5,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(6,6,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(7,7,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(8,8,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(9,9,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30'),(10,10,0,0.00,0.00,0.00,0.00,0.00,'2021-12-31 22:35:30','2021-12-31 22:35:30');
/*!40000 ALTER TABLE `earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_group_prouducts`
--

DROP TABLE IF EXISTS `extra_group_prouducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_group_prouducts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_group_prouducts`
--

LOCK TABLES `extra_group_prouducts` WRITE;
/*!40000 ALTER TABLE `extra_group_prouducts` DISABLE KEYS */;
INSERT INTO `extra_group_prouducts` VALUES (1,'نوع البشرة','2021-12-30 14:31:45','2021-12-30 14:31:45'),(2,'الحجم','2021-12-30 14:31:55','2021-12-30 14:31:55'),(3,'مقاس','2021-12-30 14:32:49','2021-12-30 14:32:49'),(4,'نوع الشعر','2021-12-30 14:33:04','2021-12-30 14:33:04'),(5,'خصائص','2021-12-30 14:33:22','2021-12-30 14:33:22');
/*!40000 ALTER TABLE `extra_group_prouducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_groups`
--

DROP TABLE IF EXISTS `extra_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_groups`
--

LOCK TABLES `extra_groups` WRITE;
/*!40000 ALTER TABLE `extra_groups` DISABLE KEYS */;
INSERT INTO `extra_groups` VALUES (1,'Size','2019-08-31 07:55:28','2019-08-31 07:55:28'),(2,'Taste','2019-10-09 10:26:28','2019-10-09 10:26:28'),(3,'Capacity','2019-10-09 10:26:28','2019-10-09 10:26:28');
/*!40000 ALTER TABLE `extra_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_pruducts`
--

DROP TABLE IF EXISTS `extra_pruducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_pruducts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT '0.00',
  `product_id` int unsigned NOT NULL,
  `extra_group_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extra_pruducts_product_id_foreign` (`product_id`),
  KEY `extra_pruducts_extra_group_id_foreign` (`extra_group_id`),
  CONSTRAINT `extra_pruducts_extra_group_id_foreign` FOREIGN KEY (`extra_group_id`) REFERENCES `extra_group_prouducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `extra_pruducts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pruducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_pruducts`
--

LOCK TABLES `extra_pruducts` WRITE;
/*!40000 ALTER TABLE `extra_pruducts` DISABLE KEYS */;
INSERT INTO `extra_pruducts` VALUES (1,'بيضاء',NULL,0.00,4,1,'2021-12-30 15:54:27','2021-12-30 16:18:11'),(3,'مقاس 6',NULL,0.00,5,2,'2021-12-30 16:20:12','2021-12-30 16:20:22'),(4,'شعر دهني',NULL,0.00,4,4,'2021-12-30 22:20:16','2021-12-30 22:20:16'),(5,'يمتص بسرعة',NULL,0.00,4,5,'2021-12-30 22:21:07','2021-12-30 22:21:07'),(6,'XXL',NULL,0.00,4,3,'2021-12-30 22:22:01','2021-12-30 22:22:01');
/*!40000 ALTER TABLE `extra_pruducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT '0.00',
  `food_id` int unsigned NOT NULL,
  `extra_group_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_food_id_foreign` (`food_id`),
  KEY `extras_extra_group_id_foreign` (`extra_group_id`),
  CONSTRAINT `extras_extra_group_id_foreign` FOREIGN KEY (`extra_group_id`) REFERENCES `extra_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `extras_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES (1,'S','Possimus voluptates quis dolor et aut.',17.66,4,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(2,'Cheese','Fugit quisquam cupiditate deleniti.',21.06,7,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(3,'Cheese','Vel facilis iusto suscipit non.',33.18,16,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(4,'XL','Eos veritatis pariatur et consectetur.',22.11,2,1,'2021-07-04 11:40:04','2021-12-28 10:27:51'),(5,'Tomato','Consequatur aut cupiditate temporibus et.',22.59,30,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(6,'Oil','Sunt temporibus quis et in ab.',32.29,17,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(7,'S','Dolores beatae qui quis velit.',43.20,29,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(8,'5L','Laudantium id dolorem.',11.24,9,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(9,'Oil','In in pariatur.',47.97,30,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(10,'Oil','Eos voluptatem hic quia error.',39.98,27,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(11,'2L','Possimus saepe architecto aut.',22.06,29,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(12,'2L','Blanditiis non accusantium omnis voluptates.',32.99,13,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(13,'Tomato','In corrupti nulla ullam hic.',12.35,11,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(14,'Tuna','Repellendus fuga non dolorum.',41.31,2,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(15,'L','Reiciendis nihil minima.',45.09,13,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(16,'Cheese','Et ex et.',39.23,14,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(17,'Oil','Quo consequatur sint velit.',34.76,16,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(18,'Cheese','Autem qui reiciendis.',27.51,22,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(19,'Cheese','Voluptatem eius ut temporibus blanditiis.',46.12,22,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(20,'2L','Dolor rem quibusdam quae.',28.54,27,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(21,'5L','Maxime maxime officiis delectus eos.',49.28,24,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(22,'2L','Quasi soluta non id.',47.38,21,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(23,'XL','Alias unde expedita et eaque.',16.85,19,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(24,'XL','Consequatur ipsa sequi temporibus.',48.86,6,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(25,'Cheese','Deleniti vitae dolore nemo repellat voluptas.',20.31,23,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(26,'L','Vitae et nisi illum voluptate exercitationem.',48.25,4,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(27,'Tuna','Possimus et nulla tenetur reprehenderit.',19.89,18,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(28,'Oil','Reprehenderit qui eius aut earum.',44.97,5,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(29,'Cheese','Quis ullam et architecto.',27.94,8,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(30,'L','Nihil necessitatibus est quod.',11.15,21,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(31,'2L','Maiores cum quos quia ut voluptas.',28.30,19,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(32,'Cheese','Enim voluptas consequatur placeat dolores.',44.92,9,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(33,'2L','Reiciendis necessitatibus et quo cupiditate.',32.99,25,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(34,'Tuna','Aut natus qui quia.',31.48,3,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(35,'L','Sint vitae nulla possimus.',40.72,30,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(36,'Cheese','Aspernatur officiis vitae.',47.33,10,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(37,'XL','Et dolor cumque distinctio.',24.65,12,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(38,'Oil','Totam sed omnis maiores.',35.86,27,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(39,'XL','Magnam pariatur eaque et inventore.',32.92,16,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(40,'Oil','Ut commodi nisi in.',28.72,9,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(41,'Cheese','Et accusamus repellendus suscipit beatae incidunt.',20.68,24,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(42,'2L','Ea odio ipsam.',16.95,7,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(43,'S','Illum provident et nihil sed.',25.68,16,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(44,'2L','Dolorum perferendis deleniti ab sunt non.',32.40,10,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(45,'2L','Tempora vel deserunt.',35.30,19,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(46,'XL','Voluptas et voluptates optio veritatis.',25.79,13,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(47,'5L','Quia laborum ut illo.',23.27,16,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(48,'Oil','Doloribus sapiente nihil nam quos fugiat.',45.97,5,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(49,'Oil','Atque ipsam nostrum accusantium laudantium aut.',19.51,22,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(50,'Oil','Consequatur qui est esse.',18.89,16,3,'2021-07-04 11:40:04','2021-07-04 11:40:04');
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Foods','2019-08-31 09:31:52','2019-08-31 09:31:52'),(2,'Services','2019-08-31 09:32:03','2019-08-31 09:32:03'),(3,'Delivery','2019-08-31 09:32:11','2019-08-31 09:32:11'),(4,'Misc','2019-08-31 09:32:17','2019-08-31 09:32:17');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `faq_category_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_faq_category_id_foreign` (`faq_category_id`),
  CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Enim maxime perferendis aut deleniti quam asperiores. Sunt vero nisi et est neque possimus.','I wish I hadn\'t begun my tea--not above a week or so--and what with the Duchess, \'and that\'s why. Pig!\' She said the Mock Turtle. \'No, no! The adventures first,\' said the Queen, tossing her head.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(2,'Sunt rerum quia voluptas dolor labore et dolores dolores. Distinctio ut soluta sed sunt vitae.','The Caterpillar and Alice guessed in a low voice, \'Your Majesty must cross-examine the next witness!\' said the Hatter was the first witness,\' said the one who had got its neck nicely straightened.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(3,'Temporibus magnam a atque mollitia eligendi quidem voluptatem. Minus vero iste rerum quibusdam.','But the insolence of his great wig.\' The judge, by the White Rabbit, who said in a natural way again. \'I wonder if I\'ve been changed for any of them. \'I\'m sure those are not attending!\' said the.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(4,'Aut aut voluptatem recusandae esse earum provident. Nisi natus facilis eius quis ipsum.','For anything tougher than suet; Yet you finished the guinea-pigs!\' thought Alice. One of the officers: but the Hatter and the King had said that day. \'A likely story indeed!\' said the Duchess; \'and.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(5,'Rem autem quibusdam dolorum quia. Distinctio velit dignissimos ex est. Nam sed tenetur ea hic quia.','Alice tried to curtsey as she spoke. (The unfortunate little Bill had left off sneezing by this time, and was delighted to find my way into a pig,\' Alice quietly said, just as she came rather late.',3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(6,'Nulla totam rerum error amet praesentium ex nobis porro. Reprehenderit provident excepturi at quia.','Alice in a melancholy tone. \'Nobody seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Mouse. \'Of.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(7,'Cupiditate expedita molestiae porro. Qui veniam pariatur aut quas nihil.','Soup! Beau--ootiful Soo--oop! Soo--oop of the court was a table in the same tone, exactly as if he had taken advantage of the soldiers had to ask his neighbour to tell him. \'A nice muddle their.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(8,'Deleniti maiores minus eos commodi accusamus illo. Aut sit aut impedit tempore.','Mock Turtle. \'Certainly not!\' said Alice in a low voice, to the Knave. The Knave did so, very carefully, nibbling first at one corner of it: for she was up to her chin upon Alice\'s shoulder, and it.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(9,'Ipsa est qui voluptatibus rerum. Aut veritatis et mollitia debitis.','Cheshire cat,\' said the Caterpillar, and the words did not much surprised at her for a little faster?\" said a timid and tremulous sound.] \'That\'s different from what I say,\' the Mock Turtle\'s heavy.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(10,'Ut quasi nihil accusamus quidem enim. Incidunt nobis facere error hic praesentium vel expedita.','Mouse, frowning, but very politely: \'Did you say things are worse than ever,\' thought the whole place around her became alive with the lobsters, out to be full of the trees upon her face. \'Wake up.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(11,'Dolores quos voluptate libero qui. Qui tempora repellat quis optio libero dolorem.','Alice: \'she\'s so extremely--\' Just then she remembered trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had gone through that day. \'No, no!\' said the Dodo. Then.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(12,'Aliquam esse sit excepturi doloribus modi dolor odio. Similique autem velit et.','Alice, looking down at them, and it\'ll sit up and down in a day did you do either!\' And the Gryphon in an encouraging tone. Alice looked down at her rather inquisitively, and seemed to rise like a.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(13,'Rerum voluptates ut velit quia. Quia facere excepturi laudantium sed sequi.','King triumphantly, pointing to Alice with one of its voice. \'Back to land again, and put it to be rude, so she set to work nibbling at the end of the court. (As that is enough,\' Said his father.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(14,'Velit quod sed repudiandae quo eos. Minus et excepturi quos sit nam ut et.','King, and the happy summer days. THE.',3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(15,'Et deserunt eos quia et nihil. Recusandae a aut omnis quasi eum sed.','Gryphon replied very politely, \'if I had our Dinah here, I know I have done that, you know,\' said the Gryphon at the great hall, with the Queen had only one who got any advantage from the trees upon.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(16,'Cum tempore consequatur pariatur omnis. Eos eum mollitia eligendi eveniet dolorem dolores minima.','Alice had been all the same, shedding gallons of tears, until there was the BEST butter,\' the March Hare, who had got burnt, and eaten up by wild beasts and other unpleasant things, all because they.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(17,'Voluptas quam cumque ullam culpa blanditiis aut corrupti. Tenetur maiores sunt expedita sint.','Cat went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. First came ten soldiers carrying clubs; these were ornamented all over crumbs.\' \'You\'re wrong about the same size: to be a person of.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(18,'Rerum perspiciatis molestias velit ipsa. Mollitia et nam ad quia ad officia dolor.','There was exactly three inches high). \'But I\'m NOT a serpent!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at the top of her ever getting out.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(19,'Non numquam harum velit eligendi. Et modi laborum omnis vero.','Queen. \'You make me larger, it must be getting somewhere near the house if it makes rather a hard word, I will just explain to you to get in?\' asked Alice again, for this curious child was very.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(20,'Autem beatae ut facilis. Quia labore hic aut fuga officiis. Rerum unde commodi sint sapiente.','The Gryphon lifted up both its paws in surprise. \'What! Never heard of one,\' said Alice. \'Why, SHE,\' said the Mouse, turning to the shore, and then dipped suddenly down, so suddenly that Alice quite.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(21,'Omnis aut cupiditate nemo numquam. Consequatur odio voluptates cumque omnis.','Alice, a good deal worse off than before, as the jury asked. \'That I can\'t remember,\' said the Dodo replied very readily: \'but that\'s because it stays the same thing with you,\' said the Pigeon; \'but.',3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(22,'Enim rem dolorem ut numquam. Ut quibusdam est repellat ad voluptatem.','Majesty!\' the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit: it was too late to wish that! She went in search of her own.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(23,'Adipisci quod est aspernatur magnam ut. Et temporibus et dolorum blanditiis ratione debitis.','Alice looked at it, and burning with curiosity, she ran off as hard as it happens; and if I know THAT well enough; and what does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man,\' the.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(24,'Adipisci ab laudantium qui et. Quia necessitatibus et modi provident tempore praesentium et vel.','March Hare said in a hurry that she was quite tired of being upset, and their curls got entangled together. Alice laughed so much about a whiting to a mouse, That he met in the face. \'I\'ll put a.',3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(25,'Repellendus quibusdam exercitationem sunt ad ex aut. Voluptate ipsum delectus autem dolorem dolore.','But at any rate,\' said Alice: \'three inches is such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me hear the Rabbit came up to her ear. \'You\'re thinking about.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(26,'In est excepturi aut ea. Est debitis quis ducimus.','Very soon the Rabbit just under the door; so either way I\'ll get into her face, and was just possible it had no idea what you\'re talking about,\' said Alice. \'It must have prizes.\' \'But who has won?\'.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(27,'Omnis minus est et qui sit excepturi sit quam. Aspernatur in vero et.','There was certainly English. \'I don\'t know of any that do,\' Alice hastily replied; \'at least--at least I know THAT well enough; don\'t be particular--Here, Bill! catch hold of it; so, after hunting.',4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(28,'Explicabo rerum aut expedita omnis et sed asperiores. Enim eius distinctio itaque nisi cum.','MINE.\' The Queen had never seen such a thing before, but she did not much like keeping so close to her: first, because the chimneys were shaped like ears and whiskers, how late it\'s getting!\' She.',3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(29,'Et ut labore quae voluptate vel animi. Distinctio quia qui sint similique.','So you see, so many out-of-the-way things to happen, that it led into the roof of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and Queen of Hearts.',2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(30,'Ut perspiciatis corporis sunt optio. Quisquam est illo quasi. Vero corrupti aliquam et qui.','I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they live at the stick, and held it out loud. \'Thinking again?\' the Duchess and the poor little thing howled.',1,'2021-07-04 11:40:05','2021-07-04 11:40:05');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_extras`
--

DROP TABLE IF EXISTS `favorite_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_extras` (
  `extra_id` int unsigned NOT NULL,
  `favorite_id` int unsigned NOT NULL,
  PRIMARY KEY (`extra_id`,`favorite_id`),
  KEY `favorite_extras_favorite_id_foreign` (`favorite_id`),
  CONSTRAINT `favorite_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_extras_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_extras`
--

LOCK TABLES `favorite_extras` WRITE;
/*!40000 ALTER TABLE `favorite_extras` DISABLE KEYS */;
INSERT INTO `favorite_extras` VALUES (1,1),(3,2),(5,3),(1,5),(2,6);
/*!40000 ALTER TABLE `favorite_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_food_id_foreign` (`food_id`),
  KEY `favorites_user_id_foreign` (`user_id`),
  CONSTRAINT `favorites_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,20,3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(2,18,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(3,18,6,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(4,23,1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(5,3,6,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(6,16,4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(7,25,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(8,3,2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(9,4,6,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(10,26,3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(11,11,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(12,12,1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(13,15,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(14,25,4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(15,13,2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(16,10,4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(17,30,6,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(18,24,6,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(19,21,4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(20,6,6,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(21,18,4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(22,11,2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(23,13,1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(24,14,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(25,4,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(26,22,4,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(27,26,3,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(28,17,5,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(29,17,2,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(30,20,1,'2021-07-04 11:40:05','2021-07-04 11:40:05');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_order_extras`
--

DROP TABLE IF EXISTS `food_order_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_order_extras` (
  `food_order_id` int unsigned NOT NULL,
  `extra_id` int unsigned NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`food_order_id`,`extra_id`),
  KEY `food_order_extras_extra_id_foreign` (`extra_id`),
  CONSTRAINT `food_order_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_order_extras_food_order_id_foreign` FOREIGN KEY (`food_order_id`) REFERENCES `food_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_order_extras`
--

LOCK TABLES `food_order_extras` WRITE;
/*!40000 ALTER TABLE `food_order_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_order_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_orders`
--

DROP TABLE IF EXISTS `food_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `food_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_orders_food_id_foreign` (`food_id`),
  KEY `food_orders_order_id_foreign` (`order_id`),
  CONSTRAINT `food_orders_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_orders`
--

LOCK TABLES `food_orders` WRITE;
/*!40000 ALTER TABLE `food_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_reviews`
--

DROP TABLE IF EXISTS `food_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rate` tinyint unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  `food_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_reviews_user_id_foreign` (`user_id`),
  KEY `food_reviews_food_id_foreign` (`food_id`),
  CONSTRAINT `food_reviews_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_reviews`
--

LOCK TABLES `food_reviews` WRITE;
/*!40000 ALTER TABLE `food_reviews` DISABLE KEYS */;
INSERT INTO `food_reviews` VALUES (1,'Gryphon, with a sigh: \'it\'s always tea-time, and we\'ve no time to avoid shrinking away altogether. \'That WAS a narrow escape!\' said Alice, who was reading the list of the baby?\' said the Gryphon.',5,4,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(2,'I find a thing,\' said the March Hare, \'that \"I breathe when I sleep\" is the capital of Paris, and Paris is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must sugar my hair.\" As.',4,5,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(3,'They\'re dreadfully fond of pretending to be otherwise than what you mean,\' said Alice. \'Oh, don\'t talk about cats or dogs either, if you hold it too long; and that is enough,\' Said his father.',3,2,20,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(4,'AT ALL. Soup does very well as she stood still where she was, and waited. When the Mouse replied rather impatiently: \'any shrimp could have told you that.\' \'If I\'d been the right distance--but then.',3,2,11,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(5,'I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they draw?\' said Alice, feeling very glad to find it out, we should all have our heads cut off, you know.',4,2,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(6,'Queen was in the court!\' and the Dormouse fell asleep instantly, and neither of the door and went stamping about, and shouting \'Off with her head!\' about once in her hands, and she hastily dried her.',4,5,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(7,'Alice had not got into the loveliest garden you ever saw. How she longed to change the subject. \'Ten hours the first to speak. \'What size do you want to go! Let me think: was I the same as the White.',5,3,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(8,'You gave us three or more; They all returned from him to you, Though they were nowhere to be no sort of meaning in it, and very soon finished it off. \'If everybody minded their own business!\' \'Ah.',1,5,24,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(9,'However, at last in the wind, and the three gardeners instantly jumped up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King repeated angrily, \'or I\'ll have you got in.',4,2,4,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(10,'VERY tired of being upset, and their slates and pencils had been running half an hour or so, and giving it a bit, if you drink much from a Caterpillar The Caterpillar and Alice was silent. The King.',2,1,18,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(11,'White Rabbit read:-- \'They told me you had been to her, one on each side to guard him; and near the door, and the second time round, she found she could not even get her head made her so savage when.',4,3,13,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(12,'FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, who felt very lonely and low-spirited. In a little scream of laughter. \'Oh, hush!\' the Rabbit noticed Alice, as she went.',4,4,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(13,'March Hare and his friends shared their never-ending meal, and the others all joined in chorus, \'Yes, please do!\' but the cook and the March Hare. Visit either you like: they\'re both mad.\' \'But I.',3,4,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(14,'Pigeon. \'I can tell you what year it is?\' \'Of course it was,\' the March Hare moved into the garden. Then she went on in a trembling voice, \'Let us get to the Dormouse, and repeated her question.',2,6,20,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(15,'Queen, in a large rabbit-hole under the door; so either way I\'ll get into the sea, though you mayn\'t believe it--\' \'I never thought about it,\' added the Gryphon; and then unrolled the parchment.',1,6,10,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(16,'Alice, (she had grown in the shade: however, the moment he was going to begin lessons: you\'d only have to fly; and the poor little thing was waving its right paw round, \'lives a March Hare. \'I.',4,5,15,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(17,'Alice by the Hatter, with an important air, \'are you all ready? This is the driest thing I ever was at the March Hare. \'Exactly so,\' said Alice. \'I\'ve tried the effect of lying down on one of the.',3,5,20,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(18,'But there seemed to be a queer thing, to be no sort of use in the middle of her sharp little chin. \'I\'ve a right to think,\' said Alice sadly. \'Hand it over here,\' said the Caterpillar. Alice said.',4,1,20,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(19,'There was a table in the distance, and she said to the whiting,\' said the Cat, \'if you don\'t know much,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the.',3,4,16,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(20,'When they take us up and bawled out, \"He\'s murdering the time! Off with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows When the pie was all.',5,6,20,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(21,'March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t put my arm round your waist,\' the Duchess was VERY ugly; and secondly, because they\'re making such VERY short remarks, and she.',5,3,5,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(22,'The Duchess took no notice of her skirt, upsetting all the rest, Between yourself and me.\' \'That\'s the first position in dancing.\' Alice said; but was dreadfully puzzled by the fire, licking her.',3,3,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(23,'Alice, rather alarmed at the other birds tittered audibly. \'What I was sent for.\' \'You ought to be trampled under its feet, ran round the court and got behind him, and very soon finished it off. * *.',4,4,27,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(24,'Gryphon in an encouraging tone. Alice looked all round the court was a good thing!\' she said this, she noticed a curious plan!\' exclaimed Alice. \'And ever since that,\' the Hatter went on, \'--likely.',4,3,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(25,'Alice was rather doubtful whether she could do to hold it. As soon as it didn\'t sound at all this time, and was looking for it, she found she could not join the dance?\"\' \'Thank you, sir, for your.',3,3,12,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(26,'The Mouse looked at it, busily painting them red. Alice thought to herself. \'Shy, they seem to have it explained,\' said the Duchess: you\'d better finish the story for yourself.\' \'No, please go on!\'.',3,6,15,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(27,'White Rabbit returning, splendidly dressed, with a trumpet in one hand and a fall, and a fan! Quick, now!\' And Alice was just possible it had a bone in his sleep, \'that \"I breathe when I got up and.',2,3,29,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(28,'Queen! The Queen!\' and the two creatures, who had been found and handed them round as prizes. There was nothing on it except a tiny little thing!\' said the Gryphon. \'I\'ve forgotten the words.\' So.',4,5,18,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(29,'Alice\'s first thought was that you weren\'t to talk to.\' \'How are you getting on?\' said the Hatter, it woke up again with a yelp of delight, which changed into alarm in another moment down went Alice.',1,1,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(30,'I could let you out, you know.\' \'Not the same tone, exactly as if it makes rather a complaining tone, \'and they all crowded round her, calling out in a loud, indignant voice, but she knew she had.',5,5,9,'2021-07-04 11:40:04','2021-07-04 11:40:04');
/*!40000 ALTER TABLE `food_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_price` double(8,2) DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ingredients` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `package_items_count` double(9,2) DEFAULT '0.00',
  `weight` double(9,2) DEFAULT '0.00',
  `unit` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `deliverable` tinyint(1) DEFAULT '1',
  `restaurant_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foods_restaurant_id_foreign` (`restaurant_id`),
  KEY `foods_category_id_foreign` (`category_id`),
  CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foods_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Italian Sausage Soup',38.07,0.00,'Et et ea maiores quibusdam similique illo qui. Animi et doloribus dicta dignissimos repellat. Sint cupiditate ut voluptas corrupti voluptatum perferendis nostrum. Sed dignissimos et fugiat at est et.',NULL,5.00,133.71,'ml',1,1,3,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(2,'Italian Sausage Soup',45.67,44.31,'Et aperiam eius soluta nihil. Minima asperiores similique asperiores velit pariatur dolore ipsa. Aut facere cum dolorem velit qui.',NULL,3.00,202.62,'L',1,1,2,6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(3,'Chicken Noodle Soup',13.60,0.00,'Alias ipsa accusamus velit voluptatum voluptas molestiae reiciendis fuga. Sed at et eligendi alias sit. Sed maiores quam maiores ea consequatur optio voluptate.',NULL,5.00,60.31,'g',1,0,6,5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(4,'Pasta Pappardelle',35.95,0.00,'Ut rerum voluptas modi omnis est. Laboriosam incidunt tenetur corrupti iure.',NULL,6.00,365.65,'Kg',0,0,6,4,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(5,'Italian Sausage Soup',44.52,0.00,'Dolor cumque qui et quod aut magni ut quia. Mollitia autem et sed nihil cumque vel quas. Reprehenderit eum enim minus porro et. Sint voluptatum ratione aliquid eaque consequuntur ab.',NULL,4.00,419.63,'g',1,1,5,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(6,'California Italian Wedding Soup',11.46,0.00,'Adipisci nostrum animi error officia repellat sint aut. Qui pariatur accusamus non sed sapiente et. Consectetur quo magnam voluptatem nihil ut deserunt dolore pariatur.',NULL,6.00,205.82,'g',1,1,7,2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(7,'Pizza al Pesto',30.77,0.00,'Est quos deleniti ab tenetur rerum. Odit eius id rerum dolorem. Ipsam quo quaerat fuga ut.',NULL,5.00,224.53,'ml',1,0,3,5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(8,'Acini di Pepe',27.75,0.00,'Tempore maxime ut quod enim a aut et. Aspernatur error nam aut harum iste a. Aut ea amet est animi. Aut fugiat deleniti consequatur id tenetur accusantium voluptatibus.',NULL,1.00,461.26,'Kg',0,0,8,6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(9,'Pizza Margherita',47.38,45.77,'Et quaerat provident placeat veniam. Reprehenderit vel vel animi asperiores quo. Cum sunt fugiat ut dolorem. Quibusdam et et dolorem in.',NULL,5.00,494.23,'Kg',1,0,3,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(10,'Acini di Pepe',46.22,42.09,'Inventore exercitationem deleniti atque. Ut veniam fuga similique sed. Et ut incidunt et magni.',NULL,2.00,91.81,'Kg',1,1,4,5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(11,'Soup',45.90,37.03,'Quidem ea officia expedita. Voluptatem voluptatem sed vel est sit commodi. Sint aut laborum sed et dignissimos sequi ab. Sunt vel dolor aspernatur incidunt.',NULL,3.00,43.25,'L',0,0,6,4,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(12,'Pasta Campanelle',48.77,42.76,'Maxime dolor eveniet eveniet. Ut vitae molestias explicabo. Animi deleniti ut fuga ipsa esse sit.',NULL,3.00,209.23,'L',0,1,1,2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(13,'Pasta Campanelle',26.39,0.00,'Assumenda dolor sit consectetur est quos. Ad adipisci tenetur aut dicta qui harum et et. Quibusdam omnis nulla blanditiis et.',NULL,3.00,400.85,'ml',1,0,3,6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(14,'California Italian Wedding Soup',23.33,0.00,'Eos voluptatem eaque ut sit qui illo id. Eum tempore eos aliquid harum quos autem totam. Esse est nam distinctio expedita maxime.',NULL,5.00,115.17,'g',1,1,5,2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(15,'Pasta Campanelle',19.90,17.33,'Officia excepturi ipsa omnis. Quo laborum quis id aut qui eaque sit. Qui quisquam nesciunt quae quos.',NULL,2.00,287.80,'g',0,1,5,6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(16,'Soup',21.66,15.48,'Corrupti alias ut et quia architecto. Illo iusto accusantium occaecati expedita.',NULL,2.00,329.54,'Kg',1,0,3,3,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(17,'Soup',46.65,42.83,'Optio corrupti itaque veritatis dicta in omnis qui saepe. Optio earum ea omnis praesentium quam. Voluptatem reprehenderit ipsa quo quia fugit.',NULL,1.00,332.12,'g',0,1,9,3,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(18,'Pasta Pappardelle',37.89,33.74,'Doloribus voluptatem consequuntur ullam reiciendis est nisi quisquam. Laborum in rerum ex iure voluptatem aut et eveniet. Voluptatem facilis omnis accusantium aut est suscipit est.',NULL,2.00,133.27,'L',1,0,7,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(19,'Italian Sausage Soup',44.22,0.00,'Enim tempore numquam sapiente repellendus maxime error. Placeat quaerat dolores aut magni vel qui. Possimus velit laborum voluptatem corrupti dignissimos. Expedita saepe aut harum modi.',NULL,5.00,31.55,'L',0,0,9,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(20,'Cucur Udang Kuah Kacang',21.90,0.00,'Porro magnam excepturi non excepturi non illo facilis. Asperiores blanditiis fugiat dolores rem eveniet. Animi veniam consectetur aut.',NULL,4.00,200.53,'ml',0,1,4,5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(21,'Italian Sausage Soup',26.38,16.98,'Sed vitae ut ut quae tenetur blanditiis. Odio laborum pariatur nesciunt labore voluptates. Magnam est aspernatur vitae ea. Alias quo repellat atque ut qui et natus.',NULL,6.00,55.79,'g',1,1,6,2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(22,'Soup',17.31,0.00,'Sit quis perspiciatis corporis sed dolores. Aliquam quisquam velit eum tempore maxime voluptatem. Recusandae aliquam vel natus molestias sequi natus. Non et rerum voluptatem libero aliquid iusto.',NULL,4.00,309.35,'g',0,0,8,4,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(23,'Cucur Udang Kuah Kacang',31.42,0.00,'Dolorem architecto quo magni. Corrupti numquam alias blanditiis autem asperiores. Quis tempore occaecati aut. Accusantium suscipit dolores neque. Laborum asperiores harum sit dolore repellat.',NULL,1.00,235.65,'Kg',1,0,3,3,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(24,'Pasta Pappardelle',13.61,6.68,'Sunt maxime molestias velit sed. Veniam cum quasi illo esse sit. Eos sed corporis iure voluptatem. Ratione sint et maxime quidem expedita voluptatem sequi.',NULL,1.00,7.27,'Kg',1,0,6,6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(25,'Big Smokey Burgers',42.92,0.00,'Recusandae rerum quae illo nulla omnis quis eius ducimus. Illum dolorem dolor tempora corrupti. Quo aut rerum laborum voluptatem. Delectus qui eos placeat similique est recusandae et.',NULL,5.00,380.94,'ml',0,0,2,3,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(26,'Italian Sausage Soup',35.17,0.00,'Consequatur adipisci sed explicabo officia enim. Minima eum id porro iste. Perspiciatis rerum illo et voluptatem omnis nobis et.',NULL,3.00,170.11,'L',0,1,9,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(27,'Soup',32.67,26.15,'Non at quisquam quia accusantium totam numquam. Et voluptatem est vitae maiores ea alias officia. Culpa et exercitationem qui magni. Est non nisi molestiae laboriosam autem.',NULL,3.00,252.84,'g',1,0,1,5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(28,'Chicken Noodle Soup',36.25,34.71,'Optio odit dignissimos dolorum consequatur. Saepe nisi aut voluptate accusantium exercitationem. Occaecati et cum eum quia.',NULL,2.00,126.12,'Kg',0,0,3,6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(29,'Angel Hair',37.75,0.00,'Tenetur at minima voluptatem dolor quae quisquam. Rem reiciendis suscipit iure. Quam perferendis sequi architecto sunt aut.',NULL,1.00,77.37,'g',1,1,6,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(30,'Pizza al Pesto',34.78,29.33,'Soluta sed at autem labore reiciendis iure exercitationem dolores. Sint qui fuga sint est nostrum dolores consequatur quas. Aspernatur voluptates facilis et quidem porro dolorum beatae.',NULL,4.00,242.08,'Kg',1,1,3,6,'2021-07-04 11:40:03','2021-07-04 11:40:03');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `restaurant_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `galleries_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Voluptas nesciunt explicabo et cum eveniet debitis accusamus.',5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(2,'Architecto voluptates ipsum consequatur saepe delectus assumenda repudiandae.',6,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(3,'Veniam enim rerum nisi non unde.',7,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(4,'Possimus exercitationem beatae ut quia.',8,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(5,'Rerum molestias omnis non nemo totam officia.',5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(6,'Beatae et consectetur eum dolores soluta ea.',2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(7,'Sed aut quisquam in qui consequuntur sunt.',1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(8,'Voluptas quis voluptas labore quo enim.',1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(9,'Aliquid dolores doloremque voluptas rerum ut.',5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(10,'Fugiat et quidem impedit quo tempore blanditiis ut qui.',10,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(11,'Ea omnis ut consequatur iure.',5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(12,'Earum optio quos aut aliquid nihil magnam cupiditate.',2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(13,'Est nihil sint quidem qui.',1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(14,'Non est enim cum molestias aut voluptatibus ratione.',4,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(15,'Eveniet reprehenderit aut aut rerum.',3,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(16,'Molestiae quod voluptatem dolorum et quam voluptas quibusdam.',2,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(17,'Est minus molestiae sunt earum ducimus eos similique.',5,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(18,'Exercitationem commodi autem quia ratione.',4,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(19,'Sapiente praesentium fuga labore et ullam aliquid placeat.',4,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(20,'Iure quaerat alias et deserunt.',4,'2021-07-04 11:40:04','2021-07-04 11:40:04');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_categories`
--

DROP TABLE IF EXISTS `main_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#fff',
  `image_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#fff',
  `background_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#fff',
  `offer` tinyint(1) DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_categories`
--

LOCK TABLES `main_categories` WRITE;
/*!40000 ALTER TABLE `main_categories` DISABLE KEYS */;
INSERT INTO `main_categories` VALUES (4,'النوادي الرياضية','000000','ffffff','ff6600',1,'<p>كل مايتعلق بيه<br></p>','2021-12-23 18:27:29','2022-06-21 15:29:40'),(8,'المطاعم','000000','ffffff','ff6600',1,'<p>منتجات الرجال<br></p>','2022-01-01 14:29:04','2022-06-21 15:29:59'),(12,'مراكز عناية','008000','ffffff','008000',1,'<p>التغذية الصحية<br></p>','2022-06-21 15:42:33','2022-06-21 18:37:11');
/*!40000 ALTER TABLE `main_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maincategories_cuisines`
--

DROP TABLE IF EXISTS `maincategories_cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maincategories_cuisines` (
  `maincategories_id` int unsigned NOT NULL,
  `cuisines_id` int unsigned NOT NULL,
  PRIMARY KEY (`maincategories_id`,`cuisines_id`),
  KEY `maincategories_cuisines_cuisines_id_foreign` (`cuisines_id`),
  CONSTRAINT `maincategories_cuisines_cuisines_id_foreign` FOREIGN KEY (`cuisines_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maincategories_cuisines_maincategories_id_foreign` FOREIGN KEY (`maincategories_id`) REFERENCES `main_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maincategories_cuisines`
--

LOCK TABLES `maincategories_cuisines` WRITE;
/*!40000 ALTER TABLE `maincategories_cuisines` DISABLE KEYS */;
/*!40000 ALTER TABLE `maincategories_cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int unsigned NOT NULL,
  `manipulations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (4,'App\\Models\\Upload',4,'image','pngegg','pngegg.png','image/png','public',51585,'[]','{\"uuid\":\"503c6b10-1d2a-43c6-be35-d35f3ec6b700\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',4,'2021-12-23 16:00:51','2021-12-23 16:00:51'),(6,'App\\Models\\Upload',5,'image','av1','av1.png','image/png','public',6451,'[]','{\"uuid\":\"9fb79dab-c17b-48d3-96fd-1e4def9d3b94\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',6,'2021-12-23 16:22:35','2021-12-23 16:22:35'),(7,'App\\Models\\Upload',6,'image','pngegg','pngegg.png','image/png','public',51585,'[]','{\"uuid\":\"87a134c6-6360-4edd-895f-bf3e52d1e4e4\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',7,'2021-12-23 16:23:17','2021-12-23 16:23:17'),(8,'App\\Models\\Upload',7,'image','av2','av2.png','image/png','public',5469,'[]','{\"uuid\":\"986ffefa-d650-44d7-a240-0017d5174605\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',8,'2021-12-23 16:25:46','2021-12-23 16:25:46'),(13,'App\\Models\\Upload',11,'image','pngegg','pngegg.png','image/png','public',51585,'[]','{\"uuid\":\"e054da24-d468-4fa1-bfdf-461e33c67cd1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',13,'2021-12-23 16:53:18','2021-12-23 16:53:18'),(15,'App\\Models\\Food',27,'image','av1','av1.png','image/png','public',6451,'[]','{\"uuid\":\"5dac4494-d048-444c-94f4-4e08b23bde68\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',15,'2021-12-23 16:55:53','2021-12-23 16:55:53'),(26,'App\\Models\\Upload',19,'image','av1','av1.png','image/png','public',6451,'[]','{\"uuid\":\"bc02cb76-50d7-4d4f-8cde-a0828efe6bd5\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',25,'2021-12-23 18:28:50','2021-12-23 18:28:50'),(28,'App\\Models\\Upload',20,'image','av3','av3.jpg','image/jpeg','public',6793,'[]','{\"uuid\":\"062a5a1c-4205-4fcf-b5ca-d20a5b8125a9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',27,'2021-12-23 18:59:21','2021-12-23 18:59:21'),(36,'App\\Models\\Upload',25,'image','helpbigsmart2','helpbigsmart2.gif','image/gif','public',178266,'[]','{\"uuid\":\"8373076f-db36-486a-9912-b54674375830\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',35,'2021-12-23 19:02:26','2021-12-23 19:02:26'),(43,'App\\Models\\Upload',27,'image','av1','av1.png','image/png','public',6451,'[]','{\"uuid\":\"68ea3758-a5dc-4508-a3e3-360742e36b6d\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',41,'2021-12-23 19:22:45','2021-12-23 19:22:45'),(44,'App\\Models\\Cuisine',7,'image','av1','av1.png','image/png','public',6451,'[]','{\"uuid\":\"68ea3758-a5dc-4508-a3e3-360742e36b6d\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',42,'2021-12-23 19:22:47','2021-12-23 19:22:47'),(49,'App\\Models\\Upload',28,'image','av4','av4.jpg','image/jpeg','public',10321,'[]','{\"uuid\":\"80f993b9-6cc6-47d9-828b-23f7f126c32d\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',46,'2021-12-23 19:29:28','2021-12-23 19:29:28'),(51,'App\\Models\\Upload',29,'image','greex','greex.png','image/png','public',5193,'[]','{\"uuid\":\"3ef39ddd-2f97-43d0-90cd-80e198b24ced\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',47,'2021-12-23 19:29:54','2021-12-23 19:29:54'),(52,'App\\Models\\Upload',30,'image','Katara','Katara.png','image/png','public',84471,'[]','{\"uuid\":\"7b900c85-1026-4ad6-a31c-9ea33d84eac6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',48,'2021-12-23 19:30:04','2021-12-23 19:30:04'),(54,'App\\Models\\Upload',32,'image','sokaam','sokaam.jpg','image/jpeg','public',6190,'[]','{\"uuid\":\"a487932d-1395-4586-8da9-dbaaef2350d5\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',50,'2021-12-23 19:30:18','2021-12-23 19:30:18'),(55,'App\\Models\\Upload',33,'image','Sokka','Sokka.png','image/png','public',75865,'[]','{\"uuid\":\"4b7c32be-7e47-4c2f-9c78-00016ff02cc5\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',51,'2021-12-23 19:30:21','2021-12-23 19:30:21'),(62,'App\\Models\\Upload',34,'image','images-4','images-4.jpeg','image/jpeg','public',7734,'[]','{\"uuid\":\"1aacff2e-abb9-4531-9f96-fb78bf6757c0\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',56,'2021-12-24 21:14:46','2021-12-24 21:14:46'),(68,'App\\Models\\Upload',39,'image','Unknown-6','Unknown-6.jpg','image/jpeg','public',5888,'[]','{\"uuid\":\"391458cd-cfd3-480c-af16-8368e90b0b19\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',62,'2021-12-24 21:22:22','2021-12-24 21:22:22'),(69,'App\\Models\\Upload',40,'image','Unknown-9','Unknown-9.jpg','image/jpeg','public',11281,'[]','{\"uuid\":\"7b973dc0-d9b5-4537-afdf-02f083dc34ec\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',63,'2021-12-24 21:24:03','2021-12-24 21:24:03'),(70,'App\\Models\\Upload',41,'image','Unknown-8','Unknown-8.jpg','image/jpeg','public',6407,'[]','{\"uuid\":\"ad8a5438-3777-45ad-b935-e8750074e9f1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',64,'2021-12-24 21:24:07','2021-12-24 21:24:07'),(71,'App\\Models\\Upload',42,'image','Unknown-7','Unknown-7.jpg','image/jpeg','public',6254,'[]','{\"uuid\":\"6622d263-dd25-408a-8c88-d5bca5bd3b0e\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',65,'2021-12-24 21:24:12','2021-12-24 21:24:12'),(72,'App\\Models\\Upload',43,'image','Unknown-6','Unknown-6.jpg','image/jpeg','public',5888,'[]','{\"uuid\":\"e752069b-0626-4b38-a761-e454a4081c79\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',66,'2021-12-24 21:24:15','2021-12-24 21:24:16'),(73,'App\\Models\\Upload',44,'image','Unknown-5','Unknown-5.jpg','image/jpeg','public',6472,'[]','{\"uuid\":\"814dae36-98fb-4e36-a5ea-8c279de627aa\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',67,'2021-12-24 21:24:19','2021-12-24 21:24:19'),(74,'App\\Models\\Upload',45,'image','Unknown-4','Unknown-4.jpg','image/png','public',4537,'[]','{\"uuid\":\"940a8aad-62c0-4296-885e-486488575d0a\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',68,'2021-12-24 21:24:31','2021-12-24 21:24:31'),(75,'App\\Models\\Upload',46,'image','productimg','productimg.jpeg','image/jpeg','public',79910,'[]','{\"uuid\":\"614ea317-deee-4b81-9d75-293d5aae4e45\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',69,'2021-12-24 21:24:43','2021-12-24 21:24:43'),(76,'App\\Models\\Upload',47,'image','istockphoto-864501328-612x612','istockphoto-864501328-612x612.jpg','image/jpeg','public',49548,'[]','{\"uuid\":\"ab73f587-8019-445d-affc-1f3ba9d035cd\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',70,'2021-12-24 21:24:48','2021-12-24 21:24:48'),(77,'App\\Models\\Upload',48,'image','images-12','images-12.jpeg','image/jpeg','public',6827,'[]','{\"uuid\":\"24c9fa43-bd83-4592-b6c6-eb222a0d9791\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',71,'2021-12-24 21:24:53','2021-12-24 21:24:53'),(78,'App\\Models\\Upload',49,'image','images-11','images-11.jpeg','image/jpeg','public',7470,'[]','{\"uuid\":\"37c742c8-037b-4570-9542-de85bcfb5fa9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',72,'2021-12-24 21:24:59','2021-12-24 21:24:59'),(79,'App\\Models\\Upload',50,'image','images-10','images-10.jpeg','image/jpeg','public',3772,'[]','{\"uuid\":\"40cd5627-5ca4-45ae-88ee-fd09cfd0eddf\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',73,'2021-12-24 21:25:04','2021-12-24 21:25:04'),(80,'App\\Models\\Upload',51,'image','images-9','images-9.jpeg','image/jpeg','public',4037,'[]','{\"uuid\":\"8c7b47ad-093e-4667-9f96-3cef14ac2534\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',74,'2021-12-24 21:25:10','2021-12-24 21:25:11'),(81,'App\\Models\\Upload',52,'image','images-8','images-8.jpeg','image/jpeg','public',6503,'[]','{\"uuid\":\"36dadc91-18a9-481b-bbdc-1e9a96972b28\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',75,'2021-12-24 21:25:16','2021-12-24 21:25:16'),(82,'App\\Models\\Upload',53,'image','images-7','images-7.jpeg','image/jpeg','public',5137,'[]','{\"uuid\":\"1e6c1975-dc4f-4b66-a7a5-381a801af08b\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',76,'2021-12-24 21:25:23','2021-12-24 21:25:23'),(83,'App\\Models\\Upload',54,'image','images-6','images-6.jpeg','image/jpeg','public',5138,'[]','{\"uuid\":\"f5d48ef4-89fc-4b7d-92fc-f99e01286692\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',77,'2021-12-24 21:25:27','2021-12-24 21:25:27'),(84,'App\\Models\\Upload',55,'image','images-5','images-5.jpeg','image/jpeg','public',12249,'[]','{\"uuid\":\"fd52097b-cc14-4875-acad-9442c2b1fbad\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',78,'2021-12-24 21:25:33','2021-12-24 21:25:33'),(85,'App\\Models\\Upload',56,'image','HTB1bS8SalCw3KVjSZFuq6AAOpXaz','HTB1bS8SalCw3KVjSZFuq6AAOpXaz.jpg','image/jpeg','public',106455,'[]','{\"uuid\":\"80b57060-26ce-4883-9576-57bdc8460415\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',79,'2021-12-24 21:25:39','2021-12-24 21:25:39'),(86,'App\\Models\\Upload',57,'image','417n62rUDNL._AC_SY780_','417n62rUDNL._AC_SY780_.jpg','image/jpeg','public',22791,'[]','{\"uuid\":\"b6a5942c-47f2-4ac8-b419-1fa1c3db8d76\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',80,'2021-12-24 21:25:43','2021-12-24 21:25:43'),(92,'App\\Models\\Upload',58,'image','pampers-logo-D613293CC6-seeklogo.com','pampers-logo-D613293CC6-seeklogo.com.png','image/png','public',22560,'[]','{\"uuid\":\"b576e81f-836f-452a-b5b4-548189e101b2\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',86,'2021-12-24 22:14:07','2021-12-24 22:14:08'),(93,'App\\Models\\Upload',59,'image','images-14','images-14.jpeg','image/jpeg','public',6487,'[]','{\"uuid\":\"f488e3da-0cf5-4394-817e-1f44e4dbea88\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',87,'2021-12-24 22:14:32','2021-12-24 22:14:32'),(94,'App\\Models\\Upload',60,'image','images-13','images-13.jpeg','image/jpeg','public',10171,'[]','{\"uuid\":\"f7e50155-d217-4050-8f2f-a3378a8e5dde\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',88,'2021-12-24 22:14:40','2021-12-24 22:14:40'),(105,'App\\Models\\Upload',63,'image','Unknown-6','Unknown-6.png','image/jpeg','public',10552,'[]','{\"uuid\":\"5a338a07-a101-471b-b179-37f9fe1bb9a4\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',98,'2021-12-24 22:28:54','2021-12-24 22:28:54'),(106,'App\\Models\\Upload',64,'image','Unknown-5','Unknown-5.png','image/jpeg','public',8914,'[]','{\"uuid\":\"33d39cbb-c1cb-405d-ad53-e361586691e9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',99,'2021-12-24 22:29:01','2021-12-24 22:29:01'),(107,'App\\Models\\Upload',65,'image','Eng.+Fine+logo-1920w.png','Eng.+Fine+logo-1920w.png.png','image/webp','public',36200,'[]','{\"uuid\":\"cf629f32-449a-4dc4-af4b-e719f9913de6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',100,'2021-12-24 22:29:16','2021-12-24 22:29:16'),(108,'App\\Models\\Upload',66,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"39e6817d-61b2-45e9-94c3-7f9777da5d98\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',101,'2021-12-24 22:29:22','2021-12-24 22:29:22'),(109,'App\\Models\\Brand',3,'image','Eng.+Fine+logo-1920w.png','Eng.+Fine+logo-1920w.png.png','image/webp','public',36200,'[]','{\"uuid\":\"cf629f32-449a-4dc4-af4b-e719f9913de6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',102,'2021-12-24 22:29:42','2021-12-24 22:29:42'),(112,'App\\Models\\Upload',67,'image','Unknown5','Unknown5.png','image/jpeg','public',11657,'[]','{\"uuid\":\"24d6e828-555f-490f-8f27-2b6868eb330f\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',105,'2021-12-25 23:57:17','2021-12-25 23:57:17'),(113,'App\\Models\\Upload',68,'image','Unknown','Unknown.png','image/png','public',5827,'[]','{\"uuid\":\"a6edeb93-1371-4fe8-a271-d4f40527e846\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',106,'2021-12-25 23:57:34','2021-12-25 23:57:34'),(115,'App\\Models\\Upload',69,'image','Unknownff','Unknownff.jpg','image/jpeg','public',8430,'[]','{\"uuid\":\"a38b0a2e-e35a-4f8d-b3fa-bedccb9d8647\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',108,'2021-12-25 23:59:44','2021-12-25 23:59:44'),(116,'App\\Models\\Upload',70,'image','Unknownrrr','Unknownrrr.png','image/png','public',7142,'[]','{\"uuid\":\"a64c8b32-894a-49db-b649-3ef56a6e3a97\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',109,'2021-12-25 23:59:48','2021-12-25 23:59:48'),(117,'App\\Models\\Upload',71,'image','imageseew','imageseew.jpeg','image/jpeg','public',4858,'[]','{\"uuid\":\"8dc730e5-f19e-42fe-971b-17547c7e3870\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',110,'2021-12-25 23:59:53','2021-12-25 23:59:53'),(118,'App\\Models\\Pharmcy',1,'image','imageseew','imageseew.jpeg','image/jpeg','public',4858,'[]','{\"uuid\":\"8dc730e5-f19e-42fe-971b-17547c7e3870\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',111,'2021-12-25 23:59:57','2021-12-25 23:59:57'),(119,'App\\Models\\Pharmcy',1,'image','imageseew','imageseew.jpeg','image/jpeg','public',4858,'[]','{\"uuid\":\"8dc730e5-f19e-42fe-971b-17547c7e3870\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',112,'2021-12-26 00:01:49','2021-12-26 00:01:49'),(122,'App\\Models\\Upload',72,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"d6d8370a-6dee-46a5-b7ac-8cee2da3f48a\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',114,'2021-12-29 10:39:27','2021-12-29 10:39:27'),(123,'App\\Models\\Upload',73,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"24a85cc0-a39c-46b0-bb48-cdd3a2995607\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',115,'2021-12-29 10:40:02','2021-12-29 10:40:02'),(124,'App\\Models\\Upload',74,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"0dae8114-aaa9-42ce-97cc-b0be0deb1931\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',116,'2021-12-29 10:40:10','2021-12-29 10:40:10'),(125,'App\\Models\\Upload',75,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"65132b42-eaeb-4121-8237-b797c7446fa0\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',117,'2021-12-29 10:40:29','2021-12-29 10:40:29'),(127,'App\\Models\\Upload',76,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"21cebe07-25d2-40e3-a4b6-3618320e4369\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',119,'2021-12-29 10:45:03','2021-12-29 10:45:03'),(129,'App\\Models\\Upload',77,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"4eec20d3-921d-4c46-a55c-a477a96ade06\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',120,'2021-12-29 12:45:55','2021-12-29 12:45:55'),(130,'App\\Models\\Upload',78,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"4ea68941-674c-4589-82cf-a0ba856b6ce1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',121,'2021-12-29 12:45:55','2021-12-29 12:45:55'),(131,'App\\Models\\Upload',79,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"a32a59dc-8e9c-4898-af1e-4f0b70f9ec58\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',122,'2021-12-29 12:46:11','2021-12-29 12:46:11'),(132,'App\\Models\\Upload',80,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"e372eb0d-04f6-4dd8-ae58-18f6dc2830b7\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',123,'2021-12-29 12:46:11','2021-12-29 12:46:11'),(133,'App\\Models\\Upload',81,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"6cdad983-51b4-49c1-bae7-a7cf19eabf3b\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',124,'2021-12-29 12:46:11','2021-12-29 12:46:11'),(134,'App\\Models\\Upload',82,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"1d2ce9b6-c64f-4664-9726-5730fa30dd82\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',125,'2021-12-29 12:53:41','2021-12-29 12:53:41'),(135,'App\\Models\\Upload',83,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"ac8a0a16-0289-4fd9-bc3d-329c49505a5e\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',126,'2021-12-29 12:53:41','2021-12-29 12:53:41'),(136,'App\\Models\\Upload',84,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"c09e2e52-d208-4f5a-911c-e3bb69cbab6e\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',127,'2021-12-29 12:53:41','2021-12-29 12:53:41'),(137,'App\\Models\\Upload',85,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"ff1890f3-e172-4fd5-8c28-026536747de1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',128,'2021-12-29 13:02:18','2021-12-29 13:02:19'),(138,'App\\Models\\Upload',86,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"1d527da3-8de5-4534-962b-8d6f1b61abc8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',129,'2021-12-29 13:02:19','2021-12-29 13:02:19'),(139,'App\\Models\\Upload',87,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"b3ed0294-34a8-4ca2-922f-f743fecbae34\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',130,'2021-12-29 13:02:19','2021-12-29 13:02:19'),(140,'App\\Models\\Upload',88,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"66c07a90-2db3-44f9-8fce-daba2bac8dc0\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',131,'2021-12-29 13:02:19','2021-12-29 13:02:19'),(141,'App\\Models\\Upload',89,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"d29f5f35-040c-4abe-b5da-7b4ccdad986d\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',132,'2021-12-29 13:02:46','2021-12-29 13:02:46'),(142,'App\\Models\\Upload',90,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"d06b5ff4-75b4-4e60-95bf-7ce981ad543e\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',133,'2021-12-29 13:02:46','2021-12-29 13:02:46'),(143,'App\\Models\\Upload',91,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"4574e750-759a-4b76-970b-176eca387667\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',134,'2021-12-29 13:02:46','2021-12-29 13:02:46'),(144,'App\\Models\\Upload',92,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"c263f414-0622-4ea2-8559-cba2de7f9c3e\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',135,'2021-12-29 13:02:46','2021-12-29 13:02:47'),(145,'App\\Models\\Upload',93,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"2f57b556-b80b-4563-a6ab-584f66ad151c\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',136,'2021-12-29 13:02:47','2021-12-29 13:02:47'),(146,'App\\Models\\Upload',94,'image','av4','av4.jpg','image/jpeg','public',10321,'[]','{\"uuid\":\"599086f2-c78c-4e29-8be3-8b68e8c4920b\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',137,'2021-12-29 13:02:47','2021-12-29 13:02:47'),(147,'App\\Models\\Upload',95,'image','greex','greex.png','image/png','public',5193,'[]','{\"uuid\":\"7a310726-b3ba-467c-a9c5-11843c3034d5\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',138,'2021-12-29 13:02:47','2021-12-29 13:02:47'),(148,'App\\Models\\Upload',96,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"a4d13c29-d875-48e7-acbb-ace323a26c92\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',139,'2021-12-29 13:03:22','2021-12-29 13:03:22'),(149,'App\\Models\\Upload',97,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"17953c7e-67a1-48e8-8a29-b2c35df4f7e0\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',140,'2021-12-29 13:03:22','2021-12-29 13:03:22'),(150,'App\\Models\\Upload',98,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"658a44eb-c2d7-430b-83a8-ecdd6974a653\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',141,'2021-12-29 13:03:22','2021-12-29 13:03:22'),(151,'App\\Models\\Upload',99,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"c692b029-905b-4e4d-979e-3fbc848c0a96\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',142,'2021-12-29 13:03:23','2021-12-29 13:03:23'),(152,'App\\Models\\Upload',100,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"eb0f81ea-cf09-414e-80b3-72be7954a533\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',143,'2021-12-29 13:03:23','2021-12-29 13:03:23'),(153,'App\\Models\\Upload',101,'image','417n62rUDNL._AC_SY780_','417n62rUDNL._AC_SY780_.jpg','image/jpeg','public',22791,'[]','{\"uuid\":\"e8b3f369-d4e5-400b-8a25-e6fe38b52331\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',144,'2021-12-29 13:03:23','2021-12-29 13:03:23'),(154,'App\\Models\\Upload',102,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"c81dcc89-c6b0-44d7-9367-4df2a477dc59\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',145,'2021-12-29 13:03:23','2021-12-29 13:03:23'),(155,'App\\Models\\Upload',103,'image','images-10','images-10.jpeg','image/jpeg','public',3772,'[]','{\"uuid\":\"88b6676e-30e4-4dc9-ab6a-e6b1f575ebab\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',146,'2021-12-29 13:05:08','2021-12-29 13:05:08'),(156,'App\\Models\\Upload',104,'image','images-13','images-13.jpeg','image/jpeg','public',10171,'[]','{\"uuid\":\"1655063c-f57b-4945-9958-9444795a5acd\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',147,'2021-12-29 13:05:08','2021-12-29 13:05:08'),(158,'App\\Models\\Upload',105,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"d0d0937d-7779-415b-b200-81406858c904\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',148,'2021-12-29 13:36:22','2021-12-29 13:36:23'),(159,'App\\Models\\Upload',106,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"ad3424a3-2eb9-406a-bddf-6dc5220720c5\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',149,'2021-12-29 13:36:23','2021-12-29 13:36:23'),(160,'App\\Models\\Upload',107,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"7edac71e-3891-421d-9096-ccdc25dba9e8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',150,'2021-12-29 13:39:55','2021-12-29 13:39:55'),(161,'App\\Models\\Upload',108,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"6b1cb2b1-0cea-42ee-affb-22013d34616a\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',151,'2021-12-29 13:46:06','2021-12-29 13:46:06'),(162,'App\\Models\\Upload',109,'image','417n62rUDNL._AC_SY780_','417n62rUDNL._AC_SY780_.jpg','image/jpeg','public',22791,'[]','{\"uuid\":\"6048e97b-aa17-485c-a375-de3951a7fa84\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',152,'2021-12-29 14:03:56','2021-12-29 14:03:56'),(166,'App\\Models\\Upload',110,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"9ff901c6-c33d-4a30-919c-dbf5491f3e5b\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',155,'2021-12-29 14:15:53','2021-12-29 14:15:53'),(177,'App\\Models\\Upload',111,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"fea3cd0d-e7d6-4983-bda5-258c77c394af\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',156,'2021-12-29 15:28:21','2021-12-29 15:28:21'),(179,'App\\Models\\Upload',112,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"4b8d93da-57e6-4fcb-93b7-d60f505ea714\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',157,'2021-12-29 15:29:00','2021-12-29 15:29:00'),(180,'App\\Models\\Upload',113,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"2a4c8760-fa7e-4e7d-804e-be00a84f0539\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',158,'2021-12-29 15:29:00','2021-12-29 15:29:00'),(181,'App\\Models\\Upload',114,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"ecb82ba4-a3ce-4652-a2be-b287c974b522\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',159,'2021-12-29 15:29:00','2021-12-29 15:29:00'),(183,'App\\Models\\Upload',115,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"3281002a-fac8-4478-9084-6c921d5d8fe5\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',160,'2021-12-29 15:33:24','2021-12-29 15:33:24'),(184,'App\\Models\\Upload',116,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"d75c95e2-6929-41b3-82b6-2136755f040b\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',161,'2021-12-29 15:33:32','2021-12-29 15:33:33'),(185,'App\\Models\\Upload',117,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"4eb15451-7f45-41ba-94eb-5e95d517897c\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',162,'2021-12-29 15:33:56','2021-12-29 15:33:56'),(186,'App\\Models\\Upload',122,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"cc1ed511-1757-4b58-b4a9-cbd1fc9d0491\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',163,'2021-12-29 15:48:05','2021-12-29 15:48:05'),(187,'App\\Models\\Upload',135,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"90b72f96-9b9f-4cfd-8dcc-b449e646080c\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',164,'2021-12-29 16:13:55','2021-12-29 16:13:55'),(188,'App\\Models\\Upload',136,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"a61c924f-1a6e-4b15-ad8e-2423e4ee02c9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',165,'2021-12-29 16:14:04','2021-12-29 16:14:04'),(189,'App\\Models\\Upload',137,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"d491b0d5-251a-4b51-8309-dc7252ced887\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',166,'2021-12-29 16:14:04','2021-12-29 16:14:04'),(190,'App\\Models\\Upload',138,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"1e169348-c872-4986-8aa6-8ae5a18c9a41\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',167,'2021-12-29 16:14:20','2021-12-29 16:14:20'),(191,'App\\Models\\Upload',139,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"be106910-e615-460b-a060-ae5e5c427983\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',168,'2021-12-29 16:14:20','2021-12-29 16:14:20'),(192,'App\\Models\\Upload',140,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"3e889422-0d3f-4330-834f-5828bb34b6bc\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',169,'2021-12-29 16:14:20','2021-12-29 16:14:20'),(193,'App\\Models\\Upload',141,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"6cf89e04-9fff-4a55-ba82-a398fb50f1fb\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',170,'2021-12-29 16:14:20','2021-12-29 16:14:20'),(194,'App\\Models\\Upload',142,'image','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"c5ef7c69-2ab6-4869-ab77-5397132adecd\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',171,'2021-12-29 16:16:10','2021-12-29 16:16:10'),(195,'App\\Models\\Upload',143,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"8f46a113-646c-42ba-b71f-29af059fbbaa\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',172,'2021-12-29 16:16:11','2021-12-29 16:16:11'),(196,'App\\Models\\Upload',144,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"fe0878ec-2883-4534-afaf-557595edf286\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',173,'2021-12-29 16:16:11','2021-12-29 16:16:11'),(198,'App\\Models\\Upload',145,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"f95659a9-1fa6-424e-93ff-2ecb1de39665\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',174,'2021-12-29 16:37:40','2021-12-29 16:37:40'),(199,'App\\Models\\Upload',146,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"07f21f59-5e1f-4323-b499-8de6933155d9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',175,'2021-12-29 16:37:40','2021-12-29 16:37:40'),(201,'App\\Models\\Upload',147,'image','41087DDoRDL._AC_','41087DDoRDL._AC_.jpg','image/jpeg','public',27035,'[]','{\"uuid\":\"f33fad06-af21-4835-ba6a-ca99328b8184\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',176,'2021-12-29 16:44:55','2021-12-29 16:44:55'),(203,'App\\Models\\Upload',148,'image','2-2','2-2.jpg','image/jpeg','public',34965,'[]','{\"uuid\":\"aaff6cb6-287f-4a80-8cbb-c0eab7703885\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',177,'2021-12-29 21:13:56','2021-12-29 21:13:56'),(204,'App\\Models\\Upload',149,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"1b6fbb8b-f3f0-43fd-97d0-79db6752b155\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',178,'2021-12-29 21:13:56','2021-12-29 21:13:56'),(212,'App\\Models\\Brand',1,'image','images-13','images-13.jpeg','image/jpeg','public',10171,'[]','{\"uuid\":\"1655063c-f57b-4945-9958-9444795a5acd\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',181,'2021-12-29 21:20:18','2021-12-29 21:20:18'),(225,'App\\Models\\Upload',150,'image','av2','av2.png','image/png','public',5469,'[]','{\"uuid\":\"0ce82fc4-7b7e-4406-b09e-4dfaeda96648\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',192,'2021-12-30 14:22:11','2021-12-30 14:22:11'),(227,'App\\Models\\Upload',152,'image','Unknownrrr','Unknownrrr.png','image/png','public',7142,'[]','{\"uuid\":\"c1608c44-74c4-4f6b-92d6-b803be86bb86\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',193,'2021-12-30 14:22:55','2021-12-30 14:22:55'),(228,'App\\Models\\Upload',153,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"a0ac0763-da55-4208-8f30-ac370e876ffc\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',194,'2021-12-30 14:23:00','2021-12-30 14:23:00'),(233,'App\\Models\\Upload',155,'image','6e20ef3016f48b1d20f8e50d6b6d8aa286b413d0','6e20ef3016f48b1d20f8e50d6b6d8aa286b413d0.jpg','image/webp','public',56870,'[]','{\"uuid\":\"59ca6ab9-9b10-471d-8626-768f556abea1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',196,'2021-12-30 17:17:34','2021-12-30 17:17:34'),(234,'App\\Models\\Upload',156,'image','images-15','images-15.jpeg','image/jpeg','public',13704,'[]','{\"uuid\":\"e05a4f64-cba1-4401-85ab-0121c8c46dd6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',197,'2021-12-30 17:17:34','2021-12-30 17:17:34'),(235,'App\\Models\\Upload',157,'image','images-16','images-16.jpeg','image/jpeg','public',12992,'[]','{\"uuid\":\"06cf0bc7-9228-4185-bdf8-b490266d9a33\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',198,'2021-12-30 17:17:34','2021-12-30 17:17:34'),(236,'App\\Models\\Upload',158,'image','item_XL_22712933_32309315','item_XL_22712933_32309315.jpg','image/jpeg','public',45874,'[]','{\"uuid\":\"f6edaaa0-c96a-45f5-a274-5ac62d0eeba2\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',199,'2021-12-30 17:17:34','2021-12-30 17:17:35'),(237,'App\\Models\\Upload',159,'image','Unknown-4hh','Unknown-4hh.png','image/jpeg','public',11310,'[]','{\"uuid\":\"c271037d-778c-46d8-9801-61121e429ffb\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',200,'2021-12-30 17:17:35','2021-12-30 17:17:35'),(238,'App\\Models\\Pruduct',5,'image','6e20ef3016f48b1d20f8e50d6b6d8aa286b413d0','6e20ef3016f48b1d20f8e50d6b6d8aa286b413d0.jpg','image/webp','public',56870,'[]','{\"uuid\":\"59ca6ab9-9b10-471d-8626-768f556abea1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',201,'2021-12-30 17:17:57','2021-12-30 17:17:57'),(239,'App\\Models\\Pruduct',5,'image','images-15','images-15.jpeg','image/jpeg','public',13704,'[]','{\"uuid\":\"e05a4f64-cba1-4401-85ab-0121c8c46dd6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',202,'2021-12-30 17:17:58','2021-12-30 17:17:58'),(240,'App\\Models\\Pruduct',5,'image','images-16','images-16.jpeg','image/jpeg','public',12992,'[]','{\"uuid\":\"06cf0bc7-9228-4185-bdf8-b490266d9a33\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',203,'2021-12-30 17:17:58','2021-12-30 17:17:58'),(241,'App\\Models\\Pruduct',5,'image','item_XL_22712933_32309315','item_XL_22712933_32309315.jpg','image/jpeg','public',45874,'[]','{\"uuid\":\"f6edaaa0-c96a-45f5-a274-5ac62d0eeba2\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',204,'2021-12-30 17:17:58','2021-12-30 17:17:58'),(242,'App\\Models\\Pruduct',5,'image','Unknown-4hh','Unknown-4hh.png','image/jpeg','public',11310,'[]','{\"uuid\":\"c271037d-778c-46d8-9801-61121e429ffb\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',205,'2021-12-30 17:17:58','2021-12-30 17:17:58'),(243,'App\\Models\\Pruduct',4,'image','images-16','images-16.jpeg','image/jpeg','public',12992,'[]','{\"uuid\":\"06cf0bc7-9228-4185-bdf8-b490266d9a33\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',206,'2021-12-30 22:24:23','2021-12-30 22:24:23'),(244,'App\\Models\\Pruduct',4,'image','images-15','images-15.jpeg','image/jpeg','public',13704,'[]','{\"uuid\":\"e05a4f64-cba1-4401-85ab-0121c8c46dd6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',207,'2021-12-30 22:24:23','2021-12-30 22:24:23'),(245,'App\\Models\\Pruduct',4,'image','6e20ef3016f48b1d20f8e50d6b6d8aa286b413d0','6e20ef3016f48b1d20f8e50d6b6d8aa286b413d0.jpg','image/webp','public',56870,'[]','{\"uuid\":\"59ca6ab9-9b10-471d-8626-768f556abea1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',208,'2021-12-30 22:24:23','2021-12-30 22:24:23'),(247,'App\\Models\\Upload',161,'app_logo','Makeup','Makeup.png','image/png','public',110433,'[]','{\"uuid\":\"3af4f868-0d75-49a0-8ca4-d461eeb4ee83\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',210,'2021-12-31 11:41:18','2021-12-31 11:41:19'),(248,'App\\Models\\Pharmcy',2,'image','Unknown','Unknown.png','image/png','public',5827,'[]','{\"uuid\":\"a6edeb93-1371-4fe8-a271-d4f40527e846\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',211,'2021-12-31 14:17:40','2021-12-31 14:17:40'),(249,'App\\Models\\Slide',4,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"a0ac0763-da55-4208-8f30-ac370e876ffc\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',212,'2022-01-01 14:24:52','2022-01-01 14:24:52'),(250,'App\\Models\\Slide',1,'image','Breathing_1431973268-640w.jpg','Breathing_1431973268-640w.jpg.png','image/webp','public',21706,'[]','{\"uuid\":\"a0ac0763-da55-4208-8f30-ac370e876ffc\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',213,'2022-01-01 14:25:14','2022-01-01 14:25:14'),(252,'App\\Models\\Upload',162,'image','men-products-01','men-products-01.jpg','image/jpeg','public',221754,'[]','{\"uuid\":\"1585f89c-03a3-49cf-b7b4-26b431cfd9b2\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',215,'2022-01-01 14:28:54','2022-01-01 14:28:54'),(254,'App\\Models\\Upload',163,'image','imagesسس','imagesسس.jpg','image/jpeg','public',5512,'[]','{\"uuid\":\"89794809-ccf6-4ada-8e8c-d5828a50efcc\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',217,'2022-01-01 14:32:57','2022-01-01 14:32:57'),(255,'App\\Models\\Upload',164,'image','imageسسs','imageسسs.jpg','image/jpeg','public',6967,'[]','{\"uuid\":\"9240bf53-3c96-4a74-b379-8f95d41dd0c4\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',218,'2022-01-01 14:33:02','2022-01-01 14:33:02'),(256,'App\\Models\\Upload',165,'image','صناعة_الصابون_بزيت_الزيتون','صناعة_الصابون_بزيت_الزيتون.jpg','image/jpeg','public',33073,'[]','{\"uuid\":\"0c82026f-db1e-4fae-997c-12f12b52af67\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',219,'2022-01-01 14:33:06','2022-01-01 14:33:06'),(257,'App\\Models\\Upload',166,'image','imaييges','imaييges.jpg','image/jpeg','public',8274,'[]','{\"uuid\":\"c26f3089-bf07-475f-a1fd-6707847d028c\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',220,'2022-01-01 14:33:13','2022-01-01 14:33:13'),(261,'App\\Models\\Slide',2,'image','صناعة_الصابون_بزيت_الزيتون','صناعة_الصابون_بزيت_الزيتون.jpg','image/jpeg','public',33073,'[]','{\"uuid\":\"0c82026f-db1e-4fae-997c-12f12b52af67\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',224,'2022-01-01 14:34:28','2022-01-01 14:34:28'),(263,'App\\Models\\Upload',167,'image','٢٠٢١٠٦٠٦_١٩٠٤٢٩','٢٠٢١٠٦٠٦_١٩٠٤٢٩.jpg','image/jpeg','public',47616,'[]','{\"uuid\":\"92f3fe91-3153-499b-86e5-26ddfecf51e1\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',226,'2022-01-01 16:45:43','2022-01-01 16:45:43'),(264,'App\\Models\\Upload',168,'image','imagesزز','imagesزز.jpg','image/jpeg','public',6581,'[]','{\"uuid\":\"14122a80-7bcf-4996-a5fd-c0d32e477b6f\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',227,'2022-01-01 16:45:47','2022-01-01 16:45:47'),(265,'App\\Models\\Upload',169,'image','istock-505820296','istock-505820296.jpg','image/jpeg','public',216094,'[]','{\"uuid\":\"2bddb130-61ef-4987-bcff-6667153a0627\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',228,'2022-01-01 16:46:01','2022-01-01 16:46:01'),(266,'App\\Models\\Upload',170,'image','أسس_العناية_بالفم_والأسنان','أسس_العناية_بالفم_والأسنان.jpg','image/jpeg','public',17294,'[]','{\"uuid\":\"e426ef7e-c632-47c4-ab65-d808084d59f4\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',229,'2022-01-01 16:46:05','2022-01-01 16:46:05'),(270,'App\\Models\\Upload',171,'app_action1','1','1.jpg','image/jpeg','public',28019,'[]','{\"uuid\":\"50781abb-5347-4624-840a-618595507858\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',233,'2022-01-04 14:24:18','2022-01-04 14:24:18'),(271,'App\\Models\\Upload',172,'app_action2','٢٠٢١٠٦٠٦_١٩٠٤٢٩','٢٠٢١٠٦٠٦_١٩٠٤٢٩.jpg','image/jpeg','public',47616,'[]','{\"uuid\":\"f7367619-1416-47b7-9d05-c3f60ebdca3e\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',234,'2022-01-04 14:28:13','2022-01-04 14:28:14'),(272,'App\\Models\\Upload',173,'app_action1','imageسسs','imageسسs.jpg','image/jpeg','public',6967,'[]','{\"uuid\":\"3d673b71-c75e-427f-b48a-f49569af4828\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',235,'2022-01-04 14:28:28','2022-01-04 14:28:28'),(273,'App\\Models\\Upload',174,'app_logo','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"e1cb967e-6b79-4a74-aca2-9107a242afa9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',236,'2022-01-04 14:32:59','2022-01-04 14:32:59'),(274,'App\\Models\\Upload',175,'app_action1','take-a-survey-feature-earn-tile-2x','take-a-survey-feature-earn-tile-2x.png','image/webp','public',30252,'[]','{\"uuid\":\"03b5bbac-040b-4587-b2af-bfbd8f218a20\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',237,'2022-01-04 17:27:39','2022-01-04 17:27:39'),(275,'App\\Models\\Upload',176,'app_action1','360_F_248397538_OsyBnjShqT7IRsCRIgVSkq5dSWbwRN0g','360_F_248397538_OsyBnjShqT7IRsCRIgVSkq5dSWbwRN0g.jpg','image/jpeg','public',24487,'[]','{\"uuid\":\"bac702d2-e940-4630-8a4f-ec5da7c54fea\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',238,'2022-01-04 17:33:52','2022-01-04 17:33:52'),(277,'App\\Models\\Upload',177,'image','81QL9tgccTL._AC_SL500_','81QL9tgccTL._AC_SL500_.jpg','image/jpeg','public',35928,'[]','{\"uuid\":\"33eff923-c1fc-44c8-89e0-ee3a0f7de771\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',240,'2022-02-01 23:56:03','2022-02-01 23:56:04'),(278,'App\\Models\\Pruduct',6,'image','81QL9tgccTL._AC_SL500_','81QL9tgccTL._AC_SL500_.jpg','image/jpeg','public',35928,'[]','{\"uuid\":\"33eff923-c1fc-44c8-89e0-ee3a0f7de771\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',241,'2022-02-01 23:56:58','2022-02-01 23:56:58'),(279,'App\\Models\\Upload',178,'image','81laG8vuNXS._AC_SL500_','81laG8vuNXS._AC_SL500_.jpg','image/jpeg','public',44595,'[]','{\"uuid\":\"265d7503-12fe-4bea-9796-41c4ce794ddf\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',242,'2022-02-02 00:07:48','2022-02-02 00:07:48'),(280,'App\\Models\\Pruduct',7,'image','81laG8vuNXS._AC_SL500_','81laG8vuNXS._AC_SL500_.jpg','image/jpeg','public',44595,'[]','{\"uuid\":\"265d7503-12fe-4bea-9796-41c4ce794ddf\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',243,'2022-02-02 00:08:13','2022-02-02 00:08:13'),(285,'App\\Models\\Upload',179,'image','c3236a93074029.5e5be079d9963','c3236a93074029.5e5be079d9963.jpg','image/jpeg','public',494915,'[]','{\"uuid\":\"903218a9-c898-4845-abbb-5631a4ce8eb7\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',247,'2022-02-06 20:52:26','2022-02-06 20:52:26'),(286,'App\\Models\\Campagin',4,'image','c3236a93074029.5e5be079d9963','c3236a93074029.5e5be079d9963.jpg','image/jpeg','public',494915,'[]','{\"uuid\":\"903218a9-c898-4845-abbb-5631a4ce8eb7\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',248,'2022-02-06 20:52:28','2022-02-06 20:52:28'),(287,'App\\Models\\Campagin',3,'image','3-2','3-2.jpg','image/jpeg','public',37024,'[]','{\"uuid\":\"07f21f59-5e1f-4323-b499-8de6933155d9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',249,'2022-02-06 20:54:20','2022-02-06 20:54:20'),(288,'App\\Models\\Campagin',2,'image','1-2','1-2.jpg','image/jpeg','public',37580,'[]','{\"uuid\":\"fea3cd0d-e7d6-4983-bda5-258c77c394af\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',250,'2022-02-06 20:55:31','2022-02-06 20:55:31'),(289,'App\\Models\\Upload',180,'avatar','real-estate-and-property','real-estate-and-property.jpg','image/jpeg','public',304572,'[]','{\"uuid\":\"d3acecc9-c414-4b33-a34d-514628eef895\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',251,'2022-02-08 13:48:20','2022-02-08 13:48:21'),(291,'App\\Models\\Brand',4,'image','81laG8vuNXS._AC_SL500_','81laG8vuNXS._AC_SL500_.jpg','image/jpeg','public',44595,'[]','{\"uuid\":\"265d7503-12fe-4bea-9796-41c4ce794ddf\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',252,'2022-04-18 22:49:03','2022-04-18 22:49:03'),(295,'App\\Models\\Upload',181,'app_logo','indexjj','indexjj.jpg','image/jpeg','public',7774,'[]','{\"uuid\":\"81001051-a6c1-4e5a-a6b6-d4910811806f\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',256,'2022-06-21 00:29:46','2022-06-21 00:29:46'),(296,'App\\Models\\Upload',182,'image','1','1.png','image/png','public',50271,'[]','{\"uuid\":\"fb19619f-5802-4b00-adad-4743da65cf47\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',257,'2022-06-21 00:37:19','2022-06-21 00:37:19'),(297,'App\\Models\\Upload',183,'image2','imagestt','imagestt.jpg','image/jpeg','public',11894,'[]','{\"uuid\":\"614ace5b-e99c-4567-be7b-3b91fc0639f8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',258,'2022-06-21 00:37:29','2022-06-21 00:37:29'),(301,'App\\Models\\Upload',185,'image','WhatsApp Image 2022-06-21 at 7.00.00 PM','WhatsApp-Image-2022-06-21-at-7.00.00-PM.jpeg','image/jpeg','public',54048,'[]','{\"uuid\":\"ab259a4e-febc-4569-b571-83c534869857\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',262,'2022-06-21 15:01:18','2022-06-21 15:01:19'),(304,'App\\Models\\MainCategorie',8,'image','1','1.png','image/png','public',50271,'[]','{\"uuid\":\"fb19619f-5802-4b00-adad-4743da65cf47\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',265,'2022-06-21 15:04:38','2022-06-21 15:04:38'),(309,'App\\Models\\Upload',186,'image','4394705_dumbbells_gym_sports_utensils_weight_icon','4394705_dumbbells_gym_sports_utensils_weight_icon.png','image/png','public',10672,'[]','{\"uuid\":\"769e45e5-39e7-4f0f-af24-1da00347448d\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',267,'2022-06-21 15:33:56','2022-06-21 15:33:56'),(310,'App\\Models\\MainCategorie',4,'image','4394705_dumbbells_gym_sports_utensils_weight_icon','4394705_dumbbells_gym_sports_utensils_weight_icon.png','image/png','public',10672,'[]','{\"uuid\":\"769e45e5-39e7-4f0f-af24-1da00347448d\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',268,'2022-06-21 15:34:04','2022-06-21 15:34:04'),(311,'App\\Models\\Upload',187,'image','5041098_blood_donation_health_healthcare_medic_icon','5041098_blood_donation_health_healthcare_medic_icon.png','image/png','public',10484,'[]','{\"uuid\":\"973570cd-aa50-434c-984d-35c7c9abad61\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',269,'2022-06-21 15:41:59','2022-06-21 15:41:59'),(313,'App\\Models\\Upload',188,'image','5041098_blood_donation_health_healthcare_medic_icon','5041098_blood_donation_health_healthcare_medic_icon.png','image/png','public',10484,'[]','{\"uuid\":\"19eabdf9-3ad2-4673-9714-5ed3717348a8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',270,'2022-06-21 15:43:17','2022-06-21 15:43:17'),(314,'App\\Models\\MainCategorie',12,'image','5041098_blood_donation_health_healthcare_medic_icon','5041098_blood_donation_health_healthcare_medic_icon.png','image/png','public',10484,'[]','{\"uuid\":\"19eabdf9-3ad2-4673-9714-5ed3717348a8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',271,'2022-06-21 15:43:18','2022-06-21 15:43:18'),(319,'App\\Models\\Upload',189,'image2','imagesss','imagesss.jpg','image/jpeg','public',15123,'[]','{\"uuid\":\"155a317c-7e46-43ab-b08a-5c36f5203366\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',276,'2022-06-21 18:15:29','2022-06-21 18:15:29'),(321,'App\\Models\\Upload',190,'image2','imagesmn','imagesmn.jpg','image/jpeg','public',11983,'[]','{\"uuid\":\"4c59987e-b22c-45e7-9a7e-76c0336ba2af\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',278,'2022-06-21 18:16:00','2022-06-21 18:16:00'),(323,'App\\Models\\Upload',191,'image','indexسسس','indexسسس.jpg','image/jpeg','public',14943,'[]','{\"uuid\":\"afe0b58c-159f-4e02-a533-5b4261c0ee40\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',280,'2022-06-21 18:21:20','2022-06-21 18:21:21'),(324,'App\\Models\\SubCategorie',3,'image','indexسسس','indexسسس.jpg','image/jpeg','public',14943,'[]','{\"uuid\":\"afe0b58c-159f-4e02-a533-5b4261c0ee40\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',281,'2022-06-21 18:21:25','2022-06-21 18:21:25'),(325,'App\\Models\\Upload',192,'image','أفضل-مطاعم-للمشويات-في-القاهرة','أفضل-مطاعم-للمشويات-في-القاهرة.jpg','image/jpeg','public',82862,'[]','{\"uuid\":\"a6f25857-e41a-48c1-b4bb-0981bf63c1d6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',282,'2022-06-21 18:24:13','2022-06-21 18:24:13'),(326,'App\\Models\\SubCategorie',2,'image','أفضل-مطاعم-للمشويات-في-القاهرة','أفضل-مطاعم-للمشويات-في-القاهرة.jpg','image/jpeg','public',82862,'[]','{\"uuid\":\"a6f25857-e41a-48c1-b4bb-0981bf63c1d6\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',283,'2022-06-21 18:24:15','2022-06-21 18:24:15'),(327,'App\\Models\\Upload',193,'image','indexطوتط','indexطوتط.jpg','image/jpeg','public',13126,'[]','{\"uuid\":\"e2c276b3-eafa-4937-93cf-5214ec2031e8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',284,'2022-06-21 18:26:55','2022-06-21 18:26:55'),(328,'App\\Models\\SubCategorie',4,'image','indexطوتط','indexطوتط.jpg','image/jpeg','public',13126,'[]','{\"uuid\":\"e2c276b3-eafa-4937-93cf-5214ec2031e8\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',285,'2022-06-21 18:26:58','2022-06-21 18:26:58'),(329,'App\\Models\\Upload',194,'image','سسسس','سسسس.jpg','image/jpeg','public',12301,'[]','{\"uuid\":\"47cddc41-295b-4366-89c4-c03d9b389141\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',286,'2022-06-21 18:28:08','2022-06-21 18:28:08'),(330,'App\\Models\\SubCategorie',5,'image','سسسس','سسسس.jpg','image/jpeg','public',12301,'[]','{\"uuid\":\"47cddc41-295b-4366-89c4-c03d9b389141\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',287,'2022-06-21 18:28:13','2022-06-21 18:28:13'),(331,'App\\Models\\Upload',195,'image','طتسيستطتس','طتسيستطتس.jpg','image/jpeg','public',11197,'[]','{\"uuid\":\"1c630b86-1359-48b3-ac2a-2c1106d98c64\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',288,'2022-06-21 18:29:08','2022-06-21 18:29:08'),(332,'App\\Models\\SubCategorie',6,'image','طتسيستطتس','طتسيستطتس.jpg','image/jpeg','public',11197,'[]','{\"uuid\":\"1c630b86-1359-48b3-ac2a-2c1106d98c64\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',289,'2022-06-21 18:29:11','2022-06-21 18:29:11'),(333,'App\\Models\\Upload',196,'image2','indeسسx','indeسسx.jpg','image/jpeg','public',14665,'[]','{\"uuid\":\"f1efd2ac-c495-410d-b691-5024731bee54\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',290,'2022-06-21 18:30:24','2022-06-21 18:30:24'),(334,'App\\Models\\MainCategorie',8,'image2','indeسسx','indeسسx.jpg','image/jpeg','public',14665,'[]','{\"uuid\":\"f1efd2ac-c495-410d-b691-5024731bee54\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',291,'2022-06-21 18:30:26','2022-06-21 18:30:26'),(335,'App\\Models\\Upload',197,'image2','insssdex','insssdex.jpg','image/jpeg','public',9522,'[]','{\"uuid\":\"b6f4d89c-167a-4c6d-9eab-476ca044a2e9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',292,'2022-06-21 18:31:50','2022-06-21 18:31:50'),(336,'App\\Models\\MainCategorie',4,'image2','insssdex','insssdex.jpg','image/jpeg','public',9522,'[]','{\"uuid\":\"b6f4d89c-167a-4c6d-9eab-476ca044a2e9\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',293,'2022-06-21 18:31:52','2022-06-21 18:31:52'),(337,'App\\Models\\Upload',198,'image','imagestt','imagestt.jpg','image/jpeg','public',11894,'[]','{\"uuid\":\"669539cf-7b97-4870-9818-f6bc7a7ed884\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',294,'2022-06-21 18:33:14','2022-06-21 18:33:14'),(338,'App\\Models\\ProudctCopon',1,'image','imagestt','imagestt.jpg','image/jpeg','public',11894,'[]','{\"uuid\":\"669539cf-7b97-4870-9818-f6bc7a7ed884\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',295,'2022-06-21 18:33:19','2022-06-21 18:33:19'),(339,'App\\Models\\Upload',199,'image2','indeسسسx','indeسسسx.jpg','image/jpeg','public',8899,'[]','{\"uuid\":\"248a86e3-9323-4765-9e9f-8d9681f7dad4\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',296,'2022-06-21 18:37:09','2022-06-21 18:37:09'),(340,'App\\Models\\MainCategorie',12,'image2','indeسسسx','indeسسسx.jpg','image/jpeg','public',8899,'[]','{\"uuid\":\"248a86e3-9323-4765-9e9f-8d9681f7dad4\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',297,'2022-06-21 18:37:11','2022-06-21 18:37:11'),(341,'App\\Models\\Upload',200,'image','indeسسسسسx','indeسسسسسx.jpg','image/jpeg','public',7683,'[]','{\"uuid\":\"7a12d233-cfdd-4794-a397-b7bb4cd2b409\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',298,'2022-06-21 18:37:48','2022-06-21 18:37:48'),(342,'App\\Models\\SubCategorie',1,'image','indeسسسسسx','indeسسسسسx.jpg','image/jpeg','public',7683,'[]','{\"uuid\":\"7a12d233-cfdd-4794-a397-b7bb4cd2b409\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',299,'2022-06-21 18:37:57','2022-06-21 18:37:57'),(343,'App\\Models\\Upload',201,'image','imagسستes','imagسستes.jpg','image/jpeg','public',7739,'[]','{\"uuid\":\"623eff66-e749-4f38-a424-d3328a645dc3\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',300,'2022-06-21 18:38:21','2022-06-21 18:38:21'),(344,'App\\Models\\SubCategorie',7,'image','imagسستes','imagسستes.jpg','image/jpeg','public',7739,'[]','{\"uuid\":\"623eff66-e749-4f38-a424-d3328a645dc3\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',301,'2022-06-21 18:38:26','2022-06-21 18:38:26'),(345,'App\\Models\\Upload',202,'avatar','arabica','arabica.png','image/png','public',24803,'[]','{\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',302,'2022-07-16 20:27:46','2022-07-16 20:27:46'),(346,'App\\Models\\Upload',203,'avatar','arabica','arabica.png','image/png','public',24803,'[]','{\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',303,'2022-07-16 20:32:30','2022-07-16 20:32:30'),(348,'App\\Models\\Upload',204,'avatar','arabica','arabica.png','image/png','public',24803,'[]','{\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',304,'2022-07-16 20:32:46','2022-07-16 20:32:46'),(350,'App\\Models\\Upload',207,'avatar','arabica','arabica.png','image/png','public',24803,'[]','{\"uuid\":\"a1c68450-cdd4-428c-88d9-8d065aa09383\",\"user_id\":\"7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',305,'2022-07-16 20:38:51','2022-07-16 20:38:51'),(352,'App\\Models\\Upload',208,'avatar','arabica','arabica.png','image/png','public',24803,'[]','{\"uuid\":\"e5157071-b364-4bdb-b7bd-8a02e36a9c6d\",\"user_id\":\"7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',306,'2022-07-16 20:38:59','2022-07-16 20:39:00'),(354,'App\\Models\\Upload',209,'avatar','flame','flame.png','image/png','public',50130,'[]','{\"uuid\":\"67a8f76c-9087-49fc-afc8-a57bc5f8c6b0\",\"user_id\":\"7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',307,'2022-07-16 20:44:21','2022-07-16 20:44:21'),(356,'App\\Models\\Upload',210,'avatar','flame','flame.png','image/png','public',50130,'[]','{\"uuid\":\"92e0362f-85a1-4956-a947-ccb087dd4208\",\"user_id\":\"7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',308,'2022-07-16 20:46:38','2022-07-16 20:46:38'),(358,'App\\Models\\Upload',211,'avatar','arabica','arabica.png','image/png','public',24803,'[]','{\"uuid\":\"c543bbe1-c4c1-4729-baeb-d5711b8920ce\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',310,'2022-07-16 20:47:57','2022-07-16 20:47:57'),(360,'App\\Models\\Upload',212,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"7b631c3b-7a8f-4ffc-aee0-1b550b5c44de\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',311,'2022-07-16 23:31:04','2022-07-16 23:31:04'),(362,'App\\Models\\Upload',213,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"ec12fd64-60d1-40a7-b5a4-ca4ede2b388d\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',312,'2022-07-16 23:32:44','2022-07-16 23:32:45'),(364,'App\\Models\\Upload',214,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"5fdfe468-7594-4fcf-8d06-f49640cd1580\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',313,'2022-07-16 23:34:14','2022-07-16 23:34:15'),(366,'App\\Models\\Upload',215,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"511a338c-7d8e-40bb-a924-9d6c73b031a9\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',314,'2022-07-16 23:34:26','2022-07-16 23:34:26'),(368,'App\\Models\\Upload',216,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"618c123c-a6f7-4bab-b7e7-8dc5019048e3\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',315,'2022-07-16 23:37:37','2022-07-16 23:37:38'),(370,'App\\Models\\Upload',217,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"cc98a06f-40a9-4276-acf5-b3dced449737\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',316,'2022-07-16 23:38:59','2022-07-16 23:39:00'),(372,'App\\Models\\Upload',218,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"f7d6b8ad-1a55-41c3-afb7-ecef2683d802\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',317,'2022-07-16 23:41:36','2022-07-16 23:41:36'),(374,'App\\Models\\Upload',219,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"0cbff53e-b900-4696-8656-2408f078c359\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',318,'2022-07-16 23:44:02','2022-07-16 23:44:03'),(376,'App\\Models\\Upload',220,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"6a87a8cb-f4d3-4f46-8cad-3a72ff2bd707\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',319,'2022-07-16 23:47:26','2022-07-16 23:47:27'),(378,'App\\Models\\Upload',221,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"d69076c7-3ac0-4a79-81fa-0102dfadde37\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',320,'2022-07-16 23:48:05','2022-07-16 23:48:06'),(380,'App\\Models\\Upload',222,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"fb59a995-0a79-44de-93f4-99e5ed62f403\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',321,'2022-07-16 23:48:33','2022-07-16 23:48:34'),(382,'App\\Models\\Upload',223,'avatar','image_picker4830427973194875888','image_picker4830427973194875888.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"6cfb453e-c1ee-43f4-9d3e-38ada93c8e6d\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',322,'2022-07-16 23:48:55','2022-07-16 23:48:56'),(384,'App\\Models\\Upload',224,'avatar','image_picker6849895203863065562','image_picker6849895203863065562.jpg','image/jpeg','public',1295226,'[]','{\"uuid\":\"b17de3d5-169a-434c-8d2a-9e4fd04b0ff2\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',323,'2022-07-17 00:21:39','2022-07-17 00:21:40'),(386,'App\\Models\\Upload',225,'avatar','image_picker6009759844674755474','image_picker6009759844674755474.jpg','image/jpeg','public',969505,'[]','{\"uuid\":\"b0e4320a-fbc9-44c6-b29e-23ab7a3babea\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',324,'2022-07-17 00:22:42','2022-07-17 00:22:43'),(388,'App\\Models\\Upload',226,'avatar','image_picker877424883541106378','image_picker877424883541106378.jpg','image/jpeg','public',1295226,'[]','{\"uuid\":\"3d427a34-aec1-4276-a800-67bb1448b24b\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',325,'2022-07-17 00:46:40','2022-07-17 00:46:41'),(390,'App\\Models\\Upload',227,'avatar','image_picker8651115025381352567','image_picker8651115025381352567.png','image/png','public',841683,'[]','{\"uuid\":\"23fa6663-3bec-4b00-abbd-6e576150374c\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',326,'2022-07-17 02:24:16','2022-07-17 02:24:17'),(391,'App\\Models\\User',10,'avatar','image_picker8651115025381352567','image_picker8651115025381352567.png','image/png','public',841683,'[]','{\"uuid\":\"23fa6663-3bec-4b00-abbd-6e576150374c\",\"user_id\":\"10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',327,'2022-07-17 02:24:17','2022-07-17 02:24:17'),(392,'App\\Models\\Upload',228,'avatar','image_picker5831167562426038470','image_picker5831167562426038470.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"705c9b8f-72e0-46a6-92ea-329679367fc3\",\"user_id\":\"8\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',328,'2022-07-17 02:33:56','2022-07-17 02:33:56'),(393,'App\\Models\\User',8,'avatar','image_picker5831167562426038470','image_picker5831167562426038470.jpg','image/jpeg','public',1267165,'[]','{\"uuid\":\"705c9b8f-72e0-46a6-92ea-329679367fc3\",\"user_id\":\"8\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',329,'2022-07-17 02:33:56','2022-07-17 02:33:56'),(394,'App\\Models\\airplan',1,'image','طتسيستطتس','طتسيستطتس.jpg','image/jpeg','public',11197,'[]','{\"uuid\":\"1c630b86-1359-48b3-ac2a-2c1106d98c64\",\"user_id\":7,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',330,'2022-07-17 12:50:20','2022-07-17 12:50:20'),(395,'App\\Models\\Upload',229,'avatar','image_picker8689977630134777850','image_picker8689977630134777850.png','image/png','public',409239,'[]','{\"uuid\":\"3e1d5dc9-035d-4b8d-b8a9-f7525c696e56\",\"user_id\":\"7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',331,'2022-07-17 14:17:27','2022-07-17 14:17:27'),(396,'App\\Models\\User',7,'avatar','image_picker8689977630134777850','image_picker8689977630134777850.png','image/png','public',409239,'[]','{\"uuid\":\"3e1d5dc9-035d-4b8d-b8a9-f7525c696e56\",\"user_id\":\"7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}','[]',332,'2022-07-17 14:17:27','2022-07-17 14:17:27');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_05_26_175145_create_permission_tables',1),(4,'2018_06_12_140344_create_media_table',1),(5,'2018_06_13_035117_create_uploads_table',1),(6,'2018_07_17_180731_create_settings_table',1),(7,'2018_07_24_211308_create_custom_fields_table',1),(8,'2018_07_24_211327_create_custom_field_values_table',1),(9,'2019_08_29_213820_create_cuisines_table',1),(10,'2019_08_29_213821_create_restaurants_table',1),(11,'2019_08_29_213825_create_categories_table',1),(12,'2019_08_29_213826_create_extra_groups_table',1),(13,'2019_08_29_213829_create_faq_categories_table',1),(14,'2019_08_29_213833_create_order_statuses_table',1),(15,'2019_08_29_213837_create_foods_table',1),(16,'2019_08_29_213842_create_galleries_table',1),(17,'2019_08_29_213847_create_food_reviews_table',1),(18,'2019_08_29_213903_create_nutrition_table',1),(19,'2019_08_29_213907_create_extras_table',1),(20,'2019_08_29_213921_create_payments_table',1),(21,'2019_08_29_213926_create_faqs_table',1),(22,'2019_08_29_213940_create_restaurant_reviews_table',1),(23,'2019_08_30_152927_create_favorites_table',1),(24,'2019_08_31_111103_create_delivery_addresses_table',1),(25,'2019_08_31_111104_create_orders_table',1),(26,'2019_09_04_153857_create_carts_table',1),(27,'2019_09_04_153858_create_favorite_extras_table',1),(28,'2019_09_04_153859_create_cart_extras_table',1),(29,'2019_09_04_153958_create_food_orders_table',1),(30,'2019_09_04_154957_create_food_order_extras_table',1),(31,'2019_09_04_163857_create_user_restaurants_table',1),(32,'2019_10_22_144652_create_currencies_table',1),(33,'2019_12_14_134302_create_driver_restaurants_table',1),(34,'2020_03_25_094752_create_drivers_table',1),(35,'2020_03_25_094802_create_earnings_table',1),(36,'2020_03_25_094809_create_drivers_payouts_table',1),(37,'2020_03_25_094817_create_restaurants_payouts_table',1),(38,'2020_03_27_094855_create_notifications_table',1),(39,'2020_04_11_135804_create_restaurant_cuisines_table',1),(40,'2020_08_23_181022_create_coupons_table',1),(41,'2020_08_23_181029_create_discountables_table',1),(42,'2020_09_01_192732_create_slides_table',1),(43,'2021_12_18_235040_create_posts_table',2),(44,'2021_12_22_231751_create_main_categories_table',2),(45,'2020_04_11_135804_create_category_cuisines_table',3),(46,'2021_12_24_155808_create_sub_categories_table',4),(47,'2021_12_24_233238_create_pruducts_table',5),(48,'2021_12_24_233930_create_brands_table',5),(49,'2021_12_25_125436_create_pharmcies_table',6),(50,'2021_12_28_123854_create_extra_group_prouducts_table',7),(51,'2021_12_28_133030_create_product_pharm_storage_table',8),(52,'2021_12_28_135710_create_storge_pharms_table',9),(53,'2021_12_30_163417_create_extra_pruducts_table',10),(54,'2021_12_30_182410_create_product_reviews_table',11),(55,'2022_02_02_222822_create_campagins_table',12),(56,'2022_02_02_223245_campagin_product',12),(57,'2022_05_31_12512_create_discounttypes_table',13),(58,'2022_05_31_22244_create_proudct_copons_table',14),(59,'2022_06_20_222822_create_airplans_table',14),(60,'2018_04_16_5_create_services_table',15),(61,'2018_04_16_6_create_cycles_table',15),(62,'2018_04_16_7_create_packages_table',15),(63,'2018_04_16_8_create_subscriptions_table',15),(64,'2018_04_16_9_create_activities_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (2,'App\\Models\\User',1),(3,'App\\Models\\User',2),(4,'App\\Models\\User',3),(4,'App\\Models\\User',4),(5,'App\\Models\\User',5),(5,'App\\Models\\User',6),(2,'App\\Models\\User',7),(4,'App\\Models\\User',8),(4,'App\\Models\\User',9),(4,'App\\Models\\User',10);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned DEFAULT '0',
  `food_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrition_food_id_foreign` (`food_id`),
  CONSTRAINT `nutrition_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition`
--

LOCK TABLES `nutrition` WRITE;
/*!40000 ALTER TABLE `nutrition` DISABLE KEYS */;
INSERT INTO `nutrition` VALUES (1,'Lipid',117,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(2,'Lipid',188,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(3,'Proteins',88,19,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(4,'Lipid',155,15,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(5,'Sugar',193,29,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(6,'Sugar',90,11,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(7,'Sugar',136,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(8,'Calcium',150,14,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(9,'Sugar',158,12,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(10,'Calcium',74,5,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(11,'Sugar',94,10,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(12,'Proteins',175,28,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(13,'Sugar',106,8,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(14,'Calcium',187,5,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(15,'Lipid',81,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(16,'Lipid',181,25,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(17,'Sugar',195,28,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(18,'Proteins',176,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(19,'Sugar',101,15,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(20,'Lipid',150,24,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(21,'Lipid',89,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(22,'Calcium',1,30,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(23,'Calcium',29,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(24,'Sugar',139,22,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(25,'Calcium',165,28,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(26,'Calcium',16,12,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(27,'Lipid',44,4,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(28,'Lipid',14,4,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(29,'Calcium',136,25,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(30,'Calcium',111,23,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(31,'Proteins',153,18,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(32,'Lipid',167,20,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(33,'Lipid',150,27,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(34,'Sugar',89,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(35,'Sugar',90,22,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(36,'Lipid',108,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(37,'Sugar',133,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(38,'Calcium',200,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(39,'Proteins',137,19,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(40,'Calcium',105,10,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(41,'Proteins',180,23,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(42,'Sugar',119,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(43,'Lipid',54,27,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(44,'Lipid',166,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(45,'Sugar',5,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(46,'Sugar',91,17,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(47,'Sugar',44,18,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(48,'Calcium',58,12,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(49,'Sugar',183,21,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(50,'Sugar',177,15,'2021-07-04 11:40:04','2021-07-04 11:40:04');
/*!40000 ALTER TABLE `nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'Order Received','2019-08-30 13:39:28','2019-10-15 15:03:14'),(2,'Preparing','2019-10-15 15:03:50','2019-10-15 15:03:50'),(3,'Ready','2019-10-15 15:04:30','2019-10-15 15:04:30'),(4,'On the Way','2019-10-15 15:04:13','2019-10-15 15:04:13'),(5,'Delivered','2019-10-15 15:04:30','2019-10-15 15:04:30');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `order_status_id` int unsigned NOT NULL,
  `tax` double(5,2) DEFAULT '0.00',
  `delivery_fee` double(5,2) DEFAULT '0.00',
  `hint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `driver_id` int unsigned DEFAULT NULL,
  `delivery_address_id` int unsigned DEFAULT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  KEY `orders_driver_id_foreign` (`driver_id`),
  KEY `orders_delivery_address_id_foreign` (`delivery_address_id`),
  KEY `orders_payment_id_foreign` (`payment_id`),
  CONSTRAINT `orders_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,7,1,10.00,0.00,NULL,1,NULL,1,1,'2022-06-26 11:45:54','2022-06-26 11:45:54'),(7,7,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-06-26 15:15:39','2022-06-26 15:15:39'),(8,7,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-06-26 15:18:54','2022-06-26 15:18:54'),(9,7,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-06-26 15:20:12','2022-06-26 15:20:12'),(10,7,1,0.00,0.00,NULL,1,NULL,NULL,2,'2022-06-26 15:21:16','2022-06-26 15:21:16'),(11,7,1,0.00,0.00,NULL,1,NULL,NULL,3,'2022-06-26 15:21:54','2022-06-26 15:21:54'),(12,7,1,0.00,0.00,NULL,1,NULL,NULL,4,'2022-06-26 15:22:04','2022-06-26 15:22:04'),(13,7,1,0.00,0.00,NULL,1,NULL,NULL,5,'2022-06-26 15:23:58','2022-06-26 15:23:58'),(14,7,1,0.00,0.00,NULL,1,NULL,NULL,6,'2022-06-26 15:28:01','2022-06-26 15:28:01'),(15,7,1,0.00,0.00,NULL,1,NULL,NULL,7,'2022-06-26 15:31:41','2022-06-26 15:31:41'),(16,7,1,0.00,0.00,NULL,1,NULL,NULL,8,'2022-06-26 15:33:44','2022-06-26 15:33:44'),(17,7,1,0.00,0.00,NULL,1,NULL,NULL,9,'2022-06-27 01:14:26','2022-06-27 01:14:26'),(18,7,1,0.00,0.00,NULL,1,NULL,NULL,10,'2022-06-28 21:20:09','2022-06-28 21:20:09'),(19,7,1,10.00,0.00,NULL,1,NULL,1,NULL,'2022-06-29 00:12:57','2022-06-29 00:12:57'),(20,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-02 16:36:59','2022-07-02 16:36:59'),(21,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-02 16:39:06','2022-07-02 16:39:06'),(22,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-02 16:41:54','2022-07-02 16:41:54'),(23,1,1,0.00,0.00,NULL,1,NULL,NULL,11,'2022-07-02 16:44:02','2022-07-02 16:44:02'),(24,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-02 16:44:10','2022-07-02 16:44:10'),(25,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-02 16:44:35','2022-07-02 16:44:35'),(26,1,1,0.00,0.00,NULL,1,NULL,NULL,12,'2022-07-02 16:45:54','2022-07-02 16:45:54'),(27,1,1,0.00,0.00,NULL,1,NULL,NULL,13,'2022-07-02 16:46:47','2022-07-02 16:46:47'),(28,1,1,0.00,0.00,NULL,1,NULL,NULL,14,'2022-07-02 16:49:36','2022-07-02 16:49:36'),(29,3,1,0.00,0.00,NULL,1,NULL,NULL,15,'2022-07-02 16:51:37','2022-07-02 16:51:37'),(30,4,1,0.00,0.00,NULL,1,NULL,NULL,16,'2022-07-02 16:55:39','2022-07-02 16:55:39'),(31,7,1,10.00,0.00,NULL,1,NULL,1,NULL,'2022-07-15 13:44:10','2022-07-15 13:44:10'),(32,7,1,0.00,0.00,NULL,1,NULL,NULL,17,'2022-07-15 14:38:17','2022-07-15 14:38:17'),(33,7,1,0.00,0.00,NULL,1,NULL,NULL,18,'2022-07-15 14:39:38','2022-07-15 14:39:38'),(34,7,1,0.00,0.00,NULL,1,NULL,NULL,19,'2022-07-15 14:43:08','2022-07-15 14:43:08'),(35,7,1,0.00,0.00,NULL,1,NULL,NULL,20,'2022-07-15 14:43:13','2022-07-15 14:43:13'),(36,7,1,0.00,0.00,NULL,1,NULL,NULL,21,'2022-07-15 14:46:08','2022-07-15 14:46:08'),(37,7,1,0.00,0.00,NULL,1,NULL,NULL,22,'2022-07-15 14:47:52','2022-07-15 14:47:52'),(38,7,1,0.00,0.00,NULL,1,NULL,NULL,23,'2022-07-15 14:48:25','2022-07-15 14:48:25'),(39,7,1,0.00,0.00,NULL,1,NULL,NULL,24,'2022-07-15 14:48:49','2022-07-15 14:48:49'),(40,7,1,0.00,0.00,NULL,1,NULL,NULL,25,'2022-07-15 14:50:46','2022-07-15 14:50:46'),(41,7,1,0.00,0.00,NULL,1,NULL,NULL,26,'2022-07-15 15:01:04','2022-07-15 15:01:04'),(42,7,1,0.00,0.00,NULL,1,NULL,NULL,27,'2022-07-15 15:25:05','2022-07-15 15:25:05'),(43,7,1,0.00,0.00,NULL,1,NULL,NULL,28,'2022-07-15 15:31:05','2022-07-15 15:31:05'),(44,7,1,0.00,0.00,NULL,1,NULL,NULL,29,'2022-07-15 15:38:59','2022-07-15 15:38:59'),(45,7,1,0.00,0.00,NULL,1,NULL,NULL,30,'2022-07-15 16:10:44','2022-07-15 16:10:44'),(46,7,1,0.00,0.00,NULL,1,NULL,NULL,31,'2022-07-16 11:18:04','2022-07-16 11:18:04'),(47,10,1,0.00,0.00,NULL,1,NULL,NULL,32,'2022-07-16 15:02:50','2022-07-16 15:02:50'),(48,10,1,0.00,0.00,NULL,1,NULL,NULL,33,'2022-07-16 15:22:26','2022-07-16 15:22:26'),(49,10,1,0.00,0.00,NULL,1,NULL,NULL,34,'2022-07-16 15:29:53','2022-07-16 15:29:53'),(50,10,1,0.00,0.00,NULL,1,NULL,NULL,35,'2022-07-16 15:37:33','2022-07-16 15:37:33'),(51,10,1,0.00,0.00,NULL,1,NULL,NULL,36,'2022-07-16 16:04:48','2022-07-16 16:04:49'),(52,10,1,0.00,0.00,NULL,1,NULL,NULL,37,'2022-07-16 16:11:40','2022-07-16 16:11:40'),(53,10,1,0.00,0.00,NULL,1,NULL,NULL,38,'2022-07-16 16:14:06','2022-07-16 16:14:06'),(54,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-16 18:58:21','2022-07-16 18:58:21'),(55,1,1,0.00,0.00,NULL,1,NULL,NULL,NULL,'2022-07-16 18:58:44','2022-07-16 18:58:44'),(56,1,1,0.00,0.00,NULL,1,NULL,NULL,39,'2022-07-16 18:59:47','2022-07-16 18:59:47'),(57,1,1,0.00,0.00,NULL,1,NULL,NULL,40,'2022-07-16 19:01:10','2022-07-16 19:01:10'),(58,1,1,0.00,0.00,NULL,1,NULL,NULL,41,'2022-07-16 19:02:05','2022-07-16 19:02:05'),(59,7,1,0.00,0.00,NULL,1,NULL,NULL,42,'2022-07-17 02:32:23','2022-07-17 02:32:23'),(60,7,1,0.00,0.00,NULL,1,NULL,NULL,43,'2022-07-17 14:13:06','2022-07-17 14:13:06'),(61,7,1,0.00,0.00,NULL,1,NULL,NULL,44,'2022-07-17 14:16:25','2022-07-17 14:16:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned NOT NULL,
  `cycle_id` int unsigned NOT NULL,
  `enter` int NOT NULL DEFAULT '0',
  `amount` decimal(8,2) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `packages_service_id_foreign` (`service_id`),
  KEY `packages_cycle_id_foreign` (`cycle_id`),
  CONSTRAINT `packages_cycle_id_foreign` FOREIGN KEY (`cycle_id`) REFERENCES `cycles` (`id`),
  CONSTRAINT `packages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,4,1,0,200.00,'الباقة الاولى','active','2022-06-23 22:14:42','2022-07-12 14:23:19'),(2,4,1,1,350.00,'الباقة الثانية','active','2022-07-02 13:23:03','2022-07-12 15:13:27'),(3,4,1,2,500.00,'الباقة الثالثة','active','2022-07-12 15:15:31','2022-07-12 15:15:31'),(4,4,1,10,750.00,'الباقة الرابعة','active','2022-07-12 15:16:47','2022-07-12 15:16:47'),(5,4,1,-1,1750.00,'الباقة الخامسة','active','2022-07-12 15:18:34','2022-07-12 15:19:11');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,0.00,'Order paid successfully',7,'Completed','PayPal','2022-06-26 11:45:54','2022-06-26 11:45:54'),(2,1.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:21:16','2022-06-26 15:21:16'),(3,1.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:21:54','2022-06-26 15:21:54'),(4,1.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:22:04','2022-06-26 15:22:04'),(5,100.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:23:58','2022-06-26 15:23:58'),(6,100.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:28:01','2022-06-26 15:28:01'),(7,100.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:31:41','2022-06-26 15:31:41'),(8,100.00,'Order paid successfully',7,'Successful','URWAY','2022-06-26 15:33:44','2022-06-26 15:33:44'),(9,100.00,'Order paid successfully',7,'Successful','URWAY','2022-06-27 01:14:26','2022-06-27 01:14:26'),(10,100.00,'Order paid successfully',7,'Successful','URWAY','2022-06-28 21:20:09','2022-06-28 21:20:09'),(11,200.00,'Order paid successfully',1,'Successful','URWAY','2022-07-02 16:44:02','2022-07-02 16:44:02'),(12,200.00,'Order paid successfully',1,'Successful','URWAY','2022-07-02 16:45:54','2022-07-02 16:45:54'),(13,200.00,'Order paid successfully',1,'Successful','URWAY','2022-07-02 16:46:47','2022-07-02 16:46:47'),(14,200.00,'Order paid successfully',1,'Successful','URWAY','2022-07-02 16:49:36','2022-07-02 16:49:36'),(15,200.00,'Order paid successfully',3,'Successful','URWAY','2022-07-02 16:51:37','2022-07-02 16:51:37'),(16,2500.00,'Order paid successfully',4,'Successful','URWAY','2022-07-02 16:55:39','2022-07-02 16:55:39'),(17,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:38:17','2022-07-15 14:38:17'),(18,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:39:38','2022-07-15 14:39:38'),(19,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:43:08','2022-07-15 14:43:08'),(20,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:43:13','2022-07-15 14:43:13'),(21,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:46:08','2022-07-15 14:46:08'),(22,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:47:52','2022-07-15 14:47:52'),(23,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:48:25','2022-07-15 14:48:25'),(24,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:48:49','2022-07-15 14:48:49'),(25,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 14:50:46','2022-07-15 14:50:46'),(26,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 15:01:04','2022-07-15 15:01:04'),(27,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 15:25:05','2022-07-15 15:25:05'),(28,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 15:31:05','2022-07-15 15:31:05'),(29,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 15:38:59','2022-07-15 15:38:59'),(30,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-15 16:10:44','2022-07-15 16:10:44'),(31,200.00,'Order paid successfully',7,'Successful','URWAY','2022-07-16 11:18:04','2022-07-16 11:18:04'),(32,200.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 15:02:50','2022-07-16 15:02:50'),(33,500.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 15:22:26','2022-07-16 15:22:26'),(34,200.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 15:29:53','2022-07-16 15:29:53'),(35,750.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 15:37:33','2022-07-16 15:37:33'),(36,1750.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 16:04:49','2022-07-16 16:04:49'),(37,1750.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 16:11:40','2022-07-16 16:11:40'),(38,750.00,'Order paid successfully',10,'Successful','URWAY','2022-07-16 16:14:06','2022-07-16 16:14:06'),(39,0.00,'Order paid successfully',1,'Successful','URWAY','2022-07-16 18:59:47','2022-07-16 18:59:47'),(40,0.00,'Order paid successfully',1,'Successful','URWAY','2022-07-16 19:01:10','2022-07-16 19:01:10'),(41,10.00,'Order paid successfully',1,'Successful','URWAY','2022-07-16 19:02:05','2022-07-16 19:02:05'),(42,0.00,'Order paid successfully',7,'Successful','URWAY','2022-07-17 02:32:23','2022-07-17 02:32:23'),(43,500.00,'Order paid successfully',7,'Successful','URWAY','2022-07-17 14:13:06','2022-07-17 14:13:06'),(44,0.00,'Order paid successfully',7,'Successful','URWAY','2022-07-17 14:16:25','2022-07-17 14:16:25');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'users.profile','web','2020-03-29 11:58:02','2020-03-29 11:58:02',NULL),(2,'dashboard','web','2020-03-29 11:58:02','2020-03-29 11:58:02',NULL),(3,'medias.create','web','2020-03-29 11:58:02','2020-03-29 11:58:02',NULL),(4,'medias.delete','web','2020-03-29 11:58:02','2020-03-29 11:58:02',NULL),(5,'medias','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(6,'permissions.index','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(7,'permissions.edit','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(8,'permissions.update','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(9,'permissions.destroy','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(10,'roles.index','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(11,'roles.edit','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(12,'roles.update','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(13,'roles.destroy','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(14,'customFields.index','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(15,'customFields.create','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(16,'customFields.store','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(17,'customFields.show','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(18,'customFields.edit','web','2020-03-29 11:58:03','2020-03-29 11:58:03',NULL),(19,'customFields.update','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(20,'customFields.destroy','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(21,'users.login-as-user','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(22,'users.index','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(23,'users.create','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(24,'users.store','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(25,'users.show','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(26,'users.edit','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(27,'users.update','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(28,'users.destroy','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(29,'app-settings','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(30,'restaurants.index','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(31,'restaurants.create','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(32,'restaurants.store','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(33,'restaurants.edit','web','2020-03-29 11:58:04','2020-03-29 11:58:04',NULL),(34,'restaurants.update','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(35,'restaurants.destroy','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(36,'categories.index','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(37,'categories.create','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(38,'categories.store','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(39,'categories.edit','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(40,'categories.update','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(41,'categories.destroy','web','2020-03-29 11:58:05','2020-03-29 11:58:05',NULL),(42,'faqCategories.index','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(43,'faqCategories.create','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(44,'faqCategories.store','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(45,'faqCategories.edit','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(46,'faqCategories.update','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(47,'faqCategories.destroy','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(48,'orderStatuses.index','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(49,'orderStatuses.show','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(50,'orderStatuses.edit','web','2020-03-29 11:58:06','2020-03-29 11:58:06',NULL),(51,'orderStatuses.update','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(52,'foods.index','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(53,'foods.create','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(54,'foods.store','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(55,'foods.edit','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(56,'foods.update','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(57,'foods.destroy','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(58,'galleries.index','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(59,'galleries.create','web','2020-03-29 11:58:07','2020-03-29 11:58:07',NULL),(60,'galleries.store','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(61,'galleries.edit','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(62,'galleries.update','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(63,'galleries.destroy','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(64,'foodReviews.index','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(65,'foodReviews.create','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(66,'foodReviews.store','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(67,'foodReviews.edit','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(68,'foodReviews.update','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(69,'foodReviews.destroy','web','2020-03-29 11:58:08','2020-03-29 11:58:08',NULL),(76,'extras.index','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(77,'extras.create','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(78,'extras.store','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(79,'extras.show','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(80,'extras.edit','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(81,'extras.update','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(82,'extras.destroy','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(83,'payments.index','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(84,'payments.show','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(85,'payments.update','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(86,'faqs.index','web','2020-03-29 11:58:10','2020-03-29 11:58:10',NULL),(87,'faqs.create','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(88,'faqs.store','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(89,'faqs.edit','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(90,'faqs.update','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(91,'faqs.destroy','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(92,'restaurantReviews.index','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(93,'restaurantReviews.create','web','2020-03-29 11:58:11','2020-03-29 11:58:11',NULL),(94,'restaurantReviews.store','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(95,'restaurantReviews.edit','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(96,'restaurantReviews.update','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(97,'restaurantReviews.destroy','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(98,'favorites.index','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(99,'favorites.create','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(100,'favorites.store','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(101,'favorites.edit','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(102,'favorites.update','web','2020-03-29 11:58:12','2020-03-29 11:58:12',NULL),(103,'favorites.destroy','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(104,'orders.index','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(105,'orders.create','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(106,'orders.store','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(107,'orders.show','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(108,'orders.edit','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(109,'orders.update','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(110,'orders.destroy','web','2020-03-29 11:58:13','2020-03-29 11:58:13',NULL),(111,'notifications.index','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(112,'notifications.show','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(113,'notifications.destroy','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(114,'carts.index','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(115,'carts.edit','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(116,'carts.update','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(117,'carts.destroy','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(118,'currencies.index','web','2020-03-29 11:58:14','2020-03-29 11:58:14',NULL),(119,'currencies.create','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(120,'currencies.store','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(121,'currencies.edit','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(122,'currencies.update','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(123,'currencies.destroy','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(124,'deliveryAddresses.index','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(125,'deliveryAddresses.create','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(126,'deliveryAddresses.store','web','2020-03-29 11:58:15','2020-03-29 11:58:15',NULL),(127,'deliveryAddresses.edit','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(128,'deliveryAddresses.update','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(129,'deliveryAddresses.destroy','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(130,'drivers.index','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(131,'drivers.create','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(132,'drivers.store','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(133,'drivers.show','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(134,'drivers.edit','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(135,'drivers.update','web','2020-03-29 11:58:16','2020-03-29 11:58:16',NULL),(136,'drivers.destroy','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(137,'earnings.index','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(138,'earnings.create','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(139,'earnings.store','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(140,'earnings.show','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(141,'earnings.edit','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(142,'earnings.update','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(143,'earnings.destroy','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(144,'driversPayouts.index','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(145,'driversPayouts.create','web','2020-03-29 11:58:17','2020-03-29 11:58:17',NULL),(146,'driversPayouts.store','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(147,'driversPayouts.show','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(148,'driversPayouts.edit','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(149,'driversPayouts.update','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(150,'driversPayouts.destroy','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(151,'restaurantsPayouts.index','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(152,'restaurantsPayouts.create','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(153,'restaurantsPayouts.store','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(154,'restaurantsPayouts.show','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(155,'restaurantsPayouts.edit','web','2020-03-29 11:58:18','2020-03-29 11:58:18',NULL),(156,'restaurantsPayouts.update','web','2020-03-29 11:58:19','2020-03-29 11:58:19',NULL),(157,'restaurantsPayouts.destroy','web','2020-03-29 11:58:19','2020-03-29 11:58:19',NULL),(158,'permissions.create','web','2020-03-29 11:59:15','2020-03-29 11:59:15',NULL),(159,'permissions.store','web','2020-03-29 11:59:15','2020-03-29 11:59:15',NULL),(160,'permissions.show','web','2020-03-29 11:59:15','2020-03-29 11:59:15',NULL),(161,'roles.create','web','2020-03-29 11:59:15','2020-03-29 11:59:15',NULL),(162,'roles.store','web','2020-03-29 11:59:15','2020-03-29 11:59:15',NULL),(163,'roles.show','web','2020-03-29 11:59:16','2020-03-29 11:59:16',NULL),(164,'cuisines.index','web','2020-04-11 12:04:39','2020-04-11 12:04:39',NULL),(165,'cuisines.create','web','2020-04-11 12:04:39','2020-04-11 12:04:39',NULL),(166,'cuisines.store','web','2020-04-11 12:04:39','2020-04-11 12:04:39',NULL),(167,'cuisines.edit','web','2020-04-11 12:04:39','2020-04-11 12:04:39',NULL),(168,'cuisines.update','web','2020-04-11 12:04:39','2020-04-11 12:04:39',NULL),(169,'cuisines.destroy','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(170,'extraGroups.index','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(171,'extraGroups.create','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(172,'extraGroups.store','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(173,'extraGroups.edit','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(174,'extraGroups.update','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(175,'extraGroups.destroy','web','2020-04-11 12:04:40','2020-04-11 12:04:40',NULL),(176,'nutrition.index','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(177,'nutrition.create','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(178,'nutrition.store','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(179,'nutrition.edit','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(180,'nutrition.update','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(181,'nutrition.destroy','web','2020-03-29 11:58:09','2020-03-29 11:58:09',NULL),(182,'requestedRestaurants.index','web','2020-08-13 11:58:02','2020-08-13 11:58:02',NULL),(183,'coupons.index','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(184,'coupons.create','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(185,'coupons.store','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(186,'coupons.edit','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(187,'coupons.update','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(188,'coupons.destroy','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(189,'slides.index','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(190,'slides.create','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(191,'slides.store','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(192,'slides.edit','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(193,'slides.update','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(194,'slides.destroy','web','2020-08-23 11:58:02','2020-08-23 11:58:02',NULL),(195,'mainCategories.index','web','2021-12-23 11:16:44','2021-12-23 11:16:44',NULL),(196,'mainCategories.store','web','2021-12-23 13:08:49','2021-12-23 13:08:49',NULL),(197,'mainCategories.edit','web','2021-12-23 13:08:58','2021-12-23 13:08:58',NULL),(198,'mainCategories.create','web','2021-12-23 13:09:09','2021-12-23 13:09:09',NULL),(199,'mainCategories.update','web','2021-12-23 13:45:40','2021-12-23 13:45:40',NULL),(200,'mainCategories.destroy','web','2021-12-23 18:26:04','2021-12-23 18:26:04',NULL),(201,'subCategories.index','web','2021-12-24 16:14:19','2021-12-24 16:14:19',NULL),(202,'subCategories.create','web','2021-12-24 16:14:40','2021-12-24 16:14:40',NULL),(203,'subCategories.edit','web','2021-12-24 16:14:48','2021-12-24 16:14:48',NULL),(204,'subCategories.store','web','2021-12-24 16:14:56','2021-12-24 16:14:56',NULL),(205,'subCategories.update','web','2021-12-24 16:15:05','2021-12-24 16:15:05',NULL),(206,'subCategories.destory','web','2021-12-24 16:15:15','2021-12-24 16:15:15',NULL),(207,'subCategories.destroy','web','2021-12-24 18:49:02','2021-12-24 18:49:02',NULL),(208,'brands.index','web','2021-12-24 21:52:52','2021-12-24 21:52:52',NULL),(209,'brands.create','web','2021-12-24 21:53:28','2021-12-24 21:53:28',NULL),(210,'brands.store','web','2021-12-24 21:53:35','2021-12-24 21:53:35',NULL),(211,'brands.edit','web','2021-12-24 21:53:42','2021-12-24 21:53:42',NULL),(212,'brands.update','web','2021-12-24 21:53:53','2021-12-24 21:53:53',NULL),(213,'brands.destroy','web','2021-12-24 21:54:05','2021-12-24 21:54:05',NULL),(214,'pharmcies.index','web','2021-12-25 10:56:53','2021-12-25 10:56:53',NULL),(215,'pharmcies.edit','web','2021-12-25 10:57:02','2021-12-25 10:57:02',NULL),(216,'pharmcies.destroy','web','2021-12-25 10:57:15','2021-12-25 10:57:15',NULL),(217,'pharmcies.store','web','2021-12-25 10:57:25','2021-12-25 10:57:25',NULL),(218,'pharmcies.create','web','2021-12-25 10:57:40','2021-12-25 10:57:40',NULL),(219,'pharmcies.update','web','2021-12-25 10:57:56','2021-12-25 10:57:56',NULL),(220,'pharmcies.show','web','2021-12-25 23:48:34','2021-12-25 23:48:34',NULL),(221,'pruducts.index','web','2021-12-27 20:46:10','2021-12-27 20:46:10',NULL),(222,'pruducts.create','web','2021-12-27 20:46:17','2021-12-27 20:46:17',NULL),(223,'pruducts.store','web','2021-12-27 20:46:23','2021-12-27 20:46:23',NULL),(224,'pruducts.edit','web','2021-12-27 20:46:30','2021-12-27 20:46:30',NULL),(225,'pruducts.update','web','2021-12-27 20:46:38','2021-12-27 20:46:38',NULL),(226,'pruducts.destroy','web','2021-12-27 20:46:48','2021-12-27 20:46:48',NULL),(227,'extraGroupProuducts.index','web','2021-12-28 10:39:45','2021-12-28 10:39:45',NULL),(228,'extraGroupProuducts.create','web','2021-12-28 10:40:45','2021-12-28 10:40:45',NULL),(229,'extraGroupProuducts.store','web','2021-12-28 10:40:55','2021-12-28 10:40:55',NULL),(230,'extraGroupProuducts.edit','web','2021-12-28 10:41:04','2021-12-28 10:41:04',NULL),(231,'extraGroupProuducts.update','web','2021-12-28 10:41:22','2021-12-28 10:41:22',NULL),(232,'extraGroupProuducts.destroy','web','2021-12-28 10:41:35','2021-12-28 10:41:35',NULL),(233,'storgePharms.index','web','2021-12-28 12:00:46','2021-12-28 12:00:46',NULL),(234,'storgePharms.create','web','2021-12-28 12:00:58','2021-12-28 12:00:58',NULL),(235,'storgePharms.store','web','2021-12-28 12:01:07','2021-12-28 12:01:07',NULL),(236,'storgePharms.edit','web','2021-12-28 12:01:15','2021-12-28 12:01:15',NULL),(237,'storgePharms.update','web','2021-12-28 12:01:26','2021-12-28 12:01:26',NULL),(238,'storgePharms.destroy','web','2021-12-28 12:01:34','2021-12-28 12:01:34',NULL),(239,'extraPruducts.update','web','2021-12-30 14:35:17','2021-12-30 14:35:17',NULL),(240,'extraPruducts.index','web','2021-12-30 14:35:25','2021-12-30 14:35:25',NULL),(241,'extraPruducts.store','web','2021-12-30 14:35:34','2021-12-30 14:35:34',NULL),(242,'extraPruducts.create','web','2021-12-30 14:35:42','2021-12-30 14:35:42',NULL),(243,'extraPruducts.destroy','web','2021-12-30 14:35:51','2021-12-30 14:35:51',NULL),(244,'extraPruducts.edit','web','2021-12-30 14:36:08','2021-12-30 14:36:08',NULL),(245,'productReviews.create','web','2021-12-30 16:50:16','2021-12-30 16:50:16',NULL),(246,'productReviews.index','web','2021-12-30 16:50:24','2021-12-30 16:50:24',NULL),(247,'productReviews.edit','web','2021-12-30 16:50:31','2021-12-30 16:50:31',NULL),(248,'productReviews.update','web','2021-12-30 16:50:39','2021-12-30 16:50:39',NULL),(249,'productReviews.store','web','2021-12-30 16:50:46','2021-12-30 16:50:46',NULL),(250,'productReviews.destroy','web','2021-12-30 16:50:56','2021-12-30 16:50:56',NULL),(251,'campagins.create','web','2022-02-02 20:47:29','2022-02-02 20:47:29',NULL),(252,'campagins.update','web','2022-02-02 20:48:03','2022-02-02 20:48:03',NULL),(253,'campagins.index','web','2022-02-02 20:48:11','2022-02-02 20:48:11',NULL),(254,'campagins.edit','web','2022-02-02 20:48:30','2022-02-02 20:48:30',NULL),(255,'campagins.store','web','2022-02-02 20:48:37','2022-02-02 20:48:37',NULL),(256,'campagins.show','web','2022-02-02 20:48:57','2022-02-02 20:48:57',NULL),(257,'campagins.destroy','web','2022-02-06 16:59:28','2022-02-06 16:59:28',NULL),(258,'proudct_copons.index','web','2022-06-21 00:22:32','2022-06-21 00:22:32',NULL),(259,'proudctCopons.index','web','2022-06-21 00:24:00','2022-06-21 00:24:00',NULL),(260,'proudctCopons.edit','web','2022-06-21 00:24:27','2022-06-21 00:24:27',NULL),(261,'proudctCopons.create','web','2022-06-21 00:24:35','2022-06-21 00:24:35',NULL),(262,'proudctCopons.destroy','web','2022-06-21 00:24:48','2022-06-21 00:24:48',NULL),(263,'proudctCopons.store','web','2022-06-21 00:24:59','2022-06-21 00:24:59',NULL),(264,'proudctCopons.update','web','2022-06-21 00:25:09','2022-06-21 00:25:09',NULL),(265,'proudctCopons.remove','web','2022-06-21 00:25:30','2022-06-21 00:25:30',NULL),(266,'discounttypes.create','web','2022-06-21 00:26:39','2022-06-21 00:26:39',NULL),(267,'discounttypes.edit','web','2022-06-21 00:26:51','2022-06-21 00:26:51',NULL),(268,'discounttypes.destroy','web','2022-06-21 00:26:57','2022-06-21 00:26:57',NULL),(269,'discounttypes.index','web','2022-06-21 00:27:02','2022-06-21 00:27:02',NULL),(270,'discounttypes.show','web','2022-06-21 00:27:07','2022-06-21 00:27:07',NULL),(271,'discounttypes.store','web','2022-06-21 00:27:13','2022-06-21 00:27:13',NULL),(272,'discounttypes.update','web','2022-06-21 00:27:18','2022-06-21 00:27:18',NULL),(273,'discounttypes.create','web','2022-06-21 00:27:25','2022-06-21 00:27:25',NULL),(274,'airplans.index','web','2022-06-21 13:47:20','2022-06-21 13:47:20',NULL),(275,'airplans.create','web','2022-06-21 13:47:39','2022-06-21 13:47:39',NULL),(276,'airplans.remove','web','2022-06-21 13:47:51','2022-06-21 13:47:51',NULL),(277,'airplans.destroy','web','2022-06-21 13:48:00','2022-06-21 13:48:00',NULL),(278,'airplans.edit','web','2022-06-21 13:48:09','2022-06-21 13:48:09',NULL),(279,'airplans.store','web','2022-06-21 13:48:20','2022-06-21 13:48:20',NULL),(280,'airplans.update','web','2022-06-21 13:48:28','2022-06-21 13:48:41',NULL),(281,'services.index','web','2022-06-23 15:15:44','2022-06-23 15:15:44',NULL),(282,'services.create','web','2022-06-23 15:15:55','2022-06-23 15:15:55',NULL),(283,'services.update','web','2022-06-23 15:16:05','2022-06-23 15:16:05',NULL),(284,'services.destroy','web','2022-06-23 15:16:14','2022-06-23 15:16:14',NULL),(285,'services.remove','web','2022-06-23 15:16:26','2022-06-23 15:16:26',NULL),(286,'services.edit','web','2022-06-23 15:16:41','2022-06-23 15:16:41',NULL),(287,'services.store','web','2022-06-23 15:16:47','2022-06-23 15:16:47',NULL),(288,'cycles.index','web','2022-06-23 15:39:11','2022-06-23 15:39:11',NULL),(289,'cycles.index','web','2022-06-23 15:40:13','2022-06-23 15:40:13',NULL),(290,'cycles.edit','web','2022-06-23 15:40:24','2022-06-23 15:40:24',NULL),(291,'cycles.update','web','2022-06-23 15:40:32','2022-06-23 15:40:32',NULL),(292,'cycles.create','web','2022-06-23 15:40:41','2022-06-23 15:40:41',NULL),(293,'cycles.store','web','2022-06-23 15:40:47','2022-06-23 15:40:47',NULL),(294,'cycles.destroy','web','2022-06-23 15:40:54','2022-06-23 15:40:54',NULL),(295,'cycles.remove','web','2022-06-23 15:41:01','2022-06-23 15:41:01',NULL),(296,'packages.index','web','2022-06-23 16:13:04','2022-06-23 16:13:04',NULL),(297,'packages.create','web','2022-06-23 16:13:21','2022-06-23 16:13:21',NULL),(298,'packages.update','web','2022-06-23 16:13:30','2022-06-23 16:13:30',NULL),(299,'packages.edit','web','2022-06-23 16:13:37','2022-06-23 16:13:37',NULL),(300,'packages.store','web','2022-06-23 16:13:45','2022-06-23 16:13:45',NULL),(301,'packages.destroy','web','2022-06-23 16:13:55','2022-06-23 16:13:55',NULL),(302,'packages.remove','web','2022-06-23 16:14:03','2022-06-23 16:14:03',NULL),(303,'subscriptions.index','web','2022-06-23 22:55:43','2022-06-23 22:55:43',NULL),(304,'subscriptions.edit','web','2022-06-23 22:55:59','2022-06-23 22:55:59',NULL),(305,'subscriptions.update','web','2022-06-23 22:56:06','2022-06-23 22:56:06',NULL),(306,'subscriptions.store','web','2022-06-23 22:56:15','2022-06-23 22:56:15',NULL),(307,'subscriptions.remove','web','2022-06-23 22:57:13','2022-06-23 22:57:13',NULL),(308,'subscriptions.destroy','web','2022-06-23 22:57:24','2022-06-23 22:57:24',NULL),(309,'subscriptions.create','web','2022-06-23 22:57:43','2022-06-23 22:57:43',NULL),(310,'myfatoorah.index','web','2022-06-24 23:24:47','2022-06-24 23:24:47',NULL),(311,'myfatoorah.callback','web','2022-06-24 23:36:44','2022-06-24 23:36:44',NULL),(312,'urway.express-checkout','web','2022-06-26 12:47:48','2022-06-26 12:47:48',NULL),(313,'urway.callback','web','2022-06-26 14:48:47','2022-06-26 14:48:47',NULL),(314,'pak.numday','web','2022-07-02 12:21:37','2022-07-02 12:21:37',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmcies`
--

DROP TABLE IF EXISTS `pharmcies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmcies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_commission` double(8,2) DEFAULT '0.00',
  `delivery_fee` double(8,2) DEFAULT '0.00',
  `delivery_range` double(8,2) DEFAULT '0.00',
  `default_tax` double(8,2) DEFAULT '0.00',
  `closed` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `available_for_delivery` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmcies`
--

LOCK TABLES `pharmcies` WRITE;
/*!40000 ALTER TABLE `pharmcies` DISABLE KEYS */;
INSERT INTO `pharmcies` VALUES (1,'صيدلية ١٩٠١١','<p>صيدلية ١٩٠١١<br></p>','October','12.44','55.6','01145011954','01145011954','07:30 AM','02:30 AM','<p>البيانات الخاصة بالصيدلية<br></p>',0.00,13.00,100.00,10.00,0,0,1,'2021-12-25 23:06:22','2021-12-26 00:02:23'),(2,'صيدلية رشدي',NULL,'October','12.44','55.6','01145011954','-','12:00 AM','04:00 AM',NULL,0.00,20.00,25.00,19.00,1,0,1,'2021-12-25 23:57:54','2021-12-25 23:57:54');
/*!40000 ALTER TABLE `pharmcies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ns` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_pham_stor`
--

DROP TABLE IF EXISTS `pro_pham_stor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_pham_stor` (
  `product_id` int unsigned NOT NULL,
  `pharm_id` int unsigned NOT NULL,
  `quantity` int unsigned DEFAULT '0',
  `initquantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `pro_pham_stor_pharm_id_foreign` (`pharm_id`),
  KEY `pro_pham_stor_product_id_foreign` (`product_id`),
  CONSTRAINT `pro_pham_stor_pharm_id_foreign` FOREIGN KEY (`pharm_id`) REFERENCES `pharmcies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pro_pham_stor_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pruducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_pham_stor`
--

LOCK TABLES `pro_pham_stor` WRITE;
/*!40000 ALTER TABLE `pro_pham_stor` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_pham_stor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rate` tinyint unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pruducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (5,'منتج ممتاز انصح الجميع به<br>',5,7,4,'2021-12-30 17:03:54','2021-12-30 17:12:28'),(6,'<p>good item<br></p>',4,6,5,'2021-12-30 17:15:24','2021-12-30 17:15:24');
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proudct_copons`
--

DROP TABLE IF EXISTS `proudct_copons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proudct_copons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_price` double(8,2) DEFAULT '0.00',
  `discount_type` int unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `rules` text COLLATE utf8mb4_unicode_ci,
  `featured` tinyint(1) DEFAULT '0',
  `ends_at` timestamp NULL DEFAULT NULL,
  `oneplusone` tinyint(1) DEFAULT '0',
  `showoldprice` tinyint(1) DEFAULT '0',
  `brand_id` int unsigned NOT NULL,
  `showpercent` tinyint(1) DEFAULT '1',
  `showprice` tinyint(1) DEFAULT '1',
  `offer` tinyint(1) DEFAULT '1',
  `restaurant_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proudct_copons`
--

LOCK TABLES `proudct_copons` WRITE;
/*!40000 ALTER TABLE `proudct_copons` DISABLE KEYS */;
INSERT INTO `proudct_copons` VALUES (1,'اشتري ١ برجر','9Bxc0gZA4o',1233.00,122.00,3,NULL,NULL,1,NULL,1,1,1,1,1,1,0,2,'2022-06-21 00:29:19','2022-06-21 18:33:19');
/*!40000 ALTER TABLE `proudct_copons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruducts`
--

DROP TABLE IF EXISTS `pruducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pruducts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_price` double(8,2) DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ingredients` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `package_items_count` double(9,2) DEFAULT '0.00',
  `weight` double(9,2) DEFAULT '0.00',
  `unit` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `deliverable` tinyint(1) DEFAULT '1',
  `restaurant_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refunduble` tinyint(1) NOT NULL DEFAULT '1',
  `showonlow` tinyint(1) NOT NULL DEFAULT '0',
  `brand_id` int DEFAULT NULL,
  `best` tinyint(1) NOT NULL DEFAULT '0',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pruducts_category_id_foreign` (`category_id`),
  CONSTRAINT `pruducts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruducts`
--

LOCK TABLES `pruducts` WRITE;
/*!40000 ALTER TABLE `pruducts` DISABLE KEYS */;
INSERT INTO `pruducts` VALUES (4,'Molfix New Born Baby Diaper - Size 1 - 44 Pcs',79.00,0.00,'<p><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Molfix the driest diaper in Egypt•New Molfix is sterilized with UVC and Anti bacterial technologies to provide more protection for your baby.•Molfix ​does not sag while absorbing the liquid and protects its shape. Making your baby move easily.•Elastic Body System, Elastic Side Bands, Anti-Leakage Elastic Barriers, Double Absorbent Area.</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">•ELASTIC BODY SYSTEM•What does it mean?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Molfix fits your baby with new elastic body system•Why is it important?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">With Molfix 3D Technology your baby can move comfortably•ELASTIC SIDE BANDS•What does it mean?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Covers your baby\'s body with more flexible side bands•Why is it important?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">It does not hurt your baby\'s tummy area while moving•ANTI-LEAKAGE ELASTIC BARRIERS•What does it mean?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Barriers that prevent wetness from leaking out•Why is it important?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">prevents leakage while being flexible from the legs\' area•DOUBLE ABSORBENT AREA•What does it mean?</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Areaa of liquid locker super absorbent particles•Why is it important</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Absorbs the liquid immediately and keeps skin dry</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">•Molfix Has Wetness Indicator That Changes In Color From Yellow To Blue To Understand Changing Time •Molfix Is Skin-friendly Approved •Umbilical Cord Notch To Keep Cord Area Safe •Airsoft Technology With Cotton Softness For Your Newly Born Baby •Aloe Vera & Chamomile Extracts To Leave Your Baby\'s Skin Feeling Naturally Smooth</span></p>','<p><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">Open Diaper</span><br style=\"box-sizing: border-box; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">44 PcSize 1Fits Babies 2-5 Kg</span></p>',44.00,0.00,'Piece',1,1,0,2,'2021-12-29 10:43:27','2022-02-01 20:49:04',1,1,1,1,0),(5,'Babyjoy حفاضات سترتش حديثي الولادة بدون تكتل من بيبي جوي - 60 قطعة',157.00,120.00,'<h3 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.8rem; line-height: 1.25;\">أفضل عناية مع الكثير من المحبة</h3><p style=\"box-sizing: border-box; padding: 0px; margin: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\">الأطفال حديثي الولادة يحتاجون الى النوم جيدا للنمو بصحة وسعادة، لذا صممت حفائض بيبي جوي الجديدة بالحشوة الماسية المضغوطة ومزايا عديدة طورت خصيصا لتناسب بشرة طفلك الحساسة لينعم بالراحة طوال الوقت.</p>','<h3 class=\"a-spacing-small\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.9rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.8rem; line-height: 1.25;\">تعليمات الاستخدام</h3><p style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 1.3rem; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-align: center !important;\"><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/88a17ffa57905bef1c410f87fc44c437.jpg\" class=\"a-spacing-mini\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/88a17ffa57905bef1c410f87fc44c437.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin-top: 0px; margin-right: auto; margin-bottom: 0.5rem !important; margin-left: auto; vertical-align: top;\"> <br style=\"box-sizing: border-box;\"></p><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">الخطوة الاولى</h4><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 1.3rem !important; margin-left: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\">افردي الحفاض مع وضع الشريط اللاصق للأعلى و تأكدي أن الحواجز الجانبية غير مطوية للخارج. (الجزء الخلفي من الحفاض هو الجزء الذي يحوي على الأشرطة اللاصقة).</p><p style=\"box-sizing: border-box; padding: 0px; margin: -0.4rem 0px 1.3rem; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-align: center !important;\"><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/6ca97593e0d29d082ad35c8919aa291c.jpg\" class=\"a-spacing-mini\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/6ca97593e0d29d082ad35c8919aa291c.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin-top: 0px; margin-right: auto; margin-bottom: 0.5rem !important; margin-left: auto; vertical-align: top;\"> <br style=\"box-sizing: border-box;\"></p><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">الخطوة الثانية</h4><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 1.3rem !important; margin-left: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\">ضعي الطفل في وسط الحفاض لكي تحيط بأرداف طفلك بشكل متساوي.</p><p style=\"box-sizing: border-box; padding: 0px; margin: -0.4rem 0px 1.3rem; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-align: center !important;\"><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/2a7e55fd94fa4dfe6edefbcaad842de2.jpg\" class=\"a-spacing-mini\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/2a7e55fd94fa4dfe6edefbcaad842de2.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin-top: 0px; margin-right: auto; margin-bottom: 0.5rem !important; margin-left: auto; vertical-align: top;\"> <br style=\"box-sizing: border-box;\"></p><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">الخطوة الثالثة</h4><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 1.3rem !important; margin-left: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\">ثبتي الشريط اللاصق في المكان المخصص بشكل متساوي من الطرفين بما يتلائم مع جسم الطفل</p><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/347036698608a6d644f03be209cd6c22.jpg\" class=\"\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/347036698608a6d644f03be209cd6c22.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; vertical-align: top;\"><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">الحشوة الماسية المضغوطة</h4><p style=\"box-sizing: border-box; padding: 0px; margin: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; font-size: 1.3rem !important; line-height: 1.4 !important;\">بيبي جوي المطورالآن بالحشوة الماسية ونعومة الحريرالتي تمتص البلل بسرعة وتحجزه بعيدا عن جسم طفلك، لتبقيه جافا وسعيدا طوال اليوم.</p><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/43167d4a949f8aeeead4b79c0633ed65.jpg\" class=\"\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/43167d4a949f8aeeead4b79c0633ed65.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; vertical-align: top;\"><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">فتحة السرة</h4><p style=\"box-sizing: border-box; padding: 0px; margin: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; font-size: 1.3rem !important; line-height: 1.4 !important;\">حفاض المولود الجديد من بيبي جوي هو الوحيد بفتحة السرة التي تعمل على سرعة التآم سرة المولود.</p><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/45d11845a191d382313489c789d9a844.jpg\" class=\"\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/45d11845a191d382313489c789d9a844.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; vertical-align: top;\"><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">الحشوة الماسية</h4><p style=\"box-sizing: border-box; padding: 0px; margin: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; font-size: 1.3rem !important; line-height: 1.4 !important;\">بيبي جوي بالحشوة الماسية توزع وتمتص ستة أكواب من السائل داخل الحشوة لتمنع التسرب وتبقي طفلك جافا طوال الوقت.</p><img alt=\"Babyjoy Stretch New Born Diapers\" src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/67d0a7807f6e3c7ca6b2a44aa5852dfe.jpg\" class=\"\" data-=\"\" data-src=\"https://eg.jumia.is/cms/external/pet/BA123DI1MRTJENAFAMZ/67d0a7807f6e3c7ca6b2a44aa5852dfe.jpg\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; vertical-align: top;\"><h4 class=\"a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px 0px 0.4rem; margin-top: 0px; margin-right: 0px; margin-bottom: 0.5rem !important; margin-left: 0px; font-weight: 400; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; text-rendering: optimizeLegibility; font-size: 1.5rem; line-height: 1.35;\">ناعمة كالحرير</h4><p style=\"box-sizing: border-box; padding: 0px; margin: 0px; caret-color: rgb(40, 40, 40); color: rgb(40, 40, 40); font-family: Roboto, -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Helvetica Neue\", Arial, sans-serif; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; font-size: 1.3rem !important; line-height: 1.4 !important;\">لأن بشرة طفلك حديث الولادة تحتاج لعناية فائقة، تم تطوير بيبي جوي باستخدام مكونات جديدة لطيفة و ناعمة كالحرير تناسب بشرة طفلك الحساسة.</p>',60.00,0.00,'قظعة',1,1,0,2,'2021-12-29 12:37:24','2022-02-06 20:43:39',1,0,4,1,1),(6,'فاين فلافي ، لينة ، معقمة ، مناديل وجه بيضاء ، 150 × 2 طبقة ، عبوة من النايلون 10 ، مجموع 1500 منديل',35.00,10.00,NULL,NULL,NULL,0.00,'carton',1,1,0,1,'2022-02-01 23:56:58','2022-02-01 23:56:58',1,0,3,1,0),(7,'مناديل وجه كلاسيك معقمة',50.00,NULL,NULL,NULL,NULL,0.00,NULL,1,1,0,3,'2022-02-02 00:08:13','2022-02-02 00:08:13',1,1,3,1,1);
/*!40000 ALTER TABLE `pruducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_cuisines`
--

DROP TABLE IF EXISTS `restaurant_cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_cuisines` (
  `cuisine_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  PRIMARY KEY (`cuisine_id`,`restaurant_id`),
  KEY `restaurant_cuisines_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `restaurant_cuisines_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `restaurant_cuisines_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_cuisines`
--

LOCK TABLES `restaurant_cuisines` WRITE;
/*!40000 ALTER TABLE `restaurant_cuisines` DISABLE KEYS */;
INSERT INTO `restaurant_cuisines` VALUES (2,1),(4,1),(2,2),(3,2),(5,2),(4,3),(5,3),(6,5),(3,6),(1,7),(2,7),(1,9);
/*!40000 ALTER TABLE `restaurant_cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_reviews`
--

DROP TABLE IF EXISTS `restaurant_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rate` tinyint unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_reviews_user_id_foreign` (`user_id`),
  KEY `restaurant_reviews_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `restaurant_reviews_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `restaurant_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_reviews`
--

LOCK TABLES `restaurant_reviews` WRITE;
/*!40000 ALTER TABLE `restaurant_reviews` DISABLE KEYS */;
INSERT INTO `restaurant_reviews` VALUES (1,'Cat, \'if you don\'t know one,\' said Alice. \'Well, then,\' the Cat went on, yawning and rubbing its eyes, \'Of course, of course; just what I get\" is the capital of Paris, and Paris is the capital of.',1,2,7,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(2,'And yet I wish you would seem to be\"--or if you\'d like it very much,\' said Alice, in a VERY good opportunity for making her escape; so she sat down again in a fight with another hedgehog, which.',3,1,10,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(3,'Cat; and this Alice would not give all else for two reasons. First, because I\'m on the top of it. She went in without knocking, and hurried off at once, she found it made Alice quite hungry to look.',2,4,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(4,'Seven said nothing, but looked at her, and the happy summer days. THE.',3,2,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(5,'I\'ll set Dinah at you!\' There was a good deal until she had a vague sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, Alice had begun to repeat it, but her voice.',1,5,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(6,'King said, for about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle\'s Story \'You can\'t think how glad I am so VERY tired of being such a simple question,\' added the Dormouse.',4,2,3,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(7,'I\'m I, and--oh dear, how puzzling it all came different!\' Alice replied in an encouraging tone. Alice looked round, eager to see you again, you dear old thing!\' said the King: \'leave out that part.\'.',3,4,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(8,'Hatter. He had been to her, so she took up the little door was shut again, and that\'s all the rest of my own. I\'m a hatter.\' Here the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice.',3,5,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(9,'The Caterpillar was the King; and as the March Hare. \'Sixteenth,\' added the Gryphon; and then treading on my tail. See how eagerly the lobsters to the King, \'unless it was the fan and two or three.',2,1,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(10,'I\'ll go round and get in at the March Hare. \'It was much pleasanter at home,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I.',4,3,4,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(11,'Alice didn\'t think that will be the right height to be.\' \'It is a long and a fan! Quick, now!\' And Alice was only too glad to get in at the mushroom (she had grown to her in an offended tone, \'was.',4,5,2,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(12,'Queen had only one who got any advantage from the shock of being upset, and their curls got entangled together. Alice was very likely true.) Down, down, down. There was no label this time she had.',5,1,6,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(13,'Alice laughed so much into the air, and came back again. \'Keep your temper,\' said the Mock Turtle would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the.',4,1,5,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(14,'Gryphon. \'How the creatures order one about, and make out exactly what they said. The executioner\'s argument was, that she began looking at it uneasily, shaking it every now and then; such as.',4,6,8,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(15,'I grow at a reasonable pace,\' said the Hatter. He had been running half an hour or so there were no arches left, and all the jurymen on to her lips. \'I know what you were me?\' \'Well, perhaps you.',2,3,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(16,'Mock Turtle. \'Certainly not!\' said Alice in a low voice. \'Not at first, but, after watching it a bit, if you drink much from a Caterpillar The Caterpillar and Alice could speak again. The.',2,1,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(17,'CHAPTER III. A Caucus-Race and a large fan in the sea, though you mayn\'t believe it--\' \'I never went to school in the middle of her sister, as well be at school at once.\' And in she went. Once more.',3,1,9,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(18,'Alice, \'we learned French and music.\' \'And washing?\' said the Mock Turtle is.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think I could, if I can guess that,\' she added in a very difficult.',4,1,1,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(19,'Mock Turtle. Alice was not a moment that it was her dream:-- First, she dreamed of little animals and birds waiting outside. The poor little thing sobbed again (or grunted, it was certainly not.',1,6,10,'2021-07-04 11:40:04','2021-07-04 11:40:04'),(20,'March Hare. \'Exactly so,\' said the Hatter; \'so I can\'t show it you myself,\' the Mock Turtle: \'crumbs would all come wrong, and she crossed her hands up to the seaside once in her hands, and began.',4,5,1,'2021-07-04 11:40:04','2021-07-04 11:40:04');
/*!40000 ALTER TABLE `restaurant_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_commission` double(8,2) DEFAULT '0.00',
  `delivery_fee` double(8,2) DEFAULT '0.00',
  `delivery_range` double(8,2) DEFAULT '0.00',
  `default_tax` double(8,2) DEFAULT '0.00',
  `closed` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `available_for_delivery` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Pizza Baumbach, Jacobi and McDermott','Reiciendis nesciunt ab facilis non porro cum. Voluptas sapiente quos voluptates incidunt ab culpa esse. Iure voluptas sint quia quibusdam omnis sapiente. Quia magnam cupiditate asperiores omnis.','408 Mossie Light\nNew Arnulfo, CA 26290-1779','46.004863','8.004338','469.517.4035','(819) 718-5353','Maiores magnam eveniet recusandae consequatur dignissimos distinctio. A officiis eos ut reprehenderit. Odit vero consequatur fugit labore amet sit asperiores.',19.23,4.63,53.64,8.99,0,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(2,'Meal Casper LLC','Quos ut non natus omnis qui sunt qui. Dicta animi alias cumque quos laborum expedita aut. In voluptates incidunt adipisci consequatur. Ducimus esse dolor voluptas omnis vitae.','13002 Walter Green Suite 677\nEladiobury, NV 66909-6496','50.993177','10.874507','701.324.5508 x309','+13537362210','Neque voluptatibus sed aut explicabo odio. Sit molestiae voluptates aspernatur molestiae. Sunt quaerat perferendis nobis quia qui mollitia.',28.34,2.74,16.44,23.82,0,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(3,'Pizza Powlowski-Tillman','Quo culpa quibusdam ratione blanditiis nulla alias impedit neque. Expedita dolore amet doloremque dolore eum occaecati maiores. Ipsum omnis sunt sed fugiat laboriosam voluptas repellat.','1813 Kohler Rest\nSouth Abrahamfort, IL 03621','48.915593','8.094678','+1-846-543-3089','846.541.0050','Minima provident quis facere inventore ea explicabo consequatur et. Deleniti iste suscipit perferendis doloribus quis. Ea et repellendus et aliquam.',15.08,9.07,12.46,6.77,0,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(4,'Meal Ebert, Kohler and Weimann','Perspiciatis ad dignissimos et consequatur blanditiis eum officiis quis. Delectus eum dolorem quia assumenda voluptatem. Sint omnis mollitia ut minima.','744 Heloise Tunnel Apt. 999\nSouth Destiny, AZ 83499','41.738217','10.048532','+17016809896','746-671-3493','Quibusdam molestias atque aut praesentium. Placeat commodi dolorum ut dolor vel sed ex. Sint atque illum velit qui aut ea perspiciatis.',30.60,4.31,65.04,9.10,1,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(5,'Meal Simonis, Nitzsche and Heathcote','Totam cum temporibus velit totam impedit maiores sapiente. Quisquam quis dolore non saepe officiis tempore ad. Deserunt ut eum dolore sed assumenda sunt.','328 Jazlyn Dam Apt. 753\nSouth Brooklyn, NY 49989','41.815682','7.887061','1-990-313-7606','223-835-6428 x68306','Molestiae officia facilis excepturi. Est nobis similique est nihil sit et non. Exercitationem nihil quo non eaque ipsa modi harum.',46.03,3.12,70.04,24.69,0,1,0,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(6,'Meal Marquardt, Quitzon and Eichmann','Nobis praesentium nihil quia deleniti eos nulla quidem. Beatae dolores rerum repellat soluta rerum. Et corrupti sed nulla architecto quae rerum.','55300 Freda Lodge Suite 273\nLaurettaport, NY 07486-1092','45.662864','8.759692','559.414.5092 x466','+1-237-800-4776','Dolorem non vitae et omnis optio adipisci sint. Vero accusamus dolore animi repellendus dolore magnam quasi odio. Est dignissimos vel est cupiditate unde.',33.71,8.04,66.58,23.66,0,1,0,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(7,'Pizza Fadel PLC','Nulla delectus repellat sed asperiores. Sed aspernatur quia et dolor. Cum impedit et architecto beatae.','802 Kory Center\nWest Bryana, OH 97321','47.402969','7.62276','1-347-292-3204 x93995','1-457-205-4952 x7579','Consectetur consequuntur natus tempora dolores vitae. Voluptates fuga ducimus consectetur quibusdam quisquam in error. Excepturi aliquam sed minus.',20.56,1.08,64.63,10.55,0,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(8,'Burger Watsica-Cassin','Est cumque et blanditiis tenetur dolor. Repellendus consequatur ut laudantium quis sed ad et. Iste corrupti sit qui cumque sequi minus quo. Eius voluptatibus dolores aut maxime et maiores.','74090 Kelsi Ville\nWest Aronberg, IA 67744-1216','44.176273','10.014347','1-601-359-4798','1-594-739-5046 x383','Sed et qui et impedit eaque. Voluptatem facere quia sapiente incidunt sequi quia laboriosam. Fugit impedit voluptatem dignissimos sint enim illo reiciendis quaerat.',22.65,2.92,37.75,26.22,1,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(9,'Burger Bosco, Kassulke and Keebler','Quia vel pariatur quod voluptatem ducimus laudantium ut. Hic sed facilis eaque ducimus. Expedita voluptatem sit eos ut nihil.','966 Adele Road\nMurazikbury, MT 67714','50.205481','10.106043','(251) 963-6364 x539','1-532-642-6586','Eligendi dignissimos eum atque incidunt. Placeat occaecati natus culpa cumque. Quisquam error neque ut enim assumenda.',26.62,6.27,78.25,22.76,1,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03'),(10,'Pizza Stamm, Doyle and Sawayn','Velit debitis debitis atque corrupti. Molestiae molestias qui atque laborum sed. Ut magni corporis vero ullam iusto. Est consequatur modi harum sed quia at velit.','92033 Heaney Manors Suite 903\nSouth Bennieberg, CO 91867-8415','52.458767','10.401206','373.366.5282 x705','871-925-0730 x760','Maxime sint est dolorem nihil iure quo. Id perferendis praesentium omnis perferendis expedita consequuntur illum. Sunt deleniti veniam eos cumque eveniet eligendi reprehenderit.',44.24,4.79,28.05,12.69,0,1,1,'2021-07-04 11:40:03','2021-07-04 11:40:03');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_payouts`
--

DROP TABLE IF EXISTS `restaurants_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants_payouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int unsigned NOT NULL,
  `method` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(9,2) NOT NULL DEFAULT '0.00',
  `paid_date` datetime DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurants_payouts_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `restaurants_payouts_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_payouts`
--

LOCK TABLES `restaurants_payouts` WRITE;
/*!40000 ALTER TABLE `restaurants_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(67,2),(68,2),(69,2),(76,2),(77,2),(78,2),(80,2),(81,2),(82,2),(83,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(95,2),(96,2),(97,2),(98,2),(103,2),(104,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(117,2),(118,2),(119,2),(120,2),(121,2),(122,2),(123,2),(124,2),(127,2),(128,2),(129,2),(130,2),(131,2),(134,2),(135,2),(137,2),(138,2),(144,2),(145,2),(146,2),(148,2),(149,2),(151,2),(152,2),(153,2),(155,2),(156,2),(158,2),(159,2),(160,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(182,2),(183,2),(184,2),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(219,2),(221,2),(222,2),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,2),(230,2),(231,2),(232,2),(233,2),(234,2),(235,2),(236,2),(237,2),(238,2),(239,2),(240,2),(241,2),(242,2),(243,2),(244,2),(245,2),(246,2),(247,2),(248,2),(249,2),(250,2),(251,2),(252,2),(253,2),(254,2),(255,2),(256,2),(257,2),(258,2),(259,2),(260,2),(261,2),(262,2),(263,2),(264,2),(265,2),(266,2),(267,2),(268,2),(269,2),(270,2),(271,2),(272,2),(274,2),(275,2),(276,2),(277,2),(278,2),(279,2),(280,2),(281,2),(282,2),(283,2),(284,2),(285,2),(286,2),(287,2),(288,2),(290,2),(291,2),(292,2),(293,2),(294,2),(295,2),(296,2),(297,2),(298,2),(299,2),(300,2),(301,2),(302,2),(303,2),(304,2),(305,2),(306,2),(307,2),(308,2),(309,2),(310,2),(311,2),(312,2),(313,2),(314,2),(1,3),(3,3),(4,3),(5,3),(27,3),(30,3),(31,3),(32,3),(33,3),(34,3),(42,3),(48,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(67,3),(68,3),(76,3),(77,3),(78,3),(80,3),(81,3),(82,3),(83,3),(86,3),(92,3),(95,3),(96,3),(98,3),(103,3),(104,3),(107,3),(108,3),(109,3),(110,3),(111,3),(113,3),(114,3),(117,3),(130,3),(134,3),(135,3),(137,3),(145,3),(146,3),(151,3),(152,3),(153,3),(164,3),(170,3),(171,3),(172,3),(182,3),(183,3),(186,3),(187,3),(258,3),(259,3),(312,3),(313,3),(314,3),(1,4),(3,4),(4,4),(27,4),(30,4),(31,4),(32,4),(52,4),(64,4),(67,4),(68,4),(83,4),(86,4),(92,4),(95,4),(96,4),(98,4),(103,4),(104,4),(107,4),(111,4),(113,4),(114,4),(117,4),(164,4),(182,4),(183,4),(312,4),(313,4),(314,4),(1,5),(3,5),(4,5),(27,5),(30,5),(48,5),(52,5),(64,5),(67,5),(68,5),(83,5),(86,5),(92,5),(95,5),(96,5),(98,5),(103,5),(104,5),(107,5),(111,5),(113,5),(114,5),(117,5),(130,5),(144,5),(145,5),(146,5),(164,5),(183,5),(312,5),(313,5),(314,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'admin','web',0,'2018-07-21 13:37:56','2019-09-07 19:42:01',NULL),(3,'manager','web',0,'2019-09-07 19:41:38','2019-09-07 19:41:38',NULL),(4,'client','web',1,'2019-09-07 19:41:54','2019-09-07 19:41:54',NULL),(5,'driver','web',0,'2019-12-15 15:50:21','2019-12-15 15:50:21',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (4,'كوبونات ، مطارات','active','<p><u>عروض مميزة<br></u><b><span style=\"color: rgb(255, 0, 0);\">صالات رجال الاعمال</span></b><br></p>','2022-06-23 15:26:41','2022-07-12 15:41:13');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slides` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order` int unsigned DEFAULT '0',
  `text` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'start',
  `text_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indicator_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_fit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'cover',
  `food_id` int unsigned DEFAULT NULL,
  `restaurant_id` int unsigned DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slides_food_id_foreign` (`food_id`),
  KEY `slides_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `slides_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `slides_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,4,'Aliquam aut sed.','Order Now','top_start','#ea5c44','#ea5c44','#ccccdd','#ea5c44','cover',NULL,1,1,'2021-07-04 11:40:05','2022-01-01 14:25:14'),(2,4,'Ex cum et suscipit.','Get Discount','center','#ea5c44','#ea5c44','#ccccdd','#ea5c44','cover',7,NULL,1,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(3,2,'Rem doloremque aperiam deserunt.','Get Discount','end','#ea5c44','#ea5c44','#ccccdd','#ea5c44','cover',7,NULL,0,'2021-07-04 11:40:05','2021-07-04 11:40:05'),(4,0,'Aperiam voluptatem laborum omnis rem.','Get Discount','top_start','#fdb4a8','#cdc6c4','#6565e4','#ef9f8f','cover',NULL,2,0,'2021-07-04 11:40:05','2021-12-25 21:14:09'),(5,4,'Impedit molestiae sed quod.','Order Now','end','#ea5c44','#ea5c44','#ccccdd','#ea5c44','cover',NULL,3,0,'2021-07-04 11:40:05','2021-07-04 11:40:05');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storge_pharms`
--

DROP TABLE IF EXISTS `storge_pharms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storge_pharms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `pharm_id` int unsigned NOT NULL,
  `quantity` int unsigned DEFAULT '0',
  `initquantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storge_pharms_pharm_id_foreign` (`pharm_id`),
  KEY `storge_pharms_product_id_foreign` (`product_id`),
  CONSTRAINT `storge_pharms_pharm_id_foreign` FOREIGN KEY (`pharm_id`) REFERENCES `pharmcies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `storge_pharms_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pruducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storge_pharms`
--

LOCK TABLES `storge_pharms` WRITE;
/*!40000 ALTER TABLE `storge_pharms` DISABLE KEYS */;
INSERT INTO `storge_pharms` VALUES (13,4,1,2000,2000,NULL,'2021-12-30 14:24:56'),(14,4,2,300,300,NULL,'2021-12-30 14:24:46'),(15,5,1,90,90,NULL,'2021-12-30 14:24:29'),(16,5,2,100,100,NULL,'2021-12-30 14:24:17');
/*!40000 ALTER TABLE `storge_pharms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `main_categories_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'مراكز رجال','مراكز رجال <br>',12,'2021-12-24 18:46:38','2022-06-21 18:37:57'),(2,'مشويات','<p><span style=\"caret-color: rgb(5, 5, 5); color: rgb(5, 5, 5); font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;.SFNSText-Regular&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;\">مشويات</span></p>',8,'2021-12-24 21:16:18','2022-06-21 18:24:15'),(3,'حلويات','<p>حلويات مشهية<br></p>',8,'2021-12-24 21:16:55','2022-06-21 18:21:25'),(4,'مخبوزات','<p>مخبوزات<br></p>',8,'2022-06-21 18:26:58','2022-06-21 18:26:58'),(5,'مركز رجالي','<p>مركز رجالي<br></p>',4,'2022-06-21 18:28:13','2022-06-21 18:28:13'),(6,'مركز نسائي','<p>مركز نسائي<br></p>',4,'2022-06-21 18:29:11','2022-06-21 18:29:11'),(7,'مراكز نسائي','<p>مراكز نسائي <br></p>',12,'2022-06-21 18:38:26','2022-06-21 18:38:26');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `package_id` int unsigned NOT NULL,
  `service_id` int unsigned NOT NULL,
  `cycle_id` int unsigned NOT NULL,
  `interval` int NOT NULL DEFAULT '1',
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `suspended_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_status_index` (`status`),
  KEY `subscriptions_package_id_foreign` (`package_id`),
  KEY `subscriptions_user_id_foreign` (`user_id`),
  KEY `subscriptions_service_id_foreign` (`service_id`),
  KEY `subscriptions_cycle_id_foreign` (`cycle_id`),
  CONSTRAINT `subscriptions_cycle_id_foreign` FOREIGN KEY (`cycle_id`) REFERENCES `cycles` (`id`),
  CONSTRAINT `subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `subscriptions_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (8,3,1,4,1,1,'2023-07-01 22:00:00','2023-07-01 22:00:00','active','2022-07-02 16:51:37','2022-07-02 16:51:37'),(9,4,2,4,2,1,'2023-01-17 22:00:00','2023-01-17 22:00:00','active','2022-07-02 16:55:39','2022-07-02 16:55:39'),(31,10,4,4,1,1,'2023-07-15 22:00:00','2023-07-15 22:00:00','active','2022-07-16 16:14:06','2022-07-16 16:14:06'),(36,1,1,4,1,1,'2023-07-15 22:00:00','2023-07-15 22:00:00','active','2022-07-16 19:02:05','2022-07-16 19:02:05'),(39,7,5,4,1,1,'2023-07-16 22:00:00','2023-07-16 22:00:00','active','2022-07-17 14:16:25','2022-07-17 14:16:25');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (4,'503c6b10-1d2a-43c6-be35-d35f3ec6b700','2021-12-23 16:00:51','2021-12-23 16:00:51'),(5,'9fb79dab-c17b-48d3-96fd-1e4def9d3b94','2021-12-23 16:22:35','2021-12-23 16:22:35'),(6,'87a134c6-6360-4edd-895f-bf3e52d1e4e4','2021-12-23 16:23:17','2021-12-23 16:23:17'),(7,'986ffefa-d650-44d7-a240-0017d5174605','2021-12-23 16:25:46','2021-12-23 16:25:46'),(11,'e054da24-d468-4fa1-bfdf-461e33c67cd1','2021-12-23 16:53:18','2021-12-23 16:53:18'),(19,'bc02cb76-50d7-4d4f-8cde-a0828efe6bd5','2021-12-23 18:28:50','2021-12-23 18:28:50'),(20,'062a5a1c-4205-4fcf-b5ca-d20a5b8125a9','2021-12-23 18:59:21','2021-12-23 18:59:21'),(25,'8373076f-db36-486a-9912-b54674375830','2021-12-23 19:02:26','2021-12-23 19:02:26'),(27,'68ea3758-a5dc-4508-a3e3-360742e36b6d','2021-12-23 19:22:45','2021-12-23 19:22:45'),(28,'80f993b9-6cc6-47d9-828b-23f7f126c32d','2021-12-23 19:29:28','2021-12-23 19:29:28'),(29,'3ef39ddd-2f97-43d0-90cd-80e198b24ced','2021-12-23 19:29:54','2021-12-23 19:29:54'),(30,'7b900c85-1026-4ad6-a31c-9ea33d84eac6','2021-12-23 19:30:04','2021-12-23 19:30:04'),(32,'a487932d-1395-4586-8da9-dbaaef2350d5','2021-12-23 19:30:18','2021-12-23 19:30:18'),(33,'4b7c32be-7e47-4c2f-9c78-00016ff02cc5','2021-12-23 19:30:21','2021-12-23 19:30:21'),(34,'1aacff2e-abb9-4531-9f96-fb78bf6757c0','2021-12-24 21:14:46','2021-12-24 21:14:46'),(39,'391458cd-cfd3-480c-af16-8368e90b0b19','2021-12-24 21:22:22','2021-12-24 21:22:22'),(40,'7b973dc0-d9b5-4537-afdf-02f083dc34ec','2021-12-24 21:24:03','2021-12-24 21:24:03'),(41,'ad8a5438-3777-45ad-b935-e8750074e9f1','2021-12-24 21:24:07','2021-12-24 21:24:07'),(42,'6622d263-dd25-408a-8c88-d5bca5bd3b0e','2021-12-24 21:24:12','2021-12-24 21:24:12'),(43,'e752069b-0626-4b38-a761-e454a4081c79','2021-12-24 21:24:15','2021-12-24 21:24:15'),(44,'814dae36-98fb-4e36-a5ea-8c279de627aa','2021-12-24 21:24:19','2021-12-24 21:24:19'),(45,'940a8aad-62c0-4296-885e-486488575d0a','2021-12-24 21:24:31','2021-12-24 21:24:31'),(46,'614ea317-deee-4b81-9d75-293d5aae4e45','2021-12-24 21:24:43','2021-12-24 21:24:43'),(47,'ab73f587-8019-445d-affc-1f3ba9d035cd','2021-12-24 21:24:48','2021-12-24 21:24:48'),(48,'24c9fa43-bd83-4592-b6c6-eb222a0d9791','2021-12-24 21:24:53','2021-12-24 21:24:53'),(49,'37c742c8-037b-4570-9542-de85bcfb5fa9','2021-12-24 21:24:59','2021-12-24 21:24:59'),(50,'40cd5627-5ca4-45ae-88ee-fd09cfd0eddf','2021-12-24 21:25:04','2021-12-24 21:25:04'),(51,'8c7b47ad-093e-4667-9f96-3cef14ac2534','2021-12-24 21:25:10','2021-12-24 21:25:10'),(52,'36dadc91-18a9-481b-bbdc-1e9a96972b28','2021-12-24 21:25:16','2021-12-24 21:25:16'),(53,'1e6c1975-dc4f-4b66-a7a5-381a801af08b','2021-12-24 21:25:23','2021-12-24 21:25:23'),(54,'f5d48ef4-89fc-4b7d-92fc-f99e01286692','2021-12-24 21:25:27','2021-12-24 21:25:27'),(55,'fd52097b-cc14-4875-acad-9442c2b1fbad','2021-12-24 21:25:33','2021-12-24 21:25:33'),(56,'80b57060-26ce-4883-9576-57bdc8460415','2021-12-24 21:25:39','2021-12-24 21:25:39'),(57,'b6a5942c-47f2-4ac8-b419-1fa1c3db8d76','2021-12-24 21:25:43','2021-12-24 21:25:43'),(58,'b576e81f-836f-452a-b5b4-548189e101b2','2021-12-24 22:14:07','2021-12-24 22:14:07'),(59,'f488e3da-0cf5-4394-817e-1f44e4dbea88','2021-12-24 22:14:32','2021-12-24 22:14:32'),(60,'f7e50155-d217-4050-8f2f-a3378a8e5dde','2021-12-24 22:14:40','2021-12-24 22:14:40'),(63,'5a338a07-a101-471b-b179-37f9fe1bb9a4','2021-12-24 22:28:54','2021-12-24 22:28:54'),(64,'33d39cbb-c1cb-405d-ad53-e361586691e9','2021-12-24 22:29:01','2021-12-24 22:29:01'),(65,'cf629f32-449a-4dc4-af4b-e719f9913de6','2021-12-24 22:29:16','2021-12-24 22:29:16'),(66,'39e6817d-61b2-45e9-94c3-7f9777da5d98','2021-12-24 22:29:22','2021-12-24 22:29:22'),(67,'24d6e828-555f-490f-8f27-2b6868eb330f','2021-12-25 23:57:17','2021-12-25 23:57:17'),(68,'a6edeb93-1371-4fe8-a271-d4f40527e846','2021-12-25 23:57:34','2021-12-25 23:57:34'),(69,'a38b0a2e-e35a-4f8d-b3fa-bedccb9d8647','2021-12-25 23:59:44','2021-12-25 23:59:44'),(70,'a64c8b32-894a-49db-b649-3ef56a6e3a97','2021-12-25 23:59:48','2021-12-25 23:59:48'),(71,'8dc730e5-f19e-42fe-971b-17547c7e3870','2021-12-25 23:59:53','2021-12-25 23:59:53'),(72,'d6d8370a-6dee-46a5-b7ac-8cee2da3f48a','2021-12-29 10:39:27','2021-12-29 10:39:27'),(73,'24a85cc0-a39c-46b0-bb48-cdd3a2995607','2021-12-29 10:40:02','2021-12-29 10:40:02'),(74,'0dae8114-aaa9-42ce-97cc-b0be0deb1931','2021-12-29 10:40:10','2021-12-29 10:40:10'),(75,'65132b42-eaeb-4121-8237-b797c7446fa0','2021-12-29 10:40:29','2021-12-29 10:40:29'),(76,'21cebe07-25d2-40e3-a4b6-3618320e4369','2021-12-29 10:45:03','2021-12-29 10:45:03'),(77,'4eec20d3-921d-4c46-a55c-a477a96ade06','2021-12-29 12:45:55','2021-12-29 12:45:55'),(78,'4ea68941-674c-4589-82cf-a0ba856b6ce1','2021-12-29 12:45:55','2021-12-29 12:45:55'),(79,'a32a59dc-8e9c-4898-af1e-4f0b70f9ec58','2021-12-29 12:46:11','2021-12-29 12:46:11'),(80,'e372eb0d-04f6-4dd8-ae58-18f6dc2830b7','2021-12-29 12:46:11','2021-12-29 12:46:11'),(81,'6cdad983-51b4-49c1-bae7-a7cf19eabf3b','2021-12-29 12:46:11','2021-12-29 12:46:11'),(82,'1d2ce9b6-c64f-4664-9726-5730fa30dd82','2021-12-29 12:53:41','2021-12-29 12:53:41'),(83,'ac8a0a16-0289-4fd9-bc3d-329c49505a5e','2021-12-29 12:53:41','2021-12-29 12:53:41'),(84,'c09e2e52-d208-4f5a-911c-e3bb69cbab6e','2021-12-29 12:53:41','2021-12-29 12:53:41'),(85,'ff1890f3-e172-4fd5-8c28-026536747de1','2021-12-29 13:02:18','2021-12-29 13:02:18'),(86,'1d527da3-8de5-4534-962b-8d6f1b61abc8','2021-12-29 13:02:19','2021-12-29 13:02:19'),(87,'b3ed0294-34a8-4ca2-922f-f743fecbae34','2021-12-29 13:02:19','2021-12-29 13:02:19'),(88,'66c07a90-2db3-44f9-8fce-daba2bac8dc0','2021-12-29 13:02:19','2021-12-29 13:02:19'),(89,'d29f5f35-040c-4abe-b5da-7b4ccdad986d','2021-12-29 13:02:46','2021-12-29 13:02:46'),(90,'d06b5ff4-75b4-4e60-95bf-7ce981ad543e','2021-12-29 13:02:46','2021-12-29 13:02:46'),(91,'4574e750-759a-4b76-970b-176eca387667','2021-12-29 13:02:46','2021-12-29 13:02:46'),(92,'c263f414-0622-4ea2-8559-cba2de7f9c3e','2021-12-29 13:02:46','2021-12-29 13:02:46'),(93,'2f57b556-b80b-4563-a6ab-584f66ad151c','2021-12-29 13:02:47','2021-12-29 13:02:47'),(94,'599086f2-c78c-4e29-8be3-8b68e8c4920b','2021-12-29 13:02:47','2021-12-29 13:02:47'),(95,'7a310726-b3ba-467c-a9c5-11843c3034d5','2021-12-29 13:02:47','2021-12-29 13:02:47'),(96,'a4d13c29-d875-48e7-acbb-ace323a26c92','2021-12-29 13:03:22','2021-12-29 13:03:22'),(97,'17953c7e-67a1-48e8-8a29-b2c35df4f7e0','2021-12-29 13:03:22','2021-12-29 13:03:22'),(98,'658a44eb-c2d7-430b-83a8-ecdd6974a653','2021-12-29 13:03:22','2021-12-29 13:03:22'),(99,'c692b029-905b-4e4d-979e-3fbc848c0a96','2021-12-29 13:03:23','2021-12-29 13:03:23'),(100,'eb0f81ea-cf09-414e-80b3-72be7954a533','2021-12-29 13:03:23','2021-12-29 13:03:23'),(101,'e8b3f369-d4e5-400b-8a25-e6fe38b52331','2021-12-29 13:03:23','2021-12-29 13:03:23'),(102,'c81dcc89-c6b0-44d7-9367-4df2a477dc59','2021-12-29 13:03:23','2021-12-29 13:03:23'),(103,'88b6676e-30e4-4dc9-ab6a-e6b1f575ebab','2021-12-29 13:05:08','2021-12-29 13:05:08'),(104,'1655063c-f57b-4945-9958-9444795a5acd','2021-12-29 13:05:08','2021-12-29 13:05:08'),(105,'d0d0937d-7779-415b-b200-81406858c904','2021-12-29 13:36:22','2021-12-29 13:36:22'),(106,'ad3424a3-2eb9-406a-bddf-6dc5220720c5','2021-12-29 13:36:23','2021-12-29 13:36:23'),(107,'7edac71e-3891-421d-9096-ccdc25dba9e8','2021-12-29 13:39:55','2021-12-29 13:39:55'),(108,'6b1cb2b1-0cea-42ee-affb-22013d34616a','2021-12-29 13:46:06','2021-12-29 13:46:06'),(109,'6048e97b-aa17-485c-a375-de3951a7fa84','2021-12-29 14:03:56','2021-12-29 14:03:56'),(110,'9ff901c6-c33d-4a30-919c-dbf5491f3e5b','2021-12-29 14:15:53','2021-12-29 14:15:53'),(111,'fea3cd0d-e7d6-4983-bda5-258c77c394af','2021-12-29 15:28:21','2021-12-29 15:28:21'),(112,'4b8d93da-57e6-4fcb-93b7-d60f505ea714','2021-12-29 15:29:00','2021-12-29 15:29:00'),(113,'2a4c8760-fa7e-4e7d-804e-be00a84f0539','2021-12-29 15:29:00','2021-12-29 15:29:00'),(114,'ecb82ba4-a3ce-4652-a2be-b287c974b522','2021-12-29 15:29:00','2021-12-29 15:29:00'),(115,'3281002a-fac8-4478-9084-6c921d5d8fe5','2021-12-29 15:33:24','2021-12-29 15:33:24'),(116,'d75c95e2-6929-41b3-82b6-2136755f040b','2021-12-29 15:33:32','2021-12-29 15:33:32'),(117,'4eb15451-7f45-41ba-94eb-5e95d517897c','2021-12-29 15:33:56','2021-12-29 15:33:56'),(118,'69b52d18-f4bd-4c15-b21b-7c4343f19152','2021-12-29 15:46:17','2021-12-29 15:46:17'),(119,'bf62637a-54a8-47f9-8365-a45b4819a560','2021-12-29 15:46:32','2021-12-29 15:46:32'),(120,'a53bf5bc-71f3-437e-882e-7ce893854146','2021-12-29 15:46:32','2021-12-29 15:46:32'),(121,'3892841c-6719-4a71-92de-12bdf054df36','2021-12-29 15:47:14','2021-12-29 15:47:14'),(122,'cc1ed511-1757-4b58-b4a9-cbd1fc9d0491','2021-12-29 15:48:05','2021-12-29 15:48:05'),(123,'aafb6888-f796-45b0-961e-c263754727c5','2021-12-29 15:48:24','2021-12-29 15:48:24'),(124,'dcf23e24-e291-4047-8cde-ca655a068a4b','2021-12-29 15:49:23','2021-12-29 15:49:23'),(125,'cce2bccd-3a22-4697-912b-b8ab101c91ec','2021-12-29 15:52:14','2021-12-29 15:52:14'),(126,'810c1bad-fbaf-4876-acbc-effdcbdfda6c','2021-12-29 15:52:23','2021-12-29 15:52:23'),(127,'5a07ae43-d488-4ae4-a01b-3a0d9f45e3a7','2021-12-29 15:54:08','2021-12-29 15:54:08'),(128,'6cc3e143-d443-402c-9205-d374e964cc65','2021-12-29 15:54:08','2021-12-29 15:54:08'),(129,'f9d0bdd8-4a3f-4b55-a97c-58cb3356e7e5','2021-12-29 15:54:36','2021-12-29 15:54:36'),(130,'0506100d-8551-49d6-84eb-b405d2091514','2021-12-29 15:57:50','2021-12-29 15:57:50'),(131,'0dc97405-bcee-4dea-af72-963c8e6f73e3','2021-12-29 16:02:30','2021-12-29 16:02:30'),(132,'a66506b6-b481-49ea-a6c3-0ea464a1f5b5','2021-12-29 16:05:17','2021-12-29 16:05:17'),(133,'a20fd747-7e37-4ebe-97cd-b635811b8b72','2021-12-29 16:06:23','2021-12-29 16:06:23'),(134,'57c25fea-a04e-476f-b973-b49db41b5c91','2021-12-29 16:06:23','2021-12-29 16:06:23'),(135,'90b72f96-9b9f-4cfd-8dcc-b449e646080c','2021-12-29 16:13:55','2021-12-29 16:13:55'),(136,'a61c924f-1a6e-4b15-ad8e-2423e4ee02c9','2021-12-29 16:14:04','2021-12-29 16:14:04'),(137,'d491b0d5-251a-4b51-8309-dc7252ced887','2021-12-29 16:14:04','2021-12-29 16:14:04'),(138,'1e169348-c872-4986-8aa6-8ae5a18c9a41','2021-12-29 16:14:20','2021-12-29 16:14:20'),(139,'be106910-e615-460b-a060-ae5e5c427983','2021-12-29 16:14:20','2021-12-29 16:14:20'),(140,'3e889422-0d3f-4330-834f-5828bb34b6bc','2021-12-29 16:14:20','2021-12-29 16:14:20'),(141,'6cf89e04-9fff-4a55-ba82-a398fb50f1fb','2021-12-29 16:14:20','2021-12-29 16:14:20'),(142,'c5ef7c69-2ab6-4869-ab77-5397132adecd','2021-12-29 16:16:10','2021-12-29 16:16:10'),(143,'8f46a113-646c-42ba-b71f-29af059fbbaa','2021-12-29 16:16:11','2021-12-29 16:16:11'),(144,'fe0878ec-2883-4534-afaf-557595edf286','2021-12-29 16:16:11','2021-12-29 16:16:11'),(145,'f95659a9-1fa6-424e-93ff-2ecb1de39665','2021-12-29 16:37:40','2021-12-29 16:37:40'),(146,'07f21f59-5e1f-4323-b499-8de6933155d9','2021-12-29 16:37:40','2021-12-29 16:37:40'),(147,'f33fad06-af21-4835-ba6a-ca99328b8184','2021-12-29 16:44:55','2021-12-29 16:44:55'),(148,'aaff6cb6-287f-4a80-8cbb-c0eab7703885','2021-12-29 21:13:55','2021-12-29 21:13:55'),(149,'1b6fbb8b-f3f0-43fd-97d0-79db6752b155','2021-12-29 21:13:56','2021-12-29 21:13:56'),(150,'0ce82fc4-7b7e-4406-b09e-4dfaeda96648','2021-12-30 14:22:11','2021-12-30 14:22:11'),(151,'7d0fa0ce-3e46-4984-90b5-795d51bedd98','2021-12-30 14:22:40','2021-12-30 14:22:40'),(152,'c1608c44-74c4-4f6b-92d6-b803be86bb86','2021-12-30 14:22:55','2021-12-30 14:22:55'),(153,'a0ac0763-da55-4208-8f30-ac370e876ffc','2021-12-30 14:23:00','2021-12-30 14:23:00'),(155,'59ca6ab9-9b10-471d-8626-768f556abea1','2021-12-30 17:17:34','2021-12-30 17:17:34'),(156,'e05a4f64-cba1-4401-85ab-0121c8c46dd6','2021-12-30 17:17:34','2021-12-30 17:17:34'),(157,'06cf0bc7-9228-4185-bdf8-b490266d9a33','2021-12-30 17:17:34','2021-12-30 17:17:34'),(158,'f6edaaa0-c96a-45f5-a274-5ac62d0eeba2','2021-12-30 17:17:34','2021-12-30 17:17:34'),(159,'c271037d-778c-46d8-9801-61121e429ffb','2021-12-30 17:17:35','2021-12-30 17:17:35'),(161,'3af4f868-0d75-49a0-8ca4-d461eeb4ee83','2021-12-31 11:41:18','2021-12-31 11:41:18'),(162,'1585f89c-03a3-49cf-b7b4-26b431cfd9b2','2022-01-01 14:28:54','2022-01-01 14:28:54'),(163,'89794809-ccf6-4ada-8e8c-d5828a50efcc','2022-01-01 14:32:57','2022-01-01 14:32:57'),(164,'9240bf53-3c96-4a74-b379-8f95d41dd0c4','2022-01-01 14:33:02','2022-01-01 14:33:02'),(165,'0c82026f-db1e-4fae-997c-12f12b52af67','2022-01-01 14:33:06','2022-01-01 14:33:06'),(166,'c26f3089-bf07-475f-a1fd-6707847d028c','2022-01-01 14:33:13','2022-01-01 14:33:13'),(167,'92f3fe91-3153-499b-86e5-26ddfecf51e1','2022-01-01 16:45:43','2022-01-01 16:45:43'),(168,'14122a80-7bcf-4996-a5fd-c0d32e477b6f','2022-01-01 16:45:47','2022-01-01 16:45:47'),(169,'2bddb130-61ef-4987-bcff-6667153a0627','2022-01-01 16:46:01','2022-01-01 16:46:01'),(170,'e426ef7e-c632-47c4-ab65-d808084d59f4','2022-01-01 16:46:05','2022-01-01 16:46:05'),(171,'50781abb-5347-4624-840a-618595507858','2022-01-04 14:24:18','2022-01-04 14:24:18'),(172,'f7367619-1416-47b7-9d05-c3f60ebdca3e','2022-01-04 14:28:13','2022-01-04 14:28:13'),(173,'3d673b71-c75e-427f-b48a-f49569af4828','2022-01-04 14:28:28','2022-01-04 14:28:28'),(174,'e1cb967e-6b79-4a74-aca2-9107a242afa9','2022-01-04 14:32:59','2022-01-04 14:32:59'),(175,'03b5bbac-040b-4587-b2af-bfbd8f218a20','2022-01-04 17:27:39','2022-01-04 17:27:39'),(176,'bac702d2-e940-4630-8a4f-ec5da7c54fea','2022-01-04 17:33:52','2022-01-04 17:33:52'),(177,'33eff923-c1fc-44c8-89e0-ee3a0f7de771','2022-02-01 23:56:03','2022-02-01 23:56:03'),(178,'265d7503-12fe-4bea-9796-41c4ce794ddf','2022-02-02 00:07:48','2022-02-02 00:07:48'),(179,'903218a9-c898-4845-abbb-5631a4ce8eb7','2022-02-06 20:52:26','2022-02-06 20:52:26'),(180,'d3acecc9-c414-4b33-a34d-514628eef895','2022-02-08 13:48:20','2022-02-08 13:48:20'),(181,'81001051-a6c1-4e5a-a6b6-d4910811806f','2022-06-21 00:29:46','2022-06-21 00:29:46'),(182,'fb19619f-5802-4b00-adad-4743da65cf47','2022-06-21 00:37:19','2022-06-21 00:37:19'),(183,'614ace5b-e99c-4567-be7b-3b91fc0639f8','2022-06-21 00:37:29','2022-06-21 00:37:29'),(184,'c787754e-e8ce-4a7c-b523-76646c26827f','2022-06-21 14:55:06','2022-06-21 14:55:06'),(185,'ab259a4e-febc-4569-b571-83c534869857','2022-06-21 15:01:18','2022-06-21 15:01:18'),(186,'769e45e5-39e7-4f0f-af24-1da00347448d','2022-06-21 15:33:56','2022-06-21 15:33:56'),(187,'973570cd-aa50-434c-984d-35c7c9abad61','2022-06-21 15:41:59','2022-06-21 15:41:59'),(188,'19eabdf9-3ad2-4673-9714-5ed3717348a8','2022-06-21 15:43:16','2022-06-21 15:43:16'),(189,'155a317c-7e46-43ab-b08a-5c36f5203366','2022-06-21 18:15:29','2022-06-21 18:15:29'),(190,'4c59987e-b22c-45e7-9a7e-76c0336ba2af','2022-06-21 18:16:00','2022-06-21 18:16:00'),(191,'afe0b58c-159f-4e02-a533-5b4261c0ee40','2022-06-21 18:21:20','2022-06-21 18:21:20'),(192,'a6f25857-e41a-48c1-b4bb-0981bf63c1d6','2022-06-21 18:24:13','2022-06-21 18:24:13'),(193,'e2c276b3-eafa-4937-93cf-5214ec2031e8','2022-06-21 18:26:55','2022-06-21 18:26:55'),(194,'47cddc41-295b-4366-89c4-c03d9b389141','2022-06-21 18:28:08','2022-06-21 18:28:08'),(195,'1c630b86-1359-48b3-ac2a-2c1106d98c64','2022-06-21 18:29:08','2022-06-21 18:29:08'),(196,'f1efd2ac-c495-410d-b691-5024731bee54','2022-06-21 18:30:24','2022-06-21 18:30:24'),(197,'b6f4d89c-167a-4c6d-9eab-476ca044a2e9','2022-06-21 18:31:50','2022-06-21 18:31:50'),(198,'669539cf-7b97-4870-9818-f6bc7a7ed884','2022-06-21 18:33:14','2022-06-21 18:33:14'),(199,'248a86e3-9323-4765-9e9f-8d9681f7dad4','2022-06-21 18:37:09','2022-06-21 18:37:09'),(200,'7a12d233-cfdd-4794-a397-b7bb4cd2b409','2022-06-21 18:37:48','2022-06-21 18:37:48'),(201,'623eff66-e749-4f38-a424-d3328a645dc3','2022-06-21 18:38:21','2022-06-21 18:38:21'),(202,'8d88262f-8de7-497f-8b58-b963beb6efa7','2022-07-16 20:27:46','2022-07-16 20:27:46'),(203,'c758e8d6-829c-46e1-ac1f-ff951b9eddf1','2022-07-16 20:32:30','2022-07-16 20:32:30'),(204,'e77613c7-80cf-44ec-ba99-0b1f413e77a9','2022-07-16 20:32:46','2022-07-16 20:32:46'),(205,'def1c867-af95-4adc-b63b-ef1f26690675','2022-07-16 20:37:42','2022-07-16 20:37:42'),(206,'77271409-b91c-4318-99aa-acaf29a3afd2','2022-07-16 20:37:54','2022-07-16 20:37:54'),(207,'a1c68450-cdd4-428c-88d9-8d065aa09383','2022-07-16 20:38:51','2022-07-16 20:38:51'),(208,'e5157071-b364-4bdb-b7bd-8a02e36a9c6d','2022-07-16 20:38:59','2022-07-16 20:38:59'),(209,'67a8f76c-9087-49fc-afc8-a57bc5f8c6b0','2022-07-16 20:44:21','2022-07-16 20:44:21'),(210,'92e0362f-85a1-4956-a947-ccb087dd4208','2022-07-16 20:46:38','2022-07-16 20:46:38'),(211,'c543bbe1-c4c1-4729-baeb-d5711b8920ce','2022-07-16 20:47:57','2022-07-16 20:47:57'),(212,'7b631c3b-7a8f-4ffc-aee0-1b550b5c44de','2022-07-16 23:31:04','2022-07-16 23:31:04'),(213,'ec12fd64-60d1-40a7-b5a4-ca4ede2b388d','2022-07-16 23:32:44','2022-07-16 23:32:44'),(214,'5fdfe468-7594-4fcf-8d06-f49640cd1580','2022-07-16 23:34:14','2022-07-16 23:34:14'),(215,'511a338c-7d8e-40bb-a924-9d6c73b031a9','2022-07-16 23:34:26','2022-07-16 23:34:26'),(216,'618c123c-a6f7-4bab-b7e7-8dc5019048e3','2022-07-16 23:37:37','2022-07-16 23:37:37'),(217,'cc98a06f-40a9-4276-acf5-b3dced449737','2022-07-16 23:38:59','2022-07-16 23:38:59'),(218,'f7d6b8ad-1a55-41c3-afb7-ecef2683d802','2022-07-16 23:41:36','2022-07-16 23:41:36'),(219,'0cbff53e-b900-4696-8656-2408f078c359','2022-07-16 23:44:02','2022-07-16 23:44:02'),(220,'6a87a8cb-f4d3-4f46-8cad-3a72ff2bd707','2022-07-16 23:47:26','2022-07-16 23:47:26'),(221,'d69076c7-3ac0-4a79-81fa-0102dfadde37','2022-07-16 23:48:05','2022-07-16 23:48:05'),(222,'fb59a995-0a79-44de-93f4-99e5ed62f403','2022-07-16 23:48:33','2022-07-16 23:48:33'),(223,'6cfb453e-c1ee-43f4-9d3e-38ada93c8e6d','2022-07-16 23:48:55','2022-07-16 23:48:55'),(224,'b17de3d5-169a-434c-8d2a-9e4fd04b0ff2','2022-07-17 00:21:39','2022-07-17 00:21:39'),(225,'b0e4320a-fbc9-44c6-b29e-23ab7a3babea','2022-07-17 00:22:42','2022-07-17 00:22:42'),(226,'3d427a34-aec1-4276-a800-67bb1448b24b','2022-07-17 00:46:40','2022-07-17 00:46:40'),(227,'23fa6663-3bec-4b00-abbd-6e576150374c','2022-07-17 02:24:16','2022-07-17 02:24:16'),(228,'705c9b8f-72e0-46a6-92ea-329679367fc3','2022-07-17 02:33:56','2022-07-17 02:33:56'),(229,'3e1d5dc9-035d-4b8d-b8a9-f7525c696e56','2022-07-17 14:17:27','2022-07-17 14:17:27');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_restaurants`
--

DROP TABLE IF EXISTS `user_restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_restaurants` (
  `user_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`restaurant_id`),
  KEY `user_restaurants_restaurant_id_foreign` (`restaurant_id`),
  CONSTRAINT `user_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_restaurants`
--

LOCK TABLES `user_restaurants` WRITE;
/*!40000 ALTER TABLE `user_restaurants` DISABLE KEYS */;
INSERT INTO `user_restaurants` VALUES (1,2),(1,3),(2,3),(2,4),(1,5),(1,6);
/*!40000 ALTER TABLE `user_restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `braintree_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_enter` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Michael E. Quinn','admin@demo.com','$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu','PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2XqyIv0RvuHdO7Evp3qXgLWriDIRbUrZCUlPLawP5boOfZgiv5pYZc7olZeb',0,'2018-08-06 19:58:41','2022-07-16 18:58:21'),(2,'Barbara J. Glanz','manager@demo.com','$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu','tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5nysjzVKI4LU92bjRqMUSYdOaIo1EcPC3pIMb6Tcj2KXSUMriGrIQ1iwRdd0',0,'2018-08-14 14:06:28','2019-09-25 19:09:35'),(3,'Charles W. Abeyta','client@demo.com','$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K','fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'V6PIUfd8JdHT2zkraTlnBcRSINZNjz5Ou7N0WtUGRyaTweoaXKpSfij6UhqC',4,'2019-10-12 19:31:26','2022-07-02 16:51:37'),(4,'Robert E. Brock','client1@demo.com','$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei','Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2019-10-15 14:55:39','2022-07-02 16:55:39'),(5,'Sanchez Roberto','driver@demo.com','$2y$10$T/jwzYDJfC8c9CdD5PbpuOKvEXlpv4.RR1jMT0PgIMT.fzeGw67JO','OuMsmU903WMcMhzAbuSFtxBekZVdXz66afifRo3YRCINi38jkXJ8rpN0FcfS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2019-12-15 15:49:44','2020-03-29 14:22:10'),(6,'John Doe','driver1@demo.com','$2y$10$YF0jCx2WCQtfZOq99hR8kuXsAE0KSnu5OYSomRtI9iCVguXDoDqVm','zh9mzfNO2iPtIxj6k4Jpj8flaDyOsxmlGRVUZRnJqOGBr8IuDyhb3cGoncvS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2020-03-29 14:28:04','2020-03-29 14:28:04'),(7,'Ahmed','sammirahmedus@gmail.com','$2y$10$cdwVaAxFr6WCMzyCkuRB5O078utFwgEeG3QHDHnv1Vn9xIDb2rjQu','xvEd0rZZAhCoVKdeL5IoGtCWEegOXKUVwayizEho26ONL8G2DfvAAU2ZtJQR','f8ycVs-WRSenvanBzcSt7A:APA91bHE9A7Y8CVmpKd3btY1131Lzia6UskheSCuoMrAM_GzpmU6TuTQcgtd7L3YjmCQTgc2--oKUD_RH1gzXDuu4vTIX-zyLp53YpMV1jHtERj2TrgHEs3PX8bVRHrNPqZ67sAGXYT7',NULL,NULL,NULL,NULL,NULL,NULL,'dgRa0w937d7CxsgjvEWGUpgTR529mBWTg7kRNqEsFJkyd9zPwnyo89tfbhV1',-1,'2021-12-22 21:25:34','2022-07-17 14:16:25'),(8,'ahmed','sammirahmed@hotmail.com','$2y$10$cdwVaAxFr6WCMzyCkuRB5O078utFwgEeG3QHDHnv1Vn9xIDb2rjQu','rSEz4ghbXIFKRrgous1OTsvjZoWgP2gPOLrpI9sonXf70NfkbanSl9jCduVx','f8ycVs-WRSenvanBzcSt7A:APA91bHE9A7Y8CVmpKd3btY1131Lzia6UskheSCuoMrAM_GzpmU6TuTQcgtd7L3YjmCQTgc2--oKUD_RH1gzXDuu4vTIX-zyLp53YpMV1jHtERj2TrgHEs3PX8bVRHrNPqZ67sAGXYT7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-06-22 17:53:22','2022-07-17 01:26:11'),(9,'tyyg','dsgg@gmail.com','$2y$10$210dh/zHifOt1JTFYpwX3u6Z5xnSiRFPGiWJihb2rUuo.40tJkTS6','lWXn5edN1cU3wzjDphEYOOmQUa6InWbhMPf3y3xEvtYiCyC0fJH8qZA7TEeM','dTxUssDwQimHdHvbG6HI8k:APA91bGmZvA3wADYMgdNO1yU_ERlVDK7c3B0tAMA9POFwzmKDUw0dAKBcgT3mKvY74-ulGZS5pl2FsdyUPce3162OwNe-XS5r_nb0X2OQi0Rb0Lok7iu0zD754EuZHwcJ-N6GFWnbrQO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-07-15 12:44:48','2022-07-15 12:44:48'),(10,'احمد سميرحسن','yuyu@gmail.com','$2y$10$cdwVaAxFr6WCMzyCkuRB5O078utFwgEeG3QHDHnv1Vn9xIDb2rjQu','prlkkUQCQdEbem2nDqXGg5bu73QacFqPdOU97xt50l9RaGOwM0I7zEcmXTMN','f8ycVs-WRSenvanBzcSt7A:APA91bHE9A7Y8CVmpKd3btY1131Lzia6UskheSCuoMrAM_GzpmU6TuTQcgtd7L3YjmCQTgc2--oKUD_RH1gzXDuu4vTIX-zyLp53YpMV1jHtERj2TrgHEs3PX8bVRHrNPqZ67sAGXYT7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'2022-07-16 14:36:29','2022-07-17 00:49:50');
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

-- Dump completed on 2022-07-17 20:07:06
