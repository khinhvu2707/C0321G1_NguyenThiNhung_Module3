USE bai2_th_QuanLySinhVien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất --
select *
from subject
where Credit = (select max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất --
select subject.SubID,subject.SubName,subject.Credit,subject.Status,Mark.Mark,Mark.StudentID
from subject
inner join mark on subject.SubID = Mark.SubID
where Mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần --
SELECT S.StudentId,S.StudentName, AVG(Mark) as "diemTrungBinh"
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
order by avg(mark) desc;