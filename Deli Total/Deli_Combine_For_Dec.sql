WITH CTE_Deli AS (
-- Up to 25-Sep
SELECT * FROM [12.Dec 25].[dbo].[1 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[16 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[2 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[17 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[3 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[18 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[4 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[19 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[5 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[20 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[6 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[21 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[7 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[22 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[8 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[23 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[9 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[24 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[10 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[25 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[11 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[26 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[12 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[27 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[13 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[28 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[14 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[29 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[15 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[30 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[31 Dec Deli]
)
SELECT 
	'Dec' as Month
	,Branch
	--,[Delivery Man]
	,Status
	,COUNT(*) AS TOTAL_Completed
	FROM
	CTE_Deli
	where Status = 'Completed'
	and Branch = 'han' OR Branch='BLN'
	
	--OR
	--[Delivery Man] = 'LaMinKhantTTN'
	--OR
	--[Delivery Man] = 'LaMinKhant‌TTN'
	
	group by Status, Branch