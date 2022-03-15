USE school_management_system;

DROP TABLE announcement;
DROP TABLE system_users;

CREATE TABLE system_users(
full_name VARCHAR(50) NOT NULL,
email VARCHAR(50) primary key,
login_password VARCHAR(16) NOT NULL,
position VARCHAR(16) NOT NULL,
reason_to_join VARCHAR(255) NOT NULL,
contact_no VARCHAR(11) NOT NULL,
aprove_status INT DEFAULT 0,
CHECK(-1 < aprove_status AND  aprove_status < 2)
) ;

CREATE TABLE announcement(
    announcementid VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    details  VARCHAR(255) NOT NULL,
    publisher_name VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL
   )
