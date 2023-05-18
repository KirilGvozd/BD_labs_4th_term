USE UNIVER;
GO

CREATE PROCEDURE [SUBJECT REPORT] @p char(10)
AS
    DECLARE @rc int = 0;
    BEGIN TRY
        DECLARE @tv char(20), @t char(300) = ' ';
        DECLARE DISCIPLINES CURSOR FOR SELECT SUBJECT FROM SUBJECT WHERE PULPIT = @p;
        IF NOT EXISTS(SELECT SUBJECT FROM SUBJECT WHERE PULPIT = @p) RAISERROR(N'Ошибка', 11, 1);
        ELSE
        OPEN DISCIPLINES
        FETCH DISCIPLINES INTO @tv;
        PRINT N'Дисциплины на кафедре ' + @p;
        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @t = RTRIM(@tv) + ', ' + @t;
            SET @rc = @rc + 1;
            FETCH DISCIPLINES INTO @tv;
        END;
        PRINT @t;
        CLOSE DISCIPLINES;
        RETURN @rc;
    END TRY
    BEGIN CATCH
        PRINT N'Ошибка в параметрах'
        IF ERROR_PROCEDURE() IS NOT NULL
        PRINT N'Имя процедуры: ' + ERROR_PROCEDURE();
        RETURN @rc;
    END CATCH;

EXECUTE [SUBJECT REPORT] 'POiT';