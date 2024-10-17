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
    total_price decimal(10, 2),
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


INSERT INTO customer (name, age) VALUES
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);


INSERT INTO order_bill (customer_id, order_date, total_price) VALUES
(1, '2006-03-21', NULL),
(2, '2006-03-23', NULL),
(1, '2006-03-16', NULL);


INSERT INTO product (name, price) VALUES
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);


INSERT INTO orderdetail (order_bill_id, product_id, order_quantity) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- truy vấn
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Orderbill
SELECT ob.id AS oID, ob.order_date AS oDate, ob.total_price AS oPrice
FROM order_bill ob;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.name AS cName, p.name AS pName
FROM customer c
JOIN order_bill ob ON c.id = ob.customer_id
JOIN orderdetail od ON ob.id = od.order_bill_id
JOIN product p ON od.product_id = p.id;
-- hiển thị khách hàng chưa từng mua hàng
SELECT c.name AS cName
FROM customer c
LEFT JOIN order_bill ob ON c.id = ob.customer_id
WHERE ob.id IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT ob.id AS oID, ob.order_date AS oDate, SUM(od.order_quantity * p.price) AS oTotalPrice
FROM order_bill ob
JOIN orderdetail od ON ob.id = od.order_bill_id
JOIN product p ON od.product_id = p.id
GROUP BY ob.id, ob.order_date;








