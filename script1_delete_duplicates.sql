-- Data Cleaning
-- use the world_layoffs database for all queries
USE world_layoffs;

-- show the records from layoffs table
SELECT * FROM layoffs;


-- Data Cleaning Steps
-- 1. Remove duplicates if there any
-- 2. Standardize the Data
-- 3. Null values and blank values
-- 4. Remove unnecessary columns and rows



-- Create a duplicate dataset
CREATE TABLE layoffs_staging 
	LIKE layoffs;
INSERT layoffs_staging SELECT * 
	FROM layoffs;
    
-- Create Row Number
SELECT *, ROW_NUMBER() OVER(
	PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,
    stage, funds_raised_millions) 
    AS row_num
    FROM layoffs_staging;
    
-- Find the duplicate rows
WITH duplicate_cte AS 
	( 
    SELECT *, 
    ROW_NUMBER() OVER(
    PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,
    stage, funds_raised_millions)  AS row_num
    FROM layoffs_staging
    )
    SELECT * 
    FROM duplicate_cte WHERE row_num>1;
    
-- Check a random duplicate row
SELECT * 
	FROM layoffs_staging
	WHERE company = 'Casper';
  
-- Create a table name layoffs_staging2 from layoffs_staging
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging2;

-- Insert record into new table
INSERT INTO layoffs_staging2 
	SELECT *, 
    ROW_NUMBER() OVER(
    PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,
    stage, funds_raised_millions)  AS row_num
    FROM layoffs_staging;
-- Check how many duplicates are there again
SELECT COUNT(*) FROM layoffs_staging2
	WHERE row_num>1;

-- Delete the duplicate columns..
DELETE FROM layoffs_staging2 WHERE row_num>1;
    
-- Check the table after deletation
SELECT * FROM layoffs_staging2;
