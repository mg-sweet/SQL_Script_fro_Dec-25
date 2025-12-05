WITH CTE_Deli AS (
-- Up to 25-Sep
SELECT * FROM [10.Oct 25].[dbo].[1 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[11 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[2 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[12 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[3 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[13 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[4 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[14 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[5 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[15 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[6 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[16 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[7 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[17 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[8 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[18 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[9 Oct Deli] UNION ALL --SELECT * FROM [10.Oct 25].[dbo].[19 Delivery] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[10 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[20 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[21 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[24 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[22 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[25 Oct Deli] UNION ALL --
SELECT * FROM [10.Oct 25].[dbo].[23 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[26 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[27 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[28 Oct Deli] UNION ALL
SELECT * FROM [10.Oct 25].[dbo].[29 Oct Deli] UNION ALL SELECT * FROM [10.Oct 25].[dbo].[30 Oct Deli]
)
SELECT 
	'Oct' as Month
	,Branch
	,[Delivery Man]
	,Status
	,COUNT(*) AS TOTAL_Completed
	FROM
	CTE_Deli
	where Status = 'Completed'
	and Branch = 'han'
	
	--OR
	--[Delivery Man] = 'LaMinKhantTTN'
	--OR
	--[Delivery Man] = 'LaMinKhant‌TTN'
	
	group by Status, Branch, [Delivery Man]