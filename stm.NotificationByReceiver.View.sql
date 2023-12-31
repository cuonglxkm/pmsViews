ALTER view [stm].[NotificationByReceiver] AS
SELECT TOP (1000) [id]
      ,[data]
	  ,JSON_QUERY(r.value) as [receiver]
      ,[dataDb]
  FROM [stm].[Notifications]
   CROSS APPLY OPENJSON(receivers) as r
GO
