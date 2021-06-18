create database furoma;
use furoma;
create table vi_tri(
id_vi_tri int auto_increment primary key,
ten_vi_tri varchar(45)
);
create table trinh_do(
id_trinh_do int auto_increment primary key,
trinh_do varchar(45)
);
create table bo_phan(
id_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45)
);
create table nhan_vien(
id_nhan_vien int auto_increment primary key,
ho_ten_nhan_vien varchar(45),
id_vi_tri int not null,
id_trinh_do int not null,
id_bo_phan int not null,
ngay_sinh date,
so_cmnd varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (id_vi_tri) references vi_tri(id_vi_tri)
 on delete cascade,
foreign key (id_trinh_do) references trinh_do(id_trinh_do)  on delete cascade ,
foreign key (id_bo_phan) references bo_phan(id_bo_phan)  on delete cascade
);
create table loai_khach(
id_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45)
);
create table khach_hang(
id_khach_hang int auto_increment primary key,
id_loai_khach int not null,
ho_ten_khach_hang varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
create table kieu_thue(
id_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45),
gia int
);
create table loai_dich_vu(
id_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);
create table dich_vu(
id_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue double,
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue)  on delete cascade,
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)  on delete cascade
);
create table hop_dong(
id_hop_dong int auto_increment primary key,
id_nhan_vien int not null,
id_khach_hang int not null,
id_dich_vu int not null,
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc int,
tong_tien int,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien)  on delete cascade,
foreign key (id_khach_hang) references khach_hang(id_khach_hang)  on delete cascade,
foreign key (id_dich_vu) references dich_vu(id_dich_vu)  on delete cascade
);
create table dich_vu_di_kem(
id_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia int default 0,
don_vi int default 0,
trang_thai_kha_dung varchar(45)
);
create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int  auto_increment primary key,
id_hop_dong int not null,
id_dich_vu_di_kem int not null,
so_luong int default 0,
foreign key (id_hop_dong) references hop_dong(id_hop_dong)  on delete cascade,
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)  on delete cascade
);
