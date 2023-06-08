USE UNIVER;

CREATE TRIGGER TR_TEACHER_UPD ON TEACHER AFTER UPDATE
    AS DECLARE @initials char(10), @teachers_name nvarchar(100), @gender char(1), @pulpit char(20), @in nvarchar(300);

PRINT N'Операция обновления:';
    SELECT @initials = TEACHER, @teachers_name = TEACHER_NAME, @gender = GENDER, @pulpit = PULPIT FROM inserted;
    SET @in = CONCAT(@initials, ' ', @teachers_name, ' ', @gender, ' ', @pulpit);
    SELECT @initials = TEACHER, @teachers_name = TEACHER_NAME, @gender = GENDER, @pulpit = PULPIT FROM deleted;
    SET @in = CONCAT(@in, ' ', @initials, ' ', @teachers_name, ' ', @gender, ' ', @pulpit);
    INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHER_UPD', @in);
    RETURN;

UPDATE TEACHER SET GENDER = 'm' WHERE TEACHER LIKE 'DTK';

SELECT * FROM TR_AUDIT;