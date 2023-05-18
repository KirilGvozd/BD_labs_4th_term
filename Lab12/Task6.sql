use UNIVER;
delete AUDITORIUM where AUDITORIUM = N'тест'
-- A ---
set transaction isolation level  REPEATABLE READ
begin transaction
select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM = N'тест'
-------------------------- t1 ------------------
-------------------------- t2 ------------------
select case
       when AUDITORIUM_CAPACITY = 50 then 'insert'  else ' '
end 'результат', AUDITORIUM from AUDITORIUM where AUDITORIUM = N'тест'
commit

--- B ---
begin transaction
-------------------------- t1 --------------------
insert AUDITORIUM values (N'тест', 'LK-K', 10, N'тест');
commit
-------------------------- t2 --------------------