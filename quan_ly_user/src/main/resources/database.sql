CREATE DATABASE demo;
USE demo_user;
create table users
(
    id      int PRIMARY KEY AUTO_INCREMENT,
    name    varchar(50),
    email   varchar(50),
    country varchar(120)
);
INSERT INTO users (name, email, country)
values ('John Doe', 'johndoe@example.com', 'USA'),
       ('Jane Smith', 'janesmith@example.com', 'UK'),
       ('Alice Johnson', 'alicejohnson@example.com', 'USA'),
       ('Bob Brown', 'bobbrown@example.com', 'Canada');
-- Xóa tất cả Id từ 15 trở lên
DELETE
FROM users
WHERE id > 14;

-- Xóa hàng đầu tiên trong bảng

 
