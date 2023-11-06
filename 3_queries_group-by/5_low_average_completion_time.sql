SELECT
  s.name AS student,
  AVG(asub.duration) AS average_completion_time,
  AVG(a.duration) AS average_suggested_completion_time
FROM students AS s
JOIN assignment_submissions AS asub ON s.id = asub.student_id
JOIN assignments AS a ON asub.assignment_id = a.id
WHERE s.end_date IS NULL
GROUP BY s.name
HAVING AVG(asub.duration) < AVG(a.duration)
ORDER BY average_completion_time;
