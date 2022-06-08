DELIMITER $$
CREATE PROCEDURE get_Studend_table()
BEGIN
    SELECT *
    FROM student;
END$$
DELIMITER ;

-- CALL get_Student_table();