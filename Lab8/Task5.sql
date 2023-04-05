USE UNIVER;

CREATE VIEW Дисциплины (Код, Дисциплины, Код_кафедры)
AS SELECT TOP 100 * FROM SUBJECT ORDER BY SUBJECT_NAME

SELECT * FROM Дисциплины