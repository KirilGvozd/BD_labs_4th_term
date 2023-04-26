use UNIVER;

-- Задание 1
-- INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) values ('BD',   1025,  '06.05.2013', 3);
declare ProgStud CURSOR LOCAL DYNAMIC FOR
	SELECT p.IDSTUDENT, s.NAME, p.NOTE FROM PROGRESS p
	JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
	WHERE p.NOTE < 4
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int


OPEN ProgStud
FETCH ProgStud INTO @id, @nm, @nt
print @id + ': ' + @nm + N' (Оценка ' + cast(@nt as varchar) + ')'
DELETE PROGRESS WHERE CURRENT OF ProgStud
CLOSE ProgStud;

-- Задание 2

USE UNIVER;

declare Prog CURSOR LOCAL DYNAMIC FOR
	SELECT p.IDSTUDENT, s.NAME, p.NOTE FROM PROGRESS p
	JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
	WHERE p.IDSTUDENT = 1017
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int

OPEN Prog
FETCH Prog INTO @id, @nm, @nt
UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE CURRENT OF Prog
print @id + ': ' + @nm + N' ( была оценка ' + cast(@nt as varchar) + ')'
CLOSE Prog;