USE UNIVER;

CREATE VIEW Количество_кафедр
AS SELECT FACULTY_NAME [Факультет],
          COUNT(PULPIT) [Количетсво_кафедр]
FROM FACULTY INNER JOIN PULPIT ON FACULTY.FACULTY = PULPIT.FACULTY
GROUP BY FACULTY_NAME

SELECT * FROM Количество_кафедр ORDER BY Количество_кафедр.Количетсво_кафедр