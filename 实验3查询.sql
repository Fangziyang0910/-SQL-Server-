-- ���� S ��
CREATE TABLE S (
  SNO VARCHAR(10) NOT NULL,
  SNAME VARCHAR(20),
  DEPT VARCHAR(20),
  AGE INT,
  SEX CHAR(4),
  PRIMARY KEY (SNO)
);

-- ���� C ��
CREATE TABLE C (
  CNO VARCHAR(10) NOT NULL,
  CNAME VARCHAR(20),
  cpno VARCHAR(10),
  credit INT,
  PRIMARY KEY (CNO)
);

-- ���� SC ��
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
('200512', '����', '�����ϵ', 20, '��'),
('200518', '����', '�����ϵ', 19, 'Ů'),
('200018', '����', '��ѧϵ', 18, 'Ů'),
('200511', '����', '����ϵ', 20, '��'),
('200510', '����', '��Ϣϵ', 19, '��'),
('200513', '����', '����ϵ', 19, '��'),
('200514', '�����', '��Ϣϵ', 19, 'Ů'),
('200012', 'ŷ����', '��ѧϵ', 20, '��'),
('200515', '������', '��ѧϵ', 23, 'Ů');


SELECT * FROM S;

INSERT INTO C (CNO, CNAME, cpno, credit)
VALUES 
('c01', '���ݿ�ԭ��', 'c03', 4),
('c02', '��Ϣϵͳ', 'c01', 4),
('c03', '���ݽṹ', null, 6),
('c04', 'DB_���', 'c01', 3);

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