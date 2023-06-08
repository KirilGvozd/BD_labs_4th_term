USE Practice;

CREATE TABLE Vacation
(
    VacationId int identity constraint PK_VacationId primary key,
    WorkerId int constraint FK_Vacation_to_Workers references Workers,
    StartingDate date,
    EndDate date,
    TypeOfVacation nvarchar(20),
    VacationPay int
)

CREATE TABLE Workers
(
    WorkerId int identity constraint PK_WorkerId primary key,
    WorkerName nvarchar(50),
    HiringDate date,
    Post nvarchar(20),
    DepartmentId int,
    Salary int
)

INSERT INTO Workers (WorkerName, HiringDate, Post, DepartmentId, Salary) VALUES (N'Гвоздовский К.В.', '04-12-2023', N'Junior', 1, 1500),
                                                                                (N'Климович А.С.', '03-12-2023', N'Junior', 1, 1200),
                                                                                (N'Смирнов В.Ю.', '02-12-2023', N'Middle', 1, 2000),
                                                                                (N'Русак Н.В.', '01-12-2023', N'Senior', 2, 3500);

INSERT INTO Vacation (WorkerId, StartingDate, EndDate, TypeOfVacation, VacationPay) VALUES (8, '06-12-2023', '07-12-2023', N'Отпуск', 1300),
                                                                                           (9, '07-12-2023', '08-12-2023', N'Отпуск', 1000),
                                                                                           (10, '08-12-2023', '09-12-2023', N'Отпуск', 2300),
                                                                                           (11, '09-12-2023', '10-12-2023', N'Отпуск', 4300);

ALTER FUNCTION PracticeFunction (@departmentId int) RETURNS int
AS
    BEGIN
    DECLARE @workersCount int;
    SET @workersCount = (SELECT COUNT(*) FROM Workers JOIN Vacation ON Workers.WorkerId = Vacation.WorkerId WHERE DATEDIFF(MONTH, HiringDate, StartingDate) < 6 AND DepartmentId = @departmentId)
    RETURN @workersCount
    END


DECLARE @var int = dbo.PracticeFunction (1);
PRINT N'Количество сотрудников: ' + CAST(@var AS NVARCHAR(5));


