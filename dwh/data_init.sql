USE master;
GO

-- Drop and recreate the 'AnithaBakeryDW' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'AnithaBakeryDW')
BEGIN
    ALTER DATABASE AnithaBakeryDW SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AnithaBakeryDW;
END;
GO

-- Create the 'AnithaBakeryDW' database
CREATE DATABASE AnithaBakeryDW;
GO

USE AnithaBakeryDW;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO