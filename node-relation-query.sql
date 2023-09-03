
DECLARE @LeftNode INT;
DECLARE	@RightNode INT;

	SELECT 
		@LeftNode = LeftNode,
		@RightNode = RightNode
	FROM [Sample].[dbo].[Node_Relation]
	WHERE [Name] = N'某發展群A'

SELECT * FROM [Sample].[dbo].[Node_Relation]
	WHERE LeftNode > @LeftNode 
	AND RightNode < @RightNode 
