-- Get Number of Advertisement Shown on Dock by Dates.

CREATE PROCEDURE GetAdvertisementCountByDock @startDate DATE, @endDate DATE 
AS
BEGIN
    SELECT dg.DockID, d.DockName, COUNT(*) AS AdvertisementCount
    FROM DockGrouping dg JOIN Dock d ON dg.DockID = d.DockID
    WHERE dg.StartDate >= @startDate AND dg.EndDate <= @endDate
    GROUP By dg.DockID, d.DockName;
END
GO

-- EXEC GetAdvertisementCountByDock '01/01/2020', '12/31/2024';
