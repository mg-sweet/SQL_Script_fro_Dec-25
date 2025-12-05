SELECT Deli.[Delivery Man], Deli.Branch, Deli.Status, Count(Deli.Status) as Total
from [August].[dbo].[21 Aug Deli] as Deli
join [August].[dbo].[21 Aug Pickup] as Pickup on
Deli.[Branch] = Pickup.[Branch]
where Deli.Branch like 'YGN-%' and Deli.Status = 'Completed'
group by Deli.Status, Deli.[Delivery Man], Deli.Branch, Deli.Status
order by Deli.[Branch]