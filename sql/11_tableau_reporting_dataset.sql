```sql
/*
============================================================
Project: Lending Club Loan Portfolio Risk Analysis
File: 11_tableau_reporting_dataset.sql

Author: Donnie Benoit

Description:
Extracts the analytics-ready reporting dataset used as the
primary data source for Tableau dashboards.

The query selects standardized fields from the reporting
view, ensuring that all dashboards and visualizations are
built from a consistent business model.

Platform:
Google BigQuery
============================================================
*/

-- ==========================================================
-- Tableau Reporting Dataset
-- ==========================================================
-- Returns the curated dataset used by Tableau.
-- ==========================================================

SELECT

    id,

    loan_year,

    addr_state,

    purpose,

    grade,

    fico_band,

    income_band,

    loan_status,

    loan_category,

    funded_amnt,

    total_pymnt,

    int_rate,

    annual_inc

FROM
    `loan-lending-analytics.lending_club.accepted_view`;

/*
============================================================

Business Insight

This dataset serves as the reporting layer for Tableau,
providing a clean, analytics-ready structure with
standardized borrower segments and loan classifications.

Using a centralized reporting dataset ensures that every
dashboard references the same business logic, improving
consistency, maintainability, and confidence in the reported
metrics.

============================================================
*/
```
