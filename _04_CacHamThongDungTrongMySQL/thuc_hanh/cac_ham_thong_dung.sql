USE bai2_th_QuanLySinhVien;

SELECT address, COUNT(student_id) AS 'total_student'
FROM Student
GROUP BY address;

SELECT S.student_id,S.student_name, AVG(Mark) as "avg"
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name;



SELECT S.student_id,S.student_name, AVG(Mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(mark) > 15;


SELECT S.student_id, S.student_name, AVG(mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM Mark GROUP BY Mark.student_id);