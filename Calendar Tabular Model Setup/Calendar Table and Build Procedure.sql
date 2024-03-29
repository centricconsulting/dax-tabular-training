/*
EXEC calendar_rebuild;
*/

IF OBJECT_ID('dbo.calendar') is not null
  drop table dbo.calendar
GO

CREATE TABLE dbo.calendar (
  date_key int NOT NULL
, date_uid varchar(20) NOT NULL
, source_key int NOT NULL

, [date] date NULL
, day_of_week int NULL
, day_of_month int NULL
, day_of_quarter int NULL
, day_of_year int NULL
, day_desc_01 varchar(20) NULL
, day_desc_02 varchar(20) NULL
, day_desc_03 varchar(20) NULL
, day_desc_04 varchar(20) NULL
, weekday_desc_01 varchar(20) NULL
, weekday_desc_02 varchar(20) NULL
, day_weekday_ct varchar(20) NULL

, week_key int NULL
, week_start_date date NULL
, week_end_date date NULL
, week_day_ct int NULL
, week_weekday_ct int NULL

, month_key int NULL
, month_start_date date NULL
, month_end_date date NULL
, month_of_quarter int NULL
, month_of_year int NULL
, month_desc_01 varchar(20) NULL
, month_desc_02 varchar(20) NULL
, month_desc_03 varchar(20) NULL
, month_desc_04 varchar(20) NULL
, month_day_ct int NULL
, month_weekday_ct int NULL

, quarter_key int NULL
, quarter_start_date date NULL
, quarter_end_date date NULL
, quarter_of_year int NULL
, quarter_desc_01 varchar(20) NULL
, quarter_desc_02 varchar(20) NULL
, quarter_desc_03 varchar(50) NULL
, quarter_desc_04 varchar(50) NULL
, quarter_month_ct int NULL
, quarter_day_ct int NULL
, quarter_weekday_ct int NULL

, year_key int NULL
, [year] int NULL
, year_start_date date NULL
, year_end_date date NULL
, year_desc_01 varchar(20) NULL
, year_month_ct int NULL
, year_quarter_ct int NULL
, year_day_ct int NULL
, year_weekday_ct int NULL

, fiscal_day_of_period int NULL
, fiscal_day_of_quarter int NULL
, fiscal_day_of_year int NULL

, fiscal_period_key int NULL
, fiscal_period_start_date date NULL
, fiscal_period_end_date date NULL
, fiscal_period_of_quarter int NULL
, fiscal_period_of_year int NULL
, fiscal_period_desc_01 varchar(20) NULL
, fiscal_period_desc_02 varchar(20) NULL
, fiscal_period_desc_03 varchar(20) NULL
, fiscal_period_desc_04 varchar(20) NULL
, fiscal_period_day_ct int NULL
, fiscal_period_weekday_ct int NULL

, fiscal_quarter_key int NULL
, fiscal_quarter_start_date date NULL
, fiscal_quarter_end_date date NULL
, fiscal_quarter_of_year int NULL
, fiscal_quarter_desc_01 varchar(20) NULL
, fiscal_quarter_desc_02 varchar(20) NULL
, fiscal_quarter_desc_03 varchar(50) NULL
, fiscal_quarter_desc_04 varchar(50) NULL
, fiscal_quarter_period_ct int NULL
, fiscal_quarter_day_ct int NULL
, fiscal_quarter_weekday_ct int NULL

, fiscal_year_key int NULL
, fiscal_year int NULL
, fiscal_year_start_date date NULL
, fiscal_year_end_date date NULL
, fiscal_year_desc_01 varchar(20) NULL
, fiscal_year_period_ct int NULL
, fiscal_year_quarter_ct int NULL
, fiscal_year_day_ct int NULL
, fiscal_year_weekday_ct int NULL

)
GO


create unique clustered index calendar_uxc on calendar (date_key)
create unique index calendar_ux1 on calendar (date_uid, source_key)
go

declare @unknown_text varchar(20)
set @unknown_text = 'Unknown'

declare @indefinite_text varchar(20)
set @indefinite_text = 'Indefinite'

INSERT INTO calendar (
  date_key
, date_uid
, source_key
, weekday_desc_01
, weekday_desc_02
, month_desc_01
, month_desc_02
, month_desc_03
, month_desc_04
, quarter_desc_01
, quarter_desc_02
, quarter_desc_03
, quarter_desc_04
, year_desc_01
, fiscal_period_desc_01
, fiscal_period_desc_02
, fiscal_period_desc_03
, fiscal_period_desc_04
, fiscal_quarter_desc_01
, fiscal_quarter_desc_02
, fiscal_quarter_desc_03
, fiscal_quarter_desc_04
, fiscal_year_desc_01
, week_key
, month_key
, quarter_key
, year_key
, fiscal_period_key
, fiscal_quarter_key
, fiscal_year_key
) VALUES (
  0 -- date_key
, 'UNKNOWN' -- date_uid
, 0
, @unknown_text -- weekday_desc_01
, @unknown_text -- weekday_desc_02
, @unknown_text -- month_desc_01
, @unknown_text -- month_desc_02
, @unknown_text -- month_desc_03
, @unknown_text -- month_desc_04
, @unknown_text -- quarter_desc_01
, @unknown_text -- quarter_desc_02
, @unknown_text -- quarter_desc_03
, @unknown_text -- quarter_desc_04
, @unknown_text -- year_desc_01
, @unknown_text -- fiscal_period_desc_01
, @unknown_text -- fiscal_period_desc_02
, @unknown_text -- fiscal_period_desc_03
, @unknown_text -- fiscal_period_desc_04
, @unknown_text -- fiscal_quarter_desc_01
, @unknown_text -- fiscal_quarter_desc_02
, @unknown_text -- fiscal_quarter_desc_03
, @unknown_text -- fiscal_quarter_desc_04
, @unknown_text -- fiscal_year_desc_01
, 0 -- week_key
, 0 -- month_key
, 0 -- quarter_key
, 0 -- year_key
, 0 -- fiscal_period_key
, 0 -- fiscal_quarter_key
, 0 -- fiscal_year_key
), (
  99999999 -- date_key
, 'INDEFINITE' -- date_uid
, 0
, @indefinite_text -- weekday_desc_01
, @indefinite_text -- weekday_desc_02
, @indefinite_text -- month_desc_01
, @indefinite_text -- month_desc_02
, @indefinite_text -- month_desc_03
, @indefinite_text -- month_desc_04
, @indefinite_text -- quarter_desc_01
, @indefinite_text -- quarter_desc_02
, @indefinite_text -- quarter_desc_03
, @indefinite_text -- quarter_desc_04
, @indefinite_text -- year_desc_01
, @indefinite_text -- fiscal_period_desc_01
, @indefinite_text -- fiscal_period_desc_02
, @indefinite_text -- fiscal_period_desc_03
, @indefinite_text -- fiscal_period_desc_04
, @indefinite_text -- fiscal_quarter_desc_01
, @indefinite_text -- fiscal_quarter_desc_02
, @indefinite_text -- fiscal_quarter_desc_03
, @indefinite_text -- fiscal_quarter_desc_04
, @indefinite_text -- fiscal_year_desc_01
, 99999999 -- week_key
, 99999999 -- month_key
, 99999999 -- quarter_key
, 99999999 -- year_key
, 99999999 -- fiscal_period_key
, 99999999 -- fiscal_quarter_key
, 99999999 -- fiscal_year_key
)
go


if  exists (select * from sys.objects where object_id = object_id('calendar_rebuild') and type in ('P', 'PC'))
drop procedure calendar_rebuild
go

CREATE PROCEDURE calendar_rebuild
  @start_year int = 2000
, @end_year int = 2030
, @fiscal_period_month_shift int = 0
AS
BEGIN

  SET NOCOUNT ON

  declare
    @source_key int
  , @current_date date
  , @last_date date
  , @date_uid char(8)
  
  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- completely clear out the calendar table
  
  DELETE FROM calendar;

  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- create unknown and indenfinite records
  
  declare @unknown_text varchar(20)
  set @unknown_text = 'Unknown'

  declare @indefinite_text varchar(20)
  set @indefinite_text = 'Indefinite'

  INSERT INTO calendar (
    date_key
  , date_uid
  , source_key
  , weekday_desc_01
  , weekday_desc_02
  , month_desc_01
  , month_desc_02
  , month_desc_03
  , month_desc_04
  , quarter_desc_01
  , quarter_desc_02
  , quarter_desc_03
  , quarter_desc_04
  , year_desc_01
  , fiscal_period_desc_01
  , fiscal_period_desc_02
  , fiscal_period_desc_03
  , fiscal_period_desc_04
  , fiscal_quarter_desc_01
  , fiscal_quarter_desc_02
  , fiscal_quarter_desc_03
  , fiscal_quarter_desc_04
  , fiscal_year_desc_01
  , week_key
  , month_key
  , quarter_key
  , year_key
  , fiscal_period_key
  , fiscal_quarter_key
  , fiscal_year_key
  ) VALUES (
    0 -- date_key
  , 'UNKNOWN' -- date_uid
  , 0
  , @unknown_text -- weekday_desc_01
  , @unknown_text -- weekday_desc_02
  , @unknown_text -- month_desc_01
  , @unknown_text -- month_desc_02
  , @unknown_text -- month_desc_03
  , @unknown_text -- month_desc_04
  , @unknown_text -- quarter_desc_01
  , @unknown_text -- quarter_desc_02
  , @unknown_text -- quarter_desc_03
  , @unknown_text -- quarter_desc_04
  , @unknown_text -- year_desc_01
  , @unknown_text -- fiscal_period_desc_01
  , @unknown_text -- fiscal_period_desc_02
  , @unknown_text -- fiscal_period_desc_03
  , @unknown_text -- fiscal_period_desc_04
  , @unknown_text -- fiscal_quarter_desc_01
  , @unknown_text -- fiscal_quarter_desc_02
  , @unknown_text -- fiscal_quarter_desc_03
  , @unknown_text -- fiscal_quarter_desc_04
  , @unknown_text -- fiscal_year_desc_01
  , 0 -- week_key
  , 0 -- month_key
  , 0 -- quarter_key
  , 0 -- year_key
  , 0 -- fiscal_period_key
  , 0 -- fiscal_quarter_key
  , 0 -- fiscal_year_key
  ), (
    99999999 -- date_key
  , 'INDEFINITE' -- date_uid
  , 0
  , @indefinite_text -- weekday_desc_01
  , @indefinite_text -- weekday_desc_02
  , @indefinite_text -- month_desc_01
  , @indefinite_text -- month_desc_02
  , @indefinite_text -- month_desc_03
  , @indefinite_text -- month_desc_04
  , @indefinite_text -- quarter_desc_01
  , @indefinite_text -- quarter_desc_02
  , @indefinite_text -- quarter_desc_03
  , @indefinite_text -- quarter_desc_04
  , @indefinite_text -- year_desc_01
  , @indefinite_text -- fiscal_period_desc_01
  , @indefinite_text -- fiscal_period_desc_02
  , @indefinite_text -- fiscal_period_desc_03
  , @indefinite_text -- fiscal_period_desc_04
  , @indefinite_text -- fiscal_quarter_desc_01
  , @indefinite_text -- fiscal_quarter_desc_02
  , @indefinite_text -- fiscal_quarter_desc_03
  , @indefinite_text -- fiscal_quarter_desc_04
  , @indefinite_text -- fiscal_year_desc_01
  , 99999999 -- week_key
  , 99999999 -- month_key
  , 99999999 -- quarter_key
  , 99999999 -- year_key
  , 99999999 -- fiscal_period_key
  , 99999999 -- fiscal_quarter_key
  , 99999999 -- fiscal_year_key
  )

  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- determine the start date, end date and source key
  -- NOTE: expanding range by one year from start and end...should be cleaned up at end

  set @current_date = CONVERT(date,CAST(@start_year-1 as CHAR(4)) + '-01-01')
  set @last_date = CONVERT(date,CAST(@end_year+1 as CHAR(4)) + '-12-31')
  
  select @source_key = 0;

  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- loop and load basic values into calendar table
    
  WHILE @current_date <= @last_date
  BEGIN

    SET @date_uid = CONVERT(char(8),@current_date,112) 

    INSERT INTO calendar (
      date_key
    , date_uid
    , source_key
    , [date]
    , day_of_week
    , day_of_month
    , day_of_quarter
    , day_of_year
    , day_desc_01
    , day_desc_02
    , day_desc_03
    , day_desc_04
    , weekday_desc_01
    , weekday_desc_02
    , day_weekday_ct
    , week_key
    , week_start_date
    , week_end_date
    , week_day_ct
    , week_weekday_ct
    , month_key
    , month_start_date
    , month_end_date
    , month_of_quarter
    , month_of_year
    , month_desc_01
    , month_desc_02
    , month_desc_03
    , month_desc_04
    , month_day_ct
    , month_weekday_ct
    , quarter_key
    , quarter_start_date
    , quarter_end_date
    , quarter_of_year
    , quarter_desc_01
    , quarter_desc_02
    , quarter_desc_03
    , quarter_desc_04
    , quarter_month_ct
    , quarter_day_ct
    , quarter_weekday_ct
    , year_key
    , [year]
    , year_start_date
    , year_end_date
    , year_desc_01
    , year_month_ct
    , year_quarter_ct
    , year_day_ct
    , year_weekday_ct
    ) VALUES (
      CONVERT(int,@date_uid) -- date_key
    , @date_uid -- date_uid
    , @source_key -- source_key
    , @current_date -- date
    , DATEPART(weekday,@current_date) -- day_of_week
    , DATEPART(day,@current_date) -- day_of_month
    , NULL -- day_of_quarter
    , DATEPART(dayofyear,@current_date) -- day_of_year
    , CONVERT(char(10),@current_date,101) -- day_desc_01 "12/31/2010"
    , SUBSTRING(@date_uid,7,2) + '-' + SUBSTRING(DATENAME(month,@current_date),1,3) + '-' + SUBSTRING(@date_uid,1,4) -- day_desc_02 "31-Dec-2010"
    , SUBSTRING(@date_uid,1,4) + '.' + SUBSTRING(@date_uid,5,2) + '.' + SUBSTRING(@date_uid,7,2) -- day_desc_03 "2010.12.31"   
    , DATENAME(month,@current_date) + ' ' + CAST(DAY(@current_date) as varchar(2)) + ', ' + CAST(YEAR(@current_date) as varchar(4)) -- day_desc_04 "December 31, 2010"
    , SUBSTRING(DATENAME(weekday,@current_date),1,3) -- weekday_desc_01 "Wed"    
    , DATENAME(weekday,@current_date) -- weekday_desc_02 "Wednesday"
    , CASE WHEN DATEPART(weekday,@current_date) IN (1,7) THEN 0 ELSE 1 END -- day_weekday_ct
    , CONVERT(char(8),DATEADD(d,1-DATEPART(weekday,@current_date),@current_date),112) -- week_key
    , DATEADD(d,1-DATEPART(weekday,@current_date),@current_date) -- week_start_date
    , DATEADD(d,7-DATEPART(weekday,@current_date),@current_date) -- week_end_date
    , 7 -- week_day_ct
    , 5 -- week_weekday_ct
    , YEAR(@current_date)*100 + MONTH(@current_date) -- month_key
    , NULL -- month_start_date
    , NULL -- month_end_date
    , CONVERT(int,(MONTH(@current_date)-1)/3) + 1 -- month_of_quarter
    , MONTH(@current_date) -- month_of_year
    , SUBSTRING(DATENAME(month,@current_date),1,3) + '-' + CAST(YEAR(@current_date) as varchar(4)) -- month_desc_01
    , DATENAME(month,@current_date) + ' ' + CAST(YEAR(@current_date) as varchar(4)) -- month_desc_02
    , SUBSTRING(DATENAME(month,@current_date),1,3) -- month_desc_03
    , DATENAME(month,@current_date) -- month_desc_04
    , NULL -- month_day_ct
    , NULL -- month_weekday_ct
    , YEAR(@current_date)*100
	    + CASE
	      WHEN MONTH(@current_date) >= 10 THEN 4 
	      WHEN MONTH(@current_date) >= 7 THEN 3
	      WHEN MONTH(@current_date) >= 4 THEN 2
	      ELSE 1 END -- quarter_key
    , NULL -- quarter_start_date
    , NULL -- quarter_end_date
    ,  CASE
	      WHEN MONTH(@current_date) >= 10 THEN 4 
	      WHEN MONTH(@current_date) >= 7 THEN 3
	      WHEN MONTH(@current_date) >= 4 THEN 2
	      ELSE 1 END -- quarter_of_year
    , CASE
	      WHEN MONTH(@current_date) >= 10 THEN 'Q4' 
	      WHEN MONTH(@current_date) >= 7 THEN 'Q3'
	      WHEN MONTH(@current_date) >= 4 THEN 'Q2'
	      ELSE 'Q1' END + '.' + CAST(YEAR(@current_date) as varchar(4)) -- quarter_desc_01
    , CASE
	      WHEN MONTH(@current_date) >= 10 THEN 'Q4' 
	      WHEN MONTH(@current_date) >= 7 THEN 'Q3'
	      WHEN MONTH(@current_date) >= 4 THEN 'Q2'
	      ELSE 'Q1' END -- quarter_desc_02
    , CASE
	      WHEN MONTH(@current_date) >= 10 THEN '4th' 
	      WHEN MONTH(@current_date) >= 7 THEN '3rd'
	      WHEN MONTH(@current_date) >= 4 THEN '2nd'
	      ELSE '1st' END   + ' Quarter, ' + CAST(YEAR(@current_date) as varchar(4))-- quarter_desc_03
    , CASE
	      WHEN MONTH(@current_date) >= 10 THEN '4th' 
	      WHEN MONTH(@current_date) >= 7 THEN '3rd'
	      WHEN MONTH(@current_date) >= 4 THEN '2nd'
	      ELSE '1st' END   + ' Quarter' -- quarter_desc_04
    , 3 -- quarter_month_ct
    , NULL -- quarter_day_ct
    , NULL -- quarter_weekday_ct
    , YEAR(@current_date)  -- year_key
    , YEAR(@current_date)  -- year  
    , NULL -- year_start_date
    , NULL -- year_end_date
    , CAST(YEAR(@current_date) as varchar(4)) -- year_desc_01
    , 12 -- year_month_ct
    , 4 -- year_quarter_ct
    , NULL -- year_day_ct
    , NULL -- year_weekday_ct        
    );
        
    SET @current_date = DATEADD(d,1,@current_date)
    
  END
  
  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- update standard calendar counts and positions

  update cal set
    month_day_ct = x.month_day_ct
  , month_weekday_ct = x.month_weekday_ct
  , month_start_date = x.month_start_date
  , month_end_date = x.month_end_date
  , day_of_quarter = x.day_of_quarter
  , quarter_day_ct = x.quarter_day_ct
  , quarter_weekday_ct = x.quarter_weekday_ct
  , quarter_start_date = x.quarter_start_date
  , quarter_end_date = x.quarter_end_date  
  , year_day_ct = x.year_day_ct
  , year_weekday_ct = x.year_weekday_ct
  , year_start_date = x.year_start_date
  , year_end_date = x.year_end_date
  FROM
  calendar cal
  inner join (
  
    select
      date_key

    , COUNT(date_key) OVER (partition by month_key) as month_day_ct
    , COUNT(CASE WHEN day_weekday_ct = 1 THEN date_key END) OVER (partition by month_key) as month_weekday_ct
    , MIN([date]) over (partition by month_key) as month_start_date
    , MAX([date]) over (partition by month_key) as month_end_date  
    
    , ROW_NUMBER() over (partition by quarter_key order by date_key) as day_of_quarter
    , COUNT(date_key) OVER (partition by quarter_key) as quarter_day_ct
    , COUNT(CASE WHEN day_weekday_ct = 1 THEN date_key END) OVER (partition by quarter_key) as quarter_weekday_ct  
    , MIN([date]) over (partition by quarter_key) as quarter_start_date
    , MAX([date]) over (partition by quarter_key) as quarter_end_date
      
    , COUNT(date_key) OVER (partition by year_key) as year_day_ct
    , COUNT(CASE WHEN day_weekday_ct = 1 THEN date_key END) OVER (partition by year_key) as year_weekday_ct
    , MIN([date]) over (partition by year_key) as year_start_date
    , MAX([date]) over (partition by year_key) as year_end_date
    
    from
    calendar
    
  ) x on x.date_key = cal.date_key
  WHERE
  cal.date_key != 0;
  

  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- update fiscal calendar based on fiscal period month shift
  
  update cal set
    fiscal_period_key = x.month_key
  , fiscal_period_of_quarter = x.month_of_quarter
  , fiscal_period_of_year = x.month_of_year
  , fiscal_period_desc_01 = 'FP' + CASE WHEN x.month_of_year < 10 THEN '0' else '' end + CAST(x.month_of_year as varchar(2)) + '.' + CAST(x.YEAR as varchar(4))
  , fiscal_period_desc_02 = 'FP' + CASE WHEN x.month_of_year < 10 THEN '0' else '' end + CAST(x.month_of_year as varchar(2))
  , fiscal_period_desc_03 = 'Reserved'
  , fiscal_period_desc_04 = 'Reserved'
  , fiscal_quarter_key = x.quarter_key
  , fiscal_quarter_period_ct = x.quarter_month_ct
  , fiscal_quarter_of_year = x.quarter_of_year
  , fiscal_quarter_desc_01 = replace(x.quarter_desc_01,'Q','FQ')
  , fiscal_quarter_desc_02 = replace(x.quarter_desc_02,'Q','FQ')
  , fiscal_quarter_desc_03 = replace(x.quarter_desc_03,'Quarter','Fiscal Quarter')
  , fiscal_quarter_desc_04 = replace(x.quarter_desc_04,'Quarter','Fiscal Quarter')
  , fiscal_year_key = x.year_key
  , fiscal_year = x.year
  , fiscal_year_desc_01 = 'FY ' + x.year_desc_01
  , fiscal_year_period_ct = x.year_month_ct
  , fiscal_year_quarter_ct = x.year_quarter_ct 
  FROM
  calendar cal
  inner join calendar x on
    (cal.year*12 + cal.month_of_year - 1) = (x.year*12 + x.month_of_year - 1 + @fiscal_period_month_shift)
  where
  x.day_of_month = 1
  and cal.date_key != 0;

  -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- update fiscal calendar counts and positions

  update cal set
    fiscal_day_of_period = x.fiscal_day_of_period
  , fiscal_day_of_quarter = x.fiscal_day_of_quarter
  , fiscal_day_of_year = x.fiscal_day_of_year
  , fiscal_period_day_ct = x.fiscal_period_day_ct
  , fiscal_period_weekday_ct = x.fiscal_period_weekday_ct
  , fiscal_period_start_date = x.fiscal_period_start_date
  , fiscal_period_end_date = x.fiscal_period_end_date
  , fiscal_quarter_day_ct = x.fiscal_quarter_day_ct
  , fiscal_quarter_weekday_ct = x.fiscal_quarter_weekday_ct
  , fiscal_quarter_start_date = x.fiscal_quarter_start_date
  , fiscal_quarter_end_date = x.fiscal_quarter_end_date  
  , fiscal_year_day_ct = x.fiscal_year_day_ct
  , fiscal_year_weekday_ct = x.fiscal_year_weekday_ct
  , fiscal_year_start_date = x.fiscal_year_start_date
  , fiscal_year_end_date = x.fiscal_year_end_date
  FROM
  calendar cal
  inner join (
  
    select
      date_key
      
    , ROW_NUMBER() over (partition by fiscal_period_key order by date_key) as fiscal_day_of_period
    , ROW_NUMBER() over (partition by fiscal_quarter_key order by date_key) as fiscal_day_of_quarter
    , ROW_NUMBER() over (partition by fiscal_year_key order by date_key) as fiscal_day_of_year

    , COUNT(date_key) OVER (partition by fiscal_period_key) as fiscal_period_day_ct
    , COUNT(CASE WHEN day_weekday_ct = 1 THEN date_key END) OVER (partition by fiscal_period_key) as fiscal_period_weekday_ct
    , MIN([date]) over (partition by fiscal_period_key) as fiscal_period_start_date
    , MAX([date]) over (partition by fiscal_period_key) as fiscal_period_end_date  
    
    , COUNT(date_key) OVER (partition by fiscal_quarter_key) as fiscal_quarter_day_ct
    , COUNT(CASE WHEN day_weekday_ct = 1 THEN date_key END) OVER (partition by fiscal_quarter_key) as fiscal_quarter_weekday_ct  
    , MIN([date]) over (partition by fiscal_quarter_key) as fiscal_quarter_start_date
    , MAX([date]) over (partition by fiscal_quarter_key) as fiscal_quarter_end_date
      
    , COUNT(date_key) OVER (partition by fiscal_year_key) as fiscal_year_day_ct
    , COUNT(CASE WHEN day_weekday_ct = 1 THEN date_key END) OVER (partition by fiscal_year_key) as fiscal_year_weekday_ct
    , MIN([date]) over (partition by fiscal_year_key) as fiscal_year_start_date
    , MAX([date]) over (partition by fiscal_year_key) as fiscal_year_end_date
    
    from
    calendar
    
  ) x on x.date_key = cal.date_key
  WHERE
  cal.date_key != 0;   

  
   -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- delete extra calendar years expanded earlier
  
  delete from calendar where
  (year = @start_year - 1 or year = @end_year + 1 )
  and date_key != 0
       
END
go
