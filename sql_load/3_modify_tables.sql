/*
===============================================================================
Database Load & Data Import Script
===============================================================================
This script loads data from CSV files into the created PostgreSQL tables.

INSTRUCTIONS:
1. Download the dataset CSV files and place them inside a `csv_files/` directory.
2. Replace '[PATH_TO_CSV_FILES]' below with the absolute path on your system.
   Example (Windows): 'C:\projects\SQL_Job_Analysis_2023\csv_files\company_dim.csv'
   Example (Mac/Linux): '/home/user/SQL_Job_Analysis_2023/csv_files/company_dim.csv'

NOTE: If you experience permission errors with the standard `COPY` command:
- Use the psql CLI `\copy` command instead (runs client-side without server permission restrictions):

    \copy company_dim FROM '[PATH_TO_CSV_FILES]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
    \copy skills_dim FROM '[PATH_TO_CSV_FILES]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
    \copy job_postings_fact FROM '[PATH_TO_CSV_FILES]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
    \copy skills_job_dim FROM '[PATH_TO_CSV_FILES]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
===============================================================================
*/

-- Bulk load company dimension data
COPY company_dim
FROM '[PATH_TO_CSV_FILES]/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Bulk load skills dimension data
COPY skills_dim
FROM '[PATH_TO_CSV_FILES]/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Bulk load job postings fact table
COPY job_postings_fact
FROM '[PATH_TO_CSV_FILES]/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Bulk load skills-to-job mapping bridge table
COPY skills_job_dim
FROM '[PATH_TO_CSV_FILES]/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

