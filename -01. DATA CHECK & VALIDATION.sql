-- ============================================================
-- 01. DATA CHECK & VALIDATION
-- Table: diabetes_health_indicators
-- ============================================================


/* ------------------------------------------------------------
   CHECK TOTAL ROWS
   ------------------------------------------------------------ */

SELECT
    COUNT(*) AS Total_Rows
FROM dbo.diabetes_health_indicators;


/* ------------------------------------------------------------
   CHECK TOTAL COLUMNS
   ------------------------------------------------------------ */

SELECT
    COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'diabetes_health_indicators';


/* ------------------------------------------------------------
   CHECK MISSING VALUES
   ------------------------------------------------------------ */

SELECT
    SUM(CASE WHEN DiabetesStatus IS NULL THEN 1 ELSE 0 END) AS DiabetesStatus_Missing,
    SUM(CASE WHEN HighBloodPressure IS NULL THEN 1 ELSE 0 END) AS HighBloodPressure_Missing,
    SUM(CASE WHEN HighCholesterol IS NULL THEN 1 ELSE 0 END) AS HighCholesterol_Missing,
    SUM(CASE WHEN CholesterolCheck IS NULL THEN 1 ELSE 0 END) AS CholesterolCheck_Missing,
    SUM(CASE WHEN BodyMassIndex IS NULL THEN 1 ELSE 0 END) AS BodyMassIndex_Missing,
    SUM(CASE WHEN Smoking IS NULL THEN 1 ELSE 0 END) AS Smoking_Missing,
    SUM(CASE WHEN StrokeHistory IS NULL THEN 1 ELSE 0 END) AS StrokeHistory_Missing,
    SUM(CASE WHEN HeartDisease IS NULL THEN 1 ELSE 0 END) AS HeartDisease_Missing,
    SUM(CASE WHEN PhysicalActivity IS NULL THEN 1 ELSE 0 END) AS PhysicalActivity_Missing,
    SUM(CASE WHEN FruitConsumption IS NULL THEN 1 ELSE 0 END) AS FruitConsumption_Missing,
    SUM(CASE WHEN VegetableConsumption IS NULL THEN 1 ELSE 0 END) AS VegetableConsumption_Missing,
    SUM(CASE WHEN HeavyAlcoholConsumption IS NULL THEN 1 ELSE 0 END) AS HeavyAlcoholConsumption_Missing,
    SUM(CASE WHEN HealthCareCoverage IS NULL THEN 1 ELSE 0 END) AS HealthCareCoverage_Missing,
    SUM(CASE WHEN NoDoctorCostBarrier IS NULL THEN 1 ELSE 0 END) AS NoDoctorCostBarrier_Missing,
    SUM(CASE WHEN GeneralHealth IS NULL THEN 1 ELSE 0 END) AS GeneralHealth_Missing,
    SUM(CASE WHEN MentalHealthDays IS NULL THEN 1 ELSE 0 END) AS MentalHealthDays_Missing,
    SUM(CASE WHEN PhysicalHealthDays IS NULL THEN 1 ELSE 0 END) AS PhysicalHealthDays_Missing,
    SUM(CASE WHEN DifficultyWalking IS NULL THEN 1 ELSE 0 END) AS DifficultyWalking_Missing,
    SUM(CASE WHEN Sex IS NULL THEN 1 ELSE 0 END) AS Sex_Missing,
    SUM(CASE WHEN AgeCategory IS NULL THEN 1 ELSE 0 END) AS AgeCategory_Missing,
    SUM(CASE WHEN EducationLevel IS NULL THEN 1 ELSE 0 END) AS EducationLevel_Missing,
    SUM(CASE WHEN IncomeCategory IS NULL THEN 1 ELSE 0 END) AS IncomeCategory_Missing
FROM dbo.diabetes_health_indicators;


/* ------------------------------------------------------------
   CHECK DUPLICATE COLUMN NAMES
   ------------------------------------------------------------ */

SELECT
    COLUMN_NAME,
    COUNT(*) AS Column_Count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'diabetes_health_indicators'
GROUP BY COLUMN_NAME
HAVING COUNT(*) > 1;


/* ------------------------------------------------------------
   CHECK DATA TYPES
   ------------------------------------------------------------ */

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'diabetes_health_indicators'
ORDER BY ORDINAL_POSITION;


/* ------------------------------------------------------------
   CHECK DISTINCT VALUES FOR EACH VARIABLE
   ------------------------------------------------------------ */

SELECT DISTINCT DiabetesStatus
FROM dbo.diabetes_health_indicators
ORDER BY DiabetesStatus;

SELECT DISTINCT HighBloodPressure
FROM dbo.diabetes_health_indicators
ORDER BY HighBloodPressure;

SELECT DISTINCT HighCholesterol
FROM dbo.diabetes_health_indicators
ORDER BY HighCholesterol;

SELECT DISTINCT CholesterolCheck
FROM dbo.diabetes_health_indicators
ORDER BY CholesterolCheck;

SELECT DISTINCT BodyMassIndex
FROM dbo.diabetes_health_indicators
ORDER BY BodyMassIndex;

SELECT DISTINCT Smoking
FROM dbo.diabetes_health_indicators
ORDER BY Smoking;

SELECT DISTINCT StrokeHistory
FROM dbo.diabetes_health_indicators
ORDER BY StrokeHistory;

SELECT DISTINCT HeartDisease
FROM dbo.diabetes_health_indicators
ORDER BY HeartDisease;

SELECT DISTINCT PhysicalActivity
FROM dbo.diabetes_health_indicators
ORDER BY PhysicalActivity;

SELECT DISTINCT FruitConsumption
FROM dbo.diabetes_health_indicators
ORDER BY FruitConsumption;

SELECT DISTINCT VegetableConsumption
FROM dbo.diabetes_health_indicators
ORDER BY VegetableConsumption;

SELECT DISTINCT HeavyAlcoholConsumption
FROM dbo.diabetes_health_indicators
ORDER BY HeavyAlcoholConsumption;

SELECT DISTINCT HealthCareCoverage
FROM dbo.diabetes_health_indicators
ORDER BY HealthCareCoverage;

SELECT DISTINCT NoDoctorCostBarrier
FROM dbo.diabetes_health_indicators
ORDER BY NoDoctorCostBarrier;

SELECT DISTINCT GeneralHealth
FROM dbo.diabetes_health_indicators
ORDER BY GeneralHealth;

SELECT DISTINCT MentalHealthDays
FROM dbo.diabetes_health_indicators
ORDER BY MentalHealthDays;

SELECT DISTINCT PhysicalHealthDays
FROM dbo.diabetes_health_indicators
ORDER BY PhysicalHealthDays;

SELECT DISTINCT DifficultyWalking
FROM dbo.diabetes_health_indicators
ORDER BY DifficultyWalking;

SELECT DISTINCT Sex
FROM dbo.diabetes_health_indicators
ORDER BY Sex;

SELECT DISTINCT AgeCategory
FROM dbo.diabetes_health_indicators
ORDER BY AgeCategory;

SELECT DISTINCT EducationLevel
FROM dbo.diabetes_health_indicators
ORDER BY EducationLevel;

SELECT DISTINCT IncomeCategory
FROM dbo.diabetes_health_indicators
ORDER BY IncomeCategory;


/* ------------------------------------------------------------
   CHECK CONSTANT VARIABLES
   Variables with only ONE distinct value
   ------------------------------------------------------------ */

SELECT
    'DiabetesStatus' AS Variable,
    COUNT(DISTINCT DiabetesStatus) AS Distinct_Values
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'HighBloodPressure',
    COUNT(DISTINCT HighBloodPressure)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'HighCholesterol',
    COUNT(DISTINCT HighCholesterol)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'CholesterolCheck',
    COUNT(DISTINCT CholesterolCheck)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'BodyMassIndex',
    COUNT(DISTINCT BodyMassIndex)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'Smoking',
    COUNT(DISTINCT Smoking)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'StrokeHistory',
    COUNT(DISTINCT StrokeHistory)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'HeartDisease',
    COUNT(DISTINCT HeartDisease)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'PhysicalActivity',
    COUNT(DISTINCT PhysicalActivity)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'FruitConsumption',
    COUNT(DISTINCT FruitConsumption)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'VegetableConsumption',
    COUNT(DISTINCT VegetableConsumption)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'HeavyAlcoholConsumption',
    COUNT(DISTINCT HeavyAlcoholConsumption)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'HealthCareCoverage',
    COUNT(DISTINCT HealthCareCoverage)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'NoDoctorCostBarrier',
    COUNT(DISTINCT NoDoctorCostBarrier)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'GeneralHealth',
    COUNT(DISTINCT GeneralHealth)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'MentalHealthDays',
    COUNT(DISTINCT MentalHealthDays)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'PhysicalHealthDays',
    COUNT(DISTINCT PhysicalHealthDays)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'DifficultyWalking',
    COUNT(DISTINCT DifficultyWalking)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'Sex',
    COUNT(DISTINCT Sex)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'AgeCategory',
    COUNT(DISTINCT AgeCategory)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'EducationLevel',
    COUNT(DISTINCT EducationLevel)
FROM dbo.diabetes_health_indicators

UNION ALL

SELECT
    'IncomeCategory',
    COUNT(DISTINCT IncomeCategory)
FROM dbo.diabetes_health_indicators;


/* ------------------------------------------------------------
   CHECK DUPLICATE ROWS
   IDENTIFY ONLY — DO NOT DELETE
   ------------------------------------------------------------ */

SELECT
    DiabetesStatus,
    HighBloodPressure,
    HighCholesterol,
    CholesterolCheck,
    BodyMassIndex,
    Smoking,
    StrokeHistory,
    HeartDisease,
    PhysicalActivity,
    FruitConsumption,
    VegetableConsumption,
    HeavyAlcoholConsumption,
    HealthCareCoverage,
    NoDoctorCostBarrier,
    GeneralHealth,
    MentalHealthDays,
    PhysicalHealthDays,
    DifficultyWalking,
    Sex,
    AgeCategory,
    EducationLevel,
    IncomeCategory,
    COUNT(*) AS Duplicate_Count

FROM dbo.diabetes_health_indicators

GROUP BY
    DiabetesStatus,
    HighBloodPressure,
    HighCholesterol,
    CholesterolCheck,
    BodyMassIndex,
    Smoking,
    StrokeHistory,
    HeartDisease,
    PhysicalActivity,
    FruitConsumption,
    VegetableConsumption,
    HeavyAlcoholConsumption,
    HealthCareCoverage,
    NoDoctorCostBarrier,
    GeneralHealth,
    MentalHealthDays,
    PhysicalHealthDays,
    DifficultyWalking,
    Sex,
    AgeCategory,
    EducationLevel,
    IncomeCategory

HAVING COUNT(*) > 1

ORDER BY Duplicate_Count DESC;