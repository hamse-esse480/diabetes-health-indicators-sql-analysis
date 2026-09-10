--03 — Descriptive Statistics
--Total Participants

select count(*) as total_participants from diabetes_health_indicators

--BodyMassIndex

 select Avg (BodyMassIndex) as AVG_BodyMassIndex from diabetes_health_indicators
 select percentile_cont(0.5) within group (order by BodyMassIndex ) over() as median_BodyMassIndex
 from diabetes_health_indicators
 select min (BodyMassIndex) as min_BodyMassIndex,max(BodyMassIndex) as max_BodyMassIndex from diabetes_health_indicators
 select STDEV (BodyMassIndex) as SD_BodyMassIndex from diabetes_health_indicators


--MentalHealthDays


select Avg (MentalHealthDays) as AVG_MentalHealthDays from diabetes_health_indicators
 select percentile_cont(0.5) within group (order by MentalHealthDays ) over() as median_MentalHealthDays
 from diabetes_health_indicators
 select min (MentalHealthDays) as min_MentalHealthDays,max(MentalHealthDays) as max_MentalHealthDays from diabetes_health_indicators
 select STDEV (MentalHealthDays) as SD_MentalHealthDays from diabetes_health_indicators

--PhysicalHealthDays

 select Avg (PhysicalHealthDays) as AVG_PhysicalHealthDays from diabetes_health_indicators
 select percentile_cont(0.5) within group (order by PhysicalHealthDays ) over() as median_PhysicalHealthDays
 from diabetes_health_indicators
 select min (PhysicalHealthDays) as min_PhysicalHealthDays,max(PhysicalHealthDays) as max_PhysicalHealthDays from diabetes_health_indicators
 select STDEV (PhysicalHealthDays) as SD_PhysicalHealthDays from diabetes_health_indicators



-- AgeCategory


WITH datas AS (
    SELECT 
        COUNT(*) AS frequency,
        CASE
            WHEN AgeCategory = 1 THEN '18-24'
            WHEN AgeCategory = 2 THEN '25-29'
            WHEN AgeCategory = 3 THEN '30-34'
            WHEN AgeCategory = 4 THEN '35-39'
            WHEN AgeCategory = 5 THEN '40-44'
            WHEN AgeCategory = 6 THEN '45-49'
            WHEN AgeCategory = 7 THEN '50-54'
            WHEN AgeCategory = 8 THEN '55-59'
            WHEN AgeCategory = 9 THEN '60-64'
            WHEN AgeCategory = 10 THEN '65-69'
            WHEN AgeCategory = 11 THEN '70-74'
            WHEN AgeCategory = 12 THEN '75-79'
            WHEN AgeCategory = 13 THEN '80+'
            ELSE 'Unknown'
        END AS AgeGroup
    FROM diabetes_health_indicators
    GROUP BY 
        CASE
            WHEN AgeCategory = 1 THEN '18-24'
            WHEN AgeCategory = 2 THEN '25-29'
            WHEN AgeCategory = 3 THEN '30-34'
            WHEN AgeCategory = 4 THEN '35-39'
            WHEN AgeCategory = 5 THEN '40-44'
            WHEN AgeCategory = 6 THEN '45-49'
            WHEN AgeCategory = 7 THEN '50-54'
            WHEN AgeCategory = 8 THEN '55-59'
            WHEN AgeCategory = 9 THEN '60-64'
            WHEN AgeCategory = 10 THEN '65-69'
            WHEN AgeCategory = 11 THEN '70-74'
            WHEN AgeCategory = 12 THEN '75-79'
            WHEN AgeCategory = 13 THEN '80+'
            ELSE 'Unknown'
        END
)
SELECT
    AgeGroup,
    frequency,
    CAST(
        frequency * 100.0 / SUM(frequency) OVER()
        AS DECIMAL(5,2)
    ) AS Percentage
FROM datas
ORDER BY AgeGroup;

--EducationLevel


WITH datas AS (
    SELECT 
        COUNT(*) AS frequency,
    CASE
        WHEN EducationLevel = 1 THEN 'Never attended school'
        WHEN EducationLevel = 2 THEN 'Elementary school'
        WHEN EducationLevel = 3 THEN 'Some high school'
        WHEN EducationLevel = 4 THEN 'High school graduate'
        WHEN EducationLevel = 5 THEN 'Some college or technical school'
        WHEN EducationLevel = 6 THEN 'College graduate'
        ELSE 'Unknown'
    END AS EducationLevel_Name
FROM diabetes_health_indicators
    GROUP BY 
            CASE
        WHEN EducationLevel = 1 THEN 'Never attended school'
        WHEN EducationLevel = 2 THEN 'Elementary school'
        WHEN EducationLevel = 3 THEN 'Some high school'
        WHEN EducationLevel = 4 THEN 'High school graduate'
        WHEN EducationLevel = 5 THEN 'Some college or technical school'
        WHEN EducationLevel = 6 THEN 'College graduate'
        ELSE 'Unknown'
    END 
)
SELECT
EducationLevel_Name,
    frequency,
    CAST(
        frequency * 100.0 / SUM(frequency) OVER()
        AS DECIMAL(5,2)
    ) AS Percentage
FROM datas
ORDER BY EducationLevel_Name

 --IncomeCategory


select distinct IncomeCategory FROM diabetes_health_indicators order by IncomeCategory asc


WITH datas AS (
    SELECT 
        COUNT(*) AS frequency,
    CASE
        WHEN IncomeCategory = 1 THEN 'Less than $10,000'
        WHEN IncomeCategory = 2 THEN '$10,000–$14,999'
        WHEN IncomeCategory = 3 THEN '$15,000–$24,999'
        WHEN IncomeCategory = 4 THEN '$25,000–$34,999'
        WHEN IncomeCategory = 5 THEN '$35,000–$49,999'
        WHEN IncomeCategory = 6 THEN '$50,000–$74,999'
        WHEN IncomeCategory = 7 THEN '$75,000–$99,999'
        WHEN IncomeCategory = 8 THEN '$100,000–$149,999'
        WHEN IncomeCategory = 9 THEN '$150,000–$199,999'
        WHEN IncomeCategory = 10 THEN '$200,000+'
        WHEN IncomeCategory = 11 THEN 'Unknown'
    END AS IncomeCategory_Name
FROM diabetes_health_indicators
    GROUP BY 
             CASE
        WHEN IncomeCategory = 1 THEN 'Less than $10,000'
        WHEN IncomeCategory = 2 THEN '$10,000–$14,999'
        WHEN IncomeCategory = 3 THEN '$15,000–$24,999'
        WHEN IncomeCategory = 4 THEN '$25,000–$34,999'
        WHEN IncomeCategory = 5 THEN '$35,000–$49,999'
        WHEN IncomeCategory = 6 THEN '$50,000–$74,999'
        WHEN IncomeCategory = 7 THEN '$75,000–$99,999'
        WHEN IncomeCategory = 8 THEN '$100,000–$149,999'
        WHEN IncomeCategory = 9 THEN '$150,000–$199,999'
        WHEN IncomeCategory = 10 THEN '$200,000+'
        WHEN IncomeCategory = 11 THEN 'Unknown'
    END
)
SELECT
IncomeCategory_Name,
    frequency,
    CAST(
        frequency * 100.0 / SUM(frequency) OVER()
        AS DECIMAL(5,2)
    ) AS Percentage
FROM datas
ORDER BY IncomeCategory_Name
