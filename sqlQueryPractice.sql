# 1、查询“001”课程比“002”课程成绩高的所有学生的学号
SELECT
	a.studentno
FROM
	(SELECT studentno,score FROM score WHERE courseno=1)a,
	(SELECT studentno,score FROM score WHERE courseno=2)b
WHERE
	a.score>b.score AND a.studentno=b.studentno;

# 2、查询平均成绩大于60分的同学的学号和平均成绩
SELECT
	student.studentname,a.avgScore
FROM
	(SELECT studentno,AVG(score) avgScore FROM score GROUP BY studentno)a,
	student
WHERE
	a.studentno = student.studentno AND a.avgScore > 90;

# 3、查询所有同学的学号、姓名、选课数、总成绩
SELECT
	student.studentno,student.studentname,a.coursenum,a.sumScore
FROM
	(SELECT studentno,COUNT(*) courseNum,SUM(score) sumScore FROM score GROUP BY studentno)a,
	student
WHERE
	student.studentno = a.studentno;

SELECT 
	student.studentno,student.studentname,COUNT(score.courseno),SUM(score.score)
FROM 
	student LEFT JOIN score ON student.studentno = score.studentno 
	GROUP BY student.studentno;

# 4、查询姓“李”的老师的个数
SELECT COUNT(DISTINCT(teachername)) 
FROM teacher
WHERE teachername LIKE '叶%';

# 5、查询没学过“faith”老师课的同学的学号、姓名
SELECT 
	student.studentname,student.studentno 
FROM
	student
WHERE 
	student.studentno
	NOT IN (
		SELECT DISTINCT(score.studentno) 
		FROM score,course,teacher
		WHERE score.courseno = course.courseno 
			AND teacher.teacherno = course.teacherno
			AND teacher.teachername='faith'
	);

# 6、查询学过“001”并且也学过编号“002”课程的同学的学号、姓名
SELECT 
	student.studentno, student.studentname
FROM
	student,score
WHERE
	student.studentno=score.studentno AND score.courseno=1
		AND EXISTS(
				SELECT * 
				FROM score score2
				WHERE score2.studentno = score.studentno
					AND score2.courseno=2
		);

# 7、查询学过“叶平老师”所教的所有课的同学的学号、姓名
SELECT 
	student.* 
FROM
	student
WHERE 
	student.studentno IN (
		SELECT score.studentno
		FROM course, teacher, score
		WHERE course.teacherno=teacher.teacherno 
			AND course.courseno=score.courseno 
			AND teacher.teachername='叶平'zf_user
		GROUP BY score.studentno
		HAVING COUNT(score.courseno)=(
			SELECT COUNT(course.courseno)
			FROM course, teacher
			WHERE teacher.teacherno=course.teacherno
				AND teacher.teachername='叶平'
		)
	);
	
# 8、查询课程编号“002”的成绩比课程编号“001”课程低的所有同学的学号、姓名
SELECT student.studentno, student.studentname
FROM (SELECT student.studentno,student.studentname,score.score ,
		(SELECT score FROM score score2,student
		WHERE score2.studentno=student.studentno 
		AND score2.courseno='002')
	FROM student,score 
	WHERE student.studentno=score.studentno 
	AND score.courseno='001')scoreA
WHERE score2 <score;

# 9、查询所有课程成绩小于97分的同学的学号、姓名
SELECT student.studentno, student.studentname
FROM student, score
WHERE student.studentno 
NOT IN (
	SELECT student.studentno
	FROM student, score
	WHERE student.studentno=score.studentno AND score.score>97)
GROUP BY student.studentno; 

# 10、查询没有学全所有课的同学的学号、姓名
SELECT student.studentno, student.studentname,  #COUNT(score.courseno)
FROM student, score
WHERE student.studentno=score.studentno
GROUP BY student.studentno
HAVING COUNT(score.courseno) < (SELECT COUNT(course.courseno) FROM course);

# 11、查询至少有一门课与学号为“001”的同学所学相同的同学的学号和姓名
SELECT DISTINCT student.studentno,student.studentname 
FROM student,score
WHERE student.studentno=score.studentno  
	AND score.courseno IN(SELECT score.courseno 
			      FROM score
			      WHERE score.studentno=1)
	AND student.studentno != 1		      
;

# 12查询和“002”号的同学学习的课程完全相同的其他同学学号和姓名
SELECT student.studentno,student.studentname
FROM student,score
WHERE student.studentno=score.studentno AND student.studentno!=1
GROUP BY student.studentno
HAVING COUNT(score.courseno) = (SELECT COUNT(*)
				FROM score
				WHERE score.studentno=1)
;

# 13查询所有学生的平均成绩，并从高到低排列
SELECT student.studentno,AVG(score.score)
FROM student,score
WHERE student.studentno=score.studentno
GROUP BY score.studentno
ORDER BY AVG(score.score) DESC;

# 14查询各科的最高分和最低分
SELECT course.courseno,course.coursename, MAX(score.score),MIN(score.score)
FROM score,course
WHERE score.courseno=course.courseno
GROUP BY score.courseno;

# 15查询男生人数
SELECT COUNT(student.studentsex) 男生人数
FROM student
WHERE student.studentsex=1;

# 16查询姓‘小’的学生人数
SELECT COUNT(*) 姓小的人数
FROM student 
WHERE student.studentname LIKE '小%';

# 17查询学生平均成绩及其名次
SELECT student.studentname, AVG(score.score)
FROM student, score
WHERE student.studentno=score.studentno
GROUP BY score.studentno
ORDER BY AVG(score.score) DESC







































