-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 05, 2023 at 07:54 AM
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
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `crt_name` varchar(30) NOT NULL,
  `crt_price` int(11) NOT NULL,
  `crt_qty` int(11) NOT NULL,
  `crt_image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcart`
--

INSERT INTO `tblcart` (`crt_id`, `p_id`, `u_id`, `crt_name`, `crt_price`, `crt_qty`, `crt_image`) VALUES
(38, 1, 26, 'Pav Bhaji Bread', 36, 1, 'pavbhajibread.jpeg');

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
(3, 'Chocolates'),
(21, 'Cakes');

-- --------------------------------------------------------

--
-- Table structure for table `tblord`
--

CREATE TABLE `tblord` (
  `ord_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `ord_name` varchar(30) NOT NULL,
  `ord_price` int(11) NOT NULL,
  `ord_qty` int(11) NOT NULL,
  `ord_image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblord`
--

INSERT INTO `tblord` (`ord_id`, `p_id`, `u_id`, `ord_name`, `ord_price`, `ord_qty`, `ord_image`) VALUES
(26, 1, 25, 'Pav Bhaji Bread', 50, 2, 'bakery7.jpg'),
(27, 2, 25, 'Dabeli Bread', 36, 2, 'dabeli-pav.jpg'),
(28, 6, 25, 'MrBeastBar', 100, 10, 'mrbeast.jpeg'),
(31, 1, 25, 'Pav Bhaji Bread', 36, 1, 'pavbhajibread.jpeg'),
(33, 1, 25, 'Pav Bhaji Bread', 36, 3, 'pavbhajibread.jpeg'),
(35, 6, 25, 'MrBeastBar', 100, 4, 'mrbeast.jpeg'),
(36, 1, 26, 'Pav Bhaji Bread', 36, 5, 'pavbhajibread.jpeg'),
(37, 2, 26, 'Dabeli Bread', 36, 2, 'dabeli-pav.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblorderdetail`
--

CREATE TABLE `tblorderdetail` (
  `od_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `od_name` varchar(40) NOT NULL,
  `od_email` varchar(256) NOT NULL,
  `od_address` varchar(100) NOT NULL,
  `od_city` varchar(30) NOT NULL,
  `od_state` varchar(30) NOT NULL,
  `od_pin` varchar(10) NOT NULL,
  `od_total` int(11) NOT NULL,
  `od_pay` varchar(256) NOT NULL,
  `od_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblorderdetail`
--

INSERT INTO `tblorderdetail` (`od_id`, `u_id`, `od_name`, `od_email`, `od_address`, `od_city`, `od_state`, `od_pin`, `od_total`, `od_pay`, `od_date`) VALUES
(9, 25, 'Deep', '20bmiit106@gmail.com', 'adajan', 'surat', 'gujarat', '864862', 1000, 'pay_LcKy4D9JmiMdUd', '2023-04-11 09:03:18'),
(11, 25, 'Deep', '20bmiit106@gmail.com', 'Adajan', 'Surat', 'Gujarat', '395009', 508, 'pay_LjBo8NXu57UEEm', '2023-04-28 04:38:39'),
(12, 26, 'Preet', '20bmiit036@gmail.com', 'Adajan', 'Surat', 'Gujarat', '395009', 252, 'pay_LlUZqeYGRxghOR', '2023-05-04 12:18:25');

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
(1, 'Pav Bhaji Bread', 1, 'pavbhajibread.jpeg', 36, 'instock', '2023-04-11 09:42:53'),
(2, 'Dabeli Bread', 1, 'dabeli-pav.jpg', 36, 'instock', '2022-09-16 00:00:00'),
(3, 'Burger Buns', 1, 'burgerbun.jpg', 40, 'instock', '2022-09-16 00:00:00'),
(4, 'Cadbury Silk', 3, 'dmsilk.jpeg', 80, 'instock', '2022-10-15 14:27:44'),
(5, 'Amul Chocolate', 3, 'amuldc.jpeg', 50, 'instock', '2022-09-16 00:00:00'),
(6, 'MrBeastBar', 3, 'mrbeast.jpeg', 100, 'instock', '2022-09-16 00:00:00'),
(29, 'Royal Chocolate', 21, 'choco.jpg', 450, 'instock', '2023-05-05 10:34:55');

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
(1, 1, 95, '2023-04-28 05:00:14'),
(11, 2, 1, '2023-03-25 01:26:41'),
(12, 6, 86, '2023-03-20 09:55:35'),
(13, 3, 10, '2023-04-22 01:09:44'),
(24, 4, 100, '2023-03-25 02:03:09');

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
(25, 'Deep', '20bmiit106@gmail.com', 'dd4936bf8f4c399b2bd95c07486172b5', 9823782987, 'admin', 'active', '2023-03-25 01:21:15'),
(26, 'Preet', '20bmiit036@gmail.com', '995e133d444590be582547c16a10174c', 9624430118, 'customer', 'active', '2023-03-25 01:27:33'),
(28, 'dharmaraj', 'mangroladharma11@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1234567890, 'customer', 'active', '2023-04-11 01:35:59'),
(29, 'dharma', '20bmiit078@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1234567890, 'customer', 'active', '2023-04-11 01:43:04'),
(30, 'Ayush', '20bmiit048@gmail.com', 'dd4936bf8f4c399b2bd95c07486172b5', 3947974789, 'customer', 'active', '2023-05-04 11:07:57');

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
-- Dumping data for table `tblwishlist`
--

INSERT INTO `tblwishlist` (`wl_id`, `u_id`, `wl_name`, `wl_price`, `wl_image`, `date`) VALUES
(16, 26, 'Burger Buns', 40, 'burgerbun.jpg', '2023-03-25 02:10:55'),
(20, 25, 'Royal Chocolate', 450, 'royalch.jpeg', '2023-04-28 04:33:27'),
(21, 25, 'Amul Chocolate', 50, 'amuldc.jpeg', '2023-04-28 04:33:31'),
(22, 25, 'Burger Buns', 40, 'burgerbun.jpg', '2023-04-28 04:33:38');

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
-- Indexes for table `tblord`
--
ALTER TABLE `tblord`
  ADD PRIMARY KEY (`ord_id`);

--
-- Indexes for table `tblorderdetail`
--
ALTER TABLE `tblorderdetail`
  ADD PRIMARY KEY (`od_id`);

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
  MODIFY `crt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblord`
--
ALTER TABLE `tblord`
  MODIFY `ord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tblorderdetail`
--
ALTER TABLE `tblorderdetail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblstock`
--
ALTER TABLE `tblstock`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblwishlist`
--
ALTER TABLE `tblwishlist`
  MODIFY `wl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
