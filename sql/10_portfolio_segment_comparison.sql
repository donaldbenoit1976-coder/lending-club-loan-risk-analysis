```sql id="dgyb7r"
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 10_portfolio_segment_comparison.sql

Author: Donnie Benoit

Description:
Creates a unified comparison of three key borrower
segmentation models:

• Credit Grade
• FICO Score Band
• Income Band

The resulting dataset is designed for Tableau and allows
portfolio performance to be compared across multiple
dimensions from a single query.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Portfolio Segment Comparison
-- ==========================================================
-- Compares loan volume, funded exposure, and bad loan rate
-- across Grade, FICO Band, and Income Band.
-- ==========================================================

SELECT

    'Grade' AS analysis_type,

    grade AS category,

    COUNT(*) AS total_loans,

    ROUND(SUM(funded_amnt), 2) AS funded_amount,

    ROUND(
        SUM(
            CASE
                WHEN loan_category = 'Bad Loan' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS bad_loan_rate

FROM
    `loan-lending-analytics.lending_club.accepted_view`

GROUP BY
    grade

UNION ALL

SELECT

    'FICO',

    fico_band,

    COUNT(*),

    ROUND(SUM(funded_amnt), 2),

    ROUND(
        SUM(
            CASE
                WHEN loan_category = 'Bad Loan' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    )

FROM
    `loan-lending-analytics.lending_club.accepted_view`

GROUP BY
    fico_band

UNION ALL

SELECT

    'Income',

    income_band,

    COUNT(*),

    ROUND(SUM(funded_amnt), 2),

    ROUND(
        SUM(
            CASE
                WHEN loan_category = 'Bad Loan' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    )

FROM
    `loan-lending-analytics.lending_club.accepted_view`

GROUP BY
    income_band;

/*
============================================================

Business Insight

This query consolidates three borrower segmentation models
into a single analytical dataset. Comparing Credit Grade,
FICO Score Bands, and Income Bands side-by-side reveals
which characteristics are most strongly associated with
portfolio risk.

Using a single query simplifies Tableau development while
ensuring consistent business logic across all portfolio
comparisons.

============================================================
*/
```
