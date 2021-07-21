/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date
  --,[DayNumberOfWeek]
  , 
  [EnglishDayNameOfWeek] AS Day
  --,[SpanishDayNameOfWeek]
  --,[FrenchDayNameOfWeek]
  --,[DayNumberOfMonth] 
  --,[DayNumberOfYear]
  --,[WeekNumberOfYear]
  , 
  [EnglishMonthName] AS MonthName,
   Left([EnglishMonthName], 3) AS MonthShort,   -- first 3 letters of each month
  --,[SpanishMonthName]
  --,[FrenchMonthName]
   
  [MonthNumberOfYear] AS MonthNumber,
  [CalendarQuarter] AS Quarter,
  [CalendarYear] AS Year
  --,[CalendarSemester]
  --,[FiscalQuarter]
  --,[FiscalYear]
  --,[FiscalSemester]
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
	[CalendarYear] >= 2019