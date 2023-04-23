CREATE table #EX4
(    TKEY int,
      CC int identity(1, 1),
      TF varchar(100)
);

set nocount on;
declare @i int = 0;
while   @i < 20000
begin
       INSERT #EX4(TKEY, TF) values(floor(30000 * RAND()), replicate('String ', 10));
       set @i = @i + 1;
end;

SELECT TKEY from  #EX4 where TKEY between 5000 and 19999;
SELECT TKEY from  #EX4 where TKEY>15000 and  TKEY < 20000
SELECT TKEY from  #EX4 where TKEY=17000

CREATE  index #EX_WHERE on #EX4(TKEY) where (TKEY>=15000 and
 TKEY < 20000);