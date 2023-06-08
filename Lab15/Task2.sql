USE UNIVER;

CREATE TRIGGER TR_TEACHER_DEL ON TEACHER AFTER DELETE
    AS DECLARE @initials char(10), @teachers_name nvarchar(100), @gender char(1), @pulpit char(20), @in nvarchar(300);
    PRINT N'Операция удаления:';
    SET @initials = (SELECT TEACHER FROM deleted);
    SET @teachers_name = (SELECT TEACHER_NAME FROM deleted);
    SET @gender = (SELECT GENDER FROM deleted);
    SET @pulpit = (SELECT PULPIT FROM deleted);
    SET @in = @initials + ' ' + @teachers_name + ' ' + @gender + ' ' + @pulpit;
    INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL', @in);
    RETURN;

DELETE TEACHER WHERE TEACHER LIKE 'DTK';

SELECT * FROM TR_AUDIT;