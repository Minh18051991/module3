create database if not exists codegym_management2;
use codegym_management2;

create table jame (
username varchar(100) primary key , 
password varchar(100) not null
);

create table class(
id int primary key auto_increment,
name varchar(50) not null
);
create table classroom(
id int primary key auto_increment,
name varchar(50),
class_id int,
foreign key (class_id) references class(id)
);
create table student(
id int primary key auto_increment,
name varchar(50) not null,
gender int ,
birthday date not null ,
email varchar(50),
point int ,
account varchar(100),
foreign key (account) references jame(username),
class_id int,
foreign key (class_id) references class(id)
);
create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date , 
salary decimal(5,2)
);
create table instructor_class(
instructor_id int ,
class_id int,
start_time datetime,
primary key (instructor_id , class_id),
foreign key (instructor_id) references instructor(id),
foreign key (class_id) references class(id)
);
insert into jame (username, password)
values ('cunn','123'),('chunglh','123'),('hoanhh','123'),('dungd','123'),('huynhtd','123'),('hainm','123'),('namtv','123'),('hieuvm','123'),('kynx','123'),('vulm','123');
insert into class (id, name) 
values (1, 'c1121g1'), (2, 'c1221g1'), (3, 'a0821i1'), (4, 'a0921i1');
insert into classroom (id, name, class_id)
values (1, 'Ken', 1), (2, 'Jam', 1), (3, 'Ada', 2), (4, 'Jimmy', 2);

insert into student (id, name, gender, birthday, email, point, account, class_id) 
values 
(1, 'nguyen ngoc cu', 1, '1981-12-12', 'cunn@gmail.com', 8, 'cunn', 1),
(2, 'le hai chung', 1, '1981-12-12', 'chunghl@gmail.com', 3, 'chunglh', 1),
(3, 'hoang huu hoan', 1, '1990-12-12', 'hoanhh@gmail.com', 6, 'hoanhh', 2),
(4, 'dau dung', 1, '1987-12-12', 'dungd@gmail.com', 1, 'dungd', 1),
(5, 'ta dinh huynh', 1, '1981-12-12', 'huynhtd@gmail.com', 9, 'huynhtd', 1),
(6, 'nguyen minh hai', 1, '1987-12-12', 'hainm@gmail.com', 5, 'hainm', 2),
(7, 'tran van nam', 1, '1989-12-12', 'namtv@gmail.com', 7, 'namtv', 1),
(8, 'vo minh hieu', 1, '1990-12-12', 'hieuvm@gmail.com', 10, 'hieuvm', 2),
(9, 'le xuan ky', 1, '1981-12-12', 'kynx@gmail.com', 4, 'kynx', 1),
(10, 'le minh vu', 1, '1981-12-12', 'vulm@gmail.com', 6, 'vulm', 2);


insert into instructor (id, name, birthday, salary)
values 
(1, 'tran van chanh', '1985-03-02', 100),
(2, 'tran minh chien', '1985-02-03', 200),
(3, 'vu thanh tien', '1985-02-03', 300),
(4, 'tran van nam', '1989-12-12', 100);
insert into instructor_class (instructor_id, class_id, start_time)
values 
(1, 1, NULL),
(1, 2, NULL),
(2, 1, NULL),
(3, 3, NULL);
-- Lệnh truy vấn 

SELECT st.id, st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id;

SELECT st.id, st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id
WHERE st.name = 'nguyen minh hai';

SELECT st.id, st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id
WHERE st.name LIKE "nguyen%" ;

SELECT st.id, st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id
WHERE st.name LIKE "%hai" OR st.name LIKE "%huynh";

SELECT st.id, st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id
WHERE st.point > 5;

SELECT st.id, st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id
WHERE st.point = 4 OR st.point = 6 or st.point =8 ;

SELECT point, COUNT(*)  as student_count
FROM student 
GROUP BY point ;

SELECT point, COUNT(*) as student_count
FROM student
GROUP BY point
HAVING point > 5 ;

SELECT point , COUNT(*) as student_count
FROM student
GROUP BY point
HAVING point > 5 AND student_count >=2;

SELECT st.name, st.gender, st.birthday, st.email, st.point, cl.name AS class_name
FROM student st
JOIN class cl ON st.class_id = cl.id
WHERE cl.name = "c1121g1"
ORDER BY point DESC





