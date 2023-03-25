-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 25, 2023 at 06:22 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `crt_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `crt_name` varchar(30) NOT NULL,
  `crt_price` int(11) NOT NULL,
  `crt_qty` int(11) NOT NULL,
  `crt_image` varchar(256) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`c_id`, `c_name`) VALUES
(1, 'Breads and Buns'),
(2, 'Cakes'),
(3, 'Chocolates');

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `p_id` int(10) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `p_image` varchar(256) NOT NULL,
  `p_price` int(100) NOT NULL,
  `p_status` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`p_id`, `p_name`, `category`, `p_image`, `p_price`, `p_status`, `date`) VALUES
(1, 'Pav Bhaji Bread', 1, 'pavbhajibread.jpeg', 34, 'instock', '2022-12-03 16:21:05'),
(2, 'Dabeli Bread', 1, 'dabeli-pav.jpg', 36, 'instock', '2022-09-16 00:00:00'),
(3, 'Burger Buns', 1, 'burgerbun.jpg', 40, 'instock', '2022-09-16 00:00:00'),
(4, 'Cadbury Silk', 3, 'dmsilk.jpeg', 80, 'instock', '2022-10-15 14:27:44'),
(5, 'Amul Chocolate', 3, 'amuldc.jpeg', 50, 'instock', '2022-09-16 00:00:00'),
(6, 'MrBeastBar', 3, 'mrbeast.jpeg', 100, 'instock', '2022-09-16 00:00:00'),
(7, 'Royal Chocolate', 2, 'royalch.jpeg', 450, 'instock', '2022-09-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblstock`
--

CREATE TABLE `tblstock` (
  `st_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `avl_stock` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblstock`
--

INSERT INTO `tblstock` (`st_id`, `p_id`, `avl_stock`, `date`) VALUES
(1, 1, 40, '2023-03-20 09:54:55'),
(11, 2, 0, '2023-03-21 11:35:02'),
(12, 6, 100, '2023-03-20 09:55:35'),
(13, 3, 6, '2023-03-21 11:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `user` char(10) NOT NULL,
  `status` char(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `name`, `email`, `password`, `contact`, `user`, `status`, `date`) VALUES
(1, 'deep', 'deep@gm.co', 'deep@123', 2937864, 'admin', 'active', '0000-00-00 00:00:00'),
(2, 'deal', 'deal@da.c', 'dkn@fnk', 232324, 'admin', 'active', '0000-00-00 00:00:00'),
(3, 'dfbbdsj', 'sfbjb@ng.com', 'shdnmkis', 1234567890, 'customer', 'inactive', '0000-00-00 00:00:00'),
(4, 'dsdv', 'sbdkjb@nd.cs', 'sdbkiapiio', 9283615670, 'customer', 'active', '0000-00-00 00:00:00'),
(5, 'shvdjhc', 'sjdgf@dbfj.coo', 'hsvdhvjabd', 7534645267, 'customer', 'inactive', '0000-00-00 00:00:00'),
(6, 'Preet', 'preet@ans.com', 'sdvhsvish', 8126738729, 'customer', 'active', '0000-00-00 00:00:00'),
(7, 'deep', 'deep@gmail.com', 'deep@123', 1234567890, 'customer', 'inactive', '0000-00-00 00:00:00'),
(8, 'Pratham', '20bmiit031@gmail.com', 'Pratham27', 1234567890, 'customer', 'active', '0000-00-00 00:00:00'),
(9, 'Preet', 'preet@gmail.com', 'Preet@123', 1234567890, 'customer', 'active', '0000-00-00 00:00:00'),
(11, 'Deep', 'deep@gmail.com', 'deep@123', 9823970927, 'customer', 'active', '0000-00-00 00:00:00'),
(12, 'Deep', '20bmiit@gm.com', 'deep@123', 9834736747, 'customer', 'inactive', '0000-00-00 00:00:00'),
(14, 'Noob', 'noob@abc.com', 'noob@123', 9773567890, 'customer', 'active', '0000-00-00 00:00:00'),
(15, 'noob', 'noob1@gmail.com', 'confirmke', 8736659808, 'customer', 'inactive', '0000-00-00 00:00:00'),
(16, 'Preet', 'Preet@gm.co', 'Preet@008', 9624430118, 'customer', 'active', '0000-00-00 00:00:00'),
(18, 'Jigna Solanki', 'jigna.solanki@utu.ac.in', 'kibhit@13', 9876543210, 'customer', 'inactive', '0000-00-00 00:00:00'),
(20, 'Shivam', 'shivam@gmail.com', 'UMFV1y4B6eG9FjQROdJJWw==', 9876543210, 'customer', 'active', '2023-03-09 01:39:17'),
(21, 'Deep', 'deepdalal20@gmail.com', '3Uk2v49MOZsr2VwHSGFytQ==', 9837465901, 'admin', 'active', '2023-03-12 01:34:19'),
(22, 'Deep', '20bmiit106@gmail.com', '3Uk2v49MOZsr2VwHSGFytQ==', 8909879065, 'customer', 'active', '2023-03-22 06:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `tblwishlist`
--

CREATE TABLE `tblwishlist` (
  `wl_id` int(11) NOT NULL,
  `u_id` int(10) NOT NULL,
  `wl_name` varchar(30) NOT NULL,
  `wl_price` int(11) NOT NULL,
  `wl_image` varchar(256) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`crt_id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `category_id` (`category`);

--
-- Indexes for table `tblstock`
--
ALTER TABLE `tblstock`
  ADD PRIMARY KEY (`st_id`),
  ADD KEY `product_id` (`p_id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblwishlist`
--
ALTER TABLE `tblwishlist`
  ADD PRIMARY KEY (`wl_id`),
  ADD KEY `user` (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `crt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblstock`
--
ALTER TABLE `tblstock`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblwishlist`
--
ALTER TABLE `tblwishlist`
  MODIFY `wl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category`) REFERENCES `tblcategory` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblstock`
--
ALTER TABLE `tblstock`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`p_id`) REFERENCES `tblproduct` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblwishlist`
--
ALTER TABLE `tblwishlist`
  ADD CONSTRAINT `user` FOREIGN KEY (`u_id`) REFERENCES `tbluser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
