# Lending Club Loan Portfolio Risk Analysis

## End-to-End Data Analytics Project

### Overview

This project analyzes more than **2.26 million Lending Club loans issued between 2007 and 2018** to identify portfolio risk, borrower characteristics associated with loan default, geographic lending trends, and opportunities to improve lending decisions.

Using **Google BigQuery**, **SQL**, and **Tableau**, the analysis follows the complete analytics lifecycle—from data validation and exploratory analysis to executive dashboards and business recommendations.

---

## Business Objective

The objective of this project was to answer the following business questions:

- Which borrower segments present the highest credit risk?
- How effectively do Lending Club credit grades predict loan performance?
- Which FICO score ranges are associated with the highest default rates?
- Are there geographic regions with elevated portfolio risk?
- Which loan purposes contribute the greatest lending exposure?
- What recommendations can improve portfolio performance while balancing growth and risk?

---

## Dataset

| Item | Value |
|------|------:|
| Loan Records | 2,260,668 |
| Time Period | 2007–2018 |
| Variables | 145 |
| Total Funded Amount | $34.0 Billion |
| Platform | Lending Club |

> **Note:** The original Lending Club dataset is not included in this repository due to its size and licensing considerations.

---

## Tools Used

- Google Cloud Storage
- Google BigQuery
- SQL
- Tableau Public
- Microsoft Excel
- Microsoft PowerPoint
---

## Data Preparation

Before analysis, the dataset was validated to ensure the accuracy and reliability of the findings.

The preparation process included:

- Importing the Lending Club dataset into Google Cloud Storage and Google BigQuery
- Validating record counts after import
- Checking for duplicate loan IDs
- Reviewing missing values in critical business fields
- Verifying financial values for consistency
- Creating analytical fields to support reporting, including:
  - Loan Category
  - FICO Score Band
  - Income Band
  - Loan Year
  - Bad Loan Rate

These preparation steps ensured that all subsequent analyses were based on reliable and well-structured data.

---
## SQL Analysis

Google BigQuery SQL was used to answer key business questions and validate portfolio metrics.

Analyses included:

- Executive KPI calculations
- Good Loan vs. Bad Loan classification
- Loan funding trends by year
- Credit grade risk analysis
- FICO score analysis
- Income segmentation
- Geographic portfolio analysis
- Loan purpose analysis
- Portfolio validation and quality checks

The SQL queries were designed to transform raw lending data into business-focused insights that support executive decision-making.

---
## Tableau Dashboards

Three executive dashboards were created to communicate the analytical findings.

### Dashboard 1 – Executive Portfolio Overview

**Business Question**

How has the Lending Club portfolio performed over time?

Key metrics include:

- Total Loans
- Total Funded Amount
- Average Interest Rate
- Portfolio Bad Loan Rate
- Annual Funding Trend
- Loan Status Distribution

---

### Dashboard 2 – Credit Risk Analysis

**Business Question**

Which borrower characteristics are associated with the highest credit risk?

Analysis includes:

- Credit Grade
- FICO Score
- Income Level
- Portfolio Funding Exposure

---

### Dashboard 3 – Geographic & Portfolio Insights

**Business Question**

Where is portfolio risk concentrated, and which loan purposes contribute the most risk?

Analysis includes:

- State Risk Map
- Highest Risk States
- Loan Purpose Analysis
