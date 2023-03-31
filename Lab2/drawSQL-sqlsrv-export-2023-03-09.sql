CREATE TABLE "Расходы"(
    "Потраченная_сумма" INT NULL,
    "Дата" DATE NULL,
    "Отдел" BIGINT NOT NULL,
    "Id_покупки" NVARCHAR(255) NOT NULL,
    "Товар" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Расходы" ADD CONSTRAINT "Расходы_id_покупки_primary" PRIMARY KEY("Id_покупки");
CREATE TABLE "Отдел"(
    "Название_отдела" NVARCHAR(255) NOT NULL,
    "Количество_сотрудников" INT NOT NULL,
    "Расходы_отдела" INT NOT NULL,
    "Предельная_норма_расхода" INT NOT NULL
);
ALTER TABLE
    "Отдел" ADD CONSTRAINT "Отдел_Название_отдела_primary" PRIMARY KEY("Название_отдела");
CREATE TABLE "Товар"(
    "Название_товара" NVARCHAR(255) NOT NULL,
    "Описание" NVARCHAR(255) NULL,
    "Стоимость_товара" INT NOT NULL
);
ALTER TABLE
    "Товар" ADD CONSTRAINT "Товар_Название_товара_primary" PRIMARY KEY("Название_товара");
ALTER TABLE
    "Расходы" ADD CONSTRAINT "Расходы_Товар_foreign" FOREIGN KEY("Товар") REFERENCES "Товар"("Название_товара");
ALTER TABLE
    "Расходы" ADD CONSTRAINT "Расходы_Отдел_foreign" FOREIGN KEY("Отдел") REFERENCES "Отдел"("Название_отдела");