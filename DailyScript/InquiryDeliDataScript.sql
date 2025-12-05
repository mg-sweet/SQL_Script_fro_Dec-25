select *
from
[dbo].[26 Aug Deli]
where
[Branch] LIKE ('YGN-%') AND
--[Branch] NOT LIKE ('Yangon') 
--AND [Branch] NOT LIKE ('MDY-%') AND [Branch] NOT LIKE ('NPW-%')
--AND
[Status] = 'Completed'