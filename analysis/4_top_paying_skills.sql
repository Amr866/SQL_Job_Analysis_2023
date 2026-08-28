/*
 Answer: What are the top skills based on salary?
 Look at the average salary associated with each skill for Data Analyst positions
 - Focuses on roles with specified salaries, regardless of location
 - Why? It reveals how different skills impact salary levels for Data Analysts and
 helps identify the most financially rewarding skills to acquire or improve
 */

SELECT s.skills AS skill_name,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS j
    JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Software Engineer'
    AND j.salary_year_avg IS NOT NULL
GROUP BY s.skills
ORDER BY avg_salary DESC
LIMIT 25;


-- So here is the result then:
/*
 [
 {
 "skill_name": "cassandra",
 "avg_salary": "213333"
 },
 {
 "skill_name": "debian",
 "avg_salary": "196500"
 },
 {
 "skill_name": "neo4j",
 "avg_salary": "183840"
 },
 {
 "skill_name": "couchbase",
 "avg_salary": "166250"
 },
 {
 "skill_name": "assembly",
 "avg_salary": "157188"
 },
 {
 "skill_name": "asp.net core",
 "avg_salary": "155000"
 },
 {
 "skill_name": "ruby on rails",
 "avg_salary": "149500"
 },
 {
 "skill_name": "dynamodb",
 "avg_salary": "148813"
 },
 {
 "skill_name": "node",
 "avg_salary": "145147"
 },
 {
 "skill_name": "aurora",
 "avg_salary": "144561"
 },
 {
 "skill_name": "express",
 "avg_salary": "143816"
 },
 {
 "skill_name": "go",
 "avg_salary": "142748"
 },
 {
 "skill_name": "julia",
 "avg_salary": "142500"
 },
 {
 "skill_name": "workfront",
 "avg_salary": "142430"
 },
 {
 "skill_name": "sharepoint",
 "avg_salary": "141454"
 },
 {
 "skill_name": "clojure",
 "avg_salary": "140000"
 },
 {
 "skill_name": "next.js",
 "avg_salary": "138433"
 },
 {
 "skill_name": "matplotlib",
 "avg_salary": "137675"
 },
 {
 "skill_name": "mongo",
 "avg_salary": "137502"
 },
 {
 "skill_name": "alteryx",
 "avg_salary": "137500"
 },
 {
 "skill_name": "golang",
 "avg_salary": "136685"
 },
 {
 "skill_name": "node.js",
 "avg_salary": "136657"
 },
 {
 "skill_name": "looker",
 "avg_salary": "134431"
 },
 {
 "skill_name": "atlassian",
 "avg_salary": "134000"
 },
 {
 "skill_name": "c",
 "avg_salary": "133721"
 }
 ]
 */