-- =========================================
--  Database: trending_dashboard
--  Purpose:  Initialize tables for trending product dashboard
--  Author:   Yoga Jason
-- =========================================

-- 建立資料庫（如果尚未存在）
CREATE DATABASE trending_dashboard;

-- -- 連線到資料庫
-- \c trending_dashboard;

-- =======================
--  1. 建立資料表
-- =======================
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sales INT DEFAULT 0,
    growth INT DEFAULT 0,
    stock VARCHAR(10) DEFAULT 'normal',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- -- =======================
-- --  2. 建立索引（查詢速度）
-- -- =======================
-- CREATE INDEX idx_products_sales ON products(sales DESC);
-- CREATE INDEX idx_products_category ON products(category);

-- =======================
--  3. 插入範例資料
-- =======================
INSERT INTO products (name, category, sales, growth, stock) VALUES
('Oversized Jacket', 'Men', 512, 32, 'normal'),
('Retro Sneakers', 'Unisex', 430, 18, 'low'),
('Leather Bag', 'Women', 398, -5, 'normal'),
('Sport Hoodie', 'Men', 362, 20, 'out'),
('Classic T-Shirt', 'Men', 305, 8, 'normal'),
('High Heels', 'Women', 295, 12, 'low'),
('Casual Shorts', 'Unisex', 280, 5, 'normal'),
('Canvas Tote', 'Women', 270, 15, 'normal'),
('Running Shoes', 'Men', 255, -10, 'out'),
('Summer Dress', 'Women', 250, 25, 'low');