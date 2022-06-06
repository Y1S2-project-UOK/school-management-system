DELIMITER $$
CREATE PROCEDURE add_staff_member(staff_reg_no varchar(50),staff_name varchar(255),staff_email varchar(255),staff_date_of_birth date,staff_gender varchar(20),staff_nic varchar(20),staff_nationality varchar(255),staff_religion varchar(255),password varchar(255),basic_salary decimal) 
BEGIN
  INSERT INTO staff (staff_reg_no,staff_name,staff_email,staff_date_of_birth,staff_gender,staff_nic,staff_nationality,staff_religion,password,basic_salary)
  VALUES(staff_reg_no,staff_name,staff_email,staff_date_of_birth,staff_gender,staff_nic,staff_nationality,staff_religion,password,basic_salary);
END $$ 
DELIMITER;

-- CALL add_staff_member();


