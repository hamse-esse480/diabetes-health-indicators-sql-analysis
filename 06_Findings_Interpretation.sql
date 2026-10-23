-- ============================================================
-- 06. FINDINGS & INTERPRETATION
-- Dataset table: dbo.diabetes_health_indicators
-- Purpose: Produce descriptive outputs for reporting.
-- Run after confirming the table and variable coding.
-- ============================================================

-- 1. Outcome distribution
-- Confirm the source data dictionary before assigning labels to 0, 1, and 2.
SELECT
    DiabetesStatus,
    COUNT(*) AS Respondents,
    CAST(100.0 * COUNT(*) / NULLIF(SUM(COUNT(*)) OVER (), 0) AS DECIMAL(6,2)) AS Percent_of_Rows
FROM dbo.diabetes_health_indicators
GROUP BY DiabetesStatus
ORDER BY DiabetesStatus;

-- 2. Diabetes status by age category
SELECT
    AgeCategory,
    DiabetesStatus,
    COUNT(*) AS Respondents,
    CAST(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (PARTITION BY AgeCategory), 0)
        AS DECIMAL(6,2)
    ) AS Percent_within_Age_Category
FROM dbo.diabetes_health_indicators
GROUP BY AgeCategory, DiabetesStatus
ORDER BY AgeCategory, DiabetesStatus;

-- 3. Diabetes status by sex
SELECT
    Sex,
    DiabetesStatus,
    COUNT(*) AS Respondents,
    CAST(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (PARTITION BY Sex), 0)
        AS DECIMAL(6,2)
    ) AS Percent_within_Sex
FROM dbo.diabetes_health_indicators
GROUP BY Sex, DiabetesStatus
ORDER BY Sex, DiabetesStatus;

-- 4. Diabetes status by selected health indicators
SELECT
    HighBloodPressure,
    DiabetesStatus,
    COUNT(*) AS Respondents
FROM dbo.diabetes_health_indicators
GROUP BY HighBloodPressure, DiabetesStatus
ORDER BY HighBloodPressure, DiabetesStatus;

SELECT
    HighCholesterol,
    DiabetesStatus,
    COUNT(*) AS Respondents
FROM dbo.diabetes_health_indicators
GROUP BY HighCholesterol, DiabetesStatus
ORDER BY HighCholesterol, DiabetesStatus;

SELECT
    PhysicalActivity,
    DiabetesStatus,
    COUNT(*) AS Respondents
FROM dbo.diabetes_health_indicators
GROUP BY PhysicalActivity, DiabetesStatus
ORDER BY PhysicalActivity, DiabetesStatus;

-- 5. Descriptive BMI summary by diabetes-status code
SELECT
    DiabetesStatus,
    COUNT(BodyMassIndex) AS Nonmissing_BMI_Records,
    CAST(AVG(CAST(BodyMassIndex AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Mean_BMI,
    MIN(BodyMassIndex) AS Minimum_BMI,
    MAX(BodyMassIndex) AS Maximum_BMI
FROM dbo.diabetes_health_indicators
GROUP BY DiabetesStatus
ORDER BY DiabetesStatus;

-- Interpretation reminders:
-- * Verify DiabetesStatus labels against the dataset's official data dictionary.
-- * These are unadjusted descriptive summaries, not causal or adjusted estimates.
-- * Report denominators and missing data when interpreting percentages.
