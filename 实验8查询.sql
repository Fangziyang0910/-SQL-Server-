--验证性实验
--1
USE LMS
GO 
DECLARE @DEPT VARCHAR(20)
SELECT @DEPT=DEPT FROM S WHERE SNAME='李勇'
SELECT SNO FROM S WHERE DEPT=@DEPT



DECLARE @X INT, @Y INT
SET @X=0
SELECT @Y=1
WHILE @Y<20
 BEGIN
 SET @X=@X+@Y
 SELECT @Y=@Y+2
 PRINT STR(@Y)+ ' IN THE LOOP'
IF @Y>14 
BREAK
 END
PRINT 'OUT OF THE LOOP'

--2
Select 性别=case sex
 when '男' then 'M'
 when '女' then 'F'
 else '输入出错'
 end
From s

select * from S

SELECT 性别=CASE 
WHEN SEX= '男' THEN 'M'
WHEN SEX= '女' THEN 'F'
ELSE 'ERROR'
END
FROM S

update S set DEPT=
case DEPT
when '计算机系' then 'CS'
when '信息系' then 'IS'
when '数学系' then 'MA'
when '物理系' then 'PH'
end

INSERT INTO S (SNO, SNAME, DEPT, AGE, SEX) VALUES
('200512', '李勇', '计算机系', 20, '男'),
('200518', '刘晨', '计算机系', 19, '女'),
('200018', '王敏', '数学系', 18, '女'),
('200511', '杨扬', '物理系', 20, '男'),
('200510', '张立', '信息系', 19, '男'),
('200513', '张立', '物理系', 19, '男'),
('200514', '王点点', '信息系', 19, '女'),
('200012', '欧阳雨', '数学系', 20, '男'),
('200515', '刘依依', '数学系', 23, '女');

DELETE FROM S;

UPDATE S
SET DEPT = 
    CASE SNO
        WHEN '200512' THEN '计算机系'
        WHEN '200518' THEN '计算机系'
        WHEN '200018' THEN '数学系'
        WHEN '200511' THEN '物理系'
        WHEN '200510' THEN '信息系'
        WHEN '200513' THEN '物理系'
        WHEN '200514' THEN '信息系'
        WHEN '200012' THEN '数学系'
        WHEN '200515' THEN '数学系'
    END
WHERE SNO IN ('200512', '200518', 
'200018', '200511', '200510', '200513',
'200514', '200012', '200515');


UPDATE S
SET DEPT = '计算机系'
WHERE SNAME = '刘晨';
UPDATE S
SET DEPT = '信息系'
WHERE SNAME = '王点点';
UPDATE S
SET DEPT = '信息系'
WHERE SNO = '200510';
UPDATE S
SET DEPT = '计算机系'
WHERE SNAME = '李勇';

--4

CREATE PROC SCLIST
AS
SELECT SNO,CNO, SCORE FROM SC WHERE SNO IN 
(SELECT SNO FROM S WHERE DEPT='CS')

EXEC SCLIST

DROP PROCEDURE SCLIST

CREATE PROC SC_PROC @xh varchar(10) 
 AS 
SELECT cno , SCORE
 From sc
 Where sc.sno=@xh

 EXEC SC_PROC '200512'

 --5

 --① 查看存储过程:
Sp_help SCLIST
--② 重命名存储过程
Sp_rename 'SCLIST', 'STUDENTSCORE'

EXEC STUDENTSCORE

--设计性实验

--1
SELECT @@VERSION AS 'SQL Server Version';

SELECT GETDATE() AS 'Current System Time';

--2


CREATE PROCEDURE CalculateFactorialSum
    @n INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sum INT = 0;
    DECLARE @i INT = 1;

    WHILE @i <= @n
    BEGIN
        DECLARE @factorial INT = 1;
        DECLARE @j INT = 1;

        WHILE @j <= @i
        BEGIN
            SET @factorial = @factorial * @j;
            SET @j = @j + 1;
        END

        SET @sum = @sum + @factorial;
        SET @i = @i + 1;
    END

    SELECT @sum AS 'Factorial Sum';
END


EXEC CalculateFactorialSum @n = 5;

--3

UPDATE S
SET DEPT = 
    CASE DEPT
        WHEN 'IS' THEN '信息系'
        WHEN 'CS' THEN '计算机系'
        WHEN 'PH' THEN '物理系'
        WHEN 'MA' THEN '数学系'
        ELSE DEPT
    END;

SELECT * FROM S;

--4

ALTER TABLE C
ADD seleNUM INT DEFAULT 0;

SELECT * FROM C

UPDATE C
SET seleNUM = (
  SELECT COUNT(*)
  FROM SC
  WHERE SC.CNO = C.CNO
);


CREATE PROCEDURE InsertCourse
  @SNo VARCHAR(10),
  @CNo VARCHAR(10)
AS
BEGIN
  -- 在 SC 表中插入选课记录
  INSERT INTO SC (SNo, CNo)
  VALUES (@SNo, @CNo);
  
  -- 在 C 表中对应课程的 seleNUM 字段加 1
  UPDATE C
  SET seleNUM = seleNUM + 1
  WHERE CNo = @CNo;
END;

-- 调用存储过程来插入选课记录
EXEC InsertCourse @SNo = '200512', @CNo = 'c03';

SELECT * FROM SC;

UPDATE C
SET seleNUM = seleNUM - 1
WHERE CNo = 'c02';