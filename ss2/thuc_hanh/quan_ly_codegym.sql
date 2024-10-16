CREATE DATABASE IF NOT EXISTS codegym_management;
USE codegym_management;

CREATE TABLE IF NOT EXISTS gender (
    id INT PRIMARY KEY AUTO_INCREMENT,
    value ENUM('Male', 'Female', 'Other') NOT NULL
);

CREATE TABLE IF NOT EXISTS account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) unique NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS classroom (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    classroom_name varchar(50)
);

CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender_id INT NOT NULL,
    FOREIGN KEY (gender_id) REFERENCES gender(id),
    email VARCHAR(100) NOT NULL UNIQUE,
    score DECIMAL(5,2),
    jame_account_id INT NOT NULL,
    FOREIGN KEY (jame_account_id) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender_id INT NOT NULL,
    FOREIGN KEY (gender_id) REFERENCES gender(id),
    salary DECIMAL(10,2) NOT NULL
);


CREATE TABLE IF NOT EXISTS class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    theory_class_id INT NOT NULL,
    FOREIGN KEY (theory_class_id) REFERENCES classroom(classroom_id),
    practical_class_id INT NOT NULL,
    FOREIGN KEY (practical_class_id) REFERENCES classroom(classroom_id)
);
CREATE TABLE IF NOT EXISTS enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);
insert into  gender (value) VALUES ('Male'), ('Female'), ('Other');
insert into account (username, password)
 values ("minh1","123456"),("minh2","1234567"),("minh3","123455"),("minh4","1234536");
insert into student(name, date_of_birth, gender_id, email, score, jame_account_id) 
values
("minh", "1991-05-18", 1, "minhdhh91@gmail.com",69.4,1),
("Lan", "1991-05-18", 2, "landhh91@gmail.com",70.9,2),
("Linh"," 1991-05-18", 2, "linhdhh91@gmail.com",72.9,3),
("Tuấn"," 1991-05-18", 3, "tuandhh91@gmail.com",56.9,4);
insert into classroom (classroom_name) 
values ("alan"),("Tim"),("Andy");
insert into teacher(name, date_of_birth, gender_id, salary)
values
("Tony", "1999-04-26", 1, 575.99),
("trung", "1989-04-26", 1, 535.99),
("lan", "1969-04-26", 2, 571.99);
select gender_id from student ;
INSERT INTO class (class_name, teacher_id, theory_class_id, practical_class_id)
VALUES 
("Java fullstack", 1, 1, 2),
("Web Development", 2, 2, 3),
("Database Design", 3, 1, 3);

