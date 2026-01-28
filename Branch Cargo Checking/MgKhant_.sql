select
	CAST([Waybill Date] AS date) as [Date]
	,[Sender Internal Reference] = 
	CASE
	WHEN [Sender Internal Reference] is null then [Customer Type]
	WHEN [Sender Internal Reference] is not null then [Sender Internal Reference]
	END
	,[Waybill No]
	,[From City]
    --,[From City Short Code] 
	,[Branch Name]
    ,[To City]
    ,[To City Short Code]
    ,[Service Type]
    ,[Status]
from
	[1.Jan 26].[dbo].[12 Jan OB]
WHERE
[From City] IN (
'Naypyidaw',
-- MDY Region
'Anesakhan','Bagan','Han Myint Mo','Kume','Kyaukpadaung','Kyaukse',
'Madaya','Mahlaing','Meiktila','Mogok','Myingyan','Myitthar','Natoegyi',
'Nyaung-U','Pyawbwe','Pyin Oo Lwin','Sintgaing','Tada-U','Tatkon',
'TaungTha','Thazi','Wundwin','Yamethin'
-- New Branch
, 'Palaik'
	)