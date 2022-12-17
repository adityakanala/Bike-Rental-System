-- Rental
-- - ServiceID + PersonID -  For view - RevenueByPerson
CREATE UNIQUE INDEX RentalRevenueByPerson
ON Rental(ServiceID,PersonID);

-- - ServiceID + DockID - Index - For view - RevenueByDock
CREATE UNIQUE INDEX RentalRevenueByDock
ON Rental(ServiceID,DockID);
--
-- Service
-- - ServiceID + Amount + ServiceType
CREATE UNIQUE INDEX ServiceIndex
on Service(ServiceID,Amount,ServiceType);

-- --TO see the indexes in each table
-- sp_helpindex 'Rental'
-- sp_helpindex 'Service'
