﻿SELECT        ТОВАРЫ.Наименование, ЗАКАЗЫ.Дата_поставки
FROM            ЗАКАЗЫ INNER JOIN
                         ТОВАРЫ ON ЗАКАЗЫ.Наименование_товара = ТОВАРЫ.Наименование
WHERE        (ЗАКАЗЫ.Дата_поставки > CONVERT(DATETIME, '2022-12-20 00:00:00', 102))