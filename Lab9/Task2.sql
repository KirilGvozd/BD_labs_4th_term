
USE UNIVER;

DECLARE @totalCapacity int = (SELECT SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM),
    @numberOfAuditoriums integer,
    @avgCapacity real,
    @lowerThanAvg integer,
    @percentageOfAuditoriums numeric(12, 5);

IF @totalCapacity > 200
BEGIN
    SELECT @numberOfAuditoriums = (SELECT COUNT(*) FROM AUDITORIUM);
    SELECT @avgCapacity = (SELECT AVG(AUDITORIUM_CAPACITY) FROM AUDITORIUM);
    SELECT @lowerThanAvg = (SELECT COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @avgCapacity);
    SELECT @percentageOfAuditoriums = CAST(@lowerThanAvg AS REAL) / CAST(@totalCapacity AS REAL);
PRINT N'Количество аудиторий: ' + CAST(@numberOfAuditoriums AS CHAR);
PRINT N'Средняя вместимость аудитории: ' + CAST(@avgCapacity AS CHAR);
PRINT N'Количество аудиторий, где вместимость ниже средней: ' + CAST(@lowerThanAvg AS CHAR);
PRINT N'Процент этих аудиторий от общего количества: ' + CAST(@percentageOfAuditoriums AS CHAR);
end
ELSE PRINT N'Общая вместимость аудиторий' + CAST(@totalCapacity AS CHAR);