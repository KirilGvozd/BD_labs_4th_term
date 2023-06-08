set nocount on
	if exists (select * from  SYS.OBJECTS
	            where OBJECT_ID= object_id(N'DBO.X') )
	drop table X;
	declare @c int, @flag char = 'c';
	SET IMPLICIT_TRANSACTIONS  ON
	CREATE table X(K int );
		INSERT X values (1),(2),(3), (4);
		set @c = (select count(*) from X);
		print N'количество строк в таблице X: ' + cast( @c as varchar(2));
		if @flag = 'c'  commit;
	          else   rollback;
      SET IMPLICIT_TRANSACTIONS  OFF

	if  exists (select * from  SYS.OBJECTS
	            where OBJECT_ID= object_id(N'DBO.X') )
	print N'таблица X есть';
      else print N'таблицы X нет'