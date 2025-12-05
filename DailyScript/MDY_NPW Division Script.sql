SELECT [Date]
      ,[Waybill No]
      ,[From City]
      ,[Branch]
      ,[To City]
      ,[To City/Short Code]
      ,[Service Type]
      ,[Status]
  FROM [Sep 25].[dbo].[10 Sep OB]
  WHERE
  
  Branch LIKE 'MDY-%' OR
  Branch LIKE 'NPW-%'
  
  AND Branch NOT LIKE 'MDY-COD'