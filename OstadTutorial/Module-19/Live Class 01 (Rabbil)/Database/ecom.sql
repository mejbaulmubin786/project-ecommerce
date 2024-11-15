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
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brandName` varchar(50) NOT NULL,
  `brandImg` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brandName`, `brandImg`, `created_at`, `updated_at`) VALUES
(1, 'DELL', 'https://photo.teamrabbil.com/images/2023/09/09/b1.png', '2023-08-15 12:00:16', '2023-09-09 12:12:45'),
(2, 'Xiaomi ', 'https://photo.teamrabbil.com/images/2023/09/09/b2.png', '2023-08-15 12:00:16', '2023-09-09 12:13:06'),
(3, 'HUAWEI', 'https://photo.teamrabbil.com/images/2023/09/09/b3.png', '2023-08-15 12:00:16', '2023-09-09 12:13:31'),
(4, 'Vivo', 'https://photo.teamrabbil.com/images/2023/09/09/b4.png', '2023-08-15 12:00:16', '2023-09-09 12:13:37'),
(5, 'HP', 'https://photo.teamrabbil.com/images/2023/09/09/b5.png', '2023-08-15 12:00:16', '2023-09-09 12:13:45'),
(6, 'DELL', 'https://photo.teamrabbil.com/images/2023/09/09/b1.png', '2023-08-15 12:00:16', '2023-09-09 12:13:49'),
(7, 'Xiaomi ', 'https://photo.teamrabbil.com/images/2023/09/09/b2.png', '2023-08-15 12:00:16', '2023-09-09 12:13:54'),
(8, 'HUAWE', 'https://photo.teamrabbil.com/images/2023/09/09/b3.png', '2023-08-15 12:00:16', '2023-09-09 12:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `categoryImg` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryName`, `categoryImg`, `created_at`, `updated_at`) VALUES
(1, 'Television', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img1.png', '2023-08-15 11:59:11', '2023-09-09 11:42:29'),
(2, 'Mobile', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img2.png', '2023-08-15 11:59:11', '2023-09-09 11:42:35'),
(3, 'Headphone', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img3.png', '2023-08-15 11:59:11', '2023-09-09 11:42:45'),
(4, 'Watch', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img4.png', '2023-08-15 11:59:11', '2023-09-09 11:42:59'),
(5, 'Game', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img5.png', '2023-08-15 11:59:11', '2023-09-09 11:43:10'),
(6, 'Camera', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img6.png', '2023-08-15 11:59:11', '2023-09-09 11:43:17'),
(7, 'Audio', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img7.png', '2023-08-15 11:59:11', '2023-09-09 11:43:26'),
(11, 'Television', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img1.png', '2023-08-15 11:59:11', '2023-09-09 11:42:29'),
(12, 'Mobile', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img2.png', '2023-08-15 11:59:11', '2023-09-09 11:42:35'),
(18, 'Watch', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img4.png', '2023-08-15 11:59:11', '2023-09-09 11:42:59'),
(19, 'Game', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img5.png', '2023-08-15 11:59:11', '2023-09-09 11:43:10'),
(20, 'Camera', 'https://photo.teamrabbil.com/images/2023/09/09/cat_img6.png', '2023-08-15 11:59:11', '2023-09-09 11:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `customer_profiles`
--

CREATE TABLE `customer_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cus_name` varchar(100) NOT NULL,
  `cus_add` varchar(500) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_state` varchar(50) NOT NULL,
  `cus_postcode` varchar(50) NOT NULL,
  `cus_country` varchar(50) NOT NULL,
  `cus_phone` varchar(50) NOT NULL,
  `cus_fax` varchar(50) NOT NULL,
  `ship_name` varchar(100) NOT NULL,
  `ship_add` varchar(100) NOT NULL,
  `ship_city` varchar(100) NOT NULL,
  `ship_state` varchar(100) NOT NULL,
  `ship_postcode` varchar(100) NOT NULL,
  `ship_country` varchar(100) NOT NULL,
  `ship_phone` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_profiles`
--

INSERT INTO `customer_profiles` (`id`, `cus_name`, `cus_add`, `cus_city`, `cus_state`, `cus_postcode`, `cus_country`, `cus_phone`, `cus_fax`, `ship_name`, `ship_add`, `ship_city`, `ship_state`, `ship_postcode`, `ship_country`, `ship_phone`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Rabbil Hasan Rupom', 'Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207', 'Dhaka', 'Dhaka', '1207', 'Bangladesh', '01785388919', '01785388919', 'Rabbil Hasan', 'Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207', 'Dhaka', 'Dhaka', '1207', 'Bangladesh', '01785388919', 1, '2023-08-25 21:34:14', '2024-09-01 10:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(50) NOT NULL,
  `vat` varchar(50) NOT NULL,
  `payable` varchar(50) NOT NULL,
  `cus_details` varchar(500) NOT NULL,
  `ship_details` varchar(500) NOT NULL,
  `tran_id` varchar(100) NOT NULL,
  `val_id` varchar(100) NOT NULL DEFAULT '0',
  `delivery_status` enum('Pending','Processing','Completed') NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `total`, `vat`, `payable`, `cus_details`, `ship_details`, `tran_id`, `val_id`, `delivery_status`, `payment_status`, `user_id`, `created_at`, `updated_at`) VALUES
(2, '564000', '16920', '580920', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6511c5da463fa', '0', 'Pending', 'Pending', 1, '2023-09-25 11:39:38', '2023-09-25 11:39:38'),
(3, '564000', '16920', '580920', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6511c60edfbdd', '0', 'Pending', 'Pending', 1, '2023-09-25 11:40:30', '2023-09-25 11:40:30'),
(4, '470000', '14100', '484100', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6525fe18675e2', '0', 'Pending', 'Pending', 2, '2023-10-10 19:44:56', '2023-10-10 19:44:56'),
(8, '470000', '14100', '484100', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652610bfa8041', '0', 'Pending', 'Pending', 2, '2023-10-10 21:04:31', '2023-10-10 21:04:31'),
(11, '470000', '14100', '484100', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '65261272a5a7c', '0', 'Pending', 'Pending', 2, '2023-10-10 21:11:46', '2023-10-10 21:11:46'),
(12, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652612f75e4c7', '0', 'Pending', 'Pending', 1, '2023-10-10 21:13:59', '2023-10-10 21:13:59'),
(13, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526132be3417', '0', 'Pending', 'Pending', 1, '2023-10-10 21:14:51', '2023-10-10 21:14:51'),
(14, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526134257fcb', '0', 'Pending', 'Pending', 1, '2023-10-10 21:15:14', '2023-10-10 21:15:14'),
(15, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526138e8d7ae', '0', 'Pending', 'Pending', 1, '2023-10-10 21:16:30', '2023-10-10 21:16:30'),
(16, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652613a79aec0', '0', 'Pending', 'Pending', 1, '2023-10-10 21:16:55', '2023-10-10 21:16:55'),
(17, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652613b8ef725', '0', 'Pending', 'Pending', 1, '2023-10-10 21:17:12', '2023-10-10 21:17:12'),
(18, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652614518ece4', '0', 'Pending', 'Pending', 1, '2023-10-10 21:19:45', '2023-10-10 21:19:45'),
(19, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526145c7ae8d', '0', 'Pending', 'Pending', 1, '2023-10-10 21:19:56', '2023-10-10 21:19:56'),
(20, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526146b6eced', '0', 'Pending', 'Pending', 1, '2023-10-10 21:20:11', '2023-10-10 21:20:11'),
(21, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526149251456', '0', 'Pending', 'Pending', 1, '2023-10-10 21:20:50', '2023-10-10 21:20:50'),
(22, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652614a9427fa', '0', 'Pending', 'Pending', 1, '2023-10-10 21:21:13', '2023-10-10 21:21:13'),
(23, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652614c1054be', '0', 'Pending', 'Pending', 1, '2023-10-10 21:21:37', '2023-10-10 21:21:37'),
(24, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652614ccb13b1', '0', 'Pending', 'Pending', 1, '2023-10-10 21:21:48', '2023-10-10 21:21:48'),
(25, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652614d88bff8', '0', 'Pending', 'Pending', 1, '2023-10-10 21:22:00', '2023-10-10 21:22:00'),
(26, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652615176f458', '0', 'Pending', 'Pending', 1, '2023-10-10 21:23:03', '2023-10-10 21:23:03'),
(27, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '6526153f243c0', '0', 'Pending', 'Pending', 1, '2023-10-10 21:23:43', '2023-10-10 21:23:43'),
(28, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '65261727c2956', '0', 'Pending', 'Success', 1, '2023-10-10 21:31:51', '2023-10-10 21:38:07'),
(29, '1410000', '42300', '1452300', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652a2c3525ad7', '0', 'Pending', 'Pending', 1, '2023-10-13 23:50:45', '2023-10-13 23:50:45'),
(30, '1410000', '42300', '1452300', 'Name:Rabbil Hasan Rupom,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652a6452330b4', '0', 'Pending', 'Success', 1, '2023-10-14 03:50:10', '2023-10-14 03:50:16'),
(31, '1410000', '42300', '1452300', 'Name:Rabbil Hasan Rupom,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652a67821942b', '0', 'Pending', 'Pending', 1, '2023-10-14 04:03:46', '2023-10-14 04:03:46'),
(32, '1410000', '42300', '1452300', 'Name:Rabbil Hasan Rupom,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652a682f1c391', '0', 'Pending', 'Success', 1, '2023-10-14 04:06:39', '2023-10-14 04:09:04'),
(33, '470000', '14100', '484100', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '652a743236e59', '0', 'Pending', 'Success', 1, '2023-10-14 04:57:54', '2023-10-14 04:57:59'),
(34, '470000', '14100', '484100', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '653498771fc9b', '0', 'Pending', 'Success', 1, '2023-10-21 21:35:19', '2023-10-21 21:35:40'),
(35, '94000', '2820', '96820', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207,City:Dhaka,Phone: 01785388919', 'Name:Rabbil Hasan,Address:Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207 ,City:Dhaka ,Phone: 01785388919', '66ce037d8cd76', '0', 'Pending', 'Success', 1, '2024-08-27 10:49:01', '2024-08-27 10:52:21');

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
(2, 2, 4, 1, '5', '470000', '2023-09-25 11:39:38', '2023-09-25 11:39:38'),
(3, 2, 9, 1, '1', '94000', '2023-09-25 11:39:38', '2023-09-25 11:39:38'),
(4, 3, 4, 1, '5', '470000', '2023-09-25 11:40:30', '2023-09-25 11:40:30'),
(5, 3, 9, 1, '1', '94000', '2023-09-25 11:40:30', '2023-09-25 11:40:30'),
(6, 4, 1, 2, '5', '470000', '2023-10-10 19:44:56', '2023-10-10 19:44:56'),
(10, 8, 1, 2, '5', '470000', '2023-10-10 21:04:31', '2023-10-10 21:04:31'),
(13, 11, 1, 2, '5', '470000', '2023-10-10 21:11:46', '2023-10-10 21:11:46'),
(14, 12, 4, 1, '5', '470000', '2023-10-10 21:13:59', '2023-10-10 21:13:59'),
(15, 12, 9, 1, '10', '940000', '2023-10-10 21:13:59', '2023-10-10 21:13:59'),
(16, 13, 4, 1, '5', '470000', '2023-10-10 21:14:51', '2023-10-10 21:14:51'),
(17, 13, 9, 1, '10', '940000', '2023-10-10 21:14:51', '2023-10-10 21:14:51'),
(18, 14, 4, 1, '5', '470000', '2023-10-10 21:15:14', '2023-10-10 21:15:14'),
(19, 14, 9, 1, '10', '940000', '2023-10-10 21:15:14', '2023-10-10 21:15:14'),
(20, 15, 4, 1, '5', '470000', '2023-10-10 21:16:30', '2023-10-10 21:16:30'),
(21, 15, 9, 1, '10', '940000', '2023-10-10 21:16:30', '2023-10-10 21:16:30'),
(22, 16, 4, 1, '5', '470000', '2023-10-10 21:16:55', '2023-10-10 21:16:55'),
(23, 16, 9, 1, '10', '940000', '2023-10-10 21:16:55', '2023-10-10 21:16:55'),
(24, 17, 4, 1, '5', '470000', '2023-10-10 21:17:12', '2023-10-10 21:17:12'),
(25, 17, 9, 1, '10', '940000', '2023-10-10 21:17:12', '2023-10-10 21:17:12'),
(26, 18, 4, 1, '5', '470000', '2023-10-10 21:19:45', '2023-10-10 21:19:45'),
(27, 18, 9, 1, '10', '940000', '2023-10-10 21:19:45', '2023-10-10 21:19:45'),
(28, 19, 4, 1, '5', '470000', '2023-10-10 21:19:56', '2023-10-10 21:19:56'),
(29, 19, 9, 1, '10', '940000', '2023-10-10 21:19:56', '2023-10-10 21:19:56'),
(30, 20, 4, 1, '5', '470000', '2023-10-10 21:20:11', '2023-10-10 21:20:11'),
(31, 20, 9, 1, '10', '940000', '2023-10-10 21:20:11', '2023-10-10 21:20:11'),
(32, 21, 4, 1, '5', '470000', '2023-10-10 21:20:50', '2023-10-10 21:20:50'),
(33, 21, 9, 1, '10', '940000', '2023-10-10 21:20:50', '2023-10-10 21:20:50'),
(34, 22, 4, 1, '5', '470000', '2023-10-10 21:21:13', '2023-10-10 21:21:13'),
(35, 22, 9, 1, '10', '940000', '2023-10-10 21:21:13', '2023-10-10 21:21:13'),
(36, 23, 4, 1, '5', '470000', '2023-10-10 21:21:37', '2023-10-10 21:21:37'),
(37, 23, 9, 1, '10', '940000', '2023-10-10 21:21:37', '2023-10-10 21:21:37'),
(38, 24, 4, 1, '5', '470000', '2023-10-10 21:21:48', '2023-10-10 21:21:48'),
(39, 24, 9, 1, '10', '940000', '2023-10-10 21:21:48', '2023-10-10 21:21:48'),
(40, 25, 4, 1, '5', '470000', '2023-10-10 21:22:00', '2023-10-10 21:22:00'),
(41, 25, 9, 1, '10', '940000', '2023-10-10 21:22:00', '2023-10-10 21:22:00'),
(42, 26, 4, 1, '5', '470000', '2023-10-10 21:23:03', '2023-10-10 21:23:03'),
(43, 26, 9, 1, '10', '940000', '2023-10-10 21:23:03', '2023-10-10 21:23:03'),
(44, 27, 4, 1, '5', '470000', '2023-10-10 21:23:43', '2023-10-10 21:23:43'),
(45, 27, 9, 1, '10', '940000', '2023-10-10 21:23:43', '2023-10-10 21:23:43'),
(46, 28, 4, 1, '5', '470000', '2023-10-10 21:31:51', '2023-10-10 21:31:51'),
(47, 28, 9, 1, '10', '940000', '2023-10-10 21:31:51', '2023-10-10 21:31:51'),
(48, 29, 4, 1, '5', '470000', '2023-10-13 23:50:45', '2023-10-13 23:50:45'),
(49, 29, 9, 1, '10', '940000', '2023-10-13 23:50:45', '2023-10-13 23:50:45'),
(50, 30, 4, 1, '5', '470000', '2023-10-14 03:50:10', '2023-10-14 03:50:10'),
(51, 30, 9, 1, '10', '940000', '2023-10-14 03:50:10', '2023-10-14 03:50:10'),
(52, 31, 4, 1, '5', '470000', '2023-10-14 04:03:46', '2023-10-14 04:03:46'),
(53, 31, 9, 1, '10', '940000', '2023-10-14 04:03:46', '2023-10-14 04:03:46'),
(54, 32, 4, 1, '5', '470000', '2023-10-14 04:06:39', '2023-10-14 04:06:39'),
(55, 32, 9, 1, '10', '940000', '2023-10-14 04:06:39', '2023-10-14 04:06:39'),
(56, 33, 4, 1, '5', '470000', '2023-10-14 04:57:54', '2023-10-14 04:57:54'),
(57, 34, 9, 1, '5', '470000', '2023-10-21 21:35:19', '2023-10-21 21:35:19'),
(58, 35, 9, 1, '1', '94000', '2024-08-27 10:49:01', '2024-08-27 10:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('about','refund','terms','how to buy','contact','complain') NOT NULL,
  `des` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `type`, `des`) VALUES
(1, 'about', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(2, 'refund', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(3, 'terms', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(4, 'how to buy', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(5, 'contact', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(6, 'complain', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `short_des` varchar(500) NOT NULL,
  `price` varchar(50) NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `discount_price` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `stock` tinyint(1) NOT NULL,
  `star` double(8,2) NOT NULL,
  `remark` enum('popular','new','top','special','trending','regular') NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `short_des`, `price`, `discount`, `discount_price`, `image`, `stock`, `star`, `remark`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(2, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(3, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(4, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(5, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(6, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(7, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(8, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(9, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(10, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(11, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(12, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(13, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(14, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(15, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(16, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'popular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(17, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(18, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(19, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(20, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(21, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(22, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(23, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(24, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'new', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(25, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(26, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(27, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(28, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(29, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(30, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(31, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'top', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(32, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'special', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(33, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'special', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(34, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'special', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(35, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'special', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(36, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'special', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(37, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'trending', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(38, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'trending', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(39, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'trending', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(40, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'trending', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51'),
(41, 'MacBook Air M1 8/256GB', 'MacBook Air M1 8/256GB 13-inch Space Gray', '94000', 0, '0', 'https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg', 1, 80.00, 'regular', 1, 1, '2023-08-15 12:24:06', '2023-09-09 21:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_carts`
--

CREATE TABLE `product_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(200) NOT NULL,
  `size` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_carts`
--

INSERT INTO `product_carts` (`id`, `user_id`, `product_id`, `color`, `size`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(6, 2, 1, 'Red', 'X', '5', '470000', '2023-10-10 18:41:33', '2023-10-10 18:41:33'),
(11, 1, 9, 'White', '3X', '1', '94000', '2024-08-27 10:43:15', '2024-08-27 10:43:22'),
(12, 1, 1, 'Red', 'X', '5', '470000', '2024-09-01 10:43:10', '2024-09-01 10:43:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img1` varchar(200) NOT NULL,
  `img2` varchar(200) NOT NULL,
  `img3` varchar(200) NOT NULL,
  `img4` varchar(200) NOT NULL,
  `des` longtext NOT NULL,
  `color` varchar(200) NOT NULL,
  `size` varchar(200) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `img1`, `img2`, `img3`, `img4`, `des`, `color`, `size`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'https://photo.teamrabbil.com/images/2023/08/15/macbooks-2048px-2349.md.jpeg', 'https://photo.teamrabbil.com/images/2023/09/23/Group-1.png', 'https://photo.teamrabbil.com/images/2023/09/23/Group-2.png', 'https://photo.teamrabbil.com/images/2023/09/23/Group-3.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'Red,Green,White', 'X,2X,3X', 1, '2023-08-20 13:49:16', '2023-09-23 23:47:20'),
(2, 'https://photo.teamrabbil.com/images/2023/08/15/macbooks-2048px-2349.md.jpeg', 'https://photo.teamrabbil.com/images/2023/09/23/Group-1.png', 'https://photo.teamrabbil.com/images/2023/09/23/Group-2.png', 'https://photo.teamrabbil.com/images/2023/09/23/Group-3.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'Red,Green,White', 'X,2X,3X', 2, '2023-08-20 13:49:16', '2023-09-23 23:47:23'),
(3, 'https://photo.teamrabbil.com/images/2023/08/15/macbooks-2048px-2349.md.jpeg', 'https://photo.teamrabbil.com/images/2023/09/23/Group-1.png', 'https://photo.teamrabbil.com/images/2023/09/23/Group-2.png', 'https://photo.teamrabbil.com/images/2023/09/23/Group-3.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'Red,Green,White', 'X,2X,3X', 9, '2023-08-20 13:49:16', '2023-09-23 23:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(1000) NOT NULL,
  `rating` varchar(10) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `description`, `rating`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 'Reference site about Lorem Ipsum,', '90', 1, 1, '2023-10-14 21:17:09', '2023-10-14 21:17:09'),
(3, 'Lorem ipsum dolor sit amet,', '90', 1, 9, '2023-10-21 21:41:11', '2023-10-21 21:41:11'),
(4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '5', 1, 2, '2024-09-01 10:55:59', '2024-09-01 10:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_sliders`
--

CREATE TABLE `product_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `short_des` varchar(500) NOT NULL,
  `price` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sliders`
--

INSERT INTO `product_sliders` (`id`, `title`, `short_des`, `price`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'MacBook Air M1 New', 'Apple MacBook Air 13.3-Inch Retina Display 8-core Apple M1 chip with 8GB RAM, 256GB SSD (MGND3) Gold', '50% off in all products', 'http://photo.teamrabbil.com/images/2023/09/09/s15ab2733cb4567d3d.png', 1, '2023-08-15 12:42:46', '2023-09-09 14:00:21'),
(3, 'MacBook Air M1 New', 'Apple MacBook Air 13.3-Inch Retina Display 8-core Apple M1 chip with 8GB RAM, 256GB SSD (MGND3) Gold', '51% off in all products', 'http://photo.teamrabbil.com/images/2023/09/09/s29b413a4aec6bec14.png', 2, '2023-08-15 12:42:46', '2023-09-09 14:00:24'),
(4, 'MacBook Air M1 New', 'Apple MacBook Air 13.3-Inch Retina Display 8-core Apple M1 chip with 8GB RAM, 256GB SSD (MGND3) Gold', '52% off in all products', 'http://photo.teamrabbil.com/images/2023/09/09/s36372954997b5719f.png', 3, '2023-08-15 12:42:46', '2023-09-09 14:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_wishes`
--

CREATE TABLE `product_wishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_wishes`
--

INSERT INTO `product_wishes` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 4, 1, '2024-09-01 10:45:46', '2024-09-01 10:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `sslcommerz_accounts`
--

CREATE TABLE `sslcommerz_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` varchar(255) NOT NULL,
  `store_passwd` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `success_url` varchar(255) NOT NULL,
  `fail_url` varchar(255) NOT NULL,
  `cancel_url` varchar(255) NOT NULL,
  `ipn_url` varchar(255) NOT NULL,
  `init_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sslcommerz_accounts`
--

INSERT INTO `sslcommerz_accounts` (`id`, `store_id`, `store_passwd`, `currency`, `success_url`, `fail_url`, `cancel_url`, `ipn_url`, `init_url`, `created_at`, `updated_at`) VALUES
(1, 'teamr600c004f8da4d', 'teamr600c004f8da4d@ssl', 'BDT', 'http://127.0.0.1:8000/PaymentSuccess', 'http://127.0.0.1:8000/PaymentFail', 'http://127.0.0.1:8000/PaymentCancel', 'http://127.0.0.1:8000/api/PaymentIPN', 'https://sandbox.sslcommerz.com/gwprocess/v4/api.php', '2023-08-25 21:35:23', '2023-08-25 21:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'engr.rabbil@yahoo.com', '0', '2023-08-20 09:13:06', '2024-09-01 10:28:46'),
(2, 'engr.rabbil@outlook.com', '0', '2023-09-23 19:16:21', '2023-10-13 23:28:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_profiles`
--
ALTER TABLE `customer_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_profiles_user_id_unique` (`user_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_carts`
--
ALTER TABLE `product_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_carts_product_id_foreign` (`product_id`),
  ADD KEY `product_carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_details_product_id_unique` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_customer_id_foreign` (`customer_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sliders`
--
ALTER TABLE `product_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_sliders_product_id_unique` (`product_id`);

--
-- Indexes for table `product_wishes`
--
ALTER TABLE `product_wishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_wishes_product_id_foreign` (`product_id`),
  ADD KEY `product_wishes_user_id_foreign` (`user_id`);

--
-- Indexes for table `sslcommerz_accounts`
--
ALTER TABLE `sslcommerz_accounts`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `customer_profiles`
--
ALTER TABLE `customer_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_carts`
--
ALTER TABLE `product_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_sliders`
--
ALTER TABLE `product_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_wishes`
--
ALTER TABLE `product_wishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sslcommerz_accounts`
--
ALTER TABLE `sslcommerz_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_profiles`
--
ALTER TABLE `customer_profiles`
  ADD CONSTRAINT `customer_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
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
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_carts`
--
ALTER TABLE `product_carts`
  ADD CONSTRAINT `product_carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_profiles` (`id`),
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_sliders`
--
ALTER TABLE `product_sliders`
  ADD CONSTRAINT `product_sliders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_wishes`
--
ALTER TABLE `product_wishes`
  ADD CONSTRAINT `product_wishes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_wishes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
