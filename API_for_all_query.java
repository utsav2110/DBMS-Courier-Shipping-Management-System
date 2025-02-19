import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class API_for_all_query {

    public static void main(String[] args) {
        
        String url = "jdbc:postgresql://localhost:5432/courier";
        String user = "postgres";
        String password = ""; // enter your password here

        Scanner scanner = new Scanner(System.in);
        boolean flag = true;

        try (Connection conn = DriverManager.getConnection(url, user, password)) {

            System.out.println("\n ----------- Basic queries with conditions and joins -----------\n");
            System.out.println("1. Get all couriers for a particular customer within a given date range.");
            System.out.println("2. Get the city name travelled by a particular vehicleID.");
            System.out.println("3. Get the lost courier within a given date range.");
            System.out.println("4. Get the top 5 most rated drivers.");
            System.out.println("5. Find out the top 5 employees that have been with the company the longest.");
            System.out.println("6. Get Active Couriers of a particular customer.");

            System.out.println("\n---------- Queries with aggregation in SELECT and aggregated conditions in HAVING clause -----------\n");
            System.out.println("7. Get the total weight of couriers sent from a particular city.");
            System.out.println("8. Get the top 5 most frequent destination cities for couriers.");
            System.out.println("9. Get the average price per courier for all delivery partners.");
            System.out.println("10. Get the profit earned by a branch in a particular month and a year.");
            System.out.println("11. Get the total courier and average weight shipped by a given Vehicle.");
            System.out.println("12. Get the total revenue generated by each branch, showing only branches where revenue exceeds 5000 Rupees.");
            System.out.println("13. Get the number of couriers sent by each customer and show only those who have sent more than 2 couriers.");
            System.out.println("14. Find branches that have handled more than 1 courier in a specific month.");
            System.out.println("15. Count of Couriers by Type and Status.");
            System.out.println("16. Most Frequently Used Payment Methods.");
            System.out.println("17. Total Number of Couriers Handled by Each Delivery Partner.");
            System.out.println("18. Most Profitable Courier Types.");
            System.out.println("19. Average Delivery Time by Type.");

            System.out.println("\n--------- Queries having nested queries ----------------\n");
            System.out.println("20. Find vehicles that have not been assigned to any courier.");
            System.out.println("21. Retrieve all customers who have not provided feedback.");

            System.out.println("\n ---------- Queries having aggregation in nested queries ------------\n");
            System.out.println("22. Find couriers that have a distance greater than the average distance of couriers in the same branch.");
            System.out.println("23. Retrieve the vehicles with a capacity greater than the average capacity of all vehicles.");
            System.out.println("24. List customers whose total payments are higher than the average total payment of all customers.");
            System.out.println("25. Get the details of couriers that have a higher price than the average price of all couriers.");

            System.out.println("\n ---------- Correlated queries ------------\n");
            System.out.println("26. Find names of delivery partners who have delivered at least 3 couriers.");
            System.out.println("27. Find details of drivers who have ratings less than certain average ratings.");

            System.out.println("\n ------- Queries with division operation ---------- \n");
            System.out.println("28. Retrieve driver details who have driven couriers of all types.");
            System.out.println("29. Find branches that have managed couriers with all possible statuses.");
            System.out.println("30. Find Promotion Companies Details which are promoted by all the vehicles.\n");

            conn.createStatement().execute("SET search_path TO cms;");

            while (flag){

            System.out.print("Please enter a query number (1-30) to run: ");
            int qno = scanner.nextInt();
            String query = getQuery(qno);

            if (!query.isEmpty()) {
                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    
                    ResultSet rs = pstmt.executeQuery();

                    System.out.println("Query result for query number: " + qno);
                    System.out.println("-------------------------------------------------");
                    int noofcolumns = rs.getMetaData().getColumnCount();
                    
                    while (rs.next()) {
                        for (int i = 1; i <= noofcolumns; i++) {
                            String name = rs.getMetaData().getColumnName(i);
                            String val = rs.getString(i);
                            System.out.printf("%-20s : %s\n", name, val);
                        }
                        System.out.println("-------------------------------------------------");
                    }
                }
            } else {
                System.out.println("Invalid query number.");
            }
            System.out.print("Do you want to run another query? (y/n) : ");
            String ans = scanner.next();
            if (!ans.equalsIgnoreCase("yes") && !ans.equalsIgnoreCase("y")){
                flag = false;
                System.out.println("\n");
            }
          }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        scanner.close();
    }
   
    public static String getQuery(int qno) {
        switch (qno) {
        case 1:
            System.out.println("1. Get all couriers for a particular customer within a given date range.");
            return "SELECT * FROM Courier WHERE Customer_ID = '23110100002' AND Date BETWEEN '08-11-2023' AND '08-12-2023';";

        case 2:
            System.out.println("2. Get the city name travelled by a particular vehicleID. (Ex. GJ06KL0123)");
            return "SELECT City FROM VehicleCityMapping WHERE Vehicle_ID = 'GJ06KL0123';";

        case 3:
            System.out.println("3. Get the lost courier within a given date range.");
            return "SELECT * FROM Courier WHERE Status = 'Lost' AND Date BETWEEN '2024-01-01' AND '2024-01-10';";

        case 4:
            System.out.println("4. Get the top 5 most rated drivers.");
            return "SELECT D.ID, E.Name, D.Rating FROM Driver D JOIN Employee E ON D.ID = E.Employee_id ORDER BY D.Rating DESC LIMIT 5;";

        case 5:
            System.out.println("5. Find out the top 5 employees that have been with the company the longest.");
            return "SELECT Employee_id, Name, Date_of_Joining FROM Employee ORDER BY Date_of_Joining ASC LIMIT 5;";

        case 6:
            System.out.println("6. Get Active Couriers of a particular customer.");
            return "SELECT C.Reference_ID, C.Date, C.Status, C.Type, P.Amount FROM Customer CU INNER JOIN Courier C ON CU.Customer_ID = C.Customer_ID INNER JOIN Payment P ON C.Reference_ID = P.Reference_ID WHERE CU.Customer_ID = 23110100003 AND C.Status IN ('Collected', 'Shipped', 'Arrived') ORDER BY C.Date DESC;";

        case 7:
            System.out.println("7. Get the total weight of couriers sent from a particular city.");
            return "SELECT SUM(C.Weight) AS Total_Weight FROM Courier C JOIN Branch B ON C.Branch_ID = B.Branch_ID WHERE B.City = 'Valsad';";
            
        case 8:
            System.out.println("8. Get the top 5 most frequent destination cities for couriers.");
            return "SELECT B.City, COUNT(*) AS Courier_Count FROM Courier C JOIN Branch B ON C.To_Branch = B.Branch_ID GROUP BY B.City ORDER BY Courier_Count DESC LIMIT 5;";

        case 9:
            System.out.println("9. Get the average price per courier for all delivery partners.");
            return "SELECT AVG(Price_per_courier) AS Average_Price_Per_Courier FROM delivery_partner;";

        case 10:
            System.out.println("10. Get the profit earned by a branch in a particular month and year.");
            return "SELECT B.City, SUM(C.Profit) AS Total_Profit FROM Courier C JOIN Branch B ON C.Branch_ID = B.Branch_ID WHERE EXTRACT(MONTH FROM C.Date) = 11 AND EXTRACT(YEAR FROM C.Date) = 2023 GROUP BY B.City ORDER BY Total_Profit DESC;";

        case 11:
            System.out.println("11. Get the total courier and average weight shipped by a given vehicle (e.g., GJ06KL0123).");
            return "SELECT COUNT(*) AS Total_Couriers, AVG(Weight) AS Average_Weight FROM Courier WHERE Vehicle_ID = 'GJ06KL0123';";

        case 12:
            System.out.println("12. Get the total revenue generated by each branch, showing only branches where revenue exceeds 5000 Rupees.");
            return "SELECT B.City, C.Branch_ID, SUM(C.Price) AS Total_Revenue FROM Courier C JOIN Branch B ON C.Branch_ID = B.Branch_ID GROUP BY B.City, C.Branch_ID HAVING SUM(C.Price) > 5000 ORDER BY Total_Revenue DESC;";

        case 13:
            System.out.println("13. Get the number of couriers sent by each customer and show only those who have sent more than 2 couriers.");
            return "SELECT Customer_ID, COUNT() AS Total_Couriers FROM Courier GROUP BY Customer_ID HAVING COUNT() > 2;";

        case 14:
            System.out.println("14. Find branches that have handled more than 1 courier in a specific month.");
            return "SELECT Branch_ID, COUNT() AS Courier_Count FROM Courier WHERE EXTRACT(MONTH FROM Date) = 11 GROUP BY Branch_ID HAVING COUNT() > 1;";

        case 15:
            System.out.println("15. Count couriers by type and status.");
            return "SELECT C.Type, C.Status, COUNT(C.Reference_ID) AS Courier_Count FROM Courier C GROUP BY C.Type, C.Status ORDER BY C.Type, C.Status;";

        case 16:
            System.out.println("16. Most frequently used payment methods.");
            return "SELECT P.Method, COUNT(P.Payment_ID) AS cnt FROM Payment P GROUP BY P.Method ORDER BY cnt DESC;";

        case 17:
            System.out.println("17. Total number of couriers handled by each delivery partner.");
            return "SELECT DP.Name, COUNT(CM.Reference_ID) AS cnt FROM Delivery_Partner DP JOIN CourierMapping CM ON DP.Registration_Number = CM.Registration_Number GROUP BY DP.Name ORDER BY cnt DESC;";

        case 18:
            System.out.println("18. Most profitable courier types.");
            return "SELECT C.Type, SUM(C.Profit) AS Total_Profit FROM Courier C GROUP BY C.Type ORDER BY Total_Profit DESC;";

        case 19:
            System.out.println("19. Average delivery time by type.");
            return "SELECT Type, CEIL(AVG((Expected_Delivery_Date - Date))) AS Average_Delivery_Time FROM Courier GROUP BY Type;";

        case 20:
            System.out.println("20. Find vehicles that have not been assigned to any courier.");
            return "SELECT Vehicle_id FROM Vehicle WHERE Vehicle_id NOT IN (SELECT Vehicle_ID FROM Courier);";

        case 21:
            System.out.println("21. Retrieve all customers who have not provided feedback.");
            return "SELECT Name, Contact_Of_Sender FROM Customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Feedback);";

        case 22:
            System.out.println("22. Find couriers that have a distance greater than the average distance of couriers in the same branch.");
            return "SELECT Reference_ID, Distance FROM Courier c1 WHERE Distance > (SELECT AVG(Distance) FROM Courier c2 WHERE c1.Branch_ID = c2.Branch_ID);";

        case 23:
            System.out.println("23. Retrieve vehicles with a capacity greater than the average capacity of all vehicles.");
            return "SELECT Vehicle_ID, Capacity FROM Vehicle WHERE Capacity > (SELECT AVG(Capacity) FROM Vehicle);";

        case 24:
            System.out.println("24. List customers whose total payments are higher than the average total payment of all customers.");
            return "SELECT Customer_ID, SUM(Amount) AS Total_Payment FROM Payment p JOIN Courier c ON p.Reference_ID = c.Reference_ID GROUP BY Customer_ID HAVING SUM(Amount) > (SELECT AVG(Amount) FROM Payment);";

        case 25:
            System.out.println("25. Get details of couriers with a price higher than the average price of all couriers.");
            return "SELECT Reference_ID, Price FROM Courier WHERE Price > (SELECT AVG(Price) FROM Courier);";

        case 26:
            System.out.println("26. Find names of delivery partners who have delivered at least 3 couriers.");
            return "SELECT dp.Name FROM Delivery_Partner dp WHERE dp.Registration_Number IN (SELECT cm.Registration_Number FROM CourierMapping cm WHERE dp.Registration_Number = cm.Registration_Number GROUP BY cm.Registration_Number HAVING COUNT(cm.Reference_ID) >= 3);";

        case 27:
            System.out.println("27. Find details of drivers with ratings less than a certain average rating.");
            return "SELECT e.*, d.vehicle_id FROM Driver d JOIN Employee e ON d.ID = e.Employee_id WHERE d.ID IN (SELECT d2.ID FROM Driver d2 WHERE d.ID = d2.ID GROUP BY d2.ID HAVING d2.Rating < (SELECT AVG(Rating)/1.2 FROM Driver));";

        case 28:
            System.out.println("28. Retrieve driver details who have driven couriers of all types.");
            return "SELECT * FROM Employee AS e WHERE e.employee_id = (SELECT DISTINCT d.id FROM Driver d WHERE d.ID NOT IN (SELECT ID FROM (SELECT d.ID AS ID, cour.Type AS Type FROM Driver d CROSS JOIN (SELECT DISTINCT Type FROM Courier) AS cour EXCEPT SELECT d.ID, c.Type FROM Driver d JOIN Courier c ON d.Vehicle_ID = c.Vehicle_ID) AS r2));";

        case 29:
            System.out.println("29. Find branches that have managed couriers with all possible statuses.");
            return "SELECT * FROM branch AS b WHERE b.branch_id = (SELECT DISTINCT bcv.Branch_ID FROM BCV WHERE Branch_ID NOT IN (SELECT Branch_ID FROM (SELECT b.Branch_ID AS Branch_ID, cour.Status AS Status FROM Branch b CROSS JOIN (SELECT DISTINCT Status FROM Courier) AS cour EXCEPT SELECT bcv.Branch_ID, bcv.Status FROM BCV) AS r2));";

        case 30:
            System.out.println("30. Find Promotion Companies Details which are promoted by all the vehicles.");
            return "SELECT * FROM promotion WHERE promotion_id = (SELECT DISTINCT promotion_id FROM VehiclePromotionMapping WHERE promotion_id NOT IN (SELECT promotion_id FROM (SELECT v.Vehicle_id AS vid, vpm.promotion_id FROM Vehicle v CROSS JOIN (SELECT * FROM VehiclePromotionMapping) AS vpm EXCEPT SELECT vpm.Vehicle_id, vpm.promotion_id FROM VehiclePromotionMapping AS vpm) AS r2));";

        default:
            return "";
        }
    }
}