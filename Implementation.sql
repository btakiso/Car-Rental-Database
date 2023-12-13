-- Bereket Takiso

DROP SCHEMA IF EXISTS Section6;
CREATE SCHEMA Section6;
USE Section6;

-- create table Customer
CREATE TABLE customer (
	customer_ID INT NOT NULL,
    customer_first VARCHAR(45),
    customer_last VARCHAR(45),
    customer_phone_number CHAR(10),
    customer_address VARCHAR(45),
    customer_city VARCHAR(45),
    customer_state CHAR(2),
    customer_zip INT,
	CONSTRAINT PRIMARY KEY(customer_ID));

-- create table Office
CREATE TABLE office (
	office_ID INT NOT NULL,
    office_address VARCHAR(45),
    office_state CHAR(2),
    office_city VARCHAR(45),
    office_zip INT,
	CONSTRAINT PRIMARY KEY(office_ID));

-- create table Insurance
CREATE TABLE insurance (
	insurance_ID INT NOT NULL,
    insurance_name VARCHAR(45),
    insurance_plan VARCHAR(45),
    insurance_cost DECIMAL(10, 2),
	CONSTRAINT PRIMARY KEY(insurance_ID));
    
-- create table Car
CREATE TABLE car (
	car_ID INT NOT NULL,
    car_make VARCHAR(45),
    car_model VARCHAR(45),
    car_stock INT,
    office_ID INT NOT NULL,
    insurance_ID INT NOT NULL,
	CONSTRAINT PRIMARY KEY(car_ID),
    CONSTRAINT FOREIGN KEY (office_ID) REFERENCES office(office_ID),
    CONSTRAINT FOREIGN KEY (insurance_ID) REFERENCES insurance(insurance_ID));
    
-- create table customer_car_rental
CREATE TABLE customer_car_rental (
	rental_ID INT NOT NULL,
    customer_ID INT NOT NULL,
    car_ID INT NOT NULL,
    rental_date DATE,
	CONSTRAINT PRIMARY KEY(rental_ID),
    CONSTRAINT FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID),
    CONSTRAINT FOREIGN KEY (car_ID) REFERENCES car(car_ID));
    
-- create table office_has_customer
CREATE TABLE office_has_customer (
	office_ID INT NOT NULL,
    customer_ID INT NOT NULL,
    PRIMARY KEY (office_ID, customer_ID),
    CONSTRAINT FOREIGN KEY (office_ID) REFERENCES office(office_ID),
    CONSTRAINT FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID));
    
-- Order: customer, office, insurance, car, customer_car_rental, office_has_customer

-- Insert into customer
INSERT INTO customer VALUES(1, "Sean", "Nolan", 1234567890, "100 West Lane", "North East", "MD", 21901);
INSERT INTO customer VALUES(2, "Bereket", "Takiso", 5238769078, "101 North Lane", "South East", "CA", 90101);
INSERT INTO customer VALUES(3, "John", "Johnny", 2847392738, "102 East Lane", "North West", "GA", 38471);
INSERT INTO customer VALUES(4, "Logan", "Smith", 3857193848, "95 South St", "Lawrenceville", "GA", 30046);
INSERT INTO customer VALUES(5, "Buck", "Goose", 8729372891, "3008 Duck Street", "Duckland", "NY", 18393);
INSERT INTO customer VALUES(6, "Matt", "Ginny", 9876551939, "800  Lane", "North East", "KY", 21901);
INSERT INTO customer VALUES(7, "Carlo", "Nguyen", 3827983738, "25 Street Lane", "Delaware City", "DE", 20091);

-- Insert into office
INSERT INTO office VALUES(1, "101 Office Lane", "GA", "Lawrenceville", 30046);
INSERT INTO office VALUES(2, "102 Office Lane", "GA", "Atlanta", 30046);
INSERT INTO office VALUES(3, "103 Office St", "FL", "Miami", 30046);
INSERT INTO office VALUES(4, "200 Office St", "CA", "Palo Alto", 30046);
INSERT INTO office VALUES(5, "201 Office St", "MD", "Silver Spring", 30046);
INSERT INTO office VALUES(6, "202 Office St", "OH", "Columbus", 30046);
INSERT INTO office VALUES(7, "203 Office Lane", "GA", "Alpharetta", 30046);

-- Insert into insurance
INSERT INTO insurance VALUES(1, "SafeHands Insurance", "Teen Driver Coverage", 2000.00);
INSERT INTO insurance VALUES(2, "AutoGuard Insurance", "Comprehensive Plan", 1350.50);
INSERT INTO insurance VALUES(3, "SafeDrive Insurance", "Basic Coverage", 850.75);
INSERT INTO insurance VALUES(4, "DriveSure Insurance", "Full Coverage", 1800.25);
INSERT INTO insurance VALUES(5, "AutoShield Insurance", "Collision Coverage", 1200.90);
INSERT INTO insurance VALUES(6, "Guardian Auto Insurance", "Liability Coverage", 950.60);
INSERT INTO insurance VALUES(7, "DriveSmart Insurance", "Rideshare Coverage", 1100.30);

-- Insert into car
INSERT INTO car VALUES(1, "Tesla", "Model Y", 7, 1, 1);
INSERT INTO car VALUES(2, "Ford", "Mustang", 9, 2, 2);
INSERT INTO car VALUES(3, "Toyota", "Camry", 12, 3, 3);
INSERT INTO car VALUES(4, "Honda", "Civic", 5, 4, 4);
INSERT INTO car VALUES(5, "Chevrolet", "Silverado", 9, 5, 5);
INSERT INTO car VALUES(6, "BMW", "X5", 3, 6, 6);
INSERT INTO car VALUES(7, "Audi", "A4", 14, 7, 7);

-- Insert into customer_car_rental
INSERT INTO customer_car_rental VALUES(1, 1, 1, '2023-10-07');
INSERT INTO customer_car_rental VALUES(2, 2, 2, '2020-01-22');
INSERT INTO customer_car_rental VALUES(3, 3, 3, '2022-05-02');
INSERT INTO customer_car_rental VALUES(4, 4, 4, '2023-09-10');
INSERT INTO customer_car_rental VALUES(5, 5, 5, '2021-03-14');
INSERT INTO customer_car_rental VALUES(6, 6, 6, '2020-06-26');
INSERT INTO customer_car_rental VALUES(7, 7, 7, '2023-07-08');

-- Insert into office_has_customer
INSERT INTO office_has_customer VALUES(1, 1);
INSERT INTO office_has_customer VALUES(1, 3);
INSERT INTO office_has_customer VALUES(1, 5);
INSERT INTO office_has_customer VALUES(2, 1);
INSERT INTO office_has_customer VALUES(2, 2);
INSERT INTO office_has_customer VALUES(2, 6);
INSERT INTO office_has_customer VALUES(3, 1);
INSERT INTO office_has_customer VALUES(4, 7);
INSERT INTO office_has_customer VALUES(5, 3);
INSERT INTO office_has_customer VALUES(6, 4);
INSERT INTO office_has_customer VALUES(7, 6);