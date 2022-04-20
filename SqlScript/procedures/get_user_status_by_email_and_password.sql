DELIMITER $$
CREATE PROCEDURE get_user_status_by_email_and_password(email varchar(255),password varchar(255))
BEGIN
    SELECT aprove_status
    FROM system_user_login sul
    WHERE sul.staff_email=email AND sul.password = password;
END$$
DELIMITER ;

-- CALL get_user_status_by_email_and_password('ishan','123');