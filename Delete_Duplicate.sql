WITH CTE AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY [WaybillNo] ORDER BY (SELECT NULL)) AS rn
  FROM [MaThet].[dbo].[1-20 Sep CargoMDY]
)
DELETE FROM CTE WHERE rn > 1;

--select [WaybillNo] from [MaThet].[dbo].[1-20 Sep CargoMDY]
