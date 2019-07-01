Create DATABASE Library

CREATE TABLE authors
(
    id INT NOT NULL,
    name VARCHAR(60),
    birth_date DATE,
    nationality VARCHAR(30),
    email VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE publisher
(
    id INT NOT NULL,
    name VARCHAR(40),
    email VARCHAR(30),
    address VARCHAR(60),
    PRIMARY KEY (id)
);

CREATE TABLE branch
(
    id INT NOT NULL,
    address VARCHAR(30),
    opening_date DATE,
    shutdown_date DATE,
    PRIMARY KEY (id)
);

CREATE TABLE category
(
    id INT NOT NULL,
    name VARCHAR(20),
    parent_category_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE franchise
(
    id INT NOT NULL,
    name VARCHAR(30),
    description VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE folders
(
    id INT NOT NULL,
    name VARCHAR(20),
    folder_number NUMERIC(6),
    PRIMARY KEY (id)
);

CREATE TABLE accessories
(
    id INT NOT NULL,
    name VARCHAR(30),
    franchise_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (franchise_id) REFERENCES franchise(id)
);

CREATE TABLE accessories_branch
(
    id INT NOT NULL,
    price NUMERIC(10),
    count NUMERIC(10),
    accessory_id INT,
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (accessory_id) REFERENCES accessories(id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE customer
(
    id INT NOT NULL,
    name VARCHAR(30),
    email VARCHAR(30),
    phone_number NUMERIC(10),
    age INT,
    gender INT,
    nationality VARCHAR(20),
    education VARCHAR(20),
    occupation VARCHAR(20),
    address VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE damage_levels
(
    id INT NOT NULL,
    name VARCHAR(20),
    description VARCHAR(100),
    fee NUMERIC(10,5),
    PRIMARY KEY
    (id)
);

CREATE TABLE halls
(
    id INT NOT NULL,
    name VARCHAR(20),
    available_from DATE,
    available_to DATE,
    branch_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE suppliers
(
    id INT NOT NULL,
    name VARCHAR(20),
    email VARCHAR(20),
    address VARCHAR(30),
    merchandise_type VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE employees
(
    id INT NOT NULL,
    name VARCHAR(30),
    birthdate DATE,
    nationality VARCHAR(30),
    email VARCHAR(30),
    phone_number VARCHAR(20),
    salary NUMERIC(10),
    employment_date DATE,
    end_date DATE,
    branch_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE vacations
(
    id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    paid BIT,
    employee_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE holidays
(
    id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    name VARCHAR(20),
    description VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE subscribers
(
    id INT NOT NULL,
    subscription_start DATE,
    subscription_end DATE,
    customer_id INT,
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE book_borrows
(
    id INT,
    date DATE,
    subscriber_id INT,
    branch_id INT,
    damage_id INT,
    hall_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (subscriber_id) REFERENCES subscribers(id),
    FOREIGN KEY (branch_id) REFERENCES branch(id),
    FOREIGN KEY (damage_id) REFERENCES damage_levels(id),
    FOREIGN KEY (hall_id) REFERENCES halls(id)
);

CREATE TABLE clubs
(
    id INT NOT NULL,
    name VARCHAR(20),
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE club_subscribers
(
    id INT NOT NULL,
    subscriber_id INT NOT NULL,
    club_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (subscriber_id) REFERENCES subscribers(id),
    FOREIGN KEY (club_id) REFERENCES clubs(id)
);

CREATE TABLE sessions
(
    id INT NOT NULL,
    start_date DATE,
    end_date INT,
    club_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (club_id) REFERENCES clubs(id)
);

CREATE TABLE subscriber_sessions
(
    id INT NOT NULL,
    subscriber_id INT NOT NULL,
    session_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (subscriber_id) REFERENCES subscribers(id),
    FOREIGN KEY (session_id) REFERENCES sessions(id)
);

CREATE TABLE requested_books
(
    id INT NOT NULL,
    number_of_requests NUMERIC(10),
    first_request_date DATE,
    last_request_date DATE,
    book_name VARCHAR(30),
    processed INT,
    customer_id INT,
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE requested_accessories
(
    id INT NOT NULL,
    number_of_requests NUMERIC(10),
    first_request_date DATE,
    last_request_date DATE,
    accessory_name VARCHAR(30),
    processed INT,
    customer_id INT,
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE branch_maintenance
(
    id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    reason_description CHAR(100),
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE complaint_categories
(
    id INT NOT NULL,
    name VARCHAR(30),
    description VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE managers
(
    id INT NOT NULL,
    employee_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE books
(
    isbn INT NOT NULL,
    name VARCHAR(60),
    language VARCHAR(30),
    type VARCHAR(20),
    author_id INT,
    publisher_id INT,
    franchise_id INT,
    folder_id INT,
    PRIMARY KEY (isbn),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    FOREIGN KEY (franchise_id) REFERENCES franchise(id),
    FOREIGN KEY (folder_id) REFERENCES folders(id)
);

CREATE TABLE book_branch
(
    id INT NOT NULL,
    price NUMERIC(6),
    count INT,
    branch_id INT,
    book_isbn INT,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id),
    FOREIGN KEY (book_isbn) REFERENCES books(isbn)
);

CREATE TABLE book_category
(
    id INT NOT NULL,
    book_isbn INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (book_isbn) REFERENCES books(isbn),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE books_supplier
(
    id INT NOT NULL,
    count NUMERIC(10),
    fee NUMERIC(10),
    book_branch_id INT,
    supplier_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (book_branch_id) REFERENCES book_branch(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE accessory_supplier
(
    id INT NOT NULL,
    count NUMERIC(10),
    price NUMERIC(10),
    accessory_branch_id INT,
    supplier_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (accessory_branch_id) REFERENCES accessories_branch(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE book_rental
(
    id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    return_date DATE,
    base_fee NUMERIC(10,5),
    total_fee NUMERIC(10,5),
    subscriber_id INT,
    book_isbn INT,
    branch_id INT,
    damage_levels_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(subscriber_id) REFERENCES subscribers(id),
    FOREIGN KEY(book_isbn) REFERENCES books(isbn),
    FOREIGN KEY(branch_id) REFERENCES branch(id),
    FOREIGN KEY(damage_levels_id) REFERENCES damage_levels(id)
);

-- CREATE TABLE rental_types
-- (
--     id INT NOT NULL,
--     type VARCHAR(20),
--     book_rental_id INT NOT NULL,
--     PRIMARY KEY (id),
--     FOREIGN KEY (book_rental_id) REFERENCES book_rental(id)
-- );

CREATE TABLE bills
(
    id INT NOT NULL,
    date DATE,
    total_payment NUMERIC(10,5),
    payment_method VARCHAR(20),
    customer_id INT,
    employee_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customer(id),
    FOREIGN KEY(employee_id) REFERENCES employees(id)
);

CREATE TABLE accessory_sales
(
    id INT NOT NULL,
    count NUMERIC(10),
    accessoryid INT,
    bill_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (accessoryid) REFERENCES accessories(id),
    FOREIGN KEY (bill_id) REFERENCES bills(id)
);

CREATE TABLE book_sessions
(
    id INT NOT NULL,
    book_isbn INT,
    session_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (book_isbn) REFERENCES books(isbn),
    FOREIGN KEY (session_id) REFERENCES sessions(id)
);

CREATE TABLE complaints
(
    id INT NOT NULL,
    date DATE,
    complaint_category_id INT,
    customer_id INT,
    branch_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (complaint_category_id) REFERENCES complaint_categories(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE book_sales
(
    id INT NOT NULL,
    count NUMERIC(10),
    book_isbn INT,
    bill_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (book_isbn) REFERENCES books(isbn),
    FOREIGN KEY (bill_id) REFERENCES bills(id)
);