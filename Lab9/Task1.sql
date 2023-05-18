DECLARE @charVariable char = 'A',
    @varcharVariable varchar(50) = 'Word',
    @datetimeVariable datetime,
    @timeVariable time,
    @integerVariable int,
    @smallIntegerVariable smallint,
    @tinyIntVariable tinyint,
    @numericVariable numeric(12, 5);

SET @datetimeVariable = GETDATE();
SET @timeVariable = '12:20:03:100';
SET @integerVariable = 12415;
SELECT @smallIntegerVariable = 123, @tinyIntVariable = 12, @numericVariable = 1241314.12451;

SELECT @charVariable [Char], @varcharVariable [Varchar], @datetimeVariable [Datetime], @timeVariable [Time];
PRINT 'Integer = ' + CAST(@integerVariable AS VARCHAR(10));
PRINT 'Small int = ' + CAST(@smallIntegerVariable AS VARCHAR (5));
PRINT 'Tiny int = ' + CAST(@tinyIntVariable AS VARCHAR(3));
PRINT 'Numeric = ' + CAST(@numericVariable AS VARCHAR(15));