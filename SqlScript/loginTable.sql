create database schoolManagementSystem;

use schoolManagementSystem;

create table loginUserDetails(
Email varchar(50) primary key,
fullName varchar(50) Not null,
loginPassword varchar(16) not null,
reasonToJoin Varchar(255) not null,
aproveStatus int default 0,
check(-1 < aproveStatus and  aproveStatus < 2)
) ;

insert into loginUserDetails values(
"kamal@gmail.com","Kamal",4321,"teacher",1
);

-- delete from loginUserDetails where Email = "kamal@gmail.com";

-- drop table loginUserDetails;

-- select * from loginUserDetails;


