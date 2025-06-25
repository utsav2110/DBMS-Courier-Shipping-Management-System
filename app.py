import streamlit as st
import pandas as pd
import psycopg  
from sqlalchemy import create_engine
from urllib.parse import quote_plus
import plotly.express as px 

db_info = st.secrets["postgres"]  

def connect_db():
    conn = psycopg.connect(
        host=db_info["host"],
        port=db_info["port"],
        dbname=db_info["database"],
        user=db_info["user"],
        password=db_info["password"],
        sslmode="require"  
    )
    return conn

conn = connect_db()
cursor = conn.cursor()

host = db_info["host"]
port = db_info["port"]
dbname = db_info["database"]
user = quote_plus(db_info["user"])
password = quote_plus(db_info["password"])

engine = create_engine(f'postgresql+psycopg://{user}:{password}@{host}:{port}/{dbname}?sslmode=require')

st.set_page_config(page_title="Courier Management System", layout="wide")
st.success("✅ Connected to Supabase PostgreSQL Database!")
st.title("📦 Courier Shipping Management System")


tab1, tab2, tab3, tab4 = st.tabs([
    "📄 View Tables", 
    "🧠 View Queries", 
    "➕ Insert Data", 
    "📊 Graphs"
])


with tab1:
    st.header("📄 View Tables")

    tables = [
        "branch", "vehicle", "employee", "driver", "clerk", "it_support",
        "customer", "courier", "delivery_partner", "feedback", "insurance",
        "payment", "promotion", "couriermapping", "vehiclecitymapping",
        "vehiclepromotionmapping", "works_on"
    ]
    
    selected_table = st.selectbox("Select a table to view:", tables)

    if selected_table:
        try:
            query = f"SELECT * FROM {selected_table}"
            df = pd.read_sql(query, engine)
            st.dataframe(df)
        except Exception as e:
            st.error(f"Error: {e}")


with tab2:
    st.header("🧠 Run Predefined Queries")

    query_options = {

        "Basic Queries with Conditions and Joins":{
        "1. Couriers for a Customer in Date Range": """
            SELECT * FROM Courier
            WHERE Customer_ID = '23110100002'
            AND Date BETWEEN '11-08-2023' AND '12-08-2023';
        """,
        "2. City Traveled by a Vehicle": """
            SELECT City FROM VehicleCityMapping
            WHERE Vehicle_ID = 'GJ06KL0123';
        """,
        "3. Lost Couriers in Date Range": """
            SELECT * FROM Courier
            WHERE Status = 'Lost'
            AND Date BETWEEN '2024-01-01' AND '2024-01-10';
        """,
        "4. Top 5 Most Rated Drivers": """
            SELECT D.ID, E.Name, D.Rating
            FROM Driver D
            JOIN Employee E ON D.ID = E.Employee_id
            ORDER BY D.Rating DESC
            LIMIT 5;
        """,
        "5. Top 5 Longest Serving Employees": """
            SELECT Employee_id, Name, Date_of_Joining
            FROM Employee
            ORDER BY Date_of_Joining ASC
            LIMIT 5;
        """,
        "6. Active Couriers of a Customer": """
            SELECT C.Reference_ID, C.Date, C.Status, C.Type, P.Amount
            FROM Customer CU
            INNER JOIN Courier C ON CU.Customer_ID = C.Customer_ID
            INNER JOIN Payment P ON C.Reference_ID = P.Reference_ID
            WHERE CU.Customer_ID = 23110100003 
            AND C.Status IN ('Collected','Shipped', 'Arrived')
            ORDER BY C.Date DESC;
        """
        },

        "Queries  with  aggregation  in  SELECT  and  aggregated  conditions  in  HAVING clause" : {
        "7. Total Weight by City": """
            SELECT SUM(C.Weight) AS Total_Weight
            FROM Courier C
            JOIN Branch B ON C.Branch_ID = B.Branch_ID
            WHERE B.City = 'Valsad';
        """,
        "8. Top 5 Destination Cities for Couriers": """
            SELECT B.City, COUNT(*) AS Courier_Count
            FROM Courier C
            JOIN Branch B ON C.To_Branch = B.Branch_ID
            GROUP BY B.City
            ORDER BY Courier_Count DESC
            LIMIT 5;
        """,
        "9. Average Price per Courier for Delivery Partners": """
            SELECT AVG(Price_per_courier) AS Average_Price_Per_Courier
            FROM delivery_partner;
        """,
        "10. Monthly Profit by Branch (Nov 2023)": """
            SELECT B.City, SUM(C.Profit) AS Total_Profit
            FROM Courier C
            JOIN Branch B ON C.Branch_ID = B.Branch_ID
            WHERE EXTRACT(MONTH FROM C.Date) = 11
            AND EXTRACT(YEAR FROM C.Date) = 2023
            GROUP BY B.City
            ORDER BY total_profit DESC;
        """,
        "11. Total Couriers and Avg Weight by Vehicle": """
            SELECT COUNT(*) AS Total_Couriers, AVG(Weight) AS Average_Weight
            FROM Courier
            WHERE Vehicle_ID = 'GJ06KL0123';
        """,
        "12. Branches with Revenue > 5000": """
            SELECT B.City, C.Branch_ID, SUM(C.Price) AS Total_Revenue
            FROM Courier C
            JOIN Branch B ON C.Branch_ID = B.Branch_ID
            GROUP BY B.City, C.Branch_ID
            HAVING SUM(C.Price) > 5000
            ORDER BY total_revenue DESC;
        """,
        "13. Customers Who Sent More Than 2 Couriers": """
            SELECT Customer_ID, COUNT(*) AS Total_Couriers
            FROM Courier
            GROUP BY Customer_ID
            HAVING COUNT(*) > 2;
        """,
        "14. Branches With More Than 1 Courier (Nov)": """
            SELECT Branch_ID, COUNT(*) AS Courier_Count
            FROM Courier
            WHERE EXTRACT(MONTH FROM Date) = 11  
            GROUP BY Branch_ID
            HAVING COUNT(*) > 1;
        """,
        "15. Courier Count by Type and Status": """
            SELECT C.Type, C.Status, COUNT(C.Reference_ID) AS Courier_Count
            FROM Courier C
            GROUP BY C.Type, C.Status
            ORDER BY C.Type, C.Status;
        """,
        "16. Most Frequently Used Payment Methods": """
            SELECT P.Method, COUNT(P.Payment_ID) AS cnt
            FROM Payment P
            GROUP BY P.Method
            ORDER BY cnt DESC;
        """,
        "17. Total Couriers per Delivery Partner": """
            SELECT DP.Name, COUNT(CM.Reference_ID) AS cnt
            FROM Delivery_Partner DP
            JOIN CourierMapping CM ON DP.Registration_Number = CM.Registration_Number
            GROUP BY DP.Name
            ORDER BY cnt DESC;
        """,
        "18. Most Profitable Courier Types": """
            SELECT C.Type, SUM(C.Profit) AS Total_Profit
            FROM Courier C
            GROUP BY C.Type
            ORDER BY Total_Profit DESC;
        """,
        "19. Average Delivery Time by Type": """
            SELECT Type, CEIL(AVG((Expected_Delivery_Date - Date))) AS Average_Delivery_Time
            FROM Courier
            GROUP BY Type;
        """
        },

        "Queries having nested queries" : {
        "20. Vehicles Not Assigned to Any Courier": """
            SELECT Vehicle_id
            FROM Vehicle
            WHERE Vehicle_id NOT IN (SELECT Vehicle_ID FROM Courier);
        """,
        "21. Customers Without Feedback": """
            SELECT Name, Contact_Of_Sender
            FROM Customer
            WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Feedback);
        """
        },

        "Queries having aggregation in nested queries" : {
        "22. Couriers With Above Average Distance in Branch": """
            SELECT Reference_ID, Distance
            FROM Courier c1
            WHERE Distance > (
                SELECT AVG(Distance)	
                FROM Courier c2
                WHERE c1.Branch_ID = c2.Branch_ID
            );
        """,
        "23. Vehicles With Capacity Above Average": """
            SELECT Vehicle_ID, Capacity
            FROM Vehicle
            WHERE Capacity > (SELECT AVG(Capacity) FROM Vehicle);
        """,
        "24. Customers With Above Average Total Payments": """
            SELECT Customer_ID, SUM(Amount) AS Total_Payment
            FROM Payment p
            JOIN Courier c ON p.Reference_ID = c.Reference_ID
            GROUP BY Customer_ID
            HAVING SUM(Amount) > (SELECT AVG(Amount) FROM Payment);
        """,
        "25. Couriers With Price Above Average": """
            SELECT Reference_ID, Price
            FROM Courier
            WHERE Price > (SELECT AVG(Price) FROM Courier);
        """
        },

        "Correlated queries" : {
        "26. Delivery Partners with ≥3 Couriers": """
            SELECT dp.Name
            FROM Delivery_Partner dp
            WHERE dp.Registration_Number IN (
                SELECT cm.Registration_Number
                FROM CourierMapping cm 
                WHERE dp.Registration_Number = cm.Registration_Number
                GROUP BY cm.Registration_Number
                HAVING COUNT(cm.Reference_ID) >= 3
            );
        """,
        "27. Drivers With Rating Below Adjusted Average": """
            SELECT e.*, d.vehicle_id
            FROM Driver d
            JOIN Employee e ON d.ID = e.Employee_id
            WHERE d.ID IN (
                SELECT d2.ID
                FROM Driver d2 
                WHERE d.ID = d2.ID
                GROUP BY d2.ID
                HAVING d2.Rating < (SELECT AVG(Rating)/1.2 FROM Driver)
            );
        """
        },
        "Queries with division operation" :{
        "28. Drivers Who Drove Couriers of All Types": """
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
        """,
        "29. Branches Managing Couriers of All Statuses": """
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
        """,
        "30. Promotions Done by All Vehicles": """
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
        """
        }
    }

    section_name = st.selectbox("📁 Choose Query Section", list(query_options.keys()))

    if section_name:
        query_options = query_options[section_name]
        query_name = st.selectbox("🔍 Choose a query", list(query_options.keys()))

        if query_name:
            with st.expander("📄 Show SQL Query"):
                st.code(query_options[query_name], language='sql')
            try:
                df = pd.read_sql(query_options[query_name], engine)
                st.dataframe(df)
            except Exception as e:
                st.error(f"Error executing query: {e}")


with tab3:
    st.header("➕ Insert Data into Tables")

    table_choice = st.selectbox("Select table to insert data", ["branch", "employee", "vehicle","feedback"])

    if table_choice == "branch":
        st.subheader("Insert into Branch Table")

        branch_id = st.number_input("Branch ID", step=1)
        city = st.text_input("City")
        pincode = st.number_input("Pincode", step=1)

        if st.button("Insert Branch"):
            try:
                cur = conn.cursor()
                insert_query = """
                    INSERT INTO branch (branch_id, city, pincode)
                    VALUES (%s, %s, %s)
                """
                cur.execute(insert_query, (branch_id, city, pincode))
                conn.commit()
                st.success("Branch inserted successfully.")
            except Exception as e:
                conn.rollback()
                st.error(f"Error inserting branch: {e}")

    if table_choice == "vehicle":
        st.subheader("Insert into Vehicle Table")

        vehicle_id = st.text_input("Vehicle ID")
        distance = st.number_input("Distance", step=1)
        capacity = st.number_input("Capacity", step=1)

        if st.button("Insert Vehicle"):
            try:
                cur = conn.cursor()
                insert_query = """
                    INSERT INTO vehicle (vehicle_id, distance, capacity)
                    VALUES (%s, %s, %s)
                """
                cur.execute(insert_query, (vehicle_id, distance, capacity))
                conn.commit()
                st.success("Vehicle inserted successfully.")
            except Exception as e:
                conn.rollback()
                st.error(f"Error inserting vehicle: {e}")

    if table_choice == "employee":
        st.subheader("Insert into Employee Table")

        emp_id = st.number_input("Employee ID", step=1)
        name = st.text_input("Employee Name")
        phone = st.number_input("Phone Number", step=1)
        hire_date = st.date_input("Hire Date")
        post = st.selectbox("Post", ["Clerk", "Driver", "IT_Support"])
        branch_id = st.number_input("Branch ID", step=1)

        if post == "Driver":
            rating = st.number_input("Rating", min_value=0.0, max_value=5.0, step=0.1)
            vehicle_id = st.text_input("Vehicle Assigned")
        elif post == "Clerk":
            performance = st.number_input("Performance Score", step=0.1)
        elif post == "IT_Support":
            issue_resolved = st.number_input("Issues Resolved", step=1)

        if st.button("Insert Employee"):
            try:
                cur = conn.cursor()

                insert_emp = """
                    INSERT INTO employee (employee_id, name, contact_number, date_of_joining, role, branch_id)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                cur.execute(insert_emp, (emp_id, name, phone, hire_date, post, branch_id))

                if post == "Driver":
                    insert_driver = """
                        INSERT INTO driver (id, rating, vehicle_id)
                        VALUES (%s, %s, %s)
                    """
                    cur.execute(insert_driver, (emp_id, rating, vehicle_id))

                elif post == "Clerk":
                    insert_clerk = """
                        INSERT INTO Clerk (id, accuracy)
                        VALUES (%s, %s)
                    """
                    cur.execute(insert_clerk, (emp_id, performance))

                elif post == "IT_Support":
                    insert_it = """
                        INSERT INTO it_support (id, complaints_per_hour)
                        VALUES (%s, %s)
                    """
                    cur.execute(insert_it, (emp_id, issue_resolved))

                conn.commit()
                st.success(f"{post} inserted successfully.")
            except Exception as e:
                conn.rollback()
                st.error(f"Error inserting employee: {e}")

    if table_choice == "feedback":
        st.subheader("Insert into Feedback Table")

        fb_date = st.date_input("Feedback Date")
        comment = st.text_area("Comment")
        rating = st.number_input("Rating (out of 5)", min_value=0.0, max_value=5.0, step=0.1)
        customer_id = st.text_input("Customer ID")

        if st.button("Insert Feedback"):
            try:
                cur = conn.cursor()
                insert_feedback = """
                    INSERT INTO feedback (date, comment, rating, customer_id)
                    VALUES (%s, %s, %s, %s)
                """
                cur.execute(insert_feedback, (fb_date, comment, rating, customer_id))
                conn.commit()
                st.success("Feedback inserted successfully.")
            except Exception as e:
                conn.rollback()
                st.error(f"Error inserting feedback: {e}")


with tab4:
    st.header("📊 Graphs & Analytics")
    
    st.subheader("🚗 Top 5 Most Rated Drivers")
    query4 = """
        SELECT D.ID, E.Name, D.Rating
        FROM Driver D
        JOIN Employee E ON D.ID = E.Employee_id
        ORDER BY D.Rating DESC
        LIMIT 5;
    """
    df4 = pd.read_sql(query4, engine)
    fig4 = px.bar(df4, x='name', y='rating', title='Top 5 Rated Drivers',
                  labels={'name': 'Driver Name', 'rating': 'Rating'})
    st.plotly_chart(fig4, use_container_width=True)

    st.subheader("💰 Branchs with Revenue > 5000 ")
    query12 = """
        SELECT B.City, C.Branch_ID, SUM(C.Price) AS Total_Revenue
        FROM Courier C
        JOIN Branch B ON C.Branch_ID = B.Branch_ID
        GROUP BY B.City, C.Branch_ID
        HAVING SUM(C.Price) > 5000
        ORDER BY total_revenue DESC;
    """
    df12 = pd.read_sql(query12, engine)
    fig12 = px.bar(df12, x='city', y='total_revenue', title='Branch Revenue Analysis',
                   labels={'city': 'City', 'total_revenue': 'Total Revenue'})
    st.plotly_chart(fig12, use_container_width=True)

    st.subheader("📦 Courier Distribution")
    query15 = """
        SELECT C.Type, C.Status, COUNT(C.Reference_ID) AS Courier_Count
        FROM Courier C
        GROUP BY C.Type, C.Status
        ORDER BY C.Type, C.Status;
    """
    df15 = pd.read_sql(query15, engine)
    fig15 = px.sunburst(df15, path=['type', 'status'], values='courier_count',
                        title='Courier Distribution by Type and Status')
    st.plotly_chart(fig15, use_container_width=True)

    st.subheader("💳 Payment Methods Distribution")
    query16 = """
        SELECT P.Method, COUNT(P.Payment_ID) AS cnt
        FROM Payment P
        GROUP BY P.Method
        ORDER BY cnt DESC;
    """
    df16 = pd.read_sql(query16, engine)
    fig16 = px.pie(df16, values='cnt', names='method', title='Payment Methods Distribution')
    st.plotly_chart(fig16, use_container_width=True)

    st.subheader("📈 Courier Profitability by Type")
    query18 = """
        SELECT C.Type, SUM(C.Profit) AS Total_Profit
        FROM Courier C
        GROUP BY C.Type
        ORDER BY Total_Profit DESC;
    """
    df18 = pd.read_sql(query18, engine)
    fig18 = px.bar(df18, x='type', y='total_profit', title='Profit by Courier Type',
                   labels={'type': 'Courier Type', 'total_profit': 'Total Profit'})
    st.plotly_chart(fig18, use_container_width=True)

    st.subheader("⏱️ Average Delivery Time Analysis")
    query19 = """
        SELECT Type, CEIL(AVG((Expected_Delivery_Date - Date))) AS Average_Delivery_Time
        FROM Courier
        GROUP BY Type;
    """
    df19 = pd.read_sql(query19, engine)
    fig19 = px.bar(df19, x='type', y='average_delivery_time', 
                   title='Average Delivery Time by Courier Type',
                   labels={'type': 'Courier Type', 'average_delivery_time': 'Days'})
    st.plotly_chart(fig19, use_container_width=True)
