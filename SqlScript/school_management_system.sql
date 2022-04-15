-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema school_management_system
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS school_management_system;
CREATE SCHEMA IF NOT EXISTS `school_management_system` ;
USE `school_management_system` ;

-- -----------------------------------------------------
-- Table `school_management_system`.`leave_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`leave_method` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `school_management_system`.`time_slote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`time_slote` (
  `time_slote_id` INT NOT NULL AUTO_INCREMENT,
  `time_slote_start_time` VARCHAR(45) NOT NULL,
  `time_slote_end_time` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`time_slote_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `time_slote_start_time_UNIQUE` ON `school_management_system`.`time_slote` (`time_slote_start_time` ASC) VISIBLE;

CREATE UNIQUE INDEX `time_slote_end_time_UNIQUE` ON `school_management_system`.`time_slote` (`time_slote_end_time` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`class_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`class_room` (
  `class_room_id` INT NOT NULL AUTO_INCREMENT,
  `class_room_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`class_room_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `class_room_name_UNIQUE` ON `school_management_system`.`class_room` (`class_room_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`staff` (
  `staff_reg_no` VARCHAR(255) NOT NULL,
  `staff_name` VARCHAR(255) NULL DEFAULT NULL,
  `staff_email` VARCHAR(255) NULL DEFAULT NULL,
  `staff_date_of_birth` DATE NULL DEFAULT NULL,
  `staff_gender` VARCHAR(255) NULL DEFAULT NULL,
  `staff_nic` VARCHAR(255) NULL DEFAULT NULL,
  `staff_nationality` VARCHAR(255) NULL DEFAULT NULL,
  `staff_religion` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `basic_salary` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`staff_reg_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_management_system`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`teacher` (
  `teacher_reg_no` VARCHAR(255) NOT NULL,
  `staff_staff_reg_no` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`teacher_reg_no`),
  CONSTRAINT `fk_teacher_staff1`
    FOREIGN KEY (`staff_staff_reg_no`)
    REFERENCES `school_management_system`.`staff` (`staff_reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_teacher_staff1_idx` ON `school_management_system`.`teacher` (`staff_staff_reg_no` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`subjects` (
  `subject_code` VARCHAR(255) NOT NULL,
  `subject_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`subject_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_management_system`.`teacher_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`teacher_subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject_code` VARCHAR(255) NOT NULL,
  `teacher_reg_no` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKj53ftlfwqomtf5ollhxs7a3gb`
    FOREIGN KEY (`teacher_reg_no`)
    REFERENCES `school_management_system`.`teacher` (`teacher_reg_no`),
  CONSTRAINT `FKmjbbt4suts76tfa8covbjyham`
    FOREIGN KEY (`subject_code`)
    REFERENCES `school_management_system`.`subjects` (`subject_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FKj53ftlfwqomtf5ollhxs7a3gb` ON `school_management_system`.`teacher_subject` (`teacher_reg_no` ASC) VISIBLE;

CREATE INDEX `FKmjbbt4suts76tfa8covbjyham` ON `school_management_system`.`teacher_subject` (`subject_code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`day`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`day` (
  `day_id` INT NOT NULL AUTO_INCREMENT,
  `day_name` VARCHAR(45) NULL,
  PRIMARY KEY (`day_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `day_name_UNIQUE` ON `school_management_system`.`day` (`day_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`time_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`time_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class_room_id` INT NOT NULL,
  `time_slote_id` INT NOT NULL,
  `teacher_subject_id` INT NOT NULL,
  `day_day_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_time_table_class_room`
    FOREIGN KEY (`class_room_id`)
    REFERENCES `school_management_system`.`class_room` (`class_room_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_time_table_time_slote1`
    FOREIGN KEY (`time_slote_id`)
    REFERENCES `school_management_system`.`time_slote` (`time_slote_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_time_table_teacher_subject1`
    FOREIGN KEY (`teacher_subject_id`)
    REFERENCES `school_management_system`.`teacher_subject` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_time_table_day1`
    FOREIGN KEY (`day_day_id`)
    REFERENCES `school_management_system`.`day` (`day_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_time_table_class_room_idx` ON `school_management_system`.`time_table` (`class_room_id` ASC) VISIBLE;

CREATE INDEX `fk_time_table_time_slote1_idx` ON `school_management_system`.`time_table` (`time_slote_id` ASC) VISIBLE;

CREATE INDEX `fk_time_table_teacher_subject1_idx` ON `school_management_system`.`time_table` (`teacher_subject_id` ASC) VISIBLE;

CREATE INDEX `fk_time_table_day1_idx` ON `school_management_system`.`time_table` (`day_day_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`position` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `school_management_system`.`position` (`name` ASC) VISIBLE;

USE `school_management_system` ;

-- -----------------------------------------------------
-- Table `school_management_system`.`system_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`system_users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `aprove_status` INT NULL DEFAULT '0',
  `reason_to_join` VARCHAR(255) NOT NULL,
  `staff_reg_no` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_system_users_staff1`
    FOREIGN KEY (`staff_reg_no`)
    REFERENCES `school_management_system`.`staff` (`staff_reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_system_users_staff1_idx` ON `school_management_system`.`system_users` (`staff_reg_no` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`announcement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`announcement` (
  `announcement_id` INT NOT NULL AUTO_INCREMENT,
  `details` VARCHAR(255) NOT NULL,
  `publish_date` DATE NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `system_users_id` INT NOT NULL,
  PRIMARY KEY (`announcement_id`),
  CONSTRAINT `fk_announcement_system_users1`
    FOREIGN KEY (`system_users_id`)
    REFERENCES `school_management_system`.`system_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_announcement_system_users1_idx` ON `school_management_system`.`announcement` (`system_users_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`exam` (
  `exam_code` VARCHAR(255) NOT NULL,
  `exam_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`exam_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_management_system`.`guardian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`guardian` (
  `guardian_id` INT NOT NULL AUTO_INCREMENT,
  `guardian_name` VARCHAR(255) NULL DEFAULT NULL,
  `guardian_phone_no` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`guardian_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_management_system`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`student` (
  `student_admission_no` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `student_address` VARCHAR(255) NULL DEFAULT NULL,
  `student_date_of_birth` DATE NULL DEFAULT NULL,
  `student_email` VARCHAR(255) NULL DEFAULT NULL,
  `student_name` VARCHAR(255) NULL DEFAULT NULL,
  `student_nationality` VARCHAR(255) NULL DEFAULT NULL,
  `student_password` VARCHAR(255) NULL DEFAULT NULL,
  `student_religion` VARCHAR(255) NULL DEFAULT NULL,
  `guardian_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`student_admission_no`),
  CONSTRAINT `FKhhlsorcfy5xbiu8iwqxwccb6i`
    FOREIGN KEY (`guardian_id`)
    REFERENCES `school_management_system`.`guardian` (`guardian_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FKhhlsorcfy5xbiu8iwqxwccb6i` ON `school_management_system`.`student` (`guardian_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`marks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`marks` (
  `marks_id` INT NOT NULL AUTO_INCREMENT,
  `exam_code` VARCHAR(255) NOT NULL,
  `student_admission_no` VARCHAR(255) NOT NULL,
  `subject_code` VARCHAR(255) NOT NULL,
  `marks` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`marks_id`),
  CONSTRAINT `FK25ot1oj90wvwny5cnjs95sv32`
    FOREIGN KEY (`exam_code`)
    REFERENCES `school_management_system`.`exam` (`exam_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK8ytykn9am9p7w1py2bj7i660l`
    FOREIGN KEY (`student_admission_no`)
    REFERENCES `school_management_system`.`student` (`student_admission_no`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FKjnc40f5aqabqf18qhpwjukw2b`
    FOREIGN KEY (`subject_code`)
    REFERENCES `school_management_system`.`subjects` (`subject_code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FK8ytykn9am9p7w1py2bj7i660l` ON `school_management_system`.`marks` (`student_admission_no` ASC) VISIBLE;

CREATE INDEX `FKjnc40f5aqabqf18qhpwjukw2b` ON `school_management_system`.`marks` (`subject_code` ASC) VISIBLE;

CREATE INDEX `FK25ot1oj90wvwny5cnjs95sv32` ON `school_management_system`.`marks` (`exam_code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`staff_leave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`staff_leave` (
  `leave_id` INT NOT NULL AUTO_INCREMENT,
  `leave_start_date` DATE NULL DEFAULT NULL,
  `leave_end_date` DATE NULL DEFAULT NULL,
  `reason` VARCHAR(255) NULL DEFAULT NULL,
  `leave_method_id` INT NOT NULL,
  `staff_reg_no` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`leave_id`),
  CONSTRAINT `fk_staff_leave_leave_method1`
    FOREIGN KEY (`leave_method_id`)
    REFERENCES `school_management_system`.`leave_method` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_leave_staff1`
    FOREIGN KEY (`staff_reg_no`)
    REFERENCES `school_management_system`.`staff` (`staff_reg_no`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_staff_leave_leave_method1_idx` ON `school_management_system`.`staff_leave` (`leave_method_id` ASC) VISIBLE;

CREATE INDEX `fk_staff_leave_staff1_idx` ON `school_management_system`.`staff_leave` (`staff_reg_no` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`student_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`student_subject` (
  `student_admission_no` VARCHAR(255) NOT NULL,
  `subject_code` VARCHAR(255) NOT NULL,
  CONSTRAINT `FKfp0ct4bl78p0j52es99pbywbf`
    FOREIGN KEY (`subject_code`)
    REFERENCES `school_management_system`.`subjects` (`subject_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FKigo5s7fb9n9kquh6csq7bs9iw`
    FOREIGN KEY (`student_admission_no`)
    REFERENCES `school_management_system`.`student` (`student_admission_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FKfp0ct4bl78p0j52es99pbywbf` ON `school_management_system`.`student_subject` (`subject_code` ASC) VISIBLE;

CREATE INDEX `FKigo5s7fb9n9kquh6csq7bs9iw` ON `school_management_system`.`student_subject` (`student_admission_no` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_management_system`.`unacademic_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management_system`.`unacademic_staff` (
  `unacademic_staff_reg_no` VARCHAR(255) NOT NULL,
  `staff_staff_reg_no` VARCHAR(255) NOT NULL,
  `position_id` INT NOT NULL,
  PRIMARY KEY (`unacademic_staff_reg_no`),
  CONSTRAINT `fk_unacademic_staff_staff1`
    FOREIGN KEY (`staff_staff_reg_no`)
    REFERENCES `school_management_system`.`staff` (`staff_reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unacademic_staff_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `school_management_system`.`position` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_unacademic_staff_staff1_idx` ON `school_management_system`.`unacademic_staff` (`staff_staff_reg_no` ASC) VISIBLE;

CREATE INDEX `fk_unacademic_staff_position1_idx` ON `school_management_system`.`unacademic_staff` (`position_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
