USE UNIVER;

create function COUNT_STUDENTS (@FACULTY varchar(20)) returns int
as begin
	declare @COUNT int = (select count(*) from STUDENT s
		join GROUPS g on s.IDGROUP = g.IDGROUP
		join FACULTY f on f.FACULTY = g.FACULTY
		where g.FACULTY = @FACULTY)
	return @COUNT
end


declare @RES int = dbo.COUNT_STUDENTS('HTiT')
print N'Количетсво студентов: ' + cast(@RES as varchar)