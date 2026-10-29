# Diabetes Health Indicators SQL Analysis

## Project Overview
This project uses SQL Server to explore diabetes status and selected demographic, behavioral, and health indicators in a BRFSS-derived dataset. The workflow includes data checks, cleaning, descriptive summaries, diabetes-status distribution, and unadjusted comparisons.

The analysis is descriptive and should not be interpreted as evidence of causation or as a clinical risk-prediction model.

## Tools
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL

## Dataset
The existing project notes report 236,378 observations and 22 variables and describe the data as derived from the 2021 Behavioral Risk Factor Surveillance System (BRFSS). Confirm these details against the downloaded file and official documentation before presenting them as verified.

Variables described in the project include diabetes status, high blood pressure, high cholesterol, BMI, smoking, physical activity, heart disease, general health, age, sex, income, and education.

**Source citation:** The exact download URL, file/version, and license or citation details are not yet recorded here. Add the precise source used for this analysis.

## Analysis Workflow
1. [-01. DATA CHECK & VALIDATION.sql](<./-01.%20DATA%20CHECK%20%26%20VALIDATION.sql>) — initial checks and validation
2. [--02. DATA CLEANING.sql](<./--02.%20DATA%20CLEANING.sql>) — cleaning steps
3. [03_Descriptive Statistics.sql](<./03_Descriptive%20Statistics.sql>) — descriptive summaries
4. [04_Diabetes_Distribution.sql](./04_Diabetes_Distribution.sql) — diabetes-status distribution
5. [05_Bivariate Analysis.sql](<./05_Bivariate%20Analysis.sql>) — unadjusted group comparisons
6. [06_Findings_Interpretation.sql](./06_Findings_Interpretation.sql) — descriptive outcome distributions and selected cross-tabulations

Run the scripts against the final cleaned table in SQL Server. Confirm table names, field names, coding, and script sequence against the actual database.

## Findings Status
An earlier project summary reports diabetes prevalence of 14.2%. Recalculate this value, the reported row and variable counts, and all subgroup comparisons from the final cleaned table before quoting them as final findings. This README review has not independently reproduced those calculations.

When reporting prevalence, state the diabetes outcome definition and denominator. Do not combine missing or unknown outcome values with a valid No category unless source coding explicitly justifies that decision.

## Data Quality and Limitations
- Verify the official source, year, file version, variable definitions, and outcome coding.
- Document missing-value codes and all exclusions or recoding decisions.
- Report record counts before and after cleaning.
- State the denominator used for each percentage.
- Bivariate results are unadjusted and may be affected by confounding, sampling, and measurement limitations.
- Do not automatically generalize the findings to all adults or to the current population.

## Project Purpose
This project demonstrates SQL skills in data validation, cleaning, descriptive analysis, outcome distribution, bivariate summaries, and responsible interpretation of public-health data.
