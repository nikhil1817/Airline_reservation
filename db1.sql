-- schema.sql
CREATE DATABASE IF NOT EXISTS airline_app CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE airline_app;

-- Airports (optional helper table)
CREATE TABLE IF NOT EXISTS airports (
  code VARCHAR(5) PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Flights
CREATE TABLE IF NOT EXISTS flights (
  id INT AUTO_INCREMENT PRIMARY KEY,
  flight_no VARCHAR(10) NOT NULL,
  origin VARCHAR(5) NOT NULL,
  destination VARCHAR(5) NOT NULL,
  depart_time DATETIME NOT NULL,
  arrive_time DATETIME NOT NULL,
  capacity INT NOT NULL CHECK (capacity >= 0),
  price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
  INDEX(origin), INDEX(destination), INDEX(depart_time)
);

-- Bookings
CREATE TABLE IF NOT EXISTS bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  flight_id INT NOT NULL,
  customer_name VARCHAR(100) NOT NULL,
  customer_email VARCHAR(200) NOT NULL,
  seats INT NOT NULL CHECK (seats > 0),
  booked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE,
  INDEX(customer_email)
);
