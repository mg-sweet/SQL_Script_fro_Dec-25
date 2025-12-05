WITH CTE_IB AS (
SELECT * FROM [11.Nov 25].[dbo].[30 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[29 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[28 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[27 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[26 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[25 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[24 Nov Deli]
),
CTE_OB AS (
SELECT * FROM [11.Nov 25].[dbo].[30 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[29 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[28 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[27 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[26 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[25 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[24 Nov OB]
--UNION ALL
--SELECT * FROM [11.Nov 25].[dbo].[23 Nov OB]
--UNION ALL
--SELECT * FROM [11.Nov 25].[dbo].[22 Nov OB]
)
SELECT
     OB.[Date],IB.[Waybill],OB.[From City],OB.[To City],
try_convert (date,IB.[Completed Time]) as Completed_Date,
IB.[Status],
DATEDIFF(day,OB.[Date],try_convert (Date,IB.[Completed Time])) as Lead_Time
FROM
	CTE_IB IB
    RIGHT JOIN CTE_OB OB ON IB.[Waybill] = OB.[Waybill No] 
	where IB.[Status]='completed'
    AND 
    --    --IB.[Branch] IN ('MLM','HAN','TGI','PTN','MYA','PYY','MGY','POL')
        OB.[To City/Short Code] IN ('MDY','NPW','TGI','PTN','POL','MLM')
    --and [Waybill No#] = 'AAT577277'

--SELECT top(100) * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
--	where [Consignment Status]='completed'