USE UNIVER;

CREATE TRIGGER Task7_Trigger ON AUDITORIUM AFTER INSERT, DELETE, UPDATE
    AS DECLARE @capacity int = (SELECT SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM);
IF @capacity > 410
    BEGIN
       RAISERROR(N'Общая вместимость всех аудиторий не должна быть больше 410', 10, 1);
       ROLLBACK;
    END
    RETURN;

UPDATE AUDITORIUM SET AUDITORIUM_CAPACITY = 1000 WHERE AUDITORIUM = '206-1';
SELECT * FROM TR_AUDIT;