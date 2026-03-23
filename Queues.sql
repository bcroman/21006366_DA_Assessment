-- Create a view for 2014 London Crime Data
CREATE VIEW `uni-da.London_Crime_Data.data2014` AS
SELECT
  year,
  month,
  major_category,
  SUM(value) AS total_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa`
WHERE year = 2014 AND value > 0
GROUP BY month, major_category
ORDER BY month;

-- Create a view for 2015 London Crime Data
CREATE VIEW `uni-da.London_Crime_Data.data2015` AS
SELECT
  year,
  month,
  major_category,
  SUM(value) AS total_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa`
WHERE year = 2015 AND value > 0
GROUP BY year, month, major_category
ORDER BY month;

-- Create a view for 2016 London Crime Data
CREATE VIEW `uni-da.London_Crime_Data.data2016` AS
SELECT
  year,
  month,
  major_category,
  SUM(value) AS total_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa`
WHERE year = 2016 AND value > 0
GROUP BY year, month, major_category
ORDER BY month;

-- Create Table to Merge All Data
CREATE OR REPLACE VIEW `uni-da.London_Crime_Data.data2014_2016` AS
SELECT
  year,
  month,
  DATE(year, month, 1) AS crime_month,
  major_category,
  SUM(value) AS total_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa`
WHERE year BETWEEN 2014 AND 2016
  AND value > 0
GROUP BY year, month, major_category
ORDER BY year, month;
