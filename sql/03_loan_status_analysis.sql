```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 03_loan_status_analysis.sql

Author: Donnie Benoit

Description:
Summarizes the Lending Club portfolio by loan status,
providing the number of loans in each category. This
analysis supports the loan status visualization in
Dashboard 1.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Loan Status Distribution
-- ==========================================================
-- Counts the number of loans in each loan status category.
-- Results are sorted from most common to least common.
-- ==========================================================

SELECT
    loan_status,
    COUNT(*) AS records
FROM
    `loan-lending-analytics.lending_club.accepted_loans`
GROUP BY
    loan_status
ORDER BY
    records DESC;

/*
============================================================

Business Insight

The portfolio is primarily composed of Current and
Fully Paid loans, indicating a healthy overall loan
book. Charged Off, Default, and Late loans represent
a smaller portion of the portfolio but are critical
for measuring credit risk and portfolio performance.

============================================================
*/
```
