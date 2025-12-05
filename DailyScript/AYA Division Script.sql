--Select *[Waybill Date] = '2025-09-16'
--FORMAT(GETDATE(), 'dd-MM-yyyy') AS Waybill_Date,
--TRY_CONVERT(date,[Waybill Date]) AS Waybill_Date,
-- [Waybill No], [From City], [To City]
--from
--[August].[dbo].['Approved Before 24-Aug-25 Info$']
--where [To City] In (
--'Pathein','Wakema','Labutta','Danubyu','Mawlamyinegyun','Nyaungtone',
--'Einme','Kangyidaunt','Maubin','Kyaiklat','Bogale','Zalun','Dedaye',
--'Hinthada','Myaungmya','Pantanaw','Kyangin','Myanaung','Kyaunggon',
--'Kyonpyaw','Ngathaingchaung','Pyapon','Sar Ma Lauk','Thabaung',
--'Ingapu','Ngapudaw','Yegyi','Atthoke','Kyonemangay','Chaung Thar',
--'Lemyethna','Ahtaung','Htugyi','Shwelaung','Darka','Ngwesaung'

select [Date],[Waybill No],[From City],[To City], [Status]
from [Sep 25].[dbo].[16 Sep OB]
where [From City]  In (
'Pathein','Wakema','Labutta','Danubyu','Mawlamyinegyun','Nyaungtone',
'Einme','Kangyidaunt','Maubin','Kyaiklat','Bogale','Zalun','Dedaye',
'Hinthada','Myaungmya','Pantanaw','Kyangin','Myanaung','Kyaunggon',
'Kyonpyaw','Ngathaingchaung','Pyapon','Sar Ma Lauk','Thabaung',
'Ingapu','Ngapudaw','Yegyi','Atthoke','Kyonemangay','Chaung Thar',
'Lemyethna','Ahtaung','Htugyi','Shwelaung','Darka','Ngwesaung')
