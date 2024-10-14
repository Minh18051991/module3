CREATE DATABASE if not exists demo;
use demo;

create table student (
id int primary key auto_increment,
name varchar(100),
age int,
country varchar(50)
);
create table class (
id int, 
name varchar(50)
);
create table teacher(
id int , 
name varchar(100),
age int, 
country varchar(100)
);
insert into student (id, name ) 
value (1,"chánh"),(2, "minh");
alter table student add column(address  varchar(250));
update student set name ="minh3" where id =2;
select * from student; 

