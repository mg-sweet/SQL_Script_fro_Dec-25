SELECT  C.[WaybillNo], C.[FromBranch], C.[ToBranch], 
  CASE 
    WHEN C.[WaybillNo] = OB.[WaybillNo] THEN OB.[WaybillNo]
	
	WHEN C.[WaybillNo] IS NULL OR OB.[WaybillNo] IS NULL THEN 'NULL'
    ELSE 'False'
  END AS CargoChecking

FROM [Aug_Data].[dbo].[25 Upper Cargo] C
LEFT JOIN [Aug_Data].[dbo].[25 Aug Upper OB] OB ON C.[WaybillNo] = OB.[WaybillNo]
WHERE C.[ToBranch] != 'YGN-COD'