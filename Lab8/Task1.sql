USE UNIVER;

CREATE VIEW Преподаватель
AS SELECT TEACHER [Код],
          TEACHER_NAME [Имя_преподавателя],
          GENDER [Пол],
          PULPIT [Код_кафедры] FROM TEACHER

INSERT INTO Преподаватель
VALUES ('1', 'oein', 'm', 'ISiT')

SELECT * FROM Преподаватель;