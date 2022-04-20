DELIMITER $$
CREATE PROCEDURE add_system_user(reason_to_join varchar(255),staff_reg_no varchar(50)) 
BEGIN
  INSERT INTO system_user (aprove_status,reason_to_join,staff_reg_no)
  VALUES(0, reason_to_join, staff_reg_no);
END $$ 
DELIMITER;

-- CALL add_system_user("test","103");