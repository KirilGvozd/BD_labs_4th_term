create database UNIVER;
use UNIVER

--drop table AUDITORIUM;
--drop table AUDITORIUM_TYPE;
--drop table PROGRESS;
--drop table STUDENT;
--drop table GROUPS;
--drop table PROFESSION;
--drop table TEACHER;
--drop table SUBJECT;
--drop table PULPIT;
--drop table FACULTY;

create table FACULTY (
FACULTY char(10) constraint FACULTY_PK primary key,
FACULTY_NAME  varchar(50) default '???'
);

insert into FACULTY values 
('HTiT', 'Himicheskaya tekhnologiya i tekhnika'),
('LHF',     'Lesohozyajstvennyj fakultet'),
('IEF',     'Inzhenerno-ekonomicheskij fakultet'),
('TTLP',    'Tekhnologiya i tekhnika lesnoj promyshlennosti'),
('TOV',     'Tekhnologiya organicheskih veshchestv'),
('IT',     'Fakultet informacionnyh tekhnologij'),
('IDiP', 'Fakultet izdatelskogo dela i poligrafii')

create table PROFESSION (
PROFESSION   char(20) constraint PROFESSION_PK  primary key,
FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key references FACULTY(FACULTY),
PROFESSION_NAME varchar(100),    
QUALIFICATION   varchar(50)
);

insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) values 
('IDiP', '1-40 01 02', 'Informacionnye sistemy i tekhnologii', 'inzhener-programmist-sistemotekhnik' ),
('IDiP', '1-47 01 01', 'Izdatelskoe delo', 'redaktor-tekhnolog' ),
('IDiP', '1-36 06 01', 'Poligraficheskoe oborudovanie i sistemy obrabotki informacii', 'inzhener-elektromekhanik' ),                  
('HTiT', '1-36 01 08', 'Konstruirovanie i proizvodstvo izdelij iz kompozicionnyh materialov', 'inzhener-mekhanik' ),
('HTiT', '1-36 07 01', 'Mashiny i apparaty himicheskih proizvodstv i predpriyatij stroitelnyh materialov', 'inzhener-mekhanik' ),
('LHF', '1-75 01 01', 'Lesnoe hozyajstvo', 'inzhener les-nogo hozyajstva' ),
('LHF', '1-75 02 01', 'Sadovo-parkovoe stroitelstvo', 'inzhener sadovo-parkovogo stroitelstva' ),
('LHF', '1-89 02 02', 'Turizm i prirodopolzova-nie', 'specialist v sfere turizma' ),
('IEF',  '1-25 01 07', 'Ekonomika i upravlenie na pred-priyatii', 'ekonomist-menedzher' ),
('IEF',  '1-25 01 08', 'Buhgalterskij uchet, analiz i audit', 'ekonomist' ),           
('TTLP',  '1-36 05 01', 'Mashiny i oborudovanie lesnogo kompleksa', 'inzhener-mekhanik' ),
('TTLP',  '1-46 01 01', 'Lesoinzhenernoe delo', 'inzhener-tekhnolog' ),
('TOV',  '1-48 01 02', 'Himicheskaya tekhnologiya or-ganicheskih veshchestv, materialov i izdelij', 'inzhener-himik-tekhnolog' ),            
('TOV',  '1-48 01 05', 'Himicheskaya tekhnologiya pe-rerabotki drevesiny', 'inzhener-himik-tekhnolog' ),
('TOV',  '1-54 01 03', 'Fiziko-himicheskie metody i pribory kontrolya kachestva produkcii', 'inzhener po sertifikacii' );

create table  PULPIT 
(   PULPIT   char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100), 
    FACULTY   char(10)   constraint PULPIT_FACULTY_FK foreign key references FACULTY(FACULTY) 
);  

insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY ) values 
('ISiT', 'Informacionnyh sistem i tekhnologij ','IT'  ),
('POiSOI','Poligraficheskogo oborudovaniya i sistem obrabotki informacii ', 'IDiP'  ),
('BF', 'Belorusskoj filologii','IDiP'  ),
('RIT', 'Redakcionno-izdatelskih tenologij', 'IDiP'  ),            
('PP', 'Poligraficheskih proizvodstv','IDiP'  ),                              
('LV', 'Lesovodstva','LHF'),
('LU', 'Lesoustrojstva','LHF'),
('LZiDV', 'Lesozashchity i drevesinovedeniya','LHF'),                
('LKiP', 'Lesnyh kultur i pochvovedeniya','LHF'), 
('TiP', 'Turizma i prirodopolzovaniya','LHF'),              
('LPiSPS','Landshaftnogo proektirovaniya i sadovo-parkovogo stroi-telstva','LHF'),          
('TL', 'Transporta lesa', 'TTLP'),                          
('LMiLZ','Lesnyh mashin i tekhnologii lesozagotovok','TTLP'),  
('TDP','Tekhnologij derevoobrabatyvayushchih proizvodstv', 'TTLP'),   
('TiDID','Tekhnologii i dizajna izdelij iz drevesiny','TTLP'),    
('OH', 'Organicheskoj himii','TOV'), 
('HPD','Himicheskoj pererabotki drevesiny','TOV'),             
('TNViOHT','Tekhnologii neorganicheskih veshchestv i obshchej himicheskoj tekhnologii ','HTiT'), 
('PiAHP','Processov i apparatov himicheskih proizvodstv','HTiT'),                                               
('ETiM',    'Ekonomicheskoj teorii i marketinga','IEF'),   
('MiEP',   'Menedzhmenta i ekonomiki prirodopolzovaniya','IEF'),   
('SBUAiA', 'Statistiki, buhgalterskogo ucheta, analiza i audita', 'IEF')

create table TEACHER
 (   TEACHER    char(10)  constraint TEACHER_PK  primary key,
     TEACHER_NAME  varchar(100), 
     GENDER     char(1) CHECK (GENDER in ('m', 'f')),
     PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key 
                         references PULPIT(PULPIT) 
 );
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values  
('SMLV',    'Smelov Vladimir Vladislavovich', 'm',  'ISiT'),
('AKNVCH',    'Akunovich Stanislav Ivanovich', 'm', 'ISiT'),
('KLSNV',    'Kolesnikov Vitalij Leonidovich', 'm', 'ISiT'),
('BRKVCH',    'Brakovich Andrej Igorevich', 'm', 'ISiT'),
('DTK',     'Dyatko Aleksandr Arkadevich', 'm', 'ISiT'),
('URB',     'Urbanovich Pavel Pavlovich', 'm', 'ISiT'),
('GRN',     'Gurin Nikolaj Ivanovich', 'm', 'ISiT'),
('ZHLK',     'ZHilyak Nadezhda Aleksandrovna',  'f', 'ISiT'),                     
('MRZ',     'Moroz Elena Stanislavovna',  'f',   'ISiT'),                                                                                           
('BRTSHVCH',   'Bartashevich Svyatoslav Aleksandrovich', 'm','POiSOI'),
('ARS',     'Arsentev Vitalij Arsentevich', 'm', 'POiSOI'),                       
('BRNVSK',   'Baranovskij Stanislav Ivanovich', 'm', 'ETiM'),
('NVRV',   'Neverov Aleksandr Vasilevich', 'm', 'MiEP'),
('RVKCH',   'Rovkach Andrej Ivanovich', 'm', 'LV'),
('DMDK', 'Demidko Marina Nikolaevna',  'f',  'LPiSPS'),
('BRG',     'Burganskaya Tatyana Minaevna', 'f', 'LPiSPS'),
('RZHK',   'Rozhkov Leonid Nikolaevich ', 'm', 'LV'),                      
('ZVGCV',   'Zvyagincev Vyacheslav Borisovich', 'm', 'LZiDV'), 
('BZBRDV',   'Bezborodov Vladimir Stepanovich', 'm', 'OH'), 
('NSKVC',   'Naskovec Mihail Trofimovich', 'm', 'TL');

create table SUBJECT
    (     SUBJECT  char(10) constraint SUBJECT_PK  primary key, 
           SUBJECT_NAME varchar(100) unique,
           PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key 
                         references PULPIT(PULPIT)   
     );

 insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values 
('SUBD',   'Sistemy upravleniya bazami dannyh', 'ISiT'),
('BD',     'Bazy dannyh','ISiT'),
('INF',    'Informacionnye tekhnologii','ISiT'),
('OAiP',  'Osnovy algoritmizacii i programmirovaniya', 'ISiT'),
('PZ',     'Predstavlenie znanij v kompyuternyh sistemah', 'ISiT'),
('PSP',    'Programmirovanie setevyh prilozhenij', 'ISiT'),
('MSOI',  'Modelirovanie sistem obrabotki informacii', 'ISiT'),
('PIS',     'Proektirovanie informacionnyh sistem', 'ISiT'),
('KG',      'Kompyuternaya geometriya ','ISiT'),
('PMAPL',   'Poligraf. mashiny, avtomaty i potochnye linii', 'POiSOI'),
('KMS',     'Kompyuternye multimedijnye sistemy', 'ISiT'),
('OPP',     'Organizaciya poligraf. proizvodstva', 'POiSOI'),
('DM',   'Diskretnaya matematika', 'ISiT'),
('MP',   'Matematicheskoe programmirovanie','ISiT'),  
('LEVM', 'Logicheskie osnovy EVM',  'ISiT'),                   
('OOP',  'Ob"ektno-orientirovannoe programmirovanie', 'ISiT'),
('EP', 'Ekonomika prirodopolzovaniya','MiEP'),
('ET', 'Ekonomicheskaya teoriya','ETiM'),
('IG', 'Inzhenernaya geodeziya ','LU'),
('LV',    'Lesovodstvo', 'LZiDV'),
('OH',    'Organicheskaya himiya', 'OH'),   
('VTL',    'Vodnyj transport lesa','TL'),
('TiOL',   'Tekhnologiya i oborudovanie lesozagotovok', 'LMiLZ')

create table GROUPS 
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,              
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key references FACULTY(FACULTY), 
    PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),                  
  );
insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST ) values 
				('IDiP','1-40 01 02', 2013), --1
                ('IDiP','1-40 01 02', 2012),
                ('IDiP','1-40 01 02', 2011),
                ('IDiP','1-40 01 02', 2010),
                ('IDiP','1-47 01 01', 2013),---5 gr
                ('IDiP','1-47 01 01', 2012),
                ('IDiP','1-47 01 01', 2011),
                ('IDiP','1-36 06 01', 2010),-----8 gr
                ('IDiP','1-36 06 01', 2013),
                ('IDiP','1-36 06 01', 2012),
                ('IDiP','1-36 06 01', 2011),
                ('HTiT','1-36 01 08', 2013),---12 gr                                                  
                ('HTiT','1-36 01 08', 2012),
                ('HTiT','1-36 07 01', 2011),
                ('HTiT','1-36 07 01', 2010),
                ('TOV','1-48 01 02', 2012), ---16 gr 
                ('TOV','1-48 01 02', 2011),
                ('TOV','1-48 01 05', 2013),
                ('TOV','1-54 01 03', 2012),
                ('LHF','1-75 01 01', 2013),--20 gr      
                ('LHF','1-75 02 01', 2012),
                ('LHF','1-75 02 01', 2011),
                ('LHF','1-89 02 02', 2012),
                ('LHF','1-89 02 02', 2011),  
                ('TTLP','1-36 05 01', 2013),
                ('TTLP','1-36 05 01', 2012),
                ('TTLP','1-46 01 01', 2012),--27 gr
                ('IEF','1-25 01 07', 2013), 
                ('IEF','1-25 01 07', 2012),     
                ('IEF','1-25 01 07', 2010),
                ('IEF','1-25 01 08', 2013),
                ('IEF','1-25 01 08', 2012) ---32 gr  
                          
------Создание и заполнение таблицы STUDENT
create table STUDENT 
(    IDSTUDENT   integer  identity(1000,1) constraint STUDENT_PK primary key,
      IDGROUP   integer  constraint STUDENT_GROUP_FK foreign key references GROUPS(IDGROUP),        
      NAME   nvarchar(100), 
      BDAY   date,
      STAMP  timestamp,
      INFO     xml,
      FOTO     varbinary
 )

 insert into STUDENT (IDGROUP, NAME, BDAY) values 
		   (1, 'Hartanovich Ekaterina Aleksandrovna', '11.03.1995'),        
		   (1, 'Gorbach Elizaveta YUrevna',    '07.12.1995'),
           (1, 'Zykova Kristina Dmitrievna',  '12.10.1995'),
           (1, 'SHenec Ekaterina Sergeevna',   '08.01.1995'),
           (1, 'SHitik Alina Igorevna',  '02.08.1995'),
		   (2, 'Silyuk Valeriya Ivanovna',         '12.07.1994'),
           (2, 'Sergel Violetta Nikolaevna',    '06.03.1994'),
           (2, 'Dobrodej Olga Anatolevna',     '09.11.1994'),
           (2, 'Podolyak Mariya Sergeevna',        '04.10.1994'),
           (2, 'Nikitenko Ekaterina Dmitrievna', '08.01.1994'),
           (3, 'YAckevich Galina Iosifovna',       '02.08.1993'),
           (3, 'Osadchaya Ela Vasilevna',         '07.12.1993'),
           (3, 'Akulova Elena Gennadevna',      '02.12.1993'),
           (4, 'Pleshkun Milana Anatolevna',     '08.03.1992'),
           (4, 'Buyanova Mariya Aleksandrovna',    '02.06.1992'),
           (4, 'Harchenko Elena Gennadevna',     '11.12.1992'),
           (4, 'Kruchenok Evgenij Aleksandrovich', '11.05.1992'),
           (4, 'Borohovskij Vitalij Petrovich',   '09.11.1992'),
           (4, 'Mackevich Nadezhda Valerevna',    '01.11.1992'),
           (5, 'Loginova Mariya Vyacheslavovna',    '08.07.1995'),
           (5, 'Belko Natalya Nikolaevna',      '02.11.1995'),
           (5, 'Selilo Ekaterina Gennadevna',   '07.05.1995'),
           (5, 'Drozd Anastasiya Andreevna',      '04.08.1995'),
           (6, 'Kozlovskaya Elena Evgenevna',    '08.11.1994'),
           (6, 'Potapnin Kirill Olegovich',       '02.03.1994'),
           (6, 'Ravkovskaya Olga Nikolaevna',    '04.06.1994'),
           (6, 'Hodoronok Aleksandra Vadimovna', '09.11.1994'),
           (6, 'Ramuk Vladislav YUrevich',        '04.07.1994'),
           (7, 'Neruganenok Mariya Vladimirovna', '03.01.1993'),
           (7, 'Cyganok Anna Petrovna',          '12.09.1993'),
           (7, 'Masilevich Oksana Igorevna',      '12.06.1993'),
           (7, 'Aleksievich Elizaveta Viktorovna','09.02.1993'),
           (7, 'Vatolin Maksim Andreevich',       '04.07.1993'),
           (8, 'Sinica Valeriya Andreevna',       '08.01.1992'),
           (8, 'Kudryashova Alina Nikolaevna',     '12.05.1992'),
           (8, 'Migulina Elena Leonidovna',      '08.11.1992'),
           (8, 'SHpilenya Aleksej Sergeevich',      '12.03.1992'),
           (9, 'Astafev Igor Aleksandrovich',   '10.08.1995'),
           (9, 'Gajtyukevich Andrej Igorevich',     '02.05.1995'),
           (9, 'Ruchenya Natalya Aleksandrovna',   '08.01.1995'),
           (9, 'Tarasevich Anastasiya Ivanovna',   '11.09.1995'),
           (10, 'ZHoglin Nikolaj Vladimirovich',   '08.01.1994'),
           (10, 'Sanko Andrej Dmitrievich',      '11.09.1994'),
           (10, 'Peshchur Anna Aleksandrovna',      '06.04.1994'),
           (10, 'Buchalis Nikita Leonidovich',     '12.08.1994'),
		   (11, 'Lavrenchuk Vladislav Nikolaevich','07.11.1993'),
           (11, 'Vlasik Evgeniya Viktorovna',     '04.06.1993'),
           (11, 'Abramov Denis Dmitrievich',      '10.12.1993'),
           (11, 'Olenchik Sergej Nikolaevich',     '04.07.1993'),
           (11, 'Savinko Pavel Andreevich',       '08.01.1993'),
           (11, 'Bakun Aleksej Viktorovich',      '02.09.1993'),
           (12, 'Ban Sergej Anatolevich',       '11.12.1995'),
           (12, 'Sechejko Ilya Aleksandrovich',    '10.06.1995'),
           (12, 'Kuzmicheva Anna Andreevna',      '09.08.1995'),
           (12, 'Burko Diana Francevna',         '04.07.1995'),
           (12, 'Danilenko Maksim Vasilevich',   '08.03.1995'),
           (12, 'Zizyuk Olga Olegovna',          '12.09.1995'),
           (13, 'SHarapo Mariya Vladimirovna',     '08.10.1994'),
           (13, 'Kasperovich Vadim Viktorovich',   '10.02.1994'),
           (13, 'CHuprygin Arsenij Aleksandrovich','11.11.1994'),
           (13, 'Voevodskaya Olga Leonidovna',   '10.02.1994'),
           (13, 'Metushevskij Denis Igorevich',    '12.01.1994'),
           (14, 'Loveckaya Valeriya Aleksandrovna','11.09.1993'),
           (14, 'Dvorak Antonina Nikolaevna',    '01.12.1993'),
           (14, 'SHCHuka Tatyana Nikolaevna',       '09.06.1993'),
           (14, 'Koblinec Aleksandra Evgenevna','05.01.1993'),
           (14, 'Fomichevskaya Elena Ernestovna',  '01.07.1993'),
           (15, 'Besarab Margarita Vadimovna',   '07.04.1992'),
           (15, 'Baduro Viktoriya Sergeevna',     '10.12.1992'),
           (15, 'Tarasenko Olga Viktorovna',    '05.05.1992'),
           (15, 'Afanasenko Olga Vladimirovna', '11.01.1992'),
           (15, 'CHujkevich Irina Dmitrievna',     '04.06.1992'),
           (16, 'Brel Alesya Alekseevna',        '08.01.1994'),
           (16, 'Kuznecova Anastasiya Andreevna', '07.02.1994'),
           (16, 'Tomina Karina Gennadevna',     '12.06.1994'),
           (16, 'Dubrova Pavel Igorevich',        '03.07.1994'),
           (16, 'SHpakov Viktor Andreevich',       '04.07.1994'),
           (17, 'SHnejder Anastasiya Dmitrievna',  '08.11.1993'),
           (17, 'SHygina Elena Viktorovna',       '02.04.1993'),
           (17, 'Klyueva Anna Ivanovna',          '03.06.1993'),
           (17, 'Domorad Marina Andreevna',      '05.11.1993'),
           (17, 'Linchuk Mihail Aleksandrovich',   '03.07.1993'),
           (18, 'Vasileva Darya Olegovna',      '08.01.1995'),
           (18, 'SHCHigelskaya Ekaterina Andreevna','06.09.1995'),
           (18, 'Sazonova Ekaterina Dmitrievna', '08.03.1995'),
           (18, 'Bakunovich Alina Olegovna',      '07.08.1995')

create table PROGRESS
 (  SUBJECT   char(10) constraint PROGRESS_SUBJECT_FK foreign key
                      references SUBJECT(SUBJECT),                
     IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key         
                      references STUDENT(IDSTUDENT),        
     PDATE    date, 
     NOTE     integer check (NOTE between 1 and 10)
  )

insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) values 
		   ('OAiP', 1000,  '01.10.2013',6),
           ('OAiP', 1001,  '01.10.2013',8),
           ('OAiP', 1002,  '01.10.2013',7),
           ('OAiP', 1003,  '01.10.2013',5),
           ('OAiP', 1005,  '01.10.2013',4),
		   ('SUBD', 1014,  '01.12.2013',5),
           ('SUBD', 1015,  '01.12.2013',9),
           ('SUBD', 1016,  '01.12.2013',5),
           ('SUBD', 1017,  '01.12.2013',4),
		   ('KG',   1018,  '06.5.2013',4),
           ('KG',   1019,  '06.05.2013',7),
           ('KG',   1020,  '06.05.2013',7),
           ('KG',   1021,  '06.05.2013',9),
           ('KG',   1022,  '06.05.2013',5),
           ('KG',   1023,  '06.05.2013',10),
		   ('KG',   1024,  '06.05.2013',10),
		   ('KG',   1025,  '06.05.2013',3)

insert into PROGRESS (SUBJECT,IDSTUDENT,PDATE, NOTE)
    values ('OAiP', 1074,  '01.10.2013',6),
           ('OAiP', 1075,  '01.10.2013',8),
           ('OAiP', 1076,  '01.10.2013',7),
           ('OAiP', 1077,  '01.10.2013',5),
           ('OAiP', 1078,  '01.10.2013',4),
		   ('BD', 1079,  '01.10.2013',6),
           ('BD', 1080,  '01.10.2013',8),
           ('BD', 1081,  '01.10.2013',7),
           ('BD', 1082,  '01.10.2013',5),
		   ('BD', 1083,  '01.10.2013',6)

insert into PROGRESS (SUBJECT,IDSTUDENT,PDATE, NOTE)
    values ('OAiP', 1051,  '01.10.2013',6),
           ('OAiP', 1052,  '01.10.2013',8),
           ('OAiP', 1053,  '01.10.2013',7),
           ('OAiP', 1054,  '01.10.2013',5),
           ('OAiP', 1055,  '01.10.2013',4),
		   ('BD', 1056,  '01.10.2013',6),
           ('BD', 1057,  '01.10.2013',8),
           ('BD', 1058,  '01.10.2013',7),
           ('BD', 1059,  '01.10.2013',5),
		   ('BD', 1060,  '01.10.2013',6)

create table AUDITORIUM_TYPE 
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
      AUDITORIUM_TYPENAME  varchar(30)       
 );

insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        
values ('LK', 'Lekcionnaya'),
('LB-K', 'Kompyuternyj klass'),
('LK-K', 'Lekcionnaya s ust. proektorom'),
('LB-X', 'Himicheskaya laboratoriya'),
('LB-SK', 'Spec. kompyuternyj klass');
                      
  create table AUDITORIUM 
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,              
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key         
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE), 
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- вместимость 
   AUDITORIUM_NAME      varchar(50)                                     
);

insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  
('206-1', '206-1','LB-K', 15),
('301-1',   '301-1', 'LB-K', 15),
('236-1',   '236-1', 'LK',   60),
('313-1',   '313-1', 'LK-K',   60),
('324-1',   '324-1', 'LK-K',   50),
('413-1',   '413-1', 'LB-K', 15),
('423-1',   '423-1', 'LB-K', 90),
('408-2',   '408-2', 'LK',  90);