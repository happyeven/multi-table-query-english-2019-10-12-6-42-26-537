# 1.Query the existence of 1 course
SELECT * 
FROM course
WHERE id = 1

# 2.Query the presence of both 1 and 2 courses
-- 本题我的理解是同时查询id为1与id为2的课程信息，若有误，烦请告知
SELECT *
FROM course
WHERE id=1 OR id=2

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT id,name, AVG(score) 
from student,student_course
where student.id = student_course.studentId
GROUP BY id
HAVING AVG(score) >= 60

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT id,name,age,sex
FROM student s LEFT JOIN student_course sc on s.id = sc.studentId
WHERE score IS NULL

# 5.Query all SQL with grades 
SELECT s.id AS id, s.`name` AS name,
   COUNT(sc.courseId) AS course_num, SUM(sc.score) AS score_sum
FROM student s JOIN student_course sc ON s.id = sc.studentId
GROUP BY s.id

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT a.id,a.name,a.age,a.sex
FROM(
SELECT *
FROM student s JOIN student_course sc on s.id = sc.studentId
WHERE sc.courseId = 1
) as a
INNER JOIN
(
SELECT *
FROM student s JOIN student_course sc on s.id = sc.studentId
WHERE sc.courseId = 2
) as b on a.name = b.name

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT id,name,age,sex
FROM student s JOIN student_course sc on s.id = sc.studentId
WHERE courseID = 1 AND score < 60 
ORDER BY score DESC

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT AVG(score),sc.courseId
FROM  student_course sc
GROUP BY sc.courseId
ORDER BY AVG(score) desc,sc.courseId

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT s.name,sc.score
FROM student s , student_course sc ,course c
WHERE s.id = sc.studentId AND sc.courseId = c.id
AND c.name = "Math" AND score < 60 

