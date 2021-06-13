USE bai2_th_QuanLySinhVien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ --
select *
from student
where studentname like "H%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12 --
select *
from class
where month(startdate) =12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5 --
SELECT *
FROM Subject
WHERE Credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2 --
update student
set classid =2
where studentname="hung";
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần. --
select s.studentname,sub.subname,m.mark
from student s join subject sub join mark m
order by m.mark desc,s.studentname asc;