USE UNIVER;

-- Локальный курсор
DECLARE Pulpits CURSOR LOCAL FOR SELECT PULPIT, PULPIT_NAME from PULPIT;
DECLARE @pulpit nvarchar(10), @pulpitName nvarchar(50);
	OPEN Pulpits;
	FETCH Pulpits INTO @pulpit, @pulpitName;
      print '1. '+ @pulpit + N', название кафедры: ' + @pulpitName;
    GO

DECLARE @pulpit nvarchar(10), @pulpitName nvarchar(50);
	FETCH Pulpits INTO @pulpit, @pulpitName;
      print '2. '+ @pulpit + N', название кафедры: ' + @pulpitName;
    GO

-- Глобальый курсор
USE UNIVER;

DECLARE Pulpits CURSOR GLOBAL FOR SELECT PULPIT, PULPIT_NAME from PULPIT;
DECLARE @pulpit nvarchar(10), @pulpitName nvarchar(50);
	OPEN Pulpits;
	FETCH Pulpits INTO @pulpit, @pulpitName;
      print '1. '+ @pulpit + N', название кафедры: ' + @pulpitName;
    GO

DECLARE @pulpit nvarchar(10), @pulpitName nvarchar(50);
	FETCH Pulpits INTO @pulpit, @pulpitName;
      print '2. '+ @pulpit + N', название кафедры: ' + @pulpitName;
    GO