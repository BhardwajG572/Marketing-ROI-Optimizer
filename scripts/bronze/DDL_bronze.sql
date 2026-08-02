/*

=================================================================================

DDL Script : Create Bronze Table

=================================================================================
Script Purpose : 
	This script creates tables in the 'bronze' schema, dropping existing tables
	if they already exist.
		Run this script to re-define the DDL structure of 'bronze' Table
==================================================================================

*/


-- Create the schema if it does not exist

IF OBJECT_ID('bronze.marketing_data','U') IS NOT NULL
	DROP TABLE bronze.marketing_data;
GO

CREATE TABLE bronze.marketing_data(
	ID                    INT PRIMARY KEY , 
	YEAR_BIRTH            NVARCHAR(50) , 
	EDUCATION	            NVARCHAR(50) ,
	Marital_Status        NVARCHAR(50) , 
	Income                DECIMAL(15, 2),
	Kidhome               INT , 
	Teenhome              INT ,
	Dt_Customer           NVARCHAR(50) , 
	Recency               INT , 
	MntWines              INT , 
	MntFruits             INT  , 
	MntMeatProducts       INT , 
	MntFishProducts       INT , 
	MntSweetProducts      INT  ,
	MntGoldProds          INT  ,
	NumDealsPurchases     INT , 
	NumWebPurchases       INT , 
	NumCatalogPurchases   INT ,
	NumStorePurchases     INT , 
	NumWebVisitsMonth     INT , 
	AcceptedCmp3          INT ,  
	AcceptedCmp4          INT ,
	AcceptedCmp5          INT , 
	AcceptedCmp1          INT , 
	AcceptedCmp2          INT , 
	Response              INT ,
	Complain              INT , 
	Country               NVARCHAR(50)

);
GO

