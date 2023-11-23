-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2023 at 12:50 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21403001_ecommercedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_user_id` int(11) NOT NULL,
  `cart_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name_en` varchar(50) NOT NULL,
  `categories_name_ar` varchar(50) NOT NULL,
  `categories_name_fr` varchar(50) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_date_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name_en`, `categories_name_ar`, `categories_name_fr`, `categories_image`, `categories_date_time`) VALUES
(1, 'Phones', 'الهواتف', 'Portables', 'phone.svg', '2023-10-22'),
(2, 'Laptops', 'كمبيوتر ', 'Ordinateurs', 'laptop.svg', '2023-10-22'),
(3, 'Cameras', 'كاميرات', 'Camèras', 'camera.svg', '2023-10-22'),
(4, 'Shoes', 'أحذية', 'Chaussures', 'shoe.svg', '2023-10-22'),
(5, 'Dresses', 'فساتين', 'Robes', 'dress.svg', '2023-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorites_id` int(11) NOT NULL,
  `favorites_user_id` int(11) NOT NULL,
  `favorites_items_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name_en` varchar(50) NOT NULL,
  `items_name_ar` varchar(50) NOT NULL,
  `items_name_fr` varchar(50) NOT NULL,
  `items_desc_en` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_desc_fr` varchar(255) NOT NULL,
  `items_date_time` date NOT NULL DEFAULT current_timestamp(),
  `items_active` tinyint(4) NOT NULL DEFAULT 1,
  `items_discount` smallint(6) NOT NULL,
  `items_count` smallint(6) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_price` float NOT NULL,
  `items_categories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name_en`, `items_name_ar`, `items_name_fr`, `items_desc_en`, `items_desc_ar`, `items_desc_fr`, `items_date_time`, `items_active`, `items_discount`, `items_count`, `items_image`, `items_price`, `items_categories`) VALUES
(1, 'Poco F5', ' F5 بوكو', 'Poco F5', 'It Has amoled Screen 6.67inches, 120 Hz,A Qualcomm Snapdragon CPU 7+ Gen 2, RAM/Storage 12GB/256GB, Camera 64 megapixels, 8 megapixels, and 2 megapixels and Battery 5000 mAh with a power of 67 watts.', 'يحتوي على شاشة AMOLED مقاس 6.67 بوصة، وتردد 120 هرتز، ووحدة المعالجة المركزية Qualcomm Snapdragon 7+ Gen 2، وذاكرة الوصول العشوائي/التخزين 12 جيجابايت/256 جيجابايت، وكاميرا 64 ميجابكسل، و8 ميجابكسل، و2 ميجابكسل، وبطارية 5000 مللي أمبير بقوة 67 واط.', 'Il possède un écran AMOLED de 6,67 pouces, 120 Hz, un processeur Qualcomm Snapdragon 7+ Gen 2, une RAM/stockage de 12 Go/256 Go, un appareil photo de 64 mégapixels, 8 mégapixels et 2 mégapixels et une batterie de 5 000 mAh d\'une puissance de 67 watts.', '2023-10-23', 1, 30, 20, 'pocof5.png', 230, 1),
(2, 'Poco x3 pro', ' x3 pro بوكو', 'Poco x3 pro', 'LCD Screen with 120 Hz,A Qualcomm Snapdragon 860, RAM/Storage 6GB/128GB, Camera 64 megapixels, 8 megapixels, and 2 megapixels and Battery 5100 mAh with a power of 67 watts.', 'شاشة بتردد 120 هرتز، ومعالج سنابدراجون 860، وذاكرة الوصول العشوائي/التخزين سعة 6 جيجابايت/128 جيجابايت، وكاميرات بدقة 64 ميجابكسل + 8 ميجابكسل + 2 ميجابكسل، وبطارية بقوة 5100 مللي أمبير في الساعة بقدرة 67 وات في الساعة.', 'Un écran LCD de 120 Hz,A Qualcomm Snapdragon 860, RAM/Stockage 6GB/128GB, Appareil photo 64 mégapixels, 8 mégapixels et 2 mégapixels et batterie 5100 mAh d\'une puissance de 67 watts.', '2023-10-23', 1, 0, 10, 'pocox3pro.png', 120, 1),
(3, 'HP 840 G1', 'HP 840 G1', 'HP 840 G1', '- Intel Core i5 4210U 2.4GHz CPU, 8 Go DDR4 RAM and 240 Go SSD\r\nIntégrée Intel HD 4400 graphics card, Bluetooth version 4.0 and screen LCD  14 inch.\r\n- USB 3.0 / 3.1 ports, RJ-45/Ethernet port, and SD memory card reader', '- وحدة المعالجة المركزية Intel Core i5 4210U بسرعة 2.4 جيجا هرتز، وذاكرة الوصول العشوائي 8 Go DDR4 و240 Go SSD\r\nرسومات Intel HD 4400 مدمجة وبلوتوث v4.0 وشاشة LCD مقاس 14 بوصة.\r\n- منافذ USB 3.0/3.1، ومنفذ RJ-45/Ethernet، وقارئ بطاقة الذاكرة SD،', '- Processeur Intel Core i5 4210U 2,4 GHz, 8 Go de RAM DDR4 et 240 Go SSD\r\nGraphique Intel HD 4400 intégré, Bluetooth v4.0 et écran LCD de 14 pouces.\r\n- Ports USB 3.0/3.1, port RJ-45/Ethernet et lecteur de carte mémoire SD,', '2023-10-23', 1, 10, 100, 'hp840g1.png', 300, 2),
(4, 'realme 11 pro', 'ريلمي 11 برو', 'realme 11 pro', 'Screen 6.7 inches - 120 Hz - AMOLED\r\n    \r\n    Memory 256 or 512 GB\r\n    \r\n     RAM 8 or 12 GB\r\n    \r\n     Camera 100 + 2 megapixel\r\n    \r\n     Mediatek Dimensity 7050 processor\r\n    \r\n     Battery 5000 mAh - 67 Wh\r\n', ' الشاشة 6.7 بوصة - 120 هرتز - AMOLED\r\n    \r\n   الذاكرة  256 أو 512 جيجابايت\r\n    \r\n    الرام  8أو 12 جيجابايت\r\n    \r\n    الكاميرا 100 + 2 ميجابكسل\r\n    \r\n    المعالج Mediatek Dimensity 7050\r\n    \r\n    البطارية 5000 مللي أمبير - 67 واط\r\n', 'Écran 6,7 pouces - 120 Hz - AMOLED\r\n    \r\n    Mémoire 256 ou 512 Go\r\n    \r\n     RAM 8 ou 12 Go\r\n    \r\n     Appareil photo 100 + 2 mégapixels\r\n    \r\n     Processeur Mediatek Dimensity 7050\r\n    \r\n     Batterie 5000 mAh - 67 Wh', '2023-10-31', 1, 0, 10, 'realme11pro.png', 290, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsView`
-- (See below for the actual view)
--
CREATE TABLE `itemsView` (
`items_id` int(11)
,`items_name_en` varchar(50)
,`items_name_ar` varchar(50)
,`items_name_fr` varchar(50)
,`items_desc_en` varchar(255)
,`items_desc_ar` varchar(255)
,`items_desc_fr` varchar(255)
,`items_date_time` date
,`items_active` tinyint(4)
,`items_discount` smallint(6)
,`items_count` smallint(6)
,`items_image` varchar(255)
,`items_price` float
,`items_categories` int(11)
,`categories_id` int(11)
,`categories_name_en` varchar(50)
,`categories_name_ar` varchar(50)
,`categories_name_fr` varchar(50)
,`categories_image` varchar(255)
,`categories_date_time` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myFavorites`
-- (See below for the actual view)
--
CREATE TABLE `myFavorites` (
`items_id` int(11)
,`items_name_en` varchar(50)
,`items_name_ar` varchar(50)
,`items_name_fr` varchar(50)
,`items_desc_en` varchar(255)
,`items_desc_ar` varchar(255)
,`items_desc_fr` varchar(255)
,`items_date_time` date
,`items_active` tinyint(4)
,`items_discount` smallint(6)
,`items_count` smallint(6)
,`items_image` varchar(255)
,`items_price` float
,`items_categories` int(11)
,`favorites_id` int(11)
,`favorites_user_id` int(11)
,`favorites_items_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_verify_code` int(11) NOT NULL,
  `user_approve` tinyint(4) NOT NULL DEFAULT 0,
  `user_date_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_verify_code`, `user_approve`, `user_date_create`) VALUES
(70, 'bilal', 'baylo1557@gmail.com', '5ea86744d54899c307987b0d9ca4b30741e90ea3', 56425, 1, '2023-10-21 16:35:24'),
(76, 'bilal', 'bilalarbaoui3@gmail.com', '618e02fc80fa3a0bd41d65f5b54a11fc50426d12', 73593, 0, '2023-11-06 13:08:22'),
(77, 'bilal', 'baylo155@gmail.com', '618e02fc80fa3a0bd41d65f5b54a11fc50426d12', 79908, 0, '2023-11-06 14:01:59');

-- --------------------------------------------------------

--
-- Structure for view `itemsView`
--
DROP TABLE IF EXISTS `itemsView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21403001_bilal`@`%` SQL SECURITY DEFINER VIEW `itemsView`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name_en` AS `items_name_en`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_name_fr` AS `items_name_fr`, `items`.`items_desc_en` AS `items_desc_en`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_desc_fr` AS `items_desc_fr`, `items`.`items_date_time` AS `items_date_time`, `items`.`items_active` AS `items_active`, `items`.`items_discount` AS `items_discount`, `items`.`items_count` AS `items_count`, `items`.`items_image` AS `items_image`, `items`.`items_price` AS `items_price`, `items`.`items_categories` AS `items_categories`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name_en` AS `categories_name_en`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_name_fr` AS `categories_name_fr`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_date_time` AS `categories_date_time` FROM (`items` join `categories` on(`items`.`items_categories` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `myFavorites`
--
DROP TABLE IF EXISTS `myFavorites`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21403001_bilal`@`%` SQL SECURITY DEFINER VIEW `myFavorites`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name_en` AS `items_name_en`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_name_fr` AS `items_name_fr`, `items`.`items_desc_en` AS `items_desc_en`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_desc_fr` AS `items_desc_fr`, `items`.`items_date_time` AS `items_date_time`, `items`.`items_active` AS `items_active`, `items`.`items_discount` AS `items_discount`, `items`.`items_count` AS `items_count`, `items`.`items_image` AS `items_image`, `items`.`items_price` AS `items_price`, `items`.`items_categories` AS `items_categories`, `favorites`.`favorites_id` AS `favorites_id`, `favorites`.`favorites_user_id` AS `favorites_user_id`, `favorites`.`favorites_items_id` AS `favorites_items_id` FROM (`items` join `favorites` on(`items`.`items_id` = `favorites`.`favorites_items_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_item_id` (`cart_item_id`),
  ADD KEY `cart_user_id` (`cart_user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorites_id`),
  ADD KEY `favorites_items_id` (`favorites_items_id`),
  ADD KEY `favorites_user_id` (`favorites_user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_categories` (`items_categories`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorites_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`favorites_items_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`favorites_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_categories`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;