-- BDAT 605: Database Principles 

/* 
Write a script that 
(1) creates a login ID named "AAaron" with the password "aaar9999"; 
(2) sets the default database for the login to the AP database; 
(3) creates a user named "Aaron" for the login; 
(4) assigns the user to the PaymentEntry role you created in exercise 1.
*/

USE AP;
GO

CREATE LOGIN AAaron WITH PASSWORD = 'aaar9999',
	DEFAULT_DATABASE = AP;

CREATE USER Aaron
	FOR LOGIN AAaron;

ALTER ROLE PaymentEntry ADD MEMBER Aaron;