-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: school_management_system
-- ------------------------------------------------------
-- Server version	8.0.27

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
--Database creation
--

DROP DATABASE IF EXISTS school_management_system;
CREATE DATABASE IF NOT EXISTS school_management_system;
USE school_management_system;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `announcement_id` int NOT NULL,
  `details` varchar(255) NOT NULL,
  `publish_date` date NOT NULL,
  `publisher_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_name` varchar(255) NOT NULL,
  `teacher_reg_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`class_name`),
  KEY `FKbtxh6jq4yh60jhy2gtokgb078` (`teacher_reg_no`),
  CONSTRAINT `FKbtxh6jq4yh60jhy2gtokgb078` FOREIGN KEY (`teacher_reg_no`) REFERENCES `teacher` (`teacher_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_code` varchar(255) NOT NULL,
  `exam_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exam_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian` (
  `guardian_id` varchar(255) NOT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_password` varchar(255) DEFAULT NULL,
  `guardian_phone_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guardian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guardian_phone`
--

DROP TABLE IF EXISTS `guardian_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_phone` (
  `guardian_id` varchar(255) NOT NULL,
  `guardian_phone_no` varchar(255) NOT NULL,
  PRIMARY KEY (`guardian_id`,`guardian_phone_no`),
  CONSTRAINT `FK29r4ye26mao4irsa299yo2244` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `exam_code` varchar(255) NOT NULL,
  `student_admission_no` varchar(255) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `marks` float DEFAULT NULL,
  PRIMARY KEY (`exam_code`,`student_admission_no`,`subject_code`),
  KEY `FK8ytykn9am9p7w1py2bj7i660l` (`student_admission_no`),
  KEY `FKjnc40f5aqabqf18qhpwjukw2b` (`subject_code`),
  CONSTRAINT `FK25ot1oj90wvwny5cnjs95sv32` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`),
  CONSTRAINT `FK8ytykn9am9p7w1py2bj7i660l` FOREIGN KEY (`student_admission_no`) REFERENCES `student` (`student_admission_no`),
  CONSTRAINT `FKjnc40f5aqabqf18qhpwjukw2b` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `non_academic`
--

DROP TABLE IF EXISTS `non_academic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_academic` (
  `non_academic_reg_no` varchar(255) NOT NULL,
  PRIMARY KEY (`non_academic_reg_no`),
  CONSTRAINT `FKa3gvbiuu0roomas8hhnawight` FOREIGN KEY (`non_academic_reg_no`) REFERENCES `staff` (`staff_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_reg_no` varchar(255) NOT NULL,
  `staff_basic_salary` float DEFAULT NULL,
  `staff_date_of_birth` date DEFAULT NULL,
  `staff_email` varchar(255) DEFAULT NULL,
  `staff_gender` varchar(255) DEFAULT NULL,
  `staff_nic` varchar(255) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_nationality` varchar(255) DEFAULT NULL,
  `staff_password` varchar(255) DEFAULT NULL,
  `staff_position` varchar(255) DEFAULT NULL,
  `staff_religion` varchar(255) DEFAULT NULL,
  `staff_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff_leave`
--

DROP TABLE IF EXISTS `staff_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_leave` (
  `leave_id` int NOT NULL,
  `leave_end_date` date DEFAULT NULL,
  `leave_start_date` date DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `staff_reg_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `FK9avbd4knh0acduewmtw1wam8l` (`staff_reg_no`),
  CONSTRAINT `FK9avbd4knh0acduewmtw1wam8l` FOREIGN KEY (`staff_reg_no`) REFERENCES `staff` (`staff_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_admission_no` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `student_address` varchar(255) DEFAULT NULL,
  `student_class_name` varchar(255) DEFAULT NULL,
  `student_date_of_birth` date DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_nationality` varchar(255) DEFAULT NULL,
  `student_password` varchar(255) DEFAULT NULL,
  `student_religion` varchar(255) DEFAULT NULL,
  `guardian_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_admission_no`),
  KEY `FKhhlsorcfy5xbiu8iwqxwccb6i` (`guardian_id`),
  CONSTRAINT `FKhhlsorcfy5xbiu8iwqxwccb6i` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_subject`
--

DROP TABLE IF EXISTS `student_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_subject` (
  `student_admission_no` varchar(255) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  KEY `FKfp0ct4bl78p0j52es99pbywbf` (`subject_code`),
  KEY `FKigo5s7fb9n9kquh6csq7bs9iw` (`student_admission_no`),
  CONSTRAINT `FKfp0ct4bl78p0j52es99pbywbf` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`),
  CONSTRAINT `FKigo5s7fb9n9kquh6csq7bs9iw` FOREIGN KEY (`student_admission_no`) REFERENCES `student` (`student_admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_users`
--

DROP TABLE IF EXISTS `system_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_users` (
  `email` varchar(255) NOT NULL,
  `aprove_status` int DEFAULT NULL,
  `contact_no` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `reason_to_join` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_reg_no` varchar(255) NOT NULL,
  PRIMARY KEY (`teacher_reg_no`),
  CONSTRAINT `FKsikodosshyo5r9sr2i1jxqi03` FOREIGN KEY (`teacher_reg_no`) REFERENCES `staff` (`staff_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_subject`
--

DROP TABLE IF EXISTS `teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_subject` (
  `subject_code` varchar(255) NOT NULL,
  `teacher_reg_no` varchar(255) NOT NULL,
  KEY `FKj53ftlfwqomtf5ollhxs7a3gb` (`teacher_reg_no`),
  KEY `FKmjbbt4suts76tfa8covbjyham` (`subject_code`),
  CONSTRAINT `FKj53ftlfwqomtf5ollhxs7a3gb` FOREIGN KEY (`teacher_reg_no`) REFERENCES `teacher` (`teacher_reg_no`),
  CONSTRAINT `FKmjbbt4suts76tfa8covbjyham` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-19 13:04:31
