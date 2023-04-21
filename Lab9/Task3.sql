USE UNIVER;

PRINT N'Количество обработанных строк: ' + CAST(@@ROWCOUNT AS CHAR);
PRINT N'Версия SQL-сервера: ' + CAST(@@VERSION AS CHAR);
PRINT N'Системный идентификатор процесса, назначенный сервером текущему подключению: ' + CAST(@@SPID AS CHAR);
PRINT N'Код последней ошибки: ' + CAST(@@ERROR AS CHAR);
PRINT N'Имя сервера: ' + CAST(@@SERVERNAME AS CHAR);
PRINT N'Уровень вложенности транзакции: ' + CAST(@@TRANCOUNT AS CHAR);
PRINT N'Проверка результата считывания строк результирующего набора: ' + CAST(@@FETCH_STATUS AS CHAR);
PRINT N'Уровень вложенности текущей про-цедуры: ' + CAST(@@NESTLEVEL AS CHAR);