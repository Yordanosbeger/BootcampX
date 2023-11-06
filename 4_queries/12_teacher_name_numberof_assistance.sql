SELECT teachers.name AS teacher, 'JUL02' AS cohort, COUNT(assistance_requests.id) AS total_assistances
FROM assistance_requests
JOIN teachers ON assistance_requests.teacher_id = teachers.id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohort
ORDER BY teacher;
