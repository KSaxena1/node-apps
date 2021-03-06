-- CREATE A NEW API USER ON THE DB
CREATE LOGIN [coffeenbooksapi]
	WITH PASSWORD = N'coffeenbooks'
		, DEFAULT_DATABASE = [master]
		, DEFAULT_LANGUAGE = [us_english]
		, CHECK_EXPIRATION = OFF
		, CHECK_POLICY = OFF
GO

ALTER LOGIN [coffeenbooksapi] ENABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [coffeenbooksapi]
GO

-- CONNECT THE DB WITH THE NEWLY CREATED USER TO PERFORM THE REST OF THE ACTIONS

-- CREATE NEW DATABASE WITH DEFAULT SETTINGS
--      THIS IS ALL WE NEED AT THIS POINT
USE [MASTER]
create database [coffeenbooks];
GO

-- CREATE TABLE BOOKS FOR ALL THE TITLES WITH INVENTORY

CREATE TABLE coffeenbooks.[dbo].[books]
(
	[bookId] [int] NOT NULL
	,
	[title] [varchar](60) NULL
	,
	[author] [varchar](60) NULL
	,
	[rating] [smallint] NULL
	,
	[qtyAtHand] [int] NOT NULL 
	,
	[Price] [decimal](4, 2) NOT NULL PRIMARY KEY CLUSTERED ([bookId] ASC) WITH (
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
		2001
	, 'Moby Dick'
	, 'Herman Melville'
	, 10
	, 12
	, 18.50
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
	(
		2002
	, 'Get Rich Really Fast'
	, 'Ima Scammer'
	, 1
	, 4
	, 9.99
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
	(
		2003
	, 'Finding Inner Peace'
	, 'Serenity Blissford'
	, NULL
	, 15
	, 12.99
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
	(
		2004
	, 'Great Mystery Stories'
	, 'Rodney Whodunit'
	, 5
	, 10
	, 14.49
	);

INSERT INTO coffeenbooks.[dbo].books
VALUES
	(
		2005
	, 'Software Wizardry'
	, 'D. Abugov'
	, 10
	, 15
	, 21.00
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


-- CREATE ORDER table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order]
(
	[orderId] [int] identity (1,1) NOT NULL,
	[name] [varchar](30) NULL,
	[subtotal] [decimal](4, 2) NOT NULL,
	[tax] [decimal](4, 2) NOT NULL,
	[total] [decimal](4, 2) NOT NULL,
	item varchar(max) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order] ADD PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO