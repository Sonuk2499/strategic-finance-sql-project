-- ==========================================
-- Database Schema Definition
-- Description: Table structures for the E-Commerce Retail Database
-- ==========================================

-- 1. Users Table
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    gender VARCHAR(20),
    city VARCHAR(100),
    signup_date DATE
);

-- 2. Products Table
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10, 2),
    rating DECIMAL(3, 2)
);

-- 3. Orders Table
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) REFERENCES users(user_id),
    order_date TIMESTAMP,
    order_status VARCHAR(50),
    total_amount DECIMAL(10, 2)
);

-- 4. Order Items Table
CREATE TABLE order_items (
    order_item_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) REFERENCES orders(order_id),
    product_id VARCHAR(50) REFERENCES products(product_id),
    user_id VARCHAR(50) REFERENCES users(user_id),
    quantity INT,
    item_price DECIMAL(10, 2),
    item_total DECIMAL(10, 2)
);

-- 5. Reviews Table
CREATE TABLE reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) REFERENCES orders(order_id),
    product_id VARCHAR(50) REFERENCES products(product_id),
    user_id VARCHAR(50) REFERENCES users(user_id),
    rating INT,
    review_text TEXT,
    review_date TIMESTAMP
);

-- 6. Customer Events Table (Web/App Interactions)
CREATE TABLE events (
    event_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) REFERENCES users(user_id),
    product_id VARCHAR(50) REFERENCES products(product_id),
    event_type VARCHAR(50), -- view, cart, purchase, wishlist
    event_timestamp TIMESTAMP
);
