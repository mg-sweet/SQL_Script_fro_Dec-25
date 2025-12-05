select Month([Pickup Date#]) as Month,[Branch], [Deliveryman],
[Job Status],
Count([Job Status])
 as Total
from [dbo].[4 Aug Pickup YGN]
where [Job Status]='Completed'
group by  Month([Pickup Date#]),[Branch],[Deliveryman],[Job Status]
order by [Branch] asc