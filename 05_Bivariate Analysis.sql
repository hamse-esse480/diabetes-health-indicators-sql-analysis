-- =========================================================
-- 05_Bivariate_Analysis
-- DiabetesStatus vs Selected Variables
-- =========================================================


-- =========================================================
-- 1. Diabetes vs High Blood Pressure
-- =========================================================

SELECT 
    CASE
        WHEN HighBloodPressure = 0 THEN 'No High Blood Pressure'
        WHEN HighBloodPressure = 1 THEN 'High Blood Pressure'
        ELSE 'Unknown'
    END AS HighBloodPressure,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY HighBloodPressure)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    HighBloodPressure,
    DiabetesStatus

ORDER BY 
    HighBloodPressure,
    DiabetesStatus;



-- =========================================================
-- 2. Diabetes vs High Cholesterol
-- =========================================================

SELECT 
    CASE
        WHEN HighCholesterol = 0 THEN 'No High Cholesterol'
        WHEN HighCholesterol = 1 THEN 'High Cholesterol'
        ELSE 'Unknown'
    END AS HighCholesterol,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY HighCholesterol)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    HighCholesterol,
    DiabetesStatus

ORDER BY 
    HighCholesterol,
    DiabetesStatus;



-- =========================================================
-- 3. Diabetes vs BMI Category
-- =========================================================

SELECT 
    CASE
        WHEN BodyMassIndex IS NULL THEN 'Unknown'
        WHEN BodyMassIndex = 99 THEN 'Unknown'
        WHEN BodyMassIndex < 18.5 THEN 'Underweight'
        WHEN BodyMassIndex < 25 THEN 'Normal weight'
        WHEN BodyMassIndex < 30 THEN 'Overweight'
        WHEN BodyMassIndex >= 30 THEN 'Obese'
        ELSE 'Unknown'
    END AS BMI_Category,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY
            CASE
                WHEN BodyMassIndex IS NULL THEN 'Unknown'
                WHEN BodyMassIndex = 99 THEN 'Unknown'
                WHEN BodyMassIndex < 18.5 THEN 'Underweight'
                WHEN BodyMassIndex < 25 THEN 'Normal weight'
                WHEN BodyMassIndex < 30 THEN 'Overweight'
                WHEN BodyMassIndex >= 30 THEN 'Obese'
                ELSE 'Unknown'
            END
        )
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY
    CASE
        WHEN BodyMassIndex IS NULL THEN 'Unknown'
        WHEN BodyMassIndex = 99 THEN 'Unknown'
        WHEN BodyMassIndex < 18.5 THEN 'Underweight'
        WHEN BodyMassIndex < 25 THEN 'Normal weight'
        WHEN BodyMassIndex < 30 THEN 'Overweight'
        WHEN BodyMassIndex >= 30 THEN 'Obese'
        ELSE 'Unknown'
    END,
    DiabetesStatus

ORDER BY
    BMI_Category,
    DiabetesStatus;



-- =========================================================
-- 4. Diabetes vs Physical Activity
-- =========================================================

SELECT 
    CASE
        WHEN PhysicalActivity = 0 THEN 'No'
        WHEN PhysicalActivity = 1 THEN 'Yes'
        ELSE 'Unknown'
    END AS PhysicalActivity,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY PhysicalActivity)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    PhysicalActivity,
    DiabetesStatus

ORDER BY 
    PhysicalActivity,
    DiabetesStatus;



-- =========================================================
-- 5. Diabetes vs Smoking
-- =========================================================

SELECT 
    CASE
        WHEN Smoking = 0 THEN 'No'
        WHEN Smoking = 1 THEN 'Yes'
        ELSE 'Unknown'
    END AS Smoking,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY Smoking)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    Smoking,
    DiabetesStatus

ORDER BY 
    Smoking,
    DiabetesStatus;



-- =========================================================
-- 6. Diabetes vs Heart Disease
-- =========================================================

SELECT 
    CASE
        WHEN HeartDisease = 0 THEN 'No'
        WHEN HeartDisease = 1 THEN 'Yes'
        ELSE 'Unknown'
    END AS HeartDisease,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY HeartDisease)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    HeartDisease,
    DiabetesStatus

ORDER BY 
    HeartDisease,
    DiabetesStatus;



-- =========================================================
-- 7. Diabetes vs General Health
-- =========================================================

SELECT 
    CASE
        WHEN GeneralHealth = 1 THEN 'Excellent'
        WHEN GeneralHealth = 2 THEN 'Very good'
        WHEN GeneralHealth = 3 THEN 'Good'
        WHEN GeneralHealth = 4 THEN 'Fair'
        WHEN GeneralHealth = 5 THEN 'Poor'
        ELSE 'Unknown'
    END AS GeneralHealth,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY GeneralHealth)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    GeneralHealth,
    DiabetesStatus

ORDER BY 
    GeneralHealth,
    DiabetesStatus;



-- =========================================================
-- 8. Diabetes vs Age Category
-- =========================================================

SELECT 
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
    END AS AgeGroup,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY AgeCategory)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    AgeCategory,
    DiabetesStatus

ORDER BY 
    AgeCategory,
    DiabetesStatus;



-- =========================================================
-- 9. Diabetes vs Sex
-- =========================================================

SELECT 
    CASE
        WHEN Sex = 0 THEN 'Male'
        WHEN Sex = 1 THEN 'Female'
        ELSE 'Unknown'
    END AS Sex,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY Sex)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    Sex,
    DiabetesStatus

ORDER BY 
    Sex,
    DiabetesStatus;



-- =========================================================
-- 10. Diabetes vs Income Category
-- =========================================================

SELECT 
    CASE
        WHEN IncomeCategory = 1 THEN 'Less than $10,000'
        WHEN IncomeCategory = 2 THEN '$10,000-$14,999'
        WHEN IncomeCategory = 3 THEN '$15,000-$24,999'
        WHEN IncomeCategory = 4 THEN '$25,000-$34,999'
        WHEN IncomeCategory = 5 THEN '$35,000-$49,999'
        WHEN IncomeCategory = 6 THEN '$50,000-$74,999'
        WHEN IncomeCategory = 7 THEN '$75,000-$99,999'
        WHEN IncomeCategory = 8 THEN '$100,000-$149,999'
        WHEN IncomeCategory = 9 THEN '$150,000-$199,999'
        WHEN IncomeCategory = 10 THEN '$200,000+'
        WHEN IncomeCategory = 11 THEN 'Unknown'
        ELSE 'Unknown'
    END AS IncomeGroup,

    CASE
        WHEN DiabetesStatus = 0 THEN 'No Diabetes'
        WHEN DiabetesStatus = 1 THEN 'PreDiabetes'
        WHEN DiabetesStatus = 2 THEN 'Diabetes'
        ELSE 'Unknown'
    END AS DiabetesStatus,

    COUNT(*) AS Frequency,

    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY IncomeCategory)
        AS DECIMAL(5,2)
    ) AS Percentage

FROM diabetes_health_indicators

GROUP BY 
    IncomeCategory,
    DiabetesStatus

ORDER BY 
    IncomeCategory,
    DiabetesStatus;