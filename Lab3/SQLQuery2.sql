use Gvozdovskiy_MyBASE;
CREATE TABLE Товары 
	(
		Наименование nvarchar(50) primary key,
		Цена real unique not null,
		Количество int not null
	);
CREATE TABLE Заказчики 
	(
		Наименование_фирмы nvarchar(50) primary key,
		Адрес nvarchar(50) not null,
		Расчётный_счёт nvarchar(20) not null
	);
CREATE TABLE Заказы 
	(
		Номер_заказа int primary key,
		Наименование_товара nvarchar(50) not null foreign key references Товары(Наименование),
		Цена_продажи real not null,
		Количество int not null,
		Дата_поставки date not null,
		Заказчик nvarchar(50) not null foreign key references Заказчики(Наименование_фирмы)
	);

--Задание 3
ALTER TABLE Товары ADD Дата_поступления date;
ALTER TABLE Товары ADD CHECK (Количество > 0);
ALTER TABLE Заказы ADD CHECK (Цена_продажи > 0);
ALTER TABLE Товары DROP COLUMN Дата_поступления;

--Задание 4
INSERT INTO Товары(Наименование, Цена, Количество)
	VALUES('Table', 20.5, 3),
		  ('Chair', 15.6, 2);
INSERT INTO Заказчики(Наименование_фирмы, Адрес, Расчётный_счёт)
	VALUES('PinskDrev', 'Pushkina Street, 32', '2AB4321'),
		  ('IKEA', 'Masherova Street, 12', '3AC4141');
INSERT INTO Заказы(Номер_заказа, Наименование_товара, Цена_продажи, Количество, Дата_поставки, Заказчик)
	VALUES(1, 'Table', 35.5, 10, '2023-3-21', 'PinskDrev'),
		  (2, 'Chair', 52.5, 7, '2023-3-22', 'IKEA');

--Задание 5
SELECT * FROM Заказчики;
SELECT Номер_заказа, Дата_поставки FROM Заказы;
SELECT COUNT(*) FROM Заказчики;
SELECT * FROM Товары;
UPDATE Товары SET Количество = Количество + 2 WHERE Наименование = 'Chair';
SELECT * FROM Товары;