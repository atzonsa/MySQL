DELIMITER //

Create Table City
(
	CityID int AUTO_INCREMENT PRIMARY KEY,
	Name Varchar(100) NOT NULL DEFAULT '',
	StateName Varchar(100) NOT NULL DEFAULT '',
	Description Varchar(500) NOT NULL DEFAULT '',
	Published Boolean NOT NULL DEFAULT 1,
	UserID int NOT NULL DEFAULT 1,
	CreatedOn Datetime NOT NULL DEFAULT Current_Time(),
	UpdatedOn Datetime NOT NULL DEFAULT Current_Time(),
	FOREIGN KEY (UserID) REFERENCES User(UserID)
);

//

DELIMITER //

Insert Into City(Name,StateName,Description,Published,UserID,CreatedOn,UpdatedOn) Values('', '', '', 0, 1, Current_Time(), Current_Time());

//


DELIMITER //

Create Procedure GetCityByID (IN pCityID INT)
	Begin
		Select * from City where CityID = pCityID;
	End

//


DELIMITER //
 
CREATE PROCEDURE GetAllCitys(IN showAll Boolean)
	BEGIN
    	IF showAll = 1 THEN
    		SELECT * FROM City;
    	ELSE
    		SELECT * FROM City
    		where Published = 1;
    	END IF;	
	END 

//

DELIMITER //

Create Procedure InsertCity
(
	IN pName Varchar(100),
	IN pStateName Varchar(100),
	IN pDescription Varchar(500),
	IN pPublished Boolean,
	IN pUserID int,
	IN pCreatedOn Datetime,
	IN pUpdatedOn Datetime
)
	Begin
		INSERT INTO City(Name, StateName, Description, Published, UserID, CreatedOn, UpdatedOn) 
		VALUES (pName, pStateName, pDescription, pPublished, pUserID, pCreatedOn, pUpdatedOn);
		
		Select * from City where CityID = (Select LAST_INSERT_ID()); 

	End

//


DELIMITER //

Create Procedure UpdateCity
(
	IN pCityID int,
	IN pName Varchar(100),
	IN pStateName Varchar(100),
	IN pDescription Varchar(500),
	IN pPublished Boolean,
	IN pUserID int,
	IN pUpdatedOn Datetime
)
	Begin
		UPDATE City
		SET Name = pName,  
			StateName = pStateName,
			Description = pDescription, 
			Published = pPublished, 
			UserID = pUserID, 
			UpdatedOn = pUpdatedOn
		where CityID = pCityID;
		
		Select * from City where CityID = pCityID; 

	End
		
//


DELIMITER //

Create Procedure DeleteCity (IN pCityID INT)
	Begin
		Delete from City where CityID = pCityID;
	End

//


DELIMITER //

Create Procedure GetNextCityID ()
	Begin
		SELECT AUTO_INCREMENT CityID
		FROM information_schema.TABLES
		WHERE TABLE_SCHEMA = 'GeneralStore'
		AND TABLE_NAME = 'City';
	End

//