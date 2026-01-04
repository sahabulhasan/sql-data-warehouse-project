/* ============================================================
   Database Initialization Script
   Project: Data Warehouse and Analytics
   Purpose: Create the Data Warehouse database and 
            organize schemas following the Medallion Architecture
   ============================================================ */
--Drop and re create the 'Datawarehouse' Database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name =  'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

-- Switch to the system database to safely create a new database
USE master;
GO

-- Create the Data Warehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

/* ============================================================
   Schema Creation
   ------------------------------------------------------------
   Bronze Schema : Raw ingested data (source-aligned, minimal transformation)
   Silver Schema : Cleaned, validated, and transformed data
   Gold Schema   : Business-ready, aggregated, and analytics-optimized data
   ============================================================ */

-- Create Bronze schema for raw data
CREATE SCHEMA bronze;
GO

-- Create Silver schema for cleansed and transformed data
CREATE SCHEMA silver;
GO

-- Create Gold schema for analytics and reporting
CREATE SCHEMA gold;
GO
