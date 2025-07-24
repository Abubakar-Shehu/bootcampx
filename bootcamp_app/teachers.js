const { Pool } = require("pg");
const arg = process.argv.slice(2);

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "abubakarshehu",
});

pool.query(
`SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${arg[0]}'
ORDER BY teacher;`
  )
  .then((res) => {
    console.log('connected...');
    res.rows.forEach((user) => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
  })
  .catch((err) => console.error("query error", err.stack));