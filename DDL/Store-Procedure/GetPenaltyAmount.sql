CREATE PROCEDURE GetPenaltyAmount
    @serviceID INT,
    @riderID INT,
    @amount INT OUTPUT
AS
BEGIN
    DECLARE @subscriptionStartDate DATE,@subscriptionEndDate DATE, @serviceStartDate Date, @serviceEndDate DATE, @penaltyDays INT;

    SELECT @serviceStartDate=s.StartDate, @serviceEndDate= s.EndDate
    FROM Service s
    WHERE s.ServiceID=@serviceID


    SELECT @subscriptionStartDate = s.StartDate, @subscriptionEndDate= s.EndDate
    FROM Subscription s JOIN Rider r ON s.SubscriptionID=r.SubscriptionID
    WHERE r.PersonID=@riderID

    SET @penaltyDays=0;
    SET @amount = 0;


    IF(@serviceStartDate < @subscriptionStartDate)
	BEGIN
        SET @penaltyDays = DATEDIFF(DAY,@serviceStartDate, @subscriptionStartDate)
    END

    IF(@serviceEndDate > @subscriptionEndDate)
	BEGIN
        SET @penaltyDays = DATEDIFF(DAY,@subscriptionEndDate, @serviceEndDate) + @penaltyDays;
    END

    SET @amount = @penaltyDays * 10;
END
GO

