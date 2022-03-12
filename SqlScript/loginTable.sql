USE school_management_system;

CREATE TABLE SystemUsers(
fullName VARCHAR(50) NOT NULL,
email VARCHAR(50) primary key,
loginPassword VARCHAR(16) NOT NULL,
position VARCHAR(16) NOT NULL,
reasonToJoin VARCHAR(255) NOT NULL,
contactNo VARCHAR(11) NOT NULL,
aproveStatus INT DEFAULT 0,
CHECK(-1 < aproveStatus AND  aproveStatus < 2)
) ;

CREATE TABLE Announcement(
    announcementID VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    email VARCHAR(50) ,
    publishDate DATE NOT NULL,
    details  VARCHAR(255) NOT NULL,
    CONSTRAINT fk_email FOREIGN KEY (email) REFERENCES SystemUsers (email)
)
