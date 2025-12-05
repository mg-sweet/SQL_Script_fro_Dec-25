select [Date]
      ,[Waybill No]
      ,[From City]
      ,[To City]
	  ,[Status]
from
[Sep 25].[dbo].[10 Sep OB]
WHERE
[From City] in (
'Anesakhan','Bagan','Han Myint Mo','Kume','Kyaukpadaung','Kyaukse',
'Madaya','Mahlaing','Meiktila','Mogok','Myingyan','Myitthar','Natoegyi',
'Nyaung-U','Pyawbwe','Pyin Oo Lwin','Sintgaing','Tada-U','Tatkon',
'TaungTha','Thazi','Wundwin','Yamethin',

-- MGY Region
'Magway','Pakokku','Taungtwingyi','Yesagyo','Aunglan','Pwintbyu','Minbu',
'Thayed','Salin','Yenanchaung','Chauk','Natmauk','Ngape','Satthwar','Kamma',
'Saku','Salay','Myothit','Seik Phyu','Upper MinHla','SinHpyuKyun','SinBaungWe',

-- SGG Region
'Monywa','Sagaing','Shwebo','Myinmu','Kalay',

-- SHN Region
'Aungpan','Hopong','PinLaung','Yatsauk','Ayetharyar','Nyaungshwe','Shwenyaung','Taunggyi',
'Tachileik','Kengtung','Kalaw','Lashio','Loilem','Hehoe','Pindaya','Ywangan','Loilem','Ywangan',
'Loikaw'
)