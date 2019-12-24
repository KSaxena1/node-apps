-- CREATE NEW DATABASE WITH DEFAULT SETTINGS
--      THIS IS ALL WE NEED AT THIS POINT
USE [MASTER]
create database [coffeenbooks];
GO

-- CREATE TABLE BOOKS FOR ALL THE TITLES WITH INVENTORY

CREATE TABLE coffeenbooks.[dbo].[books]
(
    [bookId] [varchar](20) NOT NULL
	,
    [title] [varchar](60) NULL
	,
    [author] [varchar](60) NULL
	,
    [rating] [smallint] NULL
	,
    [qtyAtHand] [int] NOT NULL PRIMARY KEY CLUSTERED ([bookId] ASC) WITH (
		PAD_INDEX = OFF
		, STATISTICS_NORECOMPUTE = OFF
		, IGNORE_DUP_KEY = OFF
		, ALLOW_ROW_LOCKS = ON
		, ALLOW_PAGE_LOCKS = ON
		)
	ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO coffeenbooks.[dbo].books
VALUES
    (
        'A1111'
	, 'Moby Dick'
	, 'Herman Melville'
	, 10
	, 12
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
    (
        'A2222'
	, 'Get Rich Really Fast'
	, 'Ima Scammer'
	, 1
	, 4
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
    (
        'A3333'
	, 'Finding Inner Peace'
	, 'Serenity Blissford'
	, NULL
	, 15
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
    (
        'A4444'
	, 'Great Mystery Stories'
	, 'Rodney Whodunit'
	, 5
	, 10
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
    (
        'A5555'
	, 'Software Wizardry'
	, 'D. Abugov'
	, 10
	, 15
	);


--CREATE A COFFEE DATABASE WITH PRICE AND INVENTORY
CREATE TABLE [coffeenbooks].[dbo].[coffee]
(
    [coffeeId] [int] NOT NULL
	,
    [coffeeName] [varchar](30) NOT NULL
	,
    [pricePerCup] [decimal](4, 2) NOT NULL
	,
    [qtyAvailForCups] [int] NOT NULL PRIMARY KEY CLUSTERED ([coffeeId] ASC) WITH (
		PAD_INDEX = OFF
		, STATISTICS_NORECOMPUTE = OFF
		, IGNORE_DUP_KEY = OFF
		, ALLOW_ROW_LOCKS = ON
		, ALLOW_PAGE_LOCKS = ON
		)
	ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [coffeenbooks].[dbo].[coffee]
VALUES
    (
        1001
	, 'Colombian'
	, 7.99
	, 10
	);

INSERT INTO [coffeenbooks].[dbo].[coffee]
VALUES
    (
        1002
	, 'French Roast'
	, 8.99
	, 10
	);

INSERT INTO [coffeenbooks].[dbo].[coffee]
VALUES
    (
        1003
	, 'Espresso'
	, 9.99
	, 10
	);

INSERT INTO [coffeenbooks].[dbo].[coffee]
VALUES
    (
        1004
	, 'Colombian Decaf'
	, 8.99
	, 10
	);

INSERT INTO [coffeenbooks].[dbo].[coffee]
VALUES
    (
        1005
	, 'French Roast Decaf'
	, 9.99
	, 10
	);
