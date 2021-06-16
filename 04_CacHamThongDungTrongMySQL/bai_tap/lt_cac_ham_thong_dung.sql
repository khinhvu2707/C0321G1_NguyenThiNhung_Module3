USE bai2_th_quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất --
select *
from subject
where credit = (select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất --
select subject.sub_id ,subject.sub_name,subject.credit,subject.Status,Mark.mark,Mark.student_id
from subject
inner join mark on subject.sub_id = Mark.sub_id 
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần --
SELECT S.student_id,S.student_name, AVG(mark) as "avg"
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
order by avg(mark) desc;