DELIMITER $$
CREATE PROCEDURE get_student_count()
BEGIN
    SELECT count(*) as count
    FROM student;
END$$
DELIMITER ;

-- CALL get_student_count();


DELIMITER $$
CREATE PROCEDURE get_staff_count()
BEGIN
    SELECT count(*) as count
    FROM staff;
END$$
DELIMITER ;

CALL get_staff_count();

DELIMITER $$
CREATE PROCEDURE get_teacher_count()
BEGIN
    SELECT count(*) as count
    FROM teacher;
END$$
DELIMITER ;

-- CALL get_teacher_count();


DELIMITER $$
CREATE PROCEDURE get_unacademy_count()
BEGIN
    SELECT count(*) as count
    FROM unacademic_staff;
END$$
DELIMITER ;

CALL get_unacademy_count();