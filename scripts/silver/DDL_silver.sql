/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist. Run this script to re-define the DDL structure.
===============================================================================
*/

IF OBJECT_ID('silver.marketing_data', 'U') IS NOT NULL
    DROP TABLE silver.marketing_data;
GO

CREATE TABLE silver.marketing_data (
    ID                          INT PRIMARY KEY, 
    Year_Birth                  INT, 
    Customer_Generation         NVARCHAR(50),
    Education                   NVARCHAR(50), 
    Marital_Status              NVARCHAR(50), 
    Income                      INT, 
    Total_Dependents            INT,
    Dt_Customer                 DATE,
    Recency                     INT,
    
    -- Original Spending Columns
    MntWines                    INT,
    MntFruits                   INT,
    MntMeatProducts             INT,
    MntFishProducts             INT,
    MntSweetProducts            INT,
    MntGoldProds                INT,
    
    -- Engineered Spending Features
    Total_Spend                 INT,
    Total_Essential_Spend       INT,
    Total_Luxury_Spend          INT,
    
    -- Original Transaction Columns
    NumDealsPurchases           INT,
    NumWebPurchases             INT,
    NumCatalogPurchases         INT,
    NumStorePurchases           INT,
    NumWebVisitsMonth           INT,
    
    -- Engineered Transaction Feature
    Total_Purchases             INT,
    
    -- Original Campaign Columns
    AcceptedCmp1                INT,
    AcceptedCmp2                INT,
    AcceptedCmp3                INT,
    AcceptedCmp4                INT,
    AcceptedCmp5                INT,
    Response                    INT,
    
    -- Other Demographics/Metrics
    Complain                    INT,
    Country                     NVARCHAR(50),
    
    -- Engineered Loyalty Feature
    Total_Campaigns_Accepted    INT,
    
    -- System Audit Column
    ETL_Load_Date               DATETIME DEFAULT GETDATE()
);
GO
