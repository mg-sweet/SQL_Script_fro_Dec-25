WITH CTE_DeliCombine AS (
SELECT [To Delivery Date],[Branch], [Delivery Man], [Consignment Status] FROM [11.Nov 25].[dbo].[1 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[30 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[2 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[16 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[3 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[17 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[4 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[18 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[5 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[19 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[6 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[20 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[7 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[21 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[8 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[22 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[9 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[23 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[10 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[24 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[11 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[25 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[12 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[26 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[13 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[27 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[14 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[28 Nov Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[15 Nov Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[29 Nov Deli] 
)
SELECT
	'Nov' AS Month
	--[To Delivery Date]
	,[Branch]
	--,[Delivery Man]
	,Count(*) AS Total
	FROM
	CTE_DeliCombine
	WHERE
		[Consignment Status] = 'Completed'
	
	--AND
	--	[Delivery Man] = 'LinLinZaw'
	GROUP BY 
	[Branch]
	--,[Delivery Man]
	--,[To Delivery Date]

--WITH CTE_DeliCombine AS (
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Consignment Status] FROM [11.Nov 25].[dbo].[1 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[30 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[2 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[16 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[3 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[17 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[4 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[18 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[5 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[19 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[6 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[20 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[7 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[21 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[8 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[22 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[9 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[23 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[10 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[24 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[11 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[25 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[12 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[26 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[13 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[27 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[14 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[28 Nov OB] UNION ALL
--SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[15 Nov OB] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [11.Nov 25].[dbo].[29 Nov OB] 
--)
--SELECT
--	'Nov' AS Month
--	--[To Delivery Date]
--	,[Branch]
--	--,[Delivery Man]
--	,Count(*) AS Total
--	FROM
--	CTE_DeliCombine
--	WHERE
--		[Consignment Status] = 'Completed'
--	AND
--		Branch = 'HBE'
	
--	GROUP BY 
--	[Branch]
