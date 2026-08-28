/*
 Question: What are the top-paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
 - Focuses on job postings with specified salaries (remove nulls).
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment
 */
SELECT j.job_id,
    j.job_title,
    j.job_location,
    c.name AS company_name,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
FROM job_postings_fact j
    LEFT JOIN company_dim c ON j.company_id = c.company_id
WHERE j.job_title_short ILIKE '%software%engineer%'
    AND j.job_location = 'Anywhere'
    AND j.salary_year_avg IS NOT NULL
ORDER BY j.salary_year_avg DESC
LIMIT 10;