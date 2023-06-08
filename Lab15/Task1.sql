USE UNIVER;

CREATE TABLE TR_AUDIT
(
    ID int identity,
    STMT nvarchar(20) CHECK (STMT in ('INS', 'DEL', 'UPD')),
    TRNAME varchar(50),
    CC nvarchar(300)
);


CREATE TRIGGER TR_TEACHER_INS ON TEACHER AFTER INSERT
    AS DECLARE @initials char(10), @teachers_name nvarchar(100), @gender char(1), @pulpit char(20), @in nvarchar(300);

PRINT N'Операция вставки:';
SET @initials = (SELECT TEACHER FROM inserted);
SET @teachers_name = (SELECT TEACHER_NAME FROM inserted);
SET @gender = (SELECT GENDER FROM inserted);
SET @pulpit = (SELECT PULPIT FROM inserted);
SET @in = @initials + ' ' + @teachers_name + ' ' + @gender + ' ' + @pulpit;
INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('INS', 'TR_TEACHER_INS', @in);
RETURN;

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('KAS', N'Климович Антон Сергеевич', 'M', 'ISiT');

SELECT * FROM TR_AUDIT;