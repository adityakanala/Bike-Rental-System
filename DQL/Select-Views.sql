-- VIEW - RevenueByService
SELECT * FROM RevenueByService;
SELECT * FROM RevenueByService r WHERE r.[Revenue Type] = 'Rental';
SELECT * FROM RevenueByService r WHERE r.[Revenue Type] = 'Advertisement';

-- VIEW - RevenueByPerson
SELECT * FROM RevenueByPerson;

-- VIEW - RevenueByDock
SELECT * FROM RevenueByDock;