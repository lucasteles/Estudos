--CREATE DATABASE Raxator;
--use Raxator;;

IF (OBJECT_ID('RX_Invite') IS NOT NULL)
	DROP TABLE RX_Invite; 

IF (OBJECT_ID('RX_InviteAnswerType') IS NOT NULL)
	DROP TABLE RX_InviteAnswerType;

IF (OBJECT_ID('RX_BillingGroup_Customer') IS NOT NULL)
	DROP TABLE RX_BillingGroup_Customer;

IF (OBJECT_ID('RX_PaymentType') IS NOT NULL)
	DROP TABLE RX_PaymentType;

IF (OBJECT_ID('RX_BillingGroup') IS NOT NULL)
	DROP TABLE RX_BillingGroup;

IF (OBJECT_ID('RX_BillingStatus') IS NOT NULL)
	DROP TABLE RX_BillingStatus;

IF (OBJECT_ID('RX_Merchant') IS NOT NULL)
	DROP TABLE RX_Merchant;
	
IF (OBJECT_ID('RX_Customer') IS NOT NULL)
	DROP TABLE RX_Customer;

CREATE TABLE RX_Customer
(
	IdUser			INT				NOT NULL IDENTITY(1, 1)
,	Email			VARCHAR(100)	NOT NULL
,	Name			VARCHAR(100)	NOT NULL
,	[Password]		VARCHAR(2048)	NOT NULL
,	IdFacebook		BIGINT				NULL 
,	CreatedAt		DATETIME2		NOT NULL DEFAULT GETDATE()
,	UpdatedAt		DATETIME2			NULL
);

CREATE TABLE RX_Merchant
(
	IdMerchant			INT				NOT NULL IDENTITY(1, 1)
,	Name				VARCHAR(100)	NOT NULL
,	[UniqueIdentifier]	VARCHAR(100)	NOT NULL
,	CreatedAt			DATETIME2		NOT NULL DEFAULT GETDATE()
,	UpdatedAt			DATETIME2			NULL
);

CREATE TABLE RX_BillingStatus
(
	IdBillingStatus		INT				NOT NULL
,	Name				VARCHAR(100)	NOT NULL
);

CREATE TABLE RX_BillingGroup
(
	IdBillingGroup		INT				NOT NULL IDENTITY(1, 1)
,	IdBillingStatus		INT				NOT NULL DEFAULT 1
,	IdMerchant			INT					NULL
,	Price				DECIMAL(15,4)	NOT NULL DEFAULT 0			
);

CREATE TABLE RX_PaymentType
(
	IdPaymentType		INT				NOT	NULL
,	Name				VARCHAR(100)	NOT NULL
);

CREATE TABLE RX_BillingGroup_Customer
(
	IdBillingGroup		INT				NOT NULL
,	IdUser				INT				NOT NULL
,	IdPaymentType		INT				NOT NULL
,	IndividualPrice		DECIMAL(15,4)	NOT NULL DEFAULT 0
,	CreatedAt			DATETIME2		NOT NULL DEFAULT GETDATE()
,	UpdatedAt			DATETIME2			NULL
);

CREATE TABLE RX_InviteAnswerType
(
	IdInviteAnswerType	INT				NOT NULL
,	Name				VARCHAR(100)	NOT NULL
)

CREATE TABLE RX_Invite
(
	IdInvite			INT				NOT NULL IDENTITY(1, 1)
,	IdInviter			INT				NOT NULL
,	IdInvited			INT				NOT NULL
,	IdInviteAnswerType	INT				NOT NULL DEFAULT 1
,	IdBillingGroup		INT				NOT NULL
,	CreatedAt			DATETIME2		NOT NULL DEFAULT GETDATE()
,	UpdatedAt			DATETIME2			NULL
)


ALTER TABLE RX_Customer
ADD CONSTRAINT PK_Customer
PRIMARY KEY (IdUser);

ALTER TABLE RX_Customer
ADD CONSTRAINT UK_Customer_Email
UNIQUE (Email);

ALTER TABLE RX_Merchant
ADD CONSTRAINT PK_Merchant
PRIMARY KEY (IdMerchant);

ALTER TABLE RX_BillingStatus
ADD CONSTRAINT PK_BillingStatus
PRIMARY KEY (IdBillingStatus);

ALTER TABLE RX_BillingGroup
ADD CONSTRAINT PK_BillingGroup
PRIMARY KEY (IdBillingGroup);

ALTER TABLE RX_BillingGroup
ADD CONSTRAINT FK_BilligStatus
FOREIGN KEY (IdBillingStatus)
REFERENCES RX_BillingStatus (IdBillingStatus);

ALTER TABLE RX_BillingGroup
ADD CONSTRAINT FK_Merchant
FOREIGN KEY (IdMerchant)
REFERENCES RX_Merchant (IdMerchant);

ALTER TABLE RX_PaymentType
ADD CONSTRAINT PK_PaymentType
PRIMARY KEY (IdPaymentType);

ALTER TABLE RX_BillingGroup_Customer
ADD CONSTRAINT PK_BillingGroup_Customer
PRIMARY KEY (IdBillingGroup, IdUser);

ALTER TABLE RX_BillingGroup_Customer
ADD CONSTRAINT FK_BillingGroup_Customer_BillingGroup
FOREIGN KEY (IdBillingGroup)
REFERENCES RX_BillingGroup (IdBillingGroup);

ALTER TABLE RX_BillingGroup_Customer
ADD CONSTRAINT FK_BillingGroup_Customer_Customer
FOREIGN KEY (IdUser)
REFERENCES RX_Customer (IdUser);

ALTER TABLE RX_BillingGroup_Customer
ADD CONSTRAINT FK_BillingGroup_Customer_Payment
FOREIGN KEY (IdPaymentType)
REFERENCES RX_PaymentType (IdPaymentType);

ALTER TABLE RX_InviteAnswerType
ADD CONSTRAINT PK_InviteAnswerType
PRIMARY KEY (IdInviteAnswerType);

ALTER TABLE RX_Invite
ADD CONSTRAINT PK_Invite
PRIMARY KEY (IdInvite);

ALTER TABLE RX_Invite
ADD CONSTRAINT FK_Invite_Inviter
FOREIGN KEY (IdInviter)
REFERENCES RX_Customer (IdUser);

ALTER TABLE RX_Invite
ADD CONSTRAINT FK_Invite_Invited
FOREIGN KEY (IdInvited)
REFERENCES RX_Customer (IdUser);

ALTER TABLE RX_Invite
ADD CONSTRAINT FK_Invite_InviteAnswerType
FOREIGN KEY (IdInviteAnswerType)
REFERENCES RX_InviteAnswerType (IdInviteAnswerType);

ALTER TABLE RX_Invite
ADD CONSTRAINT FK_Invite_BillingGroup
FOREIGN KEY (IdBillingGroup)
REFERENCES RX_BillingGroup (IdBillingGroup)


SELECT * FROM RX_Customer