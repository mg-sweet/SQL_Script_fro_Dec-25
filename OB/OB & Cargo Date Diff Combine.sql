WITH Cargo_Combine as (
SELECT *
	FROM
	[dbo].[1-20 Sep CargoMDY]
	UNION ALL
	SELECT *
	FROM
	[dbo].[1-20 Sep CargoYGN]
	)
SELECT 
	CAST ([Waybill Date] as Date) as Date
	,AW.[Waybill No]
	--,CC.[WaybillNo]
	,AW.[From City/City name(English)]
	,AW.[To City/City name(English)]
	,CAST (CC.[Date] as Date) as Cargo_Transfer_Date
	,[FromBranch] as Type_YGN_or_MDY
FROM
	Cargo_Combine CC
	inner JOIN
	[dbo].[1_10 Sep AllWaybill] AW ON
	CC.[WaybillNo] = AW.[Waybill No]