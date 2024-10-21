CREATE DATABASE minions;

CREATE TABLE minions (
    id INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    CONSTRAINT PK_MINION_ID PRIMARY KEY (id)
);

CREATE TABLE towns (
    town_id INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    CONSTRAINT PK_TOWNS_TOWN_ID PRIMARY KEY (town_id)
);

ALTER TABLE towns
CHANGE COLUMN town_id id INT AUTO_INCREMENT;

ALTER TABLE minions
ADD COLUMN town_id INT NOT NULL;

ALTER TABLE minions
/*INTRO*/
ADD CONSTRAINT FK_minins_towns_id FOREIGN KEY (town_id) REFERENCES towns(id);

ALTER TABLE minions
MODIFY age INT;

INSERT INTO towns(id,`name`)
VALUE
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');

INSERT INTO minions(id,`name`,age,town_id)
VALUE
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',NULL,2);

TRUNCATE TABLE minions;

DROP TABLE minions;
DROP TABLE towns;

CREATE TABLE people (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    picture BLOB,
    height DECIMAL(3 , 2 ),
    weight DECIMAL(5 , 2 ),
    gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography TEXT,
    CHECK (gender IN ('M' , 'F')),
    CHECK (LENGTH(picture) <= 2097152)
);

INSERT INTO people(`name`,height,weight,gender,birthdate)
VALUE
('Nikolay',1.90,110,'M','1999-01-28'),
('Ivan',2.10,160,'M','1990-01-28'),
('Kristiqn',2.00,130,'M','2001-01-28'),
('Djenko',1.90,100,'M','2003-01-28'),
('Atanas',1.80,110,'M','1999-02-10');

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time DATE,
    is_deleted VARCHAR(5) NOT NULL,
    CHECK (is_deleted IN ('true' , 'false')),
    CHECK (LENGTH(profile_picture) <= 621600)
);

INSERT INTO users(username,`password`,is_deleted)
VALUE
('Nikolay','9901288740','false'),
('Ivan','9008128872','false'),
('Kristiqn','0003138876','false'),
('Djenko','0301129984','false'),
('Atanas','9902129902','true');

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT PRIMARY KEY (id,username);

ALTER TABLE users
MODIFY COLUMN last_login_time TIMESTAMP DEFAULT current_timestamp;

ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY (id),
ADD CONSTRAINT un_username UNIQUE (username);


CREATE DATABASE movies;
USE movies;

CREATE TABLE directors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(30) NOT NULL,
    notes TEXT
);

CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(20) NOT NULL,
    notes TEXT
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL,
    notes TEXT
);

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    director_id INT NOT NULL,
    copyright_year DATE NOT NULL,
    `length` INT NOT NULL,
    genre_id INT NOT NULL,
    category_id INT NOT NULL,
    rating DECIMAL(3 , 2 ) NOT NULL,
    notes TEXT
);

INSERT INTO directors(director_name)
VALUES
('Nikolay'),
('Kristiqn'),
('Ivan'),
('Djenko'),
('Atanas');

INSERT INTO genres(genre_name)
VALUES
('Horror'),
('Comedy'),
('Romantic'),
('Action'),
('Triler');

INSERT INTO categories(category_name)
VALUES
('Family'),
('For Alone'),
('For Adults'),
('For kids'),
('For Something');

INSERT INTO movies(title,director_id,copyright_year,`length`,genre_id,category_id,rating)
VALUES
('The counjuring',1,'2024-01-12',70,1,1,4.3),
('Devils',2,'2024-01-12',70,2,2,5.3),
('Hells Angels',3,'2024-01-12',70,3,3,6.3),
('Alien Invasion',4,'2024-01-12',70,4,4,9.3),
('Gundi',5,'2024-01-12',70,5,5,9);

CREATE DATABASE car_rental;

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(20) NOT NULL,
    daily_rate DECIMAL(5 , 2 ) NOT NULL,
    weekly_rate DECIMAL(6 , 2 ) NOT NULL,
    monthly_rate DECIMAL(8 , 2 ) NOT NULL,
    weekend_rate DECIMAL(6,2)
);

CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plate_number VARCHAR(10) NOT NULL,
    make VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    car_year DATE NOT NULL,
    category_id INT NOT NULL,
    doors INT NOT NULL,
    picture BLOB,
    car_condition TEXT NOT NULL,
    is_available CHAR(1) NOT NULL
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    title VARCHAR(20) NOT NULL,
    notes TEXT
);

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    driver_license_number VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    notes TEXT
);

CREATE TABLE rental_orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    car_condition TEXT,
    tank_level VARCHAR(6) NOT NULL,
    kilometrage_start DECIMAL(9 , 2 ) NOT NULL,
    kilometrage_end DECIMAL(9 , 2 ) NOT NULL,
    total_kilometrage DECIMAL(9 , 2 ) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_days INT NOT NULL,
    rate_applied DECIMAL(3 , 1 ) NOT NULL,
    tax_rate DECIMAL(3 , 1 ) NOT NULL,
    order_status VARCHAR(10) NOT NULL,
    notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (car_id) REFERENCES cars(id)
);

INSERT INTO categories(category,daily_rate,weekly_rate,monthly_rate)
VALUES
("Sport",200.21,1000.22,129888.33),
("Family",90.21,100.22,1298.33),
("Normal",100.21,126.22,12888.33);

INSERT INTO cars(plate_number,make,model,car_year,category_id,doors,car_condition,is_available)
VALUES
('H0223BB','Audi','A6','2008-01-22',1,5,'Good',1),
('CB0722AB','BMW','M6','2008-01-22',1,4,'Good',1),
('A0423CB','Mercedes','GLA','2008-01-22',1,4,'Good',1);

INSERT INTO employees(first_name,last_name,title)
VALUES
('Nikolay','Nikolaev','Top'),
('Ivan','Kalimarov','Top'),
('Kristiqn','Merakov','Top');

INSERT INTO customers(driver_license_number,full_name,address,city,zip_code)
VALUES
('990123ABBN8323','Nikolay Nikolaev','Preslav 4','Smqdovo','9000'),
('124543AGHN8323','Ivan Kalimrov','Preslav 4','Shumen','9090'),
('970123ASSB8473','Kristiqn Merakov','Preslav 4','Shumen','9090');

INSERT INTO rental_orders(employee_id,
						customer_id,
                        car_id,
                        tank_level,
                        kilometrage_start,
                        kilometrage_end,
                        total_kilometrage,
                        start_date,
                        end_date,
                        total_days,
                        rate_applied,
                        tax_rate,
                        order_status)
VALUES
(1,1,1,'Full',124456,125000,46,'2024-01-01','2024-01-03',2,21.1,23.1,1),
(2,2,2,'Full',125456,125000,46,'2024-01-01','2024-01-03',2,21.1,23.1,1),
(1,1,1,'Full',124456,125000,46,'2024-01-01','2024-01-03',2,21.1,23.1,1);

CREATE DATABASE soft_uni;

CREATE TABLE towns (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(100) NOT NULL,
    town_id INT NOT NULL,
    FOREIGN KEY (town_id)
        REFERENCES towns (id)
);

CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    job_title VARCHAR(20) NOT NULL,
    department_id INT NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10 , 2 ) NOT NULL,
    address_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments (id),
    FOREIGN KEY (address_id)
        REFERENCES addresses (id)
);

INSERT INTO towns(`name`)
VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO departments(`name`)
VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO employees(first_name,middle_name,last_name,job_title,department_id,hire_date,salary)
VALUES
('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013-02-01',3500.00),
('Petar','Petrov','Petrov','Senior Engineer',1,'2004-03-02',4000.00),
('Maria','Petrova','Ivanova','Intern',5,'2016-08-28',525.25),
('Georgi','Terziev','Ivanov','CEO',2,'2007-12-09',3000.00),
('Peter','Pan','Pan','Intern',3,'2016-08-28',599.88);

SELECT 
    T.`name` AS `Name`
FROM
    towns AS T
ORDER BY T.`name`;

SELECT 
    D.`name` AS `Name`
FROM
    departments AS D
ORDER BY D.`name`;

SELECT 
    E.first_name AS `First Name`,
    E.last_name AS `Last Name`,
    E.job_title AS `Job Title`,
    E.salary AS `Salary`
FROM
    employees AS E
ORDER BY E.salary DESC;

UPDATE employees 
SET 
    salary = salary + (salary * 0.10);

SELECT 
    E.salary
FROM
    employees AS E;
