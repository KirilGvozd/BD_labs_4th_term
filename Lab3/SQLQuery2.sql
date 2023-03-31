use Gvozdovskiy_MyBASE;
CREATE TABLE ������ 
	(
		������������ nvarchar(50) primary key,
		���� real unique not null,
		���������� int not null
	);
CREATE TABLE ��������� 
	(
		������������_����� nvarchar(50) primary key,
		����� nvarchar(50) not null,
		���������_���� nvarchar(20) not null
	);
CREATE TABLE ������ 
	(
		�����_������ int primary key,
		������������_������ nvarchar(50) not null foreign key references ������(������������),
		����_������� real not null,
		���������� int not null,
		����_�������� date not null,
		�������� nvarchar(50) not null foreign key references ���������(������������_�����)
	);

--������� 3
ALTER TABLE ������ ADD ����_����������� date;
ALTER TABLE ������ ADD CHECK (���������� > 0);
ALTER TABLE ������ ADD CHECK (����_������� > 0);
ALTER TABLE ������ DROP COLUMN ����_�����������;

--������� 4
INSERT INTO ������(������������, ����, ����������)
	VALUES('Table', 20.5, 3),
		  ('Chair', 15.6, 2);
INSERT INTO ���������(������������_�����, �����, ���������_����)
	VALUES('PinskDrev', 'Pushkina Street, 32', '2AB4321'),
		  ('IKEA', 'Masherova Street, 12', '3AC4141');
INSERT INTO ������(�����_������, ������������_������, ����_�������, ����������, ����_��������, ��������)
	VALUES(1, 'Table', 35.5, 10, '2023-3-21', 'PinskDrev'),
		  (2, 'Chair', 52.5, 7, '2023-3-22', 'IKEA');

--������� 5
SELECT * FROM ���������;
SELECT �����_������, ����_�������� FROM ������;
SELECT COUNT(*) FROM ���������;
SELECT * FROM ������;
UPDATE ������ SET ���������� = ���������� + 2 WHERE ������������ = 'Chair';
SELECT * FROM ������;