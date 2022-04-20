CREATE VIEW system_user_login AS
SELECT
  su.staff_reg_no,
  s.staff_name,
  s.staff_email,
  s.password,
  su.reason_to_join,
  su.aprove_status
FROM
  system_user su
  JOIN staff s USING(staff_reg_no);
