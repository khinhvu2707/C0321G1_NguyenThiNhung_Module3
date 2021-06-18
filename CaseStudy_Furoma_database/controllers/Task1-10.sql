-- TASK 2 :Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự --
   -- * Cách 1 * --
select *
from nhan_vien
where (substring(ho_ten_nhan_vien, character_length(ho_ten_nhan_vien)-instr(reverse(ho_ten_nhan_vien)," ") + 2,instr(reverse(ho_ten_nhan_vien)," ")-1)  like "T%" or  "H%" or  "K%") and length(ho_ten_nhan_vien)<=15;
    -- * Cách 2 * --
 select *
from nhan_vien
where (substring_index(ho_ten_nhan_vien," ", -1) like "T%" or  "H%" or  "K%" ) and (length(ho_ten_nhan_vien) <=15);


-- TASK 3 :Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị” --
use furoma;
select * ,ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) as age
from khach_hang
where (ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) between 18 and 50) and dia_chi in ("Đà Nẵng","Quảng Trị");

-- TASK 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. --
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.--
use furoma;
select k.id_khach_hang,k.ho_ten_khach_hang, count(h.id_khach_hang) as so_hop_dong
from khach_hang k join hop_dong h on k.id_khach_hang=h.id_khach_hang 
where k.id_loai_khach =1
group by(id_khach_hang)
order by count(h.id_khach_hang);

-- TASK 5 :	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien --
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng.-- 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). --
   -- * Cách 1 * --
use furoma;
select k.id_khach_hang,k.ho_ten_khach_hang,l.ten_loai_khach,h.id_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,h.ngay_ket_thuc,d.chi_phi_thue,c.so_luong,dk.gia,if(c.so_luong is null ,d.chi_phi_thue,d.chi_phi_thue+sum(c.so_luong*dk.gia)) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
left join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by h.id_hop_dong,k.id_khach_hang;

  -- * Cách 2 * --
use furoma;
select k.id_khach_hang,k.ho_ten_khach_hang,l.ten_loai_khach,h.id_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,h.ngay_ket_thuc,d.chi_phi_thue,c.so_luong,dk.gia,d.chi_phi_thue+sum(c.so_luong*dk.gia) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
inner join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
inner join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by (h.id_hop_dong)
having h.id_hop_dong is not null
union
select k.id_khach_hang,k.ho_ten_khach_hang,l.ten_loai_khach,h.id_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,h.ngay_ket_thuc,d.chi_phi_thue,null,null,d.chi_phi_thue as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
where h.id_hop_dong not in (select hop_dong_chi_tiet.id_hop_dong from hop_dong_chi_tiet)
union
select k.id_khach_hang,k.ho_ten_khach_hang,l.ten_loai_khach,null,null,null,null,null,null,null,null
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
where k.id_khach_hang not in (select hop_dong.id_khach_hang from hop_dong);


-- TASK 6:	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3). --
use furoma;
select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where dv.id_dich_vu not in (select hop_dong.id_dich_vu from hop_dong where hop_dong.ngay_lam_hop_dong > "2019-01-01" and hop_dong.ngay_lam_hop_dong < "2019-03-31");

-- TASK 7:	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019. --
use furoma;
select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where dv.id_dich_vu in (select hop_dong.id_dich_vu from hop_dong where year(hop_dong.ngay_lam_hop_dong) = "2018" );

-- TASK 8:	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên--
   -- * Cách 1 * --
use furoma;
select ho_ten_khach_hang
from khach_hang
union
select ho_ten_khach_hang
from khach_hang;
   -- * Cách 2 * --
use furoma;
select ho_ten_khach_hang
from khach_hang
group by ho_ten_khach_hang;
   -- * Cách 3 * --
use furoma;
select distinct ho_ten_khach_hang
from khach_hang;

-- TASK 9:	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. -- 
    -- * Cách 1 * --
use furoma;
select month(h.ngay_lam_hop_dong) as thang , count(h.id_hop_dong) as soHopDong
from hop_dong h
where year(h.ngay_lam_hop_dong) = "2019"
group by month(h.ngay_lam_hop_dong);
   -- * Cách 2 * --
create temporary table task9B1(
select k.id_khach_hang,month(h.ngay_lam_hop_dong) as "thang",if(c.so_luong is null ,d.chi_phi_thue,d.chi_phi_thue+sum(c.so_luong*dk.gia)) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
left join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
where year(h.ngay_lam_hop_dong)= "2019" 
group by h.id_hop_dong );
create temporary table task9B2(select thang,sum(tong_tien) as "tong_tien" from task9B1 group by thang);
create temporary table task9B3(
select month(h.ngay_lam_hop_dong) as thang , count(h.id_hop_dong) as soHopDong 
from hop_dong h
where year(h.ngay_lam_hop_dong) = "2019"
group by month(h.ngay_lam_hop_dong));
select task9B3.thang as "Tháng" ,task9B3.soHopDong as "Số hợp đồng",task9B2.tong_tien as "Tổng Doanh Thu" from task9B3 join task9B2 on task9B3.thang=task9B2.thang;
drop table task9B1;
drop table task9B2;
drop table task9B3;

-- TASK 10:	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc,TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet). --
use furoma;
select h.id_hop_dong,h.ngay_lam_hop_dong,h.ngay_ket_thuc,h.tien_dat_coc,count(c.id_hop_dong_chi_tiet) as soLuongDichVuDiKem
from hop_dong h
inner join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
inner join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
group by (h.id_hop_dong);