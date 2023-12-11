USE [erp_126]
GO
/****** Object:  View [stm].[ViewSequences]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [stm].[ViewSequences] AS
select name
	,convert(int, current_value) as currentValue
	,convert(int, increment) as increment
	,convert(int, last_used_value) as lastUsedValue
from sys.sequences
GO
