USE UNIVER;

DECLARE Task5 CURSOR LOCAL DYNAMIC FOR
	SELECT IDSTUDENT, SUBJECT, NOTE FROM PROGRESS FOR UPDATE
DECLARE @id varchar(10), @sub varchar(15), @nt int


OPEN Task5
FETCH Task5 INTO @id, @sub, @nt
PRINT @id + N' Студент- ' + rtrim(cast(@sub AS varchar)) + N' (Оценка ' + cast(@nt AS varchar) + ')'
DELETE PROGRESS WHERE CURRENT OF Task5
FETCH Task5 INTO @id, @sub, @nt
UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE CURRENT OF Task5
PRINT ''
PRINT @id + N' Студент- ' + rtrim(cast(@sub AS varchar)) + N' (Оценка ' + cast(@nt AS varchar) + ')'

CLOSE Task5