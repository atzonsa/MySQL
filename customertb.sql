DELIMITER //

Create Table Customer
(
	CustomerID int AUTO_INCREMENT PRIMARY KEY,
	Name Varchar(100) NOT NULL DEFAULT '',
	Address Varchar(500) NOT NULL DEFAULT '',
	CityID int NOT NULL DEFAULT 1,
	PinCode Varchar(100) NOT NULL DEFAULT '',
	Balance Decimal(12,2) NOT NULL DEFAULT 0,
	Photo LongBlob,
	PhotoExtension Varchar(10) NOT NULL DEFAULT '',
	Description Varchar(500) NOT NULL DEFAULT '',
	Published Boolean NOT NULL DEFAULT 1,
	UserID int NOT NULL DEFAULT 1,
	CreatedOn Datetime NOT NULL DEFAULT Current_Time(),
	UpdatedOn Datetime NOT NULL DEFAULT Current_Time(),
	FOREIGN KEY (CityID) REFERENCES City(CityID),
	FOREIGN KEY (UserID) REFERENCES User(UserID)
);

//

//

DELIMITER //

Insert Into Customer(CustomerID, Name, Address, CityID, PinCode, Balance, Photo, PhotoExtension, Description, Published, UserID, CreatedOn, UpdatedOn) 
				Values(1001, '', '', 1, '', 0, null, '', '', 0, 1, Current_Time(), Current_Time());

//


DELIMITER //

Create Procedure GetCustomerByID (IN pCustomerID INT)
	Begin
		Select * from Customer where CustomerID = pCustomerID;
	End

//


DELIMITER //
 
CREATE PROCEDURE GetAllCustomers(IN showAll Boolean)
	BEGIN
    	IF showAll = 1 THEN
    		SELECT * FROM Customer;
    	ELSE
    		SELECT * FROM Customer
    		where Published = 1;
    	END IF;	
	END 

// 
 

DELIMITER //

Create Procedure InsertCustomer
(
	IN pName Varchar(100),
	IN pAddress Varchar(100),
	IN pCityID int,
	IN pPinCode Varchar(100),
	IN pBalance Decimal(12,2),
	IN pPhoto LongBlob,
	IN pPhotoExtension Varchar(10),
	IN pDescription Varchar(500),
	IN pPublished Boolean,
	IN pUserID int,
	IN pCreatedOn Datetime,
	IN pUpdatedOn Datetime
)
	Begin
		INSERT INTO Customer(Name, Address, CityID, PinCode, Balance, Photo, PhotoExtension, Description, Published, UserID, CreatedOn, UpdatedOn) 
					VALUES (pName, pAddress, pCityID, pPinCode, pBalance, pPhoto, pPhotoExtension, pDescription, pPublished, pUserID, pCreatedOn, pUpdatedOn);
		
		Select * from Customer where CustomerID = (Select LAST_INSERT_ID()); 

	End

//


DELIMITER //

Create Procedure UpdateCustomer
(
	IN pCustomerID int,
	IN pName Varchar(100),
	IN pAddress Varchar(100),
	IN pCityID int,
	IN pPinCode Varchar(100),
	IN pBalance Decimal(12,2),
	IN pPhoto LongBlob,
	IN pPhotoExtension Varchar(10),
	IN pDescription Varchar(500),
	IN pPublished Boolean,
	IN pUserID int,
	IN pUpdatedOn Datetime
)
	Begin
		UPDATE Customer
		SET Name = pName,  
			Address = pAddress,
			CityID = pCityID,
			PinCode = pPinCode,
			Balance = pBalance,
			Photo = pPhoto,
			PhotoExtension = pPhotoExtension,
			Description = pDescription, 
			Published = pPublished, 
			UserID = pUserID, 
			UpdatedOn = pUpdatedOn
		where CustomerID = pCustomerID;
		
		Select * from Customer where CustomerID = pCustomerID; 

	End

//


DELIMITER //

Create Procedure DeleteCustomer (IN pCustomerID INT)
	Begin
		Delete from Customer where CustomerID = pCustomerID;
	End

//


DELIMITER //

Create Procedure GetNextCustomerID ()
	Begin
		SELECT AUTO_INCREMENT CustomerID
		FROM information_schema.TABLES
		WHERE TABLE_SCHEMA = 'GeneralStore'
		AND TABLE_NAME = 'Customer';
	End

//