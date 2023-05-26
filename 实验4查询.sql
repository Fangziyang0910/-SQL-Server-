USE LMS
SELECT * FROM S

SELECT SNO,SNAME FROM SSELECT DEPT FROM S SELECT DISTINCT DEPT FROM SSELECT SNO 学号 , SNAME 姓名 FROM SSELECT SNO AS 学号, SNAME AS 姓名 FROM SSELECT * FROM S WHERE DEPT='信息系'SELECT * FROM S WHERE sname like '王%'

SELECT SNO, CNO FROM SC WHERE cno='C01' and SCORE is null
select * from SCwhere cno='C01'SELECT SNO,SNAME FROM S WHERE age in (21,18,22)SELECT MAX(SCORE), AVG(SCORE),MIN(SCORE) FROM SCSELECT MAX(SCORE), AVG(SCORE),MIN(SCORE)
FROM SC
WHERE CNO='C01'

SELECT * FROM SC
WHERE SCORE IS NULL
ORDER BY SNO,CNO DESC

SELECT SNO,COUNT(*)
FROM SC
GROUP BY SNO

SELECT SNO ,COUNT (*) FROM SC
GROUP BY SNO
HAVING COUNT(*)>=3

SELECT SNO 学号, AVG(SCORE) 平均分 FROM SC
GROUP BY SNO
ORDER BY 平均分 DESC

SELECT SNO FROM SC
ORDER BY SNO
GO
SELECT SNO FROM SC
GROUP BY SNO

--设计性实验部分
--1)
SELECT SNO, SNAME
FROM S
WHERE DEPT = '计算机系';
--2)
SELECT DISTINCT SNO
FROM SC;
--3)
SELECT SNO, SCORE
FROM SC
WHERE CNO = 'C01'
ORDER BY SCORE DESC, SNO ASC;
--4)
SELECT CNO, AVG(SCORE) AS 平均分
FROM SC
GROUP BY CNO;
--5)
SELECT COUNT(*) AS 课程总数
FROM C;
--6)
SELECT SNO
FROM SC
GROUP BY SNO
HAVING COUNT(DISTINCT CNO) >= 2;
--7)
SELECT SNO, SNAME, DEPT
FROM S
WHERE AGE BETWEEN 20 AND 22 AND SEX = '男';
--8)
SELECT COUNT(DISTINCT SNO) AS 学生人数
FROM SC
WHERE CNO = 'C01';