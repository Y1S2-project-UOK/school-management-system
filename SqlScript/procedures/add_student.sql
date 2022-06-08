DELIMITER $$
CREATE PROCEDURE add_student(student_admission_no varchar(50), gender varchar(20), student_address varchar(255), student_date_of_birth date, student_email varchar(255), student_name varchar(255), student_nationality varchar(255), student_password varchar(255), student_religion varchar(255), guardian_id varchar(50)) 
BEGIN
  INSERT INTO student
  VALUES(student_admission_no, gender, student_address, student_date_of_birth, student_email, student_name, student_nationality, student_password, student_religion, guardian_id);
END $$ 
DELIMITER ;

-- CALL add_student();


