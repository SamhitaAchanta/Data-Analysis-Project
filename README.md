# Data-Analysis-Project

1. Business Demand 

Q: What is a business demand? -->

Goal: The business wants to improve their internet sales and they want to move from static reports to visual dashboards.
Focus: They want to know how much they have sold of what products to what customers over a given time period. They want an overview of internet sales per customer and per products. They also want to know which product is their best seller and their audience to sell to and want the ability to filter them. 
Info: Budget is given for 2021 and their analysis goes back up to 2 years.
Tools: Power BI dashboard, CRM System

2. Clean The Data

DIM_Date Table:
  DO need: 
      [DateKey]
      ,[FullDateAlternateKey]
      ,[EnglishDayNameOfWeek]
      ,[EnglishMonthName]
      ,[MonthNumberOfYear]
      ,[CalendarQuarter]
      ,[CalendarYear]
      
  DON'T need: 
      ,[DayNumberOfWeek]
      ,[SpanishDayNameOfWeek]
      ,[FrenchDayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[DayNumberOfYear]
      ,[WeekNumberOfYear]
      ,[SpanishMonthName]
      ,[FrenchMonthName]
      ,[CalendarSemester]
      ,[FiscalQuarter]
      ,[FiscalYear]
      ,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  
 Final Query:
 SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  [EnglishDayNameOfWeek] AS Day, 
  [EnglishMonthName] AS MonthName, 
  Left([EnglishMonthName], 3) AS MonthShort, -- first 3 letters of each month
  [MonthNumberOfYear] AS MonthNumber, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate] 
WHERE 
  [CalendarYear] >= 2019

DIM_Customers Table:
DO need:
SELECT TOP (1000) 
[CustomerKey]
,[FirstName]
,[LastName]
,[Gender]
,[DateFirstPurchase]
DON'T need:

      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,[Title]
      
      ,[MiddleName]
      
      ,[NameStyle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Suffix]
    
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[SpanishEducation]
      ,[FrenchEducation]
      ,[EnglishOccupation]
      ,[SpanishOccupation]
      ,[FrenchOccupation]
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      
      ,[CommuteDistance]
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer]
Final Query:
