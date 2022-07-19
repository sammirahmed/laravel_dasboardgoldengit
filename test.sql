-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 يوليو 2021 الساعة 15:12
-- إصدار الخادم: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- بنية الجدول `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Food Delivery'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'fooddelivery@smartersvision.com'),
(24, 'mail_password', ''),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'fooddelivery@smartersvision.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-light bg-white'),
(38, 'logo_bg_color', 'bg-white'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '0'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', 'JV2A7G4SEMLMZ565'),
(114, 'paypal_secret', 'AbMmSXVaig1ExpY3utVS3dcAjx7nAHH0utrZsUN6LYwPgo7wfMzrV5WZ'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#ea5c44'),
(117, 'main_dark_color', '#ea5c44'),
(118, 'second_color', '#344968'),
(119, 'second_dark_color', '#ccccdd'),
(120, 'accent_color', '#8c98a8'),
(121, 'accent_dark_color', '#9999aa'),
(122, 'scaffold_dark_color', '#2c2c2c'),
(123, 'scaffold_color', '#fafafa'),
(124, 'google_maps_key', 'AIzaSyAT07iMlfZ9bJt1gmGj9KhJDLFY8srI6dA'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '2.5.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '1'),
(129, 'default_currency_code', 'USD'),
(130, 'default_currency_decimal_digits', '2'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '0'),
(133, 'home_section_1', 'search'),
(134, 'home_section_2', 'slider'),
(135, 'home_section_3', 'top_restaurants_heading'),
(136, 'home_section_4', 'top_restaurants'),
(137, 'home_section_5', 'trending_week_heading'),
(138, 'home_section_6', 'trending_week'),
(139, 'home_section_7', 'categories_heading'),
(140, 'home_section_8', 'categories'),
(141, 'home_section_9', 'popular_heading'),
(142, 'home_section_10', 'popular'),
(143, 'home_section_11', 'recent_reviews_heading'),
(144, 'home_section_12', 'recent_reviews');

-- --------------------------------------------------------

--
-- بنية الجدول `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `food_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `cart_extras`
--

CREATE TABLE `cart_extras` (
  `extra_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Drinks', 'Voluptas aut ut ipsum dignissimos. Repudiandae aut ullam consequatur enim quo. Quia iure aperiam voluptate adipisci. Minus repellendus tempore voluptatem dolorem voluptate quo similique. Ut porro dignissimos doloribus aut ad.', '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(2, 'Grains', 'Explicabo ex repellendus incidunt nulla deleniti cumque. Natus numquam omnis esse consequatur optio porro. Iusto accusantium dolores magnam suscipit autem consequatur quia. Ab quod vitae sunt eum. Mollitia a culpa molestiae et ipsum omnis.', '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(3, 'Drinks', 'Modi debitis velit fuga facilis qui distinctio. Eos a eum magnam aut omnis. Sit sit et aliquam praesentium eum voluptas. Sit aut mollitia qui soluta consequatur. Aut quia ut consequatur optio fugiat vel similique et.', '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(4, 'Protein', 'Fuga voluptatem architecto ad accusantium voluptatem veritatis porro. Rerum quia odit fugit. Eos culpa similique odio occaecati. Suscipit quaerat est dolor aut et enim natus. Temporibus voluptatem voluptates nisi autem minima in quisquam.', '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(5, 'Sandwiches', 'Sed saepe eaque suscipit exercitationem et aut itaque. Rerum explicabo quia aut ut consectetur voluptatibus. Ut velit quo a perferendis molestias non. Et fugit qui qui sit natus aut omnis. Quia vitae rerum esse sint.', '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(6, 'Vegetables', 'Rem iste nisi soluta in eos cupiditate optio ex. Consequatur incidunt nihil ratione rem ut. Voluptatem laboriosam iste quaerat totam. Exercitationem consequuntur eum dolores. Veniam molestiae aut rem id amet quaerat.', '2021-07-04 11:40:03', '2021-07-04 11:40:03');

-- --------------------------------------------------------

--
-- بنية الجدول `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `cuisines`
--

CREATE TABLE `cuisines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `cuisines`
--

INSERT INTO `cuisines` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Chinese', 'Eum similique maiores atque quia explicabo. Dolores quia placeat consequatur id quis perspiciatis. Ducimus sit ducimus officia labore maiores et porro. Est iusto natus nesciunt debitis consequuntur totam. Et illo et autem inventore earum corrupti.', '2020-04-11 12:03:21', '2020-04-11 12:03:21'),
(2, 'Indian', 'Eaque et aut natus. Minima blanditiis ut sunt distinctio ad. Quasi doloremque rerum ex rerum. Molestias similique similique aut rerum delectus blanditiis et. Dolorem et quas nostrum est nobis.', '2020-04-11 12:03:21', '2020-04-11 12:03:21'),
(3, 'Thai', 'Est nihil omnis natus ducimus ducimus excepturi quos. Et praesentium in quia veniam. Tempore aut nesciunt consequatur pariatur recusandae. Voluptatem commodi eius quaerat est deleniti impedit. Qui quo harum est sequi incidunt labore eligendi cum.', '2020-04-11 12:03:21', '2020-04-11 12:03:21'),
(4, 'Greek', 'Ex nostrum suscipit aut et labore. Ut dolor ut eum eum voluptatem ex. Sapiente in tempora soluta voluptatem. Officia accusantium quae sit. Rerum esse ipsa molestias dolorem et est autem consequatur.', '2020-04-11 12:03:21', '2020-04-11 12:03:21'),
(5, 'Vietnamese', 'Dolorum earum ut blanditiis blanditiis. Facere quis voluptates assumenda saepe. Ab aspernatur voluptatibus rem doloremque cum impedit. Itaque blanditiis commodi repudiandae asperiores. Modi atque placeat consectetur et aut blanditiis.', '2020-04-11 12:03:21', '2020-04-11 12:03:21'),
(6, 'French', 'Est et iste enim. Quam repudiandae commodi rerum non esse. Et in aut sequi est aspernatur. Facere non modi expedita asperiores. Ipsa laborum saepe deserunt qui consequatur voluptas inventore dolorum.', '2020-04-11 12:03:21', '2020-04-11 12:03:21');

-- --------------------------------------------------------

--
-- بنية الجدول `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2019-10-22 12:50:48', '2019-10-22 12:50:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2019-10-22 12:51:39', '2019-10-22 12:51:39'),
(3, 'Indian Rupee', 'টকা', 'INR', 2, 0, '2019-10-22 12:52:50', '2019-10-22 12:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2019-10-22 12:53:22', '2019-10-22 12:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2019-10-22 12:54:00', '2019-10-22 12:54:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2019-10-22 12:55:51', '2019-10-22 12:55:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2019-10-22 12:56:26', '2019-10-22 12:56:26');

-- --------------------------------------------------------

--
-- بنية الجدول `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(4, 'phone', 'text', NULL, 0, 0, 0, 6, 2, 'App\\Models\\User', '2019-09-06 18:30:00', '2019-09-06 18:31:47'),
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-06 18:43:58', '2019-09-06 18:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-06 18:49:22', '2019-09-06 18:49:22');

-- --------------------------------------------------------

--
-- بنية الجدول `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(29, '+136 226 5669', '+136 226 5669', 4, 'App\\Models\\User', 2, '2019-09-06 18:52:30', '2019-09-06 18:52:30'),
(30, 'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.', 'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.', 5, 'App\\Models\\User', 2, '2019-09-06 18:52:30', '2019-10-16 16:32:35'),
(31, '2911 Corpening Drive South Lyon, MI 48178', '2911 Corpening Drive South Lyon, MI 48178', 6, 'App\\Models\\User', 2, '2019-09-06 18:52:30', '2019-10-16 16:32:35'),
(32, '+136 226 5660', '+136 226 5660', 4, 'App\\Models\\User', 1, '2019-09-06 18:53:58', '2019-09-27 05:12:04'),
(33, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 1, '2019-09-06 18:53:58', '2019-10-16 16:23:53'),
(34, '569 Braxton Street Cortland, IL 60112', '569 Braxton Street Cortland, IL 60112', 6, 'App\\Models\\User', 1, '2019-09-06 18:53:58', '2019-10-16 16:23:53'),
(35, '+1 098-6543-236', '+1 098-6543-236', 4, 'App\\Models\\User', 3, '2019-10-15 14:21:32', '2019-10-17 20:21:43'),
(36, 'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse', 'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse', 5, 'App\\Models\\User', 3, '2019-10-15 14:21:32', '2019-10-17 20:21:12'),
(37, '1850 Big Elm Kansas City, MO 64106', '1850 Big Elm Kansas City, MO 64106', 6, 'App\\Models\\User', 3, '2019-10-15 14:21:32', '2019-10-17 20:21:43'),
(38, '+1 248-437-7610', '+1 248-437-7610', 4, 'App\\Models\\User', 4, '2019-10-16 16:31:46', '2019-10-16 16:31:46'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-16 16:31:46', '2019-10-16 16:31:46'),
(40, '1050 Frosty Lane Sidney, NY 13838', '1050 Frosty Lane Sidney, NY 13838', 6, 'App\\Models\\User', 4, '2019-10-16 16:31:46', '2019-10-16 16:31:46'),
(41, '+136 226 5669', '+136 226 5669', 4, 'App\\Models\\User', 5, '2019-12-15 15:49:44', '2019-12-15 15:49:44'),
(42, '<p>Short Bio</p>', 'Short Bio', 5, 'App\\Models\\User', 5, '2019-12-15 15:49:44', '2019-12-15 15:49:44'),
(43, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 5, '2019-12-15 15:49:44', '2019-12-15 15:49:44'),
(44, '+136 955 6525', '+136 955 6525', 4, 'App\\Models\\User', 6, '2020-03-29 14:28:04', '2020-03-29 14:28:04'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-29 14:28:05', '2020-03-29 14:28:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-29 14:28:05', '2020-03-29 14:28:05');

-- --------------------------------------------------------

--
-- بنية الجدول `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `is_default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Quo similique vitae possimus maxime in corrupti et.', '997 Jones Turnpike\nLake Darbyport, NY 85057-8842', '54.805021', '7.362111', 0, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(2, 'Aut dolorum doloribus aliquam sed eaque sapiente voluptatem.', '42337 Reilly Creek\nEast Dillanville, WA 03647-0862', '49.590247', '7.653064', 1, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(3, 'Ad est deleniti aut alias eius eius.', '55777 Reynolds Branch\nAureliechester, OR 83706-9238', '46.863981', '9.130439', 0, 5, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(4, 'Et autem ullam eum enim voluptates quidem.', '301 Richie Corner Suite 206\nVincenzaside, UT 67631-4260', '39.498527', '10.055813', 1, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(5, 'Commodi et voluptas cumque vitae provident et eligendi.', '436 Jacobson Mill Apt. 647\nMargotchester, CT 67799', '49.928272', '7.779985', 0, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(6, 'Nihil nulla aliquam exercitationem itaque.', '8770 Destin Fords Suite 122\nLake Edgar, OK 57269-6521', '45.080282', '9.332851', 0, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(7, 'Et perferendis mollitia id vero deserunt est ratione.', '961 Hills Fall Apt. 397\nPort Myahburgh, IL 56651-1620', '46.635754', '8.625384', 1, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(8, 'Et ut ipsum voluptate.', '21185 Koss Port Suite 570\nPort Lamont, NE 10254', '41.442728', '8.992942', 1, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(9, 'Amet quos porro repellat.', '572 Maryjane Port\nNorth Evieland, DE 22435-2697', '47.28966', '10.247165', 1, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(10, 'Veritatis voluptas illo est odit maiores autem voluptates.', '6135 Roxane Circle Suite 202\nEldridgemouth, NC 86209-4846', '45.701542', '8.710375', 0, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(11, 'Molestiae qui amet deleniti ea fuga.', '396 Leannon Street Suite 073\nEast Jeanie, IA 87351-2125', '51.526674', '7.432209', 1, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(12, 'Qui dolores ipsam dolor odio qui deserunt.', '679 Kavon Corners Suite 398\nBeckerchester, AZ 10581', '37.880729', '9.729834', 1, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(13, 'Delectus sint porro velit ut saepe architecto et.', '15344 Graham Creek Suite 496\nWisozkton, NH 29478-8585', '50.645858', '11.021532', 0, 4, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(14, 'Mollitia et ut aut ut sit neque necessitatibus.', '6989 Raynor Mission\nRempelport, PA 23015', '40.744927', '11.257544', 0, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(15, 'Nihil quos occaecati fugiat molestias ut est.', '51128 Mathias Port\nDelltown, IA 71713-4131', '53.316036', '9.897184', 0, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04');

-- --------------------------------------------------------

--
-- بنية الجدول `discountables`
--

CREATE TABLE `discountables` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `drivers`
--

CREATE TABLE `drivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `delivery_fee` double(5,2) NOT NULL DEFAULT 0.00,
  `total_orders` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `earning` double(9,2) NOT NULL DEFAULT 0.00,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `drivers`
--

INSERT INTO `drivers` (`id`, `user_id`, `delivery_fee`, `total_orders`, `earning`, `available`, `created_at`, `updated_at`) VALUES
(1, 5, 0.00, 0, 0.00, 0, '2021-07-04 14:43:02', '2021-07-04 14:43:02'),
(2, 6, 0.00, 0, 0.00, 0, '2021-07-04 14:43:02', '2021-07-04 14:43:02');

-- --------------------------------------------------------

--
-- بنية الجدول `drivers_payouts`
--

CREATE TABLE `drivers_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(9,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `driver_restaurants`
--

CREATE TABLE `driver_restaurants` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `driver_restaurants`
--

INSERT INTO `driver_restaurants` (`user_id`, `restaurant_id`) VALUES
(5, 1),
(5, 2),
(5, 4),
(6, 2),
(6, 3),
(6, 4);

-- --------------------------------------------------------

--
-- بنية الجدول `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `total_orders` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_earning` double(9,2) NOT NULL DEFAULT 0.00,
  `admin_earning` double(9,2) NOT NULL DEFAULT 0.00,
  `restaurant_earning` double(9,2) NOT NULL DEFAULT 0.00,
  `delivery_fee` double(9,2) NOT NULL DEFAULT 0.00,
  `tax` double(9,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `extras`
--

CREATE TABLE `extras` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT 0.00,
  `food_id` int(10) UNSIGNED NOT NULL,
  `extra_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `extras`
--

INSERT INTO `extras` (`id`, `name`, `description`, `price`, `food_id`, `extra_group_id`, `created_at`, `updated_at`) VALUES
(1, 'S', 'Possimus voluptates quis dolor et aut.', 17.66, 4, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(2, 'Cheese', 'Fugit quisquam cupiditate deleniti.', 21.06, 7, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(3, 'Cheese', 'Vel facilis iusto suscipit non.', 33.18, 16, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(4, 'XL', 'Eos veritatis pariatur et consectetur.', 22.11, 1, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(5, 'Tomato', 'Consequatur aut cupiditate temporibus et.', 22.59, 30, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(6, 'Oil', 'Sunt temporibus quis et in ab.', 32.29, 17, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(7, 'S', 'Dolores beatae qui quis velit.', 43.20, 29, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(8, '5L', 'Laudantium id dolorem.', 11.24, 9, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(9, 'Oil', 'In in pariatur.', 47.97, 30, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(10, 'Oil', 'Eos voluptatem hic quia error.', 39.98, 27, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(11, '2L', 'Possimus saepe architecto aut.', 22.06, 29, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(12, '2L', 'Blanditiis non accusantium omnis voluptates.', 32.99, 13, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(13, 'Tomato', 'In corrupti nulla ullam hic.', 12.35, 11, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(14, 'Tuna', 'Repellendus fuga non dolorum.', 41.31, 2, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(15, 'L', 'Reiciendis nihil minima.', 45.09, 13, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(16, 'Cheese', 'Et ex et.', 39.23, 14, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(17, 'Oil', 'Quo consequatur sint velit.', 34.76, 16, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(18, 'Cheese', 'Autem qui reiciendis.', 27.51, 22, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(19, 'Cheese', 'Voluptatem eius ut temporibus blanditiis.', 46.12, 22, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(20, '2L', 'Dolor rem quibusdam quae.', 28.54, 27, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(21, '5L', 'Maxime maxime officiis delectus eos.', 49.28, 24, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(22, '2L', 'Quasi soluta non id.', 47.38, 21, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(23, 'XL', 'Alias unde expedita et eaque.', 16.85, 19, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(24, 'XL', 'Consequatur ipsa sequi temporibus.', 48.86, 6, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(25, 'Cheese', 'Deleniti vitae dolore nemo repellat voluptas.', 20.31, 23, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(26, 'L', 'Vitae et nisi illum voluptate exercitationem.', 48.25, 4, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(27, 'Tuna', 'Possimus et nulla tenetur reprehenderit.', 19.89, 18, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(28, 'Oil', 'Reprehenderit qui eius aut earum.', 44.97, 5, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(29, 'Cheese', 'Quis ullam et architecto.', 27.94, 8, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(30, 'L', 'Nihil necessitatibus est quod.', 11.15, 21, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(31, '2L', 'Maiores cum quos quia ut voluptas.', 28.30, 19, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(32, 'Cheese', 'Enim voluptas consequatur placeat dolores.', 44.92, 9, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(33, '2L', 'Reiciendis necessitatibus et quo cupiditate.', 32.99, 25, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(34, 'Tuna', 'Aut natus qui quia.', 31.48, 3, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(35, 'L', 'Sint vitae nulla possimus.', 40.72, 30, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(36, 'Cheese', 'Aspernatur officiis vitae.', 47.33, 10, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(37, 'XL', 'Et dolor cumque distinctio.', 24.65, 12, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(38, 'Oil', 'Totam sed omnis maiores.', 35.86, 27, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(39, 'XL', 'Magnam pariatur eaque et inventore.', 32.92, 16, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(40, 'Oil', 'Ut commodi nisi in.', 28.72, 9, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(41, 'Cheese', 'Et accusamus repellendus suscipit beatae incidunt.', 20.68, 24, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(42, '2L', 'Ea odio ipsam.', 16.95, 7, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(43, 'S', 'Illum provident et nihil sed.', 25.68, 16, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(44, '2L', 'Dolorum perferendis deleniti ab sunt non.', 32.40, 10, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(45, '2L', 'Tempora vel deserunt.', 35.30, 19, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(46, 'XL', 'Voluptas et voluptates optio veritatis.', 25.79, 13, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(47, '5L', 'Quia laborum ut illo.', 23.27, 16, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(48, 'Oil', 'Doloribus sapiente nihil nam quos fugiat.', 45.97, 5, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(49, 'Oil', 'Atque ipsam nostrum accusantium laudantium aut.', 19.51, 22, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(50, 'Oil', 'Consequatur qui est esse.', 18.89, 16, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04');

-- --------------------------------------------------------

--
-- بنية الجدول `extra_groups`
--

CREATE TABLE `extra_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `extra_groups`
--

INSERT INTO `extra_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2019-08-31 07:55:28', '2019-08-31 07:55:28'),
(2, 'Taste', '2019-10-09 10:26:28', '2019-10-09 10:26:28'),
(3, 'Capacity', '2019-10-09 10:26:28', '2019-10-09 10:26:28');

-- --------------------------------------------------------

--
-- بنية الجدول `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Enim maxime perferendis aut deleniti quam asperiores. Sunt vero nisi et est neque possimus.', 'I wish I hadn\'t begun my tea--not above a week or so--and what with the Duchess, \'and that\'s why. Pig!\' She said the Mock Turtle. \'No, no! The adventures first,\' said the Queen, tossing her head.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(2, 'Sunt rerum quia voluptas dolor labore et dolores dolores. Distinctio ut soluta sed sunt vitae.', 'The Caterpillar and Alice guessed in a low voice, \'Your Majesty must cross-examine the next witness!\' said the Hatter was the first witness,\' said the one who had got its neck nicely straightened.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(3, 'Temporibus magnam a atque mollitia eligendi quidem voluptatem. Minus vero iste rerum quibusdam.', 'But the insolence of his great wig.\' The judge, by the White Rabbit, who said in a natural way again. \'I wonder if I\'ve been changed for any of them. \'I\'m sure those are not attending!\' said the.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(4, 'Aut aut voluptatem recusandae esse earum provident. Nisi natus facilis eius quis ipsum.', 'For anything tougher than suet; Yet you finished the guinea-pigs!\' thought Alice. One of the officers: but the Hatter and the King had said that day. \'A likely story indeed!\' said the Duchess; \'and.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(5, 'Rem autem quibusdam dolorum quia. Distinctio velit dignissimos ex est. Nam sed tenetur ea hic quia.', 'Alice tried to curtsey as she spoke. (The unfortunate little Bill had left off sneezing by this time, and was delighted to find my way into a pig,\' Alice quietly said, just as she came rather late.', 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(6, 'Nulla totam rerum error amet praesentium ex nobis porro. Reprehenderit provident excepturi at quia.', 'Alice in a melancholy tone. \'Nobody seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Mouse. \'Of.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(7, 'Cupiditate expedita molestiae porro. Qui veniam pariatur aut quas nihil.', 'Soup! Beau--ootiful Soo--oop! Soo--oop of the court was a table in the same tone, exactly as if he had taken advantage of the soldiers had to ask his neighbour to tell him. \'A nice muddle their.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(8, 'Deleniti maiores minus eos commodi accusamus illo. Aut sit aut impedit tempore.', 'Mock Turtle. \'Certainly not!\' said Alice in a low voice, to the Knave. The Knave did so, very carefully, nibbling first at one corner of it: for she was up to her chin upon Alice\'s shoulder, and it.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(9, 'Ipsa est qui voluptatibus rerum. Aut veritatis et mollitia debitis.', 'Cheshire cat,\' said the Caterpillar, and the words did not much surprised at her for a little faster?\" said a timid and tremulous sound.] \'That\'s different from what I say,\' the Mock Turtle\'s heavy.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(10, 'Ut quasi nihil accusamus quidem enim. Incidunt nobis facere error hic praesentium vel expedita.', 'Mouse, frowning, but very politely: \'Did you say things are worse than ever,\' thought the whole place around her became alive with the lobsters, out to be full of the trees upon her face. \'Wake up.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(11, 'Dolores quos voluptate libero qui. Qui tempora repellat quis optio libero dolorem.', 'Alice: \'she\'s so extremely--\' Just then she remembered trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had gone through that day. \'No, no!\' said the Dodo. Then.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(12, 'Aliquam esse sit excepturi doloribus modi dolor odio. Similique autem velit et.', 'Alice, looking down at them, and it\'ll sit up and down in a day did you do either!\' And the Gryphon in an encouraging tone. Alice looked down at her rather inquisitively, and seemed to rise like a.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(13, 'Rerum voluptates ut velit quia. Quia facere excepturi laudantium sed sequi.', 'King triumphantly, pointing to Alice with one of its voice. \'Back to land again, and put it to be rude, so she set to work nibbling at the end of the court. (As that is enough,\' Said his father.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(14, 'Velit quod sed repudiandae quo eos. Minus et excepturi quos sit nam ut et.', 'King, and the happy summer days. THE.', 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(15, 'Et deserunt eos quia et nihil. Recusandae a aut omnis quasi eum sed.', 'Gryphon replied very politely, \'if I had our Dinah here, I know I have done that, you know,\' said the Gryphon at the great hall, with the Queen had only one who got any advantage from the trees upon.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(16, 'Cum tempore consequatur pariatur omnis. Eos eum mollitia eligendi eveniet dolorem dolores minima.', 'Alice had been all the same, shedding gallons of tears, until there was the BEST butter,\' the March Hare, who had got burnt, and eaten up by wild beasts and other unpleasant things, all because they.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(17, 'Voluptas quam cumque ullam culpa blanditiis aut corrupti. Tenetur maiores sunt expedita sint.', 'Cat went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. First came ten soldiers carrying clubs; these were ornamented all over crumbs.\' \'You\'re wrong about the same size: to be a person of.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(18, 'Rerum perspiciatis molestias velit ipsa. Mollitia et nam ad quia ad officia dolor.', 'There was exactly three inches high). \'But I\'m NOT a serpent!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at the top of her ever getting out.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(19, 'Non numquam harum velit eligendi. Et modi laborum omnis vero.', 'Queen. \'You make me larger, it must be getting somewhere near the house if it makes rather a hard word, I will just explain to you to get in?\' asked Alice again, for this curious child was very.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(20, 'Autem beatae ut facilis. Quia labore hic aut fuga officiis. Rerum unde commodi sint sapiente.', 'The Gryphon lifted up both its paws in surprise. \'What! Never heard of one,\' said Alice. \'Why, SHE,\' said the Mouse, turning to the shore, and then dipped suddenly down, so suddenly that Alice quite.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(21, 'Omnis aut cupiditate nemo numquam. Consequatur odio voluptates cumque omnis.', 'Alice, a good deal worse off than before, as the jury asked. \'That I can\'t remember,\' said the Dodo replied very readily: \'but that\'s because it stays the same thing with you,\' said the Pigeon; \'but.', 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(22, 'Enim rem dolorem ut numquam. Ut quibusdam est repellat ad voluptatem.', 'Majesty!\' the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit: it was too late to wish that! She went in search of her own.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(23, 'Adipisci quod est aspernatur magnam ut. Et temporibus et dolorum blanditiis ratione debitis.', 'Alice looked at it, and burning with curiosity, she ran off as hard as it happens; and if I know THAT well enough; and what does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man,\' the.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(24, 'Adipisci ab laudantium qui et. Quia necessitatibus et modi provident tempore praesentium et vel.', 'March Hare said in a hurry that she was quite tired of being upset, and their curls got entangled together. Alice laughed so much about a whiting to a mouse, That he met in the face. \'I\'ll put a.', 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(25, 'Repellendus quibusdam exercitationem sunt ad ex aut. Voluptate ipsum delectus autem dolorem dolore.', 'But at any rate,\' said Alice: \'three inches is such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me hear the Rabbit came up to her ear. \'You\'re thinking about.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(26, 'In est excepturi aut ea. Est debitis quis ducimus.', 'Very soon the Rabbit just under the door; so either way I\'ll get into her face, and was just possible it had no idea what you\'re talking about,\' said Alice. \'It must have prizes.\' \'But who has won?\'.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(27, 'Omnis minus est et qui sit excepturi sit quam. Aspernatur in vero et.', 'There was certainly English. \'I don\'t know of any that do,\' Alice hastily replied; \'at least--at least I know THAT well enough; don\'t be particular--Here, Bill! catch hold of it; so, after hunting.', 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(28, 'Explicabo rerum aut expedita omnis et sed asperiores. Enim eius distinctio itaque nisi cum.', 'MINE.\' The Queen had never seen such a thing before, but she did not much like keeping so close to her: first, because the chimneys were shaped like ears and whiskers, how late it\'s getting!\' She.', 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(29, 'Et ut labore quae voluptate vel animi. Distinctio quia qui sint similique.', 'So you see, so many out-of-the-way things to happen, that it led into the roof of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and Queen of Hearts.', 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(30, 'Ut perspiciatis corporis sunt optio. Quisquam est illo quasi. Vero corrupti aliquam et qui.', 'I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they live at the stick, and held it out loud. \'Thinking again?\' the Duchess and the poor little thing howled.', 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05');

-- --------------------------------------------------------

--
-- بنية الجدول `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Foods', '2019-08-31 09:31:52', '2019-08-31 09:31:52'),
(2, 'Services', '2019-08-31 09:32:03', '2019-08-31 09:32:03'),
(3, 'Delivery', '2019-08-31 09:32:11', '2019-08-31 09:32:11'),
(4, 'Misc', '2019-08-31 09:32:17', '2019-08-31 09:32:17');

-- --------------------------------------------------------

--
-- بنية الجدول `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `food_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `favorites`
--

INSERT INTO `favorites` (`id`, `food_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 20, 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(2, 18, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(3, 18, 6, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(4, 23, 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(5, 3, 6, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(6, 16, 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(7, 25, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(8, 3, 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(9, 4, 6, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(10, 26, 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(11, 11, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(12, 12, 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(13, 15, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(14, 25, 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(15, 13, 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(16, 10, 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(17, 30, 6, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(18, 24, 6, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(19, 21, 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(20, 6, 6, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(21, 18, 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(22, 11, 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(23, 13, 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(24, 14, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(25, 4, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(26, 22, 4, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(27, 26, 3, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(28, 17, 5, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(29, 17, 2, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(30, 20, 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05');

-- --------------------------------------------------------

--
-- بنية الجدول `favorite_extras`
--

CREATE TABLE `favorite_extras` (
  `extra_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `favorite_extras`
--

INSERT INTO `favorite_extras` (`extra_id`, `favorite_id`) VALUES
(1, 1),
(1, 5),
(2, 6),
(3, 2),
(5, 3);

-- --------------------------------------------------------

--
-- بنية الجدول `foods`
--

CREATE TABLE `foods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_price` double(8,2) DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_items_count` double(9,2) DEFAULT 0.00,
  `weight` double(9,2) DEFAULT 0.00,
  `unit` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `deliverable` tinyint(1) DEFAULT 1,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `foods`
--

INSERT INTO `foods` (`id`, `name`, `price`, `discount_price`, `description`, `ingredients`, `package_items_count`, `weight`, `unit`, `featured`, `deliverable`, `restaurant_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Italian Sausage Soup', 38.07, 0.00, 'Et et ea maiores quibusdam similique illo qui. Animi et doloribus dicta dignissimos repellat. Sint cupiditate ut voluptas corrupti voluptatum perferendis nostrum. Sed dignissimos et fugiat at est et.', NULL, 5.00, 133.71, 'ml', 1, 1, 3, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(2, 'Italian Sausage Soup', 45.67, 44.31, 'Et aperiam eius soluta nihil. Minima asperiores similique asperiores velit pariatur dolore ipsa. Aut facere cum dolorem velit qui.', NULL, 3.00, 202.62, 'L', 1, 1, 2, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(3, 'Chicken Noodle Soup', 13.60, 0.00, 'Alias ipsa accusamus velit voluptatum voluptas molestiae reiciendis fuga. Sed at et eligendi alias sit. Sed maiores quam maiores ea consequatur optio voluptate.', NULL, 5.00, 60.31, 'g', 1, 0, 6, 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(4, 'Pasta Pappardelle', 35.95, 0.00, 'Ut rerum voluptas modi omnis est. Laboriosam incidunt tenetur corrupti iure.', NULL, 6.00, 365.65, 'Kg', 0, 0, 6, 4, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(5, 'Italian Sausage Soup', 44.52, 0.00, 'Dolor cumque qui et quod aut magni ut quia. Mollitia autem et sed nihil cumque vel quas. Reprehenderit eum enim minus porro et. Sint voluptatum ratione aliquid eaque consequuntur ab.', NULL, 4.00, 419.63, 'g', 1, 1, 5, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(6, 'California Italian Wedding Soup', 11.46, 0.00, 'Adipisci nostrum animi error officia repellat sint aut. Qui pariatur accusamus non sed sapiente et. Consectetur quo magnam voluptatem nihil ut deserunt dolore pariatur.', NULL, 6.00, 205.82, 'g', 1, 1, 7, 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(7, 'Pizza al Pesto', 30.77, 0.00, 'Est quos deleniti ab tenetur rerum. Odit eius id rerum dolorem. Ipsam quo quaerat fuga ut.', NULL, 5.00, 224.53, 'ml', 1, 0, 3, 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(8, 'Acini di Pepe', 27.75, 0.00, 'Tempore maxime ut quod enim a aut et. Aspernatur error nam aut harum iste a. Aut ea amet est animi. Aut fugiat deleniti consequatur id tenetur accusantium voluptatibus.', NULL, 1.00, 461.26, 'Kg', 0, 0, 8, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(9, 'Pizza Margherita', 47.38, 45.77, 'Et quaerat provident placeat veniam. Reprehenderit vel vel animi asperiores quo. Cum sunt fugiat ut dolorem. Quibusdam et et dolorem in.', NULL, 5.00, 494.23, 'Kg', 1, 0, 3, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(10, 'Acini di Pepe', 46.22, 42.09, 'Inventore exercitationem deleniti atque. Ut veniam fuga similique sed. Et ut incidunt et magni.', NULL, 2.00, 91.81, 'Kg', 1, 1, 4, 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(11, 'Soup', 45.90, 37.03, 'Quidem ea officia expedita. Voluptatem voluptatem sed vel est sit commodi. Sint aut laborum sed et dignissimos sequi ab. Sunt vel dolor aspernatur incidunt.', NULL, 3.00, 43.25, 'L', 0, 0, 6, 4, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(12, 'Pasta Campanelle', 48.77, 42.76, 'Maxime dolor eveniet eveniet. Ut vitae molestias explicabo. Animi deleniti ut fuga ipsa esse sit.', NULL, 3.00, 209.23, 'L', 0, 1, 1, 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(13, 'Pasta Campanelle', 26.39, 0.00, 'Assumenda dolor sit consectetur est quos. Ad adipisci tenetur aut dicta qui harum et et. Quibusdam omnis nulla blanditiis et.', NULL, 3.00, 400.85, 'ml', 1, 0, 3, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(14, 'California Italian Wedding Soup', 23.33, 0.00, 'Eos voluptatem eaque ut sit qui illo id. Eum tempore eos aliquid harum quos autem totam. Esse est nam distinctio expedita maxime.', NULL, 5.00, 115.17, 'g', 1, 1, 5, 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(15, 'Pasta Campanelle', 19.90, 17.33, 'Officia excepturi ipsa omnis. Quo laborum quis id aut qui eaque sit. Qui quisquam nesciunt quae quos.', NULL, 2.00, 287.80, 'g', 0, 1, 5, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(16, 'Soup', 21.66, 15.48, 'Corrupti alias ut et quia architecto. Illo iusto accusantium occaecati expedita.', NULL, 2.00, 329.54, 'Kg', 1, 0, 3, 3, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(17, 'Soup', 46.65, 42.83, 'Optio corrupti itaque veritatis dicta in omnis qui saepe. Optio earum ea omnis praesentium quam. Voluptatem reprehenderit ipsa quo quia fugit.', NULL, 1.00, 332.12, 'g', 0, 1, 9, 3, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(18, 'Pasta Pappardelle', 37.89, 33.74, 'Doloribus voluptatem consequuntur ullam reiciendis est nisi quisquam. Laborum in rerum ex iure voluptatem aut et eveniet. Voluptatem facilis omnis accusantium aut est suscipit est.', NULL, 2.00, 133.27, 'L', 1, 0, 7, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(19, 'Italian Sausage Soup', 44.22, 0.00, 'Enim tempore numquam sapiente repellendus maxime error. Placeat quaerat dolores aut magni vel qui. Possimus velit laborum voluptatem corrupti dignissimos. Expedita saepe aut harum modi.', NULL, 5.00, 31.55, 'L', 0, 0, 9, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(20, 'Cucur Udang Kuah Kacang', 21.90, 0.00, 'Porro magnam excepturi non excepturi non illo facilis. Asperiores blanditiis fugiat dolores rem eveniet. Animi veniam consectetur aut.', NULL, 4.00, 200.53, 'ml', 0, 1, 4, 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(21, 'Italian Sausage Soup', 26.38, 16.98, 'Sed vitae ut ut quae tenetur blanditiis. Odio laborum pariatur nesciunt labore voluptates. Magnam est aspernatur vitae ea. Alias quo repellat atque ut qui et natus.', NULL, 6.00, 55.79, 'g', 1, 1, 6, 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(22, 'Soup', 17.31, 0.00, 'Sit quis perspiciatis corporis sed dolores. Aliquam quisquam velit eum tempore maxime voluptatem. Recusandae aliquam vel natus molestias sequi natus. Non et rerum voluptatem libero aliquid iusto.', NULL, 4.00, 309.35, 'g', 0, 0, 8, 4, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(23, 'Cucur Udang Kuah Kacang', 31.42, 0.00, 'Dolorem architecto quo magni. Corrupti numquam alias blanditiis autem asperiores. Quis tempore occaecati aut. Accusantium suscipit dolores neque. Laborum asperiores harum sit dolore repellat.', NULL, 1.00, 235.65, 'Kg', 1, 0, 3, 3, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(24, 'Pasta Pappardelle', 13.61, 6.68, 'Sunt maxime molestias velit sed. Veniam cum quasi illo esse sit. Eos sed corporis iure voluptatem. Ratione sint et maxime quidem expedita voluptatem sequi.', NULL, 1.00, 7.27, 'Kg', 1, 0, 6, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(25, 'Big Smokey Burgers', 42.92, 0.00, 'Recusandae rerum quae illo nulla omnis quis eius ducimus. Illum dolorem dolor tempora corrupti. Quo aut rerum laborum voluptatem. Delectus qui eos placeat similique est recusandae et.', NULL, 5.00, 380.94, 'ml', 0, 0, 2, 3, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(26, 'Italian Sausage Soup', 35.17, 0.00, 'Consequatur adipisci sed explicabo officia enim. Minima eum id porro iste. Perspiciatis rerum illo et voluptatem omnis nobis et.', NULL, 3.00, 170.11, 'L', 0, 1, 9, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(27, 'Soup', 32.67, 26.15, 'Non at quisquam quia accusantium totam numquam. Et voluptatem est vitae maiores ea alias officia. Culpa et exercitationem qui magni. Est non nisi molestiae laboriosam autem.', NULL, 3.00, 252.84, 'g', 1, 0, 1, 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(28, 'Chicken Noodle Soup', 36.25, 34.71, 'Optio odit dignissimos dolorum consequatur. Saepe nisi aut voluptate accusantium exercitationem. Occaecati et cum eum quia.', NULL, 2.00, 126.12, 'Kg', 0, 0, 3, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(29, 'Angel Hair', 37.75, 0.00, 'Tenetur at minima voluptatem dolor quae quisquam. Rem reiciendis suscipit iure. Quam perferendis sequi architecto sunt aut.', NULL, 1.00, 77.37, 'g', 1, 1, 6, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(30, 'Pizza al Pesto', 34.78, 29.33, 'Soluta sed at autem labore reiciendis iure exercitationem dolores. Sint qui fuga sint est nostrum dolores consequatur quas. Aspernatur voluptates facilis et quidem porro dolorum beatae.', NULL, 4.00, 242.08, 'Kg', 1, 1, 3, 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03');

-- --------------------------------------------------------

--
-- بنية الجدول `food_orders`
--

CREATE TABLE `food_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `food_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `food_order_extras`
--

CREATE TABLE `food_order_extras` (
  `food_order_id` int(10) UNSIGNED NOT NULL,
  `extra_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `food_reviews`
--

CREATE TABLE `food_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `food_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `food_reviews`
--

INSERT INTO `food_reviews` (`id`, `review`, `rate`, `user_id`, `food_id`, `created_at`, `updated_at`) VALUES
(1, 'Gryphon, with a sigh: \'it\'s always tea-time, and we\'ve no time to avoid shrinking away altogether. \'That WAS a narrow escape!\' said Alice, who was reading the list of the baby?\' said the Gryphon.', 5, 4, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(2, 'I find a thing,\' said the March Hare, \'that \"I breathe when I sleep\" is the capital of Paris, and Paris is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must sugar my hair.\" As.', 4, 5, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(3, 'They\'re dreadfully fond of pretending to be otherwise than what you mean,\' said Alice. \'Oh, don\'t talk about cats or dogs either, if you hold it too long; and that is enough,\' Said his father.', 3, 2, 20, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(4, 'AT ALL. Soup does very well as she stood still where she was, and waited. When the Mouse replied rather impatiently: \'any shrimp could have told you that.\' \'If I\'d been the right distance--but then.', 3, 2, 11, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(5, 'I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they draw?\' said Alice, feeling very glad to find it out, we should all have our heads cut off, you know.', 4, 2, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(6, 'Queen was in the court!\' and the Dormouse fell asleep instantly, and neither of the door and went stamping about, and shouting \'Off with her head!\' about once in her hands, and she hastily dried her.', 4, 5, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(7, 'Alice had not got into the loveliest garden you ever saw. How she longed to change the subject. \'Ten hours the first to speak. \'What size do you want to go! Let me think: was I the same as the White.', 5, 3, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(8, 'You gave us three or more; They all returned from him to you, Though they were nowhere to be no sort of meaning in it, and very soon finished it off. \'If everybody minded their own business!\' \'Ah.', 1, 5, 24, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(9, 'However, at last in the wind, and the three gardeners instantly jumped up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King repeated angrily, \'or I\'ll have you got in.', 4, 2, 4, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(10, 'VERY tired of being upset, and their slates and pencils had been running half an hour or so, and giving it a bit, if you drink much from a Caterpillar The Caterpillar and Alice was silent. The King.', 2, 1, 18, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(11, 'White Rabbit read:-- \'They told me you had been to her, one on each side to guard him; and near the door, and the second time round, she found she could not even get her head made her so savage when.', 4, 3, 13, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(12, 'FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, who felt very lonely and low-spirited. In a little scream of laughter. \'Oh, hush!\' the Rabbit noticed Alice, as she went.', 4, 4, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(13, 'March Hare and his friends shared their never-ending meal, and the others all joined in chorus, \'Yes, please do!\' but the cook and the March Hare. Visit either you like: they\'re both mad.\' \'But I.', 3, 4, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(14, 'Pigeon. \'I can tell you what year it is?\' \'Of course it was,\' the March Hare moved into the garden. Then she went on in a trembling voice, \'Let us get to the Dormouse, and repeated her question.', 2, 6, 20, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(15, 'Queen, in a large rabbit-hole under the door; so either way I\'ll get into the sea, though you mayn\'t believe it--\' \'I never thought about it,\' added the Gryphon; and then unrolled the parchment.', 1, 6, 10, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(16, 'Alice, (she had grown in the shade: however, the moment he was going to begin lessons: you\'d only have to fly; and the poor little thing was waving its right paw round, \'lives a March Hare. \'I.', 4, 5, 15, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(17, 'Alice by the Hatter, with an important air, \'are you all ready? This is the driest thing I ever was at the March Hare. \'Exactly so,\' said Alice. \'I\'ve tried the effect of lying down on one of the.', 3, 5, 20, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(18, 'But there seemed to be a queer thing, to be no sort of use in the middle of her sharp little chin. \'I\'ve a right to think,\' said Alice sadly. \'Hand it over here,\' said the Caterpillar. Alice said.', 4, 1, 20, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(19, 'There was a table in the distance, and she said to the whiting,\' said the Cat, \'if you don\'t know much,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the.', 3, 4, 16, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(20, 'When they take us up and bawled out, \"He\'s murdering the time! Off with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows When the pie was all.', 5, 6, 20, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(21, 'March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t put my arm round your waist,\' the Duchess was VERY ugly; and secondly, because they\'re making such VERY short remarks, and she.', 5, 3, 5, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(22, 'The Duchess took no notice of her skirt, upsetting all the rest, Between yourself and me.\' \'That\'s the first position in dancing.\' Alice said; but was dreadfully puzzled by the fire, licking her.', 3, 3, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(23, 'Alice, rather alarmed at the other birds tittered audibly. \'What I was sent for.\' \'You ought to be trampled under its feet, ran round the court and got behind him, and very soon finished it off. * *.', 4, 4, 27, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(24, 'Gryphon in an encouraging tone. Alice looked all round the court was a good thing!\' she said this, she noticed a curious plan!\' exclaimed Alice. \'And ever since that,\' the Hatter went on, \'--likely.', 4, 3, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(25, 'Alice was rather doubtful whether she could do to hold it. As soon as it didn\'t sound at all this time, and was looking for it, she found she could not join the dance?\"\' \'Thank you, sir, for your.', 3, 3, 12, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(26, 'The Mouse looked at it, busily painting them red. Alice thought to herself. \'Shy, they seem to have it explained,\' said the Duchess: you\'d better finish the story for yourself.\' \'No, please go on!\'.', 3, 6, 15, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(27, 'White Rabbit returning, splendidly dressed, with a trumpet in one hand and a fall, and a fan! Quick, now!\' And Alice was just possible it had a bone in his sleep, \'that \"I breathe when I got up and.', 2, 3, 29, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(28, 'Queen! The Queen!\' and the two creatures, who had been found and handed them round as prizes. There was nothing on it except a tiny little thing!\' said the Gryphon. \'I\'ve forgotten the words.\' So.', 4, 5, 18, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(29, 'Alice\'s first thought was that you weren\'t to talk to.\' \'How are you getting on?\' said the Hatter, it woke up again with a yelp of delight, which changed into alarm in another moment down went Alice.', 1, 1, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(30, 'I could let you out, you know.\' \'Not the same tone, exactly as if it makes rather a complaining tone, \'and they all crowded round her, calling out in a loud, indignant voice, but she knew she had.', 5, 5, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04');

-- --------------------------------------------------------

--
-- بنية الجدول `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 'Voluptas nesciunt explicabo et cum eveniet debitis accusamus.', 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(2, 'Architecto voluptates ipsum consequatur saepe delectus assumenda repudiandae.', 6, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(3, 'Veniam enim rerum nisi non unde.', 7, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(4, 'Possimus exercitationem beatae ut quia.', 8, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(5, 'Rerum molestias omnis non nemo totam officia.', 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(6, 'Beatae et consectetur eum dolores soluta ea.', 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(7, 'Sed aut quisquam in qui consequuntur sunt.', 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(8, 'Voluptas quis voluptas labore quo enim.', 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(9, 'Aliquid dolores doloremque voluptas rerum ut.', 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(10, 'Fugiat et quidem impedit quo tempore blanditiis ut qui.', 10, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(11, 'Ea omnis ut consequatur iure.', 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(12, 'Earum optio quos aut aliquid nihil magnam cupiditate.', 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(13, 'Est nihil sint quidem qui.', 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(14, 'Non est enim cum molestias aut voluptatibus ratione.', 4, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(15, 'Eveniet reprehenderit aut aut rerum.', 3, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(16, 'Molestiae quod voluptatem dolorum et quam voluptas quibusdam.', 2, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(17, 'Est minus molestiae sunt earum ducimus eos similique.', 5, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(18, 'Exercitationem commodi autem quia ratione.', 4, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(19, 'Sapiente praesentium fuga labore et ullam aliquid placeat.', 4, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(20, 'Iure quaerat alias et deserunt.', 4, '2021-07-04 11:40:04', '2021-07-04 11:40:04');

-- --------------------------------------------------------

--
-- بنية الجدول `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_29_213820_create_cuisines_table', 1),
(10, '2019_08_29_213821_create_restaurants_table', 1),
(11, '2019_08_29_213825_create_categories_table', 1),
(12, '2019_08_29_213826_create_extra_groups_table', 1),
(13, '2019_08_29_213829_create_faq_categories_table', 1),
(14, '2019_08_29_213833_create_order_statuses_table', 1),
(15, '2019_08_29_213837_create_foods_table', 1),
(16, '2019_08_29_213842_create_galleries_table', 1),
(17, '2019_08_29_213847_create_food_reviews_table', 1),
(18, '2019_08_29_213903_create_nutrition_table', 1),
(19, '2019_08_29_213907_create_extras_table', 1),
(20, '2019_08_29_213921_create_payments_table', 1),
(21, '2019_08_29_213926_create_faqs_table', 1),
(22, '2019_08_29_213940_create_restaurant_reviews_table', 1),
(23, '2019_08_30_152927_create_favorites_table', 1),
(24, '2019_08_31_111103_create_delivery_addresses_table', 1),
(25, '2019_08_31_111104_create_orders_table', 1),
(26, '2019_09_04_153857_create_carts_table', 1),
(27, '2019_09_04_153858_create_favorite_extras_table', 1),
(28, '2019_09_04_153859_create_cart_extras_table', 1),
(29, '2019_09_04_153958_create_food_orders_table', 1),
(30, '2019_09_04_154957_create_food_order_extras_table', 1),
(31, '2019_09_04_163857_create_user_restaurants_table', 1),
(32, '2019_10_22_144652_create_currencies_table', 1),
(33, '2019_12_14_134302_create_driver_restaurants_table', 1),
(34, '2020_03_25_094752_create_drivers_table', 1),
(35, '2020_03_25_094802_create_earnings_table', 1),
(36, '2020_03_25_094809_create_drivers_payouts_table', 1),
(37, '2020_03_25_094817_create_restaurants_payouts_table', 1),
(38, '2020_03_27_094855_create_notifications_table', 1),
(39, '2020_04_11_135804_create_restaurant_cuisines_table', 1),
(40, '2020_08_23_181022_create_coupons_table', 1),
(41, '2020_08_23_181029_create_discountables_table', 1),
(42, '2020_09_01_192732_create_slides_table', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `nutrition`
--

CREATE TABLE `nutrition` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 0,
  `food_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `nutrition`
--

INSERT INTO `nutrition` (`id`, `name`, `quantity`, `food_id`, `created_at`, `updated_at`) VALUES
(1, 'Lipid', 117, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(2, 'Lipid', 188, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(3, 'Proteins', 88, 19, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(4, 'Lipid', 155, 15, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(5, 'Sugar', 193, 29, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(6, 'Sugar', 90, 11, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(7, 'Sugar', 136, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(8, 'Calcium', 150, 14, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(9, 'Sugar', 158, 12, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(10, 'Calcium', 74, 5, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(11, 'Sugar', 94, 10, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(12, 'Proteins', 175, 28, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(13, 'Sugar', 106, 8, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(14, 'Calcium', 187, 5, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(15, 'Lipid', 81, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(16, 'Lipid', 181, 25, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(17, 'Sugar', 195, 28, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(18, 'Proteins', 176, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(19, 'Sugar', 101, 15, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(20, 'Lipid', 150, 24, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(21, 'Lipid', 89, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(22, 'Calcium', 1, 30, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(23, 'Calcium', 29, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(24, 'Sugar', 139, 22, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(25, 'Calcium', 165, 28, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(26, 'Calcium', 16, 12, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(27, 'Lipid', 44, 4, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(28, 'Lipid', 14, 4, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(29, 'Calcium', 136, 25, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(30, 'Calcium', 111, 23, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(31, 'Proteins', 153, 18, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(32, 'Lipid', 167, 20, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(33, 'Lipid', 150, 27, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(34, 'Sugar', 89, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(35, 'Sugar', 90, 22, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(36, 'Lipid', 108, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(37, 'Sugar', 133, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(38, 'Calcium', 200, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(39, 'Proteins', 137, 19, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(40, 'Calcium', 105, 10, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(41, 'Proteins', 180, 23, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(42, 'Sugar', 119, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(43, 'Lipid', 54, 27, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(44, 'Lipid', 166, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(45, 'Sugar', 5, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(46, 'Sugar', 91, 17, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(47, 'Sugar', 44, 18, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(48, 'Calcium', 58, 12, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(49, 'Sugar', 183, 21, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(50, 'Sugar', 177, 15, '2021-07-04 11:40:04', '2021-07-04 11:40:04');

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `tax` double(5,2) DEFAULT 0.00,
  `delivery_fee` double(5,2) DEFAULT 0.00,
  `hint` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `driver_id` int(10) UNSIGNED DEFAULT NULL,
  `delivery_address_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Order Received', '2019-08-30 13:39:28', '2019-10-15 15:03:14'),
(2, 'Preparing', '2019-10-15 15:03:50', '2019-10-15 15:03:50'),
(3, 'Ready', '2019-10-15 15:04:30', '2019-10-15 15:04:30'),
(4, 'On the Way', '2019-10-15 15:04:13', '2019-10-15 15:04:13'),
(5, 'Delivered', '2019-10-15 15:04:30', '2019-10-15 15:04:30');

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'users.profile', 'web', '2020-03-29 11:58:02', '2020-03-29 11:58:02', NULL),
(2, 'dashboard', 'web', '2020-03-29 11:58:02', '2020-03-29 11:58:02', NULL),
(3, 'medias.create', 'web', '2020-03-29 11:58:02', '2020-03-29 11:58:02', NULL),
(4, 'medias.delete', 'web', '2020-03-29 11:58:02', '2020-03-29 11:58:02', NULL),
(5, 'medias', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(6, 'permissions.index', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(7, 'permissions.edit', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(8, 'permissions.update', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(9, 'permissions.destroy', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(10, 'roles.index', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(11, 'roles.edit', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(12, 'roles.update', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(13, 'roles.destroy', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(14, 'customFields.index', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(15, 'customFields.create', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(16, 'customFields.store', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(17, 'customFields.show', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(18, 'customFields.edit', 'web', '2020-03-29 11:58:03', '2020-03-29 11:58:03', NULL),
(19, 'customFields.update', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(20, 'customFields.destroy', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(21, 'users.login-as-user', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(22, 'users.index', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(23, 'users.create', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(24, 'users.store', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(25, 'users.show', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(26, 'users.edit', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(27, 'users.update', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(28, 'users.destroy', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(29, 'app-settings', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(30, 'restaurants.index', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(31, 'restaurants.create', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(32, 'restaurants.store', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(33, 'restaurants.edit', 'web', '2020-03-29 11:58:04', '2020-03-29 11:58:04', NULL),
(34, 'restaurants.update', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(35, 'restaurants.destroy', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(36, 'categories.index', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(37, 'categories.create', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(38, 'categories.store', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(39, 'categories.edit', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(40, 'categories.update', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(41, 'categories.destroy', 'web', '2020-03-29 11:58:05', '2020-03-29 11:58:05', NULL),
(42, 'faqCategories.index', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(43, 'faqCategories.create', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(44, 'faqCategories.store', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(45, 'faqCategories.edit', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(46, 'faqCategories.update', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(47, 'faqCategories.destroy', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(48, 'orderStatuses.index', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(49, 'orderStatuses.show', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(50, 'orderStatuses.edit', 'web', '2020-03-29 11:58:06', '2020-03-29 11:58:06', NULL),
(51, 'orderStatuses.update', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(52, 'foods.index', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(53, 'foods.create', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(54, 'foods.store', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(55, 'foods.edit', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(56, 'foods.update', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(57, 'foods.destroy', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(58, 'galleries.index', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(59, 'galleries.create', 'web', '2020-03-29 11:58:07', '2020-03-29 11:58:07', NULL),
(60, 'galleries.store', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(61, 'galleries.edit', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(62, 'galleries.update', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(63, 'galleries.destroy', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(64, 'foodReviews.index', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(65, 'foodReviews.create', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(66, 'foodReviews.store', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(67, 'foodReviews.edit', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(68, 'foodReviews.update', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(69, 'foodReviews.destroy', 'web', '2020-03-29 11:58:08', '2020-03-29 11:58:08', NULL),
(76, 'extras.index', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(77, 'extras.create', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(78, 'extras.store', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(79, 'extras.show', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(80, 'extras.edit', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(81, 'extras.update', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(82, 'extras.destroy', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(83, 'payments.index', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(84, 'payments.show', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(85, 'payments.update', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(86, 'faqs.index', 'web', '2020-03-29 11:58:10', '2020-03-29 11:58:10', NULL),
(87, 'faqs.create', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(88, 'faqs.store', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(89, 'faqs.edit', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(90, 'faqs.update', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(91, 'faqs.destroy', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(92, 'restaurantReviews.index', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(93, 'restaurantReviews.create', 'web', '2020-03-29 11:58:11', '2020-03-29 11:58:11', NULL),
(94, 'restaurantReviews.store', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(95, 'restaurantReviews.edit', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(96, 'restaurantReviews.update', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(97, 'restaurantReviews.destroy', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(98, 'favorites.index', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(99, 'favorites.create', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(100, 'favorites.store', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(101, 'favorites.edit', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(102, 'favorites.update', 'web', '2020-03-29 11:58:12', '2020-03-29 11:58:12', NULL),
(103, 'favorites.destroy', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(104, 'orders.index', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(105, 'orders.create', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(106, 'orders.store', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(107, 'orders.show', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(108, 'orders.edit', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(109, 'orders.update', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(110, 'orders.destroy', 'web', '2020-03-29 11:58:13', '2020-03-29 11:58:13', NULL),
(111, 'notifications.index', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(112, 'notifications.show', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(113, 'notifications.destroy', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(114, 'carts.index', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(115, 'carts.edit', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(116, 'carts.update', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(117, 'carts.destroy', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(118, 'currencies.index', 'web', '2020-03-29 11:58:14', '2020-03-29 11:58:14', NULL),
(119, 'currencies.create', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(120, 'currencies.store', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(121, 'currencies.edit', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(122, 'currencies.update', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(123, 'currencies.destroy', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(124, 'deliveryAddresses.index', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(125, 'deliveryAddresses.create', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(126, 'deliveryAddresses.store', 'web', '2020-03-29 11:58:15', '2020-03-29 11:58:15', NULL),
(127, 'deliveryAddresses.edit', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(128, 'deliveryAddresses.update', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(129, 'deliveryAddresses.destroy', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(130, 'drivers.index', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(131, 'drivers.create', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(132, 'drivers.store', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(133, 'drivers.show', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(134, 'drivers.edit', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(135, 'drivers.update', 'web', '2020-03-29 11:58:16', '2020-03-29 11:58:16', NULL),
(136, 'drivers.destroy', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(137, 'earnings.index', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(138, 'earnings.create', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(139, 'earnings.store', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(140, 'earnings.show', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(141, 'earnings.edit', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(142, 'earnings.update', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(143, 'earnings.destroy', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(144, 'driversPayouts.index', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(145, 'driversPayouts.create', 'web', '2020-03-29 11:58:17', '2020-03-29 11:58:17', NULL),
(146, 'driversPayouts.store', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(147, 'driversPayouts.show', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(148, 'driversPayouts.edit', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(149, 'driversPayouts.update', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(150, 'driversPayouts.destroy', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(151, 'restaurantsPayouts.index', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(152, 'restaurantsPayouts.create', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(153, 'restaurantsPayouts.store', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(154, 'restaurantsPayouts.show', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(155, 'restaurantsPayouts.edit', 'web', '2020-03-29 11:58:18', '2020-03-29 11:58:18', NULL),
(156, 'restaurantsPayouts.update', 'web', '2020-03-29 11:58:19', '2020-03-29 11:58:19', NULL),
(157, 'restaurantsPayouts.destroy', 'web', '2020-03-29 11:58:19', '2020-03-29 11:58:19', NULL),
(158, 'permissions.create', 'web', '2020-03-29 11:59:15', '2020-03-29 11:59:15', NULL),
(159, 'permissions.store', 'web', '2020-03-29 11:59:15', '2020-03-29 11:59:15', NULL),
(160, 'permissions.show', 'web', '2020-03-29 11:59:15', '2020-03-29 11:59:15', NULL),
(161, 'roles.create', 'web', '2020-03-29 11:59:15', '2020-03-29 11:59:15', NULL),
(162, 'roles.store', 'web', '2020-03-29 11:59:15', '2020-03-29 11:59:15', NULL),
(163, 'roles.show', 'web', '2020-03-29 11:59:16', '2020-03-29 11:59:16', NULL),
(164, 'cuisines.index', 'web', '2020-04-11 12:04:39', '2020-04-11 12:04:39', NULL),
(165, 'cuisines.create', 'web', '2020-04-11 12:04:39', '2020-04-11 12:04:39', NULL),
(166, 'cuisines.store', 'web', '2020-04-11 12:04:39', '2020-04-11 12:04:39', NULL),
(167, 'cuisines.edit', 'web', '2020-04-11 12:04:39', '2020-04-11 12:04:39', NULL),
(168, 'cuisines.update', 'web', '2020-04-11 12:04:39', '2020-04-11 12:04:39', NULL),
(169, 'cuisines.destroy', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(170, 'extraGroups.index', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(171, 'extraGroups.create', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(172, 'extraGroups.store', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(173, 'extraGroups.edit', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(174, 'extraGroups.update', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(175, 'extraGroups.destroy', 'web', '2020-04-11 12:04:40', '2020-04-11 12:04:40', NULL),
(176, 'nutrition.index', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(177, 'nutrition.create', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(178, 'nutrition.store', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(179, 'nutrition.edit', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(180, 'nutrition.update', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(181, 'nutrition.destroy', 'web', '2020-03-29 11:58:09', '2020-03-29 11:58:09', NULL),
(182, 'requestedRestaurants.index', 'web', '2020-08-13 11:58:02', '2020-08-13 11:58:02', NULL),
(183, 'coupons.index', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(184, 'coupons.create', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(185, 'coupons.store', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(186, 'coupons.edit', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(187, 'coupons.update', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(188, 'coupons.destroy', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(189, 'slides.index', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(190, 'slides.create', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(191, 'slides.store', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(192, 'slides.edit', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(193, 'slides.update', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL),
(194, 'slides.destroy', 'web', '2020-08-23 11:58:02', '2020-08-23 11:58:02', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_commission` double(8,2) DEFAULT 0.00,
  `delivery_fee` double(8,2) DEFAULT 0.00,
  `delivery_range` double(8,2) DEFAULT 0.00,
  `default_tax` double(8,2) DEFAULT 0.00,
  `closed` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 0,
  `available_for_delivery` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `description`, `address`, `latitude`, `longitude`, `phone`, `mobile`, `information`, `admin_commission`, `delivery_fee`, `delivery_range`, `default_tax`, `closed`, `active`, `available_for_delivery`, `created_at`, `updated_at`) VALUES
(1, 'Pizza Baumbach, Jacobi and McDermott', 'Reiciendis nesciunt ab facilis non porro cum. Voluptas sapiente quos voluptates incidunt ab culpa esse. Iure voluptas sint quia quibusdam omnis sapiente. Quia magnam cupiditate asperiores omnis.', '408 Mossie Light\nNew Arnulfo, CA 26290-1779', '46.004863', '8.004338', '469.517.4035', '(819) 718-5353', 'Maiores magnam eveniet recusandae consequatur dignissimos distinctio. A officiis eos ut reprehenderit. Odit vero consequatur fugit labore amet sit asperiores.', 19.23, 4.63, 53.64, 8.99, 0, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(2, 'Meal Casper LLC', 'Quos ut non natus omnis qui sunt qui. Dicta animi alias cumque quos laborum expedita aut. In voluptates incidunt adipisci consequatur. Ducimus esse dolor voluptas omnis vitae.', '13002 Walter Green Suite 677\nEladiobury, NV 66909-6496', '50.993177', '10.874507', '701.324.5508 x309', '+13537362210', 'Neque voluptatibus sed aut explicabo odio. Sit molestiae voluptates aspernatur molestiae. Sunt quaerat perferendis nobis quia qui mollitia.', 28.34, 2.74, 16.44, 23.82, 0, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(3, 'Pizza Powlowski-Tillman', 'Quo culpa quibusdam ratione blanditiis nulla alias impedit neque. Expedita dolore amet doloremque dolore eum occaecati maiores. Ipsum omnis sunt sed fugiat laboriosam voluptas repellat.', '1813 Kohler Rest\nSouth Abrahamfort, IL 03621', '48.915593', '8.094678', '+1-846-543-3089', '846.541.0050', 'Minima provident quis facere inventore ea explicabo consequatur et. Deleniti iste suscipit perferendis doloribus quis. Ea et repellendus et aliquam.', 15.08, 9.07, 12.46, 6.77, 0, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(4, 'Meal Ebert, Kohler and Weimann', 'Perspiciatis ad dignissimos et consequatur blanditiis eum officiis quis. Delectus eum dolorem quia assumenda voluptatem. Sint omnis mollitia ut minima.', '744 Heloise Tunnel Apt. 999\nSouth Destiny, AZ 83499', '41.738217', '10.048532', '+17016809896', '746-671-3493', 'Quibusdam molestias atque aut praesentium. Placeat commodi dolorum ut dolor vel sed ex. Sint atque illum velit qui aut ea perspiciatis.', 30.60, 4.31, 65.04, 9.10, 1, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(5, 'Meal Simonis, Nitzsche and Heathcote', 'Totam cum temporibus velit totam impedit maiores sapiente. Quisquam quis dolore non saepe officiis tempore ad. Deserunt ut eum dolore sed assumenda sunt.', '328 Jazlyn Dam Apt. 753\nSouth Brooklyn, NY 49989', '41.815682', '7.887061', '1-990-313-7606', '223-835-6428 x68306', 'Molestiae officia facilis excepturi. Est nobis similique est nihil sit et non. Exercitationem nihil quo non eaque ipsa modi harum.', 46.03, 3.12, 70.04, 24.69, 0, 1, 0, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(6, 'Meal Marquardt, Quitzon and Eichmann', 'Nobis praesentium nihil quia deleniti eos nulla quidem. Beatae dolores rerum repellat soluta rerum. Et corrupti sed nulla architecto quae rerum.', '55300 Freda Lodge Suite 273\nLaurettaport, NY 07486-1092', '45.662864', '8.759692', '559.414.5092 x466', '+1-237-800-4776', 'Dolorem non vitae et omnis optio adipisci sint. Vero accusamus dolore animi repellendus dolore magnam quasi odio. Est dignissimos vel est cupiditate unde.', 33.71, 8.04, 66.58, 23.66, 0, 1, 0, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(7, 'Pizza Fadel PLC', 'Nulla delectus repellat sed asperiores. Sed aspernatur quia et dolor. Cum impedit et architecto beatae.', '802 Kory Center\nWest Bryana, OH 97321', '47.402969', '7.62276', '1-347-292-3204 x93995', '1-457-205-4952 x7579', 'Consectetur consequuntur natus tempora dolores vitae. Voluptates fuga ducimus consectetur quibusdam quisquam in error. Excepturi aliquam sed minus.', 20.56, 1.08, 64.63, 10.55, 0, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(8, 'Burger Watsica-Cassin', 'Est cumque et blanditiis tenetur dolor. Repellendus consequatur ut laudantium quis sed ad et. Iste corrupti sit qui cumque sequi minus quo. Eius voluptatibus dolores aut maxime et maiores.', '74090 Kelsi Ville\nWest Aronberg, IA 67744-1216', '44.176273', '10.014347', '1-601-359-4798', '1-594-739-5046 x383', 'Sed et qui et impedit eaque. Voluptatem facere quia sapiente incidunt sequi quia laboriosam. Fugit impedit voluptatem dignissimos sint enim illo reiciendis quaerat.', 22.65, 2.92, 37.75, 26.22, 1, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(9, 'Burger Bosco, Kassulke and Keebler', 'Quia vel pariatur quod voluptatem ducimus laudantium ut. Hic sed facilis eaque ducimus. Expedita voluptatem sit eos ut nihil.', '966 Adele Road\nMurazikbury, MT 67714', '50.205481', '10.106043', '(251) 963-6364 x539', '1-532-642-6586', 'Eligendi dignissimos eum atque incidunt. Placeat occaecati natus culpa cumque. Quisquam error neque ut enim assumenda.', 26.62, 6.27, 78.25, 22.76, 1, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03'),
(10, 'Pizza Stamm, Doyle and Sawayn', 'Velit debitis debitis atque corrupti. Molestiae molestias qui atque laborum sed. Ut magni corporis vero ullam iusto. Est consequatur modi harum sed quia at velit.', '92033 Heaney Manors Suite 903\nSouth Bennieberg, CO 91867-8415', '52.458767', '10.401206', '373.366.5282 x705', '871-925-0730 x760', 'Maxime sint est dolorem nihil iure quo. Id perferendis praesentium omnis perferendis expedita consequuntur illum. Sunt deleniti veniam eos cumque eveniet eligendi reprehenderit.', 44.24, 4.79, 28.05, 12.69, 0, 1, 1, '2021-07-04 11:40:03', '2021-07-04 11:40:03');

-- --------------------------------------------------------

--
-- بنية الجدول `restaurants_payouts`
--

CREATE TABLE `restaurants_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(9,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `restaurant_cuisines`
--

CREATE TABLE `restaurant_cuisines` (
  `cuisine_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `restaurant_cuisines`
--

INSERT INTO `restaurant_cuisines` (`cuisine_id`, `restaurant_id`) VALUES
(1, 7),
(1, 9),
(2, 1),
(2, 2),
(2, 7),
(3, 2),
(3, 6),
(4, 1),
(4, 3),
(5, 8),
(5, 10),
(6, 5);

-- --------------------------------------------------------

--
-- بنية الجدول `restaurant_reviews`
--

CREATE TABLE `restaurant_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `restaurant_reviews`
--

INSERT INTO `restaurant_reviews` (`id`, `review`, `rate`, `user_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 'Cat, \'if you don\'t know one,\' said Alice. \'Well, then,\' the Cat went on, yawning and rubbing its eyes, \'Of course, of course; just what I get\" is the capital of Paris, and Paris is the capital of.', 1, 2, 7, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(2, 'And yet I wish you would seem to be\"--or if you\'d like it very much,\' said Alice, in a VERY good opportunity for making her escape; so she sat down again in a fight with another hedgehog, which.', 3, 1, 10, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(3, 'Cat; and this Alice would not give all else for two reasons. First, because I\'m on the top of it. She went in without knocking, and hurried off at once, she found it made Alice quite hungry to look.', 2, 4, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(4, 'Seven said nothing, but looked at her, and the happy summer days. THE.', 3, 2, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(5, 'I\'ll set Dinah at you!\' There was a good deal until she had a vague sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, Alice had begun to repeat it, but her voice.', 1, 5, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(6, 'King said, for about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle\'s Story \'You can\'t think how glad I am so VERY tired of being such a simple question,\' added the Dormouse.', 4, 2, 3, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(7, 'I\'m I, and--oh dear, how puzzling it all came different!\' Alice replied in an encouraging tone. Alice looked round, eager to see you again, you dear old thing!\' said the King: \'leave out that part.\'.', 3, 4, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(8, 'Hatter. He had been to her, so she took up the little door was shut again, and that\'s all the rest of my own. I\'m a hatter.\' Here the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice.', 3, 5, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(9, 'The Caterpillar was the King; and as the March Hare. \'Sixteenth,\' added the Gryphon; and then treading on my tail. See how eagerly the lobsters to the King, \'unless it was the fan and two or three.', 2, 1, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(10, 'I\'ll go round and get in at the March Hare. \'It was much pleasanter at home,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I.', 4, 3, 4, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(11, 'Alice didn\'t think that will be the right height to be.\' \'It is a long and a fan! Quick, now!\' And Alice was only too glad to get in at the mushroom (she had grown to her in an offended tone, \'was.', 4, 5, 2, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(12, 'Queen had only one who got any advantage from the shock of being upset, and their curls got entangled together. Alice was very likely true.) Down, down, down. There was no label this time she had.', 5, 1, 6, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(13, 'Alice laughed so much into the air, and came back again. \'Keep your temper,\' said the Mock Turtle would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the.', 4, 1, 5, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(14, 'Gryphon. \'How the creatures order one about, and make out exactly what they said. The executioner\'s argument was, that she began looking at it uneasily, shaking it every now and then; such as.', 4, 6, 8, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(15, 'I grow at a reasonable pace,\' said the Hatter. He had been running half an hour or so there were no arches left, and all the jurymen on to her lips. \'I know what you were me?\' \'Well, perhaps you.', 2, 3, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(16, 'Mock Turtle. \'Certainly not!\' said Alice in a low voice. \'Not at first, but, after watching it a bit, if you drink much from a Caterpillar The Caterpillar and Alice could speak again. The.', 2, 1, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(17, 'CHAPTER III. A Caucus-Race and a large fan in the sea, though you mayn\'t believe it--\' \'I never went to school in the middle of her sister, as well be at school at once.\' And in she went. Once more.', 3, 1, 9, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(18, 'Alice, \'we learned French and music.\' \'And washing?\' said the Mock Turtle is.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think I could, if I can guess that,\' she added in a very difficult.', 4, 1, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(19, 'Mock Turtle. Alice was not a moment that it was her dream:-- First, she dreamed of little animals and birds waiting outside. The poor little thing sobbed again (or grunted, it was certainly not.', 1, 6, 10, '2021-07-04 11:40:04', '2021-07-04 11:40:04'),
(20, 'March Hare. \'Exactly so,\' said the Hatter; \'so I can\'t show it you myself,\' the Mock Turtle: \'crumbs would all come wrong, and she crossed her hands up to the seaside once in her hands, and began.', 4, 5, 1, '2021-07-04 11:40:04', '2021-07-04 11:40:04');

-- --------------------------------------------------------

--
-- بنية الجدول `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'admin', 'web', 0, '2018-07-21 13:37:56', '2019-09-07 19:42:01', NULL),
(3, 'manager', 'web', 0, '2019-09-07 19:41:38', '2019-09-07 19:41:38', NULL),
(4, 'client', 'web', 1, '2019-09-07 19:41:54', '2019-09-07 19:41:54', NULL),
(5, 'driver', 'web', 0, '2019-12-15 15:50:21', '2019-12-15 15:50:21', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 2),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 2),
(5, 3),
(6, 2),
(9, 2),
(10, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(26, 2),
(27, 2),
(27, 3),
(27, 4),
(27, 5),
(28, 2),
(29, 2),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(31, 2),
(31, 3),
(31, 4),
(32, 2),
(32, 3),
(32, 4),
(33, 2),
(33, 3),
(34, 2),
(34, 3),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 5),
(50, 2),
(51, 2),
(52, 2),
(52, 3),
(52, 4),
(52, 5),
(53, 2),
(53, 3),
(54, 2),
(54, 3),
(55, 2),
(55, 3),
(56, 2),
(56, 3),
(57, 2),
(57, 3),
(58, 2),
(58, 3),
(59, 2),
(59, 3),
(60, 2),
(60, 3),
(61, 2),
(61, 3),
(62, 2),
(62, 3),
(63, 2),
(63, 3),
(64, 2),
(64, 3),
(64, 4),
(64, 5),
(67, 2),
(67, 3),
(67, 4),
(67, 5),
(68, 2),
(68, 3),
(68, 4),
(68, 5),
(69, 2),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(83, 4),
(83, 5),
(85, 2),
(86, 2),
(86, 3),
(86, 4),
(86, 5),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(92, 3),
(92, 4),
(92, 5),
(95, 2),
(95, 3),
(95, 4),
(95, 5),
(96, 2),
(96, 3),
(96, 4),
(96, 5),
(97, 2),
(98, 2),
(98, 3),
(98, 4),
(98, 5),
(103, 2),
(103, 3),
(103, 4),
(103, 5),
(104, 2),
(104, 3),
(104, 4),
(104, 5),
(107, 2),
(107, 3),
(107, 4),
(107, 5),
(108, 2),
(108, 3),
(109, 2),
(109, 3),
(110, 2),
(110, 3),
(111, 2),
(111, 3),
(111, 4),
(111, 5),
(112, 2),
(113, 2),
(113, 3),
(113, 4),
(113, 5),
(114, 2),
(114, 3),
(114, 4),
(114, 5),
(117, 2),
(117, 3),
(117, 4),
(117, 5),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(130, 3),
(130, 5),
(131, 2),
(134, 2),
(134, 3),
(135, 2),
(135, 3),
(137, 2),
(137, 3),
(138, 2),
(144, 2),
(144, 5),
(145, 2),
(145, 3),
(145, 5),
(146, 2),
(146, 3),
(146, 5),
(148, 2),
(149, 2),
(151, 2),
(151, 3),
(152, 2),
(152, 3),
(153, 2),
(153, 3),
(155, 2),
(156, 2),
(160, 2),
(164, 2),
(164, 3),
(164, 4),
(164, 5),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(170, 3),
(171, 2),
(171, 3),
(172, 2),
(172, 3),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(182, 2),
(182, 3),
(182, 4),
(183, 2),
(183, 3),
(183, 4),
(183, 5),
(184, 2),
(185, 2),
(186, 2),
(186, 3),
(187, 2),
(187, 3),
(188, 2),
(189, 2),
(190, 2),
(191, 2),
(192, 2),
(193, 2),
(194, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'start',
  `text_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indicator_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_fit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cover',
  `food_id` int(10) UNSIGNED DEFAULT NULL,
  `restaurant_id` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `slides`
--

INSERT INTO `slides` (`id`, `order`, `text`, `button`, `text_position`, `text_color`, `button_color`, `background_color`, `indicator_color`, `image_fit`, `food_id`, `restaurant_id`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 4, 'Aliquam aut sed.', 'Order Now', 'end', '#ea5c44', '#ea5c44', '#ccccdd', '#ea5c44', 'cover', NULL, 1, 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(2, 4, 'Ex cum et suscipit.', 'Get Discount', 'center', '#ea5c44', '#ea5c44', '#ccccdd', '#ea5c44', 'cover', 7, NULL, 1, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(3, 2, 'Rem doloremque aperiam deserunt.', 'Get Discount', 'end', '#ea5c44', '#ea5c44', '#ccccdd', '#ea5c44', 'cover', 7, NULL, 0, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(4, 0, 'Aperiam voluptatem laborum omnis rem.', 'Get Discount', 'end', '#ea5c44', '#ea5c44', '#ccccdd', '#ea5c44', 'cover', NULL, 2, 0, '2021-07-04 11:40:05', '2021-07-04 11:40:05'),
(5, 4, 'Impedit molestiae sed quod.', 'Order Now', 'end', '#ea5c44', '#ea5c44', '#ccccdd', '#ea5c44', 'cover', NULL, 3, 0, '2021-07-04 11:40:05', '2021-07-04 11:40:05');

-- --------------------------------------------------------

--
-- بنية الجدول `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `braintree_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `braintree_id`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Michael E. Quinn', 'admin@demo.com', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T4PQhFvBcAA7k02f7ejq4I7z7QKKnvxQLV0oqGnuS6Ktz6FdWULrWrzZ3oYn', '2018-08-06 19:58:41', '2019-09-27 04:49:45'),
(2, 'Barbara J. Glanz', 'manager@demo.com', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5nysjzVKI4LU92bjRqMUSYdOaIo1EcPC3pIMb6Tcj2KXSUMriGrIQ1iwRdd0', '2018-08-14 14:06:28', '2019-09-25 19:09:35'),
(3, 'Charles W. Abeyta', 'client@demo.com', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V6PIUfd8JdHT2zkraTlnBcRSINZNjz5Ou7N0WtUGRyaTweoaXKpSfij6UhqC', '2019-10-12 19:31:26', '2020-03-29 14:44:30'),
(4, 'Robert E. Brock', 'client1@demo.com', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-15 14:55:39', '2020-03-29 14:59:39'),
(5, 'Sanchez Roberto', 'driver@demo.com', '$2y$10$T/jwzYDJfC8c9CdD5PbpuOKvEXlpv4.RR1jMT0PgIMT.fzeGw67JO', 'OuMsmU903WMcMhzAbuSFtxBekZVdXz66afifRo3YRCINi38jkXJ8rpN0FcfS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-15 15:49:44', '2020-03-29 14:22:10'),
(6, 'John Doe', 'driver1@demo.com', '$2y$10$YF0jCx2WCQtfZOq99hR8kuXsAE0KSnu5OYSomRtI9iCVguXDoDqVm', 'zh9mzfNO2iPtIxj6k4Jpj8flaDyOsxmlGRVUZRnJqOGBr8IuDyhb3cGoncvS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 14:28:04', '2020-03-29 14:28:04');

-- --------------------------------------------------------

--
-- بنية الجدول `user_restaurants`
--

CREATE TABLE `user_restaurants` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `user_restaurants`
--

INSERT INTO `user_restaurants` (`user_id`, `restaurant_id`) VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 6),
(2, 3),
(2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_food_id_foreign` (`food_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_extras`
--
ALTER TABLE `cart_extras`
  ADD PRIMARY KEY (`extra_id`,`cart_id`),
  ADD KEY `cart_extras_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_user_id_foreign` (`user_id`);

--
-- Indexes for table `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_payouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `driver_restaurants`
--
ALTER TABLE `driver_restaurants`
  ADD PRIMARY KEY (`user_id`,`restaurant_id`),
  ADD KEY `driver_restaurants_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_food_id_foreign` (`food_id`),
  ADD KEY `extras_extra_group_id_foreign` (`extra_group_id`);

--
-- Indexes for table `extra_groups`
--
ALTER TABLE `extra_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_food_id_foreign` (`food_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_extras`
--
ALTER TABLE `favorite_extras`
  ADD PRIMARY KEY (`extra_id`,`favorite_id`),
  ADD KEY `favorite_extras_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foods_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `foods_category_id_foreign` (`category_id`);

--
-- Indexes for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_orders_food_id_foreign` (`food_id`),
  ADD KEY `food_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `food_order_extras`
--
ALTER TABLE `food_order_extras`
  ADD PRIMARY KEY (`food_order_id`,`extra_id`),
  ADD KEY `food_order_extras_extra_id_foreign` (`extra_id`);

--
-- Indexes for table `food_reviews`
--
ALTER TABLE `food_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_reviews_user_id_foreign` (`user_id`),
  ADD KEY `food_reviews_food_id_foreign` (`food_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nutrition_food_id_foreign` (`food_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`),
  ADD KEY `orders_delivery_address_id_foreign` (`delivery_address_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants_payouts`
--
ALTER TABLE `restaurants_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurants_payouts_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_cuisines`
--
ALTER TABLE `restaurant_cuisines`
  ADD PRIMARY KEY (`cuisine_id`,`restaurant_id`),
  ADD KEY `restaurant_cuisines_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_reviews_user_id_foreign` (`user_id`),
  ADD KEY `restaurant_reviews_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_food_id_foreign` (`food_id`),
  ADD KEY `slides_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `user_restaurants`
--
ALTER TABLE `user_restaurants`
  ADD PRIMARY KEY (`user_id`,`restaurant_id`),
  ADD KEY `user_restaurants_restaurant_id_foreign` (`restaurant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `extra_groups`
--
ALTER TABLE `extra_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_reviews`
--
ALTER TABLE `food_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `restaurants_payouts`
--
ALTER TABLE `restaurants_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `cart_extras`
--
ALTER TABLE `cart_extras`
  ADD CONSTRAINT `cart_extras_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `delivery_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  ADD CONSTRAINT `drivers_payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `driver_restaurants`
--
ALTER TABLE `driver_restaurants`
  ADD CONSTRAINT `driver_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `extras`
--
ALTER TABLE `extras`
  ADD CONSTRAINT `extras_extra_group_id_foreign` FOREIGN KEY (`extra_group_id`) REFERENCES `extra_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `extras_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `favorite_extras`
--
ALTER TABLE `favorite_extras`
  ADD CONSTRAINT `favorite_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_extras_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foods_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `food_orders`
--
ALTER TABLE `food_orders`
  ADD CONSTRAINT `food_orders_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `food_order_extras`
--
ALTER TABLE `food_order_extras`
  ADD CONSTRAINT `food_order_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_order_extras_food_order_id_foreign` FOREIGN KEY (`food_order_id`) REFERENCES `food_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `food_reviews`
--
ALTER TABLE `food_reviews`
  ADD CONSTRAINT `food_reviews_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `restaurants_payouts`
--
ALTER TABLE `restaurants_payouts`
  ADD CONSTRAINT `restaurants_payouts_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `restaurant_cuisines`
--
ALTER TABLE `restaurant_cuisines`
  ADD CONSTRAINT `restaurant_cuisines_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_cuisines_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  ADD CONSTRAINT `restaurant_reviews_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `slides_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- القيود للجدول `user_restaurants`
--
ALTER TABLE `user_restaurants`
  ADD CONSTRAINT `user_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
