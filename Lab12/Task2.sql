use UNIVER;

begin try
	begin tran
		delete AUDITORIUM where AUDITORIUM.AUDITORIUM = '206-1';
		insert AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) VALUES ('206-1', 'LB-K', 15, '206-1');
		insert AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) VALUES ('303-1', 'LB-K', 15, '303-1');
	commit tran;
end try
begin catch
		print N'Ошибка: ' + case
		when error_number() = 2627 and patindex('%AUDITORIUM_PK%', error_message()) > 0
		then N' дублирование аудитории'
		else N' неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@TRANCOUNT > 0 
		rollback tran;
end catch;