USE UNIVER;

CREATE TRIGGER DDL_UNIVER2 ON DATABASE FOR DDL_DATABASE_LEVEL_EVENTS AS
    DECLARE @EVENT_TYPE varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)')
DECLARE @OBJ_NAME varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)')
DECLARE @OBJ_TYPE varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)')
IF @EVENT_TYPE = 'CREATE_TABLE' OR @EVENT_TYPE = 'DROP_TABLE'
BEGIN
       PRINT N'Тип события: '+ @EVENT_TYPE;
       PRINT N'Имя объекта: '+ @OBJ_NAME;
       PRINT N'Тип объекта: '+ @OBJ_TYPE;
       RAISERROR( N'Удаление или добавление таблиц запрещено', 16, 1);
       ROLLBACK;
   END;

CREATE TABLE Task9_Table
(
    Id int
)