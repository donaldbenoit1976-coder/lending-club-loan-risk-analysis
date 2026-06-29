```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 09_geographic_analysis.sql

Author: Donnie Benoit

Description:
Analyzes Lending Club loan performance by U.S. state,
summarizing loan volume, funded capital, and bad loan
rates. This query supports the Geographic & Portfolio
Insights dashboard and the interactive state risk map.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Geographic Portfolio Risk Analysis
-- ==========================================================
-- Summarizes lending activity and portfolio risk for each
-- U.S. state.
-- ==========================================================

SELECT

    addr_state,

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
    addr_state

ORDER BY
    bad_loan_rate DESC;

/*
============================================================

Business Insight

Geographic analysis reveals significant variation in loan
performance across U.S. states. Comparing funded exposure
with bad loan rates helps identify regions with elevated
credit risk while accounting for differences in lending
volume.

Note:
States with extremely small loan populations (for example,
Iowa) may exhibit unusually high bad loan percentages due
to limited sample sizes. During dashboard development,
these outliers were identified and evaluated separately to
prevent them from disproportionately influencing the
executive analysis.

============================================================
*/
```
