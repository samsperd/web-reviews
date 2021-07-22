-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table finddbox.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.categories: ~8 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(2, NULL, 1, 'Fashion', 'fashion', '2020-05-02 11:57:48', '2020-05-19 12:39:52'),
	(3, NULL, 1, 'Delivery', 'delivery', '2020-05-19 12:57:12', '2020-05-19 12:57:12'),
	(6, NULL, 1, 'Cleaning', 'cleaning', '2020-07-06 08:00:02', '2020-07-06 08:00:02'),
	(7, NULL, 1, 'Financial Services', 'financial-services', '2020-07-25 10:28:33', '2020-07-25 10:28:33'),
	(8, NULL, 1, 'Fitness', 'fitness', '2020-09-17 07:31:39', '2020-09-17 07:31:39'),
	(9, NULL, 1, 'Technology', 'technology', '2020-10-31 15:35:23', '2020-10-31 15:35:23'),
	(10, NULL, 1, 'Lifestyle', 'lifestyle', '2020-10-31 18:28:03', '2020-10-31 18:28:03'),
	(11, NULL, 1, 'Courier', 'courier', '2020-11-16 17:33:15', '2020-11-16 17:33:15');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table finddbox.category_location
DROP TABLE IF EXISTS `category_location`;
CREATE TABLE IF NOT EXISTS `category_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.category_location: ~0 rows (approximately)
DELETE FROM `category_location`;
/*!40000 ALTER TABLE `category_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_location` ENABLE KEYS */;

-- Dumping structure for table finddbox.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.comments: ~0 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table finddbox.data_rows
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.data_rows: ~160 rows (approximately)
DELETE FROM `data_rows`;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '{}', 3),
	(31, 5, 'category_id', 'text', 'Category', 0, 0, 0, 0, 0, 0, '{}', 4),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 6),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '{}', 7),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 8),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 9),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 10),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 11),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 12),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 2),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 13),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '{}', 15),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 0, 1, 1, 1, 1, '{}', 16),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(56, 9, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(57, 9, 'parent_id', 'select_dropdown', 'Parent', 0, 1, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(58, 9, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(59, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
	(60, 9, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(61, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
	(62, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(63, 5, 'tag_id', 'text', 'Tag', 0, 0, 1, 0, 0, 1, '{}', 17),
	(79, 5, 'post_belongstomany_tag_relationship', 'relationship', 'tags', 0, 0, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Tag","table":"tags","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"post_tag","pivot":"1","taggable":"0"}', 18),
	(82, 5, 'instagram', 'text', 'Instagram', 0, 1, 1, 1, 1, 1, '{}', 19),
	(83, 5, 'twitter', 'text', 'Twitter', 0, 0, 1, 1, 1, 1, '{}', 20),
	(84, 5, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 21),
	(85, 5, 'wikipedia', 'text', 'Wikipedia', 0, 0, 1, 1, 1, 1, '{}', 22),
	(86, 5, 'facebook', 'text', 'Facebook', 0, 0, 1, 1, 1, 1, '{}', 23),
	(87, 5, 'tiktok', 'text', 'Tiktok', 0, 0, 1, 1, 1, 1, '{}', 24),
	(88, 5, 'snapchat', 'text', 'Snapchat', 0, 0, 1, 1, 1, 1, '{}', 27),
	(89, 5, 'youtube', 'text', 'Youtube', 0, 0, 1, 1, 1, 1, '{}', 29),
	(91, 5, 'post_belongstomany_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Category","table":"categories","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"post_category","pivot":"1","taggable":"0"}', 5),
	(92, 5, 'post_hasmany_comment_relationship', 'relationship', 'comments', 0, 0, 1, 0, 0, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Comment","table":"comments","type":"hasMany","column":"post_id","key":"id","label":"user_message","pivot_table":"categories","pivot":"0","taggable":"0"}', 30),
	(94, 5, 'comment_id', 'text', 'Comment Id', 0, 0, 0, 0, 0, 0, '{}', 26),
	(97, 5, 'rating_id', 'text', 'Rate', 0, 0, 1, 0, 0, 1, '{}', 33),
	(98, 1, 'user_hasone_rating_relationship', 'relationship', 'ratings', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Rating","table":"ratings","type":"hasOne","column":"user_id","key":"id","label":"rating","pivot_table":"categories","pivot":"0","taggable":"0"}', 13),
	(99, 5, 'company_full_name', 'text', 'Company Full Name', 0, 0, 1, 1, 1, 1, '{}', 28),
	(100, 5, 'company_number', 'text', 'Company Number', 0, 0, 1, 1, 1, 1, '{}', 31),
	(101, 5, 'company_email', 'text', 'Company Email', 0, 1, 1, 1, 1, 1, '{}', 32),
	(102, 5, 'owner_of_business', 'text', 'Owner Of Business', 0, 1, 1, 1, 1, 1, '{}', 34),
	(103, 5, 'company_address', 'text', 'Company Address', 0, 1, 1, 1, 1, 1, '{}', 35),
	(104, 5, 'delivery_locations', 'text', 'Delivery Locations', 0, 0, 1, 1, 1, 1, '{}', 36),
	(106, 5, 'country', 'text', 'Country', 0, 0, 1, 1, 1, 1, '{}', 38),
	(107, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
	(108, 1, 'google_id', 'text', 'Google Id', 0, 1, 1, 1, 1, 1, '{}', 12),
	(109, 1, 'rating_id', 'text', 'Rating Id', 0, 1, 1, 1, 1, 1, '{}', 13),
	(110, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(111, 15, 'user_id', 'text', 'User', 1, 0, 0, 0, 0, 1, '{}', 2),
	(112, 15, 'post_id', 'text', 'Post Id', 1, 0, 0, 0, 0, 1, '{}', 3),
	(113, 15, 'rating', 'text', 'Rating', 1, 0, 0, 0, 0, 1, '{}', 4),
	(114, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 5),
	(115, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(116, 15, 'rating_hasone_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\User","table":"users","type":"belongsTo","column":"id","key":"id","label":"id","pivot_table":"categories","pivot":"0","taggable":"0"}', 7),
	(118, 15, 'rating_hasone_post_relationship', 'relationship', 'posts', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Post","table":"posts","type":"belongsTo","column":"id","key":"id","label":"title","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
	(119, 15, 'review', 'text', 'Review', 0, 1, 1, 1, 1, 1, '{}', 7),
	(120, 5, 'post_hasmany_rating_relationship', 'relationship', 'ratings', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Rating","table":"ratings","type":"hasMany","column":"post_id","key":"id","label":"rating","pivot_table":"categories","pivot":"0","taggable":"0"}', 39),
	(121, 15, 'appearance', 'text', 'Appearance', 0, 1, 1, 1, 1, 1, '{}', 8),
	(122, 17, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(123, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
	(124, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
	(125, 17, 'continent', 'text', 'Continent', 1, 1, 1, 1, 1, 1, '{"default":"Africa"}', 4),
	(126, 17, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, '{}', 5),
	(129, 5, 'location_id', 'text', 'Location Id', 0, 0, 1, 1, 1, 1, '{}', 37),
	(130, 21, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(131, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
	(132, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
	(135, 21, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"location"}}', 6),
	(136, 21, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"location"}}', 7),
	(137, 1, 'location', 'text', 'Location', 0, 1, 1, 1, 1, 1, '{"default":"Nigeria"}', 14),
	(138, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(139, 22, 'business_name', 'text', 'Business Name', 1, 1, 1, 1, 1, 1, '{}', 3),
	(140, 22, 'business_owner', 'text', 'Business Owner', 1, 1, 1, 1, 1, 1, '{}', 4),
	(141, 22, 'business_email', 'text', 'Business Email', 1, 1, 1, 1, 1, 1, '{}', 5),
	(142, 22, 'business_category', 'text', 'Business Category', 1, 1, 1, 1, 1, 1, '{}', 2),
	(143, 22, 'business_phone', 'text', 'Business Phone', 1, 1, 1, 1, 1, 1, '{}', 6),
	(144, 22, 'operating_location', 'text', 'Operating Location', 1, 1, 1, 1, 1, 1, '{}', 7),
	(145, 22, 'country', 'text', 'Country', 1, 0, 1, 1, 1, 1, '{}', 8),
	(146, 22, 'company_address', 'text', 'Company Address', 1, 0, 1, 1, 1, 1, '{}', 9),
	(147, 22, 'account_names', 'text', 'Account Names', 1, 1, 1, 1, 1, 1, '{}', 10),
	(148, 22, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 11),
	(149, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
	(150, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
	(151, 22, 'status', 'text', 'Status', 1, 0, 0, 0, 0, 1, '{}', 14),
	(152, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(153, 23, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(154, 23, 'instagram', 'text', 'Instagram', 0, 1, 1, 1, 1, 1, '{}', 4),
	(155, 23, 'twitter', 'text', 'Twitter', 0, 1, 1, 1, 1, 1, '{}', 5),
	(156, 23, 'facebook', 'text', 'Facebook', 0, 1, 1, 1, 1, 1, '{}', 6),
	(157, 23, 'web_link', 'text', 'Web Link', 0, 1, 1, 1, 1, 1, '{}', 7),
	(158, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
	(159, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(160, 23, 'business_category', 'text', 'Business Category', 1, 1, 1, 1, 1, 1, '{}', 10),
	(161, 23, 'brief', 'text', 'Brief', 0, 1, 1, 1, 1, 1, '{}', 11),
	(162, 23, 'userslike_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 12),
	(163, 1, 'user_hasmany_userslike_relationship', 'relationship', 'userslike', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Userslike","table":"userslike","type":"hasMany","column":"user_id","key":"id","label":"instagram","pivot_table":"categories","pivot":"0","taggable":"0"}', 15),
	(164, 1, 'user_hasmany_recommended_relationship', 'relationship', 'recommended', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Recommended","table":"recommended","type":"hasMany","column":"user_id","key":"id","label":"business_name","pivot_table":"categories","pivot":"0","taggable":"0"}', 16),
	(165, 23, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, '{}', 3),
	(166, 21, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{"default":"pending","options":{"publish":"publish","pending":"pending"}}', 8),
	(167, 21, 'order', 'select_dropdown', 'Order', 0, 1, 1, 1, 1, 1, '{"default":"1","options":{"1":"1","2":"2","3":"3","4":"4"}}', 9),
	(168, 21, 'location', 'text', 'Location', 1, 1, 1, 1, 1, 1, '{}', 4),
	(169, 5, 'post_belongsto_location_relationship', 'relationship', 'locations', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Location","table":"locations","type":"belongsTo","column":"location_id","key":"id","label":"location","pivot_table":"categories","pivot":"0","taggable":"0"}', 40),
	(170, 21, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{"default":"country","options":{"continent":"continent","country":"country","state":"state","city":"city"}}', 9),
	(171, 21, 'location_belongstomany_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Category","table":"categories","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"category_location","pivot":"1","taggable":"0"}', 10),
	(172, 21, 'location_hasmany_post_relationship', 'relationship', 'posts', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Post","table":"posts","type":"hasMany","column":"location_id","key":"id","label":"id","pivot_table":"categories","pivot":"0","taggable":"0"}', 11),
	(173, 5, 'deals_with', 'text', 'Deals With', 0, 1, 1, 1, 1, 1, '{}', 36),
	(174, 24, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(175, 24, 'commentable_type', 'text', 'Commentable Type', 1, 1, 1, 1, 1, 1, '{}', 2),
	(176, 24, 'commentable_id', 'number', 'Commentable Id', 1, 1, 1, 1, 1, 1, '{}', 3),
	(177, 24, 'comment', 'text', 'Comment', 1, 1, 1, 1, 1, 1, '{}', 4),
	(178, 24, 'is_approved', 'text', 'Is Approved', 1, 1, 1, 1, 1, 1, '{}', 5),
	(179, 24, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 6),
	(180, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
	(181, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
	(182, 5, 'rate', 'number', 'Rate', 0, 0, 1, 1, 1, 1, '{}', 26),
	(183, 5, 'whatsapp', 'text', 'Whatsapp', 0, 0, 1, 1, 1, 1, '{}', 37),
	(184, 5, 'verified', 'checkbox', 'Verified', 1, 0, 1, 1, 1, 1, '{}', 38),
	(185, 5, 'instagram_page', 'text', 'Instagram Page', 0, 0, 1, 1, 1, 1, '{}', 39),
	(186, 5, 'twitter_page', 'text', 'Twitter Page', 0, 0, 1, 1, 1, 1, '{}', 40),
	(187, 5, 'facebook_page', 'text', 'Facebook Page', 0, 0, 1, 1, 1, 1, '{}', 41);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table finddbox.data_types
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.data_types: ~13 rows (approximately)
DELETE FROM `data_types`;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2020-05-02 06:57:22', '2020-06-21 15:08:32'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-05-02 06:57:22', '2020-05-02 06:57:22'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-05-02 06:57:22', '2020-05-02 06:57:22'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2020-05-02 06:57:45', '2020-05-03 07:18:27'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2020-05-02 06:57:49', '2021-05-16 00:11:34'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-05-02 06:57:53', '2020-05-02 06:57:53'),
	(9, 'tags', 'tags', 'Tag', 'Tags', 'voyager-tag', 'TCG\\Voyager\\Models\\Tag', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2020-05-03 07:34:22', '2020-05-03 08:02:52'),
	(15, 'ratings', 'ratings', 'Rating', 'Ratings', NULL, 'TCG\\Voyager\\Models\\Rating', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-06-05 07:11:08', '2020-06-18 01:16:50'),
	(17, 'location', 'location', 'Location', 'Locations', NULL, 'TCG\\Voyager\\Models\\Location', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2020-06-19 22:17:39', '2020-06-19 22:17:39'),
	(21, 'locations', 'locations', 'Location', 'Locations', NULL, 'TCG\\Voyager\\Models\\Location', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-06-19 22:44:43', '2020-10-26 12:25:43'),
	(22, 'recommended', 'recommended', 'Recommended', 'Recommended', NULL, 'App\\Recommended', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2020-06-20 08:07:10', '2020-06-20 08:07:10'),
	(23, 'userslike', 'userslike', 'Userslike', 'Users Likes', NULL, 'TCG\\Voyager\\Models\\Userslike', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-06-21 15:03:41', '2020-06-21 15:16:26'),
	(24, 'comments', 'comments', 'Comment', 'Comments', NULL, 'TCG\\Voyager\\Models\\Comment', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2021-04-15 12:52:34', '2021-04-15 12:52:34');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table finddbox.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table finddbox.locations
DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','pending') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `order` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `type` enum('continent','country','state','city') COLLATE utf8mb4_unicode_ci DEFAULT 'country',
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_slug_unique` (`slug`),
  KEY `locations_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.locations: ~13 rows (approximately)
DELETE FROM `locations`;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `created_at`, `updated_at`, `location`, `parent_id`, `slug`, `status`, `order`, `type`) VALUES
	(4, '2020-09-19 05:57:00', '2020-09-19 06:41:39', 'Worldwide', NULL, 'worldwide', 'publish', '1', 'country'),
	(5, '2020-09-19 05:57:00', '2020-09-22 08:31:57', 'Africa', 4, 'africa', 'publish', '1', 'country'),
	(6, '2020-09-19 05:58:06', '2020-09-19 05:58:06', 'Asia', 4, 'asia', 'pending', '1', 'country'),
	(7, '2020-09-19 05:58:00', '2020-09-26 00:09:23', 'Nigeria', 5, 'nigeria', 'publish', '1', 'country'),
	(8, '2020-09-19 06:00:00', '2020-09-26 00:09:54', 'Lagos', 7, 'lagos', 'publish', '1', 'country'),
	(9, '2020-09-19 06:01:00', '2020-11-24 05:17:13', 'Kwara', 7, 'kwara', 'publish', '1', 'state'),
	(10, '2020-09-19 06:01:39', '2020-09-19 06:01:39', 'Osun', 7, 'osun', 'pending', '1', 'country'),
	(11, '2020-09-19 06:02:15', '2020-09-19 06:02:15', 'Enugu', 7, 'enugu', 'pending', '1', 'country'),
	(12, '2020-09-19 06:02:42', '2020-09-19 06:02:42', 'Onitsha', 7, 'onitsha', 'pending', '1', 'country'),
	(13, '2020-09-22 17:32:00', '2020-11-24 05:17:47', 'Ondo, Nigeria', NULL, 'ondo-nigeria', 'pending', '3', 'state'),
	(14, '2020-10-31 15:09:27', '2020-10-31 15:09:27', 'Benin', NULL, 'benin', 'publish', '1', 'state'),
	(15, '2020-11-17 12:50:00', '2020-11-17 12:54:20', 'Owerri', 7, 'owerri', 'publish', '1', 'city'),
	(16, '2020-11-24 05:16:26', '2020-11-24 05:16:26', 'Ghana', 5, 'ghana', 'publish', '1', 'country');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

-- Dumping structure for table finddbox.location_post
DROP TABLE IF EXISTS `location_post`;
CREATE TABLE IF NOT EXISTS `location_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.location_post: ~5 rows (approximately)
DELETE FROM `location_post`;
/*!40000 ALTER TABLE `location_post` DISABLE KEYS */;
INSERT INTO `location_post` (`id`, `location_id`, `post_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, NULL, NULL),
	(3, 1, 10, NULL, NULL),
	(4, 1, 11, NULL, NULL),
	(5, 1, 12, NULL, NULL),
	(6, 2, 12, NULL, NULL);
/*!40000 ALTER TABLE `location_post` ENABLE KEYS */;

-- Dumping structure for table finddbox.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.menus: ~3 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2020-05-02 06:57:24', '2020-05-02 06:57:24'),
	(2, 'main', '2020-05-07 09:08:38', '2020-05-07 09:08:38'),
	(3, 'user', '2020-06-29 11:02:46', '2020-06-29 11:02:46');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table finddbox.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  `icon_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.menu_items: ~28 rows (approximately)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`, `icon_color`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-05-02 06:57:25', '2020-05-02 06:57:25', 'voyager.dashboard', NULL, NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2020-05-02 06:57:25', '2021-04-15 12:55:31', 'voyager.media.index', NULL, NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 5, '2020-05-02 06:57:25', '2020-06-19 23:05:45', 'voyager.users.index', NULL, NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-05-02 06:57:25', '2020-05-02 06:57:25', 'voyager.roles.index', NULL, NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 10, '2020-05-02 06:57:25', '2021-04-15 12:55:45', NULL, NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-05-02 06:57:25', '2020-05-03 07:38:25', 'voyager.menus.index', NULL, NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-05-02 06:57:25', '2020-05-03 07:38:25', 'voyager.database.index', NULL, NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-05-02 06:57:25', '2020-05-03 07:38:25', 'voyager.compass.index', NULL, NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-05-02 06:57:25', '2020-05-03 07:38:25', 'voyager.bread.index', NULL, NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 11, '2020-05-02 06:57:25', '2021-04-15 12:55:45', 'voyager.settings.index', NULL, NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 24, 1, '2020-05-02 06:57:47', '2020-05-18 05:50:14', 'voyager.categories.index', NULL, NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 3, '2020-05-02 06:57:51', '2020-05-18 05:50:56', 'voyager.posts.index', NULL, NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 9, '2020-05-02 06:57:55', '2021-04-15 12:55:32', 'voyager.pages.index', NULL, NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-05-02 06:58:02', '2020-05-03 07:38:25', 'voyager.hooks', NULL, NULL),
	(16, 1, 'Tags', '', '_self', 'voyager-tag', '#000000', 24, 2, '2020-05-03 07:38:02', '2020-06-09 05:22:56', 'voyager.tags.index', 'null', NULL),
	(24, 1, 'Post Attributes', '', '_self', 'voyager-params', '#000000', NULL, 4, '2020-05-18 05:46:57', '2020-05-18 05:51:04', NULL, '', NULL),
	(27, 1, 'Ratings', '', '_self', 'voyager-star', '#000000', 24, 3, '2020-06-05 07:11:08', '2021-04-15 12:55:31', 'voyager.ratings.index', 'null', NULL),
	(32, 1, 'Locations', '/adminward/locations', '_self', 'voyager-location', '#000000', 24, 5, '2020-06-19 22:48:55', '2021-05-31 03:19:18', NULL, '', NULL),
	(33, 1, 'Recommended', '', '_self', 'voyager-folder', '#000000', NULL, 6, '2020-06-20 08:07:10', '2020-10-31 07:41:46', 'voyager.recommended.index', 'null', NULL),
	(34, 1, 'Users Likes', '', '_self', 'voyager-star-half', '#000000', NULL, 7, '2020-06-21 15:03:41', '2020-10-31 07:44:08', 'voyager.userslike.index', 'null', NULL),
	(35, 3, 'Home', '/', '_self', NULL, '#000000', NULL, 1, '2020-06-29 11:03:48', '2020-06-29 15:09:47', NULL, '', NULL),
	(36, 3, 'Cleaning', '/category/cleaning', '_self', NULL, '#000000', NULL, 2, '2020-06-29 11:05:08', '2020-11-15 05:44:32', NULL, '', NULL),
	(37, 3, 'Fashion', '/category/fashion', '_self', NULL, '#000000', NULL, 3, '2020-06-29 11:05:27', '2020-06-29 15:09:47', NULL, '', NULL),
	(38, 3, 'Technology', '/category/technology', '_self', NULL, '#000000', NULL, 4, '2020-06-29 11:07:22', '2020-11-15 05:44:47', NULL, '', NULL),
	(39, 3, 'Our Support', '/support', '_self', NULL, '#000000', NULL, 5, '2020-06-29 11:08:04', '2020-06-29 15:09:56', NULL, '', NULL),
	(42, 1, 'Comments', '', '_self', 'voyager-bubble', '#000000', 24, 4, '2021-04-15 12:52:34', '2021-04-15 12:55:45', 'voyager.comments.index', 'null', NULL),
	(43, 2, 'Food Ordering', '/location/nigeria/category/food-ordering', '_self', 'mdi-food', '#000000', NULL, 12, '2021-07-10 17:59:47', '2021-07-10 18:56:54', NULL, '', 'success'),
	(44, 2, 'Gadgets Shop', '/location/nigeria/category/gadgets-shop', '_self', 'mdi-cellphone-link', '#000000', NULL, 13, '2021-07-10 18:34:31', '2021-07-10 20:54:49', NULL, '', 'black');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table finddbox.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.migrations: ~29 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2016_01_01_000000_add_voyager_user_fields', 1),
	(3, '2016_01_01_000000_create_data_types_table', 1),
	(4, '2016_05_19_173453_create_menu_table', 1),
	(5, '2016_10_21_190000_create_roles_table', 1),
	(6, '2016_10_21_190000_create_settings_table', 1),
	(7, '2016_11_30_135954_create_permission_table', 1),
	(8, '2016_11_30_141208_create_permission_role_table', 1),
	(9, '2016_12_26_201236_data_types__add__server_side', 1),
	(10, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(11, '2017_01_14_005015_create_translations_table', 1),
	(12, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(13, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(14, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(15, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(16, '2017_08_05_000000_add_group_to_settings_table', 1),
	(17, '2017_11_26_013050_add_user_role_relationship', 1),
	(18, '2017_11_26_015000_create_user_roles_table', 1),
	(19, '2018_03_11_000000_add_user_settings', 1),
	(20, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(21, '2018_03_16_000000_make_settings_value_nullable', 1),
	(22, '2019_08_19_000000_create_failed_jobs_table', 1),
	(23, '2016_01_01_000000_create_pages_table', 2),
	(24, '2016_01_01_000000_create_posts_table', 2),
	(25, '2016_02_15_204651_create_categories_table', 2),
	(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
	(27, '2014_10_12_100000_create_password_resets_table', 3),
	(28, '2017_12_07_122845_create_oauth_providers_table', 4),
	(29, '2021_04_14_214548_create_comments_table', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table finddbox.oauth_providers
DROP TABLE IF EXISTS `oauth_providers`;
CREATE TABLE IF NOT EXISTS `oauth_providers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_providers_user_id_foreign` (`user_id`),
  KEY `oauth_providers_provider_user_id_index` (`provider_user_id`),
  CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.oauth_providers: ~0 rows (approximately)
DELETE FROM `oauth_providers`;
/*!40000 ALTER TABLE `oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_providers` ENABLE KEYS */;

-- Dumping structure for table finddbox.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.pages: ~1 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-05-02 06:57:56', '2020-05-02 06:57:56');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table finddbox.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.password_resets: ~1 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('neyschedcal26@gmail.com', '$2y$10$pMazHrrENET8pcgvWqvsr.ddUHJh635jko0Eajzyq2KfapOqQH0jm', '2020-10-09 16:32:17');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table finddbox.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.permissions: ~76 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2020-05-02 06:57:25', '2020-05-02 06:57:25'),
	(2, 'browse_bread', NULL, '2020-05-02 06:57:25', '2020-05-02 06:57:25'),
	(3, 'browse_database', NULL, '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(4, 'browse_media', NULL, '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(5, 'browse_compass', NULL, '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(6, 'browse_menus', 'menus', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(7, 'read_menus', 'menus', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(8, 'edit_menus', 'menus', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(9, 'add_menus', 'menus', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(10, 'delete_menus', 'menus', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(11, 'browse_roles', 'roles', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(12, 'read_roles', 'roles', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(13, 'edit_roles', 'roles', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(14, 'add_roles', 'roles', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(15, 'delete_roles', 'roles', '2020-05-02 06:57:26', '2020-05-02 06:57:26'),
	(16, 'browse_users', 'users', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(17, 'read_users', 'users', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(18, 'edit_users', 'users', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(19, 'add_users', 'users', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(20, 'delete_users', 'users', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(21, 'browse_settings', 'settings', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(22, 'read_settings', 'settings', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(23, 'edit_settings', 'settings', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(24, 'add_settings', 'settings', '2020-05-02 06:57:27', '2020-05-02 06:57:27'),
	(25, 'delete_settings', 'settings', '2020-05-02 06:57:28', '2020-05-02 06:57:28'),
	(26, 'browse_categories', 'categories', '2020-05-02 06:57:47', '2020-05-02 06:57:47'),
	(27, 'read_categories', 'categories', '2020-05-02 06:57:47', '2020-05-02 06:57:47'),
	(28, 'edit_categories', 'categories', '2020-05-02 06:57:47', '2020-05-02 06:57:47'),
	(29, 'add_categories', 'categories', '2020-05-02 06:57:48', '2020-05-02 06:57:48'),
	(30, 'delete_categories', 'categories', '2020-05-02 06:57:48', '2020-05-02 06:57:48'),
	(31, 'browse_posts', 'posts', '2020-05-02 06:57:51', '2020-05-02 06:57:51'),
	(32, 'read_posts', 'posts', '2020-05-02 06:57:52', '2020-05-02 06:57:52'),
	(33, 'edit_posts', 'posts', '2020-05-02 06:57:52', '2020-05-02 06:57:52'),
	(34, 'add_posts', 'posts', '2020-05-02 06:57:52', '2020-05-02 06:57:52'),
	(35, 'delete_posts', 'posts', '2020-05-02 06:57:52', '2020-05-02 06:57:52'),
	(36, 'browse_pages', 'pages', '2020-05-02 06:57:55', '2020-05-02 06:57:55'),
	(37, 'read_pages', 'pages', '2020-05-02 06:57:55', '2020-05-02 06:57:55'),
	(38, 'edit_pages', 'pages', '2020-05-02 06:57:56', '2020-05-02 06:57:56'),
	(39, 'add_pages', 'pages', '2020-05-02 06:57:56', '2020-05-02 06:57:56'),
	(40, 'delete_pages', 'pages', '2020-05-02 06:57:56', '2020-05-02 06:57:56'),
	(41, 'browse_hooks', NULL, '2020-05-02 06:58:02', '2020-05-02 06:58:02'),
	(42, 'browse_tags', 'tags', '2020-05-03 07:34:22', '2020-05-03 07:34:22'),
	(43, 'read_tags', 'tags', '2020-05-03 07:34:22', '2020-05-03 07:34:22'),
	(44, 'edit_tags', 'tags', '2020-05-03 07:34:22', '2020-05-03 07:34:22'),
	(45, 'add_tags', 'tags', '2020-05-03 07:34:22', '2020-05-03 07:34:22'),
	(46, 'delete_tags', 'tags', '2020-05-03 07:34:22', '2020-05-03 07:34:22'),
	(57, 'browse_ratings', 'ratings', '2020-06-05 07:11:08', '2020-06-05 07:11:08'),
	(58, 'read_ratings', 'ratings', '2020-06-05 07:11:08', '2020-06-05 07:11:08'),
	(59, 'edit_ratings', 'ratings', '2020-06-05 07:11:08', '2020-06-05 07:11:08'),
	(60, 'add_ratings', 'ratings', '2020-06-05 07:11:08', '2020-06-05 07:11:08'),
	(61, 'delete_ratings', 'ratings', '2020-06-05 07:11:08', '2020-06-05 07:11:08'),
	(62, 'browse_location', 'location', '2020-06-19 22:17:39', '2020-06-19 22:17:39'),
	(63, 'read_location', 'location', '2020-06-19 22:17:39', '2020-06-19 22:17:39'),
	(64, 'edit_location', 'location', '2020-06-19 22:17:39', '2020-06-19 22:17:39'),
	(65, 'add_location', 'location', '2020-06-19 22:17:39', '2020-06-19 22:17:39'),
	(66, 'delete_location', 'location', '2020-06-19 22:17:39', '2020-06-19 22:17:39'),
	(72, 'browse_locations', 'locations', '2020-06-19 22:44:43', '2020-06-19 22:44:43'),
	(73, 'read_locations', 'locations', '2020-06-19 22:44:43', '2020-06-19 22:44:43'),
	(74, 'edit_locations', 'locations', '2020-06-19 22:44:43', '2020-06-19 22:44:43'),
	(75, 'add_locations', 'locations', '2020-06-19 22:44:43', '2020-06-19 22:44:43'),
	(76, 'delete_locations', 'locations', '2020-06-19 22:44:43', '2020-06-19 22:44:43'),
	(77, 'browse_recommended', 'recommended', '2020-06-20 08:07:10', '2020-06-20 08:07:10'),
	(78, 'read_recommended', 'recommended', '2020-06-20 08:07:10', '2020-06-20 08:07:10'),
	(79, 'edit_recommended', 'recommended', '2020-06-20 08:07:10', '2020-06-20 08:07:10'),
	(80, 'add_recommended', 'recommended', '2020-06-20 08:07:10', '2020-06-20 08:07:10'),
	(81, 'delete_recommended', 'recommended', '2020-06-20 08:07:10', '2020-06-20 08:07:10'),
	(82, 'browse_userslike', 'userslike', '2020-06-21 15:03:41', '2020-06-21 15:03:41'),
	(83, 'read_userslike', 'userslike', '2020-06-21 15:03:41', '2020-06-21 15:03:41'),
	(84, 'edit_userslike', 'userslike', '2020-06-21 15:03:41', '2020-06-21 15:03:41'),
	(85, 'add_userslike', 'userslike', '2020-06-21 15:03:41', '2020-06-21 15:03:41'),
	(86, 'delete_userslike', 'userslike', '2020-06-21 15:03:41', '2020-06-21 15:03:41'),
	(87, 'browse_comments', 'comments', '2021-04-15 12:52:34', '2021-04-15 12:52:34'),
	(88, 'read_comments', 'comments', '2021-04-15 12:52:34', '2021-04-15 12:52:34'),
	(89, 'edit_comments', 'comments', '2021-04-15 12:52:34', '2021-04-15 12:52:34'),
	(90, 'add_comments', 'comments', '2021-04-15 12:52:34', '2021-04-15 12:52:34'),
	(91, 'delete_comments', 'comments', '2021-04-15 12:52:34', '2021-04-15 12:52:34');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table finddbox.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.permission_role: ~76 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
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
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(89, 1),
	(90, 1),
	(91, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table finddbox.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wikipedia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snapchat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `rate` double DEFAULT '4.5',
  `rating_id` bigint(20) DEFAULT NULL,
  `company_full_name` text COLLATE utf8mb4_unicode_ci,
  `company_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_of_business` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` text COLLATE utf8mb4_unicode_ci,
  `delivery_locations` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `deals_with` text COLLATE utf8mb4_unicode_ci,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `instagram_page` text COLLATE utf8mb4_unicode_ci,
  `twitter_page` text COLLATE utf8mb4_unicode_ci,
  `facebook_page` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_tag_id_index` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.posts: ~16 rows (approximately)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`, `instagram`, `twitter`, `link`, `wikipedia`, `facebook`, `tiktok`, `snapchat`, `youtube`, `tag_id`, `comment_id`, `rate`, `rating_id`, `company_full_name`, `company_number`, `company_email`, `owner_of_business`, `company_address`, `delivery_locations`, `country`, `location_id`, `deals_with`, `whatsapp`, `verified`, `instagram_page`, `twitter_page`, `facebook_page`) VALUES
	(2, 1, NULL, 'Djinpod', 'Djinpod Food Delivery', 'An onliine food delivery network situated at gregory university uturu.', NULL, 'posts/July2020/XAwCvIHjNwYbOZheZZZm.JPG', 'djinpod', 'Delivery Network', 'Djinpod, djinpod food delivery, djinpod Gregory University, Gregory University Uturu, Uturu, Abia State, Abia', 'PUBLISHED', 0, '2020-05-19 13:07:25', '2021-07-14 09:45:10', 'djinpod', 'djinpod', 'www.djinpod.com', NULL, 'djinpod', NULL, NULL, NULL, NULL, NULL, 4.5, NULL, 'Djinpod Enterprises', '+2348163463417', 'djinpodservices@djinpod.com', 'Obinna Iloeje', 'Gregory University Uturu, Amaokwe, Abia State', 'Worldwide', 'Nigeria', 4, 'food, campus deliivery, school delivery, shopping, mart, stores', 'https://wa.me/2348134194458', 1, NULL, NULL, '<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fweb.facebook.com%2Fdjinpod%2Fphotos%2Fa.170195757672779%2F184758032883218%2F&show_text=true&width=500" width="500" height="609" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>'),
	(9, 1, NULL, 'Priscy\'s closet', 'Priscyâ€™s Closet', 'An online business that sells fashion accessories like bags, clothes, shoes etc', NULL, 'posts/July2020/ztkPfzvI3rHQd3pqO1ko.jpeg', 'priscy-s-closet', 'Fashion Retailer', 'Priscilla, Ojo, Ajoke, Priscilla Ojo, Priscilla Ajoke Ojo', 'PUBLISHED', 0, '2020-07-02 21:57:23', '2021-06-22 08:21:52', 'priscyscloset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Priscyâ€™s Closet', '08064689043; 08030658644,', NULL, 'Priscilla Ajoke Ojo', '15a Omorinre Johnson str, off Busola Durosimi Etti, Lekki phase 1, Lagos', 'Nationwide', 'Nigeria', 5, NULL, NULL, 0, NULL, NULL, NULL),
	(10, 1, NULL, 'Kolzy Couture', 'Kolzy Couture', 'A social media fashion designer that specializes in sweat shirts, Kaftans, tee shirts , rebel shorts etc', NULL, 'posts/July2020/g0JGzZmSmpbkjHavCpOe.jpeg', 'kolzy-couture', 'Fashion Brand and Designer', 'Kolzycouture, kolzy, couture, Kolzy Couture, fashion brands in Nigeria, fashion brands', 'PUBLISHED', 0, '2020-07-05 21:52:50', '2021-05-28 20:26:58', 'Kolzycouture', 'kolzycouture', 'kolzycouture.com', NULL, 'kolzycouture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kolzy Couture', '08091038085; 08168251335', 'support@kolzycouture.com', 'Adetoro Kolade', 'Block 11, Alhaji Masha Road, Surulere, Lagos, Nigeria', 'Nationwide', 'Nigeria', 5, NULL, NULL, 0, NULL, NULL, NULL),
	(11, 1, NULL, 'Cleaning Call Services', 'Cleaning Call Services', 'An online Lagos-based cleaning company that specializes in home and office cleaning etc.', '<p>&nbsp;</p>\r\n<blockquote class="instagram-media" style="background: #FFF; border: 0; border-radius: 3px; box-shadow: 0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width: 540px; min-width: 326px; padding: 0; width: calc(100% - 2px);" data-instgrm-captioned="" data-instgrm-permalink="https://www.instagram.com/p/CANVBoZjJLu/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="12">\r\n<div style="padding: 16px;">\r\n<div style="display: flex; flex-direction: row; align-items: center;">\r\n<div style="background-color: #f4f4f4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;">&nbsp;</div>\r\n<div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;">\r\n<div style="background-color: #f4f4f4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div style="padding: 19% 0;">&nbsp;</div>\r\n<div style="display: block; height: 50px; margin: 0 auto 12px; width: 50px;">&nbsp;</div>\r\n<div style="padding-top: 8px;">\r\n<div style="color: #3897f0; font-family: Arial,sans-serif; font-size: 14px; font-style: normal; font-weight: 550; line-height: 18px;">View this post on Instagram</div>\r\n</div>\r\n<div style="padding: 12.5% 0;">&nbsp;</div>\r\n<div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;">\r\n<div>\r\n<div style="background-color: #f4f4f4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);">&nbsp;</div>\r\n</div>\r\n<div style="margin-left: 8px;">\r\n<div style="background-color: #f4f4f4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;">&nbsp;</div>\r\n<div style="width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg);">&nbsp;</div>\r\n</div>\r\n<div style="margin-left: auto;">\r\n<div style="width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);">&nbsp;</div>\r\n<div style="width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);">&nbsp;</div>\r\n</div>\r\n</div>\r\n<p style="margin: 8px 0 0 0; padding: 0 4px;"><a style="color: #000; font-family: Arial,sans-serif; font-size: 14px; font-style: normal; font-weight: normal; line-height: 17px; text-decoration: none; word-wrap: break-word;" href="https://www.instagram.com/p/CANVBoZjJLu/?utm_source=ig_embed&amp;utm_campaign=loading" target="_blank" rel="noopener">Do you want your home or office to be neat and tidy? Where spotless cleaning comes to your door? Nobody does it better than @cleaning__call ____________________________________________________ ðŸ“ž us today - 09053537008</a></p>\r\n<p style="color: #c9c8cd; font-family: Arial,sans-serif; font-size: 14px; line-height: 17px; margin-bottom: 0; margin-top: 8px; overflow: hidden; padding: 8px 0 7px; text-align: center; text-overflow: ellipsis; white-space: nowrap;">A post shared by <a style="color: #c9c8cd; font-family: Arial,sans-serif; font-size: 14px; font-style: normal; font-weight: normal; line-height: 17px;" href="https://www.instagram.com/cleaning__call/?utm_source=ig_embed&amp;utm_campaign=loading" target="_blank" rel="noopener"> Standard Cleaningcall Intl</a> (@cleaning__call) on <time style="font-family: Arial,sans-serif; font-size: 14px; line-height: 17px;" datetime="2020-05-15T12:19:19+00:00">May 15, 2020 at 5:19am PDT</time></p>\r\n</div>\r\n</blockquote>', 'posts/July2020/jDecyre461jIKSG4VGph.jpeg', 'cleaning-call-services', 'Cleaning Services is an online Lagos-based cleaning company that specializes in home and office cleaning etc.', 'Cleaning call services, cleaning call,Cleaning, call, services,', 'PUBLISHED', 0, '2020-07-06 08:47:05', '2021-05-10 15:32:37', 'cleaning__call', NULL, 'cleaningcallservices.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Standard Cleaning Call International Limited', '09053537008', 'info@cleaningcallservices.com', 'Naomi Njideka Emu', '149 Ogudu Suf-ai Mall, Lagos, Nigeria', 'Nationwide', 'Nigeria', 8, 'Cleaning services, interiors', NULL, 0, NULL, NULL, NULL),
	(12, 1, NULL, 'Mapia Tea', 'Mapia Tea', 'Mapia Tea is an online weight loss and fitness company that produces waist trainers, Teas and herbs for body shaping.', '<blockquote class="instagram-media" style="background: #FFF; border: 0; border-radius: 3px; box-shadow: 0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width: 540px; min-width: 326px; padding: 0; width: calc(100% - 2px);" data-instgrm-captioned="" data-instgrm-permalink="https://www.instagram.com/p/CNLS1TtDYtH/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="13">\r\n<div style="padding: 16px;">\r\n<div style="display: flex; flex-direction: row; align-items: center;">\r\n<div style="background-color: #f4f4f4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;">&nbsp;</div>\r\n<div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;">\r\n<div style="background-color: #f4f4f4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div style="padding: 19% 0;">&nbsp;</div>\r\n<div style="display: block; height: 50px; margin: 0 auto 12px; width: 50px;">&nbsp;</div>\r\n<div style="padding-top: 8px;">\r\n<div style="color: #3897f0; font-family: Arial,sans-serif; font-size: 14px; font-style: normal; font-weight: 550; line-height: 18px;">View this post on Instagram</div>\r\n</div>\r\n<div style="padding: 12.5% 0;">&nbsp;</div>\r\n<div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;">\r\n<div>\r\n<div style="background-color: #f4f4f4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);">&nbsp;</div>\r\n</div>\r\n<div style="margin-left: 8px;">\r\n<div style="background-color: #f4f4f4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;">&nbsp;</div>\r\n<div style="width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg);">&nbsp;</div>\r\n</div>\r\n<div style="margin-left: auto;">\r\n<div style="width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);">&nbsp;</div>\r\n<div style="width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;">\r\n<div style="background-color: #f4f4f4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;">&nbsp;</div>\r\n<div style="background-color: #f4f4f4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;">&nbsp;</div>\r\n</div>\r\n<p style="color: #c9c8cd; font-family: Arial,sans-serif; font-size: 14px; line-height: 17px; margin-bottom: 0; margin-top: 8px; overflow: hidden; padding: 8px 0 7px; text-align: center; text-overflow: ellipsis; white-space: nowrap;"><a style="color: #c9c8cd; font-family: Arial,sans-serif; font-size: 14px; font-style: normal; font-weight: normal; line-height: 17px; text-decoration: none;" href="https://www.instagram.com/p/CNLS1TtDYtH/?utm_source=ig_embed&amp;utm_campaign=loading" target="_blank" rel="noopener">A post shared by Mapia Tea (@mapiatea)</a></p>\r\n</div>\r\n</blockquote>', 'posts/September2020/bItm4dvsZi4mzzGXqUHb.jpeg', 'mapia-tea', 'Mapia Tea is an online weight loss and fitness company that produces waist trainers, Teas and herbs for body shaping.', 'Mapia tea, mapia tea waist trainer, mapia tea waist trainers, mapia herbs', 'PUBLISHED', 0, '2020-09-17 07:26:50', '2021-05-10 15:55:46', 'mapiatea', 'mapiatea1', 'mapiatea.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+2348168059906, +233260901230', 'info@mapiatea.com', NULL, '17 Bode Thomas surulere Lagos, Nigeria', 'Worldwide', 'Nigeria', 4, NULL, NULL, 0, NULL, NULL, NULL),
	(13, 1, NULL, 'T20luxury', 'T20luxury - Toplagy', 'T20luxury is an online business owned by Toplagy creations that sells unisex adult and kids fashion related materials which includes clothes, shoes, wristwatches etc.', NULL, 'posts/October2020/QnOb4KyBWYj8O4fDvtbu.jpg', 't20luxury', 'T20luxury is a social media business owned by Toplagy creations that sells unisex adult and kids fashion related materials which includes clothes, shoes, wristwatches etc.', 'T20luxury, toplagy creations, toplagy, luxury clothing in Nigeria, Luxury Nigeria, luxury', 'PUBLISHED', 0, '2020-10-28 02:32:53', '2021-05-31 03:29:08', 't20luxury', NULL, 't20luxury.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+971529568315', 'customerservice@t20luxury.com', NULL, NULL, 'Worldwide', 'United Arab Emirates', 7, 'Luxurious clothes, luxury shoes, luxury boots, luxurious lifestyle', 'wa.me/message/QPYQDMXEWPR4E1', 0, 'https://www.instagram.com/p/CPgOnrpHBl_/?utm_medium=copy_link', NULL, NULL),
	(14, 1, NULL, 'Obiwezy', 'Obiwezy', 'A multiplatform that ecommerce and recommerce electronic devices and accessories like TV, phones, laptops, phone cases, power banks e.t.c.', NULL, 'posts/November2020/bWy6NAdrPzt7Q2HbHVC6.jpeg', 'obiwezy', 'A multiplatform that ecommerce and recommerce electronic devices and accessories like TV, phones, laptops, phone cases, power banks e.t.c.', 'Obiwezy, Obiwezy instagram, Obiwezy twitter, Obiwezy facebook, Obiwezy electronics, Obiwezy delivery, Obiwezy gadgets, Lagos gadgets, Obiwezy Nigeria', 'PUBLISHED', 0, '2020-11-01 02:12:07', '2021-05-28 20:24:33', 'obiwezy', 'obiwezy', 'Obiwezy.com', NULL, 'obiwezy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Obiwezy Enterprises', '08139435241, 09075482826, 09021609165', 'info@obiwezy.com', 'Obafemi Onanuga', '13, Ola Ayeni Street, Computer Village, Ikeja, Lagos, Nigeria', NULL, 'Nigeria', 5, 'iphone 11, iphones, speakers, laptops, fairly used laptops', NULL, 0, NULL, NULL, NULL),
	(15, 1, NULL, 'Canoonstore', 'Canoonstore', 'Canoonstore is an online, social media gadgets store that sells both used and new gadgets devices and accessories.', NULL, 'posts/November2020/YThQDWkAg8Q9z1ahDtcS.jpeg', 'canoonstore', 'An online social media company', 'Canoonstore, Canoonstore gadgets, Canoonstore electronics, Canoonstore Nigeria', 'PUBLISHED', 1, '2020-11-01 02:28:01', '2021-06-28 12:25:58', 'canoonstore', 'canoonstore', 'canoonstore. com', NULL, 'Canoonstore', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Canoons Store Ventures', '08068065323, 08098088800', 'info@cstore.com.ng', NULL, '5 Pepple Street, Opposite Zenith Bank, Computer Village, Ikeja, Lagos, Nigeria', NULL, 'Nigeria', 7, NULL, NULL, 0, NULL, NULL, NULL),
	(16, 1, NULL, 'Phoneshopng G.T.I.', 'Phoneshopng GTI', 'Phoneshopng is a multiplatform that ecommerce and recommerce electronic devices like phones, computers and its accessories', NULL, 'posts/November2020/0ixluF5wDTpAsQEqJ8nr.jpeg', 'phoneshopng-g-t-i', NULL, 'PHONESHOPNG, PHONESHOPNG GTI, PHONESHOP, PHONESHOP LAGOS, PHONESHOP NIGERIA, PHONESHOPNG NIGERIA', 'PUBLISHED', 1, '2020-11-01 03:42:00', '2021-06-28 12:27:47', 'phoneshopng', NULL, 'phoneshopng.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GTI Phoneshop', '+234 (0) 815 222 3332 | 08097377334 | 08118930003', 'info@phoneshopng.com', NULL, 'Suite 8, Distinct Plaza @ 14, Oremeji Str. Opposite UBA Bank, Off Medical Road, Computer Village. Ikeja, Lagos, Nigeria', NULL, 'Nigeria', 7, NULL, NULL, 0, NULL, NULL, NULL),
	(17, 1, NULL, 'Jumia Foods', 'Jumia Foods', 'A food delivery network, under its parent company Jumia Group, situated in African countries.', NULL, 'posts/May2021/QFyS4icKB6qIrTTP4Hwz.jpeg', 'jumia-foods', 'A food delivery network, under its parent company Jumia Group, situated in African countries.', 'JUMIA FOODS, JUMIA FOODS NIGERIA, JUMIA FOOD ALGERIA, JUMIA FOODS GHANA, FOOD DELIVERY GHANA, FOOD DELIVERY NIGERIA, FOOD Delivery AFRICA', 'PUBLISHED', 0, '2020-11-01 04:46:39', '2021-05-28 20:22:53', 'jumiafoodng', 'JumiaFoodNG', 'food.Jumia.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Jumia Foods', '018881108', 'corporate.food@jumia.com.ng', NULL, NULL, NULL, NULL, 5, 'Foods, delivery, food delivery, drinks, snacks', NULL, 0, NULL, NULL, NULL),
	(18, 1, NULL, 'Shopinverse', 'Shopinverse', 'Shop Inverse International Limited is an online gadgets store whose sole ventures is on selling both used and new tablets, laptops and desktops in Nigeria.', NULL, 'posts/November2020/KRnwoVhjcyhnUyxiDEB2.jpeg', 'shopinverse', 'Shop Inverse International Limited is an online gadgets store whose sole ventures is on selling both used and new tablets, laptops and desktops in Nigeria', 'Shopinverse, Shop inverse, Shopinverse instagram, Shopinverse twitter, Shopinverse laptop, Shop inverse facebook, Shopinverse facebook, Used phones, used laptops, brand new phones, brand new laptops, accessories, used tablets', 'PUBLISHED', 0, '2020-11-05 06:45:11', '2021-07-11 16:58:16', 'shopinverse', 'shop_inverse', 'shopinverse.com', NULL, 'shopinverse', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Shop Inverse International Limited', '+234(0)8065550510', 'admin@shopinverse.com', NULL, 'Maryland Mall. No. 350-360 Ikorodu Road, Anthony, Lagos State.', NULL, 'Nigeria', 7, 'Used phones, used laptops, brand new phones, brand new laptops, accessories, used tablets', NULL, 0, 'https://www.instagram.com/p/CRJZ_d6s7uZ/', NULL, NULL),
	(19, 1, NULL, 'Ace Phonecase', 'Ace phone case', 'Ace phonecase is an online phone case selling store in Nigeria', NULL, 'posts/November2020/tr5FIpoOSl4HlkF5d8lL.jpeg', 'ace-phonecase', 'Ace phonecase is an online phone case selling store in Nigeria', 'Ace phonecase, ace phone case, phone case Nigeria, phonecases, phone cases', 'PUBLISHED', 0, '2020-11-16 18:20:13', '2021-05-28 20:21:53', 'ace_phonecase', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'â€­0813 749 1789â€¬', 'sola_adesiyan@yahoo.com', NULL, NULL, 'Nigeria', 'Nigeria', 7, NULL, NULL, 0, NULL, NULL, NULL),
	(20, 1, NULL, 'Suzans Cleaning Services', 'Suzans Cleaning Service', 'Suzans cleaning service is a cleaning service service based at owerri, that specializes in residential and commercial cleaning, post construction cleaning and fumigations.', NULL, 'posts/November2020/gC2bVglQWUCayP092yva.jpeg', 'suzans-cleaning-services', 'A cleaning service in owerri, Imo state', 'Suzans, Suzans cleaning service, Susan cleaning service, cleaning service owerri', 'PUBLISHED', 0, '2020-11-17 12:42:50', '2021-05-28 20:21:24', 'suzans_cleaning_service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Suzans Cleaning Service', '+234 907 707 2030', NULL, 'Suzan Uwakwe', NULL, 'Owerri, Imo state', 'Nigeria', 15, NULL, NULL, 0, NULL, NULL, NULL),
	(21, 1, NULL, 'Style In Lagos', 'Style in Lagos', 'Style In Lagos is an online women fashion company whose sole venture is to sell woman clothes, beachwears, shoes dresses e.t.c.', NULL, 'posts/November2020/gD4C32gRnqrnJwvRgabh.jpeg', 'style-in-lagos', 'An online fashion business that sells women wears', 'Styleinlagos, stylesinlagos, styles in Lagos, style in Lagos, Lagos styles, Lagos style, women clothes, women fashion, accessories for women', 'PUBLISHED', 0, '2020-11-17 20:12:39', '2021-05-28 20:20:47', 'Styleinlagosss', NULL, 'Styleinlagos.ng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+234 809 100 3832', 'info@styleinlagos.ng', NULL, NULL, 'Nigeria, Ghana', 'Nigeria', 5, 'Women fashion, women clothes, women style, accessories for women', NULL, 0, NULL, NULL, NULL),
	(22, 1, NULL, 'Arewa Tees', 'Arewa tees', 'An online clothing business located at Kaduna, Nigeria, that sells plain and graphics shirts nationwide.', NULL, 'posts/November2020/KCM7raBwmAZ0fWGIzwEt.jpeg', 'arewa-tees', 'An online clothing company that sells hoodies, sweats, plain and graphics shirts.', 'Arewa, kaduna fashion, northern fashion, north arewa, arewa community, kaduna,', 'PUBLISHED', 0, '2020-11-23 09:50:02', '2021-05-28 20:20:21', 'arewatees', 'arewatees', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+234 701 922 5904', NULL, NULL, 'Suite A7, No 4 Bama Close, Off Gwari Avenue, Barnawa Kaduna', NULL, 'Nigeria', 5, 'T-shirts, clothes, shirts', 'https://api.whatsapp.com/send/?phone=2347019225904&text&app_absent=0', 0, NULL, NULL, NULL),
	(23, 1, NULL, 'Zoobashop', 'Zoobashopcom', 'A Ghanaian online retail store that sells products or items on electronics, groceries, home appliances, fashion and accessories  etc.', NULL, 'posts/November2020/9R6Oor2aYdpFahsKWkdN.jpeg', 'zoobashop', 'A Ghanaian online retail store that sells products or items on electronics, groceries, home appliances, fashion and accessories e.t.c.', 'Zoobashop, zoobashopcom, zoobashop address, zoobashop ratings', 'PUBLISHED', 0, '2020-11-24 05:50:57', '2021-05-28 20:19:54', 'goobashop', NULL, 'zoobashop.com', NULL, 'zoobashopcom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0302 - 211 - 300', 'contact@zoobashop.com', NULL, 'No 6, Zooba close', 'Ghana', 'Ghana', 16, 'Electronics, gadgets, laptops, phones, kitchen wares', NULL, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table finddbox.post_category
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE IF NOT EXISTS `post_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.post_category: ~26 rows (approximately)
DELETE FROM `post_category`;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` (`id`, `post_id`, `category_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 3, 1),
	(5, 3, 2),
	(6, 4, 1),
	(7, 9, 2),
	(8, 10, 2),
	(9, 11, 6),
	(10, 12, 2),
	(11, 12, 8),
	(12, 13, 2),
	(13, 13, 10),
	(14, 15, 9),
	(15, 14, 9),
	(16, 16, 9),
	(17, 17, 3),
	(18, 18, 9),
	(19, 19, 2),
	(20, 19, 9),
	(21, 20, 6),
	(22, 21, 2),
	(23, 22, 2),
	(24, 23, 2),
	(25, 23, 3),
	(26, 23, 9);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;

-- Dumping structure for table finddbox.post_tag
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.post_tag: ~40 rows (approximately)
DELETE FROM `post_tag`;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, NULL, NULL),
	(2, 1, 4, NULL, NULL),
	(3, 2, 3, NULL, NULL),
	(4, 2, 4, NULL, NULL),
	(5, 3, 3, NULL, NULL),
	(6, 3, 4, NULL, NULL),
	(7, 4, 3, NULL, NULL),
	(8, 9, 3, NULL, NULL),
	(9, 9, 4, NULL, NULL),
	(10, 10, 3, NULL, NULL),
	(11, 10, 4, NULL, NULL),
	(12, 11, 3, NULL, NULL),
	(13, 11, 4, NULL, NULL),
	(14, 12, 3, NULL, NULL),
	(16, 12, 6, NULL, NULL),
	(17, 13, 6, NULL, NULL),
	(18, 16, 7, NULL, NULL),
	(19, 15, 7, NULL, NULL),
	(20, 15, 9, NULL, NULL),
	(21, 15, 10, NULL, NULL),
	(22, 14, 7, NULL, NULL),
	(23, 14, 8, NULL, NULL),
	(24, 14, 9, NULL, NULL),
	(25, 18, 3, NULL, NULL),
	(26, 18, 7, NULL, NULL),
	(27, 18, 10, NULL, NULL),
	(28, 18, 18, NULL, NULL),
	(29, 14, 4, NULL, NULL),
	(30, 13, 4, NULL, NULL),
	(31, 19, 7, NULL, NULL),
	(32, 19, 9, NULL, NULL),
	(33, 20, 21, NULL, NULL),
	(34, 21, 3, NULL, NULL),
	(35, 21, 4, NULL, NULL),
	(36, 22, 3, NULL, NULL),
	(37, 23, 8, NULL, NULL),
	(38, 23, 9, NULL, NULL),
	(39, 23, 22, NULL, NULL),
	(40, 2, 22, NULL, NULL),
	(41, 2, 23, NULL, NULL);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;

-- Dumping structure for table finddbox.ratings
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `appearance` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.ratings: ~1 rows (approximately)
DELETE FROM `ratings`;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` (`id`, `user_id`, `post_id`, `rating`, `created_at`, `updated_at`, `review`, `appearance`) VALUES
	(1, 11, 3, 2.5, '2020-06-24 13:42:18', '2020-06-24 13:42:18', NULL, 0);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;

-- Dumping structure for table finddbox.recommended
DROP TABLE IF EXISTS `recommended`;
CREATE TABLE IF NOT EXISTS `recommended` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operating_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_names` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.recommended: ~1 rows (approximately)
DELETE FROM `recommended`;
/*!40000 ALTER TABLE `recommended` DISABLE KEYS */;
INSERT INTO `recommended` (`id`, `business_name`, `business_owner`, `business_email`, `business_category`, `business_phone`, `operating_location`, `country`, `company_address`, `account_names`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
	(2, 'djinpod food delivery', 'obinna iloeje', 'djinpodservices@djinpod.com', 'delivery', '+2348163463417', 'nigeria', 'worldwide', 'SSQ5 Wharf, Niger Street', 'Instagram: @djinpod', 11, '2020-06-19 07:44:36', '2020-06-19 07:44:36', 0);
/*!40000 ALTER TABLE `recommended` ENABLE KEYS */;

-- Dumping structure for table finddbox.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2020-05-02 06:57:25', '2020-05-02 06:57:25'),
	(2, 'user', 'Normal User', '2020-05-02 06:57:25', '2020-05-02 06:57:25');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table finddbox.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.settings: ~14 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Businessgrills', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Businessgrills is an global multi-platform that provides verified online businesses and services, user reviews, ratings and recommendations.', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', 'settings\\July2021\\OwoDM0zF6TOwOEolfbcR.PNG', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', 'UA-197092009-1', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Business Grills Admin', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '3745236603-tr5734j4e1cut2ft133bc67l13unktm8.apps.googleusercontent.com', '', 'text', 1, 'Admin'),
	(12, 'site.google_mail_api', 'Google mail API', NULL, NULL, 'text', 6, 'Site'),
	(14, 'site.keywords', 'Site Keywords', 'food delivery, ratings, ratings and reviews, reviews, online business, social media, social media accounts', NULL, 'text_area', 7, 'Site'),
	(15, 'site.background_image', 'Background Image', 'settings\\July2021\\9Z8syrWFP6RQawzJs3F9.png', NULL, 'image', 8, 'Site'),
	(16, 'site.welcome_title', 'Welcome Title', '<h2 class="container font-weight-bolder">Find verified online businesses that delivers to your location</h2>', NULL, 'rich_text_box', 9, 'Site');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table finddbox.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`),
  KEY `tags_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.tags: ~21 rows (approximately)
DELETE FROM `tags`;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(3, NULL, 1, '#Nigeria', 'nigeria', '2020-05-18 02:08:43', '2020-05-18 02:08:43'),
	(4, NULL, 1, '#Africa', 'africa', '2020-05-18 05:56:48', '2020-05-18 05:56:48'),
	(5, NULL, 1, '#Forex', 'forex', '2020-07-25 07:05:00', '2020-07-25 07:06:25'),
	(6, NULL, 1, '#Worldwide', 'worldwide', '2020-07-25 07:08:00', '2020-07-25 07:08:00'),
	(7, NULL, 1, '#Tech', 'tech', '2020-11-01 02:31:00', '2020-11-01 03:57:56'),
	(8, NULL, 1, '#Gadgets', 'gadgets', '2020-11-01 02:31:00', '2020-11-01 04:04:30'),
	(9, NULL, 1, '#Phones', 'phones', '2020-11-01 02:32:00', '2020-11-01 04:03:45'),
	(10, NULL, 1, '#Laptops', 'laptops', '2020-11-01 02:32:00', '2020-11-01 04:03:12'),
	(11, NULL, 1, '#Movies', 'movies', '2020-11-01 02:33:00', '2020-11-01 04:02:18'),
	(12, NULL, 1, '#Film', 'film', '2020-11-01 02:33:00', '2020-11-01 04:01:50'),
	(14, NULL, 1, '#Pictures', 'pictures', '2020-11-01 02:37:00', '2020-11-01 04:01:27'),
	(15, NULL, 1, '#Soccer', 'soccer', '2020-11-01 02:37:00', '2020-11-01 04:01:02'),
	(16, NULL, 1, '#Basketball', 'basketball', '2020-11-01 02:38:00', '2020-11-01 04:00:05'),
	(17, NULL, 1, '#Thrift', 'thrift', '2020-11-01 02:38:00', '2020-11-01 03:59:34'),
	(18, NULL, 1, '#Used', 'used', '2020-11-01 02:38:00', '2020-11-01 03:59:17'),
	(19, NULL, 1, '#Sports', 'sports', '2020-11-01 02:39:00', '2020-11-01 03:58:53'),
	(20, NULL, 1, '#Bloggers', 'bloggers', '2020-11-01 02:43:00', '2020-11-01 03:58:15'),
	(21, NULL, 1, '#Cleaners', 'cleaners', '2020-11-01 02:56:00', '2020-11-01 03:51:06'),
	(22, NULL, 1, '#Food', 'food', '2020-11-01 04:47:35', '2020-11-01 04:47:35'),
	(23, NULL, 1, '#Courier', 'courier', '2020-11-01 04:47:59', '2020-11-01 04:47:59'),
	(24, NULL, 1, '#Girls', 'girls', '2020-11-17 19:48:41', '2020-11-17 19:48:41');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table finddbox.translations
DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.translations: ~34 rows (approximately)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-05-02 06:57:56', '2020-05-02 06:57:56'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'PÃ¡gina', '2020-05-02 06:57:56', '2020-05-02 06:57:56'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-05-02 06:57:56', '2020-05-02 06:57:56'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'FunÃ§Ã£o', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'PÃ¡ginas', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-05-02 06:57:57', '2020-05-02 06:57:57'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'FunÃ§Ãµes', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(17, 'pages', 'title', 1, 'pt', 'OlÃ¡ Mundo', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(19, 'pages', 'body', 1, 'pt', '<p>OlÃ¡ Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-05-02 06:57:58', '2020-05-02 06:57:58'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(22, 'menu_items', 'title', 12, 'pt', 'PublicaÃ§Ãµes', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(25, 'menu_items', 'title', 13, 'pt', 'PÃ¡ginas', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(26, 'menu_items', 'title', 4, 'pt', 'FunÃ§Ãµes', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-05-02 06:57:59', '2020-05-02 06:57:59'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-05-02 06:58:00', '2020-05-02 06:58:00'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-05-02 06:58:00', '2020-05-02 06:58:00'),
	(30, 'menu_items', 'title', 10, 'pt', 'ConfiguraÃ§Ãµes', '2020-05-02 06:58:00', '2020-05-02 06:58:00'),
	(31, 'categories', 'slug', 4, 'pt', 'categoria-1', '2020-05-30 05:39:39', '2020-05-30 05:39:39'),
	(32, 'categories', 'name', 4, 'pt', 'Categoria 1', '2020-05-30 05:39:39', '2020-05-30 05:39:39'),
	(33, 'categories', 'slug', 5, 'pt', 'categoria-2', '2020-05-30 05:39:39', '2020-05-30 05:39:39'),
	(34, 'categories', 'name', 5, 'pt', 'Categoria 2', '2020-05-30 05:39:39', '2020-05-30 05:39:39');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table finddbox.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating_id` bigint(20) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '"Nigeria"',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_google_id_unique` (`google_id`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.users: ~15 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `google_id`, `rating_id`, `location`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$guUqIgml1QtJ441w.XNqG.VqxxQjen3hi9GUQ8PReZbwj.X.2FSWy', 'wPLlJc1332KNjqDkhcvWD4jpm9lwZ1Kyefi5kH07vMJQ160K2jSy6ZMLUo9k', NULL, '2020-05-02 06:57:48', '2020-05-02 06:57:48', NULL, NULL, NULL),
	(34, 2, 'hHPkjwaVcIDONe', 'coryale844@gmail.com', 'users/default.png', NULL, '$2y$10$Dgey9RXYK2CIWzm7awhVC.48Kn8KU94LCUFZ1OrXMSB72dlmbctOC', NULL, NULL, '2020-08-01 23:28:01', '2020-08-01 23:28:01', NULL, NULL, '"Nigeria"'),
	(35, 2, 'DJINPOD', 'djinpodservices@gmail.com', 'users/default.png', NULL, '$2y$10$LLJIamWNpEX1GLJZop64COx7prOCCdNawL5lSCM.xCjGbqPOL0ppe', NULL, NULL, '2020-08-02 20:28:01', '2020-08-02 20:28:01', NULL, NULL, '"Nigeria"'),
	(36, 2, 'GkAYjVWlzBC', 'marybridges5254@gmail.com', 'users/default.png', NULL, '$2y$10$bBHowZG8bx9zeu188l5I/edUD.CGtecconUs6pOj1acwWUoqNsddi', NULL, NULL, '2020-08-21 10:45:05', '2020-08-21 10:45:05', NULL, NULL, '"Nigeria"'),
	(37, 2, 'MUAXYhpnkR', 'bb316635@gmail.com', 'users/default.png', NULL, '$2y$10$PT/R/fKCdIR8EPFf7uOPguykz3v1v1/HHJj4mQWGfI3/dBrBJ/DaW', NULL, NULL, '2020-09-24 03:01:40', '2020-09-24 03:01:40', NULL, NULL, '"Nigeria"'),
	(38, 2, 'TtQIsLMUA', 'neyschedcal26@gmail.com', 'users/default.png', NULL, '$2y$10$g2ChHyABO1/eB.H5tPemOuEJ2I4pcQ0fdINVdCEvSbHp79o/ddkxS', NULL, NULL, '2020-10-09 16:30:21', '2020-10-09 16:30:21', NULL, NULL, '"Nigeria"'),
	(39, 2, 'tOwhCiqjPTfvUly', 'quirpriescy@gmail.com', 'users/default.png', NULL, '$2y$10$JYDDGUhbvZ1w6A3qm0D7/O3zNkgvOaC4ggSkS3Bnf5vuKVRbcXq8O', NULL, NULL, '2020-10-22 09:10:37', '2020-10-22 09:10:37', NULL, NULL, '"Nigeria"'),
	(40, 2, 'CNuelcijFOgbtD', 'grayaldous0@gmail.com', 'users/default.png', NULL, '$2y$10$fkMOjcINtYZhSWOPO34O9e6G836yxcIwCAm4FHFmDhmuwepN/GHaK', NULL, NULL, '2020-11-05 10:43:12', '2020-11-05 10:43:12', NULL, NULL, '"Nigeria"'),
	(43, 2, 'Obinna', 'iloejeobinna@gmail.com', 'users/default.png', '2020-11-15 05:40:45', '$2y$10$oHWQxP1ibQfqzO4eZFPVDupbo1/k.C.j.M6DzMDCKC9yeF/kuL4o.', 'RcaufzjzMshEXadXnw11MN0WeVOrS9esaoHnn3CdzpTIVwkTaFz3JnvW1d3r', NULL, '2020-11-15 05:39:58', '2020-11-15 05:40:45', NULL, NULL, '"Nigeria"'),
	(44, 2, 'vFaEWBdSbloYGyM', 'aracmoas@gmail.com', 'users/default.png', NULL, '$2y$10$Xl6rmQWBzKLUUKZWyfuUW.8YbiS1KnpjYdUKQARDJTjdxwENBuZxC', NULL, NULL, '2020-11-21 01:06:47', '2020-11-21 01:06:47', NULL, NULL, '"Nigeria"'),
	(45, 2, 'hjEMwFCI', 'terencemerritt799@gmail.com', 'users/default.png', NULL, '$2y$10$7MAdXHJfyT9yB5zX2I8ybewgiXKvtdYVU29ape0eI0g4Ldiwo4pXy', NULL, NULL, '2020-12-23 10:37:35', '2020-12-23 10:37:35', NULL, NULL, '"Nigeria"'),
	(46, 2, 'kfOjBgUZR', 'colleenjordan8757@gmail.com', 'users/default.png', NULL, '$2y$10$c1Vb6mb3enqbAMMXHD7cBe8vhzoOTJYl1Dk54BmTKW.kiik8H5Q6C', NULL, NULL, '2021-01-21 21:20:36', '2021-01-21 21:20:36', NULL, NULL, '"Nigeria"'),
	(47, 2, 'JdFCAHURSmMGlZ', 'goodwinqzv00@gmail.com', 'users/default.png', NULL, '$2y$10$qpC1Mfp9Zp7FWvJoorWKE.HUyMUYAzQYKMS4icKkz8IUAHNZ2LNAe', NULL, NULL, '2021-02-18 04:02:28', '2021-02-18 04:02:28', NULL, NULL, '"Nigeria"'),
	(48, 2, 'KwtcaPjHhVLRyn', 'anthonynewman3565@gmail.com', 'users/default.png', NULL, '$2y$10$rVMFo7pWVdRrDQK7t241Se5qTautxNDnhXkedqO8FMf4RK4OjHn/2', NULL, NULL, '2021-03-03 06:30:20', '2021-03-03 06:30:20', NULL, NULL, '"Nigeria"'),
	(49, 2, 'tOlBwXIvrpemL', 'oliverfowler6331@gmail.com', 'users/default.png', NULL, '$2y$10$qnroP.acoN99Ma3BVZN/keecfoQgk9bXTV0tqndDQxG8whas5GIv.', NULL, NULL, '2021-03-27 13:18:26', '2021-03-27 13:18:26', NULL, NULL, '"Nigeria"');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table finddbox.userslike
DROP TABLE IF EXISTS `userslike`;
CREATE TABLE IF NOT EXISTS `userslike` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `business_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operating_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.userslike: ~2 rows (approximately)
DELETE FROM `userslike`;
/*!40000 ALTER TABLE `userslike` DISABLE KEYS */;
INSERT INTO `userslike` (`id`, `user_id`, `instagram`, `twitter`, `facebook`, `web_link`, `created_at`, `updated_at`, `business_category`, `brief`, `country`, `operating_location`) VALUES
	(1, 11, NULL, NULL, NULL, NULL, '2020-06-26 15:53:07', '2020-06-26 15:53:07', 'Adventure', NULL, 'central-african-republic', 'worldwide'),
	(2, 11, 'djinpod', 'djinpod', 'https://www.facebook.com/djinpod', 'http://www.djinpod.com', '2020-06-26 16:42:07', '2020-06-26 16:42:07', 'Delivery', NULL, 'Nigeria', 'worldwide');
/*!40000 ALTER TABLE `userslike` ENABLE KEYS */;

-- Dumping structure for table finddbox.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table finddbox.user_roles: ~0 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
