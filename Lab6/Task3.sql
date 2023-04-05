USE UNIVER;

SELECT * FROM (
    SELECT CASE WHEN NOTE between 1 and 3 then '1-3'
    WHEN NOTE between 4 and 5 then '4-5'
    WHEN NOTE between 6 and 7 then '6-7'
    WHEN NOTE between 8 and 9 then '8-9'
    ELSE '10'
    END [Отметки], COUNT(*)[Количество]
    FROM PROGRESS GROUP BY CASE
                  WHEN NOTE between 1 and 3 then '1-3'
                  WHEN NOTE between 4 and 5 then '4-5'
                  WHEN NOTE between 6 and 7 then '6-7'
                  WHEN NOTE between 8 and 9 then '8-9'
                  ELSE '10'
                  END
              ) AS T ORDER BY CASE [Отметки]
    WHEN '1-3' THEN 4
    WHEN '4-5' THEN 3
    WHEN '6-7' THEN 2
    WHEN '8-9' THEN 1
    ELSE 0
    END