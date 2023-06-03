CREATE DATABASE projects;

USE projects;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(155) NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET hire_date = CASE
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
ELSE NULL
END;

SELECT hire_date FROM hr;

SELECT termdate FROM hr;

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NULL;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SET sql_mode = '';

DESCRIBE hr;

SELECT * FROM hr;

ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, curdate());

SELECT
min(age) AS youngest,
max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;










































