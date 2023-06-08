use UNIVER;
set transaction isolation level READ UNCOMMITTED
begin transaction
select @@SPID Процесс, 'INSERT AUDITORIUM' Результат,
	   * from AUDITORIUM where AUDITORIUM = '123456'
select @@SPID Процесс, 'UPDATE AUDITORIUM' Результат,
	   * from AUDITORIUM where AUDITORIUM = '123456'
commit

begin transaction 
insert AUDITORIUM values ('123456', 'LK-K', 80, '1234')
update AUDITORIUM set AUDITORIUM = '123456'
				  where AUDITORIUM = '1234567' 

rollback