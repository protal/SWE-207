-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2017 at 09:00 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `Datail` text COLLATE utf8_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `YearSTD` text COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `yearofeducation_semester` int(11) NOT NULL,
  `yearofeducation_year` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `name`, `Datail`, `StartDate`, `EndDate`, `YearSTD`, `teacher_id`, `yearofeducation_semester`, `yearofeducation_year`, `location_id`, `type_id`) VALUES
(2, 'test name', 'test datail', '2017-06-01 22:01:05', '2017-06-01 22:01:05', '3', 1, 3, 2560, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detailactivity`
--

CREATE TABLE `detailactivity` (
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `room` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `room`) VALUES
(1, 'test name', 'test room');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'type test');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `isteacher` tinyint(1) NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `Firstname` text COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` text COLLATE utf8_unicode_ci NOT NULL,
  `Years` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `isteacher`, `isadmin`, `Firstname`, `Lastname`, `Years`) VALUES
(1, '58122516', '58122516', 0, 0, 'หฤษฎ์', 'คงทอง', 2558),
(2, '58111410', '$2y$08$L2FYTnM1Mmlza0xNWmNodOfKDaFyFsdgERJLTupmAwe/EC4iXSBKS', 0, 0, 'โกเมศ', 'รักชุม', 2558),
(3, '58112418', '$2y$08$T255c2tldnMzSEcycllpa.HD5kP9IjrQVlWYQNzU880HI1OcZW7Ya', 0, 0, 'ฉลองราช ', 'ประสิทธิวงศ์', 2558),
(4, '58112970', '$2y$08$WEhHQ29IUkh1bnozdEZlRuXfGIN9mrk8TXm2hTgQeFZkZaKsxdALa', 0, 0, 'ชิดชนก', 'ยีสมัน', 2558),
(5, '58113341', '$2y$08$RG1tb0FURlRMdnBMSVVreOyuqw.gFuuQeOnjSkynjvWO5FZq3CBsG', 0, 0, 'ฏอฮีเราะฮ์', 'ฮูซัยนี', 2558),
(6, '58117656', '$2y$08$YXNHSDJic2R5S3lTOHoweO5uWI5RE685qXPYlPfunmfIqMlo7hJ2i', 0, 0, 'พรชัย', 'กลิ่นมาลา', 2558),
(7, '58120379', '$2y$08$UWwrSWFQY3JBRDlzM21odutW1DegkkRvJCQwRaY3UhGtYyoORcPgy', 0, 0, 'วุฒิชัย', 'เพ็ชร์ทอง', 2558),
(8, '58121435', '$2y$08$T09YbkgyY2dvc1RDYXdDZ.3FEwLRgDw9pQ9f8T0AM1YbnRIApIeAC', 0, 0, 'สิทธิชัย', 'เขียวเข็ม', 2558),
(9, '58121856', '$2y$08$WUxDRjEvU0ljdHFuTlRFYONnZxasMhoF/YkyFtDxyGK8R25D3wgXC', 0, 0, 'สุทสา', 'จันหอม', 2558),
(10, '58140500', '$2y$08$ekE1QXpVMERadGhGbVdvN.8cXB4HlfCPL6Xkc9o4x9EBetnhBX6rm', 0, 0, 'กิตปกรณ์', 'ทองเงิน', 2558),
(11, '58141623', '$2y$08$cDFhaVdROVBhTVhuZlpNZ.giwl.PdEm2T9wz6pAeP2idmwlrES9iq', 0, 0, 'ทัศวัฒน์', 'รัตนพันธ์', 2558),
(12, '58142753', '$2y$08$c0JMVm9IUnFiRzg0QUEvKu3CSM9ZUs/sPpBdrPaJ1b/M9p9rNlx3y', 0, 0, 'ประภาพร', 'มั่งมี', 2558),
(13, '58143033', '$2y$08$M1liaFVoQUgrc1BtTWZOTOGe.HgHTDAw0nrLAR7sAcbZLqVs67yre', 0, 0, 'พงศธร', 'จันด้วง', 2558),
(14, '58143900', '$2y$08$TForYzVvbkJFN3REZEFRTObYEfc/6JABco54Ncypsr0.wg.zV.pqW', 0, 0, 'มูฮัมหมัดมะฮ์ดี ', 'ราโอ๊ะ', 2558),
(15, '58144239', '$2y$08$cFhhNHJsb0Rvdnl2L040auNO3nSpcIOJLUTcQSDtUJVplh1yVGIIq', 0, 0, 'ลิขสิทธิ์', ' สุขชาญ', 2558),
(16, '58144924', '$2y$08$YkFNTUhoMmt4OWtFWHpLVu8imQrZgBtNpENlIMkrsug9dpfi/Mvtu', 0, 0, 'ศุภณัฐ', 'คุ้มปิยะผล', 2558),
(17, '58145236', '$2y$08$N0k4aUE4R0pJUCtScTdXTuUcF2hVD1MyVDdTJHnbugolew8n1KMZ6', 0, 0, 'สุดารัตน์', 'ผิวอ่อน', 2558),
(18, '58147406', '$2y$08$amFidyt4RUtUVGRSVnJ5MOfv9ThAA0diywkoPI4KB1LyZ8cHq.FUi', 0, 0, 'ธนากร', 'ลิ้มสกุล', 2558),
(19, '58148602', '$2y$08$K0w3R3BNN1JnWDNrVVFhZO8qj.pfMvrMERt3PVKzLMtaPtBzoNhUK', 0, 0, 'สิริพร', 'พุทธวิริยะ', 2558),
(20, '58149840', '$2y$08$eUZERFpFczBCZVRNN2xIS.7o8e8H2t.gHtsjeA/49x34kS6TamkC.', 0, 0, 'อลีฟ', 'รักไทรทอง', 2558),
(21, '58162660', '$2y$08$NVJBMC9wSzllcmtnOHNFOOOGNAW7Mtl9wONQKATKk0AlNKsQAQdwu', 0, 0, 'สมศักดิ์', 'หมั่นถนอม', 2558),
(22, '58162694', '$2y$08$b2s3aW5aSUZycVVLMWNtReBP/Z28Pej.7xPVI5OIijGZurnr3fAvy', 0, 0, 'สหรัฐ', 'รักดำ', 2558),
(23, '57110181', '$2y$08$Y3o0d2tsMlFnWTRrU1NsQuXVw2a2urkJqoY6kNKJszZwHKBrwUdh2', 0, 0, 'กนกวรรณ', 'มีแก้ว', 2557),
(24, '57110967', '$2y$08$VXJaejYzdzB0Qk55dFBoaugRCta3N78.fK5mROZlIj5Rrx62Xy5sC', 0, 0, 'กิตติพงศ์', 'สงทอง', 2557),
(25, '57111460', '$2y$08$OTl6VzNFN3Fjdk1QaVpOTeeKxbm2pXO0GAUpoTex1s6iKAC.FjZEW', 0, 0, 'ครรชิต', 'แก้วเนื้ออ่อน', 2557),
(26, '57112161', '57223161', 0, 0, 'จุฑาภรณ์', 'พุ่มมณี', 2557),
(27, '57112195', '57112195', 0, 0, 'จุฑามาศ', 'คงมีผล', 2557),
(28, '57114712', '$2y$08$T2R1clFRajhRb0VCak1tUOJA63RYILiXCbkc4DkTQmfKvn9FQ1o/q', 0, 0, 'ธัญญบุตร', 'จันทร์ประสิทธิ์', 2557),
(29, '57117442', '$2y$08$M2lDbmt3bGhIR285bjlzUOh.ZRzG8pNJm2T.6PpOdUFM01ivjBnue', 0, 0, 'พิรุณรัตน์', 'ลีละวัฒนพันธ์', 2557),
(30, '57119935', '$2y$08$RW9BTGNYVGlYY3A0TXZLSuoiOnW283JIzZClebFXXnUHfbS7MpV8i', 0, 0, 'วิศิษฎ์ศักดิ์', 'ชูกลิ่น', 2557),
(31, '57120230', '$2y$08$MHZ6STd2dGo2Yk9vMUlJU.IfhO95fFVjlmR/wpovbavB5.XMRgeCC', 0, 0, 'ศศิธร', 'วิชาดี', 2557),
(32, '57122335', '$2y$08$enoyZ2s3V29tdVpNRXgyW.AeriCAv0Nj4mBBe9E9syGCiuZhmzYpK', 0, 0, 'เสาวลักษณ์', 'สุขสวัสดิ์', 2557),
(33, '57123838', '$2y$08$UmhTVS82MnEvSm4yVlZPa.g37fGi.IegD1berl1iKuRg2LuyMVXrm', 0, 0, 'จารุเดช', 'ศรีประพันธ์', 2557),
(34, '57140980', '$2y$08$YXc2WW1iVW5sSlBSOHZPWOpJHTqQKMaHlU.glxhZZkCtfjkURTG5W', 0, 0, 'จีรพัฒน์', 'วิหคหาญ', 2557),
(35, '57142002', '$2y$08$MzRkSGlFQjF5cC9Wc0hhZe.JCk.duhW2AtJA841INw2vQFA87vGli', 0, 0, 'ธนิศร', 'หนูเดช', 2557),
(36, '57143521', '$2y$08$cnV0UlY4Y0R4Y1R5dFduWO9rsF.7acuqcS4hEZOe047O9V/tCMnR6', 0, 0, 'พุธธิดา', 'จิตรธรรม', 2557),
(37, '57143901', '$2y$08$eHRtQzR3T2RqSEZtNU8rUOIJXttudkE28rRTlYGa4/D2tKZFQiiyy', 0, 0, 'ยาเสร์', 'กาเร็ง', 2557),
(38, '57144032', '$2y$08$Tk1JOXQ2V0pKb1haOU1Vb.SY6K7u7fIV.MC51fubOC9C.A1nzZH6C', 0, 0, 'รุจิภาส', 'ปันทโมรา', 2557),
(39, '57146359', '$2y$08$cXJUV085c2FDUXNhbFFXZ.Nh0WXBrXSCUMXlHfubl.tvFUCpwu9jy', 0, 0, 'ฮานีฟ', 'หะยีหะมะ', 2557),
(40, '57162620', '$2y$08$bm5tK2FKa2JPVTBSckNZNeUc0THWUxGof5DuWKGHhAlSnfJyDtDhm', 0, 0, 'สิรวิชญ์', 'วาสนาทิพย์', 2557),
(41, '59112557', '59112557', 0, 0, 'ชัยสิทธิ์', 'คุณาปกรณ์การ', 2559),
(42, '59113423', '59113423', 0, 0, 'ณัฐดนัย', 'จารย์โพธิ์', 2559),
(43, '59113589', '59113589', 0, 0, 'ณัฐพล', 'บุญสุวรรณ์', 2559),
(44, '59114462', '$2y$08$ZzJiTmQ3cDRCYytaZUZLMuJ5bkzZtnCjAFSQFKrdwWHeYX2rZpEHC', 0, 0, 'ธนวัฒน์', 'อุไรรัตน์', 2559),
(45, '59114819', '$2y$08$c2M5endNaEVtVEhpQzNSO.GScOIZahup.WCLGjdRjTLgo3VVQ2ZcS', 0, 0, 'ธิดารัตน์', 'สุรัตวดี', 2559),
(46, '59119438', '$2y$08$MUFtR3ZCNzBpRE5tNGxUdedqvvFVBUED59t5edGal4gl.1ct6QzDq', 0, 0, 'วณัฐพงค์', 'ปริตรศิรประภา	', 2559),
(47, '59119610', '$2y$08$TU9mV01lWTlHTnNMeTVmO.lhzP0ZWn9suven.ZiaGPuFpKoOovnO2', 0, 0, 'วรวิบูล', 'ไกรแก้ว', 2559),
(48, '59119941', '$2y$08$eW1VME0wWDA4M1AwVnF2OOhAEKLCr7GhwzHl3ZTL6ZhynWfKA/DJq', 0, 0, 'วิชุตา', 'หมาดอะดำ', 2559),
(49, '59120535', '59147918', 0, 0, 'ศิริกัญญา', 'หัตถการ', 2559),
(50, '59121368', '$2y$08$bkxXTlhJQnVVQVFiNHJpLuDqwpKq1nCkK6kV9EzRc22ae.clZX596', 0, 0, 'สิดารัศมิ์', 'ขาวบาง', 2559),
(51, '59121970', '$2y$08$TTZWMUtHQU8zSFZ3K09oVeJQ.rN.vsFPV7iQppD2MIY76R1iK9NVm', 0, 0, 'สุภาวดี', 'โพธิ์แป้น', 2559),
(52, '59123570', '$2y$08$QllnNUFPWDNKYkczN2tFeO.qkredaQG8fzPHST4LH7hmbIz1Cn5hO', 0, 0, 'อารีฟีน', 'กุลดี', 2559),
(53, '59141242', '$2y$08$dUdIZWxCcDlXUXpBV1dtO.A86/47168Ty54GLqhRzoSaQR4cLtIN6', 0, 0, 'ณกรตา', 'เปียทอง', 2559),
(54, '59141804', '$2y$08$UlkxUE9NSzIzNDJuZ0ZoMeSvzA6q2X0l0RPjE8eNUhiJdWGZVpwKS', 0, 0, 'ธฤตพงศ์', 'ตลึงจิตร', 2559),
(55, '59142901', '$2y$08$SXJmMU9Kb2FMVFJuWVZKe.7vrFJ8QxDXOPAIx2HQPwolNpVVO3T9e', 0, 0, 'พัฒนะศักดิ์', 'พิเศษศิลป์', 2559),
(56, '59145003', '$2y$08$dk9teHV1YzZYVTA1MGZLdOdztEjQfYu0cO7pVyCgOsbPAkJcbvEJG', 0, 0, 'อัสมาวี', 'ลาเตะ', 2559),
(57, '59145219', '$2y$08$Wjh5cFgxVzNOTnI1ZHRwcOz1qMjUThcW.j73hmYHIhd5SAcEC.lHW', 0, 0, 'เอกวิชญ์', 'จำนงจิต', 2559),
(58, '59147405', '$2y$08$VGdJbnRpKzdhWTd0WmU0RudolvNK071stxuAGqFD5lKR9bOgb.koa', 0, 0, 'ศุภษร', 'กังวาลก้อง', 2559),
(59, '59147918', '$2y$08$Y3A1NlliRGN1UGU2Zi8yMOGFN97cdIQRmRYzhlXTfsLcQfN9tyeUi', 0, 0, 'ณัฐวุฒิ', 'ชูบัวทอง', 2559),
(60, '56110497', '$2y$08$dzNSelUzVURzSWFnYi9RZ.vp4.6N.WzCBsIb5Ap.a9P4hUkDW628G', 0, 0, 'กฤษฎา', 'หมัดอะดัม', 2556),
(61, '5611240', '$2y$08$SXJObXViaHV1VGlyVzZ4cOoSVo89wfDw4vpNVzGD.IodlLefOZnC2', 0, 0, 'ชัยสิทธิ์', 'ลิ่มสกุล', 2556),
(62, '56112949', '$2y$08$Z3cxWmdvazNEZmowM3V5beyoJD7MJNWCKoM8/Y/U8vXBUEsFZVup6', 0, 0, 'ณัฏฐิดา', 'สุวรรณพฤก', 2556),
(63, '56115140', '$2y$08$ZVBZLzBqK21hUzgrUmZqOOMVUyrtM9DKmpe8ZF.uH1a3LH0l3atW.', 0, 0, 'ประทีป', 'คงกล้า', 2556),
(64, '56116585', '$2y$08$am0xQnJDRHJLTEcvczFzWObS2h4xR7hiCbQlmBm7uHMgDQkKV8b1C', 0, 0, 'ภิรมย์พร', 'บุษบรรณ์', 2556),
(65, '56120595', '$2y$08$SnhPclpwaDZGQnN6MTdjTubeb2IbVclL2fvm5MWxl5/B5ZVM34HhC', 0, 0, 'อรุณวงศ์', 'วัฒนภู่บริบูรณ์', 2556),
(66, '56140619', '$2y$08$SS9ka2FkOTlGRmovR1V6T.uMGIT110vG4.ZiGOWKjO8ujTtou.MC6', 0, 0, 'ไกรสร', 'ฤทธิ์วงค์', 2556),
(67, '56142680', '$2y$08$bXg1anFDem13WTZwTy9QWeFAkxVXSO20iFWNbZ5qmsgFFwfO35fJ.', 0, 0, 'นิสา', 'รักดี', 2556),
(68, '56145592', '$2y$08$MTJzODNIYmtNTGtLNDRraups9oCedl9nreHvXFSyM/D/a6vTRs5Y6', 0, 0, 'สากีริน', 'ขามิ๊', 2556),
(69, '56147242', '$2y$08$V3lmZVVoY1lON0IzRDQ3TOq2fAR.j78pqIyfkBrI1L2MOATL8YX4W', 0, 0, 'กฤษต', 'เหนือคลอง', 2556),
(70, '56148562', '$2y$08$MEN0YllXNFdsU3VNVEw2VuRnRZ.AKAIAKLIecf4exBOiAdc7aZcuS', 0, 0, 'เจนสันต์', 'ริยาพันธ์', 2556),
(71, '56149149', '$2y$08$dk9IVEphNkE4alFBZVlJdOdHrla7qZZ5OoekgxVjXeMlBosFdKaMu', 0, 0, ' นายนัทธพงศ์ ซุ่นสั้น', ' นายนัทธพงศ์ ซุ่นสั้น', 2556),
(72, '56149214', '$2y$08$ZnFvZ0MxaGowYloxeHhZVeHKD21xCEvnvFMd3IE0qjKWYLv1/N2V.', 0, 0, 'สามารถ', 'นิลพงษ์', 2556),
(73, '56161177', '$2y$08$SkpXSWpUOTZpclF5eXR6eecCc7J7sYrN8PFn0glSKIaBxoFu4k/sK', 0, 0, ' นายปรัชญา ยีขะเด', ' นายปรัชญา ยีขะเด', 2556),
(74, '56162712', '$2y$08$VzV6VnE0cTZIRG13dkVuZ.YQAOjnqR10r5JHg8Bur3oRa3B9zrdGi', 0, 0, 'อัศม์เดช', 'โส้สมัน', 2556);

-- --------------------------------------------------------

--
-- Table structure for table `yearofeducation`
--

CREATE TABLE `yearofeducation` (
  `semester` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `yearofeducation`
--

INSERT INTO `yearofeducation` (`semester`, `Year`, `StartDate`, `EndDate`) VALUES
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
