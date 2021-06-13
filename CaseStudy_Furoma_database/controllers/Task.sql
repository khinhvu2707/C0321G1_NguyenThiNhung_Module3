-- Task 2 :Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự --
use furoma;
select *
from nhan_vien
where (ho_ten_nhan_vien like "T%" or ho_ten_nhan_vien like "H%" or ho_ten_nhan_vien like "K%") and length(ho_ten_nhan_vien)<=15;

-- Task 3 :Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị” --
use furoma;
select * ,ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) as age
from khach_hang
where (ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) between 18 and 50) and dia_chi in ("Đà Nẵng","Quảng Trị");

-- Task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. --
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.--
use furoma;
select k.id_khach_hang,k.ho_ten_khach_hang, count(h.id_khach_hang) as so_hop_dong
from khach_hang k join hop_dong h on k.id_khach_hang=h.id_khach_hang 
where k.id_loai_khach =1
group by(id_khach_hang)
order by count(id_khach_hang);

-- Task 5 :	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien --
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng.-- 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). --
