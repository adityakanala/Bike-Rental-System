TRUNCATE TABLE Penalty;

ALTER TABLE Penalty
DROP CONSTRAINT Penalty_PaymentID_FK;

TRUNCATE TABLE Payment;
ALTER TABLE Payment
DROP CONSTRAINT Payment_ServiceID_FK;



TRUNCATE TABLE DockGrouping;
ALTER TABLE DockGrouping
DROP CONSTRAINT DockGrouping_ServiceID_FK;

ALTER TABLE DockGrouping
DROP CONSTRAINT DockGrouping_DockID_FK;

TRUNCATE TABLE Rental;
ALTER TABLE Rental
DROP CONSTRAINT Rental_ServiceID_FK;

ALTER TABLE Rental
DROP CONSTRAINT Rental_DockID_FK;

ALTER TABLE Rental
DROP CONSTRAINT Rental_BikeID_FK;

ALTER TABLE Rental
DROP CONSTRAINT Rental_PersonID_FK;


TRUNCATE TABLE Advertisement;
ALTER TABLE Advertisement
DROP CONSTRAINT Advertisement_ServiceID_FK;

ALTER TABLE Advertisement
DROP CONSTRAINT Advertisement_PersonID_FK;


TRUNCATE TABLE Service;

TRUNCATE TABLE Dock;

TRUNCATE TABLE Bike;
ALTER TABLE Bike
DROP CONSTRAINT Bike_BikeCategory_FK;

TRUNCATE TABLE BikeCategory;

TRUNCATE TABLE Rider;
ALTER TABLE Rider
DROP CONSTRAINT Rider_SubscriptionID_FK;
ALTER TABLE Rider
DROP CONSTRAINT Rider_PersonID_FK;

TRUNCATE TABLE Advertiser;
TRUNCATE TABLE Subscription;
