use UNIVER;
begin tran
	insert AUDITORIUM_TYPE values ('LB-P', N'Лабораторный с проектором')
	begin tran
		update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM_TYPE = 'LB-P'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from AUDITORIUM where AUDITORIUM_TYPE = 'LB-P') Аудитории,
	   (select count(*) from AUDITORIUM_TYPE where AUDITORIUM_TYPE = 'LB-P') Тип