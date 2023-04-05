USE UNIVER;
SELECT FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME, SUBJECT.SUBJECT_NAME, STUDENT.NAME,
	CASE
		WHEN (PROGRESS.NOTE = 6) THEN 'six'
		WHEN (PROGRESS.NOTE = 7) THEN 'seven'
		WHEN (PROGRESS.NOTE = 8) THEN 'eight'
		ELSE 'lower than 6'
	END['Mark']
FROM PROGRESS INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN SUBJECT ON PROGRESS.SUBJECT = SUBJECT.SUBJECT
INNER JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
INNER JOIN GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP
INNER JOIN PROFESSION ON GROUPS.PROFESSION = PROFESSION.PROFESSION
WHERE PROGRESS.NOTE BETWEEN 6 AND 8
ORDER BY PROGRESS.NOTE DESC