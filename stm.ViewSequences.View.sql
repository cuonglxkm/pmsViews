ALTER view [stm].[ViewSequences] AS
select name
	,convert(int, current_value) as currentValue
	,convert(int, increment) as increment
	,convert(int, last_used_value) as lastUsedValue
from sys.sequences
GO
