# 📦 Courier Management System

A modern web application for managing courier operations built with Streamlit and PostgreSQL.

## 🌟 Features

- 📄 **View Tables**: Browse all database tables with easy filtering
- 🧠 **Advanced Queries**: Pre-built queries for common operations including:
  - Basic queries with conditions and joins
  - Aggregation queries
  - Nested queries
  - Correlated queries
  - Division operation queries
- ➕ **Data Entry**: Insert new records for:
  - Branches
  - Employees (Drivers, Clerks, IT Support)
  - Vehicles
  - Feedback
- 📊 **Analytics Dashboard**: Visual insights including:
  - Top rated drivers
  - Branch revenue analysis
  - Courier distribution
  - Payment methods breakdown
  - Profitability analysis
  - Delivery time metrics

## 🛠️ Tech Stack

- **Frontend**: Streamlit
- **Backend**: Python
- **Database**: PostgreSQL
- **Visualization**: Plotly Express
- **Data Processing**: Pandas, SQLAlchemy

## ⚙️ Setup

1. Install required packages:
```bash
pip install -r requirements.txt
```

2. Configure PostgreSQL connection in `app.py`:
```python
host="localhost"
database="your_db_name"
user="your_user_name"
password="your_password"
port="5432"
```

3. Run the application:
```bash
streamlit run app.py
```

## 🗄️ Database Schema

The system manages the following key entities:
- Branch
- Vehicle
- Employee (Drivers, Clerks, IT Support)
- Customer
- Courier
- Delivery Partner
- Feedback
- Insurance
- Payment
- Promotion

## 🚀 Getting Started

1. Launch the application
2. Connect to your PostgreSQL database
3. Use the navigation tabs to:
   - View and filter table data
   - Run pre-built queries
   - Insert new records
   - Analyze data through visualizations

## 📈 Analytics Features

- Driver performance tracking
- Revenue analysis by branch
- Courier type distribution
- Payment method trends
- Delivery time analysis
- Profitability insights

## 👥 User Roles

- **Drivers**: Manage deliveries and track vehicles
- **Clerks**: Handle customer data and bookings
- **IT Support**: System maintenance and support

## 🔒 Security

- Database credentials are configurable
- PostgreSQL connection with secure authentication
- Role-based access control

## 🚀 Project Live Link
<h3> Check out website Live Link </h3>

<h3><a href="https://courier-shipping-management-system.streamlit.app/" target="_blank" style="font-size: 24px;">Click Here</a></h3>

<h3> Or </h3>

`https://courier-shipping-management-system.streamlit.app/`
