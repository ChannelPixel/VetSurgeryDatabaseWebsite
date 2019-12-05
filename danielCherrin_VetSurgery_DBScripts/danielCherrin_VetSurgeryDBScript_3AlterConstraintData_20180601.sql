CREATE DATABASE VetSurgery;
GO

USE [VetSurgery];
GO

--CREATE FOLD
CREATE TABLE employee (
	email [NVARCHAR](50) PRIMARY KEY NOT NULL,
	passwd [NVARCHAR](50) NOT NULL DEFAULT '!Password1',
	empId [UNIQUEIDENTIFIER] NOT NULL UNIQUE DEFAULT NEWSEQUENTIALID(),
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
	email [NVARCHAR](50) UNIQUE NOT NULL,
	addressNo [NVARCHAR](50) NOT NULL,
	addressStreet [NVARCHAR](50) NOT NULL,
	addressPostCode [NVARCHAR](50) NOT NULL,
	addressSuburb [NVARCHAR](50) NOT NULL,
	addressState [NVARCHAR](50) NOT NULL,
	mobPhone [NVARCHAR](50) NOT NULL,
	homePhone [NVARCHAR](50) NULL,
);

CREATE TABLE pet (
	petId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	clientId [UNIQUEIDENTIFIER] NOT NULL,
	petName [NVARCHAR](50) NOT NULL,
	regRef [NVARCHAR](50) UNIQUE NOT NULL,
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
	medId [UNIQUEIDENTIFIER] NOT NULL,
);

CREATE TABLE booking (
	bookingId [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL DEFAULT NEWSEQUENTIALID(),
	email [NVARCHAR] (50) NOT NULL,
	petID [UNIQUEIDENTIFIER] NOT NULL,
	bookingDate [DATE] NOT NULL,
	bookingTime [TIME] NOT NULL,
	isPayed [BIT] NOT NULL DEFAULT 0,
	paymentType [NVARCHAR](50) NULL,
	cost [DECIMAL] (7,2) NULL,
	creditCardNo [NVARCHAR](50) NULL,
	creditCardName [NVARCHAR](50) NULL,
	creditCardExp [DATE] NULL,
	comment [NVARCHAR] (500) DEFAULT 'No comments' NOT NULL
);
GO

--INSERT FOLD
INSERT INTO [employee]
(
	[email]
	,[passwd]
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
	,'!Secret1'
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
	'albertblake@vetsurgery.com'
	,'Vet'
	,'Albert'
	,'Blake'
	,'81'
	,'Lowell Road'
	,'6045'
	,'Purcell'
	,'WA'
	,'0498435972'
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
	'geoffwalmsley@vetsurgery.com'
	,'Vet'
	,'Geoff'
	,'Walmsley'
	,'164'
	,'Samuels Road'
	,'6846'
	,'Kimber'
	,'WA'
	,'0446175269'
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
	'sharyleccleston@vetsurgery.com'
	,'Vet'
	,'Sharyl'
	,'Eccleston'
	,'45b'
	,'Rich Street'
	,'6754'
	,'Heelenana'
	,'WA'
	,'0465781245'
);

--clients
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
	'Helena',
	'Dickenson',
	'helena645@email.com',
	'654',
	'Ayen Ave',
	'6544',
	'Jollyolle',
	'WA',
	'0431625894'
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
	'Trisha',
	'Tuff',
	'tuffnruff@email.com',
	'76b',
	'Seward Ave',
	'6214',
	'Yoofalup',
	'WA',
	'0413458944'
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
	'Clinton',
	'Herbert',
	'clintonherbet@email.com',
	'4a',
	'Queen Street',
	'6077',
	'Hendi',
	'WA',
	'0455441845'
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
	'Kelsey',
	'Barnes',
	'kelseybarnes@email.com',
	'7',
	'Peak Road',
	'6009',
	'Norwood',
	'WA',
	'0426565211'
);

--medications
INSERT INTO [medication]
(
	[medName]
    ,[strength]
    ,[medRoute]
    ,[cost]
)
	VALUES
(
	'Laxative'
	,'10mg'
	,'Pill'
	,13.00
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
	'Morphine'
	,'100mg'
	,'Injection'
	,35.00
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
	'Morphine'
	,'50mg'
	,'Injection'
	,20.00
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
	,'50mg'
	,'Suppository'
	,70.00
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
	,'100mg'
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
	,0.99
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
	'Tetoticola'
	,'10g'
	,'Pill'
	,1.99
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
	'Luvox'
	,'250g'
	,'Topical'
	,10.00
);

--pets
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
	,'A000007'
	,'Dog'
	,'Whippet'
	,'Blue Brindle'
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
	,'Ootis'
	,'F837596'
	,'Cat'
	,'Ocicat'
	,'Grey'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'helena645@email.com')
	,'Charlie'
	,'E164856'
	,'Bird'
	,'Budgerigar'
	,'Green/Yellow'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'tuffnruff@email.com')
	,'Zeus'
	,'H134589'
	,'Dog'
	,'Pitbull'
	,'White'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'tuffnruff@email.com')
	,'Olaf'
	,'H546871'
	,'Dog'
	,'Pitbull'
	,'Black/White'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'clintonherbet@email.com')
	,'Skittles'
	,'T123127'
	,'Cat'
	,'Calico'
	,'White/Black/Red'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'kelseybarnes@email.com')
	,'Harry'
	,'G784655'
	,'Guinea Pig'
	,'American Guinea Pig'
	,'White/Black/Red'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'kelseybarnes@email.com')
	,'Sally'
	,'Y685741'
	,'Guinea Pig'
	,'American Guinea Pig'
	,'Black'
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
	(SELECT clientId FROM [VetSurgery].[dbo].[client] WHERE [client].email = 'kelseybarnes@email.com')
	,'Potate'
	,'X798056'
	,'Guinea Pig'
	,'Skinny Pig'
	,'Hairless'
);

--bookings
INSERT INTO [dbo].[booking]
(
	[email]
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
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'A000007')
	,'2018-01-01'
	,'12:30:00'
	,1
	,'Cash'
	,51.98
	,'No comments'
);

INSERT INTO [dbo].[booking]
(
	[email]
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
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'F837596')
	,'2018-03-21'
	,'09:30:00'
	,1
	,'Cash'
	,50
	,'No comments'
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'albertblake@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'E164856')
	,'2018-02-17'
	,'15:30:00'
	,1
	,'Credit Card'
	,100
	,'3012854769856324'
	,'Helena R. Dickonson'
	,'2020-01-01'
	,'No comments'
)

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'geoffwalmsley@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'H134589')
	,'2018-04-05'
	,'11:30:00'
	,1
	,'Credit Card'
	,75
	,'5165458725743696'
	,'Trisha N. Tuff'
	,'2025-08-01'
	,'No comments'
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'geoffwalmsley@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'H546871')
	,'2018-04-05'
	,'12:30:00'
	,1
	,'Credit Card'
	,75
	,'5165458725743696'
	,'Trisha N. Tuff'
	,'2025-08-01'
	,'No comments'
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'sharyleccleston@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'T123127')
	,'2018-07-05'
	,'12:30:00'
	,0
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'albertblake@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'G784655')
	,'2018-01-16'
	,'14:00:00'
	,1
	,'Credit Card'
	,100
	,'4521786554322198'
	,'Kelsey M. Barnes'
	,'2019-12-01'
	,'No comments'
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'albertblake@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'Y685741')
	,'2018-01-16'
	,'15:00:00'
	,1
	,'Credit Card'
	,100
	,'4521786554322198'
	,'Kelsey M. Barnes'
	,'2019-12-01'
	,'No comments'
);

INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'albertblake@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'X798056')
	,'2018-01-16'
	,'15:00:00'
	,1
	,'Credit Card'
	,100
	,'4521786554322198'
	,'Kelsey M. Barnes'
	,'2019-12-01'
	,'No comments'
);

--BOOKING FOR THE CURRENT [TIMESTAMP]
INSERT INTO [dbo].[booking]
(
	[email]
	,[petID]
	,[bookingDate]
	,[bookingTime]
	,[isPayed]
	,[paymentType]
	,[cost]
	,[creditCardNo]
	,[creditCardName]
	,[creditCardExp]
	,[comment]
)
     VALUES
(
	(SELECT email FROM [VetSurgery].[dbo].[employee] WHERE [employee].email = 'albertblake@vetsurgery.com')
	,(SELECT petId FROM [VetSurgery].[dbo].[pet] WHERE regRef = 'X798056')
	,GETDATE()
	,'15:00:00'
	,1
	,'Credit Card'
	,100
	,'4521786554322198'
	,'Kelsey M. Barnes'
	,'2019-12-01'
	,'No comments'
);

--med_ref

--ALTER FOREIGN KEY FOLD
--Constraint FK for [pet].clientId, against [client] table
ALTER TABLE [pet] WITH CHECK ADD CONSTRAINT [fk_pet.clientId] FOREIGN KEY ([clientId])
REFERENCES [client] ([clientId])

--Constraint FK for [booking].petId, against [pet] table
ALTER TABLE [booking] WITH CHECK ADD CONSTRAINT [fk_booking.petId] FOREIGN KEY ([petId])
REFERENCES [pet] ([petId])

--Constraint FK for [booking].email, against [employee] table
ALTER TABLE [booking] WITH CHECK ADD CONSTRAINT [fk_booking.email] FOREIGN KEY ([email])
REFERENCES [employee] ([email])

--Constraint FK for [med_ref].bookingId, against [booking] table
ALTER TABLE [med_ref] WITH CHECK ADD CONSTRAINT [fk_med_ref.bookingId] FOREIGN KEY ([bookingId])
REFERENCES [booking] ([bookingId])

--Constraint FK for [med_ref].medId, against [medication] table
ALTER TABLE [med_ref] WITH CHECK ADD CONSTRAINT [fk_med_ref.medId] FOREIGN KEY ([medId])
REFERENCES [medication] ([medId])

GO

--ALTER CHECK CONSTRAINT FOLD
ALTER TABLE [booking] WITH CHECK ADD CONSTRAINT [chk_bookingCreditCardNo]
CHECK (([creditCardNo] LIKE '3%') OR ([creditCardNo] LIKE '4%') OR ([creditCardNo] LIKE '5%') OR ([creditCardNo] LIKE '6%'))
--3 = travel/entertainment cards (American Express/Diners Club)
--4 = Visa cards
--5 = MasterCard
--6 = DiscoverCard
GO
