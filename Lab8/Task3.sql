USE UNIVER;

CREATE VIEW Аудитории AS
SELECT AUDITORIUM [Код],
       AUDITORIUM_TYPE [Наименование_аудитории]
FROM AUDITORIUM WHERE AUDITORIUM_TYPE LIKE 'LK%'

DROP VIEW Аудитории

SELECT * FROM Аудитории