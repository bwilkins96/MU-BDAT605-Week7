-- BDAT 605: Database Principles 

/* 
Write a script that creates a user-defined database role named PaymentEntry in the AP database. 

Give UPDATE permission to the new role for the Invoices table, 
UPDATE and INSERT permission for the InvoiceLineItems table, 
and SELECT permission for all user tables.
*/

USE AP;
GO

CREATE ROLE PaymentEntry;

GRANT UPDATE
ON Invoices
TO PaymentEntry;

GRANT UPDATE, INSERT
ON InvoiceLineItems
To PaymentEntry;

ALTER ROLE db_datareader ADD MEMBER PaymentEntry;
