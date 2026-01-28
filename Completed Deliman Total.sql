with CTE_IB as(
select * from [11.Nov_Data_25].[dbo].[IB_MDY]
union
select * from [11.Nov_Data_25].[dbo].[IB_REG]
union 
select * from [11.Nov_Data_25].[dbo].[IB_YGN]
union 
select * from [11.Nov_Data_25].[dbo].[IB_NPW]
)
select 'Nov' as Month,[Destination Branch],Deliveryman,
[Consignment Status],count(*) as Total
from CTE_IB
where [Consignment Status]='Completed' and [Destination Branch] not like 'YGN%'
--and 
--Deliveryman like '%Office%' or Deliveryman like '%Counter%'or [Deliveryman] like '%-%'
group by [Destination Branch],Deliveryman,
[Consignment Status]
order by [Destination Branch] asc 