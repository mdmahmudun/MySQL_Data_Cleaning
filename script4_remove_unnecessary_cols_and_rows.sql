-- Remove unnecessary cols and rows

-- Use world_layoffs database for all queries
USE world_layoffs;

-- Show how columns has NULL values for total_laid_off AND percentage_laid_off columns
SELECT *
	FROM layoffs_staging2
    WHERE total_laid_off IS NULL
    AND percentage_laid_off IS NULL;
    
-- Show how columns has NULL values for total_laid_off and percentage_laid_off columns
SELECT COUNT(*)
	FROM layoffs_staging2
    WHERE total_laid_off IS NULL
    AND percentage_laid_off IS NULL;

-- Delete the rows having both the columns have null values
DELETE 
	FROM layoffs_staging2
    WHERE total_laid_off IS NULL
    AND percentage_laid_off IS NULL;


-- Show all the records again
SELECT * FROM layoffs_staging2;

-- Drop the column named row_num
ALTER TABLE layoffs_staging2
	DROP COLUMN row_num;
    

    
