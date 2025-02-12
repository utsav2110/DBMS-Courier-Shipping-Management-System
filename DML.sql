-- SELECT * FROM cms.branch
-- SELECT * FROM cms.vehicle
-- SELECT * FROM cms.employee
-- SELECT * FROM cms.driver	
-- SELECT * FROM cms.clerk
-- SELECT * FROM cms.it_support
-- SELECT * FROM cms.customer
-- SELECT * FROM cms.courier
-- SELECT * FROM cms.works_on
-- SELECT * FROM cms.delivery_partner
-- SELECT * FROM cms.feedback
-- SELECT * FROM cms.insurance
-- SELECT * FROM cms.payment
-- SELECT * FROM cms.promotion
-- SELECT * FROM cms.VehiclePromotionMapping
-- SELECT * FROM cms.Couriermapping
-- SELECT * FROM cms.vehiclecitymapping
-- SELECT * FROM cms.BCV

-- set search_path to cms

-- Branch Table
	
INSERT INTO branch VALUES (2310010930, 'New Delhi', 110001);  
INSERT INTO branch VALUES (2310020930, 'Mumbai', 400001);     
INSERT INTO branch VALUES (2310030930, 'Kolkata', 700001);    
INSERT INTO branch VALUES (2310040930, 'Chennai', 600001);    
INSERT INTO branch VALUES (2310050930, 'Bengaluru', 560001);  
INSERT INTO branch VALUES (2310060930, 'Hyderabad', 500001);  
INSERT INTO branch VALUES (2310070930, 'Ahmedabad', 380001);  
INSERT INTO branch VALUES (2310080930, 'Pune', 411001);      
INSERT INTO branch VALUES (2310090930, 'Bhopal', 462001);     
INSERT INTO branch VALUES (2310100930, 'Jaipur', 302001);     
INSERT INTO branch VALUES (2310110930, 'Valsad', 396001);     
INSERT INTO branch VALUES (2310120930, 'Surat', 395003);      
INSERT INTO branch VALUES (2310130930, 'Rajkot', 360001);     
INSERT INTO branch VALUES (2310140930, 'Bhavnagar', 364001);  
INSERT INTO branch VALUES (2310150930, 'Vadodara', 390001);   
INSERT INTO branch VALUES (2310160930, 'Junagadh', 362001);   
INSERT INTO branch VALUES (2310170930, 'Jamnagar', 361001);   
INSERT INTO branch VALUES (2310180930, 'Gandhinagar', 382010);
INSERT INTO branch VALUES (2310190930, 'Anand', 388001);     
INSERT INTO branch VALUES (2310200930, 'Kutch', 370001);      
INSERT INTO branch VALUES (2310210930, 'Bharuch', 392001);    

-- Vehicle Table

INSERT INTO vehicle VALUES ('GJ01AB1234', 100, 800); 
INSERT INTO vehicle VALUES ('GJ02CD5678', 250, 1200); 
INSERT INTO vehicle VALUES ('GJ03EF9101', 50, 400); 
INSERT INTO vehicle VALUES ('GJ04GH2345', 300, 1800); 
INSERT INTO vehicle VALUES ('GJ05IJ6789', 450, 2000); 
INSERT INTO vehicle VALUES ('GJ06KL0123', 60, 150); 
INSERT INTO vehicle VALUES ('GJ07MN4567', 175, 600); 
INSERT INTO vehicle VALUES ('GJ08OP8910', 320, 1300); 
INSERT INTO vehicle VALUES ('GJ09QR2345', 90, 700); 
INSERT INTO vehicle VALUES ('GJ10ST6789', 200, 1000); 
INSERT INTO vehicle VALUES ('GJ11UV0123', 110, 550); 
INSERT INTO vehicle VALUES ('GJ12WX3456', 250, 1600); 
INSERT INTO vehicle VALUES ('MH12YZ7890', 150, 750); 
INSERT INTO vehicle VALUES ('RJ14AB1234', 400, 1900); 
INSERT INTO vehicle VALUES ('UP16CD5678', 50, 250); 
INSERT INTO vehicle VALUES ('MP09EF9101', 275, 1350); 
INSERT INTO vehicle VALUES ('KA03GH2345', 125, 850); 
INSERT INTO vehicle VALUES ('TN07IJ6789', 500, 2000); 
INSERT INTO vehicle VALUES ('DL04KL0123', 350, 1400); 
INSERT INTO vehicle VALUES ('HR05MN4567', 90, 450); 

-- Employee table
INSERT INTO Employee VALUES (2310010001, 'Rahul Sharma', 6354840401, '2023-10-01', 'Clerk', 2310010930); 
INSERT INTO Employee VALUES (2310020001, 'Priya Mehta', 9988776655, '2023-10-02', 'Clerk', 2310020930); 
INSERT INTO Employee VALUES (2310030001, 'Amit Gupta', 9876543210, '2023-10-03', 'Clerk', 2310030930); 
INSERT INTO Employee VALUES (2310040001, 'Sneha Reddy', 8123456789, '2023-10-04', 'Clerk', 2310040930); 
INSERT INTO Employee VALUES (2310050001, 'Vikram Singh', 9988665544, '2023-10-05', 'Clerk', 2310050930); 
INSERT INTO Employee VALUES (2310060001, 'Neha Joshi', 9000123456, '2023-10-06', 'Clerk', 2310060930); 
INSERT INTO Employee VALUES (2310070001, 'Karan Shah', 9456781234, '2023-10-07', 'Clerk', 2310070930); 
INSERT INTO Employee VALUES (2310080001, 'Meera Patil', 8765432109, '2023-10-08', 'Clerk', 2310080930); 
INSERT INTO Employee VALUES (2310090001, 'Rajesh Verma', 7890123456, '2023-10-09', 'Clerk', 2310090930); 
INSERT INTO Employee VALUES (2310100001, 'Anita Desai', 9123456780, '2023-10-10', 'Clerk', 2310100930); 
INSERT INTO Employee VALUES (2310110001, 'Suresh Nair', 7654321098, '2023-10-11', 'Clerk', 2310110930); 
INSERT INTO Employee VALUES (2310120001, 'Pooja Bhatia', 8543216789, '2023-10-12', 'Clerk', 2310120930); 
INSERT INTO Employee VALUES (2310130001, 'Ravi Choudhary', 8212345678, '2023-10-13', 'Clerk', 2310130930); 
INSERT INTO Employee VALUES (2310140001, 'Neeraj Kumar', 7896541230, '2023-10-14', 'Clerk', 2310140930); 
INSERT INTO Employee VALUES (2310150001, 'Simran Ahuja', 9654321987, '2023-10-15', 'Clerk', 2310150930); 
INSERT INTO Employee VALUES (2310160001, 'Tarun Malhotra', 8901234567, '2023-10-16', 'Clerk', 2310160930); 
INSERT INTO Employee VALUES (2310170001, 'Nisha Iyer', 6789012345, '2023-10-17', 'Clerk', 2310170930); 
INSERT INTO Employee VALUES (2310180001, 'Deepak Chavan', 5432109876, '2023-10-18', 'Clerk', 2310180930); 
INSERT INTO Employee VALUES (2310190001, 'Sakshi Yadav', 6543210987, '2023-10-19', 'Clerk', 2310190930); 
INSERT INTO Employee VALUES (2310200001, 'Akash Patil', 4321098765, '2023-10-20', 'Clerk', 2310200930); 
INSERT INTO Employee VALUES (2310210001, 'Ritika Singh', 3210987654, '2023-10-21', 'Clerk', 2310210930); 

INSERT INTO Employee VALUES (2310090002, 'Aisha Khan', 9988776633, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090003, 'Priyanka Verma', 9876543212, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090004, 'Neha Sharma', 8765432101, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090005, 'Sonia Patel', 7654321090, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090006, 'Riya Bhatia', 6543210989, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090007, 'Megha Iyer', 5432109878, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090008, 'Simran Kaur', 4321098767, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090009, 'Anjali Mehta', 3210987656, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090010, 'Rahul Joshi', 2109876543, '2023-10-09', 'IT_Support', 2310090930); 
INSERT INTO Employee VALUES (2310090011, 'Vikas Singh', 1098765432, '2023-10-09', 'IT_Support', 2310090930); 

INSERT INTO Employee VALUES (2310010002, 'Rajesh Kumar', 9988776755, '2023-10-25', 'Driver', 2310010930); 
INSERT INTO Employee VALUES (2310020002, 'Anil Mehta', 9876543214, '2023-10-25', 'Driver', 2310020930); 
INSERT INTO Employee VALUES (2310030002, 'Suresh Reddy', 8765432105, '2023-10-25', 'Driver', 2310030930); 
INSERT INTO Employee VALUES (2310040002, 'Vijay Sharma', 7654321099, '2023-10-25', 'Driver', 2310040930); 
INSERT INTO Employee VALUES (2310050002, 'Deepak Singh', 6543210988, '2023-10-25','Driver', 2310050930); 
INSERT INTO Employee VALUES (2310100002, 'Karan Nair', 5432109877, '2023-10-25', 'Driver', 2310100930); 
INSERT INTO Employee VALUES (2310110002, 'Mohit Verma', 4321098766, '2023-10-25', 'Driver', 2310110930); 
INSERT INTO Employee VALUES (2310120002, 'Rahul Joshi', 3210987653, '2023-10-25', 'Driver', 2310120930); 
INSERT INTO Employee VALUES (2310130002, 'Tarun Choudhary', 2109876544, '2023-10-25', 'Driver', 2310130930); 
INSERT INTO Employee VALUES (2310140002, 'Amit Yadav', 1098765433, '2023-10-25', 'Driver', 2310140930); 

-- Driver
INSERT INTO Driver VALUES (2310010002,4.8,'DL04KL0123');
INSERT INTO Driver VALUES (2310020002,4.7,'MH12YZ7890');
INSERT INTO Driver VALUES (2310030002,4.9,'GJ11UV0123');
INSERT INTO Driver VALUES (2310040002,4.1,'TN07IJ6789');
INSERT INTO Driver VALUES (2310050002,3.7,'KA03GH2345');
INSERT INTO Driver VALUES (2310100002,3.9,'RJ14AB1234');
INSERT INTO Driver VALUES (2310110002,4.2,'GJ06KL0123');
INSERT INTO Driver VALUES (2310120002,3.5,'GJ05IJ6789');
INSERT INTO Driver VALUES (2310130002,3.9,'GJ03EF9101');
INSERT INTO Driver VALUES (2310140002,4.5,'GJ04GH2345');

-- Clerk
INSERT INTO Clerk VALUES (2310010001, 95.50);
INSERT INTO Clerk VALUES (2310020001, 92.30);
INSERT INTO Clerk VALUES (2310030001, 88.75);
INSERT INTO Clerk VALUES (2310040001, 90.25);
INSERT INTO Clerk VALUES (2310050001, 94.10);
INSERT INTO Clerk VALUES (2310060001, 89.60);
INSERT INTO Clerk VALUES (2310070001, 96.80);
INSERT INTO Clerk VALUES (2310080001, 91.45);
INSERT INTO Clerk VALUES (2310090001, 93.20);
INSERT INTO Clerk VALUES (2310100001, 97.00);
INSERT INTO Clerk VALUES (2310110001, 85.35);
INSERT INTO Clerk VALUES (2310120001, 92.85);
INSERT INTO Clerk VALUES (2310130001, 90.95);
INSERT INTO Clerk VALUES (2310140001, 94.75);
INSERT INTO Clerk VALUES (2310150001, 89.50);
INSERT INTO Clerk VALUES (2310160001, 95.30);
INSERT INTO Clerk VALUES (2310170001, 87.40);
INSERT INTO Clerk VALUES (2310180001, 91.90);
INSERT INTO Clerk VALUES (2310190001, 93.55);
INSERT INTO Clerk VALUES (2310200001, 89.85);
INSERT INTO Clerk VALUES (2310210001, 95.75);

-- IT Support
INSERT INTO IT_Support VALUES (2310090002, 5); 
INSERT INTO IT_Support VALUES (2310090003, 6); 
INSERT INTO IT_Support VALUES (2310090004, 4); 
INSERT INTO IT_Support VALUES (2310090005, 3); 
INSERT INTO IT_Support VALUES (2310090006, 7); 
INSERT INTO IT_Support VALUES (2310090007, 4); 
INSERT INTO IT_Support VALUES (2310090008, 5); 
INSERT INTO IT_Support VALUES (2310090009, 6); 
INSERT INTO IT_Support VALUES (2310090010, 3); 
INSERT INTO IT_Support VALUES (2310090011, 4);

-- customer
INSERT INTO Customer VALUES ('23110100001', 'Harshil Patel', 9876543210, 8765432109, '12, Laldarwaja, Valsad', 2310110930);
INSERT INTO Customer VALUES ('23110100002', 'Dhaval Shah', 9123456780, 8098765432, '78, Abrama Road, Valsad', 2310110930);
INSERT INTO Customer VALUES ('23110100003', 'Mitali Desai', 9821234567, 9923456712, '56, Adajan, Surat', 2310120930);
INSERT INTO Customer VALUES ('23110100004', 'Nirav Mehta', 9001234567, 9987654321, '88, Ghod Dod Road, Surat', 2310120930);
INSERT INTO Customer VALUES ('23110100005', 'Janki Trivedi', 9331456789, 9445678912, '45, Raiya Road, Rajkot', 2310130930);
INSERT INTO Customer VALUES ('23110100006', 'Ankit Choksi', 9109876543, 9567894321, '32, Kalawad Road, Rajkot', 2310130930);
INSERT INTO Customer VALUES ('23110100007', 'Riya Bhatt', 9901234567, 9108765432, '120, Waghavadi Road, Bhavnagar', 2310140930);
INSERT INTO Customer VALUES ('23110100008', 'Kunal Vora', 9009876543, 9921234567, '34, Talaja Road, Bhavnagar', 2310140930);
INSERT INTO Customer VALUES ('23110100009', 'Vaishali Shah', 9890123456, 9987654321, '17, Alkapuri, Vadodara', 2310150930);
INSERT INTO Customer VALUES ('23110100010', 'Bhavesh Patel', 9870987654, 9445678901, '66, Fatehgunj, Vadodara', 2310150930);
INSERT INTO Customer VALUES ('23110100011', 'Arjun Kumar', 9876543210, 8765432109, '54, Connaught Place, New Delhi', 2310010930);
INSERT INTO Customer VALUES ('23110100012', 'Sneha Jain', 9123456780, 8098765432, '76, Dadar West, Mumbai', 2310020930);
INSERT INTO Customer VALUES ('23110100013', 'Debashish Dutta', 9821234567, 9923456712,  '44, Salt Lake, Kolkata', 2310030930);
INSERT INTO Customer VALUES ('23110100014', 'Suresh Iyer', 9001234567, 9987654321, '102, Mylapore, Chennai', 2310040930);
INSERT INTO Customer VALUES ('23110100015', 'Shalini Reddy', 9331456789, 9445678912, '67, Koramangala, Bengaluru', 2310050930);

-- Courier
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23110100aa', '2023-11-01', 150, 1, 'Shipped', 'Standard', 23110100001, 'GJ06KL0123', 2310110930, 2310210930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23110100ab', '2023-11-10', 280, 5, 'Collected', 'Express', 23110100002, 'GJ06KL0123', 2310110930, 2310210930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23110100ac', '2023-11-21', 1450, 50, 'Collected', 'Handle With Care', 23110100011, 'DL04KL0123', 2310010930, 2310020930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23110100ad', '2023-11-05', 1000, 10, 'Shipped', 'Standard', 23110100003, 'GJ03EF9101', 2310020930, 2310110930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23110100ae', '2023-11-15', 550, 25, 'Shipped', 'Express', 23110100005, 'GJ05IJ6789', 2310150930, 2310110930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23110100af', '2023-11-20', 750, 12, 'Shipped', 'Handle With Care', 23110100006, 'RJ14AB1234', 2310140930, 2310120930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23120100aa', '2023-12-01', 350, 20, 'Lost', 'Standard', 23110100007, 'GJ07MN4567', 2310110930, 2310150930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23120100ab', '2023-12-07', 400, 30, 'Arrived', 'Express', 23110100008, 'GJ02CD5678', 2310130930, 2310150930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23120100ac', '2023-12-11', 550, 50, 'Arrived', 'Handle With Care', 23110100009, 'MH12YZ7890', 2310110930, 2310140930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23120100ad', '2023-12-04', 600, 8, 'Picked_up', 'Standard', 23110100010, 'UP16CD5678', 2310120930, 2310150930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23120100ae', '2023-12-19', 350, 12, 'Picked_up', 'Express', 23110100002, 'GJ09QR2345', 2310110930, 2310210930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('23120100af', '2023-12-30', 1250, 15, 'Picked_up', 'Handle With Care', 23110100004, 'MP09EF9101', 2310150930, 2310130930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100aa', '2024-01-04', 500, 10, 'Return', 'Standard', 23110100003, 'KA03GH2345', 2310110930, 2310120930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100ab', '2024-01-11', 350, 5, 'Return', 'Express', 23110100006, 'HR05MN4567', 2310140930, 2310150930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100ac', '2024-01-17', 800, 35, 'Return', 'Handle With Care', 23110100009, 'GJ10ST6789', 2310010930, 2310020930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100ad', '2024-01-06', 700, 7, 'Lost', 'Standard', 23110100010, 'TN07IJ6789', 2310020930, 2310130930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100ae', '2024-01-20', 650, 15, 'Lost', 'Express', 23110100007, 'GJ11UV0123', 2310120930, 2310110930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100af', '2024-02-14', 350, 1, 'Collected', 'Express', 23110100007, 'GJ11UV0123', 2310180930, 2310110930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100ag', '2024-02-16', 350, 1, 'Collected', 'Standard', 23110100003, 'GJ11UV0123', 2310110930, 2310180930);
INSERT INTO Courier (Reference_ID, Date, Distance, Weight, Status, Type, Customer_ID, Vehicle_ID, Branch_ID, To_Branch)
VALUES ('24010100ah', '2024-03-19', 650, 5, 'Shipped', 'Handle With Care', 23110100010, 'GJ11UV0123', 2310130930, 2310200930);


-- works on 
INSERT INTO Works_On (Reference_ID, Employee_id, Assigned_Date)
SELECT c.Reference_ID, e.Employee_id, c.Date FROM Courier c
JOIN Employee e ON c.Branch_ID = e.Branch_ID AND e.role='Clerk';

-- delivery partner
INSERT INTO Delivery_Partner VALUES ('202311010001', 'FastDeliver Co.', 50, '2023-11-01', '2026-11-01');
INSERT INTO Delivery_Partner VALUES ('202311050002', 'QuickShip Ltd.', 45, '2023-11-05', '2025-11-05');
INSERT INTO Delivery_Partner VALUES ('202311080003', 'GoExpress Services', 40, '2023-11-08', '2024-10-08');
INSERT INTO Delivery_Partner VALUES ('202311100004', 'Speedy Couriers', 55, '2023-11-10', '2024-11-10');
INSERT INTO Delivery_Partner VALUES ('202311120005', 'Eagle Delivery', 60, '2023-11-12', '2023-12-31');
INSERT INTO Delivery_Partner VALUES ('202311130006', 'Parcel Path', 50, '2023-11-13', '2023-12-13');
INSERT INTO Delivery_Partner VALUES ('202311200007', 'OnTime Logistics', 48, '2023-11-20', '2024-06-20');
INSERT INTO Delivery_Partner VALUES ('202311210008', 'Courier Express', 55, '2023-11-21', '2024-03-21');

-- FeedBack
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-01', 'Excellent service, very satisfied!', 4.5, '23110100001');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-02', 'The experience was good, would recommend.', 4.0, '23110100002');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-03', 'Satisfactory experience, met my expectations.', 3.2, '23110100003');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-04', 'Really enjoyed my time, will come back!', 5.0, '23110100004');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-05', 'Good service, but there is room for improvement.', 3.5, '23110100005');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-06', 'Overall positive experience, very happy.', 4.8, '23110100006');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-07', 'Great experience, friendly staff!', 4.6, '23110100007');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-08', 'I liked it a lot, will definitely return!', 4.7, '23110100008');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-09', 'The service was decent, nothing extraordinary.', 3.0, '23110100009');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-10', 'Very good, I appreciate the prompt assistance.', 4.3, '23110100010');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-11', 'Good overall, had a nice time.', 3.4, '23110100011');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-12', 'Service was satisfactory, but could be improved.', 3.1, '23110100012');
INSERT INTO Feedback (Date, Comment, Rating, Customer_ID) VALUES
('2024-10-13', 'Had a pleasant experience, would recommend.', 4.2, '23110100013');

-- Insurance

INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Standard', 100,7, 0, '23110100aa');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Premium',1000, 9, 0, '23110100ab');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Premium',99999, 870 , 0, '23110100ac');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Standard', 2000, 20 ,1950, '24010100ad');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Premium', 9000, 85, 0, '23110100ae');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Standard', 12000, 120, 0, '23110100af');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Standard', 6000, 60, 5990, '23120100aa');
INSERT INTO insurance (type, coverage_amount, premium, claim_amount, reference_id) 
VALUES ('Premium', 8250, 80, 0, '23120100ab');

--Payment
INSERT INTO Payment VALUES ('231101aaaa', '2023-11-01', 'Success', 'Cash', 75, '23110100aa');
INSERT INTO Payment VALUES ('231105aaab', '2023-11-05', 'Success', 'Credit/Debit Card', 3500, '23110100ad');
INSERT INTO Payment VALUES ('231115aaac', '2023-11-15', 'Pending', 'UPI', 8250, '23110100ae');
INSERT INTO Payment VALUES ('231120aaad', '2023-11-20', 'Success', 'Net Banking', 11700, '23110100af');
INSERT INTO Payment VALUES ('231201aaae', '2023-12-01', 'Success', 'Cash', 3150, '23120100aa');
INSERT INTO Payment VALUES ('231207aaaf', '2023-12-07', 'Pending', 'Credit/Debit Card', 7800, '23120100ab');
INSERT INTO Payment VALUES ('231211aaag', '2023-12-11', 'Success', 'Net Banking', 35750, '23120100ac');
INSERT INTO Payment VALUES ('231204aaah', '2023-12-04', 'Success', 'UPI', 1920, '23120100ad');
INSERT INTO Payment VALUES ('231219aaai', '2023-12-19', 'Pending', 'Net Banking', 2730, '23120100ae');
INSERT INTO Payment VALUES ('231230aaaj', '2023-12-30', 'Success', 'Credit/Debit Card', 22500, '23120100af');
INSERT INTO Payment VALUES ('240104aaak', '2024-01-04', 'Pending', 'UPI', 2000, '24010100aa');
INSERT INTO Payment VALUES ('240111aaal', '2024-01-11', 'Success', 'Cash', 1138, '24010100ab');
INSERT INTO Payment VALUES ('240117aaam', '2024-01-17', 'Success', 'Net Banking', 36400, '24010100ac');
INSERT INTO Payment VALUES ('240106aaan', '2024-01-06', 'Failure', 'UPI', 1960, '24010100ad');
INSERT INTO Payment VALUES ('240120aaao', '2024-01-20', 'Pending', 'Credit/Debit Card', 5850, '24010100ae');
INSERT INTO Payment VALUES ('231121aaap', '2023-11-21', 'Success', 'Net Banking', 87000, '23110100ac');
INSERT INTO Payment VALUES ('231110aaaq', '2023-11-10', 'Success', 'UPI', 910, '23110100ab');

--promotion
INSERT INTO Promotion VALUES ('231101abcd', 15000, 'Amul');
INSERT INTO Promotion VALUES ('231105efgh', 20000, 'Parle');
INSERT INTO Promotion VALUES ('231110ijkl', 18000, 'Hero MotoCorp');
INSERT INTO Promotion VALUES ('231115mnop', 22000, 'Bajaj Auto');
INSERT INTO Promotion VALUES ('231120qrst', 25000, 'Britannia');
INSERT INTO Promotion VALUES ('231125uvwx', 16000, 'Mahindra Tractors');
INSERT INTO Promotion VALUES ('231130yzab', 23000, 'Colgate');
INSERT INTO Promotion VALUES ('231205cdef', 19000, 'Gati');
INSERT INTO Promotion VALUES ('231210ghij', 21000, 'Airtel');
INSERT INTO Promotion VALUES ('231215klmn', 24000, 'Tata Salt');
INSERT INTO Promotion VALUES ('231220opqr', 17500, 'Jio');
INSERT INTO Promotion VALUES ('231225stuv', 19500, 'Everest Spices');
INSERT INTO Promotion VALUES ('231230wxyz', 20000, 'Rajdhani Flour Mills');
INSERT INTO Promotion VALUES ('240105abcd', 18000, 'Micromax');
INSERT INTO Promotion VALUES ('240110efgh', 21000, 'Bajaj Electricals');
INSERT INTO Promotion VALUES ('240115ijkl', 22000, 'Cavinkare');
INSERT INTO Promotion VALUES ('240120mnop', 25000, 'Frooti');
INSERT INTO Promotion VALUES ('240125qrst', 17000, 'DTDC');
INSERT INTO Promotion VALUES ('240130uvwx', 24000, 'TVS Motors');
INSERT INTO Promotion VALUES ('240205yzab', 20000, 'Coca-Cola India');

-- vehicle promotion mapping
INSERT INTO VehiclePromotionMapping VALUES ('GJ01AB1234', '231101abcd', '2023-11-01', '2028-11-01');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ02CD5678', '231105efgh', '2023-11-02', '2024-02-02');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ03EF9101', '231110ijkl', '2023-11-05', '2024-05-05');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ04GH2345', '231115mnop', '2023-11-07', '2024-11-07');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ05IJ6789', '231120qrst', '2023-11-10', '2024-02-10');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ06KL0123', '231125uvwx', '2023-11-12', '2024-08-12');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ07MN4567', '231130yzab', '2023-11-15', '2024-05-15');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ08OP8910', '231205cdef', '2023-11-18', '2024-11-18');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ09QR2345', '231210ghij', '2023-11-20', '2023-12-20');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ10ST6789', '231215klmn', '2023-11-22', '2024-05-22');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ11UV0123', '231220opqr', '2023-11-25', '2024-02-25');  
INSERT INTO VehiclePromotionMapping VALUES ('GJ12WX3456', '231225stuv', '2023-11-28', '2024-11-28');  
INSERT INTO VehiclePromotionMapping VALUES ('MH12YZ7890', '231230wxyz', '2023-12-01', '2024-01-01');  
INSERT INTO VehiclePromotionMapping VALUES ('RJ14AB1234', '240105abcd', '2023-12-05', '2024-12-05');  
INSERT INTO VehiclePromotionMapping VALUES ('UP16CD5678', '240110efgh', '2023-12-08', '2024-09-08');  
INSERT INTO VehiclePromotionMapping VALUES ('MP09EF9101', '240115ijkl', '2023-12-10', '2024-06-10');  
INSERT INTO VehiclePromotionMapping VALUES ('KA03GH2345', '240120mnop', '2023-12-13', '2024-09-13');  
INSERT INTO VehiclePromotionMapping VALUES ('TN07IJ6789', '240125qrst', '2023-12-15', '2024-12-15');  
INSERT INTO VehiclePromotionMapping VALUES ('DL04KL0123', '240130uvwx', '2023-12-18', '2024-03-18');  
INSERT INTO VehiclePromotionMapping VALUES ('HR05MN4567', '240205yzab', '2023-12-20', '2024-01-20');
INSERT INTO VehiclePromotionMapping VALUES ('GJ02CD5678', '231101abcd', '2024-12-16', '2025-03-01');
INSERT INTO VehiclePromotionMapping VALUES ('GJ03EF9101', '231101abcd', '2024-12-16', '2025-04-16');
INSERT INTO VehiclePromotionMapping VALUES ('GJ04GH2345', '231101abcd', '2024-12-16', '2025-06-16');
INSERT INTO VehiclePromotionMapping VALUES ('GJ05IJ6789', '231101abcd', '2024-12-16', '2025-01-30');
INSERT INTO VehiclePromotionMapping VALUES ('GJ06KL0123', '231101abcd', '2024-12-16', '2025-01-31');
INSERT INTO VehiclePromotionMapping VALUES ('GJ07MN4567', '231101abcd', '2024-12-16', '2025-02-16');
INSERT INTO VehiclePromotionMapping VALUES ('GJ08OP8910', '231101abcd', '2024-12-16', '2025-03-16');
INSERT INTO VehiclePromotionMapping VALUES ('GJ09QR2345', '231101abcd', '2024-12-16', '2025-05-16');
INSERT INTO VehiclePromotionMapping VALUES ('GJ10ST6789', '231101abcd', '2024-12-16', '2024-12-26');
INSERT INTO VehiclePromotionMapping VALUES ('GJ11UV0123', '231101abcd', '2024-12-16', '2025-04-01');
INSERT INTO VehiclePromotionMapping VALUES ('GJ12WX3456', '231101abcd', '2024-12-16', '2025-01-10');
INSERT INTO VehiclePromotionMapping VALUES ('MH12YZ7890', '231101abcd', '2024-12-16', '2025-05-01');
INSERT INTO VehiclePromotionMapping VALUES ('RJ14AB1234', '231101abcd', '2024-12-16', '2024-12-30');
INSERT INTO VehiclePromotionMapping VALUES ('UP16CD5678', '231101abcd', '2024-12-16', '2025-05-16');
INSERT INTO VehiclePromotionMapping VALUES ('MP09EF9101', '231101abcd', '2024-12-16', '2025-07-01');
INSERT INTO VehiclePromotionMapping VALUES ('KA03GH2345', '231101abcd', '2024-12-16', '2025-04-16');
INSERT INTO VehiclePromotionMapping VALUES ('TN07IJ6789', '231101abcd', '2024-12-16', '2025-01-05');
INSERT INTO VehiclePromotionMapping VALUES ('DL04KL0123', '231101abcd', '2024-12-16', '2025-06-01');
INSERT INTO VehiclePromotionMapping VALUES ('HR05MN4567', '231101abcd', '2024-12-16', '2025-02-04');

--courier mapping
INSERT INTO CourierMapping VALUES ('23110100aa', '202311010001');
INSERT INTO CourierMapping VALUES ('23110100ab', '202311010001');
INSERT INTO CourierMapping VALUES ('23110100ac', '202311210008');
INSERT INTO CourierMapping VALUES ('23110100ad', '202311050002');
INSERT INTO CourierMapping VALUES ('23110100ae', '202311100004');
INSERT INTO CourierMapping VALUES ('23110100af', '202311120005');
INSERT INTO CourierMapping VALUES ('23120100aa', '202311130006');
INSERT INTO CourierMapping VALUES ('23120100ab', '202311080003');
INSERT INTO CourierMapping VALUES ('23120100ac', '202311200007');
INSERT INTO CourierMapping VALUES ('23120100ad', '202311130006');
INSERT INTO CourierMapping VALUES ('23120100ae', '202311010001');
INSERT INTO CourierMapping VALUES ('23120100af', '202311050002');
INSERT INTO CourierMapping VALUES ('24010100aa', '202311080003');
INSERT INTO CourierMapping VALUES ('24010100ab', '202311100004');
INSERT INTO CourierMapping VALUES ('24010100ac', '202311210008');
INSERT INTO CourierMapping VALUES ('24010100ad', '202311130006');
INSERT INTO CourierMapping VALUES ('24010100ae', '202311010001');

-- vehicle city mapping

INSERT INTO vehiclecitymapping VALUES ('GJ06KL0123', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('GJ03EF9101', 'Mumbai');
INSERT INTO vehiclecitymapping VALUES ('GJ05IJ6789', 'Vadodara');
INSERT INTO vehiclecitymapping VALUES ('RJ14AB1234', 'Bhavnagar');
INSERT INTO vehiclecitymapping VALUES ('GJ07MN4567', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('GJ02CD5678', 'Rajkot');
INSERT INTO vehiclecitymapping VALUES ('MH12YZ7890', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('UP16CD5678', 'Surat');
INSERT INTO vehiclecitymapping VALUES ('GJ09QR2345', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('MP09EF9101', 'Vadodara');
INSERT INTO vehiclecitymapping VALUES ('KA03GH2345', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('HR05MN4567', 'Bhavnagar');
INSERT INTO vehiclecitymapping VALUES ('GJ10ST6789', 'New Delhi');
INSERT INTO vehiclecitymapping VALUES ('TN07IJ6789', 'Mumbai');
INSERT INTO vehiclecitymapping VALUES ('GJ11UV0123', 'Surat');
INSERT INTO vehiclecitymapping VALUES ('DL04KL0123', 'New Delhi');
INSERT INTO vehiclecitymapping VALUES ('DL04KL0123', 'Mumbai');
INSERT INTO vehiclecitymapping VALUES ('GJ10ST6789', 'Mumbai');
INSERT INTO vehiclecitymapping VALUES ('GJ11UV0123', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('GJ05IJ6789', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('GJ03EF9101', 'Valsad');
INSERT INTO vehiclecitymapping VALUES ('KA03GH2345', 'Surat');
INSERT INTO vehiclecitymapping VALUES ('RJ14AB1234', 'Surat');
INSERT INTO vehiclecitymapping VALUES ('TN07IJ6789', 'Rajkot');
INSERT INTO vehiclecitymapping VALUES ('MP09EF9101', 'Rajkot');
INSERT INTO vehiclecitymapping VALUES ('MH12YZ7890', 'Bhavnagar');
INSERT INTO vehiclecitymapping VALUES ('HR05MN4567', 'Vadodara');
INSERT INTO vehiclecitymapping VALUES ('UP16CD5678', 'Vadodara');
INSERT INTO vehiclecitymapping VALUES ('GJ02CD5678', 'Vadodara');
INSERT INTO vehiclecitymapping VALUES ('GJ07MN4567', 'Vadodara');
INSERT INTO vehiclecitymapping VALUES ('GJ06KL0123', 'Bharuch');
INSERT INTO vehiclecitymapping VALUES ('GJ09QR2345', 'Bharuch');