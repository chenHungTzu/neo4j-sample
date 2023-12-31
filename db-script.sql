USE [Sample]
GO
/****** Object:  Table [dbo].[Node_Relation]    Script Date: 2023/9/3 上午 03:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Node_Relation](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[LeftNode] [int] NOT NULL,
	[RightNode] [int] NOT NULL,
 CONSTRAINT [PK_Node_Relation] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Self_Relation]    Script Date: 2023/9/3 上午 03:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Self_Relation](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[ParentNodeID] [int] NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Self_Relation] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Node_Relation] ON 

INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (1, N'統智科技', 1, 28)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (2, N'某發展群A', 6, 27)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (3, N'某發展群B', 2, 5)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (4, N'OP課', 11, 26)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (5, N'PSCS課', 7, 10)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (6, N'POS課', 3, 4)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (7, N'開發Group', 12, 21)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (8, N'維護Team', 22, 23)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (9, N'優化Team', 15, 16)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (10, N'架構Team', 19, 20)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (11, N'康是美POS', 8, 9)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (12, N'開發Team', 13, 14)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (13, N'需求Team', 24, 25)
INSERT [dbo].[Node_Relation] ([NodeID], [Name], [LeftNode], [RightNode]) VALUES (14, N'測試Team', 17, 18)
SET IDENTITY_INSERT [dbo].[Node_Relation] OFF
GO
SET IDENTITY_INSERT [dbo].[Self_Relation] ON 

INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (1, NULL, N'統智科技')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (2, 1, N'某發展群A')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (3, 1, N'某發展群B')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (4, 2, N'OP課')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (5, 2, N'PSCS課')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (6, 3, N'POS課')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (7, 4, N'開發Group')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (8, 4, N'維護Team')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (9, 7, N'優化Team')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (10, 7, N'架構Team')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (11, 5, N'康是美POS')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (12, 7, N'開發Team')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (13, 4, N'需求Team')
INSERT [dbo].[Self_Relation] ([NodeID], [ParentNodeID], [Name]) VALUES (14, 7, N'測試Team')
SET IDENTITY_INSERT [dbo].[Self_Relation] OFF
GO
ALTER TABLE [dbo].[Self_Relation]  WITH CHECK ADD  CONSTRAINT [FK_Self_Relation_Self_Relation] FOREIGN KEY([ParentNodeID])
REFERENCES [dbo].[Self_Relation] ([NodeID])
GO
ALTER TABLE [dbo].[Self_Relation] CHECK CONSTRAINT [FK_Self_Relation_Self_Relation]
GO
