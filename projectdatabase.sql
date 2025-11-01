
-- Create the new database
CREATE DATABASE IF NOT EXISTS restaurantdb;
USE restaurantdb;

-- Create Users table
CREATE TABLE Users (
    UserId INT PRIMARY KEY AUTO_INCREMENT,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50) NOT NULL CHECK (Role IN ('Admin', 'Receptionist', 'Waiter', 'Chef'))
);

-- Create MenuItems table
CREATE TABLE MenuItems (
    ItemId INT PRIMARY KEY AUTO_INCREMENT,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Category NVARCHAR(50) NOT NULL CHECK (Category IN ('Appetizer', 'Main Course', 'Dessert', 'Beverage'))
);

-- Create Staff table
CREATE TABLE Staff (
    StaffId INT PRIMARY KEY AUTO_INCREMENT,
    Name NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    Contact NVARCHAR(100) NOT NULL,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- Create Discounts table
CREATE TABLE Discounts (
    DiscountId INT PRIMARY KEY AUTO_INCREMENT,
    Name NVARCHAR(100) NOT NULL,
    Percentage DECIMAL(5,2) NOT NULL CHECK (Percentage BETWEEN 0 AND 100),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CreatedBy INT NOT NULL,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserId) ON DELETE RESTRICT
);

-- Create ActivityLogs table
CREATE TABLE ActivityLogs (
    LogId INT PRIMARY KEY AUTO_INCREMENT,
    UserId INT NOT NULL,
    ActivityType NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    ActivityTimestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE RESTRICT
);

-- Create W_Tables table
CREATE TABLE W_Tables (
    TableId INT PRIMARY KEY AUTO_INCREMENT,
    TableNumber INT NOT NULL UNIQUE CHECK (TableNumber > 0),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Occupied', 'OccupiedWithOrder', 'Reserved', 'Available', 'Payment Done')),
    CustomerName NVARCHAR(100) NULL,
    LastUpdated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Bills table to group orders for a table
CREATE TABLE Bills (
    BillId INT PRIMARY KEY AUTO_INCREMENT,
    TableId INT NOT NULL,
    BillTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (TableId) REFERENCES W_Tables(TableId) ON DELETE RESTRICT
);

-- Create W_Orders table with BillId
CREATE TABLE W_Orders (
    OrderId INT PRIMARY KEY AUTO_INCREMENT,
    TableId INT NOT NULL,
    ItemId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    SpecialRequest NVARCHAR(500),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Preparing', 'Ready', 'Served')),
    WaiterId INT NOT NULL,
    OrderTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    BillId INT,
    FOREIGN KEY (TableId) REFERENCES W_Tables(TableId) ON DELETE RESTRICT,
    FOREIGN KEY (ItemId) REFERENCES MenuItems(ItemId) ON DELETE RESTRICT,
    FOREIGN KEY (WaiterId) REFERENCES Staff(StaffId) ON DELETE RESTRICT,
    FOREIGN KEY (BillId) REFERENCES Bills(BillId) ON DELETE SET NULL
);

-- Create Reservations table
CREATE TABLE Reservations (
    ReservationId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    TableId INT,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
    ReservationTime DATETIME NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TableId) REFERENCES W_Tables(TableId) ON DELETE SET NULL
);

-- Create Waitlist table
CREATE TABLE Waitlist (
    WaitlistId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15) NOT NULL,
    PartySize INT NOT NULL CHECK (PartySize > 0),
    TimeAdded DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Waiting', 'Notified', 'Assigned', 'Removed')),
    TableId INT,
    FOREIGN KEY (TableId) REFERENCES W_Tables(TableId) ON DELETE SET NULL
);

-- Create Payments table with BillId
CREATE TABLE Payments (
    PaymentId INT PRIMARY KEY AUTO_INCREMENT,
    BillId INT,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
    PaymentTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (BillId) REFERENCES Bills(BillId) ON DELETE RESTRICT
);

-- Create W_Orders_Archive table
CREATE TABLE W_Orders_Archive (
    ArchiveId INT PRIMARY KEY AUTO_INCREMENT,
    OrderId INT,
    TableId INT,
    ItemId INT,
    Quantity INT,
    SpecialRequest NVARCHAR(500),
    Status NVARCHAR(20),
    WaiterId INT,
    OrderTime DATETIME,
    ArchiveTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TableId) REFERENCES W_Tables(TableId),
    FOREIGN KEY (ItemId) REFERENCES MenuItems(ItemId),
    FOREIGN KEY (WaiterId) REFERENCES Staff(StaffId)
);

-- Insert Test Data
INSERT INTO Users (Username, Password, Role) VALUES
('adminuser', 'adminpass123', 'Admin'),
('chefuser', 'chefpass123', 'Chef'),
('waiteruser', 'waiterpass123', 'Waiter'),
('receptionuser', 'receptionpass123', 'Receptionist');

INSERT INTO MenuItems (Name, Price, Category) VALUES
('Momo', 120.00, 'Appetizer'),
('Chicken Sekuwa', 200.00, 'Appetizer'),
('Paneer Chili', 190.00, 'Appetizer'),
('Buff Sukuti', 180.00, 'Appetizer'),
('Samosa', 40.00, 'Appetizer'),
('French Fries', 100.00, 'Appetizer'),
('Spring Roll', 90.00, 'Appetizer'),
('Veg Pakoda', 80.00, 'Appetizer'),
('Cheese Balls', 110.00, 'Appetizer'),
('Garlic Bread', 95.00, 'Appetizer'),
('Chowmein', 150.00, 'Main Course'),
('Fried Rice', 170.00, 'Main Course'),
('Thukpa', 140.00, 'Main Course'),
('Chicken Curry', 220.00, 'Main Course'),
('Veg Curry', 160.00, 'Main Course'),
('Nepali Thali Set', 300.00, 'Main Course'),
('Plain Rice', 90.00, 'Main Course'),
('Dal Fry', 110.00, 'Main Course'),
('Paneer Butter Masala', 210.00, 'Main Course'),
('Egg Curry', 180.00, 'Main Course'),
('Veg Biryani', 200.00, 'Main Course'),
('Chicken Biryani', 250.00, 'Main Course'),
('Masala Dosa', 140.00, 'Main Course'),
('Puri Tarkari', 130.00, 'Main Course'),
('Tandoori Roti Set', 100.00, 'Main Course'),
('Juju Dhau', 80.00, 'Dessert'),
('Rasgulla', 60.00, 'Dessert'),
('Gulab Jamun', 70.00, 'Dessert'),
('Black Forest Cake', 150.00, 'Dessert'),
('Ice Cream Sundae', 110.00, 'Dessert'),
('Fruit Salad', 90.00, 'Dessert'),
('Chocolate Brownie', 130.00, 'Dessert'),
('Vanilla Pudding', 100.00, 'Dessert'),
('Masala Tea', 30.00, 'Beverage'),
('Lassi', 60.00, 'Beverage'),
('Lemon Soda', 50.00, 'Beverage'),
('Cold Coffee', 100.00, 'Beverage'),
('Milkshake - Vanilla', 120.00,'Beverage'),
('Orange Juice', 80.00, 'Beverage'),
('Mango Juice', 85.00, 'Beverage'),
('Iced Tea', 70.00, 'Beverage'),
('Black Coffee', 55.00, 'Beverage');

INSERT INTO Staff (Name, Role, Contact, UserId) VALUES
('Ramesh Thapa', 'Chef', 'ramesh@resto.com', 2),
('Sita Rana', 'Waiter', 'sita@resto.com', 3),
('Kiran Lama', 'Receptionist', 'kiran@resto.com', 4),
('Bikash Shrestha', 'Manager', 'bikash@resto.com', 1);

INSERT INTO Discounts (Name, Percentage, StartDate, EndDate, CreatedBy) VALUES
('Teej Special', 20.00, '2025-10-01', '2025-10-20', 1),
('Weekend Offer', 15.00, '2025-06-01', '2025-08-31', 1);

INSERT INTO W_Tables (TableNumber, Status, CustomerName) VALUES
(1, 'Available', NULL),
(2, 'Available', NULL),
(3, 'Available', NULL),
(4, 'Available', NULL),
(5, 'Available', NULL),
(6, 'Available', NULL),
(7, 'Available', NULL),
(8, 'Available', NULL),
(9, 'Available', NULL),
(10, 'Available', NULL),
(11, 'Available', NULL),
(12, 'Available', NULL),
(13, 'Available', NULL),
(14, 'Available', NULL),
(15, 'Available', NULL),
(16, 'Available', NULL),
(17, 'Available', NULL),
(18, 'Available', NULL),
(19, 'Available', NULL),
(20, 'Available', NULL);

select * from  staff;
select * from reservations;
select * from discounts;
select * from w_orders;
select * from w_tables
select * from waitlist
select * from users
select * from menuitems
select * from activitylogs
