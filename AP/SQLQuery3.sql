-- BDAT 605: Database Principles 

/* 
Write a script that creates four login IDs based on the contents of a new table called NewLogins:
CREATE TABLE NewLogins
(LoginName varchar (128));
INSERT NewLogins
VALUES ('BBrown'), ('CChaplin'), ('DDyer'), ('EEbbers');

Use dynamic SQL and a cursor to perform four actions for each row in this table: 
(1) create a login with a temporary password based on the first four letters of the login name followed by "9999"; 
(2) set the default database to the AP database; 
(3) create a user for the login with the same name as the login;
(4) assign the user to the PaymentEntry role you created in exercise 1.
*/

USE AP;
GO

-- Create NewLogins Table
CREATE TABLE NewLogins
(LoginName varchar (128));

INSERT NewLogins
VALUES ('BBrown'), ('CChaplin'), ('DDyer'), ('EEbbers');
GO

-- Cursor setup and run
DECLARE @DynamicSQL varchar(256),
	    @LoginName varchar(128),
		@TempPassword varchar(25);

DECLARE Login_Cur CURSOR
DYNAMIC
FOR 
	SELECT DISTINCT LoginName
	FROM NewLogins;

OPEN Login_Cur;
FETCH NEXT FROM Login_Cur 
	INTO @LoginName;

WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @TempPassword = LEFT(@LoginName, 4) + '9999';
		
		SET @DynamicSQL = 'CREATE LOGIN ' + @LoginName + ' WITH PASSWORD =''' + @TempPassword +
							''', DEFAULT_DATABASE = AP';
		EXEC (@DynamicSQL);

		SET @DynamicSQL = 'CREATE USER ' + @LoginName + ' FOR LOGIN ' + @LoginName;
		EXEC (@DynamicSQL);

		SET @DynamicSQL = 'ALTER ROLE PaymentEntry ADD MEMBER ' + @LoginName;
		EXEC (@DynamicSQL);

		FETCH NEXT FROM Login_Cur
			INTO @LoginName;
	END;

CLOSE Login_Cur;