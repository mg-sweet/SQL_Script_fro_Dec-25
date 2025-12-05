with cte_IB as (
select [Date],[Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].[IB_MDY]
union all
select [Date],[Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].IB_NPW
union all
select [Date],[Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].IB_REG
union all
select [Date],[Waybill No#], [Consignment Status]  from [Aug_Data].[dbo].IB_YGN
)
select 
	DATE
	,cte_IB.[Waybill No#]
	,[Consignment status]
	from cte_IB