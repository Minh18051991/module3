create
database if not exists quan_ly_khach_san ;
       use
case_study_1;

create table customer_type
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
);
create table posittion
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
create table department
(
    id   int primary key auto_increment,
    name varchar(50);
);
create table education_diploma
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
create table employee
(
    id primary key auto_increment,
    name                 varchar(50) NOT NULL,
    birthday             date        NOT NULL,
    cityzenid            varchar(50),
    salary double,
    phone                varchar(50),
    email                varchar(100),
    address              varchar(200),
    department_id        INT,
    position_id          INT,
    education_diploma_id INT,
    FOREIGN KEY (department_id) REFERENCES department (id),
    FOREIGN KEY (position_id) REFERENCES posittion (id),
    FOREIGN KEY (education_diploma_id) REFERENCES education_diploma (id)
);
create table customer
(
    id               INT AUTO_INCREMENT PRIMARY KEY,
    customer_type_id INT     NOT NULL,
    FOREIGN KEY (customer_type_id) REFERENCES customer_type (id),
    first_
                     name VARCHAR(50) NOT NULL,
    birthday         date,
    gender           bit(1),
    cityzenid        varchar NOT NULL,
    phone            varchar(50),
    email            varchar(100),
    address          varchar(100)

);
create table rental_period
(
    id          INT primary key auto_increment,
    rental_type varchar(30)
);
create table room_type
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
)
create table service
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(30),
    usable_area     int,
    price double,
    limit_peole     int,
    rental_period   INT,
    FOREIGN KEY (rental_period_id) REFERENCES rental_period (id)
        room_type_id INT,
    FOREIGN KEY (room_type_id) REFERENCES room_type (id),
    standard        varchar(50),
    another_service varchar(100),
    pool_area       int,
    floor           int
);
create table contract
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee (id),
    service_id  int,
    FOREIGN KEY (service_id) REFERENCES service (id),
    start_date  date,
    end_date    date,
    deposit double,
)
create table addition_service
(
    id     int primary key auto_increment,
    name   varchar(50),
    price double,
    unit   varchar(30),
    status varchar(50)
);
create table specific_contract
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    contract_id         INT,
    FOREIGN KEY (contract_id) REFERENCES contract (id),
    addition_service_id INT,
    FOREIGN KEY (addition_service_id) REFERENCES addition_service (id),
    quantity            int
);
-- Thêm dữ liệu.
INSERT INTO posittion (name)
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
INSERT INTO employee (name, birthday, cityzenid, salary, phone, email, address,
                      department_id, position_id, education_diploma_id)
VALUES ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121',
        'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
       ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314',
        'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
       ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315',
        'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
       ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232',
        'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
       ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231',
        'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
       ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213',
        'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
       ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553',
        'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
       ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111',
        'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
       ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444',
        'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
       ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111',
        'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);


INSERT INTO customer (customer_type_id, first_name, birthday, gender, cityzenid, phone, email, address)
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

insert into rental_period(rental_type)
values ('year'),
       ('month'),
       ('day'),
       ('hour');
insert into room_type(name)
values ('villa'),
       ('house'),
       ('room');
INSERT INTO service (
    name, usable_area, price, limit_people, rental_period_id, room_type_id, standard, another_service, pool_area, floor
) VALUES
      (
          'Villa Beach Front', 25000, 10000000.0, 10, 1, 2, 'normal', NULL, NULL, 3
      ),
      (
          'House Princess 01', 14000, 5000000.0, 7, 2, 1, 'Có thêm bếp nướng', NULL, NULL, 2
      ),
      (
          'Room Twin 01', 5000, 1000000.0, 2, 2, NULL, 'normal', 'Có tivi', NULL, 4
      ),
      (
          'Villa No Beach Front', 22000, 9000000.0, 8, 1, 2, 'normal', 'Có hồ bơi', 300, 3
      ),
      (
          'House Princess 02', 10000, 4000000.0, 5, 2, 1, 'normal', 'Có thêm bếp nướng', NULL, 2
      ),
      (
          'Room Twin 02', 3000, 900000.0, 2, 2, NULL, 'normal', 'Có tivi', NULL, 4
      );

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
