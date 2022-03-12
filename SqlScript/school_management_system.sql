drop database school_management_system;
create database school_management_system;
use school_management_system;
create table staff (
	staffRegNo char(10) not null primary key,
    staffName varchar(255),
    staffNIC varchar(12),
    staffPosition varchar(50),
    staffEmail varchar(255),
    staffPassword varchar(255),
    staffGender varchar(10),
    staffNationality varchar(50),
    staffReligion varchar(50),
    staffDateOfBirth date,
    staffBasicSalary float,
    staffStatus varchar(50)
);

create table non_academic (
	nonAcademicRegNo char(10) not null primary key,
    constraint fk_nonAcademicRegNo foreign key (nonAcademicRegNo) references staff (staffRegNo)  
);

create table teacher (
	teacherRegNo char(10) not null primary key,
    constraint fk_teacherRegNo foreign key (teacherRegNo) references staff (staffRegNo)
);

create table staffLeave (
	leaveID char(10) not null primary key,
    leaveType varchar(50),
    leaveStartDate date,
    leaveEndDate date,
    reason varchar(255),
    staffRegNo char(10),
    constraint fk_leaveStaffRegNo foreign key (staffRegNo) references staff (staffRegNo)
);

create table class (
	className varchar(10) not null primary key,
    teacherRegNo char(10),
    constraint fk_classTeacherRegNo foreign key (teacherRegNo) references teacher (teacherRegNo)
);

create table subjects (
	subjectCode char(10) not null primary key,
    subjectName varchar(50)   
);

create table teacher_subject (
	teacherRegNo char(10) not null,
    subjectCode char(10) not null,
    primary key (teacherRegNo, subjectCode),
    constraint fk_teacherSubjectRegNo foreign key (teacherRegNo) references teacher (teacherRegNo),
    constraint fk_teacherSubjectCode foreign key (subjectCode) references subjects (subjectCode)
);

create table guardian(
	guardianID char(10) not null primary key,
    guardianName varchar(255),
    guardianPhoneNo char(10),
    guardianPassword varchar(255)
);

create table guardian_phone (
	guardianID char(10) not null,
	guardianPhoneNo char(10) not null,
    primary key (guardianID, guardianPhoneNo),
    constraint fk_guardianPhoneGuaridanID foreign key (guardianID) references guardian (guardianID)
);

create table student (
	studentAdmissionNo char(10) not null primary key,
    studentName varchar(255),
    studentEmail varchar(255),
	studentPassword varchar(255),
    gender varchar(6),
    studentAddress varchar(255),
	studentNationality varchar(20),
	studentReligion varchar(20),
    studentDateOfBirth date,
	studentClassName varchar(10),
    guardianID char(10),
    constraint fk_sudentGuardianID foreign key(guardianID) references guardian (guardianID)
);

create table student_subject (
	studentAdmissionNo char(10) not null,
    subjectCode char(10) not null,
    primary key (studentAdmissionNo, subjectCode),
    constraint fk_studentSubjectAdmissionNo foreign key (studentAdmissionNo) references student (studentAdmissionNo),
    constraint fk_studentSubjectCode foreign key (subjectCode) references subjects (subjectCode)
);

create table exam (
	examCode char(10) not null primary key,
    examName varchar(20)
);

create table marks (
	studentAdmissionNo char(10) not null,
    subjectCode char(10) not null,
    examCode char(10) not null,
    marks float,
    primary key (studentAdmissionNo, subjectCode, examCode),
    constraint fk_marksStudnetAdmissionNo foreign key (studentAdmissionNo) references student (studentAdmissionNo),
    constraint fk_marksSubjectCode foreign key (subjectCode) references subjects (subjectCode),
    constraint fk_marksExamCode foreign key(examCode) references exam (examCode)
);
