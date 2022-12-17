CREATE VIEW RevenueByService AS
SELECT
    SUM(s.Amount) AS Revenue,
    CASE ServiceType
        WHEN 'A' THEN 'Advertisement'
        WHEN 'R' THEN 'Rental'
        END AS [Revenue Type]
FROM Service s
GROUP BY s.ServiceType;