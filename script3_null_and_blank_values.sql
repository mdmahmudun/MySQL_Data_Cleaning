-- Dealing with Null and Blank values

-- Use world_layoffs database for all queries
USE world_layoffs;

-- Show the record with NULL values in total_laid_off column
SELECT *
	FROM layoffs_staging2
    WHERE total_laid_off IS NULL;

-- Count how columns has NULL values for total_laid_off and percentage_laid_off columns
SELECT COUNT(*)
	FROM layoffs_staging2
    WHERE total_laid_off IS NULL
    AND percentage_laid_off IS NULL;
    
-- Show the records where industry column has NULL or empty values
SELECT * FROM layoffs_staging2
	WHERE industry IS NULL
    OR industry = "";

-- Populate the industries who has null or empty values from other entries of them
-- First show the populatable records
SELECT t1.company, t1.industry, t2.industry 
	FROM layoffs_staging2 t1
    JOIN layoffs_staging2 t2
		ON t1.company = t2.company
        AND t1.location = t2.location
	WHERE (t1.industry IS NULL OR t1.industry = '')
	AND t2.industry IS NOT NULL  AND t2.industry != "";

-- Update 
UPDATE layoffs_staging2 t1
	JOIN layoffs_staging2 t2
		ON t1.company = t2.company
		AND t1.location = t2.location
	SET t1.industry = t2.industry
	WHERE t1.industry IS NULL OR t1.industry = ""
    AND t2.industry IS NOT NULL AND t2.industry != "";

-- Confirm by showing industry columns
SELECT COUNT(industry) FROM layoffs_staging2
	WHERE industry IS NULL OR industry = "";