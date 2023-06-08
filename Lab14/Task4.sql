USE UNIVER;

create function FCTEACHER (@PULPIT varchar(20)) returns int
as begin
	declare @COUNT int = (select count(*) from TEACHER t where t.PULPIT = isnull(@PULPIT, t.PULPIT))
	return @COUNT
end

print N'Кол-во преподавателей всего: ' + cast(dbo.FCTEACHER(null) as varchar)
print N'Кол-во преподавателей на кафедре ИСиТ:  ' + cast(dbo.FCTEACHER('ISiT') as varchar)
select PULPIT Кафедра, dbo.FCTEACHER(PULPIT) [Кол-во преподавателей]
from PULPIT