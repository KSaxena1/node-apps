-- CREATE NEW DATABASE WITH DEFAULT SETTINGS
--      THIS IS ALL WE NEED AT THIS POINT
USE [MASTER]
create database [coffeenbooks];
GO

CREATE TABLE coffeenbooks.[dbo].[books]
(
    [bookId] [varchar](20) NOT NULL,
    [title] [varchar](60) NULL,
    [author] [varchar](60) NULL,
    [rating] [smallint] NULL
        PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO coffeenbooks.[dbo].books
VALUES
    ('A1111', 'Moby Dick', 'Herman Melville', 10);
INSERT INTO coffeenbooks.[dbo].books
VALUES
    ('A2222', 'Get Rich Really Fast', 'Ima Scammer', 1);
INSERT INTO coffeenbooks.[dbo].books
VALUES
    ('A3333', 'Finding Inner Peace', 'Serenity Blissford', null);
INSERT INTO coffeenbooks.[dbo].books
VALUES
    ('A4444', 'Great Mystery Stories', 'Rodney Whodunit', 5);
INSERT INTO coffeenbooks.[dbo].books
VALUES
    ('A5555', 'Software Wizardry', 'D. Abugov', 10);



