--��֤��ʵ��
--1
USE LMS
GO 
DECLARE @DEPT VARCHAR(20)
SELECT @DEPT=DEPT FROM S WHERE SNAME='����'
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
Select �Ա�=case sex
 when '��' then 'M'
 when 'Ů' then 'F'
 else '�������'
 end
From s

select * from S

SELECT �Ա�=CASE 
WHEN SEX= '��' THEN 'M'
WHEN SEX= 'Ů' THEN 'F'
ELSE 'ERROR'
END
FROM S

update S set DEPT=
case DEPT
when '�����ϵ' then 'CS'
when '��Ϣϵ' then 'IS'
when '��ѧϵ' then 'MA'
when '����ϵ' then 'PH'
end

INSERT INTO S (SNO, SNAME, DEPT, AGE, SEX) VALUES
('200512', '����', '�����ϵ', 20, '��'),
('200518', '����', '�����ϵ', 19, 'Ů'),
('200018', '����', '��ѧϵ', 18, 'Ů'),
('200511', '����', '����ϵ', 20, '��'),
('200510', '����', '��Ϣϵ', 19, '��'),
('200513', '����', '����ϵ', 19, '��'),
('200514', '�����', '��Ϣϵ', 19, 'Ů'),
('200012', 'ŷ����', '��ѧϵ', 20, '��'),
('200515', '������', '��ѧϵ', 23, 'Ů');

DELETE FROM S;

UPDATE S
SET DEPT = 
    CASE SNO
        WHEN '200512' THEN '�����ϵ'
        WHEN '200518' THEN '�����ϵ'
        WHEN '200018' THEN '��ѧϵ'
        WHEN '200511' THEN '����ϵ'
        WHEN '200510' THEN '��Ϣϵ'
        WHEN '200513' THEN '����ϵ'
        WHEN '200514' THEN '��Ϣϵ'
        WHEN '200012' THEN '��ѧϵ'
        WHEN '200515' THEN '��ѧϵ'
    END
WHERE SNO IN ('200512', '200518', 
'200018', '200511', '200510', '200513',
'200514', '200012', '200515');


UPDATE S
SET DEPT = '�����ϵ'
WHERE SNAME = '����';
UPDATE S
SET DEPT = '��Ϣϵ'
WHERE SNAME = '�����';
UPDATE S
SET DEPT = '��Ϣϵ'
WHERE SNO = '200510';
UPDATE S
SET DEPT = '�����ϵ'
WHERE SNAME = '����';

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

 --�� �鿴�洢����:
Sp_help SCLIST
--�� �������洢����
Sp_rename 'SCLIST', 'STUDENTSCORE'

EXEC STUDENTSCORE

--�����ʵ��

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
        WHEN 'IS' THEN '��Ϣϵ'
        WHEN 'CS' THEN '�����ϵ'
        WHEN 'PH' THEN '����ϵ'
        WHEN 'MA' THEN '��ѧϵ'
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
  -- �� SC ���в���ѡ�μ�¼
  INSERT INTO SC (SNo, CNo)
  VALUES (@SNo, @CNo);
  
  -- �� C ���ж�Ӧ�γ̵� seleNUM �ֶμ� 1
  UPDATE C
  SET seleNUM = seleNUM + 1
  WHERE CNo = @CNo;
END;

-- ���ô洢����������ѡ�μ�¼
EXEC InsertCourse @SNo = '200512', @CNo = 'c03';

SELECT * FROM SC;

UPDATE C
SET seleNUM = seleNUM - 1
WHERE CNo = 'c02';