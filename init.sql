-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: cb_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_acl`
--

DROP TABLE IF EXISTS `auth_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_acl` (
  `acl_id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int unsigned NOT NULL,
  `context_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `context_id` int unsigned NOT NULL,
  PRIMARY KEY (`acl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_acl`
--

LOCK TABLES `auth_acl` WRITE;
/*!40000 ALTER TABLE `auth_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_acl_permissions`
--

DROP TABLE IF EXISTS `auth_acl_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_acl_permissions` (
  `acl_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  PRIMARY KEY (`acl_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `fk_acl_permissions_acl` FOREIGN KEY (`acl_id`) REFERENCES `auth_acl` (`acl_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_acl_permissions_permission` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`permission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_acl_permissions`
--

LOCK TABLES `auth_acl_permissions` WRITE;
/*!40000 ALTER TABLE `auth_acl_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_acl_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permissions`
--

DROP TABLE IF EXISTS `auth_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permissions` (
  `permission_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `uniq_permission_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permissions`
--

LOCK TABLES `auth_permissions` WRITE;
/*!40000 ALTER TABLE `auth_permissions` DISABLE KEYS */;
INSERT INTO `auth_permissions` VALUES (24,'book_recur.cancel_other_booking'),(22,'book_recur.create'),(23,'book_recur.edit_other_booking'),(26,'book_recur.set_department'),(25,'book_recur.set_user'),(28,'book_recur.view_other_notes'),(27,'book_recur.view_other_users'),(17,'book_single.cancel_other_booking'),(15,'book_single.create'),(16,'book_single.edit_other_booking'),(19,'book_single.set_department'),(18,'book_single.set_user'),(21,'book_single.view_other_notes'),(20,'book_single.view_other_users'),(14,'room.view'),(4,'setup.authentication'),(5,'setup.departments'),(6,'setup.roles'),(7,'setup.rooms'),(8,'setup.rooms_acl'),(9,'setup.schedules'),(10,'setup.sessions'),(11,'setup.settings'),(12,'setup.timetable_weeks'),(13,'setup.users'),(1,'system.bypass_maintenance_mode'),(2,'system.export_bookings'),(3,'system.view_all_sessions');
/*!40000 ALTER TABLE `auth_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_roles`
--

DROP TABLE IF EXISTS `auth_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_roles` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `max_active_bookings` int unsigned DEFAULT NULL,
  `range_min` int unsigned DEFAULT NULL,
  `range_max` int unsigned DEFAULT NULL,
  `recur_max_instances` int unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_roles`
--

LOCK TABLES `auth_roles` WRITE;
/*!40000 ALTER TABLE `auth_roles` DISABLE KEYS */;
INSERT INTO `auth_roles` VALUES (1,'Administrator','Administrator',NULL,NULL,NULL,NULL),(2,'Teacher','Teacher',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_roles_permissions`
--

DROP TABLE IF EXISTS `auth_roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_roles_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `fk_role_permission_permission` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_role_permission_role` FOREIGN KEY (`role_id`) REFERENCES `auth_roles` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_roles_permissions`
--

LOCK TABLES `auth_roles_permissions` WRITE;
/*!40000 ALTER TABLE `auth_roles_permissions` DISABLE KEYS */;
INSERT INTO `auth_roles_permissions` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(2,14),(1,15),(2,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(2,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(2,28);
/*!40000 ALTER TABLE `auth_roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int unsigned NOT NULL AUTO_INCREMENT,
  `repeat_id` int unsigned DEFAULT NULL,
  `session_id` int unsigned DEFAULT NULL,
  `period_id` int unsigned NOT NULL,
  `room_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '10',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_bookings_repeat` (`repeat_id`),
  KEY `fk_bookings_session` (`session_id`),
  KEY `fk_bookings_period` (`period_id`),
  KEY `fk_bookings_room` (`room_id`),
  KEY `fk_bookings_user` (`user_id`),
  KEY `fk_bookings_department` (`department_id`),
  KEY `fk_bookings_created_user` (`created_by`),
  KEY `fk_bookings_updated_user` (`updated_by`),
  CONSTRAINT `fk_bookings_created_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`period_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat` FOREIGN KEY (`repeat_id`) REFERENCES `bookings_repeat` (`repeat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_updated_user` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,NULL,1,1,1,2,NULL,'2026-07-08',15,'aula de sistemas embarcados sei la alguma aula, turma com 40 discentes',NULL,'2026-07-08 03:31:14',1,'2026-07-08 03:30:29',2,NULL,NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_repeat`
--

DROP TABLE IF EXISTS `bookings_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings_repeat` (
  `repeat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int unsigned DEFAULT NULL,
  `period_id` int unsigned NOT NULL,
  `room_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `week_id` int unsigned NOT NULL,
  `weekday` tinyint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '10',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`repeat_id`),
  KEY `fk_bookings_repeat_session` (`session_id`),
  KEY `fk_bookings_repeat_period` (`period_id`),
  KEY `fk_bookings_repeat_room` (`room_id`),
  KEY `fk_bookings_repeat_user` (`user_id`),
  KEY `fk_bookings_repeat_department` (`department_id`),
  KEY `fk_bookings_repeat_week` (`week_id`),
  KEY `fk_bookings_repeat_created_user` (`created_by`),
  KEY `fk_bookings_repeat_updated_user` (`updated_by`),
  CONSTRAINT `fk_bookings_repeat_created_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`period_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_updated_user` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_repeat_week` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`week_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_repeat`
--

LOCK TABLES `bookings_repeat` WRITE;
/*!40000 ALTER TABLE `bookings_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dates` (
  `date` date NOT NULL,
  `weekday` tinyint(1) NOT NULL,
  `session_id` int unsigned DEFAULT NULL,
  `week_id` int unsigned DEFAULT NULL,
  `holiday_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES ('2025-09-01',1,1,1,NULL),('2025-09-02',2,1,1,NULL),('2025-09-03',3,1,1,NULL),('2025-09-04',4,1,1,NULL),('2025-09-05',5,1,1,NULL),('2025-09-06',6,1,1,NULL),('2025-09-07',7,1,1,NULL),('2025-09-08',1,1,1,NULL),('2025-09-09',2,1,1,NULL),('2025-09-10',3,1,1,NULL),('2025-09-11',4,1,1,NULL),('2025-09-12',5,1,1,NULL),('2025-09-13',6,1,1,NULL),('2025-09-14',7,1,1,NULL),('2025-09-15',1,1,1,NULL),('2025-09-16',2,1,1,NULL),('2025-09-17',3,1,1,NULL),('2025-09-18',4,1,1,NULL),('2025-09-19',5,1,1,NULL),('2025-09-20',6,1,1,NULL),('2025-09-21',7,1,1,NULL),('2025-09-22',1,1,1,NULL),('2025-09-23',2,1,1,NULL),('2025-09-24',3,1,1,NULL),('2025-09-25',4,1,1,NULL),('2025-09-26',5,1,1,NULL),('2025-09-27',6,1,1,NULL),('2025-09-28',7,1,1,NULL),('2025-09-29',1,1,1,NULL),('2025-09-30',2,1,1,NULL),('2025-10-01',3,1,1,NULL),('2025-10-02',4,1,1,NULL),('2025-10-03',5,1,1,NULL),('2025-10-04',6,1,1,NULL),('2025-10-05',7,1,1,NULL),('2025-10-06',1,1,1,NULL),('2025-10-07',2,1,1,NULL),('2025-10-08',3,1,1,NULL),('2025-10-09',4,1,1,NULL),('2025-10-10',5,1,1,NULL),('2025-10-11',6,1,1,NULL),('2025-10-12',7,1,1,NULL),('2025-10-13',1,1,1,NULL),('2025-10-14',2,1,1,NULL),('2025-10-15',3,1,1,NULL),('2025-10-16',4,1,1,NULL),('2025-10-17',5,1,1,NULL),('2025-10-18',6,1,1,NULL),('2025-10-19',7,1,1,NULL),('2025-10-20',1,1,1,NULL),('2025-10-21',2,1,1,NULL),('2025-10-22',3,1,1,NULL),('2025-10-23',4,1,1,NULL),('2025-10-24',5,1,1,NULL),('2025-10-25',6,1,1,NULL),('2025-10-26',7,1,1,NULL),('2025-10-27',1,1,1,NULL),('2025-10-28',2,1,1,NULL),('2025-10-29',3,1,1,NULL),('2025-10-30',4,1,1,NULL),('2025-10-31',5,1,1,NULL),('2025-11-01',6,1,1,NULL),('2025-11-02',7,1,1,NULL),('2025-11-03',1,1,1,NULL),('2025-11-04',2,1,1,NULL),('2025-11-05',3,1,1,NULL),('2025-11-06',4,1,1,NULL),('2025-11-07',5,1,1,NULL),('2025-11-08',6,1,1,NULL),('2025-11-09',7,1,1,NULL),('2025-11-10',1,1,1,NULL),('2025-11-11',2,1,1,NULL),('2025-11-12',3,1,1,NULL),('2025-11-13',4,1,1,NULL),('2025-11-14',5,1,1,NULL),('2025-11-15',6,1,1,NULL),('2025-11-16',7,1,1,NULL),('2025-11-17',1,1,1,NULL),('2025-11-18',2,1,1,NULL),('2025-11-19',3,1,1,NULL),('2025-11-20',4,1,1,NULL),('2025-11-21',5,1,1,NULL),('2025-11-22',6,1,1,NULL),('2025-11-23',7,1,1,NULL),('2025-11-24',1,1,1,NULL),('2025-11-25',2,1,1,NULL),('2025-11-26',3,1,1,NULL),('2025-11-27',4,1,1,NULL),('2025-11-28',5,1,1,NULL),('2025-11-29',6,1,1,NULL),('2025-11-30',7,1,1,NULL),('2025-12-01',1,1,1,NULL),('2025-12-02',2,1,1,NULL),('2025-12-03',3,1,1,NULL),('2025-12-04',4,1,1,NULL),('2025-12-05',5,1,1,NULL),('2025-12-06',6,1,1,NULL),('2025-12-07',7,1,1,NULL),('2025-12-08',1,1,1,NULL),('2025-12-09',2,1,1,NULL),('2025-12-10',3,1,1,NULL),('2025-12-11',4,1,1,NULL),('2025-12-12',5,1,1,NULL),('2025-12-13',6,1,1,NULL),('2025-12-14',7,1,1,NULL),('2025-12-15',1,1,1,NULL),('2025-12-16',2,1,1,NULL),('2025-12-17',3,1,1,NULL),('2025-12-18',4,1,1,NULL),('2025-12-19',5,1,1,NULL),('2025-12-20',6,1,1,NULL),('2025-12-21',7,1,1,NULL),('2025-12-22',1,1,1,NULL),('2025-12-23',2,1,1,NULL),('2025-12-24',3,1,1,NULL),('2025-12-25',4,1,1,NULL),('2025-12-26',5,1,1,NULL),('2025-12-27',6,1,1,NULL),('2025-12-28',7,1,1,NULL),('2025-12-29',1,1,1,NULL),('2025-12-30',2,1,1,NULL),('2025-12-31',3,1,1,NULL),('2026-01-01',4,1,1,NULL),('2026-01-02',5,1,1,NULL),('2026-01-03',6,1,1,NULL),('2026-01-04',7,1,1,NULL),('2026-01-05',1,1,1,NULL),('2026-01-06',2,1,1,NULL),('2026-01-07',3,1,1,NULL),('2026-01-08',4,1,1,NULL),('2026-01-09',5,1,1,NULL),('2026-01-10',6,1,1,NULL),('2026-01-11',7,1,1,NULL),('2026-01-12',1,1,1,NULL),('2026-01-13',2,1,1,NULL),('2026-01-14',3,1,1,NULL),('2026-01-15',4,1,1,NULL),('2026-01-16',5,1,1,NULL),('2026-01-17',6,1,1,NULL),('2026-01-18',7,1,1,NULL),('2026-01-19',1,1,1,NULL),('2026-01-20',2,1,1,NULL),('2026-01-21',3,1,1,NULL),('2026-01-22',4,1,1,NULL),('2026-01-23',5,1,1,NULL),('2026-01-24',6,1,1,NULL),('2026-01-25',7,1,1,NULL),('2026-01-26',1,1,1,NULL),('2026-01-27',2,1,1,NULL),('2026-01-28',3,1,1,NULL),('2026-01-29',4,1,1,NULL),('2026-01-30',5,1,1,NULL),('2026-01-31',6,1,1,NULL),('2026-02-01',7,1,1,NULL),('2026-02-02',1,1,1,NULL),('2026-02-03',2,1,1,NULL),('2026-02-04',3,1,1,NULL),('2026-02-05',4,1,1,NULL),('2026-02-06',5,1,1,NULL),('2026-02-07',6,1,1,NULL),('2026-02-08',7,1,1,NULL),('2026-02-09',1,1,1,NULL),('2026-02-10',2,1,1,NULL),('2026-02-11',3,1,1,NULL),('2026-02-12',4,1,1,NULL),('2026-02-13',5,1,1,NULL),('2026-02-14',6,1,1,NULL),('2026-02-15',7,1,1,NULL),('2026-02-16',1,1,1,NULL),('2026-02-17',2,1,1,NULL),('2026-02-18',3,1,1,NULL),('2026-02-19',4,1,1,NULL),('2026-02-20',5,1,1,NULL),('2026-02-21',6,1,1,NULL),('2026-02-22',7,1,1,NULL),('2026-02-23',1,1,1,NULL),('2026-02-24',2,1,1,NULL),('2026-02-25',3,1,1,NULL),('2026-02-26',4,1,1,NULL),('2026-02-27',5,1,1,NULL),('2026-02-28',6,1,1,NULL),('2026-03-01',7,1,1,NULL),('2026-03-02',1,1,1,NULL),('2026-03-03',2,1,1,NULL),('2026-03-04',3,1,1,NULL),('2026-03-05',4,1,1,NULL),('2026-03-06',5,1,1,NULL),('2026-03-07',6,1,1,NULL),('2026-03-08',7,1,1,NULL),('2026-03-09',1,1,1,NULL),('2026-03-10',2,1,1,NULL),('2026-03-11',3,1,1,NULL),('2026-03-12',4,1,1,NULL),('2026-03-13',5,1,1,NULL),('2026-03-14',6,1,1,NULL),('2026-03-15',7,1,1,NULL),('2026-03-16',1,1,1,NULL),('2026-03-17',2,1,1,NULL),('2026-03-18',3,1,1,NULL),('2026-03-19',4,1,1,NULL),('2026-03-20',5,1,1,NULL),('2026-03-21',6,1,1,NULL),('2026-03-22',7,1,1,NULL),('2026-03-23',1,1,1,NULL),('2026-03-24',2,1,1,NULL),('2026-03-25',3,1,1,NULL),('2026-03-26',4,1,1,NULL),('2026-03-27',5,1,1,NULL),('2026-03-28',6,1,1,NULL),('2026-03-29',7,1,1,NULL),('2026-03-30',1,1,1,NULL),('2026-03-31',2,1,1,NULL),('2026-04-01',3,1,1,NULL),('2026-04-02',4,1,1,NULL),('2026-04-03',5,1,1,NULL),('2026-04-04',6,1,1,NULL),('2026-04-05',7,1,1,NULL),('2026-04-06',1,1,1,NULL),('2026-04-07',2,1,1,NULL),('2026-04-08',3,1,1,NULL),('2026-04-09',4,1,1,NULL),('2026-04-10',5,1,1,NULL),('2026-04-11',6,1,1,NULL),('2026-04-12',7,1,1,NULL),('2026-04-13',1,1,1,NULL),('2026-04-14',2,1,1,NULL),('2026-04-15',3,1,1,NULL),('2026-04-16',4,1,1,NULL),('2026-04-17',5,1,1,NULL),('2026-04-18',6,1,1,NULL),('2026-04-19',7,1,1,NULL),('2026-04-20',1,1,1,NULL),('2026-04-21',2,1,1,NULL),('2026-04-22',3,1,1,NULL),('2026-04-23',4,1,1,NULL),('2026-04-24',5,1,1,NULL),('2026-04-25',6,1,1,NULL),('2026-04-26',7,1,1,NULL),('2026-04-27',1,1,1,NULL),('2026-04-28',2,1,1,NULL),('2026-04-29',3,1,1,NULL),('2026-04-30',4,1,1,NULL),('2026-05-01',5,1,1,NULL),('2026-05-02',6,1,1,NULL),('2026-05-03',7,1,1,NULL),('2026-05-04',1,1,1,NULL),('2026-05-05',2,1,1,NULL),('2026-05-06',3,1,1,NULL),('2026-05-07',4,1,1,NULL),('2026-05-08',5,1,1,NULL),('2026-05-09',6,1,1,NULL),('2026-05-10',7,1,1,NULL),('2026-05-11',1,1,1,NULL),('2026-05-12',2,1,1,NULL),('2026-05-13',3,1,1,NULL),('2026-05-14',4,1,1,NULL),('2026-05-15',5,1,1,NULL),('2026-05-16',6,1,1,NULL),('2026-05-17',7,1,1,NULL),('2026-05-18',1,1,1,NULL),('2026-05-19',2,1,1,NULL),('2026-05-20',3,1,1,NULL),('2026-05-21',4,1,1,NULL),('2026-05-22',5,1,1,NULL),('2026-05-23',6,1,1,NULL),('2026-05-24',7,1,1,NULL),('2026-05-25',1,1,1,NULL),('2026-05-26',2,1,1,NULL),('2026-05-27',3,1,1,NULL),('2026-05-28',4,1,1,NULL),('2026-05-29',5,1,1,NULL),('2026-05-30',6,1,1,NULL),('2026-05-31',7,1,1,NULL),('2026-06-01',1,1,1,NULL),('2026-06-02',2,1,1,NULL),('2026-06-03',3,1,1,NULL),('2026-06-04',4,1,1,NULL),('2026-06-05',5,1,1,NULL),('2026-06-06',6,1,1,NULL),('2026-06-07',7,1,1,NULL),('2026-06-08',1,1,1,NULL),('2026-06-09',2,1,1,NULL),('2026-06-10',3,1,1,NULL),('2026-06-11',4,1,1,NULL),('2026-06-12',5,1,1,NULL),('2026-06-13',6,1,1,NULL),('2026-06-14',7,1,1,NULL),('2026-06-15',1,1,1,NULL),('2026-06-16',2,1,1,NULL),('2026-06-17',3,1,1,NULL),('2026-06-18',4,1,1,NULL),('2026-06-19',5,1,1,NULL),('2026-06-20',6,1,1,NULL),('2026-06-21',7,1,1,NULL),('2026-06-22',1,1,1,NULL),('2026-06-23',2,1,1,NULL),('2026-06-24',3,1,1,NULL),('2026-06-25',4,1,1,NULL),('2026-06-26',5,1,1,NULL),('2026-06-27',6,1,1,NULL),('2026-06-28',7,1,1,NULL),('2026-06-29',1,1,1,NULL),('2026-06-30',2,1,1,NULL),('2026-07-01',3,1,1,NULL),('2026-07-02',4,1,1,NULL),('2026-07-03',5,1,1,NULL),('2026-07-04',6,1,1,NULL),('2026-07-05',7,1,1,NULL),('2026-07-06',1,1,1,NULL),('2026-07-07',2,1,1,NULL),('2026-07-08',3,1,1,NULL),('2026-07-09',4,1,1,NULL),('2026-07-10',5,1,1,NULL),('2026-07-11',6,1,1,NULL),('2026-07-12',7,1,1,NULL),('2026-07-13',1,1,1,NULL),('2026-07-14',2,1,1,NULL),('2026-07-15',3,1,1,NULL),('2026-07-16',4,1,1,NULL),('2026-07-17',5,1,1,NULL),('2026-07-18',6,1,1,NULL),('2026-07-19',7,1,1,NULL),('2026-07-20',1,1,1,NULL),('2026-07-21',2,1,1,NULL),('2026-07-22',3,1,1,NULL),('2026-07-23',4,1,1,NULL),('2026-07-24',5,1,1,NULL),('2026-07-25',6,1,1,NULL),('2026-07-26',7,1,1,NULL),('2026-07-27',1,1,1,NULL),('2026-07-28',2,1,1,NULL),('2026-07-29',3,1,1,NULL),('2026-07-30',4,1,1,NULL),('2026-07-31',5,1,1,NULL);
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `holiday_id` int unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int unsigned DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lang` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'english',
  `set` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_set` (`language`,`set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang`
--

LOCK TABLES `lang` WRITE;
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (20250421122200);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_bookings`
--

DROP TABLE IF EXISTS `multi_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multi_bookings` (
  `mb_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `week_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_user_id` int unsigned DEFAULT NULL,
  `booking_department_id` int unsigned DEFAULT NULL,
  `booking_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mb_id`),
  KEY `fk_mb_user` (`user_id`),
  CONSTRAINT `fk_mb_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_bookings`
--

LOCK TABLES `multi_bookings` WRITE;
/*!40000 ALTER TABLE `multi_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `multi_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_bookings_slots`
--

DROP TABLE IF EXISTS `multi_bookings_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multi_bookings_slots` (
  `mbs_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mb_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `period_id` int unsigned NOT NULL,
  `room_id` int unsigned NOT NULL,
  PRIMARY KEY (`mbs_id`),
  KEY `fk_mbs_mb` (`mb_id`),
  KEY `fk_mbs_period` (`period_id`),
  KEY `fk_mbs_room` (`room_id`),
  CONSTRAINT `fk_mbs_mb` FOREIGN KEY (`mb_id`) REFERENCES `multi_bookings` (`mb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mbs_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`period_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mbs_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_bookings_slots`
--

LOCK TABLES `multi_bookings_slots` WRITE;
/*!40000 ALTER TABLE `multi_bookings_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `multi_bookings_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periods` (
  `period_id` int unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int unsigned NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookable` tinyint unsigned NOT NULL DEFAULT '0',
  `day_1` tinyint unsigned DEFAULT '0',
  `day_2` tinyint unsigned DEFAULT '0',
  `day_3` tinyint unsigned DEFAULT '0',
  `day_4` tinyint unsigned DEFAULT '0',
  `day_5` tinyint unsigned DEFAULT '0',
  `day_6` tinyint unsigned DEFAULT '0',
  `day_7` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`period_id`),
  KEY `fk_periods_schedule` (`schedule_id`),
  CONSTRAINT `fk_periods_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` VALUES (1,2,'08:00:00','12:00:00','Manhã',1,1,1,1,1,1,1,0),(2,2,'14:00:00','18:00:00','Tarde',1,1,1,1,1,1,1,0),(3,2,'18:00:00','22:00:00','Noite',1,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_groups`
--

DROP TABLE IF EXISTS `room_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_groups` (
  `room_group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `pos` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`room_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_groups`
--

LOCK TABLES `room_groups` WRITE;
/*!40000 ALTER TABLE `room_groups` DISABLE KEYS */;
INSERT INTO `room_groups` VALUES (1,0,'All',NULL),(2,0,'IEG','instituto de engenharia e geofisica');
/*!40000 ALTER TABLE `room_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomfields`
--

DROP TABLE IF EXISTS `roomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomfields` (
  `field_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomfields`
--

LOCK TABLES `roomfields` WRITE;
/*!40000 ALTER TABLE `roomfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomoptions`
--

DROP TABLE IF EXISTS `roomoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomoptions` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int unsigned NOT NULL,
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomoptions`
--

LOCK TABLES `roomoptions` WRITE;
/*!40000 ALTER TABLE `roomoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int unsigned NOT NULL AUTO_INCREMENT,
  `room_group_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookable` tinyint unsigned NOT NULL DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_rooms_group` (`room_group_id`),
  CONSTRAINT `fk_rooms_group` FOREIGN KEY (`room_group_id`) REFERENCES `room_groups` (`room_group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,2,NULL,'Labin','BMT2, 145',1,NULL,'Laboratorio de Informática para 45 discentes',NULL,0),(2,2,NULL,'Labin','NSA BLOCO A, 208',1,NULL,'',NULL,0);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomvalues`
--

DROP TABLE IF EXISTS `roomvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomvalues` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int unsigned NOT NULL,
  `field_id` int unsigned NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomvalues`
--

LOCK TABLES `roomvalues` WRITE;
/*!40000 ALTER TABLE `roomvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `schedule_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'periods',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'periods','Periods',NULL),(2,'periods','labins','horario em que os labins estao disponiveis para reserva\r\n');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_schedules`
--

DROP TABLE IF EXISTS `session_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_schedules` (
  `session_id` int unsigned NOT NULL,
  `room_group_id` int unsigned NOT NULL,
  `schedule_id` int unsigned NOT NULL,
  PRIMARY KEY (`session_id`,`room_group_id`),
  KEY `fk_session_schedules_room_group` (`room_group_id`),
  KEY `fk_session_schedules_schedule` (`schedule_id`),
  CONSTRAINT `fk_session_schedules_room_group` FOREIGN KEY (`room_group_id`) REFERENCES `room_groups` (`room_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_session_schedules_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_session_schedules_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_schedules`
--

LOCK TABLES `session_schedules` WRITE;
/*!40000 ALTER TABLE `session_schedules` DISABLE KEYS */;
INSERT INTO `session_schedules` VALUES (1,1,2),(1,2,2);
/*!40000 ALTER TABLE `session_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` int unsigned NOT NULL AUTO_INCREMENT,
  `default_schedule_id` int unsigned DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `is_current` tinyint unsigned NOT NULL DEFAULT '0',
  `is_selectable` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `fk_sessions_default_schedule` (`default_schedule_id`),
  CONSTRAINT `fk_sessions_default_schedule` FOREIGN KEY (`default_schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'2025 - 2026','2025-09-01','2026-07-31',1,1);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `group_name` (`group`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('auth','ldap_attr_displayname','cn'),('auth','ldap_attr_email','mail'),('auth','ldap_attr_firstname',''),('auth','ldap_attr_lastname',''),('auth','ldap_base_dn','dc=example,dc=com'),('auth','ldap_bind_dn_format','uid=:user,dc=example,dc=com'),('auth','ldap_create_users','1'),('auth','ldap_enabled','0'),('auth','ldap_ignore_cert','1'),('auth','ldap_port','389'),('auth','ldap_search_filter','(&(uid=:user)(objectClass=person))'),('auth','ldap_server',''),('auth','ldap_use_tls','0'),('auth','ldap_user_attr','uid'),('auth','ldap_version','3'),('changelog','changelog_ts','1767961367'),('changelog','refreshed_at','1783477877'),('crbs','colour','468ED8'),('crbs','d_columns','days'),('crbs','displaytype','room'),('crbs','grid_highlight','1'),('crbs','login_message_enabled','0'),('crbs','login_message_text',''),('crbs','logo',''),('crbs','maintenance_mode','0'),('crbs','maintenance_mode_message',''),('crbs','name','Universidade Federal do Oeste do Pará'),('crbs','session_auto_set_current_ts','1783477088'),('crbs','timezone','Europe/London'),('crbs','website',''),('dates','pattern_long',''),('dates','pattern_time',''),('dates','pattern_weekday','');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `enabled` tinyint unsigned NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `force_password_reset` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,NULL,'dayan',NULL,NULL,NULL,'$2y$12$XFwqTeBbiprZn65rkxK8muixfdOfjrrSSjsSHEGXCaQDYVvg/Ba56',NULL,NULL,'2026-07-08 03:30:49',1,NULL,0),(2,2,NULL,'gilvollp','gilberto','vollpe',NULL,'$2y$12$.cu6dxUkfLDFie2O85NKNuw714HANtr8aI8CK2fFRQ1hqNWnMDM2a','gvollpe',NULL,'2026-07-08 03:29:32',1,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_constraints`
--

DROP TABLE IF EXISTS `users_constraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_constraints` (
  `user_id` int unsigned NOT NULL,
  `max_active_bookings_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'R',
  `max_active_bookings_value` int unsigned DEFAULT NULL,
  `range_min_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'R',
  `range_min_value` int unsigned DEFAULT NULL,
  `range_max_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'R',
  `range_max_value` int unsigned DEFAULT NULL,
  `recur_max_instances_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'R',
  `recur_max_instances_value` int unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_constraints`
--

LOCK TABLES `users_constraints` WRITE;
/*!40000 ALTER TABLE `users_constraints` DISABLE KEYS */;
INSERT INTO `users_constraints` VALUES (1,'R',NULL,'R',NULL,'R',NULL,'R',NULL),(2,'R',NULL,'R',NULL,'R',NULL,'R',NULL);
/*!40000 ALTER TABLE `users_constraints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekdates`
--

DROP TABLE IF EXISTS `weekdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weekdates` (
  `week_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  KEY `week_id` (`week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekdates`
--

LOCK TABLES `weekdates` WRITE;
/*!40000 ALTER TABLE `weekdates` DISABLE KEYS */;
/*!40000 ALTER TABLE `weekdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeks`
--

DROP TABLE IF EXISTS `weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weeks` (
  `week_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fgcol` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgcol` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`week_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeks`
--

LOCK TABLES `weeks` WRITE;
/*!40000 ALTER TABLE `weeks` DISABLE KEYS */;
INSERT INTO `weeks` VALUES (1,'Timetable','','71AAE3',NULL);
/*!40000 ALTER TABLE `weeks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-08 20:28:34
