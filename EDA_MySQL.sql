-- EDA with MySQL
USE world_layoffs;

-- Take a look at the table
SELECT * FROM layoffs_staging2;

-- Find the highest number of layoffs in a single day by a single company
SELECT MAX(total_laid_off) 
	FROM layoffs_staging2;
    
-- Show the records of the companies who laid off 100% of their employees
SELECT *
	FROM layoffs_staging2
    WHERE percentage_laid_off = 1
    ORDER BY funds_raised_millions DESC;
    
-- Count the number of the companies who laid off 100% of their employees
SELECT COUNT(*)
	FROM layoffs_staging2
    WHERE percentage_laid_off = 1;
    
-- Show the company names as well as their total laid off number
SELECT company, SUM(total_laid_off)
	FROM layoffs_staging2
    GROUP BY company
    ORDER BY 2 DESC;
    
-- Show the range of dates when the lay offs happend
SELECT MIN(`date`), MAX(`date`)
	FROM layoffs_staging2;
    
-- Show the industry as well as their total laid off number
SELECT industry, SUM(total_laid_off)
	FROM layoffs_staging2
    GROUP BY industry
    ORDER BY 2 DESC;

-- Show the country with the number of lay offs
SELECT country, SUM(total_laid_off)
	FROM layoffs_staging2
    GROUP BY country
    ORDER BY 2 DESC;
    
-- Show which year faced the most number of lay offs
SELECT YEAR(`date`), SUM(total_laid_off)
	FROM layoffs_staging2
    GROUP BY YEAR(`date`)
    ORDER BY 1 DESC;
    
-- Show which stage faced the most number of lay offs
SELECT stage, SUM(total_laid_off)
	FROM layoffs_staging2
    GROUP BY stage
    ORDER BY 2 DESC;
    
-- Show the total number of lay offs month wise
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
	FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY `MONTH`
    ORDER BY 1 DESC;
    
-- Do a rolling total on months lay offs

WITH Rolling_total AS
	(
    SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) as total_off_months
	FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY `MONTH`
    ORDER BY 1 ASC
    )
    SELECT `MONTH`, total_off_months, SUM(total_off_months) 
    OVER (ORDER BY `MONTH`) AS rolling_total
    FROM Rolling_Total;