-- CREATE DATABASE DATABASE_NAME
CREATE DATABASE QUANTUMTUTORDB;
CREATE DATABASE DUMMY;

-- USE DATABASE_NAME
USE QUANTUMTUTORDB;
SHOW TABLES;

/*
	CREATE TABLE TABLE_NAME (
		COLUMN1 DATA_TYPE CONSTRAINTS,
		COLUMN2 DATA_TYPE CONSTRAINTS,
		COLUMN3 DATA_TYPE CONSTRAINTS,
		....
	);
*/
CREATE TABLE Customer(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_number VARCHAR(255),
  email VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  country VARCHAR(255),
  registration VARCHAR(255)
);

/*
	DESCRIBE table_name
*/
DESCRIBE quantumtutordb.customer;

/*
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    …,
    PRIMARY KEY(column-name(single or multiple))
);
*/
USE dummy;

CREATE TABLE customer_dummy(
	id INT,
  name VARCHAR(255),
  PRIMARY KEY (id)
);

DESCRIBE dummy.customer_dummy;

/*
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    FOREIGN KEY (column_name) REFERENCES other_table(other_column)
);
*/
CREATE TABLE order_test(
	order_id INT PRIMARY KEY,
  customer_id INT,
  quantity INT
);


CREATE TABLE order_dummy(
	order_id INT PRIMARY KEY,
  customer_id INT,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES dummy.customer_dummy(id)
);


CREATE TABLE courses(
	course_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  subtitle VARCHAR(255),
  description TEXT,
  price DECIMAL(10,2),
  instructor_id INT,
  category VARCHAR(255),
  sub_category VARCHAR(255),
  url VARCHAR(255),
  publish_date DATE,
  FOREIGN KEY (instructor_id) REFERENCES quantumtutordb.instructors(instructor_id)
);

DESC quantumtutordb.courses;

CREATE TABLE instructors(
	instructor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  bio TEXT,
  contact_number VARCHAR(255),
  email VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  country VARCHAR(255)
);

CREATE TABLE payments(
	payment_id INT AUTO_INCREMENT,
  customer_id INT,
  amount DECIMAL(10,2),
  payment_date DATE,
  method VARCHAR(255),
  PRIMARY KEY(payment_id),
  FOREIGN KEY (customer_id) REFERENCES quantumtutordb.customer(customer_id)
);

DESC quantumtutordb.payments;

CREATE TABLE reviews(
	review_id INT AUTO_INCREMENT,
  course_id INT,
  customer_id INT,
  rating INT,
  commnet TEXT,
  review_date DATE,
  PRIMARY KEY(review_id),
  FOREIGN KEY (customer_id) REFERENCES quantumtutordb.customer(customer_id),
  FOREIGN KEY (course_id) REFERENCES quantumtutordb.courses(course_id)
);

DESC reviews;

CREATE TABLE enrollment(
	enrollment_id INT AUTO_INCREMENT,
  customer_id INT,
  course_id INT,
  enrollment_date DATE,
  PRIMARY KEY(enrollment_id),
  FOREIGN KEY (customer_id) REFERENCES quantumtutordb.customer(customer_id),
  FOREIGN KEY (course_id) REFERENCES quantumtutordb.courses(course_id)
);

DESC enrollment;

CREATE TABLE lessons(
	lesson_id INT AUTO_INCREMENT,
  course_id INT,
  name VARCHAR(255),
  description TEXT,
  content TEXT,
  duration INT,
  PRIMARY KEY(lesson_id),
  FOREIGN KEY (course_id) REFERENCES quantumtutordb.courses(course_id)
);

DESC lessons;

CREATE TABLE admins(
	admin_id INT AUTO_INCREMENT,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_number VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255),
  PRIMARY KEY(admin_id)
);

DESC admins;

/*
	CREATE TABLE table_name AS 
  SELECT *
  FROM table_name;
*/
-- Copy Table Structure With Data
USE quantumtutordb;
CREATE TABLE customer_with_data AS
SELECT *
FROM quantumtutordb.customer;

-- Copy Only Structure
CREATE TABLE customer_only_structure LIKE customer;

DESC quantumtutordb.customer_structure;

-- Copy Specific Row
CREATE TABLE customer_row AS
SELECT * FROM quantumtutordb.customer
WHERE customer_id = 1;

-- Copy Specific Column
CREATE TABLE customer_column AS
SELECT customer_id 
FROM quantumtutordb.customer;

-- Copy TABLE from another Database
CREATE TABLE customer_copy AS
SELECT * FROM quantum_tutors.customers;

/*
	ALTER TABLE
*/
-- ADDING COLUMN
DESC customer_copy;
ALTER TABLE customer_copy
ADD profile_picture VARCHAR(255);

-- ADDING COLUMN WITH CONSTRAIN
DESC customer_copy;
ALTER TABLE customer_copy
ADD profile_picture_updated VARCHAR(255) NOT NULL;

-- ADDING COLUMN WITH ORDER
DESC customer_copy;
ALTER TABLE customer_copy
ADD profile_picture_order VARCHAR(255) AFTER country;

ALTER TABLE customer_copy
ADD profile_picture_first VARCHAR(255) FIRST;

-- DROP Column 
USE quantumtutordb;
DESC quantumtutordb.customer_copy;

-- Multiple Column
ALTER TABLE quantumtutordb.customer_copy
DROP COLUMN profile_picture,
DROP COLUMN profile_picture_order;

/*
	Alter To Modify Columns
*/
DESCRIBE quantumtutordb.customer_copy;
SELECT * FROM customer_copy;

-- Modify Data Type and Size
ALTER TABLE customer_copy
MODIFY COLUMN contact_number VARCHAR(20);

-- Modify Constraint
ALTER TABLE customer_copy
MODIFY COLUMN contact_number VARCHAR(20) NOT NULL;

-- Modify Multiple Columns
ALTER TABLE customer_copy
MODIFY COLUMN first_name VARCHAR(100),
MODIFY COLUMN last_name VARCHAR(100);

/*
	DROP DATABASE database_name
  DROP TABLE table_name
*/
CREATE DATABASE test_database;
USE test_database;
DROP DATABASE IF EXISTS test_database;

CREATE TABLE customer_copy AS
SELECT * FROM quantum_tutors.customers;

DROP TABLE test_database.customer_copy;

/*
	Adding Course Duration In quantum_tutor
*/
USE quantum_tutors;
ALTER TABLE quantum_tutors.courses
ADD courseDuration INT;

DESC quantum_tutors.courses;

/*
	Removing SubCategory 
*/
ALTER TABLE quantum_tutors.courses
DROP COLUMN sub_category;

/*
	Managing Integrity:
		No Null in Instruction Id in Course TABLE.
*/
ALTER TABLE quantum_tutors.courses
MODIFY COLUMN instructor_id INT NOT NULL;

/*
	Course Categorization
*/
ALTER TABLE quantum_tutors.courses
MODIFY COLUMN category VARCHAR(500),
MODIFY COLUMN subtitle VARCHAR(500);