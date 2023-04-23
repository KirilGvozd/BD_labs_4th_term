USE UNIVER;

-- Задание 1

EXEC sp_helpindex 'AUDITORIUM';
EXEC sp_helpindex 'AUDITORIUM_TYPE';
EXEC sp_helpindex 'FACULTY';
EXEC sp_helpindex 'PROFESSION';
EXEC sp_helpindex 'SUBJECT';

-- Задание 2
CREATE TABLE #tempTable
(
    INT_FIELD int,
    STR_FIELD varchar(50)
);

CHECKPOINT;

DBCC DROPCLEANBUFFERS;

SET NOCOUNT ON
DECLARE @i int = 0
WHILE @i < 1000
BEGIN
	INSERT #tempTable(INT_FIELD, STR_FIELD)
	VALUES (floor(100 * rand()), 'str' + cast(@i as char))
	SET @i += 1
END

SELECT * FROM #tempTable WHERE INT_FIELD BETWEEN 20 AND 60;

CREATE CLUSTERED INDEX #EXPLRE_CL ON #tempTable(INT_FIELD ASC);