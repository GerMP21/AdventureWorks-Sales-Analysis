-- Cleansed FACT_InternetSales Table --
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [SalesOrderNumber], 
  [SalesAmount]
FROM 
  [AdventureWorksDW2022].[dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) - 2 -- Ensures we always only bring two years of date from extraction
  AND LEFT (OrderDateKey, 4) < '2024' -- Filter out sales before 2024
ORDER BY
  OrderDateKey ASC