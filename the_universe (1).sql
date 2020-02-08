-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 05, 2020 at 10:38 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_universe`
--

-- --------------------------------------------------------

--
-- Table structure for table `system_message`
--

DROP TABLE IF EXISTS `system_message`;
CREATE TABLE IF NOT EXISTS `system_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_content` varchar(512) NOT NULL,
  `message_type` varchar(20) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_message`
--

INSERT INTO `system_message` (`message_id`, `message_content`, `message_type`) VALUES
(1, 'You Have Successfully Logged In!', 'alert success'),
(2, 'You have Failed To Active Jump Drive!', 'alert'),
(3, 'You have updated Your Skill!', 'alert info'),
(4, 'Jump Complete! You successfully Travelled to Your DESTINATION.', 'alert success');

-- --------------------------------------------------------

--
-- Table structure for table `univ_item`
--

DROP TABLE IF EXISTS `univ_item`;
CREATE TABLE IF NOT EXISTS `univ_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(64) NOT NULL,
  `item_description` varchar(64) NOT NULL,
  `item_type` varchar(11) NOT NULL,
  `item_rarity` int(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `univ_item`
--

INSERT INTO `univ_item` (`item_id`, `item_name`, `item_description`, `item_type`, `item_rarity`) VALUES
(1, 'Potatoes', 'What\'s tatters Precious,Boil\'em Mash\'em Stick\'em in a Stew!', 'Food', 1),
(2, 'Hope', 'At Last We have it, Anything is possible!', 'Hope', 5),
(3, 'Stink Bomb', 'Yuk!', 'Arms', 4),
(6, 'Meth', 'Everybody Loves Meth!', 'Chemical', 3),
(7, 'Unobtainium', 'Ehhhh Plot Vehicle', 'Ore', 2);

-- --------------------------------------------------------

--
-- Table structure for table `univ_market`
--

DROP TABLE IF EXISTS `univ_market`;
CREATE TABLE IF NOT EXISTS `univ_market` (
  `market_id` int(11) NOT NULL,
  `market_item_id` int(11) NOT NULL,
  `market_value` int(9) NOT NULL,
  `market_quantity` int(3) NOT NULL,
  KEY `market_id_idx` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `univ_planet`
--

DROP TABLE IF EXISTS `univ_planet`;
CREATE TABLE IF NOT EXISTS `univ_planet` (
  `planet_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) DEFAULT NULL,
  `planet_name` varchar(32) DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL,
  `planet_type` varchar(32) DEFAULT NULL,
  `planet_habit` int(1) DEFAULT NULL,
  `planet_security` int(3) DEFAULT NULL,
  `planet_x` int(3) DEFAULT NULL,
  `planet_y` int(3) DEFAULT NULL,
  `planet_z` int(3) DEFAULT NULL,
  `planet_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`planet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `univ_planet`
--

INSERT INTO `univ_planet` (`planet_id`, `system_id`, `planet_name`, `market_id`, `planet_type`, `planet_habit`, `planet_security`, `planet_x`, `planet_y`, `planet_z`, `planet_description`) VALUES
(1, 1, 'Aries 1', NULL, NULL, NULL, NULL, 25, 204, NULL, 'This is a Planet'),
(2, 1, 'Aries 2', NULL, NULL, NULL, NULL, 139, 74, NULL, 'This is a Planet'),
(3, 1, 'Aries 3', NULL, NULL, NULL, NULL, 87, 92, NULL, 'This is a Planet'),
(4, 1, 'Aries 4', NULL, NULL, NULL, NULL, 40, 102, NULL, 'This is a Planet'),
(5, 1, 'Aries 5', NULL, NULL, NULL, NULL, 78, 114, NULL, 'This is a Planet'),
(6, 1, 'Aries 6', NULL, NULL, NULL, NULL, 127, 15, NULL, 'This is a Planet'),
(7, 1, 'Aries 7', NULL, NULL, NULL, NULL, 135, 204, NULL, 'This is a Planet'),
(8, 1, 'Aries 8', NULL, NULL, NULL, NULL, 16, 151, NULL, 'This is a Planet'),
(9, 2, 'Ajax 1', NULL, NULL, NULL, NULL, 189, 213, NULL, 'This is a Planet'),
(10, 2, 'Ajax 2', NULL, NULL, NULL, NULL, 98, 24, NULL, 'This is a Planet'),
(11, 2, 'Ajax 3', NULL, NULL, NULL, NULL, 113, 118, NULL, 'This is a Planet'),
(12, 3, 'Apollo 1', NULL, NULL, NULL, NULL, 229, 126, NULL, 'This is a Planet'),
(13, 3, 'Apollo 2', NULL, NULL, NULL, NULL, 211, 95, NULL, 'This is a Planet'),
(14, 3, 'Apollo 3', NULL, NULL, NULL, NULL, 208, 115, NULL, 'This is a Planet'),
(15, 3, 'Apollo 4', NULL, NULL, NULL, NULL, 82, 154, NULL, 'This is a Planet'),
(16, 4, 'Castor 1', NULL, NULL, NULL, NULL, 160, 49, NULL, 'This is a Planet'),
(17, 4, 'Castor 2', NULL, NULL, NULL, NULL, 37, 200, NULL, 'This is a Planet'),
(18, 4, 'Castor 3', NULL, NULL, NULL, NULL, 175, 95, NULL, 'This is a Planet'),
(19, 5, 'Daemon 1', NULL, NULL, NULL, NULL, 228, 144, NULL, 'This is a Planet'),
(20, 5, 'Daemon 2', NULL, NULL, NULL, NULL, 106, 76, NULL, 'This is a Planet'),
(21, 5, 'Daemon 3', NULL, NULL, NULL, NULL, 134, 161, NULL, 'This is a Planet'),
(22, 5, 'Daemon 4', NULL, NULL, NULL, NULL, 64, 113, NULL, 'This is a Planet'),
(23, 6, 'Hermes 1', NULL, NULL, NULL, NULL, 23, 189, NULL, 'This is a Planet'),
(24, 6, 'Hermes 2', NULL, NULL, NULL, NULL, 133, 128, NULL, 'This is a Planet'),
(25, 6, 'Hermes 3', NULL, NULL, NULL, NULL, 164, 186, NULL, 'This is a Planet'),
(26, 7, 'Theseus 1', NULL, NULL, NULL, NULL, 49, 54, NULL, 'This is a Planet'),
(27, 7, 'Theseus 2', NULL, NULL, NULL, NULL, 25, 168, NULL, 'This is a Planet'),
(28, 7, 'Theseus 3', NULL, NULL, NULL, NULL, 191, 240, NULL, 'This is a Planet'),
(29, 7, 'Theseus 4', NULL, NULL, NULL, NULL, 134, 138, NULL, 'This is a Planet'),
(30, 7, 'Theseus 5', NULL, NULL, NULL, NULL, 215, 65, NULL, 'This is a Planet'),
(31, 7, 'Theseus 6', NULL, NULL, NULL, NULL, 122, 47, NULL, 'This is a Planet'),
(32, 7, 'Theseus 7', NULL, NULL, NULL, NULL, 201, 99, NULL, 'This is a Planet'),
(33, 7, 'Theseus 8', NULL, NULL, NULL, NULL, 10, 175, NULL, 'This is a Planet'),
(34, 7, 'Theseus 9', NULL, NULL, NULL, NULL, 112, 104, NULL, 'This is a Planet'),
(35, 8, 'Caldron 1', NULL, NULL, NULL, NULL, 151, 22, NULL, 'This is a Planet'),
(36, 8, 'Caldron 2', NULL, NULL, NULL, NULL, 145, 111, NULL, 'This is a Planet'),
(37, 8, 'Caldron 3', NULL, NULL, NULL, NULL, 101, 189, NULL, 'This is a Planet'),
(38, 8, 'Caldron 4', NULL, NULL, NULL, NULL, 78, 215, NULL, 'This is a Planet'),
(39, 8, 'Caldron 5', NULL, NULL, NULL, NULL, 38, 85, NULL, 'This is a Planet'),
(40, 8, 'Caldron 6', NULL, NULL, NULL, NULL, 24, 30, NULL, 'This is a Planet'),
(41, 8, 'Caldron 7', NULL, NULL, NULL, NULL, 99, 106, NULL, 'This is a Planet'),
(42, 8, 'Caldron 8', NULL, NULL, NULL, NULL, 61, 127, NULL, 'This is a Planet'),
(43, 9, 'Aquilla 1', NULL, NULL, NULL, NULL, 103, 151, NULL, 'This is a Planet'),
(44, 9, 'Aquilla 2', NULL, NULL, NULL, NULL, 151, 94, NULL, 'This is a Planet'),
(45, 10, 'Proteus 1', NULL, NULL, NULL, NULL, 54, 36, NULL, 'This is a Planet'),
(46, 10, 'Proteus 2', NULL, NULL, NULL, NULL, 58, 59, NULL, 'This is a Planet'),
(47, 10, 'Proteus 3', NULL, NULL, NULL, NULL, 136, 58, NULL, 'This is a Planet'),
(48, 10, 'Proteus 4', NULL, NULL, NULL, NULL, 12, 66, NULL, 'This is a Planet'),
(49, 11, 'Atlas 1', NULL, NULL, NULL, NULL, 44, 171, NULL, 'This is a Planet'),
(50, 11, 'Atlas 2', NULL, NULL, NULL, NULL, 86, 209, NULL, 'This is a Planet'),
(51, 11, 'Atlas 3', NULL, NULL, NULL, NULL, 30, 16, NULL, 'This is a Planet'),
(52, 11, 'Atlas 4', NULL, NULL, NULL, NULL, 19, 215, NULL, 'This is a Planet'),
(53, 11, 'Atlas 5', NULL, NULL, NULL, NULL, 103, 210, NULL, 'This is a Planet'),
(54, 11, 'Atlas 6', NULL, NULL, NULL, NULL, 180, 206, NULL, 'This is a Planet'),
(55, 11, 'Atlas 7', NULL, NULL, NULL, NULL, 170, 227, NULL, 'This is a Planet'),
(56, 11, 'Atlas 8', NULL, NULL, NULL, NULL, 188, 59, NULL, 'This is a Planet'),
(57, 11, 'Atlas 9', NULL, NULL, NULL, NULL, 22, 117, NULL, 'This is a Planet'),
(58, 12, 'Ailea 1', NULL, NULL, NULL, NULL, 174, 133, NULL, 'This is a Planet'),
(59, 12, 'Ailea 2', NULL, NULL, NULL, NULL, 207, 65, NULL, 'This is a Planet'),
(60, 12, 'Ailea 3', NULL, NULL, NULL, NULL, 197, 223, NULL, 'This is a Planet'),
(61, 13, 'Black 1', NULL, NULL, NULL, NULL, 137, 229, NULL, 'This is a Planet'),
(62, 13, 'Black 2', NULL, NULL, NULL, NULL, 235, 127, NULL, 'This is a Planet'),
(63, 13, 'Black 3', NULL, NULL, NULL, NULL, 47, 127, NULL, 'This is a Planet'),
(64, 13, 'Black 4', NULL, NULL, NULL, NULL, 63, 43, NULL, 'This is a Planet'),
(65, 13, 'Black 5', NULL, NULL, NULL, NULL, 217, 87, NULL, 'This is a Planet'),
(66, 13, 'Black 6', NULL, NULL, NULL, NULL, 62, 117, NULL, 'This is a Planet'),
(67, 13, 'Black 7', NULL, NULL, NULL, NULL, 93, 42, NULL, 'This is a Planet'),
(68, 14, 'Unathea 1', NULL, NULL, NULL, NULL, 82, 134, NULL, 'This is a Planet'),
(69, 14, 'Unathea 2', NULL, NULL, NULL, NULL, 87, 28, NULL, 'This is a Planet'),
(70, 14, 'Unathea 3', NULL, NULL, NULL, NULL, 146, 177, NULL, 'This is a Planet'),
(71, 15, 'Aopra 1', NULL, NULL, NULL, NULL, 203, 26, NULL, 'This is a Planet'),
(72, 15, 'Aopra 2', NULL, NULL, NULL, NULL, 203, 69, NULL, 'This is a Planet'),
(73, 15, 'Aopra 3', NULL, NULL, NULL, NULL, 85, 26, NULL, 'This is a Planet'),
(74, 15, 'Aopra 4', NULL, NULL, NULL, NULL, 239, 17, NULL, 'This is a Planet'),
(75, 15, 'Aopra 5', NULL, NULL, NULL, NULL, 150, 210, NULL, 'This is a Planet'),
(76, 15, 'Aopra 6', NULL, NULL, NULL, NULL, 193, 74, NULL, 'This is a Planet'),
(77, 16, 'Taloth 1', NULL, NULL, NULL, NULL, 103, 60, NULL, 'This is a Planet'),
(78, 16, 'Taloth 2', NULL, NULL, NULL, NULL, 59, 134, NULL, 'This is a Planet'),
(79, 16, 'Taloth 3', NULL, NULL, NULL, NULL, 150, 174, NULL, 'This is a Planet'),
(80, 16, 'Taloth 4', NULL, NULL, NULL, NULL, 14, 240, NULL, 'This is a Planet'),
(81, 16, 'Taloth 5', NULL, NULL, NULL, NULL, 234, 212, NULL, 'This is a Planet'),
(82, 16, 'Taloth 6', NULL, NULL, NULL, NULL, 204, 193, NULL, 'This is a Planet'),
(83, 16, 'Taloth 7', NULL, NULL, NULL, NULL, 147, 224, NULL, 'This is a Planet'),
(84, 16, 'Taloth 8', NULL, NULL, NULL, NULL, 133, 219, NULL, 'This is a Planet'),
(85, 16, 'Taloth 9', NULL, NULL, NULL, NULL, 25, 145, NULL, 'This is a Planet'),
(86, 16, 'Taloth 10', NULL, NULL, NULL, NULL, 110, 193, NULL, 'This is a Planet'),
(87, 17, 'Eria 1', NULL, NULL, NULL, NULL, 109, 33, NULL, 'This is a Planet'),
(88, 17, 'Eria 2', NULL, NULL, NULL, NULL, 180, 75, NULL, 'This is a Planet'),
(89, 17, 'Eria 3', NULL, NULL, NULL, NULL, 13, 216, NULL, 'This is a Planet'),
(90, 17, 'Eria 4', NULL, NULL, NULL, NULL, 85, 84, NULL, 'This is a Planet'),
(91, 17, 'Eria 5', NULL, NULL, NULL, NULL, 199, 49, NULL, 'This is a Planet'),
(92, 18, 'Mapra 1', NULL, NULL, NULL, NULL, 32, 86, NULL, 'This is a Planet'),
(93, 18, 'Mapra 2', NULL, NULL, NULL, NULL, 237, 136, NULL, 'This is a Planet'),
(94, 18, 'Mapra 3', NULL, NULL, NULL, NULL, 118, 181, NULL, 'This is a Planet'),
(95, 19, 'Naviri 1', NULL, NULL, NULL, NULL, 164, 235, NULL, 'This is a Planet'),
(96, 19, 'Naviri 2', NULL, NULL, NULL, NULL, 103, 57, NULL, 'This is a Planet'),
(97, 19, 'Naviri 3', NULL, NULL, NULL, NULL, 11, 228, NULL, 'This is a Planet'),
(98, 20, 'Haonus 1', NULL, NULL, NULL, NULL, 21, 48, NULL, 'This is a Planet'),
(99, 20, 'Haonus 2', NULL, NULL, NULL, NULL, 156, 238, NULL, 'This is a Planet'),
(100, 20, 'Haonus 3', NULL, NULL, NULL, NULL, 226, 140, NULL, 'This is a Planet'),
(101, 21, 'Kurus 1', NULL, NULL, NULL, NULL, 162, 116, NULL, 'This is a Planet'),
(102, 21, 'Kurus 2', NULL, NULL, NULL, NULL, 138, 135, NULL, 'This is a Planet'),
(103, 21, 'Kurus 3', NULL, NULL, NULL, NULL, 95, 31, NULL, 'This is a Planet'),
(104, 21, 'Kurus 4', NULL, NULL, NULL, NULL, 119, 139, NULL, 'This is a Planet'),
(105, 21, 'Kurus 5', NULL, NULL, NULL, NULL, 202, 36, NULL, 'This is a Planet'),
(106, 22, 'Aurus 1', NULL, NULL, NULL, NULL, 183, 124, NULL, 'This is a Planet'),
(107, 22, 'Aurus 2', NULL, NULL, NULL, NULL, 219, 170, NULL, 'This is a Planet'),
(108, 22, 'Aurus 3', NULL, NULL, NULL, NULL, 79, 206, NULL, 'This is a Planet'),
(109, 22, 'Aurus 4', NULL, NULL, NULL, NULL, 56, 54, NULL, 'This is a Planet'),
(110, 23, 'Diria 1', NULL, NULL, NULL, NULL, 223, 167, NULL, 'This is a Planet'),
(111, 23, 'Diria 2', NULL, NULL, NULL, NULL, 190, 171, NULL, 'This is a Planet'),
(112, 23, 'Diria 3', NULL, NULL, NULL, NULL, 54, 146, NULL, 'This is a Planet'),
(113, 23, 'Diria 4', NULL, NULL, NULL, NULL, 183, 159, NULL, 'This is a Planet'),
(114, 23, 'Diria 5', NULL, NULL, NULL, NULL, 99, 154, NULL, 'This is a Planet'),
(115, 23, 'Diria 6', NULL, NULL, NULL, NULL, 40, 128, NULL, 'This is a Planet'),
(116, 23, 'Diria 7', NULL, NULL, NULL, NULL, 206, 68, NULL, 'This is a Planet'),
(117, 23, 'Diria 8', NULL, NULL, NULL, NULL, 14, 129, NULL, 'This is a Planet'),
(118, 23, 'Diria 9', NULL, NULL, NULL, NULL, 110, 112, NULL, 'This is a Planet'),
(119, 23, 'Diria 10', NULL, NULL, NULL, NULL, 11, 97, NULL, 'This is a Planet'),
(120, 24, 'Asypso 1', NULL, NULL, NULL, NULL, 198, 211, NULL, 'This is a Planet'),
(121, 24, 'Asypso 2', NULL, NULL, NULL, NULL, 45, 22, NULL, 'This is a Planet'),
(122, 24, 'Asypso 3', NULL, NULL, NULL, NULL, 196, 138, NULL, 'This is a Planet'),
(123, 24, 'Asypso 4', NULL, NULL, NULL, NULL, 240, 194, NULL, 'This is a Planet'),
(124, 25, 'Velosia 1', NULL, NULL, NULL, NULL, 148, 170, NULL, 'This is a Planet'),
(125, 25, 'Velosia 2', NULL, NULL, NULL, NULL, 59, 173, NULL, 'This is a Planet'),
(126, 25, 'Velosia 3', NULL, NULL, NULL, NULL, 146, 145, NULL, 'This is a Planet'),
(127, 25, 'Velosia 4', NULL, NULL, NULL, NULL, 71, 196, NULL, 'This is a Planet'),
(128, 26, 'Gek 1', NULL, NULL, NULL, NULL, 121, 95, NULL, 'This is a Planet'),
(129, 26, 'Gek 2', NULL, NULL, NULL, NULL, 179, 101, NULL, 'This is a Planet'),
(130, 26, 'Gek 3', NULL, NULL, NULL, NULL, 141, 170, NULL, 'This is a Planet'),
(131, 26, 'Gek 4', NULL, NULL, NULL, NULL, 203, 198, NULL, 'This is a Planet'),
(132, 26, 'Gek 5', NULL, NULL, NULL, NULL, 174, 187, NULL, 'This is a Planet'),
(133, 26, 'Gek 6', NULL, NULL, NULL, NULL, 119, 191, NULL, 'This is a Planet'),
(134, 26, 'Gek 7', NULL, NULL, NULL, NULL, 67, 24, NULL, 'This is a Planet'),
(135, 26, 'Gek 8', NULL, NULL, NULL, NULL, 182, 129, NULL, 'This is a Planet'),
(136, 26, 'Gek 9', NULL, NULL, NULL, NULL, 15, 134, NULL, 'This is a Planet'),
(137, 27, 'Gert 1', NULL, NULL, NULL, NULL, 22, 159, NULL, 'This is a Planet'),
(138, 27, 'Gert 2', NULL, NULL, NULL, NULL, 50, 107, NULL, 'This is a Planet'),
(139, 27, 'Gert 3', NULL, NULL, NULL, NULL, 189, 236, NULL, 'This is a Planet'),
(140, 27, 'Gert 4', NULL, NULL, NULL, NULL, 179, 71, NULL, 'This is a Planet'),
(141, 27, 'Gert 5', NULL, NULL, NULL, NULL, 127, 230, NULL, 'This is a Planet'),
(142, 27, 'Gert 6', NULL, NULL, NULL, NULL, 219, 50, NULL, 'This is a Planet'),
(143, 27, 'Gert 7', NULL, NULL, NULL, NULL, 203, 75, NULL, 'This is a Planet'),
(144, 27, 'Gert 8', NULL, NULL, NULL, NULL, 19, 150, NULL, 'This is a Planet'),
(145, 28, 'Rune 1', NULL, NULL, NULL, NULL, 49, 100, NULL, 'This is a Planet'),
(146, 28, 'Rune 2', NULL, NULL, NULL, NULL, 24, 112, NULL, 'This is a Planet'),
(147, 28, 'Rune 3', NULL, NULL, NULL, NULL, 209, 35, NULL, 'This is a Planet'),
(148, 28, 'Rune 4', NULL, NULL, NULL, NULL, 41, 74, NULL, 'This is a Planet'),
(149, 28, 'Rune 5', NULL, NULL, NULL, NULL, 132, 23, NULL, 'This is a Planet'),
(150, 28, 'Rune 6', NULL, NULL, NULL, NULL, 135, 129, NULL, 'This is a Planet'),
(151, 29, 'Obion 1', NULL, NULL, NULL, NULL, 163, 16, NULL, 'This is a Planet'),
(152, 29, 'Obion 2', NULL, NULL, NULL, NULL, 64, 145, NULL, 'This is a Planet'),
(153, 29, 'Obion 3', NULL, NULL, NULL, NULL, 198, 237, NULL, 'This is a Planet'),
(154, 30, 'Freya 1', NULL, NULL, NULL, NULL, 215, 101, NULL, 'This is a Planet'),
(155, 30, 'Freya 2', NULL, NULL, NULL, NULL, 70, 111, NULL, 'This is a Planet'),
(156, 31, 'Runifile 1', NULL, NULL, NULL, NULL, 68, 171, NULL, 'This is a Planet'),
(157, 31, 'Runifile 2', NULL, NULL, NULL, NULL, 93, 143, NULL, 'This is a Planet'),
(158, 31, 'Runifile 3', NULL, NULL, NULL, NULL, 154, 216, NULL, 'This is a Planet'),
(159, 31, 'Runifile 4', NULL, NULL, NULL, NULL, 55, 69, NULL, 'This is a Planet'),
(160, 31, 'Runifile 5', NULL, NULL, NULL, NULL, 28, 66, NULL, 'This is a Planet'),
(161, 31, 'Runifile 6', NULL, NULL, NULL, NULL, 207, 43, NULL, 'This is a Planet'),
(162, 31, 'Runifile 7', NULL, NULL, NULL, NULL, 116, 175, NULL, 'This is a Planet'),
(163, 31, 'Runifile 8', NULL, NULL, NULL, NULL, 223, 228, NULL, 'This is a Planet'),
(164, 31, 'Runifile 9', NULL, NULL, NULL, NULL, 36, 190, NULL, 'This is a Planet'),
(165, 32, 'Scarrow 1', NULL, NULL, NULL, NULL, 49, 169, NULL, 'This is a Planet'),
(166, 32, 'Scarrow 2', NULL, NULL, NULL, NULL, 35, 24, NULL, 'This is a Planet'),
(167, 32, 'Scarrow 3', NULL, NULL, NULL, NULL, 19, 140, NULL, 'This is a Planet'),
(168, 32, 'Scarrow 4', NULL, NULL, NULL, NULL, 158, 174, NULL, 'This is a Planet'),
(169, 32, 'Scarrow 5', NULL, NULL, NULL, NULL, 170, 64, NULL, 'This is a Planet'),
(170, 33, 'Laibach 1', NULL, NULL, NULL, NULL, 122, 99, NULL, 'This is a Planet'),
(171, 33, 'Laibach 2', NULL, NULL, NULL, NULL, 65, 87, NULL, 'This is a Planet'),
(172, 33, 'Laibach 3', NULL, NULL, NULL, NULL, 238, 205, NULL, 'This is a Planet'),
(173, 33, 'Laibach 4', NULL, NULL, NULL, NULL, 199, 172, NULL, 'This is a Planet'),
(174, 33, 'Laibach 5', NULL, NULL, NULL, NULL, 48, 50, NULL, 'This is a Planet'),
(175, 33, 'Laibach 6', NULL, NULL, NULL, NULL, 139, 181, NULL, 'This is a Planet'),
(176, 33, 'Laibach 7', NULL, NULL, NULL, NULL, 94, 206, NULL, 'This is a Planet'),
(177, 33, 'Laibach 8', NULL, NULL, NULL, NULL, 138, 164, NULL, 'This is a Planet'),
(178, 33, 'Laibach 9', NULL, NULL, NULL, NULL, 110, 202, NULL, 'This is a Planet'),
(179, 33, 'Laibach 10', NULL, NULL, NULL, NULL, 102, 57, NULL, 'This is a Planet'),
(180, 34, 'Green 1', NULL, NULL, NULL, NULL, 18, 35, NULL, 'This is a Planet'),
(181, 34, 'Green 2', NULL, NULL, NULL, NULL, 129, 118, NULL, 'This is a Planet'),
(182, 34, 'Green 3', NULL, NULL, NULL, NULL, 185, 203, NULL, 'This is a Planet'),
(183, 34, 'Green 4', NULL, NULL, NULL, NULL, 119, 41, NULL, 'This is a Planet'),
(184, 34, 'Green 5', NULL, NULL, NULL, NULL, 177, 183, NULL, 'This is a Planet'),
(185, 34, 'Green 6', NULL, NULL, NULL, NULL, 161, 76, NULL, 'This is a Planet'),
(186, 34, 'Green 7', NULL, NULL, NULL, NULL, 72, 84, NULL, 'This is a Planet'),
(187, 35, 'Pinus 1', NULL, NULL, NULL, NULL, 141, 105, NULL, 'This is a Planet'),
(188, 35, 'Pinus 2', NULL, NULL, NULL, NULL, 239, 193, NULL, 'This is a Planet'),
(189, 35, 'Pinus 3', NULL, NULL, NULL, NULL, 238, 85, NULL, 'This is a Planet'),
(190, 35, 'Pinus 4', NULL, NULL, NULL, NULL, 92, 42, NULL, 'This is a Planet'),
(191, 35, 'Pinus 5', NULL, NULL, NULL, NULL, 11, 147, NULL, 'This is a Planet'),
(192, 35, 'Pinus 6', NULL, NULL, NULL, NULL, 166, 12, NULL, 'This is a Planet'),
(193, 36, 'Velos 1', NULL, NULL, NULL, NULL, 175, 143, NULL, 'This is a Planet'),
(194, 36, 'Velos 2', NULL, NULL, NULL, NULL, 27, 176, NULL, 'This is a Planet'),
(195, 36, 'Velos 3', NULL, NULL, NULL, NULL, 32, 63, NULL, 'This is a Planet'),
(196, 36, 'Velos 4', NULL, NULL, NULL, NULL, 87, 239, NULL, 'This is a Planet'),
(197, 36, 'Velos 5', NULL, NULL, NULL, NULL, 113, 36, NULL, 'This is a Planet'),
(198, 37, 'Melodrus 1', NULL, NULL, NULL, NULL, 172, 176, NULL, 'This is a Planet'),
(199, 37, 'Melodrus 2', NULL, NULL, NULL, NULL, 230, 231, NULL, 'This is a Planet'),
(200, 37, 'Melodrus 3', NULL, NULL, NULL, NULL, 240, 151, NULL, 'This is a Planet'),
(201, 37, 'Melodrus 4', NULL, NULL, NULL, NULL, 193, 207, NULL, 'This is a Planet'),
(202, 37, 'Melodrus 5', NULL, NULL, NULL, NULL, 161, 83, NULL, 'This is a Planet'),
(203, 37, 'Melodrus 6', NULL, NULL, NULL, NULL, 237, 208, NULL, 'This is a Planet'),
(204, 38, 'Frarn 1', NULL, NULL, NULL, NULL, 228, 132, NULL, 'This is a Planet'),
(205, 38, 'Frarn 2', NULL, NULL, NULL, NULL, 76, 139, NULL, 'This is a Planet'),
(206, 38, 'Frarn 3', NULL, NULL, NULL, NULL, 186, 120, NULL, 'This is a Planet'),
(207, 39, 'Hek 1', NULL, NULL, NULL, NULL, 152, 199, NULL, 'This is a Planet'),
(208, 39, 'Hek 2', NULL, NULL, NULL, NULL, 232, 217, NULL, 'This is a Planet'),
(209, 40, 'Filus 1', NULL, NULL, NULL, NULL, 175, 97, NULL, 'This is a Planet'),
(210, 40, 'Filus 2', NULL, NULL, NULL, NULL, 96, 81, NULL, 'This is a Planet'),
(211, 40, 'Filus 3', NULL, NULL, NULL, NULL, 236, 70, NULL, 'This is a Planet'),
(212, 40, 'Filus 4', NULL, NULL, NULL, NULL, 86, 95, NULL, 'This is a Planet'),
(213, 40, 'Filus 5', NULL, NULL, NULL, NULL, 88, 240, NULL, 'This is a Planet'),
(214, 40, 'Filus 6', NULL, NULL, NULL, NULL, 182, 116, NULL, 'This is a Planet'),
(215, 40, 'Filus 7', NULL, NULL, NULL, NULL, 216, 197, NULL, 'This is a Planet'),
(216, 40, 'Filus 8', NULL, NULL, NULL, NULL, 117, 137, NULL, 'This is a Planet'),
(217, 40, 'Filus 9', NULL, NULL, NULL, NULL, 64, 106, NULL, 'This is a Planet'),
(218, 41, 'Bern 1', NULL, NULL, NULL, NULL, 168, 33, NULL, 'This is a Planet'),
(219, 41, 'Bern 2', NULL, NULL, NULL, NULL, 46, 101, NULL, 'This is a Planet'),
(220, 42, 'Cern 1', NULL, NULL, NULL, NULL, 181, 187, NULL, 'This is a Planet'),
(221, 42, 'Cern 2', NULL, NULL, NULL, NULL, 206, 166, NULL, 'This is a Planet'),
(222, 42, 'Cern 3', NULL, NULL, NULL, NULL, 39, 212, NULL, 'This is a Planet'),
(223, 42, 'Cern 4', NULL, NULL, NULL, NULL, 133, 134, NULL, 'This is a Planet'),
(224, 42, 'Cern 5', NULL, NULL, NULL, NULL, 98, 79, NULL, 'This is a Planet'),
(225, 42, 'Cern 6', NULL, NULL, NULL, NULL, 26, 12, NULL, 'This is a Planet'),
(226, 42, 'Cern 7', NULL, NULL, NULL, NULL, 205, 125, NULL, 'This is a Planet'),
(227, 42, 'Cern 8', NULL, NULL, NULL, NULL, 136, 81, NULL, 'This is a Planet'),
(228, 43, 'Velum 1', NULL, NULL, NULL, NULL, 72, 152, NULL, 'This is a Planet'),
(229, 43, 'Velum 2', NULL, NULL, NULL, NULL, 57, 185, NULL, 'This is a Planet'),
(230, 43, 'Velum 3', NULL, NULL, NULL, NULL, 107, 233, NULL, 'This is a Planet'),
(231, 44, 'Sargon 1', NULL, NULL, NULL, NULL, 70, 157, NULL, 'This is a Planet'),
(232, 44, 'Sargon 2', NULL, NULL, NULL, NULL, 84, 149, NULL, 'This is a Planet'),
(233, 44, 'Sargon 3', NULL, NULL, NULL, NULL, 93, 205, NULL, 'This is a Planet'),
(234, 44, 'Sargon 4', NULL, NULL, NULL, NULL, 69, 84, NULL, 'This is a Planet'),
(235, 44, 'Sargon 5', NULL, NULL, NULL, NULL, 118, 170, NULL, 'This is a Planet'),
(236, 44, 'Sargon 6', NULL, NULL, NULL, NULL, 196, 33, NULL, 'This is a Planet'),
(237, 44, 'Sargon 7', NULL, NULL, NULL, NULL, 50, 218, NULL, 'This is a Planet'),
(238, 44, 'Sargon 8', NULL, NULL, NULL, NULL, 83, 105, NULL, 'This is a Planet'),
(239, 44, 'Sargon 9', NULL, NULL, NULL, NULL, 142, 167, NULL, 'This is a Planet'),
(240, 44, 'Sargon 10', NULL, NULL, NULL, NULL, 155, 61, NULL, 'This is a Planet'),
(241, 45, 'New Sol 1', NULL, NULL, NULL, NULL, 85, 91, NULL, 'This is a Planet'),
(242, 45, 'New Sol 2', NULL, NULL, NULL, NULL, 133, 173, NULL, 'This is a Planet'),
(243, 45, 'New Sol 3', NULL, NULL, NULL, NULL, 94, 50, NULL, 'This is a Planet'),
(244, 45, 'New Sol 4', NULL, NULL, NULL, NULL, 83, 200, NULL, 'This is a Planet'),
(245, 45, 'New Sol 5', NULL, NULL, NULL, NULL, 120, 113, NULL, 'This is a Planet'),
(246, 45, 'New Sol 6', NULL, NULL, NULL, NULL, 74, 82, NULL, 'This is a Planet'),
(247, 45, 'New Sol 7', NULL, NULL, NULL, NULL, 67, 216, NULL, 'This is a Planet'),
(248, 45, 'New Sol 8', NULL, NULL, NULL, NULL, 185, 158, NULL, 'This is a Planet'),
(249, 45, 'New Sol 9', NULL, NULL, NULL, NULL, 189, 177, NULL, 'This is a Planet'),
(250, 45, 'New Sol 10', NULL, NULL, NULL, NULL, 150, 190, NULL, 'This is a Planet'),
(251, 46, 'Grup 1', NULL, NULL, NULL, NULL, 235, 225, NULL, 'This is a Planet'),
(252, 46, 'Grup 2', NULL, NULL, NULL, NULL, 72, 211, NULL, 'This is a Planet'),
(253, 46, 'Grup 3', NULL, NULL, NULL, NULL, 86, 66, NULL, 'This is a Planet'),
(254, 47, 'Bleo 1', NULL, NULL, NULL, NULL, 15, 85, NULL, 'This is a Planet'),
(255, 47, 'Bleo 2', NULL, NULL, NULL, NULL, 17, 97, NULL, 'This is a Planet'),
(256, 47, 'Bleo 3', NULL, NULL, NULL, NULL, 206, 136, NULL, 'This is a Planet'),
(257, 47, 'Bleo 4', NULL, NULL, NULL, NULL, 25, 41, NULL, 'This is a Planet'),
(258, 47, 'Bleo 5', NULL, NULL, NULL, NULL, 150, 217, NULL, 'This is a Planet'),
(259, 47, 'Bleo 6', NULL, NULL, NULL, NULL, 127, 198, NULL, 'This is a Planet'),
(260, 47, 'Bleo 7', NULL, NULL, NULL, NULL, 157, 203, NULL, 'This is a Planet'),
(261, 47, 'Bleo 8', NULL, NULL, NULL, NULL, 116, 155, NULL, 'This is a Planet'),
(262, 47, 'Bleo 9', NULL, NULL, NULL, NULL, 190, 87, NULL, 'This is a Planet'),
(263, 48, 'Farse 1', NULL, NULL, NULL, NULL, 183, 23, NULL, 'This is a Planet'),
(264, 48, 'Farse 2', NULL, NULL, NULL, NULL, 77, 100, NULL, 'This is a Planet'),
(265, 48, 'Farse 3', NULL, NULL, NULL, NULL, 190, 149, NULL, 'This is a Planet'),
(266, 48, 'Farse 4', NULL, NULL, NULL, NULL, 204, 99, NULL, 'This is a Planet'),
(267, 48, 'Farse 5', NULL, NULL, NULL, NULL, 169, 47, NULL, 'This is a Planet'),
(268, 48, 'Farse 6', NULL, NULL, NULL, NULL, 214, 198, NULL, 'This is a Planet'),
(269, 48, 'Farse 7', NULL, NULL, NULL, NULL, 27, 114, NULL, 'This is a Planet'),
(270, 48, 'Farse 8', NULL, NULL, NULL, NULL, 185, 44, NULL, 'This is a Planet'),
(271, 48, 'Farse 9', NULL, NULL, NULL, NULL, 16, 171, NULL, 'This is a Planet'),
(272, 49, 'Rileum 1', NULL, NULL, NULL, NULL, 215, 219, NULL, 'This is a Planet'),
(273, 49, 'Rileum 2', NULL, NULL, NULL, NULL, 129, 105, NULL, 'This is a Planet'),
(274, 49, 'Rileum 3', NULL, NULL, NULL, NULL, 86, 186, NULL, 'This is a Planet'),
(275, 49, 'Rileum 4', NULL, NULL, NULL, NULL, 180, 199, NULL, 'This is a Planet'),
(276, 49, 'Rileum 5', NULL, NULL, NULL, NULL, 236, 103, NULL, 'This is a Planet'),
(277, 49, 'Rileum 6', NULL, NULL, NULL, NULL, 218, 22, NULL, 'This is a Planet'),
(278, 49, 'Rileum 7', NULL, NULL, NULL, NULL, 167, 192, NULL, 'This is a Planet'),
(279, 50, 'Astrus 1', NULL, NULL, NULL, NULL, 226, 97, NULL, 'This is a Planet'),
(280, 50, 'Astrus 2', NULL, NULL, NULL, NULL, 38, 52, NULL, 'This is a Planet'),
(281, 50, 'Astrus 3', NULL, NULL, NULL, NULL, 123, 103, NULL, 'This is a Planet'),
(282, 50, 'Astrus 4', NULL, NULL, NULL, NULL, 20, 154, NULL, 'This is a Planet'),
(283, 50, 'Astrus 5', NULL, NULL, NULL, NULL, 95, 40, NULL, 'This is a Planet'),
(284, 51, 'Nevor 1', NULL, NULL, NULL, NULL, 129, 206, NULL, 'This is a Planet'),
(285, 51, 'Nevor 2', NULL, NULL, NULL, NULL, 229, 25, NULL, 'This is a Planet'),
(286, 51, 'Nevor 3', NULL, NULL, NULL, NULL, 69, 25, NULL, 'This is a Planet'),
(287, 51, 'Nevor 4', NULL, NULL, NULL, NULL, 89, 58, NULL, 'This is a Planet'),
(288, 52, 'Felum 1', NULL, NULL, NULL, NULL, 114, 24, NULL, 'This is a Planet'),
(289, 52, 'Felum 2', NULL, NULL, NULL, NULL, 195, 228, NULL, 'This is a Planet'),
(290, 52, 'Felum 3', NULL, NULL, NULL, NULL, 32, 73, NULL, 'This is a Planet'),
(291, 52, 'Felum 4', NULL, NULL, NULL, NULL, 138, 119, NULL, 'This is a Planet'),
(292, 52, 'Felum 5', NULL, NULL, NULL, NULL, 179, 107, NULL, 'This is a Planet'),
(293, 52, 'Felum 6', NULL, NULL, NULL, NULL, 75, 63, NULL, 'This is a Planet'),
(294, 52, 'Felum 7', NULL, NULL, NULL, NULL, 172, 235, NULL, 'This is a Planet'),
(295, 52, 'Felum 8', NULL, NULL, NULL, NULL, 29, 112, NULL, 'This is a Planet'),
(296, 52, 'Felum 9', NULL, NULL, NULL, NULL, 206, 218, NULL, 'This is a Planet'),
(297, 52, 'Felum 10', NULL, NULL, NULL, NULL, 135, 201, NULL, 'This is a Planet'),
(298, 53, 'Grak 1', NULL, NULL, NULL, NULL, 138, 67, NULL, 'This is a Planet'),
(299, 53, 'Grak 2', NULL, NULL, NULL, NULL, 84, 119, NULL, 'This is a Planet'),
(300, 53, 'Grak 3', NULL, NULL, NULL, NULL, 79, 34, NULL, 'This is a Planet'),
(301, 53, 'Grak 4', NULL, NULL, NULL, NULL, 86, 166, NULL, 'This is a Planet'),
(302, 53, 'Grak 5', NULL, NULL, NULL, NULL, 147, 58, NULL, 'This is a Planet'),
(303, 53, 'Grak 6', NULL, NULL, NULL, NULL, 96, 224, NULL, 'This is a Planet'),
(304, 53, 'Grak 7', NULL, NULL, NULL, NULL, 192, 17, NULL, 'This is a Planet'),
(305, 54, 'Teitov 1', NULL, NULL, NULL, NULL, 114, 226, NULL, 'This is a Planet'),
(306, 54, 'Teitov 2', NULL, NULL, NULL, NULL, 180, 56, NULL, 'This is a Planet'),
(307, 54, 'Teitov 3', NULL, NULL, NULL, NULL, 49, 155, NULL, 'This is a Planet'),
(308, 54, 'Teitov 4', NULL, NULL, NULL, NULL, 167, 237, NULL, 'This is a Planet'),
(309, 54, 'Teitov 5', NULL, NULL, NULL, NULL, 79, 67, NULL, 'This is a Planet'),
(310, 54, 'Teitov 6', NULL, NULL, NULL, NULL, 217, 94, NULL, 'This is a Planet'),
(311, 55, 'Zenom 1', NULL, NULL, NULL, NULL, 166, 151, NULL, 'This is a Planet'),
(312, 55, 'Zenom 2', NULL, NULL, NULL, NULL, 14, 71, NULL, 'This is a Planet'),
(313, 55, 'Zenom 3', NULL, NULL, NULL, NULL, 150, 80, NULL, 'This is a Planet'),
(314, 55, 'Zenom 4', NULL, NULL, NULL, NULL, 36, 63, NULL, 'This is a Planet'),
(315, 56, 'Felnoe 1', NULL, NULL, NULL, NULL, 222, 75, NULL, 'This is a Planet'),
(316, 56, 'Felnoe 2', NULL, NULL, NULL, NULL, 29, 132, NULL, 'This is a Planet'),
(317, 56, 'Felnoe 3', NULL, NULL, NULL, NULL, 239, 128, NULL, 'This is a Planet'),
(318, 56, 'Felnoe 4', NULL, NULL, NULL, NULL, 44, 79, NULL, 'This is a Planet'),
(319, 56, 'Felnoe 5', NULL, NULL, NULL, NULL, 156, 170, NULL, 'This is a Planet'),
(320, 56, 'Felnoe 6', NULL, NULL, NULL, NULL, 215, 228, NULL, 'This is a Planet'),
(321, 56, 'Felnoe 7', NULL, NULL, NULL, NULL, 111, 135, NULL, 'This is a Planet'),
(322, 57, 'Ovecury 1', NULL, NULL, NULL, NULL, 74, 63, NULL, 'This is a Planet'),
(323, 57, 'Ovecury 2', NULL, NULL, NULL, NULL, 103, 155, NULL, 'This is a Planet'),
(324, 57, 'Ovecury 3', NULL, NULL, NULL, NULL, 37, 80, NULL, 'This is a Planet'),
(325, 57, 'Ovecury 4', NULL, NULL, NULL, NULL, 69, 195, NULL, 'This is a Planet'),
(326, 58, 'Xoalea 1', NULL, NULL, NULL, NULL, 78, 49, NULL, 'This is a Planet'),
(327, 58, 'Xoalea 2', NULL, NULL, NULL, NULL, 163, 10, NULL, 'This is a Planet'),
(328, 58, 'Xoalea 3', NULL, NULL, NULL, NULL, 199, 101, NULL, 'This is a Planet'),
(329, 58, 'Xoalea 4', NULL, NULL, NULL, NULL, 220, 232, NULL, 'This is a Planet'),
(330, 58, 'Xoalea 5', NULL, NULL, NULL, NULL, 225, 74, NULL, 'This is a Planet'),
(331, 58, 'Xoalea 6', NULL, NULL, NULL, NULL, 119, 155, NULL, 'This is a Planet'),
(332, 59, 'Chion 1', NULL, NULL, NULL, NULL, 190, 97, NULL, 'This is a Planet'),
(333, 59, 'Chion 2', NULL, NULL, NULL, NULL, 109, 111, NULL, 'This is a Planet'),
(334, 59, 'Chion 3', NULL, NULL, NULL, NULL, 172, 17, NULL, 'This is a Planet'),
(335, 59, 'Chion 4', NULL, NULL, NULL, NULL, 127, 129, NULL, 'This is a Planet'),
(336, 59, 'Chion 5', NULL, NULL, NULL, NULL, 146, 60, NULL, 'This is a Planet'),
(337, 59, 'Chion 6', NULL, NULL, NULL, NULL, 75, 50, NULL, 'This is a Planet'),
(338, 59, 'Chion 7', NULL, NULL, NULL, NULL, 73, 218, NULL, 'This is a Planet'),
(339, 59, 'Chion 8', NULL, NULL, NULL, NULL, 89, 39, NULL, 'This is a Planet'),
(340, 60, 'Oupra 1', NULL, NULL, NULL, NULL, 225, 41, NULL, 'This is a Planet'),
(341, 60, 'Oupra 2', NULL, NULL, NULL, NULL, 56, 77, NULL, 'This is a Planet'),
(342, 60, 'Oupra 3', NULL, NULL, NULL, NULL, 31, 39, NULL, 'This is a Planet'),
(343, 60, 'Oupra 4', NULL, NULL, NULL, NULL, 168, 111, NULL, 'This is a Planet'),
(344, 60, 'Oupra 5', NULL, NULL, NULL, NULL, 108, 123, NULL, 'This is a Planet'),
(345, 60, 'Oupra 6', NULL, NULL, NULL, NULL, 202, 185, NULL, 'This is a Planet'),
(346, 60, 'Oupra 7', NULL, NULL, NULL, NULL, 75, 170, NULL, 'This is a Planet'),
(347, 61, 'Zuwei 1', NULL, NULL, NULL, NULL, 238, 75, NULL, 'This is a Planet'),
(348, 61, 'Zuwei 2', NULL, NULL, NULL, NULL, 110, 11, NULL, 'This is a Planet'),
(349, 61, 'Zuwei 3', NULL, NULL, NULL, NULL, 168, 108, NULL, 'This is a Planet'),
(350, 61, 'Zuwei 4', NULL, NULL, NULL, NULL, 222, 137, NULL, 'This is a Planet'),
(351, 61, 'Zuwei 5', NULL, NULL, NULL, NULL, 106, 151, NULL, 'This is a Planet'),
(352, 61, 'Zuwei 6', NULL, NULL, NULL, NULL, 79, 196, NULL, 'This is a Planet'),
(353, 61, 'Zuwei 7', NULL, NULL, NULL, NULL, 75, 24, NULL, 'This is a Planet'),
(354, 61, 'Zuwei 8', NULL, NULL, NULL, NULL, 107, 184, NULL, 'This is a Planet'),
(355, 62, 'Saelara 1', NULL, NULL, NULL, NULL, 73, 39, NULL, 'This is a Planet'),
(356, 62, 'Saelara 2', NULL, NULL, NULL, NULL, 184, 27, NULL, 'This is a Planet'),
(357, 62, 'Saelara 3', NULL, NULL, NULL, NULL, 32, 167, NULL, 'This is a Planet'),
(358, 62, 'Saelara 4', NULL, NULL, NULL, NULL, 47, 215, NULL, 'This is a Planet'),
(359, 62, 'Saelara 5', NULL, NULL, NULL, NULL, 107, 96, NULL, 'This is a Planet'),
(360, 62, 'Saelara 6', NULL, NULL, NULL, NULL, 167, 71, NULL, 'This is a Planet'),
(361, 62, 'Saelara 7', NULL, NULL, NULL, NULL, 205, 223, NULL, 'This is a Planet'),
(362, 62, 'Saelara 8', NULL, NULL, NULL, NULL, 162, 164, NULL, 'This is a Planet'),
(363, 62, 'Saelara 9', NULL, NULL, NULL, NULL, 116, 136, NULL, 'This is a Planet'),
(364, 63, 'Chalveon 1', NULL, NULL, NULL, NULL, 210, 227, NULL, 'This is a Planet'),
(365, 63, 'Chalveon 2', NULL, NULL, NULL, NULL, 45, 103, NULL, 'This is a Planet'),
(366, 63, 'Chalveon 3', NULL, NULL, NULL, NULL, 75, 66, NULL, 'This is a Planet'),
(367, 63, 'Chalveon 4', NULL, NULL, NULL, NULL, 220, 141, NULL, 'This is a Planet'),
(368, 63, 'Chalveon 5', NULL, NULL, NULL, NULL, 133, 115, NULL, 'This is a Planet'),
(369, 63, 'Chalveon 6', NULL, NULL, NULL, NULL, 65, 169, NULL, 'This is a Planet'),
(370, 63, 'Chalveon 7', NULL, NULL, NULL, NULL, 117, 133, NULL, 'This is a Planet'),
(371, 63, 'Chalveon 8', NULL, NULL, NULL, NULL, 178, 120, NULL, 'This is a Planet'),
(372, 63, 'Chalveon 9', NULL, NULL, NULL, NULL, 105, 231, NULL, 'This is a Planet'),
(373, 63, 'Chalveon 10', NULL, NULL, NULL, NULL, 120, 45, NULL, 'This is a Planet'),
(374, 64, 'Perlos 1', NULL, NULL, NULL, NULL, 68, 58, NULL, 'This is a Planet'),
(375, 64, 'Perlos 2', NULL, NULL, NULL, NULL, 151, 136, NULL, 'This is a Planet'),
(376, 64, 'Perlos 3', NULL, NULL, NULL, NULL, 86, 118, NULL, 'This is a Planet'),
(377, 64, 'Perlos 4', NULL, NULL, NULL, NULL, 169, 56, NULL, 'This is a Planet'),
(378, 64, 'Perlos 5', NULL, NULL, NULL, NULL, 196, 229, NULL, 'This is a Planet'),
(379, 65, 'Deogawa 1', NULL, NULL, NULL, NULL, 86, 130, NULL, 'This is a Planet'),
(380, 65, 'Deogawa 2', NULL, NULL, NULL, NULL, 199, 224, NULL, 'This is a Planet'),
(381, 65, 'Deogawa 3', NULL, NULL, NULL, NULL, 143, 39, NULL, 'This is a Planet'),
(382, 65, 'Deogawa 4', NULL, NULL, NULL, NULL, 135, 211, NULL, 'This is a Planet'),
(383, 65, 'Deogawa 5', NULL, NULL, NULL, NULL, 181, 44, NULL, 'This is a Planet'),
(384, 65, 'Deogawa 6', NULL, NULL, NULL, NULL, 19, 218, NULL, 'This is a Planet'),
(385, 65, 'Deogawa 7', NULL, NULL, NULL, NULL, 220, 196, NULL, 'This is a Planet'),
(386, 66, 'Uchoth 1', NULL, NULL, NULL, NULL, 62, 153, NULL, 'This is a Planet'),
(387, 66, 'Uchoth 2', NULL, NULL, NULL, NULL, 42, 107, NULL, 'This is a Planet'),
(388, 66, 'Uchoth 3', NULL, NULL, NULL, NULL, 33, 181, NULL, 'This is a Planet'),
(389, 66, 'Uchoth 4', NULL, NULL, NULL, NULL, 215, 82, NULL, 'This is a Planet'),
(390, 66, 'Uchoth 5', NULL, NULL, NULL, NULL, 38, 201, NULL, 'This is a Planet'),
(391, 66, 'Uchoth 6', NULL, NULL, NULL, NULL, 13, 175, NULL, 'This is a Planet'),
(392, 66, 'Uchoth 7', NULL, NULL, NULL, NULL, 40, 207, NULL, 'This is a Planet'),
(393, 66, 'Uchoth 8', NULL, NULL, NULL, NULL, 37, 90, NULL, 'This is a Planet'),
(394, 66, 'Uchoth 9', NULL, NULL, NULL, NULL, 120, 74, NULL, 'This is a Planet'),
(395, 67, 'Obtalium 1', NULL, NULL, NULL, NULL, 39, 170, NULL, 'This is a Planet'),
(396, 67, 'Obtalium 2', NULL, NULL, NULL, NULL, 20, 177, NULL, 'This is a Planet'),
(397, 68, 'Vega 1', NULL, NULL, NULL, NULL, 161, 31, NULL, 'This is a Planet'),
(398, 68, 'Vega 2', NULL, NULL, NULL, NULL, 142, 220, NULL, 'This is a Planet'),
(399, 68, 'Vega 3', NULL, NULL, NULL, NULL, 19, 49, NULL, 'This is a Planet'),
(400, 69, 'Zeta 1', NULL, NULL, NULL, NULL, 197, 145, NULL, 'This is a Planet'),
(401, 69, 'Zeta 2', NULL, NULL, NULL, NULL, 12, 167, NULL, 'This is a Planet'),
(402, 69, 'Zeta 3', NULL, NULL, NULL, NULL, 37, 233, NULL, 'This is a Planet'),
(403, 69, 'Zeta 4', NULL, NULL, NULL, NULL, 76, 22, NULL, 'This is a Planet'),
(404, 70, 'Alpha 1', NULL, NULL, NULL, NULL, 202, 48, NULL, 'This is a Planet'),
(405, 70, 'Alpha 2', NULL, NULL, NULL, NULL, 215, 36, NULL, 'This is a Planet'),
(406, 70, 'Alpha 3', NULL, NULL, NULL, NULL, 107, 106, NULL, 'This is a Planet'),
(407, 70, 'Alpha 4', NULL, NULL, NULL, NULL, 218, 182, NULL, 'This is a Planet'),
(408, 70, 'Alpha 5', NULL, NULL, NULL, NULL, 39, 63, NULL, 'This is a Planet'),
(409, 70, 'Alpha 6', NULL, NULL, NULL, NULL, 12, 63, NULL, 'This is a Planet'),
(410, 70, 'Alpha 7', NULL, NULL, NULL, NULL, 78, 26, NULL, 'This is a Planet'),
(411, 71, 'Beta 1', NULL, NULL, NULL, NULL, 104, 45, NULL, 'This is a Planet'),
(412, 71, 'Beta 2', NULL, NULL, NULL, NULL, 212, 60, NULL, 'This is a Planet'),
(413, 71, 'Beta 3', NULL, NULL, NULL, NULL, 98, 131, NULL, 'This is a Planet'),
(414, 71, 'Beta 4', NULL, NULL, NULL, NULL, 121, 231, NULL, 'This is a Planet'),
(415, 71, 'Beta 5', NULL, NULL, NULL, NULL, 201, 155, NULL, 'This is a Planet'),
(416, 71, 'Beta 6', NULL, NULL, NULL, NULL, 222, 150, NULL, 'This is a Planet'),
(417, 71, 'Beta 7', NULL, NULL, NULL, NULL, 205, 168, NULL, 'This is a Planet'),
(418, 71, 'Beta 8', NULL, NULL, NULL, NULL, 18, 39, NULL, 'This is a Planet'),
(419, 71, 'Beta 9', NULL, NULL, NULL, NULL, 15, 104, NULL, 'This is a Planet'),
(420, 71, 'Beta 10', NULL, NULL, NULL, NULL, 50, 238, NULL, 'This is a Planet'),
(421, 72, 'Gamma 1', NULL, NULL, NULL, NULL, 181, 66, NULL, 'This is a Planet'),
(422, 72, 'Gamma 2', NULL, NULL, NULL, NULL, 100, 35, NULL, 'This is a Planet'),
(423, 72, 'Gamma 3', NULL, NULL, NULL, NULL, 233, 77, NULL, 'This is a Planet'),
(424, 73, 'Theta 1', NULL, NULL, NULL, NULL, 83, 177, NULL, 'This is a Planet'),
(425, 73, 'Theta 2', NULL, NULL, NULL, NULL, 39, 66, NULL, 'This is a Planet'),
(426, 73, 'Theta 3', NULL, NULL, NULL, NULL, 60, 201, NULL, 'This is a Planet'),
(427, 73, 'Theta 4', NULL, NULL, NULL, NULL, 182, 28, NULL, 'This is a Planet'),
(428, 73, 'Theta 5', NULL, NULL, NULL, NULL, 172, 144, NULL, 'This is a Planet'),
(429, 73, 'Theta 6', NULL, NULL, NULL, NULL, 168, 153, NULL, 'This is a Planet'),
(430, 73, 'Theta 7', NULL, NULL, NULL, NULL, 152, 232, NULL, 'This is a Planet'),
(431, 73, 'Theta 8', NULL, NULL, NULL, NULL, 133, 144, NULL, 'This is a Planet'),
(432, 73, 'Theta 9', NULL, NULL, NULL, NULL, 80, 109, NULL, 'This is a Planet'),
(433, 74, 'Omega 1', NULL, NULL, NULL, NULL, 205, 41, NULL, 'This is a Planet'),
(434, 74, 'Omega 2', NULL, NULL, NULL, NULL, 209, 15, NULL, 'This is a Planet'),
(435, 74, 'Omega 3', NULL, NULL, NULL, NULL, 239, 164, NULL, 'This is a Planet'),
(436, 74, 'Omega 4', NULL, NULL, NULL, NULL, 223, 144, NULL, 'This is a Planet'),
(437, 74, 'Omega 5', NULL, NULL, NULL, NULL, 109, 124, NULL, 'This is a Planet'),
(438, 74, 'Omega 6', NULL, NULL, NULL, NULL, 40, 34, NULL, 'This is a Planet'),
(439, 74, 'Omega 7', NULL, NULL, NULL, NULL, 67, 203, NULL, 'This is a Planet'),
(440, 74, 'Omega 8', NULL, NULL, NULL, NULL, 86, 141, NULL, 'This is a Planet'),
(441, 74, 'Omega 9', NULL, NULL, NULL, NULL, 19, 104, NULL, 'This is a Planet'),
(442, 74, 'Omega 10', NULL, NULL, NULL, NULL, 209, 110, NULL, 'This is a Planet'),
(443, 75, 'Vapra 1', NULL, NULL, NULL, NULL, 107, 154, NULL, 'This is a Planet'),
(444, 75, 'Vapra 2', NULL, NULL, NULL, NULL, 196, 183, NULL, 'This is a Planet'),
(445, 75, 'Vapra 3', NULL, NULL, NULL, NULL, 171, 58, NULL, 'This is a Planet'),
(446, 75, 'Vapra 4', NULL, NULL, NULL, NULL, 103, 158, NULL, 'This is a Planet'),
(447, 75, 'Vapra 5', NULL, NULL, NULL, NULL, 85, 218, NULL, 'This is a Planet'),
(448, 75, 'Vapra 6', NULL, NULL, NULL, NULL, 173, 197, NULL, 'This is a Planet'),
(449, 75, 'Vapra 7', NULL, NULL, NULL, NULL, 101, 221, NULL, 'This is a Planet'),
(450, 75, 'Vapra 8', NULL, NULL, NULL, NULL, 141, 63, NULL, 'This is a Planet'),
(451, 76, 'Bespin 1', NULL, NULL, NULL, NULL, 181, 80, NULL, 'This is a Planet'),
(452, 76, 'Bespin 2', NULL, NULL, NULL, NULL, 199, 52, NULL, 'This is a Planet'),
(453, 76, 'Bespin 3', NULL, NULL, NULL, NULL, 173, 151, NULL, 'This is a Planet'),
(454, 76, 'Bespin 4', NULL, NULL, NULL, NULL, 102, 46, NULL, 'This is a Planet'),
(455, 76, 'Bespin 5', NULL, NULL, NULL, NULL, 122, 37, NULL, 'This is a Planet'),
(456, 77, 'Vespa 1', NULL, NULL, NULL, NULL, 168, 228, NULL, 'This is a Planet'),
(457, 77, 'Vespa 2', NULL, NULL, NULL, NULL, 97, 36, NULL, 'This is a Planet'),
(458, 77, 'Vespa 3', NULL, NULL, NULL, NULL, 143, 55, NULL, 'This is a Planet'),
(459, 77, 'Vespa 4', NULL, NULL, NULL, NULL, 51, 134, NULL, 'This is a Planet'),
(460, 77, 'Vespa 5', NULL, NULL, NULL, NULL, 225, 119, NULL, 'This is a Planet'),
(461, 77, 'Vespa 6', NULL, NULL, NULL, NULL, 49, 19, NULL, 'This is a Planet'),
(462, 78, 'Igeon 1', NULL, NULL, NULL, NULL, 215, 124, NULL, 'This is a Planet'),
(463, 78, 'Igeon 2', NULL, NULL, NULL, NULL, 151, 159, NULL, 'This is a Planet'),
(464, 78, 'Igeon 3', NULL, NULL, NULL, NULL, 167, 166, NULL, 'This is a Planet'),
(465, 78, 'Igeon 4', NULL, NULL, NULL, NULL, 182, 169, NULL, 'This is a Planet'),
(466, 78, 'Igeon 5', NULL, NULL, NULL, NULL, 81, 185, NULL, 'This is a Planet'),
(467, 79, 'Ratheon 1', NULL, NULL, NULL, NULL, 83, 89, NULL, 'This is a Planet'),
(468, 79, 'Ratheon 2', NULL, NULL, NULL, NULL, 226, 13, NULL, 'This is a Planet'),
(469, 79, 'Ratheon 3', NULL, NULL, NULL, NULL, 111, 216, NULL, 'This is a Planet'),
(470, 79, 'Ratheon 4', NULL, NULL, NULL, NULL, 39, 154, NULL, 'This is a Planet'),
(471, 79, 'Ratheon 5', NULL, NULL, NULL, NULL, 104, 22, NULL, 'This is a Planet'),
(472, 79, 'Ratheon 6', NULL, NULL, NULL, NULL, 132, 12, NULL, 'This is a Planet'),
(473, 79, 'Ratheon 7', NULL, NULL, NULL, NULL, 84, 19, NULL, 'This is a Planet'),
(474, 79, 'Ratheon 8', NULL, NULL, NULL, NULL, 236, 44, NULL, 'This is a Planet'),
(475, 80, 'Celcius 1', NULL, NULL, NULL, NULL, 208, 209, NULL, 'This is a Planet'),
(476, 80, 'Celcius 2', NULL, NULL, NULL, NULL, 222, 19, NULL, 'This is a Planet'),
(477, 80, 'Celcius 3', NULL, NULL, NULL, NULL, 48, 157, NULL, 'This is a Planet'),
(478, 80, 'Celcius 4', NULL, NULL, NULL, NULL, 146, 64, NULL, 'This is a Planet'),
(479, 80, 'Celcius 5', NULL, NULL, NULL, NULL, 192, 37, NULL, 'This is a Planet'),
(480, 80, 'Celcius 6', NULL, NULL, NULL, NULL, 170, 21, NULL, 'This is a Planet'),
(481, 81, 'Musk 1', NULL, NULL, NULL, NULL, 211, 137, NULL, 'This is a Planet'),
(482, 81, 'Musk 2', NULL, NULL, NULL, NULL, 22, 224, NULL, 'This is a Planet'),
(483, 81, 'Musk 3', NULL, NULL, NULL, NULL, 13, 112, NULL, 'This is a Planet'),
(484, 81, 'Musk 4', NULL, NULL, NULL, NULL, 125, 108, NULL, 'This is a Planet'),
(485, 81, 'Musk 5', NULL, NULL, NULL, NULL, 206, 221, NULL, 'This is a Planet'),
(486, 81, 'Musk 6', NULL, NULL, NULL, NULL, 183, 107, NULL, 'This is a Planet'),
(487, 81, 'Musk 7', NULL, NULL, NULL, NULL, 234, 166, NULL, 'This is a Planet'),
(488, 81, 'Musk 8', NULL, NULL, NULL, NULL, 43, 98, NULL, 'This is a Planet'),
(489, 81, 'Musk 9', NULL, NULL, NULL, NULL, 120, 231, NULL, 'This is a Planet'),
(490, 81, 'Musk 10', NULL, NULL, NULL, NULL, 132, 75, NULL, 'This is a Planet'),
(491, 82, 'Hel 1', NULL, NULL, NULL, NULL, 126, 109, NULL, 'This is a Planet'),
(492, 82, 'Hel 2', NULL, NULL, NULL, NULL, 44, 70, NULL, 'This is a Planet'),
(493, 82, 'Hel 3', NULL, NULL, NULL, NULL, 174, 139, NULL, 'This is a Planet'),
(494, 82, 'Hel 4', NULL, NULL, NULL, NULL, 141, 189, NULL, 'This is a Planet'),
(495, 82, 'Hel 5', NULL, NULL, NULL, NULL, 166, 28, NULL, 'This is a Planet'),
(496, 82, 'Hel 6', NULL, NULL, NULL, NULL, 91, 34, NULL, 'This is a Planet'),
(497, 82, 'Hel 7', NULL, NULL, NULL, NULL, 239, 173, NULL, 'This is a Planet'),
(498, 83, 'Coliv 1', NULL, NULL, NULL, NULL, 216, 141, NULL, 'This is a Planet'),
(499, 83, 'Coliv 2', NULL, NULL, NULL, NULL, 136, 162, NULL, 'This is a Planet'),
(500, 83, 'Coliv 3', NULL, NULL, NULL, NULL, 203, 42, NULL, 'This is a Planet'),
(501, 83, 'Coliv 4', NULL, NULL, NULL, NULL, 119, 223, NULL, 'This is a Planet'),
(502, 83, 'Coliv 5', NULL, NULL, NULL, NULL, 129, 102, NULL, 'This is a Planet'),
(503, 83, 'Coliv 6', NULL, NULL, NULL, NULL, 38, 49, NULL, 'This is a Planet'),
(504, 83, 'Coliv 7', NULL, NULL, NULL, NULL, 75, 197, NULL, 'This is a Planet'),
(505, 84, 'Blerp 1', NULL, NULL, NULL, NULL, 119, 236, NULL, 'This is a Planet'),
(506, 84, 'Blerp 2', NULL, NULL, NULL, NULL, 228, 119, NULL, 'This is a Planet'),
(507, 84, 'Blerp 3', NULL, NULL, NULL, NULL, 208, 122, NULL, 'This is a Planet'),
(508, 84, 'Blerp 4', NULL, NULL, NULL, NULL, 16, 47, NULL, 'This is a Planet'),
(509, 84, 'Blerp 5', NULL, NULL, NULL, NULL, 90, 206, NULL, 'This is a Planet'),
(510, 85, 'Cacus 1', NULL, NULL, NULL, NULL, 105, 146, NULL, 'This is a Planet'),
(511, 85, 'Cacus 2', NULL, NULL, NULL, NULL, 124, 130, NULL, 'This is a Planet'),
(512, 85, 'Cacus 3', NULL, NULL, NULL, NULL, 218, 188, NULL, 'This is a Planet'),
(513, 85, 'Cacus 4', NULL, NULL, NULL, NULL, 204, 187, NULL, 'This is a Planet'),
(514, 86, 'Bismuth 1', NULL, NULL, NULL, NULL, 170, 220, NULL, 'This is a Planet'),
(515, 86, 'Bismuth 2', NULL, NULL, NULL, NULL, 23, 166, NULL, 'This is a Planet'),
(516, 86, 'Bismuth 3', NULL, NULL, NULL, NULL, 53, 80, NULL, 'This is a Planet'),
(517, 86, 'Bismuth 4', NULL, NULL, NULL, NULL, 150, 74, NULL, 'This is a Planet'),
(518, 86, 'Bismuth 5', NULL, NULL, NULL, NULL, 171, 19, NULL, 'This is a Planet'),
(519, 86, 'Bismuth 6', NULL, NULL, NULL, NULL, 106, 187, NULL, 'This is a Planet'),
(520, 86, 'Bismuth 7', NULL, NULL, NULL, NULL, 27, 30, NULL, 'This is a Planet'),
(521, 86, 'Bismuth 8', NULL, NULL, NULL, NULL, 27, 209, NULL, 'This is a Planet'),
(522, 87, 'Barundi 1', NULL, NULL, NULL, NULL, 80, 123, NULL, 'This is a Planet'),
(523, 87, 'Barundi 2', NULL, NULL, NULL, NULL, 199, 68, NULL, 'This is a Planet'),
(524, 87, 'Barundi 3', NULL, NULL, NULL, NULL, 88, 74, NULL, 'This is a Planet'),
(525, 87, 'Barundi 4', NULL, NULL, NULL, NULL, 145, 122, NULL, 'This is a Planet'),
(526, 87, 'Barundi 5', NULL, NULL, NULL, NULL, 152, 69, NULL, 'This is a Planet'),
(527, 87, 'Barundi 6', NULL, NULL, NULL, NULL, 144, 56, NULL, 'This is a Planet'),
(528, 87, 'Barundi 7', NULL, NULL, NULL, NULL, 120, 214, NULL, 'This is a Planet'),
(529, 87, 'Barundi 8', NULL, NULL, NULL, NULL, 216, 151, NULL, 'This is a Planet'),
(530, 87, 'Barundi 9', NULL, NULL, NULL, NULL, 187, 42, NULL, 'This is a Planet'),
(531, 88, 'Thonov 1', NULL, NULL, NULL, NULL, 91, 223, NULL, 'This is a Planet'),
(532, 88, 'Thonov 2', NULL, NULL, NULL, NULL, 126, 216, NULL, 'This is a Planet'),
(533, 88, 'Thonov 3', NULL, NULL, NULL, NULL, 52, 184, NULL, 'This is a Planet'),
(534, 88, 'Thonov 4', NULL, NULL, NULL, NULL, 41, 201, NULL, 'This is a Planet'),
(535, 88, 'Thonov 5', NULL, NULL, NULL, NULL, 173, 47, NULL, 'This is a Planet'),
(536, 88, 'Thonov 6', NULL, NULL, NULL, NULL, 142, 70, NULL, 'This is a Planet'),
(537, 89, 'Valkov 1', NULL, NULL, NULL, NULL, 173, 28, NULL, 'This is a Planet'),
(538, 89, 'Valkov 2', NULL, NULL, NULL, NULL, 178, 240, NULL, 'This is a Planet'),
(539, 89, 'Valkov 3', NULL, NULL, NULL, NULL, 212, 131, NULL, 'This is a Planet'),
(540, 89, 'Valkov 4', NULL, NULL, NULL, NULL, 157, 180, NULL, 'This is a Planet'),
(541, 89, 'Valkov 5', NULL, NULL, NULL, NULL, 35, 108, NULL, 'This is a Planet'),
(542, 89, 'Valkov 6', NULL, NULL, NULL, NULL, 177, 206, NULL, 'This is a Planet'),
(543, 89, 'Valkov 7', NULL, NULL, NULL, NULL, 11, 124, NULL, 'This is a Planet'),
(544, 90, 'Antov 1', NULL, NULL, NULL, NULL, 79, 142, NULL, 'This is a Planet'),
(545, 90, 'Antov 2', NULL, NULL, NULL, NULL, 162, 129, NULL, 'This is a Planet'),
(546, 90, 'Antov 3', NULL, NULL, NULL, NULL, 237, 152, NULL, 'This is a Planet'),
(547, 90, 'Antov 4', NULL, NULL, NULL, NULL, 34, 104, NULL, 'This is a Planet'),
(548, 90, 'Antov 5', NULL, NULL, NULL, NULL, 60, 220, NULL, 'This is a Planet'),
(549, 90, 'Antov 6', NULL, NULL, NULL, NULL, 146, 89, NULL, 'This is a Planet'),
(550, 90, 'Antov 7', NULL, NULL, NULL, NULL, 90, 222, NULL, 'This is a Planet'),
(551, 90, 'Antov 8', NULL, NULL, NULL, NULL, 57, 136, NULL, 'This is a Planet'),
(552, 90, 'Antov 9', NULL, NULL, NULL, NULL, 60, 151, NULL, 'This is a Planet'),
(553, 90, 'Antov 10', NULL, NULL, NULL, NULL, 135, 178, NULL, 'This is a Planet'),
(554, 91, 'Tovis 1', NULL, NULL, NULL, NULL, 22, 110, NULL, 'This is a Planet'),
(555, 91, 'Tovis 2', NULL, NULL, NULL, NULL, 71, 106, NULL, 'This is a Planet'),
(556, 91, 'Tovis 3', NULL, NULL, NULL, NULL, 58, 10, NULL, 'This is a Planet'),
(557, 92, 'Rebus 1', NULL, NULL, NULL, NULL, 129, 46, NULL, 'This is a Planet'),
(558, 92, 'Rebus 2', NULL, NULL, NULL, NULL, 57, 74, NULL, 'This is a Planet'),
(559, 92, 'Rebus 3', NULL, NULL, NULL, NULL, 214, 133, NULL, 'This is a Planet'),
(560, 93, 'Atune 1', NULL, NULL, NULL, NULL, 220, 21, NULL, 'This is a Planet'),
(561, 93, 'Atune 2', NULL, NULL, NULL, NULL, 27, 215, NULL, 'This is a Planet'),
(562, 93, 'Atune 3', NULL, NULL, NULL, NULL, 28, 34, NULL, 'This is a Planet'),
(563, 93, 'Atune 4', NULL, NULL, NULL, NULL, 144, 196, NULL, 'This is a Planet'),
(564, 93, 'Atune 5', NULL, NULL, NULL, NULL, 28, 24, NULL, 'This is a Planet'),
(565, 93, 'Atune 6', NULL, NULL, NULL, NULL, 163, 165, NULL, 'This is a Planet'),
(566, 93, 'Atune 7', NULL, NULL, NULL, NULL, 185, 216, NULL, 'This is a Planet'),
(567, 93, 'Atune 8', NULL, NULL, NULL, NULL, 218, 58, NULL, 'This is a Planet'),
(568, 94, 'Leviturn 1', NULL, NULL, NULL, NULL, 16, 137, NULL, 'This is a Planet'),
(569, 94, 'Leviturn 2', NULL, NULL, NULL, NULL, 182, 165, NULL, 'This is a Planet'),
(570, 94, 'Leviturn 3', NULL, NULL, NULL, NULL, 195, 198, NULL, 'This is a Planet'),
(571, 94, 'Leviturn 4', NULL, NULL, NULL, NULL, 18, 133, NULL, 'This is a Planet'),
(572, 94, 'Leviturn 5', NULL, NULL, NULL, NULL, 155, 201, NULL, 'This is a Planet'),
(573, 94, 'Leviturn 6', NULL, NULL, NULL, NULL, 209, 226, NULL, 'This is a Planet'),
(574, 94, 'Leviturn 7', NULL, NULL, NULL, NULL, 207, 23, NULL, 'This is a Planet'),
(575, 95, 'Nunia 1', NULL, NULL, NULL, NULL, 10, 185, NULL, 'This is a Planet'),
(576, 95, 'Nunia 2', NULL, NULL, NULL, NULL, 94, 134, NULL, 'This is a Planet'),
(577, 95, 'Nunia 3', NULL, NULL, NULL, NULL, 10, 35, NULL, 'This is a Planet'),
(578, 95, 'Nunia 4', NULL, NULL, NULL, NULL, 204, 63, NULL, 'This is a Planet'),
(579, 95, 'Nunia 5', NULL, NULL, NULL, NULL, 221, 213, NULL, 'This is a Planet'),
(580, 95, 'Nunia 6', NULL, NULL, NULL, NULL, 30, 13, NULL, 'This is a Planet'),
(581, 96, 'Nunes 1', NULL, NULL, NULL, NULL, 90, 24, NULL, 'This is a Planet'),
(582, 96, 'Nunes 2', NULL, NULL, NULL, NULL, 188, 63, NULL, 'This is a Planet'),
(583, 96, 'Nunes 3', NULL, NULL, NULL, NULL, 139, 103, NULL, 'This is a Planet'),
(584, 96, 'Nunes 4', NULL, NULL, NULL, NULL, 101, 33, NULL, 'This is a Planet'),
(585, 96, 'Nunes 5', NULL, NULL, NULL, NULL, 23, 20, NULL, 'This is a Planet'),
(586, 96, 'Nunes 6', NULL, NULL, NULL, NULL, 48, 226, NULL, 'This is a Planet'),
(587, 96, 'Nunes 7', NULL, NULL, NULL, NULL, 226, 56, NULL, 'This is a Planet'),
(588, 96, 'Nunes 8', NULL, NULL, NULL, NULL, 224, 174, NULL, 'This is a Planet'),
(589, 96, 'Nunes 9', NULL, NULL, NULL, NULL, 193, 145, NULL, 'This is a Planet'),
(590, 97, 'Siicury 1', NULL, NULL, NULL, NULL, 78, 111, NULL, 'This is a Planet'),
(591, 97, 'Siicury 2', NULL, NULL, NULL, NULL, 79, 108, NULL, 'This is a Planet'),
(592, 97, 'Siicury 3', NULL, NULL, NULL, NULL, 31, 202, NULL, 'This is a Planet'),
(593, 97, 'Siicury 4', NULL, NULL, NULL, NULL, 157, 200, NULL, 'This is a Planet'),
(594, 97, 'Siicury 5', NULL, NULL, NULL, NULL, 68, 18, NULL, 'This is a Planet'),
(595, 98, 'Kolvone 1', NULL, NULL, NULL, NULL, 116, 45, NULL, 'This is a Planet'),
(596, 98, 'Kolvone 2', NULL, NULL, NULL, NULL, 135, 67, NULL, 'This is a Planet'),
(597, 98, 'Kolvone 3', NULL, NULL, NULL, NULL, 156, 16, NULL, 'This is a Planet'),
(598, 98, 'Kolvone 4', NULL, NULL, NULL, NULL, 208, 170, NULL, 'This is a Planet'),
(599, 98, 'Kolvone 5', NULL, NULL, NULL, NULL, 225, 48, NULL, 'This is a Planet'),
(600, 98, 'Kolvone 6', NULL, NULL, NULL, NULL, 221, 201, NULL, 'This is a Planet'),
(601, 99, 'Atania 1', NULL, NULL, NULL, NULL, 195, 150, NULL, 'This is a Planet'),
(602, 99, 'Atania 2', NULL, NULL, NULL, NULL, 39, 131, NULL, 'This is a Planet'),
(603, 99, 'Atania 3', NULL, NULL, NULL, NULL, 23, 206, NULL, 'This is a Planet'),
(604, 100, 'Saowei 1', NULL, NULL, NULL, NULL, 223, 30, NULL, 'This is a Planet'),
(605, 100, 'Saowei 2', NULL, NULL, NULL, NULL, 168, 117, NULL, 'This is a Planet'),
(606, 100, 'Saowei 3', NULL, NULL, NULL, NULL, 204, 167, NULL, 'This is a Planet'),
(607, 100, 'Saowei 4', NULL, NULL, NULL, NULL, 180, 190, NULL, 'This is a Planet'),
(608, 101, 'Leotau 1', NULL, NULL, NULL, NULL, 223, 85, NULL, 'This is a Planet'),
(609, 101, 'Leotau 2', NULL, NULL, NULL, NULL, 80, 12, NULL, 'This is a Planet'),
(610, 101, 'Leotau 3', NULL, NULL, NULL, NULL, 74, 199, NULL, 'This is a Planet'),
(611, 101, 'Leotau 4', NULL, NULL, NULL, NULL, 125, 209, NULL, 'This is a Planet'),
(612, 101, 'Leotau 5', NULL, NULL, NULL, NULL, 118, 60, NULL, 'This is a Planet'),
(613, 101, 'Leotau 6', NULL, NULL, NULL, NULL, 71, 164, NULL, 'This is a Planet'),
(614, 101, 'Leotau 7', NULL, NULL, NULL, NULL, 87, 122, NULL, 'This is a Planet'),
(615, 101, 'Leotau 8', NULL, NULL, NULL, NULL, 55, 43, NULL, 'This is a Planet'),
(616, 101, 'Leotau 9', NULL, NULL, NULL, NULL, 61, 32, NULL, 'This is a Planet');

-- --------------------------------------------------------

--
-- Table structure for table `univ_system`
--

DROP TABLE IF EXISTS `univ_system`;
CREATE TABLE IF NOT EXISTS `univ_system` (
  `system_id` int(11) NOT NULL,
  `system_name` varchar(32) NOT NULL,
  `system_x` int(9) NOT NULL,
  `system_y` int(9) NOT NULL,
  `system_z` int(9) DEFAULT NULL,
  `system_control` varchar(32) DEFAULT NULL,
  `system_description` varchar(256) DEFAULT NULL,
  `system_security` int(2) NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `univ_system`
--

INSERT INTO `univ_system` (`system_id`, `system_name`, `system_x`, `system_y`, `system_z`, `system_control`, `system_description`, `system_security`) VALUES
(1, 'Aries', 1972, 1795, NULL, NULL, 'THIS IS A SYSTEM', 10),
(2, 'Ajax', 1028, 1942, NULL, NULL, 'THIS IS A SYSTEM', 6),
(3, 'Apollo', 2009, 1098, NULL, NULL, 'THIS IS A SYSTEM', 8),
(4, 'Castor', 2313, 1819, NULL, NULL, 'THIS IS A SYSTEM', 2),
(5, 'Daemon', 1007, 1871, NULL, NULL, 'THIS IS A SYSTEM', 6),
(6, 'Hermes', 2587, 1722, NULL, NULL, 'THIS IS A SYSTEM', 4),
(7, 'Theseus', 1144, 2178, NULL, NULL, 'THIS IS A SYSTEM', 5),
(8, 'Caldron', 3158, 2373, NULL, NULL, 'THIS IS A SYSTEM', 1),
(9, 'Aquilla', 1492, 904, NULL, NULL, 'THIS IS A SYSTEM', 7),
(10, 'Proteus', 3833, 1737, NULL, NULL, 'THIS IS A SYSTEM', 1),
(11, 'Atlas', 2410, 1769, NULL, NULL, 'THIS IS A SYSTEM', 8),
(12, 'Ailea', 4422, 2396, NULL, NULL, 'THIS IS A SYSTEM', 1),
(13, 'Black', 4424, 1251, NULL, NULL, 'THIS IS A SYSTEM', 7),
(14, 'Unathea', 1581, 2369, NULL, NULL, 'THIS IS A SYSTEM', 7),
(15, 'Aopra', 2556, 623, NULL, NULL, 'THIS IS A SYSTEM', 10),
(16, 'Taloth', 3531, 1791, NULL, NULL, 'THIS IS A SYSTEM', 1),
(17, 'Eria', 2317, 457, NULL, NULL, 'THIS IS A SYSTEM', 4),
(18, 'Mapra', 2393, 335, NULL, NULL, 'THIS IS A SYSTEM', 10),
(19, 'Naviri', 415, 1582, NULL, NULL, 'THIS IS A SYSTEM', 5),
(20, 'Haonus', 953, 1847, NULL, NULL, 'THIS IS A SYSTEM', 7),
(21, 'Kurus', 2876, 2498, NULL, NULL, 'THIS IS A SYSTEM', 2),
(22, 'Aurus', 3489, 1153, NULL, NULL, 'THIS IS A SYSTEM', 7),
(23, 'Diria', 3416, 2330, NULL, NULL, 'THIS IS A SYSTEM', 7),
(24, 'Asypso', 2293, 1749, NULL, NULL, 'THIS IS A SYSTEM', 2),
(25, 'Velosia', 1506, 1778, NULL, NULL, 'THIS IS A SYSTEM', 4),
(26, 'Gek', 2844, 2112, NULL, NULL, 'THIS IS A SYSTEM', 6),
(27, 'Gert', 1304, 1907, NULL, NULL, 'THIS IS A SYSTEM', 4),
(28, 'Rune', 3921, 722, NULL, NULL, 'THIS IS A SYSTEM', 10),
(29, 'Obion', 1417, 1305, NULL, NULL, 'THIS IS A SYSTEM', 2),
(30, 'Freya', 3276, 2177, NULL, NULL, 'THIS IS A SYSTEM', 4),
(31, 'Runifile', 2918, 719, NULL, NULL, 'THIS IS A SYSTEM', 3),
(32, 'Scarrow', 2392, 2257, NULL, NULL, 'THIS IS A SYSTEM', 9),
(33, 'Laibach', 3740, 2131, NULL, NULL, 'THIS IS A SYSTEM', 3),
(34, 'Green', 3273, 1617, NULL, NULL, 'THIS IS A SYSTEM', 2),
(35, 'Pinus', 961, 611, NULL, NULL, 'THIS IS A SYSTEM', 3),
(36, 'Velos', 3314, 1263, NULL, NULL, 'THIS IS A SYSTEM', 9),
(37, 'Melodrus', 4211, 1778, NULL, NULL, 'THIS IS A SYSTEM', 9),
(38, 'Frarn', 410, 960, NULL, NULL, 'THIS IS A SYSTEM', 7),
(39, 'Hek', 679, 736, NULL, NULL, 'THIS IS A SYSTEM', 4),
(40, 'Filus', 4334, 1707, NULL, NULL, 'THIS IS A SYSTEM', 6),
(41, 'Bern', 3789, 540, NULL, NULL, 'THIS IS A SYSTEM', 5),
(42, 'Cern', 1872, 2495, NULL, NULL, 'THIS IS A SYSTEM', 5),
(43, 'Velum', 1810, 1290, NULL, NULL, 'THIS IS A SYSTEM', 6),
(44, 'Sargon', 615, 2165, NULL, NULL, 'THIS IS A SYSTEM', 2),
(45, 'New Sol', 1387, 1974, NULL, NULL, 'THIS IS A SYSTEM', 1),
(46, 'Grup', 3046, 1766, NULL, NULL, 'THIS IS A SYSTEM', 2),
(47, 'Bleo', 1463, 860, NULL, NULL, 'THIS IS A SYSTEM', 9),
(48, 'Farse', 2435, 973, NULL, NULL, 'THIS IS A SYSTEM', 4),
(49, 'Rileum', 1624, 1085, NULL, NULL, 'THIS IS A SYSTEM', 2),
(50, 'Astrus', 2836, 2140, NULL, NULL, 'THIS IS A SYSTEM', 8),
(51, 'Nevor', 1964, 1822, NULL, NULL, 'THIS IS A SYSTEM', 2),
(52, 'Felum', 4303, 2097, NULL, NULL, 'THIS IS A SYSTEM', 5),
(53, 'Grak', 2491, 1773, NULL, NULL, 'THIS IS A SYSTEM', 8),
(54, 'Teitov', 2616, 1269, NULL, NULL, 'THIS IS A SYSTEM', 8),
(55, 'Zenom', 4246, 305, NULL, NULL, 'THIS IS A SYSTEM', 3),
(56, 'Felnoe', 1658, 2030, NULL, NULL, 'THIS IS A SYSTEM', 9),
(57, 'Ovecury', 3041, 2353, NULL, NULL, 'THIS IS A SYSTEM', 5),
(58, 'Xoalea', 333, 585, NULL, NULL, 'THIS IS A SYSTEM', 7),
(59, 'Chion', 2276, 2020, NULL, NULL, 'THIS IS A SYSTEM', 10),
(60, 'Oupra', 762, 1516, NULL, NULL, 'THIS IS A SYSTEM', 8),
(61, 'Zuwei', 3397, 1330, NULL, NULL, 'THIS IS A SYSTEM', 6),
(62, 'Saelara', 3955, 1387, NULL, NULL, 'THIS IS A SYSTEM', 7),
(63, 'Chalveon', 4243, 459, NULL, NULL, 'THIS IS A SYSTEM', 9),
(64, 'Perlos', 1266, 1828, NULL, NULL, 'THIS IS A SYSTEM', 1),
(65, 'Deogawa', 1967, 1669, NULL, NULL, 'THIS IS A SYSTEM', 6),
(66, 'Uchoth', 950, 2497, NULL, NULL, 'THIS IS A SYSTEM', 7),
(67, 'Obtalium', 1532, 1262, NULL, NULL, 'THIS IS A SYSTEM', 1),
(68, 'Vega', 3315, 1047, NULL, NULL, 'THIS IS A SYSTEM', 5),
(69, 'Zeta', 1326, 2258, NULL, NULL, 'THIS IS A SYSTEM', 5),
(70, 'Alpha', 2451, 1414, NULL, NULL, 'THIS IS A SYSTEM', 4),
(71, 'Beta', 1632, 2050, NULL, NULL, 'THIS IS A SYSTEM', 8),
(72, 'Gamma', 2224, 355, NULL, NULL, 'THIS IS A SYSTEM', 2),
(73, 'Theta', 3057, 2081, NULL, NULL, 'THIS IS A SYSTEM', 8),
(74, 'Omega', 1941, 696, NULL, NULL, 'THIS IS A SYSTEM', 7),
(75, 'Vapra', 4075, 1254, NULL, NULL, 'THIS IS A SYSTEM', 6),
(76, 'Bespin', 2417, 2454, NULL, NULL, 'THIS IS A SYSTEM', 4),
(77, 'Vespa', 4106, 864, NULL, NULL, 'THIS IS A SYSTEM', 7),
(78, 'Igeon', 2766, 1955, NULL, NULL, 'THIS IS A SYSTEM', 10),
(79, 'Ratheon', 2196, 1799, NULL, NULL, 'THIS IS A SYSTEM', 7),
(80, 'Celcius', 3558, 1555, NULL, NULL, 'THIS IS A SYSTEM', 9),
(81, 'Musk', 1677, 333, NULL, NULL, 'THIS IS A SYSTEM', 6),
(82, 'Hel', 4320, 1329, NULL, NULL, 'THIS IS A SYSTEM', 3),
(83, 'Coliv', 3856, 1871, NULL, NULL, 'THIS IS A SYSTEM', 8),
(84, 'Blerp', 2791, 1655, NULL, NULL, 'THIS IS A SYSTEM', 10),
(85, 'Cacus', 2687, 2230, NULL, NULL, 'THIS IS A SYSTEM', 1),
(86, 'Bismuth', 4000, 1159, NULL, NULL, 'THIS IS A SYSTEM', 7),
(87, 'Barundi', 3093, 2314, NULL, NULL, 'THIS IS A SYSTEM', 7),
(88, 'Thonov', 807, 1288, NULL, NULL, 'THIS IS A SYSTEM', 9),
(89, 'Valkov', 2471, 2198, NULL, NULL, 'THIS IS A SYSTEM', 2),
(90, 'Antov', 1687, 2074, NULL, NULL, 'THIS IS A SYSTEM', 7),
(91, 'Tovis', 1023, 1320, NULL, NULL, 'THIS IS A SYSTEM', 7),
(92, 'Rebus', 1736, 2188, NULL, NULL, 'THIS IS A SYSTEM', 5),
(93, 'Atune', 1289, 1250, NULL, NULL, 'THIS IS A SYSTEM', 1),
(94, 'Leviturn', 2236, 453, NULL, NULL, 'THIS IS A SYSTEM', 4),
(95, 'Nunia', 1639, 534, NULL, NULL, 'THIS IS A SYSTEM', 4),
(96, 'Nunes', 3795, 946, NULL, NULL, 'THIS IS A SYSTEM', 10),
(97, 'Siicury', 404, 2259, NULL, NULL, 'THIS IS A SYSTEM', 8),
(98, 'Kolvone', 1684, 1018, NULL, NULL, 'THIS IS A SYSTEM', 2),
(99, 'Atania', 4332, 931, NULL, NULL, 'THIS IS A SYSTEM', 1),
(100, 'Saowei', 2273, 1461, NULL, NULL, 'THIS IS A SYSTEM', 9),
(101, 'Leotau', 551, 897, NULL, NULL, 'THIS IS A SYSTEM', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_cargo`
--

DROP TABLE IF EXISTS `user_cargo`;
CREATE TABLE IF NOT EXISTS `user_cargo` (
  `cargo_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_amount` int(11) NOT NULL,
  PRIMARY KEY (`cargo_id`),
  UNIQUE KEY `cargo_id` (`cargo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_cargo`
--

INSERT INTO `user_cargo` (`cargo_id`, `user_id`, `item_id`, `item_amount`) VALUES
(1, 3, 1, 300),
(2, 3, 1, 400),
(3, 3, 7, 11),
(4, 3, 6, 1111),
(5, 3, 3, 1),
(6, 3, 2, 1111),
(7, 3, 1, 111),
(8, 3, 7, 11),
(9, 3, 6, 1111),
(10, 3, 3, 1),
(11, 3, 2, 1111),
(12, 3, 1, 111);

-- --------------------------------------------------------

--
-- Table structure for table `user_ mail`
--

DROP TABLE IF EXISTS `user_ mail`;
CREATE TABLE IF NOT EXISTS `user_ mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `read_flag` int(1) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `content` varchar(512) NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_ship`
--

DROP TABLE IF EXISTS `user_ship`;
CREATE TABLE IF NOT EXISTS `user_ship` (
  `ship_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ship_name` varchar(11) NOT NULL,
  `ship_type` varchar(11) NOT NULL,
  `ship_fuel` int(11) NOT NULL,
  `ship_cargo_id` int(11) NOT NULL,
  `ship_cargo_limit` int(11) NOT NULL,
  `ship_fame` int(11) NOT NULL,
  `ship_fuel_limit` int(11) NOT NULL,
  `ship_speed` int(11) NOT NULL,
  `ship_atk` int(11) NOT NULL,
  `ship_arm` int(11) NOT NULL,
  PRIMARY KEY (`ship_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_ship`
--

INSERT INTO `user_ship` (`ship_id`, `user_id`, `ship_name`, `ship_type`, `ship_fuel`, `ship_cargo_id`, `ship_cargo_limit`, `ship_fame`, `ship_fuel_limit`, `ship_speed`, `ship_atk`, `ship_arm`) VALUES
(1, 3, 'Enterprise', 'Punisher', 10000, 1, 20000, 4, 15000, 9, 9, 9),
(2, 10, 'shipname', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(3, 11, 'iii', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(4, 12, 'asdfa', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(5, 13, 'PPP', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(6, 14, 'HHHHHH', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(7, 15, 'asdfas', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(8, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(9, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(10, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(11, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(12, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(13, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(14, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(15, 16, 'ffff', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9),
(16, 24, 'hhhhhh', 'shiptype', 10000, 0, 3000, 15000, 0, 9, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(24) NOT NULL,
  `password` char(64) NOT NULL,
  `email` varchar(50) NOT NULL,
  `last_session` varchar(128) DEFAULT NULL,
  `log_time` int(11) DEFAULT NULL,
  `active` text,
  `last_action` int(11) DEFAULT NULL,
  `user_valid` text,
  `user_location` int(8) DEFAULT NULL,
  `user_location_planet` int(5) DEFAULT NULL,
  `user_x` int(5) NOT NULL,
  `user_y` int(5) NOT NULL,
  `ship_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `password`, `email`, `last_session`, `log_time`, `active`, `last_action`, `user_valid`, `user_location`, `user_location_planet`, `user_x`, `user_y`, `ship_id`) VALUES
(3, 'admin', 'adminpass', 'emai@email.com', '9g3f55t2kqhva6oent6shvm4k7', 1579885920, 'TRUE', 1579885920, 'TRUE', 68, 397, 3315, 1047, 11),
(5, 'waps', 'woops', 'waps@waps.com', NULL, NULL, NULL, NULL, '1', 185, 1, 0, 0, 11),
(6, 'admin', 'admin', 'admin@admin.com', '9g3f55t2kqhva6oent6shvm4k7', 1579885902, 'FALSE', 1579885902, '1', 153, 1, 0, 0, 11),
(7, 'dogs', 'dogs', 'dogs@dogs.com', NULL, NULL, '1', NULL, '1', 222, 1, 0, 0, 11),
(8, 'asdf', 'asdf', 'asfd@asdf.com', '0q32h3jc3dtb88hs5ijkj5d6v3', 1556621864, 'FALSE', 1556623577, 'TRUE', 67, 2546, 0, 0, 11),
(9, 'hello', 'hello', 'EMAIL@email.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 188, 1, 0, 0, 11),
(10, 'ii', 'iiii', 'iii@iii.i', NULL, NULL, 'TRUE', NULL, 'TRUE', 90, 1, 0, 0, 11),
(11, 'asd', 'asd', 'EMAIL@email', NULL, NULL, 'TRUE', NULL, 'TRUE', 85, 1, 0, 0, 11),
(12, 'hhh', 'hhh', 'EMAIL@hh.hh', NULL, NULL, 'TRUE', NULL, 'TRUE', 133, 1, 0, 0, 12),
(13, 'ppp', 'ppp', 'as@email.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 105, 1, 0, 0, 13),
(14, 'hhhh', 'hhhhh', 'email@hhhhh.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 224, 1, 0, 0, 14),
(15, 'asdfasdf', 'asdfasdf', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 194, 1, 0, 0, 15),
(16, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 102, 1, 0, 0, 16),
(17, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 9, 1, 0, 0, 0),
(18, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 109, 1, 0, 0, 0),
(19, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 42, 1, 0, 0, 0),
(20, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 70, 1, 0, 0, 0),
(21, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 156, 1, 0, 0, 0),
(22, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 201, 1, 0, 0, 0),
(23, 'ffff', 'ffff', 'EMAIL@asd.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 204, 1, 0, 0, 0),
(24, 'asdfasd', 'asdfasdf', 'EMAIL@email.com', NULL, NULL, 'TRUE', NULL, 'TRUE', 67, 1, 1532, 1262, 24);

-- --------------------------------------------------------

--
-- Table structure for table `user_transactions`
--

DROP TABLE IF EXISTS `user_transactions`;
CREATE TABLE IF NOT EXISTS `user_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(32) NOT NULL,
  `planet_location` int(10) NOT NULL,
  `plus_minus` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `system_location` int(11) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_transactions`
--

INSERT INTO `user_transactions` (`transaction_id`, `amount`, `planet_location`, `plus_minus`, `user_id`, `system_location`, `transaction_type`) VALUES
(1, 50000, 123, '-', 3, 24, 'Fuel Purchase');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `univ_market`
--
ALTER TABLE `univ_market`
  ADD CONSTRAINT `market_id` FOREIGN KEY (`market_id`) REFERENCES `univ_planet` (`planet_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_ mail`
--
ALTER TABLE `user_ mail`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
