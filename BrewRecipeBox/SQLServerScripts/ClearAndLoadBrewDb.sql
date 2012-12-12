USE [BrewDb]
GO

print 'deleting from tables';

delete from recipeingredient;
delete from unit;
delete from ingredient;
delete from ingredienttype;
delete from recipe;
delete from [User];
delete from UserRole;

--truncate table [dbo].[RecipeStep];

--truncate table step;

print 'inserting test data'
GO

INSERT INTO [dbo].[IngredientType]
			([Name])
	 VALUES
			('Malt'),
			('Extract'),
			('Yeast'),
			('Hop'),
			('Adjucnt');
GO

INSERT INTO [dbo].[Ingredient]
           ([IngredientName]
           ,[IngredientTypeId]
           ,[IngredientNote]
           ,[Alpha]
           ,[Lovibond]
           ,[Attenuation]
           ,[Misc])		   
     VALUES
           ('Marris Otter'
           ,1
           ,'Specialty Barley'
		   ,Null
		   ,4
		   ,Null
		   ,Null),
		   ('Cascade Hops'
           ,4
           ,'American Hop'
		   ,6.5
		   ,Null
		   ,Null
		   ,Null),
		   ('Wyeast'
           ,3
           ,'Ale Yeast'
		   ,Null
		   ,Null
		   ,Null
		   ,75)
GO

INSERT INTO [dbo].[UserRole]
           ([UserRoleName])
     VALUES
		   ('User'),
           ('Administrator')
GO

INSERT INTO [dbo].[User]
           ([UserName]
           ,[UserPassword]
           ,[UserRoleId])
     VALUES
           ('Ben'
           ,'Test'
           , 1)
GO

INSERT INTO [dbo].[Recipe]
           ([RecipeName]
           ,[UserId])
     VALUES
           ('Brown Ale'
           ,1)
GO
/*

INSERT INTO [dbo].[Recipe]
           ([RecipeName],[UserId])
     VALUES
           ('Brown Ale',1)
*/
GO
INSERT INTO [dbo].[Unit]
           ([UnitName]
           ,[UnitSymbol])
     VALUES
           ('Pound'
           ,'Lb'),
		   ('Ounce'
			,'Oz'),
			('Milliter'
			,'ml')
GO

INSERT INTO [dbo].[RecipeIngredient]
           ([RecipeId]
           ,[IngredientId]
           ,[IngredientQuantity]
           ,[UnitId])
     VALUES
           (1
           ,1
           ,10
           ,1),
		   (1
           ,2
           ,4
           ,2),
		   (1
           ,3
           ,10
           ,3)
GO
/*
INSERT INTO [dbo].[RecipeIngredient]
           ([RecipeId]
           ,[IngredientId]
           ,[IngredientQuantity]
           ,[UnitId])
     VALUES
		   (1
           ,2
           ,4
           ,2)
*/
/*
INSERT INTO [dbo].[RecipeStep]
           ([RecipeId]
           ,[StepId])
     VALUES
           (<RecipeId, int,>
           ,<StepId, int,>)
GO

INSERT INTO [dbo].[Step]
           ([StepName]
           ,[StepTypeId]
           ,[StepNote])
     VALUES
           (<StepName, varchar(50),>
           ,<StepTypeId, int,>
           ,<StepNote, text,>)
GO
*/






