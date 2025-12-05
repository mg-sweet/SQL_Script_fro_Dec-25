with cte_OB as (
select * from [10.Oct_Data_25].[dbo].[OB_MDY]
union
select * from [10.Oct_Data_25].[dbo].[OB_NPW]
union 
select * from [10.Oct_Data_25].[dbo].[OB_REG]
union 
select * from [10.Oct_Data_25].[dbo].[OB_YGN_UPDATE]
)
--select MONTH([Date]) AS Month, [From City], COUNT(*) as Total
select 'Oct' as Month, [From City], COUNT(*) as Total 
from
cte_OB
Group by [From City] 
Order by [From City] asc