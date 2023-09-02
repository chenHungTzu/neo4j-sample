DECLARE @NAME NVARCHAR(30) = N'¬Yµo®i¸sA';

WITH CTE(NodeID, ParentNodeID, [Name] ,[Level]) AS   
(  
    SELECT 
		M.NodeID ,
		M.ParentNodeID ,
		M.Name, 
		1 AS ChildLevel
    FROM [Sample].[dbo].[Self_Relation] M
    UNION ALL	
    SELECT 
		Children.NodeID,
		F.ParentNodeID, 
		Children.Name ,	
		Children.[Level] + 1  
    FROM [Sample].[dbo].[Self_Relation] AS F	
        INNER JOIN CTE AS Children
        ON F.NodeID = Children.ParentNodeID
)  
SELECT *   
FROM CTE
WHERE ParentNodeID = (
						SELECT NodeID 
						FROM [Sample].[dbo].[Self_Relation]
						WHERE [NAME] = @NAME
					 )
ORDER BY [Level] 