-- SELECT * FROM Service WHERE ServiceID > 10;
-- SELECT * FROM Payment WHERE ServiceID > 10;
-- SELECT * FROM Penalty;

-- Insert Rental with payment insert
INSERT INTO Rental Values (11, 11, 1, 1);
INSERT INTO Rental Values (12, 12, 2, 2);
INSERT INTO Rental Values (13, 13, 3, 3);
INSERT INTO Rental Values (14, 14, 4, 4);
INSERT INTO Rental Values (15, 15, 5, 5);
INSERT INTO Rental Values (16, 16, 6, 6);
INSERT INTO Rental Values (17, 17, 7, 7);
INSERT INTO Rental Values (18, 18, 8, 8);
INSERT INTO Rental Values (19, 19, 9, 9);
INSERT INTO Rental Values (20, 20, 10, 10);

-- SELECT * FROM Service WHERE ServiceID > 20;
-- SELECT * FROM Payment WHERE ServiceID > 20;
-- SELECT * FROM Penalty;

-- Insert Rental with payment and penalty insert
INSERT INTO Rental Values (21, 21, 10, 10);
INSERT INTO Rental Values (22, 22, 10, 10);
INSERT INTO Rental Values (23, 23, 10, 10);

-- Validation
-- RiderID - 21, ServiceID - 21
-- CREATE dbo.GetRentalAmount (@riderID INT, @serviceID INT);
-- DECLARE @RentAmount INT;
-- SELECT @RentAmount = dbo.GetRentalAmount(21, 21)
-- SELECT @RentAmount AS 'Rental Function Amount';
--
-- -- CREATE PROCEDURE GetPenaltyAmount @serviceID INT,@riderID INT, @amount INT OUTPUT
-- DECLARE @Output INT;
-- EXEC GetPenaltyAmount 21, 21, @Output OUTPUT;
-- SELECT @Output AS 'Penalty Procedure Amount';
--
-- SELECT @RentAmount + @Output AS 'Total Trigger Amount';
--
