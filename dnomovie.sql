-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dnomovie
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(22,'Can add webuser',8,'add_webuser'),(23,'Can change webuser',8,'change_webuser'),(24,'Can delete webuser',8,'delete_webuser'),(25,'Can add movie',9,'add_movie'),(26,'Can change movie',9,'change_movie'),(27,'Can delete movie',9,'delete_movie'),(28,'Can add movie history',10,'add_moviehistory'),(29,'Can change movie history',10,'change_moviehistory'),(30,'Can delete movie history',10,'delete_moviehistory'),(31,'Can add movie coment',11,'add_moviecoment'),(32,'Can change movie coment',11,'change_moviecoment'),(33,'Can delete movie coment',11,'delete_moviecoment'),(34,'Can add Question',12,'add_question'),(35,'Can change Question',12,'change_question'),(36,'Can delete Question',12,'delete_question'),(37,'Can add Answer',13,'add_answer'),(38,'Can change Answer',13,'change_answer'),(39,'Can delete Answer',13,'delete_answer'),(40,'Can add Tag',14,'add_tag'),(41,'Can change Tag',14,'change_tag'),(42,'Can delete Tag',14,'delete_tag'),(43,'Can add Activity',15,'add_activity'),(44,'Can change Activity',15,'change_activity'),(45,'Can delete Activity',15,'delete_activity'),(46,'Can add Notification',16,'add_notification'),(47,'Can change Notification',16,'change_notification'),(48,'Can delete Notification',16,'delete_notification'),(49,'Can add chat group',17,'add_chatgroup'),(50,'Can change chat group',17,'change_chatgroup'),(51,'Can delete chat group',17,'delete_chatgroup'),(52,'Can add movie spider',18,'add_moviespider'),(53,'Can change movie spider',18,'change_moviespider'),(54,'Can delete movie spider',18,'delete_moviespider');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$S4M71WNmz4Rw$AonFPCUJ5drDGgk+oTZvUnmso4xv4ygzPJHhsjr8jic=','2016-05-11 21:57:26',1,'admin','','','1142394341@qq.com',1,1,'2016-03-15 10:11:19'),(15,'pbkdf2_sha256$20000$XNp7Fr4DOvX2$TzArNcy1g5rGHGiKFP6eBaWN6Zj+/fI2T4WWapQ89YE=','2016-04-30 19:58:31',0,'andy','','','853970293@qq.com',0,1,'2016-04-11 13:12:14'),(16,'pbkdf2_sha256$20000$OHcRw6mJVqrr$yKCb6LT/c0XfR/xziu4fPdOPCcInEPcGEgiiG3sWurs=','2016-05-18 09:09:41',0,'alex','','','1@qq.com',0,1,'2016-04-12 09:59:14'),(17,'pbkdf2_sha256$20000$mk8PH7zOm10s$3Ber3dAMet/zDWMIA1J1UJtiH37boHR4RezSRSPiaUQ=','2016-05-07 16:16:41',0,'feng','','','1@qq.com',0,1,'2016-04-15 20:21:27'),(18,'pbkdf2_sha256$20000$wpwfsJC21PsE$NkWReH5jfUKBV5nrHO1MXqDp8dFHPRNUyjADQ6U7i48=','2016-04-16 11:28:21',0,'alex_andy1','','','2@qq.com',0,1,'2016-04-16 11:28:20'),(19,'pbkdf2_sha256$20000$3IHCWqseyClt$ZQppo0CNA27Hw1o0/o3ZJeF8n7Jr7Sd6eECUFSSoZMM=','2016-04-16 16:03:53',0,'apache','','','4@qq.com',0,1,'2016-04-16 11:29:50'),(20,'pbkdf2_sha256$20000$gd1j75bmgQxt$r6EGw/et5Ev55ReQmHBlkTBE0PbdMopQ3e2Sv7lcHms=','2016-04-16 11:31:18',0,'feng1','','','3@qq.com',0,1,'2016-04-16 11:31:17'),(21,'pbkdf2_sha256$20000$CiG5VFMauYbk$dhnIPUMUUi3eaJt1MhXSVURATJJfN55OvFeCpZklvng=','2016-04-29 16:21:14',0,'tianxia123','','','123@qq.com',0,1,'2016-04-29 09:11:00');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-15 10:20:06','2','alex',1,'',4,1),(2,'2016-03-17 10:54:46','9','admin123',3,'',4,1),(3,'2016-03-17 10:54:46','2','alex',3,'',4,1),(4,'2016-03-17 10:54:46','3','alex_.Y',3,'',4,1),(5,'2016-03-17 10:54:46','7','alex_.Ydfsfwfd',3,'',4,1),(6,'2016-03-17 10:54:46','5','alex_.Yew',3,'',4,1),(7,'2016-03-17 10:54:46','6','alex_.Yfdsfa',3,'',4,1),(8,'2016-03-17 10:54:46','8','alex_.Yl',3,'',4,1),(9,'2016-03-17 10:54:46','4','alex_.YY',3,'',4,1),(10,'2016-04-16 15:31:29','1','alex - 乱世佳人',1,'',11,1),(11,'2016-04-16 15:53:09','2','alex - 大话西游之大圣娶亲',1,'',11,1),(12,'2016-04-16 15:53:43','2','alex - 大话西游之大圣娶亲',2,'已修改 comment 。',11,1),(13,'2016-04-19 19:59:27','1','下载链接：http://www.xunlei.com',1,'',13,1),(14,'2016-04-26 19:45:05','7','alex',2,'已修改 friends 。',8,1),(15,'2016-04-26 19:45:49','1','Test',1,'',17,1),(16,'2016-04-29 09:11:39','12','tianxia123',2,'已修改 friends 。',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'movie','movie'),(11,'movie','moviecoment'),(10,'movie','moviehistory'),(18,'movie','moviespider'),(15,'questions','activity'),(13,'questions','answer'),(16,'questions','notification'),(12,'questions','question'),(14,'questions','tag'),(6,'sessions','session'),(17,'webchat','chatgroup'),(8,'webuser','webuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-15 09:23:58'),(2,'auth','0001_initial','2016-03-15 09:24:00'),(3,'admin','0001_initial','2016-03-15 09:24:00'),(4,'contenttypes','0002_remove_content_type_name','2016-03-15 09:24:01'),(5,'auth','0002_alter_permission_name_max_length','2016-03-15 09:24:01'),(6,'auth','0003_alter_user_email_max_length','2016-03-15 09:24:01'),(7,'auth','0004_alter_user_username_opts','2016-03-15 09:24:01'),(8,'auth','0005_alter_user_last_login_null','2016-03-15 09:24:02'),(9,'auth','0006_require_contenttypes_0002','2016-03-15 09:24:02'),(10,'sessions','0001_initial','2016-03-15 09:24:02'),(11,'webuser','0001_initial','2016-03-15 10:08:18'),(12,'webuser','0002_auto_20160316_1253','2016-03-16 12:53:27'),(13,'webuser','0003_auto_20160317_0031','2016-03-17 00:32:11'),(14,'movie','0001_initial','2016-03-19 08:17:13'),(15,'movie','0002_auto_20160319_1111','2016-03-19 11:11:32'),(16,'movie','0003_auto_20160319_1333','2016-03-19 13:33:16'),(17,'movie','0004_moviecoment_moviehistory','2016-04-12 11:28:45'),(18,'movie','0005_auto_20160416_1125','2016-04-16 11:26:10'),(19,'movie','0006_auto_20160416_1534','2016-04-16 15:35:17'),(20,'movie','0007_auto_20160416_1549','2016-04-16 15:49:06'),(21,'questions','0001_initial','2016-04-17 20:58:13'),(22,'questions','0002_activity_notification','2016-04-21 18:48:36'),(23,'webuser','0004_auto_20160426_1936','2016-04-26 19:36:57'),(24,'webchat','0001_initial','2016-04-26 19:36:59'),(25,'movie','0008_auto_20160506_1928','2016-05-06 19:29:00'),(26,'movie','0009_auto_20160509_1519','2016-05-09 15:19:30'),(27,'movie','0002_moviespider_country','2016-05-10 16:56:10');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('06o119ukd3bkj6y44cmwubbdnlhy33tb','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-03-31 00:32:54'),('0yvuwbezzkqx3z9disoounme4zvrjfi2','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-03-31 00:43:42'),('2hc0lzfgqy783dzdkvvitql5d54ray93','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-13 15:17:08'),('3lvhf4neh7qye85np0362yhek4ke0yva','M2M2Yjc2ZDY2MGQ2N2ZlYzdlMTNlNWY1MjJlMTBkNzY2NWQwNWE0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwN2NmYTBhMmU2NDEzYmIwNWYxZTI1MTY4NGEyZDg2YzI2ZmIwNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2016-05-13 14:50:24'),('4dwiv5bmoba4u683biiv6mpou3a2mpmv','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-14 19:57:48'),('5enxtxixedmdbd5dmlqxhiz72veuub8b','M2M2Yjc2ZDY2MGQ2N2ZlYzdlMTNlNWY1MjJlMTBkNzY2NWQwNWE0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwN2NmYTBhMmU2NDEzYmIwNWYxZTI1MTY4NGEyZDg2YzI2ZmIwNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2016-05-13 14:29:26'),('9hjtvf9a8z0gfeweoirxdzkfygbubvj5','M2M2Yjc2ZDY2MGQ2N2ZlYzdlMTNlNWY1MjJlMTBkNzY2NWQwNWE0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwN2NmYTBhMmU2NDEzYmIwNWYxZTI1MTY4NGEyZDg2YzI2ZmIwNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2016-05-13 14:42:37'),('dpm61q7npaxhou8as5evzuobx1cumzdr','ZmVhMmU5OWVhMGNjNTY0MDE0ZWU5MDM4YTE5NGVkYWY3ZWEzMjk3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyOGQ0NDFlMDhiMjhlZjdlOGRlNTljYTcwZDFmZWNiZDlhMTllNDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-25 21:20:27'),('gpoo9wl443af47vxrdpthxatktjfdirc','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-03-31 00:45:10'),('hha08r45n9tvm0ekezy8so4eq1szlzuo','NzM0NWFlZmQyYmEyNmY2ZTYwMTFhYWMyMTk4OTdiMDQwOWJmNzhlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4ZWUzODIwYTkyYmI5N2I3MDM3MTZhZTJjMTkyZTJjMGQwZjM3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2016-03-30 15:55:53'),('hhjtsoeju5rpvdugiupjfnvyopvz9etv','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-13 14:42:52'),('kxzflzhxuiaxq1u2l0fzq6mrdmjqrw72','ZmVhMmU5OWVhMGNjNTY0MDE0ZWU5MDM4YTE5NGVkYWY3ZWEzMjk3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyOGQ0NDFlMDhiMjhlZjdlOGRlNTljYTcwZDFmZWNiZDlhMTllNDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-25 21:57:26'),('l8pm0arwkiqqt1yc3bxnd409av0sxvlq','N2I1ZGJkMWE5ZmFmNTJkMWM5MzM0ZTQ5YTViMThmYTIyODE5MWJmZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQxNDFhY2Q0NGIyZmQwMWZmMTcyMWRkNzFhNDFjODM3MjMxNzhlNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9','2016-05-14 16:29:12'),('mot6ikxjlkta0d6bw8glwc9xhkxwa6q1','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-13 15:03:02'),('oxpvhega9qw3v4gd8g3kkyeyzonq1th8','M2M2Yjc2ZDY2MGQ2N2ZlYzdlMTNlNWY1MjJlMTBkNzY2NWQwNWE0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwN2NmYTBhMmU2NDEzYmIwNWYxZTI1MTY4NGEyZDg2YzI2ZmIwNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2016-05-13 15:02:49'),('ozbbgfzevu5mhu6bia74n3zgmjvucqwa','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-24 10:46:36'),('q2u7ahir0qe0fwge1mdhva2jof1c8ok5','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-05-24 09:45:59'),('rqepp1n6osxly56kq67orv1zxy1t69n0','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-06-01 09:09:41'),('t58zckduky9y29qyvlvlvw9jcnygkil9','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-21 16:15:45'),('thflswm04jh605pk02psiv6trl2h9t9v','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-13 13:19:07'),('u7mfq4652ho8bod1e7lcrxaar8xo7mfi','ZmVhMmU5OWVhMGNjNTY0MDE0ZWU5MDM4YTE5NGVkYWY3ZWEzMjk3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyOGQ0NDFlMDhiMjhlZjdlOGRlNTljYTcwZDFmZWNiZDlhMTllNDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-25 16:06:18'),('v9iaj9fq15i5mljy74y89c19b6wvv4jy','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-03-31 00:37:45'),('x3ij8pqct5dgpopvzgb2qjij177ip6ti','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-03-31 00:34:35'),('xu95y8q7speiopu2obx61ftu17eyt88w','MzhkZjc5NTMxMzA3OWMwOWI5YWViNjZmZjYzYzNlYjY3NDY1MjA2MDp7fQ==','2016-03-31 00:48:40'),('zaazwm7ivyukkwv1np3gkggq2patdnda','Yjc0NTJjYjgxMjBhMTdiYWE3NjlmZTRlZTg4YjA3NzgxMGFlYjYxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwODJlZTBjNjYyZmVkODY4N2YxNTA5YWY0YjdlNWFkNzI3MDEwZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2016-04-26 10:08:35'),('zez1aazcku6s3xlab9eaagt2kpgjhtyr','M2M2Yjc2ZDY2MGQ2N2ZlYzdlMTNlNWY1MjJlMTBkNzY2NWQwNWE0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwN2NmYTBhMmU2NDEzYmIwNWYxZTI1MTY4NGEyZDg2YzI2ZmIwNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2016-05-13 15:16:59'),('zs170oxkrdulvek21ezi4ukohctpeuw4','NzQ1MDMzMmQ1NTczNWQ4ZmVmMGU5Y2ZlYmQ5MjJkYTQ5MjIyMWY3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MWQwYzFjNjE0MTVjOWE0MzFmN2E2MTdlNzBmNmQ2NGJkMmMxMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2016-05-13 14:51:14');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_movie`
--

DROP TABLE IF EXISTS `movie_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moviename` varchar(64) NOT NULL,
  `doubanlink` varchar(256) DEFAULT NULL,
  `doubanscore` varchar(64) DEFAULT NULL,
  `doubancounter` int(11) DEFAULT NULL,
  `imdblink` varchar(256) DEFAULT NULL,
  `imdbscore` varchar(64) DEFAULT NULL,
  `imdbcounter` int(11) DEFAULT NULL,
  `nomovielink` varchar(256) DEFAULT NULL,
  `nomoviescore` varchar(64) DEFAULT NULL,
  `nomoviecounter` int(11) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `dateyear` varchar(64) DEFAULT NULL,
  `actor` varchar(256) DEFAULT NULL,
  `director` varchar(256) DEFAULT NULL,
  `style` varchar(64) DEFAULT NULL,
  `movieaddress` varchar(256) DEFAULT NULL,
  `downloadlink` varchar(256) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `original` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `spidertime` datetime DEFAULT NULL,
  `aboutmovie` varchar(256) DEFAULT NULL,
  `language` varchar(64) DEFAULT NULL,
  `dyttsearch` varchar(256) DEFAULT NULL,
  `dyttdetail` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44311 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movie`
--

LOCK TABLES `movie_movie` WRITE;
/*!40000 ALTER TABLE `movie_movie` DISABLE KEYS */;
INSERT INTO `movie_movie` VALUES (44066,'洛城机密','https://movie.douban.com/subject/1292348/','8.6',65273,'http://www.imdb.com/title/tt0119488',NULL,NULL,NULL,NULL,NULL,'','1997-09-19(美国)','凯文·史派西 罗素·克劳 盖·皮尔斯 詹姆斯·克伦威尔 金·贝辛格 丹尼·德维托 大卫·斯特雷泽恩 朗·瑞弗金 格拉汉姆·贝克尔 安贝尔·史密斯 John Mahon 保罗·吉尔福伊尔 马特·麦考伊 保罗·塞甘蒂 西蒙·贝克 达雷尔·桑迪 马里索尔·帕迪拉·桑切斯 格温达·迪肯 肖尼·弗里·琼斯 伊丽莎白·格兰里 桑德拉·泰勒 史蒂夫·兰金','柯蒂斯·汉森','剧情 悬疑 惊悚 犯罪',NULL,NULL,NULL,'4',1,'p2268612953.jpg',NULL,NULL,NULL,NULL,NULL),(44067,'我在伊朗长大','https://movie.douban.com/subject/1962116/','8.7',62450,'http://www.imdb.com/title/tt0808417',NULL,NULL,NULL,NULL,NULL,'','2007-06-27(法国)','基娅拉·马斯特洛亚尼 凯瑟琳·德纳芙 达尼尔·达黎欧 西蒙·阿布卡瑞安','文森特·帕兰德玛嘉·莎塔琵','剧情 动画 传记 战争','http://www.iqiyi.com/v_19rrh8hmds.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1486953897.jpg',NULL,NULL,NULL,NULL,NULL),(44068,'疯狂的石头','https://movie.douban.com/subject/1862151/','8.2',243685,'http://www.imdb.com/title/tt0843270',NULL,NULL,NULL,NULL,NULL,'','2006-06-30(中国大陆)','郭涛 刘桦 连晋 黄渤 徐峥 优恵 罗兰  王迅','宁浩','喜剧 犯罪',NULL,NULL,NULL,'4',1,'p712241453.jpg',NULL,NULL,NULL,NULL,NULL),(44069,'荒蛮故事','https://movie.douban.com/subject/24750126/','8.7',78506,'http://www.imdb.com/title/tt3011894',NULL,NULL,NULL,NULL,NULL,'','2014-08-14(阿根廷)','里卡杜·达林 艾丽卡·里瓦斯 丽塔·科尔泰塞 地亚哥·詹蒂莱 达里奥·葛兰帝内提 莱昂纳多·斯巴拉格利亚 奥斯卡·马丁内兹 胡丽叶塔·泽尔贝伯格 迭戈·佩雷蒂 南希·杜普拉 玛丽娅·玛努尔 凯撒·博尔东','达米安·斯兹弗隆','剧情 喜剧 犯罪','http://www.tudou.com/albumplay/rgvAtANVvyE/1-A_EkW41I8.html',NULL,NULL,'4',1,'p2192834364.jpg',NULL,NULL,NULL,NULL,NULL),(44070,'跳出我天地','https://movie.douban.com/subject/1301169/','8.7',51315,'http://www.imdb.com/title/tt0249462',NULL,NULL,NULL,NULL,NULL,'','2000-05-19(戛纳电影节)','杰米·贝尔 朱丽·沃特斯 Gary Lewis Jean Heywood 杰米·德拉文','史蒂芬·戴德利','剧情 歌舞 家庭 儿童','http://www.iqiyi.com/v_19rrkgf2m4.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p531278288.jpg',NULL,NULL,NULL,NULL,NULL),(44071,'我爱你','https://movie.douban.com/subject/5908478/','9.0',41200,'http://www.iloveyou2011.co.kr/',NULL,NULL,NULL,NULL,NULL,'','2011-02-17(韩国)','宋在浩 李顺载 尹秀晶 金秀美 宋智孝 吴达洙','秋昌民','剧情 爱情','http://www.tudou.com/albumplay/pqCdi4DClO8/07O5SNpAs5c.html?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwMV8wMV8wMQ',NULL,NULL,'4',1,'p1075591188.jpg',NULL,NULL,NULL,NULL,NULL),(44072,'我们俩','https://movie.douban.com/subject/1756073/','8.6',62595,'http://www.imdb.com/title/tt0757376',NULL,NULL,NULL,NULL,NULL,'','2005-10(东京电影节)','宫哲 金雅琴 罗忠学 孙捷 强爽 刘正亮','马俪文','剧情','http://www.1905.com/vod/play/85406.shtml',NULL,NULL,'4',1,'p2173725381.jpg',NULL,NULL,NULL,NULL,NULL),(44073,'速度与激情5','https://movie.douban.com/subject/4286017/','8.4',185500,'http://www.fastfivemovie.com',NULL,NULL,NULL,NULL,NULL,'','2011-05-12(中国大陆)','范·迪塞尔 保罗·沃克 道恩·强森 乔丹娜·布鲁斯特 泰瑞斯·吉布森 卢达克里斯 马特·斯查尔兹 姜成镐 盖尔·加朵 埃尔莎·帕塔奇 乔昆姆·德·阿尔梅达 迈克尔·埃尔比','林诣彬','剧情 动作 惊悚 犯罪','http://www.iqiyi.com/v_19rri0vxp0.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p898634801.jpg',NULL,NULL,NULL,NULL,NULL),(44074,'假如爱有天意','https://movie.douban.com/subject/1304073/','8.2',185784,'http://www.imdb.com/title/tt0348568',NULL,NULL,NULL,NULL,NULL,'','2003-01-30','孙艺珍 曹承佑 赵寅成 李己雨 金秉玉 徐英姬','郭在容','剧情 爱情','http://www.iqiyi.com/dianying/20100830/n31485.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p479746811.jpg',NULL,NULL,NULL,NULL,NULL),(44075,'不一样的天空','https://movie.douban.com/subject/1301617/','8.6',68034,'http://www.imdb.com/title/tt0108550',NULL,NULL,NULL,NULL,NULL,'','1993-12-17(美国)','约翰尼·德普 莱昂纳多·迪卡普里奥 朱丽叶特·刘易斯 玛丽·斯汀伯根 达尔莱尼·凯茨 马里·凯特·舒切尔哈德特 凯文·泰德 约翰·C·赖利 克里斯平·格洛弗 Laura Harrington Tim Green','莱塞·霍尔斯道姆','剧情 爱情 家庭','http://www.iqiyi.com/dianying/20110413/5d1f22c815181b90.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2175712032.jpg',NULL,NULL,NULL,NULL,NULL),(44076,'廊桥遗梦','https://movie.douban.com/subject/1293929/','8.5',77200,'http://www.imdb.com/title/tt0112579',NULL,NULL,NULL,NULL,NULL,'','1995-06-02(美国)','克林特·伊斯特伍德 梅丽尔·斯特里普 Annie Corley 维克多·斯勒扎克 Jim Haynie','克林特·伊斯特伍德','剧情 爱情','http://www.56.com/u81/v_NTc5OTIwNzA.html',NULL,NULL,'4',1,'p616768086.jpg',NULL,NULL,NULL,NULL,NULL),(44077,'千钧一发','https://movie.douban.com/subject/1300117/','8.7',60630,'http://www.imdb.com/title/tt0119177',NULL,NULL,NULL,NULL,NULL,'','1997-10-24(美国)','伊桑·霍克 乌玛·瑟曼 裘德·洛 艾伦·阿金 戈尔·维达尔 山德·贝克利 劳恩·迪恩','安德鲁·尼科尔','剧情 科幻','http://vip.iqiyi.com/20111021/10a16c0a6b2283f7.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2195672555.jpg',NULL,NULL,NULL,NULL,NULL),(44078,'角斗士','https://movie.douban.com/subject/1293530/','8.4',108305,'http://www.imdb.com/title/tt0172495',NULL,NULL,NULL,NULL,NULL,'','2000-05-05','罗素·克劳 杰昆·菲尼克斯 康妮·尼尔森 理查德·哈里斯 杰曼·翰苏 奥列佛·里德 德里克·雅各比','雷德利·斯科特','剧情 动作 历史 冒险','http://www.iqiyi.com/v_19rrol0698.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1601948450.jpg',NULL,NULL,NULL,NULL,NULL),(44079,'月球','https://movie.douban.com/subject/3073124/','8.5',113641,'http://www.imdb.com/title/tt1182345',NULL,NULL,NULL,NULL,NULL,'','2009-07-17','山姆·洛克威尔 凯文·史派西 多米妮克·麦克艾丽戈特 卡雅·斯考达里奥 马特·贝里 罗宾·查克','邓肯·琼斯','剧情 科幻 悬疑','http://www.iqiyi.com/v_19rrifx41d.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p449399746.jpg',NULL,NULL,NULL,NULL,NULL),(44080,'导盲犬小Q','https://movie.douban.com/subject/1316572/','8.4',103492,'http://www.imdb.com/title/tt0400761',NULL,NULL,NULL,NULL,NULL,'','2004-03-13(日本)','小林薰 椎名桔平 香川照之 户田惠子 黑谷友香','崔洋一','剧情','http://www.iqiyi.com/dianying/20110812/c156cc903ccde56f.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1233612794.jpg',NULL,NULL,NULL,NULL,NULL),(44081,'寿司之神','https://movie.douban.com/subject/6146955/','8.8',62127,'http://www.imdb.com/title/tt1772925',NULL,NULL,NULL,NULL,NULL,'','2011-11-08(美国电影学院影展)','小野二郎  小野祯一 小野隆 山本益弘','大卫·贾柏','纪录片','http://www.letv.com/ptv/vplay/20009312.html',NULL,NULL,'4',1,'p1528763106.jpg',NULL,NULL,NULL,NULL,NULL),(44082,'未麻的部屋','https://movie.douban.com/subject/1395091/','8.7',59397,'http://www.imdb.com/title/tt0156887',NULL,NULL,NULL,NULL,NULL,'','1997-07(加拿大奇幻电影节)','岩男润子 松本梨香 辻亲八','今敏','动画 惊悚 奇幻','http://www.letv.com/ptv/vplay/2248768.html',NULL,NULL,'4',1,'p1351050722.jpg',NULL,NULL,NULL,NULL,NULL),(44083,'血钻','https://movie.douban.com/subject/1428175/','8.5',102196,'http://www.imdb.com/title/tt0450259',NULL,NULL,NULL,NULL,NULL,'','2006-12-08(美国)','莱昂纳多·迪卡普里奥 詹妮弗·康纳利 杰曼·翰苏 大卫·哈雷伍德 阿诺德·沃斯洛','爱德华·兹威克','剧情 惊悚 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F110081%2Ff%2F1138967.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E8%A1%80%E9%92%BB%281080P%29&sign=434dcc61cf859fe7ae6a22e18f4e4937',NULL,NULL,'4',1,'p1244017576.jpg',NULL,NULL,NULL,NULL,NULL),(44084,'牯岭街少年杀人事件','https://movie.douban.com/subject/1292329/','8.6',72527,'http://www.imdb.com/title/tt0101985',NULL,NULL,NULL,NULL,NULL,'','1991-07-27(台湾)','张震 杨静怡 张国柱 王启赞 林鸿铭 金燕玲 王琄 张瀚 姜秀琼 赖梵耘 柯宇纶 谭志刚 冯国强 陈湘琪 金士杰','杨德昌','剧情 犯罪','http://v.youku.com/v_show/id_XMjAzNzg0MDE2.html',NULL,NULL,'4',1,'p848381236.jpg',NULL,NULL,NULL,NULL,NULL),(44085,'超能陆战队','https://movie.douban.com/subject/11026735/','8.6',284143,'http://www.disneyanimation.com/projects/bighero6',NULL,NULL,NULL,NULL,NULL,'','2015-02-28(中国大陆)','斯科特·安第斯 瑞恩·波特 丹尼尔·海尼 T·J·米勒 杰米·钟 小达蒙·韦恩斯 珍尼希斯·罗德里格兹 詹姆斯·克伦威尔 艾伦·图代克 玛娅·鲁道夫 亚布拉哈姆·本鲁比 凯蒂·洛斯 比利·布什 丹尼尔·吉尔森 保罗·布里格斯','唐·霍尔克里斯·威廉姆斯','喜剧 动作 科幻 动画 冒险','http://www.iqiyi.com/v_19rrntpmhg.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2224568669.jpg',NULL,NULL,NULL,NULL,NULL),(44086,'荒岛余生','https://movie.douban.com/subject/1298653/','8.4',106073,'http://www.imdb.com/title/tt0162222',NULL,NULL,NULL,NULL,NULL,'','2000-12-22(美国)','汤姆·汉克斯 海伦·亨特 克里斯·诺斯 尼克·西塞','罗伯特·泽米吉斯','剧情 冒险','http://www.iqiyi.com/v_19rrho7iv4.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1341248319.jpg',NULL,NULL,NULL,NULL,NULL),(44087,'国王的演讲','https://movie.douban.com/subject/4023638/','8.3',282667,'http://www.imdb.com/title/tt1504320',NULL,NULL,NULL,NULL,NULL,'','2012-02-24(中国大陆)','科林·费尔斯 杰弗里·拉什 海伦娜·伯翰·卡特 盖·皮尔斯 迈克尔·刚本 蒂莫西·斯波 詹妮弗·艾莉 德里克·雅各比 安东尼·安德鲁斯 克莱尔·布鲁姆','汤姆·霍珀','剧情 传记 历史','http://vod.kankan.com/v/60/60004/229687.shtml?id=731100',NULL,NULL,'4',1,'p768879237.jpg',NULL,NULL,NULL,NULL,NULL),(44088,'大卫·戈尔的一生','https://movie.douban.com/subject/1305725/','8.7',63445,'http://www.imdb.com/title/tt0289992',NULL,NULL,NULL,NULL,NULL,'','2003-02-21(美国)','凯文·史派西 凯特·温丝莱特 劳拉·琳妮 加布里埃尔·曼 梅丽莎·麦卡西 罗娜·迈特拉','艾伦·帕克','剧情 悬疑 犯罪','http://www.iqiyi.com/v_19rrhy4w5g.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2186861098.jpg',NULL,NULL,NULL,NULL,NULL),(44089,'无敌破坏王','https://movie.douban.com/subject/6534248/','8.7',154282,'http://disney.go.com/wreck-it-ralph',NULL,NULL,NULL,NULL,NULL,'','2012-11-06(中国大陆)','简·林奇 约翰·C·赖利 萨拉·西尔弗曼 杰克·麦克布瑞尔 斯戴芬妮·斯考特 贾米·埃曼 艾伦·图代克','瑞奇·摩尔','喜剧 动画 冒险','http://www.iqiyi.com/v_19rrho8y7g.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1735642656.jpg',NULL,NULL,NULL,NULL,NULL),(44090,'城市之光','https://movie.douban.com/subject/1293908/','9.2',31310,'http://www.imdb.com/title/tt0021749',NULL,NULL,NULL,NULL,NULL,'','1931-01-30','查理·卓别林 弗吉尼亚·切瑞尔 佛罗伦斯·李 亨利·伯格曼 珍·哈露','查理·卓别林','剧情 喜剧 爱情','http://tv.sohu.com/20090302/n262550537.shtml?txid=7ada969851fd73090f44b01fee5b798c',NULL,NULL,'4',1,'p2099815842.jpg',NULL,NULL,NULL,NULL,NULL),(44091,'偷拐抢骗','https://movie.douban.com/subject/1301171/','8.5',94524,'http://www.imdb.com/title/tt0208092',NULL,NULL,NULL,NULL,NULL,'','2000-09-01','布拉德·皮特 本尼西奥·德尔·托罗 杰森·斯坦森 丹尼斯·法里纳 维尼·琼斯 拉德·舍博德兹加 阿兰·福德 连尼·詹姆斯 艾文·布莱纳 杰森·弗莱明 斯蒂芬·格拉汉姆','盖·里奇','喜剧 犯罪','http://vip.iqiyi.com/20110906/f04ddd32baeaa319.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p616753227.jpg',NULL,NULL,NULL,NULL,NULL),(44092,'无耻混蛋','https://movie.douban.com/subject/1438652/','8.4',183744,'http://www.imdb.com/title/tt0361748',NULL,NULL,NULL,NULL,NULL,'','2009-08-20(德国)','布拉德·皮特 梅拉尼·罗兰 克里斯托弗·沃尔兹 伊莱·罗斯 迈克尔·法斯宾德 黛安·克鲁格 丹尼尔·布鲁赫 蒂尔·施威格 哥德昂·布克哈德 雅基·伊多 B·J·诺瓦克 奥玛·杜姆 奧古斯特·迪赫 丹尼斯·门诺切特 西尔维斯特·格罗斯 蕾雅·赛杜','昆汀·塔伦蒂诺','剧情 犯罪','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F158025%2Ff%2F1750632.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E6%97%A0%E8%80%BB%E6%B7%B7%E8%9B%8B&sign=26a4152bcd6587d3bb0597f5d4245102',NULL,NULL,'4',1,'p770734475.jpg',NULL,NULL,NULL,NULL,NULL),(44093,'青蛇','https://movie.douban.com/subject/1303394/','8.3',173608,'http://www.imdb.com/title/tt0106559',NULL,NULL,NULL,NULL,NULL,'','1993-11-04(香港)','张曼玉 王祖贤 赵文卓 吴兴国 马精武 田丰 刘洵','徐克','剧情 奇幻 古装',NULL,NULL,NULL,'4',1,'p584021784.jpg',NULL,NULL,NULL,NULL,NULL),(44094,'达拉斯买家俱乐部','https://movie.douban.com/subject/1793929/','8.6',126051,'http://www.imdb.com/title/tt0790636',NULL,NULL,NULL,NULL,NULL,'','2013-09-07(多伦多电影节)','马修·麦康纳 詹妮弗·加纳 杰瑞德·莱托 史蒂夫·茨恩 达拉斯·罗伯特斯 凯文·兰金 丹尼斯·欧哈拉 简·麦克尼尔 格里芬·邓恩 詹姆斯·杜蒙特 Juliet Reeves Steffie Grote J·D·埃弗摩尔','让-马克·瓦雷','剧情 同性 传记','http://www.iqiyi.com/v_19rrh5y3vg.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2166160837.jpg',NULL,NULL,NULL,NULL,NULL),(44095,'遗愿清单','https://movie.douban.com/subject/1867345/','8.5',98607,'http://www.imdb.com/title/tt0825232',NULL,NULL,NULL,NULL,NULL,'','2007-12-25(多伦多电影节)','杰克·尼科尔森 摩根·弗里曼 西恩·海耶斯 贝弗利·陶德 罗伯·莫洛 Alfonso Freeman Verda Bridges 伊恩·安东尼·代尔 诺尔·古格雷米','罗伯·莱纳','剧情 喜剧 冒险','http://vip.iqiyi.com/20120220/fb44c4457171f791.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p708613284.jpg',NULL,NULL,NULL,NULL,NULL),(44096,'被解救的姜戈','https://movie.douban.com/subject/6307447/','8.5',213638,'http://unchainedmovie.com',NULL,NULL,NULL,NULL,NULL,'','2013-05-12(中国大陆)','杰米·福克斯 莱昂纳多·迪卡普里奥 克里斯托弗·沃尔兹 塞缪尔·杰克逊 凯丽·华盛顿 沃尔顿·戈金斯 丹尼斯·克里斯托弗 乔纳·希尔 詹姆斯·瑞马尔 爱波·塔布琳 弗兰科·尼罗 罗伯特·卡拉丁 佐伊·贝尔','昆汀·塔伦蒂诺','剧情 动作 西部 冒险',NULL,NULL,NULL,'4',1,'p1959232369.jpg',NULL,NULL,NULL,NULL,NULL),(44097,'东京物语','https://movie.douban.com/subject/1291568/','9.1',35322,'http://www.imdb.com/title/tt0046438',NULL,NULL,NULL,NULL,NULL,'','1953-11-03','笠智众 原节子 杉村春子 东山千荣子 山村聪 香川京子','小津安二郎','剧情 家庭','http://www.iqiyi.com/v_19rrh7o184.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910832390.jpg',NULL,NULL,NULL,NULL,NULL),(44098,'中央车站','https://movie.douban.com/subject/1292218/','8.7',66435,'http://www.centraldobrasil.com.br/front.htm',NULL,NULL,NULL,NULL,NULL,'','1998-01-16','费尔兰德·蒙特纳哥 马里利娅·佩拉 文尼西斯·狄·奥利维拉 奥顿·巴斯托斯 Soia Lira','沃尔特·塞勒斯','剧情',NULL,NULL,NULL,'4',1,'p2239441575.jpg',NULL,NULL,NULL,NULL,NULL),(44099,'暖暖内含光','https://movie.douban.com/subject/1308777/','8.4',119488,'http://www.eternalsunshine.com',NULL,NULL,NULL,NULL,NULL,'','2004-03-19(美国)','金·凯瑞 凯特·温丝莱特 克斯汀·邓斯特 伊利亚·伍德 马克·鲁弗洛 汤姆·威尔金森 大卫·克罗斯','米歇尔·冈瑞','剧情 爱情 奇幻',NULL,NULL,NULL,'4',1,'p479565065.jpg',NULL,NULL,NULL,NULL,NULL),(44100,'新龙门客栈','https://movie.douban.com/subject/1292287/','8.4',147864,'http://www.imdb.com/title/tt0105859',NULL,NULL,NULL,NULL,NULL,'','1992-08-27(中国香港)','张曼玉 林青霞 梁家辉 甄子丹 熊欣欣 刘洵 任世官 吴启华 袁祥仁 徐锦江 魏忠威 郑希怡','李惠民','剧情 动作 武侠 古装','http://www.iqiyi.com/v_19rrho7h84.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1421018669.jpg',NULL,NULL,NULL,NULL,NULL),(44101,'黄金三镖客','https://movie.douban.com/subject/1401118/','9.1',37944,'http://www.imdb.com/title/tt0060196',NULL,NULL,NULL,NULL,NULL,'','1966-12-23','克林特·伊斯特伍德 埃里·瓦拉赫 李·范·克里夫 阿尔多·久弗瑞 路易吉·皮斯蒂利','赛尔乔·莱翁内','西部 冒险','http://www.56.com/u43/v_NTI0MTYwODg.html',NULL,NULL,'4',1,'p2101693489.jpg',NULL,NULL,NULL,NULL,NULL),(44102,'心迷宫','https://movie.douban.com/subject/25917973/','8.6',89057,'http://www.imdb.com/title/tt4078856',NULL,NULL,NULL,NULL,NULL,'','2015-10-16(中国大陆)','霍卫民 王笑天 罗芸 杨瑜珍 孙黎 邵胜杰 曹西安 贾致钢 朱自清 王梓尘 赵梓彤','忻钰坤','剧情 悬疑 犯罪','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.m1905.com%2Fvod%2Fplay%2F972007.shtml&site=%E7%94%B5%E5%BD%B1%E7%BD%91&name=%E5%BF%83%E8%BF%B7%E5%AE%AB&sign=72ee35ef2657d26f8b1d995eeff2cacc',NULL,NULL,'4',1,'p2275298525.jpg',NULL,NULL,NULL,NULL,NULL),(44103,'麦兜故事','https://movie.douban.com/subject/1302476/','8.5',109311,'http://www.imdb.com/title/tt0312941',NULL,NULL,NULL,NULL,NULL,'','2001-12-15','李晋纬 林海峰 吴君如 黄秋生 Buxx Banner','袁建滔','剧情 喜剧 动画','http://www.tudou.com/albumplay/vcZEegNs5g0/f-yBCH3OtRs.html',NULL,NULL,'4',1,'p804938713.jpg',NULL,NULL,NULL,NULL,NULL),(44104,'夜访吸血鬼','https://movie.douban.com/subject/1299327/','8.3',169118,'http://www.imdb.com/title/tt0110148',NULL,NULL,NULL,NULL,NULL,'','1994-11-11','布拉德·皮特 汤姆·克鲁斯 克斯汀·邓斯特 安东尼奥·班德拉斯 坦迪·牛顿 克里斯蒂安·史莱特','尼尔·乔丹','剧情 惊悚 奇幻','http://www.iqiyi.com/v_19rrlaizlc.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1353910572.jpg',NULL,NULL,NULL,NULL,NULL),(44105,'黑客帝国3：矩阵革命','https://movie.douban.com/subject/1302467/','8.4',122772,'http://www.imdb.com/title/tt0242653',NULL,NULL,NULL,NULL,NULL,'','2003-11-05(美国/中国大陆)','基努·里维斯 劳伦斯·菲什伯恩 凯瑞-安·莫斯 莫妮卡·贝鲁奇 凯特·宾汉 雨果·维文 贾达·萍克·史密斯 邹兆龙 朗贝尔·维尔森','莉莉·沃卓斯基拉娜·沃卓斯基','动作 科幻','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F110224%2Ff%2F1140655.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E9%BB%91%E5%AE%A2%E5%B8%9D%E5%9B%BD&sign=d9aec733fa753d023513e62d2a7709af',NULL,NULL,'4',1,'p443461818.jpg',NULL,NULL,NULL,NULL,NULL),(44106,'与狼共舞','https://movie.douban.com/subject/1293764/','8.9',48210,'http://www.imdb.com/title/tt0099348',NULL,NULL,NULL,NULL,NULL,'','1990-11-21','凯文·科斯特纳 玛丽·麦克唐纳 格雷厄姆·格林','凯文·科斯特纳','剧情 西部 冒险','http://www.hunantv.com/v/3/55358/f/728233.html',NULL,NULL,'4',1,'p499158228.jpg',NULL,NULL,NULL,NULL,NULL),(44107,'美国丽人','https://movie.douban.com/subject/1292062/','8.4',152706,'http://www.dreamworks.com/ab/',NULL,NULL,NULL,NULL,NULL,'','1999-09-08(洛杉矶首映)','凯文·史派西 安妮特·贝宁 索拉·伯奇 米娜·苏瓦丽 克里斯·库珀 韦斯·本特利 彼得·盖勒 艾莉森·珍妮 斯科特·巴库拉 山姆·洛巴兹 巴里·德尔·舍曼','萨姆·门德斯','剧情 家庭','http://www.iqiyi.com/dianying/20130620/d8007f57ff5bc1de.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p571671715.jpg',NULL,NULL,NULL,NULL,NULL),(44108,'勇士','https://movie.douban.com/subject/3217169/','8.9',72011,'http://www.warriorfilm.com/',NULL,NULL,NULL,NULL,NULL,'','2011-09-09(美国)','汤姆·哈迪 乔尔·埃哲顿 尼克·诺特 詹妮弗·莫里森 弗兰克·格里罗 凯文·杜恩','加文·欧康诺','剧情 家庭 运动','http://www.iqiyi.com/v_19rrk918hs.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1145536386.jpg',NULL,NULL,NULL,NULL,NULL),(44109,'源代码','https://movie.douban.com/subject/3075287/','8.3',342277,'http://www.imdb.com/title/tt0945513',NULL,NULL,NULL,NULL,NULL,'','2011-08-30(中国大陆)','杰克·吉伦哈尔 维拉·法米加 米歇尔·莫纳汉 杰弗里·怀特 拉塞尔·皮特斯 詹姆斯·A·伍兹 迈克尔·阿登 乔·柯布登  卡斯·安瓦尔','邓肯·琼斯','剧情 动作 科幻 惊悚 犯罪','http://www.iqiyi.com/v_19rrhynlvs.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p988260245.jpg',NULL,NULL,NULL,NULL,NULL),(44110,'末路狂花','https://movie.douban.com/subject/1291992/','8.6',78984,'http://www.imdb.com/title/tt0103074',NULL,NULL,NULL,NULL,NULL,'','1991-05-24(美国)','吉娜·戴维斯 苏珊·萨兰登 哈威·凯特尔 迈克尔·马德森 布拉德·皮特','雷德利·斯科特','剧情 惊悚 犯罪','http://v.youku.com/v_show/id_XNjI4NDcxNTI0.html',NULL,NULL,'4',1,'p794583044.jpg',NULL,NULL,NULL,NULL,NULL),(44111,'巴黎淘气帮','https://movie.douban.com/subject/3157605/','8.6',92951,'http://www.imdb.com/title/tt1264904',NULL,NULL,NULL,NULL,NULL,'','2013-02-10(中国大陆)','马克西姆·戈达尔 瓦莱丽·勒梅西埃 凯德·麦拉德 桑德琳娜·基贝兰 维克托·卡莱斯 文森特·克劳德 查尔斯·瓦伦特 本杰明·阿弗蒂 小日尔曼·达米科 达米安·费多尔 维吉尔·泰拉德 伊丽莎·欧斯 杰拉尔·朱诺','劳伦·泰拉德','喜剧 家庭 儿童',NULL,NULL,NULL,'4',1,'p524581356.jpg',NULL,NULL,NULL,NULL,NULL),(44112,'小森林 夏秋篇','https://movie.douban.com/subject/25814705/','8.9',73371,'http://littleforest-movie.jp/sa/',NULL,NULL,NULL,NULL,NULL,'','2014-08-30(日本)','桥本爱 三浦贵大 松冈茉优 温水洋一 桐岛加恋','森淳一','剧情','http://v.qq.com/page/h/4/6/h0017hm4g46.html?ptag=iqiyi',NULL,NULL,'4',1,'p2221319641.jpg',NULL,NULL,NULL,NULL,NULL),(44113,'爱在暹罗','https://movie.douban.com/subject/2365260/','8.3',194539,'http://www.theloveofsiam.com',NULL,NULL,NULL,NULL,NULL,'','2007-11-22','维特维斯特·海伦亚沃恩酷 马里奥·毛瑞尔 赖拉·邦雅淑 坎雅·拉坦娜佩琦 Sinjai Hongthai 查妮达·彭西皮帕特 Pimpan Buranapim Jirayu La-ongmanee Arthit Niyomkul','楚克‧萨克瑞科','剧情 爱情 同性 家庭','http://www.iqiyi.com/dianying/20120816/f874dc33a434cd24.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1024585648.jpg',NULL,NULL,NULL,NULL,NULL),(44114,'初恋这件小事','https://movie.douban.com/subject/4739952/','8.3',380267,'http://www.imdb.com/title/tt1859438',NULL,NULL,NULL,NULL,NULL,'','2012-06-05(中国大陆)','马里奥·毛瑞尔 平采娜·乐维瑟派布恩 苏达拉·布查蓬 雅尼卡·桑普蕾舞','普特鹏·普罗萨卡·那·萨克那卡林华森·波克彭','喜剧 爱情','http://www.iqiyi.com/dianying/20110624/5e252ed36afbf537.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1505312273.jpg',NULL,NULL,NULL,NULL,NULL),(44115,'哪吒闹海','https://movie.douban.com/subject/1307315/','8.8',62870,'http://www.imdb.com/title/tt0354770',NULL,NULL,NULL,NULL,NULL,'','1979-05-19(中国大陆)','梁正晖 邱岳峰 毕克 富润生 尚华 于鼎','严定宪王树忱徐景达','动画 奇幻 冒险','http://www.1905.com/vod/play/791622.shtml',NULL,NULL,'4',1,'p2163636038.jpg',NULL,NULL,NULL,NULL,NULL),(44116,'忠犬八公物语','https://movie.douban.com/subject/1959195/','9.0',39439,'http://www.imdb.com/title/tt0093132',NULL,NULL,NULL,NULL,NULL,'','1987-08-01(日本)','山本圭 井川比佐志 片桐入 仲代达矢 春川真澄 八千草薰 石野真子 殿山泰司 加藤嘉 石仓三郎 泉谷茂','神山征二郎','剧情','http://www.iqiyi.com/dianying/20110812/1605b357fe5ea2e7.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2297934945.jpg',NULL,NULL,NULL,NULL,NULL),(44117,'蝴蝶','https://movie.douban.com/subject/1292056/','8.6',83349,'http://www.imdb.com/title/tt0329485',NULL,NULL,NULL,NULL,NULL,'','2002-12-18','米歇尔·塞罗 柯莱儿·布翁尼许 Nade Dieu Jacques Bouanich Jerry Lucas','费利普·弥勒','剧情 喜剧 儿童','http://www.tudou.com/albumplay/oUA82vVTG58/dyfwNmZTG58.html',NULL,NULL,'4',1,'p1451436171.jpg',NULL,NULL,NULL,NULL,NULL),(44118,'蝙蝠侠：黑暗骑士崛起','https://movie.douban.com/subject/3395373/','8.5',243836,'http://www.thedarkknightrises.com',NULL,NULL,NULL,NULL,NULL,'','2012-08-27(中国大陆)','克里斯蒂安·贝尔 汤姆·哈迪 安妮·海瑟薇 约瑟夫·高登-莱维特 玛丽昂·歌迪亚 加里·奥德曼 迈克尔·凯恩 摩根·弗里曼 朱诺·坦普尔 乔什·平茨 丹尼尔·逊亚塔 内斯特·卡博内尔 伯恩·戈曼 连姆·尼森 乔伊·金 艾丹·吉伦 基里安·墨菲 乔什·斯图沃特 马修·莫迪恩 本·门德尔森','克里斯托弗·诺兰','剧情 动作 科幻 惊悚 犯罪','http://film.qq.com/cover/1/1b117d3s47s9rwx.html?ptag=iqiyi',NULL,NULL,'4',1,'p1706428744.jpg',NULL,NULL,NULL,NULL,NULL),(44119,'蓝色大门','https://movie.douban.com/subject/1308575/','8.3',235779,'http://bluegatecrossing.kingnet.com.tw',NULL,NULL,NULL,NULL,NULL,'','2002-09-27(台湾)','桂纶镁 陈柏霖 梁又琳 明金成 Joanna Chou','易智言','剧情 爱情 同性',NULL,NULL,NULL,'4',1,'p584822570.jpg',NULL,NULL,NULL,NULL,NULL),(44120,'发条橙','https://movie.douban.com/subject/1292233/','8.4',153600,'http://www.imdb.com/title/tt0066921',NULL,NULL,NULL,NULL,NULL,'','1971-12-19(纽约首映)','马尔科姆·麦克道威尔 帕特里克·马基 迈克尔·贝茨 沃伦·克拉克 约翰·克莱夫','斯坦利·库布里克','剧情 科幻 犯罪',NULL,NULL,NULL,'4',1,'p529908155.jpg',NULL,NULL,NULL,NULL,NULL),(44121,'再次出发之纽约遇见你','https://movie.douban.com/subject/6874403/','8.5',113999,'http://beginagainfilm.com',NULL,NULL,NULL,NULL,NULL,'','2015-06-26(中国大陆)','凯拉·奈特莉 马克·鲁弗洛 詹姆斯·柯登 海莉·斯坦菲尔德 亚当·莱文 凯瑟琳·基纳 茅斯·达夫 罗伯·莫洛 席洛·格林','约翰·卡尼','喜剧 爱情 音乐','http://www.tudou.com/albumplay/qlXsVY5C9SM/GwLj831SCSA.html',NULL,NULL,'4',1,'p2250287733.jpg',NULL,NULL,NULL,NULL,NULL),(44122,'终结者2','https://movie.douban.com/subject/1291844/','8.5',114472,'http://www.imdb.com/title/tt0103064',NULL,NULL,NULL,NULL,NULL,'','1991-07-03','阿诺·施瓦辛格 琳达·汉密尔顿 爱德华·福隆 罗伯特·帕特里克','詹姆斯·卡梅隆','动作 科幻','http://www.iqiyi.com/v_19rro63i70.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910909085.jpg',NULL,NULL,NULL,NULL,NULL),(44123,'恐怖游轮','https://movie.douban.com/subject/3011051/','8.3',234671,'http://www.imdb.com/title/tt1187064',NULL,NULL,NULL,NULL,NULL,'','2009-10-16(英国)','梅利莎·乔治 利亚姆·海姆斯沃斯 迈克尔·多曼 瑞秋·卡帕尼 艾玛·朗 亨利·尼克松 约书亚·麦基弗','克里斯托弗·史密斯','剧情 悬疑 惊悚','http://www.iqiyi.com/v_19rrhk5qoc.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p462470694.jpg',NULL,NULL,NULL,NULL,NULL),(44124,'爱·回家','https://movie.douban.com/subject/1299361/','9.1',38124,'http://www.thewayhome.co.kr',NULL,NULL,NULL,NULL,NULL,'','2002-04-05(韩国)','金艺芬 俞承豪 童孝熙 闵京勋 林恩京','李廷香','剧情 家庭 儿童','http://www.letv.com/ptv/vplay/21951445.html',NULL,NULL,'4',1,'p2107418134.jpg',NULL,NULL,NULL,NULL,NULL),(44125,'非常嫌疑犯','https://movie.douban.com/subject/1292214/','8.6',91173,'http://www.imdb.com/title/tt0114814',NULL,NULL,NULL,NULL,NULL,'','1995-01-25(圣丹斯电影节)','凯文·史派西 史蒂芬·鲍德温 加布里埃尔·伯恩 本尼西奥·德尔·托罗 凯文·波拉克 吉安卡罗·埃斯波西托','布莱恩·辛格','剧情 悬疑 惊悚 犯罪','http://vip.iqiyi.com/20110731/8ab886499e624249.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p470383576.jpg',NULL,NULL,NULL,NULL,NULL),(44126,'上帝也疯狂','https://movie.douban.com/subject/1297478/','8.6',79839,'http://www.imdb.com/title/tt0080801',NULL,NULL,NULL,NULL,NULL,'','1980-09-10(南非)','Marius Weyers Sandra Prinsloo 历苏 Louw Verwey Michael Thys','加美·尤伊斯','喜剧','http://www.iqiyi.com/w_19rrxd45ol.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2173719647.jpg',NULL,NULL,NULL,NULL,NULL),(44127,'惊魂记','https://movie.douban.com/subject/1293181/','8.8',61167,'http://www.imdb.com/title/tt0054215',NULL,NULL,NULL,NULL,NULL,'','1960-06-16(纽约首映)','珍妮特·利 安东尼·博金斯 维拉·迈尔斯 马丁·鲍尔萨姆 约翰·加文','阿尔弗雷德·希区柯克','悬疑 恐怖','http://www.iqiyi.com/v_19rrhx9bgs.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1021883305.jpg',NULL,NULL,NULL,NULL,NULL),(44128,'曾经','https://movie.douban.com/subject/2053515/','8.4',171932,'http://www.foxsearchlight.com/once',NULL,NULL,NULL,NULL,NULL,'','2006-07-15(Galway Film Fleadh)','格伦·汉塞德 玛可塔·伊尔格洛娃 Alaistair Foley George Hendrick Hugh Walsh','约翰·卡尼','剧情 爱情 音乐','http://www.iqiyi.com/dianying/20130711/90b6c59d9c96167a.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2173720203.jpg',NULL,NULL,NULL,NULL,NULL),(44129,'魔女宅急便','https://movie.douban.com/subject/1307811/','8.4',152596,'http://www.imdb.com/title/tt0097814',NULL,NULL,NULL,NULL,NULL,'','1989-07-29(日本)','高山南 佐久间玲 山口胜平 户田惠子 信泽三惠子','宫崎骏','动画 奇幻 冒险','http://www.iqiyi.com/lib/m_206735214.html',NULL,NULL,'4',1,'p456676352.jpg',NULL,NULL,NULL,NULL,NULL),(44130,'两小无猜','https://movie.douban.com/subject/1308817/','8.2',275597,'http://www.imdb.com/title/tt0364517',NULL,NULL,NULL,NULL,NULL,'','2003-09-17(法国)','吉约姆·卡内 玛丽昂·歌迪亚 蒂博•费尔哈格 Joséphine Lebas-Joly 艾曼妞·格伦沃尔德','杨·塞谬尔','剧情 喜剧 爱情','http://www.iqiyi.com/v_19rrmx3xes.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p455472580.jpg',NULL,NULL,NULL,NULL,NULL),(44131,'唐伯虎点秋香','https://movie.douban.com/subject/1306249/','8.3',242526,'http://www.imdb.com/title/tt0108289',NULL,NULL,NULL,NULL,NULL,'','1993-07-01(香港)','周星驰 巩俐 陈百祥 郑佩佩 朱咪咪 梁家仁 苑琼丹 梁荣忠 黄一山 黄霑 吴镇宇 刘家辉 蓝洁瑛 谷德昭 陈辉虹 李健仁 宣萱 温翠萍','李力持','喜剧 爱情 古装','http://www.m1905.com/vod/play/383684.shtml',NULL,NULL,'4',1,'p1127709095.jpg',NULL,NULL,NULL,NULL,NULL),(44132,'这个男人来自地球','https://movie.douban.com/subject/2300586/','8.5',136475,'http://www.imdb.com/title/tt0756683',NULL,NULL,NULL,NULL,NULL,'','2007-11-13(美国)','大卫·李·史密斯 托尼·托德 约翰·比灵斯列 安妮卡·彼得森 阿丽西丝·索普 威廉姆·卡特 理查德·雷西尔 艾伦·克劳福德 Steven Littles Robbie Bryan','理查德·沙因克曼','剧情 科幻','http://www.iqiyi.com/v_19rrhv5mco.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p513303986.jpg',NULL,NULL,NULL,NULL,NULL),(44133,'E.T. 外星人','https://movie.douban.com/subject/1294638/','8.5',125428,'http://www.imdb.com/title/tt0083866',NULL,NULL,NULL,NULL,NULL,'','1982-06-11(美国)','亨利·托马斯 迪·沃伦斯 罗伯特·麦克纳夫顿 德鲁·巴里摩尔 彼德·考约特','史蒂文·斯皮尔伯格','剧情 科幻 奇幻 冒险','http://www.iqiyi.com/v_19rrhxtxpw.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p984732992.jpg',NULL,NULL,NULL,NULL,NULL),(44134,'穆赫兰道','https://movie.douban.com/subject/1292217/','8.4',184712,'http://www.imdb.com/title/tt0166924',NULL,NULL,NULL,NULL,NULL,'','2001-05-16(戛纳电影节)','娜奥米·沃茨 劳拉·哈灵 安·米勒 贾斯汀·塞洛克斯 斯科特·科菲 梅利莎·乔治 布兰特·布里斯科 罗伯特·福斯特 凯瑟琳·汤 李·格兰特 比利·雷·赛勒斯 查德·艾微特 丽塔·塔格特 詹姆斯·凯伦 洛里·海瑞 安琪洛·巴达拉曼提 迈克尔·德·巴雷斯 马库斯·格雷厄姆 丹·哈达亚 马克·佩雷格里诺 蒙蒂·蒙特格美里 迈克尔·J·安德森','大卫·林奇','剧情 悬疑 惊悚','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.tudou.com%2Falbumplay%2FXH9s6F9UFj4%2FHfx-CDAt114.html&site=%E5%9C%9F%E8%B1%86&name=%E7%A9%86%E8%B5%AB%E5%85%B0%E9%81%93&sign=eb5ec1bd35576066cf19ef3d3fa88a89',NULL,NULL,'4',1,'p792248233.jpg',NULL,NULL,NULL,NULL,NULL),(44135,'时空恋旅人','https://movie.douban.com/subject/10577869/','8.6',138309,'http://www.abouttimemovie.com',NULL,NULL,NULL,NULL,NULL,'','2013-06-27(爱丁堡电影节)','多姆纳尔·格里森 瑞秋·麦克亚当斯 比尔·奈伊 莉迪亚·威尔逊 汤姆·霍兰德 琳赛·邓肯 玛格特·罗比 凡妮莎·柯比 李·阿斯奎斯-柯 凯瑟琳·斯戴曼','理查德·柯蒂斯','剧情 爱情 奇幻','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F45462%2Ff%2F1746078.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E6%97%B6%E7%A9%BA%E6%81%8B%E6%97%85%E4%BA%BA&sign=573ef43d4afb8709c53aa624fefd7d16',NULL,NULL,'4',1,'p2070153774.jpg',NULL,NULL,NULL,NULL,NULL),(44136,'阿飞正传','https://movie.douban.com/subject/1305690/','8.5',135188,'http://www.imdb.com/title/tt0101258',NULL,NULL,NULL,NULL,NULL,'','1990-12-15(香港)','张国荣 张曼玉 刘嘉玲 刘德华 张学友 潘迪华 梁朝伟','王家卫','剧情 爱情 犯罪','http://www.iqiyi.com/dianying/20110104/19696a8f0650bd22.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p924558512.jpg',NULL,NULL,NULL,NULL,NULL),(44137,'花样年华','https://movie.douban.com/subject/1291557/','8.4',185796,'http://www.imdb.com/title/tt0118694',NULL,NULL,NULL,NULL,NULL,'','2000-05-20(戛纳电影节)','梁朝伟 张曼玉 潘迪华 萧炳林 张耀扬 孙佳君 钱似莺 顾锦华','王家卫','剧情 爱情',NULL,NULL,NULL,'4',1,'p1910828286.jpg',NULL,NULL,NULL,NULL,NULL),(44138,'喜剧之王','https://movie.douban.com/subject/1302425/','8.3',229672,'http://www.imdb.com/title/tt0188766',NULL,NULL,NULL,NULL,NULL,'','1999-02-13(香港)','周星驰 张柏芝 莫文蔚 吴孟达 林子善 田启文 李兆基 成龙 李思捷 郑文辉','周星驰李力持','剧情 喜剧 爱情','http://www.iqiyi.com/v_19rrhrtf7c.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1043597424.jpg',NULL,NULL,NULL,NULL,NULL),(44139,'变脸','https://movie.douban.com/subject/1292659/','8.4',180083,'http://www.imdb.com/title/tt0119094',NULL,NULL,NULL,NULL,NULL,'','1997-06-27','约翰·特拉沃尔塔 尼古拉斯·凯奇 琼·艾伦 亚历桑德罗·尼沃拉 吉娜·格申','吴宇森','动作 犯罪','http://vip.iqiyi.com/20110318/558f9f8e81579b28.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2173855883.jpg',NULL,NULL,NULL,NULL,NULL),(44140,'谍影重重2','https://movie.douban.com/subject/1308767/','8.5',122217,'http://www.thebournesupremacy.com',NULL,NULL,NULL,NULL,NULL,'','2004-11-14(中国大陆)','马特·达蒙 弗兰卡·波坦特 布莱恩·考克斯 朱丽娅·斯蒂尔斯 卡尔·厄本 琼·艾伦 加布里埃尔·曼 马尔顿·索克斯 约翰·贝德福德·劳埃德 伊桑·桑德勒 米歇尔·莫纳汉 卡瑞尔·罗登 托马斯·阿拉纳 奥莎娜·阿金什那 Tom Gallop','保罗·格林格拉斯','动作 悬疑 冒险','http://www.iqiyi.com/v_19rri0xcps.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p667644866.jpg',NULL,NULL,NULL,NULL,NULL),(44141,'英国病人','https://movie.douban.com/subject/1291853/','8.4',151251,'http://www.imdb.com/title/tt0116209',NULL,NULL,NULL,NULL,NULL,'','1996-12-06(美国)','拉尔夫·费因斯 克里斯汀·斯科特·托马斯 朱丽叶·比诺什 威廉·达福 科林·费尔斯 纳威恩·安德利维斯','安东尼·明格拉','剧情 爱情 战争','http://www.iqiyi.com/dianying/20130321/3cb2123e5a861d42.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p453791074.jpg',NULL,NULL,NULL,NULL,NULL),(44142,'卡萨布兰卡','https://movie.douban.com/subject/1296753/','8.6',101489,'http://www.imdb.com/title/tt0034583',NULL,NULL,NULL,NULL,NULL,'','1942-11-26(纽约首映)','亨弗莱·鲍嘉 英格丽·褒曼 保罗·亨雷德 克劳德·雷恩斯 康拉德·韦特 西德尼·格林斯垂特 彼得·洛 杜利·威尔逊','迈克尔·柯蒂斯','剧情 爱情 战争','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Ffilm.qq.com%2Fcover%2F7%2F77fvq6pegnj6mhk.html%3Fptag%3Diqiyi&site=%E8%85%BE%E8%AE%AF&name=%E5%8D%A1%E8%90%A8%E5%B8%83%E5%85%B0%E5%8D%A1&sign=86a03d6527504e837f6fa5ce2e56e942',NULL,NULL,'4',1,'p1244791866.jpg',NULL,NULL,NULL,NULL,NULL),(44143,'叫我第一名','https://movie.douban.com/subject/4798888/','8.6',89690,'http://www.imdb.com/title/tt1292594',NULL,NULL,NULL,NULL,NULL,'','2008-12-07','詹姆斯·沃克 特里特·威廉斯 多米尼克·斯科特·凯伊 莎拉·德鲁 凯瑟琳·约克 Joe Chrest 帕翠西亚·希顿 Nicholas Stargel Charles Henry Wyson','彼得·沃纳','剧情 传记','http://www.tudou.com/programs/view/hq3wzpymldc?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwMV8wMV8wMQ',NULL,NULL,'4',1,'p628364149.jpg',NULL,NULL,NULL,NULL,NULL),(44144,'勇闯夺命岛','https://movie.douban.com/subject/1292728/','8.5',118159,'http://www.imdb.com/title/tt0117500',NULL,NULL,NULL,NULL,NULL,'','1996-06-07(美国)','肖恩·康纳利 尼古拉斯·凯奇 艾德·哈里斯 约翰·斯宾塞 大卫·摩斯 威廉·弗西斯 迈克尔·比恩 瓦内萨·马赛尔 约翰·C·麦金雷 Gregory Sporleder 托尼·托德 博基姆·伍德拜因 Jim Maniaci 格雷格·科林斯 Brendan Kelly','迈克尔·贝','动作 冒险','http://vip.iqiyi.com/20110310/add559a5f4465549.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1483586933.jpg',NULL,NULL,NULL,NULL,NULL),(44145,'地球上的星星','https://movie.douban.com/subject/2363506/','8.9',61248,'http://www.taarezameenpar.com',NULL,NULL,NULL,NULL,NULL,'','2007-12-21(印度)','达席尔·萨法瑞 阿米尔·汗 塔奈·切赫达 萨谢·英吉尼尔 蒂丝卡·乔普拉 维品·沙尔马 阿布舍克·巴强 Meghna Malik','阿米尔·汗阿莫尔·古普特','剧情 家庭 儿童','http://www.iqiyi.com/v_19rrog5754.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1973489335.jpg',NULL,NULL,NULL,NULL,NULL),(44146,'谍影重重','https://movie.douban.com/subject/1304102/','8.5',149379,'http://www.thebourneidentity.com',NULL,NULL,NULL,NULL,NULL,'','2002-11-21(中国大陆)','马特·达蒙 弗兰卡·波坦特 克里斯·库珀 克里夫·欧文 朱丽娅·斯蒂尔斯 布莱恩·考克斯 阿德沃尔·阿吉纽依-艾格拜吉 加布里埃尔·曼 沃尔顿·戈金斯 约什·汉密尔顿 Orso Maria Guerrini','道格·里曼','动作 悬疑 冒险','http://www.hunantv.com/v/3/46084/f/1746082.html',NULL,NULL,'4',1,'p1597183981.jpg',NULL,NULL,NULL,NULL,NULL),(44147,'燕尾蝶','https://movie.douban.com/subject/1307793/','8.7',92982,'http://www.imdb.com/title/tt0117797',NULL,NULL,NULL,NULL,NULL,'','1996-09-14(日本)','三上博史 恰拉 伊藤步 江口洋介 许志安 渡部笃郎 山口智子 大塚宁宁 桃井薰 浅野忠信','岩井俊二','剧情 犯罪','http://v.youku.com/v_show/id_XMzkxMzY0NzI0.html',NULL,NULL,'4',1,'p532195562.jpg',NULL,NULL,NULL,NULL,NULL),(44148,'7号房的礼物','https://movie.douban.com/subject/10777687/','8.7',122859,'http://www.7gift.kr',NULL,NULL,NULL,NULL,NULL,'','2013-01-23(韩国)','柳承龙 朴信惠 郑镇荣 金正泰 吴达洙 朴元尚 郑满植 葛素媛','李焕庆','剧情 喜剧 家庭','http://www.letv.com/ptv/vplay/21654375.html',NULL,NULL,'4',1,'p1816276065.jpg',NULL,NULL,NULL,NULL,NULL),(44149,'绿里奇迹','https://movie.douban.com/subject/1300374/','8.7',85710,'http://www.imdb.com/title/tt0120689',NULL,NULL,NULL,NULL,NULL,'','1999-12-10(美国)','汤姆·汉克斯 大卫·摩斯 迈克·克拉克·邓肯 邦尼·亨特 詹姆斯·克伦威尔 迈克尔·杰特 格雷厄姆·格林 道格·休切逊 山姆·洛克威尔 巴里·佩珀 杰弗里·德曼 派翠西娅·克拉克森 哈利·戴恩·斯坦通 戴布思·格里尔 Eve Brent','弗兰克·德拉邦特','剧情 悬疑 犯罪 奇幻','http://www.iqiyi.com/v_19rrhwqjjc.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p767586451.jpg',NULL,NULL,NULL,NULL,NULL),(44150,'哈利·波特与死亡圣器(下)','https://movie.douban.com/subject/3011235/','8.6',224194,'http://www.imdb.com/title/tt1201607',NULL,NULL,NULL,NULL,NULL,'','2011-08-04(中国大陆)','丹尼尔·雷德克里夫 艾玛·沃森 鲁伯特·格林特 海伦娜·伯翰·卡特 拉尔夫·费因斯 艾伦·瑞克曼 玛吉·史密斯 汤姆·费尔顿 邦妮·怀特 朱丽·沃特斯 迈克尔·刚本 伊文娜·林奇 多姆纳尔·格里森 克蕾曼丝·波西 詹森·艾萨克 海伦·麦克洛瑞 马修·刘易斯 梁佩诗','大卫·叶茨','剧情 悬疑 奇幻 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Ffilm.qq.com%2Fcover%2Fe%2Feshodxofa7omesm.html%3Fptag%3Diqiyi&site=%E8%85%BE%E8%AE%AF&name=%E5%93%88%E5%88%A9%C2%B7%E6%B3%A2%E7%89%B9%E4%B8%8E%E6%AD%BB%E4%BA%A1%E5%9C%A3%E5%99%A8+%E4%B8%8B&sign=2f784ca7f69ef6',NULL,NULL,'4',1,'p917846733.jpg',NULL,NULL,NULL,NULL,NULL),(44151,'罗生门','https://movie.douban.com/subject/1291879/','8.7',94778,'http://www.imdb.com/title/tt0042876',NULL,NULL,NULL,NULL,NULL,'','1950-08-25(日本)','三船敏郎 千秋实 京町子 森雅之 志村乔','黑泽明','剧情 悬疑 犯罪','http://www.iqiyi.com/w_19rr6p0j8x.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1864872647.jpg',NULL,NULL,NULL,NULL,NULL),(44152,'梦之安魂曲','https://movie.douban.com/subject/1292270/','8.7',86175,'http://www.imdb.com/title/tt0180093',NULL,NULL,NULL,NULL,NULL,'','2000-10-27','艾伦·伯斯汀 杰瑞德·莱托 詹妮弗·康纳利 马龙·韦恩斯 克里斯托弗·麦克唐纳 露易丝·拉塞尔 玛西娅·让·库尔茨 夏洛特·阿罗诺夫斯基 马克·马戈利斯 Janet Sarno Suzanne Shepherd','达伦·阿伦诺夫斯基','剧情','http://www.iqiyi.com/dianying/20120131/1b4ba4f7fe43040b.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p884936202.jpg',NULL,NULL,NULL,NULL,NULL),(44153,'迁徙的鸟','https://movie.douban.com/subject/1292281/','9.1',45757,'http://www.imdb.com/title/tt0301727',NULL,NULL,NULL,NULL,NULL,'','2001-12-12(法国)','Philippe Labro 雅克·贝汉','雅克·贝汉 雅克·克鲁奥德米歇尔·德巴','纪录片','http://v.pptv.com/show/zdbLSbEXh8Uopiao.html',NULL,NULL,'4',1,'p2238274168.jpg',NULL,NULL,NULL,NULL,NULL),(44154,'消失的爱人','https://movie.douban.com/subject/21318488/','8.7',259853,'http://www.imdb.com/title/tt2267998',NULL,NULL,NULL,NULL,NULL,'','2014-09-26(纽约电影节)','本·阿弗莱克 裴淳华 尼尔·帕特里克·哈里斯 凯莉·库恩 泰勒·派瑞 金·迪肯斯 米西·派勒 波伊德·霍布鲁克 艾米丽·拉塔科斯基 雪拉·渥德 派屈克·福吉特 斯科特·麦克纳里 凯西·威尔逊 李·诺里斯','大卫·芬奇','剧情 悬疑 惊悚 犯罪','http://www.iqiyi.com/v_19rro18qig.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2221768894.jpg',NULL,NULL,NULL,NULL,NULL),(44155,'战争之王','https://movie.douban.com/subject/1419936/','8.5',145192,'http://www.imdb.com/title/tt0399295',NULL,NULL,NULL,NULL,NULL,'','2005-09-16(美国)','尼古拉斯·凯奇 伊桑·霍克 杰瑞德·莱托 Shake Tukhmanyan 布丽姬·穆娜','安德鲁·尼科尔','剧情 犯罪','http://www.letv.com/ptv/vplay/1374489.html',NULL,NULL,'4',1,'p453719066.jpg',NULL,NULL,NULL,NULL,NULL),(44156,'恐怖直播','https://movie.douban.com/subject/21360417/','8.7',140534,'http://www.imdb.com/title/tt2990738',NULL,NULL,NULL,NULL,NULL,'','2013-07-31(韩国)','河正宇 李璟荣 全慧珍 李大为','金秉祐','剧情 悬疑 犯罪','http://www.tudou.com/albumplay/y7_-8VE07kQ/48LynvKRnwE.html',NULL,NULL,'4',1,'p2016930906.jpg',NULL,NULL,NULL,NULL,NULL),(44157,'朗读者','https://movie.douban.com/subject/2213597/','8.4',238846,'http://www.imdb.com/title/tt0976051',NULL,NULL,NULL,NULL,NULL,'','2008-12-10(纽约首映)','凯特·温丝莱特 拉尔夫·费因斯 大卫·克劳斯 詹妮特·海因 苏珊娜·罗莎 Alissa Wilms 弗罗里安·巴西奥罗麦 Friederike Becht 马赛斯·哈贝奇 Frieder Venus Marie-Anne Fliegel Hendrik Arnst Rainer Sellien Torsten Michaelis Moritz Grove','史蒂芬·戴德利','剧情 爱情','http://www.iqiyi.com/v_19rrhk107w.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1140984198.jpg',NULL,NULL,NULL,NULL,NULL),(44158,'追随','https://movie.douban.com/subject/1397546/','9.0',59393,'http://www.imdb.com/title/tt0154506',NULL,NULL,NULL,NULL,NULL,'','1998-09-12(多伦多电影节)','杰里米·西奥伯德 亚历克斯·霍 露西·拉塞尔 约翰·诺兰','克里斯托弗·诺兰','悬疑 惊悚 犯罪','http://www.tudou.com/programs/view/aH_fuK6Dfqk/?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwMV8wMV8wMQ',NULL,NULL,'4',1,'p2074443514.jpg',NULL,NULL,NULL,NULL,NULL),(44159,'可可西里','https://movie.douban.com/subject/1308857/','8.6',107055,'http://www.imdb.com/title/tt0386651',NULL,NULL,NULL,NULL,NULL,'','2004-10-01(中国大陆)','多布杰 张磊 亓亮 赵雪莹 马占林 赵一穗','陆川','剧情','http://www.hunantv.com/v/3/54311/f/709752.html',NULL,NULL,'4',1,'p1159398311.jpg',NULL,NULL,NULL,NULL,NULL),(44160,'喜宴','https://movie.douban.com/subject/1303037/','8.7',101248,'http://www.imdb.com/title/tt0107156',NULL,NULL,NULL,NULL,NULL,'','1993-02(柏林电影节)','赵文瑄 归亚蕾 金素梅 郎雄 米切尔·利希藤斯坦','李安','剧情 喜剧 爱情 同性 家庭','http://v.qq.com/page/w/n/I/w0010TsWrnI.html?ptag=iqiyi',NULL,NULL,'4',1,'p2173713676.jpg',NULL,NULL,NULL,NULL,NULL),(44161,'海盗电台','https://movie.douban.com/subject/3007773/','8.7',147588,'http://www.imdb.com/title/tt1131729',NULL,NULL,NULL,NULL,NULL,'','2009-04-01(英国)','比尔·奈伊 肯尼思·布拉纳 菲利普·塞默·霍夫曼 尼克·弗罗斯特 汤姆·斯图里奇 瑞斯·伊凡斯 瑞斯·达比 克里斯·奥多德 妲露拉·莱莉 凯瑟琳·帕金森 杰克·达文波特','理查德·柯蒂斯','剧情 喜剧 音乐','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F12083%2Ff%2F1746106.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E6%B5%B7%E7%9B%97%E7%94%B5%E5%8F%B0&sign=8a2596b9a3f65444324824d486c0af80',NULL,NULL,'4',1,'p769608791.jpg',NULL,NULL,NULL,NULL,NULL),(44162,'红辣椒','https://movie.douban.com/subject/1865703/','8.8',88288,'http://www.imdb.com/title/tt0851578',NULL,NULL,NULL,NULL,NULL,'','2006-09-02(威尼斯电影节)','林原惠美 古谷彻 江守彻 山寺宏一 堀胜之祐 大塚明夫 岩田光央 田中秀幸','今敏','科幻 动画 悬疑 惊悚','http://www.iqiyi.com/v_19rrjczkbc.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p672363704.jpg',NULL,NULL,NULL,NULL,NULL),(44163,'萤火之森','https://movie.douban.com/subject/5989818/','8.8',115258,'http://www.hotarubi.info',NULL,NULL,NULL,NULL,NULL,'','2011-09-17(日本)','佐仓绫音 内山昂辉','大森贵弘','剧情 爱情 动画 奇幻','http://www.iqiyi.com/dongman/20120626/ece98897b70d6a00.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1272904657.jpg',NULL,NULL,NULL,NULL,NULL),(44164,'浪潮','https://movie.douban.com/subject/2297265/','8.7',100688,'http://www.imdb.com/title/tt1063669',NULL,NULL,NULL,NULL,NULL,'','2008-03-13(德国)','约根·沃格尔 詹妮弗·乌尔里希 马克思·雷迈特 克里斯蒂安妮·保罗 弗雷德里克·劳','丹尼斯·甘塞尔','剧情','http://www.iqiyi.com/w_19rqt4f3zd.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1344888983.jpg',NULL,NULL,NULL,NULL,NULL),(44165,'纵横四海','https://movie.douban.com/subject/1295409/','8.7',109587,'http://www.imdb.com/title/tt0101020',NULL,NULL,NULL,NULL,NULL,'','1991-02-02(香港)','周润发 张国荣 钟楚红 朱江 曾江 胡枫 唐宁 邓一君','吴宇森','剧情 喜剧 动作 犯罪','http://www.iqiyi.com/v_19rrmy7e98.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p933122297.jpg',NULL,NULL,NULL,NULL,NULL),(44166,'撞车','https://movie.douban.com/subject/1388216/','8.6',147272,'http://www.crashfilm.com/',NULL,NULL,NULL,NULL,NULL,'','2004-09-10(多伦多电影节)','桑德拉·布洛克 唐·钱德尔 马特·狄龙 布兰登·费舍 泰伦斯·霍华德 坦迪·牛顿 卢达克里斯 迈克尔·佩纳 珍妮弗·艾斯波西多','保罗·哈吉斯','剧情 犯罪','http://www.iqiyi.com/v_19rrh5aifc.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2075132390.jpg',NULL,NULL,NULL,NULL,NULL),(44167,'碧海蓝天','https://movie.douban.com/subject/1300960/','8.7',95455,'http://www.imdb.com/title/tt0095250',NULL,NULL,NULL,NULL,NULL,'','1988-05-11(法国)','让-马克·巴尔 让·雷诺 罗姗娜·阿奎特','吕克·贝松','剧情 爱情','http://vod.kankan.com/v/33/33347.shtml?id=731100',NULL,NULL,'4',1,'p455724599.jpg',NULL,NULL,NULL,NULL,NULL),(44168,'冰川时代','https://movie.douban.com/subject/1291578/','8.4',227632,'http://www.imdb.com/title/tt0268380',NULL,NULL,NULL,NULL,NULL,'','2002-03-15(美国)','雷·罗马诺 约翰·雷吉扎莫 丹尼斯·利瑞 杰克·布莱克','卡洛斯·沙尔丹哈克里斯·韦奇','喜剧 动画 冒险','http://www.iqiyi.com/v_19rrn4rmcc.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910895719.jpg',NULL,NULL,NULL,NULL,NULL),(44169,'香水','https://movie.douban.com/subject/1760622/','8.4',228743,'http://www.parfum.film.de/',NULL,NULL,NULL,NULL,NULL,'','2006-09-07(德国)','本·卫肖 艾伦·瑞克曼 蕾切儿·哈伍德 达斯汀·霍夫曼 大卫·卡尔德 波奇特·密尼梅雅 Carlos Gramaje 西恩·托马斯 佩里·米尔沃德 山姆·道格拉斯 卡洛琳·赫弗斯 Carolina Vera Squella 莎拉·弗里斯蒂 科琳娜·哈弗奇 洁西卡·史瓦兹 杰罗姆·威利斯','汤姆·提克威','剧情 犯罪 奇幻','http://www.iqiyi.com/dianying/20130703/1556a8144b2cc82b.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p470006658.jpg',NULL,NULL,NULL,NULL,NULL),(44170,'雨中曲','https://movie.douban.com/subject/1293460/','8.9',74520,'http://www.imdb.com/title/tt0045152',NULL,NULL,NULL,NULL,NULL,'','1952-04-11(美国)','吉恩·凯利 唐纳德·奥康纳 黛比·雷诺斯 赛德·查里斯 简·哈根','斯坦利·多南吉恩·凯利','喜剧 爱情 歌舞','http://v.pptv.com/show/4YR7ibWHHN3XYVpo.html',NULL,NULL,'4',1,'p1612355875.jpg',NULL,NULL,NULL,NULL,NULL),(44171,'英雄本色','https://movie.douban.com/subject/1297574/','8.7',113404,'http://www.imdb.com/title/tt0092263',NULL,NULL,NULL,NULL,NULL,'','1986-08-02(香港)','周润发 狄龙 张国荣 朱宝意 李子雄 田丰 吴宇森 曾江 成奎安 徐克','吴宇森','动作 犯罪','http://www.iqiyi.com/dianying/20120803/923648c1b05a019b.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2157672975.jpg',NULL,NULL,NULL,NULL,NULL),(44172,'玩具总动员3','https://movie.douban.com/subject/1858711/','8.7',165885,'http://disney.go.com/toystory/',NULL,NULL,NULL,NULL,NULL,'','2010-06-16(中国大陆)','汤姆·汉克斯 蒂姆·艾伦 琼·库萨克 尼德·巴蒂 唐·里克斯 迈克尔·基顿','李·昂克里奇','喜剧 动画 奇幻 冒险','http://www.iqiyi.com/v_19rrifm3np.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1283675359.jpg',NULL,NULL,NULL,NULL,NULL),(44173,'一次别离','https://movie.douban.com/subject/5964718/','8.7',105979,'http://www.imdb.com/title/tt1832382',NULL,NULL,NULL,NULL,NULL,'','2012-11-13(中国大陆)',NULL,NULL,'剧情 家庭','http://www.iqiyi.com/v_19rrhoaaxw.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2189835254.jpg',NULL,NULL,NULL,NULL,NULL),(44174,'荒野生存','https://movie.douban.com/subject/1905462/','8.7',105907,'http://www.imdb.com/title/tt0758758',NULL,NULL,NULL,NULL,NULL,'','2007-09-21(美国)',NULL,NULL,'剧情 传记 冒险','http://www.iqiyi.com/v_19rrno0lss.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p465687407.jpg',NULL,NULL,NULL,NULL,NULL),(44175,'教父3','https://movie.douban.com/subject/1294240/','8.7',103364,'http://www.imdb.com/title/tt0099674',NULL,NULL,NULL,NULL,NULL,'','1990-12-20',NULL,NULL,'剧情 犯罪','http://vip.iqiyi.com/20110915/b738d6f0cc9b71a5.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2169664351.jpg',NULL,NULL,NULL,NULL,NULL),(44176,'完美的世界','https://movie.douban.com/subject/1300992/','9.0',61590,'http://www.imdb.com/title/tt0107808',NULL,NULL,NULL,NULL,NULL,'','1993-11-24(美国)',NULL,NULL,'剧情 犯罪',NULL,NULL,NULL,'4',1,'p792403691.jpg',NULL,NULL,NULL,NULL,NULL),(44177,'末代皇帝','https://movie.douban.com/subject/1293172/','8.7',118200,'http://www.imdb.com/title/tt0093389',NULL,NULL,NULL,NULL,NULL,'','1987-10-23(意大利)',NULL,NULL,'剧情 传记 历史','http://www.tudou.com/albumplay/LJGRAgir_Uc/1sKfzitFN7o.html',NULL,NULL,'4',1,'p452088641.jpg',NULL,NULL,NULL,NULL,NULL),(44178,'人工智能','https://movie.douban.com/subject/1302827/','8.6',158310,'http://aimovie.warnerbros.com/',NULL,NULL,NULL,NULL,NULL,'','2001-06-29(美国)',NULL,NULL,'剧情 科幻 冒险','http://www.iqiyi.com/v_19rrno1q60.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p792257137.jpg',NULL,NULL,NULL,NULL,NULL),(44179,'傲慢与偏见','https://movie.douban.com/subject/1418200/','8.4',243573,'http://www.imdb.com/title/tt0414387',NULL,NULL,NULL,NULL,NULL,'','2005-09-16(英国)',NULL,NULL,'剧情 爱情','http://www.iqiyi.com/v_19rrhxxnck.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p452005185.jpg',NULL,NULL,NULL,NULL,NULL),(44180,'我是山姆','https://movie.douban.com/subject/1306861/','8.9',83270,'http://www.imdb.com/title/tt0277027',NULL,NULL,NULL,NULL,NULL,'','2001-12-03(美国)',NULL,NULL,'剧情 家庭','http://www.iqiyi.com/dianying/20110506/3b125997e01eeb76.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p652417775.jpg',NULL,NULL,NULL,NULL,NULL),(44181,'黑天鹅','https://movie.douban.com/subject/1978709/','8.5',349894,'http://www.imdb.com/title/tt0947798',NULL,NULL,NULL,NULL,NULL,'','2010-12-17(美国)',NULL,NULL,'剧情 惊悚','http://www.iqiyi.com/v_19rrh080oc.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p719282906.jpg',NULL,NULL,NULL,NULL,NULL),(44182,'秒速5厘米','https://movie.douban.com/subject/2043546/','8.5',224267,'http://www.cwfilms.jp/5cm/',NULL,NULL,NULL,NULL,NULL,'','2007-03-03(日本)','水桥研二 近藤好美  尾上绫华 花村怜美 中村优子','新海诚','剧情 爱情 动画',NULL,NULL,NULL,'4',1,'p982896012.jpg',NULL,NULL,NULL,NULL,NULL),(44183,'卢旺达饭店','https://movie.douban.com/subject/1291822/','8.8',93367,'http://www.mgm.com/ua/hotelrwanda/main.html',NULL,NULL,NULL,NULL,NULL,'','2004-09-11','唐·钱德尔 苏菲·奥康内多 杰昆·菲尼克斯 尼克·诺特 哈基姆·凯-卡西姆','特瑞·乔治','剧情 历史 战争','http://www.iqiyi.com/dianying/20120131/ca3698e5e100b0e2.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2159368352.jpg',NULL,NULL,NULL,NULL,NULL),(44184,'哈利·波特与魔法石','https://movie.douban.com/subject/1295038/','8.5',188922,'http://www.harrypotter.co.uk',NULL,NULL,NULL,NULL,NULL,'','2002-01-26(中国大陆)','丹尼尔·雷德克里夫 艾玛·沃森 鲁伯特·格林特 艾伦·瑞克曼 玛吉·史密斯 汤姆·费尔顿 伊恩·哈特 理查德·哈里斯 约翰·赫特 罗彼·考特拉尼 朱丽·沃特斯 邦妮·怀特 约翰·克立斯 肖恩·比格斯代夫','克里斯·哥伦布','奇幻 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fv.youku.com%2Fv_show%2Fid_XMjg5MTA4Njg0.html&site=%E4%BC%98%E9%85%B7&name=%E5%93%88%E5%88%A9%C2%B7%E6%B3%A2%E7%89%B9%E4%B8%8E%E5%AF%86%E5%AE%A4&sign=87354ee6430c6e877b5939f7bbeb1983',NULL,NULL,'4',1,'p804947166.jpg',NULL,NULL,NULL,NULL,NULL),(44185,'穿条纹睡衣的男孩','https://movie.douban.com/subject/3008247/','8.8',101122,'http://www.imdb.com/title/tt0914798',NULL,NULL,NULL,NULL,NULL,'','2008-09-12(英国)','阿萨·巴特菲尔德 维拉·法米加 大卫·休里斯 杰克·塞隆 鲁伯特·弗兰德 谢拉·汉考克 大卫·海曼 贝拉·费斯彼姆','马克·赫尔曼','剧情 战争','http://www.iqiyi.com/dianying/20130318/d83581427155bc72.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1473670352.jpg',NULL,NULL,NULL,NULL,NULL),(44186,'怪兽电力公司','https://movie.douban.com/subject/1291579/','8.6',190206,'http://www.monstersinc.com',NULL,NULL,NULL,NULL,NULL,'','2001-11-02(美国)','约翰·古德曼 比利·克里斯托 玛丽·吉布斯 史蒂夫·布西密 詹妮弗·提莉 詹姆斯·柯本','彼特·道格特大卫·斯沃曼李·昂克里奇','喜剧 动画 儿童 奇幻','http://www.iqiyi.com/v_19rrhrzbdo.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1805127697.jpg',NULL,NULL,NULL,NULL,NULL),(44187,'七武士','https://movie.douban.com/subject/1295399/','9.1',58996,'http://www.imdb.com/title/tt0047478',NULL,NULL,NULL,NULL,NULL,'','1954-04-26','三船敏郎 志村乔 稻叶义男 宫口精二 千秋实 加东大介 木村功','黑泽明','剧情 动作 冒险','http://www.tudou.com/albumplay/XjIezT-Yuuk/DfkmIizuS4g.html',NULL,NULL,'4',1,'p647099823.jpg',NULL,NULL,NULL,NULL,NULL),(44188,'倩女幽魂','https://movie.douban.com/subject/1297447/','8.5',195565,'http://www.imdb.com/title/tt0093978',NULL,NULL,NULL,NULL,NULL,'','2011-04-30(中国大陆)','张国荣 王祖贤 午马 刘兆铭 林威 薛芷伦 胡大为 王晶','程小东','剧情 爱情 武侠 古装','http://www.iqiyi.com/dianying/20120723/bb74af6577789dbf.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2270088353.jpg',NULL,NULL,NULL,NULL,NULL),(44189,'猜火车','https://movie.douban.com/subject/1292528/','8.5',204045,'http://www.imdb.com/title/tt0117951',NULL,NULL,NULL,NULL,NULL,'','1996-02-23(英国)','伊万·麦克格雷格 艾文·布莱纳 约翰尼·李·米勒 凯文·麦克基德 罗伯特·卡莱尔 凯莉·麦克唐纳','丹尼·博伊尔','剧情 犯罪','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.letv.com%2Fptv%2Fvplay%2F20949334.html&site=%E4%B9%90%E8%A7%86&name=%E7%8C%9C%E7%81%AB%E8%BD%A6&sign=970f966d64c37bfc65b515c34761c357',NULL,NULL,'4',1,'p453198997.jpg',NULL,NULL,NULL,NULL,NULL),(44190,'魂断蓝桥','https://movie.douban.com/subject/1293964/','8.8',110094,'http://www.imdb.com/title/tt0033238',NULL,NULL,NULL,NULL,NULL,'','1940-05-17(美国)','费雯·丽 罗伯特·泰勒 露塞尔·沃特森 弗吉尼亚·菲尔德 玛丽亚·彭斯卡娅','茂文·勒鲁瓦','剧情 爱情 战争','http://dianying.cntv.cn/love/hunduanlanqiao/classpage/video/20100308/101280.shtml',NULL,NULL,'4',1,'p2253342636.jpg',NULL,NULL,NULL,NULL,NULL),(44191,'穿越时空的少女','https://movie.douban.com/subject/1937946/','8.7',149266,'http://www.kadokawa.co.jp/tokikake/',NULL,NULL,NULL,NULL,NULL,'','2006-07-15(日本)','仲里依纱 石田卓也 板仓光隆 原沙知绘 谷村美月 垣内彩未 关户优希','细田守','剧情 爱情 科幻 动画','http://www.bilibili.com/video/av484754/',NULL,NULL,'4',1,'p2079334286.jpg',NULL,NULL,NULL,NULL,NULL),(44192,'东邪西毒','https://movie.douban.com/subject/1292328/','8.5',208284,'http://www.imdb.com/title/tt0109688',NULL,NULL,NULL,NULL,NULL,'','1994-09-17(中国大陆)','张国荣 张曼玉 梁朝伟 林青霞 张学友 梁家辉 杨采妮 刘嘉玲 邹兆龙 王祖贤','王家卫','剧情 动作 爱情 武侠 古装','http://www.iqiyi.com/v_19rrmy5bow.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1982176012.jpg',NULL,NULL,NULL,NULL,NULL),(44193,'狩猎','https://movie.douban.com/subject/6985810/','9.0',83318,'http://www.thehuntfilm.co.uk',NULL,NULL,NULL,NULL,NULL,'','2012-05-20(戛纳电影节)','麦斯·米科尔森 托玛斯·博·拉森 安妮卡·韦德科普 拉塞·福格尔斯特伦 苏西·沃德 安妮·路易丝·哈辛 Lars Ranthe 亚历山德拉·拉帕波特','托马斯·温特伯格','剧情','http://www.iqiyi.com/v_19rrnafjhg.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1546987967.jpg',NULL,NULL,NULL,NULL,NULL),(44194,'谍影重重3','https://movie.douban.com/subject/1578507/','8.7',141541,'http://www.imdb.com/title/tt0440963',NULL,NULL,NULL,NULL,NULL,'','2007-11-15(中国大陆)','马特·达蒙 朱丽娅·斯蒂尔斯 大卫·斯特雷泽恩 斯科特·格伦 帕迪·康斯戴恩 埃德加·拉米雷兹 阿尔伯特·芬尼 琼·艾伦 Tom Gallop 克里·约翰逊 丹尼尔·布鲁赫 乔伊·安沙 科林·斯廷顿 丹·弗雷登堡 Lucy Liemann','保罗·格林格拉斯','动作 悬疑 冒险','http://www.iqiyi.com/v_19rri0x3r0.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p792223507.jpg',NULL,NULL,NULL,NULL,NULL),(44195,'疯狂原始人','https://movie.douban.com/subject/1907966/','8.8',312203,'http://www.imdb.com/title/tt0481499',NULL,NULL,NULL,NULL,NULL,'','2013-04-20(中国大陆)','尼古拉斯·凯奇 瑞恩·雷诺兹 艾玛·斯通 凯瑟琳·基纳 克拉克·杜克 克劳斯·利特曼 克里斯·桑德斯 兰迪·汤姆','柯克·德·米科克里斯·桑德斯','喜剧 动画 冒险','http://www.letv.com/ptv/vplay/2044435.html',NULL,NULL,'4',1,'p1867084027.jpg',NULL,NULL,NULL,NULL,NULL),(44196,'记忆碎片','https://movie.douban.com/subject/1304447/','8.5',226199,'http://www.imdb.com/title/tt0209144',NULL,NULL,NULL,NULL,NULL,'','2000-09-05(威尼斯电影节)','盖·皮尔斯 凯瑞-安·莫斯 乔·潘托里亚诺 Russ Fega 乔雅·福克斯','克里斯托弗·诺兰','剧情 悬疑 惊悚 犯罪','http://www.iqiyi.com/v_19rrhul5po.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p641688453.jpg',NULL,NULL,NULL,NULL,NULL),(44197,'恋恋笔记本','https://movie.douban.com/subject/1309163/','8.5',223898,'http://www.imdb.com/title/tt0332280',NULL,NULL,NULL,NULL,NULL,'','2004-06-25(美国)','瑞恩·高斯林 瑞秋·麦克亚当斯 吉娜·罗兰兹 詹姆斯·加纳 斯塔尔勒塔·杜波利斯 凯文·康诺利 希瑟·沃奎斯特 杰弗里·奈特 琼·艾伦','尼克·卡索维茨','剧情 爱情',NULL,NULL,NULL,'4',1,'p483604864.jpg',NULL,NULL,NULL,NULL,NULL),(44198,'布达佩斯大饭店','https://movie.douban.com/subject/11525673/','8.7',228780,'http://www.grandbudapesthotel.com',NULL,NULL,NULL,NULL,NULL,'','2014-02-06(柏林电影节)','拉尔夫·费因斯 托尼·雷沃罗利 艾德里安·布洛迪 威廉·达福 裘德·洛 爱德华·诺顿 西尔莎·罗南 蒂尔达·斯文顿 比尔·默瑞 蕾雅·赛杜 欧文·威尔逊 詹森·舒瓦兹曼 马修·阿马立克 F·默里·亚伯拉罕 汤姆·威尔金森 杰夫·高布伦 哈威·凯特尔','韦斯·安德森','剧情 喜剧','http://www.iqiyi.com/v_19rrhxz45s.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2178872593.jpg',NULL,NULL,NULL,NULL,NULL),(44199,'岁月神偷','https://movie.douban.com/subject/3792799/','8.6',259474,'http://www.imdb.com/title/tt1602572',NULL,NULL,NULL,NULL,NULL,'','2010-04-16(中国大陆)','吴君如 任达华 钟绍图 李治廷 蔡颖恩 秦沛 夏萍 谷德昭 许鞍华 张同祖','罗启锐','剧情 家庭','http://www.letv.com/ptv/vplay/1231818.html',NULL,NULL,'4',1,'p517829051.jpg',NULL,NULL,NULL,NULL,NULL),(44200,'贫民窟的百万富翁','https://movie.douban.com/subject/2209573/','8.5',345531,'http://www.foxsearchlight.com/slumdogmillionaire/',NULL,NULL,NULL,NULL,NULL,'','2009-03-26(中国大陆)','戴夫·帕特尔 芙蕾达·平托 亚尼·卡普 沙鲁巴·舒克拉','丹尼·博伊尔洛芙琳·坦丹','剧情 爱情','http://v.youku.com/v_show/id_XMjgzNjA3MzI4.html?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwN18wMV8wMQ',NULL,NULL,'4',1,'p470476887.jpg',NULL,NULL,NULL,NULL,NULL),(44201,'雨人','https://movie.douban.com/subject/1291870/','8.6',175790,'http://www.imdb.com/title/tt0095953',NULL,NULL,NULL,NULL,NULL,'','1988-12-16(美国)','达斯汀·霍夫曼 汤姆·克鲁斯 瓦莱莉·高利诺 邦尼·亨特','巴瑞·莱文森','剧情','http://www.iqiyi.com/v_19rrho3bfg.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p942376281.jpg',NULL,NULL,NULL,NULL,NULL),(44202,'借东西的小人阿莉埃蒂','https://movie.douban.com/subject/4202302/','8.7',178545,'http://karigurashi.jp/',NULL,NULL,NULL,NULL,NULL,'','2010-07-17(日本)','志田未来 神木隆之介 三浦友和 树木希林 大竹忍 竹下景子 藤原龙也','米林宏昌','动画 奇幻 冒险','http://www.letv.com/ptv/vplay/2076387.html',NULL,NULL,'4',1,'p617533616.jpg',NULL,NULL,NULL,NULL,NULL),(44203,'菊次郎的夏天','https://movie.douban.com/subject/1293359/','8.7',140498,'http://www.imdb.com/title/tt0199683',NULL,NULL,NULL,NULL,NULL,'','1999-05-20(戛纳电影节)','北野武 关口雄介 岸本加世子 Gurêto Gidayû 井手博士 磨赤儿 大家由祐子 細川典江 今村鼠 田中要次','北野武','剧情 喜剧','http://www.iqiyi.com/v_19rrn8d6vc.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p751835224.jpg',NULL,NULL,NULL,NULL,NULL),(44204,'摩登时代','https://movie.douban.com/subject/1294371/','9.1',65140,'http://www.imdb.com/title/tt0027977',NULL,NULL,NULL,NULL,NULL,'','1936-02-25(美国)','查理·卓别林 宝莲·高黛 亨利·伯格曼 Tiny Sandford 切斯特·康克林','查理·卓别林','剧情 喜剧 爱情','http://www.iqiyi.com/dianying/20100331/n80.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2173707976.jpg',NULL,NULL,NULL,NULL,NULL),(44205,'断背山','https://movie.douban.com/subject/1418834/','8.5',262734,'http://www.brokebackmountain.com',NULL,NULL,NULL,NULL,NULL,'','2005-09-02(威尼斯电影节)','希斯·莱杰 杰克·吉伦哈尔 米歇尔·威廉姆斯 安妮·海瑟薇 凯特·玛拉 兰迪·奎德 琳达·卡德里尼 安娜·法瑞丝 格拉汉姆·贝克尔 斯科特·迈克尔·坎贝尔 大卫·哈伯 Roberta Maxwell 皮特·麦克罗比','李安','剧情 爱情 同性 家庭','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.letv.com%2Fptv%2Fvplay%2F20946958.html&site=%E4%B9%90%E8%A7%86&name=%E6%96%AD%E8%83%8C%E5%B1%B1&sign=66476df8af22f35e369716b5901d2c93',NULL,NULL,'4',1,'p513535588.jpg',NULL,NULL,NULL,NULL,NULL),(44206,'真爱至上','https://movie.douban.com/subject/1292401/','8.5',261640,'http://www.loveactually.com/',NULL,NULL,NULL,NULL,NULL,'','2003-11-07','休·格兰特 科林·费尔斯 艾玛·汤普森 凯拉·奈特莉 连姆·尼森 托马斯·布罗迪-桑斯特 比尔·奈伊 马丁·弗瑞曼 劳拉·琳妮 艾伦·瑞克曼 克里斯·马歇尔 罗德里格·桑托罗 罗温·艾金森 比利·鲍伯·松顿 玛汀·麦古基安 安德鲁·林肯 露西娅·莫尼斯 海克·玛卡琪','理查德·柯蒂斯','剧情 喜剧 爱情','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.letv.com%2Fptv%2Fvplay%2F24817469.html&site=%E4%B9%90%E8%A7%86&name=%E7%9C%9F%E7%88%B1%E8%87%B3%E4%B8%8A&sign=2124ea4f935abd1ca1bf7f0127b74ca3',NULL,NULL,'4',1,'p475600770.jpg',NULL,NULL,NULL,NULL,NULL),(44207,'神偷奶爸','https://movie.douban.com/subject/3287562/','8.5',306397,'http://www.despicableme.com',NULL,NULL,NULL,NULL,NULL,'','2010-06-20(莫斯科电影节)','史蒂夫·卡瑞尔 杰森·席格尔 拉塞尔·布兰德 威尔·阿奈特 朱莉·安德鲁斯 克里斯汀·韦格 米兰达·卡斯格拉夫 达纳·盖尔 艾尔西·费舍尔 皮艾尔·柯芬 克里斯·雷纳德 杰梅奈·克莱门特 杰克·麦克布瑞尔 丹尼·麦克布耐德','皮艾尔·柯芬克里斯·雷纳德','喜剧 动画 儿童','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F158358%2Ff%2F1761125.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E7%A5%9E%E5%81%B7%E5%A5%B6%E7%88%B82&sign=61caa36b01b0537215f7771717f454ae',NULL,NULL,'4',1,'p792776858.jpg',NULL,NULL,NULL,NULL,NULL),(44208,'猫鼠游戏','https://movie.douban.com/subject/1305487/','8.7',167532,'http://www.imdb.com/title/tt0264464',NULL,NULL,NULL,NULL,NULL,'','2002-12-16(洛杉矶首映)','莱昂纳多·迪卡普里奥 汤姆·汉克斯 克里斯托弗·沃肯 马丁·辛 艾米·亚当斯 詹妮弗·加纳 伊丽莎白·班克斯 纳塔莉·贝伊 詹姆斯·布洛林 艾伦·旁派 南希·利内翰 布莱恩·豪威  弗兰克·约翰·休斯 Chris Ellis','史蒂文·斯皮尔伯格','剧情 传记 犯罪','http://www.iqiyi.com/v_19rrmxplc8.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p453924541.jpg',NULL,NULL,NULL,NULL,NULL),(44209,'超脱','https://movie.douban.com/subject/5322596/','8.7',135202,'http://detachment-film.com',NULL,NULL,NULL,NULL,NULL,'','2011-04-25(美国翠贝卡电影节)','艾德里安·布洛迪 克里斯蒂娜·亨德里克斯 詹姆斯·凯恩 刘玉玲 马西娅·盖伊·哈登 萨米·盖尔 布莱思·丹纳','托尼·凯耶','剧情','http://www.iqiyi.com/dianying/20130304/07742ad928539b00.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1305562621.jpg',NULL,NULL,NULL,NULL,NULL),(44210,'虎口脱险','https://movie.douban.com/subject/1296909/','8.9',90263,'http://www.imdb.com/title/tt0060474',NULL,NULL,NULL,NULL,NULL,'','1966-12-08','路易·德·菲耐斯 布尔维尔 Claudio Brook 安德丽·帕里西 Colette Brosset 玛丽·杜布瓦','杰拉尔·乌里','喜剧 战争',NULL,NULL,NULL,'4',1,'p2173634628.jpg',NULL,NULL,NULL,NULL,NULL),(44211,'幸福终点站','https://movie.douban.com/subject/1292274/','8.6',192738,'http://www.imdb.com/title/tt0362227',NULL,NULL,NULL,NULL,NULL,'','2005-01-14(中国大陆)','汤姆·汉克斯 凯瑟琳·泽塔-琼斯 斯坦利·图齐 迭戈·鲁纳 齐·麦克布赖德 佐伊·索尔达娜','史蒂文·斯皮尔伯格','剧情 喜剧 爱情','http://www.iqiyi.com/v_19rrnpst1s.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p854757687.jpg',NULL,NULL,NULL,NULL,NULL),(44212,'素媛','https://movie.douban.com/subject/21937452/','9.1',115409,'http://www.wish-movie.kr',NULL,NULL,NULL,NULL,NULL,'','2013-10-02(韩国)','薛景求 严志媛 李来 金海淑 金相浩 罗美兰 杨真诚','李濬益','剧情 家庭',NULL,NULL,NULL,'4',1,'p2118532944.jpg',NULL,NULL,NULL,NULL,NULL),(44213,'侧耳倾听','https://movie.douban.com/subject/1297052/','8.8',132535,'http://www.imdb.com/title/tt0113824',NULL,NULL,NULL,NULL,NULL,'','1995-07-15(日本)','本名阳子 小林桂树 高山南 高桥一生 山下容莉枝 室井滋 露口茂 饭冢雅弓','近藤喜文','剧情 爱情 动画 音乐','http://www.letv.com/ptv/vplay/22940254.html',NULL,NULL,'4',1,'p456692072.jpg',NULL,NULL,NULL,NULL,NULL),(44214,'燃情岁月','https://movie.douban.com/subject/1295865/','8.8',129410,'http://www.imdb.com/title/tt0110322',NULL,NULL,NULL,NULL,NULL,'','1994-12-16(美国)','安东尼·霍普金斯 布拉德·皮特 朱莉娅·奥蒙德 艾丹·奎因 卡琳娜·隆巴德 亨利·托马斯','爱德华·兹威克','剧情 爱情 家庭 西部','http://vip.iqiyi.com/20111020/8e863169a36cd3b7.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1023654037.jpg',NULL,NULL,NULL,NULL,NULL),(44215,'驯龙高手','https://movie.douban.com/subject/2353023/','8.7',234881,'http://www.dreamworksdragons.com/',NULL,NULL,NULL,NULL,NULL,'','2010-05-14(中国大陆)','杰伊·巴鲁切尔 杰拉德·巴特勒 克雷格·费格森 亚美莉卡·费雷拉 乔纳·希尔 克里斯托夫·梅兹-普莱瑟 T·J·米勒 克里斯汀·韦格 罗宾·阿特金·唐斯 菲利普·麦格雷德 基隆·埃利奥特 阿什利·詹森 大卫·田纳特','迪恩·德布洛斯克里斯·桑德斯','喜剧 动画 家庭 奇幻 冒险','http://www.letv.com/ptv/vplay/20455621.html',NULL,NULL,'4',1,'p450042258.jpg',NULL,NULL,NULL,NULL,NULL),(44216,'海洋','https://movie.douban.com/subject/3443389/','9.0',87459,'http://www.oceans-lefilm.com',NULL,NULL,NULL,NULL,NULL,'','2011-08-12(中国大陆)','皮尔斯·布鲁斯南 雅克·贝汉 姜文 宫泽理惠','雅克·贝汉 雅克·克鲁奥德','纪录片','http://www.iqiyi.com/dianying/20111106/cba3df531176c3fe.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p497010372.jpg',NULL,NULL,NULL,NULL,NULL),(44217,'爱在日落黄昏时','https://movie.douban.com/subject/1291990/','8.7',163085,'http://www.imdb.com/title/tt0381681',NULL,NULL,NULL,NULL,NULL,'','2004-02-10(柏林电影节)','伊桑·霍克 朱莉·德尔佩 弗农·多布切夫','理查德·林克莱特','剧情 爱情','http://www.iqiyi.com/dianying/20110512/ab7e6e5cdd9be4c8.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910924055.jpg',NULL,NULL,NULL,NULL,NULL),(44218,'一一','https://movie.douban.com/subject/1292434/','8.8',123315,'http://www.imdb.com/title/tt0244316',NULL,NULL,NULL,NULL,NULL,'','2000-05-14(戛纳电影节)','吴念真 李凯莉 金燕玲 张洋洋 萧淑慎 尾形一成','杨德昌','剧情 爱情 家庭','http://www.iqiyi.com/dianying/20120815/16cf2101802c2a81.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2119675128.jpg',NULL,NULL,NULL,NULL,NULL),(44219,'风之谷','https://movie.douban.com/subject/1291585/','8.8',143919,'http://www.imdb.com/title/tt0087544',NULL,NULL,NULL,NULL,NULL,'','1992(中国大陆)','岛本须美 京田尚子 松田洋治 麦人 榊原良子','宫崎骏','科幻 动画 奇幻 冒险','http://www.iqiyi.com/lib/m_206735514.html',NULL,NULL,'4',1,'p1917567652.jpg',NULL,NULL,NULL,NULL,NULL),(44220,'阿凡达','https://movie.douban.com/subject/1652587/','8.6',452328,'http://www.avatarmovie.com',NULL,NULL,NULL,NULL,NULL,'','2010-01-04(中国大陆)','萨姆·沃辛顿 佐伊·索尔达娜 西格妮·韦弗 史蒂芬·朗 米歇尔·罗德里格兹 乔·大卫·摩尔  乔瓦尼·瑞比西','詹姆斯·卡梅隆','动作 科幻 奇幻 冒险','http://www.iqiyi.com/v_19rrn8vkts.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1204213484.jpg',NULL,NULL,NULL,NULL,NULL),(44221,'爱在黎明破晓前','https://movie.douban.com/subject/1296339/','8.7',174458,'http://www.imdb.com/title/tt0112471',NULL,NULL,NULL,NULL,NULL,'','1995-01-27(美国)','伊桑·霍克 朱莉·德尔佩 安德莉亚·埃克特 汉诺·波西尔 Karl Bruckschwaiger','理查德·林克莱特','剧情 爱情','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Ffilm.qq.com%2Fcover%2F7%2F7ci0ax0zwtztdot.html%3Fptag%3Diqiyi&site=%E8%85%BE%E8%AE%AF&name=%E7%88%B1%E5%9C%A8%E9%BB%8E%E6%98%8E%E7%A0%B4%E6%99%93%E5%89%8D&sign=e80c2d6bbbf501239dbc906ee510260a',NULL,NULL,'4',1,'p1486234122.jpg',NULL,NULL,NULL,NULL,NULL),(44222,'控方证人','https://movie.douban.com/subject/1296141/','9.5',43366,'http://www.imdb.com/title/tt0051201',NULL,NULL,NULL,NULL,NULL,'','1957-12-17(美国)','泰隆·鲍华 玛琳·黛德丽 查尔斯·劳顿 爱尔莎·兰切斯特 约翰·威廉姆斯 亨利·丹尼尔 伊安·沃尔夫 托林·撒切尔 诺玛·威登','比利·怀德','剧情 悬疑 犯罪','http://www.iqiyi.com/v_19rrk9p9uo.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1505392928.jpg',NULL,NULL,NULL,NULL,NULL),(44223,'加勒比海盗','https://movie.douban.com/subject/1298070/','8.6',274255,'http://www.imdb.com/title/tt0325980',NULL,NULL,NULL,NULL,NULL,'','2003-11-21(中国大陆)','约翰尼·德普 杰弗里·拉什 奥兰多·布鲁姆 凯拉·奈特莉 杰克·达文波特 乔纳森·普雷斯','戈尔·维宾斯基','动作 奇幻 冒险','http://www.iqiyi.com/v_19rrifh28s.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1596085504.jpg',NULL,NULL,NULL,NULL,NULL),(44224,'告白','https://movie.douban.com/subject/4268598/','8.6',271954,'http://kokuhaku-shimasu.jp',NULL,NULL,NULL,NULL,NULL,'','2010-06-05(日本)','松隆子 冈田将生 木村佳乃 西井幸人 桥本爱 芦田爱菜 三吉彩花 藤原薰 井之肋海 清水尚弥 高桥努 一井直树 能年玲奈 新井浩文 野本萤','中岛哲也','剧情 惊悚','http://www.iqiyi.com/v_19rrho79w8.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p689520756.jpg',NULL,NULL,NULL,NULL,NULL),(44225,'甜蜜蜜','https://movie.douban.com/subject/1305164/','8.7',190545,'http://www.imdb.com/title/tt0117905',NULL,NULL,NULL,NULL,NULL,'','2015-02-13(中国大陆)','黎明 张曼玉 杨恭如 曾志伟 杜可风 张同祖 诸慧荷 丁羽','陈可辛','剧情 爱情','http://www.tudou.com/albumplay/f3ZWYVx5R-I/dmDR3cOptIY.html?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwMV8wMV8wMQ',NULL,NULL,'4',1,'p2223011274.jpg',NULL,NULL,NULL,NULL,NULL),(44226,'致命ID','https://movie.douban.com/subject/1297192/','8.6',252521,'http://www.imdb.com/title/tt0309698',NULL,NULL,NULL,NULL,NULL,'','2003-04-25(美国)','约翰·库萨克 雷·利奥塔 阿曼达·皮特 阿尔弗雷德·莫里纳 克里·杜瓦尔','詹姆斯·曼高德','剧情 悬疑 惊悚','http://vip.iqiyi.com/20110908/debd38ad65715d8b.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p453720880.jpg',NULL,NULL,NULL,NULL,NULL),(44227,'禁闭岛','https://movie.douban.com/subject/2334904/','8.6',289382,'http://www.imdb.com/title/tt1130884',NULL,NULL,NULL,NULL,NULL,'','2010-02-13(柏林电影节)','莱昂纳多·迪卡普里奥 马克·鲁弗洛 本·金斯利 马克斯·冯·叙多 米歇尔·威廉姆斯 艾米莉·莫迪默 派翠西娅·克拉克森 杰基·厄尔·哈利 泰德·拉文 约翰·卡洛·林奇 伊莱亚斯·科泰斯 罗宾·巴特利特 克里斯托弗·邓汉 约瑟夫·斯科拉','马丁·斯科塞斯','剧情 悬疑 惊悚','http://vip.iqiyi.com/20110729/1b42f208e094de24.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1832875827.jpg',NULL,NULL,NULL,NULL,NULL),(44228,'春光乍泄','https://movie.douban.com/subject/1292679/','8.7',186550,'http://www.imdb.com/title/tt0118845',NULL,NULL,NULL,NULL,NULL,'','1997-05-30','梁朝伟 张国荣 张震','王家卫','剧情 爱情 同性','http://v.qq.com/page/s/f/A/s0010X8q3fA.html?ptag=iqiyi',NULL,NULL,'4',1,'p465939041.jpg',NULL,NULL,NULL,NULL,NULL),(44229,'重庆森林','https://movie.douban.com/subject/1291999/','8.6',250232,'http://www.imdb.com/title/tt0109424',NULL,NULL,NULL,NULL,NULL,'','1994-07-14(香港)','林青霞 金城武 梁朝伟 王菲 周嘉玲','王家卫','剧情 爱情','http://www.iqiyi.com/v_19rrho3e0w.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2276728977.jpg',NULL,NULL,NULL,NULL,NULL),(44230,'大闹天宫','https://movie.douban.com/subject/1418019/','9.2',75099,'http://www.imdb.com/title/tt0059855',NULL,NULL,NULL,NULL,NULL,'','1961(上集)','邱岳峰 富润生 毕克 尚华 于鼎 李梓 刘广宁','万籁鸣唐澄','动画 奇幻','http://www.iqiyi.com/v_19rrkq3mxk.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2184505167.jpg',NULL,NULL,NULL,NULL,NULL),(44231,'萤火虫之墓','https://movie.douban.com/subject/1293318/','8.8',169875,'http://www.imdb.com/title/tt0095327',NULL,NULL,NULL,NULL,NULL,'','1988-04-16(日本)','辰己努 白石绫乃 志乃原良子 山口朱美 端田宏三','高畑勋','剧情 动画 战争','http://www.letv.com/ptv/vplay/2058137.html',NULL,NULL,'4',1,'p1157334208.jpg',NULL,NULL,NULL,NULL,NULL),(44232,'上帝之城','https://movie.douban.com/subject/1292208/','8.9',131199,'http://www.imdb.com/title/tt0317248',NULL,NULL,NULL,NULL,NULL,'','2002-05-18(戛纳电影节)','亚历桑德雷·罗德里格斯 Leandro Firmino 菲利佩·哈根森 道格拉斯·席尔瓦 Jonathan Haagensen 马修斯·纳克加勒 索·豪黑 艾莉丝·布拉加','卡迪亚·兰德费尔南多·梅里尔斯','剧情 犯罪','http://www.iqiyi.com/v_19rrmoarfo.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p455677490.jpg',NULL,NULL,NULL,NULL,NULL),(44233,'阳光灿烂的日子','https://movie.douban.com/subject/1291875/','8.7',220971,'http://www.imdb.com/title/tt0111786',NULL,NULL,NULL,NULL,NULL,'','1995-08-21(中国大陆)','夏雨 宁静 陶虹 耿乐 斯琴高娃 冯小刚 姜文 王学圻 王朔 尚楠','姜文','剧情','http://www.iqiyi.com/lib/m_205832114.html',NULL,NULL,'4',1,'p967457079.jpg',NULL,NULL,NULL,NULL,NULL),(44234,'阳光姐妹淘','https://movie.douban.com/subject/4917726/','8.8',215998,'http://www.imdb.com/title/tt1937339',NULL,NULL,NULL,NULL,NULL,'','2011-05-04(韩国)','沈恩京 闵孝琳 姜素拉 南宝拉 陈熙京 金时厚 柳好贞 朴真珠 金甫美 千禹熙 李璟荣','姜炯哲','剧情 喜剧','http://www.tudou.com/albumplay/ZMBPSSGec6U/VJhZU0VuiLA.html',NULL,NULL,'4',1,'p1374786017.jpg',NULL,NULL,NULL,NULL,NULL),(44235,'让子弹飞','https://movie.douban.com/subject/3742360/','8.7',535690,'http://www.imdb.com/title/tt1533117',NULL,NULL,NULL,NULL,NULL,'','2010-12-16(中国大陆)','姜文 葛优 周润发 刘嘉玲 陈坤 张默 姜武 周韵 廖凡 姚橹 邵兵 苗圃 冯小刚 胡军 马珂 白冰 杜奕衡 李静 胡明 危笑 杨奇雨  赵铭','姜文','剧情 喜剧 动作 西部','http://www.iqiyi.com/dianying/20110208/c400871a16e3fc1b.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1512562287.jpg',NULL,NULL,NULL,NULL,NULL),(44236,'心灵捕手','https://movie.douban.com/subject/1292656/','8.7',213865,'http://www.imdb.com/title/tt0119217',NULL,NULL,NULL,NULL,NULL,'','1997-12-05(美国)','马特·达蒙 罗宾·威廉姆斯 本·阿弗莱克 斯特兰·斯卡斯加德 明妮·德里弗 卡西·阿弗莱克 科尔·豪瑟 John Mighton Rachel Majorowski Colleen McCauley Matt Mercier Ralph St. George Rob Lynds Dan Washington Alison Folland','格斯·范·桑特','剧情','http://www.iqiyi.com/dianying/20130323/657b9e288cbfe408.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p480965695.jpg',NULL,NULL,NULL,NULL,NULL),(44237,'辩护人','https://movie.douban.com/subject/21937445/','9.1',135008,'http://www.lawyersong.kr',NULL,NULL,NULL,NULL,NULL,'','2013-12-18(韩国)','宋康昊 吴达洙 金英爱 郭度沅 任时完','杨宇硕','剧情','http://www.iqiyi.com/v_19rrn7o17k.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2158166535.jpg',NULL,NULL,NULL,NULL,NULL),(44238,'射雕英雄传之东成西就','https://movie.douban.com/subject/1316510/','8.7',224355,'http://www.imdb.com/title/tt0108074',NULL,NULL,NULL,NULL,NULL,'','1993-02-05','梁朝伟 张国荣 张学友 梁家辉 林青霞 王祖贤 张曼玉 刘嘉玲 叶玉卿 钟镇涛 鲍起静','刘镇伟','喜剧 古装','http://www.iqiyi.com/w_19rs4m0295.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p921415667.jpg',NULL,NULL,NULL,NULL,NULL),(44239,'幽灵公主','https://movie.douban.com/subject/1297359/','8.8',191536,'http://www.imdb.com/title/tt0119698',NULL,NULL,NULL,NULL,NULL,'','1997-07-12','松田洋治 石田百合子 田中裕子 森光子 西村雅彦 上条恒彦 美轮明宏 森繁久弥 岛本须美 渡边哲 佐藤允 名古屋章 小林薰','宫崎骏','动画 奇幻 冒险','http://www.iqiyi.com/v_19rrifgfh8.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1613191025.jpg',NULL,NULL,NULL,NULL,NULL),(44240,'大鱼','https://movie.douban.com/subject/1291545/','8.7',205427,'http://www.imdb.com/title/tt0319061',NULL,NULL,NULL,NULL,NULL,'','2003-12-10(多伦多首映)','伊万·麦克格雷格 阿尔伯特·芬尼 比利·克鲁德普 杰西卡·兰格 海伦娜·伯翰·卡特 玛丽昂·歌迪亚 艾莉森·洛曼 丹尼·德维托 艾达·泰 Arlene tai 史蒂夫·布西密','蒂姆·波顿','剧情 家庭 奇幻 冒险','http://vip.iqiyi.com/20111020/741e88985518034c.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p692813374.jpg',NULL,NULL,NULL,NULL,NULL),(44241,'西西里的美丽传说','https://movie.douban.com/subject/1292402/','8.6',272677,'http://www.imdb.com/title/tt0213847',NULL,NULL,NULL,NULL,NULL,'','2000-10-27(意大利)','莫妮卡·贝鲁奇 圭塞佩·苏尔法罗 Luciano Federico Matilde Piana Elisa Morucci','朱塞佩·托纳多雷','剧情 情色 战争','http://www.iqiyi.com/v_19rrh1gubo.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p792400696.jpg',NULL,NULL,NULL,NULL,NULL),(44242,'饮食男女','https://movie.douban.com/subject/1291818/','8.9',135419,'http://www.imdb.com/title/tt0111797',NULL,NULL,NULL,NULL,NULL,'','1994-08-03(美国)','吴倩莲 杨贵媚 王渝文 郎雄 张艾嘉 归亚蕾 赵文瑄 陈昭荣','李安','剧情 家庭','http://www.iqiyi.com/lib/m_207004614.html',NULL,NULL,'4',1,'p1910899751.jpg',NULL,NULL,NULL,NULL,NULL),(44243,'第六感','https://movie.douban.com/subject/1297630/','8.8',189454,'http://www.imdb.com/title/tt0167404',NULL,NULL,NULL,NULL,NULL,'','1999-08-06(美国)','布鲁斯·威利斯 海利·乔·奥斯蒙 托妮·科莱特 奥莉维亚·威廉姆斯 唐尼·沃尔伯格','M·奈特·沙马兰','剧情 悬疑 惊悚','http://vip.iqiyi.com/20110401/e8a7956ec1a71b0e.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2220184425.jpg',NULL,NULL,NULL,NULL,NULL),(44244,'拯救大兵瑞恩','https://movie.douban.com/subject/1292849/','8.8',186193,'http://www.rzm.com/pvt.ryan/index.html',NULL,NULL,NULL,NULL,NULL,'','1998-07-24(美国)','汤姆·汉克斯 汤姆·塞兹摩尔 爱德华·伯恩斯 巴里·佩珀 亚当·戈德堡 范·迪塞尔 乔瓦尼·瑞比西 杰瑞米·戴维斯 马特·达蒙 特德·丹森 保罗·吉亚玛提 丹尼斯·法里纳 马克斯·马蒂尼 丹兰·布鲁诺 安德鲁·斯科特','史蒂文·斯皮尔伯格','剧情 历史 战争','http://www.iqiyi.com/v_19rrnpp9co.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1014542496.jpg',NULL,NULL,NULL,NULL,NULL),(44245,'黑客帝国','https://movie.douban.com/subject/1291843/','8.7',227538,'http://www.imdb.com/title/tt0133093',NULL,NULL,NULL,NULL,NULL,'','1999-03-31(美国)','基努·里维斯 凯瑞-安·莫斯 劳伦斯·菲什伯恩 雨果·维文 格洛丽亚·福斯特 乔·潘托里亚诺 Marcus Chong Julian Arahanga 马特·多兰','莉莉·沃卓斯基拉娜·沃卓斯基','动作 科幻','http://www.iqiyi.com/pianhua/20110512/6474097fcfe5de36.html',NULL,NULL,'4',1,'p1910908765.jpg',NULL,NULL,NULL,NULL,NULL),(44246,'本杰明·巴顿奇事','https://movie.douban.com/subject/1485260/','8.7',333539,'http://www.imdb.com/title/tt0421715',NULL,NULL,NULL,NULL,NULL,'','2008-12-25(美国)','布拉德·皮特 凯特·布兰切特 塔拉吉·P·汉森 蒂尔达·斯文顿 朱莉娅·奥蒙德 艾丽·范宁','大卫·芬奇','剧情 爱情 奇幻',NULL,NULL,NULL,'4',1,'p475749652.jpg',NULL,NULL,NULL,NULL,NULL),(44247,'沉默的羔羊','https://movie.douban.com/subject/1293544/','8.7',287534,'http://www.imdb.com/title/tt0102926',NULL,NULL,NULL,NULL,NULL,'','1991-02-14(美国)','朱迪·福斯特 安东尼·霍普金斯 斯科特·格伦 安东尼·希尔德 布鲁克·史密斯','乔纳森·戴米','剧情 惊悚 犯罪','http://www.tudou.com/albumplay/2_UGNtB8brY/QeSZR7daQFw.html',NULL,NULL,'4',1,'p1593414327.jpg',NULL,NULL,NULL,NULL,NULL),(44248,'玛丽和马克思','https://movie.douban.com/subject/3072124/','8.9',205016,'http://www.maryandmax.com/',NULL,NULL,NULL,NULL,NULL,'','2009-04-09','托妮·科莱特 菲利普·塞默·霍夫曼 艾瑞克·巴纳 巴瑞·哈姆弗莱斯 贝塔尼·维特莫尔','亚当·艾略特','剧情 爱情 动画','http://www.letv.com/ptv/vplay/1724739.html',NULL,NULL,'4',1,'p1820615077.jpg',NULL,NULL,NULL,NULL,NULL),(44249,'蝴蝶效应','https://movie.douban.com/subject/1292343/','8.7',320375,'http://www.imdb.com/title/tt0289879',NULL,NULL,NULL,NULL,NULL,'','2004-01-23(美国)','阿什顿·库彻 艾米·斯马特 埃尔登·汉森 罗根·勒曼','埃里克·布雷斯J.麦基·格鲁伯','剧情 科幻 悬疑 惊悚','http://www.iqiyi.com/v_19rrhvik0c.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p793653648.jpg',NULL,NULL,NULL,NULL,NULL),(44250,'星际穿越','https://movie.douban.com/subject/1889243/','9.1',381403,'http://www.interstellarmovie.com',NULL,NULL,NULL,NULL,NULL,'','2014-11-12(中国大陆)','马修·麦康纳 安妮·海瑟薇 杰西卡·查斯坦 迈克尔·凯恩 麦肯吉·弗依 蒂莫西·柴勒梅德 约翰·利特高 韦斯·本特利 大卫·吉雅西 比尔·欧文 马特·达蒙 卡西·阿弗莱克 托弗·戈瑞斯 艾伦·伯斯汀 科莱特·沃夫 弗朗西斯·X·麦卡蒂 安德鲁·博尔巴 乔什·斯图沃特 莱雅·卡里恩斯 利亚姆·迪金森 杰夫·赫普内尔 伊莱耶斯·加贝尔 布鲁克·史密斯','克里斯托弗·诺兰','剧情 科幻 悬疑 家庭 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fv.youku.com%2Fv_show%2Fid_XODkzNzA4ODM2.html&site=%E4%BC%98%E9%85%B7&name=%E6%98%9F%E9%99%85%E7%A9%BF%E8%B6%8A&sign=64af1daee45090e2842d1e7065b838ff',NULL,NULL,'4',1,'p2206088801.jpg',NULL,NULL,NULL,NULL,NULL),(44251,'入殓师','https://movie.douban.com/subject/2149806/','8.8',274046,'http://www.okuribito.jp',NULL,NULL,NULL,NULL,NULL,'','2008-09-13(日本)','本木雅弘 广末凉子 山崎努 吉行和子 笹野高史 余贵美子','泷田洋二郎','剧情',NULL,NULL,NULL,'4',1,'p594972928.jpg',NULL,NULL,NULL,NULL,NULL),(44252,'低俗小说','https://movie.douban.com/subject/1291832/','8.7',268652,'http://www.imdb.com/title/tt0110912',NULL,NULL,NULL,NULL,NULL,'','1994-05-12(戛纳电影节)','约翰·特拉沃尔塔 乌玛·瑟曼 阿曼达·普拉莫 蒂姆·罗斯 塞缪尔·杰克逊 菲尔·拉马 布鲁斯·威利斯 弗兰克·威利 布尔·斯蒂尔斯 文·瑞姆斯 Laura Lovelace Paul Calderon 布罗娜·加拉赫 罗姗娜·阿奎特 埃里克·斯托尔兹 玛丽亚·德·梅黛洛','昆汀·塔伦蒂诺','剧情 犯罪','http://www.iqiyi.com/dianying/20130323/f141266ca44bff72.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910902213.jpg',NULL,NULL,NULL,NULL,NULL),(44253,'小鞋子','https://movie.douban.com/subject/1303021/','9.1',107316,'http://www.cinemajidi.com/children/',NULL,NULL,NULL,NULL,NULL,'','1999-01-22(美国)','Amir Farrokh Hashemian 默罕默德·阿米尔·纳吉 Bahare Seddiqi Nafise Jafar-Mohammadi Fereshte Sarabandi','马基德·马基迪','剧情 家庭 儿童','http://www.iqiyi.com/dianying/20130401/96ae3dffcfc3fa7e.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2173580603.jpg',NULL,NULL,NULL,NULL,NULL),(44254,'音乐之声','https://movie.douban.com/subject/1294408/','8.9',195047,'http://www.imdb.com/title/tt0059742',NULL,NULL,NULL,NULL,NULL,'','1965-03-02(美国)','朱莉·安德鲁斯 克里斯托弗·普卢默 埃琳诺·帕克 理查德·海顿 佩吉·伍德 Charmian Carr Heather Menzies 尼古拉斯·哈蒙德 Duane Chase 安吉拉·卡特怀特 Debbie Turner Kym Karath 安娜·李 Portia Nelson 本·怀特 Daniel Truhitte 诺玛·威登 Gilchrist Stuart Marni Nixon Evadne Baker 多丽丝·劳埃德','罗伯特·怀斯','剧情 爱情 歌舞 家庭 传记','http://www.iqiyi.com/dianying/20130304/403ae8650c49e5f8.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p453788577.jpg',NULL,NULL,NULL,NULL,NULL),(44255,'被嫌弃的松子的一生','https://movie.douban.com/subject/1787291/','8.9',207163,'http://www.imdb.com/title/tt0768120',NULL,NULL,NULL,NULL,NULL,'','2006-05-27(日本)','中谷美纪 瑛太 香川照之 市川实日子 伊势谷友介 柄本明 黑泽明日香 荒川良良 柴崎幸 土屋安娜 奥之矢佳奈 谷原章介 武田真治 片平渚 宫藤官九郎 角野卓造 田中要次 木村KAELA 谷中敦 剧团一人','中岛哲也','剧情 歌舞',NULL,NULL,NULL,'4',1,'p453723669.jpg',NULL,NULL,NULL,NULL,NULL),(44256,'狮子王','https://movie.douban.com/subject/1301753/','8.8',234239,'http://www.imdb.com/title/tt0110357',NULL,NULL,NULL,NULL,NULL,'','1995-07-15(中国大陆)','乔纳森·泰勒·托马斯 马修·布罗德里克 杰瑞米·艾恩斯 詹姆斯·厄尔·琼斯 莫伊拉·凯利 内森·连恩 尼基塔·卡兰姆 埃林·萨贝拉 乌比·戈德堡 罗温·艾金森','罗杰·阿勒斯罗伯·明可夫','剧情 动画 歌舞 家庭 冒险','http://my.tv.sohu.com/u/vw/12276832?txid=7ada969851fd73090f44b01fee5b798c',NULL,NULL,'4',1,'p722758217.jpg',NULL,NULL,NULL,NULL,NULL),(44257,'致命魔术','https://movie.douban.com/subject/1780330/','8.8',279825,'http://www.imdb.com/title/tt0482571',NULL,NULL,NULL,NULL,NULL,'','2006-10-20(美国)','克里斯蒂安·贝尔 休·杰克曼 迈克尔·凯恩 斯嘉丽·约翰逊 丽贝卡·豪尔 大卫·鲍伊 安迪·瑟金斯','克里斯托弗·诺兰','剧情 悬疑 惊悚','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F110075%2Ff%2F1138943.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E8%87%B4%E5%91%BD%E9%AD%94%E6%9C%AF&sign=d17b96bb0e2fb540dd41dc45794d92b6',NULL,NULL,'4',1,'p480383375.jpg',NULL,NULL,NULL,NULL,NULL),(44258,'钢琴家','https://movie.douban.com/subject/1296736/','9.0',167023,'http://www.imdb.com/title/tt0253474',NULL,NULL,NULL,NULL,NULL,'','2002-05-24(戛纳电影节)','艾德里安·布洛迪 托马斯·克莱舒曼 艾米莉娅·福克斯 米哈乌·热布罗夫斯基 埃德·斯托帕德 穆琳·利普曼 弗兰克·芬莱 邱莉娅蕾娜 杰西卡凯特梅耶 理查德莱丁斯','罗曼·波兰斯基','剧情 传记 历史 战争','http://www.iqiyi.com/v_19rrho71bg.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p792484461.jpg',NULL,NULL,NULL,NULL,NULL),(44259,'美国往事','https://movie.douban.com/subject/1292262/','9.1',141567,'http://www.onceuponatimeinamerica.net',NULL,NULL,NULL,NULL,NULL,'','1984-02-17(波士顿首映)','罗伯特·德尼罗 詹姆斯·伍兹 詹妮弗·康纳利 伊丽莎白·麦戈文 乔·佩西 塔斯黛·韦尔德 波特·杨 特里特·威廉斯 丹尼·爱罗 理查德·布赖特','赛尔乔·莱翁内','剧情 犯罪','http://www.iqiyi.com/v_19rrnma6cw.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p477229647.jpg',NULL,NULL,NULL,NULL,NULL),(44260,'剪刀手爱德华','https://movie.douban.com/subject/1292370/','8.7',410172,'http://www.imdb.com/title/tt0099487',NULL,NULL,NULL,NULL,NULL,'','1990-12-06(美国)','约翰尼·德普 薇诺娜·瑞德 黛安·韦斯特 安东尼·迈克尔·豪尔 凯西·贝克 罗伯特·奥利维里 康查塔·费雷尔 卡罗琳·阿隆 Dick Anthony Williams 澳澜·琼斯 文森特·普莱斯 艾伦·阿金 Susan Blommaert Linda Perri John Davidson','蒂姆·波顿','剧情 爱情 奇幻','http://vip.iqiyi.com/20111231/068bd3c4303810b7.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p480956937.jpg',NULL,NULL,NULL,NULL,NULL),(44261,'死亡诗社','https://movie.douban.com/subject/1291548/','8.9',222098,'http://www.imdb.com/title/tt0097165',NULL,NULL,NULL,NULL,NULL,'','1989-06-02(多伦多首映)','罗宾·威廉姆斯 罗伯特·肖恩·莱纳德 伊桑·霍克 乔西·查尔斯 盖尔·汉森 迪伦·库斯曼 阿勒隆·鲁杰罗 詹姆斯·沃特斯顿 诺曼·劳埃德 柯特伍德·史密斯 卡拉·贝尔韦尔 利昂·波纳尔 乔治·马丁 乔·奥菲耶里 马特·凯里','彼得·威尔','剧情','http://vip.iqiyi.com/20110324/0e8ebdc961201f4e.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910824340.jpg',NULL,NULL,NULL,NULL,NULL),(44262,'勇敢的心','https://movie.douban.com/subject/1294639/','8.8',254674,'http://www.imdb.com/title/tt0112573',NULL,NULL,NULL,NULL,NULL,'','1995-05-24','梅尔·吉布森 苏菲·玛索 布莱恩·考克斯 詹姆斯·卡沙莫 辛·劳洛 凯瑟琳·麦克马克 安古斯·麦克菲登','梅尔·吉布森','剧情 动作 传记 历史 战争','http://vip.iqiyi.com/20111216/a04a8d311541c8fb.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1374546770.jpg',NULL,NULL,NULL,NULL,NULL),(44263,'情书','https://movie.douban.com/subject/1292220/','8.8',300012,'http://www.imdb.com/title/tt0113703',NULL,NULL,NULL,NULL,NULL,'','1995-03-25(日本)','中山美穗 酒井美纪 柏原崇 丰川悦司 光石研 范文雀 篠原胜之 加贺麻理子','岩井俊二','剧情 爱情','http://www.letv.com/ptv/vplay/23162313.html',NULL,NULL,'4',1,'p449897379.jpg',NULL,NULL,NULL,NULL,NULL),(44264,'七宗罪','https://movie.douban.com/subject/1292223/','8.7',371109,'http://www.imdb.com/title/tt0114369',NULL,NULL,NULL,NULL,NULL,'','1995-09-22(美国)','摩根·弗里曼 布拉德·皮特 凯文·史派西 格温妮斯·帕特洛 安德鲁·凯文·沃克 约翰·卡西尼 雷格·E.凯蒂 李·厄米','大卫·芬奇','剧情 悬疑 惊悚 犯罪','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Ffilm.qq.com%2Fcover%2Fz%2Fzg7bhyyc1ffeha0.html%3Fptag%3Diqiyi&site=%E8%85%BE%E8%AE%AF&name=%E4%B8%83%E5%AE%97%E7%BD%AA&sign=6f52e3e400d9a390a619b7d7f048f1ac',NULL,NULL,'4',1,'p457631605.jpg',NULL,NULL,NULL,NULL,NULL),(44265,'哈尔的移动城堡','https://movie.douban.com/subject/1308807/','8.8',279994,'http://www.imdb.com/title/tt0347149',NULL,NULL,NULL,NULL,NULL,'','2004-09-05(威尼斯电影节)','倍赏千惠子 木村拓哉 美轮明宏 我修院达也 神木隆之介','宫崎骏','爱情 动画 奇幻 冒险','http://donghua.cntv.cn/hedydcb/classpage/video/20120204/100322.shtml',NULL,NULL,'4',1,'p2174346180.jpg',NULL,NULL,NULL,NULL,NULL),(44266,'教父2','https://movie.douban.com/subject/1299131/','9.1',151763,'http://www.imdb.com/title/tt0071562',NULL,NULL,NULL,NULL,NULL,'','1974-12-20(美国)','阿尔·帕西诺 罗伯特·杜瓦尔 黛安·基顿 罗伯特·德尼罗 约翰·凯泽尔 塔莉娅·夏尔 李·斯特拉斯伯格 迈克尔·V·格佐 G·D·斯普拉德林 理查德·布赖特 加斯通·莫辛 汤姆·罗斯奎 布鲁诺·柯比 弗兰克•西维罗 Francesca De Sapio','弗朗西斯·福特·科波拉','剧情 犯罪','http://www.iqiyi.com/dianying/20130716/24ef04c1bdcb0a60.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p616779231.jpg',NULL,NULL,NULL,NULL,NULL),(44267,'指环王2：双塔奇兵','https://movie.douban.com/subject/1291572/','8.9',229152,'http://www.lordoftherings.net',NULL,NULL,NULL,NULL,NULL,'','2003-04-25(中国大陆)','伊利亚·伍德 西恩·奥斯汀 伊恩·麦克莱恩 维果·莫腾森 奥兰多·布鲁姆 克里斯托弗·李 丽芙·泰勒 安迪·瑟金斯 雨果·维文 卡尔·厄本 凯特·布兰切特 多米尼克·莫纳汉 大卫·文翰 比利·博伊德 布拉德·道里夫 伯纳德·希尔 约翰·瑞斯-戴维斯 米兰达·奥图','彼得·杰克逊','剧情 动作 奇幻 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F101058%2Ff%2F1503332.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E6%8C%87%E7%8E%AF%E7%8E%8B2&sign=a0b65cd82f6650fd3d28171ac3496750',NULL,NULL,'4',1,'p909265336.jpg',NULL,NULL,NULL,NULL,NULL),(44268,'指环王1：魔戒再现','https://movie.douban.com/subject/1291571/','8.9',255298,'http://www.lordoftherings.net',NULL,NULL,NULL,NULL,NULL,'','2002-04-04(中国大陆)','伊利亚·伍德 西恩·奥斯汀 伊恩·麦克莱恩 维果·莫腾森 奥兰多·布鲁姆 凯特·布兰切特 肖恩·宾 克里斯托弗·李 雨果·维文 丽芙·泰勒 安迪·瑟金斯 伊安·霍姆 多米尼克·莫纳汉 萨拉·贝克 约翰·瑞斯-戴维斯','彼得·杰克逊','剧情 动作 奇幻 冒险','http://www.iqiyi.com/v_19rrhnllfg.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1354436051.jpg',NULL,NULL,NULL,NULL,NULL),(44269,'美丽心灵','https://movie.douban.com/subject/1306029/','8.9',254595,'http://www.imdb.com/title/tt0268978',NULL,NULL,NULL,NULL,NULL,'','2001-12-13(加州首映)','罗素·克劳 詹妮弗·康纳利 艾德·哈里斯 克里斯托弗·普卢默 保罗·贝坦尼 亚当·戈德堡 乔什·卢卡斯','朗·霍华德','剧情 传记','http://www.iqiyi.com/v_19rrnppl5w.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1665997400.jpg',NULL,NULL,NULL,NULL,NULL),(44270,'天使爱美丽','https://movie.douban.com/subject/1292215/','8.7',412846,'http://www.imdb.com/title/tt0211915',NULL,NULL,NULL,NULL,NULL,'','2001-04-25(法国)','奥黛丽·塔图 马修·卡索维茨 贾梅尔·杜布兹 罗瑞娜·克拉沃塔 多米尼克·皮诺 伊莎贝拉·南蒂 友兰达·梦露 鲁费斯 克莱尔·莫里耶 艾特·迪·彭吉云 莫里斯·本尼丘 米切尔·罗宾 塞尔·梅林 克洛蒂尔德·莫莱特 乌尔拜恩·坎塞里尔 克劳德·佩龙','让-皮埃尔·热内','喜剧 爱情','http://www.iqiyi.com/v_19rrho2cmo.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p803896904.jpg',NULL,NULL,NULL,NULL,NULL),(44271,'活着','https://movie.douban.com/subject/1292365/','9.0',203581,'http://www.imdb.com/title/tt0110081',NULL,NULL,NULL,NULL,NULL,'','1994-05-18(法国)','葛优 巩俐 姜武 牛犇 郭涛 张璐 倪大红 肖聪 董飞 刘天池 董立范 黄宗洛 刘燕瑾 李连义 杨同顺','张艺谋','剧情 家庭','http://vod.kankan.com/v/73/73353.shtml?id=731100',NULL,NULL,'4',1,'p2173575484.jpg',NULL,NULL,NULL,NULL,NULL),(44272,'闻香识女人','https://movie.douban.com/subject/1298624/','8.9',263089,'http://www.imdb.com/title/tt0105323',NULL,NULL,NULL,NULL,NULL,'','1992-12-23(美国)','阿尔·帕西诺 克里斯·奥唐纳 詹姆斯·瑞布霍恩 加布里埃尔·安瓦尔 菲利普·塞默·霍夫曼 Richard Venture 布莱德利·惠特福德 Rochelle Oliver Margaret Eginton Tom Riis Farrell Nicholas Sadler 托德·路易斯 Matt Smith 吉恩·坎菲尔德 弗兰西丝·康罗伊','马丁·布莱斯','剧情','http://www.iqiyi.com/v_19rrhwtpa4.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p925123037.jpg',NULL,NULL,NULL,NULL,NULL),(44273,'V字仇杀队','https://movie.douban.com/subject/1309046/','8.8',335705,'http://www.imdb.com/title/tt0434409',NULL,NULL,NULL,NULL,NULL,'','2005-12-11(BNAT电影节)','娜塔莉·波特曼 雨果·维文 鲁珀特·格雷夫斯 斯蒂芬·瑞 斯蒂芬·弗雷 伊莫琴·普茨 约翰·赫特 蒂姆·皮戈特-史密斯 罗杰·阿拉姆 约翰·斯坦丁 西妮德·库萨克 娜塔莎·怀特曼 本·迈尔斯','詹姆斯·麦克特格','剧情 动作 科幻 惊悚','http://vod.kankan.com/v/33/33497/342820.shtml?id=731100',NULL,NULL,'4',1,'p1465235231.jpg',NULL,NULL,NULL,NULL,NULL),(44274,'蝙蝠侠：黑暗骑士','https://movie.douban.com/subject/1851857/','9.0',255737,'http://thedarkknight.warnerbros.com',NULL,NULL,NULL,NULL,NULL,'','2008-07-14(纽约首映)','克里斯蒂安·贝尔 希斯·莱杰 艾伦·艾克哈特 迈克尔·凯恩 玛吉·吉伦哈尔 加里·奥德曼 摩根·弗里曼 基里安·墨菲 黄经汉 陈冠希 内斯特·卡博内尔 埃里克·罗伯茨 威廉·菲德内尔','克里斯托弗·诺兰','剧情 动作 科幻 惊悚 犯罪','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F110227%2Ff%2F1140670.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E8%9D%99%E8%9D%A0%E4%BE%A0%EF%BC%9A%E9%BB%91%E6%9A%97%E9%AA%91%E5%A3%AB&sign=261dcee2031c0b5c157df9e40aa1af75',NULL,NULL,'4',1,'p462657443.jpg',NULL,NULL,NULL,NULL,NULL),(44275,'少年派的奇幻漂流','https://movie.douban.com/subject/1929463/','9.0',490276,'http://www.lifeofpimovie.com',NULL,NULL,NULL,NULL,NULL,'','2012-11-22(中国大陆)','苏拉·沙玛 拉菲·斯波 伊尔凡·可汗 杰拉尔·德帕迪约 塔布 阿迪勒·侯赛因 阿尤什·坦东 王柏杰 俊·奈托','李安','剧情 奇幻 冒险','http://www.iqiyi.com/dianying/20130320/eb4c7f0e879697f0.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1784592701.jpg',NULL,NULL,NULL,NULL,NULL),(44276,'窃听风暴','https://movie.douban.com/subject/1900841/','9.1',176951,'http://www.imdb.com/title/tt0405094',NULL,NULL,NULL,NULL,NULL,'','2006-03-23(德国)','乌尔里希·穆埃 马蒂娜·戈黛特 塞巴斯蒂安·科赫 乌尔里奇·图克尔 托马斯·席尔梅','弗洛里安·亨克尔·冯·多纳斯马','剧情 悬疑','http://www.iqiyi.com/v_19rrnaubew.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1808872109.jpg',NULL,NULL,NULL,NULL,NULL),(44277,'鬼子来了','https://movie.douban.com/subject/1291858/','9.1',181317,'http://www.imdb.com/title/tt0245929',NULL,NULL,NULL,NULL,NULL,'','2000-05-12(戛纳电影节)','姜文 香川照之 袁丁 姜宏波 陈强 丛志军 喜子 李海滨 泽田谦也 蔡卫东 陈莲梅 宫路佳具 吴大维 梶冈润一 姜武','姜文','剧情 战争','http://v.youku.com/v_show/id_XMjU0ODkwNzY4.html?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwN18wMV8wMQ',NULL,NULL,'4',1,'p1181775734.jpg',NULL,NULL,NULL,NULL,NULL),(44278,'无间道','https://movie.douban.com/subject/1307914/','8.9',315036,'http://www.imdb.com/title/tt0338564',NULL,NULL,NULL,NULL,NULL,'','2003-09-05(中国大陆)','刘德华 梁朝伟 黄秋生 曾志伟 郑秀文 陈慧琳 陈冠希 余文乐 杜汶泽 林家栋 萧亚轩','刘伟强麦兆辉','悬疑 惊悚 犯罪','http://v.youku.com/v_show/id_XNTY0ODIwODQ0.html',NULL,NULL,'4',1,'p2233971046.jpg',NULL,NULL,NULL,NULL,NULL),(44279,'飞越疯人院','https://movie.douban.com/subject/1292224/','9.0',231583,'http://www.imdb.com/title/tt0073486',NULL,NULL,NULL,NULL,NULL,'','1975-11-21(美国)','杰克·尼科尔森 丹尼·德维托 克里斯托弗·洛伊德 路易丝·弗莱彻 特德·马克兰德 布拉德·道里夫','米洛斯·福尔曼','剧情','http://v.youku.com/v_show/id_XNDU2MjMyMjAw.html',NULL,NULL,'4',1,'p792238287.jpg',NULL,NULL,NULL,NULL,NULL),(44280,'大话西游之月光宝盒','https://movie.douban.com/subject/1299398/','8.9',318289,'http://www.imdb.com/title/tt0112778',NULL,NULL,NULL,NULL,NULL,'','2014-10-24(中国大陆)','周星驰 吴孟达 罗家英 蓝洁瑛 莫文蔚 江约诚 陆树铭 刘镇伟 朱茵 李健仁','刘镇伟','喜剧 动作 爱情 奇幻 冒险 古装','http://www.iqiyi.com/v_19rriflhue.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1280323646.jpg',NULL,NULL,NULL,NULL,NULL),(44281,'飞屋环游记','https://movie.douban.com/subject/2129039/','8.9',424200,'http://www.imdb.com/title/tt1049413',NULL,NULL,NULL,NULL,NULL,'','2009-08-04(中国大陆)','克里斯托弗·普卢默 约翰·拉岑贝格 爱德华·阿斯纳 Paul Eiding 乔丹·长井','彼特·道格特','剧情 喜剧 动画 奇幻 冒险','http://www.iqiyi.com/v_19rrifmej5.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p465583562.jpg',NULL,NULL,NULL,NULL,NULL),(44282,'怦然心动','https://movie.douban.com/subject/3319755/','8.9',428654,'http://www.imdb.com/title/tt0817177',NULL,NULL,NULL,NULL,NULL,'','2010-08-06(美国)','玛德琳·卡罗尔 卡兰·麦克奥利菲 瑞贝卡·德·莫妮 安东尼·爱德华兹 约翰·马奥尼 佩内洛普·安·米勒 艾丹·奎因 凯文·韦斯曼 摩根·莉莉','罗伯·莱纳','剧情 喜剧 爱情','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F151513%2Ff%2F1526157.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E6%80%A6%E7%84%B6%E5%BF%83%E5%8A%A8&sign=9f08c863024a843b2141d107d73d7d89',NULL,NULL,'4',1,'p663036666.jpg',NULL,NULL,NULL,NULL,NULL),(44283,'两杆大烟枪','https://movie.douban.com/subject/1293350/','9.0',232266,'http://www.imdb.com/title/tt0120735',NULL,NULL,NULL,NULL,NULL,'','1998-08-28(英国)','杰森·弗莱明 德克斯特·弗莱彻 尼克·莫兰 杰森·斯坦森 斯蒂文·麦金托什 斯汀 维尼·琼斯','盖·里奇','剧情 喜剧 犯罪','http://vip.iqiyi.com/20110901/018262a0a739aefa.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p792443418.jpg',NULL,NULL,NULL,NULL,NULL),(44284,'天空之城','https://movie.douban.com/subject/1291583/','9.0',271175,'http://www.imdb.com/title/tt0092067',NULL,NULL,NULL,NULL,NULL,'','1986-08-02','田中真弓 鹫尾真知子 初井言荣 寺田稔 常田富士男','宫崎骏','动画 奇幻 冒险',NULL,NULL,NULL,'4',1,'p1446261379.jpg',NULL,NULL,NULL,NULL,NULL),(44285,'十二怒汉','https://movie.douban.com/subject/1293182/','9.3',135352,'http://www.imdb.com/title/tt0050083',NULL,NULL,NULL,NULL,NULL,'','1957-04(美国)','亨利·方达 马丁·鲍尔萨姆 约翰·菲尔德 李·科布 E.G.马绍尔 杰克·克卢格曼  爱德华·宾斯 杰克·瓦尔登 约瑟夫·史威尼 埃德·贝格利 乔治·沃斯科维奇 罗伯特·韦伯','西德尼·吕美特','剧情','http://www.tudou.com/albumplay/_c0xQmeXhe4/jU9tNeavTE4.html',NULL,NULL,'4',1,'p2173577632.jpg',NULL,NULL,NULL,NULL,NULL),(44286,'罗马假日','https://movie.douban.com/subject/1293839/','8.9',322109,'http://www.imdb.com/title/tt0046250',NULL,NULL,NULL,NULL,NULL,'','1953-09-02(美国)','奥黛丽·赫本 格利高里·派克 埃迪·艾伯特 哈特利·鲍尔 哈考特·威廉姆斯','威廉·惠勒','剧情 喜剧 爱情','http://vip.iqiyi.com/20110728/b025d49adbe701a7.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p2173398296.jpg',NULL,NULL,NULL,NULL,NULL),(44287,'指环王3：王者无敌','https://movie.douban.com/subject/1291552/','9.1',240744,'http://www.lordoftherings.net/',NULL,NULL,NULL,NULL,NULL,'','2004-03-12(中国大陆)','维果·莫腾森 伊利亚·伍德 西恩·奥斯汀 丽芙·泰勒 伊恩·麦克莱恩 奥兰多·布鲁姆 凯特·布兰切特 米兰达·奥图 安迪·瑟金斯 雨果·维文 多米尼克·莫纳汉 比利·博伊德 马尔顿·索克斯 卡尔·厄本 克里斯托弗·李 约翰·瑞斯-戴维斯','彼得·杰克逊','剧情 动作 奇幻 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F101059%2Ff%2F1503392.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E6%8C%87%E7%8E%AF%E7%8E%8B3&sign=b36b086b49b9006a080ba52959fd440c',NULL,NULL,'4',1,'p1910825503.jpg',NULL,NULL,NULL,NULL,NULL),(44288,'触不可及','https://movie.douban.com/subject/6786002/','9.1',293852,'http://www.imdb.com/title/tt1675434',NULL,NULL,NULL,NULL,NULL,'','2011-11-02(法国)','弗朗索瓦·克鲁塞 奥玛·赛 安乐妮 奥黛丽·弗洛特 托马斯·索利维斯','奥利维·那卡什艾力克·托兰达','剧情 喜剧','http://www.iqiyi.com/v_19rrn52pn0.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1454259399.jpg',NULL,NULL,NULL,NULL,NULL),(44289,'楚门的世界','https://movie.douban.com/subject/1292064/','9.0',353833,'http://www.imdb.com/title/tt0120382',NULL,NULL,NULL,NULL,NULL,'','1998-06-05(美国)','金·凯瑞 劳拉·琳妮 艾德·哈里斯 诺亚·艾默里奇 娜塔莎· 麦克艾霍恩','彼得·威尔','剧情','http://vip.iqiyi.com/20110731/9923fe91c302a3ee.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p480420695.jpg',NULL,NULL,NULL,NULL,NULL),(44290,'当幸福来敲门','https://movie.douban.com/subject/1849031/','8.9',451416,'http://www.imdb.com/title/tt0454921',NULL,NULL,NULL,NULL,NULL,'','2008-01-17(中国大陆)','威尔·史密斯 贾登·史密斯 坦迪·牛顿 布莱恩·豪威  詹姆斯·凯伦 丹·卡斯泰兰尼塔 柯特·富勒 塔卡尤·费舍尔','加布里尔·穆奇诺','剧情 家庭 传记','http://vip.iqiyi.com/20110729/5e4687c83affa36e.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1312700628.jpg',NULL,NULL,NULL,NULL,NULL),(44291,'天堂电影院','https://movie.douban.com/subject/1291828/','9.1',259707,'http://www.imdb.com/title/tt0095765',NULL,NULL,NULL,NULL,NULL,'','1988-11-17(意大利)','安东娜拉·塔莉 恩佐·卡拉瓦勒 艾萨·丹尼埃利 里奥·故罗塔 马克·莱昂纳蒂 Pupella Maggio 阿格妮丝·那诺 里奥普尔多·特里斯特 萨瓦特利·卡西欧 塔诺·希玛罗萨 尼古拉·平托 Roberta Lena 尼诺·戴罗佐 雅克·贝汉 布丽吉特·佛西 菲利浦·诺瓦雷','朱塞佩·托纳多雷','剧情 爱情','http://www.iqiyi.com/v_19rrho6qm0.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910901025.jpg',NULL,NULL,NULL,NULL,NULL),(44292,'乱世佳人','https://movie.douban.com/subject/1300267/','9.2',226608,'http://www.imdb.com/title/tt0031381',NULL,NULL,NULL,NULL,NULL,'','1939-12-15(亚特兰大首映)','克拉克·盖博 费雯·丽 莱斯利·霍华德 奥利维娅·德哈维兰 托马斯·米切尔 芭芭拉·欧内尔 伊夫林·凯耶斯 安·卢瑟福德 乔治·里弗斯 弗莱德·克莱恩 海蒂·麦克丹尼尔斯 维克托·乔里 奥斯卡·波尔克 Butterfly McQueen 埃弗雷特·布朗 霍华德·C·希克曼 艾丽西亚·瑞特','维克多·弗莱明乔治·库克山姆·伍德','剧情 爱情 战争','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Ffilm.qq.com%2Fcover%2Fg%2Fgzdq4acw02m3ajs.html%3Fptag%3Diqiyi&site=%E8%85%BE%E8%AE%AF&name=%E4%B9%B1%E4%B8%96%E4%BD%B3%E4%BA%BA&sign=37a137ee4fd6f73e452caaec77ec30cf',NULL,NULL,'4',1,'p1963126880.jpg',NULL,NULL,NULL,NULL,NULL),(44293,'教父','https://movie.douban.com/subject/1291841/','9.2',281664,'http://www.imdb.com/title/tt0068646',NULL,NULL,NULL,NULL,NULL,'','1972-03-15(纽约首映)','马龙·白兰度 阿尔·帕西诺 詹姆斯·凯恩 罗伯特·杜瓦尔 黛安·基顿 约翰·凯泽尔 塔莉娅·夏尔','弗朗西斯·福特·科波拉','剧情 犯罪','http://vip.iqiyi.com/20110915/b738d6f0cc9b71a5.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910907404.jpg',NULL,NULL,NULL,NULL,NULL),(44294,'龙猫','https://movie.douban.com/subject/1291560/','9.1',345099,'http://www.imdb.com/title/tt0096283',NULL,NULL,NULL,NULL,NULL,'','1988-04-16(日本)','日高法子 坂本千夏 岛本须美 北林谷荣 高木均','宫崎骏','动画 奇幻','http://www.iqiyi.com/w_19rqseiebt.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910829638.jpg',NULL,NULL,NULL,NULL,NULL),(44295,'大话西游之大圣娶亲','https://movie.douban.com/subject/1292213/','9.1',367092,'http://www.imdb.com/title/tt0114996',NULL,NULL,NULL,NULL,NULL,'','2014-10-24(中国大陆)','周星驰 吴孟达 朱茵 蔡少芬 蓝洁瑛 莫文蔚 罗家英 刘镇伟 陆树铭 李健仁','刘镇伟','喜剧 动作 爱情 奇幻 冒险','http://www.iqiyi.com/lib/m_205791514.html',NULL,NULL,'4',1,'p648365452.jpg',NULL,NULL,NULL,NULL,NULL),(44296,'忠犬八公的故事','https://movie.douban.com/subject/3011091/','9.2',353540,'http://www.imdb.com/title/tt1028532',NULL,NULL,NULL,NULL,NULL,'','2009-06-13(西雅图电影节)','理查·基尔 萨拉·罗默尔 琼·艾伦 Robbie Sublett 艾瑞克·阿瓦利 田川洋行 杰森·亚历山大 罗伯特·卡普荣','莱塞·霍尔斯道姆','剧情','http://www.iqiyi.com/v_19rrmy5sf4.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p524964016.jpg',NULL,NULL,NULL,NULL,NULL),(44297,'放牛班的春天','https://movie.douban.com/subject/1291549/','9.2',371455,'http://www.imdb.com/title/tt0372824',NULL,NULL,NULL,NULL,NULL,'','2004-10-16(中国大陆)','杰拉尔·朱诺 弗朗西斯·贝尔兰德 凯德·麦拉德 Jean-Paul Bonnaire 玛丽·布奈尔 让-巴蒂斯特·莫尼耶 马科森斯·珀林 Grégory Gatignol Thomas Blumenthal Cyril Bernicot Simon Fargeot Théodule Carré-Cassaigne Philippe du Janerand Carole Weiss Erick Desmarestz 雅克·贝汉','克里斯托夫·巴拉蒂','剧情 音乐 儿童','http://www.iqiyi.com/dianying/20100418/n3559.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p1910824951.jpg',NULL,NULL,NULL,NULL,NULL),(44298,'三傻大闹宝莱坞','https://movie.douban.com/subject/3793023/','9.1',551001,'http://www.imdb.com/title/tt1187043',NULL,NULL,NULL,NULL,NULL,'','2011-12-08(中国大陆)','阿米尔·汗 卡琳娜·卡普尔 马达范 沙尔曼·乔希 奥米·瓦依达 波曼·伊拉妮 Mona Singh Rajeev Ravindranathan','拉吉库马尔·希拉尼','剧情 喜剧 爱情 歌舞','http://www.iqiyi.com/dianying/20120618/f0faf21d5f12f65e.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p579729551.jpg',NULL,NULL,NULL,NULL,NULL),(44299,'泰坦尼克号','https://movie.douban.com/subject/1292722/','9.1',536687,'http://www.titanicmovie.com',NULL,NULL,NULL,NULL,NULL,'','1998-04-03(中国大陆)','莱昂纳多·迪卡普里奥 凯特·温丝莱特 比利·赞恩 凯西·贝茨 弗兰西丝·费舍 格劳瑞亚·斯图尔特 苏茜·爱米斯 比尔·帕克斯顿 伯纳德·希尔 维克多·加博 伊万·斯图尔特 詹姆斯·卡梅隆','詹姆斯·卡梅隆','剧情 爱情 灾难','http://www.tudou.com/albumplay/LqKX5gIxUh0/cruEnBsvO-w.html',NULL,NULL,'4',1,'p457760035.jpg',NULL,NULL,NULL,NULL,NULL),(44300,'盗梦空间','https://movie.douban.com/subject/3541415/','9.2',643515,'http://www.imdb.com/title/tt1375666',NULL,NULL,NULL,NULL,NULL,'','2010-09-01(中国大陆)','莱昂纳多·迪卡普里奥 约瑟夫·高登-莱维特 艾伦·佩吉 渡边谦 汤姆·哈迪 迪利普·劳 玛丽昂·歌迪亚 基里安·墨菲 汤姆·贝伦杰 迈克尔·凯恩 卢卡斯·哈斯 皮特·波斯尔思韦特','克里斯托弗·诺兰','剧情 动作 科幻 悬疑 冒险','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fwww.hunantv.com%2Fv%2F3%2F110220%2Ff%2F1140643.html&site=%E8%8A%92%E6%9E%9Ctv&name=%E7%9B%97%E6%A2%A6%E7%A9%BA%E9%97%B4&sign=6590b485bbc7c31427d2acbd70a3e413',NULL,NULL,'4',1,'p513344864.jpg',NULL,NULL,NULL,NULL,NULL),(44301,'机器人总动员','https://movie.douban.com/subject/2131459/','9.3',422591,'http://www.pixar.com/features_films/WALLE',NULL,NULL,NULL,NULL,NULL,'','2008-06-27(美国)','本·贝尔特 艾丽莎·奈特 杰夫·格尔林 佛莱德·威拉特','安德鲁·斯坦顿','喜剧 爱情 科幻 动画 冒险','http://www.iqiyi.com/v_19rrifmfgn.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p449665982.jpg',NULL,NULL,NULL,NULL,NULL),(44302,'海上钢琴师','https://movie.douban.com/subject/1292001/','9.2',502214,'http://www.imdb.com/title/tt0120731',NULL,NULL,NULL,NULL,NULL,'','1998-10-28(意大利)','蒂姆·罗斯 普路特·泰勒·文斯 比尔·努恩 梅兰尼·蒂埃里 阿尔贝托·巴斯克斯','朱塞佩·托纳多雷','剧情 音乐','http://www.tudou.com/playlist/p/l11388676i68423767.html?tpa=dW5pb25faWQ9MTAyMjEzXzEwMDAwMV8wMV8wMQ',NULL,NULL,'4',1,'p511146957.jpg',NULL,NULL,NULL,NULL,NULL),(44303,'辛德勒的名单','https://movie.douban.com/subject/1295124/','9.4',307667,'http://www.imdb.com/title/tt0108052',NULL,NULL,NULL,NULL,NULL,'','1993-11-30(华盛顿首映)','连姆·尼森 本·金斯利 拉尔夫·费因斯 卡罗琳·古多尔 乔纳森·萨加尔 艾伯丝·戴维兹 马尔戈萨·格贝尔 马克·伊瓦涅 Béatrice Macola 安德烈·瑟韦林 Friedrich von Thun Krzysztof Luft Norbert Weisser','史蒂文·斯皮尔伯格','剧情 历史 战争','http://www.iqiyi.com/v_19rrhx0z4o.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p492406163.jpg',NULL,NULL,NULL,NULL,NULL),(44304,'千与千寻','https://movie.douban.com/subject/1291561/','9.2',526780,'http://www.imdb.com/title/tt0245429',NULL,NULL,NULL,NULL,NULL,'','2001-07-20(日本)','柊瑠美 入野自由 夏木真理 菅原文太 内藤刚志 神木隆之介 泽口靖子 我修院达也','宫崎骏','剧情 动画 奇幻','http://v.qq.com/page/8/A/m/8dyTWXK9SAm.html?ptag=iqiyi',NULL,NULL,'4',1,'p1910830216.jpg',NULL,NULL,NULL,NULL,NULL),(44305,'美丽人生','https://movie.douban.com/subject/1292063/','9.5',328820,'http://www.imdb.com/title/tt0118799',NULL,NULL,NULL,NULL,NULL,'','1997-12-20(意大利)','罗伯托·贝尼尼 尼可莱塔·布拉斯基 乔治·坎塔里尼 朱斯蒂诺·杜拉诺 塞尔吉奥·比尼·布斯特里克 玛丽莎·佩雷德斯 豪斯特·巴奇霍兹 朱利亚娜·洛约迪切 Amerigo Fontani Pietro De Silva Francesco Guzzo Raffaella Lebboroni Claudio Alfonsi Gil Baroni Massimo Bianchi 利迪娅·阿方西','罗伯托·贝尼尼','剧情 喜剧 爱情','http://www.iqiyi.com/dianying/20130402/ba8032dc4c59069c.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p510861873.jpg',NULL,NULL,NULL,NULL,NULL),(44306,'霸王别姬','https://movie.douban.com/subject/1291546/','9.4',480075,'http://www.imdb.com/title/tt0106332',NULL,NULL,NULL,NULL,NULL,'','1993-01-01(香港)','张国荣 张丰毅 巩俐 葛优 英达 蒋雯丽 吴大维 吕齐 雷汉 尹治 马明威 费振翔 智一桐 李春 赵海龙 李丹 童弟 沈慧芬','陈凯歌','剧情 爱情 同性','http://v.qq.com/page/h/9/e/h0017u1k19e.html?ptag=iqiyi',NULL,NULL,'4',1,'p1910813120.jpg',NULL,NULL,NULL,NULL,NULL),(44307,'阿甘正传','https://movie.douban.com/subject/1292720/','9.4',582273,'http://www.imdb.com/title/tt0109830',NULL,NULL,NULL,NULL,NULL,'','1994-06-23(洛杉矶首映)','汤姆·汉克斯 罗宾·怀特 加里·西尼斯 麦凯尔泰·威廉逊 莎莉·菲尔德 Michael Conner Humphreys 海利·乔·奥斯蒙','罗伯特·泽米吉斯','剧情 爱情','http://vip.iqiyi.com/20110805/d768b392b9ec5d37.html?fc=87451bff3f7d2f4a#vfrm=2-3-0-1',NULL,NULL,'4',1,'p510876377.jpg',NULL,NULL,NULL,NULL,NULL),(44308,'这个杀手不太冷','https://movie.douban.com/subject/1295644/','9.4',664293,'http://www.imdb.com/title/tt0110413',NULL,NULL,NULL,NULL,NULL,'','1994-09-14(法国)','让·雷诺 娜塔莉·波特曼 加里·奥德曼 丹尼·爱罗 麦温','吕克·贝松','剧情 动作 犯罪','http://www.iqiyi.com/v_19rrho32zk.html#vfrm=2-3-0-1',NULL,NULL,'4',1,'p511118051.jpg',NULL,NULL,NULL,NULL,NULL),(44309,'肖申克的救赎','https://movie.douban.com/subject/1292052/','9.6',694373,'http://www.imdb.com/title/tt0111161',NULL,NULL,NULL,NULL,NULL,'','1994-09-10(多伦多电影节)','蒂姆·罗宾斯 摩根·弗里曼 鲍勃·冈顿 威廉姆·赛德勒 克兰西·布朗 吉尔·贝罗斯 马克·罗斯顿 詹姆斯·惠特摩 杰弗里·德曼 拉里·布兰登伯格 尼尔·吉恩托利 布赖恩·利比 大卫·普罗瓦尔 约瑟夫·劳格诺 祖德·塞克利拉','弗兰克·德拉邦特','剧情 犯罪','http://so.iqiyi.com/outsitevip?url=http%3A%2F%2Fv.youku.com%2Fv_show%2Fid_XMjgwNDkwNzE2.html&site=%E4%BC%98%E9%85%B7&name=%E8%82%96%E7%94%B3%E5%85%8B%E7%9A%84%E6%95%91%E8%B5%8E&sign=438b6b17e41e4a027378bf1b8b0760ca',NULL,NULL,'4',1,'p480747492.jpg',NULL,NULL,NULL,NULL,NULL),(44310,'海豚湾','https://movie.douban.com/subject/3442220/','9.3',159504,'http://www.thecovemovie.com',NULL,NULL,NULL,NULL,NULL,'','2009-07-31(美国)',NULL,NULL,'纪录片','http://vod.kankan.com/v/49/49348/265715.shtml?id=731100',NULL,NULL,'4',1,'p455222172.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `movie_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviecoment`
--

DROP TABLE IF EXISTS `movie_moviecoment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_moviecoment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `comment` longtext NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_moviecoment_movie_id_696dffa1a4b3da2f_fk_movie_movie_id` (`movie_id`),
  KEY `movie_moviecoment_user_id_c1b43b320b26131_fk_auth_user_id` (`user_id`),
  CONSTRAINT `movie_moviecoment_movie_id_696dffa1a4b3da2f_fk_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie_movie` (`id`),
  CONSTRAINT `movie_moviecoment_user_id_c1b43b320b26131_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviecoment`
--

LOCK TABLES `movie_moviecoment` WRITE;
/*!40000 ALTER TABLE `movie_moviecoment` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_moviecoment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviehistory`
--

DROP TABLE IF EXISTS `movie_moviehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_moviehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `marked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_moviehistory_movie_id_726637eb5d857ea6_fk_movie_movie_id` (`movie_id`),
  KEY `movie_moviehistory_user_id_6190b20a2b4f5dfa_fk_auth_user_id` (`user_id`),
  CONSTRAINT `movie_moviehistory_movie_id_726637eb5d857ea6_fk_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie_movie` (`id`),
  CONSTRAINT `movie_moviehistory_user_id_6190b20a2b4f5dfa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviehistory`
--

LOCK TABLES `movie_moviehistory` WRITE;
/*!40000 ALTER TABLE `movie_moviehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_moviehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviespider`
--

DROP TABLE IF EXISTS `movie_moviespider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_moviespider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_tag` varchar(512) DEFAULT NULL,
  `moviename` varchar(64) NOT NULL,
  `moviedetailurl` varchar(512) DEFAULT NULL,
  `movieimgurl` varchar(512) DEFAULT NULL,
  `movieaddtime` datetime NOT NULL,
  `moviespiderornot` int(11) NOT NULL,
  `country` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviespider`
--

LOCK TABLES `movie_moviespider` WRITE;
/*!40000 ALTER TABLE `movie_moviespider` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_moviespider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_activity`
--

DROP TABLE IF EXISTS `questions_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `question` int(11) DEFAULT NULL,
  `answer` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_activity_user_id_14f0afefbb2c8a54_fk_auth_user_id` (`user_id`),
  CONSTRAINT `questions_activity_user_id_14f0afefbb2c8a54_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_activity`
--

LOCK TABLES `questions_activity` WRITE;
/*!40000 ALTER TABLE `questions_activity` DISABLE KEYS */;
INSERT INTO `questions_activity` VALUES (10,'U','2016-04-21 19:35:27',NULL,2,16),(11,'U','2016-04-21 19:35:28',NULL,3,16),(12,'F','2016-04-21 19:39:00',2,NULL,16),(13,'U','2016-04-22 08:52:46',NULL,1,16),(14,'F','2016-04-30 14:08:57',2,NULL,21),(15,'U','2016-04-30 14:09:13',NULL,4,21),(24,'D','2016-04-30 14:09:32',NULL,3,21),(27,'U','2016-04-30 14:09:37',NULL,2,21),(28,'F','2016-04-30 20:40:49',3,NULL,16),(29,'U','2016-04-30 20:40:59',NULL,5,16),(30,'F','2016-05-05 21:31:19',3,NULL,15),(31,'U','2016-05-07 16:15:04',NULL,5,1);
/*!40000 ALTER TABLE `questions_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_answer`
--

DROP TABLE IF EXISTS `questions_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answercontent` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `votes` int(11) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_answer_7aa0f6ee` (`question_id`),
  KEY `questions_answer_e8701ad4` (`user_id`),
  CONSTRAINT `questions_answer_user_id_3968459a682e4477_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `questions__question_id_4128ea4792c1d9f6_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_answer`
--

LOCK TABLES `questions_answer` WRITE;
/*!40000 ALTER TABLE `questions_answer` DISABLE KEYS */;
INSERT INTO `questions_answer` VALUES (1,'下载链接：http://www.xunlei.com','2016-04-19 19:59:27','2016-04-19 19:59:27',1,1,1,16),(2,'没有','2016-04-21 19:34:59','2016-04-21 19:34:59',2,1,2,16),(3,'别人有','2016-04-21 19:35:20','2016-04-21 19:35:20',0,0,2,16),(4,'真心不错啊','2016-04-30 14:09:09','2016-04-30 14:09:09',1,0,2,21),(5,'****哈哈哈不用啊','2016-04-30 20:40:47','2016-04-30 20:40:47',2,0,3,16);
/*!40000 ALTER TABLE `questions_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_notification`
--

DROP TABLE IF EXISTS `questions_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `notification_type` varchar(1) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_noti_answer_id_13b935c8cc08c677_fk_questions_answer_id` (`answer_id`),
  KEY `questions_notificat_from_user_id_e4a8f71f22ce500_fk_auth_user_id` (`from_user_id`),
  KEY `questions__question_id_1a141a3ab92f88f7_fk_questions_question_id` (`question_id`),
  KEY `questions_notificati_to_user_id_2af5eddff92aefe3_fk_auth_user_id` (`to_user_id`),
  CONSTRAINT `questions_notificati_to_user_id_2af5eddff92aefe3_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `questions_notificat_from_user_id_e4a8f71f22ce500_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `questions_noti_answer_id_13b935c8cc08c677_fk_questions_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `questions_answer` (`id`),
  CONSTRAINT `questions__question_id_1a141a3ab92f88f7_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_notification`
--

LOCK TABLES `questions_notification` WRITE;
/*!40000 ALTER TABLE `questions_notification` DISABLE KEYS */;
INSERT INTO `questions_notification` VALUES (1,'2016-04-30 14:08:57','F',0,NULL,21,2,16),(2,'2016-04-30 14:09:09','A',0,NULL,21,2,16),(3,'2016-05-05 21:31:19','F',0,NULL,15,3,16);
/*!40000 ALTER TABLE `questions_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_question`
--

DROP TABLE IF EXISTS `questions_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `favorites` int(11) NOT NULL,
  `has_accepted_answer` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_question_user_id_4fc8b845632ae4a7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `questions_question_user_id_4fc8b845632ae4a7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_question`
--

LOCK TABLES `questions_question` WRITE;
/*!40000 ALTER TABLE `questions_question` DISABLE KEYS */;
INSERT INTO `questions_question` VALUES (1,'寻找老手的下载资源','有谁有老手的下载资源的呀','2016-04-17 20:58:46','2016-04-17 20:58:46',0,1,16),(2,'寻找新世界的下载资源','有人有么','2016-04-21 19:01:08','2016-04-21 19:01:08',2,1,16),(3,'寻求天下第一的片源','有木有啊','2016-04-30 20:40:17','2016-04-30 20:40:17',2,0,16);
/*!40000 ALTER TABLE `questions_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_tag`
--

DROP TABLE IF EXISTS `questions_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_tag_tag_654989771ed538d3_uniq` (`tag`,`question_id`),
  KEY `questions_tag_tag_654989771ed538d3_idx` (`tag`,`question_id`),
  KEY `questions__question_id_3fcfda229b04f96d_fk_questions_question_id` (`question_id`),
  CONSTRAINT `questions__question_id_3fcfda229b04f96d_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_tag`
--

LOCK TABLES `questions_tag` WRITE;
/*!40000 ALTER TABLE `questions_tag` DISABLE KEYS */;
INSERT INTO `questions_tag` VALUES (4,'剧情',2),(5,'天下第一',3),(1,'老手',1),(2,'韩国',1),(3,'韩国',2);
/*!40000 ALTER TABLE `questions_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webchat_chatgroup`
--

DROP TABLE IF EXISTS `webchat_chatgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webchat_chatgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `memberlimits` int(11) NOT NULL,
  `founder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webchat_chatgr_founder_id_37b506e5605464d1_fk_webuser_webuser_id` (`founder_id`),
  CONSTRAINT `webchat_chatgr_founder_id_37b506e5605464d1_fk_webuser_webuser_id` FOREIGN KEY (`founder_id`) REFERENCES `webuser_webuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webchat_chatgroup`
--

LOCK TABLES `webchat_chatgroup` WRITE;
/*!40000 ALTER TABLE `webchat_chatgroup` DISABLE KEYS */;
INSERT INTO `webchat_chatgroup` VALUES (1,'Test',200,7);
/*!40000 ALTER TABLE `webchat_chatgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webchat_chatgroup_admins`
--

DROP TABLE IF EXISTS `webchat_chatgroup_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webchat_chatgroup_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chatgroup_id` int(11) NOT NULL,
  `webuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chatgroup_id` (`chatgroup_id`,`webuser_id`),
  KEY `webchat_chatgr_webuser_id_724c4375419c2725_fk_webuser_webuser_id` (`webuser_id`),
  CONSTRAINT `webchat_chatgr_webuser_id_724c4375419c2725_fk_webuser_webuser_id` FOREIGN KEY (`webuser_id`) REFERENCES `webuser_webuser` (`id`),
  CONSTRAINT `webchat_ch_chatgroup_id_51be52bd1df3e9a9_fk_webchat_chatgroup_id` FOREIGN KEY (`chatgroup_id`) REFERENCES `webchat_chatgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webchat_chatgroup_admins`
--

LOCK TABLES `webchat_chatgroup_admins` WRITE;
/*!40000 ALTER TABLE `webchat_chatgroup_admins` DISABLE KEYS */;
INSERT INTO `webchat_chatgroup_admins` VALUES (3,1,7),(1,1,8),(2,1,9);
/*!40000 ALTER TABLE `webchat_chatgroup_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webchat_chatgroup_members`
--

DROP TABLE IF EXISTS `webchat_chatgroup_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webchat_chatgroup_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chatgroup_id` int(11) NOT NULL,
  `webuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chatgroup_id` (`chatgroup_id`,`webuser_id`),
  KEY `webchat_chatgr_webuser_id_7742713a207bc563_fk_webuser_webuser_id` (`webuser_id`),
  CONSTRAINT `webchat_chatgr_webuser_id_7742713a207bc563_fk_webuser_webuser_id` FOREIGN KEY (`webuser_id`) REFERENCES `webuser_webuser` (`id`),
  CONSTRAINT `webchat_ch_chatgroup_id_56340e61d0785149_fk_webchat_chatgroup_id` FOREIGN KEY (`chatgroup_id`) REFERENCES `webchat_chatgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webchat_chatgroup_members`
--

LOCK TABLES `webchat_chatgroup_members` WRITE;
/*!40000 ALTER TABLE `webchat_chatgroup_members` DISABLE KEYS */;
INSERT INTO `webchat_chatgroup_members` VALUES (5,1,7),(1,1,8),(2,1,9),(3,1,10),(4,1,11);
/*!40000 ALTER TABLE `webchat_chatgroup_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuser_webuser`
--

DROP TABLE IF EXISTS `webuser_webuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuser_webuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `likestyle` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `registerday` datetime NOT NULL,
  `sex` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `online` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `webuser_webuser_user_id_4106f00f191812d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuser_webuser`
--

LOCK TABLES `webuser_webuser` WRITE;
/*!40000 ALTER TABLE `webuser_webuser` DISABLE KEYS */;
INSERT INTO `webuser_webuser` VALUES (6,'江西赣州','http://www.baidu.com','[u\'0\', u\'1\', u\'2\']','[u\'2\']','2016-05-05 21:05:08',0,15,0),(7,'江西赣州','http://www.baidu.com',NULL,'IT 狗','2016-04-26 19:45:05',0,16,0),(8,'江西赣州','http://www.baidu.com',NULL,'IT 狗','2016-04-15 20:21:49',1,17,0),(9,NULL,NULL,NULL,NULL,'2016-04-16 11:28:21',1,18,0),(10,NULL,NULL,NULL,NULL,'2016-04-16 11:29:51',1,19,0),(11,NULL,NULL,NULL,NULL,'2016-04-16 11:31:18',1,20,0),(12,'','',NULL,'','2016-04-29 09:11:39',1,21,0);
/*!40000 ALTER TABLE `webuser_webuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuser_webuser_friends`
--

DROP TABLE IF EXISTS `webuser_webuser_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuser_webuser_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_webuser_id` int(11) NOT NULL,
  `to_webuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_webuser_id` (`from_webuser_id`,`to_webuser_id`),
  KEY `webuser_web_to_webuser_id_3a25ea940e9d729f_fk_webuser_webuser_id` (`to_webuser_id`),
  CONSTRAINT `webuser_web_to_webuser_id_3a25ea940e9d729f_fk_webuser_webuser_id` FOREIGN KEY (`to_webuser_id`) REFERENCES `webuser_webuser` (`id`),
  CONSTRAINT `webuser_w_from_webuser_id_3dc540d2272b6200_fk_webuser_webuser_id` FOREIGN KEY (`from_webuser_id`) REFERENCES `webuser_webuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuser_webuser_friends`
--

LOCK TABLES `webuser_webuser_friends` WRITE;
/*!40000 ALTER TABLE `webuser_webuser_friends` DISABLE KEYS */;
INSERT INTO `webuser_webuser_friends` VALUES (11,6,7),(1,7,6),(2,7,7),(3,7,8),(4,7,9),(5,7,10),(6,7,11),(15,7,12),(7,8,7),(14,8,12),(8,9,7),(9,10,7),(10,11,7),(13,12,7),(12,12,8);
/*!40000 ALTER TABLE `webuser_webuser_friends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-18 14:00:56
