```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 04_credit_grade_analysis.sql

Author: Donnie Benoit

Description:
Analyzes portfolio performance by Lending Club credit grade,
calculating total loans, bad loans, and bad loan rate.
This analysis supports the Credit Grade visualization in
Dashboard 2.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Credit Grade Risk Analysis
-- ==========================================================
-- Calculates the total number of loans, number of bad loans,
-- and bad loan percentage for each Lending Club credit grade.
-- ==========================================================

SELECT
    grade,

    COUNT(*) AS total_loans,

    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Default',
                'Late (31-120 days)',
                'Late (16-30 days)',
                'Does not meet the credit policy. Status:Charged Off'
            )
            THEN 1
            ELSE 0
        END
    ) AS bad_loans,

    ROUND(
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Default',
                    'Late (31-120 days)',
                    'Late (16-30 days)',
                    'Does not meet the credit policy. Status:Charged Off'
                )
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS bad_loan_rate

FROM
    `loan-lending-analytics.lending_club.accepted_loans`

GROUP BY
    grade

ORDER BY
    grade;

/*
============================================================

Business Insight

Credit grade demonstrates a strong relationship with loan
performance. As borrower credit quality declines from
Grade A to Grade G, the percentage of bad loans increases,
confirming that Lending Club's grading methodology is an
effective indicator of portfolio credit risk.

These findings support the use of credit grade as a key
underwriting and portfolio monitoring metric.

============================================================
*/
```
```sql
-- ==========================================================
-- Credit Grade Funding Exposure
-- ==========================================================
-- Measures the amount of funded capital issued to each credit
-- grade and the percentage of that capital associated with
-- bad loans.
-- ==========================================================

SELECT
    grade,

    ROUND(SUM(funded_amnt), 2) AS total_funded,

    ROUND(
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Default',
                    'Late (31-120 days)',
                    'Late (16-30 days)',
                    'Does not meet the credit policy. Status:Charged Off'
                )
                THEN funded_amnt
                ELSE 0
            END
        ),
        2
    ) AS bad_loan_funded,

    ROUND(
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Default',
                    'Late (31-120 days)',
                    'Late (16-30 days)',
                    'Does not meet the credit policy. Status:Charged Off'
                )
                THEN funded_amnt
                ELSE 0
            END
        ) * 100.0 / SUM(funded_amnt),
        2
    ) AS risk_percentage

FROM
    `loan-lending-analytics.lending_club.accepted_loans`

GROUP BY
    grade

ORDER BY
    grade;

/*
============================================================

Business Insight

While lower credit grades receive less total funding than
higher-quality borrowers, they account for a significantly
larger proportion of funded dollars that become distressed.
Evaluating both loan counts and funded exposure provides a
more complete picture of portfolio risk and helps prioritize
credit monitoring efforts.

============================================================
*/
```
