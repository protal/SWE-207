-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2017 at 07:49 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swe-207`
--
CREATE DATABASE IF NOT EXISTS `swe-207` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `swe-207`;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `Datail` text COLLATE utf8_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `yearofeducation_semester` int(11) NOT NULL,
  `yearofeducation_year` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `create_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `name`, `Datail`, `StartDate`, `EndDate`, `teacher_id`, `image`, `yearofeducation_semester`, `yearofeducation_year`, `location_id`, `type_id`, `create_id`) VALUES
(19, 'บูมพี่บัณฑิต', 'ร่วมแสดงความยินดีกับพี่บัณฑิต หลักสูตรวิศวกรรมซอฟต์แวร์รุ่นที่1', '2016-10-04 00:00:00', '2016-10-04 00:00:00', 84, 'img/activity/19.jpg', 1, 2558, 2, 3, 17),
(20, 'Meeting', 'กิจกรรมตอนรับน้องปี1', '2016-08-28 00:00:00', '2016-08-28 00:00:00', 84, 'img/activity/20.jpg', 1, 2558, 3, 3, 17),
(21, 'การแข่งขันกีฬา ITM ครั้งที่18', 'กิจกรรมสานสัมพันธ์ระหว่างมหาวิทยาลัย', '2015-09-04 00:00:00', '2015-09-06 00:00:00', 87, 'img/activity/21.jpg', 2, 2558, 4, 3, 17),
(22, 'การแข่งขันกีฬา ITM ครั้งที่19', 'กิจกรรมสานสัมพันธ์ระหว่างมหาวิทยาลัย', '2016-06-22 00:00:00', '2016-06-24 00:00:00', 87, 'img/activity/22.jpg', 2, 2559, 5, 3, 17),
(23, 'รับน้องทะเล', 'กิจกรรมรับน้องปี1 หลักสูตรวิศวกรรมซอฟต์แวร์รุ่น5 ', '2017-04-01 00:00:00', '2017-04-02 00:00:00', 84, 'img/activity/23.jpg', 3, 2559, 6, 1, 17),
(24, 'รับน้องทะเล', 'กิจกรรมรับน้องทะเล หลักสูตรวิศวกรรมซอฟต์แวร์รุ่น4', '2015-06-25 00:00:00', '2015-06-25 00:00:00', 87, 'img/activity/24.jpg', 3, 2558, 7, 3, 17),
(25, 'ค่ายScrum', 'กิจกรรมเสริมทักษะการเรียนรู้', '2017-04-12 00:00:00', '2017-04-12 00:00:00', 84, 'img/activity/25.jpg', 3, 2559, 8, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `detailactivity`
--

DROP TABLE IF EXISTS `detailactivity`;
CREATE TABLE `detailactivity` (
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joinactivity`
--

DROP TABLE IF EXISTS `joinactivity`;
CREATE TABLE `joinactivity` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `joinactivity`
--

INSERT INTO `joinactivity` (`activity_id`, `user_id`, `joined`) VALUES
(19, 1, 0),
(19, 2, 0),
(19, 3, 0),
(19, 4, 0),
(19, 5, 0),
(19, 6, 0),
(19, 7, 0),
(19, 8, 0),
(19, 9, 0),
(19, 10, 0),
(19, 11, 0),
(19, 12, 0),
(19, 13, 0),
(19, 14, 0),
(19, 15, 0),
(19, 16, 0),
(19, 17, 0),
(19, 18, 0),
(19, 19, 0),
(19, 20, 0),
(19, 21, 0),
(19, 22, 0),
(19, 23, 0),
(19, 24, 0),
(19, 25, 0),
(19, 26, 0),
(19, 27, 0),
(19, 28, 0),
(19, 29, 0),
(19, 30, 0),
(19, 31, 0),
(19, 32, 0),
(19, 33, 0),
(19, 34, 0),
(19, 35, 0),
(19, 36, 0),
(19, 37, 0),
(19, 38, 0),
(19, 39, 0),
(19, 40, 0),
(19, 41, 0),
(19, 42, 0),
(19, 43, 0),
(19, 44, 0),
(19, 45, 0),
(19, 46, 0),
(19, 47, 0),
(19, 48, 0),
(19, 49, 0),
(19, 50, 0),
(19, 51, 0),
(19, 52, 0),
(19, 53, 0),
(19, 54, 0),
(19, 55, 0),
(19, 56, 0),
(19, 57, 0),
(19, 58, 0),
(19, 59, 0),
(20, 1, 0),
(20, 2, 0),
(20, 3, 0),
(20, 4, 0),
(20, 5, 0),
(20, 6, 0),
(20, 7, 0),
(20, 8, 0),
(20, 9, 0),
(20, 10, 0),
(20, 11, 0),
(20, 12, 0),
(20, 13, 0),
(20, 14, 0),
(20, 15, 0),
(20, 16, 0),
(20, 17, 0),
(20, 18, 0),
(20, 19, 0),
(20, 20, 0),
(20, 21, 0),
(20, 22, 0),
(20, 23, 0),
(20, 24, 0),
(20, 25, 0),
(20, 26, 0),
(20, 27, 0),
(20, 28, 0),
(20, 29, 0),
(20, 30, 0),
(20, 31, 0),
(20, 32, 0),
(20, 33, 0),
(20, 34, 0),
(20, 35, 0),
(20, 36, 0),
(20, 37, 0),
(20, 38, 0),
(20, 39, 0),
(20, 40, 0),
(20, 41, 0),
(20, 42, 0),
(20, 43, 0),
(20, 44, 0),
(20, 45, 0),
(20, 46, 0),
(20, 47, 0),
(20, 48, 0),
(20, 49, 0),
(20, 50, 0),
(20, 51, 0),
(20, 52, 0),
(20, 53, 0),
(20, 54, 0),
(20, 55, 0),
(20, 56, 0),
(20, 57, 0),
(20, 58, 0),
(20, 59, 0),
(21, 1, 0),
(21, 2, 0),
(21, 3, 0),
(21, 4, 0),
(21, 5, 0),
(21, 6, 0),
(21, 7, 0),
(21, 8, 0),
(21, 9, 0),
(21, 10, 0),
(21, 11, 0),
(21, 12, 0),
(21, 13, 0),
(21, 14, 0),
(21, 15, 0),
(21, 16, 0),
(21, 17, 0),
(21, 18, 0),
(21, 19, 0),
(21, 20, 0),
(21, 21, 0),
(21, 22, 0),
(21, 23, 0),
(21, 24, 0),
(21, 25, 0),
(21, 26, 0),
(21, 27, 0),
(21, 28, 0),
(21, 29, 0),
(21, 30, 0),
(21, 31, 0),
(21, 32, 0),
(21, 33, 0),
(21, 34, 0),
(21, 35, 0),
(21, 36, 0),
(21, 37, 0),
(21, 38, 0),
(21, 39, 0),
(21, 40, 0),
(21, 60, 0),
(21, 61, 0),
(21, 62, 0),
(21, 63, 0),
(21, 64, 0),
(21, 65, 0),
(21, 66, 0),
(21, 67, 0),
(21, 68, 0),
(21, 69, 0),
(21, 70, 0),
(21, 71, 0),
(21, 72, 0),
(21, 73, 0),
(21, 74, 0),
(22, 1, 0),
(22, 2, 0),
(22, 3, 0),
(22, 4, 0),
(22, 5, 0),
(22, 6, 0),
(22, 7, 0),
(22, 8, 0),
(22, 9, 0),
(22, 10, 0),
(22, 11, 0),
(22, 12, 0),
(22, 13, 0),
(22, 14, 0),
(22, 15, 0),
(22, 16, 0),
(22, 17, 0),
(22, 18, 0),
(22, 19, 0),
(22, 20, 0),
(22, 21, 0),
(22, 22, 0),
(22, 23, 0),
(22, 24, 0),
(22, 25, 0),
(22, 26, 0),
(22, 27, 0),
(22, 28, 0),
(22, 29, 0),
(22, 30, 0),
(22, 31, 0),
(22, 32, 0),
(22, 33, 0),
(22, 34, 0),
(22, 35, 0),
(22, 36, 0),
(22, 37, 0),
(22, 38, 0),
(22, 39, 0),
(22, 40, 0),
(22, 41, 0),
(22, 42, 0),
(22, 43, 0),
(22, 44, 0),
(22, 45, 0),
(22, 46, 0),
(22, 47, 0),
(22, 48, 0),
(22, 49, 0),
(22, 50, 0),
(22, 51, 0),
(22, 52, 0),
(22, 53, 0),
(22, 54, 0),
(22, 55, 0),
(22, 56, 0),
(22, 57, 0),
(22, 58, 0),
(22, 59, 0),
(23, 1, 0),
(23, 2, 0),
(23, 3, 0),
(23, 4, 0),
(23, 5, 0),
(23, 6, 0),
(23, 7, 0),
(23, 8, 0),
(23, 9, 0),
(23, 10, 0),
(23, 11, 0),
(23, 12, 0),
(23, 13, 0),
(23, 14, 0),
(23, 15, 0),
(23, 16, 0),
(23, 17, 0),
(23, 18, 0),
(23, 19, 0),
(23, 20, 0),
(23, 21, 0),
(23, 22, 0),
(23, 23, 0),
(23, 24, 0),
(23, 25, 0),
(23, 26, 0),
(23, 27, 0),
(23, 28, 0),
(23, 29, 0),
(23, 30, 0),
(23, 31, 0),
(23, 32, 0),
(23, 33, 0),
(23, 34, 0),
(23, 35, 0),
(23, 36, 0),
(23, 37, 0),
(23, 38, 0),
(23, 39, 0),
(23, 40, 0),
(23, 41, 0),
(23, 42, 0),
(23, 43, 0),
(23, 44, 0),
(23, 45, 0),
(23, 46, 0),
(23, 47, 0),
(23, 48, 0),
(23, 49, 0),
(23, 50, 0),
(23, 51, 0),
(23, 52, 0),
(23, 53, 0),
(23, 54, 0),
(23, 55, 0),
(23, 56, 0),
(23, 57, 0),
(23, 58, 0),
(23, 59, 0),
(23, 60, 0),
(23, 61, 0),
(23, 62, 0),
(23, 63, 0),
(23, 64, 0),
(23, 65, 0),
(23, 66, 0),
(23, 67, 0),
(23, 68, 0),
(23, 69, 0),
(23, 70, 0),
(23, 71, 0),
(23, 72, 0),
(23, 73, 0),
(23, 74, 0),
(24, 1, 0),
(24, 2, 0),
(24, 3, 0),
(24, 4, 0),
(24, 5, 0),
(24, 6, 0),
(24, 7, 0),
(24, 8, 0),
(24, 9, 0),
(24, 10, 0),
(24, 11, 0),
(24, 12, 0),
(24, 13, 0),
(24, 14, 0),
(24, 15, 0),
(24, 16, 0),
(24, 17, 0),
(24, 18, 0),
(24, 19, 0),
(24, 20, 0),
(24, 21, 0),
(24, 22, 0),
(24, 23, 0),
(24, 24, 0),
(24, 25, 0),
(24, 26, 0),
(24, 27, 0),
(24, 28, 0),
(24, 29, 0),
(24, 30, 0),
(24, 31, 0),
(24, 32, 0),
(24, 33, 0),
(24, 34, 0),
(24, 35, 0),
(24, 36, 0),
(24, 37, 0),
(24, 38, 0),
(24, 39, 0),
(24, 40, 0),
(24, 60, 0),
(24, 61, 0),
(24, 62, 0),
(24, 63, 0),
(24, 64, 0),
(24, 65, 0),
(24, 66, 0),
(24, 67, 0),
(24, 68, 0),
(24, 69, 0),
(24, 70, 0),
(24, 71, 0),
(24, 72, 0),
(24, 73, 0),
(24, 74, 0),
(25, 1, 1),
(25, 2, 1),
(25, 3, 1),
(25, 4, 1),
(25, 5, 1),
(25, 6, 0),
(25, 7, 0),
(25, 8, 0),
(25, 9, 0),
(25, 10, 0),
(25, 11, 0),
(25, 12, 0),
(25, 13, 0),
(25, 14, 0),
(25, 15, 0),
(25, 16, 0),
(25, 17, 0),
(25, 18, 0),
(25, 19, 0),
(25, 20, 0),
(25, 21, 0),
(25, 22, 0),
(25, 23, 0),
(25, 24, 0),
(25, 25, 0),
(25, 26, 1),
(25, 27, 1),
(25, 28, 1),
(25, 29, 1),
(25, 30, 0),
(25, 31, 0),
(25, 32, 0),
(25, 33, 0),
(25, 34, 0),
(25, 35, 0),
(25, 36, 0),
(25, 37, 0),
(25, 38, 0),
(25, 39, 0),
(25, 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `room` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `room`) VALUES
(2, 'อาคารเรียนรวม7', 'บริเวณด้านหลังอาคารเรียนรวม7'),
(3, 'โรงอาหาร4', 'บริเวณด้านในโรงอาหาร4'),
(4, 'มหาวิทยาลัยสงขลานครินทร์', '15 ถนน กาญจนวนิช ซอย 7 ตำบล คอหงส์ อำเภอ หาดใหญ่ สงขลา 90110'),
(5, 'มหาวิทยาลัยทักษิณวิทยาเขตพัทลุง', '222 หมู่ ตำบล บ้านพร้าว อำเภอ ป่าพะยอม พัทลุง 93210'),
(6, 'ทิพย์บุรีรีสอร์ท', '330/7 หาดหินงาม หมู่ 3 ต.สิชล อ.สิชล\r\nจ.นครศรีธรรมราช  80120'),
(7, 'พูลสุขรีสอร์ท', '58 หมู่1 ตำบลท่าขึ้น อำเภอท่าศาลา จังหวัดนครศรีธรรมราช 80160'),
(8, 'อาคารเครื่องมือวิทยาศาสตร์', 'ห้องปฏิบัติการคอมพิวเตอร์2 ');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'กิจกรรมเสริมหลักสูตร'),
(2, 'กิจกรรมรายวิชา'),
(3, 'กิจกรรมนักศึกษา');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `isteacher` tinyint(1) NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `Firstname` text COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `Years` int(11) DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `prefix`, `username`, `password`, `isteacher`, `isadmin`, `Firstname`, `Lastname`, `email`, `Years`, `image`) VALUES
(1, NULL, '58122516', '$2y$08$PZQnZfgorBljayY99TqaVuUBc3FGYy8hGvfji1m7wJ6wp/dAAZBqm', 0, 0, 'หฤษฎ์', 'คงทอง', NULL, NULL, 'img/user/1.jpg'),
(2, NULL, '58111410', '$2y$08$L2FYTnM1Mmlza0xNWmNodOfKDaFyFsdgERJLTupmAwe/EC4iXSBKS', 0, 0, 'โกเมศ', 'รักชุม', NULL, 2558, ''),
(3, NULL, '58112418', '$2y$08$T255c2tldnMzSEcycllpa.HD5kP9IjrQVlWYQNzU880HI1OcZW7Ya', 0, 0, 'ฉลองราช ', 'ประสิทธิวงศ์', NULL, 2558, ''),
(4, NULL, '58112970', '$2y$08$WEhHQ29IUkh1bnozdEZlRuXfGIN9mrk8TXm2hTgQeFZkZaKsxdALa', 0, 0, 'ชิดชนก', 'ยีสมัน', NULL, 2558, 'img/user/4.jpg'),
(5, NULL, '58113341', '$2y$08$RG1tb0FURlRMdnBMSVVreOyuqw.gFuuQeOnjSkynjvWO5FZq3CBsG', 0, 0, 'ฏอฮีเราะฮ์', 'ฮูซัยนี', NULL, 2558, ''),
(6, NULL, '58117656', '$2y$08$YXNHSDJic2R5S3lTOHoweO5uWI5RE685qXPYlPfunmfIqMlo7hJ2i', 0, 0, 'พรชัย', 'กลิ่นมาลา', NULL, 2558, ''),
(7, NULL, '58120379', '$2y$08$UWwrSWFQY3JBRDlzM21odutW1DegkkRvJCQwRaY3UhGtYyoORcPgy', 0, 0, 'วุฒิชัย', 'เพ็ชร์ทอง', NULL, 2558, ''),
(8, NULL, '58121435', '$2y$08$T09YbkgyY2dvc1RDYXdDZ.3FEwLRgDw9pQ9f8T0AM1YbnRIApIeAC', 0, 0, 'สิทธิชัย', 'เขียวเข็ม', NULL, 2558, ''),
(9, NULL, '58121856', '$2y$08$WUxDRjEvU0ljdHFuTlRFYONnZxasMhoF/YkyFtDxyGK8R25D3wgXC', 0, 0, 'สุทสา', 'จันหอม', NULL, 2558, ''),
(10, NULL, '58140500', '$2y$08$ekE1QXpVMERadGhGbVdvN.8cXB4HlfCPL6Xkc9o4x9EBetnhBX6rm', 0, 0, 'กิตปกรณ์', 'ทองเงิน', NULL, 2558, 'img/user/10.jpg'),
(11, NULL, '58141623', '$2y$08$cDFhaVdROVBhTVhuZlpNZ.giwl.PdEm2T9wz6pAeP2idmwlrES9iq', 0, 0, 'ทัศวัฒน์', 'รัตนพันธ์', NULL, 2558, 'img/user/11.jpg'),
(12, NULL, '58142753', '$2y$08$c0JMVm9IUnFiRzg0QUEvKu3CSM9ZUs/sPpBdrPaJ1b/M9p9rNlx3y', 0, 0, 'ประภาพร', 'มั่งมี', NULL, 2558, ''),
(13, NULL, '58143033', '$2y$08$M1liaFVoQUgrc1BtTWZOTOGe.HgHTDAw0nrLAR7sAcbZLqVs67yre', 0, 0, 'พงศธร', 'จันด้วง', NULL, 2558, ''),
(14, NULL, '58143900', '$2y$08$TForYzVvbkJFN3REZEFRTObYEfc/6JABco54Ncypsr0.wg.zV.pqW', 0, 0, 'มูฮัมหมัดมะฮ์ดี ', 'ราโอ๊ะ', NULL, 2558, 'img/user/14.jpg'),
(15, NULL, '58144239', '$2y$08$cFhhNHJsb0Rvdnl2L040auNO3nSpcIOJLUTcQSDtUJVplh1yVGIIq', 0, 0, 'ลิขสิทธิ์', ' สุขชาญ', NULL, 2558, ''),
(16, NULL, '58144924', '$2y$08$YkFNTUhoMmt4OWtFWHpLVu8imQrZgBtNpENlIMkrsug9dpfi/Mvtu', 0, 0, 'ศุภณัฐ', 'คุ้มปิยะผล', NULL, 2558, ''),
(17, NULL, '58145236', '$2y$08$N0k4aUE4R0pJUCtScTdXTuUcF2hVD1MyVDdTJHnbugolew8n1KMZ6', 0, 0, 'สุดารัตน์', 'ผิวอ่อน', NULL, 2558, 'img/user/17.jpg'),
(18, NULL, '58147406', '$2y$08$amFidyt4RUtUVGRSVnJ5MOfv9ThAA0diywkoPI4KB1LyZ8cHq.FUi', 0, 0, 'ธนากร', 'ลิ้มสกุล', NULL, 2558, ''),
(19, NULL, '58148602', '$2y$08$K0w3R3BNN1JnWDNrVVFhZO8qj.pfMvrMERt3PVKzLMtaPtBzoNhUK', 0, 0, 'สิริพร', 'พุทธวิริยะ', NULL, 2558, ''),
(20, NULL, '58149840', '$2y$08$eUZERFpFczBCZVRNN2xIS.7o8e8H2t.gHtsjeA/49x34kS6TamkC.', 0, 0, 'อลีฟ', 'รักไทรทอง', NULL, 2558, ''),
(21, NULL, '58162660', '$2y$08$NVJBMC9wSzllcmtnOHNFOOOGNAW7Mtl9wONQKATKk0AlNKsQAQdwu', 0, 0, 'สมศักดิ์', 'หมั่นถนอม', NULL, 2558, ''),
(22, NULL, '58162694', '$2y$08$b2s3aW5aSUZycVVLMWNtReBP/Z28Pej.7xPVI5OIijGZurnr3fAvy', 0, 0, 'สหรัฐ', 'รักดำ', NULL, 2558, ''),
(23, NULL, '57110181', '$2y$08$Y3o0d2tsMlFnWTRrU1NsQuXVw2a2urkJqoY6kNKJszZwHKBrwUdh2', 0, 0, 'กนกวรรณ', 'มีแก้ว', NULL, 2557, ''),
(24, NULL, '57110967', '$2y$08$VXJaejYzdzB0Qk55dFBoaugRCta3N78.fK5mROZlIj5Rrx62Xy5sC', 0, 0, 'กิตติพงศ์', 'สงทอง', NULL, 2557, ''),
(25, NULL, '57111460', '$2y$08$OTl6VzNFN3Fjdk1QaVpOTeeKxbm2pXO0GAUpoTex1s6iKAC.FjZEW', 0, 0, 'ครรชิต', 'แก้วเนื้ออ่อน', NULL, 2557, ''),
(26, NULL, '57112161', '$2y$08$nqYu4aAaRuivJBrVcjJthOtvwSVwAKXq1YlTBA4iX.htsNOy4xhtK', 0, 0, 'จุฑาภรณ์', 'พุ่มมณี', NULL, 2557, ''),
(27, NULL, '57112195', '$2y$08$TjTHAMvMhgMZYhxhj2iqO.W0/yr3Fq/mA0awi79G0M4csTpYcEL0.', 0, 0, 'จุฑามาศ', 'คงมีผล', NULL, 2557, ''),
(28, NULL, '57114712', '$2y$08$T2R1clFRajhRb0VCak1tUOJA63RYILiXCbkc4DkTQmfKvn9FQ1o/q', 0, 0, 'ธัญญบุตร', 'จันทร์ประสิทธิ์', NULL, 2557, ''),
(29, NULL, '57117442', '$2y$08$M2lDbmt3bGhIR285bjlzUOh.ZRzG8pNJm2T.6PpOdUFM01ivjBnue', 0, 0, 'พิรุณรัตน์', 'ลีละวัฒนพันธ์', NULL, 2557, ''),
(30, NULL, '57119935', '$2y$08$RW9BTGNYVGlYY3A0TXZLSuoiOnW283JIzZClebFXXnUHfbS7MpV8i', 0, 0, 'วิศิษฎ์ศักดิ์', 'ชูกลิ่น', NULL, 2557, ''),
(31, NULL, '57120230', '$2y$08$MHZ6STd2dGo2Yk9vMUlJU.IfhO95fFVjlmR/wpovbavB5.XMRgeCC', 0, 0, 'ศศิธร', 'วิชาดี', NULL, 2557, ''),
(32, NULL, '57122335', '$2y$08$enoyZ2s3V29tdVpNRXgyW.AeriCAv0Nj4mBBe9E9syGCiuZhmzYpK', 0, 0, 'เสาวลักษณ์', 'สุขสวัสดิ์', NULL, 2557, ''),
(33, NULL, '57123838', '$2y$08$UmhTVS82MnEvSm4yVlZPa.g37fGi.IegD1berl1iKuRg2LuyMVXrm', 0, 0, 'จารุเดช', 'ศรีประพันธ์', NULL, 2557, ''),
(34, NULL, '57140980', '$2y$08$YXc2WW1iVW5sSlBSOHZPWOpJHTqQKMaHlU.glxhZZkCtfjkURTG5W', 0, 0, 'จีรพัฒน์', 'วิหคหาญ', NULL, 2557, ''),
(35, NULL, '57142002', '$2y$08$MzRkSGlFQjF5cC9Wc0hhZe.JCk.duhW2AtJA841INw2vQFA87vGli', 0, 0, 'ธนิศร', 'หนูเดช', NULL, 2557, ''),
(36, NULL, '57143521', '$2y$08$cnV0UlY4Y0R4Y1R5dFduWO9rsF.7acuqcS4hEZOe047O9V/tCMnR6', 0, 0, 'พุธธิดา', 'จิตรธรรม', NULL, 2557, ''),
(37, NULL, '57143901', '$2y$08$eHRtQzR3T2RqSEZtNU8rUOIJXttudkE28rRTlYGa4/D2tKZFQiiyy', 0, 0, 'ยาเสร์', 'กาเร็ง', NULL, 2557, ''),
(38, NULL, '57144032', '$2y$08$Tk1JOXQ2V0pKb1haOU1Vb.SY6K7u7fIV.MC51fubOC9C.A1nzZH6C', 0, 0, 'รุจิภาส', 'ปันทโมรา', NULL, 2557, ''),
(39, NULL, '57146359', '$2y$08$cXJUV085c2FDUXNhbFFXZ.Nh0WXBrXSCUMXlHfubl.tvFUCpwu9jy', 0, 0, 'ฮานีฟ', 'หะยีหะมะ', NULL, 2557, ''),
(40, NULL, '57162620', '$2y$08$bm5tK2FKa2JPVTBSckNZNeUc0THWUxGof5DuWKGHhAlSnfJyDtDhm', 0, 0, 'สิรวิชญ์', 'วาสนาทิพย์', NULL, 2557, ''),
(41, NULL, '59112557', '$2y$08$RkjUeQAs6CTg1MNx25GbRe.w3ZC7dqJgM0oYs4zUaMbWkdyk8Y8uO', 0, 0, 'ชัยสิทธิ์', 'คุณาปกรณ์การ', NULL, 2559, ''),
(42, NULL, '59113423', '$2y$08$q2f9xIqCiDSo5R6gnfO0jert7bxhobSZqXlZdu3tYyp28nHvnfeiq', 0, 0, 'ณัฐดนัย', 'จารย์โพธิ์', NULL, 2559, ''),
(43, NULL, '59113589', '$2y$08$IIDYS1v8r46TQsp4FpEEReJvLyTshQG3aCNnCyNw2lbhaqFOL7OSu', 0, 0, 'ณัฐพล', 'บุญสุวรรณ์', NULL, 2559, ''),
(44, NULL, '59114462', '$2y$08$ZzJiTmQ3cDRCYytaZUZLMuJ5bkzZtnCjAFSQFKrdwWHeYX2rZpEHC', 0, 0, 'ธนวัฒน์', 'อุไรรัตน์', NULL, 2559, ''),
(45, NULL, '59114819', '$2y$08$c2M5endNaEVtVEhpQzNSO.GScOIZahup.WCLGjdRjTLgo3VVQ2ZcS', 0, 0, 'ธิดารัตน์', 'สุรัตวดี', NULL, 2559, ''),
(46, NULL, '59119438', '$2y$08$MUFtR3ZCNzBpRE5tNGxUdedqvvFVBUED59t5edGal4gl.1ct6QzDq', 0, 0, 'วณัฐพงค์', 'ปริตรศิรประภา	', NULL, 2559, ''),
(47, NULL, '59119610', '$2y$08$TU9mV01lWTlHTnNMeTVmO.lhzP0ZWn9suven.ZiaGPuFpKoOovnO2', 0, 0, 'วรวิบูล', 'ไกรแก้ว', NULL, 2559, ''),
(48, NULL, '59119941', '$2y$08$eW1VME0wWDA4M1AwVnF2OOhAEKLCr7GhwzHl3ZTL6ZhynWfKA/DJq', 0, 0, 'วิชุตา', 'หมาดอะดำ', NULL, 2559, ''),
(49, NULL, '59120535', '$2y$08$56BqNxGyQVXfwdosU5SyRuIgXBYQSWmAasu2dgNkUnFw5UeguzvnW', 0, 0, 'ศิริกัญญา', 'หัตถการ', NULL, 2559, ''),
(50, NULL, '59121368', '$2y$08$bkxXTlhJQnVVQVFiNHJpLuDqwpKq1nCkK6kV9EzRc22ae.clZX596', 0, 0, 'สิดารัศมิ์', 'ขาวบาง', NULL, 2559, ''),
(51, NULL, '59121970', '$2y$08$TTZWMUtHQU8zSFZ3K09oVeJQ.rN.vsFPV7iQppD2MIY76R1iK9NVm', 0, 0, 'สุภาวดี', 'โพธิ์แป้น', NULL, 2559, ''),
(52, NULL, '59123570', '$2y$08$QllnNUFPWDNKYkczN2tFeO.qkredaQG8fzPHST4LH7hmbIz1Cn5hO', 0, 0, 'อารีฟีน', 'กุลดี', NULL, 2559, ''),
(53, NULL, '59141242', '$2y$08$dUdIZWxCcDlXUXpBV1dtO.A86/47168Ty54GLqhRzoSaQR4cLtIN6', 0, 0, 'ณกรตา', 'เปียทอง', NULL, 2559, ''),
(54, NULL, '59141804', '$2y$08$UlkxUE9NSzIzNDJuZ0ZoMeSvzA6q2X0l0RPjE8eNUhiJdWGZVpwKS', 0, 0, 'ธฤตพงศ์', 'ตลึงจิตร', NULL, 2559, ''),
(55, NULL, '59142901', '$2y$08$SXJmMU9Kb2FMVFJuWVZKe.7vrFJ8QxDXOPAIx2HQPwolNpVVO3T9e', 0, 0, 'พัฒนะศักดิ์', 'พิเศษศิลป์', NULL, 2559, ''),
(56, NULL, '59145003', '$2y$08$dk9teHV1YzZYVTA1MGZLdOdztEjQfYu0cO7pVyCgOsbPAkJcbvEJG', 0, 0, 'อัสมาวี', 'ลาเตะ', NULL, 2559, ''),
(57, NULL, '59145219', '$2y$08$Wjh5cFgxVzNOTnI1ZHRwcOz1qMjUThcW.j73hmYHIhd5SAcEC.lHW', 0, 0, 'เอกวิชญ์', 'จำนงจิต', NULL, 2559, ''),
(58, NULL, '59147405', '$2y$08$VGdJbnRpKzdhWTd0WmU0RudolvNK071stxuAGqFD5lKR9bOgb.koa', 0, 0, 'ศุภษร', 'กังวาลก้อง', NULL, 2559, ''),
(59, NULL, '59147918', '$2y$08$kNrhzc93O0eGJnCXFSN4zODYUXplsa0bzzk5O3fss/A2nm0Zbd.ia', 0, 0, 'ณัฐวุฒิ', 'ชูบัวทอง', NULL, 2559, ''),
(60, NULL, '56110497', '$2y$08$dzNSelUzVURzSWFnYi9RZ.vp4.6N.WzCBsIb5Ap.a9P4hUkDW628G', 0, 0, 'กฤษฎา', 'หมัดอะดัม', NULL, 2556, ''),
(61, NULL, '5611240', '$2y$08$SXJObXViaHV1VGlyVzZ4cOoSVo89wfDw4vpNVzGD.IodlLefOZnC2', 0, 0, 'ชัยสิทธิ์', 'ลิ่มสกุล', NULL, 2556, ''),
(62, NULL, '56112949', '$2y$08$Z3cxWmdvazNEZmowM3V5beyoJD7MJNWCKoM8/Y/U8vXBUEsFZVup6', 0, 0, 'ณัฏฐิดา', 'สุวรรณพฤก', NULL, 2556, ''),
(63, NULL, '56115140', '$2y$08$ZVBZLzBqK21hUzgrUmZqOOMVUyrtM9DKmpe8ZF.uH1a3LH0l3atW.', 0, 0, 'ประทีป', 'คงกล้า', NULL, 2556, ''),
(64, NULL, '56116585', '$2y$08$am0xQnJDRHJLTEcvczFzWObS2h4xR7hiCbQlmBm7uHMgDQkKV8b1C', 0, 0, 'ภิรมย์พร', 'บุษบรรณ์', NULL, 2556, ''),
(65, NULL, '56120595', '$2y$08$SnhPclpwaDZGQnN6MTdjTubeb2IbVclL2fvm5MWxl5/B5ZVM34HhC', 0, 0, 'อรุณวงศ์', 'วัฒนภู่บริบูรณ์', NULL, 2556, ''),
(66, NULL, '56140619', '$2y$08$SS9ka2FkOTlGRmovR1V6T.uMGIT110vG4.ZiGOWKjO8ujTtou.MC6', 0, 0, 'ไกรสร', 'ฤทธิ์วงค์', NULL, 2556, ''),
(67, NULL, '56142680', '$2y$08$bXg1anFDem13WTZwTy9QWeFAkxVXSO20iFWNbZ5qmsgFFwfO35fJ.', 0, 0, 'นิสา', 'รักดี', NULL, 2556, ''),
(68, NULL, '56145592', '$2y$08$MTJzODNIYmtNTGtLNDRraups9oCedl9nreHvXFSyM/D/a6vTRs5Y6', 0, 0, 'สากีริน', 'ขามิ๊', NULL, 2556, ''),
(69, NULL, '56147242', '$2y$08$V3lmZVVoY1lON0IzRDQ3TOq2fAR.j78pqIyfkBrI1L2MOATL8YX4W', 0, 0, 'กฤษต', 'เหนือคลอง', NULL, 2556, ''),
(70, NULL, '56148562', '$2y$08$MEN0YllXNFdsU3VNVEw2VuRnRZ.AKAIAKLIecf4exBOiAdc7aZcuS', 0, 0, 'เจนสันต์', 'ริยาพันธ์', NULL, 2556, ''),
(71, NULL, '56149149', '$2y$08$dk9IVEphNkE4alFBZVlJdOdHrla7qZZ5OoekgxVjXeMlBosFdKaMu', 0, 0, ' นายนัทธพงศ์ ซุ่นสั้น', ' นายนัทธพงศ์ ซุ่นสั้น', NULL, 2556, ''),
(72, NULL, '56149214', '$2y$08$ZnFvZ0MxaGowYloxeHhZVeHKD21xCEvnvFMd3IE0qjKWYLv1/N2V.', 0, 0, 'สามารถ', 'นิลพงษ์', NULL, 2556, ''),
(73, NULL, '56161177', '$2y$08$SkpXSWpUOTZpclF5eXR6eecCc7J7sYrN8PFn0glSKIaBxoFu4k/sK', 0, 0, ' นายปรัชญา ยีขะเด', ' นายปรัชญา ยีขะเด', NULL, 2556, ''),
(74, NULL, '56162712', '$2y$08$VzV6VnE0cTZIRG13dkVuZ.YQAOjnqR10r5JHg8Bur3oRa3B9zrdGi', 0, 0, 'อัศม์เดช', 'โส้สมัน', NULL, 2556, ''),
(84, 'ผู้ช่วยศาสตราจารย์ ดร.', 'admin1', '$2y$08$ojsKN7yY2kG6luPXyXw7t.5BWKwK/Ok5Gd601Bz5eBpjvIJtBeLJi', 1, 1, 'ฐิมาพร', 'เพชรแก้ว', 'pthimapo@wu.ac.th', NULL, 'img/user/84.jpg'),
(85, 'ผู้ช่วยศาสตราจารย์', 'admin2', '$2y$08$MVhtbTBxN0tiOGlvYUNFKu5zKvj.Ac1NVJnMAKKt8FoeZZbKrpsKa', 1, 1, 'เยาวเรศ', 'ศิริสถิตย์กุล', 'syaowara@wu.ac.th', NULL, 'img/user/85.jpg'),
(86, 'ผู้ช่วยศาสตราจารย์', 'admin3', '$2y$08$VUdOb2VTK2FBb2RpS1hCaODxFo6Oyzegf2QSr/k9e6EB7t2WZDM2a', 1, 0, 'อุหมาด', 'หมัดอาด้ำ', 'muhamard@wu.ac.th', NULL, 'img/user/86.jpg'),
(87, 'อาจารย์ ดร.', 'admin4', '$2y$08$cVhHMzRUU3U1bGFKTTEra.Ap1dW2GaClnyjL089/J4oVt.Fh9nuvS', 1, 1, 'พุทธิพร', 'ธนธรรมเมธี', 'putthiporn.th@wu.ac.th', NULL, 'img/user/87.jpg'),
(88, 'อาจารย์', 'admin5', '$2y$08$cFRwV1pGb1RoSFpuYjE2cu8ZHP1nyb7.f8JogdgqwnQWSv2aj927W', 1, 0, 'ศิริภิญโญ', 'จันทมุณี', 'csiripin@wu.ac.th', NULL, 'img/user/88.jpg'),
(89, 'อาจารย์ ดร.', 'admin6', '$2y$08$VVpncG8wZ2dpdmJuTWl4ZOWBFHSBpAIDjHjXojirK09MCVg5VYh1O', 1, 0, 'กรัณรัตน์', 'ธรรมรักษ์', 'kanchan.th@wu.ac.th', NULL, 'img/user/89.jpg'),
(90, 'อาจารย์ ดร.', 'admin7', '$2y$08$OEVlQUl4TXVPVnhGZUhvbeyttD6bgVhPYC95su/CHUHPwLfvozJDO', 1, 0, 'จิตติมา', 'ศังขมณี	', 'sjidtima@wu.ac.th', NULL, 'img/user/90.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `yearofeducation`
--

DROP TABLE IF EXISTS `yearofeducation`;
CREATE TABLE `yearofeducation` (
  `semester` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `yearofeducation`
--

INSERT INTO `yearofeducation` (`semester`, `Year`, `StartDate`, `EndDate`) VALUES
(1, 1, NULL, NULL),
(1, 2558, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2558, NULL, NULL),
(2, 2559, NULL, NULL),
(3, 2553, NULL, NULL),
(3, 2558, NULL, NULL),
(3, 2559, NULL, NULL),
(3, 2560, '2017-06-01 21:58:23', '2017-06-01 21:58:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `teacher_id` (`teacher_id`,`yearofeducation_semester`,`yearofeducation_year`,`location_id`,`type_id`),
  ADD KEY `yearofeducation_semester` (`yearofeducation_semester`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `detailactivity`
--
ALTER TABLE `detailactivity`
  ADD PRIMARY KEY (`user_id`,`activity_id`),
  ADD KEY `user_id` (`user_id`,`activity_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `joinactivity`
--
ALTER TABLE `joinactivity`
  ADD PRIMARY KEY (`activity_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `yearofeducation`
--
ALTER TABLE `yearofeducation`
  ADD PRIMARY KEY (`semester`,`Year`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`yearofeducation_semester`) REFERENCES `yearofeducation` (`semester`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `activity_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `activity_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detailactivity`
--
ALTER TABLE `detailactivity`
  ADD CONSTRAINT `detailactivity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detailactivity_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `joinactivity`
--
ALTER TABLE `joinactivity`
  ADD CONSTRAINT `joinactivity_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  ADD CONSTRAINT `joinactivity_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
