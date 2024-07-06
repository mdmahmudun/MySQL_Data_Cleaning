-- Standardizing data

-- use world_layoffs database for each queries
USE world_layoffs;

-- Show all the distinct company names
SELECT DISTINCT(company) 
	FROM layoffs_staging2;
    
-- Trim the company name
-- Trim--> Deletes the whitespace from the begining of the name or from the last of the name
SELECT DISTINCT(TRIM(company)), company
	FROM layoffs_staging2;

-- Update the company column with trimmed company names
UPDATE layoffs_staging2
	SET company = TRIM(company);
    
-- Show all distinct industry names
SELECT DISTINCT(industry)
	FROM layoffs_staging2
    ORDER BY 1;

-- Show all the records for which industry starts with crypto

SELECT * FROM layoffs_staging2
	WHERE industry LIKE 'Crypto%';
    
-- Chang all the industry name to crypto which starts with crypto
UPDATE layoffs_staging2
	SET industry = "Crypto"
    WHERE industry LIKE "Crypto%";
    
-- Show the columns again
SELECT * FROM layoffs_staging2
	WHERE industry LIKE 'Crypto%';

-- Show the whole table
SELECT * FROM layoffs_staging2;

-- Show the distinct locations/country
SELECT DISTINCT country
	FROM layoffs_staging2
    ORDER BY 1;

-- Remove . from the end of country name
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
	FROM layoffs_staging2
    ORDER BY 1;
    
UPDATE layoffs_staging2 
	SET country = "United States"
	WHERE country LIKE "United States%";
    
-- Change the date column to datetime format
SELECT `date`,
	STR_TO_DATE(`date`, '%m/%d/%Y')
    FROM layoffs_staging2;
    
-- Update the column with datetime formate for date column
UPDATE layoffs_staging2
	SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Confirm it worked or not
SELECT * from layoffs_staging2;

-- Now change the data type to datetime from text
ALTER TABLE layoffs_staging2
	MODIFY COLUMN `date` DATE;
    