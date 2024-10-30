CREATE DATABASE demo;
USE demo_user;

CREATE TABLE users
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    email   VARCHAR(50) UNIQUE,
    country VARCHAR(120)
);

INSERT INTO users (name, email, country)
VALUES ('John Doe', 'johndoe@example.com', 'USA'),
       ('Jane Smith', 'janesmith@example.com', 'UK'),
       ('Alice Johnson', 'alicejohnson@example.com', 'USA'),
       ('Bob Brown', 'bobbrown@example.com', 'Canada');



CREATE TABLE account
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    user_id  INT,
    password VARCHAR(120),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO account (user_id, password)
VALUES (1, 'password123'), -- John Doe
       (2, 'password345'), -- Jane Smith
       (3, 'password444'); -- Alice Johnson

create table permission
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

create table user_permission
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    user_id       INT,
    permission_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (permission_id) REFERENCES permission (id)
);

insert into permission (id, name)
VALUES (1, 'add'),
       (2, 'edit'),
       (3, 'delete'),
       (4, 'view');

-- truy vấn

DELIMITER //

CREATE PROCEDURE AddUser(
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_country VARCHAR(255),
    OUT p_userId INT
)
BEGIN
    INSERT INTO users (name, email, country) VALUES (p_name, p_email, p_country);
    SET p_userId = LAST_INSERT_ID(); -- Lấy ID của người dùng vừa thêm
END //

DELIMITER ;
DELIMITER //
CREATE PROCEDURE UpdateUser(
    IN p_userId INT,
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_country VARCHAR(255)
)
BEGIN
    UPDATE users
    SET name = p_name,
        email = p_email,
        country = p_country
    WHERE id = p_userId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteUser(IN p_userId INT)
BEGIN
    DELETE FROM users WHERE id = p_userId;
END //

CREATE PROCEDURE GetUserById(IN p_userId INT)
BEGIN
    SELECT * FROM users WHERE id = p_userId;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE GetAllUsersSortedByName()
BEGIN
    SELECT * FROM users ORDER BY name;
END //

DELIMITER ;


-- thử lên Call update_user()