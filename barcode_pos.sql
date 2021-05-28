-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 06, 2021 at 11:36 PM
-- Server version: 10.3.28-MariaDB-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `reference_no`, `warehouse_id`, `note`, `attachment`, `created_by`, `updated_by`, `updated_at`, `count_id`) VALUES
(1, '2021-03-05 14:57:00', 'PR/2021/03/0001', 1, '', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(1, 1, 18, NULL, 1.0000, 1, '', 'subtraction'),
(2, 1, 18, NULL, 10.0000, 1, '', 'addition'),
(3, 1, 18, NULL, 10.0000, 1, '', 'addition'),
(4, 1, 18, NULL, 20.0000, 1, '', 'subtraction'),
(5, 1, 18, NULL, 50.0000, 1, '', 'addition');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`) VALUES
(1, 'HP', 'HP', NULL, 'hp'),
(2, 'PH', 'PHILIPS', NULL, 'philips'),
(3, 'BJ', 'BAJAJ', NULL, 'bajaj'),
(4, 'MH', 'MAHARAJA', NULL, 'maharaja'),
(5, 'KE', 'KENSTAR', NULL, 'kenstar'),
(6, 'KH', 'Khatan', NULL, 'khatan'),
(7, 'HO', 'HONEYWELL', NULL, 'honeywell'),
(8, 'WH', 'WHIRPOOL', NULL, 'whirpool'),
(9, 'GO1', 'GODREJ', NULL, 'single-door'),
(10, 'TV', 'PANASONIC 32 SIZE', NULL, 'panasonic-32-size');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_calendar`
--

INSERT INTO `sma_calendar` (`id`, `title`, `description`, `start`, `end`, `color`, `user_id`) VALUES
(1, 'month end', '', '2021-02-28 00:00:00', '2021-02-28 23:55:00', '#de1f36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`) VALUES
(1, 'C1', 'LAPTOP', NULL, 0, 'laptop'),
(2, 'AC', 'FAN BLADE', NULL, 0, 'fan-blade'),
(3, 'FREEZE', 'RELAY 4 PIN', NULL, 0, 'relay-4-pin'),
(4, 'RECE COMPRESSOR', 'EMERSON COMPRESSOR CR 22', NULL, 0, 'emerson-compressor-cr-22'),
(5, 'GG01', 'GARMENTS GIRLS', NULL, 0, 'garments-girls'),
(6, 'JM', 'JUSER MIXI', NULL, 0, 'juser-mixi'),
(7, 'MG', 'MIXI GRINDER', NULL, 0, 'mixi-grinder'),
(8, 'EC', 'INDUCATION (electric chula)', NULL, 0, 'inducation-electric-chula'),
(9, 'COOL', 'COOLER', NULL, 0, 'cooler'),
(11, 'EL01', 'ELECTRONICS', NULL, 0, 'electronics'),
(12, 'CR01', 'crockery', NULL, 0, 'crockery'),
(13, 'SH01', 'SHOES', NULL, 0, 'shoes');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@abcd.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@abcd.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Demo', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'demo@abcd.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'Digiflynt_Logo5.jpeg', 0, NULL, NULL, NULL),
(4, 3, 'customer', 1, 'General', 'guddu hussain', 'sarfaraj', '', 'n s b road', 'raniganj', 'West Bengal', '713347', '', '09832292994', 'rajadelhi1981@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, 10000.0000, 1, 'Default'),
(5, 4, 'supplier', NULL, NULL, 'HP', 'HP', '', 'BANGALORE, ANDHRA PRADESH', 'BANGALORE', 'ANDHRA PRADESH', '', '', '9876543210', 'hp@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(6, 4, 'supplier', NULL, NULL, 'Supplier1', 'Supplier1', '', 'supplier1 address', 'mumbai', '', '', '', '12345678', 'supplier1@demo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2020-06-23', 2147483647, 1, 1, NULL, 1.0000, 0.0000, 0.0000, 2495.0000, 2495.0000, NULL, NULL, 0, NULL),
(2, '2020-12-09', 1, 3, 3, 3, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 11.0000, 1, 0, NULL),
(3, '2021-02-25', 1, 4, 4, 3, 2.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 9.0000, 1, 0, NULL),
(4, '2021-02-25', 1, 5, 5, 3, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 8.0000, 1, 0, NULL),
(5, '2021-03-04', 1, 6, 6, 3, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 7.0000, 1, 0, NULL),
(6, '2021-03-05', 1, 7, 7, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 59.0000, 1, 0, NULL),
(7, '2021-03-05', 1, 8, 7, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 59.0000, 1, 0, NULL),
(8, '2021-03-05', 1, 9, 7, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 59.0000, 1, 0, NULL),
(9, '2021-03-05', 1, 10, 8, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 56.0000, 1, 0, NULL),
(10, '2021-03-05', 1, 11, 8, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 56.0000, 1, 0, NULL),
(11, '2021-03-05', 1, 12, 8, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 56.0000, 1, 0, NULL),
(12, '2021-03-05', 1, 13, 9, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 53.0000, 1, 0, NULL),
(13, '2021-03-05', 1, 14, 9, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 53.0000, 1, 0, NULL),
(14, '2021-03-05', 18, 15, 10, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 98.0000, 1, 0, NULL),
(15, '2021-03-05', 18, 16, 10, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 98.0000, 1, 0, NULL),
(16, '2021-03-05', 18, 17, 10, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 98.0000, 1, 0, NULL),
(17, '2021-03-05', 18, 18, 10, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 98.0000, 1, 0, NULL),
(18, '2021-03-05', 10, 20, 11, 4, 1.0000, 420000.0000, 420000.0000, 40000.0000, 40000.0000, 59.0000, 1, 0, NULL),
(19, '2021-03-05', 1, 21, 11, 5, 1.0000, 566037.7358, 600000.0000, 56603.7736, 60000.0000, 51.0000, 1, 0, NULL),
(20, '2021-03-05', 10, 22, 11, 4, 1.0000, 420000.0000, 420000.0000, 40000.0000, 40000.0000, 59.0000, 1, 0, NULL),
(21, '2021-03-05', 18, 23, 11, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 94.0000, 1, 0, NULL),
(22, '2021-03-05', 18, 24, 11, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 94.0000, 1, 0, NULL),
(23, '2021-03-05', 18, 25, 11, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 94.0000, 1, 0, NULL),
(24, '2021-03-05', 18, 26, 11, 6, 1.0000, 59.0000, 59.0000, 100.0000, 100.0000, 94.0000, 1, 0, NULL),
(25, '2021-03-08', 1, 27, 12, 2, 1.0000, 47169.8113, 50000.0000, 56603.7736, 60000.0000, 199.0000, 1, 0, NULL),
(26, '2021-03-16', 19, 28, 13, 11, 10.0000, 1000.0000, 1000.0000, 1000.0000, 1000.0000, 990.0000, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', 1.0000, 0, NULL),
(2, 'EUR', 'EURO', 0.7340, 0, NULL),
(3, 'INR', 'Rupees', 1.0000, 0, 'Rs.'),
(4, 'Jordi', 'Dinar', 0.7100, 0, 'JD');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deliveries`
--

INSERT INTO `sma_deliveries` (`id`, `date`, `sale_id`, `do_reference_no`, `sale_reference_no`, `customer`, `address`, `note`, `status`, `attachment`, `delivered_by`, `received_by`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2021-01-24 15:32:00', 1, 'DO/2021/01/0001', '3567', 'guddu hussain', 'n s b road raniganj West Bengal 713347 <br>Tel: 09832292994 Email: rajadelhi1981@gmail.com', '', 'packing', NULL, '', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deposits`
--

INSERT INTO `sma_deposits` (`id`, `date`, `company_id`, `amount`, `paid_by`, `note`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2020-09-13 11:28:00', 4, 10000.0000, 'someone', '', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_gift_cards`
--

INSERT INTO `sma_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `customer`, `balance`, `expiry`, `created_by`) VALUES
(1, '2021-03-05 18:37:12', '5694319532717263', 10.0000, NULL, NULL, 10.0000, '2023-03-05', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@abcd.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 00:15:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2021-03-01', 2, 2, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2020-12-09 17:17:19', 3, NULL, NULL, 'IPAY/2020/12/0001', NULL, 'cash', '', '', '', '', '', '', 60000.0000, NULL, 1, NULL, 'received', '', 62100.0000, 2100.0000, NULL),
(2, '2021-02-25 09:46:04', 4, NULL, NULL, 'IPAY/2021/02/0001', NULL, 'cash', '', '', '', '', '', '', 12000.0000, NULL, 1, NULL, 'received', '', 12000.0000, -108000.0000, NULL),
(3, '2021-02-25 11:21:00', 5, NULL, NULL, 'IPAY/2021/02/0002', NULL, 'cash', '', '', '', '', '', 'Visa', 63600.0000, NULL, 1, NULL, 'received', '', 0.0000, 0.0000, NULL),
(4, '2021-03-05 13:19:28', 7, NULL, NULL, 'IPAY/2021/03/0003', NULL, 'cash', '', '', '', '', '', '', 1010.0000, NULL, 1, NULL, 'received', '', 1010.0000, -178990.0000, NULL),
(5, '2021-03-05 12:23:50', 8, NULL, NULL, 'IPAY/2021/03/0004', NULL, 'cash', '', '', '', '', '', '', 5000.0000, NULL, 1, NULL, 'received', '', 5000.0000, -175000.0000, NULL),
(6, '2021-03-05 12:29:20', 9, NULL, NULL, 'IPAY/2021/03/0005', NULL, 'cash', '', '', '', '', '', '', 120000.0000, NULL, 1, NULL, 'received', '', 10000000.0000, 9880000.0000, NULL),
(7, '2021-03-05 15:57:13', 10, NULL, NULL, 'IPAY/2021/03/0006', NULL, 'cash', '', '', '', '', '', '', 400.0000, NULL, 1, NULL, 'received', '', 499.0000, 99.0000, NULL),
(8, '2021-03-08 06:24:00', 12, NULL, NULL, '111', NULL, 'cash', '', '', '', '', '', 'Visa', 200.0000, NULL, 1, NULL, 'received', '<p>all paid in advance </p>', 0.0000, 0.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2018-04-04 11:44:41', 1, 666.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.3.1',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.3.1', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default'),
(2, 'Whole sale');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_printers`
--

INSERT INTO `sma_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
(1, 'MyPrinter', 'network', 'default', 50, '', 0x3132372e302e302e31, '9100');

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`) VALUES
(1, 'HP001', 'HP Laptop I7', 1, 50000.0000, 60000.0000, 10.0000, 'no_image.png', 1, NULL, '', '', '', '', '', '', 306.0000, 3, 1, '<p>I7 WITH 8GB RAM 1TB HDD 15IN DISPLAY</p>', NULL, 'code39', '', '<p>I7 WITH 8GB RAM 1TB HDD 15IN DISPLAY</p>', 0, 'standard', 5, 40000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 2, 1, 'hp-laptop-i7', NULL, 2.0000, NULL, 0, 0, NULL),
(2, '31365417', 'EMERSON CR 22', 1, 10000.0000, 10500.0000, 1.0000, 'no_image.png', 4, NULL, '', '', '', '', '', '', NULL, 3, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'emerson-cr-22', NULL, 40.0000, NULL, 0, 0, NULL),
(3, '00349776', 'PANASONIC 32 SIZE', 1, 15000.0000, 18000.0000, 10.0000, 'no_image.png', 10, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 10, 'panasonic-32-size', NULL, 5.0000, NULL, 0, 0, NULL),
(4, 'JM', 'JUSER MIXI', 1, 3000.0000, 4000.0000, 10.0000, 'no_image.png', 11, NULL, '5000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, NULL, NULL, 0, 0, NULL),
(5, 'MG', 'MIXI GRINDER', 1, 3000.0000, 4000.0000, 10.0000, 'no_image.png', 11, NULL, '5000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 4, NULL, NULL, NULL, NULL, 0, 0, NULL),
(6, 'IN', 'INDUCATION', 1, 3000.0000, 4000.0000, 10.0000, 'no_image.png', 11, NULL, '5000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 6, NULL, NULL, NULL, NULL, 0, 0, NULL),
(7, 'CO', 'COOLER', 1, 6000.0000, 8000.0000, 10.0000, 'no_image.png', 11, NULL, '10000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(8, 'WM', 'WASING MACHAIN', 1, 12000.0000, 15000.0000, 10.0000, 'no_image.png', 11, NULL, '20000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(9, 'FR', 'FRIDGE', 1, 15000.0000, 18000.0000, 10.0000, 'no_image.png', 11, NULL, '25000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 9, NULL, NULL, NULL, NULL, 0, 0, NULL),
(10, 'AC', 'AIR CONDITIONER', 1, 35000.0000, 40000.0000, 10.0000, 'no_image.png', 11, NULL, '50000', '', '', '', '', '', NULL, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(11, 'LT', 'LED TV', 1, 16000.0000, 20000.0000, 10.0000, 'no_image.png', 11, NULL, '28000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(12, 'IR', 'IRON', 1, 1000.0000, 1500.0000, 10.0000, 'no_image.png', 11, NULL, '2000', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(13, 'COO', 'COOKER', 1, 1500.0000, 2000.0000, 10.0000, 'no_image.png', 12, NULL, '2500', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(14, 'KA', 'KADHAI', 1, 500.0000, 800.0000, 10.0000, 'no_image.png', 12, NULL, '1500', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 3, NULL, NULL, NULL, NULL, 0, 0, NULL),
(15, 'BO', 'BOY SHOES', 1, 500.0000, 800.0000, 10.0000, 'no_image.png', 13, NULL, '1500', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(16, 'LE', 'LEDIES', 1, 400.0000, 700.0000, 10.0000, 'no_image.png', 13, NULL, '1500', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(17, 'BS', 'BOY SENDEL', 1, 300.0000, 500.0000, 10.0000, 'no_image.png', 13, NULL, '1500', '', '', '', '', '', 0.0000, 1, 1, NULL, NULL, 'code128', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(18, '12112', 'Car', 1, 59.0000, 100.0000, 0.0000, 'no_image.png', 11, NULL, '', '', '', '', '', '', 141.0000, 1, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'car', NULL, 0.0000, NULL, 0, 0, NULL),
(19, '10001', 'ARM', 1, 1000.0000, 1000.0000, 0.0000, 'no_image.png', 7, NULL, '', '', '', '', '', '', 1000.0000, 1, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 1, 1, 4, 'arm', NULL, 0.0000, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 15, '6', NULL, NULL, NULL),
(2, 15, '7', NULL, NULL, NULL),
(3, 15, '8', NULL, NULL, NULL),
(4, 15, '9', NULL, NULL, NULL),
(5, 15, '10', NULL, NULL, NULL),
(6, 16, '6', NULL, NULL, NULL),
(7, 16, '7', NULL, NULL, NULL),
(8, 16, '8', NULL, NULL, NULL),
(9, 16, '9', NULL, NULL, NULL),
(10, 16, '10', NULL, NULL, NULL),
(11, 17, '6', NULL, NULL, NULL),
(12, 17, '7', NULL, NULL, NULL),
(13, 17, '8', NULL, NULL, NULL),
(14, 17, '9', NULL, NULL, NULL),
(15, 17, '10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(1, '123', '2020-10-10 17:00:00', 6, 'Supplier1', 1, '', 566037.7358, 0.0000, NULL, 0.0000, 0.0000, 33962.2642, 1, 0.0000, 33962.2642, 0.0000, 600000.0000, 0.0000, 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(2, '454567', '2021-03-04 05:25:00', 2, 'Supplier Company Name', 1, '', 4930188.6790, 0.0000, '10', 10.0000, 10.0000, 169811.3210, 3, 305999.4000, 475810.7210, 0.0000, 5405989.4000, 0.0000, 'pending', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, NULL, NULL, 1, 'HP001', 'HP Laptop I7', NULL, 47169.8113, 100.0000, 1, 283018.8679, 3, '6.0000%', NULL, NULL, NULL, 5000000.0000, 100.0000, '2020-09-13', 'received', 50000.0000, 50000.0000, 100.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 1, 'HP001', 'HP Laptop I7', NULL, 47169.8113, 200.0000, 2, 566037.7358, 3, '6.0000%', NULL, NULL, NULL, 10000000.0000, 199.0000, '2020-09-13', 'received', 50000.0000, 50000.0000, 200.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(3, 1, NULL, 1, 'HP001', 'HP Laptop I7', NULL, 566037.7358, 12.0000, 1, 33962.2642, 3, '6.0000%', '0', 0.0000, NULL, 600000.0000, 7.0000, '2020-10-10', 'received', 600000.0000, 50000.0000, 12.0000, NULL, NULL, 2, 'DZ', 1.0000, NULL, NULL, NULL, NULL),
(4, 2, NULL, 10, 'AC', 'AIR CONDITIONER', NULL, 420000.0000, 60.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, NULL, 2100000.0000, 58.0000, '2021-03-04', 'pending', 420000.0000, 35000.0000, 60.0000, NULL, NULL, 2, 'DZ', 5.0000, NULL, NULL, NULL, NULL),
(5, 2, NULL, 1, 'HP001', 'HP Laptop I7', NULL, 566037.7358, 60.0000, 1, 169811.3210, 3, '6.0000%', '0', 0.0000, NULL, 3000000.0000, 51.0000, '2021-03-04', 'pending', 600000.0000, 50000.0000, 60.0000, NULL, NULL, 2, 'DZ', 5.0000, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 18, '12112', 'Car', NULL, 59.0000, 50.0000, 1, 0.0000, 1, '0.0000', NULL, NULL, NULL, 2950.0000, 0.0000, '2021-03-05', 'received', 59.0000, 59.0000, 50.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 18, '12112', 'Car', NULL, 59.0000, 20.0000, 2, 0.0000, 1, '0.0000', NULL, NULL, NULL, 1180.0000, 20.0000, '2021-03-05', 'received', 59.0000, 59.0000, 20.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 18, '12112', 'Car', NULL, 59.0000, 30.0000, 3, 0.0000, 1, '0.0000', NULL, NULL, NULL, 1770.0000, 30.0000, '2021-03-05', 'received', 59.0000, 59.0000, 30.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(9, NULL, 1, 18, '12112', 'Car', NULL, 59.0000, 1.0000, 2, 0.0000, 1, '0.0000', NULL, NULL, NULL, 59.0000, 1.0000, '2021-03-05', 'received', 59.0000, 59.0000, NULL, NULL, NULL, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL),
(10, NULL, 1, 18, '12112', 'Car', NULL, 59.0000, 90.0000, 2, 0.0000, 1, '0.0000', NULL, NULL, NULL, 5310.0000, 90.0000, '2021-03-05', 'received', 59.0000, 59.0000, NULL, NULL, NULL, 1, 'PCS', 90.0000, NULL, NULL, NULL, NULL),
(11, NULL, NULL, 19, '10001', 'ARM', NULL, 1000.0000, 1000.0000, 1, 0.0000, 1, '0.0000', NULL, NULL, NULL, 1000000.0000, 990.0000, '2021-03-16', 'received', 1000.0000, 1000.0000, 1000.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 19, '10001', 'ARM', NULL, 1000.0000, 10.0000, 3, 0.0000, 1, '0.0000', NULL, NULL, NULL, 10000.0000, 10.0000, '2021-03-16', 'received', 1000.0000, 1000.0000, 10.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quotes`
--

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `supplier_id`, `supplier`, `hash`, `cgst`, `sgst`, `igst`) VALUES
(1, '2020-09-13 12:28:00', 'QUOTE/2020/09/0001', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, 56603.7736, 0.0000, 0.0000, NULL, 0.0000, 3396.2264, 1, 0.0000, 3396.2264, 0.0000, 60000.0000, 'pending', 1, NULL, NULL, NULL, 5, 'HP', 'c74cc693700382e7167855d1349c7e4bd0d8d0bd2b0da52cc055ba8317fd2b6a', NULL, NULL, NULL),
(2, '2021-03-05 15:14:00', 'QUOTE/2021/03/0001', 7, 'GCESoft', 1, 3, 'Test Biller', '', NULL, 300.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 300.0000, 'pending', 1, NULL, NULL, NULL, 0, NULL, '6f64f77a6477dff5aea67a52d7ced6da03a5078a95a89ffa2b4b2ed344693df4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quote_items`
--

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, NULL, 60000.0000, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL),
(2, 2, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, NULL, 100.0000, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL),
(3, 2, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, NULL, 100.0000, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL),
(4, 2, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, NULL, 100.0000, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES
(1, '2020-06-23 09:15:00', '3567', 4, 'sarfaraj', 3, 'Test Biller', 1, '', '', 2495.0000, 5.0000, NULL, 5.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 2495.0000, 'completed', 'pending', 0, NULL, 1, NULL, NULL, 1, 0, 0.0000, 2, 100.0000, NULL, 'SR/2020/09/0001', NULL, -2395.0000, NULL, NULL, 0, 0, NULL, NULL, '9c8592d2bcf7d28a59efd0a68182ac6e02d54660c634601547c0816f1c7378b0', NULL, NULL, NULL, NULL, NULL),
(2, '2020-09-13 12:37:00', '3567', 4, 'sarfaraj', 3, 'Test Biller', 1, '', NULL, -2495.0000, -5.0000, NULL, -5.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, -2395.0000, 'returned', 'pending', NULL, NULL, 1, NULL, NULL, NULL, 0, 0.0000, NULL, 100.0000, NULL, 'SR/2020/09/0001', 1, 0.0000, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2020-12-09 17:17:19', 'SALE/POS/2020/12/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 56603.7736, 0.0000, NULL, 0.0000, 0.0000, 3396.2264, 1, 0.0000, 3396.2264, 0.0000, 60000.0000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, 60000.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '3cf4dbb001aa2bbe3622c4b7aa87c8d219fdd93b1a24992ccef57f780cbd044f', NULL, NULL, NULL, NULL, NULL),
(4, '2021-02-25 09:46:04', 'SALE/POS/2021/02/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 113207.5472, 0.0000, NULL, 0.0000, 0.0000, 6792.4528, 1, 0.0000, 6792.4528, 0.0000, 120000.0000, 'completed', 'partial', 0, NULL, 1, NULL, NULL, 2, 1, 12000.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '9076021887d32790635654252278293c88b1887e8c9169cb92b5a66aa1fd2ee8', NULL, NULL, NULL, NULL, NULL),
(5, '2021-02-25 11:17:00', 'SALE/2021/02/0001', 4, 'sarfaraj', 3, 'Test Biller', 1, '', '', 56603.7736, 0.0000, NULL, 0.0000, 0.0000, 3396.2264, 3, 3600.0000, 6996.2264, 0.0000, 63600.0000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 0, 63600.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 0, NULL, NULL, '5ce2c27ac83169665b68d88e555746ac771703f49980dcf2f3b9d3cfbf3a8593', NULL, NULL, NULL, NULL, NULL),
(6, '2021-03-04 05:16:00', '123456', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 56603.7736, 0.0000, '5', 5.0000, 5.0000, 3396.2264, 3, 3599.7000, 6995.9264, 0.0000, 63594.7000, 'completed', 'pending', 0, NULL, 1, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 0, NULL, NULL, '4a9b646c60700a39e73c5cf06558bb2ba900a4ca568e406a3c33aec8b269da26', NULL, NULL, NULL, NULL, NULL),
(7, '2021-03-05 13:19:28', 'SALE/POS/2021/03/0002', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 169811.3208, 0.0000, NULL, 0.0000, 0.0000, 10188.6792, 1, 0.0000, 10188.6792, 0.0000, 180000.0000, 'completed', 'partial', 0, NULL, 1, NULL, NULL, 3, 1, 1010.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '506988fb1929573bc5cac9459a1349e7c93e70ddeca9fb8f52df739534a3f008', NULL, NULL, NULL, NULL, NULL),
(8, '2021-03-05 12:23:50', 'SALE/POS/2021/03/0003', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 169811.3208, 0.0000, NULL, 0.0000, 0.0000, 10188.6792, 1, 0.0000, 10188.6792, 0.0000, 180000.0000, 'completed', 'partial', 0, NULL, 1, NULL, NULL, 3, 1, 5000.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, 'b07b0a0c81aaa2a87500ea140cbbc3fe427ba1c0301e952234fb24afc92eb6e7', NULL, NULL, NULL, NULL, NULL),
(9, '2021-03-05 12:29:20', 'SALE/POS/2021/03/0004', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 113207.5472, 0.0000, NULL, 0.0000, 0.0000, 6792.4528, 1, 0.0000, 6792.4528, 0.0000, 120000.0000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, 120000.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '10fe2f57706f24b48e91ce5efb0500cb1323cf62e235fb8ddece3cda7f69b318', NULL, NULL, NULL, NULL, NULL),
(10, '2021-03-05 15:57:13', 'SALE/POS/2021/03/0005', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 400.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 400.0000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 4, 1, 400.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '887ddfe9af2c4e586eccd70f8b04da9b32b8a36d10ba75fdda5d55e578200366', NULL, NULL, NULL, NULL, NULL),
(11, '2021-03-05 16:07:37', 'SALE/POS/2021/03/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 137023.7736, 0.0000, NULL, 0.0000, 0.0000, 3396.2264, 1, 0.0000, 3396.2264, 0.0000, 140420.0000, 'completed', 'due', 0, NULL, 1, NULL, NULL, 8, 1, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, 'acb6128bdc84996a8bb1dff2357d4edc0189d7d655e79c81e7e56030d0e502b5', NULL, NULL, NULL, NULL, NULL),
(12, '2021-03-08 06:24:00', 'TDG-2202', 1, 'Walk-in Customer', 3, 'Test Biller', 2, '', '', 56603.7736, 0.0000, NULL, 0.0000, 0.0000, 3396.2264, 1, 0.0000, 3396.2264, 22.0000, 60022.0000, 'completed', 'partial', 0, NULL, 1, NULL, NULL, 1, 0, 200.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 0, NULL, NULL, '395e8f6962b647ea3d6ac0539245645514b635d3441c2c203ea8496e3a754eb0', NULL, NULL, NULL, NULL, NULL),
(13, '2021-03-16 09:25:00', 'SALE/2021/03/0001', 4, 'sarfaraj', 3, 'Test Biller', 1, '', '', 10000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 2, 1000.0000, 1000.0000, 0.0000, 11000.0000, 'completed', 'pending', 0, NULL, 1, NULL, NULL, 10, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 0, NULL, NULL, '33f10e0baeedfefea4e2879cf5f6a69fa9d56ce4723ebb5222362e8bfa9292cc', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 4294967295, '99931', 'rayban', 'manual', 0, 2495.0000, 2495.0000, 1.0000, 1, 0.0000, 0, '', '5', 5.0000, 2495.0000, '', 2500.0000, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, NULL, NULL),
(2, 2, 4294967295, '99931', 'rayban', 'manual', 0, 2495.0000, 2495.0000, -1.0000, 1, 0.0000, 0, '', '5', -5.0000, -2495.0000, '', 2500.0000, 1, 0, NULL, -1.0000, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(4, 4, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 2.0000, 1, 6792.4528, 3, '6.0000%', '0', 0.0000, 120000.0000, '', 60000.0000, NULL, 1, 'PCS', 2.0000, '', NULL, NULL, NULL, NULL),
(5, 5, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(8, 7, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(9, 7, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(10, 8, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(11, 8, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(12, 8, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(13, 9, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(14, 9, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(15, 10, 18, '12112', 'Car', 'standard', 0, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(16, 10, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(17, 10, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(18, 10, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(19, 11, 4294967295, '5694319532717263', 'Gift Card', 'manual', 0, 20.0000, 20.0000, 1.0000, 1, 0.0000, 0, '', '0', 0.0000, 20.0000, '', 20.0000, NULL, NULL, NULL, 1.0000, '', NULL, NULL, NULL, NULL),
(20, 11, 10, 'AC', 'AIR CONDITIONER', 'standard', NULL, 40000.0000, 40000.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 40000.0000, '', 40000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(21, 11, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 1, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(22, 11, 10, 'AC', 'AIR CONDITIONER', 'standard', NULL, 40000.0000, 40000.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 40000.0000, '', 40000.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(23, 11, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(24, 11, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(25, 11, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(26, 11, 18, '12112', 'Car', 'standard', NULL, 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 100.0000, '', 100.0000, NULL, 1, 'PCS', 1.0000, '', NULL, NULL, NULL, NULL),
(27, 12, 1, 'HP001', 'HP Laptop I7', 'standard', NULL, 56603.7736, 60000.0000, 1.0000, 2, 3396.2264, 3, '6.0000%', '0', 0.0000, 60000.0000, '', 60000.0000, NULL, 1, 'PCS', 1.0000, NULL, NULL, NULL, NULL, NULL),
(28, 13, 19, '10001', 'ARM', 'standard', NULL, 1000.0000, 1000.0000, 10.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 10000.0000, '', 1000.0000, NULL, 1, 'PCS', 10.0000, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('039vkomk89h0ecfl1488kqmj5b0324nf', '66.102.6.223', 1618263280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383236333032313b),
('04qcogcmvuh2pc1fcvi73jkn9n3dv32f', '183.62.246.194', 1616667353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363636373238313b7265717565737465645f706167657c733a33313a2261646d696e2f70726f64756374732f7072696e745f626172636f6465732f33223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363637303232223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('05dukogdg2ldd37gkqgjubqicpngcfrj', '183.62.246.194', 1618292594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239323334393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323530373637223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239323539343b),
('0a7hg9adi3fbuhplvugc2ff9o90vchkp', '203.119.241.111', 1616651056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635313035363b),
('0djqas8drnqv3npu1mlpd017a6oue3iq', '183.62.246.194', 1616667857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363636373834393b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363535343338223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('12ccjq4u7fulmjktnoo1c6p8to2npvia', '183.62.246.194', 1618825631, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383832323139363b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383137343630223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383832353633313b),
('19mt9rj3dd1sol1pf5dmnpd187rhvvl7', '119.123.74.129', 1617090260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373039303235343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303839343133223b6c6173745f69707c733a31343a223131392e3132332e37342e313239223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373038393637393b6572726f727c4e3b),
('1gako0tqj5t2qnmpd82p1bauu15gma3g', '183.62.246.194', 1616815865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831353736303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383133383632223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363831353836353b),
('1gebl9hpibqjctthvogo4ldae9u1512c', '61.141.73.84', 1616810369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831303232373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323634223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1lm24k9fpnm4ji9ii26c6jp6cv5p09tc', '183.62.246.194', 1616654675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635343435353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363439373634223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1ln4hjp7iu6umueujt77k5c5ahp9361i', '183.62.246.194', 1616751745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735313638333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735313731303b),
('1v8mudjub33c8bv0v5e0s4dp2lgcdmps', '61.141.73.84', 1616830687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363833303634323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383135373731223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363833303638373b),
('20shmsbaaaosea6076970c83ugh362b2', '122.175.15.65', 1615888348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838383039313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353838383239323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('280ikqngnrgalmmg8c6uo1698g8hlcr3', '183.62.246.194', 1616655408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635353231343b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f7072696e745f626172636f646573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363534303031223b6c6173745f69707c733a31323a223232332e3130342e312e3937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('2qocuc3froferafrdi4vainbtm6dljfs', '117.136.31.222', 1617096018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373039353931333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303934393238223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373039363031383b),
('33730n5kqrh9mi919qj5e7samgl702me', '136.185.34.12', 1619863101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393836333130313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363139383630323737223b6c6173745f69707c733a31333a223130332e32342e3132362e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3d9more5df8075k7u5rfihp9ph4djvlu', '183.62.246.194', 1618295695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239353636353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323935353835223b6c6173745f69707c733a31333a2234352e3131372e3130302e3435223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239353639353b),
('3dagnl4rvqm4umcv7a5kjacohepg4sbb', '183.62.246.194', 1616656371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635363233393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363534393032223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3is2jll3um1nmg97lglr8d6via2n8aur', '121.35.103.39', 1618471480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383437313337353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138343638393235223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383437313438303b),
('3muusk61kpqshkbfl7dsoldo38ubgt6u', '223.104.1.97', 1616654001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635333935323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363533393639223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('42rpjl35b438ugcccjjjca35cqjgqgp6', '183.62.246.194', 1617094941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373039343634313b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303839363437223b6c6173745f69707c733a31343a223131392e3132332e37342e313239223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373039343934313b),
('45e2s2sit3rp659l9kjt9u7j2em6f7hb', '66.249.88.220', 1618339385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383333393136353b),
('4ah9ea3bafr1e8ck6d17sg1fu52mip0l', '27.106.82.19', 1616931231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363933313139313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393236393030223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363933313139383b),
('4c8hbjpj1j50bj89v8f19b75o6j2bpm6', '119.123.74.129', 1617089679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373038393630333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303839343133223b6c6173745f69707c733a31343a223131392e3132332e37342e313239223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373038393637393b),
('4f6vfr089cmrikq4ebohdhu970167cec', '27.106.82.1', 1618329817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332393830373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333235313431223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383332393831303b6572726f727c4e3b),
('4fj182lg2jcq10od0b06hgihk9vbhj7t', '27.106.82.1', 1618324168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332343036393b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333137373236223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383332343130343b6572726f727c4e3b),
('4j3vi4qpqku6ued44jofmr4b0m0f1icu', '42.106.194.51', 1616761954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363736313935333b),
('4k18pppdgfm2vihm2nq6t6a47hsnc22c', '2.217.234.254', 1615204742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353230343435383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135313538383633223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4mf5nf7bmouevd27j8ld60us0nh8bg12', '197.231.201.203', 1618557114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383535363831363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138353430393030223b6c6173745f69707c733a31343a223132312e33352e3130332e323434223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4n8lo8969encoi6vn3co80h8btsh4ei1', '183.62.246.194', 1616809784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363830393735333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383039373031223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363830393738333b),
('4nueakroni0qldet2510l6dg8id1h1ok', '122.175.15.65', 1615885274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838343137303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4qqab397r6dc0tolrfcd1ib5vkgortsp', '122.175.15.65', 1615888553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838383432333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353838383239323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('53vkas9d2um22ni0nglbj4e9o9v0b6g8', '45.117.100.45', 1618295860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239353835373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323530373637223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239353836303b),
('5422d5s93970jl0k84qed9mr22qdbcm1', '61.141.73.84', 1616831581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363833313431343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383135373731223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363833313538313b),
('55flq8viapbe8mi7im5oid54u0pcfb7k', '103.129.97.229', 1617943455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373934333435353b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('58c27dp5k4l10g9dr6k193gu1h6lbs7a', '103.129.97.229', 1614969756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393735363b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('592bhi7q20ouvc3sckf5fnr7acptqb0h', '183.62.246.194', 1618367490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383336373434333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333337343039223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383336373438393b),
('5b1qtr2f9qaovkf37r9ggp2rq3tsvg9b', '183.62.246.194', 1618468937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383436383931343b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138343632393130223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383436383933363b),
('5bbfo6opkpvbr29iao01fv4am1a5ckoe', '3.221.155.147', 1619839157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393833393132313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363139363438323633223b6c6173745f69707c733a31343a223139392e38332e3136332e323331223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5cf4ljofvvardid5qtf4hnua81l0tfvp', '183.62.246.194', 1616655603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635353336303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363534393032223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5dh6eju0g90g36v0qhu8p6bniiv9os7f', '183.62.246.194', 1618823056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383832333033353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138353536383533223b6c6173745f69707c733a31353a223139372e3233312e3230312e323033223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383832333035363b6572726f727c4e3b),
('5j0v80ldd13oo4mgkt475c8ou9ua6u1c', '183.62.246.194', 1616655983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635353638383b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f7072696e745f626172636f646573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363534303031223b6c6173745f69707c733a31323a223232332e3130342e312e3937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('5l0h4rk3en3qml6kof6bd2rdkupqd8qa', '27.106.82.1', 1618317781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383331373538313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323935363836223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383331373630353b6572726f727c4e3b),
('5la4sc63pmsves5dkkfcevhn8jp1fkdl', '136.185.34.12', 1619862786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393836323635323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363139383630323737223b6c6173745f69707c733a31333a223130332e32342e3132362e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('623nf49g6e16fub9pio0sep4fb703c8f', '42.107.137.140', 1616482483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363438323139393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135383834313837223b6c6173745f69707c733a31333a223132322e3137352e31352e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2269664c424a64337265584d43304e775032795962223b),
('6es4fb30l6bkfd9cgvcl84h7071bd3m3', '66.249.88.220', 1618338006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383333383030363b),
('6hdvsq7bqanni9fnfrkk9r9nt6jrnjt6', '27.106.82.19', 1616928144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363932383133363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393236393030223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363932383134343b),
('6jo7p2rsb8tq2mmgblgn8j9jii2r0v08', '27.106.82.1', 1618317755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383331373731343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333137353930223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383331373735353b),
('6n31il8hv2iof60u1akpo8ag2ts9c97e', '119.123.74.129', 1617089495, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373038393336353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303834373439223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313631373038393439353b),
('70s03nkip8q2agsmhiqb4o0qghnv3kok', '183.62.246.194', 1618292907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239323638373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323530373637223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239323930373b),
('72mrdipa2rqf6pc3ne6tr8psln8ddjic', '183.62.246.194', 1618829352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383832393333353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383139373937223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383832393335323b6572726f727c4e3b),
('73cgk3fca7cjbb0upcml3safupbni2gp', '45.117.100.45', 1618295919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239353538353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323836353934223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239353931393b6572726f727c4e3b),
('76hu48dkluqcot6pm6ra4k1to28j641n', '183.62.246.194', 1618368555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383336383433323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333637353338223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383336383535343b),
('78g2m5g1pscpn67u9ivljme07r02hm04', '188.123.160.63', 1614970010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393735393b7265717565737465645f706167657c733a33333a2261646d696e2f73797374656d5f73657474696e67732f757365725f67726f757073223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363134393638343531223b6c6173745f69707c733a31343a223138382e3132332e3136302e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631343936393939353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b72656d6f76655f706f736c737c693a313b757365725f637372667c733a32303a22766244743464464d567352374a42635761364870223b72656d6f76655f746f6c737c693a313b),
('7bppn04gfgpr96vnonoi41ne27sokuvk', '61.141.73.84', 1616813293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831333239333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7ekd6gr8663efa1t2jpr27i4b5jc3l3a', '151.250.222.10', 1617955725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373935353635333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137393433333634223b6c6173745f69707c733a31343a223135312e3235302e3232322e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22526a4e45726c6e625939796f6146353642555066223b),
('7g1fpgpqgehn0ke1sl92nnsikqg2q3j6', '27.106.82.19', 1617120940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373132303934303b),
('7k3lmte5edk5bm85363mlbbsducp8tr9', '207.46.13.61', 1619526550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393532363535303b),
('7ndk7hq44sgvr9i944q1qvp6ldbc39p9', '119.123.73.228', 1617008869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030383734393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303031313935223b6c6173745f69707c733a31343a223131392e3132332e37332e323238223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030383836393b),
('7u73uiu3oqn8md2tft90jdr1mqk9s56g', '111.91.74.106', 1616225979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363232353937393b),
('8hm7177i4bvbp4731dpbaa5fk9035o2k', '61.141.73.84', 1616813676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831333637363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8ilrp2q3k2df54qbcq8ho1gie1he10c5', '183.62.246.194', 1616754511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735343231353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735343236353b),
('933mng3o88dsi8a37ioq2meiduahiqmp', '119.123.73.228', 1617001749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030313730393b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393237303631223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030313734393b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('95nmrc3c00ta23qo7nfuhb9mmokg1evg', '188.123.160.63', 1614969756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393435373b7265717565737465645f706167657c733a33333a2261646d696e2f73797374656d5f73657474696e67732f757365725f67726f757073223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363134393638343531223b6c6173745f69707c733a31343a223138382e3132332e3136302e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631343936393533363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b72656d6f76655f706f736c737c693a313b757365725f637372667c733a32303a22766244743464464d567352374a42635761364870223b),
('9cfs97q22m2brge01c6iqnd2l8qmb2nh', '27.106.82.18', 1620322954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632303332323935343b),
('9da5cnjilpt03lbdm8nmo3fsghil57sg', '61.141.73.84', 1616816173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831363137333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9eorep9jsfnnchpd9h8237fec46pdg97', '27.106.82.19', 1616855694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363835353639343b7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b),
('9ifdq4pqckeeq6mf8qa2q3ib9jreq6ud', '27.106.82.1', 1618329323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332393332333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333235313431223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383332383932313b6572726f727c4e3b),
('a3f1mnb021pkju4c2eedhnh8eo7lu0ff', '27.106.82.19', 1616650514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635303531343b),
('a62qghp5idjrtdp2nq1hjub4efhhdkq5', '183.62.246.194', 1617085337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373038353038353b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303039303038223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373038353333373b),
('a6gkhhr78rig50rnd4cfor8egdai0jft', '183.62.246.194', 1616755256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735343838363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735343236353b),
('a75n2ii1c7s052tmpc9nfm9gute87hfk', '103.129.97.229', 1618557019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383535373031393b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a7hverqf7vseqa4g1dq0220hdlnb4no8', '45.117.100.45', 1618297021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239363938333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323836353934223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239373032313b6572726f727c4e3b),
('afi96447kmlqno1m3sg6ffujt2belb2l', '119.123.73.228', 1617001221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030313132353b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393237303631223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030313232313b),
('ah6gf8shvbiul1jj9311obbjak88u5na', '103.129.97.229', 1614969838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393833383b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('amjahis9cvenmhus9ka0bnpj3v9q2230', '61.141.73.84', 1616817014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831363938363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363831373031333b),
('anq6h2f7vkbf28p75s8dss3fdql7kqcr', '27.106.82.19', 1616928568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363932383437313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393236393030223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363932383536383b),
('aro921aufnjriftd8bu24p6b18l83dgb', '199.83.163.231', 1619648336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393634383234373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383938323833223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('asmjcgtk8uvp1idspu3rb0k8ani62mtl', '183.62.246.194', 1616730886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363733303838333b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('aue1d1v79kgkj2ra6fgmpeuh78klkj5h', '183.62.246.194', 1616835896, 0x7265717565737465645f706167657c733a31393a2261646d696e2f706f732f766965772f31312f31223b5f5f63695f6c6173745f726567656e65726174657c693a313631363833353837313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383332323435223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363833353839363b),
('b0cd6m0esghrc8ahnvl1jc9afsl86uaq', '27.106.82.1', 1618325207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332353133313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333234303931223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383332353230333b6572726f727c4e3b),
('b3411u7hibadmuhadir4uvsn9phtn0ud', '61.141.73.84', 1616832247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363833323234323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383236333739223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('blda9n955ukl3tdnqok3lgoehk40hunb', '183.62.246.194', 1616667691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363636373637333b7265717565737465645f706167657c733a33313a2261646d696e2f70726f64756374732f7072696e745f626172636f6465732f33223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363637303232223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bt1ok8k7drf4p8pmtg7ejbi5fgi49eep', '183.62.246.194', 1616655150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635343837363b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f7072696e745f626172636f646573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363534303031223b6c6173745f69707c733a31323a223232332e3130342e312e3937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('c3qoeb20fe4u006f4kbuj4pu65uk0q9c', '188.123.160.63', 1614969432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393039393b7265717565737465645f706167657c733a33333a2261646d696e2f73797374656d5f73657474696e67732f757365725f67726f757073223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363134393638343531223b6c6173745f69707c733a31343a223138382e3132332e3136302e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631343936393333383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('c4qi5oanue62h8vv712rlc25ml6k30su', '103.129.97.229', 1616736290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363733363239303b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c6t4b36pvrnm058i96eo03o11e4cc1pl', '49.44.83.196', 1618317613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383331373630393b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('cemvr0keg0a1ofejsrqlt37itcmj856q', '183.62.246.194', 1616751310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735313139383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cr82vian2skudg2l2tf8sllhanoqkism', '59.95.90.229', 1616407493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363430373437333b),
('cttk85c00i5knvko4tbftbksbp4u6v62', '183.62.246.194', 1616813881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831333834343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383131393338223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363831333838313b),
('d2fc7o4vv0ng0v1jask83f0av30fk4j8', '27.106.82.19', 1616649801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363634393735353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136353931393431223b6c6173745f69707c733a31333a2234312e3131352e35322e323138223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d7kph3aet4vb4rjklhhvpspndiaf8uof', '61.141.73.84', 1616826142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363832363134323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363832353036333b),
('dfuj8dh4gsaqkrrsr0rq7uk161lm76bk', '27.106.82.18', 1619859459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393835393435393b),
('di6l5le65dejoq15sor5s770h8la5rbl', '151.250.222.10', 1617956218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373935363132333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137393433333634223b6c6173745f69707c733a31343a223135312e3235302e3232322e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22526a4e45726c6e625939796f6146353642555066223b),
('dkl5bob3m15873uok1fe91rgen4ooqn7', '2.217.234.254', 1615195753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139353735313b7265717565737465645f706167657c733a31343a2261646d696e2f63616c656e646172223b),
('dn18l63bu47q6kjcd2aqbrtr2u4fh70a', '66.102.8.95', 1618337542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383333373331323b6572726f727c733a36383a223c703e596f7520686176652033206661696c6564206c6f67696e20617474656d7074732e20506c6561736520747279206166746572203130206d696e757465733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('dq4b0luvj3j4eau6v1o8bvlca93t9q96', '27.106.82.19', 1618337071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383333363938363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333239393837223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383333373037313b),
('dtq5j7lbkvijvh3koqm2pktf82bc1pt7', '41.115.52.218', 1616592058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363539313933333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136343832323036223b6c6173745f69707c733a31343a2234322e3130372e3133372e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('e4r2cuftqvql09d1l4dv3r9rphmri5q7', '183.62.246.194', 1618898267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383839383236373b7265717565737465645f706167657c733a353a2261646d696e223b),
('e67cak93bjoo613gkppipk6seo48rt2h', '183.62.246.194', 1616656252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635353939373b7265717565737465645f706167657c733a32393a2261646d696e2f70726f64756374732f7072696e745f626172636f646573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363534303031223b6c6173745f69707c733a31323a223232332e3130342e312e3937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('e6rgdb3hl3v1schr2l3odldv9jpvj44u', '61.141.73.84', 1616834774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363833343432393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383236333739223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363833343737343b),
('ecrfq1ji134la9ecn0pc1k4kg3q1plnn', '122.175.15.65', 1615885592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838353239353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353838353536363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('ef5g34jpto7utfe3vr5blqeinu4c8704', '45.117.100.45', 1618296960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239363935373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323530373637223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239363936303b),
('efojk3hma730jsoplmvq5h155eda0k5r', '13.66.139.36', 1617675001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373637353030313b),
('ehm5cs87k12c5qaa0ta81c518vrt4n9f', '183.62.246.194', 1616753148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735323835393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735323131333b),
('em8g80lge5v8j870frjpkgcvmkhfvg9s', '183.62.246.194', 1617009082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030383939333b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303036363135223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030393038323b),
('emsq399hf61vgafuehmudfhqcmekng5p', '183.62.246.194', 1616653970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635333933323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363439373634223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('f0mpumrk2c1m4342kbeo4noadgs5jfkv', '103.129.97.229', 1617943415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373934333431353b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f1vceiaojejr6gltadvk7kthmucj3f9c', '27.106.82.19', 1616650419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635303431393b),
('f2vfqd6fh3iu2vi545008us4gtdrurk7', '206.84.224.152', 1618493504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383439333530343b),
('f4u8bhvpn29j0tcb8g86k3pgvpu0ckcd', '1.38.153.184', 1616758957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735383935343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373538333732223b6c6173745f69707c733a31323a22312e33382e3135332e313834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735383935373b),
('f53dhosua29qeru41r2ergcasq2fi63j', '183.62.246.194', 1618370350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383336373531353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333637343632223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383337303335303b),
('fcr9chukoabsukl1fqd9e7lv6pcfsjev', '203.119.241.226', 1616651055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635313035353b),
('fo03kjess777sodrnl25148lh7sv97bc', '183.62.246.194', 1616736307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363733363130343b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363637333134223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fokahevlbt35g2pj62kbcn8ncrsl5n46', '183.62.246.194', 1616754042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735333538333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735333538333b),
('fpn4nppa50sqd9t7lrm76qsupgmuh8q0', '183.82.62.34', 1619861342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393836313332383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363139383630323737223b6c6173745f69707c733a31333a223130332e32342e3132362e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('g3lneuc4nvsrl3fq55oeljt2cq9uf8ig', '183.62.246.194', 1616740978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363734303233333b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363637333134223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('g5bbiu6sbt5h00r4sbpf4sds5810a3r0', '151.250.222.10', 1617943456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373934333335323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303937373836223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('g7r833buulnfsihi85aucgg6202jqvar', '183.62.246.194', 1618898546, 0x7265717565737465645f706167657c733a31393a2261646d696e2f706f732f766965772f31312f31223b5f5f63695f6c6173745f726567656e65726174657c693a313631383839383236383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383238383339223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313631383839383534363b),
('g9nbd8q4ej1r1fseu7hsr6mtqmo6mcqi', '1.38.153.184', 1616758895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735383437383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373538333732223b6c6173745f69707c733a31323a22312e33382e3135332e313834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735383639363b),
('gbmfvhi1992b0gh37hbu6i18faqmklpv', '2.217.234.254', 1615158971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353135383835303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363134393639313136223b6c6173745f69707c733a31343a223138382e3132332e3136302e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('glpb3qd3mc9fsjai1n78sl78hmi3p6ch', '27.106.82.19', 1618247157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383234373135373b),
('goj51emmniq3pp55ubqsbdv6goldikcl', '183.62.246.194', 1616750454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735303435343b),
('gr3mu1htpacvmrr921daq3m3f6s3rhap', '61.141.73.84', 1616824296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363832343238373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363832343239363b),
('gscvtuv290tb359bg1bavm03a4i1dvb1', '27.106.82.19', 1618337455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383333373435353b),
('gtijdkkr8rd472s41ihm7g46b1dm6c8q', '27.106.82.6', 1618403669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383430333636393b),
('h06c7keujehatj4dfgdp363at4h0j5hl', '61.141.73.84', 1616831951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363833313935313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383135373731223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363833313538313b),
('h1ne2fis1aho91gteoif3c5qjlknvcb4', '183.62.246.194', 1618898597, 0x7265717565737465645f706167657c733a31393a2261646d696e2f706f732f766965772f31312f31223b5f5f63695f6c6173745f726567656e65726174657c693a313631383839383538373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383238383339223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313631383839383539373b),
('h22foa7mjne8tmaru2cj8u8d2ij44bqk', '27.106.82.1', 1618330070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332393937353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333238383830223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383333303033333b6572726f727c4e3b),
('hbeh49bmj4nct6td2aaje9rt5g5n14jm', '103.129.97.229', 1617955714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373935353731343b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('hd0tsfbk3jmqsqlrrcg4r8uj6tjhqa95', '183.62.246.194', 1616667089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363636373030373b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136363535343338223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hkcc57jvp8mh783h07vm4m6lh6g4erpe', '27.106.82.18', 1620324363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632303332343036373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363230333233353236223b6c6173745f69707c733a31323a2232372e3130362e38322e3138223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313632303332343130353b6572726f727c4e3b),
('hnshaoaoe08sq2kngb42asjq22d373g9', '1.38.153.184', 1616749674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363734383030353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373336313132223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363734383131353b),
('hohqg2t1sicc0g8m6sgl8cnq2r8qpoj9', '61.141.73.84', 1616811862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831313836323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323634223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('hrre5r17314c9pcjlm0fopgn6agneeqg', '188.123.160.63', 1614972729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343937323732393b7265717565737465645f706167657c733a33333a2261646d696e2f73797374656d5f73657474696e67732f757365725f67726f757073223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363134393638343531223b6c6173745f69707c733a31343a223138382e3132332e3136302e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631343936393939353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b72656d6f76655f706f736c737c693a313b757365725f637372667c733a32303a22766244743464464d567352374a42635761364870223b72656d6f76655f746f6c737c693a313b),
('i9bv5knt9d3f5agmbd4983qv2ulot861', '61.141.73.84', 1616825063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363832343936323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363832353036333b),
('ic7jddka06gjiuqiqtr4ik2bh2alt719', '45.117.100.45', 1618295140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239353134303b),
('ied8v8tvfn7a0et47vq1ntn41qjnjaiv', '183.62.246.194', 1618829121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383832383832333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383139373937223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383832393132313b6572726f727c4e3b),
('iob4q4f2tj4f8hhd2u6m5qci6sevt2uv', '183.62.246.194', 1618286699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383238363535383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323530373637223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jbvffbsjbt1pqqe76pugod09s2a8d7pl', '183.62.246.194', 1618387135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383338373036353b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333835373830223b6c6173745f69707c733a31333a223132312e33352e3130332e3339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383338373133353b),
('jgqmm7a1gv1l726me34e1l952s4ft7ib', '183.62.246.194', 1616754873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735343531373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735343236353b),
('ji52t6egilgc1lf1fde3j1mg2c9tluii', '121.35.103.244', 1618540956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383534303832363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138343731343634223b6c6173745f69707c733a31333a223132312e33352e3130332e3339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383534303935353b),
('jndrmqakh3k0uukvu6rdoafl6bomv042', '122.175.15.65', 1615886743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838363434323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353838353536363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('jtv4vfj7d5h4f222fhqmj336dhaicar4', '61.141.73.84', 1616826380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363832363135393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383135373731223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('ju5a45nmpq6rf3r1kproo0gt44iitgie', '61.141.73.84', 1616817310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831373331303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363831373031333b),
('k3kdvpg5b44bc907fe2qqiekf74a8sln', '119.123.73.228', 1617009078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030393036393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303031313935223b6c6173745f69707c733a31343a223131392e3132332e37332e323238223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030393037383b),
('k5lfdenkqgbjovq33ugsnppe15j7sohk', '42.107.137.140', 1616482799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363438323535353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135383834313837223b6c6173745f69707c733a31333a223132322e3137352e31352e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226e56323865496f427333474e5778694c5a644b53223b),
('k7htj2s76akeo1ddtiqcujsci46l853k', '103.129.97.229', 1617943433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373934333433333b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('k9h8uq3tdlc6i8an3jkvniumf3oane03', '27.106.82.19', 1616927501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363932373530313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393236393030223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363932373332353b),
('ka1ei5boeac86tb9jhtr5hg329o1lk06', '175.100.20.192', 1619009799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393030393735393b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('kiaid1qspr36je5161jpeuqmg7r45tm3', '61.141.73.84', 1616817381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831373333343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363831373338313b),
('kiotf8pvcibp7dfjpg0dfk7b9sk63bis', '203.119.241.82', 1616651056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363635313035363b),
('kkhtlvh8mi9u2f05n96ki6c786ro3u2o', '27.106.82.18', 1620323606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632303332333533353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363230333233353236223b6c6173745f69707c733a31323a2232372e3130362e38322e3138223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313632303332333630353b),
('kku92u0dg10qhnqo6gkhv8re4s606llj', '119.123.74.129', 1617090253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373039303235333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303839343133223b6c6173745f69707c733a31343a223131392e3132332e37342e313239223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373038393637393b),
('kppheibbgc8mk25ntv1881sobccot14s', '183.62.246.194', 1617168563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373136383536303b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('ksk5ivi356vuptibr7a1fokjmvs4om00', '183.62.246.194', 1618469253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383436393235303b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138343632393130223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383436393235333b),
('ksvjif23d5h2avtl5992389181t7bi35', '103.129.97.229', 1614969874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393837343b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('kv1guclg21dcj0ar4skkvt3td4imahc2', '103.129.97.229', 1616736291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363733363239313b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('l4f5f79eiogmfb9cvp1ldec93rfllmri', '183.62.246.194', 1617084947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373038343733313b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303039303038223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373038343934373b),
('l586sekas9dpqbr2738ja4ql6j7g4bsq', '2.217.234.254', 1615204825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353230343830393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135313538383633223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353230343830393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('l9h6graaddeas5is2rkp9oibbc2811tq', '121.35.103.39', 1618471946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383437313934363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138343638393235223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383437313438303b),
('ll6etll0bm97v8u2ca7urlim3tfb4t30', '183.62.246.194', 1617007036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030363538383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303034303330223b6c6173745f69707c733a31343a223131392e3132332e37332e323238223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030373033363b),
('ln3h3fqerupgmibaoo7ioo1gbaelfg1k', '183.62.246.194', 1618819995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383831393738353b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138383137343630223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383831393939353b),
('metcbqlohu6pq9997923d26nehb619jt', '183.62.246.194', 1618821194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383832313137353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138353536383533223b6c6173745f69707c733a31353a223139372e3233312e3230312e323033223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383832313139343b6572726f727c4e3b),
('mf8fcmvq9guddnht17oqffasgpugct3k', '183.62.246.194', 1616810284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831303234353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130303834223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363831303238343b),
('msrt703q0gdmtivfg78pn7qlvbdcq51d', '183.62.246.194', 1619424938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393432343933363b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('mtgl19gqnj32p12pv9icvu62k8b9v9lt', '212.154.30.36', 1617943363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373934333336333b),
('mv1kamg3o4s6upgj7p2qijotc0o4a4u6', '183.62.246.194', 1618369196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383336393136343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333638353431223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383336393139353b),
('n1lhfumosjjl845snale4l9n1rgl9212', '27.106.82.19', 1618337464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383333373239323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333239393837223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383333373037313b6572726f727c4e3b),
('nd42j0er3ld2hoi7n4h5iijjdfg3fpaf', '82.212.123.91', 1615929184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932393138343b),
('nev7tciq9j0nah9f9djj0l9na7k6r7d8', '13.66.139.105', 1616873034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363837333033343b),
('ni00fqj9tvekfu2137hbkep1dcimkllq', '122.175.15.65', 1615886431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838363130353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353838353536363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('ntn6l1pngs1kqp02ktpbb2ovl02oi2lp', '103.24.126.65', 1619860277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393836303235373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363139383539343031223b6c6173745f69707c733a31323a2232372e3130362e38322e3138223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('o9nlpjo1h6c14v7ukn1bli6vs5m7pplk', '61.141.73.84', 1616827587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363832373332363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383135373731223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363832373538373b),
('oahlphahl2ga8d6jrhbtmi0jumbki9hm', '61.141.73.84', 1616833683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363833333538363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383236333739223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363833333638333b),
('of9a2v1rmv4lo9d8m3svc4j8m3dednr3', '113.193.51.85', 1619946424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393934363432343b),
('ota0st2tjbb6a4idl18hm3vlvre5ifma', '27.106.82.1', 1618324805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332343538333b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333137373236223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383332343830353b6572726f727c4e3b),
('p2r0sul04a59774f6vgvrp3qko2krm77', '183.62.246.194', 1618387052, 0x7265717565737465645f706167657c733a31393a2261646d696e2f706f732f766965772f31312f31223b5f5f63695f6c6173745f726567656e65726174657c693a313631383338373035313b),
('p5mj8rktp44r7kpih8sp0i46lklfkffs', '61.141.73.84', 1616811939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363831313933323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136383130323831223b6c6173745f69707c733a31323a2236312e3134312e37332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('pch2k4ta7qhl4ft16duakac78h6camci', '42.107.137.140', 1616483989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363438333938393b),
('pf3eb418osm6e1si0n6tsciv2qq2b20d', '183.62.246.194', 1618817559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383831373434383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138353536383533223b6c6173745f69707c733a31353a223139372e3233312e3230312e323033223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383831373535393b6572726f727c4e3b),
('pindsbvhnesr80iqttemf23e28v4rsfp', '183.62.246.194', 1618462920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383436323930313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333837303738223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383436323931393b),
('pj4q6favtj4dpmeb9fn2m59beiteu95b', '27.106.82.1', 1618328950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383332383836353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333235313431223b6c6173745f69707c733a31313a2232372e3130362e38322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383332383932313b6572726f727c4e3b),
('pkb4vgflthoc36e6doeq927ut0el7q6b', '103.129.97.229', 1614969691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343936393639313b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('pnp78b1dp4nfk68786rjhfp8h5vb9m3i', '183.62.246.194', 1617005865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030353836333b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('pr72iriehiqt8vqff6510plfk6j4avlk', '121.35.103.39', 1618387318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383338373330313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333639313836223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313631383338373331383b),
('qd5fcm56gmjbslhsfmal1rjq2f062vgf', '27.106.82.18', 1620324370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632303332343337303b),
('quedhqlahop7kbkjkmahju2oaji0aito', '119.123.73.228', 1617010095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373031303036363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303031313935223b6c6173745f69707c733a31343a223131392e3132332e37332e323238223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373031303039353b),
('s15fs5b9j1nvut95p2km39e5eanbpl85', '103.24.126.65', 1619861336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631393836313331353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363139383539343031223b6c6173745f69707c733a31323a2232372e3130362e38322e3138223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631393836313332333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('sagcrrvcr3rvorfftjlrcv3id7r3ojhj', '45.117.100.45', 1618296607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383239363433303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138323836353934223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383239363630373b6572726f727c4e3b),
('slq3p8v92aaq70ejc4ugbv6n240lu4db', '121.35.103.39', 1618385853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383338353638343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138333639313836223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313631383338353835333b),
('st9vqrffm83s93kj09kujbl2a10qh69i', '27.106.82.19', 1616928900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363932383839393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393236393030223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363932383930303b),
('t1ak0e723bi06rokii5b1e50kmi3coe1', '42.106.194.51', 1616763390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363736333338353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373632303634223b6c6173745f69707c733a31323a2236362e34322e37342e313534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('t43ud5sck42p1djtvrqeovsf87hu7hnj', '27.106.82.19', 1618250838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383235303833383b),
('t74r8brao4efbnc67lfopv2suf6g2eqr', '122.175.15.65', 1615885616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838353631363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363135323034343830223b6c6173745f69707c733a31333a22322e3231372e3233342e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631353838353536363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223636362e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30342d30342031373a31343a3431223b),
('tamj40r8p94bp41lspe9q2i30lb4h8pj', '27.106.82.19', 1616927325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363932373035343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136393236393030223b6c6173745f69707c733a31323a2232372e3130362e38322e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363932373332353b),
('uc67klgt2ufmglh1270ntojkpclj5p8i', '183.62.246.194', 1618818803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383831383637373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363138353536383533223b6c6173745f69707c733a31353a223139372e3233312e3230312e323033223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631383831383830333b6572726f727c4e3b),
('udr7bs9vl59tmmaaad2pu3r8mcjd21f6', '119.123.73.228', 1617007454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030343032363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303031313935223b6c6173745f69707c733a31343a223131392e3132332e37332e323238223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030373435333b),
('uf8ujnlf8h1j7l7np3g7uiocp5ol33h1', '2.217.234.254', 1615277684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353237373638323b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('uh1vkhi5fd7q61r4kicloc6bn99vhvg9', '42.106.194.51', 1616764770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363736343737303b),
('ujh5n75hpd222ia6s7jh2lc738ugmh09', '183.62.246.194', 1617007736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373030373038313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303034303330223b6c6173745f69707c733a31343a223131392e3132332e37332e323238223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631373030373233313b),
('usfatdcfmv442lijitio7iv9mo9hp3b4', '27.106.82.19', 1618380479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383338303231333b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('v3kg68tl32a8lbhjhrpbsi1s799p3e6e', '66.42.74.154', 1616762207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363736323033313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373538353138223b6c6173745f69707c733a31323a22312e33382e3135332e313834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363736323230373b),
('vbfj97ngudm4rq2hm1fikqfgiolrsh6s', '103.129.97.229', 1617956217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373935363231373b6572726f727c733a3138313a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d6963726f646f742e696e2f64656d6f2f736d61706f732f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('viaa2usj5037nsjikj082c52ar0uhjec', '27.106.82.19', 1617098042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373039373737383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303935393630223b6c6173745f69707c733a31343a223131372e3133362e33312e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2245673173556e414e7663654f3344484c75567064223b),
('vlpkctoj9d93n1np0u8r18roagnc79sk', '183.62.246.194', 1616753285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735333137323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735323131333b),
('vmpn8bferfit5gjnb2j55akfla5nbs8u', '119.123.74.129', 1617089810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631373038393739313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363137303834373439223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313631373038393831303b),
('vp4jvsfkjq4u6p4e7fn56411vhpbva8d', '183.62.246.194', 1616752818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363735323131313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363136373531303933223b6c6173745f69707c733a31343a223138332e36322e3234362e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313631363735323131333b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`) VALUES
(1, 'Digiflynt_Logo3.jpeg', 'Digiflynt_Logo4.jpeg', 'DigyFlynt', 'english', 1, 0, 'USD', 1, 10, '3.3.1', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Riyadh', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.abcd.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@abcd.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, '', '', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'JD', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, NULL, 'dompdf');

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2020-10-09 09:20:00', '', 1, 'full', '6fb8dac2375417fbb089a94da5d57ef6.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, '2020-10-11 17:46:00', '', 1, 'partial', '0334b2b46d18689b9363fa83b0a711f8.csv', NULL, '1', 'HP', '1', 'LAPTOP', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(3, '2020-10-29 07:43:00', '', 1, 'full', '3063adcfa3b08f55910815a8fb5058a4.csv', NULL, '', '', '', '', NULL, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(4, '2020-10-31 06:59:00', '', 1, 'full', 'c542c6a756d371e2b3583c604a627ecd.csv', NULL, '', '', '', '', NULL, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(5, '2020-11-02 09:42:00', '', 1, 'full', 'b5457f8691242deeccbc252c8a68ea34.csv', NULL, '', '', '', '', NULL, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(6, '2021-02-25 09:44:00', '', 1, 'full', 'deee0420d76556569b6b3c25cc4e0590.csv', NULL, '', '', '', '', NULL, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(7, '2021-03-16 07:18:00', '', 1, 'full', 'f50e6c6362ea7d2fb2c871f817b6e02c.csv', NULL, '', '', '', '', NULL, 5, 5, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', 0.0000, '2'),
(2, 'VAT @10%', 'VAT10', 10.0000, '1'),
(3, 'GST @6%', 'GST', 6.0000, '1'),
(4, 'VAT @20%', 'VT20', 20.0000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_transfers`
--

INSERT INTO `sma_transfers` (`id`, `transfer_no`, `date`, `from_warehouse_id`, `from_warehouse_code`, `from_warehouse_name`, `to_warehouse_id`, `to_warehouse_code`, `to_warehouse_name`, `note`, `total`, `total_tax`, `grand_total`, `created_by`, `status`, `shipping`, `attachment`, `cgst`, `sgst`, `igst`) VALUES
(1, 'TR/2021/03/0001', '2021-03-05 15:16:00', 1, 'WHI', 'Warehouse 1', 2, 'WHII', 'Warehouse 2', '', 5369.0000, 0.0000, 5369.0000, '1', 'completed', 0.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'PCS', 'PCS', NULL, NULL, NULL, NULL),
(2, 'DZ', 'DOZON', 1, '*', NULL, '12'),
(3, 'HD', 'HALF DOZON', 1, '*', NULL, '6');

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x32372e3130362e38322e3138, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'admin@admin.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1620323551, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x3131332e3139332e3132342e3835, 0x3131332e3139332e3132342e3835, 'user', '8d82d6258d9c650f7eb921b28a10a915b657a704', NULL, 'user@demo.com', NULL, NULL, NULL, NULL, 1599999565, 1599999587, 1, 'user', 'demo', 'Demo Company', '9876543210', NULL, 'male', 5, 1, 3, NULL, 0, 0, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(86, 1, NULL, 0x3131312e39312e37352e313638, 'owner', '2021-02-22 11:48:38'),
(87, 1, NULL, 0x3131312e39312e38302e3636, 'owner', '2021-02-23 08:10:50'),
(88, 1, NULL, 0x32372e33342e3130342e313935, 'owner', '2021-02-23 10:04:42'),
(89, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-25 10:35:19'),
(90, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-25 11:06:12'),
(91, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-26 04:50:36'),
(92, 1, NULL, 0x34392e33362e3234332e3738, 'owner', '2021-02-26 04:57:56'),
(93, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-26 08:59:00'),
(94, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-26 11:31:46'),
(95, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-26 11:39:39'),
(96, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-02-27 05:27:02'),
(97, 1, NULL, 0x3130332e37332e33352e323238, 'owner', '2021-02-28 06:22:21'),
(98, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-03-01 04:17:42'),
(99, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-03-01 08:54:30'),
(100, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-03-01 11:11:45'),
(101, 1, NULL, 0x3131312e39312e31352e3633, 'owner', '2021-03-02 08:49:31'),
(102, 1, NULL, 0x3130332e3133372e38352e313635, 'owner', '2021-03-03 05:55:33'),
(103, 1, NULL, 0x3135372e33382e35342e323238, 'Owner', '2021-03-03 06:00:02'),
(104, 1, NULL, 0x312e33382e3233392e3634, 'owner', '2021-03-03 08:03:26'),
(105, 1, NULL, 0x34312e3131352e3131352e313436, 'Owner', '2021-03-03 14:59:31'),
(106, 1, NULL, 0x3135372e33382e35352e313037, 'Owner', '2021-03-04 05:15:21'),
(107, 1, NULL, 0x3138382e3132332e3136302e3633, 'Owner', '2021-03-05 14:27:10'),
(108, 1, NULL, 0x3138382e3132332e3136302e3633, 'Owner', '2021-03-05 14:37:44'),
(109, 1, NULL, 0x3138382e3132332e3136302e3633, 'Owner', '2021-03-05 18:20:51'),
(110, 1, NULL, 0x3138382e3132332e3136302e3633, 'Owner', '2021-03-05 18:31:56'),
(111, 1, NULL, 0x322e3231372e3233342e323534, 'owner', '2021-03-07 23:14:25'),
(112, 1, NULL, 0x322e3231372e3233342e323534, 'owner', '2021-03-08 11:54:40'),
(113, 1, NULL, 0x3132322e3137352e31352e3635, 'owner', '2021-03-16 08:43:07'),
(114, 1, NULL, 0x34322e3130372e3133372e313430, 'owner', '2021-03-23 06:50:06'),
(115, 1, NULL, 0x34312e3131352e35322e323138, 'Owner', '2021-03-24 13:19:01'),
(116, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-03-25 05:22:44'),
(117, 1, NULL, 0x3138332e36322e3234362e313934, 'Owner', '2021-03-25 06:32:49'),
(118, 1, NULL, 0x3232332e3130342e312e3937, 'owner', '2021-03-25 06:33:21'),
(119, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-25 06:48:22'),
(120, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-25 06:57:18'),
(121, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-25 10:10:22'),
(122, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-25 10:15:14'),
(123, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-26 05:21:52'),
(124, 1, NULL, 0x312e33382e3135332e313834, 'owner', '2021-03-26 08:40:16'),
(125, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-26 09:27:28'),
(126, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-26 09:31:33'),
(127, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-26 09:34:10'),
(128, 1, NULL, 0x312e33382e3135332e313834, 'owner', '2021-03-26 11:32:52'),
(129, 1, NULL, 0x312e33382e3135332e313834, 'owner', '2021-03-26 11:35:18'),
(130, 1, NULL, 0x36362e34322e37342e313534, 'owner', '2021-03-26 12:34:24'),
(131, 1, NULL, 0x34322e3130362e3139342e3531, 'owner', '2021-03-26 12:56:25'),
(132, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 01:45:47'),
(133, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 01:48:21'),
(134, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 01:49:22'),
(135, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 01:54:45'),
(136, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 01:57:44'),
(137, 1, NULL, 0x36312e3134312e37332e3834, 'owner', '2021-03-27 01:58:01'),
(138, 1, NULL, 0x36312e3134312e37332e3834, 'owner', '2021-03-27 02:25:38'),
(139, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 02:57:42'),
(140, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 03:29:32'),
(141, 1, NULL, 0x36312e3134312e37332e3834, 'owner', '2021-03-27 06:26:19'),
(142, 1, NULL, 0x36312e3134312e37332e3834, 'owner', '2021-03-27 08:04:05'),
(143, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-27 09:04:37'),
(144, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-03-28 10:21:40'),
(145, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-03-28 10:24:21'),
(146, 1, NULL, 0x3131392e3132332e37332e323238, 'owner', '2021-03-29 06:59:55'),
(147, 1, NULL, 0x3131392e3132332e37332e323238, 'owner', '2021-03-29 07:47:10'),
(148, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-29 08:30:16'),
(149, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-29 09:10:08'),
(150, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-30 06:12:29'),
(151, 1, NULL, 0x3131392e3132332e37342e313239, 'owner', '2021-03-30 07:30:13'),
(152, 1, NULL, 0x3131392e3132332e37342e313239, 'owner', '2021-03-30 07:34:07'),
(153, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-03-30 09:02:08'),
(154, 1, NULL, 0x3131372e3133362e33312e323232, 'owner', '2021-03-30 09:19:20'),
(155, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-03-30 09:49:46'),
(156, 1, NULL, 0x3135312e3235302e3232322e3130, 'owner', '2021-04-09 04:42:44'),
(157, 1, NULL, 0x3135312e3235302e3232322e3130, 'owner', '2021-04-09 08:07:41'),
(158, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-04-12 18:06:07'),
(159, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-13 04:03:14'),
(160, 1, NULL, 0x34352e3131372e3130302e3435, 'owner', '2021-04-13 06:33:05'),
(161, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-13 06:34:46'),
(162, 1, NULL, 0x32372e3130362e38322e31, 'owner', '2021-04-13 12:39:50'),
(163, 1, NULL, 0x32372e3130362e38322e31, 'owner', '2021-04-13 12:42:06'),
(164, 1, NULL, 0x32372e3130362e38322e31, 'owner', '2021-04-13 14:28:11'),
(165, 1, NULL, 0x32372e3130362e38322e31, 'owner', '2021-04-13 14:45:41'),
(166, 1, NULL, 0x32372e3130362e38322e31, 'owner', '2021-04-13 15:48:00'),
(167, 1, NULL, 0x32372e3130362e38322e31, 'owner', '2021-04-13 16:06:27'),
(168, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-04-13 18:03:17'),
(169, 1, NULL, 0x32372e3130362e38322e3139, 'owner', '2021-04-13 18:10:09'),
(170, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-14 02:31:02'),
(171, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-14 02:32:18'),
(172, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-14 02:49:03'),
(173, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-14 02:59:46'),
(174, 1, NULL, 0x3132312e33352e3130332e3339, 'owner', '2021-04-14 07:36:20'),
(175, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-14 07:57:58'),
(176, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-15 05:01:50'),
(177, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-15 06:42:05'),
(178, 1, NULL, 0x3132312e33352e3130332e3339, 'owner', '2021-04-15 07:24:24'),
(179, 1, NULL, 0x3132312e33352e3130332e323434, 'owner', '2021-04-16 02:41:41'),
(180, 1, NULL, 0x3139372e3233312e3230312e323033, 'owner', '2021-04-16 07:07:33'),
(181, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-19 07:31:00'),
(182, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-19 08:09:57'),
(183, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-19 10:40:39'),
(184, 1, NULL, 0x3138332e36322e3234362e313934, 'owner', '2021-04-20 05:58:03'),
(185, 1, NULL, 0x3139392e38332e3136332e323331, 'owner', '2021-04-28 22:17:43'),
(186, 1, NULL, 0x332e3232312e3135352e313437, 'owner', '2021-05-01 03:18:56'),
(187, 1, NULL, 0x32372e3130362e38322e3138, 'owner', '2021-05-01 08:56:41'),
(188, 1, NULL, 0x3130332e32342e3132362e3635, 'owner', '2021-05-01 09:11:17'),
(189, 1, NULL, 0x3138332e38322e36322e3334, 'owner', '2021-05-01 09:29:02'),
(190, 1, NULL, 0x32372e3130362e38322e3138, 'owner', '2021-05-06 17:39:55'),
(191, 1, NULL, 0x32372e3130362e38322e3138, 'owner', '2021-05-06 17:52:06'),
(192, 1, NULL, 0x32372e3130362e38322e3138, 'owner', '2021-05-06 17:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, 'GODREJ');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@abcd.com', NULL),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@abcd.com', NULL),
(3, 'RC01', 'RCWH', 'MUMBAI ', NULL, '', '1234567890', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, 107.0000, 'R1', 50000.0000),
(2, 1, 2, 199.0000, 'R2', 50000.0000),
(3, 2, 1, 0.0000, NULL, 10000.0000),
(4, 2, 2, 0.0000, NULL, 10000.0000),
(5, 10, 1, 0.0000, NULL, 35000.0000),
(6, 18, 1, 0.0000, NULL, 59.0000),
(7, 18, 2, 111.0000, NULL, 59.0000),
(8, 18, 3, 30.0000, NULL, 59.0000),
(9, 19, 1, 990.0000, 'B1', 1000.0000),
(10, 19, 3, 10.0000, '1', 1000.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
