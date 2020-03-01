DELIMITER //

Create Table User
(
	UserID int AUTO_INCREMENT PRIMARY KEY,
	UserName Varchar(100) NOT NULL DEFAULT '',
	Password Varchar(100) NOT NULL DEFAULT '',
	Description Varchar(500) NOT NULL DEFAULT '',
	Published Boolean NOT NULL DEFAULT 1,
	CreatedOn Datetime NOT NULL DEFAULT Current_Time(),
	UpdatedOn Datetime NOT NULL DEFAULT Current_Time()
);

//

DELIMITER //

Insert Into User(Username, Password, Description, Published, CreatedOn, UpdatedOn) Values('', '', '', 0, Current_Time(), Current_Time());

//


DELIMITER //

Create Procedure GetUserByID (IN pUserID INT)
	Begin
		Select * from User where UserID = pUserID;
	End

//


DELIMITER //
 
CREATE PROCEDURE GetAllUsers()
	BEGIN
    	SELECT * FROM User;
	END 

//


DELIMITER //

Create Procedure InsertUser
(
	IN pUserName Varchar(100),
	IN pPassword Varchar(100),
	IN pDescription Varchar(500),
	IN pPublished Boolean,
	IN pCreatedOn Datetime,
	IN pUpdatedOn Datetime
)
	Begin
		INSERT INTO User(UserName, Password, Description, Published, CreatedOn, UpdatedOn) 
		VALUES (pUserName, pPassword, pDescription, pPublished, pCreatedOn, pUpdatedOn);
		
		Select * from User where UserID = (Select LAST_INSERT_ID()); 

	End

//


DELIMITER //

Create Procedure UpdateUser
(
	IN pUserID int,
	IN pUserName Varchar(100),
	IN pPassword Varchar(100),
	IN pDescription Varchar(500),
	IN pPublished Boolean,
	IN pUpdatedOn Datetime
)
	Begin
		UPDATE User
		SET UserName = pUserName, 
			Password = pPassword, 
			Description = pDescription, 
			Published = pPublished, 
			UpdatedOn = pUpdatedOn
		where UserID = pUserID;
		
		Select * from User where UserID = pUserID; 

	End

//


DELIMITER //

Create Procedure DeleteUser (IN pUserID INT)
	Begin
		Delete from User where UserID = pUserID;
	End

//


DELIMITER //

Create Procedure GetNextUserID ()
	Begin
		SELECT AUTO_INCREMENT UserID
		FROM information_schema.TABLES
		WHERE TABLE_SCHEMA = 'GeneralStore'
		AND TABLE_NAME = 'User';
	End

//


DELIMITER //

Create Procedure GetUserByUserNameAndPassword 
(
	IN pUserName Varchar(100),
	IN pPassword Varchar(100)
)
	Begin
		SELECT * from User
		where UserName = pUserName AND Password = pPassword;
	End

//