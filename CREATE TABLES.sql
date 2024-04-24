
-- put cursor her then click execute

CREATE TABLE CUSTOMER (
Customer_ID int constraint cutomer_pk primary key identity(100,1),
FirstName varchar (30),
MiddleName varchar (30),
LastName varchar(30),
StreetAddress varchar(100),
City varchar (20),
Province varchar (20),
ContactNumber varchar(15),
Email_Address varchar (40),
DateOfBirth datetime 
)

CREATE TABLE ACCOUNT (
Account_ID int constraint account_pk primary key identity(200,1),
AccountName varchar(50),
Email_Address varchar(40),
Balance decimal (12,2),
DateRegistered datetime default(getDate()),
AccountStatus varchar(10) check  (  AccountStatus in  ('Active' , 'Frozen' , 'Inactive') ),
Customer_ID int constraint customer_fk  foreign key references CUSTOMER(Customer_ID)ON DELETE CASCADE ON UPDATE CASCADE

)


CREATE TABLE PERSONNEL(
Personnel_ID int constraint personnel_pk primary key identity(400,1),
FirstName varchar (30),
MiddleName varchar (30),
LastName varchar(30),
DateHired datetime,
Salary decimal (10,2),
DateOfBirth datetime,
Position varchar(20)

)


CREATE TABLE SERVICE (
Service_Number int constraint service_pk primary key identity(300,1),
Service_Type varchar(20),
Service_Description varchar(50),
Personnel_ID int constraint personnel_fk foreign key references PERSONNEL(Personnel_ID) ON DELETE CASCADE ON UPDATE CASCADE


)

	CREATE TABLE BILLPAYMENT(
	Service_Number int constraint service_fk1 foreign key references SERVICE(Service_Number) ON DELETE CASCADE ON UPDATE CASCADE ,
	BillAmount decimal (10,2),
	BillType varchar (30) check (BillType in ('Water Bill', 'Electric Bill', 'Internet Bill', 'Streaming Site'))

	)
	
	CREATE TABLE CHEQUE(
	Service_Number int constraint service_fk2 foreign key references SERVICE(Service_Number) ON DELETE CASCADE ON UPDATE CASCADE ,
	Amount decimal (10,2),
	Company varchar (30)

	)
	CREATE TABLE LOAN_SERVICE(
	Service_Number int constraint service_fk3 foreign key references SERVICE(Service_Number) ON DELETE CASCADE ON UPDATE CASCADE ,
	Income decimal (10,2),
	LoanPurpose varchar (30),
	LoanAmount decimal(10,2),
	LoanDeadline datetime

	)


CREATE TABLE ACCOUNT_TRANSACTION (
Account_ID int constraint account_fk foreign key references ACCOUNT(Account_ID) ON DELETE CASCADE ON UPDATE CASCADE,
Service_Number int constraint service_fk foreign key references SERVICE(Service_Number) ON DELETE CASCADE ON UPDATE CASCADE,
Service_Type varchar(20),
DateAvailed datetime

)





