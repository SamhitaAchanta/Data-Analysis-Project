# Data-Analysis-Project

1. Business Demand 

Q: What is a business demand? -->

Goal: The business wants to improve their internet sales and they want to move from static reports to visual dashboards.
Focus: They want to know how much they have sold of what products to what customers over a given time period. They want an overview of internet sales per customer and per products. They also want to know which product is their best seller and their audience to sell to and want the ability to filter them. 
Info: Budget is given for 2021 and their analysis goes back up to 2 years.
Tools: Power BI dashboard, CRM System

2. Clean The Data

Q: FACT vs DIMENSION Table?
Fact - numbers and calculations
Dimension - describe the rows in the fact table

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
FROM [AdventureWorksDW2019].[dbo].[DimCustomer]

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
 
Final Query:
SELECT 
	c.CustomerKey AS CustomerKey,
  c.FirstName AS [First Name],
  c.LastName AS  [Last Name],
	c.firstname + ' ' + lastname AS [Full Name], -- combined first and last name = full name  
  CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,  -- CASE is similar to if-then statement
  c.DateFirstPurchase AS DateFirstPurchase, 
	g.city AS [Customer City] -- Joined in Customer City from Geography Table
  FROM 
	[AdventureWorksDW2019].[dbo].[DimCustomer] AS c
	LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey
  ORDER BY
	CustomerKey ASC -- ascending order of customer key
	
DIM_Product Table:

DO need:
 SELECT  [ProductKey]
      ,[ProductAlternateKey]
      ,[EnglishProductName]
      ,[SpanishProductName]
      ,[FrenchProductName]
      ,[Color]
      ,[Size]
      ,[ProductLine]
      ,[ModelName]
      ,[EnglishDescription]
      ,[Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct]
  
DON'T need:
      ,[ProductSubcategoryKey]
      ,[WeightUnitMeasureCode]
      ,[SizeUnitMeasureCode]
      ,[EnglishProductName]
      ,[SpanishProductName]
      ,[FrenchProductName]
      ,[StandardCost]
      ,[FinishedGoodsFlag]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[ListPrice]
      ,[SizeRange]
      ,[Weight]
      ,[DaysToManufacture]
      ,[DealerPrice]
      ,[Class]
      ,[Style]
      ,[LargePhoto]
      ,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct]
  
Final Query:
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductCode, 
  p.[EnglishProductName] AS ProductName, 
  pc.[EnglishProductCategoryName] AS [Product Category], -- joined from Product Category table
  ps.[EnglishProductSubcategoryName] AS [Product Sub Category], -- joined from Product Sub Category table
  p.[Color] AS [Product Color], 
  p.[Size] AS [Product Size], 
  p.[ProductLine] AS [Product Line], 
  p.[ModelName] AS [Product Model Name], 
  p.[EnglishDescription] AS [Product Description], 
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as p 
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
Order By 
  p.ProductKey ASC
  
FACT_InternetSales Table:

DO need:
  SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[SalesOrderNumber]
      ,[UnitPriceDiscountPct]
      ,[SalesAmount]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  
  DON'T need:
  SELECT 
      ,[PromotionKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderLineNumber]
      ,[RevisionNumber]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[UnitPriceDiscountPct]
      ,[DiscountAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[TaxAmt]
      ,[Freight]
      ,[CarrierTrackingNumber]
      ,[CustomerPONumber]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  
  Final Query:
  SELECT  [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[SalesOrderNumber]
      ,[SalesAmount]
  FROM 
	[AdventureWorksDW2019].[dbo].[FactInternetSales]
  WHERE 
	LEFT(OrderDateKey,4) >= 2019 --  only need two years of data
  ORDER BY
	OrderDateKey ASC
	
3. Load Data into PowerBI

Important Steps Before Creating a Dashboard:

*Establish the data model aka the correct relationships between the files

*Make sure the data types are correct for each column before creating the dashboard

Calculations:

Sales = SUM(FACT_InternetSales[SalesAmount])

Total Budget = SUM(FACT_Budget[Budget])

Sales / Total Budget = DIVIDE( [Sales] , [Total Budget])

Make [Customer City] as data category called city. It will be easier to make a map. 



