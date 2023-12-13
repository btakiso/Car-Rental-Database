-- Bereket Takiso


USE Section6;

-- Query 1: All customers who live in either "Lawrenceville" or "North East"
SELECT customer_first AS 'First Name', customer_last AS 'Last Name', 
	   customer_address AS 'Address'
FROM customer
WHERE customer_city = 'Lawrenceville' OR customer_city = 'North East'
ORDER BY customer_ID;

-- Query 2: All customers whose first name starts with "S" or "B"
SELECT customer_first AS 'First Name', customer_last AS 'Last Name', 
	   customer_phone_number AS 'Phone Number'
FROM customer
WHERE customer_first LIKE 'S%' OR customer_first LIKE '_E%'
ORDER BY customer_ID;

-- Query 3: All cars that have a stock between 5 and 10
SELECT car_make AS 'Car Make', car_model AS 'Car Model', 
	   car_stock AS 'Car Stock'
FROM car
WHERE car_stock BETWEEN 5 AND 10
ORDER BY car_ID;

-- Query 4: Join customer and car rental tables to list customer name and car make/model
SELECT CONCAT(customer_first,' ',customer_last) AS Customer,
	   car_make AS Make, car_model AS Model
FROM customer
JOIN customer_car_rental ON customer.customer_ID = customer_car_rental.customer_ID
JOIN car ON customer_car_rental.car_ID = car.car_ID
ORDER BY Customer;

-- Query 5: The total cost of each insurance plan including a convenience fee
SELECT insurance_name AS 'Insurance Name', 
      CONCAT('$',(insurance_cost + 10)) AS 'Total Cost Inc ConvFee'
FROM insurance
ORDER BY insurance_name;

-- Query 6: The number of cars each office has
SELECT o.office_address AS 'Office Address', 
	   COUNT(c.car_ID) AS 'Number of Cars'
FROM office o
JOIN car c ON o.office_ID = c.office_ID
GROUP BY o.office_address;

-- Query 7: The customers who have rented a car from an office in "GA"
SELECT c.customer_first AS 'Customer First Name', 
	   c.customer_last AS 'Customer Last Name'
FROM customer c
WHERE c.customer_ID IN (
  SELECT cr.customer_ID
  FROM customer_car_rental cr
  JOIN car ca ON cr.car_ID = ca.car_ID
  JOIN office o ON ca.office_ID = o.office_ID
  WHERE o.office_state = 'GA'
);
