DELIMITER $$
CREATE PROCEDURE auth_staff_member(staff_reg_no varchar(50),staff_email varchar(255),password varchar(255)) 
BEGIN
  SELECT *
  FROM staff s
  WHERE 
    s.staff_reg_no=staff_reg_no AND 
    s.staff_email=staff_email AND 
    s.password=password;
END $$ 
DELIMITER ;

-- CALL auth_staff_member(
--     '171',
--     'jacynthe.upton@example.com',
--     'aca01b38dbbba589afb3e939b83776d8b29dff83'
--     );

