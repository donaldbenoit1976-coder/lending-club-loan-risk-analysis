```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 05_annual_trend_analysis.sql

Author: Donnie Benoit

Description:
Analyzes annual portfolio performance by calculating the
percentage of loans classified as Bad Loans for each loan
origination year.

This analysis supports the Yearly Risk Trend visualization
used in Dashboard 2.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Annual Bad Loan Trend
-- ==========================================================
-- Calculates the percentage of Bad Loans for each loan
-- origination year.
-- ==========================================================

SELECT

    loan_year,

    ROUND(
        SUM(
            CASE
                WHEN loan_category = 'Bad Loan'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS bad_loan_rate

FROM
    `loan-lending-analytics.lending_club.accepted_view`

GROUP BY
    loan_year

ORDER BY
    loan_year;

/*
============================================================

Business Insight

Tracking bad loan rates by origination year highlights
changes in portfolio performance over time. Increasing
default rates may indicate periods of relaxed underwriting
standards or changing economic conditions, while improving
rates suggest stronger credit quality and portfolio
management.

============================================================
*/
```
