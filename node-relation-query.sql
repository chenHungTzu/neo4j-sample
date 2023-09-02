
DECLARE @LeftNode INT;
DECLARE	@RightNode INT;

	SELECT 
		@LeftNode = LeftNode,
		@RightNode = RightNode
	FROM [Sample].[dbo].[Node_Relation]
	WHERE [Name] = N'¬Yµo®i¸sA'

SELECT * FROM [Sample].[dbo].[Node_Relation]
	WHERE LeftNode > @LeftNode 
	AND RightNode < @RightNode 
