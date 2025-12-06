CREATE DATABASE lashtrack;
USE lashtrack;
 
 CREATE TABLE Clients
 (ClientID INTEGER PRIMARY KEY, 
 First_Name CHAR(50) NOT NULL,
 Surname VARCHAR(50) NOT NULL,
 Mobile_Number INTEGER NOT NULL,
 Email VARCHAR(50) NOT NULL,
 Address VARCHAR(60),
 Date_Joined VARCHAR(15)
 );
 
 CREATE TABLE Appointments
 (AppointmentID INTEGER,
 ClientID INTEGER,
 Date VARCHAR(15),
 Time VARCHAR(5),
 ServiceID INTEGER,
 Status CHAR(20),
 PRIMARY KEY (AppointmentID),
 FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
 );

CREATE TABLE Services
(ServiceID INTEGER,
Service_Name CHAR(50),
Description CHAR(50),
Price VARCHAR(50),
Duration VARCHAR(10),
PRIMARY KEY (ServiceID)
);
 
 ALTER TABLE Appointments
 ADD FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID);
 
 CREATE TABLE Payments
 (PaymentID INTEGER,
 AppointmentID INTEGER,
 Amount VARCHAR(15),
 Payment_Method VARCHAR(15),
 Payment_Date VARCHAR(15),
 PRIMARY KEY (PaymentID),
 FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
 );
 
 CREATE TABLE Feedback
 (FeedbackID INTEGER PRIMARY KEY,
 ClientID INTEGER,
 AppointmentID INTEGER,
 Feedback_Date DATE,
 Rating INTEGER,
 Comments VARCHAR(255),
 FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
 FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
 );
 
 ALTER TABLE Payments DROP COLUMN Payment_Date;
 ALTER TABLE Payments ADD Payment_Date Date;
 
 SELECT * FROM Payments;
 
 ALTER TABLE Clients DROP COLUMN Date_Joined;
 ALTER TABLE Clients ADD Date_joined Date;
 
 SELECT * FROM Clients;
 
ALTER TABLE Clients MODIFY COLUMN Mobile_Number VARCHAR(15);
 INSERT INTO Clients
 (ClientID, First_Name, Surname, Mobile_Number, Email, Address, Date_Joined)
 VALUES
 (1, 'Whitney', 'Rossi', '07911123456', 'WhitneyRossi@gmail.com', '78 Elm Drive, Manchester, M1 3AA', '2024-05-22'),
 (2, 'Tracy', 'Stone', '07500123456', 'TracyOjiessy123@gmail.com', '67 Ash Terrace, Liverpool, L1 0AA', '2024-06-15'),
 (3, 'Hana', 'Kim', '07900123456', 'HanaKim@outlook.com', '56 Willow Crescent, Bristol, BS1 7AA', '2024-06-16'),
 (4, 'Fatima', 'Al-Mansoori ', '07424567890', 'fatima.am@yahoo.co.uk', '90 Pine Avenue, Leeds, LS1 4AA', '2024-06-25'),
 (5, 'Yuki', 'Tanaka', '07912345678', 'tanaka,yuki@gmail.com', '34 Cedar Lane, Edinburgh, EH1 6AA', '2024-06-29'),
 (6, 'Zara', 'Ali', '07956123456', 'zara.ali@hotmail.com', '23 Chestnut Street, Sheffield, S1 9AA', '2024-07-04'),
 (7, 'Grace', 'Osei', '07834567890', 'grace.osei@gmail.com', '90 Broad Street, Cardiff, CF10 2BG', '2024-07-05'),
 (8, 'Amara', 'Okafor', '07770987654', 'amara.okafor@outlook.com','34 Regent Street, Newcastle, NE1 4AD', '2024-07-10'),
 (9, 'Nia', 'Kofi', '07512345678', 'Nia.KO@gmail.com', '123 Elm Street, Birmingham, B1 1AA', '2024-07-11'),
 (10,'Maya', 'Kumar', '07700123456', 'MayaKumar@yahoo.com', '12 Blackfriars Road, London, SE1 8XJ', '2024-07-12');
 
ALTER TABLE Services MODIFY COLUMN Description VARCHAR(255);
INSERT INTO Services
(ServiceID, Service_Name, Description, Price, Duration)
VALUES
(9, 'SASHA Mega Strip Lash', 'Perfect for your special occasions with mega volume coverage, spikes & bottom lashes', '65.00', '02:30:00'),
(10, 'MEGA Volume', 'If you love full coverage always, this set is for you', '60.00', '02:00:00'),
(11, 'WISPY Strip-a-like', 'When you love the glam of Sasha, but don’t require the mega coverage - and a wispier look', '55.00', '02:00:00'),
(12, 'Russian Volume', 'You can’t go wrong with a classic russian style, outcome depends on you! Choose a doll/cat eye map, & customise your lengths', '55.00', '02:00:00'),
(13, 'CLOE Light Volume', 'For my more natural lash lovers, this set gives a hybrid like look', '45.00', '01:30:00'),
(14, 'SASHA Mega Strip Lash INFILL', NULL, '45.00', '00:45:00'),
(15, 'WISPY Strip-a-like INFILL', NULL, '45.00', '00:45:00'),
(16, 'MEGA Volume INFILL', NULL, '45.00', '00:45:00'),
(17, 'RUSSIAN Volume INFILL', NULL, '40.00', '00:45:00'),
(18, 'CLOE Light Volume INFILL', NULL, '35.00', '00:45:00' ),
(19, 'Mini Infill', 'A quick top up, if you don’t need an infill but want your lashes to look like a fresh set again eligible within 10 days of your appointment', '25.00', '00:45:00'),
(20, 'Removals', NULL, '10.00', '00:30:00'),
(21, 'Bottom Lashes', NULL, '05.00', '00:30:00');
SELECT * FROM Services;

 INSERT INTO Appointments
 (AppointmentID, ClientID, Date, Time, ServiceID, Status)
 VALUES
 (251, 1, '2024-07-15', '10:00', 10, 'Completed'),
 (230, 1, '2024-05-23', '13:30', 12, 'Completed'),
 (226, 4, '2024-06-25', '12:30', 17, 'Completed'),
 (227, 5, '2024-06-29', '18:30', 16, 'Completed'),
 (221, 1, '2024-01-10', '12:30', 13, 'Completed'),
 (225, 1, '2024-04-18', '11:30', 9, 'Completed'),
 (224, 6, '2024-07-05', '11:00', 18, 'Completed'),
 (222, 7, '2024-07-05', '13:30', 16, 'Completed'),
 (229, 9, '2024-07-09', '10:00', 20, 'Completed'),
 (228, 8, '2024-07-011', '15:00', 19, 'Completed'),
 (231, 10, '2024-07-12', '18:30', 11, 'Completed'),
 (233, 8, '2024-07-14', '14:00', 19, 'Completed'),
 (260, 1, '2024-07-30', '16:30', 9, 'Pending'),
 (252, 2, '2024-07-10', '15:30', 11, 'Completed'),
 (235, 2, '2024-07-18', '12:00', 14, 'Completed'),
 (239, 2, '2024-04-18', '11:30', 9, 'Completed'),
 (262, 2, '2024-08-01', '17:30', 15, 'Pending'),
 (263, 3, '2024-08-02', '10:30', 16, 'Pending'),
 (264, 4, '2024-08-02', '12:30', 17, 'Pending'),
 (265, 5, '2024-08-03', '18:30', 16, 'Pending'),
 (266, 6, '2024-08-05', '11:00', 18, 'Pending'),
 (267, 7, '2024-08-05', '13:30', 16, 'Pending'),
 (268, 8, '2024-08-06', '15:00', 19, 'Pending'),
 (269, 9, '2024-08-06', '18:00', 20, 'Pending'),
 (270, 10, '2024-08-07', '18:30', 21, 'Pending');
 SELECT * FROM Appointments;
 
 INSERT INTO Payments
 (PaymentID, AppointmentID, Amount, Payment_Method, Payment_Date)
VALUES
 (1051, 251, '65.00', 'Credit Card', '2024-07-15'),
 (1052, 230, '55.00', 'Debit Card', '2024-05-23'),
 (1053, 226, '40.00', 'Cash', '2024-06-25'),
 (1054, 227, '45.00', 'Credit Card', '2024-06-29'),
 (1055, 221, '45.00', 'Cash', '2024-01-10'),
 (1056, 225, '65.00', 'Debit Card', '2024-04-18'),
 (1057, 224, '35.00', 'Credit Card', '2024-07-05'),
 (1058, 222, '45.00', 'Cash', '2024-07-05'),
 (1059, 229, '10.00', 'Debit Card', '2024-07-09'),
 (1060, 228, '25.00', 'Credit Card', '2024-07-11'),
 (1061, 231, '55.00', 'Cash', '2024-07-12'),
 (1062, 233, '25.00', 'Debit Card', '2024-07-14'),
 (1063, 260, '45.00', 'Credit Card', '2024-07-30'),
 (1064, 252, '55.00', 'Cash', '2024-07-10'),
 (1065, 235, '10.00', 'Debit Card', '2024-07-18'),
 (1066, 239, '65.00', 'Credit Card', '2024-04-18'),
 (1067, 262, '45.00', 'Cash', '2024-08-01'),
 (1068, 263, '55.00', 'Debit Card', '2024-08-02'),
 (1069, 264, '40.00', 'Credit Card', '2024-08-02'),
 (1070, 265, '45.00', 'Cash', '2024-08-03'),
 (1071, 266, '35.00', 'Debit Card', '2024-08-05'),
 (1072, 267, '25.00', 'Credit Card', '2024-08-05'),
 (1073, 268, '10.00', 'Cash', '2024-08-06'),
 (1074, 269, '25.00', 'Debit Card', '2024-08-06'),
 (1075, 270, '55.00', 'Credit Card', '2024-08-07');

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

INSERT INTO Feedback
 (FeedbackID, ClientID, AppointmentID, Feedback_Date, Rating, Comments)
VALUES
 (501, 1, 251, '2024-07-16', 5, 'Excellent service! Very happy with the results.'),
 (502, 2, 252, '2024-07-11', 4, 'Good service, but the appointment was a bit delayed.'),
 (503, 3, 263, '2024-08-03', 5, 'Fantastic experience. Will definitely come back!'),
 (504, 4, 226, '2024-06-26', 3, 'Service was okay, but not as good as expected.'),
 (505, 5, 227, '2024-06-30', 4, 'Nice results, though the duration was a bit longer than anticipated.'),
 (506, 6, 224, '2024-07-06', 5, 'Great job! Very professional and friendly.'),
 (507, 7, 222, '2024-07-06', 2, 'Not satisfied. The lashes didn’t last as long as promised.'),
 (508, 8, 228, '2024-07-12', 4, 'Overall good, but there were a few minor issues.'),
 (509, 9, 229, '2024-07-10', 5, 'Amazing service! Highly recommend.'),
 (510, 10, 231, '2024-07-13', 5, 'Excellent as always. Thank you for the great service!');
 
 #view using joins
 CREATE VIEW AppointmentDetails AS
SELECT
    a.AppointmentID,
    c.First_Name AS ClientFirstName,
    c.Surname AS ClientLastName,
    s.Service_Name,
    s.Price AS ServicePrice,
    a.Date AS AppointmentDate,
    a.Time AS AppointmentTime,
    p.Amount AS PaymentAmount,
    p.Payment_Method,
    p.Payment_Date
FROM
    Appointments a
    INNER JOIN Clients c ON a.ClientID = c.ClientID
    INNER JOIN Services s ON a.ServiceID = s.ServiceID
    LEFT JOIN Payments p ON a.AppointmentID = p.AppointmentID;
SELECT * FROM appointmentdetails;

#create stored function
DELIMITER //

CREATE FUNCTION AverageServiceRating(service_id INT)
RETURNS DECIMAL(3, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE avg_rating DECIMAL(3, 2);
    SELECT AVG(f.Rating) INTO avg_rating
    FROM Feedback f
    INNER JOIN Appointments a ON f.AppointmentID = a.AppointmentID
    WHERE a.ServiceID = service_id;
    RETURN avg_rating;
END //

DELIMITER ;
SELECT AverageServiceRating(17) AS AvgRating;

#query/sub- clients +1 appointments and total had
SELECT 
    c.ClientID, c.First_Name, c.Surname, c.Email,
    appointment_counts.TotalAppointments
FROM 
    Clients c
INNER JOIN 
    (SELECT 
        ClientID, 
        COUNT(*) AS TotalAppointments
     FROM 
        Appointments
     GROUP BY 
        ClientID
     HAVING 
        COUNT(*) > 1) AS appointment_counts
ON 
    c.ClientID = appointment_counts.ClientID;
    
#creeate database diagram using dbdiagram.io. as bench keeps crashing when clicking reverse engineer

#procedure to give total made per service each month
DELIMITER //
CREATE PROCEDURE GetTotalRevenueByService(IN monthYear CHAR(7))
BEGIN
    SELECT 
        s.Service_Name,
        SUM(p.Amount) AS TotalRevenue
    FROM 
        Payments p
    JOIN 
        Appointments a ON p.AppointmentID = a.AppointmentID
    JOIN 
        Services s ON a.ServiceID = s.ServiceID
    WHERE 
        DATE_FORMAT(p.Payment_Date, '%Y-%m') = monthYear
    GROUP BY 
        s.Service_Name
    ORDER BY 
        TotalRevenue DESC;
END //

DELIMITER ;
CALL GetTotalRevenueByService('2024-07');

#Trigger to update the appointment status
DELIMITER //
CREATE TRIGGER UpdateAppointmentStatus_After_Payment
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    UPDATE Appointments
    SET Status = 'Completed'
    WHERE AppointmentID = NEW.AppointmentID;
END //
DELIMITER ;

INSERT INTO Payments (PaymentID, AppointmentID, Amount, Payment_Method, Payment_Date)
VALUES (1076, 262, '55.00', 'Credit Card', '2024-08-08');
SELECT * FROM Appointments WHERE AppointmentID = 262;
