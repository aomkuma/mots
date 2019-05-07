-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 26, 2018 at 09:56 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acfs`
--

-- --------------------------------------------------------

--
-- Table structure for table `Academic_Boards`
--

CREATE TABLE `Academic_Boards` (
  `academicBoardID` int(11) NOT NULL,
  `stakeholderID` int(11) NOT NULL,
  `standardID` int(11) NOT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Academic_Boards`
--

INSERT INTO `Academic_Boards` (`academicBoardID`, `stakeholderID`, `standardID`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(6, 9810021, 3, '1093840', '2018-08-02 10:54:24', '1093840', '2018-08-02 10:54:24'),
(8, 9810022, 4, '1093840', '2018-08-11 10:43:25', '1093840', '2018-08-11 10:43:25'),
(9, 9810022, 3, '1093840', '2018-08-13 10:57:06', '1093840', '2018-08-13 10:57:06'),
(14, 9810022, 5, '1093840', '2018-11-22 09:13:30', '1093840', '2018-11-22 09:13:30'),
(19, 9810021, 5, '1093840', '2018-11-22 16:11:46', '1093840', '2018-11-22 16:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `Accreditation_Scopes`
--

CREATE TABLE `Accreditation_Scopes` (
  `id` int(11) NOT NULL,
  `val` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Accreditation_Scopes`
--

INSERT INTO `Accreditation_Scopes` (`id`, `val`) VALUES
(1, 'ISO 17065'),
(2, 'ISO 17020'),
(3, 'ISO 17021');

-- --------------------------------------------------------

--
-- Table structure for table `Admin_Users`
--

CREATE TABLE `Admin_Users` (
  `adminID` char(7) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `lastName` varchar(150) DEFAULT NULL,
  `position` varchar(250) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Admin_Users`
--

INSERT INTO `Admin_Users` (`adminID`, `name`, `lastName`, `position`, `department`, `phone`, `email`, `password`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
('1093840', 'กรพจน์', 'อุโฆษกิจ', 'Admin Leader', 'IT', '0917196810', 'korapotu@gmail.com', 'Aommy1989', NULL, NULL, NULL, '2018-08-08 11:07:33'),
('8098729', 'aom', 'my', 'asd', 'asd', '0191238912', 'koaskd@gmail.com', '1234', '1093840', '2018-08-08 11:35:31', '1093840', '2018-10-09 09:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `Answers`
--

CREATE TABLE `Answers` (
  `answersID` int(11) NOT NULL,
  `standardID` int(11) DEFAULT NULL,
  `questionID` int(11) DEFAULT NULL,
  `answer` varchar(45) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `answerer` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Api_Caller`
--

CREATE TABLE `Api_Caller` (
  `id` bigint(20) NOT NULL,
  `caller_name` varchar(512) NOT NULL,
  `api_called` varchar(255) DEFAULT NULL,
  `call_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Api_Caller`
--

INSERT INTO `Api_Caller` (`id`, `caller_name`, `api_called`, `call_datetime`) VALUES
(1, 'test', '-', '2018-12-26 00:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `Appeal`
--

CREATE TABLE `Appeal` (
  `id` int(11) NOT NULL,
  `firstname` varchar(70) NOT NULL,
  `lastname` varchar(70) NOT NULL,
  `tel` varchar(20) DEFAULT NULL COMMENT 'โทรศัพท์บ้าน',
  `email` varchar(70) NOT NULL,
  `address` tinytext,
  `mobile` varchar(20) NOT NULL,
  `province` varchar(70) NOT NULL,
  `postcode` varchar(5) NOT NULL,
  `callback` enum('Y','N') NOT NULL,
  `callback_type` enum('ตามที่อยู่','อีเมลล์','โทรศัพท์บ้าน','โทรศัพท์มือถือ') NOT NULL,
  `team_to_comment` enum('เจ้าหน้าที่ผู้ให้บริการ / ผู้ตรวจประเมิน / ผู้ปฏิบัติงาน','กองรับรองมาตรฐาน (กรร.)','หน่วยตรวจสอบและรับรอง') NOT NULL,
  `appeal_type` enum('ร้องเรียน','อุทธรณ์') NOT NULL,
  `description` text,
  `description_filename` varchar(255) DEFAULT NULL,
  `description_filepath` varchar(512) DEFAULT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Appeal`
--

INSERT INTO `Appeal` (`id`, `firstname`, `lastname`, `tel`, `email`, `address`, `mobile`, `province`, `postcode`, `callback`, `callback_type`, `team_to_comment`, `appeal_type`, `description`, `description_filename`, `description_filepath`, `create_date`) VALUES
(1, 'askdjh', '', '01298390123', 'alksdhaksd', 'kasjdh', '09812093810', '', '1092', 'Y', 'ตามที่อยู่', 'เจ้าหน้าที่ผู้ให้บริการ / ผู้ตรวจประเมิน / ผู้ปฏิบัติงาน', 'ร้องเรียน', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(2, 'asdlkj', '', '102938012', 'asdkj@sdkfj.com', 'l34lkj', '0182908123', 'นนทบุรี', '10129', 'Y', 'ตามที่อยู่', 'หน่วยตรวจสอบและรับรอง', 'ร้องเรียน', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(3, 'asdasd', 'laksdj', '01209380', 'asd@alsd.com', 'laksjd', '0019280908', 'สมุทรปราการ', '1209', 'Y', 'ตามที่อยู่', 'หน่วยตรวจสอบและรับรอง', 'อุทธรณ์', 'and', '61aug17resultdisburseofbudget.pdf', 'files/files/appeal/20181022112108_156988.pdf', '2018-10-22 00:00:00'),
(4, '', 'asdasd', NULL, '', NULL, '', '', '0', 'Y', 'ตามที่อยู่', 'เจ้าหน้าที่ผู้ให้บริการ / ผู้ตรวจประเมิน / ผู้ปฏิบัติงาน', 'ร้องเรียน', NULL, NULL, NULL, '2018-10-22 17:41:37'),
(5, 'skajdh', 'kjhaksd', '0128391823', 'kajsd@asd.com', 'khkajshdk', '918723912', 'สมุทรปราการ', '01928', 'Y', 'ตามที่อยู่', 'หน่วยตรวจสอบและรับรอง', 'ร้องเรียน', 'asdasdhj', NULL, NULL, '2018-10-23 22:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `Appeal_Callback`
--

CREATE TABLE `Appeal_Callback` (
  `id` int(11) NOT NULL,
  `appeal_id` int(11) NOT NULL,
  `callback_name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Appeal_Callback`
--

INSERT INTO `Appeal_Callback` (`id`, `appeal_id`, `callback_name`) VALUES
(1, 1, 'ตามที่อยู่'),
(2, 1, 'อีเมลล์'),
(3, 1, 'โทรศัพท์บ้าน'),
(4, 1, 'โทรศัพท์มือถือ'),
(5, 2, 'ตามที่อยู่'),
(6, 3, 'ตามที่อยู่'),
(7, 5, 'อีเมลล์');

-- --------------------------------------------------------

--
-- Table structure for table `Appeal_List`
--

CREATE TABLE `Appeal_List` (
  `id` int(11) NOT NULL,
  `appeal_id` int(11) NOT NULL,
  `appeal_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Appeal_List`
--

INSERT INTO `Appeal_List` (`id`, `appeal_id`, `appeal_text`) VALUES
(1, 1, 'เรื่องทั่วไป'),
(2, 1, 'การติดต่อประสานงาน'),
(3, 1, 'การประเมิน'),
(4, 1, 'เรื่องอื่นๆ'),
(5, 2, 'เรื่องทั่วไป'),
(6, 3, 'การติดต่อประสานงาน'),
(7, 5, 'เรื่องทั่วไป'),
(8, 5, 'การติดต่อประสานงาน');

-- --------------------------------------------------------

--
-- Table structure for table `AttachFiles`
--

CREATE TABLE `AttachFiles` (
  `id` bigint(20) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `file_language` enum('TH','EN') DEFAULT NULL,
  `page_type` varchar(50) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `display_name` varchar(700) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_code` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `file_size` decimal(10,2) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AttachFiles`
--

INSERT INTO `AttachFiles` (`id`, `parent_id`, `file_language`, `page_type`, `menu_id`, `display_name`, `file_name`, `file_code`, `file_path`, `content_type`, `file_size`, `order_no`) VALUES
(1, 3, 'TH', 'annually-report', 3, NULL, '2ตัวอย่างเมล.xlsx', NULL, 'files/files/attach-files/3_20181013134603_955737.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(2, 3, 'TH', 'annually-report', 3, NULL, '59Sep19_0201_5000TransferOfAppropriations59.pdf', NULL, 'files/files/attach-files/3_20181013134603_302474.pdf', 'application/pdf', '254.66', 2),
(3, 4, 'TH', 'annually-report', 4, NULL, '61aug17resultdisburseofbudget.pdf', NULL, 'files/files/attach-files/4_20181013140446_812141.pdf', 'application/pdf', '479.75', 1),
(4, 4, 'TH', 'annually-report', 4, NULL, 'academic-board_20181009141734.xlsx', NULL, 'files/files/attach-files/4_20181013140446_101431.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '6.17', 2),
(5, 5, 'TH', 'annually-report', 5, NULL, '233053.jpg', NULL, 'files/files/attach-files/5_20181013140600_685053.jpg', 'image/jpeg', '151.59', 1),
(6, 5, 'TH', 'annually-report', 5, NULL, '260993.jpg', NULL, 'files/files/attach-files/5_20181013140600_215297.jpg', 'image/jpeg', '177.67', 2),
(7, 6, 'TH', 'annually-report', 6, NULL, '233056.jpg', NULL, 'files/files/attach-files/6_20181013140640_243601.jpg', 'image/jpeg', '130.71', 1),
(8, 6, 'TH', 'annually-report', 6, NULL, '252998.jpg', NULL, 'files/files/attach-files/6_20181013140640_433134.jpg', 'image/jpeg', '150.61', 2),
(9, 6, 'TH', 'annually-report', 6, NULL, '285193.jpg', NULL, 'files/files/attach-files/6_20181013140640_199255.jpg', 'image/jpeg', '217.80', 1),
(10, 6, 'TH', 'annually-report', 6, NULL, '38779280_311906389397932_5494328417962688512_n.jpg', NULL, 'files/files/attach-files/6_20181013140640_845751.jpg', 'image/jpeg', '439.77', 2),
(11, 7, 'TH', 'annually-report', 7, NULL, '3_20181013134603_955737.xlsx', NULL, 'files/files/attach-files/7_20181013140905_289043.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(12, 7, 'TH', 'annually-report', 7, NULL, '252185.jpg', NULL, 'files/files/attach-files/7_20181013140905_187474.jpg', 'image/jpeg', '185.16', 2),
(13, 8, 'TH', 'annually-report', 8, NULL, '252185.jpg', NULL, 'files/files/attach-files/8_20181013140905_209562.jpg', 'image/jpeg', '185.16', 1),
(14, 8, 'TH', 'annually-report', 8, NULL, '260993.jpg', NULL, 'files/files/attach-files/8_20181013140905_405697.jpg', 'image/jpeg', '177.67', 2),
(15, 9, 'TH', 'internal-audit', 9, NULL, '2ตัวอย่างเมล.xlsx', NULL, 'files/files/attach-files/9_20181013142338_897973.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(16, 9, 'TH', 'internal-audit', 9, NULL, '61aug24resultdisburseofbudget.pdf', NULL, 'files/files/attach-files/9_20181013142338_417074.pdf', 'application/pdf', '479.96', 2),
(17, 10, 'TH', 'ministerial-orders', 10, NULL, '59Sep19_0201_5000TransferOfAppropriations59.pdf', NULL, 'files/files/attach-files/10_20181017055829_149915.pdf', 'application/pdf', '254.66', 1),
(18, 10, 'TH', 'ministerial-orders', 10, NULL, '233053.jpg', NULL, 'files/files/attach-files/10_20181017055829_137464.jpg', 'image/jpeg', '151.59', 2),
(19, 11, 'TH', 'ministerial-orders', 11, NULL, '2ตัวอย่างเมล.xlsx', NULL, 'files/files/attach-files/11_20181017061815_513630.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(20, 12, 'TH', 'ministerial-orders', 12, NULL, '2ตัวอย่างเมล.xlsx', NULL, 'files/files/attach-files/12_20181017062331_189370.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(21, 12, 'TH', 'ministerial-orders', 12, NULL, '59Sep19_0201_5000TransferOfAppropriations59.pdf', NULL, 'files/files/attach-files/12_20181017062331_110314.pdf', 'application/pdf', '254.66', 2),
(22, 13, 'TH', 'ministerial-orders', 13, NULL, '2ตัวอย่างเมล.xlsx', NULL, 'files/files/attach-files/13_20181017062457_745954.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(23, 13, 'TH', 'ministerial-orders', 13, NULL, '61aug31resultdisburseofbudget.pdf', NULL, 'files/files/attach-files/13_20181017062457_277094.pdf', 'application/pdf', '480.22', 2),
(24, 14, 'TH', 'ministerial-orders', 14, NULL, 'ทดสอบ 1', NULL, 'files/files/attach-files/14_20181017063005_220372.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(25, 14, 'TH', 'ministerial-orders', 14, NULL, '1', NULL, 'files/files/attach-files/14_20181017063005_611687.jpg', 'image/jpeg', '169.79', 2),
(26, 15, 'TH', 'ministerial-orders', 15, NULL, 'zxczx czc', NULL, 'files/files/attach-files/15_20181017063153_851369.pdf', 'application/pdf', '479.75', 1),
(27, 15, 'TH', 'ministerial-orders', 15, NULL, '1', NULL, 'files/files/attach-files/15_20181017063153_208284.pdf', 'application/pdf', '479.96', 2),
(28, 16, 'TH', 'ministerial-orders', 16, NULL, 'asdjhg', NULL, 'files/files/attach-files/16_20181017063525_154813.pdf', 'application/pdf', '479.96', 1),
(29, 17, 'TH', 'ministerial-orders', 17, NULL, 'asdkh', NULL, 'files/files/attach-files/17_20181017063630_395923.pdf', 'application/pdf', '479.96', 1),
(30, 17, 'TH', 'ministerial-orders', 17, NULL, '1', NULL, 'files/files/attach-files/17_20181017063630_889687.pdf', 'application/pdf', '480.22', 2),
(31, 18, 'TH', 'ministerial-orders', 18, NULL, 'asdasd', NULL, 'files/files/attach-files/18_20181017063957_624923.pdf', 'application/pdf', '479.75', 1),
(32, 18, 'TH', 'ministerial-orders', 18, NULL, '1', NULL, 'files/files/attach-files/18_20181017063957_978638.jpg', 'image/jpeg', '130.71', 2),
(33, 19, 'TH', 'ministerial-orders', 19, NULL, 'qakjfh', NULL, 'files/files/attach-files/19_20181017064158_287791.pdf', 'application/pdf', '480.22', 1),
(34, 19, 'TH', 'ministerial-orders', 19, NULL, '1', NULL, 'files/files/attach-files/19_20181017064158_566354.pdf', 'application/pdf', '254.66', 2),
(35, 20, 'TH', 'ministerial-orders', 20, NULL, 'adsasd', NULL, 'files/files/attach-files/20_20181017064245_115978.pdf', 'application/pdf', '479.75', 1),
(36, 21, 'TH', 'ministerial-orders', 21, NULL, 'asdaksdn', NULL, 'files/files/attach-files/21_20181017064405_774370.pdf', 'application/pdf', '254.66', 1),
(37, 21, 'TH', 'ministerial-orders', 21, NULL, '233056.jpg', NULL, 'files/files/attach-files/21_20181017064405_318870.jpg', 'image/jpeg', '130.71', 2),
(38, 22, 'TH', 'ministerial-orders', 22, NULL, 'askdjh', NULL, 'files/files/attach-files/22_20181017064615_935675.pdf', 'application/pdf', '254.66', 1),
(39, 23, 'TH', 'ministerial-orders', 23, NULL, 'aksdh', NULL, 'files/files/attach-files/23_20181017064652_951579.pdf', 'application/pdf', '479.75', 1),
(40, 24, 'TH', 'ministerial-orders', 24, NULL, 'test1', NULL, 'files/files/attach-files/24_20181017064814_328534.pdf', 'application/pdf', '254.66', 1),
(41, 24, 'TH', 'ministerial-orders', 24, NULL, 'test2', NULL, 'files/files/attach-files/24_20181017064814_733521.pdf', 'application/pdf', '479.75', 2),
(42, 11, 'TH', 'ministerial-orders', 11, NULL, 'ythg', NULL, 'files/files/attach-files/11_20181017071756_687696.jpg', 'image/jpeg', '21.52', 2),
(43, 25, 'TH', 'annually-report', 25, NULL, '59Sep19_0201_5000TransferOfAppropriations59.pdf', NULL, 'files/files/attach-files/25_20181017180836_572084.pdf', 'application/pdf', '254.66', 1),
(44, 25, 'TH', 'annually-report', 25, NULL, '61aug31resultdisburseofbudget.pdf', NULL, 'files/files/attach-files/25_20181017180836_149288.pdf', 'application/pdf', '480.22', 2),
(45, 26, 'TH', 'annually-report', 26, NULL, 'test1', NULL, 'files/files/attach-files/26_20181017180934_391636.pdf', 'application/pdf', '479.75', 1),
(46, 26, 'TH', 'annually-report', 26, NULL, 'test2', NULL, 'files/files/attach-files/26_20181017180934_469881.pdf', 'application/pdf', '480.22', 2),
(47, 27, 'TH', 'annually-report', 27, NULL, 'test3', NULL, 'files/files/attach-files/27_20181017181332_169589.pdf', 'application/pdf', '479.75', 1),
(48, 27, 'TH', 'annually-report', 27, NULL, 'test4', NULL, 'files/files/attach-files/27_20181017181332_286726.pdf', 'application/pdf', '479.75', 2),
(49, 28, 'TH', 'standard-act', 28, NULL, 'กฎกระทรวง เรื่อง การกำหนดลักษณะของเครื่องหมาย การใช้เครื่องหมายและการแสดงเครื่องหมายรับรองมาตรฐานสินค้าเกษตร พ.ศ.2553', NULL, 'files/files/attach-files/28_20181018063729_233498.pdf', 'application/pdf', '254.66', 1),
(50, 28, 'TH', 'standard-act', 28, NULL, 'กฎกระทรวง เรื่อง การกำหนดลักษณะของเครื่องหมาย การใช้เครื่องหมายและการแสดงเครื่องหมายรับรองมาตรฐานสินค้าเกษตร พ.ศ.2553', NULL, 'files/files/attach-files/28_20181018063729_186004.pdf', 'application/pdf', '479.75', 2),
(51, 2, 'TH', 'listening', 2, NULL, 'เทส', NULL, 'files/files/attach-files/2_20181018114908_583952.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 2),
(53, 4, 'TH', 'listening', 4, NULL, 'ทดสอบไฟลen', NULL, 'files/files/attach-files/4_20181018120247_605837.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 2),
(56, 6, 'TH', 'listening', 6, NULL, 'test1', NULL, 'files/files/attach-files/6_20181018121350_292022.jpg', 'image/jpeg', '21.52', 1),
(57, 6, 'TH', 'listening', 6, NULL, 'test1', NULL, 'files/files/attach-files/6_20181018120743_354331.pdf', 'application/pdf', '479.96', 1),
(58, 7, 'TH', 'listening', 7, NULL, 'file 1', NULL, 'files/files/attach-files/7_20181018121547_125426.pdf', 'application/pdf', '254.66', 1),
(59, 7, 'EN', 'listening', 7, NULL, 'file 2', NULL, 'files/files/attach-files/7_20181018121606_278837.jpg', 'image/jpeg', '21.52', 2),
(60, 29, 'TH', 'condition', 29, 'ทดสอลชื่อไฟล์', '3_20181013134603_955737.xlsx', 'code1', 'files/files/attach-files/29_20181022182215_762262.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(61, 29, 'EN', 'condition', 29, 'test file name', '2ตัวอย่างเมล.xlsx', 'code2', 'files/files/attach-files/29_20181022182215_447762.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 2),
(62, 30, 'TH', 'doc-confirm-work', 30, 'คู่มือ', '59Sep19_0201_5000TransferOfAppropriations59.pdf', '', 'files/files/attach-files/30_20181023104734_143005.pdf', 'application/pdf', '254.66', 1),
(63, 30, 'EN', 'doc-confirm-work', 30, 'Manual', '61aug17resultdisburseofbudget.pdf', '', 'files/files/attach-files/30_20181023104734_381564.pdf', 'application/pdf', '479.75', 2),
(69, 17, NULL, 'news-picture', 17, NULL, '233056.jpg', NULL, 'files/img/news/17_20181026103804_596902.jpg', 'image/jpeg', '130.71', NULL),
(70, 17, NULL, 'news-picture', 17, NULL, '233051.jpg', NULL, 'files/img/news/17_20181026104006_364322.jpg', 'image/jpeg', '169.79', NULL),
(71, 17, NULL, 'news-picture', 17, NULL, '252998.jpg', NULL, 'files/img/news/17_20181026104006_853998.jpg', 'image/jpeg', '150.61', NULL),
(72, 17, NULL, 'news-picture', 17, NULL, '260993.jpg', NULL, 'files/img/news/17_20181026104034_207472.jpg', 'image/jpeg', '177.67', NULL),
(73, 17, NULL, 'news-picture', 17, NULL, '285193.jpg', NULL, 'files/img/news/17_20181026104146_167560.jpg', 'image/jpeg', '217.80', NULL),
(74, 31, 'TH', 'clipping-news', 31, 'ทดสอบชื่อไฟล์', '61aug31resultdisburseofbudget.pdf', '', 'files/files/attach-files/31_20181026114609_685621.pdf', 'application/pdf', '480.22', 1),
(75, 32, 'TH', 'work-application', 32, 'รับสมัครงาน 1', '61aug17resultdisburseofbudget.pdf', '', 'files/files/attach-files/32_20181027092651_433927.pdf', 'application/pdf', '479.75', 1),
(77, 2, 'TH', 'purchase-plan', 2, '2ตัวอย่างเมล.xlsx', '2ตัวอย่างเมล.xlsx', '', 'files/files/attach-files/2_20181103092102_235643.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(78, 3, 'TH', 'standard-price', 3, 'แก้ไขกระทรวงการท่องเที่ยว.pdf', 'แก้ไขกระทรวงการท่องเที่ยว.pdf', '', 'files/files/attach-files/3_20181103093015_190892.pdf', 'application/pdf', '351.19', 1),
(79, 33, 'TH', 'skr', 33, 'สขร ไทย', '2ตัวอย่างเมล.xlsx', '2561', 'files/files/attach-files/33_20181103095322_569570.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(80, 33, 'EN', 'skr', 33, 'SKR', 'แก้ไขกระทรวงการท่องเที่ยว.pdf', '2018', 'files/files/attach-files/33_20181103095322_981044.pdf', 'application/pdf', '351.19', 2),
(81, 11, 'TH', 'specification-method', 11, 'แก้ไขกระทรวงการท่องเที่ยว.xlsx', 'แก้ไขกระทรวงการท่องเที่ยว.xlsx', '', 'files/files/attach-files/11_20181104100328_704273.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '5.00', 1),
(82, 14, 'TH', 'standard-price', 14, '2ตัวอย่างเมล.xlsx', '2ตัวอย่างเมล.xlsx', '', 'files/files/attach-files/14_20181104113028_945460.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(83, 14, 'TH', 'winning', 14, '2ตัวอย่างเมล.xlsx', '2ตัวอย่างเมล.xlsx', '', 'files/files/attach-files/14_20181104113429_135470.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(84, 34, 'TH', 'paper', 34, 'สื่อสิ่งพิมพ์', 'แก้ไขกระทรวงการท่องเที่ยว.pdf', '', 'files/files/attach-files/34_20181105075752_127166.pdf', 'application/pdf', '351.19', 1),
(85, 34, 'EN', 'paper', 34, 'paper', 'แก้ไขกระทรวงการท่องเที่ยว.pdf', '', 'files/files/attach-files/34_20181105074205_114602.pdf', 'application/pdf', '351.19', 2),
(104, 1, 'TH', 'infographic', 1, '1541060134556.jpg', '1541060134556.jpg', NULL, 'files/files/attach-files/1_20181106101140_623275.jpg', 'image/jpeg', '436.35', 1),
(105, 1, 'EN', 'infographic', 1, '252188.jpg', 'minister.png', NULL, 'files/files/attach-files/1_20181106101955_189784.png', 'image/png', '198.95', 2),
(106, 1, 'TH', 'infographic', 1, '_', '252184.jpg', NULL, 'files/files/attach-files/1_20181106101140_341894.jpg', 'image/jpeg', '167.88', 3),
(107, 1, 'EN', 'infographic', 1, '_', '252185.jpg', NULL, 'files/files/attach-files/1_20181106101140_470414.jpg', 'image/jpeg', '185.16', 4),
(109, 2, 'TH', 'infographic', 2, '1541060134556.jpg', '233053.jpg', NULL, 'files/files/attach-files/2_20181106102941_213647.jpg', 'image/jpeg', '151.59', 1),
(110, 2, 'EN', 'infographic', 2, '252184.jpg', '233056.jpg', NULL, 'files/files/attach-files/2_20181106102941_448949.jpg', 'image/jpeg', '130.71', 2),
(111, 2, 'TH', 'infographic', 2, '_', '252188.jpg', NULL, 'files/files/attach-files/2_20181106102659_488163.jpg', 'image/jpeg', '170.71', 3),
(112, 2, 'EN', 'infographic', 2, '_', '233056.jpg', NULL, 'files/files/attach-files/2_20181106102659_548307.jpg', 'image/jpeg', '130.71', 4),
(113, 35, 'TH', 'rule-food', 35, 'ไฟล์ไทย', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/35_20181114075747_261286.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(114, 35, 'EN', 'rule-food', 35, 'file eng', 'academicboardgroup_20181109082517.xlsx', '', 'files/files/attach-files/35_20181114075747_123570.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '6.38', 2),
(115, 36, 'TH', 'manual-inspection', 36, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/36_20181114081139_935159.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(116, 36, 'EN', 'manual-inspection', 36, 'academicboardgroup_20181109082609.xlsx', 'academicboardgroup_20181109082609.xlsx', '', 'files/files/attach-files/36_20181114081139_673724.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '6.38', 2),
(117, 37, 'TH', 'permission', 37, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/37_20181115061113_617009.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(118, 37, 'EN', 'permission', 37, 'academicboardgroup_20181109082517.xlsx', 'academicboardgroup_20181109082517.xlsx', '', 'files/files/attach-files/37_20181115061113_656831.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '6.38', 2),
(119, 38, 'TH', 'patrol', 38, 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', '', 'files/files/attach-files/38_20181115064925_327547.doc', 'application/msword', '2.00', 1),
(120, 38, 'EN', 'patrol', 38, '3_20181013134603_955737.xlsx', '3_20181013134603_955737.xlsx', '', 'files/files/attach-files/38_20181115064925_673931.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 2),
(121, 39, 'TH', 'patrol', 39, '2ตัวอย่างเมล.xlsx', '2ตัวอย่างเมล.xlsx', '', 'files/files/attach-files/39_20181115070646_861562.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 1),
(122, 39, 'EN', 'patrol', 39, 'academicboardgroup_20181109082517.xlsx', 'academicboardgroup_20181109082517.xlsx', '', 'files/files/attach-files/39_20181115070646_397213.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '6.38', 2),
(123, 40, 'TH', 'patrol', 40, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/40_20181115070738_408670.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(124, 40, 'EN', 'patrol', 40, '3_20181013134603_955737.xlsx', '3_20181013134603_955737.xlsx', '', 'files/files/attach-files/40_20181115070738_420339.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '1.00', 2),
(125, 41, 'TH', 'patrol', 41, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/41_20181115071206_254092.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(126, 41, 'EN', 'patrol', 41, 'academicboardgroup_20181109082517.xlsx', 'academicboardgroup_20181109082517.xlsx', '', 'files/files/attach-files/41_20181115071206_911872.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '6.38', 2),
(127, 42, 'TH', 'patrol', 42, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/42_20181115071247_236969.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(128, 42, 'EN', 'patrol', 42, 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', '', 'files/files/attach-files/42_20181115071247_877321.doc', 'application/msword', '2.00', 2),
(129, 43, 'TH', 'patrol', 43, 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', '', 'files/files/attach-files/43_20181115071547_215857.doc', 'application/msword', '2.00', 1),
(130, 43, 'EN', 'patrol', 43, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/43_20181115071547_455423.pages', 'application/x-iwork-pages-sffpages', '1.00', 2),
(131, 44, 'TH', 'integration', 44, 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', '', 'files/files/attach-files/44_20181115072217_441577.pages', 'application/x-iwork-pages-sffpages', '1.00', 1),
(132, 44, 'EN', 'integration', 44, 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', '', 'files/files/attach-files/44_20181115072217_563058.doc', 'application/msword', '2.00', 2),
(133, 45, 'TH', 'standard-logo', 45, '1541060134556.jpg', '1541060134556.jpg', '', 'files/files/attach-files/45_20181120122807_116405.jpg', 'image/jpeg', '436.35', 1),
(134, 46, 'TH', 'consumption-promotion', 46, 'ครงการส่งเสริมการบริโภค และใช้วัตถุดิบสินค้า Q Thai', 'Export - สัตว์แพทย์.xlsx', '', 'files/files/attach-files/46_20181126005948_781491.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '429.17', 1),
(135, 46, 'EN', 'consumption-promotion', 46, 'ครงการส่งเสริมการบริโภค และใช้วัตถุดิบสินค้า Q Eng', 'รูปเล่มรายงาน รายเดือน.xlsx', '', 'files/files/attach-files/46_20181126005948_468502.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '182.20', 2),
(136, 47, 'TH', 'budget-disbursement2', 47, 'เดือน พค 2561', 'พค.61.xlsx', '', 'files/files/attach-files/47_20181130160235_390457.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '68.74', 1),
(137, 47, 'EN', 'budget-disbursement2', 47, 'เดือน พค 2561', 'พค.61.xlsx', '', 'files/files/attach-files/47_20181130160235_786445.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '68.74', 2);

-- --------------------------------------------------------

--
-- Table structure for table `AttachFiles_Multi`
--

CREATE TABLE `AttachFiles_Multi` (
  `id` int(11) NOT NULL,
  `menu_type` varchar(150) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AttachFiles_Multi`
--

INSERT INTO `AttachFiles_Multi` (`id`, `menu_type`, `file_type`, `file_date`, `order_no`, `actives`, `create_date`, `update_date`) VALUES
(3, 'annually-report', NULL, NULL, 1, 'N', '2018-10-13 13:46:03', '2018-10-13 13:46:03'),
(4, 'annually-report', NULL, NULL, 2, 'Y', '2018-10-13 14:04:46', '2018-10-13 14:04:46'),
(5, 'annually-report', NULL, NULL, 3, 'Y', '2018-10-13 14:06:00', '2018-10-13 14:06:00'),
(6, 'annually-report', NULL, NULL, 4, 'N', '2018-10-13 14:06:40', '2018-10-13 14:06:40'),
(7, 'annually-report', NULL, NULL, 5, 'Y', '2018-10-13 14:09:04', '2018-10-13 14:09:04'),
(8, 'annually-report', NULL, NULL, 6, 'Y', '2018-10-13 14:09:05', '2018-10-13 14:09:05'),
(9, 'internal-audit', NULL, NULL, 1, 'Y', '2018-10-13 14:23:38', '2018-10-13 14:23:38'),
(10, 'ministerial-orders', 'เกี่ยวกับมาตรฐานบังคับ', NULL, 1, 'Y', '2018-10-17 05:58:29', '2018-10-17 07:13:25'),
(11, 'ministerial-orders', 'เกี่ยวกับมาตรฐานบังคับ', NULL, 2, 'Y', '2018-10-17 06:18:15', '2018-10-17 07:17:56'),
(12, 'ministerial-orders', 'เรื่องทั่วไป', NULL, 3, 'Y', '2018-10-17 06:23:31', '2018-10-17 07:18:37'),
(13, 'ministerial-orders', 'เรื่องทั่วไป', NULL, 4, 'Y', '2018-10-17 06:24:57', '2018-10-17 06:24:57'),
(14, 'ministerial-orders', NULL, NULL, 5, 'Y', '2018-10-17 06:30:05', '2018-10-17 06:30:05'),
(15, 'ministerial-orders', NULL, NULL, 6, 'Y', '2018-10-17 06:31:53', '2018-10-17 06:31:53'),
(16, 'ministerial-orders', NULL, NULL, 7, 'Y', '2018-10-17 06:35:25', '2018-10-17 06:35:25'),
(17, 'ministerial-orders', NULL, NULL, 8, 'Y', '2018-10-17 06:36:30', '2018-10-17 06:36:30'),
(18, 'ministerial-orders', NULL, NULL, 9, 'Y', '2018-10-17 06:39:57', '2018-10-17 06:39:57'),
(19, 'ministerial-orders', NULL, NULL, 10, 'Y', '2018-10-17 06:41:58', '2018-10-17 06:41:58'),
(20, 'ministerial-orders', NULL, NULL, 11, 'Y', '2018-10-17 06:42:45', '2018-10-17 06:42:45'),
(21, 'ministerial-orders', NULL, NULL, 12, 'Y', '2018-10-17 06:44:05', '2018-10-17 06:44:05'),
(22, 'ministerial-orders', NULL, NULL, 13, 'Y', '2018-10-17 06:46:15', '2018-10-17 06:46:15'),
(23, 'ministerial-orders', NULL, NULL, 14, 'Y', '2018-10-17 06:46:52', '2018-10-17 06:46:52'),
(24, 'ministerial-orders', 'เรื่องทั่วไป', NULL, 15, 'Y', '2018-10-17 06:48:14', '2018-10-17 06:48:14'),
(25, 'annually-report', NULL, NULL, 7, 'Y', '2018-10-17 18:08:36', '2018-10-17 18:08:36'),
(26, 'annually-report', NULL, NULL, 8, 'Y', '2018-10-17 18:09:34', '2018-10-17 18:09:34'),
(27, 'annually-report', NULL, NULL, 9, 'Y', '2018-10-17 18:13:32', '2018-10-17 18:13:32'),
(28, 'standard-act', NULL, NULL, 1, 'Y', '2018-10-18 06:37:29', '2018-10-18 06:37:29'),
(29, 'condition', 'null', NULL, 1, 'Y', '2018-10-22 18:04:05', '2018-10-22 18:22:15'),
(30, 'doc-confirm-work', 'null', NULL, 1, 'N', '2018-10-23 10:47:34', '2018-10-23 10:56:35'),
(31, 'clipping-news', '', NULL, 1, 'Y', '2018-10-26 11:46:09', '2018-10-26 11:46:09'),
(32, 'work-application', '', NULL, 1, 'Y', '2018-10-27 09:26:51', '2018-10-27 09:26:51'),
(33, 'skr', '', NULL, 1, 'Y', '2018-11-03 09:53:22', '2018-11-03 09:53:22'),
(34, 'paper', '', '2018-11-05', 1, 'Y', '2018-11-05 07:42:05', '2018-11-05 07:57:52'),
(35, 'rule-food', 'กฎ/ข้อกำหนด/ระเบียบเฉพาะเรื่อง', '0000-00-00', 1, 'Y', '2018-11-14 07:57:47', '2018-11-14 08:01:25'),
(36, 'manual-inspection', '', NULL, 1, 'Y', '2018-11-14 08:11:39', '2018-11-14 08:11:39'),
(37, 'permission', '', NULL, 1, 'Y', '2018-11-15 06:11:13', '2018-11-15 06:11:13'),
(38, 'patrol', '', NULL, 1, 'Y', '2018-11-15 06:49:25', '2018-11-15 06:49:25'),
(39, 'patrol', '', NULL, 1, 'Y', '2018-11-15 07:06:46', '2018-11-15 07:06:46'),
(40, 'patrol', '', NULL, 1, 'Y', '2018-11-15 07:07:38', '2018-11-15 07:07:38'),
(41, 'patrol', '', NULL, 1, 'Y', '2018-11-15 07:12:06', '2018-11-15 07:12:06'),
(42, 'patrol', '', NULL, 1, 'Y', '2018-11-15 07:12:47', '2018-11-15 07:12:47'),
(43, 'patrol', 'รายละเอียดโครงการ', NULL, 1, 'Y', '2018-11-15 07:15:47', '2018-11-15 07:15:47'),
(44, 'integration', '', NULL, 1, 'Y', '2018-11-15 07:22:17', '2018-11-15 07:22:17'),
(45, 'standard-logo', '', '1900-12-01', 1, 'Y', '2018-11-20 12:28:07', '2018-11-20 12:29:47'),
(46, 'consumption-promotion', '', NULL, 1, 'Y', '2018-11-26 00:59:48', '2018-11-26 00:59:48'),
(47, 'budget-disbursement2', '', NULL, 1, 'Y', '2018-11-30 16:02:35', '2018-11-30 16:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `Branchs`
--

CREATE TABLE `Branchs` (
  `branchID` int(11) NOT NULL,
  `branchNameThai` varchar(50) NOT NULL,
  `branchNameEng` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Branchs`
--

INSERT INTO `Branchs` (`branchID`, `branchNameThai`, `branchNameEng`) VALUES
(1, 'พืช', ''),
(2, 'ประมง', ''),
(3, 'ปศุสัตว์', ''),
(4, 'สินค้าที่ไม่ใช่อาหาร', '');

-- --------------------------------------------------------

--
-- Table structure for table `Budget_Disbursement`
--

CREATE TABLE `Budget_Disbursement` (
  `id` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `filePath` varchar(512) NOT NULL,
  `years` int(11) NOT NULL,
  `months` int(11) NOT NULL,
  `orderNo` int(11) NOT NULL,
  `createDate` datetime NOT NULL,
  `createBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Budget_Disbursement`
--

INSERT INTO `Budget_Disbursement` (`id`, `fileName`, `filePath`, `years`, `months`, `orderNo`, `createDate`, `createBy`) VALUES
(1, 'พย 60.xlsx', 'files/files/budget-disbursement/20181129151519_355060.xlsx', 2017, 11, 0, '0000-00-00 00:00:00', 1093840);

-- --------------------------------------------------------

--
-- Table structure for table `Budget_Disbursement_Item`
--

CREATE TABLE `Budget_Disbursement_Item` (
  `id` int(11) NOT NULL,
  `budget_id` int(11) NOT NULL,
  `item` varchar(512) NOT NULL,
  `staff` decimal(16,2) NOT NULL,
  `operating` decimal(16,2) NOT NULL,
  `investing` decimal(16,2) NOT NULL,
  `subsidy` decimal(16,2) NOT NULL,
  `other` decimal(16,2) NOT NULL,
  `subtotal` decimal(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Budget_Disbursement_Item`
--

INSERT INTO `Budget_Disbursement_Item` (`id`, `budget_id`, `item`, `staff`, `operating`, `investing`, `subsidy`, `other`, `subtotal`) VALUES
(1, 1, 'ยอดได้รับตาม พ.ร.บ. งบประมาณ', '83.47', '85.40', '28.90', '5.43', '106.22', '309.42'),
(2, 1, 'ยอดเบิกจ่ายจากระบบ GFMIS', '13.81', '6.13', '0.00', '5.10', '5.09', '30.14'),
(3, 1, '%การเบิกจ่าย', '16.55', '7.18', '0.00', '93.93', '4.79', '9.74');

-- --------------------------------------------------------

--
-- Table structure for table `Certification_Code`
--

CREATE TABLE `Certification_Code` (
  `id` int(11) NOT NULL,
  `page_type` varchar(255) NOT NULL,
  `operator_name_th` varchar(512) NOT NULL,
  `operator_name_en` varchar(512) DEFAULT NULL,
  `scope_th` varchar(512) NOT NULL,
  `scope_en` varchar(512) DEFAULT NULL,
  `province_th` varchar(100) NOT NULL,
  `province_en` varchar(100) DEFAULT NULL,
  `standard_th` varchar(512) DEFAULT NULL,
  `standard_en` varchar(512) DEFAULT NULL,
  `auditor_th` varchar(255) NOT NULL,
  `auditor_en` varchar(255) DEFAULT NULL,
  `product_th` varchar(512) NOT NULL,
  `product_en` varchar(512) DEFAULT NULL,
  `accredit_stadard_th` varchar(512) NOT NULL,
  `accredit_stadard_en` varchar(512) DEFAULT NULL,
  `address_th` varchar(512) NOT NULL,
  `address_en` varchar(512) DEFAULT NULL,
  `farm_th` varchar(512) DEFAULT NULL,
  `farm_en` varchar(512) DEFAULT NULL,
  `status_th` varchar(100) NOT NULL,
  `status_en` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Certification_Code`
--

INSERT INTO `Certification_Code` (`id`, `page_type`, `operator_name_th`, `operator_name_en`, `scope_th`, `scope_en`, `province_th`, `province_en`, `standard_th`, `standard_en`, `auditor_th`, `auditor_en`, `product_th`, `product_en`, `accredit_stadard_th`, `accredit_stadard_en`, `address_th`, `address_en`, `farm_th`, `farm_en`, `status_th`, `status_en`, `start_date`, `end_date`, `create_date`, `update_date`) VALUES
(1, 'certification-code', 'akdsjh', 'kajshd', 'kajshd', 'kajshd', 'อ่างทอง', 'Ang Thong', '', '', 'kajshd', 'kasjhd', 'kasjhd', 'kjahsd', 'kjhasd', 'kjahsd', 'kjahsd', 'kjashd', '', '', 'asdkjh', 'kkk', '2018-11-22', '2018-11-30', '2018-11-22 23:42:20', '2018-11-22 23:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `Comment`
--

CREATE TABLE `Comment` (
  `id` int(11) NOT NULL,
  `listening_id` int(11) NOT NULL,
  `firstname` varchar(70) NOT NULL,
  `lastname` varchar(70) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `job` enum('นักเรียน/นักศึกษา','พนักงาน','ข้าราชการ/พนักงานรัฐวิสาหกิจ','เจ้าของกิจการ/ธุรกิจ','อื่นๆ') NOT NULL,
  `other_job` varchar(100) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `comment` enum('1','2','3','4') NOT NULL,
  `agree_comment` varchar(255) DEFAULT NULL,
  `disagree_comment` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comment`
--

INSERT INTO `Comment` (`id`, `listening_id`, `firstname`, `lastname`, `tel`, `email`, `job`, `other_job`, `workplace`, `province`, `postcode`, `comment`, `agree_comment`, `disagree_comment`, `create_date`) VALUES
(1, 0, '', '', NULL, NULL, 'นักเรียน/นักศึกษา', NULL, NULL, NULL, NULL, '1', NULL, NULL, '2018-10-19 13:44:15'),
(2, 7, 'asd', 'asda', '123123', 'kasjd@asld.cpom', 'ข้าราชการ/พนักงานรัฐวิสาหกิจ', NULL, 'asdasd', 'สมุทรปราการ', '50100', '2', NULL, NULL, '2018-10-19 13:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `Commodity_Keywords`
--

CREATE TABLE `Commodity_Keywords` (
  `keywordID` int(11) NOT NULL,
  `standardID` int(11) DEFAULT NULL,
  `keywordLang` char(2) NOT NULL COMMENT 'TH,EN',
  `keyword` varchar(45) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Commodity_Keywords`
--

INSERT INTO `Commodity_Keywords` (`keywordID`, `standardID`, `keywordLang`, `keyword`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(2, 3, 'TH', 'ทดสอบ', '1093840', '2018-07-29 11:42:06', '1093840', '2018-10-21 10:51:55'),
(3, 3, 'EN', 'test1', '1093840', '2018-07-29 11:42:06', '1093840', '2018-10-21 10:51:55'),
(4, 3, 'TH', 'เทส', '1093840', '2018-07-29 11:48:22', '1093840', '2018-10-21 10:51:55'),
(5, 3, 'EN', 'aasdasd', '1093840', '2018-07-29 11:49:42', '1093840', '2018-10-21 10:51:55'),
(6, 4, 'TH', 'sasdad', '1093840', '2018-08-08 11:36:52', '1093840', '2018-10-21 10:51:42'),
(7, 4, 'TH', 'asdasd', '1093840', '2018-08-08 11:36:52', '1093840', '2018-10-21 10:51:42'),
(8, 4, 'EN', 'asdasd', '1093840', '2018-08-08 11:36:52', '1093840', '2018-10-21 10:51:42'),
(9, 4, 'EN', 'qweqwe', '1093840', '2018-08-08 11:36:52', '1093840', '2018-10-21 10:51:42'),
(10, 5, 'TH', 'asd', '1093840', '2018-08-08 11:41:16', '1093840', '2018-11-22 09:13:13'),
(11, 5, 'EN', 'asd', '1093840', '2018-08-08 11:41:16', '1093840', '2018-11-22 09:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `Commodity_Standards`
--

CREATE TABLE `Commodity_Standards` (
  `standardID` int(11) NOT NULL,
  `years` varchar(10) DEFAULT NULL,
  `standardNameThai` varchar(128) DEFAULT NULL,
  `standardNameEng` varchar(128) DEFAULT NULL,
  `standardType` varchar(50) DEFAULT NULL,
  `standardCategory` varchar(45) DEFAULT NULL,
  `productType` varchar(45) DEFAULT NULL,
  `noThai` varchar(45) DEFAULT NULL,
  `bookNumberThai` varchar(128) DEFAULT NULL,
  `noEng` varchar(45) DEFAULT NULL,
  `bookNumberEng` varchar(128) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `step` enum('1','2','3','4','5','6','7','8','9') DEFAULT '1',
  `status` enum('Active','Inactive') DEFAULT NULL,
  `standardFileName` varchar(255) DEFAULT NULL,
  `standardFilePath` varchar(500) DEFAULT NULL,
  `academicBoardName` varchar(50) DEFAULT NULL,
  `standardDefineType` varchar(50) DEFAULT NULL,
  `standardPublishingType` varchar(50) DEFAULT NULL,
  `standardGroup` varchar(50) DEFAULT NULL,
  `secondaryCode` varchar(50) DEFAULT NULL,
  `accreditationScope` varchar(50) DEFAULT NULL,
  `useDate` datetime DEFAULT NULL,
  `cancelledDate` datetime DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Commodity_Standards`
--

INSERT INTO `Commodity_Standards` (`standardID`, `years`, `standardNameThai`, `standardNameEng`, `standardType`, `standardCategory`, `productType`, `noThai`, `bookNumberThai`, `noEng`, `bookNumberEng`, `detail`, `step`, `status`, `standardFileName`, `standardFilePath`, `academicBoardName`, `standardDefineType`, `standardPublishingType`, `standardGroup`, `secondaryCode`, `accreditationScope`, `useDate`, `cancelledDate`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(3, '2561', 'asdasd', 'as asdasd', 'มาตรฐานข้อกำหนดทั่วไป', '2', '2', '111', '222', '333', '444', 'รายละเอียดเพิ่มเติม', '1', 'Active', 'null', 'null', 'asdkjasd', 'บังคับ', 'บังคับ', 'สัตว์น้ำ', '111', 'ISO 17020', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'null', '2018-07-29 00:00:00', '1093840', '2018-10-21 10:51:55'),
(4, '2561', 'asdasd', 'asdasd', 'มาตรฐานระบบ', '2', '2', 'asdasd', 'and', 'andasd', 'asdasd', 'asdasd', '1', 'Active', 'null', 'null', 'null', 'ทั่วไป', 'ทั่วไป', 'ปศุสัตว์', 'null', 'null', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1093840', '2013-11-09 11:36:52', '1093840', '2018-10-21 10:51:42'),
(5, '2561', 'ZX', 'asd', 'มาตรฐานสินค้า', '2', '1', 'asads', 'asd', 'asd', 'asd', 'asd', '1', 'Active', '', '', 'test group', 'ทั่วไป', 'ทั่วไป', 'พืช', '', 'ISO 17065', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1093840', '2018-08-08 11:41:15', '1093840', '2018-11-22 09:13:13'),
(6, '2561', 'ZX', 'asd', 'General', '2', '1', 'asads', 'asd', 'asd', 'asd', 'asd', '9', 'Active', 'ระบบสนับสนุนมาตรฐานสินค้าเกษตร.xlsx', 'files/files/commodity-standard/20180814093238_451863.xlsx', 'null', NULL, NULL, NULL, NULL, NULL, '2018-08-13 17:00:00', '0000-00-00 00:00:00', '1093840', '2018-08-08 11:41:15', '1093840', '2018-08-14 09:32:38'),
(7, '2561', 'asdasd', 'asdasd', 'General', '2', '2', 'asdasd', 'and', 'andasd', 'asdasd', 'asdasd', '1', 'Inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-14 00:00:00', NULL, '1093840', '2018-08-08 11:36:52', '1093840', '2018-08-08 11:36:52'),
(8, '2561', 'asdasd', 'as asdasd', 'มาตรฐานสินค้า', '2', '2', '111', '222', '333', '444', 'รายละเอียดเพิ่มเติม', '9', 'Active', 'null', 'null', 'null', 'บังคับ', 'บังคับ', 'อื่นๆ', 'null', 'ISO 17065', '2018-10-20 17:00:00', '0000-00-00 00:00:00', 'null', '2018-07-29 00:00:00', '1093840', '2018-10-21 10:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `ContactUs`
--

CREATE TABLE `ContactUs` (
  `id` int(11) NOT NULL,
  `address_th` text NOT NULL,
  `address_en` text NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(70) NOT NULL,
  `url_google` text NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_path` varchar(512) NOT NULL,
  `map_name` varchar(255) NOT NULL,
  `map_path` varchar(512) NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ContactUs`
--

INSERT INTO `ContactUs` (`id`, `address_th`, `address_en`, `tel`, `email`, `url_google`, `image_name`, `image_path`, `map_name`, `map_path`, `update_date`) VALUES
(1, 'สำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติ    	   เลขที่ 50 ถนนพหลโยธิน แขวงลาดยาว เขตจตุจักร กรุงเทพมหานคร 10900', 'สำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติ    	   เลขที่ 50 ถนนพหลโยธิน แขวงลาดยาว เขตจตุจักร กรุงเทพมหานคร 10900', '062-561-2277', 'ict.acfs@gmail.com', 'https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d15110.924974586307!2d98.94109414999998!3d18.765538!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sth!4v1541755816443', '232652.jpg', 'files/files/contactus/20181109102451_292047.jpg', '233277.jpg', 'files/files/contactus/20181109101922_195679.jpg', '2018-11-10 09:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `Country_List`
--

CREATE TABLE `Country_List` (
  `id` int(11) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  `org_th` varchar(255) NOT NULL,
  `org_en` varchar(255) DEFAULT NULL,
  `country_th` varchar(255) DEFAULT NULL,
  `country_en` varchar(255) DEFAULT NULL,
  `standard_name` varchar(512) DEFAULT NULL,
  `standard_name_th` varchar(255) DEFAULT NULL,
  `standard_name_en` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `link_url` text,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Country_List`
--

INSERT INTO `Country_List` (`id`, `menu_type`, `org_th`, `org_en`, `country_th`, `country_en`, `standard_name`, `standard_name_th`, `standard_name_en`, `link_name`, `link_url`, `file_name`, `file_path`, `release_date`, `create_date`, `update_date`) VALUES
(1, 'standard-country', 'asdasd', 'kjasd', 'asd', 'kasd', 'kahsdjkhasd', NULL, NULL, 'kjasdhakjsd', 'www.google.com', 'ปฎิทินกิจกรรมประจำเดือน พฤศจิกายน 2561 - เพิ่.doc', 'files/files/country-list/20181121085415_208288.doc', NULL, '2018-11-21 08:54:15', '2018-11-21 08:54:15'),
(2, 'standard-country', 'ฟาหก่้า', 'kasjdh', 'า่้ฟหก่้', 'kajsdjh', 'aksjhd', NULL, NULL, 'kajsdakjshd', 'www.google.com', '1541060134556.jpg', 'files/files/country-list/20181121085607_549589.jpg', NULL, '2018-11-21 08:56:07', '2018-11-21 08:56:07'),
(3, 'auditor-country', 'asdkjh', 'kjahsdk', 'kjhaskdjh', 'kjahsdh', 'kjaksdhkj', NULL, NULL, 'askdjhkj', 'kajshdkhasd', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'files/files/country-list/20181121092348_832077.pages', '2018-11-21', '2018-11-21 09:23:48', '2018-11-21 09:23:48'),
(4, 'accept-standard', 'gfddf', NULL, NULL, NULL, 'jhhg', 'gfdf', 'gfdf', NULL, NULL, NULL, NULL, NULL, '2018-11-22 07:25:40', '2018-11-22 07:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `Emails`
--

CREATE TABLE `Emails` (
  `emailID` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Emails`
--

INSERT INTO `Emails` (`emailID`, `email`, `password`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(2, 'korapotu@gmail.com', 'Aommy1989', '1093840', '2018-08-09 09:54:57', '1093840', '2018-08-09 09:54:57');

-- --------------------------------------------------------

--
-- Table structure for table `Email_Commodity`
--

CREATE TABLE `Email_Commodity` (
  `emailCommodityID` int(11) NOT NULL,
  `emailID` int(11) NOT NULL,
  `standardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Email_Commodity`
--

INSERT INTO `Email_Commodity` (`emailCommodityID`, `emailID`, `standardID`) VALUES
(3, 2, 3),
(4, 2, 4),
(5, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `FooterLink`
--

CREATE TABLE `FooterLink` (
  `id` int(11) NOT NULL,
  `link_type` varchar(50) NOT NULL,
  `link_name` varchar(512) NOT NULL,
  `link_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FooterLink`
--

INSERT INTO `FooterLink` (`id`, `link_type`, `link_name`, `link_url`) VALUES
(2, 'พ.ร.บ.มาตรฐานสินค้าเกษตร', 'พ.ร.บ.มาตรฐานสินค้าเกษตร', 'http://www.google.com'),
(3, 'การรับรอง', 'การตรวจสอบและรับรอง', 'https://www.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1`
--

CREATE TABLE `Form_Data1` (
  `id` int(11) NOT NULL,
  `menu_type` varchar(150) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_address` text NOT NULL,
  `code_number` varchar(70) DEFAULT NULL,
  `operator_type` enum('government','private') DEFAULT NULL,
  `contact_name` varchar(150) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_fax` varchar(20) DEFAULT NULL,
  `cert_number` varchar(100) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1`
--

INSERT INTO `Form_Data1` (`id`, `menu_type`, `group_name`, `group_address`, `code_number`, `operator_type`, `contact_name`, `contact_phone`, `contact_fax`, `cert_number`, `file_name`, `file_path`, `actives`, `create_date`, `update_date`) VALUES
(1, 'certification-list', 'alsdkj', 'asdljasd', '', '', '', '', '', '', '', '', 'Y', '2018-10-25 10:09:53', '2018-11-19 06:05:19'),
(2, 'certification-list', 'asdasd', 'asdkh asldj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-10-25 10:17:39', '2018-10-25 10:17:39'),
(8, 'certification-list', 'asdasd', 'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-10-25 10:25:46', '2018-10-25 10:25:46'),
(9, 'certification-list', 'asdkjh', 'a;sldlkasd', '', '', '', '', '', '', '', '', 'Y', '2018-10-25 10:55:48', '2018-11-19 06:08:23'),
(10, 'ib-list', 'ib unit', 'asdkjahsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-11-13 08:40:08', '2018-11-13 08:40:08'),
(11, 'operator-list', 'asda', 'and asdasd', 'askdjhaksd', 'private', 'asdasd', '0019283', '0181276386', 'sdhk12308', 'null', 'null', 'Y', '2018-11-13 20:25:20', '2018-11-13 21:08:34'),
(12, 'operator-list', 'asdkj', 'lkajskd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-11-13 21:12:34', '2018-11-13 21:12:34'),
(13, 'operator-list', 'asdkhj', 'kjhaskdjhajksd', 'kjhasdhkjh', 'private', 'asd,j', '102938', '09810238', 'askjdhkajshd', '_20181113212329_786202.docx', 'files/files/form-data1/_20181113212329_786202.docx', 'Y', '2018-11-13 21:18:54', '2018-11-13 21:23:29'),
(14, 'operator-list', 'asdkj', 'alksjdhasd', 'o123', 'government', 'asdasjd', '01928319023', '091823918023', NULL, NULL, NULL, 'Y', '2018-11-13 21:25:45', '2018-11-13 21:25:45'),
(15, 'customer-list', 'ฟหาก้่ฟหก', '', 'ฟหัีเกแ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-11-14 07:24:15', '2018-11-14 07:24:15'),
(16, 'customer-list', 'asjdhhjgadjh', '', 'asdkjho2qihjda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-11-14 07:26:05', '2018-11-14 07:26:05'),
(17, 'customer-list', 'asdjhgas', '', 'asjhashd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2018-11-14 07:28:00', '2018-11-14 07:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_Certification`
--

CREATE TABLE `Form_Data1_Certification` (
  `id` int(11) NOT NULL,
  `scope_id` int(11) NOT NULL,
  `certification` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_Detail`
--

CREATE TABLE `Form_Data1_Detail` (
  `id` int(11) NOT NULL,
  `form_data1_id` int(11) NOT NULL,
  `item_no` varchar(100) NOT NULL,
  `iso` int(11) NOT NULL,
  `normative` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `usage_status` enum('การบังคับใช้','ลดขอบข่าย','การบังคับใช้,ลดขอบข่าย','ลดขอบข่าย,การบังคับใช้') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_Detail`
--

INSERT INTO `Form_Data1_Detail` (`id`, `form_data1_id`, `item_no`, `iso`, `normative`, `file_name`, `file_path`, `start_date`, `end_date`, `usage_status`) VALUES
(1, 1, '0019283', 1, 'aaa', 'null', 'null', '2018-11-18', '2018-11-29', 'การบังคับใช้,ลดขอบข่าย'),
(2, 2, '0019283', 1, 'nn1', NULL, NULL, '0000-00-00', '0000-00-00', NULL),
(3, 8, 'and', 1, 'asdasd', '_20181025102546_387217.pdf', 'files/files/form-data1/_20181025102546_387217.pdf', '2018-10-24', '2018-10-30', NULL),
(4, 9, 'asdjhg', 1, 'aasdk asdl', '9_20181025105548_817191.jpg', 'files/files/form-data1/9_20181025105548_817191.jpg', '2018-10-24', '2018-10-01', 'การบังคับใช้,ลดขอบข่าย'),
(5, 10, '01208310923', 1, 'n 1', NULL, NULL, '2018-11-12', '2018-11-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_License`
--

CREATE TABLE `Form_Data1_License` (
  `id` int(11) NOT NULL,
  `form_data1_id` int(11) NOT NULL,
  `license_no` varchar(70) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_License`
--

INSERT INTO `Form_Data1_License` (`id`, `form_data1_id`, `license_no`, `file_name`, `file_path`, `start_date`, `end_date`) VALUES
(1, 11, '918273', '11_20181113202520_436670.docx', 'files/files/form-data1/11_20181113202520_436670.docx', '2018-11-13', '2018-11-13'),
(2, 12, 'aksjhd', '12_20181113211234_279701.docx', 'files/files/form-data1/12_20181113211234_279701.docx', '2018-11-13', '2018-11-13'),
(3, 13, 'asdkl', '13_20181113211854_316328.pages', 'files/files/form-data1/13_20181113211854_316328.pages', '2018-11-13', '2018-11-29'),
(4, 14, '01823091823', NULL, NULL, '2018-11-13', '2018-11-29');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_Product_Inspect`
--

CREATE TABLE `Form_Data1_Product_Inspect` (
  `id` int(11) NOT NULL,
  `standard_id` int(11) NOT NULL,
  `inspect_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_Product_Inspect`
--

INSERT INTO `Form_Data1_Product_Inspect` (`id`, `standard_id`, `inspect_name`) VALUES
(1, 2, 'kjhasd'),
(2, 3, 'ljlkjskldjalsd'),
(3, 4, 'laksjdasd');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_Scope`
--

CREATE TABLE `Form_Data1_Scope` (
  `id` int(11) NOT NULL,
  `form_data1_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `iso` int(11) NOT NULL,
  `scope_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_Scope`
--

INSERT INTO `Form_Data1_Scope` (`id`, `form_data1_id`, `detail_id`, `iso`, `scope_name`) VALUES
(1, 1, 1, 2, 'null'),
(2, 2, 2, 2, NULL),
(3, 2, 3, 2, NULL),
(4, 9, 4, 2, 'null'),
(5, 4, 5, 2, NULL),
(6, 13, 0, 2, NULL),
(7, 14, 0, 2, NULL),
(8, 15, 0, 0, NULL),
(9, 16, 0, 0, 'jhagsdhagd'),
(10, 17, 0, 0, 'jhaGJH');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_StandardARC`
--

CREATE TABLE `Form_Data1_StandardARC` (
  `id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `arc_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_StandardARC`
--

INSERT INTO `Form_Data1_StandardARC` (`id`, `detail_id`, `arc_name`) VALUES
(1, 1, 'asdklj'),
(2, 2, 'test act'),
(3, 3, 'asdasd'),
(4, 4, 'sadkjhasd'),
(5, 5, 'standard 1');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_Standard_Checked`
--

CREATE TABLE `Form_Data1_Standard_Checked` (
  `id` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `standard_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_Standard_Checked`
--

INSERT INTO `Form_Data1_Standard_Checked` (`id`, `license_id`, `standard_name`) VALUES
(1, 1, 'asked'),
(2, 2, 'askdh'),
(3, 3, 'asjhdkqds'),
(4, 4, 'lasdkjalsdj');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Data1_SubScope`
--

CREATE TABLE `Form_Data1_SubScope` (
  `id` int(11) NOT NULL,
  `scope_id` int(11) NOT NULL,
  `iso` int(11) NOT NULL,
  `subscope_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Form_Data1_SubScope`
--

INSERT INTO `Form_Data1_SubScope` (`id`, `scope_id`, `iso`, `subscope_name`) VALUES
(1, 1, 3, 'null'),
(2, 2, 3, NULL),
(3, 3, 3, NULL),
(4, 4, 3, 'null'),
(5, 5, 3, NULL),
(6, 6, 3, NULL),
(7, 7, 3, NULL),
(8, 8, 0, NULL),
(9, 8, 0, NULL),
(10, 9, 0, 'jahsdjhasgd asjhdhjasd'),
(11, 9, 0, 'asdjhgahsdg'),
(12, 10, 0, 'kahsgdsd');

-- --------------------------------------------------------

--
-- Table structure for table `Freq_Question`
--

CREATE TABLE `Freq_Question` (
  `id` int(11) NOT NULL,
  `question_type` enum('มาตรฐาน','การรับรอง','เกษตรดิจิทัล','การควบคุม','ความรู้ทั่วไป','พ.ร.บ. มาตรฐานสินค้าเกษตร') NOT NULL,
  `question_th` varchar(512) NOT NULL,
  `question_en` varchar(512) DEFAULT NULL,
  `answer_th` text NOT NULL,
  `answer_en` text,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `order_no` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Freq_Question`
--

INSERT INTO `Freq_Question` (`id`, `question_type`, `question_th`, `question_en`, `answer_th`, `answer_en`, `actives`, `order_no`, `create_date`, `update_date`) VALUES
(1, 'มาตรฐาน', 'การกำหนดมาตรฐานมีกี่ประเภท อะไรบ้าง', 'question 1', 'มาตรฐานสินค้า เป็นมาตรฐานที่กำหนดขึ้นเพื่อใช้เป็นเกณฑ์ระดับประเทศในการผลิต การค้าในประเทศ การส่งออกนำเข้า และการตรวจรับรองสินค้าโดยข้อกำหนดครอบคลุมทั้งด้านความปลอดภัยและคุณภาพที่จำเป็นที่ผู้บริโภคต้องการมาตรฐานสินค้าเกษตรที่เป็นผลผลิต เช่น ข้าวหอมมะลิ ทุเรียน มะม่วง หน่อไม้ฝรั่ง กล้วยไม้ เนื้อโค เนื้อสุกร ปลานิล เป็นต้น มาตรฐานสินค้าเกษตรแปรรูปขั้นต้นหรืออาหารแปรรูป เช่น ลำไยอบแห้ง กะทิ ซูริมิ เป็นต้น', 'answer 1', 'Y', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'มาตรฐาน', 'มาตรฐานสินค้าเกษตรและอาหาร มีประโยชน์อย่างไร', 'มาตรฐานสินค้าเกษตรและอาหาร มีประโยชน์อย่างไร', 'ด้านการผลิต สามารถนำไปใช้เป็นเกณฑ์ปฏิบัติในการผลิต ทั้งมาตรฐานระบบการผลิตที่อธิบายข้อกำหนดและคำแนะนำการปฏิบัติที่ดีในการผลิตหรือมาตรฐานสินค้าที่จะช่วยให้ผู้ผลิตปรับปรุงคุณภาพ รวมทั้งจัดชั้นคุณภาพของผลผลิตและสินค้าเกษตรได้อย่างเหมาะสมเป็นเกณฑ์เดียวกันทั้งประเทศและสอดคล้องกับเกณฑ์สากลด้วย', 'ด้านการผลิต สามารถนำไปใช้เป็นเกณฑ์ปฏิบัติในการผลิต ทั้งมาตรฐานระบบการผลิตที่อธิบายข้อกำหนดและคำแนะนำการปฏิบัติที่ดีในการผลิตหรือมาตรฐานสินค้าที่จะช่วยให้ผู้ผลิตปรับปรุงคุณภาพ รวมทั้งจัดชั้นคุณภาพของผลผลิตและสินค้าเกษตรได้อย่างเหมาะสมเป็นเกณฑ์เดียวกันทั้งประเทศและสอดคล้องกับเกณฑ์สากลด้วย', 'Y', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Fruit`
--

CREATE TABLE `Fruit` (
  `id` int(11) NOT NULL,
  `name_th` varchar(100) NOT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `name_science` varchar(512) DEFAULT NULL,
  `color_th` varchar(70) DEFAULT NULL,
  `color_en` varchar(70) DEFAULT NULL,
  `flavour_th` varchar(255) DEFAULT NULL,
  `flavour_en` varchar(255) DEFAULT NULL,
  `shape_th` varchar(512) DEFAULT NULL,
  `shape_en` varchar(512) DEFAULT NULL,
  `season_from` int(11) DEFAULT NULL,
  `season_to` int(11) DEFAULT NULL,
  `prepare_to_eat_th` text,
  `prepare_to_eat_en` text,
  `usage_th` varchar(512) DEFAULT NULL,
  `usage_en` varchar(512) DEFAULT NULL,
  `storage_th` varchar(512) DEFAULT NULL,
  `storage_en` varchar(512) DEFAULT NULL,
  `energy` varchar(50) DEFAULT NULL,
  `protein` varchar(50) DEFAULT NULL,
  `fat` varchar(50) DEFAULT NULL,
  `carbohydrate` varchar(50) DEFAULT NULL,
  `fiber` varchar(50) DEFAULT NULL,
  `calcium` varchar(50) DEFAULT NULL,
  `phosphorus` varchar(50) DEFAULT NULL,
  `steel` varchar(50) DEFAULT NULL,
  `potassium` varchar(50) DEFAULT NULL,
  `magnesium` varchar(50) DEFAULT NULL,
  `vitamin_e` varchar(50) DEFAULT NULL,
  `vitamin_b_ty_amine` varchar(50) DEFAULT NULL,
  `vitamin_b_riboflavin` varchar(50) DEFAULT NULL,
  `vitamin_b1_b2` varchar(50) DEFAULT NULL,
  `vitamin_c` varchar(50) DEFAULT NULL,
  `niacin` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Fruit`
--

INSERT INTO `Fruit` (`id`, `name_th`, `name_en`, `name_science`, `color_th`, `color_en`, `flavour_th`, `flavour_en`, `shape_th`, `shape_en`, `season_from`, `season_to`, `prepare_to_eat_th`, `prepare_to_eat_en`, `usage_th`, `usage_en`, `storage_th`, `storage_en`, `energy`, `protein`, `fat`, `carbohydrate`, `fiber`, `calcium`, `phosphorus`, `steel`, `potassium`, `magnesium`, `vitamin_e`, `vitamin_b_ty_amine`, `vitamin_b_riboflavin`, `vitamin_b1_b2`, `vitamin_c`, `niacin`, `create_date`, `update_date`) VALUES
(1, 'askdjh', 'kjh', 'kjh', 'kjh', 'kjh', 'jkh', 'kjhj', 'hkh', 'kph', 2, 3, '-kjh\r\n-asdlaksjd\r\n-asdlasd', '-kjh\r\n-asdlaksjd\r\n-asdlasd', 'kjh', 'kjh', 'kjh', 'kph11', '11', '11', '11', '11', '11', '11', '11', '11', '11', '11', '11', '11', '11', '22', '33', '44', '2018-11-28 23:42:08', '2018-11-29 08:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `Geographies`
--

CREATE TABLE `Geographies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 8192 kB';

--
-- Dumping data for table `Geographies`
--

INSERT INTO `Geographies` (`id`, `name`) VALUES
(1, 'ภาคเหนือ'),
(2, 'ภาคกลาง'),
(3, 'ภาคตะวันออกเฉียงเหนือ'),
(4, 'ภาคตะวันตก'),
(5, 'ภาคตะวันออก'),
(6, 'ภาคใต้');

-- --------------------------------------------------------

--
-- Table structure for table `Hearing_Report`
--

CREATE TABLE `Hearing_Report` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `service_type` enum('หน่วยงานราชการ / รัฐวิสาหกิจ','บริษัท/ห้างร้าน/เอกชน','สื่อมวลชน','ประชาชนทั่วไป','นักเรียน/นิสิต/นักศึกษา','องค์กรอิสระ/หน่วยงานอิสระ','อื่นๆ') NOT NULL,
  `gender` enum('ชาย','หญิง') NOT NULL,
  `age` enum('ต่ำกว่า 18 ปี','18-25 ปี','26-35 ปี','36-45 ปี','46-55 ปี','56 ปี ขึ้นไป') NOT NULL,
  `visit_website_time` enum('06.00-10.00 น.','10.00-14.00 น.','14.00-18.00 น.','18.00-22.00 น.','22.00-02.00 น.','02.00-06.00 น.') NOT NULL,
  `total_visit` int(11) NOT NULL,
  `time_visit` int(11) NOT NULL,
  `color_font_size` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `picture_symbol` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `group_data` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `external_link` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `user_friendly` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `up_to_date` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `correction` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `attractive` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `clarity` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `speed_data` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `benefit` enum('ดี','พอใช้','ควรปรับปรุง') NOT NULL,
  `comment` text,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Hearing_Report`
--

INSERT INTO `Hearing_Report` (`id`, `firstname`, `lastname`, `service_type`, `gender`, `age`, `visit_website_time`, `total_visit`, `time_visit`, `color_font_size`, `picture_symbol`, `group_data`, `external_link`, `user_friendly`, `up_to_date`, `correction`, `attractive`, `clarity`, `speed_data`, `benefit`, `comment`, `create_date`) VALUES
(1, 'askjdh', 'kajshd', 'หน่วยงานราชการ / รัฐวิสาหกิจ', '', 'ต่ำกว่า 18 ปี', '02.00-06.00 น.', 20, 60, 'พอใช้', 'ดี', 'พอใช้', 'ดี', 'ควรปรับปรุง', 'พอใช้', 'ดี', 'พอใช้', 'ดี', 'ดี', 'พอใช้', NULL, '2018-11-26 00:46:39'),
(2, 'alskdj', 'sadly', 'บริษัท/ห้างร้าน/เอกชน', '', 'ต่ำกว่า 18 ปี', '10.00-14.00 น.', 10, 10, 'พอใช้', 'พอใช้', 'ดี', 'ดี', 'พอใช้', 'พอใช้', 'ดี', 'ดี', 'ควรปรับปรุง', 'ดี', 'พอใช้', 'asjhdgasd', '2018-11-26 00:49:27'),
(3, 'alskdj', 'sadly', 'บริษัท/ห้างร้าน/เอกชน', '', 'ต่ำกว่า 18 ปี', '10.00-14.00 น.', 10, 10, 'พอใช้', 'พอใช้', 'ดี', 'ดี', 'พอใช้', 'พอใช้', 'ดี', 'ดี', 'ควรปรับปรุง', 'ดี', 'พอใช้', 'asjhdgasd', '2018-11-26 00:51:02'),
(4, 'alskdj', 'sadly', 'บริษัท/ห้างร้าน/เอกชน', '', 'ต่ำกว่า 18 ปี', '10.00-14.00 น.', 10, 10, 'พอใช้', 'พอใช้', 'ดี', 'ดี', 'พอใช้', 'พอใช้', 'ดี', 'ดี', 'ควรปรับปรุง', 'ดี', 'พอใช้', 'asjhdgasd', '2018-11-26 00:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `Hearing_Report_Detail`
--

CREATE TABLE `Hearing_Report_Detail` (
  `id` bigint(20) NOT NULL,
  `hearing_report_id` int(11) NOT NULL,
  `detail_desc` varchar(255) NOT NULL,
  `hearing_report_type` enum('Chanel','DataType') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Hearing_Report_Detail`
--

INSERT INTO `Hearing_Report_Detail` (`id`, `hearing_report_id`, `detail_desc`, `hearing_report_type`) VALUES
(1, 3, 'แผ่นพับ/โบรชัวร์', 'Chanel'),
(2, 3, 'การจัดนิทรรศการ', 'Chanel'),
(3, 4, 'แผ่นพับ/โบรชัวร์', 'Chanel'),
(4, 4, 'การจัดนิทรรศการ', 'Chanel'),
(5, 4, 'พระราชบัญญัติมาตรฐานสินค้าเกษตรและอาหาร พ.ศ.2551', 'DataType'),
(6, 4, 'กฎหมาย/ระเบียบ ความปลอดภัย', 'DataType');

-- --------------------------------------------------------

--
-- Table structure for table `Infographic`
--

CREATE TABLE `Infographic` (
  `id` int(11) NOT NULL,
  `title_th` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `publishing_date` date NOT NULL,
  `visit_count` int(11) NOT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Infographic`
--

INSERT INTO `Infographic` (`id`, `title_th`, `title_en`, `publishing_date`, `visit_count`, `actives`, `create_date`, `update_date`) VALUES
(1, 'Infographic 1', 'Infographic 1', '2018-11-06', 0, 'Y', '2018-11-06 10:11:40', '2018-11-06 10:26:20'),
(2, 'Infographic 2', 'Infographic 2', '2018-11-06', 0, 'Y', '2018-11-06 10:26:59', '2018-11-06 10:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `Invite_Files`
--

CREATE TABLE `Invite_Files` (
  `inviteFileID` int(11) NOT NULL,
  `standardID` int(11) DEFAULT NULL,
  `meetingID` int(11) DEFAULT NULL,
  `fileName` varchar(45) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Invite_Files`
--

INSERT INTO `Invite_Files` (`inviteFileID`, `standardID`, `meetingID`, `fileName`, `filePath`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(2, 3, 2, '2ตัวอย่างเมล.xlsx', 'files/files/commodity-standard/invite-files/2_20180816082217_118182.xlsx', '1093840', '2018-08-16 08:22:17', '1093840', '2018-08-16 08:22:17');

-- --------------------------------------------------------

--
-- Table structure for table `Iso`
--

CREATE TABLE `Iso` (
  `id` int(11) NOT NULL,
  `iso_type` enum('ISO','ขอบข่าย','ขอบข่ายย่อย') NOT NULL,
  `iso_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Iso`
--

INSERT INTO `Iso` (`id`, `iso_type`, `iso_name`) VALUES
(1, 'ISO', 'ISO 1'),
(2, 'ขอบข่าย', 'ขอบข่าย 1'),
(3, 'ขอบข่ายย่อย', 'ขอบข่ายย่อย 1');

-- --------------------------------------------------------

--
-- Table structure for table `Licensees`
--

CREATE TABLE `Licensees` (
  `id` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `authorized_name` varchar(150) NOT NULL,
  `license_type` enum('ผู้นำเข้า','ผู้ส่งออก') NOT NULL,
  `license_status` enum('ออกใบอนุญาติแล้ว','ยกเลิกใบอนุญาติแบบถาวร') NOT NULL,
  `license_expire_date` date DEFAULT NULL,
  `cert_status` varchar(50) DEFAULT NULL,
  `cert_expire_date` date DEFAULT NULL,
  `standard_code` varchar(50) NOT NULL,
  `office_address` varchar(512) DEFAULT NULL,
  `production_name` varchar(255) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `province` varchar(70) DEFAULT NULL,
  `production_address` varchar(512) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Licensees`
--

INSERT INTO `Licensees` (`id`, `reference`, `authorized_name`, `license_type`, `license_status`, `license_expire_date`, `cert_status`, `cert_expire_date`, `standard_code`, `office_address`, `production_name`, `region`, `province`, `production_address`, `create_date`, `update_date`) VALUES
(1, 'ฟห่ก้เ', 'ฟฟฟฟ', 'ผู้นำเข้า', 'ออกใบอนุญาติแล้ว', '2018-11-16', 'ฟห่กา้ฟห่้ก', '2018-11-16', 'master 2', 'ฟหก่้เหฟ', 'สฟา่หก', 'ภาคกลาง', 'กรุงเทพมหานคร', 'ฟห่ก้เฟ้ห่ก', '0000-00-00 00:00:00', '2018-11-16 11:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `License_Register`
--

CREATE TABLE `License_Register` (
  `id` int(11) NOT NULL,
  `reference` char(7) DEFAULT NULL,
  `name` varchar(512) NOT NULL,
  `idcard` varchar(20) NOT NULL,
  `email` varchar(70) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `check_name` varchar(512) DEFAULT NULL,
  `check_address` varchar(512) DEFAULT NULL,
  `description` text,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(512) NOT NULL,
  `status` enum('รับคำร้องแล้ว','มอบหมายแจ้งเจ้าหน้าที่ดำเนินการ','รวบรวมข้อเท็จจริง','ตรวจสอบแล้ว') NOT NULL DEFAULT 'รับคำร้องแล้ว',
  `approve_description` text,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `License_Register`
--

INSERT INTO `License_Register` (`id`, `reference`, `name`, `idcard`, `email`, `tel`, `check_name`, `check_address`, `description`, `file_name`, `file_path`, `status`, `approve_description`, `create_date`, `update_date`) VALUES
(1, NULL, 'asdjk', '12312398', 'aksjdh', '1092839', 'asdjkh', 'jhasd', 'jhagsd', '232652.jpg', 'files/files/license-register/20181125161422_364904.jpg', 'รับคำร้องแล้ว', NULL, '2018-11-25 16:14:22', '2018-11-25 16:14:22'),
(2, '9148396', 'asdjk', '12312398', 'aksjdh', '1092839', 'asdjkh', 'jhasd', 'jhagsd', '232652.jpg', 'files/files/license-register/20181125161527_898973.jpg', 'ตรวจสอบแล้ว', 'askjdhasd', '2018-11-25 16:15:27', '2018-11-25 16:56:57'),
(3, '3928840', 'asdkh', 'asdkh', 'kjasd', 'kjhasd', 'kjhasd', 'kjhasdk', 'hasjdhk', '', '', 'มอบหมายแจ้งเจ้าหน้าที่ดำเนินการ', '', '2018-11-25 16:19:55', '2018-11-25 16:57:04'),
(4, '1009456', 'asdjh', 'kjahsd', 'kjhasdhk', 'hkjhkj', 'kjh', 'kjh', 'kjh', '', '', 'รับคำร้องแล้ว', NULL, '2018-11-25 16:21:23', '2018-11-25 16:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `LinkUrl`
--

CREATE TABLE `LinkUrl` (
  `id` int(11) NOT NULL,
  `link_type` varchar(20) NOT NULL,
  `link_url` varchar(512) NOT NULL,
  `image_path` varchar(512) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LinkUrl`
--

INSERT INTO `LinkUrl` (`id`, `link_type`, `link_url`, `image_path`, `create_date`, `update_date`) VALUES
(1, 'a', 'https://google.co.th', 'files/img/link_url/20181001131900_602145.png', '2018-10-01 13:19:00', '2018-10-01 13:19:13'),
(2, '1', 'https://google.co.th', 'files/img/link_url/20181001131932_438030.png', '2018-10-01 13:19:32', '2018-10-01 13:19:32'),
(3, '1', 'https://google.co.th', 'files/img/link_url/20181001131943_534259.png', '2018-10-01 13:19:43', '2018-10-01 13:19:43'),
(4, '1', 'https://google.co.th', 'files/img/link_url/20181001131955_922021.png', '2018-10-01 13:19:55', '2018-10-01 13:19:55'),
(5, '1', 'https://google.co.th', 'files/img/link_url/20181001132006_745270.png', '2018-10-01 13:20:06', '2018-10-01 13:20:06'),
(6, '1', 'https://google.co.th', 'files/img/link_url/20181001132017_767355.png', '2018-10-01 13:20:17', '2018-10-01 13:20:17'),
(7, '1', 'www.google.com', 'files/img/link_url/20181225234955_562201.jpg', '2018-12-25 23:49:55', '2018-12-25 23:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `Listening`
--

CREATE TABLE `Listening` (
  `id` int(11) NOT NULL,
  `listening_type` varchar(150) NOT NULL,
  `title_th` varchar(512) NOT NULL,
  `title_en` varchar(512) NOT NULL,
  `content_th` text NOT NULL,
  `content_en` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Listening`
--

INSERT INTO `Listening` (`id`, `listening_type`, `title_th`, `title_en`, `content_th`, `content_en`, `start_date`, `end_date`, `create_date`, `update_date`, `actives`) VALUES
(1, '', '', '', '', '', '0000-00-00', '0000-00-00', '2018-10-18 10:47:23', '2018-10-18 10:47:23', 'Y'),
(2, 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร', 'asd', '', 'and', '', '2018-10-17', '2018-10-17', '2018-10-18 10:55:31', '2018-10-18 11:49:08', 'Y'),
(3, 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร', 'kjahsd', '', 'and', '', '2018-10-17', '2018-10-30', '2018-10-18 10:58:09', '2018-10-18 10:58:09', 'Y'),
(4, 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร', 'ทดสอบ', '', '<p>ทดสอบที่มา</p>\r\n', '', '2018-10-01', '2018-10-15', '2018-10-18 11:02:45', '2018-10-20 10:57:31', 'Y'),
(5, 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร', 'test', '', 'test', '', '2018-10-18', '2018-10-31', '2018-10-18 12:04:29', '2018-10-18 12:04:29', 'Y'),
(6, 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร', 'test', '', 'test', '', '2018-10-18', '2018-10-31', '2018-10-18 12:06:12', '2018-10-18 12:13:50', 'Y'),
(7, 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร', 'test 2', '', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ด้วยพระราชบัญญัติมาตรฐานสินค้าเกษตร พ.ศ. ๒๕๕๑ ได้มีผลใช้บังคับไปเมื่อวันที่ ๒๐ สิงหาคม ๒๕๕๑ และโดยที่พระราชบัญญัติดังกล่าวได้ให้อำนาจรัฐมนตรีว่าการกระทรวงเกษตรและสหกรณ์ คณะกรรมการมาตรฐานสินค้าเกษตร และสำนักงานมาตรฐานสินค้าเกษตรดำเนินการในการออกอนุบัญญัติเพื่อใช้บังคับกับผู้เกี่ยวข้องตามพระราชบัญญัติดังกล่าวด้วย นั้น&nbsp;<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติในฐานะเป็นสำนักงานเลขานุการของคณะกรรมการมาตรฐานสินค้าเกษตรได้พิจารณาดำเนินการจัดทำร่างอนุบัญญัติขึ้นเพื่อบังคับใช้กับผู้เกี่ยวข้องตามพระราชบัญญัติดังกล่าว&nbsp;<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติจึงขอความกรุณาท่านที่เข้าเยี่ยมชมเว็บไซด์ของสำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติหากมีข้อคิดเห็นเกี่ยวกับร่างอนุบัญญัติดังกล่าวโปรดกรอกข้อมูลในแบบฟอร์มการรับฟังความคิดเห็นเกี่ยวกับการจัดทำร่างอนุบัญญัติด้านล่างนี้ เพื่อสำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติจะได้นำความคิดเห็นดังกล่าวมาเพื่อประกอบการพิจารณาต่อไป&nbsp;<br />\r\nรายละเอียดเกี่ยวกับตราอนุบัญญัติ</p>\r\n', '', '2018-10-01', '2018-10-31', '2018-10-18 12:15:47', '2018-10-18 12:53:16', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `MasterType`
--

CREATE TABLE `MasterType` (
  `id` int(11) NOT NULL,
  `menu_type` varchar(50) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y,N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MasterType`
--

INSERT INTO `MasterType` (`id`, `menu_type`, `type_name`, `actives`) VALUES
(1, 'ministerial-orders', 'เรื่องทั่วไป', 'Y'),
(2, 'ministerial-orders', 'เกี่ยวกับมาตรฐานบังคับ', 'Y'),
(3, 'rule-food', 'มาตรฐานของไทย', 'Y'),
(4, 'rule-food', 'มาตรฐานของต่างประเทศ', 'Y'),
(5, 'rule-food', 'กฎ/ข้อกำหนด/ระเบียบเฉพาะเรื่อง', 'Y'),
(6, 'licensees', 'asdjhaksd', 'Y'),
(7, 'licensees', 'master 2', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `Media`
--

CREATE TABLE `Media` (
  `id` int(11) NOT NULL,
  `title_th` varchar(255) NOT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `content_th` text NOT NULL,
  `content_en` text,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(512) NOT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `visit_count` int(11) NOT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Media`
--

INSERT INTO `Media` (`id`, `title_th`, `title_en`, `content_th`, `content_en`, `file_name`, `file_path`, `file_type`, `visit_count`, `actives`, `create_date`, `update_date`) VALUES
(2, 'asdkj', 'kasjhdjasd', '<p>askdjhj</p>\r\n', '<p>dasd</p>\r\n', '', '', NULL, 0, 'Y', '2018-11-25 20:19:25', '2018-11-25 20:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `Meetings`
--

CREATE TABLE `Meetings` (
  `meetingID` int(11) NOT NULL,
  `standardID` int(11) DEFAULT NULL,
  `meetingName` varchar(45) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `meetingType` enum('convoke','seminar') DEFAULT NULL,
  `ConvenedStatus` enum('Y','N') DEFAULT 'N',
  `sentEmailStatus` varchar(15) DEFAULT NULL,
  `emailSentDate` datetime DEFAULT NULL,
  `isSendMail` char(1) NOT NULL DEFAULT 'N',
  `remark` varchar(512) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Meetings`
--

INSERT INTO `Meetings` (`meetingID`, `standardID`, `meetingName`, `address`, `startDate`, `endDate`, `startTime`, `endTime`, `meetingType`, `ConvenedStatus`, `sentEmailStatus`, `emailSentDate`, `isSendMail`, `remark`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(1, 3, 'and', 'asdasd', '2018-08-05 12:00:00', '2018-08-05 13:00:00', '00:00:00', '00:00:00', 'convoke', 'Y', 'Default', '2018-08-16 17:15:00', 'N', NULL, '1093840', '2018-08-05 13:31:34', '1093840', '2018-08-16 09:49:54'),
(2, 3, 'seminar 1', 'asdad', '2018-08-06 12:15:00', '2018-08-06 15:00:00', '00:00:00', '00:00:00', 'seminar', 'Y', 'TimeSetting', '2018-08-16 18:30:00', 'N', NULL, '1093840', '2018-08-06 09:58:55', '1093840', '2018-08-16 09:16:13'),
(3, 5, 'ประชุม มกอช.', 'ห้องประชุม 1', '2018-08-27 10:00:00', '2018-08-27 15:00:00', '00:00:00', '00:00:00', 'convoke', 'Y', 'Default', '2018-08-25 23:50:00', 'N', 'test remark', '1093840', '2018-08-25 10:49:50', '1093840', '2018-11-22 08:49:07'),
(4, 5, 'asd', 'asd', '2018-09-12 08:00:00', '2018-09-13 16:00:00', '00:00:00', '00:00:00', 'seminar', 'Y', 'Default', '1900-12-31 00:00:00', 'N', 'asdas', '1093840', '2018-08-26 11:03:38', '1093840', '2018-08-26 11:24:55'),
(5, 5, 'assay assay', 'asdasd', '2018-08-29 08:00:00', '2018-08-30 16:30:00', NULL, NULL, 'seminar', 'Y', 'Default', '0000-00-00 00:00:00', 'N', 'remark', '1093840', '2018-08-26 11:06:59', '1093840', '2018-08-26 11:06:59'),
(6, 5, 'and', 'asd', '2018-11-22 12:00:00', '2018-11-22 15:00:00', NULL, NULL, 'convoke', 'Y', 'Default', '0000-00-00 00:00:00', 'N', '', '1093840', '2018-11-22 08:59:54', '1093840', '2018-11-22 08:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `Meeting_attendees`
--

CREATE TABLE `Meeting_attendees` (
  `meetingAttendeeID` int(11) NOT NULL,
  `attendeeID` char(7) DEFAULT NULL,
  `meetingID` int(11) DEFAULT NULL,
  `standardID` int(11) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Meeting_attendees`
--

INSERT INTO `Meeting_attendees` (`meetingAttendeeID`, `attendeeID`, `meetingID`, `standardID`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(5, '9810021', 2, 3, '1093840', '0000-00-00 00:00:00', '1093840', '0000-00-00 00:00:00'),
(7, '9810022', 2, 3, '1093840', '0000-00-00 00:00:00', '1093840', '0000-00-00 00:00:00'),
(8, '9810021', 3, 5, '1093840', '0000-00-00 00:00:00', '1093840', '0000-00-00 00:00:00'),
(11, '9810021', 4, 5, '1093840', '0000-00-00 00:00:00', '1093840', '0000-00-00 00:00:00'),
(12, '9810021', 0, 5, '1093840', '0000-00-00 00:00:00', '1093840', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Meeting_Files`
--

CREATE TABLE `Meeting_Files` (
  `meetingFileID` int(11) NOT NULL,
  `meetingID` int(11) DEFAULT NULL,
  `standardID` int(11) DEFAULT NULL,
  `fileName` varchar(45) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Meeting_Files`
--

INSERT INTO `Meeting_Files` (`meetingFileID`, `meetingID`, `standardID`, `fileName`, `filePath`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(3, 1, 3, '233051.jpg', 'files/files/commodity-standard/meeting-files/1_20180805135431_306805.jpg', '1093840', '2018-08-05 13:54:31', '1093840', '2018-08-05 13:54:31'),
(5, 2, 3, 'structures.pdf', 'files/files/commodity-standard/meeting-files/2_20180806095855_899226.pdf', '1093840', '2018-08-06 09:58:55', '1093840', '2018-08-06 09:58:55'),
(9, 3, 5, 'แก้ไข dportal เฟส2.docx', 'files/files/commodity-standard/meeting-files/3_20180825142111_388666.docx', '1093840', '2018-08-25 14:21:11', '1093840', '2018-08-25 14:21:11'),
(10, 4, 5, 'structures-2.pdf', 'files/files/commodity-standard/meeting-files/4_20180826110338_407282.pdf', '1093840', '2018-08-26 11:03:38', '1093840', '2018-08-26 11:03:38'),
(11, 5, 5, 'งานส่วน เเก้ไข + เพิ่มเติม.pdf', 'files/files/commodity-standard/meeting-files/5_20180826110659_429645.pdf', '1093840', '2018-08-26 11:06:59', '1093840', '2018-08-26 11:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `Meeting_Result`
--

CREATE TABLE `Meeting_Result` (
  `id` int(11) NOT NULL,
  `meeting_type` enum('ผลการประชุมการรับรอง','ผลการประชุม ISO','ผลการประชุม CODEX','ผลการประชุม OIE','ผลการประชุม IPPC','ผลการประชุม APPPC','ผลการประชุม ASEAN','ผลการประชุม SPS/WTO') NOT NULL,
  `meeting_name_th` varchar(512) NOT NULL,
  `meeting_name_en` varchar(512) DEFAULT NULL,
  `times` varchar(20) DEFAULT NULL,
  `meeting_start_date` date NOT NULL,
  `meeting_end_date` date DEFAULT NULL,
  `meeting_place_th` varchar(255) NOT NULL,
  `meeting_place_en` varchar(255) NOT NULL,
  `essence_th` text NOT NULL,
  `essence_en` text NOT NULL,
  `file_name_th` varchar(255) DEFAULT NULL,
  `file_path_th` varchar(512) DEFAULT NULL,
  `file_name_en` varchar(255) DEFAULT NULL,
  `file_path_en` varchar(512) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Meeting_Result`
--

INSERT INTO `Meeting_Result` (`id`, `meeting_type`, `meeting_name_th`, `meeting_name_en`, `times`, `meeting_start_date`, `meeting_end_date`, `meeting_place_th`, `meeting_place_en`, `essence_th`, `essence_en`, `file_name_th`, `file_path_th`, `file_name_en`, `file_path_en`, `create_date`, `update_date`) VALUES
(1, 'ผลการประชุมการรับรอง', 'andasd', 'asdmbas', '1', '2018-11-14', '1900-12-01', 'asmdb', 'mnasbd', 'mansdbansdb', 'mnbasd', 'test เว็บสนับสนุนการกำหนดมาตรฐาน.pages', 'files/files/media/20181114094810_654379.pages', 'academicboardgroup_20181109082609.xlsx', 'files/files/media/20181114094810_545058.xlsx', '2018-11-14 09:40:12', '2018-11-14 09:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `Menus`
--

CREATE TABLE `Menus` (
  `id` int(11) NOT NULL,
  `menu_name_th` varchar(100) DEFAULT NULL,
  `menu_name_en` varchar(100) DEFAULT NULL,
  `parent_menu` int(11) DEFAULT NULL,
  `menu_type` enum('PARENT','PAGE','INLINK','EXLINK','CUSTOM') DEFAULT NULL,
  `menu_url` varchar(500) DEFAULT NULL,
  `page_type` varchar(50) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_logo` varchar(500) DEFAULT NULL,
  `menu_image` varchar(512) DEFAULT NULL,
  `actives` char(1) DEFAULT 'Y' COMMENT 'Y,N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Menus`
--

INSERT INTO `Menus` (`id`, `menu_name_th`, `menu_name_en`, `parent_menu`, `menu_type`, `menu_url`, `page_type`, `menu_order`, `menu_logo`, `menu_image`, `actives`) VALUES
(1, 'เกี่ยวกับหน่วยงาน', 'About', 0, 'PARENT', 'about', '', 1, '', NULL, 'Y'),
(2, 'กฎ/ระเบียบ/ข้อบังคับ', 'Tradition', 0, 'PARENT', 'page/2', '', 2, '', NULL, 'Y'),
(3, 'บริการประชาชน', 'Services', 0, 'PARENT', 'page/3', '', 3, '', NULL, 'Y'),
(4, 'ข่าวสาร', 'News', 0, 'PARENT', 'page/4', '', 4, '', NULL, 'Y'),
(5, 'จัดซื้อจัดจ้าง', 'Purchase', 0, 'PARENT', 'page/5', '', 5, '', NULL, 'Y'),
(6, 'สื่อเผยแพร่', 'Media', 0, 'PARENT', 'page/6', '', 6, '', NULL, 'Y'),
(7, 'ติดต่อเรา', 'Contact Us', 0, 'PARENT', 'page/7', '', 7, '', NULL, 'Y'),
(8, 'ประวัติความเป็นมา', 'ประวัติความเป็นมา', 1, 'PAGE', 'page/8', '8', 1, '', 'files/img/8_20181225161512_734677.jpg', 'Y'),
(9, 'ความหมายของตรา มกอช.', 'ความหมายของตรา มกอช.', 1, 'PAGE', 'page/9', '9', 2, '', 'files/img/9_20181225161626_337378.jpg', 'Y'),
(10, 'วิสัยทัศน์/พันธกิจ/วัฒนธรรม/ค่านิยม', 'วิสัยทัศน์/พันธกิจ/วัฒนธรรม/ค่านิยม', 1, 'PAGE', 'page/10', '10', 3, '', 'files/img/10_20181225162118_677319.jpg', 'Y'),
(11, 'โครงสร้าง', 'โครงสร้าง', 1, 'PAGE', 'page/11', '11', 4, '', 'files/img/11_20181225162157_986000.jpg', 'Y'),
(12, 'ผู้บริหาร มกอช.', 'ผู้บริหาร มกอช.', 1, 'PARENT', 'page/1', '', 5, '', NULL, 'Y'),
(13, 'ผู้บริหารปัจจุบัน', 'ผู้บริหารปัจจุบัน', 12, 'PAGE', 'palace/current-board', '13', 1, '', NULL, 'Y'),
(14, 'CIO', 'CIO', 12, 'PAGE', 'palace/current-cio', '14', 2, '', NULL, 'Y'),
(15, 'ที่ปรึกษา มกอช.', 'ที่ปรึกษา มกอช.', 12, 'PAGE', 'palace/current-consult', '15', 3, '', NULL, 'Y'),
(16, 'ผู้เชี่ยวชาญ  มกอช.', 'ผู้เชี่ยวชาญ  มกอช.', 12, 'PAGE', 'palace/current-specialist', '16', 4, '', NULL, 'Y'),
(17, 'ทำเนียบผู้บริหาร', 'ทำเนียบผู้บริหาร', 1, 'PARENT', 'page/17', '', 6, '', NULL, 'Y'),
(18, 'ทำเนียบเลขาธิการ มกอช.', 'ทำเนียบเลขาธิการ มกอช.', 17, 'PAGE', 'palace/history-secretary', '18', 1, '', NULL, 'Y'),
(19, 'ทำเนียบรองเลขาธิการ มกอช.', 'ทำเนียบรองเลขาธิการ มกอช.', 17, 'PAGE', 'palace/history-deputy-secretary', '19', 2, '', NULL, 'Y'),
(21, 'ทำเนียบ CIO', 'ทำเนียบ CIO', 17, 'PAGE', 'palace/history-cio', '21', 3, '', NULL, 'Y'),
(22, 'ทำเนียบที่ปรึกษา มกอช.', 'ทำเนียบที่ปรึกษา มกอช.', 17, 'PAGE', 'palace/history-consult', '22', 4, '', NULL, 'Y'),
(23, 'ทำเนียบผู้เชี่ยวชาญ มกอช.', 'ทำเนียบผู้เชี่ยวชาญ มกอช.', 17, 'PAGE', 'palace/history-specialist', '23', 5, '', NULL, 'Y'),
(24, 'อำนาจตามกฎกระทรวง', 'อำนาจตามกฎกระทรวง', 1, 'PAGE', 'page/24', '24', 7, '', NULL, 'Y'),
(25, 'บทบาทภารกิจตามมติ ครม.', 'บทบาทภารกิจตามมติ ครม.', 1, 'PAGE', 'page/25', '25', 8, '', NULL, 'Y'),
(26, 'ยุทธศาสตร์', 'ยุทธศาสตร์', 1, 'PARENT', 'page/1', '', 9, '', NULL, 'Y'),
(27, 'ยุทธศาสตร์และแผนงาน มกอช.', 'ยุทธศาสตร์และแผนงาน มกอช.', 26, 'PAGE', 'page/27', '27', 1, '', NULL, 'Y'),
(28, 'ยุทธศาสตร์กระทรวงเกษตร และสหกรณ์', 'ยุทธศาสตร์กระทรวงเกษตร และสหกรณ์', 26, 'EXLINK', 'http://www.nesdb.go.th/article_attach/article_file_20170106131224.pdf', '', 2, '', NULL, 'Y'),
(29, 'ยุทธศาสตร์ชาติ', 'ยุทธศาสตร์ชาติ', 26, 'EXLINK', 'https://www.opsmoac.go.th/strategic-preview-391991791820', '', 3, '', NULL, 'Y'),
(30, 'ระบบบริหารราชการ', 'ระบบบริหารราชการ', 1, 'PARENT', 'page/1', '', 10, '', NULL, 'Y'),
(31, 'นโยบายการกากับดูแลองค์กร', 'นโยบายการกากับดูแลองค์กร', 30, 'PAGE', 'page/31', '31', 1, '', NULL, 'Y'),
(32, 'คำรับรองการปฏิบัติราชการ มกอช. ปี 2547 – ปัจจุบัน', 'คำรับรองการปฏิบัติราชการ มกอช. ปี 2547 – ปัจจุบัน', 30, 'PAGE', 'page/32', '32', 2, '', NULL, 'Y'),
(33, 'รายการผลการปฏิบัติราชการตามคารับรองการปฏิบัติราชการของ มกอช.', 'รายการผลการปฏิบัติราชการตามคารับรองการปฏิบัติราชการของ มกอช.', 30, 'PAGE', 'page/33', '33', 3, '', NULL, 'Y'),
(34, 'รางวัลขององค์กร', 'รางวัลขององค์กร', 30, 'PARENT', 'page/1', '', 4, '', NULL, 'Y'),
(35, 'รางวัลบริการภาครัฐแห่งชาติ', 'รางวัลบริการภาครัฐแห่งชาติ', 34, 'PAGE', 'page/35', '35', 1, '', NULL, 'Y'),
(36, 'รางวัลด้านความโปร่งใส', 'รางวัลด้านความโปร่งใส', 34, 'PAGE', 'page/36', '36', 2, '', NULL, 'Y'),
(37, 'ผลการเบิกจ่ายงบประมาณ', 'ผลการเบิกจ่ายงบประมาณ', 30, 'CUSTOM', 'budget-disbursement', 'budget-disbursement', 5, '', NULL, 'Y'),
(38, 'รายงานประจำปี', 'รายงานประจำปี', 30, 'CUSTOM', 'attachfile-multi/annually-report', 'annually-report', 6, '', NULL, 'Y'),
(39, 'กฎบัตรการตรวจสอบภายใน', 'กฎบัตรการตรวจสอบภายใน', 30, 'PARENT', 'page/1', '', 7, '', NULL, 'Y'),
(40, 'กฎบัตรการตรวจสอบภายใน', 'กฎบัตรการตรวจสอบภายใน', 39, 'CUSTOM', 'attachfile-multi/internal-audit', 'internal-audit', 1, '', NULL, 'Y'),
(41, 'กรอบคุณธรรมของกลุ่มตรวจสอบภายใน', 'กรอบคุณธรรมของกลุ่มตรวจสอบภายใน', 39, 'CUSTOM', 'attachfile-multi/internal-group-audit', 'internal-group-audit', 2, '', NULL, 'Y'),
(42, 'พ.ร.บ. มาตรฐานสินค้าเกษตร', 'พ.ร.บ. มาตรฐานสินค้าเกษตร', 2, 'PARENT', 'page/1', '', 1, '', NULL, 'Y'),
(43, 'พ.ร.บ. มาตรฐานสินค้าเกษตร', 'พ.ร.บ. มาตรฐานสินค้าเกษตร', 42, 'CUSTOM', 'attachfile-multi2/standard-act', 'standard-act', 1, '', NULL, 'Y'),
(44, 'กฎกระทรวง', 'กฎกระทรวง', 42, 'PARENT', 'page/1', '', 2, '', NULL, 'Y'),
(45, 'กฎกระทรวง', 'กฎกระทรวง', 44, 'CUSTOM', 'attachfile-multi2/ministerial-orders', 'ministerial-orders', 1, '', NULL, 'Y'),
(47, 'ประกาศกระทรวง', 'ประกาศกระทรวง', 42, 'CUSTOM', 'attachfile-multi2/ministry-notification', 'ministry-notification', 3, '', NULL, 'Y'),
(48, 'ประกาศคณะกรรมการมาตรฐาน', 'ประกาศคณะกรรมการมาตรฐาน', 42, 'CUSTOM', 'attachfile-multi2/standard-commission-notice', 'standard-commission-notice', 4, '', NULL, 'Y'),
(49, 'ประกาศสำนักงานมาตรฐานสินค้าเกษตร และอาหารแห่งชาติ', 'ประกาศสำนักงานมาตรฐานสินค้าเกษตร และอาหารแห่งชาติ', 42, 'CUSTOM', 'attachfile-multi2/announcement-acfs', 'announcement-acfs', 5, '', NULL, 'Y'),
(50, 'คู่มือการปฏิบัติงาน', 'คู่มือการปฏิบัติงาน', 42, 'CUSTOM', 'attachfile-multi2/operating-guide', 'operating-guide', 6, '', NULL, 'Y'),
(51, 'การรับฟังความคิดเห็น', 'การรับฟังความคิดเห็น', 42, 'CUSTOM', 'listening', 'listening', 7, '', NULL, 'Y'),
(55, 'ประกาศ/ระเบียบ/คำสั่ง มกอช.', 'ประกาศ/ระเบียบ/คำสั่ง มกอช.', 2, 'CUSTOM', 'attachfile-multi2/order-rule-acfs', 'order-rule-acfs', 2, '', 'files/img/55_20181225161728_997850.jpg', 'Y'),
(56, 'กฎ/ระเบียบ/ข้อบังคับที่เกี่ยวกับการปฏิบัติงาน', 'กฎ/ระเบียบ/ข้อบังคับที่เกี่ยวกับการปฏิบัติงาน', 2, 'CUSTOM', 'attachfile-multi2/regulations', 'regulations', 3, '', NULL, 'Y'),
(57, 'e-Service', 'e-Service', 3, 'PARENT', 'page/1', '', 1, '', NULL, 'Y'),
(58, 'TAS-License', 'TAS-License', 57, 'EXLINK', 'page/58', '', 1, '', NULL, 'Y'),
(59, 'บริการค้นหาใบรับรองมาตรฐาน', 'บริการค้นหาใบรับรองมาตรฐาน', 57, 'EXLINK', 'page/59', '', 2, '', NULL, 'Y'),
(60, 'บริการค้นหามาตรฐานสินค้าเกษตร', 'บริการค้นหามาตรฐานสินค้าเกษตร', 57, 'CUSTOM', 'standard-commodity/search', 'standard-commodity/search', 3, '', NULL, 'Y'),
(61, 'บริการ API มาตรฐานสินค้าเกษตร', 'บริการ API มาตรฐานสินค้าเกษตร', 57, 'PAGE', 'page/61', '61', 4, '', NULL, 'Y'),
(62, 'ด้านมาตรฐานสินค้าเกษตร', 'ด้านมาตรฐานสินค้าเกษตร', 3, 'PARENT', 'page/1', '', 2, '', NULL, 'Y'),
(64, 'ความหมายและวัตถุประสงค์', 'ความหมายและวัตถุประสงค์', 62, 'PAGE', 'page/64', '64', 2, '', NULL, 'Y'),
(65, 'ขั้นตอนการจัดทำร่างมาตรฐานทั่วไป', 'ขั้นตอนการจัดทำร่างมาตรฐานทั่วไป', 62, 'PAGE', 'page/65', '65', 3, '', NULL, 'Y'),
(66, 'ขั้นตอนการจัดทำร่างมาตรฐานบังคับ', 'ขั้นตอนการจัดทำร่างมาตรฐานบังคับ', 62, 'PAGE', 'page/66', '66', 4, '', NULL, 'Y'),
(67, 'แผนปฏิบัติการกำหนดมาตรฐาน', 'แผนปฏิบัติการกำหนดมาตรฐาน', 62, 'CUSTOM', 'standard-commodity/plan', 'standard-commodity/plan', 5, '', NULL, 'Y'),
(68, 'มาตรฐานทั่วไป', 'มาตรฐานทั่วไป', 62, 'CUSTOM', 'standard-commodity/general', 'standard-commodity/general', 6, '', NULL, 'Y'),
(73, 'มาตรฐานบังคับ', 'มาตรฐานบังคับ', 62, 'CUSTOM', 'standard-commodity/mandatory', 'standard-commodity/mandatory', 7, '', NULL, 'Y'),
(77, 'การรับฟังความคิดเห็น', 'การรับฟังความคิดเห็น', 62, 'PAGE', 'page/77', '77', 8, '', NULL, 'Y'),
(78, 'การร้องเรียน', 'การร้องเรียน', 62, 'CUSTOM', 'appeal', 'appeal', 9, '', NULL, 'Y'),
(79, 'ด้านการรับรอง', 'ด้านการรับรอง', 3, 'PARENT', 'page/1', '', 3, '', NULL, 'Y'),
(80, 'ข้อมูลกองรับรองมาตรฐาน', 'ข้อมูลกองรับรองมาตรฐาน', 79, 'PARENT', 'page/80', '', 1, '', NULL, 'Y'),
(81, 'กองรับรองมาตรฐาน', 'กองรับรองมาตรฐาน', 80, 'PAGE', 'page/81', '81', 1, '', NULL, 'Y'),
(82, 'The Pacific Accreditation Cooperation (PAC) ', 'The Pacific Accreditation Cooperation (PAC) ', 80, 'PAGE', 'page/82', '82', 2, '', NULL, 'Y'),
(83, 'การยอมรับความสามารถของหน่วยงานรับรองสินค้าเกษตร และอาหาร ', 'การยอมรับความสามารถของหน่วยงานรับรองสินค้าเกษตร และอาหาร ', 80, 'PAGE', 'page/83', '83', 3, '', NULL, 'Y'),
(84, 'มาตรฐานสากลการเป็นหน่วยรับรองระบบงาน CA (credittaion body : AB) ด้านสินค้าเกษตร และอาหาร', 'มาตรฐานสากลการเป็นหน่วยรับรองระบบงาน CA (credittaion body : AB) ด้านสินค้าเกษตร และอาหาร', 80, 'PAGE', 'page/84', '84', 4, '', NULL, 'Y'),
(85, 'การรับรองระบบงาน', 'การรับรองระบบงาน', 79, 'PARENT', 'page/85', '', 2, '', NULL, 'Y'),
(86, 'คู่มือการให้การรับรองระบบงาน', 'คู่มือการให้การรับรองระบบงาน', 85, 'CUSTOM', 'attachfile-multi3/doc-confirm-work', 'doc-confirm-work', 2, '', NULL, 'Y'),
(87, 'หลักเกณฑ์เงื่อนไข ', 'หลักเกณฑ์เงื่อนไข', 85, 'CUSTOM', 'attachfile-multi3/condition', 'condition', 2, '', NULL, 'Y'),
(88, 'ความร่วมมือระดับนานาชาติ', 'ความร่วมมือระดับนานาชาติ', 3, 'PARENT', 'page/1', '', 4, '', NULL, 'Y'),
(89, 'องค์การด้านความปลอดภัยอาหาร ', 'องค์การด้านความปลอดภัยอาหาร ', 88, 'PAGE', 'page/89', '89', 1, '', NULL, 'Y'),
(90, 'สุขอนามัยและสุขอนามัยพืช ', 'สุขอนามัยและสุขอนามัยพืช ', 88, 'PAGE', 'page/90', '90', 2, '', NULL, 'Y'),
(91, 'ASEAN FOOD SAFTY NETWORK ', 'ASEAN FOOD SAFTY NETWORK ', 88, 'PAGE', 'page/91', '91', 3, '', NULL, 'Y'),
(92, 'ผลการประชุมนานาชาติ', 'ผลการประชุมนานาชาติ', 88, 'CUSTOM', 'meeting-result', 'meeting-result', 4, '', NULL, 'Y'),
(93, 'ด้านการควบคุม', 'ด้านการควบคุม', 3, 'PARENT', 'page/1', '', 4, '', NULL, 'Y'),
(94, 'การอนุญาต', 'การอนุญาต', 93, 'CUSTOM', 'attachfile-multi3/permission', 'permission', 1, '', NULL, 'Y'),
(95, 'ตรวจสอบเฝ้าระวัง', 'ตรวจสอบเฝ้าระวัง', 93, 'CUSTOM', 'attachfile-multi3/patrol', 'patrol', 2, '', NULL, 'Y'),
(96, 'การบูรณาการ', 'การบูรณาการ', 93, 'CUSTOM', 'attachfile-multi3/integration', 'integration', 3, '', NULL, 'Y'),
(97, 'รายชื่อผู้ได้รับใบอนุญาต/ใบรับรองมาตรฐานบังคับ', 'รายชื่อผู้ได้รับใบอนุญาต/ใบรับรองมาตรฐานบังคับ', 93, 'CUSTOM', 'licensees', 'licensees', 4, '', NULL, 'Y'),
(98, 'Q Mark ', 'Q Mark ', 3, 'PARENT', 'page/1', '', 5, '', NULL, 'Y'),
(99, 'เกี่ยวกับ Q Mark ', 'เกี่ยวกับ Q Mark ', 98, 'PAGE', 'page/99', '99', 1, '', NULL, 'Y'),
(100, 'ตรวจสอบรหัสเครื่องหมายรับรองมาตรฐาน ', 'ตรวจสอบรหัสเครื่องหมายรับรองมาตรฐาน ', 98, 'PAGE', 'page/100', '100', 2, '', NULL, 'Y'),
(101, 'ศูนย์ข้อมูลข่าวสาร ', 'ศูนย์ข้อมูลข่าวสาร ', 3, 'PARENT', 'page/1', '', 6, '', NULL, 'Y'),
(102, 'ศูนย์ข้อมูลข่าวสารคืออะไร', 'ศูนย์ข้อมูลข่าวสารคืออะไร', 160, 'PAGE', 'page/102', '102', 1, '', NULL, 'Y'),
(103, 'กองรับรองมาตรฐาน', 'กองรับรองมาตรฐาน', 101, 'PAGE', 'page/81', '103', 1, '', NULL, 'Y'),
(104, 'ข้อมูลข่าวสารตาม มาตรา 7.', 'ข้อมูลข่าวสารตาม มาตรา 7.', 101, 'PARENT', 'page/104', '', 3, '', NULL, 'Y'),
(105, 'ข้อมูลข่าวสารตาม มาตรา 9.', 'ข้อมูลข่าวสารตาม มาตรา 9.', 101, 'PARENT', 'page/105', '', 4, '', NULL, 'Y'),
(106, 'สัญญาอื่นๆ', 'สัญญาอื่นๆ', 101, 'PAGE', 'page/106', '106', 5, '', NULL, 'Y'),
(107, 'เอกสารอื่นๆ ที่ต้องรายงาน', 'เอกสารอื่นๆ ที่ต้องรายงาน', 101, 'PAGE', 'page/107', '107', 6, '', NULL, 'Y'),
(108, 'ข้อมูลข่าวสารที่น่าสนใจ', 'ข้อมูลข่าวสารที่น่าสนใจ', 101, 'PAGE', 'page/108', '108', 7, '', NULL, 'Y'),
(109, 'แบบขอใช้บริการออนไลน์', 'แบบขอใช้บริการออนไลน์', 101, 'CUSTOM', 'online-service', 'online-service', 8, '', NULL, 'Y'),
(110, 'แบบรับฟังความคิดเห็น', 'แบบรับฟังความคิดเห็น', 101, 'CUSTOM', 'hearing-report', 'hearing-report', 9, '', NULL, 'Y'),
(111, 'บริการอื่นๆ', 'บริการอื่นๆ', 3, 'PARENT', 'page/1', '', 6, '', NULL, 'Y'),
(112, 'ผลไม้ไทย ', 'ผลไม้ไทย ', 111, 'CUSTOM', 'fruit', 'fruit', 1, '', NULL, 'Y'),
(113, 'Q อาสา ', 'Q อาสา ', 111, 'EXLINK', 'http://www.acfs.go.th/Qvolunteer/index.php', '', 2, '', NULL, 'Y'),
(114, 'โครงการส่งเสริมการบริโภค และใช้วัตถุดิบสินค้า Q', 'โครงการส่งเสริมการบริโภค และใช้วัตถุดิบสินค้า Q', 111, 'CUSTOM', 'attachfile-multi3/consumption-promotion', 'consumption-promotion', 3, '', NULL, 'Y'),
(115, 'โครงการเกษตรเพื่อชีวิต', 'โครงการเกษตรเพื่อชีวิต', 111, 'PAGE', 'page/115', '115', 4, '', NULL, 'Y'),
(116, 'DGT Fram', 'DGT Fram', 111, 'EXLINK', 'https://www.dgtfarm.com/', '', 5, '', NULL, 'Y'),
(117, 'QR Trace on cloud', 'QR Trace on cloud', 111, 'EXLINK', 'https://acfs-qrtrace.com/', '', 6, '', NULL, 'Y'),
(118, 'คู่มือบริการประชาชน', 'คู่มือบริการประชาชน', 3, 'CUSTOM', 'doc-people', 'doc-people', 7, '', NULL, 'Y'),
(119, 'ข่าวประชาสัมพันธ์', 'ข่าวประชาสัมพันธ์', 4, 'PARENT', 'page/1', '', 1, '', NULL, 'Y'),
(120, 'ข่าว', 'ข่าว', 119, 'CUSTOM', 'update/news', 'news', 1, '', 'files/img/120_20181225163349_943403.jpg', 'Y'),
(121, 'Clipping News', 'Clipping News', 119, 'CUSTOM', 'attachfile-multi3/clipping-news', 'clipping-news', 2, '', NULL, 'Y'),
(122, 'เตือนภัยสินค้าเกษตร', 'เตือนภัยสินค้าเกษตร', 119, 'CUSTOM', 'warning', 'warning', 3, '', NULL, 'Y'),
(123, 'รับสมัครงาน ', 'รับสมัครงาน ', 119, 'CUSTOM', 'attachfile-multi3/work-application', 'work-application', 4, '', NULL, 'Y'),
(124, 'อบรม/สัมมนา ', 'อบรม/สัมมนา ', 4, 'PARENT', 'page/1', '', 2, '', NULL, 'Y'),
(125, 'ฝึกอบรม ', 'ฝึกอบรม ', 124, 'CUSTOM', 'seminar/training', 'training', 1, '', NULL, 'Y'),
(126, 'สัมมนา ', 'สัมมนา ', 124, 'CUSTOM', 'seminar/seminar', 'seminar', 2, '', NULL, 'Y'),
(127, 'สัมมนามาตรฐานสินค้าเกษตร ', 'สัมมนามาตรฐานสินค้าเกษตร ', 124, 'CUSTOM', 'seminar/standard-commodity', 'standard-commodity', 3, '', NULL, 'Y'),
(128, 'แผนการจัดซื้อจัดจ้าง ', 'แผนการจัดซื้อจัดจ้าง ', 5, 'CUSTOM', 'purchase/purchase-plan', 'purchase-plan', 1, '', NULL, 'Y'),
(129, 'ประกาศราคากลาง ', 'ประกาศราคากลาง ', 5, 'CUSTOM', 'purchase/standard-price', 'standard-price', 2, '', NULL, 'Y'),
(130, 'จัดทำร่างเอกสารประกวดราคา  ', 'จัดทำร่างเอกสารประกวดราคา', 5, 'CUSTOM', 'purchase/draft-document', 'draft-document', 3, '', NULL, 'Y'),
(131, 'e-Bidding', 'e-Bidding', 5, 'CUSTOM', 'purchase/e-bidding', 'e-bidding', 4, '', NULL, 'Y'),
(132, 'ประกาศเชิญชวนทั่วไป  (e-Market)', 'ประกาศเชิญชวนทั่วไป  (e-Market)', 5, 'CUSTOM', 'purchase/e-market', 'e-market', 5, '', NULL, 'Y'),
(133, 'วิธีคัดเลือก ', 'วิธีคัดเลือก ', 135, 'CUSTOM', 'purchase/selected-work', 'selected-work', 6, '', NULL, 'Y'),
(134, 'วิธีเฉพาะเจาะจง ', 'วิธีเฉพาะเจาะจง ', 135, 'CUSTOM', 'purchase/specification-method', 'specification-method', 6, '', NULL, 'Y'),
(135, 'จ้างที่ปรึกษา ', 'จ้างที่ปรึกษา ', 5, 'PARENT', 'page/135', '', 7, '', NULL, 'Y'),
(136, 'ประกาศเปลี่ยนแปลง', 'ประกาศเปลี่ยนแปลง', 5, 'CUSTOM', 'purchase/changing-work', 'changing-work', 8, '', NULL, 'Y'),
(137, 'ประกาศยกเลิกการจัดซื้อจัดจ้าง', 'ประกาศยกเลิกการจัดซื้อจัดจ้าง', 5, 'CUSTOM', 'purchase/cancelled-work', 'cancelled-work', 9, '', NULL, 'Y'),
(138, 'ประกาสผลผู้ชนะ', 'ประกาสผลผู้ชนะ', 5, 'CUSTOM', 'purchase/winning', 'winning', 10, '', NULL, 'Y'),
(139, 'ขายทอดตลาด ', 'ขายทอดตลาด ', 5, 'CUSTOM', 'purchase/auction', 'auction', 11, '', NULL, 'Y'),
(140, 'ผลการดาเนินการจัดซื้อจัดจ้างประจาปี (สขร.1) ', 'ผลการดาเนินการจัดซื้อจัดจ้างประจาปี (สขร.1) ', 5, 'CUSTOM', 'attachfile-multi3/skr', 'skr', 12, '', NULL, 'Y'),
(141, 'ผู้ทิ้งงาน', 'ผู้ทิ้งงาน', 5, 'EXLINK', 'page/141', '', 13, '', NULL, 'Y'),
(142, 'สื่อวีดิทัศน์', 'สื่อวีดิทัศน์', 6, 'CUSTOM', 'media', 'media', 1, '', NULL, 'Y'),
(143, 'สื่อสิ่งพิมพ์', 'สื่อสิ่งพิมพ์', 6, 'CUSTOM', 'attachfile-multi3/paper', 'paper', 2, '', NULL, 'Y'),
(144, 'Infographic ', 'Infographic ', 6, 'CUSTOM', 'infographic', 'infographic', 3, '', NULL, 'Y'),
(145, 'Transition period', 'Transition period', 85, 'CUSTOM', 'attachfile-multi3/transition-period', 'transition-period', 4, '', NULL, 'Y'),
(146, 'รายชื่อหน่วยรับรอง (CB)', 'รายชื่อหน่วยรับรอง (CB)', 155, 'CUSTOM', 'form-data1/certification-list', 'certification-list', 1, '', NULL, 'Y'),
(147, 'ประกาศเชิญชวนทั่วไป (e-Bidding)', 'ประกาศเชิญชวนทั่วไป (e-Bidding)', 135, 'CUSTOM', 'purchase/invite', 'invite', 4, '', NULL, 'Y'),
(148, 'ข้อมูลประกาศเดิม', 'ข้อมูลประกาศเดิม', 5, 'CUSTOM', 'purchase/echo-work', 'echo-work', 13, '', NULL, 'Y'),
(149, 'วิธีเฉพาะเจาะจง ', 'วิธีเฉพาะเจาะจง ', 5, 'CUSTOM', 'purchase/specification-method-normal', 'specification-method-normal', 6, '', NULL, 'Y'),
(150, 'วิธีคัดเลือก ', 'วิธีคัดเลือก ', 5, 'CUSTOM', 'purchase/selected-work-normal', 'selected-work-normal', 6, '', NULL, 'Y'),
(151, 'ขั้นตอนการให้การยอมรับความสามารถของหน่วยรับรอง (CB)', 'ขั้นตอนการให้การยอมรับความสามารถของหน่วยรับรอง (CB)', 85, 'PAGE', 'page/151', '151', 1, NULL, NULL, 'Y'),
(152, 'รายชื่อเครือข่าย PGS ที่ มกอช. ให้การยอมรับ', 'รายชื่อเครือข่าย PGS ที่ มกอช. ให้การยอมรับ', 85, 'PAGE', 'page/152', '152', 6, 'null', NULL, 'Y'),
(153, 'ระบบพัฒนาศักยภาพผู้ตรวจประเมิน/ที่ปรึกษาเกษตรกร', 'ระบบพัฒนาศักยภาพผู้ตรวจประเมิน/ที่ปรึกษาเกษตรกร', 85, 'EXLINK', NULL, NULL, 5, NULL, NULL, 'Y'),
(154, 'คู่มือ:ด้านการตรวจสอบ และรับรอง', 'คู่มือ:ด้านการตรวจสอบ และรับรอง', 79, 'CUSTOM', 'attachfile-multi3/manual-inspection', 'manual-inspection', 3, 'null', NULL, 'Y'),
(155, 'รายชื่อหน่วยตรวจ และรับรอง', 'รายชื่อหน่วยตรวจ และรับรอง', 79, 'PARENT', NULL, NULL, 4, NULL, NULL, 'Y'),
(156, 'รายชื่อหน่วยตรวจ (IB)', 'รายชื่อหน่วยตรวจ (IB)', 155, 'CUSTOM', 'form-data1/ib-list', 'ib-list', 2, NULL, NULL, 'Y'),
(157, 'คำถามที่พบบ่อย', 'คำถามที่พบบ่อย', 7, 'CUSTOM', 'freq-question', 'freq-question', 3, '', NULL, 'Y'),
(158, 'สอบถามผ่านทาง Q&A', 'Q&A', 7, 'CUSTOM', 'question-answer', 'question-answer', 2, '', NULL, 'Y'),
(159, 'ติดต่อเรา', 'Contact Us', 7, 'CUSTOM', 'contact-us', 'contact-us', 1, '', NULL, 'Y'),
(160, 'ศูนย์ข้อมูลข่าวสาร', 'ศูนย์ข้อมูลข่าวสาร', 101, 'PARENT', NULL, NULL, 1, NULL, NULL, 'Y'),
(161, 'ภาพศูนย์ข้อมูลข่าวสาร', 'ภาพศูนย์ข้อมูลข่าวสาร', 160, 'PAGE', 'page/161', '161', 2, 'null', NULL, 'Y'),
(162, 'พ.ร.บ. ข้อมูลข่าวสารทางราชการ พ.ศ.2540', 'พ.ร.บ. ข้อมูลข่าวสารทางราชการ พ.ศ.2540', 160, 'PAGE', 'page/162', '162', 3, 'null', NULL, 'Y'),
(163, 'สิทธิการรับรู้ของประชาชน', 'สิทธิการรับรู้ของประชาชน', 160, 'PAGE', 'page/163', '163', 4, 'null', NULL, 'Y'),
(164, 'คำสั่งแต่งตั้งคณะกรรมการข้อมูลข่าวสารของ มกอช.', 'คำสั่งแต่งตั้งคณะกรรมการข้อมูลข่าวสารของ มกอช.', 160, 'PAGE', 'page/164', '164', 5, NULL, NULL, 'Y'),
(165, 'ขั้นตอนการข้อรับข้อมูลข่าวสาร', 'ขั้นตอนการข้อรับข้อมูลข่าวสาร', 160, 'PAGE', 'page/165', '165', 6, NULL, NULL, 'Y'),
(166, 'โครงสร้างองค์กร ม.7 (1)', 'โครงสร้างองค์กร ม.7 (1)', 104, 'PAGE', 'page/166', '166', 1, NULL, NULL, 'Y'),
(167, 'อำนาจหน้าที่ ม.7 (2)', 'อำนาจหน้าที่ ม.7 (2)', 104, 'PAGE', 'page/167', '167', 2, 'null', NULL, 'Y'),
(168, 'สถานที่ติดต่อ ม.7 (3)', 'สถานที่ติดต่อ ม.7 (3)', 104, 'PAGE', 'page/168', '168', 3, 'null', NULL, 'Y'),
(169, 'กฎ มติ คณะรัฐมนตรีที่เกี่ยวข้อง ม.7 (4)', 'กฎ มติ คณะรัฐมนตรีที่เกี่ยวข้อง ม.7 (4)', 104, 'PAGE', 'page/169', '169', 4, 'null', NULL, 'Y'),
(170, 'ข้อมูลข่าวสารอื่นตามที่คณะกรรทการกำหนด ม.7 (5)', 'ข้อมูลข่าวสารอื่นตามที่คณะกรรทการกำหนด ม.7 (5)', 104, 'PAGE', 'page/170', '170', 5, 'null', NULL, 'Y'),
(171, 'ผลการพิจารณาฯ ม.9 (1)', 'ผลการพิจารณาฯ ม.9 (1)', 105, 'PAGE', NULL, '171', 1, NULL, NULL, 'Y'),
(172, 'นโยบาย หรือการตีความ ม.9 (2)', 'นโยบาย หรือการตีความ ม.9 (2)', 105, 'PAGE', 'page/172', '172', 2, NULL, NULL, 'Y'),
(173, 'แผนงาน โครงการ งบประมาณ ม.9 (3)', 'แผนงาน โครงการ งบประมาณ ม.9 (3)', 105, 'CUSTOM', 'attachfile-multi3/budget-disbursement2', 'budget-disbursement2', 3, NULL, NULL, 'Y'),
(174, 'คู่มือ หรือคำสั่ง ม.9 (4)', 'คู่มือ หรือคำสั่ง ม.9 (4)', 105, 'PAGE', 'page/174', '174', 4, NULL, NULL, 'Y'),
(175, 'สิ่งพิมพ์ที่อ้างถึง ม.7 วรรคสอง ม.9 (5)', 'สิ่งพิมพ์ที่อ้างถึง ม.7 วรรคสอง ม.9 (5)', 105, 'PAGE', NULL, '175', 5, NULL, NULL, 'Y'),
(176, 'สัญญาสัมปทาน ผูกขาด ร่วมทุน ม.9 (6)', 'สัญญาสัมปทาน ผูกขาด ร่วมทุน ม.9 (6)', 105, 'PAGE', 'page/176', '176', 6, 'null', NULL, 'Y'),
(177, 'มติ ครม. หรือมติคณะกรรมการที่แต่งตั้งโดยกฎหมาย หรือมติ ครม. ม.9 (7)', 'มติ ครม. หรือมติคณะกรรมการที่แต่งตั้งโดยกฎหมาย หรือมติ ครม. ม.9 (7)', 105, 'EXLINK', NULL, NULL, 7, NULL, NULL, 'Y'),
(178, 'ข้อมูลข่าวสารอื่นที่คณะกรรมการกำหนด ม.9 (8)', 'ข้อมูลข่าวสารอื่นที่คณะกรรมการกำหนด ม.9 (8)', 105, 'PAGE', 'page/178', '178', 8, 'null', NULL, 'Y'),
(182, 'รายชื่อผู้ตรวจสอบและรับรองมาตรฐานของต่างประเทศ', 'รายชื่อผู้ตรวจสอบและรับรองมาตรฐานของต่างประเทศ', 98, 'CUSTOM', 'country-list/auditor-country', 'auditor-country', 7, '', NULL, 'Y'),
(183, 'รายชื่อประเทศที่มีมาตรฐานทัดเทียมและได้รับการยอมรับ ผลการตรวจสอบ', 'รายชื่อประเทศที่มีมาตรฐานทัดเทียมและได้รับการยอมรับ ผลการตรวจสอบ', 98, 'CUSTOM', 'country-list/standard-country', 'standard-country', 6, '', NULL, 'Y'),
(184, 'ดาวน์โหลดเครื่องหมายรับรองมาตรฐาน', 'ดาวน์โหลดเครื่องหมายรับรองมาตรฐาน', 98, 'CUSTOM', 'attachfile-multi3/standard-logo', 'standard-logo', 5, '', NULL, 'Y'),
(185, 'รายชื่อผู้ประกอบการตรวจสอบ', 'รายชื่อผู้ประกอบการตรวจสอบ', 98, 'CUSTOM', 'form-data1-inspection-operator/inspection-operator', 'inspection-operator', 3, '', NULL, 'Y'),
(186, 'รายการชนิดสินค้าที่ถูกกำหนดเป็นรหัส', 'รายการชนิดสินค้าที่ถูกกำหนดเป็นรหัส', 98, 'CUSTOM', 'product-code', 'product-code', 3, '', NULL, 'Y'),
(187, 'กฎระเบียบสำคัญด้านมาตรฐานความปลอดภัยอาหาร ', 'กฎระเบียบสำคัญด้านมาตรฐานความปลอดภัยอาหาร', 85, 'CUSTOM', 'attachfile-multi3/rule-food', 'rule-food', 7, '', NULL, 'Y'),
(188, 'รายชื่อลูกค้า (CB)', 'รายชื่อลูกค้า (CB)', 155, 'CUSTOM', 'form-data1-customer/customer-list', 'customer-list', 4, NULL, NULL, 'Y'),
(189, 'รายชื่อผู้ประกอบการตรวจสอบมาตรฐาน', 'รายชื่อผู้ประกอบการตรวจสอบมาตรฐาน', 155, 'CUSTOM', 'form-data1-operator/operator-list', 'operator-list', 3, NULL, NULL, 'Y'),
(190, 'รายการมาตรฐานสากลที่ยอมรับได้', 'รายการมาตรฐานสากลที่ยอมรับได้', 98, 'CUSTOM', 'country-list/accept-standard', 'accept-standard', 8, '', NULL, 'Y'),
(191, 'ตรวจสอบรหัสเครื่องหมายรับรองมาตรฐาน', 'ตรวจสอบรหัสเครื่องหมายรับรองมาตรฐาน', 98, 'CUSTOM', 'certification-code/certification-code', 'certification-code', 9, '', NULL, 'Y'),
(192, 'ทะเบียนรายชื่อผู้ได้รับใบอนุญาต', 'ทะเบียนรายชื่อผู้ได้รับใบอนุญาต', 98, 'CUSTOM', 'license-register', 'license-register', 10, '', 'files/img/192_20181225161430_932491.jpg', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `menu_favourite`
--

CREATE TABLE `menu_favourite` (
  `id` bigint(20) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `menu_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_favourite`
--

INSERT INTO `menu_favourite` (`id`, `menu_id`, `email`, `menu_count`) VALUES
(1, 8, 'korapotu@gmail.com', 4),
(2, 55, 'korapotu@gmail.com', 2),
(3, 9, 'korapotu@gmail.com', 2),
(4, 10, 'korapotu@gmail.com', 1),
(5, 11, 'korapotu@gmail.com', 1),
(6, 120, 'korapotu@gmail.com', 41),
(7, 128, 'korapotu@gmail.com', 3),
(8, 123, 'korapotu@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `MOM_Files`
--

CREATE TABLE `MOM_Files` (
  `momFileID` int(11) NOT NULL,
  `meetingID` int(11) DEFAULT NULL,
  `standardID` int(11) DEFAULT NULL,
  `fileName` varchar(45) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `crateDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `News`
--

CREATE TABLE `News` (
  `id` int(11) NOT NULL,
  `news_type` varchar(100) NOT NULL,
  `news_date` date NOT NULL,
  `image_cover_path` varchar(512) NOT NULL,
  `title_th` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `contents` longblob NOT NULL,
  `contents_en` longblob,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `visit_count` int(11) NOT NULL,
  `show_homepage` char(1) NOT NULL DEFAULT 'N',
  `show_banner` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `News`
--

INSERT INTO `News` (`id`, `news_type`, `news_date`, `image_cover_path`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`, `visit_count`, `show_homepage`, `show_banner`) VALUES
(1, 'ข่าวประชาสัมพันธ์', '2018-08-15', 'files/img/news/20181001110456_920821.jpg', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', '2018-06-19 14:39:20', '2018-10-01 11:04:56', 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31307074223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d612c73616e732d7365726966223ee0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820313520e0b8aae0b8b4e0b887e0b8abe0b8b2e0b884e0b8a1203235363120e0b89ee0b8a5e0b980e0b8ade0b881266e6273703b3c7374726f6e673ee0b89be0b8a3e0b8b0e0b8a2e0b8b8e0b897e0b898e0b98c20e0b888e0b8b1e0b899e0b897e0b8a3e0b98ce0b982e0b8ade0b88ae0b8b23c2f7374726f6e673e266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b89ee0b8a3e0b989e0b8ade0b8a1e0b894e0b989e0b8a7e0b8a2266e6273703b3c7374726f6e673ee0b899e0b8b2e0b8a2e0b8a7e0b8b5e0b8a3e0b8b0e0b8a8e0b8b1e0b881e0b894e0b8b4e0b98c20e0b982e0b884e0b8a7e0b8aae0b8b8e0b8a3e0b8b1e0b895e0b899e0b98c3c2f7374726f6e673e266e6273703be0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b981e0b8a5e0b8b0e0b881e0b8b5e0b8ace0b8b2266e6273703b3c7374726f6e673ee0b899e0b8b2e0b8a2e0b8ade0b8b2e0b884e0b8a120e0b980e0b895e0b8b4e0b8a1e0b89ee0b8b4e0b897e0b8a2e0b8b2e0b984e0b89ee0b8aae0b8b4e0b8903c2f7374726f6e673e266e6273703be0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b884e0b8a1e0b899e0b8b2e0b884e0b8a1e0b897e0b8b5e0b98820e0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b8872028e0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad2920e0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b8a1e0b8b8e0b988e0b887e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a3e0b8b0e0b89ae0b89ae0b980e0b894e0b8b5e0b8a2e0b8a7e0b897e0b8b1e0b989e0b887e0b8a3e0b8b0e0b89ae0b89a20e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8b020e0b8a5e0b894e0b89be0b8b1e0b88de0b8abe0b8b2e0b888e0b8a3e0b8b2e0b888e0b8a3e0b983e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b8993c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a3070783b20746578742d616c69676e3a2d7765626b69742d6c656674223e266e6273703b3c2f703e0d0a0d0a3c646976207374796c653d222d7765626b69742d746578742d7374726f6b652d77696474683a3070783b20746578742d616c69676e3a2d7765626b69742d6c656674223e0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b20266e6273703b20266e6273703be0b881e0b988e0b8ade0b899e0b8ade0b8ade0b881e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b982e0b894e0b8a2e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b888e0b8b2e0b881e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b8aae0b899e0b8b2e0b8a1e0b881e0b8b5e0b8ace0b8b2e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b42857312920266e6273703be0b984e0b89be0b8a2e0b8b1e0b887e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b285331322920266e646173683b20536b7977616c6b266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b266e646173683b266e6273703be0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b899e0b8b1e0b989e0b899266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5266e6273703be0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b8a1e0b8ade0b89ae0b89ae0b8b1e0b895e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b88be0b8b6e0b988e0b887e0b8a1e0b8b5e0b8a0e0b8b2e0b89ee0b896e0b988e0b8b2e0b8a2e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b882e0b893e0b8b0e0b881e0b8b3e0b8a5e0b8b1e0b887e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b980e0b8a1e0b8b7e0b988e0b8ade0b884e0b8a3e0b8b1e0b989e0b887e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b984e0b89be0b980e0b89be0b8b4e0b894e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b8aae0b8b3e0b982e0b8a3e0b887e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8b5e0b897e0b8b5e0b988e0b89ce0b988e0b8b2e0b899e0b8a1e0b8b220e0b888e0b8b2e0b881e0b899e0b8b2e0b8a2e0b884e0b8b5e0b8a3e0b8b5266e6273703be0b881e0b8b2e0b88de0b888e0b899e0b89ee0b8b2e0b8aae0b899e0b98c266e6273703be0b89be0b8a3e0b8b0e0b898e0b8b2e0b899e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3266e6273703be0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897266e6273703be0b89ae0b8b5e0b897e0b8b5e0b980e0b8ade0b8aa266e6273703be0b881e0b8a3e0b8b8e0b98ae0b89b266e6273703be0b982e0b8aee0b8a5e0b894e0b8b4e0b989e0b887e0b8aae0b98c266e6273703be0b888e0b98de0b8b2e0b881e0b8b1e0b894266e6273703b28e0b8a1e0b8abe0b8b2e0b88ae0b89929266e6273703b266e6273703be0b982e0b894e0b8a2e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b881e0b8b2e0b8a8e0b89ae0b899e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b42545320266e6273703be0b882e0b893e0b8b0e0b897e0b8b5e0b988e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b8af20e0b8a2e0b8b1e0b887e0b980e0b89be0b8b4e0b894e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b895e0b8b2e0b8a1e0b89be0b881e0b895e0b8b420e0b88be0b8b6e0b988e0b887e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b89ee0b89ae0b89be0b8b0e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b899e0b8b1e0b881e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b897e0b8b5e0b988e0b8a1e0b8b2e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b881e0b8b1e0b899e0b980e0b8ade0b88720e0b982e0b894e0b8a2e0b984e0b894e0b989e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b881e0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b220e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8ade0b8a2e0b8b9e0b988e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b8ade0b8b2e0b88ae0b8b5e0b89ee0b895e0b988e0b8b2e0b88720e0b98620e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b894e0b989e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b899e0b983e0b88820e0b89ee0b8a3e0b989e0b8ade0b8a1e0b881e0b8b1e0b899e0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b980e0b8aae0b8b5e0b8a2e0b8aae0b8a5e0b8b0e0b897e0b8b5e0b988e0b899e0b8b1e0b988e0b887e0b882e0b8ade0b887e0b895e0b899e0b980e0b8ade0b887e0b89ae0b899e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b8aae0b8b8e0b8a0e0b8b2e0b89ee0b8aae0b895e0b8a3e0b8b5e0b984e0b894e0b989e0b899e0b8b1e0b988e0b887e0b894e0b989e0b8a7e0b8a220e0b982e0b894e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b897e0b8b5e0b988e0b984e0b894e0b989e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b983e0b8abe0b989e0b881e0b8b3e0b8a5e0b8b1e0b887e0b983e0b888e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b983e0b899e0b881e0b8b2e0b8a3e0b897e0b8b3e0b887e0b8b2e0b899e0b981e0b8a5e0b8b0e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b899e0b8ade0b8b5e0b881e0b894e0b989e0b8a7e0b8a23c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b8a1e0b8b7e0b988e0b8ade0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b896e0b8b6e0b887e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b2853313229266e6273703be0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b895e0b988e0b8ade0b895e0b8b2e0b8a1e0b897e0b8b2e0b887e0b980e0b894e0b8b4e0b899e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89a266e6273703b28536b7977616c6b29266e6273703be0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893266e6273703b323530266e6273703be0b980e0b8a1e0b895e0b8a3266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b88ae0b8b7e0b988e0b8ade0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b897e0b8b5e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703b28e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b22920266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b8a2e0b8aae0b8a3e0b8b8e0b89be0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887266e6273703b28e0b8a5e0b989e0b8ad266e6273703be0b8a3e0b8b2e0b887266e6273703be0b980e0b8a3e0b8b7e0b8ad29266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b981e0b8a5e0b8b0e0b981e0b89ce0b899e0b887e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b981e0b8a5e0b8b0e0b8aae0b988e0b8a7e0b899e0b895e0b988e0b8ade0b882e0b8a2e0b8b2e0b8a2e0b983e0b899e0b8ade0b899e0b8b2e0b884e0b89520e0b893266e6273703be0b89ae0b8a3e0b8b4e0b980e0b8a7e0b893e0b897e0b8b2e0b887e0b980e0b894e0b8b4e0b899e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89a266e6273703b28e0b8aae0b881e0b8b2e0b8a2e0b8a7e0b8ade0b8a5e0b98ce0b88429266e6273703be0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b3c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b982e0b8ade0b881e0b8b2e0b8aae0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b881e0b8a5e0b988e0b8b2e0b8a7e0b88ae0b8b7e0b988e0b899e0b88ae0b8a1e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b899e0b8a7e0b988e0b8b2e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8a5e0b988e0b8ade0b887e0b895e0b8b1e0b8a7e0b894e0b8b5e0b981e0b8a5e0b989e0b8a720e0b88be0b8b6e0b988e0b887e0b983e0b899e0b8ade0b899e0b8b2e0b884e0b895e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b882e0b8a2e0b8b2e0b8a2e0b980e0b8a1e0b8b7e0b8ade0b887e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b8ade0b8ade0b881e0b984e0b89be0b983e0b899e0b89ae0b8a3e0b8b4e0b980e0b8a7e0b893e0b8a3e0b8ade0b89ae0b899e0b8ade0b881e0b981e0b8a5e0b8b0e0b89be0b8a3e0b8b4e0b8a1e0b893e0b891e0b8a5e0b983e0b8abe0b989e0b8a1e0b8b2e0b881e0b882e0b8b6e0b989e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b881e0b8a3e0b8b0e0b888e0b8b2e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b980e0b888e0b8a3e0b8b4e0b88de0b984e0b89be0b8aae0b8b9e0b988e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b8ade0b8b7e0b988e0b899e0b981e0b897e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b980e0b889e0b89ee0b8b2e0b8b0e0b983e0b899e0b980e0b882e0b895e0b980e0b8a1e0b8b7e0b8ade0b887e0b980e0b897e0b988e0b8b2e0b899e0b8b1e0b989e0b89920e0b88be0b8b6e0b988e0b887e0b888e0b8b0e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b88ae0b988e0b8a7e0b8a2e0b89ae0b8a3e0b8a3e0b980e0b897e0b8b2e0b884e0b8a7e0b8b2e0b8a1e0b981e0b8ade0b8ade0b8b1e0b894e0b981e0b8a5e0b8b0e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b888e0b8a3e0b8b2e0b888e0b8a3e0b984e0b894e0b989e0b894e0b989e0b8a7e0b8a220e0b982e0b894e0b8a2e0b981e0b89ce0b899e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b899e0b8b1e0b989e0b899e0b8ade0b8a2e0b8b9e0b988e0b983e0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b88ae0b8b2e0b895e0b8b4266e6273703b3230266e6273703be0b897e0b8b5e0b988e0b8a3e0b8b1e0b890e0b89ae0b8b2e0b8a5e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b984e0b8a7e0b989e0b980e0b8a3e0b8b5e0b8a2e0b89ae0b8a3e0b989e0b8ade0b8a2e0b981e0b8a5e0b989e0b8a73c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b881e0b8b1e0b899e0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b89ee0b89ae0b89be0b8b0e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b88ae0b8b2e0b8a7e0b89ae0b989e0b8b2e0b899e0b983e0b899e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b897e0b8b5e0b988e0b8a1e0b8b2e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b895e0b989e0b8ade0b899e0b8a3e0b8b1e0b89ae0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b881e0b8b1e0b899e0b980e0b8ade0b88720e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8ade0b8a2e0b8b9e0b98820e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b980e0b89ee0b8b2e0b8b0e0b89be0b8a5e0b8b9e0b881e0b89ee0b8b7e0b88ae0b895e0b988e0b8b2e0b88720e0b98620e0b983e0b899e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a720266e6273703be0b982e0b894e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b984e0b894e0b989e0b899e0b8b3e0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b981e0b89be0b8a3e0b8a3e0b8b9e0b89be0b981e0b8a5e0b8b0e0b89ce0b8a5e0b89ce0b8a5e0b8b4e0b895e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b2e0b8a1e0b8ade0b89ae0b983e0b8abe0b989e0b881e0b8b1e0b89ae0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b894e0b989e0b8a7e0b8a220e0b983e0b899e0b982e0b8ade0b881e0b8b2e0b8aae0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a1e0b8b2e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b980e0b8a2e0b8b5e0b8a2e0b899e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b8872028e0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad2920e0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320266e6273703b3c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b888e0b8b2e0b881e0b899e0b8b1e0b989e0b899266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5266e6273703be0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b982e0b894e0b8a2e0b980e0b8a3e0b8b7e0b8ade0b897e0b8b5e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b984e0b89be0b8a2e0b8b1e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b881266e6273703be0b980e0b882e0b895e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88d266e6273703b266e6273703be0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893266e6273703b322e35266e6273703be0b881e0b8b4e0b982e0b8a5e0b980e0b8a1e0b895e0b8a3266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b8a2e0b980e0b88ae0b8b4e0b887e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b882e0b8ade0b887e0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ad266e6273703be0b8aae0b896e0b8b2e0b899e0b897e0b8b5e0b988e0b8aae0b8b3e0b884e0b8b1e0b88de0b888e0b8b2e0b881e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703be0b984e0b89be0b8a2e0b8b1e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b881266e6273703be0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b88ae0b8a1e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b89fe0b8b7e0b989e0b899e0b8a7e0b8b4e0b896e0b8b5e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b88ae0b8b8e0b8a1e0b88ae0b899e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8a2e0b988e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b881e0b8a3e0b8b8e0b887e0b898e0b899e0b89ae0b8b8e0b8a3e0b8b5266e6273703be0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887266e6273703b28e0b8a5e0b989e0b8ad266e6273703be0b8a3e0b8b2e0b887266e6273703be0b980e0b8a3e0b8b7e0b8ad29266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3266e6273703be0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b8a5e0b988e0b8ade0b887e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b981e0b8a5e0b8b0e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887266e6273703be0b881e0b988e0b8ade0b899e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b895e0b988e0b8ade0b984e0b89be0b8a2e0b8b1e0b887e0b8a7e0b8b1e0b894e0b8ade0b8b4e0b899e0b897e0b8b2e0b8a3e0b8b2e0b8a12028e0b89ae0b8b2e0b887e0b8a2e0b8b5e0b988e0b980e0b8a3e0b8b7e0b8ad2920e0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887266e6273703b332e35266e6273703be0b881e0b8b4e0b982e0b8a5e0b980e0b8a1e0b895e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b89fe0b8b7e0b989e0b899e0b8a7e0b8b4e0b896e0b8b5e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b88ae0b8b8e0b8a1e0b88ae0b899e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8a2e0b988e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b881e0b8a3e0b8b8e0b887e0b898e0b899e0b89ae0b8b8e0b8a3e0b8b5e0b895e0b988e0b8ade0b984e0b89b266e6273703b20266e6273703b20266e6273703b20266e6273703b3c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b98920e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988266e6273703b3238266e6273703be0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a1266e6273703b32353631266e6273703be0b980e0b89be0b987e0b899e0b895e0b989e0b899e0b8a1e0b8b220e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3e0b984e0b894e0b989e0b980e0b89be0b8b4e0b894e0b897e0b894e0b8a5e0b8ade0b887e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b983e0b8abe0b8a1e0b98820e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b8992de0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a12028e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b22920e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88d20e0b896e0b8b6e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b88120e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b881e0b8ade0b881e0b983e0b8abe0b88de0b9882028e0b895e0b8a5e0b8b2e0b894e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b8872920e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8a1e0b899e0b8b2e0b884e0b8a1e0b897e0b8b2e0b887e0b899e0b989e0b8b3e0b881e0b8b1e0b89ae0b980e0b882e0b989e0b8b2e0b881e0b8b1e0b89ae0b982e0b884e0b8a3e0b887e0b882e0b988e0b8b2e0b8a2e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8b0e0b8ade0b8b7e0b988e0b89920e0b98620e0b895e0b8b2e0b8a1e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2266e6273703b266c6471756f3be0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad26726471756f3b266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b898e0b899e0b8b2e0b884e0b8a120e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b89ae0b89ae0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad20e0b983e0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3e0b981e0b8a5e0b8b0e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b983e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b89920e0b8a1e0b8b2e0b980e0b89be0b987e0b899e0b89ce0b8b9e0b989e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b894e0b8a5e0b8ade0b88720e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b980e0b881e0b987e0b89ae0b884e0b988e0b8b2e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a320e0b983e0b899e0b897e0b8b8e0b881e0b8a7e0b8b1e0b899e0b8abe0b8a2e0b8b8e0b894e0b980e0b8aae0b8b2e0b8a3e0b98ce0b8ade0b8b2e0b897e0b8b4e0b895e0b8a2e0b98ce0b981e0b8a5e0b8b0e0b8a7e0b8b1e0b899e0b8abe0b8a2e0b8b8e0b894e0b899e0b8b1e0b881e0b882e0b8b1e0b895e0b8a4e0b881e0b8a9e0b98c20e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b980e0b8a7e0b8a5e0b8b2266e6273703b30382e303020266e646173683b2031382e3030266e6273703be0b8992e20e0b980e0b8a3e0b8b7e0b8ade0b888e0b8b0e0b8ade0b8ade0b881e0b897e0b8b8e0b881266e6273703b3330266e6273703be0b899e0b8b2e0b897e0b8b520e0b8a1e0b8b5e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b897e0b8b5e0b988e0b983e0b881e0b8a5e0b989e0b881e0b8b1e0b89ae0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b220e0b981e0b8a5e0b8b0e0b888e0b8b8e0b894e0b888e0b8ade0b894e0b8a3e0b896e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b888e0b8b3e0b897e0b8b2e0b88720e0b88be0b8b6e0b988e0b887e0b89ce0b988e0b8b2e0b899e0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b8a2e0b988e0b8b2e0b899e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b980e0b88ae0b988e0b89920e0b895e0b8a5e0b8b2e0b894e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b88720e0b89ae0b989e0b8b2e0b899e0b8a8e0b8b4e0b8a5e0b89be0b8b4e0b89920e0b981e0b8a5e0b8b0e0b88ae0b8b8e0b8a1e0b88ae0b899e0b8a3e0b989e0b8b2e0b899e0b884e0b989e0b8b2e0b982e0b89ae0b8a3e0b8b2e0b89320e0b980e0b89be0b987e0b899e0b895e0b989e0b8993c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c2f6469763e0d0a, 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31307074223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d612c73616e732d7365726966223ee0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820313520e0b8aae0b8b4e0b887e0b8abe0b8b2e0b884e0b8a1203235363120e0b89ee0b8a5e0b980e0b8ade0b881266e6273703b3c7374726f6e673ee0b89be0b8a3e0b8b0e0b8a2e0b8b8e0b897e0b898e0b98c20e0b888e0b8b1e0b899e0b897e0b8a3e0b98ce0b982e0b8ade0b88ae0b8b23c2f7374726f6e673e266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b89ee0b8a3e0b989e0b8ade0b8a1e0b894e0b989e0b8a7e0b8a2266e6273703b3c7374726f6e673ee0b899e0b8b2e0b8a2e0b8a7e0b8b5e0b8a3e0b8b0e0b8a8e0b8b1e0b881e0b894e0b8b4e0b98c20e0b982e0b884e0b8a7e0b8aae0b8b8e0b8a3e0b8b1e0b895e0b899e0b98c3c2f7374726f6e673e266e6273703be0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b981e0b8a5e0b8b0e0b881e0b8b5e0b8ace0b8b2266e6273703b3c7374726f6e673ee0b899e0b8b2e0b8a2e0b8ade0b8b2e0b884e0b8a120e0b980e0b895e0b8b4e0b8a1e0b89ee0b8b4e0b897e0b8a2e0b8b2e0b984e0b89ee0b8aae0b8b4e0b8903c2f7374726f6e673e266e6273703be0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b884e0b8a1e0b899e0b8b2e0b884e0b8a1e0b897e0b8b5e0b98820e0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b8872028e0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad2920e0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b8a1e0b8b8e0b988e0b887e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a3e0b8b0e0b89ae0b89ae0b980e0b894e0b8b5e0b8a2e0b8a7e0b897e0b8b1e0b989e0b887e0b8a3e0b8b0e0b89ae0b89a20e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8b020e0b8a5e0b894e0b89be0b8b1e0b88de0b8abe0b8b2e0b888e0b8a3e0b8b2e0b888e0b8a3e0b983e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b8993c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a3070783b20746578742d616c69676e3a2d7765626b69742d6c656674223e266e6273703b3c2f703e0d0a0d0a3c646976207374796c653d222d7765626b69742d746578742d7374726f6b652d77696474683a3070783b20746578742d616c69676e3a2d7765626b69742d6c656674223e0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b20266e6273703b20266e6273703be0b881e0b988e0b8ade0b899e0b8ade0b8ade0b881e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b982e0b894e0b8a2e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b888e0b8b2e0b881e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b8aae0b899e0b8b2e0b8a1e0b881e0b8b5e0b8ace0b8b2e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b42857312920266e6273703be0b984e0b89be0b8a2e0b8b1e0b887e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b285331322920266e646173683b20536b7977616c6b266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b266e646173683b266e6273703be0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b899e0b8b1e0b989e0b899266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5266e6273703be0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b8a1e0b8ade0b89ae0b89ae0b8b1e0b895e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b88be0b8b6e0b988e0b887e0b8a1e0b8b5e0b8a0e0b8b2e0b89ee0b896e0b988e0b8b2e0b8a2e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b882e0b893e0b8b0e0b881e0b8b3e0b8a5e0b8b1e0b887e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b980e0b8a1e0b8b7e0b988e0b8ade0b884e0b8a3e0b8b1e0b989e0b887e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b984e0b89be0b980e0b89be0b8b4e0b894e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b8aae0b8b3e0b982e0b8a3e0b887e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8b5e0b897e0b8b5e0b988e0b89ce0b988e0b8b2e0b899e0b8a1e0b8b220e0b888e0b8b2e0b881e0b899e0b8b2e0b8a2e0b884e0b8b5e0b8a3e0b8b5266e6273703be0b881e0b8b2e0b88de0b888e0b899e0b89ee0b8b2e0b8aae0b899e0b98c266e6273703be0b89be0b8a3e0b8b0e0b898e0b8b2e0b899e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3266e6273703be0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897266e6273703be0b89ae0b8b5e0b897e0b8b5e0b980e0b8ade0b8aa266e6273703be0b881e0b8a3e0b8b8e0b98ae0b89b266e6273703be0b982e0b8aee0b8a5e0b894e0b8b4e0b989e0b887e0b8aae0b98c266e6273703be0b888e0b98de0b8b2e0b881e0b8b1e0b894266e6273703b28e0b8a1e0b8abe0b8b2e0b88ae0b89929266e6273703b266e6273703be0b982e0b894e0b8a2e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b881e0b8b2e0b8a8e0b89ae0b899e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b42545320266e6273703be0b882e0b893e0b8b0e0b897e0b8b5e0b988e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b8af20e0b8a2e0b8b1e0b887e0b980e0b89be0b8b4e0b894e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b895e0b8b2e0b8a1e0b89be0b881e0b895e0b8b420e0b88be0b8b6e0b988e0b887e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b89ee0b89ae0b89be0b8b0e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b899e0b8b1e0b881e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b897e0b8b5e0b988e0b8a1e0b8b2e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b881e0b8b1e0b899e0b980e0b8ade0b88720e0b982e0b894e0b8a2e0b984e0b894e0b989e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b881e0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b220e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8ade0b8a2e0b8b9e0b988e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b8ade0b8b2e0b88ae0b8b5e0b89ee0b895e0b988e0b8b2e0b88720e0b98620e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b894e0b989e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b899e0b983e0b88820e0b89ee0b8a3e0b989e0b8ade0b8a1e0b881e0b8b1e0b899e0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b980e0b8aae0b8b5e0b8a2e0b8aae0b8a5e0b8b0e0b897e0b8b5e0b988e0b899e0b8b1e0b988e0b887e0b882e0b8ade0b887e0b895e0b899e0b980e0b8ade0b887e0b89ae0b899e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b8aae0b8b8e0b8a0e0b8b2e0b89ee0b8aae0b895e0b8a3e0b8b5e0b984e0b894e0b989e0b899e0b8b1e0b988e0b887e0b894e0b989e0b8a7e0b8a220e0b982e0b894e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b897e0b8b5e0b988e0b984e0b894e0b989e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b983e0b8abe0b989e0b881e0b8b3e0b8a5e0b8b1e0b887e0b983e0b888e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b983e0b899e0b881e0b8b2e0b8a3e0b897e0b8b3e0b887e0b8b2e0b899e0b981e0b8a5e0b8b0e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b899e0b8ade0b8b5e0b881e0b894e0b989e0b8a7e0b8a23c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b8a1e0b8b7e0b988e0b8ade0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b896e0b8b6e0b887e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b2853313229266e6273703be0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b895e0b988e0b8ade0b895e0b8b2e0b8a1e0b897e0b8b2e0b887e0b980e0b894e0b8b4e0b899e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89a266e6273703b28536b7977616c6b29266e6273703be0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893266e6273703b323530266e6273703be0b980e0b8a1e0b895e0b8a3266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b88ae0b8b7e0b988e0b8ade0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b897e0b8b5e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703b28e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b22920266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b8a2e0b8aae0b8a3e0b8b8e0b89be0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887266e6273703b28e0b8a5e0b989e0b8ad266e6273703be0b8a3e0b8b2e0b887266e6273703be0b980e0b8a3e0b8b7e0b8ad29266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b981e0b8a5e0b8b0e0b981e0b89ce0b899e0b887e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b981e0b8a5e0b8b0e0b8aae0b988e0b8a7e0b899e0b895e0b988e0b8ade0b882e0b8a2e0b8b2e0b8a2e0b983e0b899e0b8ade0b899e0b8b2e0b884e0b89520e0b893266e6273703be0b89ae0b8a3e0b8b4e0b980e0b8a7e0b893e0b897e0b8b2e0b887e0b980e0b894e0b8b4e0b899e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89a266e6273703b28e0b8aae0b881e0b8b2e0b8a2e0b8a7e0b8ade0b8a5e0b98ce0b88429266e6273703be0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b3c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b982e0b8ade0b881e0b8b2e0b8aae0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b881e0b8a5e0b988e0b8b2e0b8a7e0b88ae0b8b7e0b988e0b899e0b88ae0b8a1e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b899e0b8a7e0b988e0b8b2e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8a5e0b988e0b8ade0b887e0b895e0b8b1e0b8a7e0b894e0b8b5e0b981e0b8a5e0b989e0b8a720e0b88be0b8b6e0b988e0b887e0b983e0b899e0b8ade0b899e0b8b2e0b884e0b895e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b882e0b8a2e0b8b2e0b8a2e0b980e0b8a1e0b8b7e0b8ade0b887e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b8ade0b8ade0b881e0b984e0b89be0b983e0b899e0b89ae0b8a3e0b8b4e0b980e0b8a7e0b893e0b8a3e0b8ade0b89ae0b899e0b8ade0b881e0b981e0b8a5e0b8b0e0b89be0b8a3e0b8b4e0b8a1e0b893e0b891e0b8a5e0b983e0b8abe0b989e0b8a1e0b8b2e0b881e0b882e0b8b6e0b989e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b881e0b8a3e0b8b0e0b888e0b8b2e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b980e0b888e0b8a3e0b8b4e0b88de0b984e0b89be0b8aae0b8b9e0b988e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b8ade0b8b7e0b988e0b899e0b981e0b897e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b980e0b889e0b89ee0b8b2e0b8b0e0b983e0b899e0b980e0b882e0b895e0b980e0b8a1e0b8b7e0b8ade0b887e0b980e0b897e0b988e0b8b2e0b899e0b8b1e0b989e0b89920e0b88be0b8b6e0b988e0b887e0b888e0b8b0e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b88ae0b988e0b8a7e0b8a2e0b89ae0b8a3e0b8a3e0b980e0b897e0b8b2e0b884e0b8a7e0b8b2e0b8a1e0b981e0b8ade0b8ade0b8b1e0b894e0b981e0b8a5e0b8b0e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b888e0b8a3e0b8b2e0b888e0b8a3e0b984e0b894e0b989e0b894e0b989e0b8a7e0b8a220e0b982e0b894e0b8a2e0b981e0b89ce0b899e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b899e0b8b1e0b989e0b899e0b8ade0b8a2e0b8b9e0b988e0b983e0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b88ae0b8b2e0b895e0b8b4266e6273703b3230266e6273703be0b897e0b8b5e0b988e0b8a3e0b8b1e0b890e0b89ae0b8b2e0b8a5e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b984e0b8a7e0b989e0b980e0b8a3e0b8b5e0b8a2e0b89ae0b8a3e0b989e0b8ade0b8a2e0b981e0b8a5e0b989e0b8a73c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b881e0b8b1e0b899e0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b89ee0b89ae0b89be0b8b0e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b88ae0b8b2e0b8a7e0b89ae0b989e0b8b2e0b899e0b983e0b899e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b897e0b8b5e0b988e0b8a1e0b8b2e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b895e0b989e0b8ade0b899e0b8a3e0b8b1e0b89ae0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b881e0b8b1e0b899e0b980e0b8ade0b88720e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8ade0b8a2e0b8b9e0b98820e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b980e0b89ee0b8b2e0b8b0e0b89be0b8a5e0b8b9e0b881e0b89ee0b8b7e0b88ae0b895e0b988e0b8b2e0b88720e0b98620e0b983e0b899e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a720266e6273703be0b982e0b894e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b984e0b894e0b989e0b899e0b8b3e0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b981e0b89be0b8a3e0b8a3e0b8b9e0b89be0b981e0b8a5e0b8b0e0b89ce0b8a5e0b89ce0b8a5e0b8b4e0b895e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b2e0b8a1e0b8ade0b89ae0b983e0b8abe0b989e0b881e0b8b1e0b89ae0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b894e0b989e0b8a7e0b8a220e0b983e0b899e0b982e0b8ade0b881e0b8b2e0b8aae0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a1e0b8b2e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b980e0b8a2e0b8b5e0b8a2e0b899e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b8872028e0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad2920e0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320266e6273703b3c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b888e0b8b2e0b881e0b899e0b8b1e0b989e0b899266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5266e6273703be0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b982e0b894e0b8a2e0b980e0b8a3e0b8b7e0b8ade0b897e0b8b5e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b984e0b89be0b8a2e0b8b1e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b881266e6273703be0b980e0b882e0b895e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88d266e6273703b266e6273703be0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893266e6273703b322e35266e6273703be0b881e0b8b4e0b982e0b8a5e0b980e0b8a1e0b895e0b8a3266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b8a2e0b980e0b88ae0b8b4e0b887e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b882e0b8ade0b887e0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ad266e6273703be0b8aae0b896e0b8b2e0b899e0b897e0b8b5e0b988e0b8aae0b8b3e0b884e0b8b1e0b88de0b888e0b8b2e0b881e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703be0b984e0b89be0b8a2e0b8b1e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b881266e6273703be0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b88ae0b8a1e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b89fe0b8b7e0b989e0b899e0b8a7e0b8b4e0b896e0b8b5e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b88ae0b8b8e0b8a1e0b88ae0b899e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8a2e0b988e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b881e0b8a3e0b8b8e0b887e0b898e0b899e0b89ae0b8b8e0b8a3e0b8b5266e6273703be0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887266e6273703b28e0b8a5e0b989e0b8ad266e6273703be0b8a3e0b8b2e0b887266e6273703be0b980e0b8a3e0b8b7e0b8ad29266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3266e6273703be0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b8a5e0b988e0b8ade0b887e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b981e0b8a5e0b8b0e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887266e6273703be0b881e0b988e0b8ade0b899e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b895e0b988e0b8ade0b984e0b89be0b8a2e0b8b1e0b887e0b8a7e0b8b1e0b894e0b8ade0b8b4e0b899e0b897e0b8b2e0b8a3e0b8b2e0b8a12028e0b89ae0b8b2e0b887e0b8a2e0b8b5e0b988e0b980e0b8a3e0b8b7e0b8ad2920e0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887266e6273703b332e35266e6273703be0b881e0b8b4e0b982e0b8a5e0b980e0b8a1e0b895e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b89fe0b8b7e0b989e0b899e0b8a7e0b8b4e0b896e0b8b5e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b88ae0b8b8e0b8a1e0b88ae0b899e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8a2e0b988e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b881e0b8a3e0b8b8e0b887e0b898e0b899e0b89ae0b8b8e0b8a3e0b8b5e0b895e0b988e0b8ade0b984e0b89b266e6273703b20266e6273703b20266e6273703b20266e6273703b3c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b98920e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988266e6273703b3238266e6273703be0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a1266e6273703b32353631266e6273703be0b980e0b89be0b987e0b899e0b895e0b989e0b899e0b8a1e0b8b220e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3e0b984e0b894e0b989e0b980e0b89be0b8b4e0b894e0b897e0b894e0b8a5e0b8ade0b887e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b983e0b8abe0b8a1e0b98820e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b8992de0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a12028e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b22920e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88d20e0b896e0b8b6e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b88120e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b881e0b8ade0b881e0b983e0b8abe0b88de0b9882028e0b895e0b8a5e0b8b2e0b894e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b8872920e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8a1e0b899e0b8b2e0b884e0b8a1e0b897e0b8b2e0b887e0b899e0b989e0b8b3e0b881e0b8b1e0b89ae0b980e0b882e0b989e0b8b2e0b881e0b8b1e0b89ae0b982e0b884e0b8a3e0b887e0b882e0b988e0b8b2e0b8a2e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8b0e0b8ade0b8b7e0b988e0b89920e0b98620e0b895e0b8b2e0b8a1e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2266e6273703b266c6471756f3be0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad26726471756f3b266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b898e0b899e0b8b2e0b884e0b8a120e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b89ae0b89ae0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad20e0b983e0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3e0b981e0b8a5e0b8b0e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b983e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b89920e0b8a1e0b8b2e0b980e0b89be0b987e0b899e0b89ce0b8b9e0b989e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b894e0b8a5e0b8ade0b88720e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b980e0b881e0b987e0b89ae0b884e0b988e0b8b2e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a320e0b983e0b899e0b897e0b8b8e0b881e0b8a7e0b8b1e0b899e0b8abe0b8a2e0b8b8e0b894e0b980e0b8aae0b8b2e0b8a3e0b98ce0b8ade0b8b2e0b897e0b8b4e0b895e0b8a2e0b98ce0b981e0b8a5e0b8b0e0b8a7e0b8b1e0b899e0b8abe0b8a2e0b8b8e0b894e0b899e0b8b1e0b881e0b882e0b8b1e0b895e0b8a4e0b881e0b8a9e0b98c20e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b980e0b8a7e0b8a5e0b8b2266e6273703b30382e303020266e646173683b2031382e3030266e6273703be0b8992e20e0b980e0b8a3e0b8b7e0b8ade0b888e0b8b0e0b8ade0b8ade0b881e0b897e0b8b8e0b881266e6273703b3330266e6273703be0b899e0b8b2e0b897e0b8b520e0b8a1e0b8b5e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b897e0b8b5e0b988e0b983e0b881e0b8a5e0b989e0b881e0b8b1e0b89ae0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b220e0b981e0b8a5e0b8b0e0b888e0b8b8e0b894e0b888e0b8ade0b894e0b8a3e0b896e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b888e0b8b3e0b897e0b8b2e0b88720e0b88be0b8b6e0b988e0b887e0b89ce0b988e0b8b2e0b899e0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b8a2e0b988e0b8b2e0b899e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b980e0b88ae0b988e0b89920e0b895e0b8a5e0b8b2e0b894e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b88720e0b89ae0b989e0b8b2e0b899e0b8a8e0b8b4e0b8a5e0b89be0b8b4e0b89920e0b981e0b8a5e0b8b0e0b88ae0b8b8e0b8a1e0b88ae0b899e0b8a3e0b989e0b8b2e0b899e0b884e0b989e0b8b2e0b982e0b89ae0b8a3e0b8b2e0b89320e0b980e0b89be0b987e0b899e0b895e0b989e0b8993c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c2f6469763e0d0a, 'Y', 5, 'Y', 'N');
INSERT INTO `News` (`id`, `news_type`, `news_date`, `image_cover_path`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`, `visit_count`, `show_homepage`, `show_banner`) VALUES
(13, 'ข่าวประชาสัมพันธ์', '2018-08-15', 'files/img/news/20181001110410_699157.jpg', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', '2018-06-19 14:39:20', '2018-10-01 11:04:10', '', '', 'Y', 5, 'Y', 'N'),
(14, 'ข่าวประชาสัมพันธ์', '2018-08-15', 'files/img/news/20181001110341_128757.jpg', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', '2018-06-19 14:39:20', '2018-10-01 11:03:41', '', '', 'Y', 5, 'Y', 'N'),
(15, 'ข่าวประชาสัมพันธ์', '2018-08-15', 'files/img/news/20181001110226_330904.jpg', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', '2018-06-19 14:39:20', '2018-10-01 11:02:26', '', '', 'Y', 5, 'Y', 'N'),
(16, 'ข่าวประชาสัมพันธ์', '2018-08-15', 'files/img/news/20181001110125_496251.jpg', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', '2018-06-19 14:39:20', '2018-10-01 11:01:25', '', '', 'Y', 6, 'Y', 'N'),
(17, 'ข่าวประชาสัมพันธ์', '2018-08-15', 'files/img/news/20181001104555_878633.jpg', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', 'มกอช แจงสหรัฐไม่ได้เตรียมแบนสินค้าประมงไทย', '2018-06-19 14:39:20', '2018-10-27 09:55:36', 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31307074223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d612c73616e732d7365726966223ee0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820313520e0b8aae0b8b4e0b887e0b8abe0b8b2e0b884e0b8a1203235363120e0b89ee0b8a5e0b980e0b8ade0b881266e6273703b3c7374726f6e673ee0b89be0b8a3e0b8b0e0b8a2e0b8b8e0b897e0b898e0b98c20e0b888e0b8b1e0b899e0b897e0b8a3e0b98ce0b982e0b8ade0b88ae0b8b23c2f7374726f6e673e266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b89ee0b8a3e0b989e0b8ade0b8a1e0b894e0b989e0b8a7e0b8a2266e6273703b3c7374726f6e673ee0b899e0b8b2e0b8a2e0b8a7e0b8b5e0b8a3e0b8b0e0b8a8e0b8b1e0b881e0b894e0b8b4e0b98c20e0b982e0b884e0b8a7e0b8aae0b8b8e0b8a3e0b8b1e0b895e0b899e0b98c3c2f7374726f6e673e266e6273703be0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b981e0b8a5e0b8b0e0b881e0b8b5e0b8ace0b8b2266e6273703b3c7374726f6e673ee0b899e0b8b2e0b8a2e0b8ade0b8b2e0b884e0b8a120e0b980e0b895e0b8b4e0b8a1e0b89ee0b8b4e0b897e0b8a2e0b8b2e0b984e0b89ee0b8aae0b8b4e0b8903c2f7374726f6e673e266e6273703be0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b884e0b8a1e0b899e0b8b2e0b884e0b8a1e0b897e0b8b5e0b98820e0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b8872028e0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad2920e0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b8a1e0b8b8e0b988e0b887e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a3e0b8b0e0b89ae0b89ae0b980e0b894e0b8b5e0b8a2e0b8a7e0b897e0b8b1e0b989e0b887e0b8a3e0b8b0e0b89ae0b89a20e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8b020e0b8a5e0b894e0b89be0b8b1e0b88de0b8abe0b8b2e0b888e0b8a3e0b8b2e0b888e0b8a3e0b983e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b8993c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a3070783b20746578742d616c69676e3a2d7765626b69742d6c656674223e266e6273703b3c2f703e0d0a0d0a3c646976207374796c653d222d7765626b69742d746578742d7374726f6b652d77696474683a3070783b20746578742d616c69676e3a2d7765626b69742d6c656674223e0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b20266e6273703b20266e6273703be0b881e0b988e0b8ade0b899e0b8ade0b8ade0b881e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b982e0b894e0b8a2e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b888e0b8b2e0b881e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b8aae0b899e0b8b2e0b8a1e0b881e0b8b5e0b8ace0b8b2e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b42857312920266e6273703be0b984e0b89be0b8a2e0b8b1e0b887e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b285331322920266e646173683b20536b7977616c6b266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b266e646173683b266e6273703be0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b899e0b8b1e0b989e0b899266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5266e6273703be0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b8a1e0b8ade0b89ae0b89ae0b8b1e0b895e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b88be0b8b6e0b988e0b887e0b8a1e0b8b5e0b8a0e0b8b2e0b89ee0b896e0b988e0b8b2e0b8a2e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b882e0b893e0b8b0e0b881e0b8b3e0b8a5e0b8b1e0b887e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b980e0b8a1e0b8b7e0b988e0b8ade0b884e0b8a3e0b8b1e0b989e0b887e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b984e0b89be0b980e0b89be0b8b4e0b894e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b8aae0b8b3e0b982e0b8a3e0b887e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8b5e0b897e0b8b5e0b988e0b89ce0b988e0b8b2e0b899e0b8a1e0b8b220e0b888e0b8b2e0b881e0b899e0b8b2e0b8a2e0b884e0b8b5e0b8a3e0b8b5266e6273703be0b881e0b8b2e0b88de0b888e0b899e0b89ee0b8b2e0b8aae0b899e0b98c266e6273703be0b89be0b8a3e0b8b0e0b898e0b8b2e0b899e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3266e6273703be0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897266e6273703be0b89ae0b8b5e0b897e0b8b5e0b980e0b8ade0b8aa266e6273703be0b881e0b8a3e0b8b8e0b98ae0b89b266e6273703be0b982e0b8aee0b8a5e0b894e0b8b4e0b989e0b887e0b8aae0b98c266e6273703be0b888e0b98de0b8b2e0b881e0b8b1e0b894266e6273703b28e0b8a1e0b8abe0b8b2e0b88ae0b89929266e6273703b266e6273703be0b982e0b894e0b8a2e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b881e0b8b2e0b8a8e0b89ae0b899e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b42545320266e6273703be0b882e0b893e0b8b0e0b897e0b8b5e0b988e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b8af20e0b8a2e0b8b1e0b887e0b980e0b89be0b8b4e0b894e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b895e0b8b2e0b8a1e0b89be0b881e0b895e0b8b420e0b88be0b8b6e0b988e0b887e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b89ee0b89ae0b89be0b8b0e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b899e0b8b1e0b881e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b897e0b8b5e0b988e0b8a1e0b8b2e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b881e0b8b1e0b899e0b980e0b8ade0b88720e0b982e0b894e0b8a2e0b984e0b894e0b989e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b881e0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b220e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8ade0b8a2e0b8b9e0b988e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b8ade0b8b2e0b88ae0b8b5e0b89ee0b895e0b988e0b8b2e0b88720e0b98620e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b894e0b989e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b899e0b983e0b88820e0b89ee0b8a3e0b989e0b8ade0b8a1e0b881e0b8b1e0b899e0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b980e0b8aae0b8b5e0b8a2e0b8aae0b8a5e0b8b0e0b897e0b8b5e0b988e0b899e0b8b1e0b988e0b887e0b882e0b8ade0b887e0b895e0b899e0b980e0b8ade0b887e0b89ae0b899e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b8aae0b8b8e0b8a0e0b8b2e0b89ee0b8aae0b895e0b8a3e0b8b5e0b984e0b894e0b989e0b899e0b8b1e0b988e0b887e0b894e0b989e0b8a7e0b8a220e0b982e0b894e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b897e0b8b5e0b988e0b984e0b894e0b989e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b983e0b8abe0b989e0b881e0b8b3e0b8a5e0b8b1e0b887e0b983e0b888e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b983e0b899e0b881e0b8b2e0b8a3e0b897e0b8b3e0b887e0b8b2e0b899e0b981e0b8a5e0b8b0e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b899e0b8ade0b8b5e0b881e0b894e0b989e0b8a7e0b8a23c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b8a1e0b8b7e0b988e0b8ade0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b896e0b8b6e0b887e0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b2853313229266e6273703be0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b895e0b988e0b8ade0b895e0b8b2e0b8a1e0b897e0b8b2e0b887e0b980e0b894e0b8b4e0b899e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89a266e6273703b28536b7977616c6b29266e6273703be0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893266e6273703b323530266e6273703be0b980e0b8a1e0b895e0b8a3266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b88ae0b8b7e0b988e0b8ade0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b897e0b8b5e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703b28e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b22920266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b8a2e0b8aae0b8a3e0b8b8e0b89be0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887266e6273703b28e0b8a5e0b989e0b8ad266e6273703be0b8a3e0b8b2e0b887266e6273703be0b980e0b8a3e0b8b7e0b8ad29266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b981e0b8a5e0b8b0e0b981e0b89ce0b899e0b887e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b981e0b8a5e0b8b0e0b8aae0b988e0b8a7e0b899e0b895e0b988e0b8ade0b882e0b8a2e0b8b2e0b8a2e0b983e0b899e0b8ade0b899e0b8b2e0b884e0b89520e0b893266e6273703be0b89ae0b8a3e0b8b4e0b980e0b8a7e0b893e0b897e0b8b2e0b887e0b980e0b894e0b8b4e0b899e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89a266e6273703b28e0b8aae0b881e0b8b2e0b8a2e0b8a7e0b8ade0b8a5e0b98ce0b88429266e6273703be0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b2266e6273703b3c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b982e0b8ade0b881e0b8b2e0b8aae0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b881e0b8a5e0b988e0b8b2e0b8a7e0b88ae0b8b7e0b988e0b899e0b88ae0b8a1e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b899e0b8a7e0b988e0b8b2e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8a5e0b988e0b8ade0b887e0b895e0b8b1e0b8a7e0b894e0b8b5e0b981e0b8a5e0b989e0b8a720e0b88be0b8b6e0b988e0b887e0b983e0b899e0b8ade0b899e0b8b2e0b884e0b895e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b882e0b8a2e0b8b2e0b8a2e0b980e0b8a1e0b8b7e0b8ade0b887e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b8ade0b8ade0b881e0b984e0b89be0b983e0b899e0b89ae0b8a3e0b8b4e0b980e0b8a7e0b893e0b8a3e0b8ade0b89ae0b899e0b8ade0b881e0b981e0b8a5e0b8b0e0b89be0b8a3e0b8b4e0b8a1e0b893e0b891e0b8a5e0b983e0b8abe0b989e0b8a1e0b8b2e0b881e0b882e0b8b6e0b989e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b881e0b8a3e0b8b0e0b888e0b8b2e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b980e0b888e0b8a3e0b8b4e0b88de0b984e0b89be0b8aae0b8b9e0b988e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b8ade0b8b7e0b988e0b899e0b981e0b897e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b980e0b889e0b89ee0b8b2e0b8b0e0b983e0b899e0b980e0b882e0b895e0b980e0b8a1e0b8b7e0b8ade0b887e0b980e0b897e0b988e0b8b2e0b899e0b8b1e0b989e0b89920e0b88be0b8b6e0b988e0b887e0b888e0b8b0e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b88ae0b988e0b8a7e0b8a2e0b89ae0b8a3e0b8a3e0b980e0b897e0b8b2e0b884e0b8a7e0b8b2e0b8a1e0b981e0b8ade0b8ade0b8b1e0b894e0b981e0b8a5e0b8b0e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b888e0b8a3e0b8b2e0b888e0b8a3e0b984e0b894e0b989e0b894e0b989e0b8a7e0b8a220e0b982e0b894e0b8a2e0b981e0b89ce0b899e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b899e0b8b1e0b989e0b899e0b8ade0b8a2e0b8b9e0b988e0b983e0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b88ae0b8b2e0b895e0b8b4266e6273703b3230266e6273703be0b897e0b8b5e0b988e0b8a3e0b8b1e0b890e0b89ae0b8b2e0b8a5e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b984e0b8a7e0b989e0b980e0b8a3e0b8b5e0b8a2e0b89ae0b8a3e0b989e0b8ade0b8a2e0b981e0b8a5e0b989e0b8a73c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b881e0b8b1e0b899e0b899e0b8b5e0b98920e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b89ee0b89ae0b89be0b8b0e0b89ee0b8b9e0b894e0b884e0b8b8e0b8a2e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b88ae0b8b2e0b8a7e0b89ae0b989e0b8b2e0b899e0b983e0b899e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b897e0b8b5e0b988e0b8a1e0b8b2e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b895e0b989e0b8ade0b899e0b8a3e0b8b1e0b89ae0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b881e0b8b1e0b899e0b980e0b8ade0b88720e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8ade0b89ae0b896e0b8b2e0b8a1e0b896e0b8b6e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8ade0b8a2e0b8b9e0b98820e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b980e0b89ee0b8b2e0b8b0e0b89be0b8a5e0b8b9e0b881e0b89ee0b8b7e0b88ae0b895e0b988e0b8b2e0b88720e0b98620e0b983e0b899e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a720266e6273703be0b982e0b894e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b984e0b894e0b989e0b899e0b8b3e0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b981e0b89be0b8a3e0b8a3e0b8b9e0b89be0b981e0b8a5e0b8b0e0b89ce0b8a5e0b89ce0b8a5e0b8b4e0b895e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b2e0b8a1e0b8ade0b89ae0b983e0b8abe0b989e0b881e0b8b1e0b89ae0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b894e0b989e0b8a7e0b8a220e0b983e0b899e0b982e0b8ade0b881e0b8b2e0b8aae0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b8a1e0b8b2e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b980e0b8a2e0b8b5e0b8a2e0b899e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b8a3e0b8b0e0b89ae0b89ae0b882e0b899e0b8aae0b988e0b887e0b8a1e0b8a7e0b8a5e0b88ae0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b8872028e0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad2920e0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320266e6273703b3c6272202f3e0d0a3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b888e0b8b2e0b881e0b899e0b8b1e0b989e0b899266e6273703be0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5266e6273703be0b984e0b894e0b989e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b982e0b894e0b8a2e0b980e0b8a3e0b8b7e0b8ade0b897e0b8b5e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703be0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b984e0b89be0b8a2e0b8b1e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b881266e6273703be0b980e0b882e0b895e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88d266e6273703b266e6273703be0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893266e6273703b322e35266e6273703be0b881e0b8b4e0b982e0b8a5e0b980e0b8a1e0b895e0b8a3266e6273703be0b89ee0b8a3e0b989e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8a3e0b8a2e0b8b2e0b8a2e0b980e0b88ae0b8b4e0b887e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b882e0b8ade0b887e0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ad266e6273703be0b8aae0b896e0b8b2e0b899e0b897e0b8b5e0b988e0b8aae0b8b3e0b884e0b8b1e0b88de0b888e0b8b2e0b881e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b899266e6273703b266e646173683b266e6273703be0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a1266e6273703be0b984e0b89be0b8a2e0b8b1e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b881266e6273703be0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b88ae0b8a1e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b89fe0b8b7e0b989e0b899e0b8a7e0b8b4e0b896e0b8b5e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b88ae0b8b8e0b8a1e0b88ae0b899e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8a2e0b988e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b881e0b8a3e0b8b8e0b887e0b898e0b899e0b89ae0b8b8e0b8a3e0b8b5266e6273703be0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b888e0b8b8e0b894e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887266e6273703b28e0b8a5e0b989e0b8ad266e6273703be0b8a3e0b8b2e0b887266e6273703be0b980e0b8a3e0b8b7e0b8ad29266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3266e6273703be0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b8a5e0b988e0b8ade0b887e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b981e0b8a5e0b8b0e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887266e6273703be0b881e0b988e0b8ade0b899e0b980e0b894e0b8b4e0b899e0b897e0b8b2e0b887e0b895e0b988e0b8ade0b984e0b89be0b8a2e0b8b1e0b887e0b8a7e0b8b1e0b894e0b8ade0b8b4e0b899e0b897e0b8b2e0b8a3e0b8b2e0b8a12028e0b89ae0b8b2e0b887e0b8a2e0b8b5e0b988e0b980e0b8a3e0b8b7e0b8ad2920e0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b8b2e0b887266e6273703b332e35266e6273703be0b881e0b8b4e0b982e0b8a5e0b980e0b8a1e0b895e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8a3e0b8a7e0b888e0b980e0b8a2e0b8b5e0b988e0b8a2e0b8a1e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b89fe0b8b7e0b989e0b899e0b8a7e0b8b4e0b896e0b8b5e0b88ae0b8b5e0b8a7e0b8b4e0b895e0b88ae0b8b8e0b8a1e0b88ae0b899e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b887e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8a2e0b988e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8a7e0b8b1e0b895e0b8b4e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b881e0b8a3e0b8b8e0b887e0b898e0b899e0b89ae0b8b8e0b8a3e0b8b5e0b895e0b988e0b8ade0b984e0b89b266e6273703b20266e6273703b20266e6273703b20266e6273703b3c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c70207374796c653d226d617267696e2d6c6566743a3070783b206d617267696e2d72696768743a307078223e3c7370616e207374796c653d22666f6e742d73697a653a31337078223e3c7370616e207374796c653d22636f6c6f723a23303030303030223e3c7370616e207374796c653d22666f6e742d66616d696c793a5461686f6d61223e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b98920e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988266e6273703b3238266e6273703be0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a1266e6273703b32353631266e6273703be0b980e0b89be0b987e0b899e0b895e0b989e0b899e0b8a1e0b8b220e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3e0b984e0b894e0b989e0b980e0b89be0b8b4e0b894e0b897e0b894e0b8a5e0b8ade0b887e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b983e0b8abe0b8a1e0b98820e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8aae0b8b0e0b89ee0b8b2e0b899e0b895e0b8b2e0b881e0b8aae0b8b4e0b8992de0b980e0b89ee0b88ae0b8a3e0b980e0b881e0b8a9e0b8a12028e0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b22920e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88d20e0b896e0b8b6e0b887e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b8a7e0b8b1e0b894e0b881e0b8b3e0b981e0b89ee0b887e0b89ae0b8b2e0b887e0b888e0b8b2e0b88120e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b881e0b8ade0b881e0b983e0b8abe0b88de0b9882028e0b895e0b8a5e0b8b2e0b894e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b8872920e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8a1e0b899e0b8b2e0b884e0b8a1e0b897e0b8b2e0b887e0b899e0b989e0b8b3e0b881e0b8b1e0b89ae0b980e0b882e0b989e0b8b2e0b881e0b8b1e0b89ae0b982e0b884e0b8a3e0b887e0b882e0b988e0b8b2e0b8a2e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8b0e0b8ade0b8b7e0b988e0b89920e0b98620e0b895e0b8b2e0b8a1e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2266e6273703b266c6471756f3be0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad26726471756f3b266e6273703be0b882e0b8ade0b887e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a320e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b898e0b899e0b8b2e0b884e0b8a120e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b89ae0b89ae0b8a5e0b989e0b8ad20e0b8a3e0b8b2e0b88720e0b980e0b8a3e0b8b7e0b8ad20e0b983e0b899e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3e0b981e0b8a5e0b8b0e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b884e0b8a5e0b8ade0b887e0b8a0e0b8b2e0b8a9e0b8b5e0b980e0b888e0b8a3e0b8b4e0b88de0b983e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b89920e0b8a1e0b8b2e0b980e0b89be0b987e0b899e0b89ce0b8b9e0b989e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b980e0b894e0b8b4e0b899e0b980e0b8a3e0b8b7e0b8ade0b983e0b899e0b8a3e0b8b0e0b8a2e0b8b0e0b897e0b894e0b8a5e0b8ade0b88720e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b980e0b881e0b987e0b89ae0b884e0b988e0b8b2e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a320e0b983e0b899e0b897e0b8b8e0b881e0b8a7e0b8b1e0b899e0b8abe0b8a2e0b8b8e0b894e0b980e0b8aae0b8b2e0b8a3e0b98ce0b8ade0b8b2e0b897e0b8b4e0b895e0b8a2e0b98ce0b981e0b8a5e0b8b0e0b8a7e0b8b1e0b899e0b8abe0b8a2e0b8b8e0b894e0b899e0b8b1e0b881e0b882e0b8b1e0b895e0b8a4e0b881e0b8a9e0b98c20e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b980e0b8a7e0b8a5e0b8b2266e6273703b30382e303020266e646173683b2031382e3030266e6273703be0b8992e20e0b980e0b8a3e0b8b7e0b8ade0b888e0b8b0e0b8ade0b8ade0b881e0b897e0b8b8e0b881266e6273703b3330266e6273703be0b899e0b8b2e0b897e0b8b520e0b8a1e0b8b5e0b897e0b988e0b8b2e0b980e0b8a3e0b8b7e0b8ade0b897e0b8b5e0b988e0b983e0b881e0b8a5e0b989e0b881e0b8b1e0b89ae0b8aae0b896e0b8b2e0b899e0b8b5e0b8a3e0b896e0b984e0b89fe0b89fe0b989e0b8b2266e6273703b425453266e6273703be0b89ae0b8b2e0b887e0b8abe0b8a7e0b989e0b8b220e0b981e0b8a5e0b8b0e0b888e0b8b8e0b894e0b888e0b8ade0b894e0b8a3e0b896e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b888e0b8b3e0b897e0b8b2e0b88720e0b88be0b8b6e0b988e0b887e0b89ce0b988e0b8b2e0b899e0b980e0b8aae0b989e0b899e0b897e0b8b2e0b887e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b8a2e0b988e0b8b2e0b899e0b897e0b988e0b8ade0b887e0b980e0b897e0b8b5e0b988e0b8a2e0b8a7e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b980e0b88ae0b988e0b89920e0b895e0b8a5e0b8b2e0b894e0b884e0b8a5e0b8ade0b887e0b89ae0b8b2e0b887e0b8abe0b8a5e0b8a7e0b88720e0b89ae0b989e0b8b2e0b899e0b8a8e0b8b4e0b8a5e0b89be0b8b4e0b89920e0b981e0b8a5e0b8b0e0b88ae0b8b8e0b8a1e0b88ae0b899e0b8a3e0b989e0b8b2e0b899e0b884e0b989e0b8b2e0b982e0b89ae0b8a3e0b8b2e0b89320e0b980e0b89be0b987e0b899e0b895e0b989e0b8993c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c2f6469763e0d0a, '', 'Y', 60, 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `Officer_Contact_Dep`
--

CREATE TABLE `Officer_Contact_Dep` (
  `id` int(11) NOT NULL,
  `dep_name_th` varchar(255) NOT NULL,
  `dep_name_en` varchar(255) NOT NULL,
  `order_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Officer_Contact_Dep`
--

INSERT INTO `Officer_Contact_Dep` (`id`, `dep_name_th`, `dep_name_en`, `order_no`) VALUES
(2, 'กอง 2', 'office 2', 2),
(3, 'กอง 1', 'office 1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Officer_Contact_Person`
--

CREATE TABLE `Officer_Contact_Person` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `name_th` varchar(150) NOT NULL,
  `name_en` varchar(150) DEFAULT NULL,
  `position_th` varchar(100) NOT NULL,
  `position_en` varchar(100) DEFAULT NULL,
  `email` varchar(70) NOT NULL,
  `hotline` varchar(20) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Officer_Contact_Person`
--

INSERT INTO `Officer_Contact_Person` (`id`, `dep_id`, `name_th`, `name_en`, `position_th`, `position_en`, `email`, `hotline`, `tel`, `fax`, `create_date`, `update_date`) VALUES
(1, 2, 'ฟหก', 'and', 'ฟกฟหก', 'asdasd', 'asd@asd.com', '00129398', '09123898', '01923887', '2018-11-10 10:52:28', '2018-11-10 10:52:28'),
(2, 2, 'ads\'', 'asasd', 'asd', 'aasd', 'asdda@asd.com', '010293898', '010923887', '019283797', '2018-11-10 10:53:02', '2018-11-10 10:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `Online_Services`
--

CREATE TABLE `Online_Services` (
  `id` int(11) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `occupation` varchar(150) NOT NULL,
  `id_card` varchar(13) NOT NULL,
  `student_card` varchar(20) DEFAULT NULL,
  `work_place` varchar(512) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `province` varchar(100) NOT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(70) NOT NULL,
  `section` enum('มาตรา 9','มาตรา 11 แห่งพระราชบัญญัติข้อมูลข่าวสาร พ.ศ.2540') NOT NULL,
  `request_description` text,
  `status` enum('รอการดำเนินการ','ดำเนินการเสร็จสิ้น') NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Online_Services`
--

INSERT INTO `Online_Services` (`id`, `prefix`, `firstname`, `lastname`, `occupation`, `id_card`, `student_card`, `work_place`, `address`, `province`, `postcode`, `tel`, `email`, `section`, `request_description`, `status`, `create_date`, `update_date`) VALUES
(1, 'and', 'asdasd', 'asdasd', 'asdjhagsdh', '123019283', '09128301823', 'asdjh', 'ajshd', 'สมุทรปราการ', '01929', '012389781273', 'askdjh@kasjd.com', 'มาตรา 9', NULL, 'รอการดำเนินการ', '2018-11-25 22:22:17', '2018-11-25 22:22:17'),
(2, 'asdasd', 'asdasd', 'askdjh', 'asdaskdjh', '109128731823', '9182731873', 'asjdhgajh', 'asdhaskdjh', 'กรุงเทพมหานคร', '10188', '0128378', 'aksjdh@aksjd.com', 'มาตรา 9', 'asjdhgashjd', 'รอการดำเนินการ', '2018-11-25 22:24:01', '2018-11-25 22:24:01'),
(3, 'นางสาว', 'asldkjasd', 'asdkjh', 'รับราชการ', '9191287397', '981723981723', 'ashdgasjdh', 'jhagsdjhasd', 'กรุงเทพมหานคร', '10293', '019238129837', '91827391273', 'มาตรา 9', 'ashdgj', 'รอการดำเนินการ', '2018-11-25 22:25:37', '2018-11-25 22:25:37'),
(4, 'นางสาว', 'asd', 'aksjdh', 'พนักงานบริษัท', '10239810238', '91827391873', 'sjkdas', 'kjahsdh', 'กรุงเทพมหานคร', '19821', '010293891', 'asdas@aslkd.com', 'มาตรา 9', 'and', 'รอการดำเนินการ', '2018-11-25 22:27:09', '2018-11-25 22:27:09'),
(5, 'นาง', 'asdkj', 'kahsd', 'พนักงานบริษัท', '0120938', '09128398', 'asdjkh', 'laksjd', 'ปทุมธานี', '19182', '001928398', 'asdjkh@ad.com', 'มาตรา 11 แห่งพระราชบัญญัติข้อมูลข่าวสาร พ.ศ.2540', NULL, 'ดำเนินการเสร็จสิ้น', '2018-11-25 22:31:51', '2018-11-25 22:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `Online_ServicesType`
--

CREATE TABLE `Online_ServicesType` (
  `id` int(11) NOT NULL,
  `online_service_id` int(11) NOT NULL,
  `request_type` varchar(50) NOT NULL,
  `request_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Online_ServicesType`
--

INSERT INTO `Online_ServicesType` (`id`, `online_service_id`, `request_type`, `request_desc`) VALUES
(1, 4, 'ขอตรวจดู', '111'),
(2, 4, 'ขอสำเนาเอกสารที่มีการรับรองสำเนาถูกต้อง', '333'),
(3, 5, 'ขอตรวจดู', 'asdhg'),
(4, 5, 'ขอสำเนาเอกสารที่มีการรับรองสำเนาถูกต้อง', 'asdjk');

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE `Pages` (
  `id` int(11) NOT NULL,
  `page_type` varchar(40) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title_th` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `contents` longblob,
  `contents_en` longblob,
  `actives` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(1, '', 8, 'ประวัติความเป็นมา', 'ประวัติความเป็นมา', '2018-10-01 17:41:16', '2018-12-25 16:15:12', 0x3c703e266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703be0b899e0b8b1e0b89ae0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b984e0b897e0b8a2e0b980e0b882e0b989e0b8b2e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b982e0b8a5e0b8812028576f726c64205472616465204f7267616e697a6174696f6e203a2057544f2920e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b89ce0b8b9e0b989e0b8a3e0b988e0b8a7e0b8a1e0b881e0b988e0b8ade0b895e0b8b1e0b989e0b887e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8ade0b8b7e0b988e0b899e0b98620e0b8ade0b8b5e0b88120383020e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b980e0b8a1e0b8b7e0b988e0b8ade0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820323820e0b898e0b8b1e0b899e0b8a7e0b8b2e0b884e0b8a120e0b89e2ee0b8a82e203235333720e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b88ae0b989e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b894e0b989e0b8b2e0b899e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b981e0b8a5e0b8b0e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b89ee0b8b7e0b88a202841677265656d656e74206f6e20746865204170706c69636174696f6e206f662053616e697461727920616e6420506879746f73616e6974617279204d65617375726573203a205350532920e0b897e0b8b5e0b988e0b881e0b8b3e0b8abe0b899e0b894e0b881e0b895e0b8b4e0b881e0b8b2e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b988e0b8b2e0b887e0b98620e0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b897e0b8b3e0b983e0b8abe0b989e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b895e0b8a3e0b8b0e0b8abe0b899e0b8b1e0b881e0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b983e0b899e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b897e0b8b5e0b988e0b888e0b8b0e0b897e0b8a7e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b8b8e0b899e0b981e0b8a3e0b887e0b8a1e0b8b2e0b881e0b882e0b8b6e0b989e0b8993c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b894e0b989e0b8a7e0b8a2e0b980e0b8abe0b895e0b8b8e0b899e0b8b5e0b98920e0b888e0b8b6e0b887e0b984e0b894e0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b1e0b89ae0b982e0b884e0b8a3e0b887e0b8aae0b8a3e0b989e0b8b2e0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b980e0b89ee0b8b7e0b988e0b8ade0b8a3e0b8ade0b887e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b981e0b89be0b8a5e0b887e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a720e0b982e0b894e0b8a2e0b983e0b899e0b89be0b8b520e0b89e2ee0b8a82e203235343020e0b984e0b894e0b989e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b88720e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a32028e0b8aae0b8a1e0b8812e2920e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8aae0b8b1e0b887e0b881e0b8b1e0b894e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b89be0b8a5e0b8b1e0b894e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b89be0b987e0b899e0b8a8e0b8b9e0b899e0b8a2e0b98ce0b881e0b8a5e0b8b2e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b887e0b8b2e0b899e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a520e0b982e0b894e0b8a2e0b8a3e0b988e0b8a7e0b8a1e0b8a1e0b8b7e0b8ade0b881e0b8b1e0b89ae0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b895e0b988e0b8b2e0b887e0b986e0b8a0e0b8b2e0b8a2e0b983e0b899e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b8a1e0b8b8e0b988e0b887e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b981e0b89ae0b89ae0b980e0b89ae0b987e0b894e0b980e0b8aae0b8a3e0b987e0b888e0b983e0b899e0b881e0b8b2e0b8a3e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b981e0b8a5e0b8b0e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b888e0b899e0b881e0b8a3e0b8b0e0b897e0b8b1e0b988e0b887e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b89ae0b8b1e0b88de0b88de0b8b1e0b895e0b8b4e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b982e0b884e0b8a3e0b887e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b897e0b89ae0b8a7e0b88720e0b881e0b8a3e0b8a120e0b8a1e0b8b5e0b89ce0b8a5e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b88ae0b989e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8b5203235343520e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b42028e0b8a1e0b881e0b8ade0b88a2e2920e0b888e0b8b6e0b887e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b882e0b8b6e0b989e0b899e0b983e0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988203920e0b895e0b8b8e0b8a5e0b8b2e0b884e0b8a120e0b89e2ee0b8a82e203235343520e0b895e0b8b2e0b8a1e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b981e0b89ae0b988e0b887e0b8aae0b988e0b8a7e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b420e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b89e2ee0b8a82e203235343520e0b982e0b894e0b8a2e0b8ade0b8b2e0b8a8e0b8b1e0b8a2e0b8ade0b8b3e0b899e0b8b2e0b888e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b8a1e0b8b2e0b895e0b8a3e0b8b2203820e0b88920e0b981e0b8abe0b988e0b887e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b89ae0b8b1e0b88de0b88de0b8b1e0b895e0b8b4e0b8a3e0b8b0e0b980e0b89ae0b8b5e0b8a2e0b89ae0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b8992028e0b889e0b89ae0b8b1e0b89ae0b897e0b8b5e0b98820342920e0b89e2ee0b8a82e203235343320e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b881e0b8a3e0b8a120e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c3c2f703e0d0a, 0x3c703ee0b899e0b8b1e0b89ae0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b984e0b897e0b8a2e0b980e0b882e0b989e0b8b2e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b982e0b8a5e0b8812028576f726c64205472616465204f7267616e697a6174696f6e203a2057544f2920e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b89ce0b8b9e0b989e0b8a3e0b988e0b8a7e0b8a1e0b881e0b988e0b8ade0b895e0b8b1e0b989e0b887e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b89ae0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8ade0b8b7e0b988e0b899e0b98620e0b8ade0b8b5e0b88120383020e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b980e0b8a1e0b8b7e0b988e0b8ade0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820323820e0b898e0b8b1e0b899e0b8a7e0b8b2e0b884e0b8a120e0b89e2ee0b8a82e203235333720e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b88ae0b989e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b894e0b989e0b8b2e0b899e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b981e0b8a5e0b8b0e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b89ee0b8b7e0b88a202841677265656d656e74206f6e20746865204170706c69636174696f6e206f662053616e697461727920616e6420506879746f73616e6974617279204d65617375726573203a205350532920e0b897e0b8b5e0b988e0b881e0b8b3e0b8abe0b899e0b894e0b881e0b895e0b8b4e0b881e0b8b2e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b988e0b8b2e0b887e0b98620e0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b897e0b8b3e0b983e0b8abe0b989e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b895e0b8a3e0b8b0e0b8abe0b899e0b8b1e0b881e0b896e0b8b6e0b887e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b983e0b899e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b897e0b8b5e0b988e0b888e0b8b0e0b897e0b8a7e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b8b8e0b899e0b981e0b8a3e0b887e0b8a1e0b8b2e0b881e0b882e0b8b6e0b989e0b8993c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b894e0b989e0b8a7e0b8a2e0b980e0b8abe0b895e0b8b8e0b899e0b8b5e0b98920e0b888e0b8b6e0b887e0b984e0b894e0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b1e0b89ae0b982e0b884e0b8a3e0b887e0b8aae0b8a3e0b989e0b8b2e0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b980e0b89ee0b8b7e0b988e0b8ade0b8a3e0b8ade0b887e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b981e0b89be0b8a5e0b887e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a720e0b982e0b894e0b8a2e0b983e0b899e0b89be0b8b520e0b89e2ee0b8a82e203235343020e0b984e0b894e0b989e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b88720e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a32028e0b8aae0b8a1e0b8812e2920e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8aae0b8b1e0b887e0b881e0b8b1e0b894e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b89be0b8a5e0b8b1e0b894e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b89be0b987e0b899e0b8a8e0b8b9e0b899e0b8a2e0b98ce0b881e0b8a5e0b8b2e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b887e0b8b2e0b899e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a520e0b982e0b894e0b8a2e0b8a3e0b988e0b8a7e0b8a1e0b8a1e0b8b7e0b8ade0b881e0b8b1e0b89ae0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b895e0b988e0b8b2e0b887e0b986e0b8a0e0b8b2e0b8a2e0b983e0b899e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b8a1e0b8b8e0b988e0b887e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b981e0b89ae0b89ae0b980e0b89ae0b987e0b894e0b980e0b8aae0b8a3e0b987e0b888e0b983e0b899e0b881e0b8b2e0b8a3e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b981e0b8a5e0b8b0e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b888e0b899e0b881e0b8a3e0b8b0e0b897e0b8b1e0b988e0b887e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b89ae0b8b1e0b88de0b88de0b8b1e0b895e0b8b4e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b982e0b884e0b8a3e0b887e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b897e0b89ae0b8a7e0b88720e0b881e0b8a3e0b8a120e0b8a1e0b8b5e0b89ce0b8a5e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b88ae0b989e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8b5203235343520e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b42028e0b8a1e0b881e0b8ade0b88a2e2920e0b888e0b8b6e0b887e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b882e0b8b6e0b989e0b899e0b983e0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988203920e0b895e0b8b8e0b8a5e0b8b2e0b884e0b8a120e0b89e2ee0b8a82e203235343520e0b895e0b8b2e0b8a1e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b981e0b89ae0b988e0b887e0b8aae0b988e0b8a7e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b420e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b89e2ee0b8a82e203235343520e0b982e0b894e0b8a2e0b8ade0b8b2e0b8a8e0b8b1e0b8a2e0b8ade0b8b3e0b899e0b8b2e0b888e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b8a1e0b8b2e0b895e0b8a3e0b8b2203820e0b88920e0b981e0b8abe0b988e0b887e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b89ae0b8b1e0b88de0b88de0b8b1e0b895e0b8b4e0b8a3e0b8b0e0b980e0b89ae0b8b5e0b8a2e0b89ae0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b8992028e0b889e0b89ae0b8b1e0b89ae0b897e0b8b5e0b98820342920e0b89e2ee0b8a82e203235343320e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b881e0b8a3e0b8a120e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c3c2f703e0d0a, 'Y'),
(2, '', 144, '', '', '2018-10-01 18:57:05', '2018-10-01 18:57:05', 0x3c703e3c696d6720616c743d2222206865696768743d2238343922207372633d222f636b66696e6465722f7573657266696c65732f696d616765732f53637265656e25323053686f74253230323536312d30392d3233253230617425323032325f31345f32302e706e67222077696474683d223136303022202f3e3c2f703e0d0a, '', 'Y'),
(3, '', 10, 'วิสัยทัศน์/พันธกิจ/วัฒนธรรม/ค่านิยม', 'วิสัยทัศน์/พันธกิจ/วัฒนธรรม/ค่านิยม', '2018-10-02 09:17:22', '2018-12-25 16:21:18', 0x3c703e3c7374726f6e673ee0b8a7e0b8b4e0b8aae0b8b1e0b8a2e0b897e0b8b1e0b8a8e0b899e0b98c3c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b980e0b89be0b987e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b899e0b8b3e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b897e0b8b5e0b988e0b897e0b8b1e0b988e0b8a7e0b982e0b8a5e0b881e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89a3c2f703e0d0a0d0a3c703e3c6272202f3e0d0a3c7374726f6e673ee0b89ee0b8b1e0b899e0b898e0b881e0b8b4e0b8883c2f7374726f6e673e3c2f703e0d0a0d0a3c703e312e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a320e0b981e0b8a5e0b8b0e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b8aae0b8b2e0b881e0b8a53c2f703e0d0a0d0a3c703e322e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89a20e0b981e0b8a5e0b8b0e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b897e0b8b5e0b988e0b895e0b8a3e0b887e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a320e0b981e0b8a5e0b8b0e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a53c2f703e0d0a0d0a3c703e332e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b899e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b984e0b89be0b8aae0b8b9e0b988e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b895e0b8a5e0b8ade0b894e0b8abe0b988e0b8a7e0b887e0b982e0b88be0b988e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b89520e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b882e0b8b1e0b89ae0b980e0b884e0b8a5e0b8b7e0b988e0b8ade0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b894e0b989e0b8b2e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f703e0d0a0d0a3c703e342e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b897e0b988e0b8b2e0b897e0b8b520e0b981e0b8a5e0b8b0e0b980e0b888e0b8a3e0b888e0b8b2e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a220e0b981e0b8a5e0b8b0e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b89ee0b8b7e0b88ae0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f703e0d0a0d0a3c703e352e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a120e0b981e0b8a5e0b8b0e0b881e0b8b3e0b881e0b8b1e0b89a20e0b894e0b8b9e0b981e0b8a5e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a23c2f703e0d0a0d0a3c703e362e20e0b980e0b89be0b987e0b899e0b8a8e0b8b9e0b899e0b8a2e0b98ce0b881e0b8a5e0b8b2e0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c2f703e0d0a0d0a3c703e3c6272202f3e0d0a3c7374726f6e673ee0b8a7e0b8b1e0b892e0b899e0b898e0b8a3e0b8a3e0b8a13c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b897e0b8b3e0b887e0b8b2e0b899e0b894e0b989e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b982e0b89be0b8a3e0b988e0b887e0b983e0b8aa20e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b8a3e0b988e0b8a7e0b8a120e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b8aae0b8ade0b899e0b887e0b8b2e0b89920e0b981e0b8a5e0b8b0e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b7e0b8ade0b8ade0b8b2e0b88ae0b8b5e0b89e3c2f703e0d0a0d0a3c703e3c6272202f3e0d0a3c7374726f6e673ee0b884e0b988e0b8b2e0b899e0b8b4e0b8a2e0b8a13c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b8aae0b8b2e0b8a1e0b8b1e0b884e0b884e0b8b520e0b8a1e0b8b5e0b888e0b8a3e0b8b4e0b8a2e0b898e0b8a3e0b8a3e0b8a120e0b897e0b8b3e0b887e0b8b2e0b899e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b7e0b8ade0b8ade0b8b2e0b88ae0b8b5e0b89e3c2f703e0d0a, 0x3c703e3c7374726f6e673ee0b8a7e0b8b4e0b8aae0b8b1e0b8a2e0b897e0b8b1e0b8a8e0b899e0b98c3c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b980e0b89be0b987e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b899e0b8b3e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b897e0b8b5e0b988e0b897e0b8b1e0b988e0b8a7e0b982e0b8a5e0b881e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89a3c2f703e0d0a0d0a3c703e3c6272202f3e0d0a3c7374726f6e673ee0b89ee0b8b1e0b899e0b898e0b881e0b8b4e0b8883c2f7374726f6e673e3c2f703e0d0a0d0a3c703e312e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a320e0b981e0b8a5e0b8b0e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b8aae0b8b2e0b881e0b8a53c2f703e0d0a0d0a3c703e322e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b8a3e0b8b0e0b89ae0b89ae0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89a20e0b981e0b8a5e0b8b0e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b897e0b8b5e0b988e0b895e0b8a3e0b887e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a320e0b981e0b8a5e0b8b0e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a53c2f703e0d0a0d0a3c703e332e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b899e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b984e0b89be0b8aae0b8b9e0b988e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b895e0b8a5e0b8ade0b894e0b8abe0b988e0b8a7e0b887e0b982e0b88be0b988e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b89520e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b882e0b8b1e0b89ae0b980e0b884e0b8a5e0b8b7e0b988e0b8ade0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b894e0b989e0b8b2e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f703e0d0a0d0a3c703e342e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b897e0b988e0b8b2e0b897e0b8b520e0b981e0b8a5e0b8b0e0b980e0b888e0b8a3e0b888e0b8b2e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a220e0b981e0b8a5e0b8b0e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b89ee0b8b7e0b88ae0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f703e0d0a0d0a3c703e352e20e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a120e0b981e0b8a5e0b8b0e0b881e0b8b3e0b881e0b8b1e0b89a20e0b894e0b8b9e0b981e0b8a5e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a23c2f703e0d0a0d0a3c703e362e20e0b980e0b89be0b987e0b899e0b8a8e0b8b9e0b899e0b8a2e0b98ce0b881e0b8a5e0b8b2e0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c2f703e0d0a0d0a3c703e3c6272202f3e0d0a3c7374726f6e673ee0b8a7e0b8b1e0b892e0b899e0b898e0b8a3e0b8a3e0b8a13c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b897e0b8b3e0b887e0b8b2e0b899e0b894e0b989e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b982e0b89be0b8a3e0b988e0b887e0b983e0b8aa20e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b8a3e0b988e0b8a7e0b8a120e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b8aae0b8ade0b899e0b887e0b8b2e0b89920e0b981e0b8a5e0b8b0e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b7e0b8ade0b8ade0b8b2e0b88ae0b8b5e0b89e3c2f703e0d0a0d0a3c703e3c6272202f3e0d0a3c7374726f6e673ee0b884e0b988e0b8b2e0b899e0b8b4e0b8a2e0b8a13c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b8aae0b8b2e0b8a1e0b8b1e0b884e0b884e0b8b520e0b8a1e0b8b5e0b888e0b8a3e0b8b4e0b8a2e0b898e0b8a3e0b8a3e0b8a120e0b897e0b8b3e0b887e0b8b2e0b899e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b7e0b8ade0b8ade0b8b2e0b88ae0b8b5e0b89e3c2f703e0d0a, 'Y'),
(4, '', 9, 'ความหมายของตรา มกอช.', 'ความหมายของตรา มกอช.', '2018-10-17 22:03:38', '2018-12-25 16:16:26', 0x3c7020636c6173733d22696d6167652d616c69676e2d63656e746572223e3c696d6720616c743d2222206865696768743d2231363222207372633d222f636b66696e6465722f7573657266696c65732f696d616765732f53637265656e25323053686f74253230323536312d31302d3137253230617425323032315f35335f35322e706e67222077696474683d2232303022202f3e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693ee0b980e0b89be0b987e0b899e0b894e0b8a7e0b887e0b895e0b8a3e0b8b2e0b8a3e0b8b9e0b89be0b897e0b8a3e0b887e0b881e0b8a5e0b8a1e0b8a1e0b8b5e0b8a3e0b8b9e0b89be0b89ee0b8a3e0b8b0e0b980e0b881e0b8a9e0b895e0b8a3e0b89ae0b894e0b8b52028e0b89ee0b8a3e0b8b0e0b8a7e0b8a3e0b8b8e0b893e0b980e0b897e0b89ee0b89ce0b8b9e0b989e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8a1e0b89ae0b8b9e0b8a3e0b893e0b98c2920e0b8a2e0b8b7e0b899e0b89ae0b899e0b8abe0b8a5e0b8b1e0b887e0b899e0b8b2e0b884e0b8a3e0b8b2e0b88ae0b89ee0b988e0b899e0b899e0b989e0b8b3e0b980e0b8abe0b899e0b8b7e0b8ade0b881e0b989e0b8ade0b899e0b980e0b8a1e0b8863c2f6c693e0d0a093c6c693ee0b89ee0b8a3e0b8b0e0b8abe0b8b1e0b895e0b896e0b98ce0b88be0b989e0b8b2e0b8a2e0b8a2e0b881e0b8abe0b989e0b8b2e0b8a120e0b8abe0b8a1e0b8b2e0b8a2e0b896e0b8b6e0b88720e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f6c693e0d0a093c6c693ee0b89ee0b8a3e0b8b0e0b8abe0b8b1e0b895e0b896e0b98ce0b882e0b8a7e0b8b2e0b896e0b8b7e0b8ade0b89ee0b8a3e0b8b0e0b882e0b8a3e0b8a3e0b896e0b98c20e0b984e0b894e0b989e0b981e0b881e0b98820e0b881e0b8b2e0b8a3e0b980e0b89de0b989e0b8b2e0b8a3e0b8b0e0b8a7e0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f6c693e0d0a093c6c693ee0b980e0b89ae0b8b7e0b989e0b8ade0b887e0b8a5e0b988e0b8b2e0b887e0b8a1e0b8b5e0b8ade0b8b1e0b881e0b8a9e0b8a3e0b882e0b989e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b88ae0b8b7e0b988e0b8ade0b882e0b8ade0b887e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b982e0b884e0b989e0b887e0b8a3e0b8b1e0b89a3c2f6c693e0d0a3c2f756c3e0d0a, '', 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(5, '', 24, 'อำนาจตามกฎกระทรวง', 'อำนาจตามกฎกระทรวง', '2018-10-17 22:19:29', '2018-10-17 22:19:29', 0x3c703e3c7374726f6e673e266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703be0b8a1e0b8b5e0b8a0e0b8b2e0b8a3e0b881e0b8b4e0b888e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b881e0b8a5e0b8b2e0b887e0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b982e0b894e0b8a2e0b881e0b8b3e0b8abe0b899e0b8943c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b884e0b8a7e0b89ae0b884e0b8b8e0b8a13c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b984e0b8a3e0b988e0b899e0b8b2e0b888e0b899e0b896e0b8b6e0b887e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b8843c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b895e0b8a5e0b8ade0b894e0b888e0b899e0b881e0b8b2e0b8a3e0b980e0b888e0b8a3e0b888e0b8b2e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b980e0b88ae0b8b4e0b887e0b980e0b897e0b884e0b899e0b8b4e0b8843c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b981e0b8a5e0b8b0e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b983e0b8abe0b989e0b984e0b894e0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8993c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b5e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899e0b984e0b894e0b989e0b983e0b899e0b980e0b8a7e0b897e0b8b5e0b982e0b8a5e0b8813c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b982e0b894e0b8a2e0b983e0b8abe0b989e0b8a1e0b8b5e0b8ade0b8b3e0b899e0b8b2e0b888e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b9883c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b894e0b8b1e0b887e0b895e0b988e0b8ade0b984e0b89be0b899e0b8b5e0b9893c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e203c2f7374726f6e673e3c7374726f6e673ee0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b8ade0b8b7e0b988e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b8aae0b899e0b8ade0b981e0b899e0b8b0e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a23c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b899e0b8a7e0b897e0b8b2e0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b983e0b899e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b8943c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a13c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b888e0b8b1e0b8a23c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b23c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8aae0b8b5e0b988e0b8a2e0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b896e0b988e0b8b2e0b8a2e0b897e0b8ade0b8943c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a13c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b332e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b3e0b8abe0b899e0b894e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b894e0b989e0b8b2e0b899e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b881e0b8b3e0b881e0b8b1e0b89ae0b894e0b8b9e0b981e0b8a53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89de0b989e0b8b2e0b8a3e0b8b0e0b8a7e0b8b1e0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b980e0b895e0b8b7e0b8ade0b899e0b8a0e0b8b1e0b8a23c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b342e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b887e0b8b2e0b8993c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b3e0b8abe0b899e0b894e0b897e0b988e0b8b2e0b897e0b8b53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b8a3e0b988e0b8a7e0b8a1e0b980e0b888e0b8a3e0b888e0b8b2e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b894e0b989e0b8b2e0b899e0b980e0b897e0b884e0b899e0b8b4e0b8843c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b8a1e0b8b4e0b983e0b88ae0b988e0b8a0e0b8b2e0b8a9e0b8b53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b983e0b899e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b352e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b881e0b8a5e0b8b2e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b887e0b8b2e0b899e0b881e0b8b1e0b89ae0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b894e0b989e0b8b2e0b899e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b981e0b8a5e0b8b0e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b89ee0b8b7e0b88a3c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b983e0b899e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b8ade0b8b8e0b89be0b8aae0b8a3e0b8a3e0b884e0b897e0b8b2e0b887e0b980e0b897e0b884e0b899e0b8b4e0b884e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b884e0b989e0b8b23c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b362e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b981e0b8a5e0b8b0e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b894e0b989e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b372e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89be0b987e0b899e0b8a8e0b8b9e0b899e0b8a2e0b98ce0b881e0b8a5e0b8b2e0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b8aae0b8b2e0b8a3e0b8aae0b899e0b980e0b897e0b8a8e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c2f703e0d0a, 0x3c703e3c7374726f6e673e266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703be0b8a1e0b8b5e0b8a0e0b8b2e0b8a3e0b881e0b8b4e0b888e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b881e0b8a5e0b8b2e0b887e0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b982e0b894e0b8a2e0b881e0b8b3e0b8abe0b899e0b8943c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b884e0b8a7e0b89ae0b884e0b8b8e0b8a13c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b984e0b8a3e0b988e0b899e0b8b2e0b888e0b899e0b896e0b8b6e0b887e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b8843c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b895e0b8a5e0b8ade0b894e0b888e0b899e0b881e0b8b2e0b8a3e0b980e0b888e0b8a3e0b888e0b8b2e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b980e0b88ae0b8b4e0b887e0b980e0b897e0b884e0b899e0b8b4e0b8843c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b981e0b8a5e0b8b0e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b983e0b8abe0b989e0b984e0b894e0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8993c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b5e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899e0b984e0b894e0b989e0b983e0b899e0b980e0b8a7e0b897e0b8b5e0b982e0b8a5e0b8813c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b982e0b894e0b8a2e0b983e0b8abe0b989e0b8a1e0b8b5e0b8ade0b8b3e0b899e0b8b2e0b888e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b9883c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b894e0b8b1e0b887e0b895e0b988e0b8ade0b984e0b89be0b899e0b8b5e0b9893c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e203c2f7374726f6e673e3c7374726f6e673ee0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b8ade0b8b7e0b988e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b8aae0b899e0b8ade0b981e0b899e0b8b0e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a23c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b899e0b8a7e0b897e0b8b2e0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b983e0b899e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b8943c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a13c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b888e0b8b1e0b8a23c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b23c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8aae0b8b5e0b988e0b8a2e0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b896e0b988e0b8b2e0b8a2e0b897e0b8ade0b8943c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a13c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b332e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b3e0b8abe0b899e0b894e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b894e0b989e0b8b2e0b899e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b881e0b8b3e0b881e0b8b1e0b89ae0b894e0b8b9e0b981e0b8a53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89de0b989e0b8b2e0b8a3e0b8b0e0b8a7e0b8b1e0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b980e0b895e0b8b7e0b8ade0b899e0b8a0e0b8b1e0b8a23c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b342e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b887e0b8b2e0b8993c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b3e0b8abe0b899e0b894e0b897e0b988e0b8b2e0b897e0b8b53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b8a3e0b988e0b8a7e0b8a1e0b980e0b888e0b8a3e0b888e0b8b2e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b894e0b989e0b8b2e0b899e0b980e0b897e0b884e0b899e0b8b4e0b8843c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b8a1e0b8b4e0b983e0b88ae0b988e0b8a0e0b8b2e0b8a9e0b8b53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b983e0b899e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b352e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b881e0b8a5e0b8b2e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b887e0b8b2e0b899e0b881e0b8b1e0b89ae0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b894e0b989e0b8b2e0b899e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b981e0b8a5e0b8b0e0b8aae0b8b8e0b882e0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a2e0b89ee0b8b7e0b88a3c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b983e0b899e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b8ade0b8b8e0b89be0b8aae0b8a3e0b8a3e0b884e0b897e0b8b2e0b887e0b980e0b897e0b884e0b899e0b8b4e0b884e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b884e0b989e0b8b23c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b362e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b981e0b8a5e0b8b0e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b894e0b989e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c2f7374726f6e673e3c7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b372e203c2f7374726f6e673e3c7374726f6e673ee0b980e0b89be0b987e0b899e0b8a8e0b8b9e0b899e0b8a2e0b98ce0b881e0b8a5e0b8b2e0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b8aae0b8b2e0b8a3e0b8aae0b899e0b980e0b897e0b8a8e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c2f703e0d0a, 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(6, '', 25, 'บทบาทภารกิจตามมติ ครม.', 'บทบาทภารกิจตามมติ ครม.', '2018-10-17 22:28:18', '2018-10-17 22:28:18', 0x3c703e3c7374726f6e673ee0b89ae0b897e0b89ae0b8b2e0b897e0b8a0e0b8b2e0b8a3e0b881e0b8b4e0b888e0b895e0b8b2e0b8a1e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b884e0b8a3e0b8a13c2f7374726f6e673e3c7374726f6e673e2e20283236203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b8e0b8a1e0b8a0e0b8b2e0b89ee0b8b1e0b899e0b898e0b98c3c2f7374726f6e673e3c7374726f6e673e20266e646173683b203236203c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8b4e0b887e0b8abe0b8b2e0b884e0b8a13c2f7374726f6e673e3c7374726f6e673e203235343629203c2f7374726f6e673e3c7374726f6e673ee0b882e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8a1e0b881e0b8ade0b88a3c2f7374726f6e673e3c7374726f6e673e2e3c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673e266e6273703b3c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b8e0b8a1e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b53c2f7374726f6e673e3c7374726f6e673e283c2f7374726f6e673e3c7374726f6e673ee0b894e0b989e0b8b2e0b899e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b8883c2f7374726f6e673e3c7374726f6e673e293c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b8aae0b8b3e0b899e0b8b1e0b881e0b980e0b8a5e0b882e0b8b2e0b898e0b8b4e0b881e0b8b2e0b8a3e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b8a1e0b8b5e0b8a0e0b8b2e0b8a3e0b881e0b8b4e0b888e0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b882e0b8ade0b88720e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b984e0b894e0b989e0b888e0b8b1e0b894e0b897e0b8b3e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8a1e0b8a7e0b8a5e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a320e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b8a1e0b8b5e0b8a5e0b8b1e0b881e0b8a9e0b893e0b8b0e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b980e0b89ee0b8b4e0b988e0b8a120e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b8a0e0b8b2e0b89ee0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b8e0b8a1e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b882e0b8ade0b88720e0b8a3e0b8b1e0b890e0b89ae0b8b2e0b8a520e0b982e0b894e0b8a2e0b981e0b8aae0b894e0b887e0b983e0b8abe0b989e0b980e0b8abe0b987e0b899e0b896e0b8b6e0b887e0b881e0b8b2e0b8a3e0b897e0b8b3e0b887e0b8b2e0b89920e0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b899e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b88be0b8b6e0b988e0b887e0b8a1e0b8b520e0b89ee0b8b1e0b899e0b895e0b8b3e0b8a3e0b8a7e0b888e0b982e0b89720e0b897e0b8b1e0b881e0b8a9e0b8b4e0b89320e0b88ae0b8b4e0b899e0b8a7e0b8b1e0b895e0b8a320e0b980e0b89be0b987e0b899e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b8a1e0b895e0b8b4e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b89ce0b8a520e0b881e0b8b2e0b8a3e0b895e0b8b1e0b894e0b8aae0b8b4e0b899e0b983e0b888e0b983e0b899e0b980e0b88ae0b8b4e0b887e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b897e0b8b8e0b881e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b89920e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b980e0b8a5e0b988e0b8a1e0b899e0b8b5e0b989e0b980e0b89be0b987e0b899e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b897e0b8b5e0b988e0b984e0b894e0b989e0b89be0b8a3e0b8b0e0b8a1e0b8a7e0b8a5e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b983e0b899e0b88ae0b988e0b8a7e0b887203620e0b980e0b894e0b8b7e0b8ade0b899e0b981e0b8a3e0b881e0b882e0b8ade0b88720e0b89be0b8b5e0b897e0b8b5e0b988e0b8aae0b8b2e0b8a120e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b984e0b894e0b989e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b8992028323620e0b881e0b8b8e0b8a1e0b8a0e0b8b2e0b89ee0b8b1e0b899e0b898e0b98c20266e646173683b20323620e0b8aae0b8b4e0b887e0b8abe0b8b2e0b884e0b8a120323534362920e0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b989e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98c20e0b983e0b899e0b881e0b8b2e0b8a3e0b8a8e0b8b6e0b881e0b8a9e0b8b220e0b884e0b989e0b899e0b884e0b8a7e0b989e0b8b2e0b981e0b8a5e0b8b0e0b8ade0b989e0b8b2e0b887e0b8ade0b8b4e0b887e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b89ce0b8b9e0b989e0b897e0b8b5e0b988e0b8aae0b899e0b983e0b888266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b980e0b89ee0b8b4e0b988e0b8a1e0b882e0b8b5e0b894e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899e0b882e0b8ade0b887e0b8a0e0b8b2e0b884e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b899e0b895e0b8a5e0b8b2e0b894e0b982e0b8a5e0b8813c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b420283420e0b8a1e0b8b5e0b899e0b8b2e0b884e0b8a120323534362920e0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89ae0b981e0b8a5e0b8b0e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b89ce0b8a5e0b881e0b8b2e0b8a3e0b8abe0b8b2e0b8a3e0b8b7e0b8ade0b980e0b8a3e0b8b7e0b988e0b8ade0b88720e0b881e0b8a3e0b8ade0b89ae0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b981e0b8a5e0b8b0e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a32028466f6f64205361666574792920e0b982e0b894e0b8a2e0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b980e0b8abe0b987e0b899e0b8a7e0b988e0b8b2e0b881e0b8a3e0b8b0e0b89ae0b8a7e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b884e0b8a7e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b884e0b8a3e0b8ade0b89ae0b884e0b8a5e0b8b8e0b8a1e0b897e0b8b1e0b989e0b887e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b8a3e0b8b2e0b8a2e0b983e0b8abe0b88de0b988e0b981e0b8a5e0b8b0e0b8a3e0b8b2e0b8a2e0b8a2e0b988e0b8ade0b8a220e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b881e0b8b3e0b8abe0b899e0b894e0b8ade0b8b1e0b895e0b8a3e0b8b2e0b884e0b988e0b8b2e0b895e0b8ade0b89ae0b981e0b897e0b899e0b8abe0b8a3e0b8b7e0b8ade0b8a3e0b8b2e0b887e0b8a7e0b8b1e0b8a5e0b899e0b8b3e0b888e0b8b1e0b89ae0b983e0b8abe0b989e0b981e0b881e0b988e0b980e0b888e0b989e0b8b2e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b98820e0b897e0b8b5e0b988e0b897e0b8b3e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b888e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b888e0b8b3e0b8abe0b899e0b988e0b8b2e0b8a2e0b8a2e0b8b220e0b980e0b8a0e0b8aae0b8b1e0b88ae0b980e0b884e0b8a1e0b8b5e0b8a0e0b8b1e0b893e0b891e0b98c20e0b89be0b8b1e0b888e0b888e0b8b1e0b8a2e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b895e0b981e0b8a5e0b8b0e0b980e0b884e0b8a1e0b8b5e0b8a0e0b8b1e0b893e0b891e0b98ce0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a320e0b8aae0b988e0b8a7e0b899e0b881e0b8b2e0b8a3e0b8a5e0b887e0b982e0b897e0b8a9e0b89ce0b8b9e0b989e0b881e0b8a3e0b8b0e0b897e0b8b3e0b89ce0b8b4e0b894e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a220e0b983e0b8abe0b989e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b895e0b8b3e0b8a3e0b8a7e0b888e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b4e0b896e0b8b7e0b8ade0b980e0b89be0b987e0b899e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b888e0b8b0e0b895e0b989e0b8ade0b887e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b884e0b894e0b8b5e0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a220e0b981e0b881e0b988e0b89ce0b8b9e0b989e0b881e0b8a3e0b8b0e0b897e0b8b3e0b89ce0b8b4e0b89420e0b982e0b894e0b8a2e0b981e0b8a2e0b881e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8b3e0b884e0b8a7e0b8b2e0b8a1e0b89ce0b8b4e0b894e0b983e0b899e0b981e0b895e0b988e0b8a5e0b8b0e0b884e0b8a3e0b8b1e0b989e0b887e0b980e0b89be0b987e0b899e0b8a3e0b8b2e0b8a2e0b8aae0b8b3e0b899e0b8a7e0b899e0b897e0b8b8e0b881e0b884e0b8a3e0b8b1e0b989e0b887e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b884e0b8a3e0b988e0b887e0b884e0b8a3e0b8b1e0b8943c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e20283138203c2f7374726f6e673e3c7374726f6e673ee0b8a1e0b8b5e0b899e0b8b2e0b884e0b8a13c2f7374726f6e673e3c7374726f6e673e2032353436293c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89ae0b981e0b8a5e0b8b0e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b981e0b89ce0b899e0b89be0b989e0b8ade0b887e0b881e0b8b1e0b899e0b981e0b8a5e0b8b0e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b899e0b8b3e0b8a2e0b8b2e0b8aae0b8b1e0b895e0b8a7e0b98ce0b981e0b8a5e0b8b0e0b980e0b8a0e0b8aae0b8b1e0b88ae0b980e0b884e0b8a1e0b8b5e0b8a0e0b8b1e0b893e0b891e0b98ce0b984e0b89be0b983e0b88ae0b989e0b89ce0b8b4e0b894e0b8a7e0b8b1e0b895e0b896e0b8b8e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98c20e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b8a1e0b8b5e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b897e0b8b5e0b988e0b88ae0b8b1e0b894e0b980e0b888e0b899e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b899e0b8b3e0b984e0b89be0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b989e0b8ade0b887e0b881e0b8b1e0b899e0b981e0b8a5e0b8b0e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b899e0b8b3e0b8a2e0b8b2e0b8aae0b8b1e0b895e0b8a7e0b98ce0b981e0b8a5e0b8b0e0b980e0b8a0e0b8aae0b8b1e0b88ae0b980e0b884e0b8a1e0b8b5e0b8a0e0b8b1e0b893e0b891e0b98ce0b984e0b89be0b983e0b88ae0b989e0b89ce0b8b4e0b894e0b8a7e0b8b1e0b895e0b896e0b8b8e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98ce0b984e0b894e0b989e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a3e0b8a7e0b894e0b980e0b8a3e0b987e0b8a720e0b897e0b8b1e0b899e0b881e0b8b2e0b8a3e0b893e0b98c20e0b981e0b8a5e0b8b0e0b8a1e0b8b5e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b89ce0b8a5e0b8aae0b8b9e0b887e0b8aae0b8b8e0b89420e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8ade0b899e0b8b8e0b8a1e0b8b1e0b895e0b8b420e0b983e0b899e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b8aae0b8b2e0b8a3e0b980e0b8a3e0b988e0b887e0b980e0b899e0b8b7e0b989e0b8ade0b981e0b894e0b887e0b8abe0b8a3e0b8b7e0b8ade0b8aae0b8b2e0b8a3e0b881e0b8a5e0b8b8e0b988e0b8a1e0b980e0b89ae0b895e0b989e0b8b2e0b8ade0b8b0e0b982e0b881e0b899e0b8b4e0b8aae0b895e0b98ce0b983e0b899e0b8aae0b8b8e0b881e0b8a320e0b983e0b899e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b89fe0b8b2e0b8a3e0b98ce0b8a1e0b980e0b8a5e0b8b5e0b989e0b8a2e0b887e0b8aae0b8b1e0b895e0b8a7e0b98c20e0b982e0b8a3e0b887e0b886e0b988e0b8b2e0b8aae0b8b1e0b895e0b8a7e0b98c20e0b981e0b8a5e0b8b0e0b8aae0b896e0b8b2e0b899e0b897e0b8b5e0b988e0b888e0b8b3e0b8abe0b899e0b988e0b8b2e0b8a2e0b980e0b899e0b8b7e0b989e0b8ade0b8aae0b8b1e0b895e0b8a7e0b98c3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e202831203c2f7374726f6e673e3c7374726f6e673ee0b980e0b8a1e0b8a9e0b8b2e0b8a2e0b8993c2f7374726f6e673e3c7374726f6e673e2032353436293c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b8a3e0b8ade0b887e0b899e0b8b2e0b8a2e0b881e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b52028e0b899e0b8b2e0b8a2e0b8aae0b8b8e0b8a7e0b8b4e0b897e0b8a2e0b98c20e0b884e0b8b8e0b893e0b881e0b8b4e0b895e0b895e0b8b42920e0b8a3e0b8b1e0b89ae0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b8abe0b989e0b8ade0b887e0b897e0b894e0b8aae0b8ade0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2202874657374206c61622e2920e0b980e0b89ee0b8b7e0b988e0b8ade0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b88120e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b89be0b8a3e0b8b0e0b980e0b8a0e0b897e0b895e0b988e0b8b2e0b887e0b98620e0b882e0b8ade0b887e0b984e0b897e0b8a220e0b8a1e0b8b5e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89e20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a220e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b983e0b899e0b895e0b8a5e0b8b2e0b894e0b982e0b8a5e0b88120e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b984e0b89be0b888e0b8b3e0b8abe0b899e0b988e0b8b2e0b8a2e0b8a2e0b8b1e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b988e0b8b2e0b887e0b98620e0b984e0b894e0b98920e0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b896e0b8b9e0b881e0b881e0b8b5e0b894e0b881e0b8b1e0b89920e0b982e0b894e0b8a2e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b8a1e0b8b4e0b983e0b88ae0b988e0b8a0e0b8b2e0b8a9e0b8b520286e6f6e2d7461726966662062617272696572732d4e54422920e0b984e0b89be0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b89ae0b8aae0b988e0b8a7e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8ade0b8b7e0b988e0b89920e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b983e0b8abe0b989e0b984e0b894e0b989e0b882e0b989e0b8ade0b8a2e0b8b8e0b895e0b8b420e0b897e0b8b1e0b989e0b887e0b983e0b899e0b8aae0b988e0b8a7e0b899e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b882e0b8ade0b887e0b8a0e0b8b2e0b884e0b8a3e0b8b1e0b89020e0b8a3e0b8b9e0b89be0b981e0b89ae0b89ae0b897e0b8b5e0b988e0b888e0b8b0e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a320e0b895e0b8a5e0b8ade0b894e0b888e0b899e0b881e0b8b2e0b8a3e0b8aae0b899e0b8b1e0b89ae0b8aae0b899e0b8b8e0b89920e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b882e0b8ade0b887e0b8a0e0b8b2e0b884e0b980e0b8ade0b881e0b88ae0b899e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b899266e6273703b266e6273703b266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e20283232203c2f7374726f6e673e3c7374726f6e673ee0b980e0b8a1e0b8a9e0b8b2e0b8a2e0b8993c2f7374726f6e673e3c7374726f6e673e2032353436293c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b899e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b982e0b884e0b8a3e0b887e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b888e0b8b1e0b8a2e0b981e0b8a5e0b8b0e0b89ee0b8b1e0b892e0b899e0b8b2e0b980e0b897e0b884e0b982e0b899e0b982e0b8a5e0b8a2e0b8b5e0b88ae0b8b5e0b8a7e0b8a0e0b8b2e0b89ee0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b89ee0b8b4e0b988e0b8a1e0b882e0b8b5e0b894e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899203a20e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b8abe0b8a5e0b8b1e0b881e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3203320e0b8a3e0b8b2e0b8a2e0b881e0b8b2e0b8a320e0b984e0b894e0b989e0b981e0b881e0b98820e0b881e0b8b8e0b989e0b88720e0b882e0b989e0b8b2e0b8a720e0b8a1e0b8b1e0b899e0b8aae0b8b3e0b89be0b8b0e0b8abe0b8a5e0b8b1e0b887e0b981e0b8a5e0b8b0e0b981e0b89be0b989e0b8872028e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b8ade0b989e0b8ade0b8a2e0b983e0b8abe0b989e0b88ae0b8b0e0b8a5e0b8ade0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b984e0b8a7e0b989e0b881e0b988e0b8ade0b8992920e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b882e0b989e0b8a1e0b981e0b882e0b987e0b887e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b897e0b8b2e0b887e0b894e0b989e0b8b2e0b899e0b980e0b897e0b884e0b982e0b899e0b982e0b8a5e0b8a2e0b8b5e0b888e0b8b5e0b982e0b899e0b8a120266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e266e6273703b266e6273703b3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e202833203c2f7374726f6e673e3c7374726f6e673ee0b8a1e0b8b4e0b896e0b8b8e0b899e0b8b2e0b8a2e0b8993c2f7374726f6e673e3c7374726f6e673e203235343629266e6273703b3c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b88ae0b8b2e0b8a2e0b89de0b8b1e0b988e0b887e0b897e0b8b0e0b980e0b8a5e0b895e0b8b0e0b8a7e0b8b1e0b899e0b8ade0b8ade0b88120e0b982e0b894e0b8a2e0b983e0b8abe0b989e0b8aae0b8b3e0b8a3e0b8a7e0b888e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8a0e0b8b2e0b89ee0b882e0b989e0b8ade0b980e0b897e0b987e0b888e0b888e0b8a3e0b8b4e0b887e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b88ae0b8b2e0b8a2e0b897e0b8b0e0b980e0b8a5e0b89de0b8b1e0b988e0b887e0b895e0b8b0e0b8a7e0b8b1e0b899e0b8ade0b8ade0b881e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b980e0b882e0b895e0b888e0b8b1e0b887e0b8abe0b8a7e0b8b1e0b894e0b88ae0b8a5e0b89ae0b8b8e0b8a3e0b8b5e0b8a5e0b887e0b984e0b89be0b896e0b8b6e0b887e0b980e0b882e0b895e0b888e0b8b1e0b887e0b8abe0b8a7e0b8b1e0b894e0b980e0b89ee0b88ae0b8a3e0b89ae0b8b8e0b8a3e0b8b520e0b981e0b8a5e0b8b0e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b888e0b8b1e0b894e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b983e0b8abe0b989e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a1e0b980e0b89ee0b8b7e0b988e0b8ade0b8a3e0b8b1e0b881e0b8a9e0b8b2e0b8aae0b8a0e0b8b2e0b89ee0b981e0b8a7e0b894e0b8a5e0b989e0b8ade0b8a1e0b981e0b8a5e0b8b0e0b8aae0b8b1e0b895e0b8a7e0b98ce0b899e0b989e0b8b3e0b983e0b8abe0b989e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8a2e0b8b1e0b988e0b887e0b8a2e0b8b7e0b899266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e20283137203c2f7374726f6e673e3c7374726f6e673ee0b8a1e0b8b4e0b896e0b8b8e0b899e0b8b2e0b8a2e0b8993c2f7374726f6e673e3c7374726f6e673e2032353436293c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b8ade0b899e0b8b8e0b8a1e0b8b1e0b895e0b8b4e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b8a3e0b988e0b8b2e0b887e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b982e0b8a3e0b884e0b8a3e0b8b0e0b89ae0b8b2e0b89420e0b982e0b8a3e0b884e0b8abe0b8a3e0b8b7e0b8ade0b8a5e0b8b1e0b881e0b8a9e0b893e0b8b0e0b882e0b8ade0b887e0b8aae0b8b1e0b895e0b8a7e0b98ce0b8abe0b8a3e0b8b7e0b8ade0b980e0b899e0b8b7e0b989e0b8ade0b8aae0b8b1e0b895e0b8a7e0b98ce0b897e0b8b5e0b988e0b984e0b8a1e0b988e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a1e0b888e0b8b0e0b983e0b88ae0b989e0b980e0b899e0b8b7e0b989e0b8ade0b8aae0b8b1e0b895e0b8a7e0b98ce0b980e0b88ae0b988e0b899e0b899e0b8b1e0b989e0b899e0b980e0b89be0b987e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b89e2ee0b8a82e202e2e2e2e2028e0b881e0b8b3e0b8abe0b899e0b894e0b8a5e0b8b1e0b881e0b8a9e0b893e0b8b0e0b882e0b8ade0b887e0b8aae0b8b1e0b895e0b8a7e0b98ce0b981e0b8a5e0b8b0e0b980e0b899e0b8b7e0b989e0b8ade0b8aae0b8b1e0b895e0b8a7e0b98ce0b897e0b8b5e0b988e0b895e0b8a3e0b8a7e0b888e0b89ee0b89ae0b8a7e0b988e0b8b220e0b8a1e0b8b5e0b8aae0b8b2e0b8a3e0b881e0b8a5e0b8b8e0b988e0b8a1e0b980e0b89ae0b895e0b989e0b8b2e0b8ade0b8b0e0b982e0b881e0b899e0b8b4e0b8aae0b897e0b98ce0b895e0b881e0b884e0b989e0b8b2e0b88720e0b983e0b8abe0b989e0b896e0b8b7e0b8ade0b8a7e0b988e0b8b2e0b984e0b8a1e0b988e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a1e0b897e0b8b5e0b988e0b888e0b8b0e0b983e0b88ae0b989e0b980e0b899e0b8b7e0b989e0b8ade0b8aae0b8b1e0b895e0b8a7e0b98ce0b899e0b8b1e0b989e0b899e0b980e0b89be0b987e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a32920e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8ade0b899e0b8b8e0b8a1e0b8b1e0b895e0b8b4e0b895e0b8b2e0b8a1e0b8a1e0b895e0b8b4e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b881e0b8a5e0b8b1e0b988e0b899e0b881e0b8a3e0b8ade0b887e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b884e0b893e0b8b0e0b897e0b8b5e0b988203620e0b8ade0b899e0b8b8e0b8a1e0b8b1e0b895e0b8b4e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b8a3e0b988e0b8b2e0b887e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b889e0b89ae0b8b1e0b89ae0b897e0b8b5e0b988202e2e2028e0b89e2ee0b8a82e202e2e2e2e2920e0b8ade0b8ade0b881e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b89ae0b8b1e0b88de0b88de0b8b1e0b895e0b8b4e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b89e2ee0b8a82e323532322028e0b8a2e0b881e0b980e0b8a5e0b8b4e0b881e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b882e0b989e0b8ad203420e0b882e0b8ade0b887e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b889e0b89ae0b8b1e0b89ae0b897e0b8b5e0b98820322028e0b89e2ee0b8a82e20323532322920e0b8ade0b8ade0b881e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b89ae0b8b1e0b88de0b88de0b8b1e0b895e0b8b4e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b89e2ee0b8a82e203235323220e0b8a5e0b887e0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820313720e0b89ee0b8a4e0b8a8e0b888e0b8b4e0b881e0b8b2e0b8a2e0b89920e0b89e2ee0b8a82e203235323220e0b982e0b894e0b8a2e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b8a1e0b988e0b983e0b8abe0b989e0b89ce0b8b9e0b989e0b8a3e0b8b1e0b89ae0b8ade0b899e0b8b8e0b88de0b8b2e0b895e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b88be0b8b6e0b988e0b887e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b980e0b89ee0b8b7e0b988e0b8ade0b888e0b8b3e0b8abe0b899e0b988e0b8b2e0b8a2e0b895e0b989e0b8ade0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b42920e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b89be0b8b520e0b89e2ee0b8a82e203235343720e0b980e0b89be0b987e0b899e0b89be0b8b5e0b981e0b8abe0b988e0b887e0b8aae0b8b8e0b882e0b8a0e0b8b2e0b89ee0b8ade0b899e0b8b2e0b8a1e0b8b1e0b8a220e0b88be0b8b6e0b988e0b887e0b888e0b8b0e0b8a3e0b893e0b8a3e0b887e0b884e0b98ce0b981e0b8a5e0b8b0e0b980e0b89ce0b8a2e0b981e0b89ee0b8a3e0b988e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b981e0b89ee0b8a3e0b988e0b8abe0b8a5e0b8b2e0b8a2e0b981e0b8a5e0b8b0e0b881e0b8a7e0b989e0b8b2e0b887e0b882e0b8a7e0b8b2e0b887e0b8ade0b8ade0b881e0b984e0b89be0b897e0b8b1e0b989e0b887e0b983e0b899e0b981e0b8a5e0b8b0e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b982e0b894e0b8a2e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8aae0b8b8e0b88220e0b984e0b894e0b989e0b888e0b8b1e0b894e0b897e0b8b3e0b981e0b89ce0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b894e0b989e0b8b2e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a32028666f6f64207361666574792920e0b981e0b8a5e0b989e0b8a720e0b881e0b8b1e0b89ae0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b888e0b8b3e0b881e0b8b1e0b89420e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b887e0b89ae0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b893e0b980e0b89ee0b8b7e0b988e0b8ade0b881e0b8b2e0b8a3e0b899e0b8b5e0b98920e0b888e0b8b3e0b899e0b8a7e0b89920312c39353020e0b8a5e0b989e0b8b2e0b899e0b89ae0b8b2e0b89720e0b983e0b8abe0b989e0b983e0b88ae0b989e0b888e0b988e0b8b2e0b8a2e0b982e0b894e0b8a2e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988203120e0b897e0b8b8e0b899e0b888e0b894e0b897e0b8b0e0b980e0b89ae0b8b5e0b8a2e0b899e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b8af20e0b888e0b8b3e0b899e0b8a7e0b8992032353020e0b8a5e0b989e0b8b2e0b899e0b89ae0b8b2e0b89720e0b983e0b8abe0b989e0b980e0b89ae0b8b4e0b881e0b980e0b89be0b987e0b899e0b980e0b887e0b8b4e0b899e0b888e0b988e0b8b2e0b8a2e0b882e0b8b2e0b894e0b888e0b8b2e0b881e0b887e0b89ae0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b982e0b884e0b8a3e0b887e0b8aae0b8a3e0b989e0b8b2e0b887e0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888e0b981e0b8a5e0b8b0e0b8aae0b8b1e0b887e0b884e0b8a120e0b89be0b8a3e0b8b0e0b888e0b8b3e0b89be0b8b5e0b887e0b89ae0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b89320e0b89e2ee0b8a82e203235343620e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988203220e0b980e0b887e0b8b4e0b899e0b8a5e0b887e0b897e0b8b8e0b899e0b981e0b8a5e0b8b0e0b887e0b89ae0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b882e0b8ade0b887e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b8af20e0b888e0b8b3e0b899e0b8a7e0b89920312c37303020e0b8a5e0b989e0b8b2e0b899e0b89ae0b8b2e0b89720e0b983e0b8abe0b989e0b980e0b89ae0b8b4e0b881e0b980e0b89be0b987e0b899e0b980e0b887e0b8b4e0b899e0b8a2e0b8b7e0b8a1266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e266e6273703b3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e202838203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a13c2f7374726f6e673e3c7374726f6e673e203235343629266e6273703b3c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89ae0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b8a2e0b881e0b980e0b8a5e0b8b4e0b881e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b881e0b8b8e0b989e0b887e0b984e0b881e0b988e0b983e0b899e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b884e0b8a1e0b8a2e0b8b8e0b982e0b8a3e0b89b20e0b888e0b8b2e0b881e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b881e0b8b8e0b989e0b887e0b88be0b8b6e0b988e0b887e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b982e0b894e0b8a2e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b89720492e432e432e20434f534d4f532028313031342920e0b8a1e0b8b5e0b983e0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b980e0b8a5e0b882e0b897e0b8b5e0b988205257494c2f323030323230332f35313520e0b8a5e0b887e0b8a7e0b8b1e0b899e0b897e0b8b5e0b9883320e0b8a1e0b8b5e0b899e0b8b2e0b884e0b8a1203235343620e0b8a1e0b8b5e0b8aae0b8b2e0b8a3204e6974726f20667572616e20e0b895e0b881e0b884e0b989e0b8b2e0b887e0b983e0b899e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b8aae0b8b9e0b88720e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b89ee0b89ae0b8a7e0b988e0b8b2e0b983e0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8b2e0b8a3e0b895e0b881e0b884e0b989e0b8b2e0b887e0b897e0b8b5e0b988e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b983e0b88ae0b989e0b980e0b89be0b987e0b899e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b89be0b8a5e0b8ade0b8a120e0b888e0b8b6e0b887e0b984e0b894e0b989e0b981e0b888e0b989e0b887e0b983e0b8abe0b989e0b897e0b8b2e0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b884e0b8a1e0b8af20e0b897e0b8a3e0b8b2e0b89ae0b896e0b8b6e0b887e0b881e0b8b2e0b8a3e0b8aae0b8b1e0b988e0b887e0b881e0b8b2e0b8a3e0b8a2e0b881e0b980e0b8a5e0b8b4e0b881e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b8ade0b8ade0b881e0b888e0b8b2e0b881e0b89ae0b8b1e0b88de0b88ae0b8b5e0b8a3e0b8b2e0b8a2e0b88ae0b8b7e0b988e0b8ade0b89ce0b8b9e0b989e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b984e0b89be0b8a2e0b8b1e0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b884e0b8a1e0b8af20e0b981e0b8a5e0b8b020e0b984e0b894e0b989e0b895e0b8b1e0b989e0b887e0b884e0b893e0b8b0e0b897e0b8b3e0b887e0b8b2e0b899e0b89ee0b8b4e0b980e0b8a8e0b8a9e0b980e0b89ee0b8b7e0b988e0b8ade0b8aae0b8ade0b89ae0b8aae0b8a7e0b899e0b981e0b8a5e0b8b0e0b980e0b8aae0b899e0b8ade0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b983e0b899e0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b881e0b8b3e0b881e0b8b1e0b89ae0b894e0b8b9e0b981e0b8a5e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8ade0b8ade0b881e0b983e0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b88720e0b981e0b8a5e0b8b0e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b881e0b8b1e0b89ae0b89ce0b8b9e0b989e0b881e0b8a3e0b8b0e0b897e0b8b3e0b89ce0b8b4e0b89420266e6273703b20266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e266e6273703b266e6273703b3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e20283239203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a13c2f7374726f6e673e3c7374726f6e673e203235343629266e6273703b3c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b8ade0b899e0b8b8e0b8a1e0b8b1e0b895e0b8b4e0b895e0b8b2e0b8a1e0b8a1e0b895e0b8b4e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b881e0b8a5e0b8b1e0b988e0b899e0b881e0b8a3e0b8ade0b887e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b520e0b884e0b893e0b8b0e0b897e0b8b5e0b9883220e0b897e0b8b5e0b988e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b881e0b8b2e0b8a3e0b980e0b89be0b8b4e0b894e0b895e0b8a5e0b8b2e0b894e0b8abe0b8b1e0b8a7e0b8a1e0b8b1e0b899e0b89de0b8a3e0b8b1e0b988e0b887e0b8aae0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b981e0b89be0b8a3e0b8a3e0b8b9e0b89be0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b89be0b8b520e0b89e2ee0b8a82e203235343620e0b982e0b894e0b8a2e0b89be0b8a3e0b8b4e0b8a1e0b8b2e0b893e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b983e0b899e0b982e0b884e0b8a7e0b895e0b8b220e0b888e0b8b3e0b899e0b8a7e0b8992032352c34303020e0b895e0b8b1e0b89920e0b8ade0b8b1e0b895e0b8a3e0b8b2e0b8a0e0b8b2e0b8a9e0b8b5e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b983e0b899e0b982e0b884e0b8a7e0b895e0b8b2e0b8a3e0b989e0b8ade0b8a2e0b8a5e0b8b020323720e0b982e0b894e0b8a2e0b888e0b8b1e0b894e0b8aae0b8a3e0b8a3e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b89720e0b980e0b89be0b98ae0b89be0b88be0b8b5e0b9882de0b982e0b884e0b8a5e0b988e0b8b22028e0b984e0b897e0b8a22920e0b980e0b897e0b8a3e0b894e0b894e0b8b4e0b989e0b88720e0b888e0b8b3e0b881e0b8b1e0b89420e0b888e0b8b3e0b899e0b8a7e0b8992031352c30303020e0b895e0b8b1e0b89920e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b980e0b89ae0b8ade0b8a3e0b98ce0b8a5e0b8b5e0b988e0b8a2e0b8b8e0b884e0b980e0b881e0b8ade0b8a3e0b98c20e0b89fe0b8b9e0b894e0b8aae0b98c20e0b888e0b8b3e0b881e0b8b1e0b89420e0b888e0b8b3e0b899e0b8a7e0b89920372c36303020e0b895e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b89ae0b8a3e0b8b4e0b8a9e0b8b1e0b897e0b8a2e0b8b9e0b899e0b8b4e0b981e0b88ae0b8a1e0b89be0b98c20e0b888e0b8b3e0b881e0b8b1e0b89420e0b888e0b8b3e0b899e0b8a7e0b89920322c38303020e0b895e0b8b1e0b89920e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b980e0b89ee0b8b7e0b988e0b8ade0b981e0b89be0b8a3e0b8a3e0b8b9e0b89be0b980e0b894e0b8b7e0b8ade0b899e0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a12d20e0b898e0b8b1e0b899e0b8a7e0b8b2e0b884e0b8a1203235343620e0b981e0b8a5e0b8b0e0b983e0b8abe0b989e0b8aae0b8b4e0b897e0b898e0b8b4e0b89ee0b8b4e0b980e0b8a8e0b8a920417365616e20496e746567726174696f6e2053797374656d206f6620507265666572656e6365732028414953502920e0b981e0b881e0b988e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8a3e0b8b1e0b890e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b898e0b8b4e0b89be0b984e0b895e0b8a2e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b8a5e0b8b2e0b8a7e0b981e0b8a5e0b8b0e0b8a3e0b8b2e0b88ae0b8ade0b8b2e0b893e0b8b2e0b888e0b8b1e0b881e0b8a3e0b881e0b8b1e0b8a1e0b89ee0b8b9e0b88ae0b8b220e0b8ade0b8b1e0b895e0b8a3e0b8b2e0b8a0e0b8b2e0b8a9e0b8b5e0b983e0b899e0b982e0b884e0b8a7e0b895e0b8b2e0b8a3e0b989e0b8ade0b8a2e0b8a5e0b8b0e0b8a8e0b8b9e0b899e0b8a2e0b98c20e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89a20e0b983e0b899e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b981e0b89ce0b899e0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b894e0b989e0b8b2e0b899e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b897e0b8b5e0b988e0b89ce0b8a5e0b8b4e0b895e0b981e0b8a5e0b8b0e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b884e0b983e0b899e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b984e0b894e0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b894e0b980e0b897e0b8b5e0b8a2e0b8a1e0b881e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a5266e6273703b266e6273703b3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c7374726f6e673ee0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a1e0b8b5e0b8a1e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e202838203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8a3e0b881e0b88ee0b8b2e0b884e0b8a13c2f7374726f6e673e3c7374726f6e673e2032353436293c2f7374726f6e673e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703ee0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89ae0b981e0b89ce0b89920e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b983e0b899e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b8a3e0b8b0e0b980e0b89ae0b8b5e0b8a2e0b89ae0b88be0b8b7e0b989e0b8ade0b882e0b8b2e0b8a2e0b881e0b8b8e0b989e0b88720e0b881e0b8b2e0b8a3e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b982e0b8a2e0b887e0b895e0b8a5e0b8b2e0b894e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b220e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b8a3e0b8b0e0b89ae0b89ae0b980e0b89ce0b8a2e0b981e0b89ee0b8a3e0b988e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b981e0b881e0b988e0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a320e0b981e0b8a5e0b8b0e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b8aae0b8b2e0b8a3e0b895e0b881e0b884e0b989e0b8b2e0b88720e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b989e0b8ade0b887e0b881e0b8b1e0b899e0b881e0b8b2e0b8a3e0b8a5e0b8b1e0b881e0b8a5e0b8ade0b89ae0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b882e0b989e0b8a1e0b887e0b8a7e0b89420e0b88be0b8b6e0b988e0b887e0b8ade0b8a2e0b8b9e0b988e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a320e0b981e0b8a5e0b8b0e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b882e0b989e0b8a1e0b887e0b8a7e0b894e0b981e0b8a5e0b8b0e0b895e0b988e0b8ade0b980e0b899e0b8b7e0b988e0b8ade0b887e0b894e0b989e0b8a7e0b8a220e0b881e0b8b1e0b89ae0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b89ee0b8b2e0b893e0b8b4e0b88ae0b8a2e0b98ce0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b89ae0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b2e0b8a3e0b884e0b8a5e0b8b1e0b887e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b981e0b8a5e0b8b0e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b8aae0b8b2e0b898e0b8b2e0b8a3e0b893e0b8aae0b8b8e0b88220e0b980e0b89ee0b8b7e0b988e0b8ade0b895e0b8b4e0b894e0b895e0b8b2e0b8a120e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a120e0b981e0b8a5e0b8b0e0b888e0b8b1e0b894e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b8e0b989e0b887e0b982e0b894e0b8a2e0b8a3e0b8a7e0b8a13c2f703e0d0a0d0a3c703e266e6273703b3c2f703e0d0a, '', 'Y'),
(7, '', 27, 'ยุทธศาสตร์ระดับกรม และแผนงาน', 'ยุทธศาสตร์ระดับกรม และแผนงาน', '2018-10-17 22:29:37', '2018-10-17 22:29:37', 0x3c703e3c7374726f6e673ee0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b897e0b8b5e0b9883c2f7374726f6e673e3c7374726f6e673e2031203c2f7374726f6e673e3c7374726f6e673ee0b89ee0b8b1e0b892e0b899e0b8b2e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b88ae0b8b5e0b8a7e0b8b4e0b895e0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a33c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b980e0b89be0b989e0b8b2e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98c3c2f703e0d0a0d0a3c703e312ee0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a3e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b8a8e0b8b1e0b881e0b8a2e0b8a0e0b8b2e0b89ee0b983e0b8abe0b989e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b89ee0b8b6e0b988e0b887e0b89ee0b8b2e0b895e0b899e0b980e0b8ade0b887e0b984e0b894e0b98920e0b982e0b894e0b8a2e0b8a1e0b8b5e0b8a3e0b8b2e0b8a2e0b984e0b894e0b989e0b89ee0b8ade0b980e0b89ee0b8b5e0b8a2e0b887e0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b894e0b8b3e0b8a3e0b887e0b88ae0b8b5e0b8a7e0b8b4e0b89520e0b981e0b8a5e0b8b0e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b888e0b8b2e0b8a2e0b8a3e0b8b2e0b8a2e0b984e0b894e0b989e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b898e0b8a3e0b8a3e0b8a1e0b981e0b8a5e0b8b0e0b8a1e0b8b5e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b88ae0b8b5e0b8a7e0b8b4e0b895e0b897e0b8b5e0b988e0b894e0b8b53c2f703e0d0a0d0a3c703e322ee0b894e0b8b9e0b981e0b8a5e0b981e0b8a5e0b8b0e0b88ae0b988e0b8a7e0b8a2e0b980e0b8abe0b8a5e0b8b7e0b8ade0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a3e0b897e0b8b5e0b988e0b89be0b8a3e0b8b0e0b8aae0b89ae0b8a0e0b8b1e0b8a2e0b89ee0b8b4e0b89ae0b8b1e0b895e0b8b4e0b898e0b8a3e0b8a3e0b8a1e0b88ae0b8b2e0b895e0b8b43c2f703e0d0a0d0a3c703e332ee0b89fe0b8b7e0b989e0b899e0b89fe0b8b9e0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a3e0b8a3e0b8b2e0b8a2e0b8a2e0b988e0b8ade0b8a2e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b89ee0b8b1e0b881e0b8abe0b899e0b8b5e0b9893c2f703e0d0a0d0a3c703e3c7374726f6e673ee0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b897e0b8b5e0b9883c2f7374726f6e673e3c7374726f6e673e2032203c2f7374726f6e673e3c7374726f6e673ee0b89ee0b8b1e0b892e0b899e0b8b2e0b882e0b8b5e0b894e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b983e0b899e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b8953c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b1e0b988e0b899e0b884e0b887e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b980e0b89be0b989e0b8b2e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98c3c2f703e0d0a0d0a3c703e312ee0b980e0b89ee0b8b4e0b988e0b8a1e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b8a0e0b8b2e0b89ee0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b895e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b8a1e0b8b5e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b981e0b8a5e0b8b0e0b980e0b89ee0b8b5e0b8a2e0b887e0b89ee0b8ade0b895e0b988e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a33c2f703e0d0a0d0a3c703e322ee0b8a1e0b8b9e0b8a5e0b884e0b988e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b980e0b89ee0b8b4e0b988e0b8a1e0b882e0b8b6e0b989e0b8993c2f703e0d0a0d0a3c703e332ee0b8ade0b8b3e0b899e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b881e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b882e0b899e0b8aae0b988e0b887e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b980e0b89ee0b8b7e0b988e0b8ade0b8aae0b899e0b8b1e0b89ae0b8aae0b899e0b8b8e0b899e0b881e0b8b2e0b8a3e0b980e0b895e0b8b4e0b89ae0b982e0b895e0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888e0b983e0b899e0b8a0e0b8b9e0b8a1e0b8b4e0b8a0e0b8b2e0b884e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b8993c2f703e0d0a0d0a3c703e3c7374726f6e673ee0b8a2e0b8b8e0b897e0b898e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98ce0b897e0b8b5e0b9883c2f7374726f6e673e3c7374726f6e673e2033203c2f7374726f6e673e3c7374726f6e673ee0b89ee0b8b1e0b892e0b899e0b8b2e0b897e0b8a3e0b8b1e0b89ee0b8a2e0b8b2e0b881e0b8a3e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b5e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b8a0e0b8b2e0b89e3c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8a1e0b894e0b8b8e0b8a5e0b981e0b8a5e0b8b0e0b8a2e0b8b1e0b988e0b887e0b8a2e0b8b7e0b8993c2f7374726f6e673e3c2f703e0d0a0d0a3c703ee0b980e0b89be0b989e0b8b2e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98c3c2f703e0d0a0d0a3c703e312ee0b980e0b89ee0b8b4e0b988e0b8a1e0b89ee0b8b7e0b989e0b899e0b897e0b8b5e0b988e0b88ae0b8a5e0b89be0b8a3e0b8b0e0b897e0b8b2e0b899e0b984e0b894e0b989e0b89be0b8a3e0b8b0e0b8a1e0b8b2e0b89320342e323220e0b8a5e0b989e0b8b2e0b899e0b984e0b8a3e0b9883c2f703e0d0a0d0a3c703e322ee0b980e0b89ee0b8b4e0b988e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b8ade0b8b8e0b894e0b8a1e0b8aae0b8a1e0b89ae0b8b9e0b8a3e0b893e0b98ce0b882e0b8ade0b887e0b890e0b8b2e0b899e0b897e0b8a3e0b8b1e0b89ee0b8a2e0b8b2e0b881e0b8a3e0b898e0b8a3e0b8a3e0b8a1e0b88ae0b8b2e0b895e0b8b4e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8a1e0b887e0b981e0b8a5e0b8b0e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8a1e0b894e0b8b8e0b8a5e0b981e0b8a5e0b8b0e0b8a2e0b8b1e0b988e0b887e0b8a2e0b8b7e0b8993c2f703e0d0a0d0a3c703e332ee0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b888e0b8b2e0b8a2e0b881e0b8b2e0b8a3e0b896e0b8b7e0b8ade0b884e0b8a3e0b8ade0b887e0b897e0b8b5e0b988e0b894e0b8b4e0b899e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b898e0b8a3e0b8a3e0b8a1e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b897e0b8b5e0b988e0b894e0b8b4e0b899e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a2e0b8b1e0b988e0b887e0b8a2e0b8b7e0b8993c2f703e0d0a, '', 'Y'),
(8, '', 28, '', '', '2018-10-17 22:30:41', '2018-10-17 22:30:41', '', '', 'Y'),
(9, '', 29, '', '', '2018-10-17 22:31:08', '2018-10-17 22:31:08', '', '', 'Y'),
(10, '', 31, 'นโยบายการกำกับดูแลองค์กร', 'นโยบายการกำกับดูแลองค์กร', '2018-10-17 22:32:31', '2018-10-17 22:33:35', 0x3c703e3c7374726f6e673ee0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b881e0b8b2e0b8a3e0b881e0b8b3e0b881e0b8b1e0b89ae0b894e0b8b9e0b981e0b8a5e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b897e0b8b5e0b988e0b894e0b8b53c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b43c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c3c2f7374726f6e673e3c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b20e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b980e0b888e0b895e0b899e0b8b2e0b8a3e0b8a1e0b893e0b98ce0b882e0b8ade0b887e0b8a3e0b8b1e0b890e0b898e0b8a3e0b8a3e0b8a1e0b899e0b8b9e0b88de0b981e0b8abe0b988e0b887e0b8a3e0b8b2e0b88ae0b8ade0b8b2e0b893e0b8b2e0b888e0b8b1e0b881e0b8a3e0b984e0b897e0b8a2e0b89ee0b8b8e0b897e0b898e0b8a8e0b8b1e0b881e0b8a3e0b8b2e0b88a203235353020e0b981e0b8a5e0b8b0e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b881e0b8a4e0b8a9e0b88ee0b8b5e0b881e0b8b2e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98ce0b981e0b8a5e0b8b0e0b8a7e0b8b4e0b898e0b8b5e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b881e0b8b4e0b888e0b881e0b8b2e0b8a3e0b89ae0b989e0b8b2e0b899e0b980e0b8a1e0b8b7e0b8ade0b887e0b897e0b8b5e0b988e0b894e0b8b520e0b89e2ee0b8a82e203235343620e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b980e0b881e0b893e0b891e0b98ce0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b8a0e0b8b2e0b884e0b8a3e0b8b1e0b8902028504d51412920e0b982e0b894e0b8a2e0b8a1e0b8b8e0b988e0b887e0b980e0b899e0b989e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89e20e0b981e0b8a5e0b8b0e0b898e0b8a3e0b8a3e0b8a1e0b8b2e0b8a0e0b8b4e0b89ae0b8b2e0b8a5e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8a0e0b8b2e0b884e0b8a3e0b8b1e0b89020e0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b989e0b980e0b89ee0b8b7e0b988e0b8ade0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b984e0b89be0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b5e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b8a0e0b8b2e0b89e20e0b981e0b8a5e0b8b0e0b8a1e0b8b5e0b898e0b8a3e0b8a3e0b8a1e0b8b2e0b8a0e0b8b4e0b89ae0b8b2e0b8a5e0b8ade0b8b1e0b899e0b888e0b8b0e0b897e0b8b3e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b899e0b980e0b881e0b8b4e0b894e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b1e0b988e0b899e0b983e0b888e0b8a8e0b8a3e0b8b1e0b897e0b898e0b8b2e0b981e0b8a5e0b8b0e0b984e0b8a7e0b989e0b8a7e0b8b2e0b887e0b983e0b888e0b983e0b899e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b981e0b89ce0b988e0b899e0b894e0b8b4e0b899e0b882e0b8ade0b887e0b8a3e0b8b1e0b890e0b89ae0b8b2e0b8a5266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b20e0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b428e0b8a1e0b881e0b8ade0b88a2e29e0b888e0b8b6e0b887e0b984e0b894e0b989e0b888e0b8b1e0b894e0b897e0b8b3e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b881e0b8b2e0b8a3e0b881e0b8b3e0b881e0b8b1e0b89ae0b894e0b8b9e0b981e0b8a5e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b894e0b8b5e0b88be0b8b6e0b988e0b887e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b894e0b989e0b8a7e0b8a2e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b8abe0b8a5e0b8b1e0b881e0b981e0b8a5e0b8b0e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b895e0b8b2e0b8a1e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b881e0b8b2e0b8a3e0b881e0b8b3e0b881e0b8b1e0b89ae0b894e0b8b9e0b981e0b8a5e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b897e0b8b5e0b988e0b894e0b8b5e0b894e0b989e0b8b2e0b899e0b895e0b988e0b8b2e0b887e0b98620e0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b989e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b980e0b89be0b987e0b899e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b89be0b987e0b899e0b884e0b988e0b8b2e0b899e0b8b4e0b8a2e0b8a1e0b8a3e0b988e0b8a7e0b8a1e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b89ae0b8b8e0b884e0b8a5e0b8b2e0b881e0b8a3e0b897e0b8b8e0b881e0b884e0b89920e0b89ee0b8b6e0b887e0b8a2e0b8b6e0b894e0b896e0b8b7e0b8ade0b980e0b89be0b987e0b899e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b884e0b8a7e0b89ae0b884e0b8b9e0b988e0b881e0b8b1e0b89ae0b881e0b88ee0b882e0b989e0b8ade0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8ade0b8b7e0b988e0b899e0b98620e0b8ade0b8a2e0b988e0b8b2e0b887e0b897e0b8b1e0b988e0b8a7e0b896e0b8b6e0b8873c2f703e0d0a, '', 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(11, '', 33, 'รายการผลการปฏิบัติราชการตามคารับรองการปฏิบัติราชการของ มกอช.', '', '2018-10-17 22:46:28', '2018-10-17 22:46:28', 0x3c703e3c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323534383c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534373c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534373c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323534383c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534383c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534383c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534383c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323534393c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534393c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534393c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323534393c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535303c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535303c2f6c693e0d0a093c6c693ee0b884e0b8a7e0b8b2e0b8a1e0b89ee0b8b6e0b887e0b89ee0b8ade0b983e0b888e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b8a3e0b8b1e0b89ae0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a320e0b89be0b8b520323535303c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353020e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353020e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353020e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535303c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535313c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535313c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353120e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353120e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353120e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535313c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535323c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535323c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353220e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353220e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353220e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535333c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535333c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353320e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353320e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353320e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5323535333c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703e3c6272202f3e0d0a266e6273703b266e6273703b20266e6273703b20266e6273703b203c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535343c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535343c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353420e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353420e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353420e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535343c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b895e0b899e0b980e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535353c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535353c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353520e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353520e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353520e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535353c6272202f3e0d0a093c6272202f3e0d0a093c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b895e0b899e0b980e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e20323535363c2f7374726f6e673e3c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535363c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353620e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353620e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353620e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535363c6272202f3e0d0a09266e6273703b3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703e3c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b895e0b899e0b980e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e323535373c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535373c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353720e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353720e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353720e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535373c6272202f3e0d0a09266e6273703b3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703e3c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b895e0b899e0b980e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e323535383c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535383c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353820e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353820e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353820e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535383c6272202f3e0d0a09266e6273703b3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703e3c7374726f6e673ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b895e0b899e0b980e0b8ade0b8873c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c7374726f6e673ee0b89be0b8b53c2f7374726f6e673e3c7374726f6e673e323535393c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b884e0b8b3e0b8ade0b898e0b8b4e0b89ae0b8b2e0b8a2e0b895e0b8b1e0b8a7e0b88ae0b8b5e0b989e0b8a7e0b8b1e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535393c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353920e0b8a3e0b8ade0b89a203620e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353920e0b8a3e0b8ade0b89a203920e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b5203235353920e0b8a3e0b8ade0b89a20313220e0b980e0b894e0b8b7e0b8ade0b8993c2f6c693e0d0a093c6c693ee0b8aae0b8a3e0b8b8e0b89be0b89ce0b8a5e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a3e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8af20e0b89be0b8b520323535393c2f6c693e0d0a3c2f756c3e0d0a, '', 'Y'),
(12, '', 32, 'คำรับรองการปฏิบัติราชการ มกอช. ปี 2547 – ปัจจุบัน', '', '2018-10-17 22:48:03', '2018-10-17 22:53:11', 0x3c756c3e0d0a093c6c693ee0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323534373c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323534383c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323534393c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535303c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535313c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535323c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535333c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535343c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535353c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535363c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535373c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535383c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323535393c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323536303c2f6c693e0d0a093c6c693e266e6273703b3c2f6c693e0d0a093c6c693e266e6273703be0b884e0b8b3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8a3e0b8b2e0b88ae0b881e0b8b2e0b8a320e0b89be0b8b520323536313c2f6c693e0d0a3c2f756c3e0d0a, '', 'Y'),
(13, '', 35, 'รางวัลบริการภาครัฐแห่งชาติ', '', '2018-10-17 22:54:12', '2018-10-17 22:54:12', '', '', 'Y'),
(14, '', 36, 'รางวัลด้านความโปร่งใส', '', '2018-10-17 22:54:36', '2018-10-17 22:54:36', '', '', 'Y'),
(15, '', 11, 'โครงสร้าง', 'โครงสร้าง', '2018-10-18 10:33:42', '2018-12-25 16:21:57', 0x3c7020636c6173733d22696d6167652d616c69676e2d63656e746572223e3c696d6720616c743d2222206865696768743d2234373422207372633d222f636b66696e6465722f7573657266696c65732f696d616765732f53637265656e25323053686f74253230323536312d31302d3138253230617425323031345f33305f31382e706e67222077696474683d2236303022202f3e3c2f703e0d0a, '', 'Y'),
(16, '', 61, 'บริการ API มาตรฐานสินค้าเกษตร', '', '2018-10-21 16:25:54', '2018-10-21 16:25:54', 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31367078223e3c7374726f6e673ee0b895e0b8b4e0b894e0b895e0b988e0b8ade0b980e0b89ee0b8b7e0b988e0b8ade0b882e0b8ade0b8a3e0b8b1e0b89ae0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3204150493c2f7374726f6e673e3c2f7370616e3e3c2f703e0d0a0d0a3c703ee0b897e0b8b5e0b988e0b895e0b8b1e0b989e0b887266e6273703b3c7374726f6e673ee0b8aae0b8b3e0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b43c2f7374726f6e673e266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703be0b980e0b8a5e0b882e0b897e0b8b5e0b98820353020e0b896e0b899e0b899e0b89ee0b8abe0b8a5e0b982e0b8a2e0b898e0b8b4e0b89920e0b981e0b882e0b8a7e0b887e0b8a5e0b8b2e0b894e0b8a2e0b8b2e0b8a720e0b980e0b882e0b895e0b888e0b895e0b8b8e0b888e0b8b1e0b881e0b8a320e0b881e0b8a3e0b8b8e0b887e0b980e0b897e0b89ee0b8a1e0b8abe0b8b2e0b899e0b884e0b8a3203130393030266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703be0b982e0b897e0b8a3e0b8a8e0b8b1e0b89ee0b897e0b98c202b3636322d203536312d323237373c2f703e0d0a, '', 'Y'),
(17, '', 64, 'ความหมายและวัตถุประสงค์', '', '2018-10-21 16:28:38', '2018-10-21 16:28:38', 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31367078223e3c7370616e207374796c653d22636f6c6f723a23323761653630223e3c7374726f6e673ee0b884e0b8a7e0b8b2e0b8a1e0b8abe0b8a1e0b8b2e0b8a2e0b981e0b8a5e0b8b0e0b8a7e0b8b1e0b895e0b896e0b8b8e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98c3c2f7374726f6e673e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c703e3c7374726f6e673ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8993c2f7374726f6e673e20e0b8abe0b8a1e0b8b2e0b8a2e0b896e0b8b6e0b88720e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b983e0b899e0b8a3e0b8b9e0b89be0b882e0b8ade0b887e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b8a7e0b8b1e0b895e0b896e0b8b820e0b897e0b8b5e0b988e0b981e0b89ee0b8a3e0b988e0b8abe0b8a5e0b8b2e0b8a2e0b981e0b881e0b988e0b89ae0b8b8e0b884e0b884e0b8a5e0b897e0b8b1e0b988e0b8a7e0b984e0b89b20e0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8b6e0b989e0b899e0b982e0b894e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b988e0b8a7e0b8a1e0b8a1e0b8b7e0b8ad20e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b899e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b984e0b894e0b989e0b980e0b8aae0b8b5e0b8a220e0b981e0b8a5e0b8b0e0b89ce0b8b9e0b989e0b8a1e0b8b520e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b88720e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b89ce0b8a5e0b888e0b8b2e0b881e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b1e0b899e0b982e0b894e0b8a2e0b8a1e0b8b8e0b988e0b887e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b8aae0b8b9e0b887e0b8aae0b8b8e0b8943c2f703e0d0a0d0a3c703e3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b3c7374726f6e673e266e6273703b266e6273703b266e6273703b3c2f7374726f6e673e3c7374726f6e673ee0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673ee0b8abe0b8a1e0b8b2e0b8a2e0b896e0b8b6e0b88720e0b89ce0b8a5e0b8b4e0b895e0b89ce0b8a5e0b8abe0b8a3e0b8b7e0b8ade0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b8ade0b8b1e0b899e0b980e0b881e0b8b4e0b894e0b888e0b8b2e0b881e0b881e0b8b2e0b8a3e0b881e0b8aae0b8b4e0b881e0b8a3e0b8a3e0b8a120e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8a1e0b88720e0b881e0b8b2e0b8a3e0b89be0b8a8e0b8b8e0b8aae0b8b1e0b895e0b8a7e0b98c20e0b8abe0b8a3e0b8b7e0b8ade0b881e0b8b2e0b8a3e0b89be0b988e0b8b2e0b984e0b8a1e0b98920e0b981e0b8a5e0b8b0e0b89ce0b8a5e0b89ee0b8a5e0b8ade0b8a2e0b984e0b894e0b989e0b882e0b8ade0b887e0b89ce0b8a5e0b8b4e0b895e0b89ce0b8a5e0b8abe0b8a3e0b8b7e0b8ade0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a73c2f703e0d0a0d0a3c703e3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8b6e0b989e0b899e0b8a0e0b8b2e0b8a2e0b983e0b895e0b98920e0b89e2ee0b8a32ee0b89a2ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b981e0b89ae0b988e0b887e0b980e0b89be0b987e0b899203220e0b89be0b8a3e0b8b0e0b980e0b8a0e0b89720e0b884e0b8b7e0b8ad20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a20e0b981e0b8a5e0b8b020e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b20266e6273703b2d203c7374726f6e673ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a3c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673ee0b884e0b8b7e0b8ad20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b8a1e0b8b5e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b895e0b989e0b8ade0b887e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8993c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b20266e6273703b2d203c7374726f6e673ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673ee0b884e0b8b7e0b8ad20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b8a1e0b8b5e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b881e0b8b3e0b8abe0b899e0b894e0b980e0b89ee0b8b7e0b988e0b8ade0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b984e0b894e0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8993c2f703e0d0a0d0a3c703e266e6273703b3c2f703e0d0a, '', 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(18, '', 65, 'ขั้นตอนการจัดทำร่างมาตรฐานทั่วไป', '', '2018-10-21 16:30:57', '2018-10-21 16:30:57', 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31367078223e3c7370616e207374796c653d22636f6c6f723a23323761653630223e3c7374726f6e673ee0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c2f7374726f6e673e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b882e0b8ade0b887e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b980e0b89be0b987e0b899e0b8ade0b8b3e0b899e0b8b2e0b888e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b88be0b8b6e0b988e0b887e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98c20e0b981e0b8a5e0b8b0e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b984e0b8a7e0b98920e0b894e0b8b1e0b887e0b899e0b8b5e0b9893c2f703e0d0a0d0a3c703e312e20e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b897e0b8b5e0b988e0b8aae0b8a1e0b884e0b8a7e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b888e0b8b1e0b894e0b8a5e0b8b3e0b894e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b888e0b8b0e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98c20e0b894e0b8b1e0b887e0b899e0b8b5e0b9893c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28312920e0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b88820e0b980e0b88ae0b988e0b89920e0b8a1e0b8b5e0b8a1e0b8b9e0b8a5e0b884e0b988e0b8b2e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b895e0b981e0b8a5e0b8b0e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b9e0b88720e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b888e0b8b0e0b897e0b8b3e0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28322920e0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b8abe0b8a3e0b8b7e0b8ade0b8a3e0b8b0e0b89ae0b89ae0b897e0b8b5e0b988e0b881e0b8b3e0b8a5e0b8b1e0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8abe0b8a3e0b8b7e0b8ade0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b981e0b89be0b8a5e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a5266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28332920e0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b897e0b8b5e0b988e0b8a1e0b8b5e0b89be0b8b1e0b88de0b8abe0b8b2e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b888e0b8b0e0b980e0b89be0b987e0b899e0b881e0b8a3e0b8ade0b89ae0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b981e0b8a5e0b8b0e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b897e0b8b5e0b988e0b88ae0b8b1e0b894e0b980e0b888e0b899266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28342920e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b881e0b8b5e0b894e0b881e0b8b1e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28352920e0b884e0b8b8e0b989e0b8a1e0b884e0b8a3e0b8ade0b887e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b8843c2f703e0d0a0d0a3c703e322e20e0b881e0b8b2e0b8a3e0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8af20e0b88be0b8b6e0b988e0b887e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b887e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8aae0b8b1e0b988e0b887e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b982e0b894e0b8a2e0b8ade0b8b2e0b8a8e0b8b1e0b8a2e0b8ade0b8b3e0b899e0b8b2e0b888e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b8a1e0b8b2e0b895e0b8a3e0b8b220313520e0b981e0b8a5e0b8b0e0b8a1e0b8b2e0b895e0b8a3e0b8b220313720e0b981e0b8abe0b988e0b88720e0b89e2ee0b8a32ee0b89a2ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b895e0b989e0b8ade0b887e0b980e0b89be0b987e0b899e0b89ce0b8b9e0b989e0b897e0b8a3e0b887e0b884e0b8b8e0b893e0b8a7e0b8b8e0b892e0b8b4e0b8abe0b8a3e0b8b7e0b8ade0b89ce0b8b9e0b989e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b8b9e0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b5e0b988e0b8a2e0b8a7e0b88ae0b8b2e0b88de0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b895e0b8b2e0b8a1e0b89be0b8a3e0b8b0e0b980e0b8a0e0b897e0b8abe0b8a3e0b8b7e0b8ade0b881e0b8a5e0b8b8e0b988e0b8a1e0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b88720e0b982e0b894e0b8a2e0b8a1e0b8b5e0b8ade0b887e0b884e0b98ce0b89be0b8a3e0b8b0e0b881e0b8ade0b89a20e0b888e0b8b3e0b899e0b8a7e0b899e0b984e0b8a1e0b988e0b980e0b881e0b8b4e0b89920313520e0b884e0b89920e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b894e0b989e0b8a7e0b8a2e0b89ce0b8b9e0b989e0b981e0b897e0b899e0b888e0b8b2e0b881e0b897e0b8b8e0b881e0b8a0e0b8b2e0b884e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b8873c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8a1e0b8b5e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8abe0b8a3e0b8b7e0b8ade0b980e0b8aae0b899e0b8ade0b981e0b899e0b8b0e0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b8abe0b8a3e0b8b7e0b8ade0b8a2e0b881e0b980e0b8a5e0b8b4e0b881e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b899e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8ade0b8b7e0b988e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b895e0b8b2e0b8a1e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8ade0b89ae0b8abe0b8a1e0b8b2e0b8a23c2f703e0d0a0d0a3c703e332e20e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a8e0b8b6e0b881e0b8a9e0b8b2e0b884e0b989e0b899e0b884e0b8a7e0b989e0b8b220e0b8a3e0b8a7e0b89ae0b8a3e0b8a7e0b8a1e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b980e0b897e0b884e0b899e0b8b4e0b884e0b8a0e0b8b2e0b884e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b888e0b8b0e0b888e0b8b1e0b894e0b897e0b8b3e0b882e0b8b6e0b989e0b89920e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a320e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b881e0b88ee0b8a3e0b8b0e0b980e0b89ae0b8b5e0b8a2e0b89a20e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b884e0b8b9e0b988e0b884e0b989e0b8b2e0b897e0b8b5e0b988e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b8abe0b8a3e0b8b7e0b8ad20e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b983e0b899e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b980e0b89ee0b8b7e0b988e0b8ade0b899e0b8b3e0b8a1e0b8b2e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8af20e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b981e0b89ae0b988e0b887e0b980e0b89be0b987e0b899203320e0b8a7e0b8b4e0b898e0b8b520e0b884e0b8b7e0b8ad266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28312920e0b881e0b8b2e0b8a3e0b8a2e0b881e0b8a3e0b988e0b8b2e0b887e0b983e0b8abe0b8a1e0b988266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28322920e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b981e0b89ae0b89ae0b980e0b8abe0b8a1e0b8b7e0b8ade0b899e0b881e0b8b1e0b899e0b897e0b8b8e0b881e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a3266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28332920e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b981e0b89ae0b89ae0b881e0b8b2e0b8a3e0b980e0b8a3e0b8b5e0b8a2e0b89ae0b980e0b8a3e0b8b5e0b8a2e0b887e0b983e0b8abe0b8a1e0b9883c2f703e0d0a0d0a3c703e342e20e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8af20e0b89be0b8a3e0b8b0e0b88ae0b8b8e0b8a1e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b983e0b8abe0b989e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a520e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b89920e0b884e0b8b3e0b981e0b899e0b8b0e0b899e0b8b3e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b895e0b988e0b8ade0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8b6e0b989e0b899e0b8ade0b8a2e0b8b9e0b988e0b89ae0b899e0b89ee0b8b7e0b989e0b899e0b890e0b8b2e0b899e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b2e0b887e0b8a7e0b8b4e0b897e0b8a2e0b8b2e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98c20e0b981e0b8a5e0b8b0e0b980e0b8aae0b899e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b895e0b988e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8af20e0b899e0b8b1e0b989e0b899e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c2f703e0d0a0d0a3c703e352e20e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b888e0b8b2e0b881e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b984e0b894e0b989e0b980e0b8aae0b8b5e0b8a23c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b89be0b987e0b899e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b897e0b8b8e0b881e0b8a0e0b8b2e0b884e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b88720e0b983e0b8abe0b989e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b895e0b988e0b8ade0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b982e0b894e0b8a2e0b983e0b88ae0b989e0b8a7e0b8b4e0b898e0b8b5e0b881e0b8b2e0b8a3e0b8aae0b8b1e0b8a1e0b8a1e0b899e0b8b220e0b8abe0b8a3e0b8b7e0b8ade0b8a7e0b8b4e0b898e0b8b5e0b881e0b8b2e0b8a3e0b8ade0b8b7e0b988e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b981e0b8a5e0b8b0e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b984e0b894e0b98920e0b982e0b894e0b8a2e0b899e0b8b3e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b8a1e0b8b2e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b981e0b881e0b989e0b984e0b882e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b884e0b8a3e0b89ae0b896e0b989e0b8a7e0b899e0b981e0b8a5e0b8b0e0b8aae0b8a1e0b89ae0b8b9e0b8a3e0b893e0b98c20e0b881e0b988e0b8ade0b899e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89a20e0b881e0b8a3e0b893e0b8b5e0b882e0b989e0b8ade0b8aae0b8a3e0b8b8e0b89be0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b981e0b895e0b881e0b895e0b988e0b8b2e0b887e0b881e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b984e0b8a1e0b988e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b8abe0b8b2e0b882e0b989e0b8ade0b8a2e0b8b8e0b895e0b8b4e0b984e0b894e0b98920e0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b983e0b899e0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b882e0b8ade0b887e0b980e0b899e0b8b7e0b989e0b8ade0b8abe0b8b2e0b983e0b899e0b8aae0b8b2e0b8a3e0b8b0e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b983e0b8abe0b989e0b899e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b89ee0b8a3e0b989e0b8ade0b8a1e0b89be0b8a3e0b8b0e0b980e0b894e0b987e0b899e0b89be0b8b1e0b88de0b8abe0b8b2e0b980e0b882e0b989e0b8b2e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b983e0b899e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8afe0b980e0b89ee0b8b7e0b988e0b8ade0b8abe0b8b2e0b882e0b989e0b8ade0b8aae0b8a3e0b8b8e0b89b20e0b881e0b988e0b8ade0b899e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89a3c2f703e0d0a0d0a3c703e362e20e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b8a1e0b8b7e0b988e0b8ade0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b888e0b8b2e0b881e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8afe0b981e0b8a5e0b989e0b8a720e0b983e0b8abe0b989e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b899e0b8b1e0b989e0b89920e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89be0b895e0b8b2e0b8a1e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8afe0b980e0b8aae0b899e0b8ad3c6272202f3e0d0ae0b881e0b8a3e0b893e0b8b5e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b5e0b8a1e0b895e0b8b4e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b20e0b983e0b8abe0b989e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b982e0b894e0b8a2e0b8ade0b8ade0b881e0b980e0b89be0b987e0b899e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b881e0b8b3e0b8abe0b899e0b894e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c6272202f3e0d0ae0b881e0b8a3e0b893e0b8b5e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b5e0b8a1e0b895e0b8b4e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a20e0b983e0b8abe0b989e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b895e0b8b2e0b8a1e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b8ade0b8ade0b881e0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b8b2203138e0b882e0b8ade0b88720e0b89e2ee0b8a32ee0b89a2e20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a3e0b8b0e0b8abe0b8a5e0b8b1e0b881e0b884e0b8b7e0b8ade0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b8a5e0b887e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b899e0b8abe0b899e0b8b1e0b887e0b8aae0b8b7e0b8ade0b89ee0b8b4e0b8a1e0b89ee0b98ce0b8a3e0b8b2e0b8a2e0b8a7e0b8b1e0b89920e0b8ade0b8a2e0b988e0b8b2e0b887e0b899e0b989e0b8ade0b8a2203120e0b889e0b89ae0b8b1e0b89a20e0b980e0b89be0b987e0b899e0b980e0b8a7e0b8a5e0b8b2e0b984e0b8a1e0b988e0b899e0b989e0b8ade0b8a2e0b881e0b8a7e0b988e0b8b2203320e0b8a7e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b983e0b8abe0b989e0b980e0b8a7e0b8a5e0b8b2e0b981e0b888e0b989e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b884e0b8b1e0b894e0b884e0b989e0b8b2e0b89920e0b8a3e0b8b0e0b8a2e0b8b0e0b980e0b8a7e0b8a5e0b8b2e0b984e0b8a1e0b988e0b899e0b989e0b8ade0b8a2e0b881e0b8a7e0b988e0b8b220313520e0b8a7e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b983e0b8abe0b989e0b899e0b8b3e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b981e0b8aae0b894e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b899e0b8b1e0b989e0b899e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b980e0b8aae0b899e0b8ade0b981e0b899e0b8b0e0b895e0b988e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b980e0b89ee0b8b7e0b988e0b8ade0b8ade0b8ade0b881e0b980e0b89be0b987e0b899e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b881e0b8b3e0b8abe0b899e0b894e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b899e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b888e0b8b3e0b980e0b89be0b987e0b899e0b980e0b8a3e0b988e0b887e0b894e0b988e0b8a7e0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b8aae0b8a7e0b8b1e0b8aae0b894e0b8b4e0b8a0e0b8b2e0b89ee0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b89920e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b1e0b988e0b899e0b884e0b887e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b8abe0b8a3e0b8b7e0b8ade0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b983e0b899e0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b88820e0b8ade0b8b2e0b8a8e0b8b1e0b8a2e0b8ade0b8b3e0b899e0b8b2e0b888e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b8b220313920e0b882e0b8ade0b88720e0b89e2ee0b8a32ee0b89a2e20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8ade0b8b2e0b888e0b980e0b8aae0b899e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98ce0b980e0b89ee0b8b7e0b988e0b8ade0b8ade0b8ade0b881e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b894e0b8ade0b8a2e0b8b9e0b988e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b895e0b989e0b8ade0b887e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b881e0b987e0b984e0b894e0b9893c2f703e0d0a0d0a3c703e372e20e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b888e0b8b2e0b881e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b8b2e0b8a1e0b89ee0b8b1e0b899e0b898e0b881e0b8a3e0b893e0b8b5e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b8812057544f2028e0b881e0b8a3e0b893e0b8b5e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a293c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b983e0b899e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a20e0b88be0b8b6e0b988e0b887e0b8ade0b8b2e0b888e0b8a1e0b8b5e0b89ce0b8a5e0b881e0b8a3e0b8b0e0b897e0b89ae0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b888e0b8b2e0b881e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b8b2e0b8a1e0b89ee0b8b1e0b899e0b898e0b881e0b8a3e0b893e0b8b5e0b882e0b8ade0b887e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b8872053505320e0b8abe0b8a3e0b8b7e0b8ad2054425420e0b888e0b8b0e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b981e0b888e0b989e0b887e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b8812057544f20e0b980e0b89ee0b8b7e0b988e0b8ade0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89a20e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b8a1e0b8b5e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b89920e0b884e0b8b3e0b896e0b8b2e0b8a120e0b8abe0b8a3e0b8b7e0b8ade0b882e0b989e0b8ade0b884e0b8b1e0b894e0b884e0b989e0b8b2e0b899e0b888e0b8b2e0b881e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8ade0b8b7e0b988e0b89920e0b888e0b8b0e0b895e0b989e0b8ade0b887e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8af20e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b888e0b8b3e0b980e0b89be0b987e0b899e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a120e0b981e0b8a5e0b8b0e0b899e0b8b3e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b981e0b8aae0b894e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8ade0b8b5e0b881e0b884e0b8a3e0b8b1e0b989e0b887e0b980e0b89ee0b8b7e0b988e0b8ade0b897e0b8a3e0b8b2e0b89a2fe0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8ade0b8ade0b881e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b895e0b988e0b8ade0b984e0b89b3c2f703e0d0a0d0a3c703e382e20e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a5e0b887e0b899e0b8b2e0b8a1e0b983e0b899e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a82fe0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b4e0b888e0b888e0b8b2e0b899e0b8b8e0b980e0b89ae0b881e0b8a9e0b8b220e0b981e0b8a5e0b8b0e0b980e0b89ce0b8a2e0b981e0b89ee0b8a3e0b988e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b5e0b8a1e0b895e0b8b4e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b981e0b8a5e0b989e0b8a720e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98ce0b980e0b89ee0b8b7e0b988e0b8ade0b8ade0b8ade0b881e0b980e0b89be0b987e0b899e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a82fe0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b981e0b8a5e0b8b0e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b4e0b888e0b888e0b8b2e0b899e0b8b8e0b980e0b89ae0b881e0b8a9e0b8b2e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b897e0b8a3e0b8b2e0b89ae0b982e0b894e0b8a2e0b897e0b8b1e0b988e0b8a7e0b881e0b8b1e0b89920e0b89ee0b8a3e0b989e0b8ade0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b89ce0b8a2e0b981e0b89ee0b8a3e0b988e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b89ce0b988e0b8b2e0b899e0b88ae0b988e0b8ade0b887e0b897e0b8b2e0b887e0b895e0b988e0b8b2e0b887e0b98620e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b88ae0b989e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b895e0b988e0b8ade0b984e0b89b3c2f703e0d0a0d0a3c703e392e20e0b881e0b8b2e0b8a3e0b897e0b89ae0b897e0b8a7e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b881e0b8b2e0b8a3e0b897e0b89ae0b897e0b8a7e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b888e0b8b0e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b989e0b8a7e0b884e0b8a3e0b89a203520e0b89be0b8b520e0b882e0b8b6e0b989e0b899e0b984e0b89b20e0b8abe0b8a3e0b8b7e0b8ade0b980e0b8a1e0b8b7e0b988e0b8ade0b8a1e0b8b5e0b882e0b989e0b8ade0b980e0b8aae0b899e0b8ade0b983e0b8abe0b989e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b981e0b881e0b989e0b984e0b882e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b899e0b8b1e0b989e0b89920e0b980e0b88ae0b988e0b89920e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a520e0b8aae0b896e0b8b2e0b899e0b881e0b8b2e0b8a3e0b893e0b98ce0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b8abe0b8a3e0b8b7e0b8ade0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b8ade0b8b7e0b988e0b899e0b98620e0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b981e0b89be0b8a5e0b887e0b984e0b89be0b897e0b8b5e0b988e0b8a1e0b8b5e0b89ce0b8a5e0b895e0b988e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b88420e0b980e0b89be0b987e0b899e0b980e0b8abe0b895e0b8b8e0b983e0b8abe0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b984e0b8a1e0b988e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a1e0b983e0b899e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b980e0b89ee0b8b4e0b988e0b8a1e0b980e0b895e0b8b4e0b8a1e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b983e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b884e0b8a3e0b89ae0b896e0b989e0b8a7e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b89920e0b981e0b8a5e0b8b0e0b895e0b8a3e0b887e0b881e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a3e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b984e0b894e0b98920e0b8aae0b988e0b8a7e0b899e0b980e0b8aae0b8b5e0b8a23c2f703e0d0a, '', 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(19, '', 66, 'ขั้นตอนการจัดทำร่างมาตรฐานบังคับ', '', '2018-10-21 16:32:23', '2018-10-21 16:32:23', 0x3c703e3c7370616e207374796c653d22666f6e742d73697a653a31367078223e3c7370616e207374796c653d22636f6c6f723a23323761653630223e3c7374726f6e673ee0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a3c2f7374726f6e673e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b882e0b8ade0b887e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b980e0b89be0b987e0b899e0b8ade0b8b3e0b899e0b8b2e0b888e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b89ee0b8b1e0b892e0b899e0b8b2e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b88be0b8b6e0b988e0b887e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98c20e0b981e0b8a5e0b8b0e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b984e0b8a7e0b98920e0b894e0b8b1e0b887e0b899e0b8b5e0b9893c2f703e0d0a0d0a3c703e312e20e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b897e0b8b5e0b988e0b8aae0b8a1e0b884e0b8a7e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b888e0b8b1e0b894e0b8a5e0b8b3e0b894e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b888e0b8b0e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98c20e0b894e0b8b1e0b887e0b899e0b8b5e0b9893c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28312920e0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b3e0b884e0b8b1e0b88de0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b88820e0b980e0b88ae0b988e0b89920e0b8a1e0b8b5e0b8a1e0b8b9e0b8a5e0b884e0b988e0b8b2e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b895e0b981e0b8a5e0b8b0e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b9e0b88720e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b888e0b8b0e0b897e0b8b3e0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28322920e0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b8abe0b8a3e0b8b7e0b8ade0b8a3e0b8b0e0b89ae0b89ae0b897e0b8b5e0b988e0b881e0b8b3e0b8a5e0b8b1e0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8abe0b8a3e0b8b7e0b8ade0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b981e0b89be0b8a5e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a5266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28332920e0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b897e0b8b5e0b988e0b8a1e0b8b5e0b89be0b8b1e0b88de0b8abe0b8b2e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b888e0b8b0e0b980e0b89be0b987e0b899e0b881e0b8a3e0b8ade0b89ae0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b981e0b8a5e0b8b0e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b897e0b8b5e0b988e0b88ae0b8b1e0b894e0b980e0b888e0b899266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28342920e0b981e0b881e0b989e0b984e0b882e0b89be0b8b1e0b88de0b8abe0b8b2e0b881e0b8b2e0b8a3e0b881e0b8b5e0b894e0b881e0b8b1e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28352920e0b884e0b8b8e0b989e0b8a1e0b884e0b8a3e0b8ade0b887e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b8843c2f703e0d0a0d0a3c703e322e20e0b881e0b8b2e0b8a3e0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8af20e0b88be0b8b6e0b988e0b887e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b887e0b895e0b8b2e0b8a1e0b884e0b8b3e0b8aae0b8b1e0b988e0b887e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b982e0b894e0b8a2e0b8ade0b8b2e0b8a8e0b8b1e0b8a2e0b8ade0b8b3e0b899e0b8b2e0b888e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b983e0b899e0b8a1e0b8b2e0b895e0b8a3e0b8b220313520e0b981e0b8a5e0b8b0e0b8a1e0b8b2e0b895e0b8a3e0b8b220313720e0b981e0b8abe0b988e0b88720e0b89e2ee0b8a32ee0b89a2ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b895e0b989e0b8ade0b887e0b980e0b89be0b987e0b899e0b89ce0b8b9e0b989e0b897e0b8a3e0b887e0b884e0b8b8e0b893e0b8a7e0b8b8e0b892e0b8b4e0b8abe0b8a3e0b8b7e0b8ade0b89ce0b8b9e0b989e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b8b9e0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b5e0b988e0b8a2e0b8a7e0b88ae0b8b2e0b88de0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b895e0b8b2e0b8a1e0b89be0b8a3e0b8b0e0b980e0b8a0e0b897e0b8abe0b8a3e0b8b7e0b8ade0b881e0b8a5e0b8b8e0b988e0b8a1e0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b88720e0b982e0b894e0b8a2e0b8a1e0b8b5e0b8ade0b887e0b884e0b98ce0b89be0b8a3e0b8b0e0b881e0b8ade0b89a20e0b888e0b8b3e0b899e0b8a7e0b899e0b984e0b8a1e0b988e0b980e0b881e0b8b4e0b89920313520e0b884e0b89920e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b894e0b989e0b8a7e0b8a2e0b89ce0b8b9e0b989e0b981e0b897e0b899e0b888e0b8b2e0b881e0b897e0b8b8e0b881e0b8a0e0b8b2e0b884e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b8873c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8a1e0b8b5e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8abe0b8a3e0b8b7e0b8ade0b980e0b8aae0b899e0b8ade0b981e0b899e0b8b0e0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b8abe0b8a3e0b8b7e0b8ade0b8a2e0b881e0b980e0b8a5e0b8b4e0b881e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b899e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8ade0b8b7e0b988e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b895e0b8b2e0b8a1e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8ade0b89ae0b8abe0b8a1e0b8b2e0b8a23c2f703e0d0a0d0a3c703e332e20e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a8e0b8b6e0b881e0b8a9e0b8b2e0b884e0b989e0b899e0b884e0b8a7e0b989e0b8b220e0b8a3e0b8a7e0b89ae0b8a3e0b8a7e0b8a1e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b980e0b897e0b884e0b899e0b8b4e0b884e0b8a0e0b8b2e0b884e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b888e0b8b0e0b888e0b8b1e0b894e0b897e0b8b3e0b882e0b8b6e0b989e0b89920e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b8a1e0b8b2e0b895e0b8a3e0b881e0b8b2e0b8a320e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b881e0b88ee0b8a3e0b8b0e0b980e0b89ae0b8b5e0b8a2e0b89a20e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b884e0b8b9e0b988e0b884e0b989e0b8b2e0b897e0b8b5e0b988e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b8abe0b8a3e0b8b7e0b8ad20e0b981e0b899e0b8a7e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b983e0b899e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b980e0b89ee0b8b7e0b988e0b8ade0b899e0b8b3e0b8a1e0b8b2e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8af20e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b89920e0b981e0b89ae0b988e0b887e0b980e0b89be0b987e0b899203320e0b8a7e0b8b4e0b898e0b8b520e0b884e0b8b7e0b8ad266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28312920e0b881e0b8b2e0b8a3e0b8a2e0b881e0b8a3e0b988e0b8b2e0b887e0b983e0b8abe0b8a1e0b988266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28322920e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b981e0b89ae0b89ae0b980e0b8abe0b8a1e0b8b7e0b8ade0b899e0b881e0b8b1e0b899e0b897e0b8b8e0b881e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a3266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28332920e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b981e0b89ae0b89ae0b881e0b8b2e0b8a3e0b980e0b8a3e0b8b5e0b8a2e0b89ae0b980e0b8a3e0b8b5e0b8a2e0b887e0b983e0b8abe0b8a1e0b9883c2f703e0d0a0d0a3c703e342e20e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8af20e0b89be0b8a3e0b8b0e0b88ae0b8b8e0b8a1e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b983e0b8abe0b989e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a520e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b89920e0b884e0b8b3e0b981e0b899e0b8b0e0b899e0b8b3e0b897e0b8b2e0b887e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b895e0b988e0b8ade0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8b6e0b989e0b899e0b8ade0b8a2e0b8b9e0b988e0b89ae0b899e0b89ee0b8b7e0b989e0b899e0b890e0b8b2e0b899e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b2e0b887e0b8a7e0b8b4e0b897e0b8a2e0b8b2e0b8a8e0b8b2e0b8aae0b895e0b8a3e0b98c20e0b981e0b8a5e0b8b0e0b980e0b8aae0b899e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b895e0b988e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8af20e0b899e0b8b1e0b989e0b899e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c2f703e0d0a0d0a3c703e352e20e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b8aae0b8b2e0b899e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b888e0b8b2e0b881e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b984e0b894e0b989e0b980e0b8aae0b8b5e0b8a23c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b89be0b987e0b899e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b897e0b8b8e0b881e0b8a0e0b8b2e0b884e0b8aae0b988e0b8a7e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b88720e0b983e0b8abe0b989e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b895e0b988e0b8ade0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b982e0b894e0b8a2e0b983e0b88ae0b989e0b8a7e0b8b4e0b898e0b8b5e0b881e0b8b2e0b8a3e0b8aae0b8b1e0b8a1e0b8a1e0b899e0b8b220e0b8abe0b8a3e0b8b7e0b8ade0b8a7e0b8b4e0b898e0b8b5e0b881e0b8b2e0b8a3e0b8ade0b8b7e0b988e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b981e0b8a5e0b8b0e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b984e0b894e0b98920e0b982e0b894e0b8a2e0b899e0b8b3e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b8a1e0b8b2e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b981e0b881e0b989e0b984e0b882e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b884e0b8a3e0b89ae0b896e0b989e0b8a7e0b899e0b981e0b8a5e0b8b0e0b8aae0b8a1e0b89ae0b8b9e0b8a3e0b893e0b98c20e0b881e0b988e0b8ade0b899e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89a20e0b881e0b8a3e0b893e0b8b5e0b882e0b989e0b8ade0b8aae0b8a3e0b8b8e0b89be0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b981e0b895e0b881e0b895e0b988e0b8b2e0b887e0b881e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b984e0b8a1e0b988e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b8abe0b8b2e0b882e0b989e0b8ade0b8a2e0b8b8e0b895e0b8b4e0b984e0b894e0b98920e0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b981e0b881e0b989e0b984e0b882e0b983e0b899e0b8a3e0b8b2e0b8a2e0b8a5e0b8b0e0b980e0b8ade0b8b5e0b8a2e0b894e0b882e0b8ade0b887e0b980e0b899e0b8b7e0b989e0b8ade0b8abe0b8b2e0b983e0b899e0b8aae0b8b2e0b8a3e0b8b0e0b8aae0b8b3e0b884e0b8b1e0b88d20e0b983e0b8abe0b989e0b899e0b8b3e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b89ee0b8a3e0b989e0b8ade0b8a1e0b89be0b8a3e0b8b0e0b980e0b894e0b987e0b899e0b89be0b8b1e0b88de0b8abe0b8b2e0b980e0b882e0b989e0b8b2e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b983e0b899e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8afe0b980e0b89ee0b8b7e0b988e0b8ade0b8abe0b8b2e0b882e0b989e0b8ade0b8aae0b8a3e0b8b8e0b89b20e0b881e0b988e0b8ade0b899e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89a3c2f703e0d0a0d0a3c703e362e20e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b980e0b8a1e0b8b7e0b988e0b8ade0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89ce0b988e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b888e0b8b2e0b881e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8afe0b981e0b8a5e0b989e0b8a720e0b983e0b8abe0b989e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b983e0b8abe0b989e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b8a3e0b988e0b8b2e0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b899e0b8b1e0b989e0b89920e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89be0b895e0b8b2e0b8a1e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8afe0b980e0b8aae0b899e0b8ad3c6272202f3e0d0ae0b881e0b8a3e0b893e0b8b5e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b5e0b8a1e0b895e0b8b4e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b20e0b983e0b8abe0b989e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b982e0b894e0b8a2e0b8ade0b8ade0b881e0b980e0b89be0b987e0b899e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b881e0b8b3e0b8abe0b899e0b894e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b1e0b988e0b8a7e0b984e0b89b3c6272202f3e0d0ae0b881e0b8a3e0b893e0b8b5e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b5e0b8a1e0b895e0b8b4e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a20e0b983e0b8abe0b989e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b895e0b8b2e0b8a1e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b8ade0b8ade0b881e0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b8b2203138e0b882e0b8ade0b88720e0b89e2ee0b8a32ee0b89a2e20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b982e0b894e0b8a2e0b8aae0b8b2e0b8a3e0b8b0e0b8abe0b8a5e0b8b1e0b881e0b884e0b8b7e0b8ade0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b8a5e0b887e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b899e0b8abe0b899e0b8b1e0b887e0b8aae0b8b7e0b8ade0b89ee0b8b4e0b8a1e0b89ee0b98ce0b8a3e0b8b2e0b8a2e0b8a7e0b8b1e0b89920e0b8ade0b8a2e0b988e0b8b2e0b887e0b899e0b989e0b8ade0b8a2203120e0b889e0b89ae0b8b1e0b89a20e0b980e0b89be0b987e0b899e0b980e0b8a7e0b8a5e0b8b2e0b984e0b8a1e0b988e0b899e0b989e0b8ade0b8a2e0b881e0b8a7e0b988e0b8b2203320e0b8a7e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b983e0b8abe0b989e0b980e0b8a7e0b8a5e0b8b2e0b981e0b888e0b989e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b884e0b8b1e0b894e0b884e0b989e0b8b2e0b89920e0b8a3e0b8b0e0b8a2e0b8b0e0b980e0b8a7e0b8a5e0b8b2e0b984e0b8a1e0b988e0b899e0b989e0b8ade0b8a2e0b881e0b8a7e0b988e0b8b220313520e0b8a7e0b8b1e0b89920e0b981e0b8a5e0b8b0e0b983e0b8abe0b989e0b899e0b8b3e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b981e0b8aae0b894e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b899e0b8b1e0b989e0b899e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b980e0b8aae0b899e0b8ade0b981e0b899e0b8b0e0b895e0b988e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98c20e0b980e0b89ee0b8b7e0b988e0b8ade0b8ade0b8ade0b881e0b980e0b89be0b987e0b899e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b881e0b8b3e0b8abe0b899e0b894e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b983e0b899e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b888e0b8b3e0b980e0b89be0b987e0b899e0b980e0b8a3e0b988e0b887e0b894e0b988e0b8a7e0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b8aae0b8a7e0b8b1e0b8aae0b894e0b8b4e0b8a0e0b8b2e0b89ee0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b88ae0b8b2e0b88ae0b89920e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b1e0b988e0b899e0b884e0b887e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b8abe0b8a3e0b8b7e0b8ade0b980e0b89ee0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b983e0b899e0b897e0b8b2e0b887e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b88820e0b8ade0b8b2e0b8a8e0b8b1e0b8a2e0b8ade0b8b3e0b899e0b8b2e0b888e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b8b220313920e0b882e0b8ade0b88720e0b89e2ee0b8a32ee0b89a2e20e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a320e0b89e2ee0b8a82e3235353120e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8ade0b8b2e0b888e0b980e0b8aae0b899e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98ce0b980e0b89ee0b8b7e0b988e0b8ade0b8ade0b8ade0b881e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b983e0b894e0b8ade0b8a2e0b8b9e0b988e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b895e0b989e0b8ade0b887e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b881e0b987e0b984e0b894e0b9893c2f703e0d0a0d0a3c703e372e20e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b888e0b8b2e0b881e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b8b2e0b8a1e0b89ee0b8b1e0b899e0b898e0b881e0b8a3e0b893e0b8b5e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b8812057544f2028e0b881e0b8a3e0b893e0b8b5e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a293c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b983e0b899e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89a20e0b88be0b8b6e0b988e0b887e0b8ade0b8b2e0b888e0b8a1e0b8b5e0b89ce0b8a5e0b881e0b8a3e0b8b0e0b897e0b89ae0b895e0b988e0b8ade0b881e0b8b2e0b8a3e0b899e0b8b3e0b980e0b882e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b888e0b8b2e0b881e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b8b2e0b8a1e0b89ee0b8b1e0b899e0b898e0b881e0b8a3e0b893e0b8b5e0b882e0b8ade0b887e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b8872053505320e0b8abe0b8a3e0b8b7e0b8ad2054425420e0b888e0b8b0e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b981e0b888e0b989e0b887e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b8812057544f20e0b980e0b89ee0b8b7e0b988e0b8ade0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89a20e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b8a1e0b8b5e0b882e0b989e0b8ade0b884e0b8b4e0b894e0b980e0b8abe0b987e0b89920e0b884e0b8b3e0b896e0b8b2e0b8a120e0b8abe0b8a3e0b8b7e0b8ade0b882e0b989e0b8ade0b884e0b8b1e0b894e0b884e0b989e0b8b2e0b899e0b888e0b8b2e0b881e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8ade0b8b7e0b988e0b89920e0b888e0b8b0e0b895e0b989e0b8ade0b887e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b88ae0b8b2e0b881e0b8b2e0b8a3e0b8af20e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b895e0b8b2e0b8a1e0b884e0b8a7e0b8b2e0b8a1e0b888e0b8b3e0b980e0b89be0b987e0b899e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a120e0b981e0b8a5e0b8b0e0b899e0b8b3e0b89ce0b8a5e0b881e0b8b2e0b8a3e0b981e0b8aae0b894e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b89fe0b8b1e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b8abe0b987e0b899e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8ade0b8b5e0b881e0b884e0b8a3e0b8b1e0b989e0b887e0b980e0b89ee0b8b7e0b988e0b8ade0b897e0b8a3e0b8b2e0b89a2fe0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b8ade0b8ade0b881e0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b895e0b988e0b8ade0b984e0b89b3c2f703e0d0a0d0a3c703e382e20e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a5e0b887e0b899e0b8b2e0b8a1e0b983e0b899e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a82fe0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b4e0b888e0b888e0b8b2e0b899e0b8b8e0b980e0b89ae0b881e0b8a9e0b8b220e0b981e0b8a5e0b8b0e0b980e0b89ce0b8a2e0b981e0b89ee0b8a3e0b988e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b8a1e0b8b5e0b8a1e0b895e0b8b4e0b980e0b8abe0b987e0b899e0b88ae0b8ade0b89ae0b981e0b8a5e0b989e0b8a720e0b899e0b8b3e0b980e0b8aae0b899e0b8ade0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b5e0b8a7e0b988e0b8b2e0b881e0b8b2e0b8a3e0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b887e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8aae0b8abe0b881e0b8a3e0b893e0b98ce0b980e0b89ee0b8b7e0b988e0b8ade0b8ade0b8ade0b881e0b980e0b89be0b987e0b899e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a82fe0b881e0b88ee0b881e0b8a3e0b8b0e0b897e0b8a3e0b8a7e0b88720e0b981e0b8a5e0b8b0e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b899e0b8a3e0b8b2e0b88ae0b881e0b8b4e0b888e0b888e0b8b2e0b899e0b8b8e0b980e0b89ae0b881e0b8a9e0b8b2e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b897e0b8a3e0b8b2e0b89ae0b982e0b894e0b8a2e0b897e0b8b1e0b988e0b8a7e0b881e0b8b1e0b89920e0b89ee0b8a3e0b989e0b8ade0b8a1e0b897e0b8b1e0b989e0b887e0b980e0b89ce0b8a2e0b981e0b89ee0b8a3e0b988e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b89ce0b988e0b8b2e0b899e0b88ae0b988e0b8ade0b887e0b897e0b8b2e0b887e0b895e0b988e0b8b2e0b887e0b98620e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b88ae0b989e0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b895e0b988e0b8ade0b984e0b89b3c2f703e0d0a0d0a3c703e392e20e0b881e0b8b2e0b8a3e0b897e0b89ae0b897e0b8a7e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b881e0b8b2e0b8a3e0b897e0b89ae0b897e0b8a7e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b888e0b8b0e0b89ee0b8b4e0b888e0b8b2e0b8a3e0b893e0b8b2e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b980e0b8a1e0b8b7e0b988e0b8ade0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b989e0b8a7e0b884e0b8a3e0b89a203520e0b89be0b8b520e0b882e0b8b6e0b989e0b899e0b984e0b89b20e0b8abe0b8a3e0b8b7e0b8ade0b980e0b8a1e0b8b7e0b988e0b8ade0b8a1e0b8b5e0b882e0b989e0b8ade0b980e0b8aae0b899e0b8ade0b983e0b8abe0b989e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b981e0b881e0b989e0b984e0b882e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b899e0b8b1e0b989e0b89920e0b980e0b88ae0b988e0b89920e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a520e0b8aae0b896e0b8b2e0b899e0b881e0b8b2e0b8a3e0b893e0b98ce0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b8abe0b8a3e0b8b7e0b8ade0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b8ade0b8b7e0b988e0b899e0b98620e0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b981e0b89be0b8a5e0b887e0b984e0b89be0b897e0b8b5e0b988e0b8a1e0b8b5e0b89ce0b8a5e0b895e0b988e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b88420e0b980e0b89be0b987e0b899e0b980e0b8abe0b895e0b8b8e0b983e0b8abe0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b984e0b8a1e0b988e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a1e0b983e0b899e0b897e0b8b2e0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b8abe0b8a3e0b8b7e0b8ade0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b980e0b89ee0b8b4e0b988e0b8a1e0b980e0b895e0b8b4e0b8a1e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b983e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b884e0b8a3e0b89ae0b896e0b989e0b8a7e0b89920e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b89920e0b981e0b8a5e0b8b0e0b895e0b8a3e0b887e0b881e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a3e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b984e0b894e0b98920e0b8aae0b988e0b8a7e0b899e0b980e0b8aae0b8b5e0b8a23c2f703e0d0a0d0a3c703e266e6273703b3c2f703e0d0a, '', 'Y'),
(20, '', 80, 'ข้อมูลหน่วยรับรองระบบงาน', '', '2018-10-21 21:53:07', '2018-10-21 21:55:10', 0x3c703e3c7374726f6e673ee0b881e0b8ade0b887e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8993c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841636372656469746174696f6e20626f6479203a2041422920e0b8a1e0b8b5e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b981e0b881e0b988e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843657274696669636174696f6e20426f6479203a2043422920e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b8882028496e7370656374696f6e20426f6479203a49422920e0b983e0b899e0b8aae0b8b2e0b882e0b8b2e0b895e0b988e0b8b2e0b887e0b98620e0b980e0b88ae0b988e0b89920e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98c202850726f647563742043657274696669636174696f6e2920e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b887e0b8b2e0b899e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89e20285175616c697479204d616e6167656d656e742053797374656d2043657274696669636174696f6e2920e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843422920e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b888202849422920e0b984e0b89be0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b981e0b8a5e0b8b0e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b983e0b8abe0b989e0b981e0b881e0b98820e0b89fe0b8b2e0b8a3e0b98ce0b8a120e0b982e0b8a3e0b887e0b887e0b8b2e0b89920e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a320e0b983e0b899e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b895e0b988e0b8b2e0b887e0b98620e0b980e0b88ae0b988e0b89920e0b8abe0b8a5e0b8b1e0b881e0b881e0b8b2e0b8a3e0b897e0b8b1e0b988e0b8a7e0b984e0b89be0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b8aae0b8b8e0b882e0b8a5e0b8b1e0b881e0b8a9e0b893e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a32028474d50292c20e0b881e0b8b2e0b8a3e0b8a7e0b8b4e0b980e0b884e0b8a3e0b8b2e0b8b0e0b8abe0b98ce0b8ade0b8b1e0b899e0b895e0b8a3e0b8b2e0b8a2e0b981e0b8a5e0b8b0e0b888e0b8b8e0b894e0b8a7e0b8b4e0b881e0b8a4e0b895e0b897e0b8b5e0b988e0b895e0b989e0b8ade0b887e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a120284841434350292c20e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b894e0b8b52028474150292c20e0b894e0b989e0b8b2e0b899e0b980e0b881e0b8a9e0b895e0b8a3e0b8ade0b8b4e0b899e0b897e0b8a3e0b8b5e0b8a2e0b98c20284f7267616e6963204167726963756c747572652920e0b980e0b89be0b987e0b899e0b895e0b989e0b8993c2f703e0d0a0d0a3c703e3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b20266e6273703be0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b882e0b8ade0b88720e0b8a1e0b881e0b8ade0b88a2e20e0b983e0b899e0b890e0b8b2e0b899e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841422920e0b888e0b8b0e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89a20e0b981e0b8a5e0b8b0e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b897e0b8b1e0b894e0b980e0b897e0b8b5e0b8a2e0b8a1e0b881e0b8b1e0b89ae0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b882e0b8ade0b887e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b895e0b8a5e0b8ade0b894e0b888e0b899e0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b8b1e0b988e0b899e0b983e0b89920e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b984e0b897e0b8a220e0b8a1e0b881e0b8ade0b88a2e20e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b983e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a3e0b8b0e0b894e0b8b1e0b89a20e0b8aae0b8b2e0b881e0b8a5e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920e0b980e0b88ae0b988e0b89920506163696669632041636372656469746174696f6e20436f6f7065726174696f6e2028504143292c20496e7465726e6174696f6e616c2041636372656469746174696f6e20466f72756d20284941462920e0b980e0b89be0b987e0b899e0b895e0b989e0b89920e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b881e0b8a3e0b8b0e0b89ae0b8a7e0b899e0b881e0b8b2e0b8a3e0b8abe0b899e0b8b6e0b988e0b887e0b897e0b8b5e0b988e0b897e0b8b3e0b983e0b8abe0b989e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a320e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b8b1e0b988e0b899e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b983e0b899e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a5e0b981e0b8a5e0b8b0e0b888e0b8b2e0b881e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b884e0b8b9e0b988e0b884e0b989e0b8b220e0b8aae0b988e0b887e0b89ce0b8a5e0b983e0b8abe0b989e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b980e0b88ae0b8b7e0b988e0b8ade0b896e0b8b7e0b8ade0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b884e0b8b9e0b988e0b884e0b989e0b8b2e0b981e0b8a5e0b8b0e0b881e0b988e0b8ade0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b881e0b8b2e0b8a3e0b882e0b8a2e0b8b2e0b8a2e0b895e0b8b1e0b8a720e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b984e0b894e0b989e0b8a1e0b8b2e0b881e0b8a2e0b8b4e0b988e0b887e0b882e0b8b6e0b989e0b89920e0b8a3e0b8a7e0b8a1e0b896e0b8b6e0b887e0b881e0b8b2e0b8a3e0b8ade0b8b3e0b899e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b881e0b983e0b899e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b220e0b8a5e0b894e0b881e0b8b2e0b8a320e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b88be0b8b1e0b89ae0b88be0b989e0b8ade0b8993c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a1e0b881e0b8ade0b88a2e20e0b984e0b894e0b989e0b899e0b8b3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202849534f2f494543203137303131293c2f703e0d0a0d0a3c703ee0b8a1e0b8b2e0b89be0b8a3e0b8b0e0b8a2e0b8b8e0b881e0b895e0b98ce0b983e0b88ae0b98920e0b981e0b8a5e0b8b0e0b984e0b894e0b989e0b8a2e0b8b7e0b988e0b899e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b881e0b8b1e0b89a3c2f703e0d0a0d0a3c703ee0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920e0b981e0b8a5e0b8b0e0b983e0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820313720e0b8a1e0b8b4e0b896e0b8b8e0b899e0b8b2e0b8a2e0b899203235353320e0b8a1e0b881e0b8ade0b88a2e20e0b983e0b899e0b899e0b8b2e0b8a1e0b882e0b8ade0b887e0b884e0b893e0b8b0e0b881e0b8a3e0b8a3e0b8a1e0b881e0b8b2e0b8a33c2f703e0d0a0d0a3c703ee0b881e0b8b2e0b8a3e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8abe0b988e0b887e0b88ae0b8b2e0b895e0b8b420284e53432920e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b888e0b8b2e0b881e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b8a0e0b8b9e0b8a1e0b8b4e0b8a0e0b8b2e0b884e0b981e0b89be0b88be0b8b4e0b89fe0b8b4e0b884e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a23c2f703e0d0a0d0a3c703ee0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920285041432920e0b983e0b8abe0b98920e0b8a1e0b881e0b8ade0b88a2e20e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c2f703e0d0a0d0a3c703ee0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98c202850726f647563742043657274696669636174696f6e2920e0b983e0b899e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b881e0b8a9e0b895e0b8a3e0b897e0b8b5e0b988e0b894e0b8b53c2f703e0d0a0d0a3c703e284741502920e0b981e0b8a5e0b8b0e0b895e0b988e0b8ade0b8a1e0b8b2e0b983e0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820333020e0b881e0b8b1e0b899e0b8a2e0b8b2e0b8a2e0b899203235353320e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c2f703e0d0a0d0a3c703ee0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920284941462920e0b984e0b894e0b989e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89a20e0b8a1e0b881e0b8ade0b88a2e20e0b983e0b899e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b882e0b989e0b8b2e0b887e0b895e0b989e0b899e0b980e0b88ae0b988e0b899e0b881e0b8b1e0b8993c2f703e0d0a0d0a3c703ee0b983e0b899e0b89be0b8b5203235353820e0b8a1e0b881e0b8ade0b88a2e20e0b984e0b894e0b989e0b8a2e0b8b7e0b988e0b899e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b882e0b8a2e0b8b2e0b8a2e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b980e0b897e0b988e0b8b2e0b980e0b897e0b8b5e0b8a2e0b8a120e0b894e0b989e0b8b2e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8ade0b8b2e0b8abe0b8b2e0b8a32028466f6f6420536166657479204d616e6167656d656e742053797374656d2c2046534d532920e0b888e0b8b2e0b881e0b8ade0b887e0b884e0b98ce0b881e0b8b2e0b8a3e0b8a0e0b8b9e0b8a1e0b8b4e0b8a0e0b8b2e0b884e0b981e0b89be0b88be0b8b4e0b89fe0b8b4e0b884e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920285041432920e0b88be0b8b6e0b988e0b88720e0b8a1e0b881e0b8ade0b88a2e20e0b984e0b894e0b989e0b89ce0b988e0b8b2e0b899e0b881e0b8a3e0b8b0e0b89ae0b8a7e0b899e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b899e0b884e0b8a7e0b8b2e0b8a1e0b980e0b897e0b988e0b8b2e0b980e0b897e0b8b5e0b8a2e0b8a1202850656572206576616c756174696f6e2920e0b981e0b8a5e0b8b0e0b980e0b8a1e0b8b7e0b988e0b8ade0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820313520e0b8a1e0b8b4e0b896e0b8b8e0b899e0b8b2e0b8a2e0b899203235353920e0b8a1e0b881e0b8ade0b88a2e20e0b984e0b894e0b989e0b8a3e0b988e0b8a7e0b8a1e0b8a5e0b887e0b899e0b8b2e0b8a1e0b881e0b8b2e0b8a3e0b897e0b8b3e0b882e0b989e0b8ade0b895e0b881e0b8a5e0b887e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b980e0b897e0b988e0b8b2e0b980e0b897e0b8b5e0b8a2e0b8a1e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b8992028504143204d4c412920e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8ade0b8b2e0b8abe0b8b2e0b8a3202846534d532920e0b981e0b8a5e0b8b0e0b983e0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b98820323920e0b895e0b8b8e0b8a5e0b8b2e0b884e0b8a1203235363020e0b984e0b894e0b989e0b8a3e0b988e0b8a7e0b8a1e0b89ee0b8b4e0b898e0b8b5e0b8a5e0b887e0b899e0b8b2e0b8a1e0b897e0b8b3e0b882e0b989e0b8ade0b895e0b881e0b8a5e0b887e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b980e0b897e0b988e0b8b2e0b980e0b897e0b8b5e0b8a2e0b8a1e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b8992028494146204d4c412920e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b8ade0b8b2e0b8abe0b8b2e0b8a3202846534d41293c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b881e0b8b2e0b8a3e0b8a5e0b887e0b899e0b8b2e0b8a1e0b882e0b989e0b8ade0b895e0b881e0b8a5e0b887e0b899e0b8b5e0b98920e0b888e0b8b0e0b8aae0b988e0b887e0b89ce0b8a5e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b888e0b8b0e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b881e0b8a1e0b8b2e0b881e0b8a2e0b8b4e0b988e0b887e0b882e0b8b6e0b989e0b89920e0b980e0b89ee0b8a3e0b8b2e0b8b0e0b88ae0b988e0b8a7e0b8a2e0b8a5e0b894e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b88be0b989e0b8b3e0b897e0b8b5e0b988e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b89be0b8a5e0b8b2e0b8a2e0b897e0b8b2e0b88720e0b981e0b8a5e0b8b0e0b89ce0b8b9e0b989e0b89ce0b8a5e0b8b4e0b89520e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b980e0b8a5e0b8b7e0b8ade0b881e0b983e0b88ae0b989e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a0e0b8b2e0b8a2e0b983e0b899e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8a1e0b8b2e0b895e0b8a3e0b8a7e0b888e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b982e0b8a3e0b887e0b887e0b8b2e0b899e0b981e0b897e0b899e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b888e0b8b2e0b881e0b895e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b88be0b8b6e0b988e0b887e0b888e0b8b0e0b88ae0b988e0b8a7e0b8a2e0b8a5e0b894e0b895e0b989e0b899e0b897e0b8b8e0b899e0b884e0b988e0b8b2e0b983e0b88ae0b989e0b888e0b988e0b8b2e0b8a2e0b983e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b88720e0b897e0b8b3e0b983e0b8abe0b989e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b984e0b897e0b8a2e0b8a1e0b8b5e0b8a8e0b8b1e0b881e0b8a2e0b8a0e0b8b2e0b89ee0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b882e0b988e0b887e0b882e0b8b1e0b899e0b8a1e0b8b2e0b881e0b882e0b8b6e0b989e0b8993c6272202f3e0d0a266e6273703b3c2f703e0d0a, '', 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(21, '', 82, 'ข้อมูลหน่วยรับรองระบบงาน', '', '2018-10-21 21:53:48', '2018-10-21 21:53:48', 0x3c703e3c7374726f6e673e506163696669632041636372656469746174696f6e20436f6f7065726174696f6e202850414329203c2f7374726f6e673e3c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e20e0b8aae0b896e0b8b2e0b899e0b8b0e0b882e0b8ade0b887205041433c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e3120506163696669632041636372656469746174696f6e20436f6f7065726174696f6e20285041432920e0b980e0b89be0b987e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a0e0b8b9e0b8a1e0b8b4e0b8a0e0b8b2e0b884e0b897e0b8b5e0b988e0b980e0b881e0b8b4e0b894e0b888e0b8b2e0b881e0b881e0b8b2e0b8a3e0b8a3e0b8a7e0b8a1e0b895e0b8b1e0b8a7e0b881e0b8b1e0b899e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841636372656469746174696f6e20426f6479203a2041422920e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8ade0b8b7e0b988e0b899e0b897e0b8b5e0b988e0b8aae0b899e0b983e0b88820e0b8a1e0b8b5e0b8a7e0b8b1e0b895e0b896e0b8b8e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98ce0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8a5e0b988e0b8ade0b887e0b895e0b8b1e0b8a7e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b2e0b983e0b899e0b881e0b8a5e0b8b8e0b988e0b8a1e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888e0b980e0b8ade0b980e0b88ae0b8b5e0b8a220e0b981e0b89be0b88be0b8b4e0b89fe0b8b4e0b88120e0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b989e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b882e0b8ade0b8872050414320e0b888e0b8b0e0b8ade0b8a2e0b8b9e0b988e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b881e0b8a3e0b8ade0b89ae0b887e0b8b2e0b899e0b882e0b8ade0b88720496e7465726e6174696f6e616c2041636372656469746174696f6e20466f72756d2028494146293c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e322049414620e0b980e0b89be0b987e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920e0b980e0b881e0b8b4e0b894e0b888e0b8b2e0b881e0b881e0b8b2e0b8a3e0b8a3e0b8a7e0b8a1e0b881e0b8a5e0b8b8e0b988e0b8a1e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b897e0b8b3e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b988e0b8b2e0b887e0b9863c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e332050414320e0b980e0b89be0b987e0b899e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b988e0b8a7e0b8a1e0b8a1e0b8b7e0b8ade0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b983e0b899e0b881e0b8a5e0b8b8e0b988e0b8a1e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888e0b882e0b8ade0b887204150454320e0b981e0b8a5e0b8b0e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8ade0b8b7e0b988e0b899e0b897e0b8b5e0b988e0b8a3e0b8b0e0b89ae0b8b8e0b983e0b899e0b89ae0b8b1e0b899e0b897e0b8b6e0b881e0b884e0b8a7e0b8b2e0b8a1e0b980e0b882e0b989e0b8b2e0b983e0b888e0b882e0b8ade0b8872050414320e0b984e0b8a1e0b988e0b8a1e0b8b5e0b8aae0b896e0b8b2e0b899e0b8b0e0b980e0b89be0b987e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b8b2e0b8a1e0b899e0b8b1e0b8a2e0b882e0b8ade0b887e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b881e0b8b2e0b8a3e0b8a5e0b887e0b899e0b8b2e0b8a1e0b983e0b89920506172746e6572736869702053746174656d656e7420e0b888e0b8b6e0b887e0b984e0b8a1e0b988e0b983e0b88ae0b988e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b884e0b8a7e0b8b2e0b8a1e0b895e0b881e0b8a5e0b887e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b981e0b8a5e0b8b0e0b984e0b8a1e0b988e0b8ade0b8a2e0b8b9e0b988e0b8a0e0b8b2e0b8a2e0b983e0b895e0b989e0b89ae0b8b1e0b887e0b884e0b8b1e0b89ae0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a83c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e3420e0b881e0b8b2e0b8a3e0b980e0b882e0b989e0b8b2e0b8a3e0b988e0b8a7e0b8a1e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b983e0b8992050414320e0b980e0b89be0b987e0b899e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b1e0b8a1e0b89ee0b8b1e0b899e0b898e0b98ce0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b88be0b8b6e0b988e0b887e0b895e0b8b2e0b8a1e0b89ee0b8a3e0b8b0e0b8a3e0b8b2e0b88ae0b881e0b8a4e0b8a9e0b88ee0b8b5e0b881e0b8b2e0b8a7e0b988e0b8b2e0b894e0b989e0b8a7e0b8a2e0b881e0b8b2e0b8a3e0b980e0b8aae0b899e0b8ade0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b981e0b8a5e0b8b0e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b88ae0b8b8e0b8a120e0b884e0b8a3e0b8a12e20e0b89e2ee0b8a82e203235343820e0b8a1e0b8b2e0b895e0b8a3e0b8b220342028372920e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b897e0b8b5e0b988e0b895e0b989e0b8ade0b887e0b980e0b8aae0b899e0b8ade0b884e0b893e0b8b0e0b8a3e0b8b1e0b890e0b8a1e0b899e0b895e0b8a3e0b8b52028e0b884e0b8a3e0b8a12e293c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e20e0b881e0b8b2e0b8a3e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b882e0b8ade0b887205041433c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e3120e0b881e0b8b2e0b8a3e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b882e0b8ade0b8872050414320e0b8a1e0b8b5203220e0b8a3e0b8b9e0b89be0b981e0b89ae0b89a20e0b884e0b8b7e0b8ad3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28312920e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8ade0b8b3e0b899e0b8b2e0b888e0b980e0b895e0b987e0b8a1202846756c6c204d656d6265722920e0b8abe0b8a1e0b8b2e0b8a2e0b896e0b8b6e0b88720e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b981e0b8a5e0b8b0e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b983e0b899e0b980e0b882e0b895e0b980e0b8a8e0b8a3e0b8a9e0b890e0b881e0b8b4e0b888e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881204150454320e0b981e0b8a5e0b8b0e0b981e0b8aae0b894e0b887e0b980e0b888e0b895e0b888e0b8b3e0b899e0b887e0b980e0b882e0b989e0b8b2e0b984e0b89be0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b8a3e0b988e0b8a7e0b8a1e0b983e0b899e0b881e0b8b4e0b888e0b881e0b8a3e0b8a3e0b8a1e0b882e0b8ade0b887205041433c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b28322920e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b8aae0b8a1e0b897e0b89a20284173736f6369617465204d656d6265722920e0b8abe0b8a1e0b8b2e0b8a2e0b896e0b8b6e0b88720e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b884e0b8b1e0b894e0b980e0b8a5e0b8b7e0b8ade0b881e0b982e0b894e0b8a22050414320e0b88be0b8b6e0b988e0b887e0b8ade0b8b2e0b888e0b8a1e0b8b2e0b888e0b8b2e0b881e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881204150454320e0b897e0b8b5e0b988e0b984e0b8a1e0b988e0b8a1e0b8b5e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b8abe0b8a3e0b8b7e0b8ade0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b8ade0b8a2e0b8b9e0b988202fe0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b899e0b8ade0b881e0b881e0b8a5e0b8b8e0b988e0b8a12041504543202f20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8202f20e0b881e0b8a5e0b8b8e0b988e0b8a1e0b8a0e0b8b9e0b8a1e0b8b4e0b8a0e0b8b2e0b884e0b8a0e0b8b2e0b8a2e0b983e0b895e0b98920415045433c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e3220e0b884e0b988e0b8b2e0b898e0b8a3e0b8a3e0b8a1e0b980e0b899e0b8b5e0b8a2e0b8a1e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b8813c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b50414320e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98ce0b983e0b899e0b881e0b8b2e0b8a3e0b884e0b8b3e0b899e0b8a7e0b893e0b884e0b988e0b8b2e0b898e0b8a3e0b8a3e0b8a1e0b980e0b899e0b8b5e0b8a2e0b8a1e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b984e0b8a7e0b989202852756c657320666f72207468652043616c63756c6174696f6e206f66204d656d6265727368697020466565732920e0b897e0b8b1e0b989e0b887e0b899e0b8b5e0b989e0b8abe0b8a5e0b8b1e0b881e0b980e0b881e0b893e0b891e0b98ce0b894e0b8b1e0b887e0b881e0b8a5e0b988e0b8b2e0b8a7e0b984e0b894e0b989e0b881e0b8b3e0b8abe0b899e0b894e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b981e0b895e0b988e0b8a5e0b8b0e0b8a3e0b8b2e0b8a220e0b981e0b895e0b988e0b8a1e0b8b4e0b984e0b894e0b989e0b8a3e0b8b0e0b89ae0b8b8e0b88ae0b8b1e0b894e0b896e0b8b6e0b887e0b881e0b8a3e0b893e0b8b5e0b8a1e0b8b5e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b8a1e0b8b2e0b881e0b881e0b8a7e0b988e0b8b2203120e0b8abe0b899e0b988e0b8a7e0b8a2e0b887e0b8b2e0b899e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b899e0b8b1e0b989e0b899e0b98620e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b980e0b882e0b989e0b8b2e0b8a1e0b8b2e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b980e0b89ee0b8b4e0b988e0b8a1e0b980e0b895e0b8b4e0b8a120e0b982e0b894e0b8a2e0b881e0b8b2e0b8a3e0b980e0b882e0b989e0b8b2e0b8a3e0b988e0b8a7e0b8a1e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b895e0b989e0b8ade0b887e0b888e0b988e0b8b2e0b8a2e0b980e0b887e0b8b4e0b899e0b884e0b988e0b8b2e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b8a3e0b8b2e0b8a2e0b89be0b8b520e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b884e0b8b3e0b899e0b8a7e0b893e0b983e0b899e0b981e0b895e0b988e0b8a5e0b8b0e0b89be0b8b5e0b895e0b8b2e0b8a1e0b8ade0b8b1e0b895e0b8a3e0b8b2e0b89ee0b8b7e0b989e0b899e0b890e0b8b2e0b899e0b882e0b8ade0b887e0b881e0b8a5e0b8b8e0b988e0b8a1e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b981e0b8a5e0b8b0e0b888e0b8b3e0b899e0b8a7e0b899e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843657274696669636174696f6e20426f6479203a2043422920e0b897e0b8b5e0b988e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b88720e0b8a3e0b8a7e0b8a1e0b897e0b8b1e0b989e0b887e0b8a3e0b8b0e0b8a2e0b8b0e0b980e0b8a7e0b8a5e0b8b2e0b882e0b8ade0b887e0b89be0b8b5e0b897e0b8b5e0b988e0b8aae0b8a1e0b8b1e0b884e0b8a3e0b980e0b882e0b989e0b8b2e0b980e0b89be0b987e0b899e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b8813c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b20e0b894e0b8b1e0b887e0b899e0b8b1e0b989e0b899e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b8abe0b8a3e0b8b7e0b8ade0b881e0b8b2e0b8a3e0b980e0b882e0b989e0b8b2e0b8a3e0b988e0b8a7e0b8a1e0b881e0b8b4e0b888e0b881e0b8a3e0b8a3e0b8a1e0b895e0b988e0b8b2e0b887e0b98620e0b897e0b8b5e0b988e0b888e0b8b0e0b8aae0b988e0b887e0b89ce0b8a5e0b983e0b8abe0b989e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b984e0b897e0b8a2e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b983e0b899e0b8aae0b8b2e0b881e0b8a5e0b899e0b8b1e0b989e0b89920e0b8a2e0b988e0b8ade0b8a1e0b980e0b89be0b987e0b899e0b89ce0b8a5e0b894e0b8b5e0b895e0b988e0b8ade0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a820e0b982e0b894e0b8a2e0b980e0b889e0b89ee0b8b2e0b8b0e0b894e0b989e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b88be0b8b6e0b988e0b887e0b881e0b8b2e0b8a3e0b980e0b882e0b989e0b8b2e0b8a3e0b988e0b8a7e0b8a1e0b983e0b899e0b881e0b8b4e0b888e0b881e0b8a3e0b8a3e0b8a1e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b983e0b899e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b8aae0b8b2e0b881e0b8a520e0b897e0b8b3e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a3e0b8b9e0b989e0b888e0b8b1e0b881e0b981e0b8a5e0b8b0e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b888e0b8b2e0b88120414220e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b895e0b988e0b8b2e0b887e0b98620e0b897e0b8b3e0b983e0b8abe0b989e0b8a1e0b8b5e0b982e0b8ade0b881e0b8b2e0b8aae0b8a3e0b8b1e0b89ae0b8a3e0b8b9e0b989e0b981e0b8a5e0b881e0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a520e0b882e0b988e0b8b2e0b8a7e0b8aae0b8b2e0b8a320e0b981e0b8aae0b894e0b887e0b884e0b8a7e0b8b2e0b8a1e0b884e0b8b4e0b894e0b980e0b8abe0b987e0b899e0b983e0b899e0b980e0b8a7e0b897e0b8b5e0b8aae0b8b2e0b881e0b8a520e0b88be0b8b6e0b988e0b887e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b899e0b8b3e0b8a1e0b8b2e0b89be0b8a3e0b8b0e0b8a2e0b8b8e0b881e0b895e0b98c20e0b89ee0b8b1e0b892e0b899e0b8b2e0b89be0b8a3e0b8b1e0b89ae0b980e0b89be0b8a5e0b8b5e0b988e0b8a2e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b984e0b897e0b8a2e0b895e0b988e0b8ade0b984e0b89b3c2f703e0d0a0d0a3c703e266e6273703b3c2f703e0d0a0d0a3c703e266e6273703b3c2f703e0d0a, '', 'Y'),
(22, '', 83, 'ข้อมูลหน่วยรับรองระบบงาน', '', '2018-10-21 21:54:57', '2018-10-21 21:54:57', 0x3c703e3c7374726f6e673ee0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c2f7374726f6e673e3c7374726f6e673e203c2f7374726f6e673e3c6272202f3e0d0a3c6272202f3e0d0ae0b8a1e0b881e0b8ade0b88a2e20e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b882e0b8ade0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843422920e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b888202849422920e0b894e0b989e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b983e0b899e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a2e0b895e0b988e0b8b2e0b887e0b98620e0b984e0b894e0b989e0b981e0b881e0b9883c6272202f3e0d0a3c6272202f3e0d0ae0b8aae0b8b2e0b882e0b8b23c6272202f3e0d0a3c6272202f3e0d0a312e20476f6f64204d616e75666163747572696e67205072616374696365732028474d502920e0b8abe0b8a3e0b8b7e0b8ad20476f6f642048796769656e6963205072616374696365732028474850293c6272202f3e0d0a322e2048617a61726420416e616c7973697320616e6420437269746963616c20436f6e74726f6c20506f696e747320284841434350293c6272202f3e0d0a332e20476f6f64204167726963756c747572616c205072616374696365732028474150292c20474c4f42414c472e412e502e3c6272202f3e0d0a342e204f7267616e6963204167726963756c747572653c6272202f3e0d0a352e2047656f67726170686963616c20496e6469636174696f6e7320284749293c6272202f3e0d0a362e20466f6f6420536166657479204d616e6167656d656e742053797374656d202846534d53293c6272202f3e0d0a3c6272202f3e0d0ae0b89be0b8a3e0b8b0e0b982e0b8a2e0b88ae0b899e0b98ce0b882e0b8ade0b89ae0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89a3c6272202f3e0d0ae0b887e0b8b2e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843422920e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b88820284942293c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b2d20e0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b8b1e0b988e0b89920e0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b981e0b8a5e0b8b0e0b8a2e0b881e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b983e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b894e0b989e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b8aae0b8b2e0b881e0b8a53c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b2d20e0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b897e0b988e0b8b2e0b980e0b897e0b8b5e0b8a2e0b8a1e0b881e0b8b1e0b899e0b882e0b8ade0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a320284571756976616c656e63652920e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b981e0b8a5e0b8b0e0b8aae0b8b2e0b881e0b8a53c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b2d20e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a0e0b8b2e0b884e0b980e0b8ade0b881e0b88ae0b899e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b980e0b882e0b989e0b8b2e0b8a1e0b8b2e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b8a3e0b988e0b8a7e0b8a1e0b983e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b88720e0b981e0b8a5e0b8b0e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b981e0b89ae0b988e0b887e0b980e0b89ae0b8b2e0b8a0e0b8b2e0b8a3e0b881e0b8b4e0b888e0b8a0e0b8b2e0b884e0b8a3e0b8b1e0b890e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c6272202f3e0d0ae0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a33c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b2d20e0b8a5e0b894e0b884e0b8a7e0b8b2e0b8a1e0b88be0b989e0b8b3e0b88be0b989e0b8ade0b899e0b894e0b989e0b8b2e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89ae0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a320e0b89320e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b89be0b8a5e0b8b2e0b8a2e0b897e0b8b2e0b8873c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b2d20e0b8a5e0b894e0b8ade0b8b8e0b89be0b8aae0b8a3e0b8a3e0b884e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b884e0b989e0b8b220e0b8ade0b8b3e0b899e0b8a7e0b8a2e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b0e0b894e0b8a7e0b88120e0b980e0b89ee0b8b4e0b988e0b8a1e0b882e0b8b5e0b894e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b983e0b899e0b881e0b8b2e0b8a3e0b981e0b882e0b988e0b887e0b882e0b8b1e0b89920e0b980e0b8aae0b8a3e0b8b4e0b8a1e0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b8b1e0b988e0b89920e0b88ae0b8b7e0b988e0b8ade0b980e0b8aae0b8b5e0b8a2e0b88720e0b894e0b989e0b8b2e0b899e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b984e0b897e0b8a2e0b8aae0b8b9e0b988e0b895e0b8a5e0b8b2e0b894e0b982e0b8a5e0b8813c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b2d20e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b980e0b8a5e0b8b7e0b8ade0b881e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b888e0b8b2e0b881e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b897e0b8b5e0b988e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b899e0b988e0b8b2e0b980e0b88ae0b8b7e0b988e0b8ade0b896e0b8b7e0b8ade0b981e0b8a5e0b8b0e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89a3c6272202f3e0d0ae0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b8843c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b202d20e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b8b1e0b988e0b899e0b983e0b899e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89e20e0b981e0b8a5e0b8b0e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b983e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b984e0b897e0b8a23c2f703e0d0a, '', 'Y'),
(23, '', 84, 'ข้อมูลหน่วยรับรองระบบงาน', '', '2018-10-21 21:55:50', '2018-10-21 21:56:51', 0x3c703e3c7374726f6e673ee0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a5e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b8993c2f7374726f6e673e3c7374726f6e673e20284142293c2f7374726f6e673e3c2f703e0d0a0d0a3c703e3c6272202f3e0d0ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a5e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841636372656469746174696f6e20426f6479203a2041422920e0b894e0b989e0b8b2e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a33c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b899e0b8b1e0b89ae0b980e0b89be0b987e0b899e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b8abe0b8a5e0b8b1e0b881e0b897e0b8b5e0b988e0b8a1e0b8b5e0b8a8e0b8b1e0b881e0b8a2e0b8a0e0b8b2e0b89ee0b8aae0b8b9e0b887e0b983e0b899e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b88120e0b894e0b8b1e0b887e0b899e0b8b1e0b989e0b899e0b881e0b8b2e0b8a3e0b8aae0b988e0b887e0b8ade0b8ade0b881e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b980e0b881e0b8a9e0b895e0b8a3e0b981e0b8a5e0b8b0e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b894e0b8b9e0b981e0b8a5e0b981e0b8a5e0b8b0e0b895e0b8a3e0b8a7e0b888e0b8aae0b8ade0b89a20e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b1e0b988e0b899e0b983e0b888e0b8a7e0b988e0b8b2e0b8aae0b8b4e0b899e0b884e0b989e0b8b2e0b882e0b8ade0b887e0b984e0b897e0b8a2e0b8a1e0b8b5e0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b895e0b988e0b8ade0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b88420e0b888e0b8b6e0b887e0b888e0b8b3e0b980e0b89be0b987e0b899e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b895e0b8a5e0b8ade0b894e0b897e0b8b1e0b989e0b887e0b8abe0b988e0b8a7e0b887e0b982e0b88be0b988e0b8ade0b8b2e0b8abe0b8b2e0b8a320e0b982e0b894e0b8a2e0b980e0b8a3e0b8b4e0b988e0b8a1e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b881e0b8b2e0b8a3e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b881e0b8a3e0b8b0e0b89ae0b8a7e0b899e0b881e0b8b2e0b8a320e0b881e0b8b2e0b8a3e0b980e0b89ee0b8b2e0b8b0e0b89be0b8a5e0b8b9e0b88120e0b881e0b8b2e0b8a3e0b89ce0b8a5e0b8b4e0b89520e0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b8aae0b8b8e0b894e0b897e0b989e0b8b2e0b8a220e0b888e0b899e0b896e0b8b6e0b887e0b8a1e0b8b7e0b8ade0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b982e0b8a0e0b88420e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a5e0b980e0b89ee0b8b7e0b988e0b8ade0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b8a1e0b8b1e0b988e0b899e0b983e0b888e0b981e0b8a5e0b8b0e0b980e0b89be0b987e0b899e0b897e0b8b5e0b988e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b882e0b8ade0b887e0b89be0b8a3e0b8b0e0b980e0b897e0b8a8e0b884e0b8b9e0b988e0b884e0b989e0b8b220e0b894e0b8b1e0b887e0b899e0b8b1e0b989e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843657274696669636174696f6e20426f64793a2043422920e0b888e0b8b6e0b887e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b89ae0b897e0b89ae0b8b2e0b897e0b8aae0b8b3e0b884e0b8b1e0b88de0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b981e0b881e0b988e0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a3e0b89ce0b8b9e0b989e0b89ce0b8a5e0b8b4e0b89520e0b980e0b89ee0b8b7e0b988e0b8ade0b983e0b8abe0b989e0b8a1e0b8b1e0b988e0b899e0b983e0b888e0b8a7e0b988e0b8b2e0b89ce0b8b9e0b989e0b89ce0b8a5e0b8b4e0b895e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b884e0b8a7e0b89ae0b884e0b8b8e0b8a1e0b894e0b8b9e0b981e0b8a5e0b8a3e0b8b0e0b89ae0b89ae0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b89920e0b895e0b8a5e0b8ade0b894e0b888e0b899e0b884e0b8a7e0b8b2e0b8a1e0b89be0b8a5e0b8ade0b894e0b8a0e0b8b1e0b8a2e0b882e0b8ade0b887e0b8ade0b8b2e0b8abe0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a520e0b982e0b894e0b8a2e0b8a1e0b8b5e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841636372656469746174696f6e20426f64792920e0b897e0b8b3e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841636372656469746174696f6e2920e0b981e0b881e0b988e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b983e0b8abe0b989e0b980e0b89be0b987e0b899e0b984e0b89be0b895e0b8b2e0b8a1e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b981e0b8a5e0b8b0e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b887e0b895e0b8b2e0b8a1e0b8abe0b8a5e0b8b1e0b881e0b8aae0b8b2e0b881e0b8a520e0b8aae0b8b2e0b8a1e0b8b2e0b8a3e0b896e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b983e0b8abe0b989e0b981e0b881e0b988e0b980e0b881e0b8a9e0b895e0b8a3e0b881e0b8a3e0b89ce0b8b9e0b989e0b89ce0b8a5e0b8b4e0b89520e0b89ce0b8b9e0b989e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b881e0b8b2e0b8a3e0b984e0b894e0b9893c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8a3e0b8b0e0b89ae0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a5e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b8992049534f2f4945432031373031313a20323030342047656e6572616c20726571756972656d656e747320666f722061636372656469746174696f6e20626f646965732061636372656469746174696f6e20636f6e666f726d697479206173736573736d656e7420626f6469657320e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b8aae0b8b2e0b881e0b8a5e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899202841636372656469746174696f6e20426f64793a2041422920e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b897e0b8b5e0b988e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b88ae0b989e0b981e0b897e0b899e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b980e0b894e0b8b4e0b8a1e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b981e0b881e0b988e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887202843657274696669636174696f6e2f20526567697374726174696f6e20426f64793a204342292049534f2f4945432047756964652036313a20313939362047656e6572616c20726571756972656d656e747320666f72206173736573736d656e7420616e642061636372656469746174696f6e206f662063657274696669636174696f6e2f20726567697374726174696f6e20626f646965732c20e0b8abe0b989e0b8ade0b887e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b881e0b8b2e0b8a3202843616c6962726174696f6e20616e642054657374696e67204c61626f7261746f7279292049534f2f4945432047756964652035383a20313939332043616c6962726174696f6e20616e642074657374696e67204c61626f7261746f72792061636372656469746174696f6e2073797374656d73202d2047656e6572616c20726571756972656d656e747320666f72206f7065726174696f6e20616e64207265636f676e6974696f6e20e0b981e0b8a5e0b8b0e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b8882028496e7370656374696f6e20426f64793a2049422049534f2f4945432054522031373031303a20313939382047656e6572616c20726571756972656d656e747320666f7220626f646965732070726f766964696e672061636372656469746174696f6e206f6620696e7370656374696f6e20626f6469657320e0b980e0b899e0b8b7e0b988e0b8ade0b887e0b888e0b8b2e0b881e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b980e0b894e0b8b4e0b8a1e0b897e0b8b1e0b989e0b887203320e0b980e0b8a3e0b8b7e0b988e0b8ade0b88720e0b8a1e0b8b5e0b980e0b899e0b8b7e0b989e0b8ade0b8abe0b8b2e0b897e0b8b5e0b988e0b984e0b8a1e0b988e0b980e0b89be0b987e0b899e0b89be0b8b1e0b888e0b888e0b8b8e0b89ae0b8b1e0b89920e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b897e0b89ae0b897e0b8a7e0b899e0b983e0b8abe0b8a1e0b98820e0b982e0b894e0b8a2e0b980e0b889e0b89ee0b8b2e0b8b0e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b983e0b899e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b884e0b8a7e0b8b2e0b8a1e0b980e0b89be0b987e0b899e0b881e0b8a5e0b8b2e0b8872028496d7061727469616c6974792920e0b981e0b8a5e0b8b020414220e0b897e0b8b5e0b988e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b881e0b8b2e0b8a3e0b8abe0b8a3e0b8b7e0b8ade0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b981e0b881e0b988e0b8a5e0b8b9e0b881e0b884e0b989e0b8b2e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a3e0b983e0b88ae0b989e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b980e0b894e0b8b5e0b8a2e0b8a7e0b983e0b899e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b983e0b899e0b881e0b8b2e0b8a3e0b895e0b8a3e0b8a7e0b888e0b89be0b8a3e0b8b0e0b980e0b8a1e0b8b4e0b89920e0b8aae0b8b3e0b8abe0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b981e0b881e0b988e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b897e0b8b8e0b881e0b89be0b8a3e0b8b0e0b980e0b8a0e0b8972028436f6e666f726d697479204173736573736d656e7420426f64793a204341422920e0b88be0b8b6e0b988e0b887e0b8a3e0b8b0e0b89ae0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8992049534f2f4945432031373031313a203230303420e0b8a1e0b8b5e0b884e0b8a7e0b8b2e0b8a1e0b88ae0b8b1e0b894e0b980e0b888e0b899e0b881e0b8a3e0b8b0e0b88ae0b8b1e0b89ae0b983e0b899e0b980e0b899e0b8b7e0b989e0b8ade0b8abe0b8b2e0b981e0b8a5e0b8b0e0b984e0b894e0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b899e0b8b3e0b984e0b89be0b983e0b88ae0b9892028696d706c656d656e746174696f6e2920e0b981e0b8a5e0b8b0e0b8a2e0b8ade0b8a1e0b8a3e0b8b1e0b89ae0b983e0b899e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b899e0b8b5e0b989e0b888e0b8b2e0b881e0b8aae0b8a1e0b8b2e0b88ae0b8b4e0b881e0b882e0b8ade0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8aae0b8b2e0b881e0b8a520496e7465726e6174696f6e616c2041636372656469746174696f6e20466f72756d20284941462920e0b981e0b8a5e0b8b020496e7465726e6174696f6e616c204c61626f7261746f72792041636372656469746174696f6e20436f6f7065726174696f6e2028494c41432920e0b981e0b8a5e0b989e0b8a7e0b895e0b8b1e0b989e0b887e0b981e0b895e0b988e0b881e0b988e0b8ade0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988203120e0b8a1e0b881e0b8a3e0b8b2e0b884e0b8a1203235343920e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b8a7e0b8b1e0b899e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b0e0b881e0b8b2e0b8a8e0b983e0b88ae0b989e0b8a3e0b8b0e0b89ae0b89ae0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b8992049534f2f4945432031373031313a203230303420e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b89be0b987e0b899e0b897e0b8b2e0b887e0b881e0b8b2e0b8a33c2f703e0d0a0d0a3c703e266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b881e0b8b2e0b8a3e0b980e0b89be0b987e0b899e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b895e0b8b2e0b8a12049534f2f4945432031373031313a203230303420e0b8a1e0b8b5e0b980e0b899e0b8b7e0b989e0b8ade0b8abe0b8b2e0b982e0b894e0b8a2e0b8a0e0b8b2e0b89ee0b8a3e0b8a7e0b8a1e0b897e0b8b5e0b988e0b899e0b8b3e0b8a1e0b8b2e0b981e0b8a5e0b8b0e0b888e0b8b1e0b894e0b980e0b89be0b987e0b899e0b8abe0b8a1e0b8a7e0b894e0b8abe0b8a1e0b8b9e0b988e0b980e0b89ee0b8b7e0b988e0b8ade0b884e0b8a7e0b8b2e0b8a1e0b980e0b882e0b989e0b8b2e0b983e0b888e0b887e0b988e0b8b2e0b8a220e0b8aae0b8a3e0b8b8e0b89be0b984e0b894e0b989e0b894e0b8b1e0b887e0b899e0b8b5e0b9893c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b8ade0b887e0b884e0b98ce0b881e0b8a33c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b897e0b8b5e0b988e0b981e0b8aae0b894e0b887e0b896e0b8b6e0b887e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b895e0b8b1e0b989e0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8ade0b8a2e0b988e0b8b2e0b887e0b896e0b8b9e0b881e0b895e0b989e0b8ade0b887e0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a23c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b981e0b8a5e0b8b0e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b89920e0b897e0b8b5e0b988e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b881e0b8b2e0b8a3e0b983e0b899e0b8a5e0b8b1e0b881e0b8a9e0b893e0b8b0e0b897e0b8b5e0b988e0b980e0b89be0b987e0b899e0b898e0b8a3e0b8a3e0b8a120e0b984e0b8a1e0b988e0b980e0b8a5e0b8b7e0b8ade0b881e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b420e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b982e0b884e0b8a3e0b887e0b8aae0b8a3e0b989e0b8b2e0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b897e0b8b5e0b988e0b888e0b8b0e0b897e0b8b3e0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b884e0b8a7e0b8b2e0b8a1e0b980e0b88ae0b8b7e0b988e0b8ade0b8a1e0b8b1e0b988e0b899e0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b332e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a3e0b8b1e0b89ae0b89ce0b8b4e0b894e0b88ae0b8ade0b89ae0b983e0b899e0b881e0b8b2e0b8a3e0b895e0b8b1e0b894e0b8aae0b8b4e0b899e0b983e0b888e0b980e0b8a3e0b8b7e0b988e0b8ade0b887e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b88720e0b8a3e0b8b1e0b881e0b8a9e0b8b2e0b8aae0b8a0e0b8b2e0b89e20e0b882e0b8a2e0b8b2e0b8a2e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a220e0b8a5e0b894e0b882e0b8ade0b89ae0b882e0b988e0b8b2e0b8a220e0b89ee0b8b1e0b881e0b983e0b88ae0b989e0b8abe0b8a3e0b8b7e0b8ade0b980e0b89ee0b8b4e0b881e0b896e0b8ade0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b8873c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b342e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b899e0b982e0b8a2e0b89ae0b8b2e0b8a2e0b981e0b8a5e0b8b0e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b899e0b983e0b8abe0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b894e0b8b3e0b980e0b899e0b8b4e0b899e0b887e0b8b2e0b899e0b981e0b8a2e0b881e0b881e0b8b1e0b899e0b8ade0b8a2e0b988e0b8b2e0b887e0b88ae0b8b1e0b894e0b980e0b888e0b899e0b8a3e0b8b0e0b8abe0b8a7e0b988e0b8b2e0b887e0b881e0b8b4e0b888e0b881e0b8a3e0b8a3e0b8a1e0b983e0b8abe0b989e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b881e0b8b1e0b89ae0b881e0b8b4e0b888e0b881e0b8a3e0b8a3e0b8a1e0b8ade0b8b7e0b988e0b899e0b9863c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b352e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b894e0b8b9e0b981e0b8a5e0b8a3e0b8b1e0b881e0b8a9e0b8b2e0b884e0b8a7e0b8b2e0b8a1e0b8a5e0b8b1e0b89ae0b882e0b8ade0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b5e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b8a1e0b8b2e0b8ade0b8a2e0b988e0b8b2e0b887e0b980e0b8abe0b8a1e0b8b2e0b8b0e0b8aae0b8a120e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b984e0b8a1e0b988e0b980e0b89be0b8b4e0b894e0b980e0b89ce0b8a2e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b881e0b8b1e0b89ae0b89ce0b8a5e0b8b4e0b895e0b8a0e0b8b1e0b893e0b891e0b98ce0b8abe0b8a3e0b8b7e0b8ade0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b882e0b8ade0b887e0b89ce0b8b9e0b989e0b882e0b8ade0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b983e0b8abe0b989e0b881e0b8b1e0b89ae0b89ae0b8b8e0b884e0b884e0b8a5e0b897e0b8b5e0b988e0b8aae0b8b2e0b8a120e0b982e0b894e0b8a2e0b984e0b8a1e0b988e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b8a2e0b8b4e0b899e0b8a2e0b8ade0b8a1e0b888e0b8b2e0b881e0b89ce0b8b9e0b989e0b882e0b8ade0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b980e0b89be0b987e0b899e0b8a5e0b8b2e0b8a2e0b8a5e0b8b1e0b881e0b8a9e0b893e0b98ce0b8ade0b8b1e0b881e0b8a9e0b8a320e0b983e0b899e0b881e0b8a3e0b893e0b8b5e0b897e0b8b5e0b988e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a2e0b895e0b989e0b8ade0b887e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b980e0b89be0b8b4e0b894e0b980e0b89ce0b8a2e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b984e0b89be0b8a2e0b8b1e0b887e0b89ae0b8b8e0b884e0b884e0b8a5e0b897e0b8b5e0b988e0b8aae0b8b2e0b8a120e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b981e0b888e0b989e0b887e0b983e0b8abe0b989e0b89ce0b8b9e0b989e0b882e0b8ade0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b897e0b8a3e0b8b2e0b89ae0b896e0b8b6e0b887e0b882e0b989e0b8ade0b8a1e0b8b9e0b8a5e0b897e0b8b5e0b988e0b888e0b8b0e0b980e0b89be0b8b4e0b894e0b980e0b89ce0b8a220e0b881e0b988e0b8ade0b899e0b897e0b8b5e0b988e0b888e0b8b0e0b980e0b89be0b8b4e0b894e0b980e0b89ce0b8a2e0b895e0b8b2e0b8a1e0b881e0b88ee0b8abe0b8a1e0b8b2e0b8a23c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b362e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b984e0b8a7e0b989e0b980e0b89be0b987e0b899e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b983e0b899e0b884e0b8b9e0b988e0b8a1e0b8b7e0b8ade0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b981e0b8a5e0b8b0e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b899e0b897e0b8b5e0b988e0b980e0b881e0b8b5e0b988e0b8a2e0b8a7e0b882e0b989e0b8ade0b8873c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b372e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b980e0b89be0b987e0b899e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b981e0b8a5e0b8b0e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b983e0b899e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b980e0b8abe0b8a5e0b988e0b8b2e0b899e0b8b5e0b989e0b895e0b989e0b8ade0b887e0b888e0b8b1e0b894e0b980e0b895e0b8a3e0b8b5e0b8a2e0b8a1e0b983e0b8abe0b989e0b89ee0b899e0b8b1e0b881e0b887e0b8b2e0b899e0b983e0b899e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b8a1e0b8b5e0b984e0b8a7e0b989e0b983e0b88ae0b989e0b8ade0b989e0b8b2e0b887e0b8ade0b8b4e0b88720e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b1e0b988e0b899e0b983e0b888e0b8a7e0b988e0b8b2e0b984e0b894e0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b899e0b8b3e0b980e0b8ade0b881e0b8aae0b8b2e0b8a3e0b983e0b899e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89e20e0b980e0b88ae0b988e0b89920e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b887e0b8b2e0b899202870726f6365647572652920e0b8a7e0b8b4e0b898e0b8b5e0b881e0b8b2e0b8a3e0b897e0b8b3e0b887e0b8b2e0b8992028776f726b20696e737472756374696f6e2920e0b984e0b894e0b989e0b899e0b8b3e0b984e0b89be0b983e0b88ae0b989e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b8ade0b8a2e0b988e0b8b2e0b887e0b8a1e0b8b5e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b8a0e0b8b2e0b89e3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b382e20e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b981e0b895e0b988e0b887e0b895e0b8b1e0b989e0b887e0b89ae0b8b8e0b884e0b884e0b8a5e0b897e0b8b5e0b988e0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b982e0b894e0b8a2e0b895e0b8a3e0b887e0b881e0b8b1e0b89ae0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b8aae0b8b9e0b887e0b8aae0b8b8e0b894e0b882e0b8ade0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a320e0b981e0b8a5e0b8b0e0b895e0b989e0b8ade0b887e0b980e0b89be0b987e0b899e0b89ce0b8b9e0b989e0b897e0b8b5e0b988e0b984e0b8a1e0b988e0b884e0b8b3e0b899e0b8b6e0b887e0b896e0b8b6e0b887e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b884e0b8a7e0b8b2e0b8a1e0b8a3e0b8b1e0b89ae0b89ce0b8b4e0b894e0b88ae0b8ade0b89ae0b8ade0b8b7e0b988e0b899e0b98620e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b895e0b989e0b8ade0b887e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b881e0b8b3e0b8abe0b899e0b894e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b882e0b8ade0b887e0b895e0b8b1e0b8a7e0b981e0b897e0b899e0b882e0b8ade0b887e0b89de0b988e0b8b2e0b8a2e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b984e0b8a7e0b989e0b8ade0b8a2e0b988e0b8b2e0b887e0b88ae0b8b1e0b894e0b980e0b888e0b899e0b982e0b894e0b8a2e0b881e0b8b3e0b8abe0b899e0b894e0b983e0b8abe0b989e0b8a1e0b8b5e0b8abe0b899e0b989e0b8b2e0b897e0b8b5e0b988e0b897e0b8b5e0b988e0b888e0b8b0e0b897e0b8b3e0b983e0b8abe0b989e0b8a1e0b8b1e0b988e0b899e0b983e0b888e0b8a7e0b988e0b8b2e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b984e0b894e0b989e0b8a1e0b8b5e0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b8aae0b8a3e0b989e0b8b2e0b88720e0b899e0b8b3e0b984e0b89be0b983e0b88ae0b989e0b89be0b88fe0b8b4e0b89ae0b8b1e0b895e0b8b4e0b981e0b8a5e0b8b0e0b8a3e0b8b1e0b881e0b8a9e0b8b2e0b984e0b8a7e0b989e0b983e0b8abe0b989e0b8aae0b8ade0b894e0b884e0b8a5e0b989e0b8ade0b887e0b881e0b8b1e0b89ae0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8ade0b887e0b8a1e0b8b2e0b895e0b8a3e0b890e0b8b2e0b899e0b899e0b8b5e0b98920e0b981e0b8a5e0b8b0e0b895e0b989e0b8ade0b887e0b8a3e0b8b2e0b8a2e0b887e0b8b2e0b899e0b89be0b8a3e0b8b0e0b8aae0b8b4e0b897e0b898e0b8b4e0b8a0e0b8b2e0b89ee0b882e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b983e0b8abe0b989e0b89ce0b8b9e0b989e0b89ae0b8a3e0b8b4e0b8abe0b8b2e0b8a3e0b882e0b8ade0b887e0b8ade0b887e0b884e0b98ce0b881e0b8a3e0b984e0b894e0b989e0b8a3e0b8b1e0b89ae0b897e0b8a3e0b8b2e0b89a20e0b980e0b89ee0b8b7e0b988e0b8ade0b897e0b89ae0b897e0b8a7e0b899e0b8a3e0b8b0e0b89ae0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b983e0b8abe0b989e0b980e0b881e0b8b4e0b894e0b881e0b8b2e0b8a3e0b89be0b8a3e0b8b1e0b89ae0b89be0b8a3e0b8b8e0b887e0b8ade0b8a2e0b988e0b8b2e0b887e0b895e0b988e0b8ade0b980e0b899e0b8b7e0b988e0b8ade0b8873c2f703e0d0a, '', 'Y'),
(24, '', 85, 'การรับรองระบบงาน', '', '2018-10-21 21:58:37', '2018-10-21 22:01:08', 0x3c7020636c6173733d22696d6167652d616c69676e2d63656e746572223e3c696d6720616c743d2222206865696768743d2233393622207372633d222f636b66696e6465722f7573657266696c65732f696d616765732f53637265656e25323053686f74253230323536312d31302d3231253230617425323032315f35375f32312e706e67222077696474683d2238303022202f3e3c2f703e0d0a, '', 'Y');
INSERT INTO `Pages` (`id`, `page_type`, `menu_id`, `title_th`, `title_en`, `create_date`, `update_date`, `contents`, `contents_en`, `actives`) VALUES
(25, '', 78, 'การร้องเรียน', '', '2018-10-21 21:58:37', '2018-10-23 21:53:36', 0x3c703e266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703b20266e6273703be0b881e0b8b2e0b8a3e0b888e0b8b1e0b894e0b897e0b8b3e0b882e0b989e0b8ade0b895e0b881e0b8a5e0b887e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3202853657276696365204c6576656c2041677265656d656e74203a20534c412920e0b983e0b899e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b89920e0b8a1e0b8b5e0b8a7e0b8b1e0b895e0b896e0b8b8e0b89be0b8a3e0b8b0e0b8aae0b887e0b884e0b98ce0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b89ee0b8b4e0b988e0b8a1e0b88ae0b988e0b8ade0b887e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b8a3e0b989e0b8ade0b887e0b980e0b8a3e0b8b5e0b8a2e0b89920e0b881e0b8b2e0b8a3e0b8ade0b8b8e0b897e0b898e0b8a3e0b893e0b98ce0b983e0b8abe0b989e0b981e0b881e0b988e0b89ce0b8b9e0b989e0b8a3e0b8b1e0b89ae0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a320e0b884e0b8b7e0b8ad20e0b8abe0b899e0b988e0b8a7e0b8a2e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b88720e0b8abe0b899e0b988e0b8a7e0b8a2e0b895e0b8a3e0b8a7e0b88820e0b981e0b8a5e0b8b0e0b89ce0b8b9e0b989e0b8a1e0b8b5e0b8aae0b988e0b8a7e0b899e0b984e0b894e0b989e0b8aae0b988e0b8a7e0b899e0b980e0b8aae0b8b5e0b8a220e0b88be0b8b6e0b988e0b887e0b980e0b89be0b987e0b899e0b881e0b8b2e0b8a3e0b8aae0b8a3e0b989e0b8b2e0b887e0b88ae0b988e0b8ade0b887e0b897e0b8b2e0b887e0b881e0b8b2e0b8a3e0b980e0b882e0b989e0b8b2e0b896e0b8b6e0b887e0b981e0b8a5e0b8b0e0b8aae0b8a3e0b989e0b8b2e0b887e0b884e0b8a7e0b8b2e0b8a1e0b982e0b89be0b8a3e0b988e0b887e0b983e0b8aae0b983e0b899e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703be0b982e0b894e0b8a220e0b8a1e0b881e0b8ade0b88a2e20e0b984e0b894e0b989e0b888e0b8b1e0b894e0b897e0b8b320534c4120e0b882e0b8b6e0b989e0b899e0b980e0b89ee0b8b7e0b988e0b8ade0b980e0b89be0b987e0b899e0b882e0b989e0b8ade0b881e0b8b3e0b8abe0b899e0b894e0b882e0b8ade0b887e0b881e0b8b2e0b8a3e0b983e0b8abe0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b881e0b8b2e0b8a3e0b8a3e0b989e0b8ade0b887e0b980e0b8a3e0b8b5e0b8a2e0b89920e0b881e0b8b2e0b8a3e0b8ade0b8b8e0b897e0b898e0b8a3e0b893e0b98c20e0b981e0b8a5e0b8b0e0b895e0b8b4e0b88ae0b8a1e0b881e0b8b2e0b8a3e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b8a3e0b8b1e0b89ae0b8a3e0b8ade0b887e0b8a3e0b8b0e0b89ae0b89ae0b887e0b8b2e0b899e0b89be0b8a3e0b8b0e0b881e0b8ade0b89ae0b894e0b989e0b8a7e0b8a22028312920e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b8a3e0b989e0b8ade0b887e0b980e0b8a3e0b8b5e0b8a2e0b8992fe0b8ade0b8b8e0b897e0b898e0b8a3e0b893e0b98c20e0b981e0b8a5e0b8b0e0b895e0b8b4e0b88ae0b8a120e0b981e0b8a5e0b8b02028322920e0b882e0b989e0b8ade0b895e0b881e0b8a5e0b887e0b896e0b8b6e0b887e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b882e0b8ade0b887e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b897e0b8b5e0b98820e0b8a1e0b881e0b8ade0b88a2e20e0b8a1e0b8b5e0b983e0b8abe0b989e0b981e0b881e0b988e0b89ce0b8b9e0b989e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b312e20e0b882e0b8b1e0b989e0b899e0b895e0b8ade0b899e0b881e0b8b2e0b8a3e0b8a3e0b989e0b8ade0b887e0b980e0b8a3e0b8b5e0b8a2e0b8992fe0b8ade0b8b8e0b897e0b898e0b8a3e0b893e0b98c20e0b981e0b8a5e0b8b0e0b895e0b8b4e0b88ae0b8a1266e6273703b3c6272202f3e0d0a266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b266e6273703b322e20e0b882e0b989e0b8ade0b895e0b881e0b8a5e0b887e0b896e0b8b6e0b887e0b8a3e0b8b0e0b894e0b8b1e0b89ae0b884e0b8b8e0b893e0b8a0e0b8b2e0b89ee0b882e0b8ade0b887e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3e0b897e0b8b5e0b98820e0b8a1e0b881e0b8ade0b88a2e20e0b8a1e0b8b5e0b983e0b8abe0b989e0b981e0b881e0b988e0b89ce0b8b9e0b989e0b983e0b88ae0b989e0b89ae0b8a3e0b8b4e0b881e0b8b2e0b8a3266e6273703b3c2f703e0d0a, '', 'Y'),
(26, '', 175, 'asdkjh', 'kjhkjh', '2018-11-25 20:49:58', '2018-11-25 20:49:58', 0x3c703e6b6a683c2f703e0d0a, 0x3c703e6b6a686b6a683c2f703e0d0a, 'Y'),
(27, '', 176, 'askdhj', 'kjhasdf', '2018-11-25 20:52:43', '2018-11-25 20:52:43', 0x3c703e6b736a6864663c2f703e0d0a, 0x3c703e6b6a68647361663c2f703e0d0a, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `Palaces`
--

CREATE TABLE `Palaces` (
  `id` int(11) NOT NULL,
  `prefix_name_th` varchar(20) DEFAULT NULL,
  `prefix_name_en` varchar(30) DEFAULT NULL,
  `firstname_th` varchar(70) NOT NULL,
  `firstname_en` varchar(70) NOT NULL,
  `lastname_th` varchar(70) NOT NULL,
  `lastname_en` varchar(70) NOT NULL,
  `position_th` varchar(70) NOT NULL,
  `position_en` varchar(70) DEFAULT NULL,
  `position_start_date` date NOT NULL,
  `position_end_date` date DEFAULT NULL,
  `picture_name` varchar(150) DEFAULT NULL,
  `picture_path` varchar(512) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `palace_type` enum('current-board','current-cio','current-consult','current-specialist','history-secretary','history-deputy-secretary','history-cio','history-consult','history-specialist') NOT NULL,
  `mission_th` varchar(255) DEFAULT NULL,
  `mission_en` varchar(255) DEFAULT NULL,
  `vision_th` varchar(255) DEFAULT NULL,
  `vision_en` varchar(255) DEFAULT NULL,
  `contact_th` varchar(255) DEFAULT NULL,
  `contact_en` varchar(255) DEFAULT NULL,
  `role_th` varchar(255) DEFAULT NULL,
  `role_en` varchar(255) DEFAULT NULL,
  `order_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Palaces`
--

INSERT INTO `Palaces` (`id`, `prefix_name_th`, `prefix_name_en`, `firstname_th`, `firstname_en`, `lastname_th`, `lastname_en`, `position_th`, `position_en`, `position_start_date`, `position_end_date`, `picture_name`, `picture_path`, `create_date`, `update_date`, `palace_type`, `mission_th`, `mission_en`, `vision_th`, `vision_en`, `contact_th`, `contact_en`, `role_th`, `role_en`, `order_no`) VALUES
(1, 'asd', 'kjh', 'นายพิศาล พงศาพิชณ์', '', 'hk', 'jhkj', 'เลขาธิการ มกอช.', 'เลขาธิการ มกอช.', '2018-10-01', NULL, 'Screen Shot 2561-10-17 at 23.42.45.png', 'files/img/palace/20181017184327_899623.png', '0000-00-00 00:00:00', '2018-10-17 18:43:27', 'current-board', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 0),
(2, 'null', 'null', 'นางสาวจูอะดี พงศ์มณีรัตน์', '', '', '', 'รองเลขาธิการ มกอช.', 'รองเลขาธิการ มกอช.', '2018-10-01', NULL, 'Screen Shot 2561-10-17 at 23.42.38.png', 'files/img/palace/20181017184318_123813.png', '0000-00-00 00:00:00', '2018-10-17 18:43:18', 'current-board', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 0),
(3, 'null', 'null', 'CIO CIO', 'CIO CIO', '', '', 'CIO', 'CIO', '2018-10-01', NULL, 'Screen Shot 2561-10-17 at 23.42.38.png', 'files/img/palace/20181017185031_878298.png', '0000-00-00 00:00:00', '2018-10-17 18:51:01', 'current-cio', '', '', '', '', '', '', '', '', 0),
(4, NULL, NULL, 'นางสาวจูอะดี พงศ์มณีรัตน์', '', '', '', 'เลขาธิการสำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติ', '', '2018-10-01', NULL, 'Screen Shot 2561-10-17 at 23.42.38.png', 'files/img/palace/20181017185254_355827.png', '0000-00-00 00:00:00', '2018-10-17 18:52:54', 'history-secretary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Product_Code`
--

CREATE TABLE `Product_Code` (
  `id` int(11) NOT NULL,
  `product_th` varchar(255) NOT NULL,
  `product_en` varchar(255) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `product_type` enum('ปศุสัตว์','พืช','สัตว์น้ำ','ประมง') NOT NULL,
  `product_subtype` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Product_Code`
--

INSERT INTO `Product_Code` (`id`, `product_th`, `product_en`, `code`, `product_type`, `product_subtype`, `create_date`, `update_date`) VALUES
(1, 'ฟหกา่ฟ้หก', 'kajshdkjashd', '0019283', 'ปศุสัตว์', 'aksjdajksd', '2018-11-20 09:27:33', '2018-11-20 09:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `Province`
--

CREATE TABLE `Province` (
  `ProvinceID` int(11) NOT NULL,
  `ProvinceName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Province`
--

INSERT INTO `Province` (`ProvinceID`, `ProvinceName`) VALUES
(1, 'กรุงเทพมหานคร'),
(2, 'สมุทรปราการ'),
(3, 'นนทบุรี'),
(4, 'ปทุมธานี'),
(5, 'พระนครศรีอยุธยา'),
(6, 'อ่างทอง'),
(7, 'ลพบุรี'),
(8, 'สิงห์บุรี'),
(9, 'ชัยนาท'),
(10, 'สระบุรี'),
(11, 'ชลบุรี'),
(12, 'ระยอง'),
(13, 'จันทบุรี'),
(14, 'ตราด'),
(15, 'ฉะเชิงเทรา'),
(16, 'ปราจีนบุรี'),
(17, 'นครนายก'),
(18, 'สระแก้ว'),
(19, 'นครราชสีมา'),
(20, 'บุรีรัมย์'),
(21, 'สุรินทร์'),
(22, 'ศรีสะเกษ'),
(23, 'อุบลราชธานี'),
(24, 'ยโสธร'),
(25, 'ชัยภูมิ'),
(26, 'อำนาจเจริญ'),
(27, 'หนองบัวลำภู'),
(28, 'ขอนแก่น'),
(29, 'อุดรธานี'),
(30, 'เลย'),
(31, 'หนองคาย'),
(32, 'มหาสารคาม'),
(33, 'ร้อยเอ็ด'),
(34, 'กาฬสินธุ์'),
(35, 'สกลนคร'),
(36, 'นครพนม'),
(37, 'มุกดาหาร'),
(38, 'บึงกาฬ'),
(39, 'เชียงใหม่'),
(40, 'ลำพูน'),
(41, 'ลำปาง'),
(42, 'อุตรดิตถ์'),
(43, 'แพร่'),
(44, 'น่าน'),
(45, 'พะเยา'),
(46, 'เชียงราย'),
(47, 'แม่ฮ่องสอน'),
(48, 'นครสวรรค์'),
(49, 'อุทัยธานี'),
(50, 'กำแพงเพชร'),
(51, 'ตาก'),
(52, 'สุโขทัย'),
(53, 'พิษณุโลก'),
(54, 'พิจิตร'),
(55, 'เพชรบูรณ์'),
(56, 'ราชบุรี'),
(57, 'กาญจนบุรี'),
(58, 'สุพรรณบุรี'),
(59, 'นครปฐม'),
(60, 'สมุทรสาคร'),
(61, 'สมุทรสงคราม'),
(62, 'เพชรบุรี'),
(63, 'ประจวบคีรีขันธ์'),
(64, 'นครศรีธรรมราช'),
(65, 'กระบี่'),
(66, 'พังงา'),
(67, 'ภูเก็ต'),
(68, 'สุราษฎร์ธานี'),
(69, 'ระนอง'),
(70, 'ชุมพร'),
(71, 'สงขลา'),
(72, 'สตูล'),
(73, 'ตรัง'),
(74, 'พัทลุง'),
(75, 'ปัตตานี'),
(76, 'ยะลา'),
(77, 'นราธิวาส');

-- --------------------------------------------------------

--
-- Table structure for table `Provinces`
--

CREATE TABLE `Provinces` (
  `id` int(5) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name_th` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `geography_id` int(5) NOT NULL DEFAULT '0',
  `geography_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Provinces`
--

INSERT INTO `Provinces` (`id`, `code`, `name_th`, `name_en`, `geography_id`, `geography_name`) VALUES
(1, '10', 'กรุงเทพมหานคร', 'Bangkok', 2, 'ภาคกลาง'),
(2, '11', 'สมุทรปราการ', 'Samut Prakan', 2, 'ภาคกลาง'),
(3, '12', 'นนทบุรี', 'Nonthaburi', 2, 'ภาคกลาง'),
(4, '13', 'ปทุมธานี', 'Pathum Thani', 2, 'ภาคกลาง'),
(5, '14', 'พระนครศรีอยุธยา', 'Phra Nakhon Si Ayutthaya', 2, 'ภาคกลาง'),
(6, '15', 'อ่างทอง', 'Ang Thong', 2, 'ภาคกลาง'),
(7, '16', 'ลพบุรี', 'Loburi', 2, 'ภาคกลาง'),
(8, '17', 'สิงห์บุรี', 'Sing Buri', 2, 'ภาคกลาง'),
(9, '18', 'ชัยนาท', 'Chai Nat', 2, 'ภาคกลาง'),
(10, '19', 'สระบุรี', 'Saraburi', 2, 'ภาคกลาง'),
(11, '20', 'ชลบุรี', 'Chon Buri', 5, 'ภาคตะวันออก'),
(12, '21', 'ระยอง', 'Rayong', 5, 'ภาคตะวันออก'),
(13, '22', 'จันทบุรี', 'Chanthaburi', 5, 'ภาคตะวันออก'),
(14, '23', 'ตราด', 'Trat', 5, 'ภาคตะวันออก'),
(15, '24', 'ฉะเชิงเทรา', 'Chachoengsao', 5, 'ภาคตะวันออก'),
(16, '25', 'ปราจีนบุรี', 'Prachin Buri', 5, 'ภาคตะวันออก'),
(17, '26', 'นครนายก', 'Nakhon Nayok', 2, 'ภาคกลาง'),
(18, '27', 'สระแก้ว', 'Sa Kaeo', 5, 'ภาคตะวันออก'),
(19, '30', 'นครราชสีมา', 'Nakhon Ratchasima', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(20, '31', 'บุรีรัมย์', 'Buri Ram', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(21, '32', 'สุรินทร์', 'Surin', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(22, '33', 'ศรีสะเกษ', 'Si Sa Ket', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(23, '34', 'อุบลราชธานี', 'Ubon Ratchathani', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(24, '35', 'ยโสธร', 'Yasothon', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(25, '36', 'ชัยภูมิ', 'Chaiyaphum', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(26, '37', 'อำนาจเจริญ', 'Amnat Charoen', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(27, '39', 'หนองบัวลำภู', 'Nong Bua Lam Phu', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(28, '40', 'ขอนแก่น', 'Khon Kaen', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(29, '41', 'อุดรธานี', 'Udon Thani', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(30, '42', 'เลย', 'Loei', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(31, '43', 'หนองคาย', 'Nong Khai', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(32, '44', 'มหาสารคาม', 'Maha Sarakham', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(33, '45', 'ร้อยเอ็ด', 'Roi Et', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(34, '46', 'กาฬสินธุ์', 'Kalasin', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(35, '47', 'สกลนคร', 'Sakon Nakhon', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(36, '48', 'นครพนม', 'Nakhon Phanom', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(37, '49', 'มุกดาหาร', 'Mukdahan', 3, 'ภาคตะวันออกเฉียงเหนือ'),
(38, '50', 'เชียงใหม่', 'Chiang Mai', 1, 'ภาคเหนือ'),
(39, '51', 'ลำพูน', 'Lamphun', 1, 'ภาคเหนือ'),
(40, '52', 'ลำปาง', 'Lampang', 1, 'ภาคเหนือ'),
(41, '53', 'อุตรดิตถ์', 'Uttaradit', 1, 'ภาคเหนือ'),
(42, '54', 'แพร่', 'Phrae', 1, 'ภาคเหนือ'),
(43, '55', 'น่าน', 'Nan', 1, 'ภาคเหนือ'),
(44, '56', 'พะเยา', 'Phayao', 1, 'ภาคเหนือ'),
(45, '57', 'เชียงราย', 'Chiang Rai', 1, 'ภาคเหนือ'),
(46, '58', 'แม่ฮ่องสอน', 'Mae Hong Son', 1, 'ภาคเหนือ'),
(47, '60', 'นครสวรรค์', 'Nakhon Sawan', 2, 'ภาคกลาง'),
(48, '61', 'อุทัยธานี', 'Uthai Thani', 2, 'ภาคกลาง'),
(49, '62', 'กำแพงเพชร', 'Kamphaeng Phet', 2, 'ภาคกลาง'),
(50, '63', 'ตาก', 'Tak', 4, 'ภาคตะวันตก'),
(51, '64', 'สุโขทัย', 'Sukhothai', 2, 'ภาคกลาง'),
(52, '65', 'พิษณุโลก', 'Phitsanulok', 2, 'ภาคกลาง'),
(53, '66', 'พิจิตร', 'Phichit', 2, 'ภาคกลาง'),
(54, '67', 'เพชรบูรณ์', 'Phetchabun', 2, 'ภาคกลาง'),
(55, '70', 'ราชบุรี', 'Ratchaburi', 4, 'ภาคตะวันตก'),
(56, '71', 'กาญจนบุรี', 'Kanchanaburi', 4, 'ภาคตะวันตก'),
(57, '72', 'สุพรรณบุรี', 'Suphan Buri', 2, 'ภาคกลาง'),
(58, '73', 'นครปฐม', 'Nakhon Pathom', 2, 'ภาคกลาง'),
(59, '74', 'สมุทรสาคร', 'Samut Sakhon', 2, 'ภาคกลาง'),
(60, '75', 'สมุทรสงคราม', 'Samut Songkhram', 2, 'ภาคกลาง'),
(61, '76', 'เพชรบุรี', 'Phetchaburi', 4, 'ภาคตะวันตก'),
(62, '77', 'ประจวบคีรีขันธ์', 'Prachuap Khiri Khan', 4, 'ภาคตะวันตก'),
(63, '80', 'นครศรีธรรมราช', 'Nakhon Si Thammarat', 6, 'ภาคใต้'),
(64, '81', 'กระบี่', 'Krabi', 6, 'ภาคใต้'),
(65, '82', 'พังงา', 'Phangnga', 6, 'ภาคใต้'),
(66, '83', 'ภูเก็ต', 'Phuket', 6, 'ภาคใต้'),
(67, '84', 'สุราษฎร์ธานี', 'Surat Thani', 6, 'ภาคใต้'),
(68, '85', 'ระนอง', 'Ranong', 6, 'ภาคใต้'),
(69, '86', 'ชุมพร', 'Chumphon', 6, 'ภาคใต้'),
(70, '90', 'สงขลา', 'Songkhla', 6, 'ภาคใต้'),
(71, '91', 'สตูล', 'Satun', 6, 'ภาคใต้'),
(72, '92', 'ตรัง', 'Trang', 6, 'ภาคใต้'),
(73, '93', 'พัทลุง', 'Phatthalung', 6, 'ภาคใต้'),
(74, '94', 'ปัตตานี', 'Pattani', 6, 'ภาคใต้'),
(75, '95', 'ยะลา', 'Yala', 6, 'ภาคใต้'),
(76, '96', 'นราธิวาส', 'Narathiwat', 6, 'ภาคใต้'),
(77, '97', 'บึงกาฬ', 'buogkan', 3, 'ภาคตะวันออกเฉียงเหนือ');

-- --------------------------------------------------------

--
-- Table structure for table `Purchase`
--

CREATE TABLE `Purchase` (
  `id` int(11) NOT NULL,
  `page_type` varchar(50) NOT NULL,
  `org_th` varchar(255) NOT NULL,
  `org_en` varchar(255) DEFAULT NULL,
  `office_th` varchar(255) NOT NULL,
  `office_en` varchar(255) DEFAULT NULL,
  `project_th` varchar(512) NOT NULL,
  `project_en` varchar(512) DEFAULT NULL,
  `item_no` varchar(50) DEFAULT NULL,
  `project_no` varchar(50) DEFAULT NULL,
  `change_desc_th` varchar(255) DEFAULT NULL,
  `change_desc_en` varchar(255) DEFAULT NULL,
  `auction_place_th` varchar(255) DEFAULT NULL,
  `auction_place_en` varchar(255) DEFAULT NULL,
  `winning_name_th` varchar(255) DEFAULT NULL,
  `winning_name_en` varchar(255) DEFAULT NULL,
  `winning_reason_th` varchar(255) DEFAULT NULL,
  `winning_reason_en` varchar(255) DEFAULT NULL,
  `budget_limit` decimal(16,2) NOT NULL,
  `main_price` decimal(16,2) DEFAULT NULL,
  `estimate_date` date NOT NULL,
  `release_date` date NOT NULL,
  `echo_status` char(1) DEFAULT 'Y',
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `create_by` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Purchase`
--

INSERT INTO `Purchase` (`id`, `page_type`, `org_th`, `org_en`, `office_th`, `office_en`, `project_th`, `project_en`, `item_no`, `project_no`, `change_desc_th`, `change_desc_en`, `auction_place_th`, `auction_place_en`, `winning_name_th`, `winning_name_en`, `winning_reason_th`, `winning_reason_en`, `budget_limit`, `main_price`, `estimate_date`, `release_date`, `echo_status`, `actives`, `create_by`, `update_by`, `create_date`, `update_date`) VALUES
(2, 'purchase-plan', 'askjhagsd', 'hjagsdj', 'jgasdj', 'null', 'gjasgdj', 'jagsd', 'jaggedjahsgd', 'jahsgd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000.00', '2000.00', '2018-11-03', '2018-11-03', 'Y', 'Y', 1093840, 1093840, '2018-11-03 09:21:02', '2018-11-03 09:21:55'),
(3, 'standard-price', 'ฟหกส่', 'asdjl', 'สฟาห่ก', 'lads', 'ฟหาก้', 'aksjdnkj', '0101293', '1010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000.00', '1000.00', '2018-11-03', '2018-12-06', 'Y', 'Y', 1093840, 1093840, '2018-11-03 09:30:15', '2018-11-03 09:30:15'),
(4, 'draft-document', 'ฆาก่ฟ้หกา', 'าฟ้ห่ก้', 'า่ฟ้หก่้', 'า้ฟหา่ก้', 'า้ฟาห่้กา้', 'า้าฟห่้กา', 'าา่ฟหก้', '้าฟห่้กา', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1000.00', '20000.00', '2018-11-01', '2018-11-30', 'Y', 'Y', 1093840, 1093840, '2018-11-03 09:34:18', '2018-11-03 09:34:18'),
(5, 'e-bidding', 'asdkjh', 'kjhaskjdh', 'khasdjkh', 'jhkhkjh', 'jkhk', 'hkjh', 'jhkj', 'kjhkj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10000.00', '20000.00', '2018-11-03', '2018-12-08', 'Y', 'Y', 1093840, 1093840, '2018-11-03 09:59:01', '2018-11-03 09:59:01'),
(6, 'selected-work', 'asdkjh', 'jhkajhsdkjh', 'khajsdhk', 'kjhaksdhk', 'jhkajshdjk', 'kjhaskdjhk', 'hkjahsdjkh', 'jhkashdkjh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000.00', '2000.00', '0000-00-00', '0000-00-00', 'Y', 'Y', 1093840, 1093840, '2018-11-03 10:02:11', '2018-11-03 10:02:11'),
(7, 'changing-work', 'askdjh', 'kjh', 'kjh', 'kh', 'jhk', 'kjh', 'jkjh', 'kjh', 'asdasd kasd', 'kajsdkj asdkj', NULL, NULL, NULL, NULL, NULL, NULL, '10000.00', '10000.00', '2018-11-03', '1900-12-31', 'Y', 'Y', 1093840, 1093840, '2018-11-03 10:11:46', '2018-11-03 10:12:23'),
(8, 'auction', 'asdasd', 'ljlk', 'asdlkj', 'jlk', 'jlkj', 'lkj', 'lk', 'and', 'null', 'null', 'asdjk', 'hkj', NULL, NULL, NULL, NULL, '0.00', '0.00', '2018-11-03', '2018-12-07', 'Y', 'Y', 1093840, 1093840, '2018-11-03 10:20:51', '2018-11-03 10:21:52'),
(9, 'echo-work', 'iajsdhjk', 'jhgasdj', 'kjashdhg', 'jhagsd', 'jagsdjhg', 'gjhagsdhjg', 'jhgajsdgjh', 'jhgasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '2018-11-15', '0000-00-00', 'Y', 'Y', 1093840, 1093840, '2018-11-03 10:27:01', '2018-11-03 10:27:01'),
(10, 'e-market', 'asd', 'kjh', 'kjhkjh', 'kjhk', 'jhkjh', 'kjh', 'kjh', 'khkjh', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, '10000.00', '20000.00', '2018-11-04', '2018-12-08', 'N', 'Y', 1093840, 1093840, '2018-11-04 10:00:10', '2018-11-04 10:30:07'),
(11, 'specification-method', 'lasdkjl', 'kjalsdj', 'lkjalsdl', 'l', 'kjasd', 'lkajsdl', 'lasdj', 'lkjasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1000.00', '2000.00', '0000-00-00', '0000-00-00', 'Y', 'Y', 1093840, 1093840, '2018-11-04 10:03:28', '2018-11-04 10:03:28'),
(12, 'invite', 'asd', 'khkjkh', 'khkhkashdkjh', 'jkhk', 'jhkjh', 'kjhkjh', 'kjh', 'kjhkhj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1000.00', '300.00', '2018-11-04', '2018-11-30', 'Y', 'Y', 1093840, 1093840, '2018-11-04 10:06:14', '2018-11-04 10:06:14'),
(13, 'selected-work-normal', 'sdkfjh', 'hkjehf', 'ksdjfhk', 'kjhsdfkh', 'kjhdsfkj', 'kjhsdkj', 'hkjhsdf', 'kjsdf', 'null', 'null', 'null', 'null', NULL, NULL, NULL, NULL, '1000.00', '2000.00', '1900-12-31', '1900-12-31', 'N', 'Y', 1093840, 1093840, '2018-11-04 10:14:44', '2018-11-04 10:29:46'),
(14, 'winning', 'ฟหกส่', 'asdjl', 'สฟาห่ก', 'lads', 'ฟหาก้', 'aksjdnkj', '0101293', '1010', '', '', '', '', 'asdasd', 'lkasjd', 'asdljk', 'lkjasdlkj', '2000.00', '1800.00', '2018-11-04', '1900-12-31', 'Y', 'Y', 1093840, 1093840, '2018-11-04 11:30:28', '2018-11-04 11:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `Questionnaires`
--

CREATE TABLE `Questionnaires` (
  `questionnaireID` int(11) NOT NULL,
  `standardID` int(11) NOT NULL,
  `questionName` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(512) DEFAULT NULL,
  `questionnaireType` enum('normal','online') NOT NULL,
  `questionnaireSubType` enum('committee','standard') NOT NULL,
  `subcommitteeID` int(11) DEFAULT NULL,
  `openDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Questionnaires`
--

INSERT INTO `Questionnaires` (`questionnaireID`, `standardID`, `questionName`, `fileName`, `filePath`, `questionnaireType`, `questionnaireSubType`, `subcommitteeID`, `openDate`, `closeDate`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(2, 5, 'แบบสอบถามร่างมาตรฐาน', '285193.jpg', 'files/files/question/20180824123244_242457.jpg', 'normal', 'standard', 0, '2018-08-24', '2018-08-31', '1093840', '2018-08-24 12:32:44', '1093840', '2018-10-07 11:32:18'),
(5, 0, 'อนุ 2', '', 'gg.com', 'online', 'committee', 5, '0000-00-00', '0000-00-00', '1093840', '2018-08-24 13:10:17', '1093840', '2018-08-24 13:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `Questionnaire_Person`
--

CREATE TABLE `Questionnaire_Person` (
  `questionnairePersonID` int(11) NOT NULL,
  `questionaireID` int(11) NOT NULL,
  `stakeholderID` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Questionnaire_Person`
--

INSERT INTO `Questionnaire_Person` (`questionnairePersonID`, `questionaireID`, `stakeholderID`) VALUES
(1, 1, '4023144'),
(2, 1, '9810021'),
(3, 1, '9810022'),
(4, 5, '4023144');

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `questionID` int(11) NOT NULL,
  `questionaireID` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Questions`
--

INSERT INTO `Questions` (`questionID`, `questionaireID`, `question`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
(1, 1, 'asdasd', '1093840', '2018-08-24 12:22:22', '1093840', '2018-08-24 12:44:30'),
(2, 1, 'asdasd', '1093840', '2018-08-24 12:23:02', '1093840', '2018-08-24 12:44:30'),
(3, 1, 'AS', '1093840', '2018-08-24 12:23:02', '1093840', '2018-08-24 12:44:30'),
(4, 1, 'addsasd asd', '1093840', '2018-08-24 12:23:02', '1093840', '2018-08-24 12:44:30'),
(6, 2, 'and', '1093840', '2018-08-24 12:32:44', '1093840', '2018-10-07 11:32:18'),
(7, 2, 'ASD', '1093840', '2018-08-24 12:32:44', '1093840', '2018-10-07 11:32:18'),
(8, 1, 'ฟหกฟหก', '1093840', '2018-08-24 12:44:30', '1093840', '2018-08-24 12:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `Question_Answer`
--

CREATE TABLE `Question_Answer` (
  `id` int(11) NOT NULL,
  `question_by` varchar(150) NOT NULL,
  `question_email` varchar(70) NOT NULL,
  `question_tel` varchar(20) NOT NULL,
  `question_desc` varchar(512) NOT NULL,
  `question_date` datetime NOT NULL,
  `answer_date` datetime DEFAULT NULL,
  `answer_desc` text,
  `answer_by` varchar(150) NOT NULL,
  `question_status` enum('pending','completed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Question_Answer`
--

INSERT INTO `Question_Answer` (`id`, `question_by`, `question_email`, `question_tel`, `question_desc`, `question_date`, `answer_date`, `answer_desc`, `answer_by`, `question_status`) VALUES
(1, 'askdjh', 'kasjdh', '01239809', 'aksjdhasd\r\nasdasd', '0000-00-00 00:00:00', NULL, NULL, '', 'pending'),
(2, 'askdjh', 'kasjdh', '01239809', 'aksjdhasd\r\nasdasd', '0000-00-00 00:00:00', NULL, NULL, '', 'pending'),
(3, 'askdjh', 'kasjdh', '01239809', 'aksjdhasd\r\nasdasd', '0000-00-00 00:00:00', NULL, NULL, '', 'pending'),
(5, 'asd', 'korapotu@gmail.com', '901823', 'jkzsdas', '2018-11-10 11:34:12', '2018-11-12 17:09:39', 'ajksdhasd asd', 'กรพจน์ อุโฆษกิจ', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `Seminar`
--

CREATE TABLE `Seminar` (
  `id` int(11) NOT NULL,
  `page_type` varchar(50) NOT NULL,
  `title_th` varchar(512) NOT NULL,
  `title_en` varchar(512) DEFAULT NULL,
  `content_th` text NOT NULL,
  `content_en` text,
  `schedule_filename_th` varchar(255) DEFAULT NULL,
  `schedule_filepath_th` varchar(512) DEFAULT NULL,
  `schedule_filename_en` varchar(255) DEFAULT NULL,
  `schedule_filepath_en` varchar(512) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `accommodation` enum('มีที่พัก','ไม่มีที่พัก') NOT NULL,
  `participant_filename_th` varchar(255) NOT NULL,
  `participant_filepath_th` varchar(512) NOT NULL,
  `participant_filename_en` varchar(255) DEFAULT NULL,
  `participant_filepath_en` varchar(512) DEFAULT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Seminar`
--

INSERT INTO `Seminar` (`id`, `page_type`, `title_th`, `title_en`, `content_th`, `content_en`, `schedule_filename_th`, `schedule_filepath_th`, `schedule_filename_en`, `schedule_filepath_en`, `start_date`, `end_date`, `accommodation`, `participant_filename_th`, `participant_filepath_th`, `participant_filename_en`, `participant_filepath_en`, `actives`, `create_date`, `update_date`) VALUES
(1, 'training', 'ทดสอบชื่อ', 'kajsdh', '<p>kajshd</p>\r\n', '<p>askdjh</p>\r\n', '2ตัวอย่างเมล.xlsx', 'files/files/seminar/20181031061037_702516.xlsx', '61aug17resultdisburseofbudget.pdf', 'files/files/seminar/20181031055316_136851.pdf', '2018-10-31', '2018-11-10', 'มีที่พัก', '61aug24resultdisburseofbudget.pdf', 'files/files/seminar/20181031055316_324625.pdf', '61aug31resultdisburseofbudget.pdf', 'files/files/seminar/20181031055316_651800.pdf', 'Y', '2018-10-31 05:53:16', '0000-00-00 00:00:00'),
(3, 'training', 'ทดสอบชื่อ 2', 'null', '', '', 'null', 'null', 'null', 'null', '1900-12-30', '1900-12-30', 'มีที่พัก', '', '', 'null', 'null', 'Y', '2018-10-31 06:43:59', '0000-00-00 00:00:00'),
(4, 'seminar', 'ทดสอบสัมนา', 'ทดสอบสัมนา', '<p>ทดสอบสัมนา</p>\r\n', '<p>ทดสอบสัมนา</p>\r\n', '61aug17resultdisburseofbudget.pdf', 'files/files/seminar/20181031114717_458815.pdf', '61aug31resultdisburseofbudget.pdf', 'files/files/seminar/20181031114717_550720.pdf', '2018-10-01', '2018-10-31', 'ไม่มีที่พัก', '', '', NULL, NULL, 'Y', '2018-10-31 11:47:17', '0000-00-00 00:00:00'),
(5, 'seminar', 'test seminar 2', 'test seminar 2', '<p>test seminar 2</p>\r\n', '<p>test seminar 2</p>\r\n', '61aug31resultdisburseofbudget.pdf', 'files/files/seminar/20181031114847_535754.pdf', '61aug17resultdisburseofbudget.pdf', 'files/files/seminar/20181031114847_881941.pdf', '2018-10-02', '2018-10-15', 'ไม่มีที่พัก', '', '', NULL, NULL, 'Y', '2018-10-31 11:48:47', '0000-00-00 00:00:00'),
(6, 'seminar', 'and', 'asdsad', '<p>asd</p>\r\n', '', NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', 'ไม่มีที่พัก', '', '', NULL, NULL, 'Y', '2018-10-31 11:49:44', '0000-00-00 00:00:00'),
(7, 'standard-commodity', 'สัมมนามาตรฐานสินค้าเกษตร 1', 'สัมมนามาตรฐานสินค้าเกษตร 1', '<p>สัมมนามาตรฐานสินค้าเกษตร 1</p>\r\n', '<p>สัมมนามาตรฐานสินค้าเกษตร 1</p>\r\n', '61aug31resultdisburseofbudget.pdf', 'files/files/seminar/20181031115121_231297.pdf', '61aug17resultdisburseofbudget.pdf', 'files/files/seminar/20181031115121_205964.pdf', '2018-10-31', '2018-11-10', 'ไม่มีที่พัก', '', '', NULL, NULL, 'Y', '2018-10-31 11:51:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Seminar_Response`
--

CREATE TABLE `Seminar_Response` (
  `id` int(11) NOT NULL,
  `seminar_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `name` varchar(140) NOT NULL,
  `position` varchar(70) NOT NULL,
  `organize` varchar(255) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `accommodation` enum('เข้าพัก','ไม่เข้าพัก') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Seminar_Response`
--

INSERT INTO `Seminar_Response` (`id`, `seminar_id`, `status`, `name`, `position`, `organize`, `tel`, `mobile`, `fax`, `email`, `file_name`, `file_path`, `accommodation`, `start_date`, `end_date`, `create_date`) VALUES
(1, 0, 'asd', 'asdasd', 'asdas', 'and089129', '091230980', '0912830123', '091230', 'aksjdh@asd.xoc', '61aug24resultdisburseofbudget.pdf', 'files/files/seminar/20181031110513_988426.pdf', 'เข้าพัก', '2018-10-31', '2018-11-02', '2018-10-31 11:05:13'),
(2, 1, 'asd', 'kajshd', 'khakjsd', 'kjhasdk', '0192830809812', '0918230', '019283098', 'kajshd@jkasd', '2ตัวอย่างเมล.xlsx', 'files/files/seminar/20181031110655_934559.xlsx', 'เข้าพัก', '2018-10-31', '2018-11-07', '2018-10-31 11:06:55'),
(3, 7, 'asd', 'askdjh', 'kajsdhk', 'jqkhk', '019283', '091820381', '09812093', 'aksjd@ad.com', NULL, NULL, NULL, NULL, NULL, '2018-10-31 11:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `Slideshows`
--

CREATE TABLE `Slideshows` (
  `id` int(11) NOT NULL,
  `slideshow_type` char(5) DEFAULT NULL,
  `contents_type` varchar(30) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `text_desc` text,
  `order_no` int(11) DEFAULT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Slideshows`
--

INSERT INTO `Slideshows` (`id`, `slideshow_type`, `contents_type`, `file_name`, `file_path`, `text_desc`, `order_no`, `actives`) VALUES
(5, NULL, 'image/jpeg', 'slide1.jpg', 'files/img/slide/slide1.jpg', '<h3 style=\"color:#62A850;\">test test</h3>', NULL, 'Y'),
(7, NULL, 'image/jpeg', 'slide2.jpg', 'files/img/slide/slide2.jpg', 'rtes sdkjads asdkfj', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `Stakeholders`
--

CREATE TABLE `Stakeholders` (
  `stakeholderID` char(7) NOT NULL,
  `nameThai` varchar(150) DEFAULT NULL,
  `lastNameThai` varchar(150) DEFAULT NULL,
  `nameEng` varchar(150) DEFAULT NULL,
  `lastNameEng` varchar(150) DEFAULT NULL,
  `positionThai` varchar(250) DEFAULT NULL,
  `positionEng` varchar(250) DEFAULT NULL,
  `responsible` varchar(400) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `institution` varchar(250) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Stakeholders`
--

INSERT INTO `Stakeholders` (`stakeholderID`, `nameThai`, `lastNameThai`, `nameEng`, `lastNameEng`, `positionThai`, `positionEng`, `responsible`, `experience`, `branch`, `institution`, `address`, `phone`, `fax`, `email`, `status`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
('4023144', 'กนก', 'รักนะ', 'Kanok', 'Rakna', 'ทดสอบ', 'Test', 'and', '', 'ปศุสัตว์', 'and', '', '010928301', '0109238', 'kaosd@kada.asd', 'Active', '1093840', '2018-08-09 08:32:13', '1093840', '2018-10-09 10:17:06'),
('4080666', 'สมพงษ์', 'มุมานะ', 'Sompong', 'Mumana', 'นักวิชาการ', 'Professor', 'ควบคุมคุณภาพ', 'ป โท', NULL, 'ภาควิจัย', '', '0912291100', '', 'sompong.m@gmail.com', 'Active', '1093840', '2018-08-08 11:43:42', '1093840', '2018-08-09 08:26:42'),
('8417154', 'asd', 'asd', 'asd', 'asd', 'asd', 'kkj', 'aksdj', 'asdkjh', 'พืช', 'kjhasd', 'kjahsd', '01928323', '1238789', 'askld@askdf.com', 'Active', NULL, '2018-11-08 10:51:14', NULL, '2018-11-08 10:51:14'),
('9810021', 'กรพจน์', 'อุโฆษกิจ', 'Korapot', 'Ukoskit', 'นักวิชาการ', 'Professor', 'สอนงาน', 'ปริญญาเอก', NULL, 'มหาวิทยาลัยแม่โจ้', '206/61 หมู่ 3 ต.แม่เหียะ อ.เมือง จ.เชียงใหม่', '0917196810', '053839000', 'korapotu@gmail.com', 'Active', NULL, NULL, NULL, '2018-08-07 08:19:33'),
('9810022', 'กรกต', 'มามาก', 'Korakod', 'Mamag', 'นักวิชาการชำนาญ', 'Senior Professor', 'สอนงานวิจัย', 'ปริญญาเอก', NULL, 'มหาวิทยาลัยเชียงใหม่', '206/61 หมู่ 3 ต.แม่เหียะ อ.เมือง จ.เชียงใหม่', '0917196810', '053839000', 'korakod@gmail.com', 'Active', NULL, NULL, NULL, '2018-08-07 08:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `Subcommittee`
--

CREATE TABLE `Subcommittee` (
  `subcommitteeID` int(11) NOT NULL,
  `subcommitteeName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Subcommittee`
--

INSERT INTO `Subcommittee` (`subcommitteeID`, `subcommitteeName`) VALUES
(5, 'Avengers');

-- --------------------------------------------------------

--
-- Table structure for table `Subcommittee_Person`
--

CREATE TABLE `Subcommittee_Person` (
  `subcommitteePersonID` int(11) NOT NULL,
  `subcommitteeID` int(11) NOT NULL,
  `stakeholderID` char(7) NOT NULL,
  `positionName` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Subcommittee_Person`
--

INSERT INTO `Subcommittee_Person` (`subcommitteePersonID`, `subcommitteeID`, `stakeholderID`, `positionName`) VALUES
(1, 1, '9810021', ''),
(2, 1, '9810022', ''),
(6, 5, '9810021', '');

-- --------------------------------------------------------

--
-- Table structure for table `Substitute_Academic_Boards`
--

CREATE TABLE `Substitute_Academic_Boards` (
  `substituteID` int(11) NOT NULL,
  `academicBoardID` int(11) NOT NULL,
  `stakeholderID` int(11) NOT NULL,
  `standardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Substitute_Academic_Boards`
--

INSERT INTO `Substitute_Academic_Boards` (`substituteID`, `academicBoardID`, `stakeholderID`, `standardID`) VALUES
(6, 6, 9810022, 3);

-- --------------------------------------------------------

--
-- Table structure for table `UserRole`
--

CREATE TABLE `UserRole` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `actives` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserRole`
--

INSERT INTO `UserRole` (`id`, `role_name`, `actives`) VALUES
(1, 'เจ้าหน้าที่สูงสุด', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `UserRole_Detail`
--

CREATE TABLE `UserRole_Detail` (
  `id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `actives` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` char(7) NOT NULL,
  `stakeholderID` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `createBy` char(7) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` char(7) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `stakeholderID`, `email`, `password`, `createBy`, `createDate`, `updateBy`, `updateDate`) VALUES
('5565143', 0, 'ิทืิ', '1234', NULL, '2018-12-26 03:10:59', NULL, '2018-12-26 03:10:59'),
('6120347', 9810021, 'korapotu@gmail.com', '56026961', NULL, '2018-08-08 11:33:10', '1093840', '2018-10-09 09:57:09'),
('9088979', 9810022, 'korakod@gmail.com', '100000000', NULL, '2018-08-08 11:21:18', '1093840', '2018-08-08 11:31:24'),
('9271183', 4080666, 'sompong.m@gmail.com', '1234', '1093840', '2018-08-09 08:27:21', '1093840', '2018-08-09 08:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `User_Account`
--

CREATE TABLE `User_Account` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `actives` char(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User_Account`
--

INSERT INTO `User_Account` (`id`, `username`, `password`, `firstname`, `lastname`, `position`, `org`, `tel`, `email`, `role`, `actives`, `create_date`, `update_date`) VALUES
(1, '', '1234', 'kashdasd', 'kjhasd', 'kajshdkj', 'hkjhjh', '0102983', 'asdkj@cas.com', 1, 'N', '2018-12-26 03:11:47', '2018-12-26 03:27:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Academic_Boards`
--
ALTER TABLE `Academic_Boards`
  ADD PRIMARY KEY (`academicBoardID`),
  ADD KEY `stackholderID_idx` (`stakeholderID`),
  ADD KEY `standardID_idx` (`standardID`),
  ADD KEY `adminID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `Accreditation_Scopes`
--
ALTER TABLE `Accreditation_Scopes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Admin_Users`
--
ALTER TABLE `Admin_Users`
  ADD PRIMARY KEY (`adminID`),
  ADD KEY `adminID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `Answers`
--
ALTER TABLE `Answers`
  ADD PRIMARY KEY (`answersID`),
  ADD KEY `standardID_idx` (`standardID`),
  ADD KEY `questionID_idx` (`questionID`);

--
-- Indexes for table `Api_Caller`
--
ALTER TABLE `Api_Caller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_datetime` (`call_datetime`);

--
-- Indexes for table `Appeal`
--
ALTER TABLE `Appeal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `callback_type` (`callback_type`),
  ADD KEY `appeal_type` (`appeal_type`),
  ADD KEY `create_date` (`create_date`);

--
-- Indexes for table `Appeal_Callback`
--
ALTER TABLE `Appeal_Callback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appeal_id` (`appeal_id`);

--
-- Indexes for table `Appeal_List`
--
ALTER TABLE `Appeal_List`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appeal_id` (`appeal_id`);

--
-- Indexes for table `AttachFiles`
--
ALTER TABLE `AttachFiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_type` (`page_type`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `file_name` (`file_name`),
  ADD KEY `file_language` (`file_language`);

--
-- Indexes for table `AttachFiles_Multi`
--
ALTER TABLE `AttachFiles_Multi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_type` (`menu_type`),
  ADD KEY `actives` (`actives`),
  ADD KEY `update_date` (`update_date`),
  ADD KEY `order_no` (`order_no`);

--
-- Indexes for table `Branchs`
--
ALTER TABLE `Branchs`
  ADD PRIMARY KEY (`branchID`);

--
-- Indexes for table `Budget_Disbursement`
--
ALTER TABLE `Budget_Disbursement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `years` (`years`),
  ADD KEY `months` (`months`),
  ADD KEY `orderNo` (`orderNo`),
  ADD KEY `createBy` (`createBy`),
  ADD KEY `createDate` (`createDate`);

--
-- Indexes for table `Budget_Disbursement_Item`
--
ALTER TABLE `Budget_Disbursement_Item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `budget_id` (`budget_id`),
  ADD KEY `item` (`item`(255));

--
-- Indexes for table `Certification_Code`
--
ALTER TABLE `Certification_Code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_type` (`page_type`),
  ADD KEY `operator_name_th` (`operator_name_th`(255)),
  ADD KEY `operator_name_en` (`operator_name_en`(255)),
  ADD KEY `standard_th` (`standard_th`(255)),
  ADD KEY `province_th` (`province_th`);

--
-- Indexes for table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listening_id` (`listening_id`),
  ADD KEY `job` (`job`),
  ADD KEY `create_date` (`create_date`),
  ADD KEY `comment` (`comment`);

--
-- Indexes for table `Commodity_Keywords`
--
ALTER TABLE `Commodity_Keywords`
  ADD PRIMARY KEY (`keywordID`),
  ADD KEY `commodityStandardID_idx` (`standardID`),
  ADD KEY `admin_UserID_idx` (`createBy`,`updateBy`),
  ADD KEY `keywordLang` (`keywordLang`);

--
-- Indexes for table `Commodity_Standards`
--
ALTER TABLE `Commodity_Standards`
  ADD PRIMARY KEY (`standardID`),
  ADD KEY `adminId_idx` (`createBy`,`updateBy`),
  ADD KEY `standardNameThai` (`standardNameThai`),
  ADD KEY `standardNameEng` (`standardNameEng`),
  ADD KEY `years` (`years`),
  ADD KEY `standardType` (`standardType`),
  ADD KEY `academicBoardName` (`academicBoardName`);

--
-- Indexes for table `ContactUs`
--
ALTER TABLE `ContactUs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Country_List`
--
ALTER TABLE `Country_List`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_th` (`org_th`),
  ADD KEY `org_en` (`org_en`),
  ADD KEY `country_th` (`country_th`),
  ADD KEY `country_en` (`country_en`),
  ADD KEY `standard_name` (`standard_name`(255)),
  ADD KEY `menu_type` (`menu_type`);

--
-- Indexes for table `Emails`
--
ALTER TABLE `Emails`
  ADD PRIMARY KEY (`emailID`),
  ADD KEY `adminID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `Email_Commodity`
--
ALTER TABLE `Email_Commodity`
  ADD PRIMARY KEY (`emailCommodityID`),
  ADD KEY `emailID` (`emailID`),
  ADD KEY `standardID` (`standardID`);

--
-- Indexes for table `FooterLink`
--
ALTER TABLE `FooterLink`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_type` (`link_type`);

--
-- Indexes for table `Form_Data1`
--
ALTER TABLE `Form_Data1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_type` (`menu_type`),
  ADD KEY `actives` (`actives`),
  ADD KEY `operator_type` (`operator_type`);

--
-- Indexes for table `Form_Data1_Certification`
--
ALTER TABLE `Form_Data1_Certification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_data1_id` (`scope_id`);

--
-- Indexes for table `Form_Data1_Detail`
--
ALTER TABLE `Form_Data1_Detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_data1_id` (`form_data1_id`),
  ADD KEY `iso` (`iso`),
  ADD KEY `usage` (`usage_status`);

--
-- Indexes for table `Form_Data1_License`
--
ALTER TABLE `Form_Data1_License`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license_no` (`license_no`),
  ADD KEY `form_data1_id` (`form_data1_id`);

--
-- Indexes for table `Form_Data1_Product_Inspect`
--
ALTER TABLE `Form_Data1_Product_Inspect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `standard_id` (`standard_id`);

--
-- Indexes for table `Form_Data1_Scope`
--
ALTER TABLE `Form_Data1_Scope`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_id` (`detail_id`),
  ADD KEY `iso` (`iso`),
  ADD KEY `form_data1_id` (`form_data1_id`);

--
-- Indexes for table `Form_Data1_StandardARC`
--
ALTER TABLE `Form_Data1_StandardARC`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_id` (`detail_id`);

--
-- Indexes for table `Form_Data1_Standard_Checked`
--
ALTER TABLE `Form_Data1_Standard_Checked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `Form_Data1_SubScope`
--
ALTER TABLE `Form_Data1_SubScope`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scope_id` (`scope_id`),
  ADD KEY `iso` (`iso`);

--
-- Indexes for table `Freq_Question`
--
ALTER TABLE `Freq_Question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actives` (`actives`),
  ADD KEY `question_type` (`question_type`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `question_th` (`question_th`(255)),
  ADD KEY `question_en` (`question_en`(255));

--
-- Indexes for table `Fruit`
--
ALTER TABLE `Fruit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_th` (`name_th`),
  ADD KEY `name_en` (`name_en`),
  ADD KEY `name_science` (`name_science`(255));

--
-- Indexes for table `Hearing_Report`
--
ALTER TABLE `Hearing_Report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_type` (`service_type`),
  ADD KEY `gender` (`gender`),
  ADD KEY `age` (`age`),
  ADD KEY `visit_website_time` (`visit_website_time`),
  ADD KEY `total_visit` (`total_visit`),
  ADD KEY `time_visit` (`time_visit`),
  ADD KEY `color_font_size` (`color_font_size`),
  ADD KEY `picture_symbol` (`picture_symbol`),
  ADD KEY `group_data` (`group_data`),
  ADD KEY `external_link` (`external_link`),
  ADD KEY `user_friendly` (`user_friendly`),
  ADD KEY `up_to_date` (`up_to_date`),
  ADD KEY `correction` (`correction`),
  ADD KEY `attractive` (`attractive`),
  ADD KEY `clarity` (`clarity`),
  ADD KEY `speed_data` (`speed_data`),
  ADD KEY `benefit` (`benefit`),
  ADD KEY `create_date` (`create_date`);

--
-- Indexes for table `Hearing_Report_Detail`
--
ALTER TABLE `Hearing_Report_Detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hearing_report_id` (`hearing_report_id`),
  ADD KEY `hearing_report_type` (`hearing_report_type`),
  ADD KEY `desc` (`detail_desc`) USING BTREE;

--
-- Indexes for table `Infographic`
--
ALTER TABLE `Infographic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actives` (`actives`),
  ADD KEY `visit_count` (`visit_count`);

--
-- Indexes for table `Invite_Files`
--
ALTER TABLE `Invite_Files`
  ADD PRIMARY KEY (`inviteFileID`),
  ADD KEY `meetingID_idx` (`meetingID`),
  ADD KEY `standardID_idx` (`standardID`),
  ADD KEY `adminUsersID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `Iso`
--
ALTER TABLE `Iso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iso_type` (`iso_type`);

--
-- Indexes for table `Licensees`
--
ALTER TABLE `Licensees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `license_type` (`license_type`),
  ADD KEY `license_status` (`license_status`),
  ADD KEY `standard_code` (`standard_code`),
  ADD KEY `authorized_name` (`authorized_name`),
  ADD KEY `region` (`region`),
  ADD KEY `province` (`province`);

--
-- Indexes for table `License_Register`
--
ALTER TABLE `License_Register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `name` (`name`(255)),
  ADD KEY `idcard` (`idcard`),
  ADD KEY `check_name` (`check_name`(255)),
  ADD KEY `reference` (`reference`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `LinkUrl`
--
ALTER TABLE `LinkUrl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_type` (`link_type`);

--
-- Indexes for table `Listening`
--
ALTER TABLE `Listening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actives` (`actives`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `listening_type` (`listening_type`);

--
-- Indexes for table `MasterType`
--
ALTER TABLE `MasterType`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_type` (`menu_type`);

--
-- Indexes for table `Media`
--
ALTER TABLE `Media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_count` (`visit_count`),
  ADD KEY `actives` (`actives`);

--
-- Indexes for table `Meetings`
--
ALTER TABLE `Meetings`
  ADD PRIMARY KEY (`meetingID`),
  ADD KEY `commodityStandardID_idx` (`standardID`),
  ADD KEY `adminUserID_idx` (`createBy`,`updateBy`),
  ADD KEY `sentEmailStatus` (`sentEmailStatus`);

--
-- Indexes for table `Meeting_attendees`
--
ALTER TABLE `Meeting_attendees`
  ADD PRIMARY KEY (`meetingAttendeeID`),
  ADD KEY `attendeeID_idx` (`attendeeID`),
  ADD KEY `meetingID_idx` (`meetingID`),
  ADD KEY `standardID_idx` (`standardID`),
  ADD KEY `adminID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `Meeting_Files`
--
ALTER TABLE `Meeting_Files`
  ADD PRIMARY KEY (`meetingFileID`),
  ADD KEY `adminUserID_idx` (`createBy`,`updateBy`),
  ADD KEY `standardID_idx` (`standardID`),
  ADD KEY `meetingID_idx` (`meetingID`);

--
-- Indexes for table `Meeting_Result`
--
ALTER TABLE `Meeting_Result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_type` (`meeting_type`);

--
-- Indexes for table `Menus`
--
ALTER TABLE `Menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_menu` (`parent_menu`),
  ADD KEY `menuType` (`menu_type`),
  ADD KEY `menuOrder` (`menu_order`),
  ADD KEY `Actives` (`actives`),
  ADD KEY `menu_url` (`menu_url`(255)),
  ADD KEY `page_type` (`page_type`);

--
-- Indexes for table `menu_favourite`
--
ALTER TABLE `menu_favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `email` (`email`),
  ADD KEY `menu_count` (`menu_count`);

--
-- Indexes for table `MOM_Files`
--
ALTER TABLE `MOM_Files`
  ADD PRIMARY KEY (`momFileID`),
  ADD KEY `meetingID_idx` (`meetingID`),
  ADD KEY `standardID_idx` (`standardID`),
  ADD KEY `adminUserID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actives` (`actives`),
  ADD KEY `page_type` (`news_type`),
  ADD KEY `news_type` (`news_type`),
  ADD KEY `actives_2` (`actives`),
  ADD KEY `show_homepage` (`show_homepage`);

--
-- Indexes for table `Officer_Contact_Dep`
--
ALTER TABLE `Officer_Contact_Dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_no` (`order_no`);

--
-- Indexes for table `Officer_Contact_Person`
--
ALTER TABLE `Officer_Contact_Person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `Online_Services`
--
ALTER TABLE `Online_Services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prefix` (`prefix`),
  ADD KEY `section` (`section`),
  ADD KEY `status` (`status`),
  ADD KEY `create_date` (`create_date`);

--
-- Indexes for table `Online_ServicesType`
--
ALTER TABLE `Online_ServicesType`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_service_id` (`online_service_id`);

--
-- Indexes for table `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actives` (`actives`),
  ADD KEY `page_type` (`page_type`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `Palaces`
--
ALTER TABLE `Palaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `firstname_th` (`firstname_th`),
  ADD KEY `firstname_en` (`firstname_en`),
  ADD KEY `lastname_th` (`lastname_th`),
  ADD KEY `lastname_en` (`lastname_en`),
  ADD KEY `position_start_date` (`position_start_date`),
  ADD KEY `position_end_date` (`position_end_date`),
  ADD KEY `palace_type` (`palace_type`),
  ADD KEY `order_no` (`order_no`);

--
-- Indexes for table `Product_Code`
--
ALTER TABLE `Product_Code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_th` (`product_th`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `Province`
--
ALTER TABLE `Province`
  ADD PRIMARY KEY (`ProvinceID`);

--
-- Indexes for table `Provinces`
--
ALTER TABLE `Provinces`
  ADD KEY `geography_name` (`geography_name`);

--
-- Indexes for table `Purchase`
--
ALTER TABLE `Purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_type` (`page_type`),
  ADD KEY `actives` (`actives`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`),
  ADD KEY `update_date` (`update_date`),
  ADD KEY `org_th` (`org_th`),
  ADD KEY `office_th` (`office_th`),
  ADD KEY `project_th` (`project_th`(255)),
  ADD KEY `item_no` (`item_no`),
  ADD KEY `project_no` (`project_no`);

--
-- Indexes for table `Questionnaires`
--
ALTER TABLE `Questionnaires`
  ADD PRIMARY KEY (`questionnaireID`),
  ADD KEY `questionID_idx` (`questionName`),
  ADD KEY `standardID` (`standardID`),
  ADD KEY `subcommitteeID` (`subcommitteeID`);

--
-- Indexes for table `Questionnaire_Person`
--
ALTER TABLE `Questionnaire_Person`
  ADD PRIMARY KEY (`questionnairePersonID`),
  ADD KEY `questionaireID` (`questionaireID`,`stakeholderID`);

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`questionID`),
  ADD KEY `questionaireID` (`questionaireID`);

--
-- Indexes for table `Question_Answer`
--
ALTER TABLE `Question_Answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_status` (`question_status`);

--
-- Indexes for table `Seminar`
--
ALTER TABLE `Seminar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `accommodation` (`accommodation`),
  ADD KEY `actives` (`actives`),
  ADD KEY `page_type` (`page_type`);

--
-- Indexes for table `Seminar_Response`
--
ALTER TABLE `Seminar_Response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seminar_id` (`seminar_id`),
  ADD KEY `create_date` (`create_date`);

--
-- Indexes for table `Slideshows`
--
ALTER TABLE `Slideshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slideshow_type` (`slideshow_type`);

--
-- Indexes for table `Stakeholders`
--
ALTER TABLE `Stakeholders`
  ADD PRIMARY KEY (`stakeholderID`),
  ADD KEY `adminID_idx` (`createBy`,`updateBy`),
  ADD KEY `nameThai` (`nameThai`),
  ADD KEY `lastNameThai` (`lastNameThai`),
  ADD KEY `nameEng` (`nameEng`),
  ADD KEY `lastNameEng` (`lastNameEng`),
  ADD KEY `status` (`status`),
  ADD KEY `branch` (`branch`);

--
-- Indexes for table `Subcommittee`
--
ALTER TABLE `Subcommittee`
  ADD PRIMARY KEY (`subcommitteeID`);

--
-- Indexes for table `Subcommittee_Person`
--
ALTER TABLE `Subcommittee_Person`
  ADD PRIMARY KEY (`subcommitteePersonID`),
  ADD KEY `subcommitteeID` (`subcommitteeID`),
  ADD KEY `stakeholderID` (`stakeholderID`);

--
-- Indexes for table `Substitute_Academic_Boards`
--
ALTER TABLE `Substitute_Academic_Boards`
  ADD PRIMARY KEY (`substituteID`),
  ADD KEY `academicBoardID_idx` (`academicBoardID`),
  ADD KEY `stackeholderID_idx` (`stakeholderID`),
  ADD KEY `standardID_idx` (`standardID`);

--
-- Indexes for table `UserRole`
--
ALTER TABLE `UserRole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_name` (`role_name`),
  ADD KEY `actives` (`actives`);

--
-- Indexes for table `UserRole_Detail`
--
ALTER TABLE `UserRole_Detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `actives` (`actives`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `s_idx` (`stakeholderID`),
  ADD KEY `userID_idx` (`updateBy`),
  ADD KEY `adminUserID_idx` (`createBy`,`updateBy`);

--
-- Indexes for table `User_Account`
--
ALTER TABLE `User_Account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`),
  ADD KEY `email` (`email`),
  ADD KEY `username` (`username`),
  ADD KEY `password` (`password`),
  ADD KEY `actives` (`actives`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Academic_Boards`
--
ALTER TABLE `Academic_Boards`
  MODIFY `academicBoardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Accreditation_Scopes`
--
ALTER TABLE `Accreditation_Scopes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Api_Caller`
--
ALTER TABLE `Api_Caller`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Appeal`
--
ALTER TABLE `Appeal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Appeal_Callback`
--
ALTER TABLE `Appeal_Callback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Appeal_List`
--
ALTER TABLE `Appeal_List`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `AttachFiles`
--
ALTER TABLE `AttachFiles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `AttachFiles_Multi`
--
ALTER TABLE `AttachFiles_Multi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `Branchs`
--
ALTER TABLE `Branchs`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Budget_Disbursement`
--
ALTER TABLE `Budget_Disbursement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Budget_Disbursement_Item`
--
ALTER TABLE `Budget_Disbursement_Item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Certification_Code`
--
ALTER TABLE `Certification_Code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Comment`
--
ALTER TABLE `Comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Commodity_Keywords`
--
ALTER TABLE `Commodity_Keywords`
  MODIFY `keywordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Commodity_Standards`
--
ALTER TABLE `Commodity_Standards`
  MODIFY `standardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ContactUs`
--
ALTER TABLE `ContactUs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Country_List`
--
ALTER TABLE `Country_List`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Emails`
--
ALTER TABLE `Emails`
  MODIFY `emailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Email_Commodity`
--
ALTER TABLE `Email_Commodity`
  MODIFY `emailCommodityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `FooterLink`
--
ALTER TABLE `FooterLink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Form_Data1`
--
ALTER TABLE `Form_Data1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Form_Data1_Certification`
--
ALTER TABLE `Form_Data1_Certification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Form_Data1_Detail`
--
ALTER TABLE `Form_Data1_Detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Form_Data1_License`
--
ALTER TABLE `Form_Data1_License`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Form_Data1_Product_Inspect`
--
ALTER TABLE `Form_Data1_Product_Inspect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Form_Data1_Scope`
--
ALTER TABLE `Form_Data1_Scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Form_Data1_StandardARC`
--
ALTER TABLE `Form_Data1_StandardARC`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Form_Data1_Standard_Checked`
--
ALTER TABLE `Form_Data1_Standard_Checked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Form_Data1_SubScope`
--
ALTER TABLE `Form_Data1_SubScope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Freq_Question`
--
ALTER TABLE `Freq_Question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Fruit`
--
ALTER TABLE `Fruit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Hearing_Report`
--
ALTER TABLE `Hearing_Report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Hearing_Report_Detail`
--
ALTER TABLE `Hearing_Report_Detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Infographic`
--
ALTER TABLE `Infographic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Invite_Files`
--
ALTER TABLE `Invite_Files`
  MODIFY `inviteFileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Iso`
--
ALTER TABLE `Iso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Licensees`
--
ALTER TABLE `Licensees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `License_Register`
--
ALTER TABLE `License_Register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `LinkUrl`
--
ALTER TABLE `LinkUrl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Listening`
--
ALTER TABLE `Listening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `MasterType`
--
ALTER TABLE `MasterType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Media`
--
ALTER TABLE `Media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Meetings`
--
ALTER TABLE `Meetings`
  MODIFY `meetingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Meeting_attendees`
--
ALTER TABLE `Meeting_attendees`
  MODIFY `meetingAttendeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Meeting_Files`
--
ALTER TABLE `Meeting_Files`
  MODIFY `meetingFileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Meeting_Result`
--
ALTER TABLE `Meeting_Result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Menus`
--
ALTER TABLE `Menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `menu_favourite`
--
ALTER TABLE `menu_favourite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `MOM_Files`
--
ALTER TABLE `MOM_Files`
  MODIFY `momFileID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `News`
--
ALTER TABLE `News`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Officer_Contact_Dep`
--
ALTER TABLE `Officer_Contact_Dep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Officer_Contact_Person`
--
ALTER TABLE `Officer_Contact_Person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Online_Services`
--
ALTER TABLE `Online_Services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Online_ServicesType`
--
ALTER TABLE `Online_ServicesType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Pages`
--
ALTER TABLE `Pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `Palaces`
--
ALTER TABLE `Palaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Product_Code`
--
ALTER TABLE `Product_Code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Province`
--
ALTER TABLE `Province`
  MODIFY `ProvinceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `Purchase`
--
ALTER TABLE `Purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Questionnaires`
--
ALTER TABLE `Questionnaires`
  MODIFY `questionnaireID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Questionnaire_Person`
--
ALTER TABLE `Questionnaire_Person`
  MODIFY `questionnairePersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Question_Answer`
--
ALTER TABLE `Question_Answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Seminar`
--
ALTER TABLE `Seminar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Seminar_Response`
--
ALTER TABLE `Seminar_Response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Slideshows`
--
ALTER TABLE `Slideshows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Subcommittee`
--
ALTER TABLE `Subcommittee`
  MODIFY `subcommitteeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Subcommittee_Person`
--
ALTER TABLE `Subcommittee_Person`
  MODIFY `subcommitteePersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Substitute_Academic_Boards`
--
ALTER TABLE `Substitute_Academic_Boards`
  MODIFY `substituteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `UserRole`
--
ALTER TABLE `UserRole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UserRole_Detail`
--
ALTER TABLE `UserRole_Detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User_Account`
--
ALTER TABLE `User_Account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
