-- TASK 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019” --
use furoma;
create view v_nhan_vien as
select nv.* from nhan_vien nv
inner join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where hd.ngay_lam_hop_dong = "2019-12-12" and nv.dia_chi ="Hải Châu";
select * from v_nhan_vien;

-- TASK22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này --
update v_nhan_vien
set dia_chi = "Liên Chiểu";

-- TASK23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng --
-- Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX --
use furoma;
create unique index IX_KHACHHANG on khach_hang(id_khach_hang);
explain select * from khach_hang where id_khach_hang ="4";
drop index IX_khachhang on khach_hang;
-- TASK 24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index --
use furoma;
alter table khach_hang add index IX_SoDT_DiaChi(sdt,dia_chi);
explain select * from khach_hang where dia_chi ="Vinh";
drop index IX_SoDT_DiaChi on khach_hang;
-- TASK 25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1 --
delimiter //
create procedure sp_1(in delete_id int)
begin
delete from khach_hang
where id_khach_hang = delete_id;
end //
delimiter ;
call sp_1 (20);

-- TASK 26.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan. --
delimiter //
create procedure sp_2(in id_nv int,in id_kh int,in id_dv int,in ngay_lam_hd date,ngay_ket_thuc_hd date,tien int)
begin
if id_nv in (select id_nhan_vien from nhan_vien) then 
  if id_kh in (select id_khach_hang from khach_hang) then
    if id_dv in (select id_dich_vu from dich_vu) then
 insert into hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
 values(id_nv,id_kh,id_dv,ngay_lam_hd,ngay_ket_thuc_hd,tien);
 else select concat("id dịch vụ ",id_dv," không có trong hệ thống") as "error";
   end if;
  else select concat("id khách hàng ",id_kh," không có trong hệ thống") as "error";
  end if;
else select concat("id nhân viên ",id_nv," không có trong hệ thống") as "error";
end if;
end //
delimiter ;
call sp_2(2,111,1,"2018-03-23","2019-03-23",20000000);

drop procedure sp_2;

-- TASK 27.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database --
delimiter //
drop trigger if exists tr_1 //
create trigger tr_1
after delete
on hop_dong for each row
begin
 set @o =(select count(id_hop_dong) as "Số hợp đồng còn lại" from hop_dong);
end //
delimiter ;

set @o =0;
delete from hop_dong where id_hop_dong =1;
select @o as "so_hop_dong"

-- TASK 28.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database --
delimiter //
create trigger tr_2
after update on hop_dong
for each row
begin
if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong)<2 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "ngày kết thúc phải sau ngày làm hợp đồng ít nhất 2 ngày";
end if;
end //
delimiter ;

set @a =0;
update hop_dong set ngay_ket_thuc = '2016-10-02' where id_hop_dong = 2;
drop trigger tr_2;
-- TASK 29.	Tạo user function thực hiện yêu cầu sau: --
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ. --
use furoma;
delimiter //
create function func_1 ()
returns int
deterministic
begin
declare count int;

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
having (tong_tien) >2000000);

set count = (select count(tong_tien) from test);
return count ;
end ; 
// delimiter ;

select `furoma`.`func_1`() as "số dịch vụ";
drop function `furoma`.`func_1`;
drop table test;

-- b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này. --
delimiter //
create function func_2 (id int)
returns int
deterministic
begin
declare thoi_gian int;
 set thoi_gian =( select datediff(ngay_ket_thuc,ngay_lam_hop_dong) from hop_dong where id_hop_dong = id);
 return thoi_gian;
end;
// delimiter ;
select `furoma`.`func_2`(17) as "số ngày";

drop function `furoma`.`func_2`;

-- TASK 30.	Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.--

delimiter //
create procedure sp_3()
begin
create temporary table task301(select dv.id_dich_vu,hd.id_hop_dong,hdct.id_hop_dong_chi_tiet from dich_vu dv
inner join hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
inner join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
where dv.id_loai_dich_vu =3 and year(hd.ngay_lam_hop_dong) between "2015" and "2019");
delete from hop_dong_chi_tiet where id_hop_dong_chi_tiet in (select id_hop_dong_chi_tiet from task301);
delete from hop_dong where id_hop_dong in (select id_hop_dong from task301);
delete from dich_vu where id_dich_vu in (select id_dich_vu from task301);
drop table task301;
end //
delimiter ;
call sp_3;
drop procedure sp_3;


