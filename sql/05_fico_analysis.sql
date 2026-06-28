```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 05_fico_analysis.sql

Author: Donnie Benoit

Description:
Segments borrowers into FICO score bands and evaluates
portfolio risk by calculating loan volume, funded amount,
and bad loan rate for each credit score range.

This analysis supports the FICO Risk visualization in
Dashboard 2.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- FICO Score Band Risk Analysis
-- ==========================================================
-- Groups borrowers into standard FICO score bands and
-- calculates loan volume, funded capital, and bad loan
-- percentage for each segment.
-- ==========================================================

SELECT
    CASE
        WHEN fico_range_low < 600 THEN '<600'
        WHEN fico_range_low BETWEEN 600 AND 649 THEN '600-649'
        WHEN fico_range_low BETWEEN 650 AND 699 THEN '650-699'
        WHEN fico_range_low BETWEEN 700 AND 749 THEN '700-749'
        WHEN fico_range_low BETWEEN 750 AND 799 THEN '750-799'
        ELSE '800+'
    END AS fico_band,

    COUNT(*) AS total_loans,

    ROUND(SUM(funded_amnt), 2) AS funded_amount,

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
    fico_band

ORDER BY
    CASE
        WHEN fico_band = '<600' THEN 1
        WHEN fico_band = '600-649' THEN 2
        WHEN fico_band = '650-699' THEN 3
        WHEN fico_band = '700-749' THEN 4
        WHEN fico_band = '750-799' THEN 5
        ELSE 6
    END;

/*
============================================================

Business Insight

Borrowers with higher FICO scores consistently demonstrate
lower default rates, while borrowers in the lowest FICO
bands exhibit substantially higher credit risk. This
analysis reinforces the importance of credit score as one
of the strongest predictors of loan performance and
supports its use in lending and portfolio risk management.

============================================================
*/
```
