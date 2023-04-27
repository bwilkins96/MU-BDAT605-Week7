-- BDAT 605: Database Principles 

/* 
Write a script that removes the user-defined database role named PaymentEntry.

(Hint: This script should begin by removing all users from this role.)
*/

USE AP;
GO

ALTER ROLE PaymentEntry DROP MEMBER Aaron;
ALTER ROLE PaymentEntry DROP MEMBER BBrown;
ALTER ROLE PaymentEntry DROP MEMBER CChaplin;
ALTER ROLE PaymentEntry DROP MEMBER DDyer;
ALTER ROLE PaymentEntry DROP MEMBER EEbbers;
ALTER ROLE PaymentEntry DROP MEMBER FFalk;

DROP ROLE PaymentEntry;