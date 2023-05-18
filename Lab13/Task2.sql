USE UNIVER;

ALTER PROCEDURE PSUBJECT @p varchar(20) = NULL, @c int OUTPUT
AS
    BEGIN
        SELECT * FROM SUBJECT WHERE @p = PULPIT;
        SET @c = @@ROWCOUNT;
        RETURN (SELECT COUNT(*) FROM SUBJECT)
    END;

DECLARE @pulpits varchar(20), @numberOfSubjects int = 0, @numberOfRows int = 0;
EXEC @numberOfRows = PSUBJECT @p = 'ISiT', @c = @numberOfSubjects OUTPUT;
PRINT N'Количество всех предметов: ' + CAST(@numberOfRows AS VARCHAR(5));
PRINT N'Кол-во предметов на кафедре ИСиТ: ' + CAST(@numberOfSubjects AS VARCHAR(5));