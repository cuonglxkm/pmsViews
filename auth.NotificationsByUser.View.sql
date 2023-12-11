USE [erp_126]
GO
/****** Object:  View [auth].[NotificationsByUser]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [auth].[NotificationsByUser] AS
SELECT [Id]
      ,[Data]
	  ,JSON_QUERY(r.value) as [Receiver]
      ,[AuditData]
  FROM [auth].[Notifications]
   CROSS APPLY OPENJSON(Receivers) as r
GO
