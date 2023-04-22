CREATE TABLE #tempTable
(
    ID integer,
    Name nvarchar(50),
    Birth_date datetime
);

SET NOCOUNT ON;
DECLARE @i integer = 0;

WHILE @i < 10
BEGIN
    INSERT #tempTable (ID, Name, Birth_date)
    VALUES (@i, CONVERT(VARCHAR(255), NEWID()), GETDATE())
    SET @i = @i + 1;
end

SELECT * FROM #tempTable