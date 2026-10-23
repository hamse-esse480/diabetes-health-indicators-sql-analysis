# Diabetes Health Indicators SQL Analysis

## Project Overview

This project presents a SQL Server analysis of diabetes-related health indicators. It examines the distribution of diabetes status and descriptive differences across selected demographic, behavioral, health, and socioeconomic characteristics.

## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

## Dataset

The current project notes describe 236,378 observations and 22 variables. The dataset is described as a BRFSS 2021-derived diabetes health indicators dataset; add the exact download page or original data citation here once verified against the source file and metadata.

Key variables described in the project include:

- Diabetes status
- High blood pressure
- High cholesterol
- BMI
- Smoking
- Physical activity
- Heart disease
- General health
- Age
- Sex
- Income
- Education

## Analysis Workflow

The repository currently contains these SQL scripts (filenames are shown exactly as stored):

1. [`-01. DATA CHECK & VALIDATION.sql`](<./-01.%20DATA%20CHECK%20%26%20VALIDATION.sql>) — initial data checks and validation
2. [`--02. DATA CLEANING.sql`](<./--02.%20DATA%20CLEANING.sql>) — cleaning steps
3. [`03_Descriptive Statistics.sql`](<./03_Descriptive%20Statistics.sql>) — descriptive summaries
4. [`04_Diabetes_Distribution.sql`](./04_Diabetes_Distribution.sql) — diabetes distribution
5. [`05_Bivariate Analysis.sql`](<./05_Bivariate%20Analysis.sql>) — bivariate summaries

**Note:** A separate `06_Findings_&_Interpretation.sql` file is not currently present in the repository. Findings and interpretation are summarized in this README instead.

## Key Findings

The existing project summary reports an overall diabetes prevalence of 14.2% and descriptive differences across blood pressure, cholesterol, BMI, physical activity, heart disease, general health, age, income, and education groups. These figures should be re-run against the current dataset and final SQL scripts before being treated as verified final results.

The analysis is descriptive. It does not establish causality or independent effects, and unadjusted group differences may be affected by confounding and the dataset's sampling and measurement limitations.

## Data Quality and Limitations

- Confirm the dataset source, version, variable definitions, and diabetes outcome coding from the original dataset documentation.
- Document how missing, invalid, or out-of-range values were handled in the cleaning script.
- Confirm that the observation count, variable count, and 14.2% estimate match the final cleaned dataset and SQL output.
- This repository README does not currently contain enough evidence to independently verify those values.
- Results are descriptive and should not be interpreted as causal relationships.

## Project Purpose

This project demonstrates SQL Server skills in data validation, cleaning, descriptive analysis, bivariate analysis, and interpretation.
