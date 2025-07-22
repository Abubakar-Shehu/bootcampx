-- CREATE TABLE teachers (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   start_date DATE NOT NULL,
--   end_date DATE NOT NULL,
--   is_active BOOLEAN NOT NULL
-- );
    
-- CREATE TABLE assistance_request (
--   id SERIAL PRIMARY KEY NOT NULL,
--   assignment_id INTEGER REFERENCES assignments(id) NOT NULL,
--   student_id INTEGER REFERENCES students(id) NOT NULL,
--   teacher_id INTEGER REFERENCES teachers(id) NOT NULL,
--   created_at TIMESTAMP NOT NULL,
--   started_at TIMESTAMP NOT NULL,
--   completed_at TIMESTAMP NOT NULL,
--   student_feedback TEXT NOT NULL,
--   teacher_feedback TEXT NOT NULL
-- );

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  start_date DATE,
  end_date DATE
);

CREATE TABLE assistance_requests (
  id SERIAL PRIMARY KEY NOT NULL,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT
);
