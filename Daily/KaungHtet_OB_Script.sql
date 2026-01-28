select [Date]
	,[Waybill No]
	--,[Sender/Internal Reference]
    ,[From City]
    ,[Branch]
    ,[To City]
    ,[To City/Short Code]
    ,[Service Type]
    ,[Status]
from
[12.Dec 25].[dbo].[21 Dec OB]
WHERE
[From City] in (
-- MDY Region
'Anesakhan','Bagan','Han Myint Mo','Kume','Kyaukpadaung','Kyaukse',
'Madaya','Mahlaing','Meiktila','Mogok','Myingyan','Myitthar','Natoegyi',
'Nyaung-U','Pyawbwe','Pyin Oo Lwin','Sintgaing','Tada-U','Tatkon',
'TaungTha','Thazi','Wundwin','Yamethin',

-- SHN Region
'Aungpan','Hopong','PinLaung','Yatsauk','Ayetharyar','Nyaungshwe','Shwenyaung','Taunggyi',
'Tachileik','Kengtung','Kalaw','Lashio','Loilem','Hehoe','Pindaya','Ywangan','Ywangan',

'Myitkyina'
)