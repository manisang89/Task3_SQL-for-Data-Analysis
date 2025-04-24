

-- Create customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    signup_date DATE
);

-- Create products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    price NUMERIC
);

-- Create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);

-- Create order_items table
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

-- Insert sample customers
INSERT INTO customers (name, email, signup_date) VALUES
('Alice Smith', 'alice@example.com', '2024-01-15'),
('Bob Jones', 'bob@example.com', '2023-11-10'),
('Charlie Lee', 'charlie@example.com', '2025-02-20'),
('Diana Ross', 'diana@example.com', '2024-07-04'),
('Evan Hall', 'evan@example.com', '2025-03-12');

-- Insert sample products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 1200),
('Smartphone', 'Electronics', 800),
('Desk Chair', 'Furniture', 150),
('Water Bottle', 'Accessories', 25),
('Headphones', 'Electronics', 200),
('Notebook', 'Stationery', 5),
('Pen Set', 'Stationery', 10);

-- Insert sample orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-03-01'),
(1, '2025-03-21'),
(2, '2025-03-15'),
(3, '2025-04-10'),
(5, '2025-04-20');

-- Insert sample order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  
(1, 4, 2),  
(2, 2, 1), 
(3, 3, 2), 
(4, 5, 1),  
(4, 6, 4),  
(5, 2, 1),  
(5, 7, 3);  
