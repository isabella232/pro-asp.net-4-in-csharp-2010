USE Northwind

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CountEmployees]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CountEmployees]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteEmployee]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteEmployee]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAllEmployees]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAllEmployees]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetEmployee]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetEmployee]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetEmployeesByPage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetEmployeesByPage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertEmployee]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertEmployee]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateEmployee]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateEmployee]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetEmployeePage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetEmployeePage]
GO

CREATE PROCEDURE CountEmployees
AS
SELECT COUNT(EmployeeID) FROM Employees
GO


CREATE PROCEDURE DeleteEmployee
@EmployeeID	      int
AS

DELETE FROM Employees WHERE EmployeeID = @EmployeeID
GO


CREATE PROCEDURE GetAllEmployees
AS
SELECT EmployeeID, FirstName, LastName, TitleOfCourtesy FROM Employees
GO


CREATE PROCEDURE GetEmployee
@EmployeeID	  int
AS
SELECT EmployeeID, FirstName, LastName, TitleOfCourtesy FROM Employees
  WHERE EmployeeID = @EmployeeID
GO


CREATE PROCEDURE GetEmployeePage
@Start int, @Count int
AS
-- create a temporary table with the columns we are interested in
CREATE TABLE #TempEmployees
(
ID int IDENTITY PRIMARY KEY,
EmployeeID int,
LastName nvarchar(20),
FirstName nvarchar(10),
TitleOfCourtesy nvarchar(25),
)
-- fill the temp table with all the employees
INSERT INTO #TempEmployees
(
EmployeeID, LastName, FirstName, TitleOfCourtesy
)
SELECT
EmployeeID, LastName, FirstName, TitleOfCourtesy
FROM
Employees ORDER BY EmployeeID ASC
-- declare two variables to calculate the range of records
-- to extract for the specified page
DECLARE @FromID int
DECLARE @ToID int
-- calculate the first and last ID of the range of records we need
SET @FromID = @Start
SET @ToID = @Start + @Count - 1
-- select the page of records
SELECT * FROM #TempEmployees WHERE ID >= @FromID AND ID <= @ToID
GO

CREATE PROCEDURE InsertEmployee
@TitleOfCourtesy varchar(25),
@LastName        varchar(20),
@FirstName       varchar(10),
@EmployeeID	      int OUTPUT
AS

INSERT INTO Employees
  (TitleOfCourtesy, LastName, FirstName, HireDate) 
  VALUES (@TitleOfCourtesy, @LastName, @FirstName, GETDATE());

SET @EmployeeID = @@IDENTITY
GO

CREATE PROCEDURE UpdateEmployee
@EmployeeID int,
@TitleOfCourtesy varchar(25),
@LastName varchar(20),
@FirstName varchar(10)
AS
UPDATE Employees
SET TitleOfCourtesy = @TitleOfCourtesy,
LastName = @LastName,
FirstName = @FirstName
WHERE EmployeeID = @EmployeeID
GO
