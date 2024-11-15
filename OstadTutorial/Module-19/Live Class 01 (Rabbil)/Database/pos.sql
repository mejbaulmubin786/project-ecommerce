-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2024 at 06:44 PM
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
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(21, 'Italian Cuisine', 2, '2023-07-23 14:01:47', '2023-07-23 14:01:47'),
(22, 'Mexican Food', 2, '2023-07-23 14:01:47', '2023-07-23 14:01:47'),
(23, 'Indian Dishes', 2, '2023-07-23 14:01:47', '2023-07-23 14:01:47'),
(24, 'Chinese Cuisine', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(25, 'Japanese Sushi', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(26, 'American BBQ', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(27, 'Mediterranean Food', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(28, 'Thai Delicacies', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(29, 'Greek Cuisine', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(30, 'Korean BBQ', 2, '2023-07-23 14:01:48', '2023-07-23 14:01:48'),
(31, 'Cakes', 1, '2023-07-23 14:03:34', '2023-08-16 00:19:01'),
(32, 'Cookies', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(33, 'Pastries', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(34, 'Category_Chocolates', 1, '2023-07-23 14:03:34', '2024-10-20 16:09:19'),
(35, 'Ice Creams', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(36, 'Gulab Jamun', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(37, 'Rasgulla', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(38, 'Barfi', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(39, 'Jalebi', 1, '2023-07-23 14:03:34', '2023-07-23 14:03:34'),
(44, 'abc', 2, '2023-07-25 23:28:55', '2024-10-19 07:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(2, 'Jane Smith', 'jane.smith@example.com', '9876543210', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(3, 'Michael Johnson', 'michael.j@example.com', '5551112222', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(4, 'Emily Brown', 'emily.brown@example.com', '4443332222', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(5, 'Robert Lee', 'robert.lee@example.com', '9871234560', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(6, 'Sophia Wilson', 'sophia.w@example.com', '1112223334', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(7, 'William Turner', 'william.t@example.com', '9998887770', 1, '2023-07-23 13:54:43', '2023-08-15 16:30:07'),
(8, 'Olivia Martin', 'olivia.m@example.com', '6665554441', 1, '2023-07-23 13:54:43', '2023-07-23 13:54:43'),
(9, 'James Anderson', 'james@example.com', '5554443332', 1, '2023-07-23 13:54:43', '2023-08-15 16:29:23'),
(11, 'Rahul Sharma', 'rahul.sharma@example.com', '+91 9876543210', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(12, 'Priya Patel', 'priya.patel@example.com', '+91 8765432109', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(13, 'Amit Singh', 'amit.singh@example.com', '+91 7654321098', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(14, 'Neha Gupta', 'neha.gupta@example.com', '+91 6543210987', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(15, 'Rajesh Kumar', 'rajesh.kumar@example.com', '+91 5432109876', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(16, 'Anjali Desai', 'anjali.desai@example.com', '+91 4321098765', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(17, 'Vikram Joshi', 'vikram.joshi@example.com', '+91 3210987654', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(18, 'Pooja Verma', 'pooja.verma@example.com', '+91 2109876543', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(19, 'Aryan Srinivasan', 'aryan.srinivasan@example.com', '+91 1098765432', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(20, 'Sneha Reddy', 'sneha.reddy@example.com', '+91 9876543210', 2, '2023-07-23 13:55:37', '2023-07-23 13:55:37'),
(23, 'Sumiaya Khanom', 'Sumiay@gmail.com', '01785388919', 1, '2023-08-15 17:11:21', '2023-08-15 17:11:21'),
(24, 'Salif Al Hasan', 'Salif@gmail.com', '01701063280', 1, '2023-08-15 17:11:41', '2023-08-15 17:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `vat` varchar(50) NOT NULL,
  `payable` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `total`, `discount`, `vat`, `payable`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '1620', '0', '81.00', '1701.00', 1, 7, '2023-08-15 17:17:45', '2023-08-15 17:17:45'),
(2, '2013.90', '41.1', '100.69', '2114.59', 1, 6, '2023-08-15 17:18:25', '2023-08-15 17:18:25'),
(3, '4866.52', '163.475', '243.33', '5109.85', 1, 8, '2023-08-15 17:19:02', '2023-08-15 17:19:02'),
(4, '1994.30', '40.7', '99.72', '2094.02', 1, 1, '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(5, '5708.50', '116.5', '285.43', '5993.93', 1, 4, '2023-08-15 17:20:50', '2023-08-15 17:20:50'),
(6, '1750.50', '49.50', '87.53', '1838.03', 1, 6, '2023-08-15 17:45:44', '2023-08-15 17:45:44'),
(7, '2856.65', '88.35', '142.83', '2999.48', 1, 7, '2023-08-15 22:20:26', '2023-08-15 22:20:26'),
(8, '1516.90', '23.10', '75.84', '1592.74', 1, 7, '2023-08-16 00:21:16', '2023-08-16 00:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(50) NOT NULL,
  `sale_price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `user_id`, `qty`, `sale_price`, `created_at`, `updated_at`) VALUES
(1, 1, 16, 1, '1', '200.00', '2023-08-15 17:17:45', '2023-08-15 17:17:45'),
(2, 1, 18, 1, '2', '640.00', '2023-08-15 17:17:45', '2023-08-15 17:17:45'),
(3, 1, 21, 1, '3', '375.00', '2023-08-15 17:17:45', '2023-08-15 17:17:45'),
(4, 1, 20, 1, '1', '405.00', '2023-08-15 17:17:45', '2023-08-15 17:17:45'),
(5, 2, 16, 1, '2', '400.00', '2023-08-15 17:18:25', '2023-08-15 17:18:25'),
(6, 2, 20, 1, '1', '405.00', '2023-08-15 17:18:25', '2023-08-15 17:18:25'),
(7, 2, 23, 1, '1', '350.00', '2023-08-15 17:18:25', '2023-08-15 17:18:25'),
(8, 2, 24, 1, '1', '580.00', '2023-08-15 17:18:25', '2023-08-15 17:18:25'),
(9, 2, 18, 1, '1', '320.00', '2023-08-15 17:18:25', '2023-08-15 17:18:25'),
(10, 3, 16, 1, '1', '200.00', '2023-08-15 17:19:02', '2023-08-15 17:19:02'),
(11, 3, 17, 1, '2', '320.00', '2023-08-15 17:19:02', '2023-08-15 17:19:02'),
(12, 3, 19, 1, '1', '110.00', '2023-08-15 17:19:02', '2023-08-15 17:19:02'),
(13, 3, 25, 1, '11', '4400.00', '2023-08-15 17:19:02', '2023-08-15 17:19:02'),
(14, 4, 16, 1, '1', '200.00', '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(15, 4, 18, 1, '1', '320.00', '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(16, 4, 19, 1, '1', '110.00', '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(17, 4, 17, 1, '1', '160.00', '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(18, 4, 20, 1, '1', '405.00', '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(19, 4, 22, 1, '2', '840.00', '2023-08-15 17:19:58', '2023-08-15 17:19:58'),
(20, 5, 16, 1, '2', '400.00', '2023-08-15 17:20:50', '2023-08-15 17:20:50'),
(21, 5, 17, 1, '1', '160.00', '2023-08-15 17:20:50', '2023-08-15 17:20:50'),
(22, 5, 20, 1, '13', '5265.00', '2023-08-15 17:20:50', '2023-08-15 17:20:50'),
(23, 6, 16, 1, '9', '1800.00', '2023-08-15 17:45:44', '2023-08-15 17:45:44'),
(24, 7, 16, 1, '1', '200.00', '2023-08-15 22:20:26', '2023-08-15 22:20:26'),
(25, 7, 21, 1, '12', '1500.00', '2023-08-15 22:20:26', '2023-08-15 22:20:26'),
(26, 7, 20, 1, '1', '405.00', '2023-08-15 22:20:26', '2023-08-15 22:20:26'),
(27, 7, 22, 1, '2', '840.00', '2023-08-15 22:20:26', '2023-08-15 22:20:26'),
(28, 8, 16, 1, '1', '200.00', '2023-08-16 00:21:16', '2023-08-16 00:21:16'),
(29, 8, 23, 1, '2', '700.00', '2023-08-16 00:21:16', '2023-08-16 00:21:16'),
(30, 8, 17, 1, '4', '640.00', '2023-08-16 00:21:16', '2023-08-16 00:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_10_20_153315_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `price`, `unit`, `img_url`, `created_at`, `updated_at`) VALUES
(16, 1, 34, 'Velvet Truffle Delight', '200', 'pcs', 'uploads/1-1692093134-2.jpg', '2023-08-15 16:52:14', '2023-08-15 16:52:14'),
(17, 1, 34, 'Caramel Crunch Fusion', '160', 'pcs', 'uploads/1-1692093158-2.jpg', '2023-08-15 16:52:38', '2023-08-15 16:52:38'),
(18, 1, 35, 'Raspberry Dream Bliss', '320', 'pcs', 'uploads/1-1692093183-2.jpg', '2023-08-15 16:53:03', '2023-08-15 16:53:03'),
(19, 1, 34, 'Hazelnut Heaven Bar', '110', 'pcs', 'uploads/1-1692093210-2.jpg', '2023-08-15 16:53:30', '2023-08-15 16:53:30'),
(20, 1, 34, 'Almond Toffee Temptation', '405', 'pcs', 'uploads/1-1692093259-2.jpg', '2023-08-15 16:54:19', '2023-08-15 16:54:19'),
(21, 1, 34, 'Coconut Creamy Cluster', '125', 'pcs', 'uploads/1-1692093290-2.jpg', '2023-08-15 16:54:50', '2023-08-15 16:54:50'),
(22, 1, 34, 'Butter Silk Sensation', '420', 'pcs', 'uploads/1-1692093333-2.jpg', '2023-08-15 16:55:33', '2023-08-15 16:55:33'),
(23, 1, 34, 'Espresso Dark Euphoria', '350', 'pcs', 'uploads/1-1692093371-2.jpg', '2023-08-15 16:56:11', '2023-08-15 16:56:11'),
(24, 1, 34, 'Butter Silk Sensation', '580', 'pcs', 'uploads/1-1692093403-2.jpg', '2023-08-15 16:56:43', '2023-08-15 16:56:43'),
(25, 1, 34, 'Orange Zest Indulgence', '400', 'pcs', 'uploads/1-1692093526-2.jpg', '2023-08-15 16:58:46', '2023-08-15 16:58:46'),
(26, 1, 32, 'a', '800', 'pcs', 'uploads/1-1692119986-brands.jpg', '2023-08-16 00:19:46', '2024-10-20 15:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QN6X0L2Ignmb6a0ieocDKTDHj3qIDuLqSdjeLIuJ', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODZxamtaSnQ2MnNMazZwVlpoNDJiN2hKMEV5S1dQQVlRUEJuSG1WNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZW1vMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729440938);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `mobile`, `password`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'Rabbil', 'Hasan', 'engr.rabbil@yahoo.com', '01785388919', '123', '0', '2023-07-16 21:24:03', '2023-08-16 00:14:16'),
(2, 'Liakot', 'Biswas', 'liakot@yahoo.com', '01701063280', 'abc', '0', '2023-07-16 21:24:03', '2023-07-23 16:51:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
