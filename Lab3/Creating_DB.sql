--Задание 1 и 6
USE master
GO
CREATE DATABASE Gvozdovskiy_MyBASE1
ON PRIMARY
	(name = N'Gvozdovskiy_MyBASE1_mdf', filename = N'C:\Fourth_semestr\BD\Lab3\Gvozdovkiy_mdf.mdf',
	 size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
	(name = N'Gvozdovskiy_MyBASE1.ndf', filename = N'C:\Fourth_semestr\BD\Lab3\Gvozdovskiy_ndf.ndf',
	 size = 10240Kb, maxsize = 1Gb, filegrowth = 25%),
FILEGROUP FG1
	(name = N'Gvozdovskiy_MyBASE1_file_group1_1', filename = N'C:\Fourth_semestr\BD\Lab3\Gvozdovskiy_MyBASE1_file_group_1.ndf', 
	 size = 10240Kb, maxsize=1Gb, filegrowth=25%),
	(name = N'Gvozdovskiy_MyBASE1_file_group1_2', filename = N'C:\Fourth_semestr\BD\Lab3\Gvozdovskiy_MyBASE1_file_group_2.ndf', 
	 size = 10240Kb, maxsize=1Gb, filegrowth=25%)
LOG ON
	(name = N'Gvozdovskiy_MyBASE1_log', filename = N'C:\Fourth_semestr\BD\Lab3\Gvozdovskiy_log.log',
	 size = 10240Kb, maxsize =2048Gb, filegrowth = 10%)
GO
