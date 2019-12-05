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
	addressNo [NVARCHAR](50) NOT NULL,
	addressStreet [NVARCHAR](50) NOT NULL,
	addressPostCode [NVARCHAR](50) NOT NULL,
	addressSuburb [NVARCHAR](50) NOT NULL,
	addressState [NVARCHAR](50) NOT NULL,
	mobPhone [NVARCHAR](50) NOT NULL,
	homePhone [NVARCHAR](50) NULL,
	creditCardNo [BIGINT] NULL,
	creditCardName [NVARCHAR] NULL,
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
	paymentType [NVARCHAR] NULL,
	cost [DECIMAL] (7,2) NULL,
	comment [NVARCHAR] (500) NULL
);