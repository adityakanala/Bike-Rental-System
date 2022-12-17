USE [bluebike]
GO

-- DROP SYMMETRIC KEY Person_SM;
-- DROP CERTIFICATE PersonPassword;
-- DROP MASTER KEY;

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'BlueBike@1234';
CREATE CERTIFICATE PersonPassword WITH SUBJECT = 'Person Password';

CREATE SYMMETRIC KEY Person_SM WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE PersonPassword;
OPEN SYMMETRIC KEY Person_SM DECRYPTION BY CERTIFICATE PersonPassword;

-- Person Table Values Insertion--

INSERT INTO Person VALUES
      --Advertisers--
      ('Aditya', 'aditya@gmail.com', '75 Saint Alphonsus Street', 'Boston', 'MA', 1234567890, 02120, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Rajat', 'rajat@gmail.com', '75 Saint Alphonsus Street', 'Boston', 'MA', 1234567899, 02120, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Sanjana', 'sanjana@gmail.com', 'Park Drive', 'Boston', 'MA', 1111111111, 02215, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Saranya', 'saranya@gmail.com', 'Brighton', 'Boston', 'MA', 1223456789, 02135, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Swaroop', 'swaroop@gmail.com', '95 Saint Alphonsus Street', 'Boston', 'MA', 1233456789, 02120, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Sishwa', 'sishwa@gmail.com', '100 Alphonsus Street', 'Boston', 'MA', 1234456789, 02111, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Mohit', 'mohit@gmail.com', 'Boylston Street', 'Boston', 'MA', 1234556789, 02219, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Sahithi', 'sahithi@gmail.com', 'Tremont Street', 'Boston', 'MA', 1234566789, 02122, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Rithvik', 'rithvik@gmail.com', 'Huntington Ave', 'Boston', 'MA', 1234567789, 02100, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      ('Mahith', 'mahith@gmail.com', 'Roxbury Crossing', 'Boston', 'MA', 1234567889, 02121, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0),
      --Riders--
      ('Joseph', 'joseph@gmail.com', 'Mission Hill', 'Boston', 'MA', 1212121212, 02111, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Peter', 'peter@gmail.com', 'Mission Main', 'Boston', 'MA', 1234567892, 02110, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Messi', 'messi@gmail.com', 'Brooklyn', 'Boston', 'MA', 1234567893, 02140, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Ronaldo', 'ronaldo@gmail.com', 'Backbay', 'Boston', 'MA', 1234567894, 02126, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('David', 'david@gmail.com', 'Dorchester', 'Boston', 'MA', 1234567895, 02107, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Manuel', 'manuel@gmail.com', 'Jamaica Plain', 'Boston', 'MA', 1234567896, 02158, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Bruno', 'bruno@gmail.com', 'Arlington', 'Boston', 'MA', 1234567897 , 02128, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Pep', 'pep@gmail.com', 'Symphony', 'Boston', 'MA', 1234567891, 02113, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Vijay', 'vijay@gmail.com', 'Heath Street', 'Boston', 'MA', 1234567898, 02101, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),
      ('Namrata', 'namrata@gmail.com', 'Prudential', 'Boston', 'MA', 1010101010, 02133, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 0, 1),

      -- Rider and Advertiser --
      ('Yash', 'yash@gmail.com', 'Jvue', 'Boston', 'MA', 1010101010, 02133, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 1),
      ('Nitin', 'nitin@gmail.com', 'Jvue', 'Boston', 'MA', 1010101010, 02133, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 1),
      ('Chakri', 'chakri@gmail.com', 'Jvue', 'Boston', 'MA', 1010101010, 02133, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 1);

--- Advertiser Table Values Insertion ---
INSERT INTO Advertiser VALUES
    (1, 'Alphabet'),
    (2, 'Amazon'),
    (3, 'Walmart'),
    (4, 'Apple'),
    (5, 'CVS Health'),
    (6, 'United Health Group'),
    (7, 'Exxon Mobil'),
    (8, 'Berkshire Hathaway'),
    (9, 'Bank Of America'),
    (10, 'Dell Technologies');

--- Subscription Table Values Insertion ---
INSERT INTO Subscription VALUES
    ('One Week November 2022', '2022-11-01', '2022-11-07'),
    ('Two Weeks November 2022', '2021-11-01', '2022-11-14'),
    ('Three Weeks November 2022', '2022-11-01', '2022-11-21'),
    ('Full November 2022','2022-11-01', '2022-11-30'),
    ('One Week December 2022', '2022-12-01', '2022-12-07'),
    ('Two Week December 2022', '2021-12-01', '2022-12-14'),
    ('Three Week December 2022', '2022-12-01', '2022-12-21'),
    ('Full December 2022', '2022-12-01', '2022-12-31'),
    ('One Week January 2023', '2023-01-01', '2023-01-07'),
    ('Two Week January 2023', '2023-01-01', '2023-01-14'),
    ('Three Week January 2023', '2023-01-01', '2023-01-21'),
    ('Full January 2023', '2023-01-01', '2023-01-31');

--- Rider Table Values Insertion ---
INSERT INTO Rider
VALUES
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 10),
    (21, 9),
    (22, 10),
    (23, 11);

-- Trek Bikes, Giant Bicycle, Redline, Bianchi, Davidson
-- Insert BikeCategory
INSERT INTO BikeCategory VALUES('Trek', 'Mountain Bikes');
INSERT INTO BikeCategory VALUES('Trek', 'Road Bikes');
INSERT INTO BikeCategory VALUES('Giant', 'Mountain Bikes');
INSERT INTO BikeCategory VALUES('Giant', 'Road Bikes');
INSERT INTO BikeCategory VALUES('Redline', 'Mountain Bikes');
INSERT INTO BikeCategory VALUES('Redline', 'Road Bikes');
INSERT INTO BikeCategory VALUES('Bianchi', 'Mountain Bikes');
INSERT INTO BikeCategory VALUES('Bianchi', 'Road Bikes');
INSERT INTO BikeCategory VALUES('Davidson', 'Mountain Bikes');
INSERT INTO BikeCategory VALUES('Davidson', 'Road Bikes');

-- Insert Bike
INSERT INTO Bike VALUES('Top Fuel', 20, 'Available', 1);
INSERT INTO Bike VALUES('Pro Caliber', 20, 'In-Use', 2);
INSERT INTO Bike VALUES('Madone', 30, 'Available', 3);
INSERT INTO Bike VALUES('Domane', 30, 'In-Use', 4);
INSERT INTO Bike VALUES('Checkpoint', 40, 'Available', 5);
INSERT INTO Bike VALUES('FX Sport 6', 40, 'In-Use', 6);
INSERT INTO Bike VALUES('FX Sport 6', 50, 'Available', 7);
INSERT INTO Bike VALUES('FX+2', 50, 'Broken', 8);
INSERT INTO Bike VALUES('Dual Sport Stagger', 45, 'Available', 9);
INSERT INTO Bike VALUES('Allant', 45, 'Broken', 10);

INSERT INTO DOCK VALUES ('Heath Street', 'Boston');
INSERT INTO DOCK VALUES ('Back of the Hill', 'Boston');
INSERT INTO DOCK VALUES ('Riverway', 'Boston');
INSERT INTO DOCK VALUES ('Mission Park', 'Boston');
INSERT INTO DOCK VALUES ('Fenwood Road', 'Boston');
INSERT INTO DOCK VALUES ('Brigham Circle', 'Boston');
INSERT INTO DOCK VALUES ('Longwood Medical Area', 'Boston');
INSERT INTO DOCK VALUES ('Museum of Fine Arts', 'Boston');
INSERT INTO DOCK VALUES ('Northeastern University', 'Boston');
INSERT INTO DOCK VALUES ('Symphony', 'Boston');

INSERT INTO Service Values ('Advertisement', '2022-11-01', '2022-11-07', 1000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-11-01', '2022-11-14', 2000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-11-01', '2022-11-21', 3000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-11-01', '2022-11-30', 4000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-12-01', '2022-12-07', 1000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-12-01', '2022-12-14', 2000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-12-01', '2022-12-21', 3000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-12-01', '2022-12-31', 4000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-01-01', '2023-01-07', 1000, 'A');
INSERT INTO Service Values ('Advertisement', '2022-01-01', '2023-01-14', 2000, 'A');

INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-07', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-14', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-21', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-11-01', '2022-11-30', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-12-01', '2022-12-07', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-12-01', '2022-12-14', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-12-01', '2022-12-21', 0, 'R');
INSERT INTO Service Values ('Rental', '2022-12-01', '2022-12-31', 0, 'R');
INSERT INTO Service Values ('Rental', '2023-01-01', '2023-01-07', 0, 'R');
INSERT INTO Service Values ('Rental', '2023-01-01', '2023-01-14', 0, 'R');

-- These rental will take service with penalty
-- as their service date outside the subscription date.
INSERT INTO Service Values ('Rental', '2022-12-27', '2023-01-27', 0, 'R'); -- 5 days before + 5 days After
INSERT INTO Service Values ('Rental', '2022-12-27', '2023-01-31', 0, 'R'); -- 5 days before
INSERT INTO Service Values ('Rental', '2023-01-01', '2023-02-05', 0, 'R'); -- 5 days after

INSERT INTO Advertisement Values (1, 1);
INSERT INTO Advertisement Values (2, 2);
INSERT INTO Advertisement Values (3, 3);
INSERT INTO Advertisement Values (4, 4);
INSERT INTO Advertisement Values (5, 5);
INSERT INTO Advertisement Values (6, 6);
INSERT INTO Advertisement Values (7, 7);
INSERT INTO Advertisement Values (8, 8);
INSERT INTO Advertisement Values (9, 9);
INSERT INTO Advertisement Values (10, 10);

INSERT INTO DockGrouping VALUES (1, 1, '2022-11-01', '2022-11-08');
INSERT INTO DockGrouping VALUES (2, 2, '2022-11-01', '2022-11-15');
INSERT INTO DockGrouping VALUES (3, 3, '2022-11-01', '2022-11-22');
INSERT INTO DockGrouping VALUES (4, 4, '2022-11-01', '2022-11-30');
INSERT INTO DockGrouping VALUES (5, 5, '2022-12-01', '2022-12-08');
INSERT INTO DockGrouping VALUES (6, 6, '2022-12-01', '2022-12-15');
INSERT INTO DockGrouping VALUES (7, 7, '2022-12-01', '2022-12-22');
INSERT INTO DockGrouping VALUES (8, 8, '2022-12-01', '2022-12-31');
INSERT INTO DockGrouping VALUES (9, 9, '2022-01-01', '2023-01-08');
INSERT INTO DockGrouping VALUES (10, 10, '2022-01-01', '2023-01-15');

-- Advertisement Payment Only
INSERT INTO Payment VALUES('Done', 1);
INSERT INTO Payment VALUES('Done', 2);
INSERT INTO Payment VALUES('Done', 3);
INSERT INTO Payment VALUES('Done', 4);
INSERT INTO Payment VALUES('Done', 5);
INSERT INTO Payment VALUES('Pending', 6);
INSERT INTO Payment VALUES('Pending', 7);
INSERT INTO Payment VALUES('Pending', 8);
INSERT INTO Payment VALUES('Pending', 9);
INSERT INTO Payment VALUES('Pending', 10);
-- Rental Payment By Trigger

-- INSERT INTO Payment VALUES('Done', 11);
-- INSERT INTO Payment VALUES('Done', 12);
-- INSERT INTO Payment VALUES('Done', 13);
-- INSERT INTO Payment VALUES('Done', 14);
-- INSERT INTO Payment VALUES('Done', 15);
-- INSERT INTO Payment VALUES('Pending', 16);
-- INSERT INTO Payment VALUES('Pending', 17);
-- INSERT INTO Payment VALUES('Pending', 18);
-- INSERT INTO Payment VALUES('Pending', 19);
-- INSERT INTO Payment VALUES('Pending', 20);
-- INSERT INTO Payment VALUES('Pending', 21);

-- Penalty on Rental By Trigger
-- INSERT INTO Penalty VALUES (20, 'Riding on wrong side', 11);
-- INSERT INTO Penalty VALUES (20, 'Riding on wrong side', 12);
-- INSERT INTO Penalty VALUES (20, 'Riding on wrong side', 13);
-- INSERT INTO Penalty VALUES (20, 'Riding on wrong side', 14);
-- INSERT INTO Penalty VALUES (20, 'Riding on wrong side', 15);
-- INSERT INTO Penalty VALUES (20, 'Traffic light jump', 16);
-- INSERT INTO Penalty VALUES (20, 'Traffic light jump', 17);
-- INSERT INTO Penalty VALUES (20, 'Traffic light jump', 18);
-- INSERT INTO Penalty VALUES (20, 'Traffic light jump', 19);
-- INSERT INTO Penalty VALUES (20, 'Traffic light jump', 20);
-- INSERT INTO Penalty VALUES (20, 'Traffic light jump', 21);


-- INSERT INTO Person VALUES ('Manuel', 'manuel@gmail.com', '75 Saint Alphonsus Street', 'Boston', 'MA', 1234567899, 02120, EncryptByKey(Key_GUID('Person_SM'), convert(varbinary,'Pass123')), 1, 0);
-- INSERT INTO Advertiser VALUES (24, 'Northeastern');
-- INSERT INTO Rider VALUES(24, 1);
-- INSERT INTO Service VALUES ('Advertisement', '06/09/2023', '02/08/2024', 5000, 'A')
-- INSERT INTO Service VALUES ('Rental', '06/09/2023', '02/08/2024', 5000, 'R')
-- -- Person 24 has took both the sevices - Advertisement and Rental
-- INSERT INTO Advertisement VALUES (22, 24);
-- INSERT INTO Rental VALUES (23, 24, 1, 1);
