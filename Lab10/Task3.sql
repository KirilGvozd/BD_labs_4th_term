CREATE table #EX3
(    TKEY int,
      CC int identity(1, 1),
      TF varchar(100)
);

set nocount on;
declare @i int = 0;
while   @i < 20000
begin
       INSERT #EX3(TKEY, TF) values(floor(30000 * RAND()), replicate('String ', 10));
       set @i = @i + 1;
end;

CREATE  index #EX_TKEY_X on #EX3(TKEY) INCLUDE (CC);
SELECT CC, TKEY from #EX3 where TKEY>15000