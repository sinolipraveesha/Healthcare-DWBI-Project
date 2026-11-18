# Healthcare Data Warehouse & Business Intelligence (DWBI) Project

## Project Overview

This project focuses on developing a Healthcare Data Warehouse and Business Intelligence solution using synthetic healthcare data generated with **Synthea**.

The main objective is to transform raw healthcare data into a structured data warehouse and create interactive Power BI dashboards that help analyse patient encounters, healthcare costs, encounter types, payer information, and yearly trends.

This is a collaborative academic project demonstrating the application of data preprocessing, ETL, dimensional modelling, data warehousing, data marts, and business intelligence.

## Project Objectives

- Prepare and organise healthcare data for analytical processing.
- Design a dimensional data warehouse using Microsoft SQL Server.
- Perform ETL operations using SQL Server Integration Services (SSIS).
- Create dimension and fact tables.
- Develop a Clinical Operations data mart for reporting.
- Build interactive Power BI dashboards to present meaningful insights.

## Technologies Used

| Technology | Purpose |
|---|---|
| Synthea | Synthetic healthcare data generation |
| FHIR | Healthcare data interoperability format |
| Python | Data preprocessing |
| Microsoft SQL Server | Data warehouse development |
| SQL Server Management Studio (SSMS) | Database management and SQL queries |
| SQL Server Integration Services (SSIS) | ETL development |
| Power BI | Data visualisation and reporting |
| Visual Studio | SSIS project development |

## Project Architecture

The overall data flow is:

```text
Synthea Synthetic Healthcare Data
              |
              v
      Data Preprocessing
           (Python)
              |
              v
     Cleaned Staging Data
          (CSV Files)
              |
              v
        SSIS ETL Process
              |
              v
    SQL Server Data Warehouse
              |
              v
    Clinical Operations Data Mart
              |
              v
      Power BI Dashboards
```

## Data Warehouse Design

The data warehouse follows a **Galaxy Schema (Fact Constellation Schema)** because multiple fact tables share common dimension tables.

### Dimension Tables

The warehouse consists of nine dimension tables:

1. DimPatient
2. DimProvider
3. DimOrganization
4. DimPayer
5. DimEncounterType
6. DimCondition
7. DimProcedure
8. DimMedication
9. DimDate

These tables contain descriptive information used to analyse healthcare activities.

### Fact Tables

The warehouse contains four main fact tables:

1. FactEncounter
2. FactCondition
3. FactProcedure
4. FactMedication

These tables store healthcare events, dimension keys, and numerical measures such as claim costs, procedure costs, and medication costs.

## ETL Process

SQL Server Integration Services (SSIS) was used for the ETL process.

The main ETL activities include:

- Extracting data from cleaned CSV staging files.
- Performing data type conversions and Unicode transformations.
- Removing duplicate dimension records using Sort transformations.
- Deriving required attributes such as patient age.
- Generating the Date Dimension.
- Loading dimension tables using OLE DB Destination.
- Using Lookup transformations to obtain dimension surrogate keys for fact loading.
- Validating loaded data through SQL queries, row counts, and duplicate checks.

Dimension tables are loaded before fact tables because fact records require the corresponding dimension surrogate keys.

## Data Mart

The project includes a reporting-focused data mart named **ClinicalOperationsMart**.

It supports clinical operations analysis by providing data for reporting and Power BI visualisations.

## Power BI Dashboards

The Power BI report contains three main analytical pages:

### 1. Clinical Operations – Executive Summary

Provides an overview of:
- Total patients.
- Total encounters.
- Total claim cost.
- Average claim cost.
- Median claim cost.
- Encounters by year.
- Top encounter types.
- Total claim cost by payer.

### 2. Clinical Operations – Trend Analysis

Analyses:
- Total claim cost for the top five encounter types.
- Encounter trends by year.
- Total claim cost trends by year.
- Average claim cost trends by year.

### 3. Clinical Operations – Interactive Analysis

Allows users to explore healthcare data using interactive filters and visualisations, including year, gender, and encounter type.

## My Contribution

As part of the project team, my contribution focused on the SSIS ETL development and SQL validation activities.

My work included:

- Loading dimension data into the SQL Server data warehouse.
- Performing data type and Unicode conversions.
- Handling duplicate dimension records.
- Generating and loading the Date Dimension.
- Working with SSIS data flow components and OLE DB destinations.
- Validating loaded data using SQL queries and checking duplicate records.

## Repository Structure

```text
Healthcare-DWBI-Project/
│
├── README.md
│
├── SQL/
│   ├── Database creation scripts
│   ├── Dimension table scripts
│   ├── Fact table scripts
│   └── Data validation scripts
│
├── SSIS/
│   ├── Healthcare_ETL.sln
│   └── SSIS project and packages
│
├── PowerBI/
│   └── Dashboard files and screenshots
│
└── Documentation/
    ├── Project architecture
    └── Project documentation
```

## Dataset Information

The project uses synthetic healthcare data generated using Synthea.

The dataset is intended for educational and analytical purposes and does not represent actual patient records.

## Learning Outcomes

Through this project, I gained practical experience in:

- Data warehousing concepts and dimensional modelling.
- SQL Server database development.
- SSIS ETL workflow development.
- Data transformation and validation.
- Fact and dimension table relationships.
- Data mart concepts.
- Power BI dashboard development and analytical reporting.

## Project Type

**Academic Team Project – Healthcare Data Warehousing and Business Intelligence**

---
