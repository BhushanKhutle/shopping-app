CREATE DATABASE IF NOT EXISTS shopdb;
USE shopdb;

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  category VARCHAR(100),
  image_url VARCHAR(500)
);

INSERT INTO products (name, price, category, image_url) VALUES
('T-Shirt', 10.99, 'Apparel', 'https://cdn-icons-png.flaticon.com/512/892/892458.png'),
('Shoes', 35.00, 'Footwear', 'https://cdn-icons-png.flaticon.com/512/1047/1047711.png'),
('Hat', 5.99, 'Accessories', 'https://cdn-icons-png.flaticon.com/512/892/892530.png'),
('Watch', 50.00, 'Accessories', 'https://cdn-icons-png.flaticon.com/512/597/597177.png'),
('Jacket', 65.00, 'Apparel', 'https://cdn-icons-png.flaticon.com/512/892/892498.png'),
('Cap', 7.49, 'Apparel', 'https://cdn-icons-png.flaticon.com/512/892/892553.png'),
('Sneakers', 45.00, 'Footwear', 'https://cdn-icons-png.flaticon.com/512/4645/4645943.png'),
('Sunglasses', 19.99, 'Accessories', 'https://cdn-icons-png.flaticon.com/512/3062/3062634.png');

