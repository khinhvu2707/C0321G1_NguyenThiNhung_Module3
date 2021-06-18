-- TASK 11 : Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.--
use furoma;
select dich_vu_di_kem.*
from dich_vu_di_kem
inner join hop_dong_chi_tiet on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
inner join hop_dong on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
inner join khach_hang on hop_dong.id_khach_hang = khach_hang.id_khach_hang
inner join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
where khach_hang.id_loai_khach = 1 and khach_hang.dia_chi in ("Vinh ","Quảng Ngãi");

-- TASK 12:	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ --
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.--
use furoma;
select hd.id_hop_dong,nv.ho_ten_nhan_vien,kh.ho_ten_khach_hang,kh.sdt,dv.ten_dich_vu,count(hdct.id_hop_dong_chi_tiet) as "Số dịch vụ đi kèm",hd.tien_dat_coc,hd.ngay_lam_hop_dong
from hop_dong hd
left join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
left join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
where year(hd.ngay_lam_hop_dong) = "2019" and month(hd.ngay_lam_hop_dong) in ("10","11","12")
group by hdct.id_hop_dong,hd.id_hop_dong
having dv.ten_dich_vu not in (
select dv.ten_dich_vu
from hop_dong hd
left join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
left join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
where year(hd.ngay_lam_hop_dong) = "2019" and month(hd.ngay_lam_hop_dong) in ("01","02","03","04","05","06")
group by hdct.id_hop_dong,hd.id_hop_dong);

-- TASK 13:	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).--
use furoma;
select dich_vu_di_kem.* , count(id_hop_dong_chi_tiet) as "số hợp đồng"
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by (id_dich_vu_di_kem)
having count(id_hop_dong_chi_tiet) >= all (select count(id_hop_dong_chi_tiet)
from hop_dong_chi_tiet
group by (id_dich_vu_di_kem));

-- TASK 14:	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. --
use furoma;
select dich_vu_di_kem.* , count(id_hop_dong_chi_tiet) as "số hợp đồng"
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by (id_dich_vu_di_kem)
having count(id_hop_dong_chi_tiet) = 1;

-- TASK 15:	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019. --
use furoma;
select nv.id_nhan_vien,nv.ho_ten_nhan_vien,td.trinh_do,bp.ten_bo_phan,nv.sdt,nv.dia_chi,count(hd.id_hop_dong) as "Số hợp đồng"
from nhan_vien nv
left join trinh_do td on nv.id_trinh_do = td.id_trinh_do
left join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
left join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where year(hd.ngay_lam_hop_dong) = "2018"
group by hd.id_nhan_vien
having  count(hd.id_hop_dong) <=3
union
select nv.id_nhan_vien,nv.ho_ten_nhan_vien,td.trinh_do,bp.ten_bo_phan,nv.sdt,nv.dia_chi,0
from nhan_vien nv
left join trinh_do td on nv.id_trinh_do = td.id_trinh_do
left join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
where nv.id_nhan_vien not in (select id_nhan_vien from hop_dong);


-- TASK 16:	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019. --
-- ( => Xóa những nhân viên chưa từng lập được hợp đồng nào trong hệ thống ) --
use furoma;
delete  
from nhan_vien
where id_nhan_vien not in (
select distinct hd.id_nhan_vien
from hop_dong hd
where year(hd.ngay_lam_hop_dong) < year(curdate()));

-- TASK 17:	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ. --
use furoma;
create temporary table test(
select k.id_khach_hang ,if(c.so_luong is null ,d.chi_phi_thue,d.chi_phi_thue+sum(c.so_luong*dk.gia)) as tong_tien
from khach_hang k
left join loai_khach l on k.id_loai_khach = l.id_loai_khach
left join hop_dong h on k.id_khach_hang = h.id_khach_hang
left join dich_vu d on h.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet c on h.id_hop_dong = c.id_hop_dong
left join dich_vu_di_kem dk on c.id_dich_vu_di_kem = dk.id_dich_vu_di_kem
where year(h.ngay_lam_hop_dong)= "2019" 
group by h.id_hop_dong 
having (tong_tien) >10000000);
select * from test;
update khach_hang
set id_loai_khach = 1
where id_khach_hang in (
select id_khach_hang from test
) and id_loai_khach =2;
drop table test;

-- TASK 18:	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng). --
-- ( => Chỉ xóa những khách hàng có hợp đồng trước 2016 nhưng không có hợp đồng nào sau năm 2016 ) --
create temporary table task18(select distinct hd.id_khach_hang
from hop_dong hd
where year(hd.ngay_lam_hop_dong) >= "2016");
select * from task18;
use furoma;
delete  
from khach_hang
where id_khach_hang in (
select  hd.id_khach_hang
from hop_dong hd
where year(hd.ngay_lam_hop_dong) < "2016") and id_khach_hang not in( select * from task18);
drop table task18;

-- TASK 19:	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi. --
create temporary table task19(select dich_vu_di_kem.* , count(id_hop_dong_chi_tiet) as "so_lan_su_dung"
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
where year(hop_dong.ngay_lam_hop_dong)=2019
group by (id_dich_vu_di_kem));
use furoma;
update dich_vu_di_kem
set gia = gia*2
where id_dich_vu_di_kem in (select id_dich_vu_di_kem from task19 where so_lan_su_dung >10);
drop table task19;

-- TASK 20:	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select id_nhan_vien as "id", ho_ten_nhan_vien as "họ tên" ,email,sdt as "số điện thoại",ngay_sinh as "Ngày tháng năm sinh",dia_chi as "Địa chỉ"
from nhan_vien
union
select id_khach_hang,ho_ten_khach_hang,email,sdt,ngay_sinh,dia_chi
from khach_hang;