WITH Deli AS (
SELECT * FROM [12.Dec 25].[dbo].[1 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[2 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[3 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[4 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[5 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[6 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[7 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[8 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[9 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[10 Dec Deli]

)
SELECT
	CAST([To Delivery Date] As date) as Date,
	COUNT(*) AS Total
FROM
	Deli
WHERE [Status] = 'cancelled'
GROUP BY [To Delivery Date]


WITH Deli AS (
SELECT * FROM [12.Dec 25].[dbo].[11 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[12 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[13 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[14 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[15 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[16 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[17 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[18 Dec Deli] UNION ALL
SELECT * FROM [12.Dec 25].[dbo].[19 Dec Deli] UNION ALL SELECT * FROM [12.Dec 25].[dbo].[20 Dec Deli]

)
SELECT
	CAST([To Delivery Date] As date) as Date,
	COUNT(*) AS Total
FROM
	Deli
WHERE [Status] = 'cancelled'
GROUP BY [To Delivery Date]
