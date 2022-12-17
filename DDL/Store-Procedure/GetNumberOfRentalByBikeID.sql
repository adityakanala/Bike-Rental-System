CREATE PROCEDURE GetNumberOfRentalByBikeID @startDate DATE, @endDate DATE
AS
BEGIN
    SELECT r.BikeID, COUNT(r.ServiceID) AS RentalCount, SUM (selectedService.Amount) AS Revenue
    FROM Rental r
    JOIN 
    (
        SELECT *
        FROM Service s
        WHERE s.StartDate >= @startDate AND s.EndDate <= @endDate
    ) AS selectedService
    ON selectedService.ServiceID = r.ServiceID    
    GROUP BY r.BikeID
END
GO

-- EXEC GetNumberOfRentalByBikeID '01/01/2020','12/31/2024';
-- GO