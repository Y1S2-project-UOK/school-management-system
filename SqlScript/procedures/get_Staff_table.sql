DELIMITER $$
CREATE PROCEDURE get_Staff_table()
BEGIN
    SELECT *
    FROM staff;
END$$
DELIMITER ;

-- CALL get_Staff_table();