-- Cleansed DIM_Products Table --
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode, 
  p.[EnglishProductName] AS [Product Name], 
  psc.EnglishProductSubcategoryName AS [Sub Category], -- Joined in from Sub Category Table
  pc.EnglishProductCategoryName AS [Product Category], -- Joined in from Category Table
  p.[Color] AS [Product Color], 
  p.[Size] AS [Product Size], 
  p.[ProductLine] AS [Product Line], 
  p.[ModelName] AS [Product Model Name], 
  p.[EnglishDescription] AS [Product Description], 
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2022].[dbo].[DimProduct] as p
  LEFT JOIN [AdventureWorksDW2022].[dbo].[DimProductSubcategory] AS psc ON psc.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2022].[dbo].[DimProductCategory] AS pc ON psc.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc