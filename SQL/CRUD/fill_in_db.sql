USE VK;

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (4,'commodi'),(5,'ea'),(2,'est'),(3,'et'),(1,'expedita');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'requested','1993-06-08 12:36:08','1997-02-16 20:46:12'),(2,2,'declined','1985-12-27 08:42:45','2014-10-16 19:23:25'),(3,3,'declined','1980-04-22 04:37:48','1972-06-17 02:43:54'),(4,4,'requested','2002-09-13 03:01:23','2012-02-06 07:29:14'),(5,5,'unfriended','1991-05-13 16:04:13','1980-08-02 17:24:04'),(6,6,'declined','1974-10-28 02:58:39','2008-04-25 03:35:47'),(7,7,'declined','1977-05-14 22:22:19','2007-01-31 21:38:47'),(8,8,'approved','1989-05-02 11:38:42','1982-07-27 10:08:30'),(9,9,'declined','1982-12-23 16:47:13','2007-07-06 07:31:33'),(10,10,'declined','1974-10-31 09:00:33','2009-06-24 14:47:20'),(11,11,'requested','2000-08-08 10:53:20','2000-01-20 11:33:00'),(12,12,'unfriended','1993-09-08 12:24:42','2011-05-03 08:40:57'),(13,13,'requested','1994-12-18 19:54:57','1988-12-21 02:36:23'),(14,14,'declined','1991-08-14 19:19:55','2013-03-13 19:17:06'),(15,15,'approved','1986-04-07 17:39:56','1995-04-19 16:52:13'),(16,16,'approved','1982-06-03 16:04:43','2007-06-02 23:51:39'),(17,17,'unfriended','1988-01-02 13:25:10','2015-12-31 05:31:41'),(18,18,'unfriended','1984-10-29 19:30:04','1992-08-20 17:32:38'),(19,19,'declined','1975-10-03 07:23:05','2009-12-22 01:22:50'),(20,20,'unfriended','2011-09-11 13:38:39','2000-01-31 16:47:09');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2009-02-02 10:58:48'),(2,2,2,'1976-05-08 11:44:12'),(3,3,3,'1997-02-16 18:13:26'),(4,4,4,'1980-07-31 10:22:50'),(5,5,5,'1987-03-08 19:46:08'),(6,6,6,'2016-11-17 02:51:18'),(7,7,7,'2017-05-30 17:46:00'),(8,8,8,'1977-07-18 10:37:38'),(9,9,9,'1974-01-22 00:17:14'),(10,10,10,'1978-08-09 16:58:28'),(11,11,11,'1982-03-08 00:23:13'),(12,12,12,'1976-01-28 07:04:14'),(13,13,13,'1991-01-19 23:36:49'),(14,14,14,'1980-02-01 08:21:57'),(15,15,15,'2007-07-22 03:14:52'),(16,16,16,'1995-11-01 09:24:07'),(17,17,17,'1980-12-01 10:24:57'),(18,18,18,'2017-05-16 00:39:45'),(19,19,19,'1983-03-20 02:02:23'),(20,20,20,'2003-09-09 04:12:18'),(21,1,21,'2013-01-26 06:35:29'),(22,2,22,'1997-11-27 20:32:47'),(23,3,23,'2008-12-31 03:17:31'),(24,4,24,'2017-10-30 19:50:00'),(25,5,25,'1998-09-07 12:21:37'),(26,6,26,'2013-03-10 01:21:43'),(27,7,27,'2000-01-05 21:01:18'),(28,8,28,'1982-10-12 12:23:01'),(29,9,29,'1979-01-08 12:05:46'),(30,10,30,'1989-07-15 06:34:35'),(31,11,31,'1972-08-02 11:43:12'),(32,12,32,'1995-08-08 08:13:03'),(33,13,33,'2009-02-26 01:18:08'),(34,14,34,'2013-09-20 12:18:09'),(35,15,35,'2013-01-25 15:08:31');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Et consequuntur dolorum dolorem inventore officia. Non est laborum voluptatem et qui officiis debitis adipisci. Facere animi aut rerum ducimus. Qui itaque non error.','quia',0,NULL,'1979-08-24 20:37:50','2002-02-09 19:12:27'),(2,2,2,'Illum et nobis animi ipsa voluptatem rem. Eius non ad quisquam eius debitis. Optio voluptates similique temporibus enim illo quis.','earum',20985,NULL,'1977-09-10 01:58:28','1996-02-17 04:53:45'),(3,3,3,'Quo ipsam nulla odit sit. Provident et et voluptates beatae aut. Voluptates quia cupiditate mollitia sint ipsam. Quisquam quia eum maiores error suscipit eveniet non.','quod',3287995,NULL,'1986-01-21 04:06:09','2003-07-24 23:34:16'),(4,4,4,'Placeat officia et aperiam soluta amet. Nihil dolorem debitis ex quasi et illum. Illum voluptas adipisci similique eligendi quia repudiandae et qui.','hic',30608,NULL,'1995-01-24 21:19:14','2001-01-28 23:14:21'),(5,1,5,'Et voluptate necessitatibus id nesciunt aliquid adipisci error ut. Molestiae repudiandae sed commodi modi accusantium vitae. Ipsa error autem accusantium minus temporibus.','voluptas',494,NULL,'2006-10-10 08:09:50','2016-09-27 07:41:56'),(6,2,6,'Consequatur harum at ut veniam dignissimos. Cupiditate quis necessitatibus ut animi magnam ut.','voluptatem',5030,NULL,'2005-11-29 04:16:13','2012-12-21 14:28:22'),(7,3,7,'Eum reiciendis sint aut cupiditate impedit. Odio et est omnis accusamus dolor amet quibusdam autem.','ut',430877848,NULL,'1999-12-22 01:45:49','1977-09-11 13:11:20'),(8,4,8,'Laudantium in et velit culpa. Consequuntur voluptatibus id aliquid ut. Sunt et qui dolore sed velit et. Nam omnis doloremque provident possimus.','voluptatem',9775,NULL,'1974-09-23 13:53:54','2014-06-06 11:17:24'),(9,1,9,'Libero reiciendis ut nemo et ut. At asperiores nobis dolor voluptas non ut nisi aliquam. Dolores iusto omnis sit enim exercitationem id quas. Qui ab omnis iure reiciendis sit.','culpa',92,NULL,'1989-12-11 13:03:42','1975-03-05 17:38:54'),(10,2,10,'Tempora labore qui non eos odit. Sint in doloremque et neque. Officiis eveniet repellat quae eos exercitationem aliquam placeat dolorem.','fugiat',144095,NULL,'2013-07-01 15:32:44','2001-11-25 18:49:19'),(11,3,11,'Dolorem velit molestias nemo ab. Quaerat et quaerat ad et qui. Deleniti facilis velit libero expedita repellat enim.','quia',70020262,NULL,'2002-02-20 10:18:50','1976-11-22 05:41:50'),(12,4,12,'Ut vel aut atque dolorem. Voluptate voluptas et in animi odit. Et vero atque veritatis quam dolorem omnis.','animi',87,NULL,'1973-02-12 19:29:30','2019-09-20 09:36:07'),(13,1,13,'Natus eum accusantium aliquid odit excepturi. Aut harum ducimus voluptas qui eos vel dolorem. Cumque beatae odio delectus saepe dolor quis quibusdam molestiae. Quod temporibus qui autem minima ab quia dignissimos corrupti.','itaque',1646042,NULL,'1978-04-23 19:04:57','1981-09-04 01:35:45'),(14,2,14,'Doloremque nostrum sunt vel doloribus. Explicabo non voluptas rerum accusamus id in. In enim qui omnis architecto ex. Et aut necessitatibus est in hic.','et',131,NULL,'2005-07-11 15:30:10','1974-09-14 17:26:57'),(15,3,15,'Ut exercitationem accusantium voluptas repellendus perspiciatis dolores. Corporis unde ullam quia voluptatibus. Quo voluptas perspiciatis sed magnam eius doloribus porro.','earum',1933,NULL,'2016-10-23 08:57:42','1975-12-12 09:59:24'),(16,4,16,'Quaerat ipsa neque consequatur ut ut et aspernatur. Dolor et ex ut quo ratione. Fugiat amet dicta sed ex cumque sint. Rerum aut alias aut praesentium facilis.','et',479,NULL,'1987-12-17 12:00:36','1993-07-05 10:17:48'),(17,1,17,'Quo quis magnam hic fugit debitis ea quaerat. Sint eius unde iusto sit. Reprehenderit reiciendis quisquam recusandae sit. Quo eligendi ratione odio minima suscipit consectetur accusantium.','voluptatem',2,NULL,'1976-04-20 10:56:00','1998-09-21 21:00:22'),(18,2,18,'Consequatur aliquid et earum unde exercitationem aut. Non quos necessitatibus cum ipsa dolorum dolorem iusto. Suscipit mollitia sit quia ut temporibus quo. Cumque deserunt corrupti pariatur dignissimos temporibus repudiandae aut nihil.','sequi',85075,NULL,'1972-03-21 11:33:11','1996-04-04 11:53:32'),(19,3,19,'Cumque dolor voluptatum porro animi quo. Et ex harum omnis iusto. Fugit magnam est vitae dolorem voluptatem ea. Fugiat perspiciatis incidunt illo omnis.','laudantium',24336,NULL,'2013-08-28 09:54:39','2010-01-06 00:19:05'),(20,4,20,'At sint soluta rerum qui. Libero voluptatem est repellat excepturi in quos ducimus. Ipsam at delectus fugit.','suscipit',4,NULL,'1990-06-13 18:31:18','2013-02-11 02:06:39'),(21,1,1,'Cum soluta in repellat vel. Ratione at doloribus sapiente modi expedita. Facilis atque alias maiores voluptatem. Excepturi optio quis architecto exercitationem repudiandae quasi porro.','rem',59,NULL,'2001-12-06 14:06:30','2011-12-11 14:52:29'),(22,2,2,'Est quae fugit et natus cum iste. Eius voluptatem quia eos blanditiis sit. Est dolorem sint dolorem inventore error quod.','a',296244,NULL,'2004-08-28 20:49:47','2006-11-20 03:34:48'),(23,3,3,'Qui id debitis sit. Tempora alias quaerat repudiandae alias et. Cumque possimus tempore recusandae eos voluptatem molestiae pariatur consectetur. Eos quo magnam molestiae dignissimos.','voluptatem',32060615,NULL,'1970-11-21 02:26:37','2004-12-10 17:14:31'),(24,4,4,'Qui ratione et magnam placeat. Voluptas est unde non dolor. In et et praesentium itaque. Rerum labore consequuntur fugiat reiciendis quidem saepe quia.','omnis',977,NULL,'2003-08-24 10:17:58','1991-01-04 11:57:53'),(25,1,5,'Nesciunt fugiat nihil sequi quia ut et ipsum. Officia veritatis alias voluptatum eos. Et quis recusandae omnis nihil ex voluptates. Magni itaque minima nostrum sint.','quia',56559,NULL,'1990-02-11 20:33:05','2014-11-02 05:59:08'),(26,2,6,'Dolorem quidem quisquam autem ex pariatur qui error. Qui quae minus libero. Est illum atque ab. Et assumenda dolore et. Provident deserunt vel veniam aperiam cupiditate dolore.','perferendis',601977030,NULL,'1978-10-01 11:46:29','1993-11-27 18:12:10'),(27,3,7,'Culpa quae rerum harum eligendi voluptas rerum ut. Praesentium eaque neque sunt porro nesciunt aliquid sapiente. Ullam temporibus et ut ut. Nihil illum et ratione.','fugiat',63212,NULL,'2018-10-21 02:26:43','1985-03-04 16:06:40'),(28,4,8,'Qui soluta ratione necessitatibus possimus qui aut esse. Omnis quo dolor cupiditate libero sunt qui. Velit ut est sed eos et molestiae aut. Dignissimos rerum aut est vel alias.','autem',0,NULL,'2016-10-22 06:32:46','1988-01-30 21:08:15'),(29,1,9,'Odit aperiam ut reiciendis modi et. Eveniet saepe sint harum. Alias et id ut occaecati aperiam.','illum',823,NULL,'1995-07-24 00:40:37','2004-01-02 16:17:54'),(30,2,10,'Aut sit illum sed deserunt consequuntur est totam. Aut dicta voluptates natus eos ipsa qui soluta. Dolores qui officiis et accusantium neque.','deleniti',14703,NULL,'1973-10-28 03:45:43','1991-09-24 23:35:28'),(31,3,11,'Sit vel vitae occaecati sed repudiandae aliquid qui. Enim possimus natus id tenetur consequatur numquam repudiandae voluptatem. Voluptas dicta et in nihil sed.','deserunt',88670,NULL,'1996-08-20 21:46:49','1978-04-07 10:18:23'),(32,4,12,'Omnis vitae vero eum cupiditate voluptatem explicabo magnam. In dolor architecto aut. Debitis fugit est sed ut autem impedit saepe deleniti. Dolorem ad voluptatem nesciunt non.','nobis',53470504,NULL,'1974-06-27 17:56:04','1972-01-30 22:14:44'),(33,1,13,'Rerum ex suscipit nihil expedita sint error iure. Dolorum qui explicabo est saepe. Qui enim quia et et cumque.','tenetur',7508,NULL,'1976-02-06 15:15:20','2014-09-25 15:23:06'),(34,2,14,'Consequatur enim ea a itaque. Voluptatum cupiditate perferendis quo ipsa sint. Minus repellendus odit animi et facilis.','voluptates',387073,NULL,'1994-07-09 08:35:35','1984-05-03 13:48:05'),(35,3,15,'Aperiam impedit delectus officia tempore dolor ducimus quis ab. Alias dolores non sed rem. Dolor natus et debitis illo.','quam',791,NULL,'1989-02-18 19:20:39','1990-05-04 05:41:48'),(36,4,16,'Aliquam in dolorem est voluptatem. Fugiat facere dolorem rerum commodi. Facere deleniti voluptas neque beatae animi. Fugiat aliquam quisquam modi repudiandae repellendus magnam voluptas.','eaque',0,NULL,'1992-01-11 15:30:33','1977-06-17 05:01:39'),(37,1,17,'Ut animi vitae aut repudiandae magni. Ducimus maiores quidem consequatur ea tenetur eligendi pariatur. Voluptatem vel earum facilis voluptatem qui itaque.','quis',5565569,NULL,'1998-07-17 07:27:12','1980-07-02 03:55:28'),(38,2,18,'Aliquid quaerat quae ipsum. Dolores blanditiis expedita libero velit. Cupiditate voluptates et unde facilis labore ab.','enim',270875,NULL,'1983-10-31 15:51:02','1981-10-01 17:46:43'),(39,3,19,'Necessitatibus eum id quia eum rem tenetur. Placeat deserunt vero quo ea eos est et. Ipsa laborum alias qui ipsum impedit. Provident eos dolores laudantium alias perspiciatis velit.','mollitia',0,NULL,'1976-04-09 17:56:01','1984-11-07 10:25:25'),(40,4,20,'Eius voluptas magnam enim libero eveniet quam et. Et non sunt rerum vel. In minima voluptates quia dolor enim.','voluptatem',229020,NULL,'1970-09-29 15:07:10','2002-01-29 06:55:08'),(41,1,1,'Maiores facilis totam sit modi temporibus quia neque. Ut consequatur ad neque sit et maxime unde. Perferendis id illum molestias reiciendis. Voluptatum officia hic voluptatibus nemo rem aut.','sequi',18528208,NULL,'2002-06-29 08:41:32','2018-03-23 04:46:08'),(42,2,2,'Sapiente omnis neque minima beatae. Sapiente provident fuga sit ut. Ratione non cumque aut. Consequatur et qui labore voluptatum. Explicabo inventore excepturi eum debitis reiciendis.','voluptates',149,NULL,'2000-05-15 06:08:57','2011-09-30 17:27:15'),(43,3,3,'Velit dignissimos autem necessitatibus. Est sit et officia itaque rerum est. Aut eligendi quidem neque sint. Et quae maiores dolor recusandae mollitia.','dolore',16018,NULL,'1989-02-15 00:17:39','2001-04-29 13:24:55'),(44,4,4,'Repudiandae voluptas rerum dolorum aut et. Sequi tempora soluta voluptatibus. Fuga consequatur consequatur saepe aliquid aut aut. Pariatur fuga dolor magnam omnis minus quis repellendus.','eos',66597368,NULL,'1976-08-16 12:30:28','1995-01-08 07:29:47'),(45,1,5,'Repudiandae et at alias numquam dicta tempora beatae. Pariatur odit fuga quia aut praesentium quo perspiciatis. Qui et dignissimos totam.','ad',5,NULL,'2002-05-12 06:07:01','2015-01-15 10:55:00');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'provident','2006-03-26 11:13:02','1991-02-07 15:36:08'),(2,'vitae','1979-04-28 10:40:16','2007-10-19 19:22:35'),(3,'optio','2001-11-30 23:18:15','1976-09-28 04:19:43'),(4,'et','2004-10-22 11:22:32','1988-11-18 23:21:38');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Et eos laborum voluptatem in cumque distinctio. Esse accusamus dicta dolorem aut commodi voluptatem magni facilis. Quaerat reprehenderit excepturi maiores eos.','1983-01-06 14:41:50'),(2,2,2,'Repudiandae ut temporibus eveniet delectus quis ab dolor. Voluptas maiores rerum provident velit. Autem officia nihil adipisci ea. Nemo ut fugiat repellat quia et quibusdam tempora et.','1985-07-21 22:44:27'),(3,3,3,'Similique minus eaque velit eaque sit quo ipsam. Voluptatibus quod fugit magni et quaerat quis fugiat consequuntur. Et doloribus laboriosam architecto porro ex corporis.','1985-06-27 04:43:52'),(4,4,4,'Sapiente pariatur et soluta nobis voluptatem placeat odit aut. Aut autem quo dicta ipsum. Nam sapiente vero aut eos aliquid nostrum.','2019-03-06 12:27:47'),(5,5,5,'Doloribus vero odit quia cum eius. Animi molestiae ea amet qui facere. Iure voluptatem eveniet explicabo voluptatem nostrum error eos. Excepturi autem ut veniam est.','1999-09-29 23:54:30'),(6,6,6,'Aut expedita reprehenderit id exercitationem deleniti adipisci. Fuga suscipit adipisci quia suscipit eveniet error suscipit. Suscipit impedit voluptatem est enim ut dignissimos.','1979-11-23 09:33:21'),(7,7,7,'Minima neque repellendus qui qui occaecati doloribus. Ut nam doloremque est mollitia error. Eum minus adipisci eius ut consectetur.','2004-06-05 18:13:31'),(8,8,8,'Iusto quia dolores iste. Qui non quo omnis earum. Voluptatem voluptas eum eveniet repellat corporis. Accusantium atque tempore ad. Ipsum voluptatem et non necessitatibus totam ullam accusantium alias.','2001-05-02 08:50:20'),(9,9,9,'Est facere sed et facere. Numquam repellendus nisi officiis dolor ut. Quidem voluptas molestiae ipsam quae debitis. Est et voluptas et repellendus aspernatur non saepe vel.','2017-01-26 09:55:08'),(10,10,10,'Reiciendis nobis et soluta a inventore distinctio. Et eligendi nihil quasi tempora distinctio et ut eos. Accusantium aut consequatur libero veritatis dolor debitis. Excepturi ea voluptatem rem sit facere dignissimos voluptates. Velit non omnis fuga odit vel distinctio maxime.','1983-11-27 20:28:32'),(11,11,11,'Quod autem nobis occaecati ipsum. Dolore rerum ut sunt officia modi est. Ullam ut voluptatem vel temporibus dolores.','1995-02-17 23:37:00'),(12,12,12,'Dolorum vitae et mollitia atque delectus soluta aspernatur. Dolores illum quas minima pariatur ex ea tempore. Animi molestiae quis cum ipsam sunt.','1983-06-03 05:45:58'),(13,13,13,'Ut facilis unde sed commodi. Quas et facilis sit dolorem accusamus.','1999-04-05 02:33:14'),(14,14,14,'Impedit voluptas quos assumenda vitae labore sint. Ducimus est voluptas accusamus voluptatum sint expedita.','1978-08-14 18:14:21'),(15,15,15,'Porro aut facere voluptatum saepe. Iste sed laudantium explicabo dolorum repudiandae. Corrupti molestiae ullam maiores eaque.','2017-04-15 02:52:14'),(16,16,16,'Et explicabo in ab assumenda optio vero incidunt totam. Et eligendi soluta dolor. Dolores quia molestiae quia fuga est hic.','2014-07-27 13:56:24'),(17,17,17,'Hic doloremque tempora omnis aut aut. Quos minima est ut. Et quam enim ab quo ut dignissimos.','1991-07-01 16:44:20'),(18,18,18,'Cupiditate et eius laudantium architecto ratione et. Et voluptatibus veritatis sit dolore quas blanditiis ut. Quaerat nihil vitae officiis quibusdam eaque optio voluptates esse. Dolorem necessitatibus pariatur voluptas ipsam. Ut ab omnis autem ut vero eum eum.','1974-06-10 08:30:10'),(19,19,19,'Omnis tempora quibusdam ea modi corrupti. Id voluptatibus voluptas omnis. Tempore voluptas dicta molestias a. Ut aut reprehenderit similique dicta ut.','1999-08-01 11:32:23'),(20,20,20,'Beatae voluptas amet suscipit nostrum. Quia est qui explicabo quisquam doloremque.','1998-07-19 13:53:46'),(21,1,1,'Repellat cumque possimus voluptate molestiae voluptatem maxime. Sunt molestias et qui tempore. Inventore eligendi distinctio fugiat quam. Sit consequatur dolores aut et.','1983-12-04 01:27:58'),(22,2,2,'Voluptatem vitae id perferendis corporis eum ipsum pariatur. Corporis perferendis voluptatem totam commodi. Et blanditiis atque modi unde sit. Dolor fugiat et saepe in magnam et.','2015-07-25 07:48:59'),(23,3,3,'Nesciunt dicta repudiandae nesciunt ut aut. Minus quia similique cum et eligendi quia est suscipit. Alias aut est quidem distinctio.','1982-05-28 01:16:08');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'labore',1),(2,'distinctio',2),(3,'et',3),(4,'placeat',4),(5,'dolores',5);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,1,6),(7,2,7),(8,3,8),(9,4,9),(10,5,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15),(16,1,16),(17,2,17),(18,3,18),(19,4,19),(20,5,20),(21,1,21),(22,2,22),(23,3,23),(24,4,24),(25,5,25),(26,1,26),(27,2,27),(28,3,28),(29,4,29),(30,5,30),(31,1,31),(32,2,32);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,NULL,'2000-05-30',1,'1973-03-01 13:58:47',NULL),(2,NULL,'1978-01-04',2,'1997-02-27 06:41:41',NULL),(3,NULL,'1986-07-01',3,'1992-12-21 05:41:25',NULL),(4,NULL,'2008-08-21',4,'2009-03-13 22:24:23',NULL),(5,NULL,'1976-10-04',5,'1973-11-17 10:45:32',NULL),(6,NULL,'1978-05-01',6,'1997-05-03 22:18:17',NULL),(7,NULL,'2001-07-20',7,'1970-06-29 19:33:08',NULL),(8,NULL,'1974-10-20',8,'2002-09-20 08:45:00',NULL),(9,NULL,'2010-04-15',9,'1986-09-29 14:12:04',NULL),(10,NULL,'2017-04-19',10,'1989-09-12 01:46:37',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_idx` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rita','Wilkinson','hirthe.eliane@example.net',1),(2,'Louisa','Dooley','beahan.sanford@example.com',524),(3,'Marta','Ledner','ibahringer@example.com',834126),(4,'Cullen','Wintheiser','mhyatt@example.org',0),(5,'Bianka','Schmitt','sylvester.klein@example.net',719),(6,'Vern','Hackett','graham.deshaun@example.net',0),(7,'Nasir','Price','cassandra.mckenzie@example.com',0),(8,'Era','Littel','judson94@example.net',718569),(9,'Bruce','Gaylord','cschuppe@example.net',0),(10,'Grayson','Hessel','silas.toy@example.net',892),(11,'Josianne','Ziemann','kaela59@example.net',1),(12,'Judah','Becker','onie.ziemann@example.net',0),(13,'Sofia','Cassin','tratke@example.com',1),(14,'Wilford','Hudson','theodore.murphy@example.com',7507726218),(15,'Parker','Schmeler','samanta.schowalter@example.net',6539974407),(16,'Cleveland','Padberg','msmith@example.org',0),(17,'Alexane','Erdman','pietro.welch@example.net',1),(18,'Virginia','Bode','lemke.kyra@example.org',0),(19,'Kirstin','Kohler','layla47@example.org',0),(20,'Elisa','Hahn','pcrist@example.org',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-31 10:32:13
