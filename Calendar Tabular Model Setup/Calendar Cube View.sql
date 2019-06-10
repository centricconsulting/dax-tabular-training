/*
SELECT * FROM dbo.calendar c WHERE c.date = CAST(CURRENT_TIMESTAMP AS DATE);
SELECT * FROM cube.Calendar;
*/
GO

IF EXISTS (SELECT OBJECT_ID('cube.Calendar'))
  DROP VIEW cube.Calendar
GO

CREATE VIEW cube.Calendar AS
SELECT
  c.date AS [Date]
, CASE WHEN c.day_weekday_ct = 1 THEN 'Weekday' ELSE 'Non-Weeday' END AS [Weekday Flag]
, c.weekday_desc_02 AS [Weekday]
, c.day_of_week AS weekday_sort_index
, 'WB ' + FORMAT(c.week_start_date, 'yyyy-MM-dd') AS [Week]
, c.week_start_date
, c.week_end_date
, c.month_desc_01 AS [Month]
, c.month_start_date
, c.month_end_date
, c.month_desc_04 AS [Month Of Year]
, c.month_of_year AS month_of_year_sort_index
, c.quarter_desc_01 AS [Quarter]
, c.quarter_start_date
, c.quarter_end_date
, c.quarter_desc_02 AS [Quarter Of Year]
, c.quarter_of_year AS quarter_of_year_index
, c.year AS [Year]
FROM
dbo.calendar c
WHERE
c.date IS NOT NULL
GO