/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis

File: 01_data_validation.sql

Author: Donnie Benoit

Description:
Performs data quality validation checks on the Lending Club
Accepted Loans dataset before business analysis.

Validation Includes:
• Total record count
• Duplicate Loan ID check
• Missing value assessment
• Invalid financial value check
• Summary statistics

Platform:
Google BigQuery

============================================================
*/
-- ==========================================================
-- Total Record Count
-- ==========================================================

SELECT
    COUNT(*) AS total_records
FROM
    `loan-lending-analytics.lending_club.accepted_loans`;
-- ==========================================================
-- Duplicate Loan ID Check
-- ==========================================================

SELECT
    id,
    COUNT(*) AS duplicate_count
FROM
    `loan-lending-analytics.lending_club.accepted_loans`
GROUP BY
-- ==========================================================
-- Missing Values
-- ==========================================================

SELECT

    COUNTIF(annual_income IS NULL) AS missing_annual_income,

    COUNTIF(loan_amount IS NULL) AS missing_loan_amount,

    COUNTIF(int_rate IS NULL) AS missing_interest_rate,

    COUNTIF(fico_range_high IS NULL) AS missing_fico

FROM
    `loan-lending-analytics.lending_club.accepted_loans`;
-- ==========================================================
-- Invalid Financial Values
-- ==========================================================

SELECT

    COUNTIF(loan_amount <= 0) AS invalid_loan_amount,

    COUNTIF(annual_income < 0) AS negative_income,

    COUNTIF(int_rate < 0) AS negative_interest_rate

FROM
    `loan-lending-analytics.lending_club.accepted_loans`;
-- ==========================================================
-- Dataset Summary
-- ==========================================================

SELECT

    COUNT(*) AS total_loans,

    ROUND(SUM(loan_amount), 2) AS total_funded_amount,

    ROUND(AVG(int_rate), 2) AS average_interest_rate,

    MIN(issue_date) AS earliest_loan,

    MAX(issue_date) AS latest_loan

FROM
    `loan-lending-analytics.lending_club.accepted_loans`;

    id
HAVING
    COUNT(*) > 1;
