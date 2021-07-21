/****** Script for SelectTopNRows command from SSMS  ******/
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
