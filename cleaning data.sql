-- Standardizing Data--

SELECT *
FROM layoffs_staging2;

SELECT company,TRIM(company)
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2;

UPDATE  layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'CRYPTO%';

SELECT DISTINCT country
FROM layoffs_staging2 
ORDER BY 1;

UPDATE  layoffs_staging2
SET country = 'United states.'
WHERE industry LIKE 'United states.%';

SELECT distinct country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2 
ORDER BY 1 ;

UPDATE  layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United states.%';



-- TIME SERIES --

SELECT `date`
FROM layoffs_staging2 ; 


UPDATE layoffs_staging2
SET `date`= str_to_date(`date`,'%m/%d/%Y');


ALTER TABLE layoffs_staging2 
MODIFY COLUMN `date` DATE; 

SELECT*
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;



SELECT DISTINCT industry
FROM layoffs_staging2
WHERE industry IS NULL
OR industry =' ';

SELECT*
FROM layoffs_staging2
WHERE company LIKE  'Bally%';


SELECT t1.industry,t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
   ON t1.company = t2.company
   AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
   ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

delete
FROM layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT*
FROM layoffs_staging2;

alter table layoffs_staging2
drop column row_num;




































