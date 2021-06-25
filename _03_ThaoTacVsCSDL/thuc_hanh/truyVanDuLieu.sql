USE bai2_th_QuanLySinhVien;
SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE credit < 10;

SELECT S.student_id, S.student_name, C.class_name
FROM Student S join Class C on S.class_id = C.class_id
WHERE C.class_name = 'A1';


SELECT S.student_id, S.student_name, Sub.sub_name, M.mark
FROM Student S join Mark M on S.student_id = M.student_id join subject Sub on M.sub_id = Sub.sub_id
WHERE Sub.sub_name = 'CF';