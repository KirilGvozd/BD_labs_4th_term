use UNIVER;

set transaction isolation level READ COMMITTED

begin transaction
select count(*) from AUDITORIUM where AUDITORIUM = '1234'

select 'update' результат, count(*) from AUDITORIUM where AUDITORIUM = '1234'
commit

begin transaction

update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM = '123456'
commit
