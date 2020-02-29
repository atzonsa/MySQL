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