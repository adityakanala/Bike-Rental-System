OPEN SYMMETRIC KEY Person_SM DECRYPTION BY CERTIFICATE PersonPassword;
SELECT *, CONVERT(varchar, DecryptByKey([Password])) AS 'Decrypted password' FROM dbo.Person;
-- SELECT * FROM Person;

SELECT * FROM Advertiser;
SELECT * FROM Subscription;
SELECT * FROM Rider;
SELECT * FROM BikeCategory;
SELECT * FROM Bike;
SELECT * FROM Dock;
SELECT * FROM Service;
SELECT * FROM Advertisement;
SELECT * FROM Rental;
SELECT * FROM DockGrouping;
SELECT * FROM Payment;
SELECT * FROM Penalty;
