/*
 Question: What are the most in-demand skills for data analysts?
 - Join job postings to inner join table similar to query 2
 - Identify the top 5 in-demand skills for a data analyst.
 - Focus on all job postings.
 - Why? Retrieves the top 5 skills with the highest demand in the job market,
 providing insights into the most valuable skills for job seekers.
 */
WITH skills_wanted AS (
    SELECT s.skill_id,
        s.skills AS skill_name,
        COUNT(sj.job_id) AS skills_count
    FROM skills_dim s
        JOIN skills_job_dim sj ON sj.skill_id = s.skill_id
        JOIN job_postings_fact j ON j.job_id = sj.job_id
    WHERE j.job_work_from_home = true
        AND job_title_short = 'Software Engineer'
    GROUP BY s.skill_id,
        s.skills
)
SELECT *
FROM skills_wanted
ORDER BY skills_count DESC
LIMIT 5;
-- well the resualts for SOFTWARE ENGINEER role is:
/*
 [
 {
 "skill_id": 1,
 "skill_name": "python",
 "skills_count": "1318"
 },
 {
 "skill_id": 0,
 "skill_name": "sql",
 "skills_count": "1038"
 },
 {
 "skill_id": 76,
 "skill_name": "aws",
 "skills_count": "1007"
 },
 {
 "skill_id": 4,
 "skill_name": "java",
 "skills_count": "741"
 },
 {
 "skill_id": 213,
 "skill_name": "kubernetes",
 "skills_count": "618"
 }
 ]
 */