-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2024 at 03:37 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `My_Little_Shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `country`, `state`, `city`, `address`, `zip`) VALUES
(1, 1, 'USA', 'Florida', 'Miami', '1000 Ocean Dr', '33139'),
(2, 2, 'Canada', 'British Columbia', 'Vancouver', '200 West St', 'V6B 1H7'),
(3, 3, 'USA', 'New York', 'New York City', '300 Broadway', '10007'),
(4, 4, 'UK', 'Scotland', 'Edinburgh', '400 Royal Mile', 'EH1 1RH'),
(5, 5, 'Australia', 'Victoria', 'Melbourne', '500 Flinders St', '3000'),
(6, 6, 'France', 'Île-de-France', 'Paris', '600 Rue de Rivoli', '75001'),
(7, 7, 'Germany', 'Bavaria', 'Munich', '700 Marienplatz', '80331'),
(8, 8, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', '800 Copacabana Blvd', '22050-002'),
(9, 9, 'Japan', 'Tokyo', 'Tokyo', '900 Shibuya St', '150-0002'),
(10, 10, 'Italy', 'Lazio', 'Rome', '1000 Via del Corso', '00186');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Home Appliances'),
(2, 'Beauty'),
(3, 'Sports'),
(4, 'Music Instruments'),
(5, 'Gaming'),
(6, 'Groceries'),
(7, 'Movies'),
(8, 'Travel Gear'),
(9, 'Health'),
(10, 'Pet Supplies');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_method_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `timestamp`, `payment_method_id`) VALUES
(1, 1, '2024-11-13 12:30:00', 1),
(2, 2, '2024-11-13 12:35:00', 2),
(3, 3, '2024-11-13 12:40:00', 3),
(4, 4, '2024-11-13 12:45:00', 4),
(5, 5, '2024-11-13 12:50:00', 5),
(6, 6, '2024-11-13 12:55:00', 1),
(7, 7, '2024-11-13 13:00:00', 2),
(8, 8, '2024-11-13 13:05:00', 3),
(9, 9, '2024-11-13 13:10:00', 4),
(10, 10, '2024-11-13 13:15:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`) VALUES
(1, 'Apple Pay'),
(2, 'Google Pay'),
(3, 'Cryptocurrency'),
(4, 'Cash on Delivery'),
(5, 'Wire Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `category_id`) VALUES
(1, 'Blender', 'High-speed blender', 129.99, 15, 1),
(2, 'Face Cream', 'Anti-aging cream', 24.99, 100, 2),
(3, 'Soccer Ball', 'Professional soccer ball', 19.99, 50, 3),
(4, 'Guitar', 'Acoustic guitar', 199.99, 20, 4),
(5, 'Gaming Console', 'Latest model gaming console', 499.99, 10, 5),
(6, 'Organic Milk', 'Gallon of organic milk', 5.99, 200, 6),
(7, 'DVD Box Set', 'Collector’s edition DVD set', 39.99, 40, 7),
(8, 'Backpack', 'Travel backpack', 59.99, 75, 8),
(9, 'Vitamin C Supplement', 'Vitamin C tablets', 12.99, 100, 9),
(10, 'Cat Food', 'Premium cat food', 29.99, 60, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `order_id`, `product_id`, `count`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 3),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 2),
(10, 10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `password`, `email`) VALUES
(1, 'Alice', 'Green', 'pass123', 'alice.green@example.com'),
(2, 'Brian', 'Adams', 'pass456', 'brian.adams@example.com'),
(3, 'Carol', 'Baker', 'pass789', 'carol.baker@example.com'),
(4, 'David', 'Clark', 'pass101', 'david.clark@example.com'),
(5, 'Eve', 'Miller', 'pass102', 'eve.miller@example.com'),
(6, 'Frank', 'Wright', 'pass103', 'frank.wright@example.com'),
(7, 'Grace', 'Hill', 'pass104', 'grace.hill@example.com'),
(8, 'Hank', 'Scott', 'pass105', 'hank.scott@example.com'),
(9, 'Ivy', 'Young', 'pass106', 'ivy.young@example.com'),
(10, 'Jack', 'Lewis', 'pass107', 'jack.lewis@example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
