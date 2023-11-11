const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx',
  port: 5432
});



const cohortName = process.argv[2];

const queryString = `
  SELECT DISTINCT teachers.name as teacher_name
  FROM assistance_requests
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name = $1;
`;

pool.query(queryString, [cohortName])
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`Teacher Name: ${teacher.teacher_name}`);
    });
    pool.end();
  })
  .catch(err => {
    console.error('query error', err.stack);
    pool.end();
  });