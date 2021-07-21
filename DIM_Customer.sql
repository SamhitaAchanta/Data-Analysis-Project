/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	c.CustomerKey AS CustomerKey,
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
    c.FirstName AS [First Name],
      --,[MiddleName]
    c.LastName AS  [Last Name],
	c.firstname + ' ' + lastname AS [Full Name], -- combined first and last name = full name
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
  CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,  -- CASE is similar to if-then statement
      --,[EmailAddress]
      --,[YearlyIncome]
      --,[TotalChildren]
      --,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
      --,[FrenchEducation]
      --,[EnglishOccupation]
      --,[SpanishOccupation]
      --,[FrenchOccupation]
      --,[HouseOwnerFlag]
      --,[NumberCarsOwned]
      --,[AddressLine1]
      --,[AddressLine2]
      --,[Phone]
    c.DateFirstPurchase AS DateFirstPurchase, 
      --,[CommuteDistance]
	 g.city AS [Customer City] -- Joined in Customer City from Geography Table
  FROM 
	[AdventureWorksDW2019].[dbo].[DimCustomer] AS c
	LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey 
  ORDER BY
	CustomerKey ASC -- ascending order of customer key 