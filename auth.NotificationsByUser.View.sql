ALTER VIEW [auth].[NotificationsByUser] AS
SELECT [Id]
      ,[Data]
	  ,JSON_QUERY(r.value) as [Receiver]
      ,[AuditData]
  FROM [auth].[Notifications]
   CROSS APPLY OPENJSON(Receivers) as r
GO
