USE [erp_126]
GO
/****** Object:  View [stm].[NotificationByReceiver]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [stm].[NotificationByReceiver] AS
SELECT TOP (1000) [id]
      ,[data]
	  ,JSON_QUERY(r.value) as [receiver]
      ,[dataDb]
  FROM [stm].[Notifications]
   CROSS APPLY OPENJSON(receivers) as r
GO
