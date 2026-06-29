```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 02_create_reporting_view.sql

Author: Donnie Benoit

Description:
Creates a reporting view that transforms the raw Lending Club
dataset into an analytics-ready dataset for Tableau
dashboards and executive reporting.

The view standardizes calculated fields, categorizes
borrowers into business-friendly segments, and creates
derived attributes used throughout this project.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Create Analytics Reporting View
-- ==========================================================

CREATE OR REPLACE VIEW
`loan-lending-analytics.lending_club.accepted_view` AS

SELECT

    id,

    issue_d,

    EXTRACT(
        YEAR
        FROM PARSE_DATE('%b-%Y', issue_d)
    ) AS loan_year,

    loan_amnt,
    funded_amnt,
    total_pymnt,
    int_rate,
    installment,

    grade,
    sub_grade,

    annual_inc,

    addr_state,

    purpose,

    dti,

    fico_range_low,

    ----------------------------------------------------------
    -- FICO Score Bands
    ----------------------------------------------------------

    CASE
        WHEN fico_range_low < 650 THEN '600-649'
        WHEN fico_range_low BETWEEN 650 AND 699 THEN '650-699'
        WHEN fico_range_low BETWEEN 700 AND 749 THEN '700-749'
        WHEN fico_range_low BETWEEN 750 AND 799 THEN '750-799'
        ELSE '800+'
    END AS fico_band,

    ----------------------------------------------------------
    -- Income Bands
    ----------------------------------------------------------

    CASE
        WHEN annual_inc < 50000 THEN '<50K'
        WHEN annual_inc BETWEEN 50000 AND 99999 THEN '50K-100K'
        WHEN annual_inc BETWEEN 100000 AND 149999 THEN '100K-150K'
        WHEN annual_inc BETWEEN 150000 AND 199999 THEN '150K-200K'
        ELSE '200K+'
    END AS income_band,

    loan_status,

    ----------------------------------------------------------
    -- Loan Classification
    ----------------------------------------------------------

    CASE

        WHEN loan_status IN (
            'Fully Paid',
            'Current',
            'Does not meet the credit policy. Status:Fully Paid'
        )
        THEN 'Good Loan'

        WHEN loan_status IN (
            'Charged Off',
            'Default',
            'Late (31-120 days)',
            'Late (16-30 days)',
            'Does not meet the credit policy. Status:Charged Off'
        )
        THEN 'Bad Loan'

        ELSE 'Watch List'

    END AS loan_category

FROM
    `loan-lending-analytics.lending_club.accepted_loans`;

/*
============================================================

Business Insight

This reporting view serves as the foundation for all
subsequent analysis by transforming raw loan data into a
consistent, analytics-ready structure. Centralizing business
logic into a reusable view ensures that Tableau dashboards
and SQL analyses reference the same standardized definitions,
reducing duplication and improving consistency.

============================================================
*/
```
