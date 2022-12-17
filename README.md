# bike-rental-dbms

Sequence of file execution -
1. Create-Tables.sql -  DDL/Create-Tables.sql
2. Alter-Tables.sql - 
3. Create Views - RevenueByService, RevenueByPerson, RevenueByDock
4. Create-Indexes.sql
5. Create Procedures - GetAdvertisementCountByDock.sql, GetNumberOfRentalByBikeID.sql, GetPenaltyAmount.sql
6. Create Functions - GetRentalAmount.sql
7. Create-Trigger.sql
8. Insert-Data.sql
9. Insert-Data-Trigger.sql
10. Select-Tables.sql 
11. Select-Views.sql
12. Execute-StoredProcedure.sql

Data visualization tool configuration steps -  
1. Install [PowerBI](https://www.microsoft.com/en-us/download/details.aspx?id=58494) for data visualization.
2. Open the Power BI file [VisualizationAfterData.pbix](DataVisualization/VisualizationAfterData.pbix) [VisualizationBeforeData.pbix](DataVisualization/VisualizationBeforeData.pbix).
3. Our Visualization showcases 3 types of graphs - 
   - Bar Graph - Price Range of Each Bike: 
     - It displays the rent prices of all the type of bikes being used in the project.
   - Pie Chart - Percentage of Total Amount Spent by Each Service Type:
     - It displays the percentage of sum of the pricing amounts being levied on the users. 
   - Dotted Chart - Start Date of Each Service ID: 
     - It displays the date when a service has started.

Important Links - 
[DDL](DDL)
[DML](DML)
[DQL](DQL)
[Documentation](Documentation)
[DataVisualization](DataVisualization)