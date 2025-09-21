CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME , @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=======================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=======================================================================';

		PRINT '-----------------------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		from 'C:\Users\Geudis\OneDrive\Desktop\APRENDIENDO\SQL\WAREHOUSE\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ---------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Inserting Data Into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		from 'C:\Users\Geudis\OneDrive\Desktop\APRENDIENDO\SQL\WAREHOUSE\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ---------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT 'Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		from 'C:\Users\Geudis\OneDrive\Desktop\APRENDIENDO\SQL\WAREHOUSE\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ---------------';


		PRINT '---------------------------------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '---------------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT 'Inserting Data Into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		from 'C:\Users\Geudis\OneDrive\Desktop\APRENDIENDO\SQL\WAREHOUSE\FUENTE_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ---------------';
				
		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT 'Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		from 'C:\Users\Geudis\OneDrive\Desktop\APRENDIENDO\SQL\WAREHOUSE\FUENTE_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ---------------';		

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE  bronze.erp_px_cat_g1v2;
		PRINT 'Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		from 'C:\Users\Geudis\OneDrive\Desktop\APRENDIENDO\SQL\WAREHOUSE\FUENTE_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ---------------';		

		SET @batch_end_time = GETDATE();
		PRINT '============================================================================================';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT'      -Total Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '============================================================================================';	
		END TRY 
		BEGIN CATCH
			PRINT '================================================'
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
			PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
			PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
			PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
			PRINT '================================================'
		END CATCH
	END
