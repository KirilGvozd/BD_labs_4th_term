set nocount on
	if  exists (select * from  SYS.OBJECTS        -- таблица X есть?
	            where OBJECT_ID= object_id(N'DBO.X') )
	drop table X;
	declare @c int, @flag char = 'c';           -- commit или rollback?
	SET IMPLICIT_TRANSACTIONS  ON   -- включ. режим неявной транзакции
	CREATE table X(K int );                         -- начало транзакции
		INSERT X values (1),(2),(3), (4);
		set @c = (select count(*) from X);
		print N'количество строк в таблице X: ' + cast( @c as varchar(2));
		if @flag = 'c'  commit;                   -- завершение транзакции: фиксация
	          else   rollback;                                 -- завершение транзакции: откат
      SET IMPLICIT_TRANSACTIONS  OFF   -- выключ. режим неявной транзакции

	if  exists (select * from  SYS.OBJECTS       -- таблица X есть?
	            where OBJECT_ID= object_id(N'DBO.X') )
	print N'таблица X есть';
      else print N'таблицы X нет'