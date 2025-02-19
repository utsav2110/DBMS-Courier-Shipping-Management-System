set search_path to cms

--  Basic queries with conditions and joins:

-- 1. Get all couriers for a particular customer within a given date range.
SELECT * FROM Courier
WHERE Customer_ID = '23110100002'
  AND Date BETWEEN '08-11-2023' AND '08-12-2023';

-- 2. Get the city name travelled by a particular vehicleID.
SELECT City FROM VehicleCityMapping
WHERE Vehicle_ID = 'GJ06KL0123'; 

-- 3. Get the lost courier within a given date range.
SELECT * FROM Courier
WHERE Status = 'Lost'
AND Date BETWEEN '2024-01-01' AND '2024-01-10';

-- 4. Get the top 5 most rated drivers.
SELECT D.ID, E.Name, D.Rating
FROM Driver D
JOIN Employee E ON D.ID = E.Employee_id
ORDER BY D.Rating DESC
LIMIT 5;

-- 5. Find out the top 5 employees that have been with the company the longest.
SELECT Employee_id, Name, Date_of_Joining
FROM Employee
ORDER BY Date_of_Joining ASC
LIMIT 5;

-- 6. Get Active Couriers of a particular Customer
SELECT C.Reference_ID, C.Date, C.Status, C.Type, P.Amount
FROM Customer CU
INNER JOIN Courier C ON CU.Customer_ID = C.Customer_ID
INNER JOIN Payment P ON C.Reference_ID = P.Reference_ID
WHERE CU.Customer_ID = 23110100003 
AND C.Status IN ('Collected','Shipped', 'Arrived')
ORDER BY C.Date DESC;

-- Queries  with  aggregation  in  SELECT  and  aggregated  conditions  in  HAVING clause: 

-- 7. Get the total weight of couriers sent from a particular city.
SELECT SUM(C.Weight) AS Total_Weight
FROM Courier C
JOIN Branch B ON C.Branch_ID = B.Branch_ID
WHERE B.City = 'Valsad'; 

-- 8. Get the top 5 most frequent destination cities for couriers.
SELECT B.City, COUNT(*) AS Courier_Count
FROM Courier C
JOIN Branch B ON C.To_Branch = B.Branch_ID
GROUP BY B.City
ORDER BY Courier_Count DESC
LIMIT 5;

-- 9. Get the average price per courier for all delivery partners.
SELECT AVG(Price_per_courier) AS Average_Price_Per_Courier
FROM delivery_partner

-- 10. Get the profit earned by a branch in a month and a year.
SELECT B.City, SUM(C.Profit) AS Total_Profit
FROM Courier C
JOIN Branch B ON C.Branch_ID = B.Branch_ID
WHERE EXTRACT(MONTH FROM C.Date) = 11
  AND EXTRACT(YEAR FROM C.Date) = 2023
GROUP BY B.City
ORDER BY total_profit DESC;

-- 11. Get the total courier and average weight shipped by a given Vehicle.
SELECT COUNT(*) AS Total_Couriers, AVG(Weight) AS Average_Weight
FROM Courier
WHERE Vehicle_ID = 'GJ06KL0123'; 

-- 12. Get the total revenue generated by each branch, showing only branches
-- where revenue exceeds 5000 Rupees.
SELECT B.City, C.Branch_ID, SUM(C.Price) AS Total_Revenue
FROM Courier C
JOIN Branch B ON C.Branch_ID = B.Branch_ID
GROUP BY B.City, C.Branch_ID
HAVING SUM(C.Price) > 5000
ORDER BY total_revenue DESC;

-- 13. Get the number of couriers sent by each customer and show only those 
-- who have sent more than 2 couriers.
SELECT Customer_ID, COUNT(*) AS Total_Couriers
FROM Courier
GROUP BY Customer_ID
HAVING COUNT(*) > 2;

-- 14. Find branches that have handled more than 1 courier in a specific month
SELECT Branch_ID, COUNT(*) AS Courier_Count
FROM Courier
WHERE EXTRACT(MONTH FROM Date) = 11  
GROUP BY Branch_ID
HAVING COUNT(*) > 1;

-- 15. Count of Couriers By Type and Status
SELECT C.Type, C.Status, COUNT(C.Reference_ID) AS Courier_Count
FROM Courier C
GROUP BY C.Type, C.Status
ORDER BY C.Type, C.Status;

-- 16. Most Frequently Used Payment Methods
SELECT P.Method, COUNT(P.Payment_ID) AS cnt
FROM Payment P
GROUP BY P.Method
ORDER BY cnt DESC;

-- 17. Total Number of Couriers Handled by Each Delivery Partner
SELECT DP.Name, COUNT(CM.Reference_ID) AS cnt
FROM Delivery_Partner DP
JOIN CourierMapping CM ON DP.Registration_Number = CM.Registration_Number
GROUP BY DP.Name
ORDER BY cnt DESC;

-- 18. Most Profitable Courier Types
SELECT C.Type, SUM(C.Profit) AS Total_Profit
FROM Courier C
GROUP BY C.Type
ORDER BY Total_Profit DESC;

-- 19. Average Delivery Time by Type
SELECT Type, CEIL(AVG((Expected_Delivery_Date - Date))) AS Average_Delivery_Time
FROM Courier
GROUP BY Type;

--  Queries having nested queries:

-- 20. Find vehicles that have not been assigned to any courier
SELECT Vehicle_id
FROM Vehicle
WHERE Vehicle_id NOT IN (SELECT Vehicle_ID FROM Courier);

-- 21. Retrieve all customers who have not provided feedback
SELECT Name, Contact_Of_Sender
FROM Customer
WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Feedback);

--  Queries having aggregation in nested queries:

-- 22. Find couriers that have a distance greater than the average distance of couriers 
-- in the same branch
SELECT Reference_ID, Distance
FROM Courier c1
WHERE Distance > (
    SELECT AVG(Distance)	
	FROM Courier c2
    WHERE c1.Branch_ID = c2.Branch_ID
);

-- 23. Retrieve the vehicles with a capacity greater than 
-- the average capacity of all vehicles 
SELECT Vehicle_ID, Capacity
FROM Vehicle
WHERE Capacity > (SELECT AVG(Capacity) FROM Vehicle);

-- 24. List customers whose total payments are higher than 
-- the average total payment of all customers
SELECT Customer_ID, SUM(Amount) AS Total_Payment
FROM Payment p
JOIN Courier c ON p.Reference_ID = c.Reference_ID
GROUP BY Customer_ID
HAVING SUM(Amount) > (SELECT AVG(Amount) FROM Payment);

-- 25. Get the details of couriers that have a higher 
-- price than the average price of all couriers
SELECT Reference_ID, Price
FROM Courier
WHERE Price > (SELECT AVG(Price) FROM Courier);

-- Correlated queries:

-- 26. Find names of delivery partner who have delivered at least 3 courier
SELECT dp.Name
FROM Delivery_Partner dp
WHERE dp.Registration_Number IN (
    SELECT cm.Registration_Number
    FROM CourierMapping cm where dp.Registration_Number = cm.Registration_Number
    GROUP BY cm.Registration_Number
    HAVING COUNT(cm.Reference_ID) >= 3
);

-- 27. Find details of drivers who have rating less than certain average rating (semi-join)
SELECT e.*,d.vehicle_id
FROM Driver d
JOIN Employee e ON d.ID = e.Employee_id
WHERE d.ID IN (
    SELECT d2.ID
    FROM Driver d2 where d.ID = d2.ID
    GROUP BY d2.ID
    HAVING d2.Rating < (SELECT AVG(Rating)/1.2 FROM Driver)
);

--  Queries with division operation:

-- 28. Retrieve driver details who have driven couriers of all types
SELECT * 
FROM Employee AS e
WHERE e.employee_id = (
    SELECT DISTINCT d.id
    FROM Driver d
    WHERE d.ID NOT IN (
        SELECT ID
        FROM (
            SELECT d.ID AS ID, cour.Type AS Type
            FROM Driver d 
            CROSS JOIN (SELECT DISTINCT Type FROM Courier) AS cour
            EXCEPT
            SELECT d.ID, c.Type
            FROM Driver d 
            JOIN Courier c ON d.Vehicle_ID = c.Vehicle_ID
        ) AS r2
    )
);

-- 29. Find branches that have managed couriers with all possible status
SELECT * FROM branch AS b
WHERE b.branch_id = (
    SELECT DISTINCT bcv.Branch_ID FROM BCV
    WHERE Branch_ID NOT IN (
        SELECT Branch_ID
        FROM (
            SELECT b.Branch_ID AS Branch_ID, cour.Status AS Status 
            FROM Branch b 
            CROSS JOIN (SELECT DISTINCT Status FROM Courier ) AS cour
            EXCEPT
            SELECT bcv.Branch_ID, bcv.Status 
            FROM BCV
        ) AS r2
    )
);

-- 30. Find Promotion Companies Details which are promoted by all the vehicles
SELECT * FROM promotion
WHERE promotion_id = (
    SELECT DISTINCT promotion_id
    FROM VehiclePromotionMapping
    WHERE promotion_id NOT IN (
        SELECT promotion_id
        FROM (
            SELECT v.Vehicle_id AS vid, vpm.promotion_id
            FROM Vehicle v
            CROSS JOIN (SELECT * FROM VehiclePromotionMapping) AS vpm
            EXCEPT
            SELECT vpm.Vehicle_id, vpm.promotion_id
            FROM VehiclePromotionMapping AS vpm
        ) AS r2
    )
);