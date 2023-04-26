USE UNIVER;

DECLARE  @tc int, @rn char(50);
         DECLARE Primer1 CURSOR LOCAL DYNAMIC SCROLL
               FOR SELECT ROW_NUMBER() OVER(ORDER BY IDSTUDENT DESC) N,
	                           NAME FROM dbo.STUDENT WHERE YEAR(BDAY) = 1995;
	OPEN Primer1;
	FETCH  Primer1 INTO  @tc, @rn;
	PRINT N'следующая строка        : ' + CAST(@tc AS varchar(5))+ ' ' + RTRIM(@rn);
	FETCH LAST FROM  Primer1 INTO @tc, @rn;
	PRINT N'последняя строка          : ' +  CAST(@tc AS varchar(5))+ ' ' + RTRIM(@rn);
    CLOSE Primer1;
