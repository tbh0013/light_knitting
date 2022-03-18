-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2022-03-11 11:07:22
-- サーバのバージョン： 10.4.21-MariaDB
-- PHP のバージョン: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `knit_shop`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL COMMENT 'カテゴリーID',
  `name` varchar(255) NOT NULL COMMENT 'カテゴリー名',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カテゴリー';

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'socks', 0, '2022-02-07 14:53:50', '2022-02-07 15:35:36'),
(2, 'knit hat', 0, '2022-02-07 15:37:03', '2022-02-07 15:37:03'),
(3, 'gloves', 0, '2022-02-07 15:39:28', '2022-02-07 15:39:28'),
(4, 'bag', 0, '2022-02-07 15:39:28', '2022-02-07 15:39:28'),
(5, 'stall', 0, '2022-02-07 15:39:28', '2022-02-07 15:39:28');

-- --------------------------------------------------------

--
-- テーブルの構造 `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL COMMENT 'お問い合わせID',
  `name` varchar(255) DEFAULT NULL COMMENT '名前',
  `tel` varchar(255) DEFAULT NULL COMMENT '電話番号',
  `mail` varchar(255) DEFAULT NULL COMMENT 'メールアドレス',
  `title` varchar(255) DEFAULT NULL COMMENT '件名',
  `message` text DEFAULT NULL COMMENT 'お問い合わせ内容',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='お問い合わせ';

--
-- テーブルのデータのダンプ `contacts`
--

INSERT INTO `contacts` (`contact_id`, `name`, `tel`, `mail`, `title`, `message`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'test', '0', 'test@test', 'testです', 'テストです', 0, '2022-03-11 10:05:08', '2022-03-11 10:05:08');

-- --------------------------------------------------------

--
-- テーブルの構造 `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL COMMENT 'ニュースID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `date` datetime DEFAULT NULL COMMENT '日付',
  `title` varchar(255) DEFAULT NULL COMMENT 'タイトル',
  `text` text DEFAULT NULL COMMENT '内容',
  `image_path` varchar(255) DEFAULT NULL COMMENT '画像パス',
  `url` varchar(255) DEFAULT NULL COMMENT 'リンク',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ニュース';

--
-- テーブルのデータのダンプ `news`
--

INSERT INTO `news` (`news_id`, `product_id`, `date`, `title`, `text`, `image_path`, `url`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 0, '2021-12-01 00:00:00', 'instgram開始', 'instgram公式アカウント始めました！', './img/news_pic1.png', 'https://www.instagram.com/', 0, '2022-02-08 02:37:52', '2022-03-03 08:19:04'),
(2, 1, '2021-11-01 00:00:00', 'socks追加', 'socks追加しました！', './img/news_pic2.jpg', NULL, 0, '2022-02-08 03:13:40', '2022-03-03 06:41:48'),
(3, 9, '2021-10-01 00:00:00', 'bag追加', 'bag追加しました！', './img/news_pic3.jpg', NULL, 0, '2022-02-08 03:26:09', '2022-03-03 06:42:23'),
(4, 8, '2021-09-01 00:00:00', 'gloves追加', 'gloves追加しました！', './img/news_pic4.jpg', NULL, 0, '2022-02-08 03:29:26', '2022-03-03 06:42:51'),
(5, 7, '2021-08-01 00:00:00', 'knit hat追加', 'knit hat追加しました！', './img/news_pic5.jpg', NULL, 0, '2022-02-08 03:31:47', '2022-03-03 06:43:24'),
(6, 0, '2021-07-01 00:00:00', 'twitter開始', 'Twitter公式アカウント始めました！', './img/news_pic6.png', 'https://twitter.com/?lang=ja', 0, '2022-02-08 03:31:47', '2022-03-03 08:21:19');

-- --------------------------------------------------------

--
-- テーブルの構造 `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL COMMENT '注文ID',
  `customer_name` varchar(255) NOT NULL COMMENT 'お客様名',
  `mail` varchar(255) NOT NULL COMMENT 'メールアドレス',
  `post_code` int(11) DEFAULT NULL COMMENT '郵便番号',
  `address` varchar(255) DEFAULT NULL COMMENT '住所',
  `tel` varchar(255) DEFAULT NULL COMMENT '電話番号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注文';

--
-- テーブルのデータのダンプ `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `mail`, `post_code`, `address`, `tel`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@test', 0, 'test', '0', 0, '2022-03-11 10:06:23', '2022-03-11 10:06:23');

-- --------------------------------------------------------

--
-- テーブルの構造 `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL COMMENT '注文明細ID',
  `order_id` int(11) NOT NULL COMMENT '注文ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `product_size_id` int(11) NOT NULL COMMENT '商品サイズID',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注文明細';

--
-- テーブルのデータのダンプ `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`, `product_size_id`, `quantity`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 0, '2022-03-11 10:06:23', '2022-03-11 10:06:23'),
(2, 1, 5, 45, 5, 0, '2022-03-11 10:06:23', '2022-03-11 10:06:23'),
(3, 1, 11, 71, 2, 0, '2022-03-11 10:06:23', '2022-03-11 10:06:23');

-- --------------------------------------------------------

--
-- テーブルの構造 `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `name` varchar(255) NOT NULL COMMENT '商品名',
  `price` int(11) NOT NULL COMMENT '値段',
  `category_id` int(11) NOT NULL COMMENT 'カテゴリID',
  `image_path` varchar(255) DEFAULT NULL COMMENT '商品画像パス',
  `sub_image_path` varchar(255) DEFAULT NULL COMMENT 'サブ商品画像パス',
  `description` varchar(255) DEFAULT NULL COMMENT '説明',
  `is_line_up` int(11) NOT NULL DEFAULT 0 COMMENT 'ラインナップフラグ',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

--
-- テーブルのデータのダンプ `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `category_id`, `image_path`, `sub_image_path`, `description`, `is_line_up`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'red socks', 2000, 1, './img/red_socks.jpg', './img/red_socks_sub.jpg', '赤い靴下', 1, 0, '2022-02-08 05:03:10', '2022-02-20 06:02:44'),
(2, ' border socks', 2000, 1, './img/border_socks.jpg', './img/border_socks_sub.jpg', 'ボーダー靴下', 1, 0, '2022-02-08 05:09:07', '2022-02-20 06:03:33'),
(3, ' orange socks', 2000, 1, './img/orange_socks.jpg', '0', 'オレンジ色の靴下', 1, 0, '2022-02-08 05:18:33', '2022-02-18 03:40:17'),
(4, ' chameleon socks', 2000, 1, './img/chameleon_socks.jpg', './img/chameleon_socks_sub.jpg', '赤と青の靴下', 1, 0, '2022-02-08 05:18:33', '2022-02-20 06:04:01'),
(5, ' blue socks', 2000, 1, './img/blue_socks.jpg', '0', '青の靴下', 1, 0, '2022-02-08 05:18:33', '2022-02-18 03:40:17'),
(6, ' purple socks', 2000, 1, './img/purple_socks.jpg', '0', '紫の靴下', 1, 0, '2022-02-08 05:18:33', '2022-02-18 03:40:17'),
(7, 'green&white knit hat', 4000, 2, './img/green&white_knit_hat.jpg', '0', '緑のニット帽と白のニット帽', 1, 0, '2022-02-08 05:37:50', '2022-02-18 03:40:17'),
(8, 'Brown&purple gloves', 4000, 3, './img/Brown&purple_gloves.jpg', '0', '茶色の手袋と紫の手袋', 1, 0, '2022-02-08 05:42:25', '2022-02-18 03:40:17'),
(9, 'green bag', 3000, 4, './img/green_bag.jpg', '0', '緑色のカバン', 1, 0, '2022-02-08 05:48:30', '2022-02-18 03:40:17'),
(10, 'border bag', 3000, 4, './img/border_bag.jpg', '0', 'ボーダー柄のカバン', 1, 0, '2022-02-08 05:48:30', '2022-02-18 03:40:17'),
(11, ' colorful bag', 3000, 4, './img/colorful_bag.jpg', '0', 'カラフル色のカバン', 1, 0, '2022-02-08 05:48:30', '2022-02-18 03:40:17'),
(12, ' wood bag', 3000, 4, './img/wood_bag.jpg', '0', '麻のカバン', 1, 0, '2022-02-08 05:48:30', '2022-02-18 03:40:17'),
(13, ' white bag', 3000, 4, './img/white_bag.jpg', '0', '白いカバン', 1, 0, '2022-02-08 05:48:30', '2022-02-18 03:40:17'),
(14, ' colorful stall', 3500, 5, './img/colorful_stall.jpg', '0', 'カラフル色のストール', 1, 0, '2022-02-08 05:50:38', '2022-02-18 03:40:17');

-- --------------------------------------------------------

--
-- テーブルの構造 `product_sizes`
--

CREATE TABLE `product_sizes` (
  `product_size_id` int(11) NOT NULL COMMENT '商品サイズID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `size_id` int(11) NOT NULL COMMENT 'サイズID',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品サイズ';

--
-- テーブルのデータのダンプ `product_sizes`
--

INSERT INTO `product_sizes` (`product_size_id`, `product_id`, `size_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(0, 0, 0, 0, '2022-02-24 07:39:58', '2022-02-24 07:39:58'),
(1, 1, 1, 0, '2022-02-08 05:57:59', '2022-02-08 05:57:59'),
(2, 1, 2, 0, '2022-02-08 05:58:36', '2022-02-08 05:58:36'),
(3, 1, 3, 0, '2022-02-08 05:59:51', '2022-02-08 05:59:51'),
(4, 1, 4, 0, '2022-02-08 05:59:51', '2022-02-08 05:59:51'),
(5, 1, 5, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(6, 1, 6, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(7, 1, 7, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(8, 1, 8, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(9, 1, 9, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(10, 1, 10, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(11, 1, 11, 0, '2022-02-08 05:59:52', '2022-02-08 05:59:52'),
(12, 2, 1, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(13, 2, 2, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(14, 2, 3, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(15, 2, 4, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(16, 2, 5, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(17, 2, 6, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(18, 2, 7, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(19, 2, 8, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(20, 2, 9, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(21, 2, 10, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(22, 2, 11, 0, '2022-02-08 06:01:14', '2022-02-08 06:01:14'),
(23, 3, 1, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(24, 3, 2, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(25, 3, 3, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(26, 3, 4, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(27, 3, 5, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(28, 3, 6, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(29, 3, 7, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(30, 3, 8, 0, '2022-02-08 06:02:19', '2022-02-08 06:02:19'),
(31, 3, 9, 0, '2022-02-08 06:02:20', '2022-02-08 06:02:20'),
(32, 3, 10, 0, '2022-02-08 06:02:20', '2022-02-08 06:02:20'),
(33, 3, 11, 0, '2022-02-08 06:02:20', '2022-02-08 06:02:20'),
(34, 4, 1, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(35, 4, 2, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(36, 4, 3, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(37, 4, 4, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(38, 4, 5, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(39, 4, 6, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(40, 4, 7, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(41, 4, 8, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(42, 4, 9, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(43, 4, 10, 0, '2022-02-08 06:03:36', '2022-02-08 06:03:36'),
(44, 4, 11, 0, '2022-02-08 06:03:37', '2022-02-08 06:03:37'),
(45, 5, 1, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(46, 5, 2, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(47, 5, 3, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(48, 5, 4, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(49, 5, 5, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(50, 5, 6, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(51, 5, 7, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(52, 5, 8, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(53, 5, 9, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(54, 5, 10, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(55, 5, 11, 0, '2022-02-08 06:05:33', '2022-02-08 06:05:33'),
(56, 6, 1, 0, '2022-02-08 06:06:21', '2022-02-08 06:06:21'),
(57, 6, 2, 0, '2022-02-08 06:06:21', '2022-02-08 06:06:21'),
(58, 6, 3, 0, '2022-02-08 06:06:21', '2022-02-08 06:06:21'),
(59, 6, 4, 0, '2022-02-08 06:06:21', '2022-02-08 06:06:21'),
(60, 6, 5, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(61, 6, 6, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(62, 6, 7, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(63, 6, 8, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(64, 6, 9, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(65, 6, 10, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(66, 6, 11, 0, '2022-02-08 06:06:22', '2022-02-08 06:06:22'),
(67, 7, 0, 0, '2022-02-24 07:41:03', '2022-02-24 07:41:03'),
(68, 8, 0, 0, '2022-02-24 07:43:16', '2022-02-24 07:43:16'),
(69, 9, 0, 0, '2022-02-24 07:44:10', '2022-02-24 07:44:10'),
(70, 10, 0, 0, '2022-02-24 07:44:22', '2022-02-24 07:44:22'),
(71, 11, 0, 0, '2022-02-24 07:44:35', '2022-02-24 07:44:35'),
(72, 12, 0, 0, '2022-02-24 07:44:43', '2022-02-24 07:44:43'),
(73, 13, 0, 0, '2022-02-24 07:44:51', '2022-02-24 07:44:51'),
(74, 14, 0, 0, '2022-02-24 07:45:05', '2022-02-24 07:45:05');

-- --------------------------------------------------------

--
-- テーブルの構造 `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL COMMENT 'サイズID',
  `size_name` varchar(255) NOT NULL COMMENT 'サイズ名',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '登録日付',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='サイズ';

--
-- テーブルのデータのダンプ `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, '23.0', 0, '2022-02-08 04:50:47', '2022-02-08 04:50:47'),
(2, '23.5', 0, '2022-02-08 04:52:55', '2022-02-08 04:52:55'),
(3, '24.0', 0, '2022-02-08 04:52:55', '2022-02-08 04:52:55'),
(4, '24.5', 0, '2022-02-08 04:52:55', '2022-02-08 04:52:55'),
(5, '25.0', 0, '2022-02-08 04:52:55', '2022-02-08 04:52:55'),
(6, '25.5', 0, '2022-02-08 04:52:55', '2022-02-08 04:52:55'),
(7, '26.0', 0, '2022-02-08 04:52:56', '2022-02-08 04:52:56'),
(8, '26.5', 0, '2022-02-08 04:52:56', '2022-02-08 04:52:56'),
(9, '27.0', 0, '2022-02-08 04:52:56', '2022-02-08 04:52:56'),
(10, '27.5', 0, '2022-02-08 04:52:56', '2022-02-08 04:52:56'),
(11, '28.0', 0, '2022-02-08 04:52:56', '2022-02-08 04:52:56');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- テーブルのインデックス `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- テーブルのインデックス `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- テーブルのインデックス `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- テーブルのインデックス `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- テーブルのインデックス `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- テーブルのインデックス `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`product_size_id`);

--
-- テーブルのインデックス `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'お問い合わせID', AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '注文ID', AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '注文明細ID', AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サイズID', AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;