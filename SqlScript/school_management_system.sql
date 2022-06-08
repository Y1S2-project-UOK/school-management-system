DROP DATABASE IF EXISTS school_management_system;
CREATE DATABASE IF NOT EXISTS `school_management_system` ;
USE `school_management_system` ;

--
-- Table structure for table `staff`
--
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_reg_no` varchar(50) NOT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_email` varchar(255) DEFAULT NULL,
  `staff_date_of_birth` date DEFAULT NULL,
  `staff_gender` varchar(20) DEFAULT NULL,
  `staff_nic` varchar(20) DEFAULT NULL,
  `staff_nationality` varchar(255) DEFAULT NULL,
  `staff_religion` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `basic_salary` float DEFAULT NULL,
  PRIMARY KEY (`staff_reg_no`)
);
--
-- Table structure for table `position`
--
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);
--
-- Table structure for table `unacademic_staff`
--
DROP TABLE IF EXISTS `unacademic_staff`;
CREATE TABLE `unacademic_staff` (
  `unacademic_staff_reg_no` varchar(50) NOT NULL,
  `staff_staff_reg_no` varchar(50) NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`unacademic_staff_reg_no`),
  CONSTRAINT `fk_unacademic_staff_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `fk_unacademic_staff_staff` FOREIGN KEY (`staff_staff_reg_no`) REFERENCES `staff` (`staff_reg_no`)
);
--
-- Table structure for table `system_user`
--
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `aprove_status` int DEFAULT '0',
  `reason_to_join` varchar(255) NOT NULL,
  `staff_reg_no` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_system_users_staff` FOREIGN KEY (`staff_reg_no`) REFERENCES `staff` (`staff_reg_no`) ON DELETE CASCADE ON UPDATE CASCADE
);
--
-- Table structure for table `announcement`
--
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `publish_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `venue` varchar(255),
  `publisher` varchar(255),
  `system_users_id` int NOT NULL,
  PRIMARY KEY (`announcement_id`),
  CONSTRAINT `fk_announcement_system_user` FOREIGN KEY (`system_users_id`) REFERENCES `system_user` (`user_id`) ON UPDATE CASCADE
); 
--
-- Table structure for table `class_room`
--
DROP TABLE IF EXISTS `class_room`;
CREATE TABLE `class_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);
--
-- Table structure for table `day`
--
DROP TABLE IF EXISTS `day`;
CREATE TABLE `day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);
--
-- Table structure for table `time_slote`
--
DROP TABLE IF EXISTS `time_slote`;
CREATE TABLE `time_slote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  PRIMARY KEY (`id`)
);
--
-- Table structure for table `exam`
--
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_code` varchar(50) NOT NULL,
  `exam_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`exam_code`)
); 
--
-- Table structure for table `guardian`
--
DROP TABLE IF EXISTS `guardian`;
CREATE TABLE `guardian` (
  `guardian_id` varchar(50) NOT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_phone_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`guardian_id`)
);
--
-- Table structure for table `subject`
--
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_code` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subject_code`)
); 
-- Table structure for table `student`
--
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_admission_no` varchar(50) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `student_address` varchar(255) DEFAULT NULL,
  `student_date_of_birth` date DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_nationality` varchar(255) DEFAULT NULL,
  `student_password` varchar(255) DEFAULT NULL,
  `student_religion` varchar(255) DEFAULT NULL,
  `guardian_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_admission_no`),
  CONSTRAINT `fk_student_guardian` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`) ON UPDATE CASCADE
);
--
-- Table structure for table `teacher`
--
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_reg_no` varchar(50) NOT NULL,
  `staff_staff_reg_no` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_reg_no`),
  CONSTRAINT `fk_teacher_staff` FOREIGN KEY (`staff_staff_reg_no`) REFERENCES `staff` (`staff_reg_no`) ON DELETE CASCADE ON UPDATE CASCADE
);
--
-- Table structure for table `teacher_subject`
--
DROP TABLE IF EXISTS `teacher_subject`;
CREATE TABLE `teacher_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_code` INT NOT NULL,
  `teacher_reg_no` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_teacher_subject_teacher` FOREIGN KEY (`teacher_reg_no`) REFERENCES `teacher` (`teacher_reg_no`),
  CONSTRAINT `fk_teacher_subject_subjects` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`)
);
--
-- Table structure for table `mark`
--
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark` (
  `marks_id` int NOT NULL AUTO_INCREMENT,
  `exam_code` varchar(50) NOT NULL,
  `student_admission_no` varchar(50) NOT NULL,
  `subject_code` INT NOT NULL,
  `marks` float DEFAULT NULL,
  PRIMARY KEY (`marks_id`),
  CONSTRAINT `fk_marks_exam` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_marks_student` FOREIGN KEY (`student_admission_no`) REFERENCES `student` (`student_admission_no`) ON UPDATE CASCADE,
  CONSTRAINT `fk_marks_subject` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`) ON UPDATE CASCADE
); 
--
-- Table structure for table `leave_method`
--
DROP TABLE IF EXISTS `leave_method`;
CREATE TABLE `leave_method` (
  `leave_method_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`leave_method_id`)
);
--
-- Table structure for table `staff_leave`
--
DROP TABLE IF EXISTS `staff_leave`;
CREATE TABLE `staff_leave` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `leave_start_date` date DEFAULT NULL,
  `leave_end_date` date DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `leave_method_id` int NOT NULL,
  `staff_reg_no` varchar(50) NOT NULL,
  PRIMARY KEY (`leave_id`),
  CONSTRAINT `fk_staff_leave_staff` FOREIGN KEY (`staff_reg_no`) REFERENCES `staff` (`staff_reg_no`) ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_leave_leave_method` FOREIGN KEY (`leave_method_id`) REFERENCES `leave_method` (`leave_method_id`) ON UPDATE CASCADE
);
--
-- Table structure for table `student_subject`
--
DROP TABLE IF EXISTS `student_subject`;
CREATE TABLE `student_subject` (
  `student_admission_no` varchar(50) NOT NULL,
  `subject_code` INT NOT NULL,
  CONSTRAINT `fk_student_subject_subject` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_subject_student` FOREIGN KEY (`student_admission_no`) REFERENCES `student` (`student_admission_no`)
);
--
-- Table structure for table `time_table`
--
DROP TABLE IF EXISTS `time_table`;
CREATE TABLE `time_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_room_id` int NOT NULL,
  `day_id` int NOT NULL,
  `teacher_subject_id` int NOT NULL,
  `time_slote_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_time_table_class_room` FOREIGN KEY (`class_room_id`) REFERENCES `class_room` (`id`),
  CONSTRAINT `fk_time_table_day1` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  CONSTRAINT `fk_time_table_teacher_subject` FOREIGN KEY (`teacher_subject_id`) REFERENCES `teacher_subject` (`id`),
  CONSTRAINT `fk_time_table_time_slote` FOREIGN KEY (`time_slote_id`) REFERENCES `time_slote` (`id`)
);
