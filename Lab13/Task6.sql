USE UNIVER;
GO

CREATE PROCEDURE [PAUDITORIUM INSERTX] @a char(20), @n varchar(50), @c int = 0, @t char(10), @tn varchar(50)
AS DECLARE @rc int = 1;
    BEGIN TRY
        SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
        BEGIN TRAN
            INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES (@n, @tn);
            EXECUTE [PAUDITORIUM INSERT] @a, @n, @c, @t;
            COMMIT TRAN;
        RETURN @rc;
    END TRY
    BEGIN CATCH
        PRINT N'Номер ошибки: ' + CAST(ERROR_NUMBER() AS VARCHAR(6));
        PRINT N'Сообщение: ' + ERROR_MESSAGE();
        IF ERROR_PROCEDURE() IS NOT NULL
        PRINT N'Имя процедуры: ' + ERROR_PROCEDURE();
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        RETURN -1;
    END CATCH;

DECLARE @rc int;
EXECUTE @rc = [PAUDITORIUM INSERTX] '111-1', 'L-K', 100, 'LK-K', N'Лекционная';
PRINT N'Код ошибки ' + CAST(@rc AS VARCHAR(3));