-- Final Project: Michelle Starcher

-- Experience Level By Country where it is permanent:

-- need to use job_information and job_location


USE polish_job_listings_db;

CREATE OR REPLACE VIEW experience_by_country_perm AS
SELECT ji.experience_level_from, jl.country_code, ji.if_permanent
FROM job_information ji
JOIN job_location jl USING(job_title_id)
WHERE if_permanent = 'TRUE'
ORDER BY jl.country_code ASC;

-- View Description:
-- This view takes experience level into account for job seekers looking for permanent positions, which helps 
-- simplify the job searching process for them by taking experience level and whether the job is a permanent position or not into account.

#INST327 Final Project View
USE polish_job_listings_db;
CREATE VIEW ExperienceSalaryView AS
SELECT ji.experience_level_from, AVG((s.salary_to_b2b + s.salary_from_b2b)
/ 2) AS average_salary
FROM job_information ji
JOIN job_salary js ON ji.job_title_id = js.job_title_id
JOIN salary s ON js.salary_id = s.salary_id
GROUP BY ji.experience_level_from;
Use polish_job_listings_db;
DROP VIEW IF EXISTS london_jobs_view;
CREATE VIEW london_jobs_view AS
SELECT city, job_title
FROM job_information
JOIN job_location
ON job_information.job_title_id = job_location.job_title_id
WHERE city = "London"
ORDER BY job_title;
USE polish_job_listings_db;
CREATE OR REPLACE VIEW experience_by_country_perm AS
SELECT ji.experience_level_from, jl.country_code, ji.if_permanent
FROM job_information ji
JOIN job_location jl USING(job_title_id)
WHERE if_permanent = 'TRUE'
ORDER BY jl.country_code ASC;
USE polish_job_listings_db;
CREATE OR REPLACE VIEW job_title_by_type AS
SELECT COUNT(job_title) AS number_of_jobs_available, ji.job_title,
jl.workplace_type
FROM job_information ji
JOIN job_location jl USING (job_title_id)
GROUP BY jl.workplace_type, job_title;
USE polish_job_listings_db;
CREATE OR REPLACE VIEW skills_by_experience AS
SELECT s.skill_name, ji.experience_level_from
FROM skills s
JOIN job_skills js ON s.skill_name_id = js.skill_name_id
JOIN job_information ji ON js.job_title_id = ji.job_title_id
GROUP BY ji.experience_level_from, s.skill_name
ORDER BY ji.experience_level_from;
USE polish_job_listings_db;
DROP VIEW IF EXISTS avg_salary_by_skill_view;
CREATE VIEW avg_salary_by_skill_view AS
SELECT skills.skill_name_id, skills.skill_name, ROUND(AVG(salary_to_b2b))
AS avg_salary_to_b2b, ROUND(AVG(salary_to_permanent)) AS
avg_salary_to_permanent,
ROUND(AVG(salary_from_b2b)) AS avg_salary_from_b2b,
ROUND(AVG(salary_from_permanent)) AS avg_salary_from_permanent
FROM
(SELECT DISTINCT job_skills.skill_name_id, salary_id
FROM
job_skills
JOIN
job_salary
ON job_skills.job_title_id = job_salary.job_title_id
JOIN
skills
ON job_skills.skill_name_id = skills.skill_name_id
ORDER BY skill_name_id) AS skill_salary
JOIN
salary
ON
skill_salary.salary_id = salary.salary_id
JOIN
skills
ON
skills.skill_name_id = skill_salary.skill_name_id
GROUP BY skill_name_id
ORDER BY skill_name_id;
USE polish_job_listings_db;
DROP VIEW IF EXISTS job_skills_mid_exp;
CREATE VIEW job_skills_mid_exp AS
SELECT job_title_id,job_title, skill_name, experience_level_from FROM
(SELECT job_information.job_title_id,job_title, experience_level_from,
skill_name_id FROM
job_information
JOIN
job_skills
ON job_skills.job_title_id = job_information.job_title_id) AS
job_info_skills
JOIN
skills
ON job_info_skills.skill_name_id = skills.skill_name_id
WHERE experience_level_from = "mid";


