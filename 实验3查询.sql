-- 创建 S 表
CREATE TABLE S (
  SNO VARCHAR(10) NOT NULL,
  SNAME VARCHAR(20),
  DEPT VARCHAR(20),
  AGE INT,
  SEX CHAR(4),
  PRIMARY KEY (SNO)
);

-- 创建 C 表
CREATE TABLE C (
  CNO VARCHAR(10) NOT NULL,
  CNAME VARCHAR(20),
  cpno VARCHAR(10),
  credit INT,
  PRIMARY KEY (CNO)
);

-- 创建 SC 表
CREATE TABLE SC (
  SNO VARCHAR(10) NOT NULL,
  CNO VARCHAR(10) NOT NULL,
  SCORE DECIMAL,
  PRIMARY KEY (SNO, CNO),
  FOREIGN KEY (SNO) REFERENCES S(SNO),
  FOREIGN KEY (CNO) REFERENCES C(CNO)
);

INSERT INTO S (SNO, SNAME, DEPT, AGE, SEX)
VALUES 
('200512', '李勇', '计算机系', 20, '男'),
('200518', '刘晨', '计算机系', 19, '女'),
('200018', '王敏', '数学系', 18, '女'),
('200511', '杨扬', '物理系', 20, '男'),
('200510', '张立', '信息系', 19, '男'),
('200513', '张立', '物理系', 19, '男'),
('200514', '王点点', '信息系', 19, '女'),
('200012', '欧阳雨', '数学系', 20, '男'),
('200515', '刘依依', '数学系', 23, '女');


SELECT * FROM S;

INSERT INTO C (CNO, CNAME, cpno, credit)
VALUES 
('c01', '数据库原理', 'c03', 4),
('c02', '信息系统', 'c01', 4),
('c03', '数据结构', null, 6),
('c04', 'DB_设计', 'c01', 3);

SELECT * FROM C;

INSERT INTO SC (SNO, CNO, SCORE)
VALUES 
('200512', 'c02', 70),
('200512', 'c03', null),
('200512', 'c04', null),
('200515', 'c01', 80),
('200518', 'c03', 95),
('200018', 'c01', 80),
('200518', 'c02', 45),
('200511', 'c02', 78),
('200511', 'c01', 45),
('200511', 'c03', 89),
('200514', 'c02', 78),
('200514', 'c01', 45),
('200514', 'c03', 89),
('200514', 'c04', 78);

SELECT * FROM SC;