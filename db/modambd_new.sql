-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2024 at 11:12 PM
-- Server version: 8.0.32
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modambd_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_heads`
--

CREATE TABLE `account_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_heads`
--

INSERT INTO `account_heads` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Product Purchase', 'product-purchase', 1, '2022-06-22 03:49:01', '2023-12-06 23:06:00'),
(2, 'Product Sell', 'product-sell', 1, '2020-07-28 13:09:05', '2020-07-28 13:09:05'),
(3, 'Product Return', 'product-return', 1, '2021-09-14 05:59:26', '2021-09-14 05:59:26'),
(4, 'Cash Fund', 'cash-fund', 1, '2021-08-26 17:18:26', '2021-08-26 17:18:26'),
(6, 'Transport Cost', 'transport-cost', 1, '2020-09-04 11:51:38', '2020-09-04 11:51:38'),
(7, 'House rent', 'house-rent', 1, '2021-07-02 21:26:46', '2021-07-02 21:26:46'),
(8, 'Electricity Bill', 'electricity-bill', 1, '2021-07-04 23:54:29', '2021-07-04 23:54:29'),
(9, 'Courier Charge', 'courier-charge', 1, '2021-07-04 23:55:15', '2021-07-04 23:55:15'),
(10, 'Refreshment', 'refreshment', 1, '2021-07-04 23:55:34', '2021-07-04 23:55:34'),
(11, 'Market Bill', 'market-bill', 1, '2021-07-04 23:55:44', '2021-07-04 23:55:44'),
(12, 'Purchase Materials', 'purchase-materials', 1, '2021-07-04 23:56:08', '2021-07-04 23:56:08'),
(13, 'Packaging Cost', 'packaging-cost', 1, '2021-07-11 06:08:00', '2021-07-11 06:08:00'),
(14, 'Repair Materials', 'repair-materials', 1, '2021-07-11 06:08:55', '2021-07-11 06:08:55'),
(15, 'Damage/Loss', 'damage/loss', 1, '2021-07-19 08:34:00', '2022-10-16 01:45:54'),
(16, 'Web maintenance', 'web-maintenance', 1, '2021-07-19 08:34:34', '2021-07-19 08:34:34'),
(17, 'Others', 'others', 1, '2021-08-26 17:18:26', '2021-08-26 17:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `account_ledgers`
--

CREATE TABLE `account_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `account_head_id` bigint UNSIGNED NOT NULL,
  `particulars` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `type` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Debit, 2=>Credit',
  `order_id` bigint NOT NULL DEFAULT '0',
  `product_id` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_ledgers`
--

INSERT INTO `account_ledgers` (`id`, `account_head_id`, `particulars`, `debit`, `credit`, `balance`, `type`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Robert Wine Handmade Leather Brogue Shoes', 30000, 0, -60000, 1, 0, 1, '2024-04-29 04:59:12', '2024-04-29 04:59:21'),
(2, 1, 'Handbag for women made of genuine leather black', 13000, 0, -13000, 1, 0, 2, '2024-04-29 05:16:27', '2024-04-29 05:16:27'),
(3, 1, 'Importated Leather Ladis bag', 10000, 0, -10000, 1, 0, 3, '2024-04-29 05:19:22', '2024-04-29 05:19:22'),
(4, 1, 'Leather Black Pattern Hanging Bag', 18000, 0, -18000, 1, 0, 4, '2024-04-29 05:31:45', '2024-04-29 05:31:45'),
(5, 1, 'Classic Bifold Wallet, Women Leather Wallet', 7200, 0, -7200, 1, 0, 5, '2024-04-29 05:33:57', '2024-04-29 05:33:57'),
(6, 1, 'Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col', 7000, 0, -7000, 1, 0, 6, '2024-04-29 05:43:13', '2024-04-29 05:43:13'),
(7, 1, 'Womens Wallets Online', 7200, 0, -7200, 1, 0, 7, '2024-04-29 05:47:59', '2024-04-29 05:47:59'),
(8, 1, 'Shop Real Leather Accessories', 20000, 0, -20000, 1, 0, 8, '2024-04-29 05:58:07', '2024-04-29 05:58:07'),
(9, 1, 'Complete combo for men', 15000, 0, -15000, 1, 0, 9, '2024-04-29 06:12:53', '2024-04-29 06:12:53'),
(10, 1, 'For Home Brown Leather Floor Carpet', 14500, 0, -14500, 1, 0, 10, '2024-04-29 06:15:26', '2024-04-29 06:15:26'),
(11, 1, 'Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown', 33000, 0, -33000, 1, 0, 11, '2024-04-29 06:17:23', '2024-04-29 06:17:23'),
(12, 1, 'Leather Trolley Bag, carry on luggage with wheels', 52500, 0, -52500, 1, 0, 12, '2024-04-29 06:19:33', '2024-04-29 06:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upazilla_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `upazilla_id` int DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Default, 0=>Not Default',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advance_payments`
--

CREATE TABLE `advance_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `advance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `received` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Color', 1, 4, '2022-08-27 00:14:35', '2022-08-27 00:14:35'),
(5, 'Size', 1, 4, '2022-08-27 00:16:20', '2022-08-27 00:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(28, 4, 'Red', 1, 4, '2022-08-27 00:15:32', '2022-08-27 00:15:32'),
(29, 4, 'White', 1, 4, '2022-08-27 00:15:36', '2022-08-27 00:15:36'),
(30, 4, 'Green', 1, 4, '2022-08-27 00:15:48', '2022-08-27 00:15:48'),
(31, 4, 'Yellow', 1, 4, '2022-08-27 00:16:00', '2022-08-27 00:16:00'),
(32, 5, 'S', 1, 4, '2022-08-27 00:16:27', '2022-08-27 00:16:27'),
(33, 5, 'M', 1, 4, '2022-08-27 00:16:30', '2022-08-27 00:16:30'),
(34, 5, 'L', 1, 4, '2022-08-27 00:16:32', '2022-08-27 00:16:32'),
(35, 5, 'XL', 1, 4, '2022-08-27 00:16:35', '2022-08-27 00:16:35'),
(36, 5, 'XXl', 1, 4, '2022-08-27 00:16:44', '2022-08-27 00:16:44'),
(48, 4, 'Black', 1, 4, '2024-03-28 12:38:36', '2024-03-28 12:38:36'),
(49, 4, 'Pink', 1, 4, '2024-03-29 05:34:50', '2024-03-29 05:34:50'),
(50, 4, 'Blue', 1, 4, '2024-03-29 05:35:20', '2024-03-29 05:35:20'),
(52, 4, 'Purple', 1, 4, '2024-03-29 05:35:27', '2024-03-29 05:35:27'),
(53, 4, 'Lavender', 1, 4, '2024-03-29 05:35:30', '2024-03-29 05:35:30'),
(54, 4, 'Orange', 1, 4, '2024-03-29 05:35:39', '2024-03-29 05:35:39'),
(55, 4, 'Sky', 1, 4, '2024-03-29 05:36:12', '2024-03-29 05:36:12'),
(56, 4, 'Ash', 1, 4, '2024-03-29 05:36:21', '2024-03-29 05:36:21'),
(58, 4, 'Off white', 1, 4, '2024-03-29 05:38:09', '2024-03-29 05:38:09'),
(59, 4, 'Dark blue', 1, 4, '2024-03-29 05:38:24', '2024-03-29 05:38:24'),
(60, 4, 'Dark green', 1, 4, '2024-03-29 05:38:30', '2024-03-29 05:38:30'),
(61, 4, 'Light blue', 1, 4, '2024-03-29 05:38:36', '2024-03-29 05:38:36'),
(62, 4, 'Light green', 1, 4, '2024-03-29 05:38:40', '2024-03-29 05:38:40'),
(63, 4, 'Light pink', 1, 4, '2024-03-29 05:38:45', '2024-03-29 05:38:45'),
(64, 4, 'Dark pink', 1, 4, '2024-03-29 05:38:50', '2024-03-29 05:38:50'),
(65, 4, 'Mauve pink', 1, 4, '2024-03-29 05:38:56', '2024-03-29 05:38:56'),
(66, 4, 'Silver', 1, 4, '2024-03-29 05:39:23', '2024-03-29 05:39:23'),
(67, 4, 'Golden', 1, 4, '2024-03-29 05:39:27', '2024-03-29 05:39:27'),
(68, 4, 'Pest', 1, 4, '2024-03-29 05:39:40', '2024-03-29 05:39:40'),
(69, 4, 'Maroon', 1, 4, '2024-03-29 05:39:52', '2024-03-29 05:39:52'),
(70, 4, 'Skin', 1, 4, '2024-03-29 05:40:16', '2024-03-29 05:40:16'),
(71, 4, 'Brown', 1, 4, '2024-03-29 05:40:27', '2024-03-29 05:40:27'),
(72, 4, 'Multi', 1, 4, '2024-04-09 07:21:40', '2024-04-09 07:21:40'),
(73, 4, 'Olive', 1, 4, '2024-04-09 07:21:45', '2024-04-09 07:21:45'),
(74, 4, 'Coffee', 1, 4, '2024-04-09 07:21:50', '2024-04-09 07:21:50'),
(75, 4, 'Brown', 1, 4, '2024-04-09 07:21:54', '2024-04-09 07:21:54'),
(76, 4, 'Navy blue', 1, 4, '2024-04-09 07:22:05', '2024-04-09 07:22:05'),
(77, 4, 'Hot pink', 1, 4, '2024-04-09 07:22:09', '2024-04-09 07:22:09'),
(78, 4, 'Mauve pink', 1, 4, '2024-04-09 07:22:13', '2024-04-09 07:22:13'),
(79, 4, 'Baby pink', 1, 4, '2024-04-09 07:22:17', '2024-04-09 07:22:17'),
(80, 4, 'Peach', 1, 4, '2024-04-09 07:22:35', '2024-04-09 07:22:35'),
(81, 4, 'Light green', 1, 4, '2024-04-09 07:22:44', '2024-04-09 07:22:44'),
(82, 4, 'Dark green', 1, 4, '2024-04-09 07:22:55', '2024-04-09 07:22:55'),
(83, 4, 'Dark pink', 1, 4, '2024-04-09 07:23:01', '2024-04-09 07:23:01'),
(84, 4, 'Megenta', 1, 4, '2024-04-09 07:23:05', '2024-04-09 07:23:05'),
(85, 4, 'Navy blue', 1, 4, '2024-04-09 07:23:12', '2024-04-09 07:23:12'),
(86, 4, 'Bottle green', 1, 4, '2024-04-09 07:23:20', '2024-04-09 07:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value_product_price`
--

CREATE TABLE `attribute_value_product_price` (
  `id` bigint UNSIGNED NOT NULL,
  `product_price_id` bigint UNSIGNED NOT NULL,
  `attribute_value_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=>Home Banner, 0=>Footer Banner',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title_en`, `title_bn`, `banner_img`, `banner_url`, `description_en`, `description_bn`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Banner-1', 'Banner-1', 'upload/banner/1797658922323360.webp', '#', 'Banner-1', 'Banner-1', '1', 1, '2024-04-29 02:59:03', '2024-04-29 03:03:17'),
(2, 'Banner-2', 'Banner-2', 'upload/banner/1797659506554808.webp', '#', 'Banner-2', 'Banner-2', '1', 1, '2024-04-29 03:08:21', '2024-04-29 03:08:21'),
(3, 'Banner-3', 'Banner-3', 'upload/banner/1797659523381565.webp', '#', 'Banner-3', 'Banner-3', '1', 1, '2024-04-29 03:08:37', '2024-04-29 03:08:37'),
(4, 'Banner-4', 'Banner-4', 'upload/banner/1797659540193786.webp', '#', 'Banner-4', 'Banner-4', '1', 1, '2024-04-29 03:08:53', '2024-04-29 03:08:53'),
(5, 'Banner-5', 'Banner-5', 'upload/banner/1797659556970399.webp', '#', 'Banner-5', 'Banner-5', '1', 1, '2024-04-29 03:09:09', '2024-04-29 03:09:09'),
(6, 'Banner-6', 'Banner-6', 'upload/banner/1797659572386310.webp', '#', 'Banner-6', 'Banner-6', '1', 1, '2024-04-29 03:09:23', '2024-04-29 03:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title_en`, `title_bn`, `slug`, `blog_img`, `description`, `status`, `created_at`, `updated_at`) VALUES
(35, 'Hydrating Rosewater Facial Mist:', 'Hydrating Rosewater Facial Mist:', 'hydrating-rosewater-facial-mist', 'upload/blog/1693628947gabrielle-henderson-1DMNn6gBbwQ-unsplash.jpg', '<p><span style=\"color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">Revitalize your skin with our luxurious Rosewater Facial Mist. Enriched with pure rose extracts, this mist delivers a burst of hydration, leaving your skin feeling refreshed and rejuvenated. Whether used as a toner, makeup setting spray, or a quick pick-me-up throughout the day, its delicate rose scent and soothing properties make it a must-have addition to your beauty routine.</span><br></p>', 1, '2023-09-01 22:29:07', '2023-09-01 22:29:07'),
(36, 'Age-Defying Vitamin C Serum:', 'Age-Defying Vitamin C Serum:', 'age-defying-vitamin-c-serum', 'upload/blog/1693629015raphael-lovaski-DEuob2v77wI-unsplash.jpg', '<ol style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Turn back the hands of time with our Age-Defying Vitamin C Serum. Packed with potent antioxidants and collagen-boosting ingredients, this serum helps reduce the appearance of fine lines, wrinkles, and uneven skin tone. The lightweight formula absorbs quickly, delivering a concentrated dose of skin-brightening Vitamin C for a youthful, radiant complexion.</p></li><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"></li></ol>', 1, '2023-09-01 22:30:15', '2023-09-01 22:30:15'),
(37, 'Nourishing Argan Oil Hair Mask:', 'Nourishing Argan Oil Hair Mask:', 'nourishing-argan-oil-hair-mask', 'upload/blog/1693628918element5-digital-ceWgSMd8rvQ-unsplash.jpg', '<ol style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Say goodbye to dry and damaged hair with our Nourishing Argan Oil Hair Mask. Formulated with natural argan oil and nourishing botanicals, this deep conditioning treatment restores hair\'s elasticity, smoothness, and shine. Whether you have frizzy, color-treated, or over-styled hair, our mask provides a spa-like experience that transforms your locks from dull to luxurious.</p></li><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"></li></ol>', 1, '2023-09-01 22:28:38', '2023-09-01 22:28:38'),
(38, 'Soothing Lavender and Chamomile Body Lotion:', 'Soothing Lavender and Chamomile Body Lotion:', 'soothing-lavender-and-chamomile-body-lotion', 'upload/blog/1693628763raphael-lovaski-pxax5WuM7eY-unsplash.jpg', '<ol style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Unwind and relax with our Soothing Lavender and Chamomile Body Lotion. Infused with the calming scents of lavender and chamomile, this lightweight lotion absorbs easily, leaving your skin soft and supple. Perfect for after a bath or before bedtime, its gentle formula moisturizes deeply, helping to alleviate dryness and promote a peaceful night\'s sleep.</p></li><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"></li></ol>', 1, '2023-09-01 22:26:03', '2023-09-01 22:26:03'),
(39, 'Exfoliating Coffee Scrub with Coconut Oil:', 'Exfoliating Coffee Scrub with Coconut Oil:', 'exfoliating-coffee-scrub-with-coconut-oil', 'upload/blog/1693628906camille-brodard-VxAwTeiqDao-unsplash.jpg', '<div class=\"group w-full text-token-text-primary border-b border-black/10 dark:border-gray-900/50 bg-gray-50 dark:bg-[#444654]\" data-testid=\"conversation-turn-3\" style=\"border-bottom: 1px solid rgba(0, 0, 0, 0.1); border-top-style: solid; border-right-style: solid; border-left-style: solid; border-top-color: rgba(0, 0, 0, 0.1); border-right-color: rgba(0, 0, 0, 0.1); border-left-color: rgba(0, 0, 0, 0.1); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; width: 1652px; --tw-bg-opacity: 1; background-color: rgba(247,247,248,var(--tw-bg-opacity)); color: var(--text-primary); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; --avatar-color: #19c37d;\"><div class=\"p-4 justify-center text-base md:gap-6 md:py-6 lg:px-0 m-auto\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; justify-content: center; padding-right: 0px; padding-left: 0px; font-size: 1rem; line-height: 1.5rem; gap: 1.5rem;\"><div class=\"flex flex-1 gap-4 text-base mx-auto md:gap-6 md:max-w-2xl lg:max-w-[38rem] xl:max-w-3xl }\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; display: flex; flex: 1 1 0%; font-size: 1rem; line-height: 1.5rem; max-width: 48rem;\"><div class=\"relative flex w-[calc(100%-50px)] flex-col gap-1 md:gap-3 lg:w-[calc(100%-115px)]\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; position: relative; display: flex; width: calc(100% - 115px); flex-direction: column; gap: 0.75rem;\"><div class=\"flex flex-grow flex-col gap-3 max-w-full\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; display: flex; max-width: 100%; flex-grow: 1; flex-direction: column; gap: 0.75rem;\"><div class=\"min-h-[20px] flex flex-col items-start gap-3 overflow-x-auto whitespace-pre-wrap break-words\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; display: flex; min-height: 20px; flex-direction: column; align-items: flex-start; gap: 0.75rem; overflow-x: auto; white-space-collapse: preserve; overflow-wrap: break-word;\"><div class=\"markdown prose w-full break-words dark:prose-invert light\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: var(--tw-prose-body); max-width: none; --tw-prose-body: #374151; --tw-prose-headings: #111827; --tw-prose-lead: #4b5563; --tw-prose-links: #111827; --tw-prose-bold: #111827; --tw-prose-counters: #6b7280; --tw-prose-bullets: #d1d5db; --tw-prose-hr: #e5e7eb; --tw-prose-quotes: #111827; --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: #6b7280; --tw-prose-code: #111827; --tw-prose-pre-code: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw-prose-td-borders: #e5e7eb; --tw-prose-invert-body: #d1d5db; --tw-prose-invert-headings: #fff; --tw-prose-invert-lead: #9ca3af; --tw-prose-invert-links: #fff; --tw-prose-invert-bold: #fff; --tw-prose-invert-counters: #9ca3af; --tw-prose-invert-bullets: #4b5563; --tw-prose-invert-hr: #374151; --tw-prose-invert-quotes: #f3f4f6; --tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: #9ca3af; --tw-prose-invert-code: #fff; --tw-prose-invert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5); --tw-prose-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-size: 1rem; line-height: 1.75; width: 653px; overflow-wrap: break-word;\"><ol style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column;\"><li style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Reveal silky-smooth skin with our Exfoliating Coffee Scrub enriched with Coconut Oil. The invigorating coffee grounds gently exfoliate, buffing away dead skin cells and promoting circulation, while the coconut oil moisturizes and nourishes. This two-in-one scrub leaves your skin feeling revitalized and rejuvenated, with a delightful coffee aroma that jumpstarts your da</p></li></ol></div></div></div><div class=\"flex justify-between lg:block\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; justify-content: space-between;\"><div class=\"text-gray-400 flex self-end lg:self-center justify-center mt-2 gap-2 md:gap-3 lg:gap-1 lg:absolute lg:top-0 lg:translate-x-full lg:right-0 lg:mt-0 lg:pl-2 visible\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 100%; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 0px; display: flex; justify-content: center; gap: 0.25rem; align-self: center; --tw-text-opacity: 1; color: rgba(172,172,190,var(--tw-text-opacity)); position: absolute; right: 0px; top: 0px; transform: translate(var(--tw-translate-x),var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y)); padding-left: 0.5rem;\"><button class=\"flex ml-auto gap-2 rounded-md p-1 hover:bg-gray-100 hover:text-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200 disabled:dark:hover:text-gray-400\" style=\"border-width: 0px; border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 16px; font-weight: inherit; margin-left: auto; background-image: none; display: flex; border-radius: 0.375rem;\"><svg stroke=\"currentColor\" fill=\"none\" stroke-width=\"2\" viewBox=\"0 0 24 24\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"h-4 w-4\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2\"></path><rect x=\"8\" y=\"2\" width=\"8\" height=\"4\" rx=\"1\" ry=\"1\"></rect></svg></button><div class=\"flex gap-1\" style=\"border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; display: flex;\"><button class=\"p-1 rounded-md hover:bg-gray-100 hover:text-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200 disabled:dark:hover:text-gray-400\" style=\"border-width: 0px; border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 16px; font-weight: inherit; background-image: none; border-radius: 0.375rem;\"><svg stroke=\"currentColor\" fill=\"none\" stroke-width=\"2\" viewBox=\"0 0 24 24\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"h-4 w-4\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3\"></path></svg></button><button class=\"p-1 rounded-md hover:bg-gray-100 hover:text-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200 disabled:dark:hover:text-gray-400\" style=\"border-width: 0px; border-style: solid; border-color: rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 16px; font-weight: inherit; background-image: none; border-radius: 0.375rem;\"><svg stroke=\"currentColor\" fill=\"none\" stroke-width=\"2\" viewBox=\"0 0 24 24\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"h-4 w-4\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M10 15v4a3 3 0 0 0 3 3l4-9V2H5.72a2 2 0 0 0-2 1.7l-1.38 9a2 2 0 0 0 2 2.3zm7-13h2.67A2.31 2.31 0 0 1 22 4v7a2.31 2.31 0 0 1-2.33 2H17\"></path></svg></button></div></div></div></div></div></div></div>', 1, '2023-09-01 22:28:26', '2023-09-01 22:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `brand_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_en`, `name_bn`, `slug`, `description_en`, `description_bn`, `brand_image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(9, 'Adidas', 'এডিডাস', 'adidas', 'Adidas', 'এডিডাস', 'upload/brand/1742310450869455.png', 1, 4, '2022-08-26 22:38:48', '2022-08-26 22:38:48'),
(10, 'Mi', 'মি', 'mi', 'Mi', 'মি', 'upload/brand/1742310493375695.png', 1, 4, '2022-08-26 22:39:28', '2022-08-26 22:39:28'),
(11, 'Nivea', 'নিভিয়া', 'nivea', 'Nivea', 'নিভিয়া', 'upload/brand/1742310531552856.png', 1, 4, '2022-08-26 22:40:05', '2022-08-26 22:40:05'),
(12, 'Mico', 'মাইকো', 'mico', 'Mico', 'মাইকো', 'upload/brand/1742310561734589.png', 1, 4, '2022-08-26 22:40:34', '2022-08-26 22:40:34'),
(13, 'Miniso', 'মিনিসো', 'miniso', 'Miniso', 'মিনিসো', 'upload/brand/1742310614628684.png', 1, 4, '2022-08-26 22:41:24', '2022-08-26 22:41:24'),
(17, 'Others', 'অন্যান্য', 'others', 'Others', 'অন্যান্য', 'upload/brand/1743135965942158.png', 1, 4, '2022-09-05 01:20:00', '2022-09-05 01:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `campaings`
--

CREATE TABLE `campaings` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaing_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_start` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_end` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured	',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaing_products`
--

CREATE TABLE `campaing_products` (
  `id` bigint UNSIGNED NOT NULL,
  `campaing_id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` double NOT NULL DEFAULT '0',
  `discount_type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Flat, 2=>Percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashwithdraws`
--

CREATE TABLE `cashwithdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `user_type` bigint UNSIGNED NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_brunch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Category, 2=>SubCategory, 3=> SubSubCategory',
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured',
  `trending` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Trending, 0=>Not Trending',
  `special` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Special, 0=>Not Special',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_bn`, `slug`, `description_en`, `description_bn`, `image`, `banner_image`, `parent_id`, `type`, `is_featured`, `trending`, `special`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Shoe', 'Shoe', 'Shoe-4J4Qi', 'Shoe', 'Shoe', 'upload/category/1797663767558262.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:16:04', '2024-04-29 04:16:06'),
(2, 'Fashion', 'Fashion', 'Fashion-qsetP', 'Fashion', 'Fashion', 'upload/category/1797664282311421.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:24:15', '2024-04-29 04:24:15'),
(3, 'Accessories', 'Accessories', 'Accessories-RbLEJ', 'Accessories', 'Accessories', 'upload/category/1797664391333930.jpg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:25:59', '2024-04-29 04:25:59'),
(4, 'Mens', 'Mens', 'Mens-SSZlC', 'Mens', 'Mens', 'upload/category/1797664463970607.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:27:08', '2024-04-29 04:27:08'),
(5, 'Womens', 'Womens', 'Womens-qaUPt', 'Womens', 'Womens', 'upload/category/1797664504611960.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:27:47', '2024-04-29 04:27:47'),
(6, 'Bag', 'Bag', 'Bag-YZmTZ', 'Bag', 'Bag', 'upload/category/1797664580217610.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:28:59', '2024-04-29 04:28:59'),
(7, 'leather wallet', 'leather wallet', 'leather-wallet-QWN5p', 'leather wallet', 'leather wallet', 'upload/category/1797664624772616.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:29:42', '2024-04-29 04:29:42'),
(8, 'leather belt', 'leather belt', 'leather-belt-GQMpc', 'leather belt', 'leather belt', 'upload/category/1797664669734811.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:30:25', '2024-04-29 04:30:25'),
(9, 'Watch', 'Watch', 'Watch-H0pp7', 'Watch', 'Watch', 'upload/category/1797664750762852.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:31:42', '2024-04-29 04:31:42'),
(10, 'Jacket', 'Jacket', 'Jacket-toMzs', 'Jacket', 'Jacket', 'upload/category/1797664834129105.jpeg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:33:01', '2024-04-29 04:33:01'),
(11, 'Dress', 'Dress', 'Dress-0M3Sx', 'Dress', 'Dress', 'upload/category/1797664938668863.jpg', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:34:41', '2024-04-29 04:34:41'),
(12, 'Trolley Bag', 'Trolley Bag', 'Trolley-Bag-5jrqP', 'Trolley Bag', 'Trolley Bag', 'upload/category/1797665081821759.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:36:58', '2024-04-29 04:36:58'),
(13, 'Leather Curtain', 'Leather Curtain', 'Leather-Curtain-TyzhM', 'Leather Curtain', 'Leather Curtain', 'upload/category/1797665174966884.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:38:26', '2024-04-29 04:38:26'),
(14, 'Leather Carpet', 'Leather Carpet', 'Leather-Carpet-t881J', 'Leather Carpet', 'Leather Carpet', 'upload/category/1797665259641924.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 04:39:47', '2024-04-29 04:39:47'),
(15, 'Combo', 'Combo', 'Combo-sJ3c5', 'Combo', 'Combo', 'upload/category/1797670557609218.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 06:04:00', '2024-04-29 06:04:00'),
(16, 'Leather Sunglasses Case', 'Leather Sunglasses Case', 'Leather-Sunglasses-Case-tJAXE', 'Leather Sunglasses Case', 'Leather Sunglasses Case', 'upload/category/1797671021663190.webp', '', 0, 1, 1, 0, 0, 1, 4, '2024-04-29 06:11:22', '2024-04-29 06:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Fixed Amount, 0=>Percent',
  `discount` double(20,2) NOT NULL DEFAULT '0.00',
  `limit_per_user` double(20,2) NOT NULL DEFAULT '0.00',
  `total_use_limit` double(20,2) NOT NULL DEFAULT '0.00',
  `expire_date` date DEFAULT NULL,
  `type` tinyint UNSIGNED DEFAULT '1' COMMENT '1=>All Customers, 0=>Specific Customer',
  `user_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `producttype` int DEFAULT '1' COMMENT '1=>all product ,0=>specific product',
  `product_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED DEFAULT '0' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int NOT NULL,
  `division_name_bn` varchar(150) NOT NULL,
  `district_name_bn` varchar(130) NOT NULL,
  `district_name_en` text NOT NULL,
  `division_name_en` text NOT NULL,
  `division_id` varchar(210) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_name_bn`, `district_name_bn`, `district_name_en`, `division_name_en`, `division_id`, `status`) VALUES
(1, 'চট্টগ্রাম', 'কুমিল্লা', 'cumilla', 'chattogram', '2', 1),
(2, 'চট্টগ্রাম', 'ফেনী', 'feni', 'chattogram', '2', 1),
(3, 'চট্টগ্রাম', 'ব্রাহ্মণবাড়িয়া', 'brahmanbaria', 'chattogram', '2', 1),
(4, 'চট্টগ্রাম', 'রাঙ্গামাটি', 'rangamati', 'chattogram', '2', 1),
(5, 'চট্টগ্রাম', 'নোয়াখালী', 'noakhali', 'chattogram', '2', 1),
(6, 'চট্টগ্রাম', 'চাঁদপুর', 'chandpur', 'chattogram', '2', 1),
(7, 'চট্টগ্রাম', 'লক্ষ্মীপুর', 'lakshmipur', 'chattogram', '2', 1),
(8, 'চট্টগ্রাম', 'চট্টগ্রাম', 'chattogram', 'chattogram', '2', 1),
(9, 'চট্টগ্রাম', 'কক্সবাজার', 'coxsbazar', 'chattogram', '2', 1),
(10, 'চট্টগ্রাম', 'খাগড়াছড়ি', 'khagrachari', 'chattogram', '2', 1),
(11, 'চট্টগ্রাম', 'বান্দরবান', 'bandarban', 'chattogram', '2', 1),
(12, 'রাজশাহী', 'সিরাজগঞ্জ', 'sirajganj', 'rajshahi', '3', 1),
(13, 'রাজশাহী', 'পাবনা', 'pabna', 'rajshahi', '3', 1),
(14, 'রাজশাহী', 'বগুড়া', 'bogura', 'rajshahi', '3', 1),
(15, 'রাজশাহী', 'রাজশাহী', 'rajshahi', 'rajshahi', '3', 1),
(16, 'রাজশাহী', 'নাটোর', 'natore', 'rajshahi', '3', 1),
(17, 'রাজশাহী', 'জয়পুরহাট', 'jaipurhat', 'rajshahi', '3', 1),
(18, 'রাজশাহী', 'চাঁপাইনবাবগঞ্জ', 'nawabganj', 'rajshahi', '3', 1),
(19, 'রাজশাহী', 'নওগাঁ', 'naogaon', 'rajshahi', '3', 1),
(20, 'খুলনা', 'যশোর', 'jashore', 'khulna', '4', 1),
(21, 'খুলনা', 'সাতক্ষীরা', 'satkhira', 'khulna', '4', 1),
(22, 'খুলনা', 'মেহেরপুর', 'meherpur', 'khulna', '4', 1),
(23, 'খুলনা', 'নড়াইল', 'narail', 'khulna', '4', 1),
(24, 'খুলনা', 'চুয়াডাঙ্গা', 'chuadanga', 'khulna', '4', 1),
(25, 'খুলনা', 'কুষ্টিয়া', 'kushtia', 'khulna', '4', 1),
(26, 'খুলনা', 'মাগুরা', 'magura', 'khulna', '4', 1),
(27, 'খুলনা', 'খুলনা', 'khulna', 'khulna', '4', 1),
(28, 'খুলনা', 'বাগেরহাট', 'bagerhat', 'khulna', '4', 1),
(29, 'খুলনা', 'ঝিনাইদহ', 'jhenaidah', 'khulna', '4', 1),
(30, 'বরিশাল', 'বরিশাল', 'barishal', 'barishal', '5', 1),
(31, 'বরিশাল', 'ঝালকাঠি', 'jhalokati', 'barishal', '5', 1),
(32, 'বরিশাল', 'পটুয়াখালী', 'patuakhali', 'barishal', '5', 1),
(33, 'বরিশাল', 'পিরোজপুর', 'pirojpur', 'barishal', '5', 1),
(34, 'বরিশাল', 'ভোলা', 'bhola', 'barishal', '5', 1),
(35, 'বরিশাল', 'বরগুনা', 'barguna', 'barishal', '5', 1),
(36, 'সিলেট', 'সিলেট', 'sylhet', 'sylhet', '6', 1),
(37, 'সিলেট', 'মৌলভীবাজার', 'moulvibazar', 'sylhet', '6', 1),
(38, 'সিলেট', 'হবিগঞ্জ', 'habiganj', 'sylhet', '6', 1),
(39, 'সিলেট', 'সুনামগঞ্জ', 'sunamganj', 'sylhet', '6', 1),
(40, 'রংপুর', 'রংপুর', 'rangpur', 'rangpur', '7', 1),
(41, 'রংপুর', 'পঞ্চগড়', 'panchagarh', 'rangpur', '7', 1),
(42, 'রংপুর', 'দিনাজপুর', 'dinajpur', 'rangpur', '7', 1),
(43, 'রংপুর', 'লালমনিরহাট', 'lalmonirhat', 'rangpur', '7', 1),
(44, 'রংপুর', 'নীলফামারী', 'nilphamari', 'rangpur', '7', 1),
(45, 'রংপুর', 'ঠাকুরগাঁও', 'thakurgaon', 'rangpur', '7', 1),
(46, 'রংপুর', 'গাইবান্ধা', 'gaibandha', 'rangpur', '7', 1),
(47, 'রংপুর', 'কুড়িগ্রাম', 'kurigram', 'rangpur', '7', 1),
(48, 'ময়মনসিংহ', 'ময়মনসিংহ', 'mymensingh', 'mymensingh', '8', 1),
(49, 'ময়মনসিংহ', 'জামালপুর', 'jamalpur', 'mymensingh', '8', 1),
(50, 'ময়মনসিংহ', 'নেত্রকোণা', 'netrokona', 'mymensingh', '8', 1),
(51, 'ময়মনসিংহ', 'শেরপুর', 'sherpur', 'mymensingh', '8', 1),
(52, 'ঢাকা', 'ঢাকা', 'dhaka', 'dhaka', '1', 1),
(53, 'ঢাকা', 'নরসিংদী', 'narsingdi', 'dhaka', '1', 1),
(54, 'ঢাকা', 'গাজীপুর', 'gazipur', 'dhaka', '1', 1),
(55, 'ঢাকা', 'শরীয়তপুর', 'shariatpur', 'dhaka', '1', 1),
(56, 'ঢাকা', 'নারায়ণগঞ্জ', 'narayanganj', 'dhaka', '1', 1),
(57, 'ঢাকা', 'টাঙ্গাইল', 'tangail', 'dhaka', '1', 1),
(58, 'ঢাকা', 'কিশোরগঞ্জ', 'kishoreganj', 'dhaka', '1', 1),
(59, 'ঢাকা', 'মানিকগঞ্জ', 'manikganj', 'dhaka', '1', 1),
(60, 'ঢাকা', 'মুন্সিগঞ্জ', 'munshiganj', 'dhaka', '1', 1),
(61, 'ঢাকা', 'রাজবাড়ী', 'rajbari', 'dhaka', '1', 1),
(62, 'ঢাকা', 'মাদারীপুর', 'madaripur', 'dhaka', '1', 1),
(63, 'ঢাকা', 'ফরিদপুর', 'faridpur', 'dhaka', '1', 1),
(64, 'ঢাকা', 'গোপালগঞ্জ', 'gopalganj', 'dhaka', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int NOT NULL,
  `division_id` varchar(30) NOT NULL,
  `division_name_bn` varchar(30) NOT NULL,
  `division_name_en` text NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `division_id`, `division_name_bn`, `division_name_en`, `country_id`, `status`) VALUES
(1, '1', 'ঢাকা', 'dhaka', 22, 1),
(2, '2', 'চট্টগ্রাম', 'chattogram', 22, 1),
(3, '3', 'রাজশাহী', 'rajshahi', 22, 1),
(4, '4', 'খুলনা', 'khulna', 22, 1),
(5, '5', 'বরিশাল', 'barishal', 22, 1),
(6, '6', 'সিলেট', 'sylhet', 22, 1),
(7, '7', 'রংপুর', 'rangpur', 22, 1),
(8, '8', 'ময়মনসিংহ', 'mymensingh', 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `free_shippings`
--

CREATE TABLE `free_shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `free_shippings`
--

INSERT INTO `free_shippings` (`id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 3000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_07_24_074842_create_multi_imgs_table', 1),
(27, '2022_02_04_061801_create_product_prices_table', 6),
(28, '2022_02_04_065518_create_attribute_product_table', 6),
(29, '2022_05_20_152549_create_attribute_value_product_price_table', 6),
(47, '2022_07_23_114405_create_sliders_table', 7),
(51, '2022_07_28_064437_create_campaings_table', 7),
(53, '2022_07_31_095124_create_blogs_table', 7),
(54, '2022_08_01_045408_create_pages_table', 7),
(56, '2022_08_10_105324_create_addresses_table', 7),
(57, '2022_08_14_045916_create_settings_table', 7),
(60, '2022_08_19_201539_create_product_stocks_table', 8),
(61, '2022_09_03_062044_create_shippings_table', 9),
(62, '2022_08_14_105209_create_order_details_table', 10),
(63, '2022_09_03_055707_create_coupons_table', 11),
(65, '2022_07_30_093841_create_banners_table', 12),
(67, '2022_09_17_111303_create_campaing_products_table', 13),
(68, '2022_09_27_050816_create_subscribers_table', 14),
(69, '2022_09_28_103615_create_roles_table', 15),
(71, '2022_09_28_110124_create_staff_table', 16),
(72, '2022_07_24_111956_create_vendors_table', 17),
(73, '2022_07_19_132400_create_brands_table', 18),
(74, '2022_07_20_105632_create_categories_table', 18),
(75, '2022_07_21_140629_create_suppliers_table', 18),
(76, '2022_07_24_063334_create_products_table', 18),
(77, '2022_08_04_073752_create_attributes_table', 18),
(78, '2022_08_06_053505_create_attribute_values_table', 18),
(79, '2022_08_14_105132_create_orders_table', 18),
(80, '2022_10_16_060400_create_account_heads_table', 19),
(82, '2022_10_16_082419_create_account_ledgers_table', 20),
(84, '2022_12_31_055130_create_units_table', 21),
(85, '2023_04_02_063808_create_order_statuses_table', 22),
(86, '2023_08_29_112617_create_contacts_table', 23),
(87, '2023_08_31_052151_create_wishlist_items_table', 24),
(88, '2023_09_02_071710_create_reviews_table', 25),
(89, '2023_09_07_132249_create_free_shippings_table', 26),
(90, '2023_09_27_103107_create_cashwithdraws_table', 27),
(91, '2023_10_09_071616_create_order_payments_table', 28),
(92, '2023_10_26_102927_create_pos_carts_table', 29),
(93, '2023_11_19_060841_create_advance_payments_table', 30),
(94, '2022_07_30_093841_create_refunds_table', 31),
(95, '2022_07_30_093841_create_returns_table', 32),
(96, '2024_01_27_103451_create_refunds_table', 33);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL,
  `photo_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(26, 6, 'upload/products/multi-image/1739846067169394.jpg', '2022-07-30 23:48:28', NULL),
(27, 7, 'upload/products/multi-image/1739846315129171.jpg', '2022-07-30 23:52:25', NULL),
(28, 7, 'upload/products/multi-image/1739846315236232.jpg', '2022-07-30 23:52:25', NULL),
(29, 7, 'upload/products/multi-image/1739846315325319.jpg', '2022-07-30 23:52:25', NULL),
(30, 7, 'upload/products/multi-image/1739846315411765.jpg', '2022-07-30 23:52:25', NULL),
(31, 7, 'upload/products/multi-image/1739846315496734.jpg', '2022-07-30 23:52:25', NULL),
(32, 8, 'upload/products/multi-image/1739846945373381.jpg', '2022-07-31 00:02:26', NULL),
(33, 8, 'upload/products/multi-image/1739846945461252.jpg', '2022-07-31 00:02:26', NULL),
(34, 8, 'upload/products/multi-image/1739846945549516.jpg', '2022-07-31 00:02:26', NULL),
(35, 8, 'upload/products/multi-image/1739846945636549.jpg', '2022-07-31 00:02:26', NULL),
(40, 10, 'upload/products/multi-image/1740220384024841.jpg', '2022-08-04 02:58:05', NULL),
(41, 10, 'upload/products/multi-image/1740220384277271.jpg', '2022-08-04 02:58:05', NULL),
(42, 13, 'upload/products/multi-image/1742295966910363.jpg', '2022-08-27 00:48:35', NULL),
(43, 13, 'upload/products/multi-image/1742295967017138.jpg', '2022-08-27 00:48:35', NULL),
(44, 13, 'upload/products/multi-image/1742295967129486.png', '2022-08-27 00:48:35', NULL),
(45, 14, 'upload/products/multi-image/1742317545185514.jpg', '2022-08-27 06:31:34', NULL),
(46, 14, 'upload/products/multi-image/1742317545453192.jpg', '2022-08-27 06:31:34', NULL),
(47, 14, 'upload/products/multi-image/1742317545664382.jpg', '2022-08-27 06:31:34', NULL),
(49, 15, 'upload/products/multi-image/1742317808453359.jpg', '2022-08-27 06:35:45', NULL),
(50, 15, 'upload/products/multi-image/1742317808714459.jpg', '2022-08-27 06:35:45', NULL),
(51, 15, 'upload/products/multi-image/1742317808922731.jpg', '2022-08-27 06:35:45', NULL),
(52, 15, 'upload/products/multi-image/1742317809136325.jpg', '2022-08-27 06:35:45', NULL),
(53, 15, 'upload/products/multi-image/1742317809373085.jpg', '2022-08-27 06:35:45', NULL),
(54, 16, 'upload/products/multi-image/1742318129595563.jpg', '2022-08-27 06:40:51', NULL),
(55, 16, 'upload/products/multi-image/1742318129886651.jpg', '2022-08-27 06:40:51', NULL),
(56, 16, 'upload/products/multi-image/1742318129987320.jpg', '2022-08-27 06:40:51', NULL),
(57, 16, 'upload/products/multi-image/1742318130132424.png', '2022-08-27 06:40:51', NULL),
(58, 17, 'upload/products/multi-image/1742320496045439.jpg', '2022-08-27 07:18:28', NULL),
(59, 17, 'upload/products/multi-image/1742320496146899.jpg', '2022-08-27 07:18:28', NULL),
(60, 17, 'upload/products/multi-image/1742320496250664.jpg', '2022-08-27 07:18:28', NULL),
(61, 17, 'upload/products/multi-image/1742320496355090.jpg', '2022-08-27 07:18:28', NULL),
(62, 18, 'upload/products/multi-image/1742320667990183.jpg', '2022-08-27 07:21:12', NULL),
(63, 18, 'upload/products/multi-image/1742320668091389.jpg', '2022-08-27 07:21:12', NULL),
(64, 18, 'upload/products/multi-image/1742320668190326.jpg', '2022-08-27 07:21:12', NULL),
(65, 18, 'upload/products/multi-image/1742320668290266.jpg', '2022-08-27 07:21:12', NULL),
(66, 19, 'upload/products/multi-image/1742320990568427.jpg', '2022-08-27 07:26:19', NULL),
(67, 19, 'upload/products/multi-image/1742320990667661.jpg', '2022-08-27 07:26:19', NULL),
(68, 20, 'upload/products/multi-image/1742321394763321.jpg', '2022-08-27 07:32:45', NULL),
(69, 20, 'upload/products/multi-image/1742321394855141.jpg', '2022-08-27 07:32:45', NULL),
(70, 20, 'upload/products/multi-image/1742321394949763.jpg', '2022-08-27 07:32:45', NULL),
(71, 20, 'upload/products/multi-image/1742321395041602.jpg', '2022-08-27 07:32:45', NULL),
(72, 21, 'upload/products/multi-image/1742322410924504.jpg', '2022-08-27 07:48:54', NULL),
(73, 21, 'upload/products/multi-image/1742322411139578.jpg', '2022-08-27 07:48:54', NULL),
(74, 21, 'upload/products/multi-image/1742322411353836.jpg', '2022-08-27 07:48:55', NULL),
(75, 22, 'upload/products/multi-image/1742322638653428.jpg', '2022-08-27 07:52:31', NULL),
(76, 23, 'upload/products/multi-image/1742322957147844.jpg', '2022-08-27 07:57:35', NULL),
(77, 23, 'upload/products/multi-image/1742322957249716.jpg', '2022-08-27 07:57:35', NULL),
(78, 23, 'upload/products/multi-image/1742322957342972.jpg', '2022-08-27 07:57:35', NULL),
(79, 23, 'upload/products/multi-image/1742322957435041.jpg', '2022-08-27 07:57:35', NULL),
(81, 24, 'upload/products/multi-image/1742323415126547.jpg', '2022-08-27 08:04:52', NULL),
(82, 24, 'upload/products/multi-image/1742323415265148.jpg', '2022-08-27 08:04:52', NULL),
(83, 24, 'upload/products/multi-image/1742323415357422.jpg', '2022-08-27 08:04:52', NULL),
(84, 24, 'upload/products/multi-image/1742323415439626.jpg', '2022-08-27 08:04:52', NULL),
(85, 25, 'upload/products/multi-image/1742323752659292.jpg', '2022-08-27 08:10:14', NULL),
(86, 25, 'upload/products/multi-image/1742323753056581.png', '2022-08-27 08:10:14', NULL),
(88, 26, 'upload/products/multi-image/1742411315968479.jpg', '2022-08-28 07:22:00', NULL),
(89, 27, 'upload/products/multi-image/1742411449262562.jpg', '2022-08-28 07:24:08', NULL),
(91, NULL, 'upload/products/multi-image/1742480355984144.jpg', '2022-08-29 01:39:22', '2022-08-29 01:39:22'),
(92, NULL, 'upload/products/multi-image/1742480356115810.jpg', '2022-08-29 01:39:22', '2022-08-29 01:39:22'),
(93, NULL, 'upload/products/multi-image/1742480356240109.jpg', '2022-08-29 01:39:22', '2022-08-29 01:39:22'),
(94, NULL, 'upload/products/multi-image/1742480393934418.jpg', '2022-08-29 01:39:58', '2022-08-29 01:39:58'),
(95, 29, 'upload/products/multi-image/1742481808103930.jpg', '2022-08-29 02:02:27', NULL),
(96, 29, 'upload/products/multi-image/1742481808252632.jpg', '2022-08-29 02:02:27', NULL),
(97, 29, 'upload/products/multi-image/1742481808351222.jpg', '2022-08-29 02:02:27', NULL),
(98, 29, 'upload/products/multi-image/1742482178486432.jpg', '2022-08-29 02:08:20', NULL),
(102, 29, 'upload/products/multi-image/1742482350127002.jpg', '2022-08-29 02:11:04', NULL),
(103, 29, 'upload/products/multi-image/1742482350293094.jpg', '2022-08-29 02:11:04', NULL),
(104, 29, 'upload/products/multi-image/1742482350465148.jpg', '2022-08-29 02:11:04', NULL),
(106, 26, 'upload/products/multi-image/1742485985214466.jpg', '2022-08-29 03:08:50', NULL),
(107, 26, 'upload/products/multi-image/1742485985320404.jpg', '2022-08-29 03:08:51', NULL),
(128, 32, 'upload/products/multi-image/1743137219221531.jpg', '2022-09-05 07:39:56', NULL),
(129, 32, 'upload/products/multi-image/1743137219386093.jpg', '2022-09-05 07:39:56', NULL),
(130, 32, 'upload/products/multi-image/1743137219496997.jpg', '2022-09-05 07:39:56', NULL),
(131, 32, 'upload/products/multi-image/1743137219607665.png', '2022-09-05 07:39:56', NULL),
(132, 33, 'upload/products/multi-image/1743137433323529.jpg', '2022-09-05 07:43:20', NULL),
(133, 33, 'upload/products/multi-image/1743137433433486.jpg', '2022-09-05 07:43:20', NULL),
(134, 34, 'upload/products/multi-image/1743137666257826.jpg', '2022-09-05 07:47:02', NULL),
(135, 34, 'upload/products/multi-image/1743137666368608.jpg', '2022-09-05 07:47:02', NULL),
(136, 34, 'upload/products/multi-image/1743137666486186.jpg', '2022-09-05 07:47:02', NULL),
(137, 34, 'upload/products/multi-image/1743137666597972.png', '2022-09-05 07:47:02', NULL),
(138, 35, 'upload/products/multi-image/1743138000698727.jpg', '2022-09-05 07:52:21', NULL),
(139, 35, 'upload/products/multi-image/1743138000813314.jpg', '2022-09-05 07:52:21', NULL),
(140, 35, 'upload/products/multi-image/1743138000927907.jpg', '2022-09-05 07:52:21', NULL),
(141, 36, 'upload/products/multi-image/1743138270435538.jpg', '2022-09-05 07:56:38', NULL),
(142, 37, 'upload/products/multi-image/1743138492665941.jpg', '2022-09-05 08:00:10', NULL),
(143, 37, 'upload/products/multi-image/1743138492802375.jpg', '2022-09-05 08:00:10', NULL),
(144, 37, 'upload/products/multi-image/1743138493014956.jpg', '2022-09-05 08:00:10', NULL),
(145, 38, 'upload/products/multi-image/1743138704354009.jpg', '2022-09-05 08:03:32', NULL),
(146, 38, 'upload/products/multi-image/1743138704458721.jpg', '2022-09-05 08:03:32', NULL),
(147, 38, 'upload/products/multi-image/1743138704558792.webp', '2022-09-05 08:03:32', NULL),
(154, 40, 'upload/products/multi-image/1744649455886943.jpg', '2022-09-22 00:16:17', NULL),
(155, 40, 'upload/products/multi-image/1744649455986124.jpg', '2022-09-22 00:16:17', NULL),
(156, 40, 'upload/products/multi-image/1744649456079990.jpg', '2022-09-22 00:16:17', NULL),
(157, 40, 'upload/products/multi-image/1744649456174697.jpg', '2022-09-22 00:16:17', NULL),
(212, 193, 'upload/products/multi-image/1788343917961602.jpg', '2024-01-17 07:21:03', NULL),
(213, 193, 'upload/products/multi-image/1788343918143536.jpg', '2024-01-17 07:21:03', NULL),
(214, 194, 'upload/products/multi-image/1788344076158116.jpg', '2024-01-17 07:23:34', NULL),
(215, 195, 'upload/products/multi-image/1788344321776473.jpg', '2024-01-17 07:27:28', NULL),
(216, 196, 'upload/products/multi-image/1788344514333803.jpg', '2024-01-17 07:30:32', NULL),
(217, 197, 'upload/products/multi-image/1788344654716026.jpg', '2024-01-17 07:32:46', NULL),
(218, 197, 'upload/products/multi-image/1788344654905448.jpg', '2024-01-17 07:32:46', NULL),
(220, 199, 'upload/products/multi-image/1788345463151819.jpg', '2024-01-17 07:45:37', NULL),
(221, 199, 'upload/products/multi-image/1788345463327485.jpg', '2024-01-17 07:45:37', NULL),
(224, 201, 'upload/products/multi-image/1788345782066778.jpg', '2024-01-17 07:50:41', NULL),
(225, 201, 'upload/products/multi-image/1788345782246083.jpg', '2024-01-17 07:50:41', NULL),
(226, 202, 'upload/products/multi-image/1788591226462506.jpg', '2024-01-20 00:51:55', NULL),
(227, 203, 'upload/products/multi-image/1789233616141819.jpg', '2024-01-27 03:02:25', NULL),
(228, 203, 'upload/products/multi-image/1789233616254031.jpeg', '2024-01-27 03:02:26', NULL),
(231, 225, 'upload/products/multi-image/1790766425335773.jpg', '2024-02-13 01:05:46', NULL),
(232, 225, 'upload/products/multi-image/1790766425428963.jpg', '2024-02-13 01:05:46', NULL),
(233, 226, 'upload/products/multi-image/1790788375358435.jpg', '2024-02-13 06:54:40', NULL),
(234, 226, 'upload/products/multi-image/1790788375826517.png', '2024-02-13 06:54:40', NULL),
(235, 226, 'upload/products/multi-image/1790788376446043.jpg', '2024-02-13 06:54:40', NULL),
(236, 226, 'upload/products/multi-image/1790788376575555.png', '2024-02-13 06:54:41', NULL),
(237, 226, 'upload/products/multi-image/1790788376781211.jpeg', '2024-02-13 06:54:41', NULL),
(238, 226, 'upload/products/multi-image/1790788376940058.png', '2024-02-13 06:54:41', NULL),
(239, 226, 'upload/products/multi-image/1790788377239917.png', '2024-02-13 06:54:41', NULL),
(240, 226, 'upload/products/multi-image/1790788377523785.png', '2024-02-13 06:54:42', NULL),
(241, 226, 'upload/products/multi-image/1790788377785584.jpeg', '2024-02-13 06:54:42', NULL),
(242, 202, 'upload/products/multi-image/1791032708222000.jpg', '2024-02-15 23:38:13', NULL),
(243, 202, 'upload/products/multi-image/1791032708332959.jpg', '2024-02-15 23:38:13', NULL),
(244, 202, 'upload/products/multi-image/1791032708435122.jpg', '2024-02-15 23:38:14', NULL),
(245, 202, 'upload/products/multi-image/1792678213879359.webp', '2024-03-05 03:32:50', NULL),
(246, 202, 'upload/products/multi-image/1792678214154553.jpg', '2024-03-05 03:32:50', NULL),
(247, 202, 'upload/products/multi-image/1792678214244923.jpg', '2024-03-05 03:32:50', NULL),
(248, 202, 'upload/products/multi-image/1792678214336728.jpg', '2024-03-05 03:32:50', NULL),
(249, 202, 'upload/products/multi-image/1792678214429510.jpg', '2024-03-05 03:32:50', NULL),
(250, 202, 'upload/products/multi-image/1792678214521120.jpg', '2024-03-05 03:32:50', NULL),
(251, 202, 'upload/products/multi-image/1792678214612039.jpg', '2024-03-05 03:32:50', NULL),
(252, 202, 'upload/products/multi-image/1792678214709602.jpg', '2024-03-05 03:32:51', NULL),
(253, 202, 'upload/products/multi-image/1792678214849673.jpg', '2024-03-05 03:32:51', NULL),
(254, 202, 'upload/products/multi-image/1792678214941821.jpg', '2024-03-05 03:32:51', NULL),
(255, 202, 'upload/products/multi-image/1792678215031952.jpg', '2024-03-05 03:32:51', NULL),
(265, 230, 'upload/products/multi-image/1794936499214398.webp', '2024-03-30 01:47:19', NULL),
(266, 230, 'upload/products/multi-image/1794936499527793.jpg', '2024-03-30 01:47:19', NULL),
(267, 230, 'upload/products/multi-image/1794936499753500.webp', '2024-03-30 01:47:19', NULL),
(268, 230, 'upload/products/multi-image/1794936499994994.webp', '2024-03-30 01:47:19', NULL),
(269, 230, 'upload/products/multi-image/1794936500252491.jpg', '2024-03-30 01:47:20', NULL),
(280, 243, 'upload/products/multi-image/1795419164776487.jpeg', '2024-04-04 09:39:04', NULL),
(282, 245, 'upload/products/multi-image/1795803545317999.jpeg', '2024-04-08 15:28:38', NULL),
(283, 245, 'upload/products/multi-image/1795803545737065.jpeg', '2024-04-08 15:28:39', NULL),
(284, 245, 'upload/products/multi-image/1795803546154333.jpeg', '2024-04-08 15:28:39', NULL),
(285, 245, 'upload/products/multi-image/1795803546534112.jpeg', '2024-04-08 15:28:40', NULL),
(286, 249, 'upload/products/multi-image/1795863010879769.jpeg', '2024-04-09 07:13:49', NULL),
(287, 249, 'upload/products/multi-image/1795863011009502.jpeg', '2024-04-09 07:13:49', NULL),
(288, 249, 'upload/products/multi-image/1795863011138676.jpeg', '2024-04-09 07:13:49', NULL),
(289, 249, 'upload/products/multi-image/1795863011269618.jpeg', '2024-04-09 07:13:49', NULL),
(306, 256, 'upload/products/multi-image/1795867366903934.jpeg', '2024-04-09 08:23:03', NULL),
(310, 256, 'upload/products/multi-image/1795867367293937.jpeg', '2024-04-09 08:23:04', NULL),
(313, 256, 'upload/products/multi-image/1795867367754770.jpeg', '2024-04-09 08:23:04', NULL),
(315, 256, 'upload/products/multi-image/1795867368115601.jpeg', '2024-04-09 08:23:05', NULL),
(316, 256, 'upload/products/multi-image/1795867368495105.jpeg', '2024-04-09 08:23:05', NULL),
(317, 256, 'upload/products/multi-image/1795867368880403.jpeg', '2024-04-09 08:23:05', NULL),
(318, 257, 'upload/products/multi-image/1795867589468964.jpeg', '2024-04-09 08:26:36', NULL),
(319, 257, 'upload/products/multi-image/1795867589888499.jpeg', '2024-04-09 08:26:36', NULL),
(320, 257, 'upload/products/multi-image/1795867590232231.jpeg', '2024-04-09 08:26:36', NULL),
(321, 257, 'upload/products/multi-image/1795867590639798.jpeg', '2024-04-09 08:26:37', NULL),
(322, 258, 'upload/products/multi-image/1795867781070477.jpeg', '2024-04-09 08:29:38', NULL),
(323, 258, 'upload/products/multi-image/1795867781282359.jpeg', '2024-04-09 08:29:38', NULL),
(324, 258, 'upload/products/multi-image/1795867781535808.jpeg', '2024-04-09 08:29:39', NULL),
(325, 258, 'upload/products/multi-image/1795867781762923.jpeg', '2024-04-09 08:29:39', NULL),
(326, 258, 'upload/products/multi-image/1795867781932968.jpeg', '2024-04-09 08:29:39', NULL),
(327, 258, 'upload/products/multi-image/1795867782141476.jpeg', '2024-04-09 08:29:39', NULL),
(328, 258, 'upload/products/multi-image/1795867782350592.jpeg', '2024-04-09 08:29:39', NULL),
(329, 258, 'upload/products/multi-image/1795867782518528.jpeg', '2024-04-09 08:29:40', NULL),
(330, 258, 'upload/products/multi-image/1795867782753787.jpeg', '2024-04-09 08:29:40', NULL),
(331, 258, 'upload/products/multi-image/1795867782908702.jpeg', '2024-04-09 08:29:40', NULL),
(332, 258, 'upload/products/multi-image/1795867783077977.jpeg', '2024-04-09 08:29:40', NULL),
(333, 259, 'upload/products/multi-image/1795868121995254.jpg', '2024-04-09 08:35:03', NULL),
(334, 259, 'upload/products/multi-image/1795868122260465.jpg', '2024-04-09 08:35:04', NULL),
(335, 259, 'upload/products/multi-image/1795868122573236.jpg', '2024-04-09 08:35:04', NULL),
(336, 259, 'upload/products/multi-image/1795868122868624.jpg', '2024-04-09 08:35:04', NULL),
(337, 259, 'upload/products/multi-image/1795868123127690.jpg', '2024-04-09 08:35:04', NULL),
(338, 259, 'upload/products/multi-image/1795868123390553.jpg', '2024-04-09 08:35:05', NULL),
(339, 260, 'upload/products/multi-image/1795868230117208.jpeg', '2024-04-09 08:36:47', NULL),
(340, 260, 'upload/products/multi-image/1795868230479795.jpeg', '2024-04-09 08:36:47', NULL),
(341, 260, 'upload/products/multi-image/1795868230738276.jpeg', '2024-04-09 08:36:47', NULL),
(342, 260, 'upload/products/multi-image/1795868230999823.jpeg', '2024-04-09 08:36:47', NULL),
(343, 265, 'upload/products/multi-image/1796917295937636.jpg', '2024-04-20 22:31:14', NULL),
(344, 265, 'upload/products/multi-image/1796917296290164.jpg', '2024-04-20 22:31:14', NULL),
(345, 265, 'upload/products/multi-image/1796917296569025.jpg', '2024-04-20 22:31:14', NULL),
(346, 265, 'upload/products/multi-image/1796917296813240.jpg', '2024-04-20 22:31:15', NULL),
(347, 265, 'upload/products/multi-image/1796917297161519.jpg', '2024-04-20 22:31:15', NULL),
(348, 266, 'upload/products/multi-image/1796917483705018.jpg', '2024-04-20 22:34:13', NULL),
(349, 266, 'upload/products/multi-image/1796917483914125.jpg', '2024-04-20 22:34:13', NULL),
(350, 266, 'upload/products/multi-image/1796917484112578.jpg', '2024-04-20 22:34:13', NULL),
(351, 266, 'upload/products/multi-image/1796917484290124.jpg', '2024-04-20 22:34:13', NULL),
(352, 266, 'upload/products/multi-image/1796917484452212.jpg', '2024-04-20 22:34:13', NULL),
(353, 266, 'upload/products/multi-image/1796917484616425.jpg', '2024-04-20 22:34:14', NULL),
(354, 266, 'upload/products/multi-image/1796917484882494.jpg', '2024-04-20 22:34:14', NULL),
(355, 266, 'upload/products/multi-image/1796917485050328.jpg', '2024-04-20 22:34:14', NULL),
(356, 266, 'upload/products/multi-image/1796917485214593.jpg', '2024-04-20 22:34:14', NULL),
(357, 266, 'upload/products/multi-image/1796917485391745.jpg', '2024-04-20 22:34:14', NULL),
(358, 267, 'upload/products/multi-image/1796917838133260.jpg', '2024-04-20 22:39:51', NULL),
(359, 267, 'upload/products/multi-image/1796917838335675.jpg', '2024-04-20 22:39:51', NULL),
(360, 267, 'upload/products/multi-image/1796917838491446.jpg', '2024-04-20 22:39:51', NULL),
(361, 267, 'upload/products/multi-image/1796917838653352.jpg', '2024-04-20 22:39:51', NULL),
(362, 267, 'upload/products/multi-image/1796917838808268.jpg', '2024-04-20 22:39:51', NULL),
(363, 268, 'upload/products/multi-image/1796918351147381.jpg', '2024-04-20 22:48:00', NULL),
(364, 268, 'upload/products/multi-image/1796918351601142.jpg', '2024-04-20 22:48:01', NULL),
(365, 268, 'upload/products/multi-image/1796918352147475.jpg', '2024-04-20 22:48:01', NULL),
(366, 268, 'upload/products/multi-image/1796918352569729.jpg', '2024-04-20 22:48:01', NULL),
(367, 268, 'upload/products/multi-image/1796918352944257.jpg', '2024-04-20 22:48:02', NULL),
(368, 268, 'upload/products/multi-image/1796918353380650.jpg', '2024-04-20 22:48:02', NULL),
(372, 270, 'upload/products/multi-image/1796918542540768.jpg', '2024-04-20 22:51:02', NULL),
(374, 270, 'upload/products/multi-image/1796918542730590.jpg', '2024-04-20 22:51:03', NULL),
(375, 270, 'upload/products/multi-image/1796918542919576.jpg', '2024-04-20 22:51:03', NULL),
(377, 270, 'upload/products/multi-image/1796918543058232.jpg', '2024-04-20 22:51:03', NULL),
(378, 270, 'upload/products/multi-image/1796918543202320.jpg', '2024-04-20 22:51:03', NULL),
(379, 271, 'upload/products/multi-image/1796918723007357.jpg', '2024-04-20 22:53:55', NULL),
(380, 271, 'upload/products/multi-image/1796918723263591.jpg', '2024-04-20 22:53:55', NULL),
(381, 272, 'upload/products/multi-image/1796919310043573.jpg', '2024-04-20 23:03:14', NULL),
(382, 272, 'upload/products/multi-image/1796919310266501.jpg', '2024-04-20 23:03:15', NULL),
(383, 272, 'upload/products/multi-image/1796919310586275.jpg', '2024-04-20 23:03:15', NULL),
(384, 272, 'upload/products/multi-image/1796919310802847.jpg', '2024-04-20 23:03:15', NULL),
(385, 272, 'upload/products/multi-image/1796919311014748.jpg', '2024-04-20 23:03:15', NULL),
(386, 272, 'upload/products/multi-image/1796919311231096.jpg', '2024-04-20 23:03:16', NULL),
(387, 272, 'upload/products/multi-image/1796919311513912.jpg', '2024-04-20 23:03:16', NULL),
(388, 273, 'upload/products/multi-image/1796919708146644.jpg', '2024-04-20 23:09:34', NULL),
(389, 273, 'upload/products/multi-image/1796919708303004.jpg', '2024-04-20 23:09:34', NULL),
(390, 273, 'upload/products/multi-image/1796919708448488.jpg', '2024-04-20 23:09:34', NULL),
(391, 274, 'upload/products/multi-image/1796919878267979.jpg', '2024-04-20 23:12:16', NULL),
(392, 274, 'upload/products/multi-image/1796919878423274.jpg', '2024-04-20 23:12:17', NULL),
(393, 274, 'upload/products/multi-image/1796919878749716.jpg', '2024-04-20 23:12:17', NULL),
(394, 274, 'upload/products/multi-image/1796919879060231.jpg', '2024-04-20 23:12:17', NULL),
(395, 275, 'upload/products/multi-image/1796920425764674.jpg', '2024-04-20 23:20:58', NULL),
(396, 276, 'upload/products/multi-image/1796920805358471.jpg', '2024-04-20 23:27:01', NULL),
(397, 276, 'upload/products/multi-image/1796920805848976.jpg', '2024-04-20 23:27:01', NULL),
(398, 277, 'upload/products/multi-image/1796921062911651.jpg', '2024-04-20 23:31:06', NULL),
(399, 278, 'upload/products/multi-image/1797006973923549.jpg', '2024-04-21 22:16:37', NULL),
(400, 278, 'upload/products/multi-image/1797006974066658.jpg', '2024-04-21 22:16:37', NULL),
(401, 278, 'upload/products/multi-image/1797006974251211.jpg', '2024-04-21 22:16:37', NULL),
(402, 278, 'upload/products/multi-image/1797006974376210.jpg', '2024-04-21 22:16:38', NULL),
(403, 279, 'upload/products/multi-image/1797007179366431.jpg', '2024-04-21 22:19:53', NULL),
(404, 279, 'upload/products/multi-image/1797007179661406.jpg', '2024-04-21 22:19:53', NULL),
(405, 279, 'upload/products/multi-image/1797007179876962.jpg', '2024-04-21 22:19:54', NULL),
(406, 279, 'upload/products/multi-image/1797007180084398.jpg', '2024-04-21 22:19:54', NULL),
(407, 280, 'upload/products/multi-image/1797007384273803.jpg', '2024-04-21 22:23:09', NULL),
(408, 280, 'upload/products/multi-image/1797007384674482.jpg', '2024-04-21 22:23:09', NULL),
(409, 280, 'upload/products/multi-image/1797007385079174.jpg', '2024-04-21 22:23:09', NULL),
(410, 280, 'upload/products/multi-image/1797007385405035.jpg', '2024-04-21 22:23:10', NULL),
(411, 281, 'upload/products/multi-image/1797007528951437.jpg', '2024-04-21 22:25:27', NULL),
(412, 281, 'upload/products/multi-image/1797007529314196.jpg', '2024-04-21 22:25:27', NULL),
(413, 281, 'upload/products/multi-image/1797007529479528.jpg', '2024-04-21 22:25:27', NULL),
(414, 281, 'upload/products/multi-image/1797007529635354.jpg', '2024-04-21 22:25:27', NULL),
(415, 282, 'upload/products/multi-image/1797007645254959.jpg', '2024-04-21 22:27:17', NULL),
(416, 282, 'upload/products/multi-image/1797007645456505.jpg', '2024-04-21 22:27:18', NULL),
(417, 282, 'upload/products/multi-image/1797007645726815.jpg', '2024-04-21 22:27:18', NULL),
(418, 282, 'upload/products/multi-image/1797007645907708.jpg', '2024-04-21 22:27:18', NULL),
(419, 283, 'upload/products/multi-image/1797008274989690.jpg', '2024-04-21 22:37:18', NULL),
(420, 283, 'upload/products/multi-image/1797008275403139.jpg', '2024-04-21 22:37:19', NULL),
(421, 283, 'upload/products/multi-image/1797008275855213.jpg', '2024-04-21 22:37:19', NULL),
(422, 283, 'upload/products/multi-image/1797008276212346.jpg', '2024-04-21 22:37:19', NULL),
(423, 284, 'upload/products/multi-image/1797008581003822.jpg', '2024-04-21 22:42:10', NULL),
(424, 284, 'upload/products/multi-image/1797008581177166.jpg', '2024-04-21 22:42:10', NULL),
(425, 284, 'upload/products/multi-image/1797008581403288.jpg', '2024-04-21 22:42:10', NULL),
(426, 284, 'upload/products/multi-image/1797008581701746.jpg', '2024-04-21 22:42:10', NULL),
(427, 284, 'upload/products/multi-image/1797008581908852.jpg', '2024-04-21 22:42:11', NULL),
(428, 285, 'upload/products/multi-image/1797009562963495.jpg', '2024-04-21 22:57:46', NULL),
(429, 285, 'upload/products/multi-image/1797009563304094.jpg', '2024-04-21 22:57:47', NULL),
(430, 285, 'upload/products/multi-image/1797009563676807.jpg', '2024-04-21 22:57:47', NULL),
(431, 285, 'upload/products/multi-image/1797009563950124.jpg', '2024-04-21 22:57:47', NULL),
(432, 286, 'upload/products/multi-image/1797010055069486.jpg', '2024-04-21 23:05:36', NULL),
(433, 286, 'upload/products/multi-image/1797010055473977.jpg', '2024-04-21 23:05:36', NULL),
(434, 287, 'upload/products/multi-image/1797010289076436.jpg', '2024-04-21 23:09:19', NULL),
(435, 287, 'upload/products/multi-image/1797010289357393.jpg', '2024-04-21 23:09:19', NULL),
(436, 288, 'upload/products/multi-image/1797010762272941.jpg', '2024-04-21 23:16:50', NULL),
(437, 289, 'upload/products/multi-image/1797011057490699.jpg', '2024-04-21 23:21:32', NULL),
(438, 290, 'upload/products/multi-image/1797011147725408.jpg', '2024-04-21 23:22:58', NULL),
(439, 291, 'upload/products/multi-image/1797011281786177.jpg', '2024-04-21 23:25:05', NULL),
(440, 291, 'upload/products/multi-image/1797011281962356.jpg', '2024-04-21 23:25:06', NULL),
(441, 291, 'upload/products/multi-image/1797011282215675.jpg', '2024-04-21 23:25:06', NULL),
(442, 291, 'upload/products/multi-image/1797011282424515.jpg', '2024-04-21 23:25:06', NULL),
(443, 292, 'upload/products/multi-image/1797011435882688.jpg', '2024-04-21 23:27:32', NULL),
(444, 292, 'upload/products/multi-image/1797011436044344.jpg', '2024-04-21 23:27:33', NULL),
(445, 292, 'upload/products/multi-image/1797011436277567.jpg', '2024-04-21 23:27:33', NULL),
(446, 293, 'upload/products/multi-image/1797011771294237.jpg', '2024-04-21 23:32:52', NULL),
(447, 293, 'upload/products/multi-image/1797011771422875.jpg', '2024-04-21 23:32:52', NULL),
(448, 293, 'upload/products/multi-image/1797011771584200.jpg', '2024-04-21 23:32:53', NULL),
(449, 293, 'upload/products/multi-image/1797011771801243.jpg', '2024-04-21 23:32:53', NULL),
(450, 294, 'upload/products/multi-image/1797011870450632.jpg', '2024-04-21 23:34:27', NULL),
(451, 294, 'upload/products/multi-image/1797011870611948.jpg', '2024-04-21 23:34:27', NULL),
(452, 294, 'upload/products/multi-image/1797011870763362.jpg', '2024-04-21 23:34:27', NULL),
(453, 294, 'upload/products/multi-image/1797011870913213.jpg', '2024-04-21 23:34:27', NULL),
(454, 295, 'upload/products/multi-image/1797012012408319.jpg', '2024-04-21 23:36:42', NULL),
(455, 296, 'upload/products/multi-image/1797012240354905.jpg', '2024-04-21 23:40:20', NULL),
(456, 296, 'upload/products/multi-image/1797012240583784.jpg', '2024-04-21 23:40:20', NULL),
(457, 296, 'upload/products/multi-image/1797012240840686.jpg', '2024-04-21 23:40:20', NULL),
(458, 296, 'upload/products/multi-image/1797012241148612.jpg', '2024-04-21 23:40:20', NULL),
(459, 297, 'upload/products/multi-image/1797012856556635.jpg', '2024-04-21 23:50:07', NULL),
(460, 297, 'upload/products/multi-image/1797012856743090.jpg', '2024-04-21 23:50:07', NULL),
(461, 297, 'upload/products/multi-image/1797012856945012.jpg', '2024-04-21 23:50:08', NULL),
(462, 297, 'upload/products/multi-image/1797012857163836.jpg', '2024-04-21 23:50:08', NULL),
(463, 297, 'upload/products/multi-image/1797012857309307.jpg', '2024-04-21 23:50:08', NULL),
(464, 297, 'upload/products/multi-image/1797012857466023.jpg', '2024-04-21 23:50:08', NULL),
(465, 297, 'upload/products/multi-image/1797012857620084.jpg', '2024-04-21 23:50:08', NULL),
(466, 297, 'upload/products/multi-image/1797012857779869.jpg', '2024-04-21 23:50:08', NULL),
(467, 297, 'upload/products/multi-image/1797012857991177.jpg', '2024-04-21 23:50:09', NULL),
(468, 298, 'upload/products/multi-image/1797012963813423.jpg', '2024-04-21 23:51:50', NULL),
(469, 299, 'upload/products/multi-image/1797013072698565.jpg', '2024-04-21 23:53:33', NULL),
(470, 299, 'upload/products/multi-image/1797013072953156.jpg', '2024-04-21 23:53:34', NULL),
(471, 300, 'upload/products/multi-image/1797013283673341.jpg', '2024-04-21 23:56:55', NULL),
(472, 301, 'upload/products/multi-image/1797014502008754.jpg', '2024-04-22 00:16:16', NULL),
(473, 301, 'upload/products/multi-image/1797014502121699.jpg', '2024-04-22 00:16:17', NULL),
(474, 301, 'upload/products/multi-image/1797014502366252.jpg', '2024-04-22 00:16:17', NULL),
(475, 302, 'upload/products/multi-image/1797016312954668.jpg', '2024-04-22 00:45:04', NULL),
(476, 302, 'upload/products/multi-image/1797016313224268.jpg', '2024-04-22 00:45:04', NULL),
(477, 302, 'upload/products/multi-image/1797016313481603.jpg', '2024-04-22 00:45:04', NULL),
(478, 302, 'upload/products/multi-image/1797016313701377.jpg', '2024-04-22 00:45:04', NULL),
(479, 302, 'upload/products/multi-image/1797016313916360.jpg', '2024-04-22 00:45:04', NULL),
(480, 303, 'upload/products/multi-image/1797016531543599.jpg', '2024-04-22 00:48:32', NULL),
(481, 303, 'upload/products/multi-image/1797016531957519.jpg', '2024-04-22 00:48:33', NULL),
(482, 304, 'upload/products/multi-image/1797017989134152.jpg', '2024-04-22 01:11:42', NULL),
(483, 304, 'upload/products/multi-image/1797017989354824.jpg', '2024-04-22 01:11:42', NULL),
(484, 304, 'upload/products/multi-image/1797017989746210.jpg', '2024-04-22 01:11:43', NULL),
(485, 305, 'upload/products/multi-image/1797018203668905.jpg', '2024-04-22 01:15:07', NULL),
(486, 305, 'upload/products/multi-image/1797018203944808.jpg', '2024-04-22 01:15:07', NULL),
(487, 305, 'upload/products/multi-image/1797018204164605.jpg', '2024-04-22 01:15:07', NULL),
(488, 306, 'upload/products/multi-image/1797018296573317.jpg', '2024-04-22 01:16:35', NULL),
(489, 307, 'upload/products/multi-image/1797018395122180.jpg', '2024-04-22 01:18:09', NULL),
(490, 307, 'upload/products/multi-image/1797018395457691.jpg', '2024-04-22 01:18:10', NULL),
(491, 308, 'upload/products/multi-image/1797018516782913.jpg', '2024-04-22 01:20:05', NULL),
(492, 308, 'upload/products/multi-image/1797018517026878.jpg', '2024-04-22 01:20:05', NULL),
(493, 308, 'upload/products/multi-image/1797018517244398.jpg', '2024-04-22 01:20:06', NULL),
(494, 308, 'upload/products/multi-image/1797018517434899.jpg', '2024-04-22 01:20:06', NULL),
(495, 309, 'upload/products/multi-image/1797018624725154.jpg', '2024-04-22 01:21:48', NULL),
(496, 309, 'upload/products/multi-image/1797018625003389.jpg', '2024-04-22 01:21:48', NULL),
(497, 309, 'upload/products/multi-image/1797018625247069.jpg', '2024-04-22 01:21:49', NULL),
(498, 310, 'upload/products/multi-image/1797018705337014.jpg', '2024-04-22 01:23:05', NULL),
(499, 310, 'upload/products/multi-image/1797018705535588.jpg', '2024-04-22 01:23:05', NULL),
(500, 310, 'upload/products/multi-image/1797018705690415.jpg', '2024-04-22 01:23:05', NULL),
(501, 311, 'upload/products/multi-image/1797018800832718.jpg', '2024-04-22 01:24:36', NULL),
(502, 311, 'upload/products/multi-image/1797018801033228.jpg', '2024-04-22 01:24:36', NULL),
(503, 312, 'upload/products/multi-image/1797018987005380.jpg', '2024-04-22 01:27:34', NULL),
(504, 313, 'upload/products/multi-image/1797019624340950.jpg', '2024-04-22 01:37:42', NULL),
(505, 314, 'upload/products/multi-image/1797019806231602.jpg', '2024-04-22 01:40:35', NULL),
(506, 314, 'upload/products/multi-image/1797019806398351.jpg', '2024-04-22 01:40:35', NULL),
(507, 314, 'upload/products/multi-image/1797019806553420.jpg', '2024-04-22 01:40:35', NULL),
(508, 314, 'upload/products/multi-image/1797019806742891.jpg', '2024-04-22 01:40:35', NULL),
(509, 314, 'upload/products/multi-image/1797019806904674.jpg', '2024-04-22 01:40:36', NULL),
(510, 314, 'upload/products/multi-image/1797019807138258.jpg', '2024-04-22 01:40:36', NULL),
(511, 314, 'upload/products/multi-image/1797019807368598.jpg', '2024-04-22 01:40:36', NULL),
(512, 314, 'upload/products/multi-image/1797019807574524.jpg', '2024-04-22 01:40:36', NULL),
(513, 314, 'upload/products/multi-image/1797019807773069.jpg', '2024-04-22 01:40:36', NULL),
(514, 314, 'upload/products/multi-image/1797019807969336.jpg', '2024-04-22 01:40:37', NULL),
(515, 315, 'upload/products/multi-image/1797020171388899.jpg', '2024-04-22 01:46:23', NULL),
(516, 316, 'upload/products/multi-image/1797020555488605.jpg', '2024-04-22 01:52:30', NULL),
(517, 317, 'upload/products/multi-image/1797020790874143.jpg', '2024-04-22 01:56:14', NULL),
(518, 318, 'upload/products/multi-image/1797025728580699.jpg', '2024-04-22 03:14:43', NULL),
(519, 318, 'upload/products/multi-image/1797025728752661.jpg', '2024-04-22 03:14:43', NULL),
(520, 319, 'upload/products/multi-image/1797025801028447.jpg', '2024-04-22 03:15:52', NULL),
(521, 319, 'upload/products/multi-image/1797025801374026.jpg', '2024-04-22 03:15:52', NULL),
(522, 320, 'upload/products/multi-image/1797123240094859.jpg', '2024-04-23 05:04:37', NULL),
(523, 320, 'upload/products/multi-image/1797123240453306.jpg', '2024-04-23 05:04:38', NULL),
(524, 321, 'upload/products/multi-image/1797123353422904.jpg', '2024-04-23 05:06:25', NULL),
(525, 321, 'upload/products/multi-image/1797123353630499.jpg', '2024-04-23 05:06:25', NULL),
(526, 321, 'upload/products/multi-image/1797123353812454.jpg', '2024-04-23 05:06:26', NULL),
(527, 321, 'upload/products/multi-image/1797123354038889.jpg', '2024-04-23 05:06:26', NULL),
(528, 321, 'upload/products/multi-image/1797123354236879.jpg', '2024-04-23 05:06:26', NULL),
(529, 321, 'upload/products/multi-image/1797123354467998.jpg', '2024-04-23 05:06:26', NULL),
(530, 322, 'upload/products/multi-image/1797123485900882.jpg', '2024-04-23 05:08:32', NULL),
(531, 322, 'upload/products/multi-image/1797123486303284.jpg', '2024-04-23 05:08:32', NULL),
(532, 322, 'upload/products/multi-image/1797123486681712.jpg', '2024-04-23 05:08:33', NULL),
(533, 322, 'upload/products/multi-image/1797123487093667.jpg', '2024-04-23 05:08:33', NULL),
(534, 323, 'upload/products/multi-image/1797123817598183.jpg', '2024-04-23 05:13:48', NULL),
(535, 324, 'upload/products/multi-image/1797123908674615.jpg', '2024-04-23 05:15:15', NULL),
(536, 325, 'upload/products/multi-image/1797124177918975.jpg', '2024-04-23 05:19:32', NULL),
(537, 326, 'upload/products/multi-image/1797124233180637.png', '2024-04-23 05:20:25', NULL),
(538, 327, 'upload/products/multi-image/1797124373295513.jpg', '2024-04-23 05:22:38', NULL),
(539, 327, 'upload/products/multi-image/1797124373568053.jpg', '2024-04-23 05:22:38', NULL),
(540, 328, 'upload/products/multi-image/1797124431739043.jpg', '2024-04-23 05:23:34', NULL),
(541, 329, 'upload/products/multi-image/1797124625477312.jpg', '2024-04-23 05:26:38', NULL),
(542, 330, 'upload/products/multi-image/1797124705168030.jpg', '2024-04-23 05:27:54', NULL),
(543, 331, 'upload/products/multi-image/1797124894540266.jpg', '2024-04-23 05:30:55', NULL),
(544, 331, 'upload/products/multi-image/1797124894935601.jpg', '2024-04-23 05:30:55', NULL),
(545, 331, 'upload/products/multi-image/1797124895125068.jpg', '2024-04-23 05:30:56', NULL),
(546, 331, 'upload/products/multi-image/1797124895333553.jpg', '2024-04-23 05:30:56', NULL),
(547, 331, 'upload/products/multi-image/1797124895535597.jpg', '2024-04-23 05:30:56', NULL),
(548, 331, 'upload/products/multi-image/1797124895723803.jpg', '2024-04-23 05:30:56', NULL),
(549, 332, 'upload/products/multi-image/1797125456080364.jpg', '2024-04-23 05:39:51', NULL),
(550, 332, 'upload/products/multi-image/1797125456491713.jpg', '2024-04-23 05:39:51', NULL),
(551, 333, 'upload/products/multi-image/1797125594480862.jpg', '2024-04-23 05:42:03', NULL),
(552, 333, 'upload/products/multi-image/1797125594782838.jpg', '2024-04-23 05:42:03', NULL),
(553, 334, 'upload/products/multi-image/1797125980897917.jpg', '2024-04-23 05:48:11', NULL),
(554, 334, 'upload/products/multi-image/1797125981155642.jpg', '2024-04-23 05:48:11', NULL),
(555, 335, 'upload/products/multi-image/1797126150556862.jpg', '2024-04-23 05:50:53', NULL),
(556, 336, 'upload/products/multi-image/1797126220983402.jpg', '2024-04-23 05:52:00', NULL),
(557, 336, 'upload/products/multi-image/1797126221301650.jpg', '2024-04-23 05:52:00', NULL),
(558, 337, 'upload/products/multi-image/1797126630447570.jpg', '2024-04-23 05:58:31', NULL),
(559, 337, 'upload/products/multi-image/1797126630872298.jpg', '2024-04-23 05:58:31', NULL),
(560, 338, 'upload/products/multi-image/1797126700293401.jpg', '2024-04-23 05:59:37', NULL),
(561, 338, 'upload/products/multi-image/1797126700498545.jpg', '2024-04-23 05:59:37', NULL),
(562, 339, 'upload/products/multi-image/1797126778913069.jpg', '2024-04-23 06:00:52', NULL),
(563, 340, 'upload/products/multi-image/1797126832132927.jpg', '2024-04-23 06:01:43', NULL),
(564, 341, 'upload/products/multi-image/1797126901489829.jpg', '2024-04-23 06:02:49', NULL),
(565, 342, 'upload/products/multi-image/1797126959037665.jpg', '2024-04-23 06:03:44', NULL),
(566, 342, 'upload/products/multi-image/1797126959437055.jpg', '2024-04-23 06:03:44', NULL),
(567, 343, 'upload/products/multi-image/1797127036489033.jpg', '2024-04-23 06:04:58', NULL),
(568, 343, 'upload/products/multi-image/1797127036751434.jpg', '2024-04-23 06:04:58', NULL),
(569, 344, 'upload/products/multi-image/1797127126074088.jpg', '2024-04-23 06:06:23', NULL),
(570, 344, 'upload/products/multi-image/1797127126302189.jpg', '2024-04-23 06:06:23', NULL),
(571, 345, 'upload/products/multi-image/1797127173008634.jpg', '2024-04-23 06:07:08', NULL),
(572, 346, 'upload/products/multi-image/1797127249952353.jpg', '2024-04-23 06:08:21', NULL),
(573, 346, 'upload/products/multi-image/1797127250160527.jpg', '2024-04-23 06:08:22', NULL),
(574, 346, 'upload/products/multi-image/1797127250486032.jpg', '2024-04-23 06:08:22', NULL),
(575, 347, 'upload/products/multi-image/1797128929522504.jpg', '2024-04-23 06:35:03', NULL),
(576, 348, 'upload/products/multi-image/1797129065125519.jpg', '2024-04-23 06:37:12', NULL),
(577, 349, 'upload/products/multi-image/1797129181118986.jpg', '2024-04-23 06:39:03', NULL),
(578, 349, 'upload/products/multi-image/1797129181508732.jpg', '2024-04-23 06:39:03', NULL),
(579, 350, 'upload/products/multi-image/1797129230644499.jpg', '2024-04-23 06:39:50', NULL),
(580, 351, 'upload/products/multi-image/1797129324030626.jpg', '2024-04-23 06:41:19', NULL),
(582, 353, 'upload/products/multi-image/1797129408493938.jpg', '2024-04-23 06:42:40', NULL),
(583, 353, 'upload/products/multi-image/1797129408763327.jpg', '2024-04-23 06:42:40', NULL),
(584, 354, 'upload/products/multi-image/1797129521297463.jpg', '2024-04-23 06:44:27', NULL),
(585, 354, 'upload/products/multi-image/1797129521520624.jpg', '2024-04-23 06:44:28', NULL),
(590, 358, 'upload/products/multi-image/1797130198349020.jpg', '2024-04-23 06:55:13', NULL),
(591, 358, 'upload/products/multi-image/1797130198514331.jpg', '2024-04-23 06:55:13', NULL),
(592, 359, 'upload/products/multi-image/1797130272792064.jpg', '2024-04-23 06:56:24', NULL),
(594, 362, 'upload/products/multi-image/1797192661287989.jpg', '2024-04-23 23:28:02', NULL),
(595, 362, 'upload/products/multi-image/1797192661435291.jpg', '2024-04-23 23:28:03', NULL),
(596, 362, 'upload/products/multi-image/1797192661646548.jpg', '2024-04-23 23:28:03', NULL),
(597, 363, 'upload/products/multi-image/1797192740139845.jpg', '2024-04-23 23:29:18', NULL),
(598, 363, 'upload/products/multi-image/1797192740401982.jpg', '2024-04-23 23:29:18', NULL),
(599, 364, 'upload/products/multi-image/1797192973642251.jpg', '2024-04-23 23:33:00', NULL),
(600, 364, 'upload/products/multi-image/1797192973844505.jpg', '2024-04-23 23:33:00', NULL),
(601, 364, 'upload/products/multi-image/1797192974005438.jpg', '2024-04-23 23:33:01', NULL),
(602, 364, 'upload/products/multi-image/1797192974430614.jpg', '2024-04-23 23:33:01', NULL),
(603, 365, 'upload/products/multi-image/1797193042743396.jpg', '2024-04-23 23:34:06', NULL),
(604, 365, 'upload/products/multi-image/1797193043121688.jpg', '2024-04-23 23:34:07', NULL),
(605, 366, 'upload/products/multi-image/1797193295177724.jpg', '2024-04-23 23:38:07', NULL),
(606, 366, 'upload/products/multi-image/1797193295585004.jpg', '2024-04-23 23:38:08', NULL),
(607, 367, 'upload/products/multi-image/1797193490040709.jpg', '2024-04-23 23:41:13', NULL),
(608, 367, 'upload/products/multi-image/1797193490207294.jpg', '2024-04-23 23:41:13', NULL),
(609, 368, 'upload/products/multi-image/1797193584563118.jpg', '2024-04-23 23:42:43', NULL),
(610, 368, 'upload/products/multi-image/1797193584772047.jpg', '2024-04-23 23:42:43', NULL),
(611, 368, 'upload/products/multi-image/1797193584968384.jpg', '2024-04-23 23:42:43', NULL),
(612, 369, 'upload/products/multi-image/1797193726754381.jpg', '2024-04-23 23:44:59', NULL),
(613, 369, 'upload/products/multi-image/1797193726991164.jpg', '2024-04-23 23:44:59', NULL),
(614, 369, 'upload/products/multi-image/1797193727183818.jpg', '2024-04-23 23:44:59', NULL),
(615, 370, 'upload/products/multi-image/1797193966059170.jpg', '2024-04-23 23:48:47', NULL),
(616, 370, 'upload/products/multi-image/1797193966184615.jpg', '2024-04-23 23:48:47', NULL),
(617, 370, 'upload/products/multi-image/1797193966430420.jpg', '2024-04-23 23:48:47', NULL),
(618, 371, 'upload/products/multi-image/1797194085122127.jpg', '2024-04-23 23:50:40', NULL),
(619, 371, 'upload/products/multi-image/1797194085280277.jpg', '2024-04-23 23:50:40', NULL),
(620, 372, 'upload/products/multi-image/1797195656922908.jpg', '2024-04-24 00:15:39', NULL),
(621, 372, 'upload/products/multi-image/1797195657098399.jpg', '2024-04-24 00:15:39', NULL),
(622, 372, 'upload/products/multi-image/1797195657287620.jpg', '2024-04-24 00:15:40', NULL),
(623, 373, 'upload/products/multi-image/1797198786874523.jpg', '2024-04-24 01:05:24', NULL),
(624, 374, 'upload/products/multi-image/1797198836684985.jpg', '2024-04-24 01:06:12', NULL),
(625, 375, 'upload/products/multi-image/1797199053952075.jpg', '2024-04-24 01:09:39', NULL),
(626, 376, 'upload/products/multi-image/1797199121407861.jpg', '2024-04-24 01:10:43', NULL),
(627, 377, 'upload/products/multi-image/1797199247335208.jpg', '2024-04-24 01:12:43', NULL),
(628, 378, 'upload/products/multi-image/1797199357004070.jpg', '2024-04-24 01:14:28', NULL),
(629, 379, 'upload/products/multi-image/1797199587726306.jpg', '2024-04-24 01:18:08', NULL),
(630, 380, 'upload/products/multi-image/1797199698036885.jpg', '2024-04-24 01:19:53', NULL),
(631, 380, 'upload/products/multi-image/1797199698392268.jpg', '2024-04-24 01:19:54', NULL),
(632, 381, 'upload/products/multi-image/1797199799574813.jpg', '2024-04-24 01:21:30', NULL),
(633, 381, 'upload/products/multi-image/1797199799818091.jpg', '2024-04-24 01:21:30', NULL),
(634, 382, 'upload/products/multi-image/1797199852208728.jpg', '2024-04-24 01:22:20', NULL),
(635, 383, 'upload/products/multi-image/1797200106543356.jpg', '2024-04-24 01:26:23', NULL),
(636, 384, 'upload/products/multi-image/1797200547659678.jpg', '2024-04-24 01:33:23', NULL),
(637, 384, 'upload/products/multi-image/1797200547842199.jpg', '2024-04-24 01:33:24', NULL),
(638, 385, 'upload/products/multi-image/1797200760203090.jpg', '2024-04-24 01:36:46', NULL),
(639, 385, 'upload/products/multi-image/1797200760366655.jpg', '2024-04-24 01:36:46', NULL),
(640, 385, 'upload/products/multi-image/1797200760519070.jpg', '2024-04-24 01:36:46', NULL),
(641, 385, 'upload/products/multi-image/1797200760665287.jpg', '2024-04-24 01:36:47', NULL),
(642, 386, 'upload/products/multi-image/1797201304317297.jpg', '2024-04-24 01:45:25', NULL),
(643, 387, 'upload/products/multi-image/1797207249815328.png', '2024-04-24 03:19:56', NULL),
(644, 388, 'upload/products/multi-image/1797207315738901.png', '2024-04-24 03:20:59', NULL),
(645, 389, 'upload/products/multi-image/1797207394308966.jpg', '2024-04-24 03:22:13', NULL),
(646, 389, 'upload/products/multi-image/1797207394606108.jpg', '2024-04-24 03:22:13', NULL),
(647, 390, 'upload/products/multi-image/1797207574559093.jpg', '2024-04-24 03:25:05', NULL),
(648, 390, 'upload/products/multi-image/1797207574863823.jpg', '2024-04-24 03:25:05', NULL),
(649, 390, 'upload/products/multi-image/1797207575197110.jpg', '2024-04-24 03:25:06', NULL),
(650, 390, 'upload/products/multi-image/1797207575646878.jpg', '2024-04-24 03:25:06', NULL),
(651, 390, 'upload/products/multi-image/1797207575967274.jpg', '2024-04-24 03:25:06', NULL),
(652, 390, 'upload/products/multi-image/1797207576411382.jpg', '2024-04-24 03:25:07', NULL),
(653, 390, 'upload/products/multi-image/1797207576876624.jpg', '2024-04-24 03:25:07', NULL),
(654, 1, 'upload/products/multi-image/1797666480296005.jpeg', '2024-04-29 04:59:11', NULL),
(655, 1, 'upload/products/multi-image/1797666480434819.webp', '2024-04-29 04:59:12', NULL),
(656, 2, 'upload/products/multi-image/1797667565788153.jpg', '2024-04-29 05:16:27', NULL),
(657, 2, 'upload/products/multi-image/1797667566079883.jpg', '2024-04-29 05:16:27', NULL),
(658, 2, 'upload/products/multi-image/1797667566276792.jpg', '2024-04-29 05:16:27', NULL),
(659, 3, 'upload/products/multi-image/1797667749206295.jpeg', '2024-04-29 05:19:22', NULL),
(660, 3, 'upload/products/multi-image/1797667749413175.jpeg', '2024-04-29 05:19:22', NULL),
(661, 3, 'upload/products/multi-image/1797667749524145.jpeg', '2024-04-29 05:19:22', NULL),
(662, 4, 'upload/products/multi-image/1797668527985194.webp', '2024-04-29 05:31:44', NULL),
(663, 4, 'upload/products/multi-image/1797668528259629.jpg', '2024-04-29 05:31:45', NULL),
(664, 4, 'upload/products/multi-image/1797668529071389.webp', '2024-04-29 05:31:45', NULL),
(665, 5, 'upload/products/multi-image/1797668666400944.jpg', '2024-04-29 05:33:56', NULL),
(666, 5, 'upload/products/multi-image/1797668666548670.webp', '2024-04-29 05:33:57', NULL),
(667, 6, 'upload/products/multi-image/1797669249970790.jpg', '2024-04-29 05:43:13', NULL),
(668, 6, 'upload/products/multi-image/1797669250148177.jpg', '2024-04-29 05:43:13', NULL),
(669, 7, 'upload/products/multi-image/1797669550139214.jpeg', '2024-04-29 05:47:59', NULL),
(670, 7, 'upload/products/multi-image/1797669550248388.jpg', '2024-04-29 05:47:59', NULL),
(671, 8, 'upload/products/multi-image/1797670187119640.jpeg', '2024-04-29 05:58:07', NULL),
(672, 8, 'upload/products/multi-image/1797670187361778.webp', '2024-04-29 05:58:07', NULL),
(673, 9, 'upload/products/multi-image/1797671116567332.webp', '2024-04-29 06:12:53', NULL),
(674, 10, 'upload/products/multi-image/1797671277401846.webp', '2024-04-29 06:15:26', NULL),
(675, 11, 'upload/products/multi-image/1797671400016005.webp', '2024-04-29 06:17:23', NULL),
(676, 11, 'upload/products/multi-image/1797671400263461.jpg', '2024-04-29 06:17:23', NULL),
(677, 12, 'upload/products/multi-image/1797671536054934.jpg', '2024-04-29 06:19:33', NULL),
(678, 12, 'upload/products/multi-image/1797671536248649.jpg', '2024-04-29 06:19:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `upazilla_id` int DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `payment_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_charge` decimal(10,2) DEFAULT '0.00',
  `shipping_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outside_dhaka_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalbuyingPrice` decimal(11,2) DEFAULT '0.00',
  `sub_total` decimal(10,2) DEFAULT '0.00',
  `grand_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `others` int DEFAULT '0',
  `transaction_no` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` tinyint DEFAULT NULL,
  `staff_commission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `delivery_viewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `payment_status_viewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `commission_calculated` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_by` int DEFAULT '0' COMMENT '0=ecommerse,1=pos',
  `delivery_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `tracking_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picked_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Not guest order, 2=>Guest Order',
  `packaging_status` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_discount` decimal(11,2) DEFAULT '0.00',
  `created_by` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_varient` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Varient Product, 0=>Normal Product',
  `variation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `vendor_id` int DEFAULT NULL,
  `v_comission` decimal(10,2) DEFAULT '0.00',
  `tax` double(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double(20,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point_id` int DEFAULT NULL,
  `product_referral_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `paid` double(8,2) NOT NULL DEFAULT '0.00',
  `due` double(8,2) DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `payment_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advanced_type` int DEFAULT NULL,
  `transaction_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint UNSIGNED DEFAULT '1' COMMENT '0=>Return, 1=>Payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nav',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name_en`, `name_bn`, `title`, `slug`, `description_en`, `description_bn`, `position`, `status`, `created_at`, `updated_at`) VALUES
(5, 'About us', 'আমাদের সম্পর্কে', 'About us', 'about-us', 'Now shopping is easier, faster and always joyous. We help you make the best choice here.  estoreclassic.com  is the biggest online market platform for Dhaka City offering completely hassle-free shopping experience through secure and trusted gateways. We offer you easy and reliable shopping with all your favorite brands, local brand in Dhaka and more. E-storeClassic provides products from all categories such as appliance, clothing, cosmetics, electronics, footwear, jewellery, health & beauty, medicine, repair service, car rent and still counting! Our collection combines the latest in fashion trends as well as the all-time favorites. Our products collections are exclusively selected for you. We have all that you need under one Platform.\r\n\r\nIn consistency with the vision of Digital Bangladesh, E-storeClassic provide service/product to the doorway over the Internet. We constantly update with lot of new products, services and special offers. \r\n\r\n\r\n\r\nE-storeclassic gives you the best market experience possible so you can save your valuable time and money. You can pay using all types of payment gateways. If you want to return a product or service for any reason after receiving it, you will get an easy return system. So let\'s go to the estoreclassic.com .\r\n\r\nestoreclassic.com  is a one of the largest online shop for Grocery, Fashion, Electronics, Health, Beauty & Much More..', 'এখন কেনাকাটা সহজ, দ্রুত এবং সর্বদা আনন্দদায়ক। আমরা আপনাকে এখানে সেরা পছন্দ করতে সাহায্য করি। estoreclassic.com হল ঢাকা শহরের সবচেয়ে বড় অনলাইন মার্কেট প্লাটফর্ম যা নিরাপদ এবং বিশ্বস্ত গেটওয়ের মাধ্যমে সম্পূর্ণ ঝামেলামুক্ত কেনাকাটার অভিজ্ঞতা প্রদান করে। আমরা আপনাকে আপনার সমস্ত প্রিয় ব্র্যান্ড, ঢাকার স্থানীয় ব্র্যান্ড এবং আরও অনেক কিছুর সাথে সহজ এবং নির্ভরযোগ্য কেনাকাটার অফার করি। E-storeClassic সমস্ত বিভাগ থেকে পণ্য সরবরাহ করে যেমন যন্ত্রপাতি, পোশাক, প্রসাধনী, ইলেকট্রনিক্স, পাদুকা, গয়না, স্বাস্থ্য ও সৌন্দর্য, ওষুধ, মেরামত পরিষেবা, গাড়ি ভাড়া এবং এখনও গণনা করা হচ্ছে! আমাদের সংগ্রহে ফ্যাশন ট্রেন্ডের সাথে সাথে সর্বকালের পছন্দের সর্বশেষতমগুলিকে একত্রিত করা হয়েছে৷ আমাদের পণ্য সংগ্রহ একচেটিয়াভাবে আপনার জন্য নির্বাচিত করা হয়. একটি প্ল্যাটফর্মের অধীনে আপনার যা প্রয়োজন তা আমাদের কাছে রয়েছে। ডিজিটাল বাংলাদেশের রূপকল্পের সাথে সামঞ্জস্য রেখে, ইকোহাট ইন্টারনেটের মাধ্যমে দরজায় সেবা/পণ্য সরবরাহ করে। আমরা ক্রমাগত অনেক নতুন পণ্য, পরিষেবা এবং বিশেষ অফার সহ আপডেট করি। E-storeClassic  আপনাকে সম্ভাব্য সেরা বাজার অভিজ্ঞতা দেয় যাতে আপনি আপনার মূল্যবান সময় এবং অর্থ বাঁচাতে পারেন। আপনি সব ধরনের পেমেন্ট গেটওয়ে ব্যবহার করে অর্থ প্রদান করতে পারেন। প্রাপ্তির পর কোনো কারণে কোনো পণ্য বা সেবা ফেরত দিতে চাইলে আপনি একটি সহজ রিটার্ন সিস্টেম পাবেন। তো চলুন estoreclassic.com এ যাই। estoreclassic.com হল মুদি, ফ্যাশন, ইলেকট্রনিক্স, স্বাস্থ্য, সৌন্দর্য এবং আরও অনেক কিছুর জন্য একটি বৃহত্তম অনলাইন শপ।', 'Both', 1, '2022-09-19 06:38:47', '2022-11-06 04:25:11'),
(6, 'Return Policy', 'প্রত্যাবর্তন নীতিমালা', 'Return Policy', 'return-policy', 'Delivery Policy:\r\n \r\nEStoreClassic opens the doorway shop over the Internet. We (eStoreClassic) provide any amount of parched product order at your doorsteps with low delivery charge. We process all deliveries through EStoreClassic delivery service or reputed courier services. We deliver products all over the area as well as the Dhaka City. If there is any modification in delivery charge for a particular item, it is mentioned in product details. Order confirmation and delivery completion are subject to product availability. Delivery time may differ from one item to another. It can differ from standard delivery to beyond that.\r\n\r\n\r\nStandard Delivery: \r\nIf your delivery address is within Dhaka City, products will be delivered by within 1 working day. If it is outside Dhaka, it will take 2-5 business days. If you order after 6 PM, it will be considered as an order of next business day. Our Business Day: Saturday to Thursday except public holidays.\r\n\r\n\r\n\r\nDelivery from out side of Dhaka:\r\nThere are some exceptional product that we provide from outside Dhaka(Vendors from Dhaka or Other area). These Product can take 3 or more days to reach you. However, you will receive your order within the time specified.\r\n\r\nYou can make your purchases on Kafela.com.bd and get delivery from anywhere in the Dhaka City. Delivery charge varies according to customers\' place. In case of paid order, EStoreClassic cannot be held liable if customer does not receive it within 4 weeks.\r\n\r\n\r\n\r\nReplacement Policy:\r\n\r\nWe provide great customer experience each time you shop with your EStoreClassic . If you are not satisfied with your purchase, we ensure â€˜Replacementâ€™. Change of mind is not applicable for replacement of product and Our refunds and replacements do not apply to Flash Sale Product. We will replace your purchased product if the product has any defect by its supplier or if the product is not the same one you ordered. Please check your products in front of delivery man or courier service agents.\r\n\r\n\r\n\r\nAll you need to do is give us a call or drop an email at estoreclassic.com within a period of 6 hours from the time of delivery. However, please return the product with the tags intact and in their original packaging, in an unwashed and undamaged condition. Replacement for products is subject to inspection and checking by moom team. Replacement cannot be possible if the product is burnt, damaged by short circuit, or broken by customer. We give the option of taking back the product from your doorstep at Mymensingh providing our delivery man where you need to pay charge for it. Other wise, you need to send it by courier/yourself to our office address ( House no # 37(3rd floor), Road-8, Sector-12, Uttara). Damages due to neglect, improper usage or application will not be covered under our \'Replacementâ€™.\r\n\r\n\r\n\r\nIn case of product\'s sold out at merchant\'s end, customer can choose any other product from our website or can keep the amount refund to his/her wallet account.\r\n\r\n\r\n\r\nNote: Product Change or warranty of product is depend on policy of Seller/Manufacturer.', 'ডেলিভারি নীতি:  ই-স্টোরক্লাসিক ইন্টারনেটের মাধ্যমে দরজার দোকান খুলেছে। আমরা (ই-স্টোরক্লাসিক) কম ডেলিভারি চার্জ সহ আপনার দোরগোড়ায় যে কোনও পরিমাণ পার্চড পণ্যের অর্ডার সরবরাহ করি। আমরা ই-স্টোরক্লাসিক ডেলিভারি পরিষেবা বা নামী কুরিয়ার পরিষেবার মাধ্যমে সমস্ত ডেলিভারি প্রক্রিয়া করি। আমরা ঢাকা শহরের পাশাপাশি পুরো এলাকায় পণ্য সরবরাহ করি। যদি কোনো নির্দিষ্ট আইটেমের জন্য ডেলিভারি চার্জে কোনো পরিবর্তন থাকে, তবে তা পণ্যের বিবরণে উল্লেখ করা হয়। অর্ডার নিশ্চিতকরণ এবং বিতরণ সমাপ্তি পণ্য প্রাপ্যতা সাপেক্ষে. ডেলিভারি সময় এক আইটেম থেকে অন্য ভিন্ন হতে পারে. এটি স্ট্যান্ডার্ড ডেলিভারি থেকে এর বাইরেও আলাদা হতে পারে। স্ট্যান্ডার্ড ডেলিভারি: আপনার ডেলিভারির ঠিকানা যদি ঢাকা শহরের মধ্যে হয়, পণ্যগুলি 1 কার্যদিবসের মধ্যে ডেলিভারি করা হবে। ঢাকার বাইরে হলে ২-৫ কার্যদিবস লাগবে। আপনি যদি সন্ধ্যা 6 টার পরে অর্ডার করেন তবে এটি পরবর্তী ব্যবসায়িক দিনের অর্ডার হিসাবে বিবেচিত হবে। আমাদের ব্যবসার দিন: সরকারি ছুটির দিন ছাড়া শনিবার থেকে বৃহস্পতিবার। ঢাকার বাইরে থেকে ডেলিভারি: কিছু ব্যতিক্রমী পণ্য রয়েছে যা আমরা ঢাকার বাইরে থেকে সরবরাহ করি (ঢাকা বা অন্যান্য এলাকার বিক্রেতারা)। এই পণ্যগুলি আপনার কাছে পৌঁছাতে 3 বা তার বেশি দিন সময় নিতে পারে। যাইহোক, আপনি নির্দিষ্ট সময়ের মধ্যে আপনার অর্ডার পাবেন। আপনি estoreclassic.com-এ আপনার কেনাকাটা করতে পারেন এবং ঢাকা শহরের যেকোনো স্থান থেকে ডেলিভারি পেতে পারেন। ডেলিভারি চার্জ গ্রাহকদের স্থান অনুযায়ী পরিবর্তিত হয়। পেইড অর্ডারের ক্ষেত্রে, গ্রাহক 4 সপ্তাহের মধ্যে না পেলে ই-স্টোরক্লাসিককে দায়ী করা যাবে না। প্রতিস্থাপন নীতি: আপনি যখনই আপনার ই-স্টোরক্লাসিকের সাথে কেনাকাটা করেন তখন আমরা গ্রাহকদের দুর্দান্ত অভিজ্ঞতা প্রদান করি। আপনি যদি আপনার ক্রয়ের সাথে সন্তুষ্ট না হন তবে আমরা \"প্রতিস্থাপন\" নিশ্চিত করি৷ মন পরিবর্তন পণ্যের প্রতিস্থাপনের জন্য প্রযোজ্য নয় এবং আমাদের ফেরত এবং প্রতিস্থাপন ফ্ল্যাশ বিক্রয় পণ্যের জন্য প্রযোজ্য নয়। যদি পণ্যটির সরবরাহকারীর দ্বারা পণ্যটিতে কোনো ত্রুটি থাকে বা পণ্যটি আপনার অর্ডার করা একই না হয় তবে আমরা আপনার কেনা পণ্যটি প্রতিস্থাপন করব। ডেলিভারি ম্যান বা কুরিয়ার সার্ভিস এজেন্টদের সামনে আপনার পণ্য চেক করুন. আপনাকে যা করতে হবে তা হল ডেলিভারির সময় থেকে 6 ঘন্টার মধ্যে estoreclassic.com-এ আমাদের একটি কল বা একটি ইমেল ড্রপ করুন৷ যাইহোক, অনুগ্রহ করে অক্ষত ট্যাগ সহ পণ্যটি এবং তাদের আসল প্যাকেজিংয়ে, একটি ধোয়া ও ক্ষয়বিহীন অবস্থায় ফেরত দিন। পণ্যের প্রতিস্থাপন মুম টিম দ্বারা পরিদর্শন এবং চেক সাপেক্ষে। পণ্যটি পুড়ে গেলে, শর্ট সার্কিটের কারণে ক্ষতিগ্রস্ত হলে বা গ্রাহকের দ্বারা ভেঙে গেলে প্রতিস্থাপন সম্ভব নয়। আমরা ময়মনসিংহে আমাদের ডেলিভারি ম্যান সরবরাহ করে আপনার দোরগোড়া থেকে পণ্যটি ফেরত নেওয়ার বিকল্প দিই যেখানে আপনাকে এটির জন্য চার্জ দিতে হবে। অন্যথায়, আপনাকে আমাদের অফিসের ঠিকানায় (বাড়ি নং # ৩0(৩য় তলা), রোড-৩/ডি, সেক্টর-৯, উত্তরা) কুরিয়ারের মাধ্যমে পাঠাতে হবে। অবহেলা, অনুপযুক্ত ব্যবহার বা প্রয়োগের কারণে ক্ষতি আমাদের \'প্রতিস্থাপন\'-এর অধীনে কভার করা হবে না। মার্চেন্টের শেষে পণ্য বিক্রি হয়ে গেলে, গ্রাহক আমাদের ওয়েবসাইট থেকে অন্য কোনো পণ্য বেছে নিতে পারেন বা তার ওয়ালেট অ্যাকাউন্টে অর্থ ফেরত রাখতে পারেন। দ্রষ্টব্য: পণ্য পরিবর্তন বা পণ্যের ওয়ারেন্টি বিক্রেতা / প্রস্তুতকারকের নীতির উপর নির্ভর করে।', 'Both', 0, '2022-09-19 06:31:58', '2024-01-29 04:54:02'),
(7, 'Support & Policy', 'সমর্থন এবং নীতি', 'Support & Policy', 'support--policy', 'Now shopping is easier, faster and always joyous. We help you make the best choice here. estoreclassic.com  is the biggest online market platform for Dhaka City offering completely hassle-free shopping experience through secure and trusted gateways. We offer you easy and reliable shopping with all your favorite brands, local brand in Dhaka and more. E-storeClassic provides products from all categories such as appliance, clothing, cosmetics, electronics, footwear, jewellery, health & beauty, medicine, repair service, car rent and still counting! Our collection combines the latest in fashion trends as well as the all-time favorites. Our products collections are exclusively selected for you. We have all that you need under one Platform.\r\n\r\n \r\n\r\nIn consistency with the vision of Digital Bangladesh, E-storeClassic provide service/product to the doorway over the Internet. We constantly update with lot of new products, services and special offers.\r\n\r\n \r\n\r\nWe provide our customers with memorable online shopping experience. We provide on-time delivery of products and quick resolution of any concerns. You can choose whatever you like. We deliver it right at your address across Dhaka City. Our services are at your doorsteps all the time. Select the best products for you or your family with the best online marketing experience every time. You will fell love online marketing with estoreclassic.com.', 'এখন কেনাকাটা সহজ, দ্রুত এবং সর্বদা আনন্দদায়ক। আমরা আপনাকে এখানে সেরা পছন্দ করতে সাহায্য করি। estoreclassic.com হল ঢাকা শহরের সবচেয়ে বড় অনলাইন মার্কেট প্লাটফর্ম যা নিরাপদ এবং বিশ্বস্ত গেটওয়ের মাধ্যমে সম্পূর্ণ ঝামেলামুক্ত কেনাকাটার অভিজ্ঞতা প্রদান করে। আমরা আপনাকে আপনার সমস্ত প্রিয় ব্র্যান্ড, ঢাকার স্থানীয় ব্র্যান্ড এবং আরও অনেক কিছুর সাথে সহজ এবং নির্ভরযোগ্য কেনাকাটার অফার করি। e-storeclassic সমস্ত বিভাগ থেকে পণ্য সরবরাহ করে যেমন যন্ত্রপাতি, পোশাক, প্রসাধনী, ইলেকট্রনিক্স, পাদুকা, গহনা, স্বাস্থ্য ও সৌন্দর্য, ওষুধ, মেরামত পরিষেবা, গাড়ি ভাড়া এবং এখনও গণনা! আমাদের সংগ্রহে ফ্যাশন ট্রেন্ডের সাথে সাথে সর্বকালের পছন্দের সর্বশেষতমগুলিকে একত্রিত করা হয়েছে৷ আমাদের পণ্য সংগ্রহ একচেটিয়াভাবে আপনার জন্য নির্বাচিত করা হয়. একটি প্ল্যাটফর্মের অধীনে আপনার যা প্রয়োজন তা আমাদের কাছে রয়েছে। ডিজিটাল বাংলাদেশের রূপকল্পের সাথে সামঞ্জস্য রেখে, ইকোহাট ইন্টারনেটের মাধ্যমে দরজায় সেবা/পণ্য সরবরাহ করে। আমরা ক্রমাগত অনেক নতুন পণ্য, পরিষেবা এবং বিশেষ অফার সহ আপডেট করি। আমরা আমাদের গ্রাহকদের স্মরণীয় অনলাইন কেনাকাটার অভিজ্ঞতা প্রদান করি। আমরা পণ্যের সময়মতো ডেলিভারি এবং যেকোনো উদ্বেগের দ্রুত সমাধান প্রদান করি। আপনি যা খুশি চয়ন করতে পারেন। আমরা ঢাকা শহরে আপনার ঠিকানায় পৌঁছে দিই। আমাদের সেবা সব সময় আপনার দোরগোড়ায় আছে. প্রতিবার সেরা অনলাইন মার্কেটিং অভিজ্ঞতা সহ আপনার বা আপনার পরিবারের জন্য সেরা পণ্যগুলি নির্বাচন করুন৷ আপনি estoreclassic.com এর সাথে অনলাইন মার্কেটিং প্রেমে পড়বেন', 'Both', 0, '2022-09-19 06:35:44', '2024-01-29 04:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_carts`
--

CREATE TABLE `pos_carts` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `sub_category_id` int DEFAULT NULL,
  `sub_sub_category_id` int DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `campaing_id` int DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double NOT NULL DEFAULT '0',
  `is_wholesell` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Wholesell, 0=>Not Wholesell',
  `wholesell_price` double NOT NULL DEFAULT '0',
  `wholesell_minimum_qty` int NOT NULL DEFAULT '0',
  `regular_price` double NOT NULL DEFAULT '0',
  `discount_price` double NOT NULL DEFAULT '0',
  `discount_type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Flat, 2=>Percentage',
  `minimum_buy_qty` int NOT NULL DEFAULT '1',
  `stock_qty` int NOT NULL DEFAULT '0',
  `low_qty` int NOT NULL DEFAULT '0',
  `previous_stock` int DEFAULT '0',
  `product_thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_description_bn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_bn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_varient` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Varient, 0=>Not Varient',
  `attribute_values` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured',
  `is_deals` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Deals, 0=>Not Deals',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `is_approved` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Approved, 0=>Not Approved',
  `is_digital` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Digital, 0=>Not Digital',
  `top_selling` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Top selling, 0=>Not Top selling',
  `new_arrival` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>New Arrival, 0=>Not New Arrival',
  `show_stock` int DEFAULT '1',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `tags`, `vendor_id`, `supplier_id`, `unit_id`, `campaing_id`, `name_en`, `name_bn`, `slug`, `product_code`, `unit_weight`, `purchase_price`, `is_wholesell`, `wholesell_price`, `wholesell_minimum_qty`, `regular_price`, `discount_price`, `discount_type`, `minimum_buy_qty`, `stock_qty`, `low_qty`, `previous_stock`, `product_thumbnail`, `short_description_en`, `short_description_bn`, `description_en`, `description_bn`, `attributes`, `is_varient`, `attribute_values`, `variations`, `is_featured`, `is_deals`, `status`, `is_approved`, `is_digital`, `top_selling`, `new_arrival`, `show_stock`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, NULL, NULL, '', 0, 0, 0, NULL, 'Robert Wine Handmade Leather Brogue Shoes', 'Robert Wine Handmade Leather Brogue Shoes', 'Robert-Wine-Handmade-Leather-Brogue-Shoes-ZwYjZ', '15473', NULL, 1500, 0, 2300, 0, 1800, 0, 1, 1, 20, 2, 20, 'upload/products/thumbnails/1797666479996046.webp', '<p>Robert Wine Handmade Leather Brogue Shoes<br></p>', '<p>Robert Wine Handmade Leather Brogue Shoes<br></p>', '<p>Robert Wine Handmade Leather Brogue Shoes<br></p>', '<p>Robert Wine Handmade Leather Brogue Shoes<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 04:59:11', '2024-04-29 04:59:21'),
(2, NULL, 6, NULL, NULL, '', 0, 0, 0, NULL, 'Handbag for women made of genuine leather black', 'Handbag for women made of genuine leather black', 'Handbag-for-women-made-of-genuine-leather-black-Bg0IC', '82354', NULL, 1300, 0, 0, 0, 2800, 0, 1, 1, 10, 1, 10, 'upload/products/thumbnails/1797667565643222.jpg', '<p>Handbag for women made of genuine leather black<br></p>', '<p>Handbag for women made of genuine leather black<br></p>', '<p>Handbag for women made of genuine leather black<br></p>', '<p>Handbag for women made of genuine leather black<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:16:26', '2024-04-29 05:16:27'),
(3, NULL, 6, NULL, NULL, '', 0, 0, 0, NULL, 'Importated Leather Ladis bag', 'Importated Leather Ladis bag', 'Importated-Leather-Ladis-bag-wTqqY', '28381', NULL, 1000, 0, 0, 0, 2000, 0, 1, 1, 10, 2, 10, 'upload/products/thumbnails/1797667749149943.jpeg', '<p>Importated Leather Ladis bag<br></p>', '<p>Importated Leather Ladis bag<br></p>', '<p>Importated Leather Ladis bag<br></p>', '<p>Importated Leather Ladis bag<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:19:21', '2024-04-29 05:19:22'),
(4, NULL, 6, NULL, NULL, '', 0, 0, 0, NULL, 'Leather Black Pattern Hanging Bag', 'Leather Black Pattern Hanging Bag', 'Leather-Black-Pattern-Hanging-Bag-JsSMk', '70528', NULL, 1200, 0, 0, 0, 1950, 0, 1, 1, 15, 2, 15, 'upload/products/thumbnails/1797668527872820.webp', '<p>Leather Black Pattern Hanging Bag<br></p>', '<p>Leather Black Pattern Hanging Bag<br></p>', '<p>Leather Black Pattern Hanging Bag<br></p>', '<p>Leather Black Pattern Hanging Bag<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:31:44', '2024-04-29 05:31:45'),
(5, NULL, 6, NULL, NULL, '', 0, 0, 0, NULL, 'Classic Bifold Wallet, Women Leather Wallet', 'Classic Bifold Wallet, Women Leather Wallet', 'Classic-Bifold-Wallet-Women-Leather-Wallet-37FSQ', '97975', NULL, 900, 0, 0, 0, 1560, 0, 1, 1, 8, 0, 8, 'upload/products/thumbnails/1797668666334017.jpg', '<p>Classic Bifold Wallet, Women Leather Wallet<br></p>', '<p>Classic Bifold Wallet, Women Leather Wallet<br></p>', '<p>Classic Bifold Wallet, Women Leather Wallet<br></p>', '<p>Classic Bifold Wallet, Women Leather Wallet<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:33:56', '2024-04-29 05:33:57'),
(6, NULL, 7, NULL, NULL, '', 0, 0, 0, NULL, 'Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col', 'Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col', 'Fashion-Hollow-Leaf-Womens-Wallets-Casual-Pu-Leather-Wallet-Solid-Col-lAE1W', '99178', NULL, 700, 0, 0, 0, 1300, 0, 1, 1, 10, 2, 10, 'upload/products/thumbnails/1797669249774337.jpg', '<p>Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col<br></p>', '<p>Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col<br></p>', '<p>Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col<br></p>', '<p>Fashion Hollow Leaf Women\'s Wallets Casual Pu Leather Wallet Solid Col<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:43:13', '2024-04-29 05:43:13'),
(7, NULL, 7, NULL, NULL, '', 0, 0, 0, NULL, 'Womens Wallets Online', 'Womens Wallets Online', 'Womens-Wallets-Online-X5SFJ', '50393', NULL, 600, 0, 0, 0, 900, 0, 1, 1, 12, 2, 12, 'upload/products/thumbnails/1797669549985900.jpg', '<p>Womens Wallets Online<br></p>', '<p>Womens Wallets Online<br></p>', '<p>Womens Wallets Online<br></p>', '<p>Womens Wallets Online<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:47:59', '2024-04-29 05:47:59'),
(8, NULL, 3, NULL, NULL, '', 0, 0, 0, NULL, 'Shop Real Leather Accessories', 'Shop Real Leather Accessories', 'Shop-Real-Leather-Accessories-S9ZAG', '57551', NULL, 2000, 0, 0, 0, 3200, 0, 1, 1, 10, 2, 10, 'upload/products/thumbnails/1797670186920556.webp', '<p>Shop Real Leather Accessories<br></p>', '<p>Shop Real Leather Accessories<br></p>', '<p>Shop Real Leather Accessories<br></p>', '<p>Shop Real Leather Accessories<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 05:58:06', '2024-04-29 05:58:07'),
(9, NULL, 15, NULL, NULL, '', 0, 0, 0, NULL, 'Complete combo for men', 'Complete combo for men', 'Complete-combo-for-men-ds0ou', '31635', NULL, 1500, 0, 0, 0, 2500, 0, 1, 1, 10, 2, 10, 'upload/products/thumbnails/1797671116479896.webp', '<p>Complete combo for men<br></p>', '<p>Complete combo for men<br></p>', '<p>Complete combo for men<br></p>', '<p>Complete combo for men<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 06:12:53', '2024-04-29 06:12:53'),
(10, NULL, 14, NULL, NULL, '', 0, 0, 0, NULL, 'For Home Brown Leather Floor Carpet', 'For Home Brown Leather Floor Carpet', 'For-Home-Brown-Leather-Floor-Carpet-nGjuX', '93120', NULL, 2900, 0, 0, 0, 3500, 0, 1, 1, 5, 0, 5, 'upload/products/thumbnails/1797671277184844.webp', '<p>For Home Brown Leather Floor Carpet<br></p>', '<p>For Home Brown Leather Floor Carpet<br></p>', '<p>For Home Brown Leather Floor Carpet<br></p>', '<p>For Home Brown Leather Floor Carpet<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 06:15:26', '2024-04-29 06:15:26'),
(11, NULL, 2, NULL, NULL, '', 0, 0, 0, NULL, 'Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown', 'Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown', 'Fashion-Mens-Outdoor-Casual-Windproof-Leather-Jacket-Red-Brown-C9eFp', '48491', NULL, 2200, 0, 0, 0, 3600, 0, 1, 1, 15, 2, 15, 'upload/products/thumbnails/1797671399951134.jpg', '<p>Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown<br></p>', '<p>Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown<br></p>', '<p>Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown<br></p>', '<p>Fashion Men\'s Outdoor Casual Windproof Leather Jacket-Red Brown<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 06:17:23', '2024-04-29 06:17:23'),
(12, NULL, 12, NULL, NULL, '', 0, 0, 0, NULL, 'Leather Trolley Bag, carry on luggage with wheels', 'Leather Trolley Bag, carry on luggage with wheels', 'Leather-Trolley-Bag-carry-on-luggage-with-wheels-htOwn', '50506', NULL, 3500, 0, 0, 0, 5000, 0, 1, 1, 15, 2, 15, 'upload/products/thumbnails/1797671535721534.jpg', '<p>Leather Trolley Bag, carry on luggage with wheels<br></p>', '<p>Leather Trolley Bag, carry on luggage with wheels<br></p>', '<p>Leather Trolley Bag, carry on luggage with wheels<br></p>', '<p>Leather Trolley Bag, carry on luggage with wheels<br></p>', '[]', 0, '[]', NULL, 1, 1, 1, 1, 0, 1, 1, 1, 4, '2024-04-29 06:19:33', '2024-04-29 06:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `varient` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `qty` mediumint DEFAULT NULL,
  `pre_qty` int DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_no` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reasons` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=>Ordered Wrong Product, 2=>Received Wrong Product, 3=>Product is damaged & defective, 4=>Others',
  `approved` int DEFAULT '0' COMMENT '0=>approved,1=>returnComplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_no` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reasons` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=>Ordered Wrong Product, 2=>Received Wrong Product, 3=>Product is damaged & defective, 4=>Others',
  `approved` int DEFAULT '0' COMMENT '0=approve,1=returncomplete\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` double DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"2\",\"5\",\"6\",\"9\",\"10\",\"13\",\"14\",\"17\",\"18\",\"19\",\"21\",\"22\",\"23\"]', '2022-09-28 05:05:01', '2023-12-13 23:19:36'),
(2, 'Accountant', '[\"1\",\"2\",\"5\",\"13\",\"14\",\"15\",\"16\",\"17\",\"41\",\"42\",\"43\",\"44\"]', '2022-09-28 05:06:43', '2023-11-28 23:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `color`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Modam BD', 0, '2022-08-22 02:57:04', '2024-04-29 02:38:02'),
(2, 'site_logo', 'upload/setting/logo/1714385191modam.png', 0, '2022-08-03 12:46:20', '2024-04-29 04:06:31'),
(3, 'site_favicon', 'upload/setting/favicon/1714385191modam.png', 0, '2022-08-04 12:46:20', '2024-04-29 04:06:31'),
(4, 'site_footer_logo', 'upload/setting/logo/1714385191modam.png', 0, '2022-08-03 12:46:20', '2024-04-29 04:06:31'),
(5, 'phone', '01700000000', 0, '2022-08-04 12:47:27', '2024-04-29 02:38:02'),
(6, 'email', 'info@modambd.com', 0, '2022-08-12 12:47:52', '2024-04-29 02:38:02'),
(7, 'business_name', 'Modam BD', 0, '2022-08-08 12:48:27', '2024-04-29 02:38:02'),
(8, 'business_address', 'Dhaka-1216, Bangladesh', 0, '2022-08-04 12:48:53', '2024-04-29 02:38:02'),
(9, 'business_hours', '10:00 - 8:00, Sa - Thu', 0, '2022-08-01 12:49:29', NULL),
(10, 'copy_right', 'Modam BD', 0, '2022-08-05 12:49:58', '2024-04-29 02:38:02'),
(11, 'developed_by', 'Classic IT & Sky Mart Ltd.', 0, '2022-08-14 12:50:24', NULL),
(12, 'developer_link', 'https://www.classicit.com.bd/', 0, '2022-08-13 12:50:56', NULL),
(13, 'facebook_url', 'https://www.facebook.com/ModamBD', 0, '2022-08-18 12:51:19', '2024-04-29 02:38:02'),
(14, 'twitter_url', 'https://www.twitter.com/', 0, '2022-08-17 12:51:45', NULL),
(15, 'linkedin_url', 'https://www.linkedin.com/', 0, '2022-08-12 12:52:12', NULL),
(16, 'youtube_url', 'https://www.youtube.com', 0, '2022-08-04 12:52:42', '2024-04-29 02:38:02'),
(17, 'instagram_url', 'https://www.instagram.com/', 0, '2022-08-11 12:53:11', '2024-04-29 02:38:02'),
(18, 'pinterest_url', 'https://www.pinterest.com/', 0, '2022-08-05 12:53:45', NULL),
(19, 'guest_checkout', '0', 0, '2022-09-21 05:45:31', '2023-11-22 20:02:49'),
(20, 'otp_system', '0', 0, '2022-09-21 05:45:31', '2022-10-24 03:27:39'),
(21, 'multi_vendor', '1', 0, '2022-10-08 04:08:02', '2022-10-24 03:28:25'),
(22, 'messenger_page_id', '100461018808781', 0, '2023-03-04 06:20:19', NULL),
(23, 'messenger_version', 'v13.0', 0, '2023-03-04 06:20:20', NULL),
(24, 'messenger_status', '1', 0, '2023-03-04 06:26:27', '2023-03-04 03:42:15'),
(25, 'pixel_id', '719731932533250', 0, '2023-03-04 06:34:25', NULL),
(26, 'pixel_version', '2.0', 0, '2023-03-04 06:34:25', '2023-03-04 00:42:49'),
(27, 'pixel_status', '1', 0, '2023-03-04 06:34:25', '2023-03-04 03:42:15'),
(28, 'vendor_comission', '10', 0, '2023-09-27 08:52:03', '2023-09-27 02:54:27'),
(30, 'premium_membership', '10000', 0, '2023-11-16 06:24:54', '2023-12-30 23:56:20'),
(32, 'maintenance', '0', 0, '2023-12-27 10:17:59', '2024-01-15 04:59:04'),
(33, 'tiktok_url', 'https://www.tiktok.com/', 0, '2024-03-06 05:29:13', '2024-03-06 05:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Inside Dhaka, 2=>Outside Dhaka, 3=>Outside Dhaka City',
  `shipping_charge` double(20,2) NOT NULL DEFAULT '0.00',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `type`, `shipping_charge`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Redex', 1, 80.00, '48 Hours', 1, '2022-09-03 03:40:16', '2023-09-05 23:47:22'),
(2, 'Sundarban Courier', 2, 140.00, 'Within 1-5 Days', 1, '2022-09-03 03:39:25', '2023-09-05 23:48:17'),
(6, 'Pathao', 3, 140.00, 'Within 3 Days', 1, '2023-09-06 06:19:06', '2023-12-30 23:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `slider_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `title_en`, `title_bn`, `slider_url`, `description_bn`, `description_en`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'upload/slider/1797662932626970.webp', 'Slider-1', 'Slider-1', '#', 'Slider-1', 'Slider-1', 'slider-1', 1, '2024-04-29 04:02:49', '2024-04-29 04:02:49'),
(2, 'upload/slider/1797662963504120.webp', 'Slider-2', 'Slider-2', '#', 'Slider-2', 'Slider-2', 'slider-2', 1, '2024-04-29 04:03:18', '2024-04-29 04:03:18'),
(3, 'upload/slider/1797662994813424.webp', 'Slider-3', 'Slider-3', '#', 'Slider-3', 'Slider-3', 'slider-3', 1, '2024-04-29 04:03:48', '2024-04-29 04:03:48'),
(4, 'upload/slider/1797663011071471.webp', 'Slider-4', 'Slider-4', '#', 'Slider-4', 'Slider-4', 'slider-4', 1, '2024-04-29 04:04:03', '2024-04-29 04:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `sms_providers`
--

CREATE TABLE `sms_providers` (
  `id` bigint NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>Active, 0=>Inactive',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_providers`
--

INSERT INTO `sms_providers` (`id`, `name`, `status`, `url`, `api_key`, `sender_id`, `created_at`, `updated_at`) VALUES
(1, 'Classic IT', 1, 'http://sms.classicit.com.bd/smsapi', 'R6001640623a9516bf1f71.13295352', 'Classic IT', '2022-04-25 21:27:37', '2022-05-24 11:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `name`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'registration_verification', '[[site_name]] রেজিস্ট্রেশন ভেরিফিকেশন কোডঃ [[code]]', 1, '2022-04-25 22:02:02', '2022-04-25 22:07:22'),
(2, 'login_verification', '[[site_name]] লগিন ভেরিফিকেশন কোডঃ [[code]]', 1, '2022-04-25 22:02:46', '2022-04-25 22:07:36'),
(3, 'order_message', 'আপনার অর্ডার সম্পন্ন হয়েছে। অর্ডার  আইডিঃ [[order_code]], মূল্যঃ [[order_amount]] টাকা। - [[site_name]]', 1, '2022-04-25 22:03:12', '2022-05-24 11:38:23'),
(5, 'password_reset', 'আপনার নতুন পাসওয়ার্ডঃ [[code]]', 1, '2022-06-22 06:42:46', '2022-06-22 06:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'aghuedgdeg@hhfsdfhg', '2022-11-07 05:52:32', '2022-11-07 05:52:32'),
(2, 'najmulcse2@gmail.com', '2023-08-28 02:40:13', '2023-08-28 02:40:13'),
(3, 'dfdfdsf@gmail.com', '2023-08-29 06:01:53', '2023-08-29 06:01:53'),
(4, 'dsklf@gmail.com', '2023-08-29 06:31:10', '2023-08-29 06:31:10'),
(5, 'user@gmail.com', '2023-08-31 02:33:20', '2023-08-31 02:33:20'),
(6, 'rahim@gmail.com', '2023-09-06 00:35:24', '2023-09-06 00:35:24'),
(7, 'bjkKOc.mcwhmht@carnana.art', '2024-01-15 00:55:47', '2024-01-15 00:55:47'),
(8, 'rUdSTj.chmhhtb@spectrail.world', '2024-02-01 09:55:21', '2024-02-01 09:55:21'),
(9, 'digwiyasut@outlook.com', '2024-02-04 08:37:55', '2024-02-04 08:37:55'),
(10, 'boniblakt313@gmail.com', '2024-03-07 11:18:22', '2024-03-07 11:18:22'),
(11, 'qtqwhqjjh.d@monochord.xyz', '2024-03-15 03:19:14', '2024-03-15 03:19:14'),
(12, 'richard_dawsonc9ab@outlook.com', '2024-03-16 17:17:28', '2024-03-16 17:17:28'),
(13, 'phbmbcmqw.d@monochord.xyz', '2024-03-21 03:52:04', '2024-03-21 03:52:04'),
(14, 'waltvalfri1982@gmail.com', '2024-03-21 03:59:30', '2024-03-21 03:59:30'),
(15, 'qjhtjhdwpc.d@monochord.xyz', '2024-03-23 20:05:40', '2024-03-23 20:05:40'),
(16, 'qthjjmhwtd.d@monochord.xyz', '2024-03-26 21:32:08', '2024-03-26 21:32:08'),
(17, 'djonahpc936@gmail.com', '2024-04-11 17:58:28', '2024-04-11 17:58:28'),
(18, 'brammerjohn2022@yahoo.com', '2024-04-13 21:32:39', '2024-04-13 21:32:39'),
(19, 'smith_sarah6181@yahoo.com', '2024-04-20 01:43:42', '2024-04-20 01:43:42'),
(20, 'steven_springs5746@yahoo.com', '2024-04-22 19:12:41', '2024-04-22 19:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `subcategory_id` int DEFAULT NULL,
  `name_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subsubcategory_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_feature` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Active, 0=>Inactive',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(5, 'Eric Spears', '0178869873', 'volipi@mailinator.com', 'Vel unde sint velit', 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_slug_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_slug_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Slices (Slice)', 1, 4, '2022-12-31 00:27:02', '2024-04-20 23:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `upazillas`
--

CREATE TABLE `upazillas` (
  `id` int NOT NULL,
  `district_id` int NOT NULL,
  `name_en` varchar(25) NOT NULL,
  `name_bn` varchar(25) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `upazillas`
--

INSERT INTO `upazillas` (`id`, `district_id`, `name_en`, `name_bn`, `url`) VALUES
(1, 1, 'Devidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd'),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd'),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd'),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd'),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd'),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd'),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd'),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd'),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd'),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd'),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd'),
(12, 1, 'Megna', 'মেঘনা', 'meghna.comilla.gov.bd'),
(13, 1, 'Monohorgonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd'),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd'),
(15, 1, 'Titash', 'তিতাস', 'titas.comilla.gov.bd'),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd'),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd'),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd'),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd'),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd'),
(21, 2, 'Ful-Gazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd'),
(22, 2, 'Pashuram', 'পরশুরাম', 'parshuram.feni.gov.bd'),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd'),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd'),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd'),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd'),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd'),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd'),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd'),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd'),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd'),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    '),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd'),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd'),
(35, 4, 'Kawkhali Thana', 'কাউখালী', 'kawkhali.rangamati.gov.bd'),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd'),
(37, 4, 'Barakal', 'বরকল', 'barkal.rangamati.gov.bd'),
(38, 4, 'Longachh', 'লংগদু', 'langadu.rangamati.gov.bd'),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd'),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd'),
(41, 4, 'Jarachhari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd'),
(42, 4, 'Nanichhar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd'),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd'),
(44, 5, 'Companigonj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd'),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd'),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd'),
(47, 5, 'Subornochar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd'),
(48, 5, 'Kobirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd'),
(49, 5, 'Senbag', 'সেনবাগ', 'senbug.noakhali.gov.bd'),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd'),
(51, 5, 'Sonaimuri', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd'),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd'),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd'),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd'),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd'),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd'),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd'),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd'),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd'),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd'),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd'),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd'),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd'),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd'),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd'),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd'),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd'),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd'),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd'),
(70, 8, 'Bashkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd'),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd'),
(72, 8, 'Anawara', 'আনোয়ারা', 'anwara.chittagong.gov.bd'),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd'),
(74, 8, 'Satkaniya', 'সাতকানিয়া', 'satkania.chittagong.gov.bd'),
(75, 8, 'CTG - Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd'),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd'),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd'),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd'),
(79, 8, 'Karnophuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd'),
(80, 9, 'Cox\'s bazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd'),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd'),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd'),
(83, 9, 'Ukhia', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd'),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd'),
(85, 9, 'Pakua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd'),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd'),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd'),
(88, 10, 'Khagrachari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd'),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd'),
(90, 10, 'Panchhari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd'),
(91, 10, 'Lakkhichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd'),
(92, 10, 'Mahalchhari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd'),
(93, 10, 'Manikchhari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd'),
(94, 10, 'Ramgar', 'রামগড়', 'ramgarh.khagrachhari.gov.bd'),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd'),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd'),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd'),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd'),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd'),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd'),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd'),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd'),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd'),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd'),
(105, 12, 'Chowhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd'),
(106, 12, 'Kamarkhanda', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd'),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd'),
(108, 12, 'Rayganj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd'),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd'),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd'),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd'),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd'),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd'),
(114, 13, 'Ishwardi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd'),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd'),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd'),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd'),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd'),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd'),
(120, 13, 'Sathia', 'সাঁথিয়া', 'santhia.pabna.gov.bd'),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd'),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd'),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd'),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd'),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd'),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd'),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd'),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd'),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd'),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd'),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd'),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd'),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd'),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd'),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd'),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd'),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd'),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd'),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd'),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd'),
(141, 15, 'Tanor', 'তানোর', 'tanore.rajshahi.gov.bd'),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd'),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd'),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd'),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd'),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd'),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd'),
(148, 16, 'Gurdaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd'),
(149, 16, 'Naldanga - Natore', 'নলডাঙ্গা', 'naldanga.natore.gov.bd'),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd'),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd'),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd'),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd'),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd'),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd'),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd'),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd'),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd'),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd'),
(160, 19, 'Mohadebpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd'),
(161, 19, 'Bodolgaci', 'বদলগাছী', 'badalgachi.naogaon.gov.bd'),
(162, 19, 'Potnitola', 'পত্নিতলা', 'patnitala.naogaon.gov.bd'),
(163, 19, 'Dhamairhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd'),
(164, 19, 'Niyamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd'),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd'),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd'),
(167, 19, 'Raninagaor', 'রাণীনগর', 'raninagar.naogaon.gov.bd'),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd'),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd'),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd'),
(171, 20, 'Monirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd'),
(172, 20, 'Obhoynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd'),
(173, 20, 'Bagharpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd'),
(174, 20, 'Chaugachha', 'চৌগাছা', 'chougachha.jessore.gov.bd'),
(175, 20, 'Jhikargachha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd'),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd'),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd'),
(178, 20, 'Sarsa', 'শার্শা', 'sharsha.jessore.gov.bd'),
(179, 21, 'Ashashuni Thana', 'আশাশুনি', 'assasuni.satkhira.gov.bd'),
(180, 21, 'Debhata Thana', 'দেবহাটা', 'debhata.satkhira.gov.bd'),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd'),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd'),
(183, 21, 'Shymnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd'),
(184, 21, 'Tala Thana', 'তালা', 'tala.satkhira.gov.bd'),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd'),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd'),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd'),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd'),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd'),
(190, 23, 'Narail - Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd'),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd'),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd'),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd'),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd'),
(195, 24, 'Jiban nagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd'),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd'),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd'),
(198, 25, 'Khoksha', 'খোকসা', 'khoksa.kushtia.gov.bd'),
(199, 25, 'Kushtia-Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd'),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd'),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd'),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd'),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd'),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd'),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd'),
(206, 27, 'Paikgachha Upozila', 'পাইকগাছা', 'paikgasa.khulna.gov.bd'),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd'),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd'),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd'),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd'),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd'),
(212, 27, 'Batiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd'),
(213, 27, 'Dacope', 'দাকোপ', 'dakop.khulna.gov.bd'),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd'),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd'),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd'),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd'),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd'),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd'),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd'),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd'),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd'),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd'),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd'),
(225, 29, 'Shailakupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd'),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd'),
(227, 29, 'Kaligonj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd'),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd'),
(229, 29, 'Maheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd'),
(230, 31, 'Jhalokathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd'),
(231, 31, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd'),
(232, 31, 'Nalchhiti', 'নলছিটি', 'nalchity.jhalakathi.gov.bd'),
(233, 31, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd'),
(234, 32, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd'),
(235, 32, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd'),
(236, 32, 'Dumkee', 'দুমকি', 'dumki.patuakhali.gov.bd'),
(237, 32, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd'),
(238, 32, 'Kala para', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd'),
(239, 32, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd'),
(240, 32, 'Gala chipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd'),
(241, 32, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd'),
(242, 33, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd'),
(243, 33, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd'),
(244, 33, 'kaukhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd'),
(245, 33, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd'),
(246, 33, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd'),
(247, 33, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd'),
(248, 33, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd'),
(249, 30, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd'),
(250, 30, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd'),
(251, 30, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd'),
(252, 30, 'Wazirpur Powrosova', 'উজিরপুর', 'wazirpur.barisal.gov.bd'),
(253, 30, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd'),
(254, 30, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd'),
(255, 30, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd'),
(256, 30, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd'),
(257, 30, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd'),
(258, 30, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd'),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd'),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd'),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd'),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd'),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd'),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd'),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd'),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd'),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd'),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd'),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd'),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd'),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd'),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd'),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd'),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd'),
(275, 36, 'Companyganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd'),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd'),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd'),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd'),
(279, 36, 'Jaintapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd'),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd'),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd'),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd'),
(283, 36, 'Dakshin Surma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd'),
(284, 36, 'Osmani Nagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd'),
(285, 37, 'Baralekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd'),
(286, 37, 'Kamalganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd'),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd'),
(288, 37, 'Mouluvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd'),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd'),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd'),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd'),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd'),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd'),
(294, 38, 'Azmireeganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd'),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd'),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd'),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd'),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd'),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd'),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd'),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd'),
(302, 39, 'Bishwamvarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd'),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd'),
(304, 39, 'Jagnnathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd'),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd'),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd'),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd'),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd'),
(309, 39, 'Salla', 'শাল্লা', 'shalla.sunamganj.gov.bd'),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd'),
(311, 53, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd'),
(312, 53, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd'),
(313, 53, 'Narshingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd'),
(314, 53, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd'),
(315, 53, 'Raypura Upazila South Zon', 'রায়পুরা', 'raipura.narsingdi.gov.bd'),
(316, 53, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd'),
(317, 54, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd'),
(318, 54, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd'),
(319, 54, 'Kapashiya', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd'),
(320, 54, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd'),
(321, 54, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd'),
(322, 55, 'Shariatpur Sadar (Palong)', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd'),
(323, 55, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd'),
(324, 55, 'Jajira', 'জাজিরা', 'zajira.shariatpur.gov.bd'),
(325, 55, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd'),
(326, 55, 'Bhedorganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd'),
(327, 55, 'Damudhya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd'),
(328, 56, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd'),
(329, 56, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd'),
(330, 56, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd'),
(331, 56, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd'),
(332, 56, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd'),
(333, 57, 'Bashail', 'বাসাইল', 'basail.tangail.gov.bd'),
(334, 57, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd'),
(335, 57, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd'),
(336, 57, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd'),
(337, 57, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd'),
(338, 57, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd'),
(339, 57, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd'),
(340, 57, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd'),
(341, 57, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd'),
(342, 57, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd'),
(343, 57, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd'),
(344, 57, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd'),
(345, 58, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd'),
(346, 58, 'Katiadi Upozila', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd'),
(347, 58, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd'),
(348, 58, 'Tarial', 'তাড়াইল', 'tarail.kishoreganj.gov.bd'),
(349, 58, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd'),
(350, 58, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd'),
(351, 58, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd'),
(352, 58, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd'),
(353, 58, 'Karimganj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd'),
(354, 58, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd'),
(355, 58, 'Astagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd'),
(356, 58, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd'),
(357, 58, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd'),
(358, 59, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd'),
(359, 59, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd'),
(360, 59, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd'),
(361, 59, 'Ghior Thana', 'ঘিওর', 'gior.manikganj.gov.bd'),
(362, 59, 'Shivalaya', 'শিবালয়', 'shibaloy.manikganj.gov.bd'),
(363, 59, 'Daulatpur - Manikganj', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd'),
(364, 59, 'Singair', 'সিংগাইর', 'singiar.manikganj.gov.bd'),
(365, 52, '60 Feet', '60 ফুট', 'savar.dhaka.gov.bd'),
(366, 52, 'Abdullahpur', 'আব্দুল্লাহপুর', 'dhamrai.dhaka.gov.bd'),
(367, 52, 'Abdullahpur Uttara', 'আব্দুল্লাহপুর উত্তরা', 'keraniganj.dhaka.gov.bd'),
(368, 52, 'Abul Hotel', 'আবুল হোটেল', 'nawabganj.dhaka.gov.bd'),
(369, 52, 'Adabor', 'আদাবর', 'dohar.dhaka.gov.bd'),
(370, 60, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd'),
(371, 60, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd'),
(372, 60, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd'),
(373, 60, 'Lohajong', 'লৌহজং', 'louhajanj.munshiganj.gov.bd'),
(374, 60, 'Gazaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd'),
(375, 60, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd'),
(376, 61, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd'),
(377, 61, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd'),
(378, 61, 'Pangsha', 'পাংশা', 'pangsa.rajbari.gov.bd'),
(379, 61, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd'),
(380, 61, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd'),
(381, 62, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd'),
(382, 62, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd'),
(383, 62, 'Kalkini Thana', 'কালকিনি', 'kalkini.madaripur.gov.bd'),
(384, 62, 'Rajoir thana', 'রাজৈর', 'rajoir.madaripur.gov.bd'),
(385, 64, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd'),
(386, 64, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd'),
(387, 64, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd'),
(388, 64, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd'),
(389, 64, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd'),
(390, 63, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd'),
(391, 63, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd'),
(392, 63, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd'),
(393, 63, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd'),
(394, 63, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd'),
(395, 63, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd'),
(396, 63, 'Charbhadrashan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd'),
(397, 63, 'Madukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd'),
(398, 63, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd'),
(399, 41, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd'),
(400, 41, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd'),
(401, 41, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd'),
(402, 41, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd'),
(403, 41, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd'),
(404, 42, 'Nawabganj Dinajpur', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd'),
(405, 42, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd'),
(406, 42, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd'),
(407, 42, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd'),
(408, 42, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd'),
(409, 42, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd'),
(410, 42, 'Kaharol', 'কাহারোল', 'kaharole.dinajpur.gov.bd'),
(411, 42, 'Fulbari', 'ফুলবাড়ী', 'fhulbari.dinajpur.gov.bd'),
(412, 42, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd'),
(413, 42, 'Hakimpur (Hili)', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd'),
(414, 42, 'Khanshama', 'খানসামা', 'khansama.dinajpur.gov.bd'),
(415, 42, 'Biral', 'বিরল', 'biral.dinajpur.gov.bd'),
(416, 42, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd'),
(417, 43, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd'),
(418, 43, 'Kaliganj - Lalmonirhat', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd'),
(419, 43, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd'),
(420, 43, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd'),
(421, 43, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd'),
(422, 44, 'Saidpur', 'সৈয়দপুর', 'saidpur.nilphamari.gov.bd'),
(423, 44, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd'),
(424, 44, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd'),
(425, 44, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd'),
(426, 44, 'Kishoriganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd'),
(427, 44, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd'),
(428, 46, 'Sadulllahpur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd'),
(429, 46, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd'),
(430, 46, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd'),
(431, 46, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd'),
(432, 46, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd'),
(433, 46, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd'),
(434, 46, 'Fulchhari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd'),
(435, 45, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd'),
(436, 45, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd'),
(437, 45, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd'),
(438, 45, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd'),
(439, 45, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd'),
(440, 40, 'Rangpur Sadar(Kotowali Th', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd'),
(441, 40, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd'),
(442, 40, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd'),
(443, 40, 'Badarganj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd'),
(444, 40, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd'),
(445, 40, 'Pirganj Thana', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd'),
(446, 40, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd'),
(447, 40, 'Pirgachha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd'),
(448, 47, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd'),
(449, 47, 'Nagesshari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd'),
(450, 47, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd'),
(451, 47, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd'),
(452, 47, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd'),
(453, 47, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd'),
(454, 47, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd'),
(455, 47, 'Rawmari', 'রৌমারী', 'rowmari.kurigram.gov.bd'),
(456, 47, 'Char Rajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd'),
(457, 51, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd'),
(458, 51, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd'),
(459, 51, 'Sreebardi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd'),
(460, 51, 'Nakla', 'নকলা', 'nokla.sherpur.gov.bd'),
(461, 51, 'Jhinaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd'),
(462, 48, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd'),
(463, 48, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd'),
(464, 48, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd'),
(465, 48, 'Muktagachha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd'),
(466, 48, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd'),
(467, 48, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd'),
(468, 48, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd'),
(469, 48, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd'),
(470, 48, 'Gauripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd'),
(471, 48, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd'),
(472, 48, 'Ishwarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd'),
(473, 48, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd'),
(474, 50, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd'),
(475, 49, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd'),
(476, 49, 'Melandaha', 'মেলান্দহ', 'melandah.jamalpur.gov.bd'),
(477, 49, 'Islampur (Jamalpur)', 'ইসলামপুর', 'islampur.jamalpur.gov.bd'),
(478, 49, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd'),
(479, 49, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd'),
(480, 49, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd'),
(481, 49, 'Bakshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd'),
(482, 0, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd'),
(483, 0, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd'),
(484, 50, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd'),
(485, 50, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd'),
(486, 50, 'Madan', 'মদন', 'madan.netrokona.gov.bd'),
(487, 50, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd'),
(488, 50, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd'),
(489, 50, 'Mohanganj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd'),
(490, 50, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd'),
(491, 50, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd'),
(492, 52, 'Adarsha Nagar - Kutubpur', 'আদর্শ নগর - কুতুবপুর', ''),
(493, 52, 'Aftab Nagar', 'আফতাব নগর', ''),
(494, 52, 'Aga Sadiq Road', 'আগা সাদিক রোড', ''),
(495, 52, 'Agargaon', 'আগারগাঁও', ''),
(496, 52, 'Agargaon-Taltola', 'আগারগাঁও-তালতলা', ''),
(497, 52, 'Alubazar', 'আলুবাজার', ''),
(498, 52, 'A-Mes', 'এ-মেস', ''),
(499, 52, 'Amtoli', 'আমতলী', ''),
(500, 52, 'Arambagh', 'আরামবাগ', ''),
(501, 52, 'Arjatpara', 'আরজাতপাড়া', ''),
(502, 52, 'Armanitola', 'আরমানিটোলা', ''),
(503, 52, 'Ashkona', 'আশকোনা', ''),
(504, 52, 'Ati Bazar', 'আটি বাজার', ''),
(505, 52, 'Azampur (Uttara)', 'আজমপুর (উত্তরা)', ''),
(506, 52, 'Azimpur (Lalbag)', 'আজিমপুর (লালবাগ)', ''),
(507, 52, 'Aziz Sarani', 'আজিজ সরণি', ''),
(508, 52, 'Babubazar', 'বাবুবাজার', ''),
(509, 52, 'Badda', 'বাড্ডা', ''),
(510, 52, 'Baily Road', 'বেইলি রোড', ''),
(511, 52, 'Bakshi Bazar', 'বকশী বাজার', ''),
(512, 52, 'Balughat', 'বালুঘাট', ''),
(513, 52, 'Banani', 'বনানী', ''),
(514, 52, 'Banani Dohs', 'বনানী দোহাস', ''),
(515, 52, 'Banasree (Block A-G)', 'বনশ্রী (ব্লক এ-জি)', ''),
(516, 52, 'Banasree (Block H-J)', 'বনশ্রী (ব্লক এইচ-জে)', ''),
(517, 52, 'Bangla Bazar', 'বাংলাবাজার', ''),
(518, 52, 'Bangla College', 'বাংলা কলেজ', ''),
(519, 52, 'Banglamotor', 'বাংলামোটর', ''),
(520, 52, 'Bangshal', 'বংশাল', ''),
(521, 52, 'Baridhara', 'বারিধারা', ''),
(522, 52, 'Baridhara Diplomatic Zone', 'বারিধারা কূটনৈতিক অঞ্চল', ''),
(523, 52, 'Baridhara Dohs', 'বারিধারা দোহস', ''),
(524, 52, 'Baridhara J Block', 'বারিধারা জে ব্লক', ''),
(525, 52, 'Barontak', 'ব্যারোন্টাক', ''),
(526, 52, 'Bashabo', 'বাশাবো', ''),
(527, 52, 'Bashundhara', 'বসুন্ধরা', ''),
(528, 52, 'Bawnia', 'বাউনিয়া', ''),
(529, 52, 'Begumbazar', 'বেগমবাজার', ''),
(530, 52, 'Begunbari', 'Begunbari', ''),
(531, 52, 'Benaroshi Polli', 'বেনারোশি পল্লী', ''),
(532, 52, 'Benaroshi Polli Blok A', 'বেনারোশি পল্লী ব্লক এ', ''),
(533, 52, 'Benaroshi Polli Blok B,C', 'Benaroshi Polli Blok B,C', ''),
(534, 52, 'Benaroshi Polli Blok D', 'Benaroshi Polli Blok D', ''),
(536, 52, 'Beraid', 'Beraid', ''),
(537, 52, 'Bijay Nagar', 'Bijay Nagar', ''),
(538, 52, 'Block A, C, Mirpur 11', 'Block A, C, Mirpur 11', ''),
(539, 52, 'Block A,B, Mirpur 6', 'Block A,B, Mirpur 6', ''),
(540, 52, 'Block B, D, Mirpur 11', 'Block B, D, Mirpur 11', ''),
(541, 52, 'Block B, D, Mirpur 11', 'Block B, D, Mirpur 11', ''),
(542, 52, 'Block D,E , Mirpur 6', 'Block D,E , Mirpur 6', ''),
(543, 52, 'Block-E, Mirpur 12', 'Block-E, Mirpur 12', ''),
(544, 52, 'Bongobazar', 'Bongobazar', ''),
(545, 52, 'Bongshal', 'Bongshal', ''),
(546, 52, 'Boro Moghbazar', 'Boro Moghbazar', ''),
(547, 52, 'Boro Shahebr Bazar', 'Boro Shahebr Bazar', ''),
(548, 52, 'Buet', 'Buet', ''),
(549, 52, 'Bulk Merchant', 'Bulk Merchant', ''),
(550, 52, 'Central Road', 'Central Road', ''),
(551, 52, 'Chairman Bari', 'Chairman Bari', ''),
(552, 52, 'Chakbazar', 'Chakbazar', ''),
(553, 52, 'Chalabon', 'Chalabon', ''),
(554, 52, 'Chankharpul', 'Chankharpul', ''),
(555, 52, 'Chawkbazar (Dhaka)', 'Chawkbazar (Dhaka)', ''),
(556, 52, 'Coca-Cola', 'Coca-Cola', ''),
(557, 52, 'Dakshinkhan', 'Dakshinkhan', ''),
(558, 52, 'Darussalam', 'Darussalam', ''),
(559, 52, 'Demra', 'Demra', ''),
(560, 52, 'Dhaka Cantonment', 'Dhaka Cantonment', ''),
(561, 52, 'Dhaka Medical', 'Dhaka Medical', ''),
(562, 52, 'Dhaka University', 'Dhaka University', ''),
(563, 52, 'Dhamrai , Savar', 'Dhamrai , Savar', ''),
(564, 52, 'Dhanmondi', 'Dhanmondi', ''),
(565, 52, 'Dholpur', 'Dholpur', ''),
(566, 52, 'Dhonia', 'Dhonia', ''),
(567, 52, 'Diabari', 'Diabari', ''),
(568, 52, 'Dilkusha', 'Dilkusha', ''),
(569, 52, 'Dit Road', 'Dit Road', ''),
(570, 52, 'Diya Bari', 'Diya Bari', ''),
(571, 52, 'Dmch', 'Dmch', ''),
(572, 52, 'Dohar', 'Dohar', ''),
(573, 52, 'East West Dental Hospital', 'East West Dental Hospital', ''),
(574, 52, 'Ecb', 'Ecb', ''),
(575, 52, 'Elenbari', 'Elenbari', ''),
(576, 52, 'Elephant Road', 'Elephant Road', ''),
(577, 52, 'Equria Thana', 'Equria Thana', ''),
(578, 52, 'Eskaton', 'Eskaton', ''),
(579, 52, 'Estern Housing', 'Estern Housing', ''),
(580, 52, 'Extended Pallabi', 'Extended Pallabi', ''),
(581, 52, 'Extension Pallabi', 'Extension Pallabi', ''),
(582, 52, 'Faidabad', 'Faidabad', ''),
(583, 52, 'Farmgate', 'Farmgate', ''),
(584, 52, 'Fdc', 'Fdc', ''),
(585, 52, 'Fokirapool', 'Fokirapool', ''),
(586, 52, 'Gabtoli', 'Gabtoli', ''),
(587, 52, 'Gandaria', 'Gandaria', ''),
(588, 52, 'Ganobhabon', 'Ganobhabon', ''),
(590, 52, 'Giridhara Abashik', 'Giridhara Abashik', ''),
(591, 52, 'Golapbag', 'Golapbag', ''),
(592, 52, 'Gonok Tuli', 'Gonok Tuli', ''),
(593, 52, 'Gopibagh', 'Gopibagh', ''),
(594, 52, 'Goran', 'Goran', ''),
(595, 52, 'Gpo', 'Gpo', ''),
(596, 52, 'Green Road', 'Green Road', ''),
(597, 52, 'Gulisthan', 'Gulisthan', ''),
(598, 52, 'Gulshan', 'Gulshan', ''),
(599, 52, 'Gulbagh', 'Gulbagh', ''),
(600, 52, 'Gulshan 1', 'Gulshan 1', ''),
(601, 52, 'Gulshan-2', 'Gulshan-2', ''),
(602, 52, 'Haji Camp', 'Haji Camp', ''),
(603, 52, 'Hatirpool', 'Hatirpool', ''),
(604, 52, 'Hazaribagh', 'Hazaribagh', ''),
(605, 52, 'House Building', 'House Building', ''),
(606, 52, 'Ibrahimpur', 'Ibrahimpur', ''),
(607, 52, 'Iqbal Road', 'Iqbal Road', ''),
(608, 52, 'Islampur', 'Islampur', ''),
(609, 52, 'Islampur (Dhamrai)', 'Islampur (Dhamrai)', ''),
(610, 52, 'Jagannath University', 'Jagannath University', ''),
(611, 52, 'Jagannathpur', 'Jagannathpur', ''),
(612, 52, 'Jahangir Gate', 'Jahangir Gate', ''),
(613, 52, 'Jamuna Future Park', 'Jamuna Future Park', ''),
(614, 52, 'Jatrabari', 'Jatrabari', ''),
(615, 52, 'Jhauchor', 'Jhauchor', ''),
(616, 52, 'Jigatola', 'Jigatola', ''),
(617, 52, 'Joardar Lane', 'Joardar Lane', ''),
(618, 52, 'Journalist Residential Ar', 'Journalist Residential Ar', ''),
(619, 52, 'Jurain', 'Jurain', ''),
(620, 52, 'Kadamtoli', 'Kadamtoli', ''),
(621, 52, 'Kafrul', 'Kafrul', ''),
(622, 52, 'Kakrail', 'Kakrail', ''),
(623, 52, 'Kalabagan', 'Kalabagan', ''),
(624, 52, 'Kallyanpur', 'Kallyanpur', ''),
(625, 52, 'Kalshi', 'Kalshi', ''),
(626, 52, 'Kamal Ataturk Avenue', 'Kamal Ataturk Avenue', ''),
(627, 52, 'Kamalapur', 'Kamalapur', ''),
(628, 52, 'Kamarpara', 'Kamarpara', ''),
(629, 52, 'Kamranggirchar', 'Kamranggirchar', ''),
(630, 52, 'Kamrangirchar', 'Kamrangirchar', ''),
(631, 52, 'Katabon', 'Katabon', ''),
(632, 52, 'Kathalbagan', 'Kathalbagan', ''),
(633, 52, 'Kawla', 'Kawla', ''),
(634, 52, 'Kawran Bazar', 'Kawran Bazar', ''),
(635, 52, 'Kazipara', 'Kazipara', ''),
(636, 52, 'Keraniganj', 'Keraniganj', ''),
(637, 52, 'Keraniganj Model Thana', 'Keraniganj Model Thana', ''),
(638, 52, 'Khilgaon', 'Khilgaon', ''),
(639, 52, 'Khilgaon Taltola', 'Khilgaon Taltola', ''),
(640, 52, 'Khilkhet', 'Khilkhet', ''),
(641, 52, 'Kochukhet', 'Kochukhet', ''),
(642, 52, 'Konapara', 'Konapara', ''),
(643, 52, 'Korail Bosti', 'Korail Bosti', ''),
(644, 52, 'Koshai Bari', 'Koshai Bari', ''),
(645, 52, 'Kotwali (Dhaka)', 'Kotwali (Dhaka)', ''),
(646, 52, 'Kuril', 'Kuril', ''),
(647, 52, 'Kurmitola', 'Kurmitola', ''),
(648, 52, 'Lakshmibazar', 'Lakshmibazar', ''),
(649, 52, 'Lalbag', 'Lalbag', ''),
(650, 52, 'Lalbagh', 'Lalbagh', ''),
(651, 52, 'Lalkuthi', 'Lalkuthi', ''),
(662, 52, 'Laxmibazar', 'Laxmibazar', ''),
(663, 52, 'London Market', 'London Market', ''),
(664, 52, 'Lost', 'Lost', ''),
(665, 52, 'Love Road, Mirpur-2', 'Love Road, Mirpur-2', ''),
(666, 52, 'Madani Nagar', 'Madani Nagar', ''),
(667, 52, 'Madartek', 'Madartek', ''),
(668, 52, 'Madertek', 'Madertek', ''),
(669, 52, 'Malibagh Baganbari', 'Malibagh Baganbari ', ''),
(670, 52, 'Malibagh College Road', 'Malibagh College Road', ''),
(671, 52, 'Malibagh Lane', 'Malibagh Lane', ''),
(672, 52, 'Malibagh Pabna Colony', 'Malibagh Pabna Colony', ''),
(673, 52, 'Malitola', 'Malitola', ''),
(674, 52, 'Manda', 'Manda', ''),
(675, 52, 'Manik Nagar', 'Manik Nagar', ''),
(676, 52, 'Manikdi', 'Manikdi', ''),
(677, 52, 'Masjid Market, Mirpur 2', 'Masjid Market, Mirpur 2', ''),
(678, 52, 'Matikata', 'Matikata', ''),
(679, 52, 'Matuail', 'Matuail', ''),
(680, 52, 'Mazar Road', 'Mazar Road', ''),
(681, 52, 'Meradia', 'Meradia', ''),
(682, 52, 'Middle Rosulbag', 'Middle Rosulbag', ''),
(683, 52, 'Mintu Road', 'Mintu Road', ''),
(684, 52, 'Mirpur 1', 'Mirpur 1', ''),
(685, 52, 'Mirpur 1 Market Area', 'Mirpur 1 Market Area', ''),
(686, 52, 'Mirpur 10', 'Mirpur 10', ''),
(687, 52, 'Mirpur 11', 'Mirpur 11', ''),
(688, 52, 'Mirpur 11 Lalmatia', 'Mirpur 11 Lalmatia', ''),
(689, 52, 'Mirpur 12', 'Mirpur 12', ''),
(690, 52, 'Mirpur 12 Block A,C', 'Mirpur 12 Block A,C', ''),
(691, 52, 'Mirpur 12 Block Ta', 'Mirpur 12 Block Ta', ''),
(692, 52, 'Mirpur 12 Block-Dhak, B', 'Mirpur 12 Block-Dhak, B', ''),
(693, 52, 'Mirpur 13', 'Mirpur 13', ''),
(694, 52, 'Mirpur 14', 'Mirpur 14', ''),
(695, 52, 'Mirpur 2', 'Mirpur 2', ''),
(696, 52, 'Mirpur 6', 'Mirpur 6', ''),
(697, 52, 'Mirpur 6 (Block C)', 'Mirpur 6 (Block C)', ''),
(698, 52, 'Mirpur 7', 'Mirpur 7', ''),
(699, 52, 'Mirpur Cantonment', 'Mirpur Cantonment', ''),
(700, 52, 'Mirpur Cantonment (Ave Ne', 'Mirpur Cantonment (Ave Ne', ''),
(701, 52, 'Mirpur Dohs', 'Mirpur Dohs', ''),
(702, 52, 'Mirpur Dohs (Ave New 2)', 'Mirpur Dohs (Ave New 2)', ''),
(703, 52, 'Mirpur Dohs (Ave New 9)', 'Mirpur Dohs (Ave New 9)', ''),
(704, 52, 'Mirpur-Rupnagar', 'Mirpur-Rupnagar', ''),
(705, 52, 'Mitford', 'Mitford', ''),
(706, 52, 'Modhubag', 'Modhubag', ''),
(707, 52, 'Mogbazar', 'Mogbazar', ''),
(708, 52, 'Mohakhali', 'Mohakhali', ''),
(709, 52, 'Mohakhali Dohs', 'Mohakhali Dohs', ''),
(710, 52, 'Mohakhali Wireless', 'Mohakhali Wireless', ''),
(711, 52, 'Mohammadpur', 'Mohammadpur', ''),
(712, 52, 'Monipur', 'Monipur', ''),
(713, 52, 'Monumia Market', 'Monumia Market', ''),
(714, 52, 'Motijheel', 'Motijheel', ''),
(715, 52, 'Moulavi Bazar (Old Dhaka)', 'Moulavi Bazar (Old Dhaka)', ''),
(716, 52, 'Moulovibazar (Dhaka)', 'Moulovibazar (Dhaka)', ''),
(717, 52, 'Mugda', 'Mugda', ''),
(718, 52, 'Mukti Nagar', 'Mukti Nagar', ''),
(719, 52, 'Nabisco', 'Nabisco', ''),
(720, 52, 'Nadda', 'Nadda', ''),
(721, 52, 'Nakhal Para', 'Nakhal Para', ''),
(722, 52, 'Nakhalpara', 'Nakhalpara', ''),
(723, 52, 'Namapara', 'Namapara', ''),
(724, 52, 'Narayanpur - Keshobpur', 'Narayanpur - Keshobpur', ''),
(725, 52, 'Narinda', 'Narinda', ''),
(726, 52, 'Nawabganj (Dhaka)', 'Nawabganj (Dhaka)', ''),
(727, 52, 'Nawabganj (Dohar)', 'Nawabganj (Dohar)', ''),
(728, 52, 'Nawabpur', 'Nawabpur', ''),
(729, 52, 'Naya Bazar', 'Naya Bazar', ''),
(730, 52, 'Nayanagar', 'Nayanagar', ''),
(731, 52, 'Nazim Uddin Road', 'Nazim Uddin Road', ''),
(732, 52, 'Nazira Bazar', 'Nazira Bazar', ''),
(733, 52, 'Nazirabazar', 'Nazirabazar', ''),
(734, 52, 'New Elephant Road', 'New Elephant Road', ''),
(735, 52, 'New Market', 'New Market', ''),
(736, 52, 'New Paltan', 'New Paltan', ''),
(737, 52, 'Niketan', 'Niketan', ''),
(738, 52, 'Nikunja', 'Nikunja', ''),
(739, 52, 'Nikunja 2', 'Nikunja 2', ''),
(740, 52, 'Nilkhet', 'Nilkhet', ''),
(741, 52, 'Nimaikishori', 'Nimaikishori', ''),
(742, 52, 'North Sanarpar', 'North Sanarpar', ''),
(743, 52, 'Notun Bazar', 'Notun Bazar', ''),
(744, 52, 'Noyatola Road', 'Noyatola Road', ''),
(745, 52, 'Numondi Nagar', 'Numondi Nagar', ''),
(746, 52, 'Nurerchala', 'Nurerchala', ''),
(747, 52, 'On-Demand Transfer', 'On-Demand Transfer', ''),
(748, 52, 'Paikpara', 'Paikpara', ''),
(749, 52, 'Pallabi', 'Pallabi', ''),
(750, 52, 'Pallabi Residential Area', 'Pallabi Residential Area', ''),
(751, 52, 'Paltan', 'Paltan', ''),
(752, 52, 'Panthapath', 'Panthapath', ''),
(753, 52, 'Paribag', 'Paribag', ''),
(754, 52, 'Patuatuli', 'Patuatuli', ''),
(755, 52, 'Peyarabag', 'Peyarabag', ''),
(756, 52, 'Pink City', 'Pink City', ''),
(757, 52, 'Pirerbagh', 'Pirerbagh', ''),
(758, 52, 'Polashi', 'Polashi', ''),
(759, 52, 'Postogola', 'Postogola', ''),
(760, 52, 'Postogola', 'Postogola', ''),
(761, 52, 'Pragati Sarani', 'Pragati Sarani', ''),
(762, 52, 'Press Club', 'Press Club', ''),
(763, 52, 'Raja Bari', 'Raja Bari', ''),
(764, 52, 'Rajarbag', 'Rajarbag', ''),
(765, 52, 'Rajlakkhi Market', 'Rajlakkhi Market', ''),
(766, 52, 'Ramna', 'Ramna', ''),
(767, 52, 'Rampura', 'Rampura', ''),
(768, 52, 'Ranavola', 'Ranavola', ''),
(769, 52, 'Rasulbag', 'Rasulbag', ''),
(770, 52, 'Rayer Bazar', 'Rayer Bazar', ''),
(771, 52, 'Rayerbag', 'Rayerbag', ''),
(772, 52, 'Razarbag Police Line', 'Razarbag Police Line', ''),
(773, 52, 'Rupnagar', 'Rupnagar', ''),
(774, 52, 'Sadarghat (Dhaka)', 'Sadarghat (Dhaka)', ''),
(775, 52, 'Savar', 'Savar', ''),
(776, 52, 'Savar- Nabinagar', 'Savar- Nabinagar', ''),
(777, 52, 'Saydabad', 'Saydabad', ''),
(778, 52, 'Science Lab', 'Science Lab', ''),
(779, 52, 'Senpara', 'Senpara', ''),
(780, 52, 'Shagufta Block-D', 'Shagufta Block-D', ''),
(781, 52, 'Shah Ali Bag', 'Shah Ali Bag', ''),
(782, 52, 'Shahbag', 'Shahbag', ''),
(783, 52, 'Shaheenbag ', 'Shaheenbag ', ''),
(784, 52, 'Shahid Nagar', 'Shahid Nagar', ''),
(785, 52, 'Shahidbag', 'Shahidbag', ''),
(786, 52, 'Shahjadpur', 'Shahjadpur', ''),
(787, 52, 'Shajahanpur', 'Shajahanpur', ''),
(788, 52, 'Shakharibazar', 'Shakharibazar', ''),
(789, 52, 'Shammibag', 'Shammibag', ''),
(790, 52, 'Shampur', 'Shampur', ''),
(791, 52, 'Shanir Akhra', 'Shanir Akhra', ''),
(792, 52, 'Shankar', 'Shankar', ''),
(793, 52, 'Shantibagh', 'Shantibagh', ''),
(794, 52, 'Shantinagar', 'Shantinagar', ''),
(795, 52, 'Shegunbagicha', 'Shegunbagicha', ''),
(796, 52, 'Sheikh Rasel Park', 'Sheikh Rasel Park', ''),
(797, 52, 'Sher-E Bangla Nagar', 'Sher-E Bangla Nagar', ''),
(798, 52, 'Sher-E-Bangla National Cr', 'Sher-E-Bangla National Cr', ''),
(799, 52, 'Shewrapara', 'Shewrapara', ''),
(800, 52, 'Shiddesawari', 'Shiddesawari', ''),
(801, 52, 'Shiddeshwari', 'Shiddeshwari', ''),
(802, 52, 'Shimrail', 'Shimrail', ''),
(803, 52, 'Shipahibag', 'Shipahibag', ''),
(804, 52, 'Shishu Mela', 'Shishu Mela', ''),
(805, 52, 'Shobujbag', 'Shobujbag', ''),
(806, 52, 'Shonalibagh', 'Shonalibagh', ''),
(807, 52, 'Shonir Akhra', 'Shonir Akhra', ''),
(808, 52, 'Shutrapur', 'Shutrapur', ''),
(809, 52, 'Shyamoli', 'Shyamoli', ''),
(810, 52, 'Siraz Market', 'Siraz Market', ''),
(811, 52, 'Sony Cinema Hall', 'Sony Cinema Hall', ''),
(812, 52, 'South Banasree', 'South Banasree', ''),
(813, 52, 'South Bishil', 'South Bishil', ''),
(814, 52, 'South Jatrabari', 'South Jatrabari', ''),
(815, 52, 'South Kafrul', 'South Kafrul', ''),
(816, 52, 'Sutrapur', 'Sutrapur', ''),
(817, 52, 'Swamibag', 'Swamibag', ''),
(818, 52, 'Tatibazar', 'Tatibazar', ''),
(819, 52, 'Technical', 'Technical', ''),
(820, 52, 'Tejgaon', 'Tejgaon', ''),
(821, 52, 'Tejgaon Thana', 'Tejgaon Thana', ''),
(822, 52, 'Tikatoli', 'Tikatoli', ''),
(823, 52, 'Tolar Bag', 'Tolar Bag', ''),
(824, 52, 'Tolarbag', 'Tolarbag', ''),
(825, 52, 'Turag', 'Turag', ''),
(826, 52, 'Ulon', 'Ulon', ''),
(827, 52, 'Urdu Road', 'Urdu Road', ''),
(828, 52, 'Uttara Sector 1', 'Uttara Sector 1', ''),
(829, 52, 'Uttara Sector 10', 'Uttara Sector 10', ''),
(830, 52, 'Uttara Sector 11', 'Uttara Sector 11', ''),
(831, 52, 'Uttara Sector 12', 'Uttara Sector 12', ''),
(832, 52, 'Uttara Sector 13', 'Uttara Sector 13', ''),
(833, 52, 'Uttara Sector 14', 'Uttara Sector 14', ''),
(834, 52, 'Uttara Sector 15', 'Uttara Sector 15', ''),
(835, 52, 'Uttara Sector 16', 'Uttara Sector 16', ''),
(836, 52, 'Uttara Sector 17', 'Uttara Sector 17', ''),
(837, 52, 'Uttara Sector 18', 'Uttara Sector 18', ''),
(838, 52, 'Uttara Sector 3', 'Uttara Sector 3', ''),
(839, 52, 'Uttara Sector 4', 'Uttara Sector 4', ''),
(840, 52, 'Uttara Sector 5', 'Uttara Sector 5', ''),
(841, 52, 'Uttara Sector 6', 'Uttara Sector 6', ''),
(842, 52, 'Uttara Sector 7', 'Uttara Sector 7', ''),
(843, 52, 'Uttara Sector 8', 'Uttara Sector 8', ''),
(844, 52, 'Uttara Sector 9', 'Uttara Sector 9', ''),
(845, 52, 'Uttarkhan', 'Uttarkhan', ''),
(846, 52, 'Vasan Tek', 'Vasan Tek', ''),
(847, 52, 'Vatara', 'Vatara', ''),
(848, 52, 'Vootergoli', 'Vootergoli', ''),
(849, 52, 'Wari', 'Wari', ''),
(850, 52, 'West Agargaon', 'West Agargaon', ''),
(851, 52, 'West Kafrul', 'West Kafrul', ''),
(852, 52, 'Zigatola', 'Zigatola', ''),
(853, 52, 'Zoo Road', 'Zoo Road', ''),
(854, 28, 'Rayenda', 'Rayenda', ''),
(855, 11, 'Keranirhat Bazar', 'Keranirhat Bazar', ''),
(856, 11, 'Bandorban Bus Stand', 'Bandorban Bus Stand', ''),
(857, 11, 'Modhompara', 'Modhompara', ''),
(858, 11, 'Balaghata', 'Balaghata', ''),
(859, 11, 'Bimang', 'Bimang', ''),
(860, 11, 'Roanchhari', 'Roanchhari', ''),
(861, 11, 'Kalaghata', 'Kalaghata', ''),
(862, 11, 'Kotowali', 'Kotowali', ''),
(863, 11, 'Barisal Bandor Thana', 'Barisal Bandor Thana', ''),
(864, 34, 'Dokkhin aicha', 'Dokkhin aicha', ''),
(865, 14, 'Shantaher', 'Shantaher', ''),
(866, 18, 'Godagari', 'Godagari', ''),
(867, 8, 'Agrabad CTG', 'Agrabad CTG', ''),
(868, 8, 'Agrabad (CDA)', 'Agrabad (CDA)', ''),
(869, 8, 'Boyalkhali', 'Boyalkhali', ''),
(870, 8, 'Chittagong Sadar', 'Chittagong Sadar', ''),
(871, 8, 'Chawkbazar North Side', 'Chawkbazar North Side', ''),
(872, 8, 'Pahartoli', 'Pahartoli', ''),
(873, 8, 'Muradpur', 'Muradpur', ''),
(874, 8, 'Vhatiyari', 'Vhatiyari', ''),
(875, 8, 'Sholakbahar', 'Sholakbahar', ''),
(876, 8, 'Sholoshohor', 'Sholoshohor', ''),
(877, 8, 'South Khulshi', 'South Khulshi', ''),
(878, 8, 'North Khulshi', 'North Khulshi', ''),
(879, 8, 'O.R Nizam Road', 'O.R Nizam Road', ''),
(880, 8, 'Kazir Dewri', 'Kazir Dewri', ''),
(881, 8, 'Love Lane', 'Love Lane', ''),
(882, 8, 'Bibir Hat', 'Bibir Hat', ''),
(883, 8, 'Textile', 'Textile', ''),
(884, 8, 'Patharghata', 'Patharghata', ''),
(885, 8, 'Jublee Road', 'Jublee Road', ''),
(886, 8, 'Boro Darogahat', 'Boro Darogahat', ''),
(887, 8, 'fatickchari', 'fatickchari', ''),
(888, 8, 'Kumira', 'Kumira', ''),
(889, 8, 'New Mooring', 'New Mooring', ''),
(890, 8, 'Potenga', 'Potenga', ''),
(891, 8, 'kadamrasul', 'kadamrasul', ''),
(892, 8, 'Laldighir par', 'Laldighir par', ''),
(893, 8, 'Dev Pahar', 'Dev Pahar', ''),
(894, 8, 'Chandanpura', 'Chandanpura', ''),
(895, 8, 'Baroaulia', 'Baroaulia', ''),
(896, 8, 'Kodomtoli', 'Kodomtoli', ''),
(897, 8, 'Dewan hat', 'Dewan hat', ''),
(898, 8, 'Mohammadpur CTG', 'Mohammadpur CTG', ''),
(899, 8, 'Kalamia Bazar', 'Kalamia Bazar', ''),
(900, 8, 'East Madarbari', 'East Madarbari', ''),
(901, 8, 'CTG Cantonment', 'CTG Cantonment', ''),
(902, 8, 'Bayezid Bostami Road', 'Bayezid Bostami Road', ''),
(903, 8, 'Badamtolir mor', 'Badamtolir mor', ''),
(904, 8, 'Alongkar mor', 'Alongkar mor', ''),
(905, 8, 'Majir Ghat', 'Majir Ghat', ''),
(906, 8, 'Kadamtoli', 'Kadamtoli', ''),
(907, 8, 'Baroiyarhat Bazar', 'Baroiyarhat Bazar', ''),
(908, 8, 'Dohazari', 'Dohazari', ''),
(909, 8, 'Akbar Shah', 'Akbar Shah', ''),
(910, 8, 'City gate', 'City gate', ''),
(911, 8, 'Noapara', 'Noapara', ''),
(912, 8, 'Fouzdarhat', 'Fouzdarhat', ''),
(913, 8, 'Double Mooring', 'Double Mooring', ''),
(914, 8, 'Baizid Bostami', 'Baizid Bostami', ''),
(915, 8, 'Momin Road', 'Momin Road', ''),
(916, 8, 'Bakalia', 'Bakalia', ''),
(917, 8, 'Shulokhbor', 'Shulokhbor', ''),
(918, 8, 'Rohomotganj', 'Rohomotganj', ''),
(919, 8, 'Oxyzen Mor', 'Oxyzen Mor', ''),
(920, 8, 'Chateshwary', 'Chateshwary', ''),
(921, 8, 'Chittagong Port', 'Chittagong Port', ''),
(922, 8, 'Chowdhury Hat', 'Chowdhury Hat', ''),
(923, 8, 'Terri bazar', 'Terri bazar', ''),
(924, 8, 'Nondonkanon', 'Nondonkanon', ''),
(925, 8, 'Kapashgola', 'Kapashgola', ''),
(926, 8, 'Modunaghat', 'Modunaghat', ''),
(927, 8, 'Noju Miar hat', 'Noju Miar hat', ''),
(928, 8, 'Kaptai rastar matha', 'Kaptai rastar matha', ''),
(929, 8, 'K B Aman Ali Road', 'K B Aman Ali Road', ''),
(930, 8, 'AK khan Road', 'AK khan Road', ''),
(931, 8, 'Foys Lake', 'Foys Lake', ''),
(932, 8, 'Patia Head Office', 'Patia Head Office', ''),
(933, 8, 'Anawara - Chowmuhuni', 'Anawara - Chowmuhuni', ''),
(934, 8, 'Patia bot tola', 'Patia bot tola', ''),
(935, 8, 'Patia college road', 'Patia college road', ''),
(936, 8, 'Moijjertek', 'Moijjertek', ''),
(937, 8, 'Patia Shantirhat', 'Patia Shantirhat', '');
INSERT INTO `upazillas` (`id`, `district_id`, `name_en`, `name_bn`, `url`) VALUES
(938, 8, 'Notunbridge', 'Notunbridge', ''),
(939, 8, 'Katir Hut', 'Katir Hut', ''),
(940, 8, 'Shugondha', 'Shugondha', ''),
(941, 8, 'KAfco', 'KAfco', ''),
(942, 8, 'Chondonaish', 'Chondonaish', ''),
(943, 8, 'Potiya thanar mor', 'Potiya thanar mor', ''),
(944, 8, 'Sikalbaha', 'Sikalbaha', ''),
(945, 8, 'Bandortila', 'Bandortila', ''),
(946, 8, 'CUET', 'CUET', ''),
(947, 8, 'Bata goli', 'Bata goli', ''),
(948, 8, 'Lakhan Bazar', 'Lakhan Bazar', ''),
(949, 8, 'Chittagong University', 'Chittagong University', ''),
(950, 8, 'Chittagong Kalurghat', 'Chittagong Kalurghat', ''),
(951, 8, 'Hatazari', 'Hatazari', ''),
(952, 8, 'Golpahar', 'Golpahar', ''),
(953, 8, 'Dhoniala Para', 'Dhoniala Para', ''),
(954, 8, 'CTG wirless', 'CTG wirless', ''),
(955, 8, 'Khatunganj', 'Khatunganj', ''),
(956, 8, 'Vatiary', 'Vatiary', ''),
(957, 8, 'Bondor', 'Bondor', ''),
(958, 8, 'Dohajari', 'Dohajari', ''),
(959, 8, 'Jamalkhan', 'Jamalkhan', ''),
(960, 8, 'Baizid', 'Baizid', ''),
(961, 8, 'GEC', 'GEC', ''),
(962, 8, 'Lalkhan Bazar', 'Lalkhan Bazar', ''),
(963, 8, 'Mehedibag', 'Mehedibag', ''),
(964, 8, 'Khulshi', 'Khulshi', ''),
(965, 8, 'Bakoliya thana', 'Bakoliya thana', ''),
(966, 8, 'New Market CTG', 'New Market CTG', ''),
(967, 8, 'Halishahar', 'Halishahar', ''),
(968, 8, 'Akbarsha', 'Akbarsha', ''),
(969, 8, 'EPZ', 'EPZ', ''),
(970, 8, 'Andarkilla', 'Andarkilla', ''),
(971, 8, 'Double mooring', 'Double mooring', ''),
(972, 8, 'Keranihat', 'Keranihat', ''),
(973, 8, 'Bayazid', 'Bayazid', ''),
(974, 8, 'Panchlaish ctg', 'Panchlaish ctg', ''),
(975, 8, 'Kotowali Chittagong', 'Kotowali Chittagong', ''),
(976, 8, 'Chandgaon', 'Chandgaon', ''),
(977, 8, 'Enayet bazar', 'Enayet bazar', ''),
(978, 8, 'East Joara', 'East Joara', ''),
(979, 8, 'Patia', 'Patia', ''),
(980, 8, 'Anowara', 'Anowara', ''),
(981, 8, 'Nazirhat', 'Nazirhat', ''),
(982, 8, 'Nasirabad', 'Nasirabad', ''),
(983, 8, 'Zorarganj', 'Zorarganj', ''),
(984, 8, 'Pahartali', 'Pahartali', ''),
(985, 8, 'Chawkbazar (Chattogram)', 'Chawkbazar (Chattogram)', ''),
(986, 8, 'Sadarghat (Chattogram)', 'Sadarghat (Chattogram)', ''),
(987, 8, 'Kotwali (Chattogram)', 'Kotwali (Chattogram)', ''),
(988, 24, 'Darshana', 'Darshana', ''),
(989, 24, 'Doulatganj', 'Doulatganj', ''),
(990, 9, 'Eidgah', 'Eidgah', ''),
(991, 1, 'Nangolkot', 'Nangolkot', ''),
(992, 1, 'Muddafarganj', 'Muddafarganj', ''),
(993, 1, 'Cantonment', 'Cantonment', ''),
(994, 1, 'Comilla Companigonj', 'Comilla Companigonj', ''),
(995, 1, 'Sadar Dakkhin', 'Sadar Dakkhin', ''),
(996, 1, 'Eliotgonj', 'Eliotgonj', ''),
(997, 1, 'Mia-Bazar', 'Mia-Bazar', ''),
(998, 1, 'Kotbari', 'Kotbari', ''),
(999, 1, 'Gouripur', 'Gouripur', ''),
(1000, 1, 'B.Para', 'B.Para', ''),
(1001, 1, 'South Daudkandi', 'South Daudkandi', ''),
(1002, 54, 'Mowchak', 'Mowchak', ''),
(1003, 54, 'Kashimpur', 'Kashimpur', ''),
(1004, 54, 'Rajendrapur Cantonment', 'Rajendrapur Cantonment', ''),
(1005, 54, 'Toke', 'Toke', ''),
(1006, 54, 'Tongi', 'Tongi', ''),
(1007, 54, 'Gazipur Chowrasta', 'Gazipur Chowrasta', ''),
(1008, 54, 'Tongi Cherag Ali', 'Tongi Cherag Ali', ''),
(1009, 54, 'College gate', 'College gate', ''),
(1010, 54, 'Gazipura', 'Gazipura', ''),
(1011, 54, 'Borobari', 'Borobari', ''),
(1012, 54, 'Board Bazar', 'Board Bazar', ''),
(1013, 54, 'Joydebpur', 'Joydebpur', ''),
(1014, 54, 'Hotapara', 'Hotapara', ''),
(1015, 54, 'Mawna', 'Mawna', ''),
(1016, 54, 'Bason', 'Bason', ''),
(1017, 54, 'Gacha', 'Gacha', ''),
(1018, 54, 'Porabari', 'Porabari', ''),
(1019, 54, 'Aral', 'Aral', ''),
(1020, 54, 'Chalar Bazar', 'Chalar Bazar', ''),
(1021, 54, 'Bhawal Mirzapur', 'Bhawal Mirzapur', ''),
(1022, 54, 'Konabari', 'Konabari', ''),
(1023, 54, 'Rajendrapur Bangla Bazar', 'Rajendrapur Bangla Bazar', ''),
(1024, 54, 'Amraid', 'Amraid', ''),
(1025, 20, 'Benapole', 'Benapole', ''),
(1026, 31, 'Swarupkathi', 'Swarupkathi', ''),
(1027, 10, 'Maischori', 'Maischori', ''),
(1028, 10, 'Bagaichari', 'Bagaichari', ''),
(1029, 10, 'Langodu', 'Langodu', ''),
(1030, 27, 'Chandkhali', 'Chandkhali', ''),
(1031, 27, 'Tala Upozilla', 'Tala Upozilla', ''),
(1032, 27, 'Khulna Sadar', 'Khulna Sadar', ''),
(1033, 27, 'Sonadanga', 'Sonadanga', ''),
(1034, 27, 'Khalishpur', 'Khalishpur', ''),
(1035, 27, 'Daulatpur', 'Daulatpur', ''),
(1036, 27, 'Boyra', 'Boyra', ''),
(1037, 27, 'Kopilmuni', 'Kopilmuni', ''),
(1038, 25, 'Islamic University', 'Islamic University', ''),
(1039, 43, 'Area Off Lakhsmipur', 'Area Off Lakhsmipur', ''),
(1040, 43, 'Ramganj', 'Ramganj', ''),
(1041, 43, 'Raipur', 'Raipur', ''),
(1042, 43, 'Komalnagar', 'Komalnagar', ''),
(1043, 43, 'Ramgoti', 'Ramgoti', ''),
(1044, 43, 'Lakshimpur Sadar', 'Lakshimpur Sadar', ''),
(1045, 62, 'Dasar Thana', 'Dasar Thana', ''),
(1046, 26, 'Arpara', 'Arpara', ''),
(1047, 59, 'Ghior', 'Ghior', ''),
(1048, 59, 'ANGAR PARA', 'ANGAR PARA', ''),
(1049, 59, 'DAULATPUR', 'DAULATPUR', ''),
(1050, 48, 'Pagla', 'Pagla', ''),
(1051, 48, 'Tarakanda', 'Tarakanda', ''),
(1052, 23, 'Mohajan', 'Mohajan', ''),
(1053, 23, 'Terokhada', 'Terokhada', ''),
(1054, 56, 'Beldi-Daudpur', 'Beldi-Daudpur', ''),
(1055, 56, 'Neela Market', 'Neela Market', ''),
(1056, 56, 'Nila Market', 'Nila Market', ''),
(1057, 56, 'Jalkuri', 'Jalkuri', ''),
(1058, 56, 'Shibu Market', 'Shibu Market', ''),
(1059, 56, 'Modonpur', 'Modonpur', ''),
(1060, 56, 'Kachpur', 'Kachpur', ''),
(1061, 56, 'Purbachal', 'Purbachal', ''),
(1062, 56, 'Zilla Parishod', 'Zilla Parishod', ''),
(1063, 56, 'Masdair', 'Masdair', ''),
(1064, 56, 'kaikartek', 'kaikartek', ''),
(1065, 56, 'Ponchoboti', 'Ponchoboti', ''),
(1066, 56, 'ananda bazar', 'ananda bazar', ''),
(1067, 56, 'Shanarpar', 'Shanarpar', ''),
(1068, 56, 'Fatullah', 'Fatullah', ''),
(1069, 56, 'Mahmudpur', 'Mahmudpur', ''),
(1070, 56, 'Nitaiganj', 'Nitaiganj', ''),
(1071, 56, '2 no gate', '2 no gate', ''),
(1072, 56, 'Volail', 'Volail', ''),
(1073, 56, 'Bhaberchar', 'Bhaberchar', ''),
(1074, 56, 'Don Chamber', 'Don Chamber', ''),
(1075, 56, 'South Chashara', 'South Chashara', ''),
(1076, 56, 'Bhulta/Gawsia', 'Bhulta/Gawsia', ''),
(1077, 56, 'Sign Board', 'Sign Board', ''),
(1078, 56, 'Pagla', 'Pagla', ''),
(1079, 56, 'Siddirganj', 'Siddirganj', ''),
(1080, 56, 'Madanpur', 'Madanpur', ''),
(1081, 56, 'Baidder Bazar', 'Baidder Bazar', ''),
(1082, 56, 'Passport office (Siddhirg', 'Passport office (Siddhirg', ''),
(1083, 56, 'Boktaboli', 'Boktaboli', ''),
(1084, 56, 'Chittagong_Road_Narayango', 'Chittagong_Road_Narayango', ''),
(1085, 56, 'Saidpur', 'Saidpur', ''),
(1086, 56, 'Madanganj', 'Madanganj', ''),
(1087, 56, 'Nabiganj Bandar', 'Nabiganj Bandar', ''),
(1088, 56, 'Ispahani Bandar', 'Ispahani Bandar', ''),
(1089, 56, 'Ekrampur', 'Ekrampur', ''),
(1090, 56, 'Bb road', 'Bb road', ''),
(1091, 56, 'amlapara', 'amlapara', ''),
(1092, 56, 'Sayedpur - Narayanganj', 'Sayedpur - Narayanganj', ''),
(1093, 56, 'paikpara Narayanganj', 'paikpara Narayanganj', ''),
(1094, 56, 'baburail', 'baburail', ''),
(1095, 56, 'Kashipur', 'Kashipur', ''),
(1096, 56, 'Mitali Market', 'Mitali Market', ''),
(1097, 56, 'Isdair', 'Isdair', ''),
(1098, 56, 'Mograpara', 'Mograpara', ''),
(1099, 56, 'Shaheb para', 'Shaheb para', ''),
(1100, 56, 'Bausia', 'Bausia', ''),
(1101, 56, 'Vabarchar', 'Vabarchar', ''),
(1102, 56, 'Rosulpur', 'Rosulpur', ''),
(1103, 56, 'New town', 'New town', ''),
(1104, 56, 'Majdair', 'Majdair', ''),
(1105, 56, 'Panchabati', 'Panchabati', ''),
(1106, 56, 'Chashra', 'Chashra', ''),
(1107, 56, 'Khanpur', 'Khanpur', ''),
(1108, 56, 'Delpara', 'Delpara', ''),
(1109, 56, 'Shiddriganj', 'Shiddriganj', ''),
(1110, 56, 'Epz', 'Epz', ''),
(1111, 56, 'Bhuighor', 'Bhuighor', ''),
(1112, 56, 'Bisic', 'Bisic', ''),
(1113, 56, 'Hazibadsha mia market', 'Hazibadsha mia market', ''),
(1114, 56, 'Zela Parishad', 'Zela Parishad', ''),
(1115, 53, 'Madhabdi', 'Madhabdi', ''),
(1116, 53, 'Monohordi', 'Monohordi', ''),
(1117, 53, 'Chalakchar', 'Chalakchar', ''),
(1118, 53, 'Raypura Upazila North Zon', 'Raypura Upazila North Zon', ''),
(1119, 53, 'Hatirdia', 'Hatirdia', ''),
(1120, 16, 'Gopalpur UPO', 'Gopalpur UPO', ''),
(1121, 50, 'Susang Durgapur', 'Susang Durgapur', ''),
(1122, 50, 'Barhatta', 'Barhatta', ''),
(1123, 44, 'Taraganj', 'Taraganj', ''),
(1124, 5, 'Maizdee', 'Maizdee', ''),
(1125, 5, 'Sonapur', 'Sonapur', ''),
(1126, 5, 'Basurhat', 'Basurhat', ''),
(1127, 5, 'Chondrogonj Thana', 'Chondrogonj Thana', ''),
(1128, 13, 'Aminpur', 'Aminpur', ''),
(1129, 13, 'Tebunia', 'Tebunia', ''),
(1130, 13, 'Kasinathpur', 'Kasinathpur', ''),
(1131, 13, 'Ataikula', 'Ataikula', ''),
(1133, 32, 'Mohipur', 'Mohipur', ''),
(1134, 32, 'Khepupara', 'Khepupara', ''),
(1135, 32, 'Subidkhali', 'Subidkhali', ''),
(1136, 33, 'Pirojpur-Indurkani', 'Pirojpur-Indurkani', ''),
(1137, 15, 'Rajshahi Sadar (Boalia)', 'Rajshahi Sadar (Boalia)', ''),
(1138, 15, 'Shah Mokdum', 'Shah Mokdum', ''),
(1139, 15, 'Katakhali', 'Katakhali', ''),
(1140, 15, 'Motihar', 'Motihar', ''),
(1141, 15, 'Rajpara', 'Rajpara', ''),
(1142, 15, 'Banseshwar', 'Banseshwar', ''),
(1143, 15, 'Sharda', 'Sharda', ''),
(1144, 15, 'Taherpur', 'Taherpur', ''),
(1145, 4, 'Kalampati', 'Kalampati', ''),
(1146, 4, 'Rangamati Delivery', 'Rangamati Delivery', ''),
(1147, 4, 'Marishya', 'Marishya', ''),
(1148, 4, 'Chakrapara', 'Chakrapara', ''),
(1149, 4, 'Chandraghona', 'Chandraghona', ''),
(1150, 4, 'Manikchhari', 'Manikchhari', ''),
(1151, 4, 'Ghagra', 'Ghagra', ''),
(1152, 4, 'Kotwali Thana', 'Kotwali Thana', ''),
(1153, 52, 'Haragach Thana', 'Haragach Thana', ''),
(1154, 52, 'Rangpur Cantonment', 'Rangpur Cantonment', ''),
(1155, 52, 'Porshurampur Thana', 'Porshurampur Thana', ''),
(1156, 52, 'Tajhat Thana', 'Tajhat Thana', ''),
(1157, 52, 'Mahiganj Thana', 'Mahiganj Thana', ''),
(1158, 55, 'Shakhipur', 'Shakhipur', ''),
(1159, 51, 'Bakshigonj', 'Bakshigonj', ''),
(1160, 12, 'Salonga', 'Salonga', ''),
(1161, 39, 'Shantiganj', 'Shantiganj', ''),
(1162, 45, 'Ruhiya', 'Ruhiya', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role` tinyint UNSIGNED NOT NULL DEFAULT '3' COMMENT '1=>Admin, 2=>Vendor,3=>User,4=>Guest User',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `customer_type` int NOT NULL DEFAULT '0',
  `membership` int DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `phone`, `email`, `address`, `income`, `profile_image`, `commission`, `email_verified_at`, `password`, `status`, `customer_type`, `membership`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 4, 'Walk in Customer', 'guest-user', '01900000000', 'guestuser@gmail.com', 'Dhaka', NULL, 'upload/user/1663045118avatar5.png', NULL, NULL, '$2y$10$iy93F5hZNH/zmluBuHBm5.1.hUsNJVR5PauM4Nu4Dg0rt5dBhoODK', 1, 0, 0, NULL, '2022-07-30 03:25:27', '2023-12-03 06:56:42'),
(4, 1, 'Admin', 'admin', '01721523654', 'admin@gmail.com', 'Uttara, Dhaka', NULL, '202208201411avatar5.png', NULL, NULL, '$2y$10$76y.6leBgFOLXpo3T4T9NusHuQ1kWmwLSUoAzaGyCNz7QIlzfw.gC', 1, 0, 0, NULL, '2022-08-12 23:46:40', '2022-08-20 08:11:59'),
(122, 3, 'Afsana Sultana', 'As_Labonno', '01753142981', 'afsana1996sultana@gmail.com', NULL, NULL, 'upload/user/1704000516Afsana-Sultana-1.jpg', NULL, NULL, '$2y$10$og2k1ER3u9vfbhFvGg8Tsu6lzad9i8kbHvJ0vvmKvc/rIajQ3lY4W', 1, 0, 0, NULL, '2023-12-13 05:31:07', '2023-12-30 23:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `commission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shop_profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_heads`
--
ALTER TABLE `account_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_ledgers_account_head_id_foreign` (`account_head_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance_payments`
--
ALTER TABLE `advance_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_product_id_foreign` (`product_id`),
  ADD KEY `attribute_product_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_value_product_price`
--
ALTER TABLE `attribute_value_product_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_value_product_price_product_price_id_foreign` (`product_price_id`),
  ADD KEY `attribute_value_product_price_attribute_value_id_foreign` (`attribute_value_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaings`
--
ALTER TABLE `campaings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaing_products`
--
ALTER TABLE `campaing_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaing_products_campaing_id_foreign` (`campaing_id`);

--
-- Indexes for table `cashwithdraws`
--
ALTER TABLE `cashwithdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `free_shippings`
--
ALTER TABLE `free_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payments_order_id_foreign` (`order_id`),
  ADD KEY `order_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos_carts`
--
ALTER TABLE `pos_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_user_id_foreign` (`user_id`),
  ADD KEY `staff_role_id_foreign` (`role_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_phone_unique` (`phone`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazillas`
--
ALTER TABLE `upazillas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_user_id_foreign` (`user_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_heads`
--
ALTER TABLE `account_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advance_payments`
--
ALTER TABLE `advance_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `attribute_value_product_price`
--
ALTER TABLE `attribute_value_product_price`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `campaings`
--
ALTER TABLE `campaings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaing_products`
--
ALTER TABLE `campaing_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashwithdraws`
--
ALTER TABLE `cashwithdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_shippings`
--
ALTER TABLE `free_shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_carts`
--
ALTER TABLE `pos_carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `upazillas`
--
ALTER TABLE `upazillas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1163;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD CONSTRAINT `account_ledgers_account_head_id_foreign` FOREIGN KEY (`account_head_id`) REFERENCES `account_heads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_value_product_price`
--
ALTER TABLE `attribute_value_product_price`
  ADD CONSTRAINT `attribute_value_product_price_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_value_product_price_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaing_products`
--
ALTER TABLE `campaing_products`
  ADD CONSTRAINT `campaing_products_campaing_id_foreign` FOREIGN KEY (`campaing_id`) REFERENCES `campaings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD CONSTRAINT `order_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
