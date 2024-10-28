```sql
-- Insert demo data into categories table
INSERT INTO categories (categoryName, categoryImg, created_at, updated_at) VALUES
('Electronics', 'electronics.jpg', NOW(), NOW()),
('Furniture', 'furniture.jpg', NOW(), NOW()),
('Clothing', 'clothing.jpg', NOW(), NOW()),
('Books', 'books.jpg', NOW(), NOW()),
('Sports', 'sports.jpg', NOW(), NOW());

-- Insert demo data into brands table
INSERT INTO brands (brandName, brandImg, created_at, updated_at) VALUES
('Brand A', 'brand_a.jpg', NOW(), NOW()),
('Brand B', 'brand_b.jpg', NOW(), NOW()),
('Brand C', 'brand_c.jpg', NOW(), NOW()),
('Brand D', 'brand_d.jpg', NOW(), NOW()),
('Brand E', 'brand_e.jpg', NOW(), NOW());

-- Insert demo data into products table
INSERT INTO products (title, short_des, price, discount, discount_price, image, stock, star, remark, category_id, brand_id, created_at, updated_at) VALUES
('Product 1', 'Short description of product 1', '1000', 1, '900', 'image1.jpg', 1, 4.5, 'popular', 1, 1, NOW(), NOW()),
('Product 2', 'Short description of product 2', '1200', 0, '1200', 'image2.jpg', 1, 4.0, 'new', 2, 1, NOW(), NOW()),
('Product 3', 'Short description of product 3', '800', 1, '700', 'image3.jpg', 0, 3.5, 'top', 1, 2, NOW(), NOW()),
('Product 4', 'Short description of product 4', '1500', 1, '1400', 'image4.jpg', 1, 5.0, 'special', 3, 2, NOW(), NOW()),
('Product 5', 'Short description of product 5', '950', 0, '950', 'image5.jpg', 1, 4.8, 'trending', 2, 3, NOW(), NOW()),
('Product 6', 'Short description of product 6', '1100', 1, '1000', 'image6.jpg', 1, 4.1, 'regular', 3, 3, NOW(), NOW()),
('Product 7', 'Short description of product 7', '700', 1, '600', 'image7.jpg', 0, 3.9, 'popular', 1, 1, NOW(), NOW()),
('Product 8', 'Short description of product 8', '1300', 0, '1300', 'image8.jpg', 1, 4.7, 'new', 2, 2, NOW(), NOW()),
('Product 9', 'Short description of product 9', '750', 1, '650', 'image9.jpg', 1, 4.3, 'top', 3, 3, NOW(), NOW()),
('Product 10', 'Short description of product 10', '1400', 1, '1300', 'image10.jpg', 1, 5.0, 'special', 1, 1, NOW(), NOW());
```
