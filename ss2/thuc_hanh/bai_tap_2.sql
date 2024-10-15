create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer
(
    id   int primary key auto_increment,
    name varchar(50),
    age  smallint
);

create table order_bill
(
    id          int primary key auto_increment,
    customer_id int,
    order_date  date,
    total_price decimal(5, 2),
    foreign key (customer_id) references customer (id)
);
create table product
(
    id    int primary key auto_increment,
    name  varchar(50),
    price decimal(5, 2)
);
create table orderdetail
(
    id            int primary key auto_increment,
    product_id    int,
    order_bill_id int,
    order_quantity int,
    foreign key (order_bill_id) references order_bill (id),
    foreign key (product_id) references product (id)
);


