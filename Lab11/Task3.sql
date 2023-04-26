-- Задание 1
USE UNIVER;

DECLARE @tid char(10), @tnm char(40);
DECLARE localCursor CURSOR LOCAL STATIC FOR SELECT IDSTUDENT, NAME FROM STUDENT WHERE IDGROUP = 1;

OPEN localCursor;
PRINT N'Количество строк: ' + CAST(@@CURSOR_ROWS AS VARCHAR(5));
UPDATE STUDENT SET IDGROUP = 2 WHERE BDAY = '1995-11-03';
FETCH localCursor INTO @tid, @tnm;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @tid + ' '+ @tnm;
    FETCH localCursor INTO @tid, @tnm;
end
CLOSE localCursor;

-- Задание 2
USE UNIVER;

DECLARE @tid char(10), @tnm char(40);
DECLARE localCursor CURSOR LOCAL DYNAMIC FOR SELECT IDSTUDENT, NAME FROM STUDENT WHERE IDGROUP = 1;

OPEN localCursor;
PRINT N'Количество строк: ' + CAST(@@CURSOR_ROWS AS VARCHAR(5));
UPDATE STUDENT SET IDGROUP = 2 WHERE BDAY = '1995-11-03';
FETCH localCursor INTO @tid, @tnm;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @tid + ' '+ @tnm;
    FETCH localCursor INTO @tid, @tnm;
end
CLOSE localCursor;