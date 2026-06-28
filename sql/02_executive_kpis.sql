/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis

File: 02_executive_kpis.sql

Author: Donnie Benoit

Description:
Calculates executive-level portfolio KPIs for the Lending Club
loan portfolio. These metrics support Dashboard 1 and provide
a high-level summary of portfolio performance.

Platform:
Google BigQuery

============================================================
*/
-- ==========================================================
-- Executive Portfolio KPIs
-- ==========================================================

SELECT

    COUNT(*) AS total_loans,

    ROUND(SUM(funded_amount),2) AS total_funded_amount,

    ROUND(AVG(int_rate),2) AS average_interest_rate,

    ROUND(AVG(annual_income),2) AS average_annual_income,

    ROUND(
        100 * COUNTIF(
            loan_status IN (
                'Charged Off',
                'Default',
                'Late (31-120 days)',
                'Does not meet the credit policy. Status:Charged Off'
            )
        ) / COUNT(*),
    2) AS bad_loan_rate,

    ROUND(
        100 * COUNTIF(
            loan_status IN (
                'Fully Paid',
                'Current',
                'Does not meet the credit policy. Status:Fully Paid'
            )
        ) / COUNT(*),
    2) AS good_loan_rate

FROM
    `loan-lending-analytics.lending_club.accepted_loans`;
/*
============================================================

Expected Results

Total Loans:
2,260,668

Total Funded Amount:
Approximately $34 Billion

Average Interest Rate:
Approximately 13.09%

Good Loan Rate:
Approximately 86.9%

Bad Loan Rate:
Approximately 13.1%

============================================================
*/
/*
============================================================

Business Insight

The Lending Club portfolio maintained a strong overall
performance with nearly 87% of loans classified as Good
Loans. Despite rapid portfolio growth, approximately
13% of loans entered default or severe delinquency,
highlighting the importance of continued credit risk
monitoring.

============================================================
*/
