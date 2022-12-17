-- IF DATABASE EXISTS, DROP
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'bluebike')
    DROP DATABASE bluebike;
GO

CREATE DATABASE [bluebike]
go
USE [bluebike]
GO


--Person Table--
CREATE TABLE Person
(
    PersonID INT IDENTITY(1,1),
    [Name] VARCHAR(25) NOT NULL,
    EmailID VARCHAR(30) NOT NULL,
    [Address] VARCHAR(50) NOT NULL,
    City VARCHAR(10) NOT NULL,
    [State] VARCHAR(10) NOT NULL,
    Zipcode INT NOT NULL,
    Phone BIGINT NOT NULL,
    [Password] VARBINARY(400) NOT NULL,
    Advertiser BIT NOT NULL,
    Rider BIT NOT NULL,
    CONSTRAINT Person_PK PRIMARY KEY (PersonID)
)

--Advertiser Table--
CREATE TABLE Advertiser
(
    PersonID INT NOT NULL,
    CompanyName VARCHAR(25),
    CONSTRAINT Advertiser_PK PRIMARY KEY (PersonID),
    CONSTRAINT Advertiser_FK FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
)

-- Subscription Table --
CREATE TABLE Subscription
(
    SubscriptionID INT IDENTITY(1,1) NOT NULL,
    SubscriptionName VARCHAR(25),
    StartDate DATE,
    EndDate DATE,
    CONSTRAINT Subscription_PK PRIMARY KEY (SubscriptionID)
)

--Rider Table --
CREATE TABLE Rider
(
    PersonID INT NOT NULL,
    SubscriptionID INT NOT NULL,
    CONSTRAINT Rider_PK PRIMARY KEY (PersonID),
    CONSTRAINT Rider_PersonID_FK FOREIGN KEY (PersonID) REFERENCES Person (PersonID),
    CONSTRAINT Rider_SubscriptionID_FK FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID)
)

--BikeCategory--
CREATE TABLE BikeCategory
(
    BikeCategoryID INT IDENTITY(1,1) NOT NULL,
    BikeManufactorName VARCHAR(25) NOT NULL,
    BikeDetail varchar(25) NOT NULL,
    CONSTRAINT BikeCategory_PK PRIMARY KEY (BikeCategoryID)
)

--Bike--
CREATE TABLE Bike
(
    BikeID INT IDENTITY(1,1) NOT NULL,
    BikeName VARCHAR(25) NOT NULL,
    RentPrice DECIMAL NOT NULL,
    BikeStatus VARCHAR(10) NOT NULL,
    BikeCategoryID INT NOT NULL,
    CONSTRAINT Bike_PK PRIMARY KEY (BikeID),
    CONSTRAINT Bike_BikeCategory_FK FOREIGN KEY (BikeCategoryID) REFERENCES BikeCategory(BikeCategoryID)
)

-- Dock Table
CREATE TABLE Dock (
    DockID INT IDENTITY(1,1) NOT NULL,
    DockName VARCHAR(25) NOT NULL,
    DockLocation VARCHAR(25) NOT NULL,
    CONSTRAINT Dock_PK PRIMARY KEY (DockID)
);

-- Service Table
CREATE TABLE [Service]
(
    ServiceID INT IDENTITY(1,1),
    Description VARCHAR(25),
    StartDate DATE,
    EndDate DATE,
    Amount DECIMAL,
    ServiceType CHAR(1)
    CONSTRAINT Service_PK primary key (ServiceID)
)
-- Advertisement Table
CREATE TABLE Advertisement
(
    ServiceID INT NOT NULL,
    PersonID INT NOT NULL,
    CONSTRAINT Advertisement_PK PRIMARY KEY(ServiceID),
    CONSTRAINT Advertisement_ServiceID_FK FOREIGN KEY (ServiceID) REFERENCES [Service](ServiceID),
    CONSTRAINT Advertisement_PersonID_FK FOREIGN KEY (PersonID) REFERENCES Advertiser(PersonID)
)

-- Rental Table
CREATE TABLE Rental
(
    ServiceID INT NOT NULL,
    PersonID INT NOT NULL,
    DockID INT NOT NULL,
    BikeID INT NOT NULL,
    CONSTRAINT Rental_PK PRIMARY KEY(ServiceID),
    CONSTRAINT Rental_ServiceID_FK FOREIGN KEY (ServiceID) REFERENCES [Service](ServiceID),
    CONSTRAINT Rental_PersonID_FK FOREIGN KEY (PersonID) REFERENCES Rider(PersonID),
    CONSTRAINT Rental_DockID_FK FOREIGN KEY (DockID) REFERENCES Dock(DockID),
    CONSTRAINT Rental_BikeID_FK FOREIGN KEY (BikeID) REFERENCES Bike(BikeID)
)

-- Dock Grouping Table --
CREATE TABLE DockGrouping
(
    DockGroupID INT IDENTITY(1,1) NOT NULL,
    ServiceID INT NOT NULL,
    DockID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CONSTRAINT DockGrouping_PK PRIMARY KEY (DockGroupID),
    CONSTRAINT DockGrouping_ServiceID_FK FOREIGN KEY (ServiceID) REFERENCES Advertisement(ServiceID),
    CONSTRAINT DockGrouping_DockID_FK FOREIGN KEY (DockID) REFERENCES Dock(DockID)
);

-- Payment Table --
CREATE TABLE Payment
(
    PaymentID INT IDENTITY(1,1),
    PaymentStatus VARCHAR(10) NOT NULL,
    ServiceID INT NOT NULL,
    CONSTRAINT Payment_PK PRIMARY KEY (PaymentID),
    CONSTRAINT Payment_ServiceID_FK FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
)

-- Penalty Table --
CREATE TABLE Penalty
(
    PenaltyID INT IDENTITY(1,1),
    Amount DECIMAL NOT NULL,
    Description VARCHAR(50) NOT NULL,
    PaymentID INT NOT NULL,
    CONSTRAINT Penalty_PK PRIMARY KEY (PenaltyID),
    CONSTRAINT Penalty_PaymentID_FK FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
)