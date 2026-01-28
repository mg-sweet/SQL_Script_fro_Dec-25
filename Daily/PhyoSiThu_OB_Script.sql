SELECT  
	TRY_CAST([Date] as Date) AS Date
	,[Waybill No]
	--,[Sender/Internal Reference]
    ,[From City]
    ,[Branch]
    ,[To City]
    ,[To City/Short Code]
    ,[Service Type]
    ,[Status]
  FROM 
	[12.Dec 25].[dbo].[22 Dec OB]
  where 
  --[From City] = 'Mandalay'
  --OR
  --[From City] = 'Myintnge' 
  --OR
  --[From City] = 'Amarapura'
  --OR
  --[From City] = 'Patheingyi'
  Branch LIKE 'MDY-%'
   OR
  [From City] IN (
  -- MGY Region
	'Magway','Pakokku','Taungtwingyi','Yesagyo','Aunglan','Pwintbyu','Minbu',
	'Thayed','Salin','Yenanchaung','Chauk','Natmauk','Ngape','Satthwar','Kamma',
	'Saku','Salay','Myothit','Seik Phyu','Upper MinHla','SinHpyuKyun','SinBaungWe'
	)
	OR
  [From City] IN (
  -- SGG Region
	'Monywa','Sagaing','Shwebo','Myinmu','Kalay'
	)
	OR
	[From City] = 'Loikaw'