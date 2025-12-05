with cte_IB as (
select [Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].[IB_MDY]
union all
select [Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].IB_NPW
union all
select [Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].IB_REG
union all
select [Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].IB_YGN
)
, cte_ob as (
select [Waybill No#]  from [Aug_Data].[dbo].[OB_MDY]
union all
select [Waybill No#] from [Aug_Data].[dbo].[OB_NPW]
union all
select [Waybill No#]  from [Aug_Data].[dbo].OB_REG
union all
select [Waybill No#]  from [Aug_Data].[dbo].OB_YGN
)
select
	cte_IB.[Waybill No#] AS IB_Waybill
	,cte_ob.[Waybill No#] as OB_Waybill
	,cte_IB.[Consignment Status]
	
FROM cte_IB
JOIN cte_ob ON cte_IB.[Waybill No#] = cte_ob.[Waybill No#]
