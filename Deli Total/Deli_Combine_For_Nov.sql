WITH Deli_combine as (
SELECT * FROM [11.Nov 25].[dbo].[1 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[11 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[2 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[12 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[3 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[13 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[4 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[14 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[5 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[15 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[6 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[16 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[7 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[17 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[8 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[18 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[9 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[19 Nov Deli] UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[10 Nov Deli] UNION ALL SELECT * FROM [11.Nov 25].[dbo].[20 Nov Deli]
-- for Oct
UNION ALL SELECT * FROM [10.Oct 25].[dbo].[29 Oct Deli]
)

SELECT 
	cast ([To Delivery Date] as Date) as Delivery_Date,Waybill,
[Branch],[Delivery Man],[Assigned Time],[Completed Time], [Consignment Status]
FROM
	Deli_combine
WHERE
	Branch = 'MUB'
AND
	DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) <= '5'
AND
	[Delivery Man] IN ('PhyiMinSoeMUB','ThanHtetAungMUB','YeMinHtetMUB')