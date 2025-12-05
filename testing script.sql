WITH CTE_Combine as (
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[IB_MDY]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[IB_NPW]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[IB_REG]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[IB_YGN]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[OB_MDY]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[OB_NPW]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[OB_YGN]
union all
select [Date],[Waybill No#],[Customer Reference No#],[Customer],[Pickupman],[Origin Branch] from [Aug_Data].[dbo].[OB_REG]

)

SELECT [Date]
	--,[Waybill No#]
	,[Customer Reference No#]
	,[CTE_Combine].[Origin Branch]
	,[Pickupman] 
	,count(*) as Total_Pickup
	
	FROM
	CTE_Combine
	where Pickupman <> 'null'
	--and
	--[Customer Reference No#] = 'E2371651'
	--AND
	--[Pickupman] = 'TheingiMyatLinNOKA'
	group by [Date],[Customer Reference No#],[Pickupman], [Origin Branch]
	