```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 04_loan_status_analysis.sql

Author: Donnie Benoit

Description:
Analyzes the Lending Club portfolio by loan status,
including loan volume, funded capital, and total
payments received. This analysis supports Dashboard 1.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Loan Status Summary
-- ==========================================================

SELECT
    loan_status,
    COUNT(*) AS loan_count,
    ROUND(SUM(funded_amnt), 2) AS funded_amount,
    ROUND(SUM(total_pymnt), 2) AS amount_received

FROM
    `loan-lending-analytics.lending_club.accepted_loans`

GROUP BY
    loan_status

ORDER BY
    loan_count DESC;

/*
============================================================

Business Insight

Comparing funded amount to total payments received for
each loan status provides insight into portfolio
performance and repayment behavior.

Current and Fully Paid loans represent the strongest
performing segments of the portfolio, while Charged Off
and Default loans highlight realized credit losses that
should be closely monitored.

============================================================
*/
```

