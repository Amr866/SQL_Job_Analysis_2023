/*
 Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analyst jobs from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries
 */
WITH top_paying_jobs AS (
    SELECT j.job_id,
        j.job_title,
        c.name AS company_name,
        j.salary_year_avg
    FROM job_postings_fact j
        LEFT JOIN company_dim c ON j.company_id = c.company_id
    WHERE j.job_title_short ILIKE '%software%engineer%'
        AND j.job_location = 'Anywhere'
        AND j.salary_year_avg IS NOT NULL
)
SELECT top_j.job_id,
    top_j.job_title,
    s.skills,
    top_j.company_name,
    top_j.salary_year_avg
FROM top_paying_jobs top_j
    INNER JOIN skills_job_dim sj ON top_j.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
ORDER BY salary_year_avg DESC;

/*
 Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
 SQL is leading with a bold count of 8.
 Python follows closely with a bold count of 7.
 Tableau is also highly sought after, with a bold count of 6.
 Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
 
 
 [
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "javascript",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "typescript",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "azure",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "react",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "spark",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "snowflake",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "python",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 562251,
 "job_title": "Senior Software Engineer",
 "skills": "aws",
 "company_name": "Datavant",
 "salary_year_avg": "225000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "elasticsearch",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 365528,
 "job_title": "Engineering",
 "skills": "python",
 "company_name": "Huckleberry Labs",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 365528,
 "job_title": "Engineering",
 "skills": "aws",
 "company_name": "Huckleberry Labs",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 365528,
 "job_title": "Engineering",
 "skills": "gcp",
 "company_name": "Huckleberry Labs",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "node.js",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "graphql",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "react",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "airflow",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "pandas",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "snowflake",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "aws",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "dynamodb",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1356375,
 "job_title": "Senior Software Engineer, Full Stack",
 "skills": "python",
 "company_name": "SmarterDx",
 "salary_year_avg": "205000.0"
 },
 {
 "job_id": 1398776,
 "job_title": "Senior Software Engineer, Cluster Scalability",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 1398776,
 "job_title": "Senior Software Engineer, Cluster Scalability",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 1231528,
 "job_title": "Senior Software Engineer, Server Security",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 64759,
 "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
 "skills": "typescript",
 "company_name": "Orbis",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 64759,
 "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
 "skills": "ruby",
 "company_name": "Orbis",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 64759,
 "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
 "skills": "ruby",
 "company_name": "Orbis",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 1231528,
 "job_title": "Senior Software Engineer, Server Security",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "200000.0"
 },
 {
 "job_id": 946351,
 "job_title": "Staff Frontend Engineer",
 "skills": "react.js",
 "company_name": "Webflow",
 "salary_year_avg": "191000.0"
 },
 {
 "job_id": 946351,
 "job_title": "Staff Frontend Engineer",
 "skills": "node.js",
 "company_name": "Webflow",
 "salary_year_avg": "191000.0"
 },
 {
 "job_id": 946351,
 "job_title": "Staff Frontend Engineer",
 "skills": "graphql",
 "company_name": "Webflow",
 "salary_year_avg": "191000.0"
 },
 {
 "job_id": 946351,
 "job_title": "Staff Frontend Engineer",
 "skills": "react",
 "company_name": "Webflow",
 "salary_year_avg": "191000.0"
 },
 {
 "job_id": 946351,
 "job_title": "Staff Frontend Engineer",
 "skills": "css",
 "company_name": "Webflow",
 "salary_year_avg": "191000.0"
 },
 {
 "job_id": 946351,
 "job_title": "Staff Frontend Engineer",
 "skills": "javascript",
 "company_name": "Webflow",
 "salary_year_avg": "191000.0"
 },
 {
 "job_id": 1054268,
 "job_title": "Staff Software Engineer, AI",
 "skills": "python",
 "company_name": "Pulley",
 "salary_year_avg": "185000.0"
 },
 {
 "job_id": 1054268,
 "job_title": "Staff Software Engineer, AI",
 "skills": "golang",
 "company_name": "Pulley",
 "salary_year_avg": "185000.0"
 },
 {
 "job_id": 1054268,
 "job_title": "Staff Software Engineer, AI",
 "skills": "typescript",
 "company_name": "Pulley",
 "salary_year_avg": "185000.0"
 },
 {
 "job_id": 1054268,
 "job_title": "Staff Software Engineer, AI",
 "skills": "javascript",
 "company_name": "Pulley",
 "salary_year_avg": "185000.0"
 },
 {
 "job_id": 182858,
 "job_title": "Senior Software Engineer (Confirmations - System)",
 "skills": "javascript",
 "company_name": "ConsenSys",
 "salary_year_avg": "184500.0"
 },
 {
 "job_id": 182858,
 "job_title": "Senior Software Engineer (Confirmations - System)",
 "skills": "typescript",
 "company_name": "ConsenSys",
 "salary_year_avg": "184500.0"
 },
 {
 "job_id": 182858,
 "job_title": "Senior Software Engineer (Confirmations - System)",
 "skills": "react",
 "company_name": "ConsenSys",
 "salary_year_avg": "184500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "javascript",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "asp.net",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "aws",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "azure",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "couchbase",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "dynamodb",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "mongodb",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "elasticsearch",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "mysql",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "redis",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "mongodb",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "c#",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "css",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "html",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 117409,
 "job_title": "Director of Software Engineer",
 "skills": "python",
 "company_name": "Robert Half",
 "salary_year_avg": "182500.0"
 },
 {
 "job_id": 40870,
 "job_title": "Senior Software Engineer, Query",
 "skills": "c",
 "company_name": "MongoDB",
 "salary_year_avg": "174500.0"
 },
 {
 "job_id": 40870,
 "job_title": "Senior Software Engineer, Query",
 "skills": "rust",
 "company_name": "MongoDB",
 "salary_year_avg": "174500.0"
 },
 {
 "job_id": 40870,
 "job_title": "Senior Software Engineer, Query",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "174500.0"
 },
 {
 "job_id": 40870,
 "job_title": "Senior Software Engineer, Query",
 "skills": "c++",
 "company_name": "MongoDB",
 "salary_year_avg": "174500.0"
 },
 {
 "job_id": 40870,
 "job_title": "Senior Software Engineer, Query",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "174500.0"
 },
 {
 "job_id": 176192,
 "job_title": "Lead Software Engineer",
 "skills": "kubernetes",
 "company_name": "Harnham",
 "salary_year_avg": "167500.0"
 },
 {
 "job_id": 176192,
 "job_title": "Lead Software Engineer",
 "skills": "typescript",
 "company_name": "Harnham",
 "salary_year_avg": "167500.0"
 },
 {
 "job_id": 176192,
 "job_title": "Lead Software Engineer",
 "skills": "ruby",
 "company_name": "Harnham",
 "salary_year_avg": "167500.0"
 },
 {
 "job_id": 176192,
 "job_title": "Lead Software Engineer",
 "skills": "redis",
 "company_name": "Harnham",
 "salary_year_avg": "167500.0"
 },
 {
 "job_id": 176192,
 "job_title": "Lead Software Engineer",
 "skills": "ruby",
 "company_name": "Harnham",
 "salary_year_avg": "167500.0"
 },
 {
 "job_id": 178098,
 "job_title": "Principal Software/Data Engineer (Remote)",
 "skills": "java",
 "company_name": "Liberty Mutual Insurance",
 "salary_year_avg": "164500.0"
 },
 {
 "job_id": 178098,
 "job_title": "Principal Software/Data Engineer (Remote)",
 "skills": "dynamodb",
 "company_name": "Liberty Mutual Insurance",
 "salary_year_avg": "164500.0"
 },
 {
 "job_id": 178098,
 "job_title": "Principal Software/Data Engineer (Remote)",
 "skills": "aws",
 "company_name": "Liberty Mutual Insurance",
 "salary_year_avg": "164500.0"
 },
 {
 "job_id": 178098,
 "job_title": "Principal Software/Data Engineer (Remote)",
 "skills": "aurora",
 "company_name": "Liberty Mutual Insurance",
 "salary_year_avg": "164500.0"
 },
 {
 "job_id": 178098,
 "job_title": "Principal Software/Data Engineer (Remote)",
 "skills": "sql",
 "company_name": "Liberty Mutual Insurance",
 "salary_year_avg": "164500.0"
 },
 {
 "job_id": 178098,
 "job_title": "Principal Software/Data Engineer (Remote)",
 "skills": "python",
 "company_name": "Liberty Mutual Insurance",
 "salary_year_avg": "164500.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "aurora",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "pandas",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "airflow",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "excel",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "python",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "sql",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 623792,
 "job_title": "Senior Backend Engineer",
 "skills": "postgresql",
 "company_name": "Vareto",
 "salary_year_avg": "161000.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "sql",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "ruby",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "kafka",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "rust",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "ruby",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "go",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 309010,
 "job_title": "Senior Software Engineer - Data Systems - Remote",
 "skills": "python",
 "company_name": "Voltus",
 "salary_year_avg": "157500.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "airflow",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "snowflake",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "azure",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "c#",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "sql server",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "python",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "sql",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "kubernetes",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "asp.net core",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 682763,
 "job_title": "Senior Software Engineer (Data Science Enablement)",
 "skills": "asp.net",
 "company_name": "Shelf Engine",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "shell",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "python",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "sql",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "snowflake",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "gcp",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "kafka",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "angular",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "jquery",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "linux",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "jenkins",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "github",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "ansible",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "ansible",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "github",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "jenkins",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "linux",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "jquery",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "angular",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "kafka",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "gcp",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "snowflake",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "oracle",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "aws",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "azure",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "sql server",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "elasticsearch",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "neo4j",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "golang",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "mongo",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "css",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "html",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "javascript",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 84917,
 "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
 "skills": "java",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "sql",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "python",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "java",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "shell",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "javascript",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "html",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "css",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "mongo",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "golang",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "neo4j",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "elasticsearch",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "sql server",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "azure",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "aws",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 417162,
 "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
 "skills": "oracle",
 "company_name": "Cisco",
 "salary_year_avg": "155000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "docker",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "linux",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "django",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "react",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "snowflake",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "bigquery",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "aws",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "python",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "typescript",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "tableau",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "kubernetes",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 384267,
 "job_title": "Software Engineer, Infrastructure",
 "skills": "looker",
 "company_name": "Secoda",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1254612,
 "job_title": "Product Analyst",
 "skills": "sql",
 "company_name": "TipTop",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1254612,
 "job_title": "Product Analyst",
 "skills": "bigquery",
 "company_name": "TipTop",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1254612,
 "job_title": "Product Analyst",
 "skills": "flow",
 "company_name": "TipTop",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1254612,
 "job_title": "Product Analyst",
 "skills": "github",
 "company_name": "TipTop",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1254612,
 "job_title": "Product Analyst",
 "skills": "react",
 "company_name": "TipTop",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1254612,
 "job_title": "Product Analyst",
 "skills": "python",
 "company_name": "TipTop",
 "salary_year_avg": "150000.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "aws",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "pandas",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "numpy",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "airflow",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "django",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "fastapi",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "mysql",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "python",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 1084354,
 "job_title": "Software Engineer, Platform Data Science (Remote)",
 "skills": "sql",
 "company_name": "Terray Therapeutics",
 "salary_year_avg": "140500.0"
 },
 {
 "job_id": 887258,
 "job_title": "Founding fullstack engineer",
 "skills": "node",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 143493,
 "job_title": "Founding fullstack engineer",
 "skills": "sql",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 887258,
 "job_title": "Founding fullstack engineer",
 "skills": "sql",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 887258,
 "job_title": "Founding fullstack engineer",
 "skills": "typescript",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 887258,
 "job_title": "Founding fullstack engineer",
 "skills": "gcp",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 143493,
 "job_title": "Founding fullstack engineer",
 "skills": "typescript",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 887258,
 "job_title": "Founding fullstack engineer",
 "skills": "graphql",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 143493,
 "job_title": "Founding fullstack engineer",
 "skills": "node",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 143493,
 "job_title": "Founding fullstack engineer",
 "skills": "gcp",
 "company_name": "Livedocs",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 1207704,
 "job_title": "Performance Analyst",
 "skills": "excel",
 "company_name": "Kforce Technology Staffing",
 "salary_year_avg": "140000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "azure",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "python",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "redis",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "mysql",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "postgresql",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "aws",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "snowflake",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "gcp",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 596116,
 "job_title": "Senior Backend Engineer",
 "skills": "git",
 "company_name": "CorgiAI",
 "salary_year_avg": "138000.0"
 },
 {
 "job_id": 1811129,
 "job_title": "Backend Engineer",
 "skills": "slack",
 "company_name": "PropelAuth",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 1811129,
 "job_title": "Backend Engineer",
 "skills": "python",
 "company_name": "PropelAuth",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 1811129,
 "job_title": "Backend Engineer",
 "skills": "go",
 "company_name": "PropelAuth",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 1811129,
 "job_title": "Backend Engineer",
 "skills": "rust",
 "company_name": "PropelAuth",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 1811129,
 "job_title": "Backend Engineer",
 "skills": "aws",
 "company_name": "PropelAuth",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 1811129,
 "job_title": "Backend Engineer",
 "skills": "pulumi",
 "company_name": "PropelAuth",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 75429,
 "job_title": "CX LEAD SOFTWARE ENGINEER - ACTUARIAL - LEAD DATA ENGINEER  ...",
 "skills": "sql",
 "company_name": "Robert Half",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 75429,
 "job_title": "CX LEAD SOFTWARE ENGINEER - ACTUARIAL - LEAD DATA ENGINEER  ...",
 "skills": "python",
 "company_name": "Robert Half",
 "salary_year_avg": "135000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "node",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "next.js",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "typescript",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "express",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "react",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "mongodb",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "python",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "fastify",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1065710,
 "job_title": "Software Engineer, Tools (React)",
 "skills": "node.js",
 "company_name": "MongoDB",
 "salary_year_avg": "133000.0"
 },
 {
 "job_id": 1464217,
 "job_title": "Sr. Software Engineer (API and Integrations)",
 "skills": "azure",
 "company_name": "Robert Half",
 "salary_year_avg": "132500.0"
 },
 {
 "job_id": 1464217,
 "job_title": "Sr. Software Engineer (API and Integrations)",
 "skills": "sql",
 "company_name": "Robert Half",
 "salary_year_avg": "132500.0"
 },
 {
 "job_id": 1464217,
 "job_title": "Sr. Software Engineer (API and Integrations)",
 "skills": "c#",
 "company_name": "Robert Half",
 "salary_year_avg": "132500.0"
 },
 {
 "job_id": 1576609,
 "job_title": "Staff Software Engineer - Data Science",
 "skills": "javascript",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 1576609,
 "job_title": "Staff Software Engineer - Data Science",
 "skills": "c#",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 1576609,
 "job_title": "Staff Software Engineer - Data Science",
 "skills": "sql",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 1576609,
 "job_title": "Staff Software Engineer - Data Science",
 "skills": "python",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 605884,
 "job_title": "Power BI Developer",
 "skills": "sql",
 "company_name": "Insight Global",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 605884,
 "job_title": "Power BI Developer",
 "skills": "sql server",
 "company_name": "Insight Global",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 605884,
 "job_title": "Power BI Developer",
 "skills": "azure",
 "company_name": "Insight Global",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 605884,
 "job_title": "Power BI Developer",
 "skills": "power bi",
 "company_name": "Insight Global",
 "salary_year_avg": "130000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "java",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "golang",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "erlang",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "gcp",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "kubernetes",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "docker",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1507623,
 "job_title": "Software Engineer - Data Science (Remote)",
 "skills": "sql",
 "company_name": "OpenX Technologies",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1184031,
 "job_title": "Lead Software Engineer",
 "skills": "kubernetes",
 "company_name": "Kerry Search Partners",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1184031,
 "job_title": "Lead Software Engineer",
 "skills": "solidity",
 "company_name": "Kerry Search Partners",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1184031,
 "job_title": "Lead Software Engineer",
 "skills": "typescript",
 "company_name": "Kerry Search Partners",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1184031,
 "job_title": "Lead Software Engineer",
 "skills": "docker",
 "company_name": "Kerry Search Partners",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 1184031,
 "job_title": "Lead Software Engineer",
 "skills": "rust",
 "company_name": "Kerry Search Partners",
 "salary_year_avg": "125000.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "aws",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "gitlab",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "github",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "docker",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "kubernetes",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "terraform",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 350712,
 "job_title": "DevOps Engineer",
 "skills": "python",
 "company_name": "Swish Analytics",
 "salary_year_avg": "122500.0"
 },
 {
 "job_id": 1745425,
 "job_title": "Developer Compliance Analyst",
 "skills": "excel",
 "company_name": "Discord",
 "salary_year_avg": "121500.0"
 },
 {
 "job_id": 1745425,
 "job_title": "Developer Compliance Analyst",
 "skills": "python",
 "company_name": "Discord",
 "salary_year_avg": "121500.0"
 },
 {
 "job_id": 1745425,
 "job_title": "Developer Compliance Analyst",
 "skills": "sql",
 "company_name": "Discord",
 "salary_year_avg": "121500.0"
 },
 {
 "job_id": 1745425,
 "job_title": "Developer Compliance Analyst",
 "skills": "javascript",
 "company_name": "Discord",
 "salary_year_avg": "121500.0"
 },
 {
 "job_id": 1247324,
 "job_title": "Success Engineer",
 "skills": "docker",
 "company_name": "Metabase",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 1247324,
 "job_title": "Success Engineer",
 "skills": "github",
 "company_name": "Metabase",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 1247324,
 "job_title": "Success Engineer",
 "skills": "sql",
 "company_name": "Metabase",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 1247324,
 "job_title": "Success Engineer",
 "skills": "slack",
 "company_name": "Metabase",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 1247324,
 "job_title": "Success Engineer",
 "skills": "word",
 "company_name": "Metabase",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 101111,
 "job_title": "Integration/Interface Analyst",
 "skills": "sap",
 "company_name": "Tech Soft Inc",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 101111,
 "job_title": "Integration/Interface Analyst",
 "skills": "sql",
 "company_name": "Tech Soft Inc",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 101111,
 "job_title": "Integration/Interface Analyst",
 "skills": "oracle",
 "company_name": "Tech Soft Inc",
 "salary_year_avg": "120000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "mongodb",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "python",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "javascript",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "mongodb",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "cassandra",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "bigquery",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "react.js",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 578344,
 "job_title": "Blockscope - Backend Engineer",
 "skills": "word",
 "company_name": "Blockscope",
 "salary_year_avg": "115000.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "tableau",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 307104,
 "job_title": "Growth Engineer (Technical)",
 "skills": "sql",
 "company_name": "Wynd Nework",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 307104,
 "job_title": "Growth Engineer (Technical)",
 "skills": "python",
 "company_name": "Wynd Nework",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 307104,
 "job_title": "Growth Engineer (Technical)",
 "skills": "javascript",
 "company_name": "Wynd Nework",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 307104,
 "job_title": "Growth Engineer (Technical)",
 "skills": "ruby",
 "company_name": "Wynd Nework",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 307104,
 "job_title": "Growth Engineer (Technical)",
 "skills": "ruby",
 "company_name": "Wynd Nework",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 307104,
 "job_title": "Growth Engineer (Technical)",
 "skills": "github",
 "company_name": "Wynd Nework",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "spring",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "docker",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "c++",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "javascript",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "sas",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "java",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "python",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "sas",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "jenkins",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 56718,
 "job_title": "Java/Software Programmer (for the first job description)Data...",
 "skills": "power bi",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "112500.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "linux",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "python",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "java",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "shell",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "javascript",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "aws",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 646696,
 "job_title": "Bioinformatics Software Engineer in Test",
 "skills": "docker",
 "company_name": "Apexon",
 "salary_year_avg": "110000.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "notion",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "rust",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "kotlin",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "typescript",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "go",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "java",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "nosql",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 236486,
 "job_title": "Lead Software Engineer",
 "skills": "slack",
 "company_name": "Cere Network",
 "salary_year_avg": "107500.0"
 },
 {
 "job_id": 119535,
 "job_title": "Programmer Analyst",
 "skills": "aws",
 "company_name": "The Brite Group INC.",
 "salary_year_avg": "97500.0"
 },
 {
 "job_id": 119535,
 "job_title": "Programmer Analyst",
 "skills": "tableau",
 "company_name": "The Brite Group INC.",
 "salary_year_avg": "97500.0"
 },
 {
 "job_id": 119535,
 "job_title": "Programmer Analyst",
 "skills": "sas",
 "company_name": "The Brite Group INC.",
 "salary_year_avg": "97500.0"
 },
 {
 "job_id": 119535,
 "job_title": "Programmer Analyst",
 "skills": "python",
 "company_name": "The Brite Group INC.",
 "salary_year_avg": "97500.0"
 },
 {
 "job_id": 119535,
 "job_title": "Programmer Analyst",
 "skills": "r",
 "company_name": "The Brite Group INC.",
 "salary_year_avg": "97500.0"
 },
 {
 "job_id": 119535,
 "job_title": "Programmer Analyst",
 "skills": "sas",
 "company_name": "The Brite Group INC.",
 "salary_year_avg": "97500.0"
 },
 {
 "job_id": 1752912,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "gcp",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 1752912,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "tableau",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 1752912,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "sql",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 1752912,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "excel",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 767970,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "gcp",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 767970,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "sql",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 767970,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "tableau",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 767970,
 "job_title": "Salesforce Analytic Specialist",
 "skills": "excel",
 "company_name": "Ascension",
 "salary_year_avg": "96928.0"
 },
 {
 "job_id": 1545828,
 "job_title": "Product Analyst",
 "skills": "sheets",
 "company_name": "Get It Recruit - Finance",
 "salary_year_avg": "90000.0"
 },
 {
 "job_id": 1545828,
 "job_title": "Product Analyst",
 "skills": "excel",
 "company_name": "Get It Recruit - Finance",
 "salary_year_avg": "90000.0"
 },
 {
 "job_id": 1545828,
 "job_title": "Product Analyst",
 "skills": "sql",
 "company_name": "Get It Recruit - Finance",
 "salary_year_avg": "90000.0"
 },
 {
 "job_id": 125269,
 "job_title": "Systems Engineer",
 "skills": "sql server",
 "company_name": "Robert Half",
 "salary_year_avg": "87500.0"
 },
 {
 "job_id": 125269,
 "job_title": "Systems Engineer",
 "skills": "sql",
 "company_name": "Robert Half",
 "salary_year_avg": "87500.0"
 },
 {
 "job_id": 125269,
 "job_title": "Systems Engineer",
 "skills": "vmware",
 "company_name": "Robert Half",
 "salary_year_avg": "87500.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "kubernetes",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "excel",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "flask",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "django",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "react",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "gcp",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "python",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "java",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 248396,
 "job_title": "Staff Engineer (Backend) - Remote",
 "skills": "outlook",
 "company_name": "Correlation One",
 "salary_year_avg": "85000.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "node.js",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "javascript",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "html",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "css",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "typescript",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "react",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 1613329,
 "job_title": "Senior Software Engineer, Frontend",
 "skills": "graphql",
 "company_name": "Pocket Network",
 "salary_year_avg": "82500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "ruby on rails",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "sql",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "ruby",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "aws",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "aurora",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "kafka",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "graphql",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 912886,
 "job_title": "Senior Ruby Developer",
 "skills": "ruby",
 "company_name": "KITRUM",
 "salary_year_avg": "81500.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "notion",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "slack",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "zoom",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "go",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "typescript",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "mysql",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "aws",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "react.js",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "docker",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 795394,
 "job_title": "Software Engineer (Web service development Full-stack)",
 "skills": "github",
 "company_name": "UMITRON",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "redshift",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "spark",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "kafka",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "node.js",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "kubernetes",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "docker",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "typescript",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "javascript",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "redis",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "golang",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "postgresql",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "elasticsearch",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 77206,
 "job_title": "Senior Backend Engineer",
 "skills": "aws",
 "company_name": "Waitroom",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "azure",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "postgresql",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "mysql",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "mongodb",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "go",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "python",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "sql",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "mongodb",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "gcp",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 738482,
 "job_title": "Staff Software Engineer",
 "skills": "aws",
 "company_name": "Altimate AI",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "python",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "nosql",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "firebase",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "firebase",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "graphql",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "fastapi",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 171799,
 "job_title": "Senior Backend Engineer with Python",
 "skills": "docker",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "75000.0"
 },
 {
 "job_id": 233490,
 "job_title": "Software Engineer",
 "skills": "github",
 "company_name": "HackerPulse",
 "salary_year_avg": "72000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "laravel",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "linux",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "ubuntu",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "javascript",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "css",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "mysql",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "aws",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "git",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "docker",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1750967,
 "job_title": "Mid Fullstack Engineer (REMOTE)",
 "skills": "digitalocean",
 "company_name": "Fitsoftware OU",
 "salary_year_avg": "55000.0"
 },
 {
 "job_id": 1195104,
 "job_title": "Senior Python Developer",
 "skills": "pyspark",
 "company_name": "Alef Invest",
 "salary_year_avg": "54000.0"
 },
 {
 "job_id": 1195104,
 "job_title": "Senior Python Developer",
 "skills": "spark",
 "company_name": "Alef Invest",
 "salary_year_avg": "54000.0"
 },
 {
 "job_id": 1195104,
 "job_title": "Senior Python Developer",
 "skills": "python",
 "company_name": "Alef Invest",
 "salary_year_avg": "54000.0"
 },
 {
 "job_id": 1195104,
 "job_title": "Senior Python Developer",
 "skills": "sql",
 "company_name": "Alef Invest",
 "salary_year_avg": "54000.0"
 },
 {
 "job_id": 1799829,
 "job_title": "Senior Software Engineer Opportunities at Helium Health",
 "skills": "python",
 "company_name": "Helium Health",
 "salary_year_avg": "54000.0"
 },
 {
 "job_id": 1799829,
 "job_title": "Senior Software Engineer Opportunities at Helium Health",
 "skills": "elixir",
 "company_name": "Helium Health",
 "salary_year_avg": "54000.0"
 },
 {
 "job_id": 407506,
 "job_title": "Tableau Developer",
 "skills": "sql",
 "company_name": "Smart Apartment Data",
 "salary_year_avg": "46000.0"
 },
 {
 "job_id": 407506,
 "job_title": "Tableau Developer",
 "skills": "tableau",
 "company_name": "Smart Apartment Data",
 "salary_year_avg": "46000.0"
 },
 {
 "job_id": 407506,
 "job_title": "Tableau Developer",
 "skills": "sql server",
 "company_name": "Smart Apartment Data",
 "salary_year_avg": "46000.0"
 },
 {
 "job_id": 57096,
 "job_title": "PHP Integrations Engineer",
 "skills": "php",
 "company_name": "HighCohesion",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "graphql",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "excel",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "powerpoint",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 57096,
 "job_title": "PHP Integrations Engineer",
 "skills": "docker",
 "company_name": "HighCohesion",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 57096,
 "job_title": "PHP Integrations Engineer",
 "skills": "git",
 "company_name": "HighCohesion",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 57096,
 "job_title": "PHP Integrations Engineer",
 "skills": "graphql",
 "company_name": "HighCohesion",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 57096,
 "job_title": "PHP Integrations Engineer",
 "skills": "aws",
 "company_name": "HighCohesion",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "sql",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "go",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "mysql",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1613355,
 "job_title": "Product Analyst",
 "skills": "postgresql",
 "company_name": "Chainstack",
 "salary_year_avg": "45000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "docker",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "bitbucket",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "gitlab",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "redis",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "mongodb",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "nosql",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "python",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "sql",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "mysql",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "mongodb",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "aws",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "kafka",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "git",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 1098132,
 "job_title": "Python Engineer",
 "skills": "github",
 "company_name": "Global Job Services - Game Job Remote",
 "salary_year_avg": "36000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "java",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "scala",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "golang",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "sql",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "nosql",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "go",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 },
 {
 "job_id": 29337,
 "job_title": "(Senior/Lead) Backend Software Engineer - Open to remote work",
 "skills": "c#",
 "company_name": "Axon",
 "salary_year_avg": "28000.0"
 }
 ]
 */