-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 16, 2024 at 09:48 AM
-- Server version: 8.0.30
-- PHP Version: 8.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(2, NULL, 1, 'Category 2', 'category-2', '2024-02-17 00:48:40', '2024-02-17 00:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `role_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(29, NULL, 'quanghai', 'quanghai@gmail.com', 'users/default.png', NULL, '$2y$10$QPBoHhQg7cv4Eh6BB6wg9eMUg80r0Ny.7daFkPtgVgLAvldWEXB.K', NULL, NULL, '2024-03-16 00:36:14', '2024-03-16 00:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'role_id', 'text', 'Role Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(58, 8, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 8, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 8, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 8, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 1, 1, 1, 1, '{}', 6),
(62, 8, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 0, '{}', 7),
(63, 8, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 8),
(64, 8, 'settings', 'text', 'Settings', 0, 0, 1, 1, 1, 1, '{}', 9),
(65, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(66, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(67, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 9, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(69, 9, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{}', 3),
(70, 9, 'desc', 'text', 'Desc', 0, 0, 1, 1, 1, 1, '{}', 4),
(71, 9, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5),
(72, 9, 'content', 'rich_text_box', 'Content', 0, 0, 1, 1, 1, 1, '{}', 6),
(73, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(74, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(8, 'customers', 'customers', 'Customer', 'Customers', 'voyager-person', 'App\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-02-17 02:31:23', '2024-02-17 02:31:23'),
(9, 'places', 'places', 'Place', 'Places', 'voyager-chat', 'App\\Place', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-03-15 19:30:00', '2024-03-15 19:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-02-17 00:48:39', '2024-02-17 00:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2024-02-17 00:48:39', '2024-02-17 00:48:39', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2024-02-17 00:48:39', '2024-02-17 00:48:39', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2024-02-17 00:48:40', '2024-02-17 00:48:40', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2024-02-17 00:48:40', '2024-02-17 00:48:40', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2024-02-17 00:48:40', '2024-02-17 00:48:40', 'voyager.pages.index', NULL),
(14, 1, 'Customers', '', '_self', 'voyager-person', NULL, NULL, 15, '2024-02-17 02:31:23', '2024-02-17 02:31:23', 'voyager.customers.index', NULL),
(15, 1, 'Places', '', '_self', 'voyager-chat', NULL, NULL, 16, '2024-03-15 19:30:01', '2024-03-15 19:30:01', 'voyager.places.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2024-02-17 00:48:40', '2024-02-17 00:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(2, 'browse_bread', NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(3, 'browse_database', NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(4, 'browse_media', NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(5, 'browse_compass', NULL, '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(6, 'browse_menus', 'menus', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(7, 'read_menus', 'menus', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(8, 'edit_menus', 'menus', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(9, 'add_menus', 'menus', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(10, 'delete_menus', 'menus', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(11, 'browse_roles', 'roles', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(12, 'read_roles', 'roles', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(13, 'edit_roles', 'roles', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(14, 'add_roles', 'roles', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(15, 'delete_roles', 'roles', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(16, 'browse_users', 'users', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(17, 'read_users', 'users', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(18, 'edit_users', 'users', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(19, 'add_users', 'users', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(20, 'delete_users', 'users', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(21, 'browse_settings', 'settings', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(22, 'read_settings', 'settings', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(23, 'edit_settings', 'settings', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(24, 'add_settings', 'settings', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(25, 'delete_settings', 'settings', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(26, 'browse_categories', 'categories', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(27, 'read_categories', 'categories', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(28, 'edit_categories', 'categories', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(29, 'add_categories', 'categories', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(30, 'delete_categories', 'categories', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(31, 'browse_posts', 'posts', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(32, 'read_posts', 'posts', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(33, 'edit_posts', 'posts', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(34, 'add_posts', 'posts', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(35, 'delete_posts', 'posts', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(36, 'browse_pages', 'pages', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(37, 'read_pages', 'pages', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(38, 'edit_pages', 'pages', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(39, 'add_pages', 'pages', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(40, 'delete_pages', 'pages', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(41, 'browse_customers', 'customers', '2024-02-17 02:31:23', '2024-02-17 02:31:23'),
(42, 'read_customers', 'customers', '2024-02-17 02:31:23', '2024-02-17 02:31:23'),
(43, 'edit_customers', 'customers', '2024-02-17 02:31:23', '2024-02-17 02:31:23'),
(44, 'add_customers', 'customers', '2024-02-17 02:31:23', '2024-02-17 02:31:23'),
(45, 'delete_customers', 'customers', '2024-02-17 02:31:23', '2024-02-17 02:31:23'),
(46, 'browse_places', 'places', '2024-03-15 19:30:00', '2024-03-15 19:30:00'),
(47, 'read_places', 'places', '2024-03-15 19:30:00', '2024-03-15 19:30:00'),
(48, 'edit_places', 'places', '2024-03-15 19:30:00', '2024-03-15 19:30:00'),
(49, 'add_places', 'places', '2024-03-15 19:30:00', '2024-03-15 19:30:00'),
(50, 'delete_places', 'places', '2024-03-15 19:30:00', '2024-03-15 19:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Customer', 6, 'backendAuth', '928ef3c84e1aa56ff7adc4f77e79a18b9c2f0a595c06eaf44d63e370609b13f5', '[\"*\"]', NULL, '2024-03-01 00:52:23', '2024-03-01 00:52:23'),
(2, 'App\\Customer', 6, 'backendAuth', 'b19ea8b2610df260e4b81aefd6bce764c4fa465e092ef817f659f7d02ade6bd4', '[\"*\"]', NULL, '2024-03-01 00:52:50', '2024-03-01 00:52:50'),
(3, 'App\\Customer', 6, 'backendAuth', '0ad2d4d51713c0b28204d2bca36d67f1aab61fcb0fe2cefddaa5f249f57b0895', '[\"*\"]', NULL, '2024-03-01 01:25:29', '2024-03-01 01:25:29'),
(4, 'App\\Customer', 6, 'backendAuth', 'cf459dd27c960f149a9ee8a0f047a87ca52353870ccc0fb0ed78a2be568f910f', '[\"*\"]', NULL, '2024-03-01 01:26:47', '2024-03-01 01:26:47'),
(5, 'App\\Customer', 6, 'backendAuth', 'c8a30b20ae1c39841f794412674c9e69fef100cd3fc652443f2d19667c2419bd', '[\"*\"]', NULL, '2024-03-12 20:59:52', '2024-03-12 20:59:52'),
(6, 'App\\Customer', 9, 'backendAuth', '90abd493ab71f1d871338919a7917799647a07a1032857b925e6083ca91a081e', '[\"*\"]', NULL, '2024-03-12 21:13:20', '2024-03-12 21:13:20'),
(7, 'App\\Customer', 6, 'YourAppToken', '8cf77e7fc0b6cb3f9441eb29ac8a5278ffffc021afefd37d0f34d78afebdfef4', '[\"*\"]', NULL, '2024-03-12 21:24:58', '2024-03-12 21:24:58'),
(8, 'App\\Customer', 6, 'backendAuth', 'a665b558e3c772cb109e07b52564f3894eb12a4b7e2ce0cace91f9f63d4e6e45', '[\"*\"]', NULL, '2024-03-12 21:25:43', '2024-03-12 21:25:43'),
(9, 'App\\Customer', 10, 'backendAuth', '61d0ad165313a1f591dc96568ad334684e294673ae0517c607d7f19c5c398a25', '[\"*\"]', NULL, '2024-03-13 01:46:24', '2024-03-13 01:46:24'),
(10, 'App\\Customer', 11, 'backendAuth', 'dca5b3eb53ae9417dedc8165f712ac623636dbe61a1890d56c4ba25b9a962710', '[\"*\"]', NULL, '2024-03-13 02:30:30', '2024-03-13 02:30:30'),
(11, 'App\\Customer', 12, 'backendAuth', 'ced24a572078063d41cc9dfbb3782920672ef3392769807e2a3b1bd29b55b6b7', '[\"*\"]', NULL, '2024-03-13 02:38:08', '2024-03-13 02:38:08'),
(12, 'App\\Customer', 12, 'backendAuth', 'd8c5ad1976595324a92b657565fa989821a0a5c9de2b1593a48f0b315ab77cb5', '[\"*\"]', NULL, '2024-03-13 02:40:20', '2024-03-13 02:40:20'),
(13, 'App\\Customer', 13, 'backendAuth', 'c4c993a4f08f83b522cd9f932caaf64b84868a2612c228b2d716de187ab75850', '[\"*\"]', NULL, '2024-03-13 02:51:04', '2024-03-13 02:51:04'),
(14, 'App\\Customer', 14, 'backendAuth', '85fea87f06c40ab7aa0547ab69b35ae515925193d5033be4cbcc491d96b1f5af', '[\"*\"]', NULL, '2024-03-13 02:52:49', '2024-03-13 02:52:49'),
(15, 'App\\Customer', 15, 'backendAuth', '93635b3322cc45a70727b3006ec3dd440c5543a4a9617be891dfa95506cacd75', '[\"*\"]', NULL, '2024-03-13 02:57:51', '2024-03-13 02:57:51'),
(16, 'App\\Customer', 16, 'backendAuth', 'cf7d9c73c3a9edbaf2b22f68fb0073f4b10b17f63e74ee3fb5297c595f50d2c8', '[\"*\"]', NULL, '2024-03-13 03:02:14', '2024-03-13 03:02:14'),
(17, 'App\\Customer', 17, 'backendAuth', 'd289890c7df0a018b1985d8ea0c71742e19b871427366cd82413103cc5da188a', '[\"*\"]', NULL, '2024-03-13 03:17:05', '2024-03-13 03:17:05'),
(18, 'App\\Customer', 18, 'backendAuth', '3b689c4f3d265e6f27963103143d73ef693ca4eaec08362fca53f2248cc5b171', '[\"*\"]', NULL, '2024-03-13 18:57:06', '2024-03-13 18:57:06'),
(19, 'App\\Customer', 19, 'backendAuth', 'b61b4d0fbbeb0e14763bef5ce640bb190d0e2657f3eb58d70caed07a51808e25', '[\"*\"]', NULL, '2024-03-13 19:03:38', '2024-03-13 19:03:38'),
(20, 'App\\Customer', 18, 'backendAuth', '12d6dd9b7ae4fb550746032412f927adeba4fb0ef53fbef5324745e889b73244', '[\"*\"]', NULL, '2024-03-13 19:11:10', '2024-03-13 19:11:10'),
(21, 'App\\Customer', 18, 'backendAuth', 'e823702835b45f5c3d95cc0211cd4327f48c98f46f4966cc0a0c53529075369a', '[\"*\"]', NULL, '2024-03-13 19:13:52', '2024-03-13 19:13:52'),
(22, 'App\\Customer', 18, 'backendAuth', '1c255d699caa9df04ad86401e9e2868fd195c4c5d0e9d46e90ac24172a5fdb37', '[\"*\"]', NULL, '2024-03-13 19:16:57', '2024-03-13 19:16:57'),
(23, 'App\\Customer', 18, 'backendAuth', '6c32a051681d8ee1251b38f62fe0d3fe15e16a5e0dd04d9fb96d84347dd5583d', '[\"*\"]', NULL, '2024-03-13 19:17:36', '2024-03-13 19:17:36'),
(24, 'App\\Customer', 18, 'backendAuth', '4957511cf53a3ea5c978610ff0c1ea58475d4c6918033da59c31859ad4c93cf0', '[\"*\"]', NULL, '2024-03-13 19:17:54', '2024-03-13 19:17:54'),
(25, 'App\\Customer', 20, 'backendAuth', 'c1f238428f656fa743028366d404dc7381b43c73349b9a9642518647593b15c5', '[\"*\"]', NULL, '2024-03-13 19:24:21', '2024-03-13 19:24:21'),
(26, 'App\\Customer', 20, 'backendAuth', '7bbe9f76d2338b61bf37743405246a714f5845f42757116378280600fe13078a', '[\"*\"]', NULL, '2024-03-13 19:26:19', '2024-03-13 19:26:19'),
(27, 'App\\Customer', 21, 'backendAuth', '541af999cdb5b8925214f9baa4c9ef8d751ca2d21d8ddafb5f63b6c143cb10fd', '[\"*\"]', NULL, '2024-03-13 19:38:36', '2024-03-13 19:38:36'),
(28, 'App\\Customer', 22, 'backendAuth', '5ee34b258d57481524db1000ba62245176ebe1263faefc1bcac93977e43259a3', '[\"*\"]', NULL, '2024-03-13 19:44:30', '2024-03-13 19:44:30'),
(29, 'App\\Customer', 23, 'backendAuth', 'f99f3ee47216c7ce4867e82b17ad871270a82bea9a8a309d817650aab8e8a4b2', '[\"*\"]', NULL, '2024-03-13 20:49:45', '2024-03-13 20:49:45'),
(30, 'App\\Customer', 24, 'backendAuth', '4b7f09ed5a6f18dffc9cf56927dde2e124a114cad50c1a8c9a52f390da54f996', '[\"*\"]', NULL, '2024-03-13 20:52:12', '2024-03-13 20:52:12'),
(31, 'App\\Customer', 24, 'backendAuth', '6b3fc6096f0c67dd2c8ce09ccd360dddecc1ac12c1260b47041cdcdb60a2f6d2', '[\"*\"]', NULL, '2024-03-13 23:43:49', '2024-03-13 23:43:49'),
(32, 'App\\Customer', 24, 'backendAuth', '4a9f391c65c50801394fd01881754c47b3667e439cb93342be6f234eb5057b89', '[\"*\"]', NULL, '2024-03-13 23:44:11', '2024-03-13 23:44:11'),
(33, 'App\\Customer', 25, 'Quang Hai', '3c04cdd68eac0b23cb97277675b95abf3d91a6b8c3c88393411089e3a6f862b4', '[\"*\"]', NULL, '2024-03-14 03:00:07', '2024-03-14 03:00:07'),
(34, 'App\\Customer', 26, 'Quang Hai', '757a07d9ad017c3e8d7d44101e3d37c92515f298689bc85c7465fd0f76067f1b', '[\"*\"]', NULL, '2024-03-14 03:10:50', '2024-03-14 03:10:50'),
(35, 'App\\Customer', 27, 'Windows Device', '372afd67906698d727787bbaa41eebe0b56adafd3d4c3f986d84913755f560d9', '[\"*\"]', NULL, '2024-03-14 03:17:43', '2024-03-14 03:17:43'),
(36, 'App\\Customer', 28, 'Windows Device', '1bf1010e0f88d2e85e40c71726cbbc956bba6939940235954c1ba95b079d96b3', '[\"*\"]', NULL, '2024-03-14 03:19:06', '2024-03-14 03:19:06'),
(37, 'App\\Customer', 29, 'Windows Device', '743e9bf1ce0160da27ec13a2b2b8e323be65d0add0fa0b1af13b9250cab3d19e', '[\"*\"]', NULL, '2024-03-16 00:36:14', '2024-03-16 00:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `title`, `slug`, `desc`, `image`, `content`, `created_at`, `updated_at`) VALUES
(1, 'London', 'london', 'Luân Đôn là thủ đô kiêm thành phố lớn nhất của Anh', 'places\\March2024\\Kg6XupAxJSk8SvO6f5TH.jpg', '<p>Lu&acirc;n Đ&ocirc;n l&agrave; thủ đ&ocirc; ki&ecirc;m th&agrave;nh phố lớn nhất của Anh v&agrave; của cả Vương quốc Li&ecirc;n hiệp Anh v&agrave; Bắc Ireland. Lu&acirc;n Đ&ocirc;n được người La M&atilde; lập ra 2000 năm trước đ&acirc;y với t&ecirc;n gọi đầu ti&ecirc;n l&agrave; Londinium</p>', '2024-03-15 19:32:00', '2024-03-16 01:26:21'),
(2, 'Paris', 'paris', 'Paris là thủ đô và là thành phố đông dân nhất nước Pháp', 'places\\March2024\\Cby2m0uM9fEN4wKwGwBm.jpg', '<p>Paris l&agrave; thủ đ&ocirc; v&agrave; l&agrave; th&agrave;nh phố đ&ocirc;ng d&acirc;n nhất nước Ph&aacute;p, cũng l&agrave; một trong ba th&agrave;nh phố ph&aacute;t triển kinh tế nhanh nhất thế giới c&ugrave;ng Lu&acirc;n Đ&ocirc;n v&agrave; New York v&agrave; l&agrave; một trung t&acirc;m h&agrave;nh ch&iacute;nh của v&ugrave;ng &Icirc;le-de-France với d&acirc;n số ước t&iacute;nh l&agrave; 2.165.423 người t&iacute;nh đến năm 2019</p>', '2024-03-15 19:34:00', '2024-03-16 01:22:59'),
(4, 'London', 'london', 'london', 'places\\March2024\\lb7hCXQkYlcwOYMoHpgV.jpg', '<p>a</p>', '2024-03-16 02:13:30', '2024-03-16 02:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-02-17 00:48:40', '2024-02-17 00:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-02-17 00:48:39', '2024-02-17 00:48:39'),
(2, 'user', 'Normal User', '2024-02-17 00:48:39', '2024-02-17 00:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-02-17 00:48:40', '2024-02-17 00:48:40'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-02-17 00:48:40', '2024-02-17 00:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$pB13MLeBpHq/qaMD/Str5O3ypxF1vpyBK8xy2EXA1mIhJj.vfnb4G', 'l7DWmwYRC79fsO1Awcu6mNpnJdzuKpnX7RsWJCsCb7y3l7ieoDWpElYZZui3', NULL, '2024-02-17 00:48:40', '2024-02-17 00:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD KEY `customers_role_id_index` (`role_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
