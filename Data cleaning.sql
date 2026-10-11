SELECT *
FROM netflix_data;

-- Make a copy of the original dataset
CREATE TABLE movies_rs AS
SELECT *
FROM netflix_data;


SELECT *
FROM movies_rs;

-- Handle duplicate data
WITH duplicate_row AS(
	SELECT show_id,
	ROW_NUMBER() OVER(PARTITION BY show_id ORDER BY show_id) AS dup_row
	FROM movies_rs
    )
SELECT *
FROM duplicate_row
WHERE dup_row >1;

-- No duplicate values.

-- Handling missing values

SELECT *
FROM movies_rs;


SELECT *
FROM movies_rs
WHERE director = ''
   OR TRIM(director) = '';
   
UPDATE movies_rs
SET director = NULL
WHERE TRIM(director)='';

SELECT *
FROM movies_rs
WHERE director IS NULL;

SELECT 
	show_id,
    type,
    title,
    COALESCE(director,'N/A') AS director
FROM movies_rs;

SELECT *
FROM movies_rs
WHERE TRIM(cast)=''
	OR cast IS NULL;
    
UPDATE movies_rs
SET cast = NULL
WHERE TRIM(cast)= 'N/A'
	OR cast IS NULL;
    
SELECT *
FROM movies_rs;

UPDATE movies_rs
SET country = null
WHERE TRIM(country)=''
	OR country IS NULL;
    
SELECT *
FROM movies_rs
WHERE TRIM(date_added)=''
	OR date_added IS NULL;
    
SELECT *
FROM movies_rs
WHERE TRIM(release_year)=''
	OR release_year IS NULL;

SELECT *
FROM movies_rs
WHERE TRIM(rating)=''
	OR rating IS NULL;
    
SELECT *
FROM movies_rs
WHERE TRIM(duration)=''
	OR duration IS NULL;

SELECT *
FROM movies_rs
WHERE TRIM(listed_in)=''
	OR listed_in IS NULL;
    
SELECT *
FROM movies_rs
WHERE TRIM(`description`)=''
	OR `description` IS NULL;
    
-- Check and deal with incosistencies
SELECT *
FROM movies_rs;

SELECT DISTINCT director
FROM movies_rs
ORDER BY director ASC;

SELECT DISTINCT country
FROM movies_rs
ORDER BY country ASC;

SELECT DISTINCT rating
FROM movies_rs
ORDER BY rating ASC;

SELECT date_added
FROM movies_rs;

SELECT
    date_added,
    STR_TO_DATE(date_added, '%M %e, %Y') AS converted_date
FROM movies_rs
LIMIT 10;

SELECT *
FROM movies_rs;

ALTER TABLE movies_rs
ADD COLUMN date_added_clean DATE;

UPDATE movies_rs
SET date_added_clean =
    STR_TO_DATE(date_added, '%M %e, %Y')
WHERE TRIM(date_added) <> '';

SELECT *
FROM movies_rs;

SELECT DISTINCT duration
FROM movies_rs;

ALTER TABLE movies_rs
ADD COLUMN duration_minutes INT,
ADD COLUMN duration_seasons INT;

UPDATE movies_rs
SET duration_minutes =
    CAST(TRIM(SUBSTRING_INDEX(duration, ' ', 1)) AS UNSIGNED)
WHERE type = 'Movie'
  AND duration LIKE '%min%';
    
UPDATE movies_rs
SET duration_seasons =
    CAST(TRIM(SUBSTRING_INDEX(duration, ' ', 1)) AS UNSIGNED)
WHERE type = 'TV Show'
  AND duration LIKE '%Season%';

SELECT title, type, duration_minutes, duration_seasons
FROM movies_rs
WHERE (type = 'Movie'
       AND duration_seasons IS NOT NULL)
   OR (type = 'TV Show'
       AND duration_minutes IS NOT NULL);
       

ALTER TABLE movies_rs
DROP COLUMN duration,
DROP COLUMN date_added;

-- Inconsistent numerical data ranges 

SELECT *
FROM movies_rs
WHERE duration_minutes <0
	OR duration_seasons<0
	OR release_year <0;
    
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE
        WHEN date_added_clean IS NULL THEN 1
        ELSE 0
    END) AS missing_clean_dates
FROM movies_rs;

SELECT *
FROM movies_rs;