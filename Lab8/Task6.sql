USE UNIVER;

CREATE VIEW [Количество кафедр] WITH SCHEMABINDING
AS SELECT FACULTY.FACULTY_NAME, COUNT(*)[Количество кафедр]
FROM dbo.FACULTY INNER JOIN dbo.PULPIT
ON PULPIT.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY.FACULTY_NAME;

INSERT INTO [Количество кафедр]
VALUES ('Faculty')

SELECT * FROM [Количество кафедр] ORDER BY [Количество кафедр]