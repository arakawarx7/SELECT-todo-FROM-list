\c aaronarakawa;

DROP user IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;


\c todo_app;


CREATE TABLE tasks (
id  serial NOT NULL,
title varchar(255) NOT NULL,
description text ,
created_at  timestamp NOT NULL DEFAULT NOW(),
updated_at  timestamp,
completed boolean NOT NULL DEFAULT false
);

-- deleted column
ALTER TABLE tasks  DROP COLUMN completed;

-- added column
ALTER TABLE tasks ADD COLUMN completed_at timestamp  NULL DEFAULT NOW();

-- set column to null set DEFAULT NOW()
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

-- creating a new task to insert data
INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
  VALUES(
    'study SQL',
    'Compplete this exercises',
    NOW(),
    NOW(),
    NULL
  );


-- inserting values into tasks
INSERT INTO tasks (title, description)
  VALUES(
    'Study PostgresSQL',
    'Read all the documentation'
    );


 -- selecting all that is null from completed_at
SELECT * FROM tasks
WHERE completed_at is NULL;


UPDATE tasks
SET completed_at = NOW()
WHERE title = 'study SQL';

SELECT * FROM tasks
WHERE completed_at is NULL;

SELECT * FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks(title, description) VALUES(
'third mistakes',
'another test entry'
);

SELECT title FROM tasks
WHERE title like '%mistake%';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title FROM tasks
WHERE title like '%mistake%';

DELETE
FROM tasks
WHERE title like '%mistake%';

SELECT * FROM tasks
ORDER BY created_at ASC;

SELECT * FROM tasks;