SELECT  C.[WaybillNo], C.[FromBranch], C.[ToBranch], C.[ReceivedBranch],
  CASE 
    WHEN C.[WaybillNo] = OB.[WaybillNo] THEN OB.[WaybillNo]
	WHEN OB.[WaybillDate] IS NULL THEN [WaybillDate]
	WHEN C.[WaybillNo] IS NULL OR OB.[WaybillNo] IS NULL THEN 'NULL'
    ELSE 'False'
  END AS CargoChecking

FROM [Aug_Data].[dbo].[25 AYA CARGO] C
LEFT JOIN [Aug_Data].[dbo].[25 Aug AYA OB] OB ON C.[WaybillNo] = OB.[WaybillNo]
WHERE C.[ToBranch] != 'YGN-COD'