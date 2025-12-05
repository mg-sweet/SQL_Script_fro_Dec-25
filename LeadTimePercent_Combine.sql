WITH CTE_Total as (
SELECT * FROM [Same_Day_Testing].[dbo].[Jun_YGN_TOTAL]
UNION ALL
SELECT * FROM [Same_Day_Testing].[dbo].[July_YGN_TOTAL]
UNION ALL
SELECT * FROM [Same_Day_Testing].[dbo].[Aug_YGN_TOTAL]
)
SELECT  CTE_Total.[Date],
CTE_Total.[From City], CTE_Total.[To City], CTE_Total.[Completed_Date], CTE_Total.[Consignment Status]
,CTE_Total.[Lead_Time], COUNT(CTE_Total.[Lead_Time]) as Total
FROM
CTE_Total
GROUP BY CTE_Total.[Date],
CTE_Total.[From City], CTE_Total.[To City], CTE_Total.[Completed_Date], CTE_Total.[Consignment Status]
,CTE_Total.Lead_Time