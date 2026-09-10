-- ============================================================
-- 02. DATA CLEANING
-- Table: diabetes_health_indicators
-- ============================================================


/* ------------------------------------------------------------
   1. CHECK DiabetesStatus
   Expected: 0, 1, 2
   ------------------------------------------------------------ */

SELECT 
    DiabetesStatus,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY DiabetesStatus
ORDER BY DiabetesStatus;


/* ------------------------------------------------------------
   2. CHECK BINARY VARIABLES
   Expected: 0 and 1
   ------------------------------------------------------------ */

SELECT 
    'HighBloodPressure' AS Variable,
    HighBloodPressure AS Value,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY HighBloodPressure

UNION ALL

SELECT 
    'HighCholesterol',
    HighCholesterol,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY HighCholesterol

UNION ALL

SELECT 
    'CholesterolCheck',
    CholesterolCheck,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY CholesterolCheck

UNION ALL

SELECT 
    'Smoking',
    Smoking,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY Smoking

UNION ALL

SELECT 
    'StrokeHistory',
    StrokeHistory,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY StrokeHistory

UNION ALL

SELECT 
    'HeartDisease',
    HeartDisease,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY HeartDisease

UNION ALL

SELECT 
    'PhysicalActivity',
    PhysicalActivity,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY PhysicalActivity

UNION ALL

SELECT 
    'FruitConsumption',
    FruitConsumption,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY FruitConsumption

UNION ALL

SELECT 
    'VegetableConsumption',
    VegetableConsumption,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY VegetableConsumption

UNION ALL

SELECT 
    'HeavyAlcoholConsumption',
    HeavyAlcoholConsumption,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY HeavyAlcoholConsumption

UNION ALL

SELECT 
    'HealthCareCoverage',
    HealthCareCoverage,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY HealthCareCoverage

UNION ALL

SELECT 
    'NoDoctorCostBarrier',
    NoDoctorCostBarrier,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY NoDoctorCostBarrier

UNION ALL

SELECT 
    'DifficultyWalking',
    DifficultyWalking,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY DifficultyWalking

UNION ALL

SELECT 
    'Sex',
    Sex,
    COUNT(*) AS Frequency
FROM dbo.diabetes_health_indicators
GROUP BY Sex

ORDER BY Variable, Value;


/* ------------------------------------------------------------
   3. CHECK BMI
   Minimum, Maximum and Mean
   ------------------------------------------------------------ */

SELECT 
    MIN(BodyMassIndex) AS Minimum_BMI,
    MAX(BodyMassIndex) AS Maximum_BMI,
    AVG(BodyMassIndex) AS Mean_BMI
FROM dbo.diabetes_health_indicators;


/* ------------------------------------------------------------
   4. POTENTIALLY SUSPICIOUS BMI VALUES
   ------------------------------------------------------------ */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE BodyMassIndex < 10
   OR BodyMassIndex > 80;


/* ------------------------------------------------------------
   5. SPECIFICALLY CHECK BMI = 99
   ------------------------------------------------------------ */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE BodyMassIndex = 99;


/* ------------------------------------------------------------
   6. CHECK AGE RANGE
   Expected: 1–13
   ------------------------------------------------------------ */

SELECT 
    MIN(AgeCategory) AS Minimum_Age,
    MAX(AgeCategory) AS Maximum_Age,
    COUNT(DISTINCT AgeCategory) AS Number_of_Age_Categories
FROM dbo.diabetes_health_indicators;


/* Invalid Age values */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE AgeCategory < 1
   OR AgeCategory > 13;


/* ------------------------------------------------------------
   7. CHECK MENTAL HEALTH RANGE
   Expected: 0–30
   ------------------------------------------------------------ */

SELECT 
    MIN(MentalHealthDays) AS Minimum_MentalHealthDays,
    MAX(MentalHealthDays) AS Maximum_MentalHealthDays
FROM dbo.diabetes_health_indicators;


/* Invalid values */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE MentalHealthDays < 0
   OR MentalHealthDays > 30;


/* ------------------------------------------------------------
   8. CHECK PHYSICAL HEALTH RANGE
   Expected: 0–30
   ------------------------------------------------------------ */

SELECT 
    MIN(PhysicalHealthDays) AS Minimum_PhysicalHealthDays,
    MAX(PhysicalHealthDays) AS Maximum_PhysicalHealthDays
FROM dbo.diabetes_health_indicators;


/* Invalid values */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE PhysicalHealthDays < 0
   OR PhysicalHealthDays > 30;


/* ------------------------------------------------------------
   9. CHECK EDUCATION RANGE
   Expected: 1–6
   ------------------------------------------------------------ */

SELECT 
    MIN(EducationLevel) AS Minimum_Education,
    MAX(EducationLevel) AS Maximum_Education,
    COUNT(DISTINCT EducationLevel) AS Number_of_Education_Categories
FROM dbo.diabetes_health_indicators;


/* Invalid values */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE EducationLevel < 1
   OR EducationLevel > 6;


/* ------------------------------------------------------------
   10. CHECK INCOME RANGE
   Expected: 1–11
   ------------------------------------------------------------ */

SELECT 
    MIN(IncomeCategory) AS Minimum_Income,
    MAX(IncomeCategory) AS Maximum_Income,
    COUNT(DISTINCT IncomeCategory) AS Number_of_Income_Categories
FROM dbo.diabetes_health_indicators;


/* Invalid values */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE IncomeCategory < 1
   OR IncomeCategory > 11;


/* ------------------------------------------------------------
   11. CHECK GENERAL HEALTH RANGE
   Expected: 1–5
   ------------------------------------------------------------ */

SELECT 
    MIN(GeneralHealth) AS Minimum_GeneralHealth,
    MAX(GeneralHealth) AS Maximum_GeneralHealth,
    COUNT(DISTINCT GeneralHealth) AS Number_of_GeneralHealth_Categories
FROM dbo.diabetes_health_indicators;


/* Invalid values */

SELECT *
FROM dbo.diabetes_health_indicators
WHERE GeneralHealth < 1
   OR GeneralHealth > 5;


/* ------------------------------------------------------------
   12. CHECK ALL NUMERIC RANGES TOGETHER
   ------------------------------------------------------------ */

SELECT 
    MIN(BodyMassIndex) AS BMI_Min,
    MAX(BodyMassIndex) AS BMI_Max,

    MIN(AgeCategory) AS Age_Min,
    MAX(AgeCategory) AS Age_Max,

    MIN(MentalHealthDays) AS MentalHealth_Min,
    MAX(MentalHealthDays) AS MentalHealth_Max,

    MIN(PhysicalHealthDays) AS PhysicalHealth_Min,
    MAX(PhysicalHealthDays) AS PhysicalHealth_Max,

    MIN(EducationLevel) AS Education_Min,
    MAX(EducationLevel) AS Education_Max,

    MIN(IncomeCategory) AS Income_Min,
    MAX(IncomeCategory) AS Income_Max,

    MIN(GeneralHealth) AS GeneralHealth_Min,
    MAX(GeneralHealth) AS GeneralHealth_Max

FROM dbo.diabetes_health_indicators;


/* ------------------------------------------------------------
   13. FINAL ROW COUNT
   Confirms that no rows were deleted during cleaning.
   ------------------------------------------------------------ */

SELECT 
    COUNT(*) AS Final_Row_Count
FROM dbo.diabetes_health_indicators;


/* ------------------------------------------------------------
   14. FINAL MISSING VALUE CHECK
   ------------------------------------------------------------ */

SELECT
    COUNT(*) AS Total_Rows,

    SUM(
        CASE WHEN DiabetesStatus IS NULL THEN 1 ELSE 0 END +
        CASE WHEN HighBloodPressure IS NULL THEN 1 ELSE 0 END +
        CASE WHEN HighCholesterol IS NULL THEN 1 ELSE 0 END +
        CASE WHEN CholesterolCheck IS NULL THEN 1 ELSE 0 END +
        CASE WHEN BodyMassIndex IS NULL THEN 1 ELSE 0 END +
        CASE WHEN Smoking IS NULL THEN 1 ELSE 0 END +
        CASE WHEN StrokeHistory IS NULL THEN 1 ELSE 0 END +
        CASE WHEN HeartDisease IS NULL THEN 1 ELSE 0 END +
        CASE WHEN PhysicalActivity IS NULL THEN 1 ELSE 0 END +
        CASE WHEN FruitConsumption IS NULL THEN 1 ELSE 0 END +
        CASE WHEN VegetableConsumption IS NULL THEN 1 ELSE 0 END +
        CASE WHEN HeavyAlcoholConsumption IS NULL THEN 1 ELSE 0 END +
        CASE WHEN HealthCareCoverage IS NULL THEN 1 ELSE 0 END +
        CASE WHEN NoDoctorCostBarrier IS NULL THEN 1 ELSE 0 END +
        CASE WHEN GeneralHealth IS NULL THEN 1 ELSE 0 END +
        CASE WHEN MentalHealthDays IS NULL THEN 1 ELSE 0 END +
        CASE WHEN PhysicalHealthDays IS NULL THEN 1 ELSE 0 END +
        CASE WHEN DifficultyWalking IS NULL THEN 1 ELSE 0 END +
        CASE WHEN Sex IS NULL THEN 1 ELSE 0 END +
        CASE WHEN AgeCategory IS NULL THEN 1 ELSE 0 END +
        CASE WHEN EducationLevel IS NULL THEN 1 ELSE 0 END +
        CASE WHEN IncomeCategory IS NULL THEN 1 ELSE 0 END
    ) AS Total_Missing_Values

FROM dbo.diabetes_health_indicators;