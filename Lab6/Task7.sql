USE UNIVER;

SELECT SUBJECT, COUNT(*) AS [8-9]
FROM PROGRESS
GROUP BY SUBJECT, NOTE
HAVING NOTE BETWEEN 8 AND 9
ORDER BY [8-9] DESC