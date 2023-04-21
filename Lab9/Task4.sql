USE UNIVER;
-- Задание 1
DECLARE @t integer = 2, @x integer = 1, @z numeric(12, 5);

IF (@t > @x)
BEGIN
    SELECT @z = CAST(POWER(SIN(@t), 2) AS NUMERIC);
    PRINT 'z = sin^2(t) = ' + CAST(@z AS CHAR);
end
ELSE IF (@t < @x)
BEGIN
    SELECT @z = 4 * (@t + @x);
    PRINT 'z = 4 * (t + x) = ' + CAST(@z AS CHAR);
end
ELSE IF (@t = @x)
BEGIN
    SELECT @z = 1 - EXP(@x - 2);
    PRINT '1 - e^(x - 2) = ' + CAST(@z AS CHAR);
end

-- Задание 2
DECLARE @fullName varchar(50) = (SELECT TOP(1) STUDENT.NAME FROM STUDENT), @shortName varchar(20);
SET @shortName = CONCAT(
    LEFT(@fullName, CHARINDEX(' ', @fullName)),
    ' ',
    LEFT(SUBSTRING(@fullName, CHARINDEX(' ', @fullName) + 1, LEN(@fullName)), 1),
    '. ',
    LEFT(SUBSTRING(@fullName, CHARINDEX(' ', @fullName, CHARINDEX(' ', @fullName) + 1) + 1, LEN(@fullName)), 1),
    '.'
    );
SELECT @shortName [Сокращенное_ФИО];

-- Задание 3
DECLARE @currentDate datetime = GETDATE();
DECLARE @nextMonthDate datetime = DATEADD(MONTH, 1, @currentDate);

SELECT NAME, BDAY, DATEDIFF(YEAR, BDAY, @currentDate) FROM STUDENT WHERE MONTH(BDAY) LIKE MONTH(@nextMonthDate);

-- Задание 4
DECLARE @weekDay varchar(10);
SELECT DATENAME(WEEKDAY, PDATE) [День_недели] FROM PROGRESS INNER JOIN STUDENT S on S.IDSTUDENT = PROGRESS.IDSTUDENT
WHERE IDGROUP = 18 AND SUBJECT LIKE 'BD';