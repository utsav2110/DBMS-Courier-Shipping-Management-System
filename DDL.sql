CREATE SCHEMA CMS;

SET search_path to CMS;

CREATE TABLE Branch (
    Branch_ID decimal(10,0) PRIMARY KEY,     --  YYMMDDHHMM
    City varchar(30) NOT NULL, 
    Pincode decimal(6,0) NOT NULL CHECK (length(Pincode::text) = 6)
);

CREATE TABLE Promotion (
    Promotion_id CHAR(10) PRIMARY KEY,   -- YYMMDD****
    Price DECIMAL(7,0) NOT NULL CHECK (Price > 0),
    Company_Name VARCHAR(50) NOT NULL,
	CHECK (Promotion_id ~ '^[0-9]{6}[A-Za-z]{4}$')
);

CREATE TABLE Vehicle (
    Vehicle_id CHAR(10) PRIMARY KEY,
    Distance DECIMAL(4,0) NOT NULL,
    Capacity DECIMAL(4,0) NOT NULL CHECK (Capacity BETWEEN 10 AND 2000),
	CHECK (Vehicle_id ~ '^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$')
);

CREATE TABLE VehiclePromotionMapping(
	Vehicle_ID CHAR(10) REFERENCES Vehicle(Vehicle_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	Promotion_ID CHAR(10) REFERENCES Promotion(Promotion_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (Vehicle_ID,Promotion_ID),
	Start_date DATE NOT NULL,
	End_date DATE NOT NULL,
	CHECK (Vehicle_id ~ '^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$'),
	CHECK (Promotion_id ~ '^[0-9]{6}[A-Za-z]{4}$')
);
	
CREATE TABLE VehicleCityMapping(
	Vehicle_ID CHAR(10) REFERENCES Vehicle(Vehicle_id) ON DELETE CASCADE ON UPDATE CASCADE,
	City Varchar(50),
    PRIMARY KEY (Vehicle_ID, City),
	CHECK (Vehicle_ID ~ '^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$')
);

CREATE TABLE Employee (
    Employee_id DECIMAL(10,0) PRIMARY KEY,  --YYMMDD****
    Name VARCHAR(50) NOT NULL,
    Contact_Number DECIMAL(10,0) NOT NULL CHECK (length(Contact_Number::text) = 10),
    Date_of_Joining DATE NOT NULL,
    role VARCHAR(10) NOT NULL CHECK (role IN ('Driver', 'Clerk', 'IT_Support')),
	Branch_ID DECIMAL(10, 0) DEFAULT 2310010930 REFERENCES Branch(Branch_ID) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE Driver (
    ID DECIMAL(10,0) PRIMARY KEY,
    Rating DECIMAL(2,1) NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (ID) REFERENCES Employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
	Vehicle_ID CHAR(10) REFERENCES Vehicle(Vehicle_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Clerk (
    ID DECIMAL(10,0) PRIMARY KEY,
    Accuracy DECIMAL(5, 2) NOT NULL CHECK (accuracy >= 0 AND accuracy <= 100),
    FOREIGN KEY (ID) REFERENCES Employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IT_Support (
    ID DECIMAL(10,0) PRIMARY KEY,
    Complaints_Per_Hour DECIMAL(2,0) NOT NULL,
    FOREIGN KEY (ID) REFERENCES Employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customer (
    Customer_ID decimal(11,0) PRIMARY KEY,     -- YYMMDD*****
    Name varchar(50) NOT NULL, 
    Contact_Of_Sender decimal(10,0) NOT NULL CHECK (length(Contact_Of_Sender::text) = 10),
    Contact_Of_Receiver decimal(10,0) NOT NULL CHECK (length(Contact_Of_Receiver::text) = 10),
    CHECK (Contact_Of_Sender <> Contact_Of_Receiver),
	Street_Address VARCHAR(150) NOT NULL,
	Branch_ID DECIMAL(10, 0) DEFAULT 2310010930 REFERENCES Branch(Branch_ID) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE Courier(
	Reference_ID CHAR(10) PRIMARY KEY, -- YYMMDD****
	Date DATE NOT NULL,
	Distance DECIMAL(4,0) NOT NULL,
	Weight DECIMAL(4,0) NOT NULL  CHECK (Weight < 1000),
	Expected_Delivery_Date DATE NOT NULL,
	Status varchar(9) NOT NULL CHECK (Status IN ('Collected', 'Shipped', 'Arrived','Picked_up','Return','Lost')),
	Type varchar(16) NOT NULL CHECK (Type IN ('Standard','Express','Handle With Care')),
	Customer_ID DECIMAL(11, 0) REFERENCES Customer(Customer_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
	Vehicle_ID CHAR(10) REFERENCES Vehicle(Vehicle_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	Branch_ID DECIMAL(10, 0) DEFAULT 2310010930 REFERENCES Branch(Branch_ID) ON DELETE SET DEFAULT ON UPDATE CASCADE,
	To_Branch DECIMAL(10, 0) NOT NULL,
	Price decimal(5,0) NOT NULL CHECK (Price>10),
	Profit DECIMAL(5,0) NOT NULL,
	CHECK ( branch_id <> to_branch),
	CHECK (Reference_ID ~ '^[0-9]{8}[A-Za-z]{2}$'),
	CHECK (Vehicle_id ~ '^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$')
);

CREATE TABLE Payment (
    Payment_ID varchar(10) PRIMARY KEY,       -- YYMMDD****
    Date DATE NOT NULL,
    Status char(7) NOT NULL CHECK (Status IN ('Success', 'Pending', 'Failure')),
    Method varchar(17) NOT NULL CHECK (Method IN ('Cash', 'UPI', 'Net Banking', 'Credit/Debit Card')),
    Amount decimal(5,0) NOT NULL CHECK (Amount > 10),
	Reference_ID CHAR(10) REFERENCES Courier(Reference_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
	CHECK (Payment_id ~ '^[0-9]{6}[A-Za-z]{4}$'),
	CHECK (Reference_ID ~ '^[0-9]{8}[A-Za-z]{2}$')
);

CREATE TABLE Feedback (
    Feedback_ID SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Comment VARCHAR(150),
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 1 AND 5),
    Customer_ID DECIMAL(11,0) REFERENCES Customer(Customer_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Works_On(
	Reference_ID CHAR(10) REFERENCES Courier(Reference_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	Employee_id DECIMAL(10,0) REFERENCES Employee(Employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(Reference_ID,Employee_id),
	Assigned_Date DATE NOT NULL,
	CHECK (Reference_ID ~ '^[0-9]{8}[A-Za-z]{2}$')
);

CREATE TABLE Delivery_Partner(
    Registration_Number CHAR(12) PRIMARY KEY, --YYYYMMDD****
    Name VARCHAR(50) NOT NULL,
    Price_Per_Courier DECIMAL(3,0) NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL
);

CREATE TABLE CourierMapping(
	Reference_ID CHAR(10) REFERENCES Courier(Reference_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	Registration_Number CHAR(12) REFERENCES Delivery_Partner(Registration_Number) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(Reference_ID),
	CHECK (Reference_ID ~ '^[0-9]{8}[A-Za-z]{2}$')
);

CREATE TABLE Insurance (
    InsuranceID SERIAL PRIMARY KEY,
    Type VARCHAR(8) NOT NULL CHECK (Type IN ('Standard', 'Premium')),
    Coverage_Amount Decimal(5,0) NOT NULL,
    Premium Decimal(4,0) NOT NULL,
    Claim_Amount Decimal(5,0) NOT NULL,
	Reference_ID CHAR(10) REFERENCES Courier(Reference_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (Reference_ID ~ '^[0-9]{8}[A-Za-z]{2}$')
);

-- For Calculating Price
	
CREATE OR REPLACE FUNCTION cal_price()
RETURNS TRIGGER AS $BODY$ 
BEGIN

	IF NEW.type = 'Standard' THEN
        IF NEW.distance < 250 THEN
            NEW.price := 0.5 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 500 THEN
            NEW.price := 0.45 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 1000 THEN
            NEW.price := 0.4 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 2000 THEN
            NEW.price := 0.35 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 3000 THEN
            NEW.price := 0.3 * NEW.distance * NEW.weight;
        ELSE
            RAISE EXCEPTION 'Distance exceeds 3000 km, cannot calculate.';
        END IF;
        
    ELSIF NEW.type = 'Express' THEN
        IF NEW.distance < 250 THEN
            NEW.price := 0.7 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 500 THEN
            NEW.price := 0.65 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 1000 THEN
            NEW.price := 0.6 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 2000 THEN
            NEW.price := 0.55 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 3000 THEN
            NEW.price := 0.5 * NEW.distance * NEW.weight;
        ELSE
            RAISE EXCEPTION 'Distance exceeds 3000 km, cannot calculate.';
        END IF;

    ELSIF NEW.type = 'Handle With Care' THEN
        IF NEW.distance < 250 THEN
            NEW.price := 1.5 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 500 THEN
            NEW.price := 1.4 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 1000 THEN
            NEW.price := 1.3 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 2000 THEN
            NEW.price := 1.2 * NEW.distance * NEW.weight;
        ELSIF NEW.distance < 3000 THEN
            NEW.price := 1.1 * NEW.distance * NEW.weight;
        ELSE
            RAISE EXCEPTION 'Distance exceeds 3000 km, cannot calculate.';
        END IF;
    ELSE
        RAISE EXCEPTION 'Invalid courier type.';
    END IF;

    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER set_price
BEFORE INSERT OR UPDATE ON Courier
FOR EACH ROW
EXECUTE FUNCTION cal_price();

-- For Calculating Profit
CREATE OR REPLACE FUNCTION cal_profit()
RETURNS TRIGGER AS $BODY$
BEGIN
    NEW.Profit := NEW.Price * 0.20;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER set_profit
BEFORE INSERT OR UPDATE ON Courier
FOR EACH ROW
EXECUTE FUNCTION cal_profit();

-- For Employee

CREATE OR REPLACE FUNCTION check_role()
RETURNS TRIGGER AS $BODY$
DECLARE
    employee_role VARCHAR(10);
BEGIN

	SELECT role INTO employee_role FROM Employee WHERE Employee_id = NEW.ID;

    IF TG_TABLE_NAME = 'driver' THEN
        IF employee_role != 'Driver' THEN
            RAISE EXCEPTION 'Employee % is not a Driver', NEW.ID;
        END IF;

    ELSIF TG_TABLE_NAME = 'clerk' THEN
        IF employee_role != 'Clerk' THEN
            RAISE EXCEPTION 'Employee % is not a Clerk', NEW.ID;
        END IF;

    ELSIF TG_TABLE_NAME = 'it_support' THEN
        IF employee_role != 'IT_Support' THEN
            RAISE EXCEPTION 'Employee % is not IT Support', NEW.ID;
        END IF;

    END IF;

    RETURN NEW; 
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER check_driver
AFTER INSERT ON Driver
FOR EACH ROW EXECUTE FUNCTION check_role();

CREATE TRIGGER check_clerk
BEFORE INSERT ON Clerk
FOR EACH ROW EXECUTE FUNCTION check_role();

CREATE TRIGGER check_it_support
BEFORE INSERT ON IT_Support
FOR EACH ROW EXECUTE FUNCTION check_role();

-- For Calculating Expected Delivery Date

CREATE OR REPLACE FUNCTION cal_edd()
RETURNS TRIGGER AS $BODY$
DECLARE
    delivery_days INT;
BEGIN

	IF NEW.Distance < 250 THEN
        IF NEW.Type = 'Standard' THEN
            delivery_days := 2;
        ELSIF NEW.Type = 'Express' THEN
            delivery_days := 1;
        ELSIF NEW.Type = 'Handle With Care' THEN
            delivery_days := 3;
        END IF;

    ELSIF NEW.Distance < 500 THEN
        IF NEW.Type = 'Standard' THEN
            delivery_days := 3;
        ELSIF NEW.Type = 'Express' THEN
            delivery_days := 1;
        ELSIF NEW.Type = 'Handle With Care' THEN
            delivery_days := 4;
        END IF;

    ELSIF NEW.Distance < 1000 THEN
        IF NEW.Type = 'Standard' THEN
            delivery_days := 4;
        ELSIF NEW.Type = 'Express' THEN
            delivery_days := 2;
        ELSIF NEW.Type = 'Handle With Care' THEN
            delivery_days := 5;
        END IF;

    ELSIF NEW.Distance < 2000 THEN
        IF NEW.Type = 'Standard' THEN
            delivery_days := 5;
        ELSIF NEW.Type = 'Express' THEN
            delivery_days := 2;
        ELSIF NEW.Type = 'Handle With Care' THEN
            delivery_days := 6;
        END IF;

    ELSIF NEW.Distance < 3000 THEN
        IF NEW.Type = 'Standard' THEN
            delivery_days := 6;
        ELSIF NEW.Type = 'Express' THEN
            delivery_days := 3;
        ELSIF NEW.Type = 'Handle With Care' THEN
            delivery_days := 7;
        END IF;

    END IF;

    NEW.Expected_Delivery_Date := NEW.Date + delivery_days;

    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER set_edd
BEFORE INSERT ON Courier
FOR EACH ROW
EXECUTE FUNCTION cal_edd();

CREATE VIEW BCV AS
SELECT b.Branch_ID, c.Status 
FROM Branch b
JOIN Courier c ON b.Branch_ID = c.Branch_ID;