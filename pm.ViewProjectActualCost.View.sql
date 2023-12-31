ALTER view [pm].[ViewProjectActualCost]
as 
WITH TableTemp(ActualcostId,ProjectId, 
VouchersNumber,costName,vouchersDate,currency,projPhase,exchangeRate,actualCost,projCode,projName,expensesItemName)
AS(
SELECT
	   ac.Id as 'ActualcostId'	
	  ,JSON_VALUE(ac.data, '$.projectId') as 'ProjectId'
	  ,VouchersNumber 
      ,JSON_VALUE(ac.data, '$.costName') as 'costName' 
      ,JSON_VALUE(ac.data, '$.vouchersDate') as 'vouchersDate'
	  ,JSON_VALUE(ac.data, '$.currency') as 'currency'
	  ,isnull(convert(int,JSON_VALUE(ac.data, '$.projPhase')),0) as 'projPhase'
	  ,isnull(convert(decimal,JSON_VALUE(ac.data, '$.exchangeRate')),0) as 'exchangeRate'
	  ,isnull(convert(decimal,JSON_VALUE(ac.data, '$.amountOfMoney')),0) as 'actualCost'
	 -- ,isnull(convert(decimal,JSON_VALUE(ex.data, '$.amountOfMoney')),0) as 'expectedCost'
	  --,(convert(decimal, JSON_VALUE(ac.data, '$.amountOfMoney')) + isnull(convert(decimal, JSON_VALUE(ex.data, '$.amountOfMoney')),0)) as 'totalmoney'
	  --,isnull(convert(decimal, JSON_VALUE(ex.data, '$.amountOfMoney')),0) - isnull(convert(decimal, JSON_VALUE(ac.data, '$.amountOfMoney')),0) as 'imparity'
	  ,isnull(projCode,'') projCode
	  ,projName 
	  --,pr.id as projectID
	  --,ac.Id as ActualcostID
	  ,isnull(JSON_VALUE(expe.data, '$.expensesItemName'),'') as 'expensesItemName'
	  
	  --,projName +' '+ '( '+VouchersNumber+'( '+JSON_VALUE(ex.data, '$.amountOfMoney')COLLATE SQL_Latin1_General_CP1_CI_AI +' )'+' )' as aaa
	  --,pr.projName +'('+JSON_VALUE(ex.data, '$.amountOfMoney')COLLATE SQL_Latin1_General_CP1_CI_AI +')'+')'  AS AAA
	 
  FROM [pm].[ActualCosts] as ac
   --FULL OUTER JOIN [pm].[ExpectedCosts] as ex on JSON_VALUE(ex.data, '$.costName') = JSON_VALUE(ac.data, '$.costName')
   FULL OUTER JOIN [pm].[ProjGeneral] as pr on pr.id COLLATE SQL_Latin1_General_CP1_CI_AI = JSON_VALUE(ac.data, '$.projectId')COLLATE SQL_Latin1_General_CP1_CI_AI
   FULL OUTER JOIN [dm].[ExpensesItem] as expe on expe.id = JSON_VALUE(ac.data, '$.expItenId')
   where JSON_VALUE(ac.data, '$.amountOfMoney') is not null
  )

  SELECT a.*, b.TotalActualcost,c.TotalProjActualcost  FROM TableTemp a INNER JOIN
   (
SELECT sum (actualCost)TotalActualcost, projCode  FROM TableTemp GROUP BY projCode
)b ON a.projCode=b.projCode
INNER JOIN
   (
SELECT Sum(actualCost) TotalProjActualcost, projCode, expensesItemName  FROM TableTemp GROUP BY projCode,expensesItemName
)c ON a.projCode=c.projCode and a.expensesItemName = c.expensesItemName


GO
