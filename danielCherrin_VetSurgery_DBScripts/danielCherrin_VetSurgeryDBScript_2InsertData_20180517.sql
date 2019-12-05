CREATE DATABASE VetSurgery;
GO

USE [VetSurgery];
GO

CREATE TABLE employee (
	email [NVARCHAR](50) PRIMARY KEY NOT NULL,
	empId [UNIQUEIDENTIFIER] NOT NULL DEFAULT NEWSEQUENTIALID(),
	employeeType [NVARCHAR](50) NOT NULL,
	givenName [NVARCHAR](50) NOT NULL,
	lastName [NVARCHAR](50) NOT NULL,
	addressNo [NVARCHAR](50) NOT NULL,
	addressStreet [NVARCHAR](50) NOT NULL,
	addressPostCode [NVARCHAR](50) NOT NULL,
	addressSuburb [NVARCHAR](50) NOT NULL,
	addressState [NVARCHAR](50) NOT NULL,
	mobPhone [NVARCHAR](50) NOT NULL,
	homePhone [NVARCHAR](50) NULL,
	emergGivenName [NVARCHAR](50) NULL,
	emergLastName [NVARCHAR](50) NULL,
	emergMobPhone [NVARCHAR](50) NULL,
	emergHomePhone [NVARCHAR](50) NULL,
	skills [NVARCHAR](250) NULL
);

CREATE TABLE client (
	clientId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	givenName [NVARCHAR](50) NOT NULL,
	lastName [NVARCHAR](50) NOT NULL,
	email [NVARCHAR](50) NOT NULL,
	addressNo [NVARCHAR](50) NOT NULL,
	addressStreet [NVARCHAR](50) NOT NULL,
	addressPostCode [NVARCHAR](50) NOT NULL,
	addressSuburb [NVARCHAR](50) NOT NULL,
	addressState [NVARCHAR](50) NOT NULL,
	mobPhone [NVARCHAR](50) NOT NULL,
	homePhone [NVARCHAR](50) NULL,
	creditCardNo [BIGINT] NULL,
	creditCardName [NVARCHAR](50) NULL,
	creditCardExp [DATE] NULL,
	identificationInfo [NVARCHAR](250) NULL
);

CREATE TABLE pet (
	petId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	clientId [UNIQUEIDENTIFIER] NOT NULL,
	petName [NVARCHAR](50) NOT NULL,
	regRef [NVARCHAR](50) NOT NULL,
	animalType [NVARCHAR](50) NOT NULL,
	breed [NVARCHAR](50) NOT NULL,
	colour [NVARCHAR](50) NULL,
);

CREATE TABLE medication (
	medId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	medName [NVARCHAR](50) NOT NULL,
	strength [NVARCHAR](50) NOT NULL,
	medRoute [NVARCHAR](50) NOT NULL,
	cost [DECIMAL] (7,2) NOT NULL
);

CREATE TABLE med_ref (
	med_refId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	bookingId [UNIQUEIDENTIFIER] NOT NULL,
	petId [UNIQUEIDENTIFIER] NOT NULL,
	med_id [UNIQUEIDENTIFIER] NOT NULL,
);

CREATE TABLE booking (
	bookingId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	email [NVARCHAR] (50) NOT NULL,
	clientId [UNIQUEIDENTIFIER] NOT NULL,
	petID [UNIQUEIDENTIFIER] NOT NULL,
	bookingDate [DATE] NOT NULL,
	bookingTime [TIME] NOT NULL,
	isPayed [BIT] NOT NULL DEFAULT 0,
	paymentType [NVARCHAR](50) NULL,
	cost [DECIMAL] (7,2) NULL,
	comment [NVARCHAR] (500) NULL
);

INSERT INTO [employee]
(
	[email]
    ,[employeeType]
    ,[givenName]
    ,[lastName]
    ,[addressNo]
    ,[addressStreet]
    ,[addressPostCode]
    ,[addressSuburb]
    ,[addressState]
    ,[mobPhone]
)
	VALUES
(
	'admin@vetsurgery.com'
	,'Admin'
	,'Ad'
	,'Min'
	,'123A'
	,'Nimad Rd'
	,'5241'
	,'Nimadadad'
	,'WA'
	,'0487654321'
);

INSERT INTO [employee]
(
	[email]
    ,[employeeType]
    ,[givenName]
    ,[lastName]
    ,[addressNo]
    ,[addressStreet]
    ,[addressPostCode]
    ,[addressSuburb]
    ,[addressState]
    ,[mobPhone]
)
	VALUES
(
	'vehtman@vetsurgery.com'
	,'Vet'
	,'Veht'
	,'Munn'
	,'13A'
	,'Vigor Way'
	,'5123'
	,'Veveveee'
	,'WA'
	,'0418312374'
);

INSERT INTO [client]
(
	[givenName]
    ,[lastName]
	,[email]
    ,[addressNo]
    ,[addressStreet]
    ,[addressPostCode]
    ,[addressSuburb]
    ,[addressState]
    ,[mobPhone]
)
	VALUES
(
	'Noot',
	'Mann',
	'nootman@email.com',
	'34A',
	'Some Street',
	'3434',
	'Somamama',
	'WA',
	'0484546801'
);

INSERT INTO [medication]
(
	[medName]
    ,[strength]
    ,[medRoute]
    ,[cost]
)
	VALUES
(
	'Madeupamedacuras'
	,'10mg'
	,'Suppository'
	,100.00
);

INSERT INTO [dbo].[medication]
(
	[medName]
	,[strength]
	,[medRoute]
	,[cost]
)
	VALUES
(
	'Yeboiannoy'
	,'5ml'
	,'Injection'
	,'0.99'
);

INSERT INTO [pet]
(
	[clientId]
    ,[petName]
    ,[regRef]
    ,[animalType]
    ,[breed]
    ,[colour]
)
	VALUES
(
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'nootman@email.com')
	,'Fiddo'
	,'1238ASDOJN'
	,'Dog'
	,'Whippet'
	,'Blue'
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[clientId]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'vehtman@vetsurgery.com')
	,(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'nootman@email.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE clientId = (SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'nootman@email.com'))
	,'2018-01-01'
	,'12:30:00'
	,1
	,'Cash'
	,2.0
	,'Medication is to be taken daily'
);

INSERT INTO [dbo].[med_ref]
(
	[bookingId]
	,[petId]
	,[med_id]
)
	VALUES
(
	(SELECT bookingId FROM [VetSurgery].[dbo].[booking] WHERE email = (SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'vehtman@vetsurgery.com'))
	,(SELECT medId FROM [VetSurgery].[dbo].[medication] WHERE medName = 'Yeboiannoy' AND strength = '5ml')
);
