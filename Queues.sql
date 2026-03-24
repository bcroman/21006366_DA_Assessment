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

-- Get London Weather Staton Code
SELECT usaf, wban, name, country FROM `bigquery-public-data.noaa_gsod.stations`
WHERE country = 'UK' AND name LIKE '%LONDON%' OR name LIKE '%HEATHROW%';

-- Get 2014 Weather Data
CREATE OR REPLACE VIEW `uni-da.Weather_Data.data2014` AS
SELECT DATE(CAST(year as INT64), CAST(mo as INT64), CAST(da as INT64)) as date, year, mo, da, temp, dewp, slp, visib, wdsp, mxpsd, gust, max, min, prcp, sndp, fog FROM `bigquery-public-data.noaa_gsod.gsod2014`
WHERE stn = '037720' AND wban = '99999';

-- Get 2015 Weather Data
CREATE OR REPLACE VIEW `uni-da.Weather_Data.data2015` AS
SELECT DATE(CAST(year as INT64), CAST(mo as INT64), CAST(da as INT64)) as date, year, mo, da, temp, dewp, slp, visib, wdsp, mxpsd, gust, max, min, prcp, sndp, fog FROM `bigquery-public-data.noaa_gsod.gsod2015`
WHERE stn = '037720' AND wban = '99999';

-- Get 2016 Weather Data
CREATE OR REPLACE VIEW `uni-da.Weather_Data.data2016` AS
SELECT DATE(CAST(year as INT64), CAST(mo as INT64), CAST(da as INT64)) as date, year, mo, da, temp, dewp, slp, visib, wdsp, mxpsd, gust, max, min, prcp, sndp, fog FROM `bigquery-public-data.noaa_gsod.gsod2016`
WHERE stn = '037720' AND wban = '99999';

-- Merge All Weather Data
CREATE OR REPLACE VIEW `uni-da.Weather_Data.data2014_2016` AS
SELECT * FROM `uni-da.Weather_Data.data2014`
union All
SELECT * FROM `uni-da.Weather_Data.data2015`
union All
SELECT * FROM `uni-da.Weather_Data.data2016`
Order BY date;