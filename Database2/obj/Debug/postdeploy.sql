/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO Quotes AS Target 
USING (VALUES 
        (1, 'DYR', 'Sale Person','Random desc about quote', '2022-01-02','New')

) 
AS Source (QuoteId, QuoteType, Contact,Task,DueDate,TaskType) 
ON Target.QuoteId = Source.QuoteId 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (QuoteId,QuoteType, Contact,Task,DueDate,TaskType) 
VALUES (QuoteId,QuoteType, Contact,Task,DueDate,TaskType);
GO
