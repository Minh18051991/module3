CREATE DATABASE if not exists demo;
use demo;

create table if not exists student (
id int primary key auto_increment,
name varchar(100),
age int,
country varchar(50)
);
create table if not exists class (
id int, 
name varchar(50)
);
create table if not exists teacher(
id int , 
name varchar(100),
age int, 
country varchar(100)
);
alter table student add column(address  varchar(250)) ;
insert into student (id, name, address ) 
value (1,"chánh","Gia lai"),(2, "minh","đà nẵng"),(3, "dũng", "Hồ chí minh"),(4,"Lan","huế");
alter table student add column(class varchar(50));
insert into class(id, name)
value (1, "A24"),(2, "A25");
update student set class = "A24" where id = 1;
update student set class = "A24" where id = 2;
update student set class = "A24" where id = 3;
update student set class = "A25" where id = 4;
insert into teacher(id, name, age, country)
value(1, "Hằng", 34, "Việt Nam"),(2,"Tony", 24, "France"),(3, "XiaoZhang", 44, "China");
select * from teacher;
select * from class;
select * from student;
update student set age = 36 where id = 1;
update student set age = 34 where id = 2;
update student set age = 24 where id = 3;
update student set age = 21 where id = 4;
select * from student;

