SELECT
	OB.[Waybill]
	,OB.[Waybill Date]
	,OB.[From City]
	,OB.[To City]
	,CTF.[CTF Transferred Date]
	,Ro.[ReceivedAt]
FROM
	[MaThet].[dbo].[1_27 Oct OB] OB
INNER JOIN 
	[MaThet].[dbo].[20_28 Oct CTF Out Date] CTF ON OB.[Waybill] = CTF.[Waybill]
INNER JOIN
	[MaThet].[dbo].[20_28 Inv IB Date] Ro ON OB.[Waybill] = Ro.[Waybill]
WHERE
	[Waybill Date] BETWEEN '2025-10-20' AND '2025-10-25'
	--AND
	--[To City] IN ('Myawaddy','Myitkyina','')