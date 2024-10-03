-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_region VARCHAR(50)
);

-- Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Items Table
CREATE TABLE IF NOT EXISTS Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_item DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Sample Data into Customers
INSERT INTO Customers (customer_id, customer_name, customer_email, customer_region)
VALUES 
    (1, 'Alice', 'alice@example.com', 'North America'),
    (2, 'Bob', 'bob@example.com', 'Europe'),
    (3, 'Charlie', 'charlie@example.com', 'Asia')
ON CONFLICT (customer_id) DO NOTHING;

-- Insert Sample Data into Products
INSERT INTO Products (product_id, product_name, category, price)
VALUES 
    (1, 'Laptop', 'Electronics', 1200.00),
    (2, 'Headphones', 'Accessories', 200.00),
    (3, 'Phone', 'Electronics', 800.00)
ON CONFLICT (product_id) DO NOTHING;

-- Insert Sample Data into Orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES 
    (1, 1, '2024-01-15', 1400.00),
    (2, 2, '2024-02-10', 200.00),
    (3, 3, '2024-03-05', 800.00)
ON CONFLICT (order_id) DO NOTHING;

-- Insert Sample Data into Order_Items
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price_per_item, total_price)
VALUES 
    (1, 1, 1, 1, 1200.00, 1200.00),
    (2, 1, 2, 1, 200.00, 200.00),
    (3, 2, 2, 1, 200.00, 200.00),
    (4, 3, 3, 1, 800.00, 800.00)
ON CONFLICT (order_item_id) DO NOTHING;
