/*
 Question:
 What are the most optimal skills to learn for remote Software Engineering?
 
 Goal:
 Identify skills that are both:
 - In high demand among remote Software Engineer jobs
 - Associated with high average salaries
 
 Method:
 - Filter for Software Engineer positions
 - Filter for remote positions
 - Exclude jobs without salary information
 - Count job postings for each skill
 - Calculate average salary for each skill
 - Keep only skills appearing in more than 10 jobs
 - Rank primarily by average salary
 */

WITH skills_wanted AS (
    SELECT s.skill_id,
        s.skills AS skill_name,
        COUNT(sj.job_id) AS skills_count
    FROM skills_dim AS s
        JOIN skills_job_dim AS sj ON sj.skill_id = s.skill_id
        JOIN job_postings_fact AS j ON j.job_id = sj.job_id
    WHERE j.job_title_short = 'Software Engineer'
        AND j.salary_year_avg IS NOT NULL
        AND j.job_work_from_home = true
    GROUP BY s.skill_id,
        s.skills
),
average_salary AS (
    SELECT s.skill_id,
        s.skills AS skill_name,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact AS j
        JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
        JOIN skills_dim AS s ON sj.skill_id = s.skill_id
    WHERE j.job_title_short = 'Software Engineer'
        AND j.salary_year_avg IS NOT NULL
        AND j.job_work_from_home = true
    GROUP BY s.skill_id,
        s.skills
)
SELECT skills_wanted.skill_id,
    skills_wanted.skill_name,
    skills_wanted.skills_count,
    average_salary.avg_salary
FROM skills_wanted
    JOIN average_salary ON skills_wanted.skill_id = average_salary.skill_id
WHERE skills_wanted.skills_count > 10
ORDER BY average_salary.avg_salary DESC,
    skills_wanted.skills_count DESC
LIMIT 25;

-- OR in another way:

SELECT s.skill_id,
    s.skills AS skill_name,
    COUNT(*) AS job_count,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS j
    JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Software Engineer'
    AND j.job_work_from_home = true
    AND j.salary_year_avg IS NOT NULL
GROUP BY s.skill_id,
    s.skills
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC,
    job_count DESC
LIMIT 25;


-- Interestingly it look like this:
/*
 [
 {
 "skill_id": 17,
 "skill_name": "typescript",
 "job_count": "14",
 "avg_salary": "142143"
 },
 {
 "skill_id": 9,
 "skill_name": "javascript",
 "job_count": "16",
 "avg_salary": "137000"
 },
 {
 "skill_id": 1,
 "skill_name": "python",
 "job_count": "32",
 "avg_salary": "132266"
 },
 {
 "skill_id": 81,
 "skill_name": "gcp",
 "job_count": "11",
 "avg_salary": "128351"
 },
 {
 "skill_id": 76,
 "skill_name": "aws",
 "job_count": "21",
 "avg_salary": "125143"
 },
 {
 "skill_id": 0,
 "skill_name": "sql",
 "job_count": "30",
 "avg_salary": "112729"
 },
 {
 "skill_id": 214,
 "skill_name": "docker",
 "job_count": "13",
 "avg_salary": "94308"
 }
 ]
 */