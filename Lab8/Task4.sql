USE UNIVER;

CREATE VIEW Лекционные_аудитории AS
SELECT AUDITORIUM [Код],
       AUDITORIUM_TYPE [Наименование_аудитории]
FROM AUDITORIUM WHERE AUDITORIUM_TYPE LIKE 'LK%' WITH CHECK OPTION

INSERT INTO Лекционные_аудитории (Код, Наименование_аудитории) VALUES('123-2', 'LK')

DROP VIEW Аудитории

SELECT * FROM Лекционные_аудитории