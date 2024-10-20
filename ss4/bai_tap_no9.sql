create database bai_tap_no9;
use bai_tap_no9;

create table product
(
    id                  int primary key auto_increment,
    product_code        int,
    product_name        varchar(100),
    product_price       double,
    product_amount      int,
    product_description varchar(150),
    product_status      varchar(100)
);
INSERT INTO product (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES (1001, 'Máy Giặt', 5000000.00, 10, 'Máy giặt tự động, 7kg', 'Còn hàng'),
       (1002, 'Tủ Lạnh', 8000000.00, 5, 'Tủ lạnh 2 cánh, 300L', 'Còn hàng'),
       (1003, 'Điều Hòa', 12000000.00, 8, 'Điều hòa 12000 BTU', 'Còn hàng'),
       (1004, 'Quạt', 500000.00, 20, 'Quạt điện, 3 tốc độ', 'Còn hàng'),
       (1005, 'Bếp Điện', 2000000.00, 0, 'Bếp điện từ, 2 bếp', 'Hết hàng'),
       (1006, 'Lò Vi Sóng', 1500000.00, 12, 'Lò vi sóng, 20L', 'Còn hàng');

-- truy vấn
EXPLAIN
SELECT *
FROM product
WHERE product_price > 5000000
  AND product_amount < 15;


EXPLAIN
SELECT *
FROM product
WHERE product_code = 1001;

-- tạo chỉ mục (index) cho bảng produce,tại cột produce_code

CREATE UNIQUE INDEX code_index on product (product_code);

-- tạo composite index cho bảng product , tại cột product_name, product_price

CREATE INDEX name_price_index on product (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết câu lệnh của bạn thực thi như thế nào.

EXPLAIN
SELECT *
FROM product
WHERE product_price > 5000000
  AND product_amount < 15;
EXPLAIN
SELECT *
FROM product
WHERE product_code = 1001;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status
FROM product;

SELECT *
FROM product_view;

-- sửa đổi product_view
UPDATE product_view
SET product_price = 650000
WHERE product_code = 1001;

SELECT *
FROM product_view
WHERE product_code = 1001;

-- xóa view
DROP VIEW product_view;

-- tạo store procedure để lấy tất cả các thông tin trong bảng
DELIMITER $$
CREATE PROCEDURE get_all_product()
BEGIN
    SELECT * FROM product;
end $$
DELIMITER ;

-- gọi store procedure
CALL get_all_product();

-- tạo trigger để lưu trữ thay đổi product_amount vào bảng và khi có row nào về 0 thì thay đổi trạng thái thành hết hàng

CREATE TABLE history_changes
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    product_id         INT, -- Thêm cột để lưu id sản phẩm (nếu cần)
    old_product_amount INT,
    new_product_amount INT,
    change_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER update_changes
    AFTER UPDATE
    ON product
    FOR EACH ROW
BEGIN
    INSERT INTO history_changes (product_id, old_product_amount, new_product_amount, change_date)
    VALUES (OLD.id, OLD.product_amount, NEW.product_amount, NOW());
END $$

DELIMITER ;


-- Hàm cập nhập số lượng sản phẩm và tình trạng sản phẩm:
DELIMITER $$

CREATE FUNCTION update_product_status(p_product_amount INT)
    RETURNS VARCHAR(100)
    DETERMINISTIC  -- Thêm thuộc tính này
BEGIN
    RETURN IF(p_product_amount = 0, 'Hết Hàng', 'Còn hàng');
END $$

DELIMITER ;


-- Hàm thêm sản phẩm vào product
DELIMITER $$

CREATE PROCEDURE add_product(
    IN p_product_code INT,
    IN p_product_name VARCHAR(100),
    IN p_product_price DOUBLE,
    IN p_product_amount INT,
    IN p_product_description VARCHAR(150)
)
BEGIN
    INSERT INTO product (product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_product_code,
            p_product_name,
            p_product_price,
            p_product_amount,
            p_product_description,
            update_product_status(p_product_amount) -- Gọi hàm để tự động xác định trạng thái
           );
END $$

DELIMITER ;
-- xóa  sản phẩm
DELIMITER $$
CREATE PROCEDURE delete_product(
    IN p_product_code INT
)
BEGIN
    DELETE
    FROM product
    WHERE product_code = p_product_code;
END $$
DELIMITER ;
-- Hàm update sản phẩm
DELIMITER $$
CREATE PROCEDURE update_product(
    IN p_product_code INT,
    IN p_product_name VARCHAR(100),
    IN p_product_price DOUBLE,
    IN p_product_amount INT,
    IN p_product_description VARCHAR(150)
)
BEGIN
    UPDATE product
    SET product_code        = p_product_code,
        product_name        = p_product_name,
        product_price       = p_product_price,
        product_amount      = p_product_amount,
        product_description = p_product_description,
        product_status      = update_product_status(p_product_amount)
    WHERE product_code = p_product_code;
END $$
DELIMITER ;
-- thử các hàm
CALL add_product(1007, 'Nồi Cơm Điện', 1500000.00, 5, 'Nồi cơm điện 1.8L');















