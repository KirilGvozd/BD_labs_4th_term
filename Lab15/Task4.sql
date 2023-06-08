USE UNIVER;

-- DROP TRIGGER TR_TEACHER_DEL, TR_TEACHER_INS, TR_TEACHER_UPD;

CREATE TRIGGER TR_TEACHER ON TEACHER AFTER INSERT, DELETE, UPDATE
    AS DECLARE @initials char(10), @teachers_name nvarchar(100), @gender char(1), @pulpit char(20), @in nvarchar(300);
DECLARE @ins int = (SELECT COUNT(*) FROM inserted), @del int = (SELECT COUNT(*) FROM deleted);
IF @ins > 0 AND @del = 0
    BEGIN
        PRINT N'Операция вставки:';
        SET @initials = (SELECT TEACHER FROM inserted);
        SET @teachers_name = (SELECT TEACHER_NAME FROM inserted);
        SET @gender = (SELECT GENDER FROM inserted);
        SET @pulpit = (SELECT PULPIT FROM inserted);
        SET @in = @initials + ' ' + @teachers_name + ' ' + @gender + ' ' + @pulpit;
        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('INS', 'TR_TEACHER_INS', @in);
        RETURN;
    END
IF @ins = 0 AND @del > 0
    BEGIN
        PRINT N'Операция удаления:';
        SET @initials = (SELECT TEACHER FROM deleted);
        SET @teachers_name = (SELECT TEACHER_NAME FROM deleted);
        SET @gender = (SELECT GENDER FROM deleted);
        SET @pulpit = (SELECT PULPIT FROM deleted);
        SET @in = @initials + ' ' + @teachers_name + ' ' + @gender + ' ' + @pulpit;
        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL', @in);
    RETURN;
    END
IF @ins > 0 AND @del > 0
    BEGIN
        PRINT N'Операция обновления:';
        SELECT @initials = TEACHER, @teachers_name = TEACHER_NAME, @gender = GENDER, @pulpit = PULPIT FROM inserted;
        SET @in = CONCAT(@initials, ' ', @teachers_name, ' ', @gender, ' ', @pulpit);
        SELECT @initials = TEACHER, @teachers_name = TEACHER_NAME, @gender = GENDER, @pulpit = PULPIT FROM deleted;
        SET @in = CONCAT(@in, ' ', @initials, ' ', @teachers_name, ' ', @gender, ' ', @pulpit);
        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHER_UPD', @in);
        RETURN;
    END

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('KAS', N'Климович Антон Сергеевич', 'M', 'ISiT');
DELETE TEACHER WHERE TEACHER LIKE 'KAS';
UPDATE TEACHER SET TEACHER = 'CHORT' WHERE TEACHER LIKE 'URB';

SELECT * FROM TR_AUDIT;