USE UNIVER;

CREATE VIEW Преподаватель
AS SELECT TEACHER [Код],
          TEACHER_NAME [Имя_преподавателя],
          GENDER [Пол],
          PULPIT [Код_кафедры] FROM TEACHER

SELECT * FROM Преподаватель;