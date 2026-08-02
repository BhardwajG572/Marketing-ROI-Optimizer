/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'maven_DB' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'maven_DB' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'maven_DB' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'maven_DB')
BEGIN
    ALTER DATABASE maven_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE maven_DB;
END;
GO

-- Create the 'maven_DB' database
CREATE DATABASE maven_DB;
GO

USE maven_DB;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
