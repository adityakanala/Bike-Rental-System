CREATE FUNCTION GetRentalAmount(
    @riderID INT, @serviceID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @bikeRentPrice INT;

    SELECT @bikeRentPrice = b.RentPrice
    FROM Rental r JOIN Bike b ON r.BikeID = b.BikeID
    WHERE r.PersonID = @riderID;

    DECLARE @serviceStartDate DATE,@serviceEndDate DATE;

    SELECT @serviceStartDate=s.StartDate, @serviceEndDate= s.EndDate
    FROM Service s
    WHERE s.ServiceID=@serviceID;

    DECLARE @rentalDays INT;
    SET @rentalDays = DATEDIFF(DAY, @serviceStartDate, @serviceEndDate) + 1;

    RETURN @rentalDays * @bikeRentPrice;
END

--
-- INSERT INTO Service Values ('Rental', '12/15/2023', '12/17/2023', 200, 'R')
--
-- SELECT * FROM Service;
-- SELECT * FROM Payment;
-- SELECT * FROM Penalty;
-- SELECT * FROM Rental;
-- SELECT * FROM Bike;
--
-- INSERT INTO Rental VALUES (54, 24, 1, 1)
-- SELECT dbo.GetRentalAmount(24, 54);