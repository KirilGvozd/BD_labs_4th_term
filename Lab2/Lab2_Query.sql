CREATE TABLE "Сотрудник"(
    "Имя_сотрудника" NVARCHAR(255) NOT NULL,
    "Отдел" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Сотрудник" ADD CONSTRAINT "Сотрудник_Имя_сотрудника_primary" PRIMARY KEY("Имя_сотрудника");
CREATE TABLE "Отдел"(
    "Название_отдела" NVARCHAR(255) NOT NULL,
    "Количество_сотрудников" INT NOT NULL,
    "Предельная_норма_расходов" INT NOT NULL
);
ALTER TABLE
    "Отдел" ADD CONSTRAINT "Отдел_Название_отдела_primary" PRIMARY KEY("Название_отдела");
CREATE TABLE "Чек"(
    "Имя_сотрудника" NVARCHAR(255) NOT NULL,
    "Название_товара" NVARCHAR(255) NOT NULL,
    "Описание" NVARCHAR(255) NOT NULL,
    "Дата" DATE NOT NULL,
    "Потраченная_сумма" INT NOT NULL
);
ALTER TABLE
    "Чек" ADD CONSTRAINT "Чек_Название_товара_primary" PRIMARY KEY("Название_товара");
ALTER TABLE
    "Чек" ADD CONSTRAINT "Чек_Имя_сотрудника_foreign" FOREIGN KEY("Имя_сотрудника") REFERENCES "Сотрудник"("Имя_сотрудника");
ALTER TABLE
    "Сотрудник" ADD CONSTRAINT "Сотрудник_Отдел_foreign" FOREIGN KEY("Отдел") REFERENCES "Отдел"("Название_отдела");