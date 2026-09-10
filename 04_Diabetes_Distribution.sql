--04_Diabetes_Distribution
--DiabetesStatus — Frequency Percentage

WITH datas AS (
    SELECT 
        COUNT(*) AS frequency,
    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'Prediabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus_group
FROM diabetes_health_indicators
group by 
  CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'Prediabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END  )
	SELECT
DiabetesStatus_group,
    frequency,
    CAST(
        frequency * 100.0 / SUM(frequency) OVER()
        AS DECIMAL(5,2)
    ) AS Percentage
FROM datas
ORDER BY DiabetesStatus_group



--Diabetes distribution by Sex
select
 CASE
        WHEN Sex = 0 THEN 'Male'
        WHEN Sex = 1 THEN 'Female'
    END AS Sex_name,
sex,DiabetesStatus,count(*) as frequency,
cast(count(*)*100.0/sum(count(*)) over(partition by sex ) as decimal(5,2)) as percentage
FROM diabetes_health_indicators
group by sex,DiabetesStatus
order by sex,DiabetesStatus

--Diabetes distribution by AgeCategory
select AgeCategory,DiabetesStatus,count(*) as frequency,
cast(count(*)*100.0/sum(count(*)) over(partition by AgeCategory ) as decimal(5,2)) as percentage
FROM diabetes_health_indicators
group by AgeCategory,DiabetesStatus
order by AgeCategory,DiabetesStatus