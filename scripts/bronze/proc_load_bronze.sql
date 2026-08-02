
/*

=======================================================================

Stored Procedure : Load Bronze Layer (Source --> Bronze) 

======================================================================

Script Purpose:
	This stored procedure loads data into the 'bronze' schema from external csv files.
	It performs the following actions.
	- Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
	None.
		This stored procedure does not accept any parameters or return any values.

Usuage Example:
	EXEC bronze.load_bronze



*/

EXEC bronze.load_bronze;


CREATE or ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME , @end_time DATETIME
	BEGIN TRY
	

		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		set @start_time = GETDATE(); 

		PRINT '>> Truncating Table: bronze.marketing_data'

		TRUNCATE TABLE bronze.marketing_data;

		PRINT '>> Inserting Data Into : Bronze.marketing_data'
		
		BULK INSERT bronze.marketing_data

		FROM 'C:\Users\.m\Downloads\Marketing_Data_Maven_Marketing_challenges\marketing_data.csv'

		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		set @end_time = GETDATE() ; 

		PRINT '>> Load Duration: '  + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + ' seconds' ;
        PRINT '>> ------------------------------------------------------------';

    END TRY
    BEGIN CATCH
        PRINT '================================================';
        PRINT 'ERROR OCCURRED DURING LOAD';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT '================================================';
    END CATCH
END;
GO
