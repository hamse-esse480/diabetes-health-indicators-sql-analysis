# Diabetes Health Indicators SQL Analysis

## Project Overview
A descriptive SQL Server project exploring diabetes status and selected demographic, behavioral, and health indicators in a BRFSS-derived dataset. The workflow covers data checks, cleaning, descriptive summaries, outcome distribution, and unadjusted comparisons.

This project is descriptive. It is not a clinical risk-prediction model and does not establish causal relationships.

## Tools
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL

## Dataset and Source
The [CDC 2021 BRFSS documentation](https://www.cdc.gov/brfss/annual_data/annual_2021.html) reports 438,693 records and provides official survey data, codebooks, and documentation. The raw CDC file contains many more variables than the 22 variables and 236,378 observations described in the existing project notes.

Accordingly, this repository appears to analyze a **derived or filtered BRFSS-based dataset**, not the complete raw CDC file. The precise download page, transformation/filtering steps, and file version have not been established from the repository alone. Do not describe 236,378 as the size of the full CDC 2021 BRFSS dataset.

## Analysis Workflow
1. [-01. DATA CHECK & VALIDATION.sql](<./-01.%20DATA%20CHECK%20%26%20VALIDATION.sql>) — initial checks and validation
2. [--02. DATA CLEANING.sql](<./--02.%20DATA%20CLEANING.sql>) — cleaning steps
3. [03_Descriptive Statistics.sql](<./03_Descriptive%20Statistics.sql>) — descriptive summaries
4. [04_Diabetes_Distribution.sql](./04_Diabetes_Distribution.sql) — diabetes-status distribution
5. [05_Bivariate Analysis.sql](<./05_Bivariate%20Analysis.sql>) — unadjusted group comparisons
6. [06_Findings_Interpretation.sql](./06_Findings_Interpretation.sql) — descriptive distributions and cross-tabulations

Run the scripts against the actual final table in SQL Server. Confirm the table/field names, outcome coding, and intended execution order.

## Project Outputs
The SQL scripts demonstrate validation, missing-value checks, descriptive summaries, diabetes-status distribution, and unadjusted comparisons. Numerical findings should be read as summaries of the specific derived file analyzed in this project, not as official CDC population estimates.

## Interpretation Notes
The raw CDC BRFSS 2021 file and derived datasets are not interchangeable. State the source file and any filters used when reporting the dataset size or percentages. BRFSS has a complex survey design; unweighted summaries should not be described as official population prevalence.


## Data Quality and Limitations
- Cite the exact derived-dataset download and document how it was created from BRFSS.
- Follow the CDC codebook for source-variable meanings and codes; do not treat unknown, refused, or missing responses as No without justification.
- Report the number of records before and after filtering and state the denominator for each percentage.
- BRFSS uses a complex survey design and weights. Unless the analysis appropriately accounts for that design, describe results as unweighted descriptive results for the analyzed file, not official population prevalence.
- Bivariate results are unadjusted and may be affected by confounding and measurement limitations.
- Do not generalize findings to all adults or to the current population without an appropriate design and analysis.

## Project Purpose
This project demonstrates SQL skills in data validation, cleaning, descriptive analysis, outcome distribution, bivariate summaries, and responsible interpretation of public-health data.

## References
- CDC. [2021 BRFSS Survey Data and Documentation](https://www.cdc.gov/brfss/annual_data/annual_2021.html).
- CDC. [2021 BRFSS Codebook](https://www.cdc.gov/brfss/annual_data/2021/pdf/codebook21_llcp-v2-508.pdf).

## Quality Notes
The scripts check BMI values and category codes. Confirm special codes such as 99 against the exact dataset documentation before using them in means or grouped summaries. This is a SQL portfolio project and not a clinical prediction tool.
