with cte_CargoDate as (
select * from [MaThet].[dbo].[1_10 Sep AllWaybill] as AllWaybill
full join
[MaThet].[dbo].[1-20 Sep CargoYGN] as AllCargo
on AllWaybill.[Waybill No] = AllCargo.[WaybillNo]
)
select 
	top(1000)
	[From City/City name(English)] as From_City
	,[To City/City name(English)] as To_City
	,[cte_CargoDate].[Waybill No] as OB_Waybill
	,cte_CargoDate.WaybillNo as Cargo_Waybill
	,cte_CargoDate.[Waybill Date] as OB_Date
	,cte_CargoDate.Date as Cargo_Transfer_Date
	from cte_CargoDate
	where [Waybill No] is not null
	and
	WaybillNo is not null
	and
	[Waybill No] not like 'rt-%'