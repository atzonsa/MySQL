DELIMITER //

Create Table HSNCode
(
	HSNCodeID int AUTO_INCREMENT PRIMARY KEY,
	Name Varchar(100) NOT NULL DEFAULT '',
	Description Varchar(500) NOT NULL DEFAULT '',
	Published Boolean NOT NULL DEFAULT 1,
	UserID int NOT NULL DEFAULT 1,
	CreatedOn Datetime NOT NULL DEFAULT Current_Time(),
	UpdatedOn Datetime NOT NULL DEFAULT Current_Time(),
	FOREIGN KEY (UserID) REFERENCES User(UserID)
);

//