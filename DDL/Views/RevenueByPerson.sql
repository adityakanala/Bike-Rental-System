CREATE VIEW RevenueByPerson AS
SELECT p.Name, t.Revenue, t.RevenueType FROM
    (
        (
            SELECT t1.PersonID, SUM(t1.Amount) AS Revenue, 'Total' AS RevenueType
            FROM
                (
                    SELECT a.PersonID, s.Amount, s.ServiceType
                    FROM Service s JOIN Advertisement a
                                        ON s.ServiceID = a.ServiceID
                    UNION
                    SELECT r.PersonID, s.Amount, s.ServiceType
                    FROM Service s JOIN Rental r
                                        ON s.ServiceID = r.ServiceID
                ) t1
            GROUP BY t1.PersonID
        )
        UNION
        (
            SELECT a.PersonID, s.Amount AS Revenue,
                   CASE s.ServiceType
                       WHEN 'A' THEN 'Advertisement'
                       END AS 'RevenueType'
            FROM Service s JOIN Advertisement a
                                ON s.ServiceID = a.ServiceID
            UNION
            SELECT r.PersonID, s.Amount ,
                   CASE s.ServiceType
                       WHEN 'R' THEN 'Rental'
                       END AS 'RevenueType'
            FROM Service s JOIN Rental r
                                ON s.ServiceID = r.ServiceID
        )
    ) t
        JOIN person p ON p.PersonID = t.PersonID;