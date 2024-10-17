create database if not exists quan_ly_sinh_vien ; 
use quan_ly_sinh_vien ;

create table class(
id int primary key auto_increment,
name varchar(60) not null,
start_day datetime not null,
status bit 
);

create table student (
id int primary key auto_increment,
name varchar(60) not null,
address varchar(100) ,
phone varchar(30),
status bit ,
class_id int,
foreign key (class_id) references class(id)
);

create table subject (
id int primary key auto_increment,
subname varchar(60) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1
);

create table mark (
id int primary key auto_increment,
sub_id int not null  ,
student_id int not null  ,
mark decimal (5,2) check (mark > 0 and mark <100) ,
exam_time tinyint default 1 ,
foreign key (sub_id) references subject(id),
foreign key (student_id) references student(id)
);

insert into class(name, start_day, status) 
values ("A1", "2008-12-20", 1),("B2", "2008-12-22",1),("B3", current_date() ,0);

INSERT INTO student (name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 INSERT INTO mark (sub_id, student_id, mark, exam_time)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 -- truy vấn
 -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
 SELECT * FROM student
 WHERE student.name like 'h%';
 
 -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
 SELECT * FROM class 
 Where month(start_day) = 12 ;
 
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM subject 
WHERE subject.credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student set class_id = 2
where student.name like "%hung";
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM student;

 
 


