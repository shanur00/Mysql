DROP DATABASE IF EXISTS `quantum_tutors`;
CREATE DATABASE `quantum_tutors`; 
USE `quantum_tutors`;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    contact_number VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    registration_date DATE,
    PRIMARY KEY (customer_id)
);

CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    bio TEXT,
    contact_number VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    PRIMARY KEY (instructor_id)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT,
    title VARCHAR(255),
    subtitle VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2),
    instructor_id INT,
    category VARCHAR(255),
    sub_category VARCHAR(255),
    url VARCHAR(255),
    publish_date DATE,
    PRIMARY KEY (course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT,
    customer_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (enrollment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE lessons (
    lesson_id INT AUTO_INCREMENT,
    course_id INT,
    name VARCHAR(255),
    description TEXT,
    content TEXT,
    duration INT,
    PRIMARY KEY (lesson_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT,
    customer_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    method VARCHAR(255),
    PRIMARY KEY (payment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT,
    course_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    review_date DATE,
    PRIMARY KEY (review_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    contact_number VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    PRIMARY KEY (admin_id)
);



-- Insert sample data for Customers
INSERT INTO customers (first_name, last_name, contact_number, email, address, city, state, country, registration_date) VALUES 
('John', 'Doe', '+1234567890', 'john.doe@email.com', '123 Street Ave', 'New York', 'NY', 'USA', '2023-08-20'),
('Jane', 'Smith', '+0987654321', 'jane.smith@email.com', '456 Lane St', 'Los Angeles', 'CA', 'USA', '2023-07-15'),
('Alice', 'Johnson', '+1452369870', 'alice.johnson@email.com', '789 Hill St', 'San Francisco', 'CA', 'USA', '2023-06-10'),
('Bob', 'Wilson', '+1230984567', 'bob.wilson@email.com', '123 Ocean Ave', 'Miami', 'FL', 'USA', '2022-10-12'),
('Charlie', 'Davis', '+1345678902', 'charlie.davis@email.com', '456 Mountain Ln', 'Denver', 'CO', 'USA', '2023-05-15'),
('David', 'Garcia', '+1908765432', 'david.garcia@email.com', '789 Lake Rd', 'Orlando', 'FL', 'USA', '2023-02-18'),
('Ella', 'Martinez', '+1234567023', 'ella.martinez@email.com', '123 River St', 'Houston', 'TX', 'USA', '2022-09-10'),
('Frank', 'Robinson', '+0987651023', 'frank.robinson@email.com', '456 Forest Ln', 'Seattle', 'WA', 'USA', '2023-01-11'),
('Grace', 'Lee', '+1123456789', 'grace.lee@email.com', '789 Meadow Rd', 'Dallas', 'TX', 'USA', '2022-11-13'),
('Henry', 'Lewis', '+1234098567', 'henry.lewis@email.com', '123 Desert Ave', 'Phoenix', 'AZ', 'USA', '2022-12-14'),
('Ivy', 'Walker', '+1234509876', 'ivy.walker@email.com', '456 Island Ln', 'San Diego', 'CA', 'USA', '2023-03-16'),
('Jack', 'Hall', '+0987123456', 'jack.hall@email.com', '789 Coastal Rd', 'Portland', 'OR', 'USA', '2023-04-19');



-- Insert sample data for Instructors
INSERT INTO instructors (first_name, last_name, bio, contact_number, email, address, city, state, country) VALUES 
('Robert', 'Brown', 'Experienced teacher with 10 years in quantum physics.', '+1122334455', 'robert.brown@email.com', '789 Quantum Rd', 'Chicago', 'IL', 'USA'),
('Emily', 'Clark', 'Passionate educator with expertise in quantum mechanics.', '+5566778899', 'emily.clark@email.com', '101 Quantum Blvd', 'Boston', 'MA', 'USA'),
('Michael', 'Jones', 'Dedicated researcher in the field of quantum computing.', '+2211334455', 'michael.jones@email.com', '365 Quantum Ln', 'San Jose', 'CA', 'USA'),
('Sophia', 'Evans', 'Renowned professor with numerous publications in quantum theories.', '+7788991122', 'sophia.evans@email.com', '272 Quantum Ave', 'Atlanta', 'GA', 'USA'),
('William', 'Smith', 'Worked on pioneering projects in quantum cryptography.', '+9911223344', 'william.smith@email.com', '159 Quantum Pkwy', 'Austin', 'TX', 'USA'),
('Ava', 'Williams', 'Educator and speaker at various quantum physics seminars.', '+4455667788', 'ava.williams@email.com', '498 Quantum Blvd', 'San Francisco', 'CA', 'USA'),
('James', 'Davis', 'Leading expert in quantum teleportation experiments.', '+8899112233', 'james.davis@email.com', '622 Quantum St', 'Philadelphia', 'PA', 'USA'),
('Olivia', 'Miller', 'Award-winning teacher known for her innovative quantum labs.', '+6677889900', 'olivia.miller@email.com', '715 Quantum Rd', 'Nashville', 'TN', 'USA'),
('Benjamin', 'Taylor', 'Noted for his work in quantum entanglement.', '+7744556677', 'benjamin.taylor@email.com', '903 Quantum Ln', 'Indianapolis', 'IN', 'USA'),
('Ella', 'Johnson', 'Published multiple research papers on quantum field theory.', '+1122554488', 'ella.johnson@email.com', '132 Quantum Blvd', 'Las Vegas', 'NV', 'USA'),
('Lucas', 'Moore', 'Specializes in quantum harmonic oscillators.', '+3344556677', 'lucas.moore@email.com', '489 Quantum Pkwy', 'Columbus', 'OH', 'USA'),
('Lily', 'Martin', 'A passionate advocate for quantum education in schools.', '+8877445566', 'lily.martin@email.com', '927 Quantum Ave', 'Charlotte', 'NC', 'USA');



-- Insert sample data for Courses
INSERT INTO courses (title, subtitle, description, price, instructor_id, category, sub_category, url, publish_date) VALUES 
('Quantum Mechanics 101', 'Introduction to Quantum Mechanics', 'A beginner friendly introduction to quantum mechanics.', 100.50, 1, 'Physics', 'Quantum Mechanics', 'www.quantumtutors.com/qm101', '2023-01-01'),
('Advanced Quantum Mechanics', 'Deep Dive into Quantum Realm', 'An in-depth look at the intricacies of quantum mechanics.', 150.75, 2, 'Physics', 'Advanced Quantum', 'www.quantumtutors.com/advancedqm', '2023-02-01'),
('Quantum Cryptography', 'Securing Information with Quantum', 'Learn about the exciting world of quantum-secured communication.', 120.00, 1, 'Computer Science', 'Quantum Security', 'www.quantumtutors.com/qcryptography', '2023-03-01'),
('Quantum Computing Basics', 'Step into Quantum Computers', 'Understand the fundamental principles behind quantum computers.', 110.00, 2, 'Computer Science', 'Quantum Computing', 'www.quantumtutors.com/qcomputing', '2023-03-10'),
('Quantum Field Theory', 'Understanding Fields and Particles', 'A deep exploration into the fields that govern the quantum world.', 200.00, 3, 'Physics', 'Advanced Quantum', 'www.quantumtutors.com/qfieldtheory', '2023-04-01'),
('Quantum Entanglement', 'Spooky Action at a Distance', 'Dive into one of the most mysterious aspects of quantum physics.', 130.50, 4, 'Physics', 'Quantum Mechanics', 'www.quantumtutors.com/qentanglement', '2023-05-01'),
('Quantum Harmonic Oscillator', 'Vibrations in the Quantum World', 'Discover the significance of harmonic oscillations in quantum mechanics.', 115.25, 5, 'Physics', 'Quantum Mechanics', 'www.quantumtutors.com/qharmonic', '2023-06-01'),
('Introduction to Quantum Teleportation', 'Transferring Quantum Information', 'Get introduced to the revolutionary concept of quantum teleportation.', 140.00, 6, 'Physics', 'Advanced Quantum', 'www.quantumtutors.com/qteleportation', '2023-06-15'),
('Quantum Chemistry Basics', 'Atoms and Molecules in the Quantum Age', 'Grasp the principles of how quantum mechanics plays a role in chemistry.', 125.75, 7, 'Chemistry', 'Quantum Chemistry', 'www.quantumtutors.com/qchemistry', '2023-07-01'),
('Quantum Algorithms', 'Programming the Quantum Future', 'Learn about algorithms that make quantum computers so powerful.', 145.25, 8, 'Computer Science', 'Quantum Computing', 'www.quantumtutors.com/qalgorithms', '2023-08-01'),
('Quantum Biology', 'Nature’s Quantum Wonders', 'Explore how quantum mechanics plays a role in biological processes.', 135.00, 9, 'Biology', 'Quantum Biology', 'www.quantumtutors.com/qbiology', '2023-09-01'),
('Quantum Optics', 'Light in the Quantum World', 'Understand the behavior of light at the quantum level.', 130.00, 10, 'Physics', 'Quantum Mechanics', 'www.quantumtutors.com/qoptics', '2023-10-01'),
('Quantum Machine Learning', 'Fusion of Quantum and AI', 'Discover how quantum principles can be integrated into machine learning algorithms.', 155.50, 2, 'Computer Science', 'Quantum Computing', 'www.quantumtutors.com/qmachinelearning', '2023-11-01'),
('Relativistic Quantum Mechanics', 'When Speed Matters', 'Understand quantum mechanics when relativistic speeds are involved.', 170.25, 3, 'Physics', 'Advanced Quantum', 'www.quantumtutors.com/relativisticqm', '2023-12-01'),
('Quantum Logic and Foundations', 'Logic of the Quantum World', 'Explore the non-classical logic that governs quantum mechanics.', 120.75, 4, 'Mathematics', 'Quantum Logic', 'www.quantumtutors.com/qlogic', '2024-01-01'),
('Quantum Thermodynamics', 'Heat in the Quantum Age', 'Delve into the study of thermodynamic principles at the quantum scale.', 140.00, 5, 'Physics', 'Quantum Mechanics', 'www.quantumtutors.com/qthermo', '2024-02-01'),
('Quantum Neural Networks', 'Neural Networks on Quantum Computers', 'Learn how neural networks function on quantum computers.', 160.00, 6, 'Computer Science', 'Quantum Computing', 'www.quantumtutors.com/qneuralnetworks', '2024-03-01'),
('Quantum Materials and Condensed Matter', 'New Age Materials', 'Study materials with distinct quantum mechanical properties.', 165.00, 7, 'Physics', 'Advanced Quantum', 'www.quantumtutors.com/qmaterials', '2024-04-01'),
('Quantum Topology', 'Shapes and Forms in Quantum Mechanics', 'Discover the role of topology in quantum systems.', 155.00, 8, 'Mathematics', 'Quantum Topology', 'www.quantumtutors.com/qtopology', '2024-05-01'),
('Quantum Metrology', 'Precision Measurements in Quantum', 'Learn about advanced techniques for precision measurements using quantum principles.', 150.50, 9, 'Physics', 'Quantum Mechanics', 'www.quantumtutors.com/qmetrology', '2024-06-01'),
('Quantum Cognition', 'Quantum Approaches to Understanding Mind', 'Explore the intriguing intersection of quantum mechanics and cognitive science.', 145.75, 10, 'Biology', 'Quantum Cognition', 'www.quantumtutors.com/qcognition', '2024-07-01'),
('Quantum Geometry', 'Geometry in the Quantum World', 'Dive deep into the geometric structures pertinent to quantum mechanics.', 150.00, 1, 'Mathematics', 'Quantum Geometry', 'www.quantumtutors.com/qgeometry', '2024-08-01');





-- Insert sample data for Enrollments
INSERT INTO enrollments (customer_id, course_id, enrollment_date) VALUES 
(1, 1, '2023-08-20'),
(2, 2, '2023-07-15'),
(3, 3, '2023-08-05'),
(4, 4, '2023-07-18'),
(5, 5, '2023-08-11'),
(6, 6, '2023-08-22'),
(7, 7, '2023-06-10'),
(8, 8, '2023-07-10'),
(9, 9, '2023-09-01'),
(10, 10, '2023-09-03'),
(1, 3, '2023-08-10'),
(2, 4, '2023-07-12'),
(3, 1, '2023-08-01'),
(4, 6, '2023-08-19'),
(5, 2, '2023-08-15'),
(6, 8, '2023-07-11'),
(7, 5, '2023-08-21'),
(8, 7, '2023-06-15'),
(9, 10, '2023-09-02'),
(10, 9, '2023-08-31');



-- Insert sample data for Lessons
INSERT INTO lessons (course_id, name, description, content, duration) VALUES 
(1, 'Wave-particle Duality', 'Delving into the dual nature of particles.', 'Content for this lesson here...', 2),
(1, 'Quantum States and Observables', 'The basis of quantum measurement.', 'Content for this lesson here...', 3),
(2, 'Advanced Quantum Phenomena', 'A look at deeper quantum effects.', 'Content for this lesson here...', 2),
(2, 'Quantum Tunnelling', 'Understanding barrier penetration.', 'Content for this lesson here...', 2),
(3, 'Introduction to Quantum Cryptography', 'Basics of quantum-secured communication.', 'Content for this lesson here...', 2),
(3, 'Quantum Keys and Distribution', 'Study of quantum key methodologies.', 'Content for this lesson here...', 2),
(4, 'Qubit Basics', 'Introduction to quantum bits.', 'Content for this lesson here...', 1),
(4, 'Quantum Gates and Operations', 'Manipulating qubits with quantum logic gates.', 'Content for this lesson here...', 3),
(5, 'Fields in Quantum Physics', 'Study of quantum fields.', 'Content for this lesson here...', 3),
(5, 'Particle Interactions', 'How particles interact in the quantum realm.', 'Content for this lesson here...', 3),
(6, 'Understanding Entanglement', 'Deep dive into quantum entanglement.', 'Content for this lesson here...', 3),
(6, 'EPR Paradox', 'Exploring the Einstein-Podolsky-Rosen paradox.', 'Content for this lesson here...', 2),
(7, 'Basics of Quantum Oscillations', 'Study of harmonic motion in quantum.', 'Content for this lesson here...', 2),
(7, 'Applications of Quantum Harmonic Oscillator', 'Using quantum oscillators in real-world scenarios.', 'Content for this lesson here...', 2),
(8, 'Quantum Teleportation Fundamentals', 'Introduction to quantum information transfer.', 'Content for this lesson here...', 3),
(8, 'The Science Behind Quantum Teleportation', 'A deep dive into the science of teleportation.', 'Content for this lesson here...', 2),
(9, 'Atoms in Quantum Chemistry', 'The role of atoms in quantum reactions.', 'Content for this lesson here...', 3),
(9, 'Quantum Molecular Structures', 'Understanding molecular formations using quantum principles.', 'Content for this lesson here...', 3),
(10, 'Programming Quantum Algorithms', 'Introduction to quantum programming.', 'Content for this lesson here...', 3),
(10, 'Examples of Quantum Algorithms', 'Exploring popular quantum algorithms.', 'Content for this lesson here...', 2);



-- Insert sample data for Payments
INSERT INTO payments (customer_id, amount, payment_date, method) VALUES 
(1, 100.50, '2023-08-20', 'Credit Card'),
(2, 150.75, '2023-07-15', 'PayPal'),
(3, 120.00, '2023-08-18', 'Debit Card'),
(4, 110.00, '2023-07-10', 'Bank Transfer'),
(5, 200.00, '2023-06-24', 'Credit Card'),
(6, 130.50, '2023-08-19', 'PayPal'),
(7, 115.25, '2023-07-12', 'PayPal'),
(8, 140.00, '2023-08-14', 'Credit Card'),
(9, 125.75, '2023-06-10', 'Debit Card'),
(10, 145.25, '2023-05-25', 'Credit Card');


-- Insert sample data for Reviews
INSERT INTO reviews (course_id, customer_id, rating, comment, review_date) VALUES 
(1, 1, 5, 'Amazing course!', '2023-08-21'),
(2, 2, 4, 'Very insightful but needs more examples.', '2023-07-16'),
(3, 3, 5, 'An excellent introduction to Quantum Cryptography!', '2023-08-19'),
(4, 4, 3, 'Good, but some parts were hard to follow.', '2023-07-11'),
(5, 5, 5, 'Quantum Field Theory has never been this interesting!', '2023-06-26'),
(6, 6, 4, 'Solid course on Quantum Entanglement.', '2023-08-21'),
(7, 7, 3, 'The instructor was great, but content can be more in-depth.', '2023-07-13'),
(8, 8, 5, 'Best course on Quantum Teleportation!', '2023-08-16'),
(9, 9, 4, 'Loved the examples provided!', '2023-06-12'),
(10, 10, 2, 'Too complex for beginners. Needs a prerequisite.', '2023-05-27'),
(11, 1, 5, 'Quantum Machine Learning made easy!', '2023-08-11'),
(12, 2, 4, 'Interesting concepts on Relativistic Quantum Mechanics.', '2023-07-07');


-- Insert sample data for Admins
INSERT INTO admins (first_name, last_name, contact_number, email, password) VALUES 
('Admin', 'One', '+1111222233', 'admin1@email.com', 'password123'),
('Admin', 'Two', '+4444555566', 'admin2@email.com', 'password456');