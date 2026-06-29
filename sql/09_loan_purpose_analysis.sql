```sql id="r1pc5v"
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 09_loan_purpose_analysis.sql

Author: Donnie Benoit

Description:
Analyzes Lending Club loan performance by borrower loan
purpose, summarizing loan volume, funded capital, and bad
loan rates. This analysis supports the Loan Purpose
visualization used in the Geographic & Portfolio Insights
dashboard.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Loan Purpose Risk Analysis
-- ==========================================================
-- Evaluates portfolio performance across borrower loan
-- purposes by comparing loan volume, funded exposure,
-- and bad loan percentages.
-- ==========================================================

SELECT

    purpose,

    COUNT(*) AS total_loans,

    ROUND(SUM(funded_amnt), 2) AS funded_amount,

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
    purpose

ORDER BY
    bad_loan_rate DESC;

/*
============================================================

Business Insight

Loan performance varies considerably by borrowing purpose.
Comparing funded amounts with bad loan rates helps identify
loan categories that contribute disproportionately to
portfolio risk. These insights can support lending policy,
pricing strategy, and credit risk management.

============================================================
*/
```
