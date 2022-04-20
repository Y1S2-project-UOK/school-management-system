DELIMITER $$
CREATE PROCEDURE get_users_table()
BEGIN
    SELECT *
    FROM system_user_login;
END$$
DELIMITER ;

CALL get_users_table();