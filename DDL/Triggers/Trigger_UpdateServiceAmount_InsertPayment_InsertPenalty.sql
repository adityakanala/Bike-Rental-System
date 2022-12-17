-- DROP TRIGGER Trigger_UpdateServiceAmount_InsertPayment_InsertPenalty;
CREATE TRIGGER Trigger_UpdateServiceAmount_InsertPayment_InsertPenalty
ON Rental
AFTER INSERT
AS
BEGIN
    -- Find INSERTED Service Detail
    DECLARE @serviceID INT, @riderID INT;

    SELECT @serviceID = ServiceID, @riderID = PersonID
    FROM INSERTED;

    PRINT 'Service ID - ' + CAST(@serviceID AS VARCHAR) + ' Rider ID - ' + CAST(@riderID AS VARCHAR);

    -- Insert Payment ROW
    INSERT INTO Payment VALUES ('Pending', @serviceID);

    DECLARE @penalty INT;
    SET @penalty = 0;
    EXEC dbo.GetPenaltyAmount @serviceID, @riderID, @penalty OUTPUT;
    PRINT @penalty;

    -- INSERT Penalty ROW If penalty exist
    IF @penalty > 0
    BEGIN
        DECLARE @paymentID INT;
        SELECT @paymentID = MAX(PaymentID)
        FROM Payment;
        PRINT @paymentID;

        INSERT INTO Penalty VALUES (@penalty, 'Penalty', @paymentID);
    END

    -- Update Service - Rental Amount value
    DECLARE @totalRent INT;
    SET @totalRent = dbo.GetRentalAmount(@riderID, @serviceID);
    PRINT @totalRent;

    UPDATE Service
    SET Amount = @totalRent + @penalty
    WHERE Service.ServiceID = @serviceID;
END
