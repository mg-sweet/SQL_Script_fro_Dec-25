SELECT OB.[Date], OB.[Waybill No], OB.[From City], OB.[To City],
  CASE 
    WHEN OB.[Waybill No] = C.[Waybill No] THEN C.[Waybill No]
	WHEN C.[Waybill No] IS NULL OR OB.[Waybill No] IS NULL THEN 'NULL'
    ELSE 'False'
  END AS OB_Checking

FROM [Aug_Data].[dbo].[24 OB Data] OB 
INNER JOIN [Aug_Data].[dbo].[24 BGO Cargo] C ON OB.[Waybill No] = C.[Waybill No]
