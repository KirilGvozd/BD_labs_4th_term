USE UNIVER;

CREATE PROCEDURE [PAUDITORIUM INSERT] @a char(20), @n varchar(50), @c int = 0, @t char(10)
AS
    BEGIN
        DECLARE @rc int = 1;
        BEGIN TRY
        INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) VALUES (@a, @n, @c, @t);
        RETURN @rc;
        END TRY
        BEGIN CATCH
            PRINT N'Номер ошибки: ' + CAST(ERROR_NUMBER() AS VARCHAR(6));
            PRINT N'Сообщение: ' + ERROR_MESSAGE();
            PRINT N'Серьёзность: ' + CAST(ERROR_SEVERITY() AS VARCHAR(6));
            RETURN -1;
        END CATCH;
    END;

EXECUTE [PAUDITORIUM INSERT] '123-1', 'LB-K', 150, '123-1';