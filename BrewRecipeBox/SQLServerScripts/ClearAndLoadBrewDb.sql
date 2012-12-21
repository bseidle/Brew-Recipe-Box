USE [BrewDb]
GO

USE [BrewDb]
GO

INSERT INTO [dbo].[IngredientType]
           ([IngredientSubTypeId]
           ,[IngredientTypeName])
     VALUES
           --(<IngredientSubTypeId, int,>
           --,<IngredientTypeName, varchar(50),>)
		   (1,'Yeast'),
		   (2,'Hop'),
		   (3,'Malt')
		   /*(2,'Yeast'),
		   (3,'Yeast'),
		   (4,'Hop'),
		   (5,'Hop'),
		   (6,'Hop'),
		   (7,'Malt'),
		   (8,'Malt'),
		   (9,'Malt')*/
GO

INSERT INTO [dbo].[IngredientSubType]
           ([IngredientSubTypeName],[IngredientTypeId])
     VALUES
--           (<IngredientSubTypeName, varchar(50)>, <IngredientTypeId, int>)
			('Liquid Culture',1)
			,('Dry Yeast',1)
			,('Slap Pack',1)
			,('Hop Cone',2)
			,('Hop Oil',2)
			,('Hop Pellet',2)
			,('Liquid Malt Extract',3)
			,('Dry Malt Extract',3)
			,('Grain',3)
GO


INSERT INTO [dbo].[IngredientTypeProperties]
           ([IngredientTypeId]
           ,[IngredientTypePropertyName])
     VALUES
           --(<IngredientTypeId, int,>
           --,<IngredientTypePropertyName, varchar(50),>)
		   (1,'Attenuation Min')
		   ,(1,'Attenuation Max')
		   ,(1,'Temperature Min')
		   ,(1,'Temperature Max')
		   /*,(2,'Attenuation Min')
		   ,(2,'Attenuation Max')
		   ,(2,'Temperature Min')
		   ,(2,'Temperature Max')
		   ,(3,'Attenuation Min')
		   ,(3,'Attenuation Max')
		   ,(3,'Temperature Min')
		   ,(3,'Temperature Max')
		   */
		   ,(2,'Alpha Acid Min')
		   ,(2,'Alpha Acid Max')
		   ,(2,'Beta Acid Min')
		   ,(2,'Beta Acid Max')
		   /*
		   ,(4,'Alpha Acid Min')
		   ,(4,'Alpha Acid Max')
		   ,(4,'Beta Acid Min')
		   ,(4,'Beta Acid Max')
		   ,(5,'Alpha Acid Min')
		   ,(5,'Alpha Acid Max')
		   ,(5,'Beta Acid Min')
		   ,(5,'Beta Acid Max')
		   ,(6,'Alpha Acid Min')
		   ,(6,'Alpha Acid Max')
		   ,(6,'Beta Acid Min')
		   ,(6,'Beta Acid Max')
		   */
		   ,(3,'Lovibond Min')
		   ,(3,'Lovibond Max')
		   ,(3,'Plato Min')
		   ,(3,'Plato Max')
		   /*
		   ,(7,'Lovibond Min')
		   ,(7,'Lovibond Max')
		   ,(7,'Plato Min')
		   ,(7,'Plato Max')
		   ,(8,'Lovibond Min')
		   ,(8,'Lovibond Max')
		   ,(8,'Plato Min')
		   ,(8,'Plato Max')		   
		   ,(9,'Lovibond Min')
		   ,(9,'Lovibond Max')
		   ,(9,'Plato Min')
		   ,(9,'Plato Max')
		   */
GO
INSERT INTO [dbo].[Ingredient]
           ([IngredientTypeId]
           ,[IngredientName])
     VALUES
           --(<IngredientTypeId, int,>
           --,<IngredientName, varchar(50),>)
		   (1, 'Wyeast English Ale Yeast')
		   ,(2, 'Cascade Whole Hop')
		   ,(3, 'Marris Otter')
GO

INSERT INTO [dbo].[IngredientProperties]
           ([IngredientId]
           ,[IngredientPropertyValue]
           ,[IngredientTypePropertyId])
     VALUES
           --(<IngredientId, int,>
           --,<IngredientPropertyValue, decimal(18,0),>
           --,<IngredientTypePropertyId, int,>)
		   (3, 7.5, 10)--Malt, Lovibond Max 
		   ,(3, 5.5, 9)--Malt, Lovibond Min
		   ,(3, 9.5, 12)--Malt, Plato Max
		   ,(3, 8.2, 11)--Malt, Plato Min
		   ,(2, 12, 6)--Hop, Alpha Max
		   ,(2, 8, 5)--Hop, Alpha Min
		   ,(1, 85, 4)-- Yeast, Temp Max
		   ,(1, 75, 3)-- Yeast, Temp Min
		   ,(1, 70, 2)-- Yeast, Attenuation Max
		   ,(1, 65, 1)-- Yeast, Attenuation Min

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

INSERT INTO [dbo].[UserSettings]
           ([UserSettingKey]
           ,[UserSettingValue]
           ,[UserId])
     VALUES
			('IBU_Calculator','RAGER',1),
			('SRM_Calculator','MOSHER',1)
GO

INSERT INTO [dbo].[Recipe]
           ([RecipeName]
           ,[UserId])
     VALUES
           ('Brown Ale'
           ,1)
GO

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






