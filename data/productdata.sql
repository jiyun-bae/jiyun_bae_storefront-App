-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 31, 2021 at 03:13 AM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `productdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL,
  `products_content` varchar(80) NOT NULL,
  `products_name` varchar(80) NOT NULL,
  `products_price` varchar(10) NOT NULL,
  `products_avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_content`, `products_name`, `products_price`, `products_avatar`) VALUES
(1, 'rip', 'designer auto pencil rip', '$30', 'rip_designer_auto_pencil.png'),
(2, 'rip', 'node barm calamanci rip', '$25', 'rip_node_barm_calamanci.png'),
(3, 'rip', 'rose holic rip', '$35', 'rip_rose_holic.png'),
(4, 'rip', 'rose matte holic rip', '$35', 'rip_rose_matte_holic.png'),
(5, 'rip', 'sensual node barm rip', '$30', 'rip_sensual_node_barm.png'),
(6, 'rip', 'sensual vollume matte', '$25', 'rip_sensual_vollume_matte.png'),
(7, 'skin', 'age away collagenic water skin', '$53', 'skin_age_away_collagenic_water.png'),
(8, 'skin', 'aquabolic essential water skin', '$45', 'skin_aquabolic_essential_water.png'),
(9, 'skin', 'homme black perfect skin', '$55', 'skin_homme_black_perfect.png'),
(10, 'skin', 'manisiimo intensive skin', '$45', 'skin_manisiimo_intensive.png'),
(11, 'skin', 'nomme essence skin', '$50', 'skin_nomme_essence.png'),
(12, 'skin', 'signia water skin', '$62', 'skin_signia_water.png'),
(13, 'eye', 'brow designer pact', '$21', 'eye_brow_designer_pact.png'),
(14, 'eye', 'designer pencil', '$35', 'eye_designer_pencil.png'),
(15, 'eye', 'easy styling eyeliner', '$25', 'eye_easy_styling_eyeliner.png'),
(16, 'eye', 'multi palette', '$41', 'eye_multi_palette.png'),
(17, 'eye', 'rich volume mascara', '$38', 'eye_rich_volume_mascara.png'),
(18, 'eye', 'shadow duo', '$35', 'eye_shadow_duo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
