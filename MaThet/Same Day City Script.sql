with CTE_OB as (
select * from [8.Aug_Data_25].[dbo].[OB_MDY]
union
select * from [8.Aug_Data_25].[dbo].[OB_NPW]
union 
select * from [8.Aug_Data_25].[dbo].[OB_REG]
union 
select * from [8.Aug_Data_25].[dbo].[OB_YGN]
)
select
	[DATE]
	,[Waybill No#] as [Waybill No]
	,[Customer Reference No#] as [Customer ID]
	,[Customer]
	,[Mobile]
	,[Origin Branch]
	,[From City], [To City]
	,[Receiver Name],[Receiver Mobile],[Receiver Address]
	
from
	CTE_OB
WHERE
	[From City] = [To City]
and
	[From City] IN ('mandalay','naypyitaw','magway','pakokku','pathein'
					,'hinthada','monywa','pyin oo lwin','meiktila','mawlamyine'
					,'hpa-an','bago','taungoo','pyay','taunggyi')
--and 
--	LEFT([Service],3) = RIGHT([Service],3)