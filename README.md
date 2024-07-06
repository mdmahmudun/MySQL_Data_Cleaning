# MySQL Project (Data Cleaning and EDA)

## Overview
This project involves cleaning the World Layoffs dataset and doing EDA using MySQL Workbench. The goal is to ensure data quality and consistency for further analysis. The process includes creating a SQL database, importing the dataset, and performing various cleaning steps.

## Dataset
The dataset used for this project is the World Layoffs dataset, which contains records of layoffs across different companies and sectors.

## Project Steps
### 1. Delete Duplicate Entries
Duplicate entries were identified and removed to ensure each record is unique.

### 2. Standardize the Data
The dataset was standardized to maintain consistency across all records. This step included:
- Ensuring consistent date formats.
- Standardizing text data, such as company names and job titles.

### 3. Deal with Null and Blank Values
Null and blank values were addressed to prevent gaps in the dataset. This step included:
- Filling missing values where appropriate.
- Removing records with extensive missing information that could not be reliably filled.

### 4. Remove Unnecessary Columns and Rows
Columns and rows that were not relevant to the analysis were removed to streamline the dataset and improve performance.
### 5. Exploratory Data Analysis

## Tools Used
- **MySQL Workbench:** For creating the database, importing the dataset, and executing SQL queries for data cleaning.

## Repository Structure
- **data/**: Contains the original and cleaned dataset files.
- **scripts/**: SQL scripts used for data cleaning.
- **README.md**: Project documentation.

