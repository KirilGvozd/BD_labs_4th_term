USE UNIVER;

DECLARE @tv char(20), @t char(300) = '';
DECLARE disciplines CURSOR FOR SELECT SUBJECT FROM SUBJECT WHERE PULPIT LIKE 'ISiT';

OPEN disciplines;
FETCH disciplines INTO @tv;

PRINT N'Дисциплины на кафедре ИСиТ';
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @t = RTRIM(@tv) + ', ' + @t;
    FETCH disciplines INTO @tv;
end;

PRINT @t;
CLOSE disciplines;