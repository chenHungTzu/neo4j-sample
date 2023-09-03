BEGIN
DECLARE @LeftNode INT;
DECLARE	@RightNode INT;
DECLARE @NAME NVARCHAR(30) = N'某發展群A';

	SELECT 
		@LeftNode = LeftNode,
		@RightNode = RightNode
	FROM [Sample].[dbo].[Node_Relation]
	WHERE [Name] = @NAME 

SELECT * FROM [Sample].[dbo].[Node_Relation]
	WHERE LeftNode > @LeftNode 
	AND RightNode < @RightNode 
END