CREATE VIEW RevenueByDock AS
SELECT d.DockName, d.DockLocation, t.Revenue, t.StartDate, t.EndDate
FROM
    (
        SELECT t.DockID, SUM(s.Amount) AS Revenue, MIN(s.StartDate) AS StartDate, MAX(s.EndDate) AS EndDate
        FROM
            (
                SELECT d.ServiceID, d.DockID
                FROM DockGrouping d
                UNION
                SELECT r.ServiceID, r.DockID
                FROM Rental r
            ) t
                JOIN Service s ON s.ServiceID = t.ServiceID
        GROUP BY t.DockID
    ) t
        JOIN Dock d ON d.DockID = t.DockID;