create database schoolManagementSystem;

use schoolManagementSystem;

create table loginUserDetails(
fullName varchar(50) Not null,
Email varchar(50) primary key,
loginPassword varchar(16) not null,
position varchar(16) not null,
reasonToJoin Varchar(255) not null,
aproveStatus int default 0,
check(-1 < aproveStatus and  aproveStatus < 2)
) ;

insert into loginUserDetails values(
"full name","email@gmail.com","123@ishan","teacher","check my result",1
);

-- delete from loginUserDetails where Email = "email@gmail.com";

-- drop table loginUserDetails;

-- select * from loginUserDetails;


