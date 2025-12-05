with CTE_IB AS (
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_MDY]
	where [Consignment Status]='completed'
    UNION ALL
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
	where [Consignment Status]='completed'
    UNION ALL
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_YGN]
	where [Consignment Status]='completed'
    UNION ALL
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
	where [Consignment Status]='completed'
)
select 'Oct' as Month,
[Deliveryman],
[To City],[Consignment Status],count(*) as Total
from CTE_IB
--where
--[To City]= 'Mawlamyine'
--and
--[Destination Branch] = 'MLM'
group by [To City],[Consignment Status],[Deliveryman]
order by [To City] asc