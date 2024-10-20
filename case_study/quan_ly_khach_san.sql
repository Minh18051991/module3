CREATE DATABASE IF NOT EXISTS quan_ly_khach_san;
USE quan_ly_khach_san;

CREATE TABLE customer_type
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE job_title
( -- Thay đổi tên bảng
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE department
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE education_diploma
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employee
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50) NOT NULL,
    birthday     DATE        NOT NULL,
    citizenid    VARCHAR(50) NOT NULL,
    salary       DOUBLE,
    phone        VARCHAR(50),
    email        VARCHAR(100),
    address      VARCHAR(200),
    department_id        INT,
    job_title_id INT,                                     -- Thay đổi tên cột
    education_diploma_id INT,
    FOREIGN KEY (department_id) REFERENCES department (id),
    FOREIGN KEY (job_title_id) REFERENCES job_title (id), -- Thay đổi tên bảng
    FOREIGN KEY (education_diploma_id) REFERENCES education_diploma (id)
);

CREATE TABLE customer
(
    id               INT AUTO_INCREMENT PRIMARY KEY,
    customer_type_id INT          NOT NULL,
    FOREIGN KEY (customer_type_id) REFERENCES customer_type (id),
    name             VARCHAR(50)  NOT NULL,
    birthday         DATE,
    gender           BIT(1),
    citizenid        VARCHAR(100) NOT NULL,
    phone            VARCHAR(50),
    email            VARCHAR(100),
    address          VARCHAR(100)
);

CREATE TABLE rental_period
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    rental_type VARCHAR(30)
);

CREATE TABLE room_type
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
);

CREATE TABLE service
(
    id               INT PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(30),
    usable_area      INT,
    price            DOUBLE,
    limit_people     INT,
    rental_period_id INT,
    FOREIGN KEY (rental_period_id) REFERENCES rental_period (id),
    room_type_id     INT,
    FOREIGN KEY (room_type_id) REFERENCES room_type (id),
    standard         VARCHAR(50),
    another_service  VARCHAR(100),
    pool_area        INT,
    floor            INT
);

CREATE TABLE contract
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee (id),
    service_id INT,
    FOREIGN KEY (service_id) REFERENCES service (id),
    start_date DATE,
    end_date   DATE,
    deposit    DOUBLE
);

CREATE TABLE addition_service
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    name   VARCHAR(50),
    price  DOUBLE,
    unit   VARCHAR(30),
    status VARCHAR(50)
);

CREATE TABLE specific_contract
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    contract_id         INT,
    FOREIGN KEY (contract_id) REFERENCES contract (id),
    addition_service_id INT,
    FOREIGN KEY (addition_service_id) REFERENCES addition_service (id),
    quantity INT
);

-- Thêm dữ liệu
INSERT INTO job_title (name) -- Thay đổi tên bảng
VALUES ('Quản Lý'),
       ('Nhân Viên');

INSERT INTO department (name)
VALUES ('SaleMarketing'),
       ('Hành Chính'),
       ('Phục vụ'),
       ('Quản lý');

INSERT INTO education_diploma (name)
VALUES ('trung cấp'),
       ('cao đẳng'),
       ('đại học'),
       ('sau đại học');

INSERT INTO customer_type (name)
VALUES ('Diamond'),
       ('Platinium'),
       ('Gold'),
       ('Silver'),
       ('Member');

INSERT INTO employee (name, birthday, citizenid, salary, phone, email, address, department_id, job_title_id,
                      education_diploma_id) -- Thay đổi tên cột
VALUES ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com',
        '295 Nguyễn Tất Thành, Đà Nẵng', 1, 2, 1),
       ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1,
        1, 2),
       ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com',
        'K234/11 Điện Biên Phủ, Gia Lai', 1, 2, 2),
       ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com',
        '77 Hoàng Diệu, Quảng Trị', 1, 2, 4),
       ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com',
        '43 Yên Bái, Đà Nẵng', 2, 1, 1),
       ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com',
        '294 Nguyễn Tất Thành, Đà Nẵng', 2, 1, 3),
       ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com',
        '4 Nguyễn Chí Thanh, Huế', 2, 2, 2),
       ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',
        '111 Hùng Vương, Hà Nội', 2, 1, 4),
       ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng',
        2, 1, 4),
       ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com',
        '6 Hoà Khánh, Đồng Nai', 2, 2, 2);

INSERT INTO customer (customer_type_id, name, birthday, gender, citizenid, phone, email, address)
VALUES (5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com',
        '23 Nguyễn Hoàng, Đà Nẵng'),
       (3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com',
        'K77/22 Thái Phiên, Quảng Trị'),
       (1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com',
        'K323/12 Ông Ích Khiêm, Vinh'),
       (1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com',
        'K453/12 Lê Lợi, Đà Nẵng'),
       (4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com',
        '224 Lý Thái Tổ, Gia Lai'),
       (4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
       (1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com',
        'K123/45 Lê Lợi, Hồ Chí Minh'),
       (3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com',
        '55 Nguyễn Văn Linh, Kon Tum'),
       (1, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com',
        '24 Lý Thường Kiệt, Quảng Ngãi'),
       (2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

INSERT INTO rental_period (rental_type)
VALUES ('year'),
       ('month'),
       ('day'),
       ('hour');

INSERT INTO room_type (name)
VALUES ('villa'),
       ('house'),
       ('room');

INSERT INTO service (name, usable_area, price, limit_people, rental_period_id, room_type_id, standard, another_service,
                     pool_area, floor)
VALUES ('Villa Beach Front', 25000, 10000000.0, 10, 3, 1, 'vip', 'có hồ bơi', 500, 4),
       ('House Princess 01', 14000, 5000000.0, 7, 2, 2, 'vip', 'có thêm bếp nướng', NULL, 3),
       ('Room Twin 01', 5000, 1000000.0, 2, 4, 3, 'normal', 'Có tivi', NULL, NULL),
       ('Villa No Beach Front', 22000, 9000000.0, 8, 3, 1, 'normal', 'Có hồ bơi', 300, 3),
       ('House Princess 02', 10000, 4000000.0, 5, 3, 2, 'normal', 'Có thêm bếp nướng', NULL, 2),
       ('Room Twin 02', 3000, 900000.0, 2, 4, 3, 'normal', 'Có tivi', NULL, NULL);

INSERT INTO contract (
    customer_id, employee_id, service_id, start_date, end_date, deposit
) VALUES
      (1, 3, 3, '2020-12-08', '2020-12-08', 0),
      (3, 7, 1, '2020-07-14', '2020-07-21', 200000),
      (4, 3, 2, '2021-03-15', '2021-03-17', 50000),
      (5, 7, 5, '2021-01-14', '2021-01-18', 100000),
      (2, 7, 6, '2021-07-14', '2021-07-15', 0),
      (7, 7, 6, '2021-06-01', '2021-06-03', 0),
      (4, 7, 4, '2021-09-02', '2021-09-05', 100000),
      (4, 3, 1, '2021-06-17', '2021-06-18', 150000),
      (4, 3, 3, '2020-11-19', '2020-11-19', 0),
      (3, 10, 5, '2021-04-12', '2021-04-14', 0),
      (2, 2, 1, '2021-04-25', '2021-04-25', 0),
      (1, 7, 1, '2021-05-25', '2021-05-27', 0);

INSERT INTO addition_service (name, price, unit, status)
VALUES ('Karaoke', 10000, 'hour', 'convenient, available'),
       ('Motorcycle rental', 10000, 'vehicle', 'one vehicle is broken'),
       ('Bicycle rental', 20000, 'vehicle', 'good'),
       ('Morning buffet', 15000, 'serving', 'full meal, dessert'),
       ('Lunch buffet', 90000, 'serving', 'full meal, dessert'),
       ('Dinner buffet', 16000, 'serving', 'full meal, dessert');

INSERT INTO specific_contract (quantity, contract_id, addition_service_id)
VALUES (5, 2, 4),
       (8, 2, 5),
       (15, 2, 6),
       (1, 3, 1),
       (11, 3, 2),
       (1, 1, 3),
       (2, 1, 2),
       (2, 12, 2);

-- LỆNH TRUY VẤN
-- 1. Tìm tên nhân viên có tên bắt đầu bằng ký tự 'H'
SELECT *
FROM employee
WHERE (name LIKE 'H%' OR name LIKE 'T%' OR name like 'K%')
  and LENGTH(name) <= 16;

-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT *, (YEAR(CURDATE()) - YEAR(birthday)) AS age
FROM customer
WHERE (YEAR(CURDATE()) - YEAR(birthday) BETWEEN 18 AND 50)
  AND (address LIKE '% Đà Nẵng' OR address LIKE '% Quảng Trị');

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”

SELECT c.name, ct.name, COUNT(co.id) as contract_quantity
FROM customer c
         JOIN contract co on c.id = co.customer_id
         JOIN customer_type ct on c.customer_type_id = ct.id
WHERE ct.name = 'Diamond'
GROUP BY c.name
order by contract_quantity ASC;

-- Câu 5
SELECT
    c.id AS ma_khach_hang,
    c.name AS ho_ten,
    ct.name AS ten_loai_khach,
    co.id AS ma_hop_dong,
    s.name AS ten_dich_vu,
    co.start_date AS ngay_lam_hop_dong,
    co.end_date AS ngay_ket_thuc,
    (s.price + SUM(ase.price * sc.quantity)) AS tong_tien
FROM
    customer c
        LEFT JOIN contract co ON c.id = co.customer_id
        LEFT JOIN customer_type ct ON c.customer_type_id = ct.id
        LEFT JOIN service s ON co.service_id = s.id
        LEFT JOIN specific_contract sc ON co.id = sc.contract_id
        LEFT JOIN addition_service ase ON sc.addition_service_id = ase.id
GROUP BY
    co.id, c.id, ct.name, s.name, co.start_date, co.end_date
ORDER BY
    c.id;

-- câu 6 hiển thị thông tin các  service chưa từng được sử dung từ tháng 1,2,3 năm 2021

SELECT se.id          AS ma_dich_vu,
       se.name        AS ten_dich_vu,
       se.usable_area AS dien_tich,
       se.price       As chi_phi_thue,
       ro.name        AS loai_phong
FROM service se
         LEFT JOIN contract c on se.id = c.service_id AND
                                 (c.start_date BETWEEN '2021-01-01' AND '2021-03-31')

         LEFT JOIN room_type ro ON se.room_type_id = ro.id
WHERE c.id IS NULL
GROUP by se.id, se.name;

-- hiển thị thông tin các service từng được đặt hàng trong năm 2020 nhưng chưa từng được đặt hàng trong năm 2021.
SELECT
    se.id AS ma_dich_vu,
    se.name AS ten_dich_vu,
    se.usable_area AS dien_tich,
    se.limit_people AS so_nguoi_toi_da,
    se.price AS chi_phi_thue,
    ro.name AS loai_phong
FROM
    service se
        LEFT JOIN contract c2020 ON se.id = c2020.service_id
        AND c2020.start_date BETWEEN '2020-01-01' AND '2020-12-31'

        LEFT JOIN contract c2021 ON se.id = c2021.service_id
        AND c2021.start_date BETWEEN '2021-01-01' AND '2021-12-31'

        LEFT JOIN room_type ro ON se.room_type_id = ro.id
WHERE
    c2020.id IS NOT NULL AND c2021.id IS NULL
GROUP BY
    se.id;

-- câu 8












