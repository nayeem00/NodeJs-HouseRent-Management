-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2017 at 03:34 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `houserent`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `AreaId` int(11) NOT NULL,
  `AreaName` varchar(255) NOT NULL,
  `SurroundingArea` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`AreaId`, `AreaName`, `SurroundingArea`) VALUES
(1, 'Mirpur-10', 'Mirpur-2,Mipur-13,Mirpur-11,Kazipara,Purobi'),
(2, 'Mirpur-1', 'Mirpur-2,Technical'),
(3, 'Mirpur-14', 'Kochukhet,Vashantek,Mirpur-13,Kafrul'),
(4, 'ECB chottor', 'Matikata,Kalsi,Manikdi,Cantonment'),
(5, 'Kalsi', 'Purobi,Pallabi,Mirpur-12,Mirpur-11'),
(6, 'Purobi', 'Mirpur-11,Kalsi,Pallabi,Mirpur-10');

-- --------------------------------------------------------

--
-- Table structure for table `commnet`
--

CREATE TABLE `commnet` (
  `id` int(11) NOT NULL,
  `postId` int(5) NOT NULL,
  `userId` int(5) NOT NULL,
  `Commnet` varchar(255) NOT NULL,
  `Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commnet`
--

INSERT INTO `commnet` (`id`, `postId`, `userId`, `Commnet`, `Time`) VALUES
(1, 11, 3, 'hhh', '2017-03-12 18:46:03'),
(2, 11, 3, 'hhh', '2017-03-12 18:46:29'),
(3, 11, 3, 'hello', '2017-03-12 18:46:45'),
(4, 19, 3, 'brocan u please reduce the price?', '2017-03-12 18:53:13'),
(5, 19, 8, 'NO', '2017-03-12 19:00:40'),
(6, 11, 3, 'vai vara ta ektu koman??', '2017-03-12 21:54:37'),
(7, 22, 1, 'vai vara komano jabe??', '2017-03-12 22:15:42'),
(8, 26, 1, 'Bachalor chai :D', '2017-03-12 23:21:12'),
(9, 33, 1, 'Price Fixed?', '2017-03-13 19:28:12'),
(10, 24, 1, 'hello ?\r\n', '2017-03-13 20:07:37'),
(11, 34, 17, 'Wow house ???? Rent ta ektu kom hobena? ????', '2017-03-13 23:49:37'),
(12, 43, 20, '???', '2017-03-21 01:09:42'),
(13, 43, 20, '???', '2017-03-21 01:10:32'),
(14, 43, 20, '???', '2017-03-21 01:10:35'),
(15, 42, 20, 'Number off bro', '2017-03-21 01:11:16'),
(16, 43, 20, 'hello', '2017-03-21 01:15:46'),
(17, 41, 20, 'rent komano jabe?', '2017-03-21 01:24:08'),
(18, 43, 1, 'this is test', '2017-05-03 04:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `PostId` int(11) NOT NULL,
  `HouseName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `Floor` varchar(255) NOT NULL,
  `BedRoom` int(2) NOT NULL,
  `Kitchen` int(1) NOT NULL,
  `Dining` int(1) NOT NULL,
  `Drawing` int(1) NOT NULL,
  `Additional` varchar(255) NOT NULL DEFAULT 'Not Available',
  `Category` varchar(255) NOT NULL,
  `Approval` int(1) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ApprovedDate` datetime DEFAULT NULL,
  `CreatedBy` int(5) NOT NULL,
  `Area` int(5) NOT NULL,
  `HireStatus` int(1) NOT NULL DEFAULT '0',
  `UpdatedDate` datetime DEFAULT NULL,
  `Rent` int(11) NOT NULL,
  `RentStatus` varchar(255) NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`PostId`, `HouseName`, `Address`, `PhoneNumber`, `Floor`, `BedRoom`, `Kitchen`, `Dining`, `Drawing`, `Additional`, `Category`, `Approval`, `CreatedDate`, `ApprovedDate`, `CreatedBy`, `Area`, `HireStatus`, `UpdatedDate`, `Rent`, `RentStatus`, `Image`) VALUES
(20, 'Rokeya mansion', '10c,mirpur-10', '01777868686', '2nd', 3, 1, 1, 0, '', 'Family', 0, '2017-03-12 22:05:36', NULL, 10, 1, 0, NULL, 25000, 'Negotiable', '1489334736images.jpg'),
(21, 'sharnolota', '12/1,mirpur-1', '01521438573', '1st', 3, 1, 1, 1, '', 'Family', 1, '2017-03-12 22:08:31', NULL, 10, 2, 0, NULL, 16000, 'Fixed', '1489334911d9703a9c-7bd6-4f34-8ef2-783bcf21e9e7.s2.jpg'),
(22, 'Tisha Mansion', '1/b,mirpur-10', '01521438573', '1st', 4, 1, 1, 1, '', 'Family', 1, '2017-03-12 22:11:16', NULL, 11, 1, 0, NULL, 18500, 'Negotiable', '1489335076a1bd93c2-6359-463a-a85f-bf7369012e69.s2.jpg'),
(23, 'Putul Mansion', '12/b,mirpur-1', '01777868686', '1st', 4, 1, 1, 1, '', 'Family', 1, '2017-03-12 22:12:34', '2017-03-12 23:46:59', 11, 2, 0, NULL, 19500, 'Negotiable', '1489335154d9703a9c-7bd6-4f34-8ef2-783bcf21e9e7.s2.jpg'),
(25, 'Rose Cottage', 'Britain', '01681081820', '3rd', 4, 1, 1, 1, 'NA', 'Family,Bachelor', 1, '2017-03-12 23:10:39', NULL, 12, 1, 0, NULL, 160000, 'Negotiable', '1489338639images (1).jpg'),
(26, 'White House', 'Dhaka', '01681081820', '1st', 5, 1, 1, 1, 'NA', 'Family', 1, '2017-03-12 23:13:27', NULL, 12, 1, 0, NULL, 200000000, 'Negotiable', '1489338807white(2).jpg'),
(27, 'Haven Cottage', 'Dhaka', '01681081820', '5th', 4, 1, 1, 1, 'NA', 'Family,Bachelor', 1, '2017-03-12 23:16:04', NULL, 12, 1, 0, NULL, 15000, 'Fixed', '1489338964nice-flat-20.jpg'),
(28, 'nazmul', 'ecb cottor,(haat er dan e) lake er soja', '01937921124', '4', 4, 1, 1, 0, '', 'Family', 1, '2017-03-12 23:35:01', NULL, 13, 4, 0, NULL, 40000, 'Fixed', '1489340101taj-mahal.jpeg'),
(29, 'Purnima', 'Kalshi Road, Mirpur', '01688008800', 'Full House', 7, 1, 1, 1, 'New House', 'Family,Bachelor', 1, '2017-03-12 23:35:18', NULL, 14, 5, 0, NULL, 30000, 'Fixed', '1489340118b166328e82a488eea596232c43d1a055.jpg'),
(30, 'Samsu Garden', 'Purobi, Mirpur 12', '01788008800', '1st', 4, 1, 1, 1, '', 'Family', 1, '2017-03-12 23:37:00', NULL, 14, 6, 0, NULL, 25000, 'Fixed', '1489340220house-005.jpg'),
(31, 'songsod villa', 'kalsi te ase pondit vai er misty er dokaner pichone', '01937921124', '2', 8, 1, 1, 0, '', 'Family', 1, '2017-03-12 23:37:52', NULL, 13, 5, 0, NULL, 50250, 'Fixed', '1489340272waye_sangshad_2.jpg'),
(32, 'habu kutir', 'bus stand( kuddus vai ke jiggas korle bole dibe) ', '01937921124', '9', 4, 1, 1, 0, '', 'Family,Bachelor', 1, '2017-03-12 23:41:17', NULL, 16, 6, 0, NULL, 20599, 'Negotiable', '1489340477maxresdefault.jpg'),
(33, 'Morjina Garden', 'Ecb Chottor', '01888008800', 'Full House', 6, 1, 1, 1, '', 'Family', 1, '2017-03-12 23:41:17', NULL, 15, 4, 0, NULL, 40000, 'Fixed', '1489340477exterior11.jpg'),
(34, 'Anowara Manson', 'Ecb Chottor', '01521212324', 'Full House', 7, 1, 1, 1, '', 'Family', 1, '2017-03-12 23:42:44', NULL, 15, 4, 0, NULL, 50000, 'Fixed', '1489340564b166328e82a488eea596232c43d1a055.jpg'),
(35, 'Hasina khaleda villa', 'songsod vhoboner pichone', '01937921124', '6', 7, 0, 0, 0, '', 'Family,Bachelor,Office', 1, '2017-03-12 23:44:06', NULL, 16, 3, 0, NULL, 999, 'Fixed', '1489340646bangabhaban_dhaka_bangladesh.jpg'),
(36, 'Reza Villa', 'Ta-64, Panir Tank', '01937352600', '1st', 4, 1, 1, 1, '', 'Family,Bachelor', 1, '2017-03-13 23:43:32', '2017-03-13 23:22:11', 17, 5, 0, NULL, 50000, 'Fixed', '1489427012Magnificent-Vertically-Built-Architecture-with-Beautiful-Scenery-Views.jpg'),
(37, 'Pisa Villa', 'Pisa Tower, road no-7, ecb chottor, Dhaka', '01937352600', '2nd', 5, 1, 1, 1, '', 'Bachelor', 1, '2017-03-13 23:47:15', '2017-03-13 18:50:02', 17, 4, 0, NULL, 40000, 'Fixed', '1489427235images.jpg'),
(39, 'Chandrima', 'Kalsi morer daner goli', '01743349711', '1st', 3, 1, 1, 0, 'Bla bla', 'Family,Bachelor', 1, '2017-03-14 04:06:15', '2017-03-13 23:22:03', 3, 5, 0, '2017-03-21 00:41:27', 17000, 'Fixed', '1489442775HL_k1j01_7_677x380_FitToBoxSmallDimension_Center.jpg'),
(40, 'Aksh villa', 'Islami bank er samne', '01785236985', '8th floor', 4, 1, 1, 1, 'Lift nai', 'Family,Bachelor,Office', 1, '2017-03-14 04:08:12', '2017-03-13 23:21:58', 3, 6, 0, '2017-03-21 00:41:27', 21500, 'Fixed', '1489442892images.jpg'),
(41, 'Tipu Manjil', 'Police line', '01743349521', '11', 4, 1, 1, 1, 'Bla', 'Family,Bachelor,Office', 1, '2017-03-14 04:13:02', '2017-03-13 23:21:54', 18, 3, 0, '2017-03-13 23:19:03', 25000, 'Negotiable', '148944318238664842.jpg'),
(42, 'RHAMAN PALACE', 'Sony hall', '01743349711', '3rd', 2, 1, 1, 0, 'Bla bla', 'Family,Bachelor', 1, '2017-03-14 04:14:48', '2017-03-13 23:21:48', 18, 2, 0, NULL, 12000, 'Fixed', '1489443288Presidential-Suite-BedroomJPG.jpg'),
(43, 'Cindrella cottage', 'Sagufta', '01743349711', '4th', 2, 1, 1, 0, 'Alltime electricity ', 'Family,Bachelor', 1, '2017-03-14 04:16:59', '2017-03-13 23:21:43', 18, 5, 0, NULL, 17000, 'Fixed', '1489443419HL_stanking_6_677x380_FitToBoxSmallDimension_Center.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `searchhistory`
--

CREATE TABLE `searchhistory` (
  `Id` int(11) NOT NULL,
  `Keyword` varchar(255) NOT NULL,
  `SearchTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ip` varchar(255) NOT NULL,
  `RoomFilter` varchar(256) NOT NULL,
  `CategoryFilter` varchar(256) NOT NULL,
  `PriceFilter` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `searchhistory`
--

INSERT INTO `searchhistory` (`Id`, `Keyword`, `SearchTime`, `Ip`, `RoomFilter`, `CategoryFilter`, `PriceFilter`) VALUES
(1, '', '2017-03-13 14:42:56', '192.168.0.116', '', 'Office', ''),
(2, 'Mirpur-10', '2017-03-13 14:47:04', '192.168.0.116', '', '', ''),
(3, 'Mirpur-10', '2017-03-13 14:47:10', '192.168.0.116', '2', 'Family', '10000-15000'),
(4, 'Mirpur-1', '2017-03-13 15:45:36', '192.168.0.111', '', '', ''),
(5, 'ECB chottor', '2017-03-13 18:47:55', '192.168.0.102', '', '', ''),
(6, 'ECB chottor', '2017-03-13 18:48:14', '192.168.0.102', '3', '', '20000-999999999'),
(7, 'ECB chottor', '2017-03-13 18:48:22', '192.168.0.102', '', '', ''),
(8, 'ECB chottor', '2017-03-13 18:48:24', '192.168.0.102', '', '', ''),
(9, 'ECB chottor', '2017-03-13 18:48:48', '192.168.0.102', '3', '', '20000-999999999'),
(10, '', '2017-03-13 18:50:21', '192.168.0.116', '4', 'Family', '20000-999999999'),
(11, 'Mirpur-10', '2017-03-13 20:09:20', '192.168.0.116', '', '', ''),
(12, 'Mirpur-10', '2017-03-13 20:10:23', '192.168.0.116', '', '', ''),
(13, 'Mirpur-10', '2017-03-13 20:10:24', '192.168.0.116', '', '', ''),
(14, 'Mirpur-10', '2017-03-13 20:11:00', '192.168.0.116', '', '', ''),
(15, 'Mirpur-10', '2017-03-13 20:12:35', '192.168.0.116', '', '', ''),
(16, 'Mirpur-10', '2017-03-13 20:12:44', '192.168.0.116', '', '', ''),
(17, 'Mirpur-10', '2017-03-13 20:13:17', '192.168.0.116', '', '', ''),
(18, 'Mirpur-10', '2017-03-13 20:21:35', '192.168.0.116', '', '', ''),
(19, 'Mirpur-10', '2017-03-13 20:22:53', '192.168.0.116', '', '', ''),
(20, 'Mirpur-10', '2017-03-13 20:23:42', '192.168.0.116', '', '', ''),
(21, 'Mirpur-10', '2017-03-13 20:24:10', '192.168.0.116', '', '', ''),
(22, 'Mirpur-10', '2017-03-13 20:25:41', '192.168.0.116', '', '', ''),
(23, 'Mirpur-10', '2017-03-13 20:26:43', '192.168.0.116', '', '', ''),
(24, 'Mirpur-10', '2017-03-13 20:27:09', '192.168.0.116', '', '', ''),
(25, 'Mirpur-10', '2017-03-13 20:28:13', '192.168.0.116', '', '', ''),
(26, 'Mirpur-10', '2017-03-13 20:28:14', '192.168.0.116', '', '', ''),
(27, 'Mirpur-10', '2017-03-13 20:28:37', '192.168.0.116', '', '', ''),
(28, 'Mirpur-10', '2017-03-13 20:29:53', '192.168.0.116', '', '', ''),
(29, 'Mirpur-10', '2017-03-13 20:30:39', '192.168.0.116', '', '', ''),
(30, 'Mirpur-10', '2017-03-13 20:31:34', '192.168.0.116', '', '', ''),
(31, 'Mirpur-10', '2017-03-13 20:31:49', '192.168.0.116', '', '', ''),
(32, 'Mirpur-10', '2017-03-13 20:32:11', '192.168.0.116', '', '', ''),
(33, 'Mirpur-10', '2017-03-13 20:32:42', '192.168.0.116', '', '', ''),
(34, 'Mirpur-10', '2017-03-13 20:34:42', '192.168.0.116', '', '', ''),
(35, 'Mirpur-10', '2017-03-13 20:35:50', '192.168.0.116', '', '', ''),
(36, 'Purobi', '2017-03-13 20:36:40', '192.168.0.116', '', '', ''),
(37, 'Purobih', '2017-03-13 20:37:06', '192.168.0.116', '', '', ''),
(38, 'Purobih', '2017-03-13 20:39:26', '192.168.0.116', '', '', ''),
(39, 'Purobih', '2017-03-13 20:40:25', '192.168.0.116', '', '', ''),
(40, 'Purobih', '2017-03-13 20:44:18', '192.168.0.116', '', '', ''),
(41, 'Purobi', '2017-03-13 20:44:22', '192.168.0.116', '', '', ''),
(42, 'Mirpur-10', '2017-03-13 20:45:21', '192.168.0.116', '', '', ''),
(43, 'Mirpur-10', '2017-03-13 20:46:02', '192.168.0.116', '', '', ''),
(44, 'Mirpur-10', '2017-03-13 20:46:18', '192.168.0.116', '', '', ''),
(45, 'Mirpur-10', '2017-03-13 20:50:09', '192.168.0.116', '', '', ''),
(46, 'Mirpur-10', '2017-03-13 20:50:26', '192.168.0.116', '', '', ''),
(47, 'Mirpur-10', '2017-03-13 20:51:06', '192.168.0.116', '', '', ''),
(48, 'Mirpur-10', '2017-03-13 20:51:30', '192.168.0.116', '', '', ''),
(49, 'Mirpur-10', '2017-03-13 20:52:30', '192.168.0.116', '', '', ''),
(50, 'Mirpur-10', '2017-03-13 20:53:02', '192.168.0.116', '', '', ''),
(51, 'Mirpur-10', '2017-03-13 20:53:24', '192.168.0.116', '', '', ''),
(52, 'Mirpur-10', '2017-03-13 20:53:37', '192.168.0.116', '', '', ''),
(53, 'Mirpur-10', '2017-03-13 20:54:10', '192.168.0.116', '', '', ''),
(54, 'Mirpur-10h', '2017-03-13 20:54:14', '192.168.0.116', '', '', ''),
(55, 'Mirpur-10h', '2017-03-13 20:54:33', '192.168.0.116', '', '', ''),
(56, 'Mirpur-10', '2017-03-13 20:54:37', '192.168.0.116', '', '', ''),
(57, 'Mirpur-10', '2017-03-13 21:03:19', '192.168.0.116', '', 'Bachelor', ''),
(58, 'Mirpur-10', '2017-03-13 21:09:00', '192.168.0.116', '3', '', ''),
(59, 'Mirpur-10', '2017-03-13 21:09:24', '192.168.0.116', '', 'Bachelor', ''),
(60, 'Mirpur-10', '2017-03-13 21:11:45', '192.168.0.116', '', '', ''),
(61, 'Mirpur-10', '2017-03-13 21:11:53', '192.168.0.116', '', 'Bachelor', ''),
(62, 'Mirpur-10', '2017-03-13 21:13:21', '192.168.0.116', '', '', '20000-999999999'),
(63, 'Purobi', '2017-03-13 21:14:13', '192.168.0.116', '', '', ''),
(64, 'Purobi', '2017-03-13 21:14:39', '192.168.0.116', '4', 'Bachelor', '15000-20000'),
(65, 'Purobi', '2017-03-13 21:15:26', '192.168.0.116', '4', 'Bachelor', '15000-20000'),
(66, 'Purobi', '2017-03-13 21:16:15', '192.168.0.116', '3', 'Bachelor', '15000-20000'),
(67, 'Purobi', '2017-03-13 21:19:16', '192.168.0.116', '', '', ''),
(68, 'Purobi', '2017-03-13 21:19:28', '192.168.0.116', '3', 'Bachelor', ''),
(69, 'Purobi', '2017-03-13 21:19:41', '192.168.0.116', '3', '', '15000-20000'),
(70, 'Purobi', '2017-03-13 21:20:01', '192.168.0.116', '', '', ''),
(71, 'Purobi', '2017-03-13 21:20:08', '192.168.0.116', '3', '', '15000-20000'),
(72, 'Purobi', '2017-03-13 21:20:15', '192.168.0.116', '4', '', '15000-20000'),
(73, 'Purobi', '2017-03-13 21:37:05', '192.168.0.116', '', '', ''),
(74, 'Purobi', '2017-03-13 21:45:06', '192.168.0.116', '2', '', '10000-15000'),
(75, 'Purobi', '2017-03-13 21:45:14', '192.168.0.116', '3', '', '15000-20000'),
(76, 'Purobi', '2017-03-13 21:57:07', '192.168.0.116', '', '', ''),
(77, 'Kalsi', '2017-03-13 22:03:05', '192.168.0.116', '', '', ''),
(78, 'Kalsi', '2017-03-13 22:03:17', '192.168.0.116', '', '', '15000-20000'),
(79, 'Kalsi', '2017-03-13 22:03:46', '192.168.0.116', '4', '', '20000-999999999'),
(80, 'Kalsi', '2017-03-13 22:04:03', '192.168.0.116', '3', '', '20000-999999999'),
(81, 'Kalsi', '2017-03-13 22:04:11', '192.168.0.116', '3', 'Bachelor', '20000-999999999'),
(82, 'Purobi', '2017-03-13 23:17:19', '192.168.0.100', '', '', ''),
(83, 'Purobi', '2017-03-13 23:17:55', '192.168.0.100', '', '', '10000-15000'),
(84, 'Purobi', '2017-03-13 23:18:03', '192.168.0.100', '', '', '15000-20000'),
(85, 'Purobi', '2017-03-13 23:23:06', '192.168.0.100', '', '', ''),
(86, 'Kalsi', '2017-03-13 23:23:26', '192.168.0.100', '', '', ''),
(87, 'ECB chottor', '2017-03-13 23:24:20', '192.168.0.100', '', '', ''),
(88, '', '2017-03-13 23:27:48', '192.168.0.100', '5', 'Office', '20000-999999999'),
(89, '', '2017-03-13 23:27:57', '192.168.0.100', '5', 'Family', '20000-999999999'),
(90, 'Hello', '2017-03-13 23:28:42', '192.168.0.100', '', '', ''),
(91, 'Hello????????', '2017-03-13 23:28:48', '192.168.0.100', '', '', ''),
(92, 'Hello????????', '2017-03-13 23:30:13', '192.168.0.100', '', '', ''),
(93, ') (::''', '2017-03-13 23:30:24', '192.168.0.100', '', '', ''),
(94, 'Valo basha', '2017-03-13 23:30:38', '192.168.0.100', '', '', ''),
(95, 'Mirpur-10', '2017-03-14 16:17:37', '192.168.0.116', '', '', ''),
(96, 'Mirpur-10', '2017-03-14 16:17:43', '192.168.0.116', '2', 'Family', '15000-20000'),
(97, 'Mirpur-10', '2017-03-14 16:17:56', '192.168.0.116', '2', 'Bachelor', '15000-20000'),
(98, 'Mirpur-10', '2017-03-14 16:18:12', '192.168.0.116', '3', '', '20000-999999999'),
(99, 'dd', '2017-03-19 14:45:34', '::1', '', '', ''),
(100, 'd', '2017-03-19 14:55:22', '::1', '', '', ''),
(101, '0', '2017-03-19 17:08:41', '::1', '', '', '0-5000'),
(102, 'Mirpur', '2017-03-19 17:14:51', '::1', '', '', ''),
(103, 'Mirpur', '2017-03-19 18:30:22', '::1', '2', 'Family', '10000-15000'),
(104, 'Mirpur', '2017-03-19 18:30:37', '::1', '', '', ''),
(105, 'Mir', '2017-03-19 18:30:42', '::1', '', '', ''),
(106, 'Mir', '2017-03-19 18:32:17', '::1', '4', '', ''),
(107, 'Mirpur-10', '2017-03-19 19:10:05', '192.168.0.116', '', '', ''),
(108, 'Mirpur-10', '2017-03-19 19:10:12', '192.168.0.116', '4', 'Bachelor', '15000-20000'),
(109, 'Mirpur-10', '2017-03-19 19:10:19', '192.168.0.116', '4', 'Family', '20000-999999999'),
(110, 'mir', '2017-03-19 19:10:47', '192.168.0.116', '', '', ''),
(111, 'gg', '2017-03-19 21:14:56', '::1', '', '', ''),
(112, 'text', '2017-05-03 05:30:26', '::1', '0', '', '0-9999999'),
(113, 'test2', '2017-05-03 05:32:19', '::ffff:192.168.0.118', '0', '', '0-9999999'),
(114, 'ddd', '2017-05-03 01:36:42', '::1', '', '', ''),
(115, 'kalsi', '2017-05-03 05:41:48', '::1', '0', '', '0-9999999'),
(116, 'kalsi', '2017-05-03 05:42:00', '::1', '3', '', '0-9999999'),
(117, 'kalsi', '2017-05-03 05:42:12', '::1', '0', 'Bachelor', '0-9999999'),
(118, 'kalsi', '2017-05-03 05:42:16', '::1', '3', 'Bachelor', '0-9999999'),
(119, 'kalsi', '2017-05-03 05:42:27', '::1', '0', '', '15000-20000'),
(120, 'kalsi', '2017-05-03 05:42:40', '::1', '3', 'Bachelor', '15000-20000'),
(121, 'mirpur', '2017-05-03 05:45:50', '::ffff:127.0.0.1', '0', '', '0-9999999'),
(122, 'mirpur', '2017-05-03 05:45:55', '::1', '5', 'Office', '20000-9999999'),
(123, 'Kalsi', '2017-05-03 06:03:00', '::1', '0', '', '0-9999999'),
(124, 'Kalsi', '2017-05-03 06:03:55', '::1', '0', '', '0-9999999'),
(125, 'Kalsi', '2017-05-03 06:14:04', '::1', '0', '', '0-9999999'),
(126, 'Kalsi', '2017-05-03 06:14:43', '::1', '0', '', '0-9999999'),
(127, 'Kalsi', '2017-05-03 06:16:25', '::1', '0', '', '0-9999999'),
(128, 'Kalsi', '2017-05-03 06:19:18', '::1', '0', '', '0-9999999'),
(129, 'Kalsi', '2017-05-03 06:21:09', '::1', '0', '', '0-9999999'),
(130, 'Kalsi', '2017-05-03 07:19:18', '::1', '0', '', '0-9999999'),
(131, 'Kalsi', '2017-05-03 07:22:23', '::1', '0', '', '0-9999999'),
(132, 'Kalsi', '2017-05-03 07:23:08', '::1', '0', '', '0-9999999'),
(133, 'Kalsi', '2017-05-03 07:24:24', '::1', '0', '', '0-9999999'),
(134, 'Kalsi', '2017-05-03 07:25:08', '::ffff:127.0.0.1', '0', '', '0-9999999'),
(135, 'Kalsi', '2017-05-03 07:25:55', '::1', '0', '', '0-9999999'),
(136, 'Kalsi', '2017-05-03 07:26:25', '::1', '0', '', '0-9999999'),
(137, 'Kalsi', '2017-05-03 07:26:44', '::1', '0', '', '0-9999999'),
(138, 'Kalsi', '2017-05-03 07:27:35', '::1', '0', '', '0-9999999'),
(139, 'Kalsi', '2017-05-03 07:27:44', '::1', '0', '', '0-9999999'),
(140, 'Kalsi', '2017-05-03 07:28:02', '::1', '0', '', '0-9999999'),
(141, 'Kalsi', '2017-05-03 07:29:00', '::1', '0', '', '0-9999999'),
(142, 'Kalsi', '2017-05-03 07:29:59', '::1', '0', '', '0-9999999');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `PhoneNo` varchar(255) NOT NULL,
  `UserStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `UserName`, `Password`, `FullName`, `PhoneNo`, `UserStatus`) VALUES
(1, 'nayeem', '1234', 'Nayeem Hossain', '01743349711', 'admin'),
(3, 'nayeem00', '1234', 'Nayeem Hossain', '01743349711', 'user'),
(10, 'Anower', '623452', 'Anower hasan', '01777868686', 'user'),
(11, 'Tisha', '623452', 'Tanisha Tisha', '01521438573', 'user'),
(12, 'alamgir', '123456', 'Alamgir Hossain', '01681081820', 'admin'),
(13, 'nazmul', 'magi', 'nazmul islam', '01937921124', 'user'),
(14, 'okkorali', '123456', 'Okkor Ali', '01688008800', 'user'),
(15, 'wow', '123456', 'Karim Box', '01788008800', 'user'),
(16, 'habu mia', 'habu', 'habu mia', '01937921124', 'user'),
(17, 'Rktuhinbd', '1a3g5m', 'Rejaul Karim', '01937352600', 'user'),
(18, 'nayeem0', '1234', 'Nayeem Hossain', '01743349711', 'user'),
(19, 'ValidUsername', 'ValidUsername', 'Sagor Mamun', '01846481004', 'user'),
(20, 'mm', 'mm', 'mm', '01743349711', 'user'),
(21, 'bla', 'bla', 'bla', '01743349711', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`AreaId`);

--
-- Indexes for table `commnet`
--
ALTER TABLE `commnet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostId`);

--
-- Indexes for table `searchhistory`
--
ALTER TABLE `searchhistory`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `AreaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `commnet`
--
ALTER TABLE `commnet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `searchhistory`
--
ALTER TABLE `searchhistory`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
