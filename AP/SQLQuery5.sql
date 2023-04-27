-- BDAT 605: Database Principles 

/*
Write a script that 
(1) creates a schema named Admin, 
(2) transfers the table named ContactUpdates from the dbo schema to the Admin schema, 
(3) assigns the Admin schema as the default schema for the user named Aaron that you created in exercise 2, 
(4) grants all standard privileges except for REFERENCES and ALTER to AAaron for the Admin schema.
*/

USE AP;
GO

CREATE SCHEMA Admin;
GO

ALTER SCHEMA Admin TRANSFER dbo.ContactUpdates;

ALTER USER Aaron WITH
	DEFAULT_SCHEMA = Admin;

GRANT SELECT, UPDATE, INSERT, DELETE, EXECUTE
	ON SCHEMA :: Admin
TO Aaron;