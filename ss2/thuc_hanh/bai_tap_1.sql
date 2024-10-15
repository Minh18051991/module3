create database if not exists erd_mo_hinh_quan_he;
use erd_mo_hinh_quan_he;

create table phieu_xuat (
so_phieu_xuat int primary key auto_increment,
ngay_xuat date
);
create table vat_tu (
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(100)
);
create table phieu_nhap (
so_phieu_nhap int primary key auto_increment,
ngay_nhap date
);
create table don_dat_hang(
so_don_hang int primary key auto_increment ,
ngay_xuat_don date
);
create table nha_cung_cap(
id int primary key auto_increment,
ten varchar(50),
dia_chi varchar(50)
);
create table chi_tiet_phieu_xuat (
so_phieu_xuat int,
ma_vat_tu int,
don_gia_xuat decimal(10,2),
so_luong_xuat int,
primary key (so_phieu_xuat, ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_phieu_nhap (
so_phieu_nhap int,
ma_vat_tu int,
don_gia_nhap decimal(10,2),
so_luong_nhap int ,
primary key (so_phieu_nhap, ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu INT,
so_don_hang INT,
PRIMARY KEY (ma_vat_tu, so_don_hang),
FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
FOREIGN KEY(so_don_hang) REFERENCES don_dat_hang(so_don_hang)
);
CREATE TABLE sdt_nha_cung_cap (
    id_nha_cung_cap INT,
    sdt VARCHAR(50),
    PRIMARY KEY (id_nha_cung_cap, sdt),
    FOREIGN KEY (id_nha_cung_cap) REFERENCES nha_cung_cap(id)
);


INSERT INTO vat_tu (ten_vat_tu) VALUES ('Sắt'), ('Xi măng'), ('Gạch');

INSERT INTO phieu_xuat (ngay_xuat) VALUES ('2024-10-01'), ('2024-10-02');

INSERT INTO phieu_nhap (ngay_nhap) VALUES ('2024-09-30'), ('2024-09-29');

INSERT INTO don_dat_hang (ngay_xuat_don) VALUES ('2024-09-25'), ('2024-09-26');

INSERT INTO nha_cung_cap (ten, dia_chi) VALUES ('Công ty A', 'Hà Nội'), ('Công ty B', 'Hồ Chí Minh');

INSERT INTO chi_tiet_phieu_xuat (so_phieu_xuat, ma_vat_tu, don_gia_xuat, so_luong_xuat) 
VALUES (1, 1, 10000.00, 50), (2, 2, 15000.00, 30);

INSERT INTO chi_tiet_phieu_nhap (so_phieu_nhap, ma_vat_tu, don_gia_nhap, so_luong_nhap) 
VALUES (1, 1, 12000.00, 40), (2, 2, 14000.00, 25);

INSERT INTO chi_tiet_don_dat_hang (ma_vat_tu, so_don_hang) 
VALUES (1, 1), (2, 2);
INSERT INTO sdt_nha_cung_cap (id_nha_cung_cap, sdt) 
VALUES (1, '0912345678'), (1, '0945678912'), (2, '0987654321'), (2, '0934567890');


-- TRUY VẤN

SELECT so_phieu_xuat, ngay_xuat
FROM phieu_xuat;

SELECT nc.ten, nc.dia_chi, sdt.sdt
FROM nha_cung_cap nc
JOIN sdt_nha_cung_cap sdt ON nc.id = sdt.id_nha_cung_cap;



