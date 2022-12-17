ALTER TABLE Person ADD CONSTRAINT Person_TYPE_CHK CHECK (
    (Advertiser = 1 AND Rider = 0) OR
    (Advertiser = 0 AND Rider = 1) OR
    (Advertiser = 1 AND Rider = 1)
)

ALTER TABLE Subscription ADD CONSTRAINT Subscription_Date_Check CHECK (StartDate < EndDate)
ALTER TABLE Dockgrouping ADD CONSTRAINT DockGrouping_Date_Check CHECK (StartDate < EndDate)

ALTER TABLE Service ADD CONSTRAINT Service_Date_Check CHECK (StartDate < EndDate)
ALTER TABLE Service ADD CONSTRAINT Service_ServiceType_CHK CHECK (ServiceType IN ('A', 'R'));

ALTER TABLE Bike ADD CONSTRAINT Bike_BikeStatus_CHK CHECK (BikeStatus IN ('Available', 'In-Use', 'Broken'));

ALTER TABLE Payment ADD CONSTRAINT Payment_PaymentStatus_CHK CHECK (PaymentStatus IN ('Done', 'Pending'));
