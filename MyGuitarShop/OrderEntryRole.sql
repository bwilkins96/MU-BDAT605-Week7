-- BDAT 605: Database Principles 

/* Script that creates a user-defined database role named OrderEntry in the MyGuitarShop database */

USE MyGuitarShop;
GO

CREATE ROLE OrderEntry;

-- Gives INSERT and UPDATE permission to the new role for the Orders and OrderItems table
GRANT INSERT, UPDATE
ON Orders
TO OrderEntry;

GRANT INSERT, UPDATE
ON OrderItems
TO OrderEntry;

-- Gives SELECT permission for all user tables
ALTER ROLE db_datareader ADD MEMBER OrderEntry;