-- PART A
-- Stored Procedure--GetAdvertisementCountByDock
-- Create new service - advertisement - Service ID - 24
-- Link Advertisement with Service ID - 24 and Person ID - 10
-- Insert DockGrouping for Service ID
-- Exec Procedure - GetAdvertisementCountByDock
INSERT INTO Service Values ('Advertisement', '2022-11-01', '2022-11-07', 1000, 'A')
INSERT INTO Advertisement VALUES (24, 10);

INSERT INTO DockGrouping VALUES (24, 10, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (24, 10, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (24, 10, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (24, 10, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (24, 10, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (24, 10, '11/1/2022', '12/31/2022');

EXEC GetAdvertisementCountByDock '01/01/2020', '12/31/2024';

-- Stored Procedure--GetAdvertisementCountByDock
-- Create new service - advertisement - Service ID - 25
-- Link Advertisement with Service ID - 25 and Person ID - 1 to 6
-- Insert DockGrouping for Service ID
-- Exec Procedure - GetAdvertisementCountByDock

INSERT INTO Service Values ('Advertisement', '2022-11-01', '2022-11-07', 1000, 'A')
INSERT INTO Advertisement VALUES (25, 10);

INSERT INTO DockGrouping VALUES (25, 1, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (25, 2, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (25, 3, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (25, 4, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (25, 5, '11/1/2022', '12/31/2022');
INSERT INTO DockGrouping VALUES (25, 6, '11/1/2022', '12/31/2022');

EXEC GetAdvertisementCountByDock '01/01/2020', '12/31/2024';

-- PART B
-- Stored Procedure--GetNumberOfRentalByBikeID
-- Create new service - Rental - Service ID - 26, 27, 28, 29
-- Link Rental with new Service ID
-- Exec GetNumberOfRentalByBikeID

-- BEFORE
EXEC GetNumberOfRentalByBikeID '01/01/2020','12/31/2024';
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-07', 1000, 'R');
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-14', 2000, 'R');
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-21', 3000, 'R');
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-30', 4000, 'R');
INSERT INTO Rental VALUES (26, 11, 1, 1);
INSERT INTO Rental VALUES (27, 12, 2, 2);
INSERT INTO Rental VALUES (28, 13, 3, 3);
INSERT INTO Rental VALUES (29, 14, 4, 4);
-- AFTER
EXEC GetNumberOfRentalByBikeID '01/01/2020','12/31/2024';

-- RiderID - 21, ServiceID - 21
-- CREATE dbo.GetRentalAmount (@riderID INT, @serviceID INT);
DECLARE @RentAmount INT;
SELECT @RentAmount = dbo.GetRentalAmount(21, 21)
SELECT @RentAmount AS 'Rental Function Amount';
--
-- CREATE PROCEDURE GetPenaltyAmount @serviceID INT,@riderID INT, @amount INT OUTPUT
DECLARE @Output INT;
EXEC GetPenaltyAmount 21, 21, @Output OUTPUT;
SELECT @Output AS 'Penalty Procedure Amount';
--
SELECT @RentAmount + @Output AS 'Total Trigger Amount';