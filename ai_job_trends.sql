
create database ai_job_trends_dataset;

use ai_job_trends_dataset;

CREATE TABLE ai_job_trends (
    Job_Title VARCHAR(100),
    Industry VARCHAR(100),
    Job_Status VARCHAR(100),
    AI_Impact_Level VARCHAR(100),
    Median_Salary decimal(7,4),
    Required_Education VARCHAR(50),
    Experience_Required INT,
    Job_Openings_2024 INT,
    Projected_Openings_2030 INT,
    Remote_Work_Ratio decimal(6,3),
    Location VARCHAR(50),
    Gender_Diversity decimal(6,3),
       Automation_Risk decimal(4,3)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ai_job_trends_dataset.csv"
INTO TABLE ai_job_trends
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 lines;

select*from ai_job_trends;
describe ai_job_trends;

alter table ai_job_trends modify column Median_Salary decimal(10,2);

alter table ai_job_trends add column Automation_Risk decimal(10,2);

alter table ai_job_trends drop column Automation_Risk;


-- Displays first 10 rows
SELECT * 
FROM ai_job_trends
LIMIT 10;

-- Shows jobs with salaries above $100K.
SELECT Job_Title, Industry, Median_Salary
FROM ai_job_trends
WHERE Median_Salary > 100000
ORDER BY Median_Salary DESC;

-- Compares industries by average pay.
SELECT Industry, ROUND(AVG(Median_Salary), 2) AS Avg_Salary
FROM ai_job_trends
GROUP BY Industry
ORDER BY Avg_Salary DESC;

-- Finds how many jobs are in each AI impact category.
SELECT AI_Impact_Level, COUNT(*) AS Total_Jobs
FROM ai_job_trends
GROUP BY AI_Impact_Level
ORDER BY Total_Jobs DESC;

-- Calculates job growth and % increase by industry.
SELECT Industry,
       SUM(Projected_Openings_2030 - Job_Openings_2024) AS Job_Growth,
       ROUND((SUM(Projected_Openings_2030 - Job_Openings_2024) * 100.0 / SUM(Job_Openings_2024)), 2) AS Growth_Percentage
FROM ai_job_trends
GROUP BY Industry
ORDER BY Growth_Percentage DESC;

-- Finds which education levels face higher automation risk.
SELECT Required_Education,
       ROUND(AVG(Automation_Risk ), 2) AS Avg_Risk
FROM ai_job_trends
GROUP BY Required_Education
HAVING AVG(Automation_Risk) > 50
ORDER BY Avg_Risk DESC;

-- Uses window function to find top-paying jobs per industry
SELECT Job_Title, Industry, Median_Salary FROM (
      SELECT *, ROW_NUMBER() OVER (PARTITION BY Industry ORDER BY Median_Salary DESC) AS rn
      FROM ai_job_trends) ranked
WHERE rn <= 5;

-- Analyzes how gender diversity varies with AI impact.
SELECT AI_Impact_Level,
       ROUND(AVG(Gender_Diversity ), 2) AS Avg_Diversity,
       COUNT(*) AS Total_Jobs
FROM ai_job_trends
GROUP BY AI_Impact_Level
ORDER BY Avg_Diversity DESC;

-- Growth % Calculation
SELECT 
    Industry,
    SUM(Projected_Openings_2030 - Job_Openings_2024) * 100.0 / SUM(Job_Openings_2024) AS Growth_Percentage
FROM ai_jobs
GROUP BY Industry;

-- Top Paying Jobs
SELECT Job_Title, Industry, Median_Salary
FROM ai_jobs
ORDER BY Median_Salary_USD DESC
LIMIT 10;

-- Automation Risk by Country
SELECT Location, AVG(Automation_Risk) AS Avg_Risk
FROM ai_jobs
GROUP BY Location;










