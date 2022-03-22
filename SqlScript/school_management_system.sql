---------------------------------------------------------
-- MySQL
--
-- Database: school_management_system
-- ------------------------------------------------------

--
--Database creation
--

DROP DATABASE IF EXISTS school_management_system;
CREATE DATABASE IF NOT EXISTS school_management_system DEFAULT CHARACTER SET = 'utf8mb4';
USE school_management_system;
--
-- Table structure for table `guardian`
--
DROP TABLE IF EXISTS `guardian`;
CREATE TABLE `guardian` (
  `guardian_id` int AUTO_INCREMENT,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_phone_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`guardian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `student`
--
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_admission_no` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `student_address` varchar(255) DEFAULT NULL,
  `student_date_of_birth` date DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_nationality` varchar(255) DEFAULT NULL,
  `student_password` varchar(255) DEFAULT NULL,
  `student_religion` varchar(255) DEFAULT NULL,
  `guardian_id` INT DEFAULT NULL,
  PRIMARY KEY (`student_admission_no`),
  KEY `FKhhlsorcfy5xbiu8iwqxwccb6i` (`guardian_id`),
  CONSTRAINT `FKhhlsorcfy5xbiu8iwqxwccb6i` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `subjects`
--
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `student_subject`
--
DROP TABLE IF EXISTS `student_subject`;
CREATE TABLE `student_subject` (
  `student_admission_no` varchar(255) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  KEY `FKfp0ct4bl78p0j52es99pbywbf` (`subject_code`),
  KEY `FKigo5s7fb9n9kquh6csq7bs9iw` (`student_admission_no`),
  CONSTRAINT `FKfp0ct4bl78p0j52es99pbywbf` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`),
  CONSTRAINT `FKigo5s7fb9n9kquh6csq7bs9iw` FOREIGN KEY (`student_admission_no`) REFERENCES `student` (`student_admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `exam`
--
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_code` varchar(255) NOT NULL,
  `exam_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exam_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `marks`
--
DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `marks_id` int AUTO_INCREMENT,
  `exam_code` varchar(255) NOT NULL,
  `student_admission_no` varchar(255) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `marks` float DEFAULT NULL,
  PRIMARY KEY (`marks_id`),
  KEY `FK8ytykn9am9p7w1py2bj7i660l` (`student_admission_no`),
  KEY `FKjnc40f5aqabqf18qhpwjukw2b` (`subject_code`),
  CONSTRAINT `FK25ot1oj90wvwny5cnjs95sv32` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`),
  CONSTRAINT `FK8ytykn9am9p7w1py2bj7i660l` FOREIGN KEY (`student_admission_no`) REFERENCES `student` (`student_admission_no`),
  CONSTRAINT `FKjnc40f5aqabqf18qhpwjukw2b` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `teacher`
--
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_reg_no` varchar(255) NOT NULL,
  `teacher_basic_salary` float DEFAULT NULL,
  `teacher_date_of_birth` date DEFAULT NULL,
  `teacher_email` varchar(255) DEFAULT NULL,
  `teacher_gender` varchar(255) DEFAULT NULL,
  `teacher_nic` varchar(255) DEFAULT NULL,
  `teacher_name` varchar(255) DEFAULT NULL,
  `teacher_nationality` varchar(255) DEFAULT NULL,
  `teacher_password` varchar(255) DEFAULT NULL,
  `teacher_religion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teacher_reg_no`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `teacher_subject`
--
DROP TABLE IF EXISTS `teacher_subject`;
CREATE TABLE `teacher_subject` (
  `subject_code` varchar(255) NOT NULL,
  `teacher_reg_no` varchar(255) NOT NULL,
  KEY `FKj53ftlfwqomtf5ollhxs7a3gb` (`teacher_reg_no`),
  KEY `FKmjbbt4suts76tfa8covbjyham` (`subject_code`),
  CONSTRAINT `FKj53ftlfwqomtf5ollhxs7a3gb` FOREIGN KEY (`teacher_reg_no`) REFERENCES `teacher` (`teacher_reg_no`),
  CONSTRAINT `FKmjbbt4suts76tfa8covbjyham` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `unacademic_staff`
--
DROP TABLE IF EXISTS `unacademic_staff`;
CREATE TABLE `unacademic_staff` (
  `unacademic_staff_reg_no` varchar(255) NOT NULL,
  `unacademic_staff_basic_salary` float DEFAULT NULL,
  `unacademic_staff_date_of_birth` date DEFAULT NULL,
  `unacademic_staff_email` varchar(255) DEFAULT NULL,
  `unacademic_staff_gender` varchar(255) DEFAULT NULL,
  `unacademic_staff_nic` varchar(255) DEFAULT NULL,
  `unacademic_staff_name` varchar(255) DEFAULT NULL,
  `unacademic_staff_nationality` varchar(255) DEFAULT NULL,
  `unacademic_staff_position` varchar(255) DEFAULT NULL,
  `unacademic_staff_religion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unacademic_staff_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `staff_leave`
--
DROP TABLE IF EXISTS `staff_leave`;
CREATE TABLE `staff_leave` (
  `leave_id` int AUTO_INCREMENT,
  `leave_end_date` date DEFAULT NULL,
  `leave_start_date` date DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `unacademic_staff_reg_no` varchar(255) DEFAULT NULL,
  `teacher_reg_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `FKbtxh6jq4yh60jhy2gtokgb078` (`teacher_reg_no`),
  KEY `FK9avbd4knh0acduewmtw1wam8l` (`unacademic_staff_reg_no`),
  CONSTRAINT `FK9avbd4knh0acduewmtw1wam8l` FOREIGN KEY (`unacademic_staff_reg_no`) REFERENCES `unacademic_staff` (`unacademic_staff_reg_no`),
  CONSTRAINT `FKbtxh6jq4yh60jhy2gtokgb078` FOREIGN KEY (`teacher_reg_no`) REFERENCES `teacher` (`teacher_reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `system_users`
--
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users` (
  `email` varchar(255) NOT NULL,
  `aprove_status` int DEFAULT 0,
  `contact_no` varchar(10) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `reason_to_join` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `announcement`
--
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `announcement_id` int AUTO_INCREMENT,
  `details` varchar(255) NOT NULL,
  `publish_date` date NOT NULL,
  `publisher_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

