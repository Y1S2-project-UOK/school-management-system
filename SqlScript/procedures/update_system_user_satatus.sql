DELIMITER $$
CREATE PROCEDURE update_system_user_satatus(aprove_status int,staff_reg_no varchar(50))
BEGIN
    UPDATE system_user su
    SET su.aprove_status=aprove_status
    WHERE su.staff_reg_no=staff_reg_no;
END$$
DELIMITER ;

-- CALL update_system_user_satatus(1,"1");