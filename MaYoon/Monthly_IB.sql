with CTE_OB as(
select * from [10.Oct_Data_25].[dbo].[IB_MDY]
union
select * from [10.Oct_Data_25].[dbo].[IB_NPW]
union 
select * from [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
union 
select * from [10.Oct_Data_25].[dbo].[IB_YGN]
)
select Month([Date]) as Month,[To City],count(*) as Total, [Consignment Status]
from CTE_OB
group by Month([Date]),[To City], [Consignment Status]
order by [To City] asc