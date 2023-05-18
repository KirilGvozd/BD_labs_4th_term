USE UNIVER;

GO
CREATE PROCEDURE Task1 AS
       BEGIN
        DECLARE @k nvarchar(20) = (SELECT COUNT(*) FROM SUBJECT);
        SELECT * FROM SUBJECT;
        RETURN @k;
    end;
EXEC Task1;