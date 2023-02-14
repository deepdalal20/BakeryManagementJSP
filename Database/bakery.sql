-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 11, 2023 at 05:57 AM
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
  `category` varchar(100) NOT NULL,
  `p_image` varchar(256) NOT NULL,
  `p_price` int(100) NOT NULL,
  `p_status` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`p_id`, `p_name`, `category`, `p_image`, `p_price`, `p_status`, `date`) VALUES
(1, 'Pav Bhaji Bread', 'Breads and Buns', 'pavbhajibread.jpeg', 36, 'instock', '2022-12-03 16:21:05'),
(2, 'Dabeli Bread', 'Breads and Buns', 'dabeli-pav.jpg', 36, 'instock', '2022-09-16 00:00:00'),
(3, 'Burger Buns', 'Breads and Buns', 'burgerbun.jpg', 40, 'instock', '2022-09-16 00:00:00'),
(4, 'Cadbury Silk', 'Chocolates', 'dmsilk.jpeg', 80, 'instock', '2022-10-15 14:27:44'),
(5, 'Amul Chocolate', 'Chocolates', 'amuldc.jpeg', 50, 'instock', '2022-09-16 00:00:00'),
(6, 'MrBeastBar', 'Chocolates', 'mrbeast.jpeg', 100, 'instock', '2022-09-16 00:00:00'),
(7, 'Royal Chocolate', 'Cakes', 'royalch.jpeg', 450, 'instock', '2022-09-16 00:00:00'),
(8, '24K Gold Cake', 'Cakes', 'gold.jpeg', 300, 'instock', '2022-09-23 09:47:05'),
(9, 'Red Velvet Cake', 'Cakes', 'rvcake.jpeg', 360, 'instock', '2022-11-26 17:32:05'),
(15, 'Toast Biscuits', 'Biscuits', 'bakery2.jpg', 50, 'instock', '2022-12-03 16:21:40');

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
  `user` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `name`, `email`, `password`, `contact`, `user`) VALUES
(1, 'deep', 'deep@gm.co', 'deep@123', 2937864, 'admin'),
(2, 'deal', 'deal@da.c', 'dkn@fnk', 232324, 'customer'),
(3, 'dfbbdsj', 'sfbjb@ng.com', 'shdnmkis', 1234567890, 'customer'),
(4, 'dsdv', 'sbdkjb@nd.cs', 'sdbkiapiio', 9283615670, 'customer'),
(5, 'shvdjhc', 'sjdgf@dbfj.coo', 'hsvdhvjabd', 7534645267, 'customer'),
(6, 'Preet', 'preet@ans.com', 'sdvhsvish', 8126738729, 'customer'),
(7, 'deep', 'deep@gmail.com', 'deep@123', 1234567890, 'customer'),
(8, 'Pratham', '20bmiit031@gmail.com', 'Pratham27', 1234567890, 'customer'),
(9, 'Preet', 'preet@gmail.com', 'Preet@123', 1234567890, 'customer'),
(11, 'Deep', 'deep@gmail.com', 'deep@123', 9823970927, 'customer'),
(12, 'Deep', '20bmiit@gm.com', 'deep@123', 9834736747, 'customer'),
(14, 'Noob', 'noob@abc.com', 'noob@123', 9773567890, 'customer'),
(15, 'noob', 'noob1@gmail.com', 'confirmke', 8736659808, 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
