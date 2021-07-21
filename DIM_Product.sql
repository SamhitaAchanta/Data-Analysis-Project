/****** Script for SelectTopNRows command from SSMS  ******/
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
FROM [AdventureWorksDW2019].[dbo].[DimProduct] as p
	LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
    LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
Order By 
	p.ProductKey ASC