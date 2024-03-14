-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 04:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stu_result`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2024-03-14 07:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblclasses`
--

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) NOT NULL,
  `Section` varchar(5) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclasses`
--

INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Ten', 10, 'A', '2024-03-14 08:12:58', '0000-00-00 00:00:00'),
(2, 'Five', 5, 'A', '2024-03-14 13:26:31', '0000-00-00 00:00:00'),
(3, 'Five', 5, 'B', '2024-03-14 13:26:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(2, 1, 1, 1, 95, '2024-03-14 13:35:55', NULL),
(3, 1, 1, 5, 85, '2024-03-14 13:35:55', NULL),
(4, 1, 1, 6, 90, '2024-03-14 13:35:55', NULL),
(5, 1, 1, 2, 81, '2024-03-14 13:35:55', NULL),
(6, 1, 1, 4, 93, '2024-03-14 13:35:55', NULL),
(7, 1, 1, 3, 97, '2024-03-14 13:35:55', NULL),
(8, 3, 2, 2, 95, '2024-03-14 13:36:15', NULL),
(9, 3, 2, 9, 82, '2024-03-14 13:36:15', NULL),
(10, 3, 2, 4, 90, '2024-03-14 13:36:15', NULL),
(11, 3, 2, 8, 91, '2024-03-14 13:36:15', NULL),
(12, 3, 2, 7, 81, '2024-03-14 13:36:15', NULL),
(13, 2, 2, 2, 90, '2024-03-14 13:36:33', NULL),
(14, 2, 2, 9, 85, '2024-03-14 13:36:33', NULL),
(15, 2, 2, 4, 94, '2024-03-14 13:36:33', NULL),
(16, 2, 2, 8, 97, '2024-03-14 13:36:33', NULL),
(17, 2, 2, 7, 80, '2024-03-14 13:36:33', NULL),
(18, 5, 3, 2, 60, '2024-03-14 13:36:49', NULL),
(19, 5, 3, 9, 80, '2024-03-14 13:36:49', NULL),
(20, 5, 3, 4, 90, '2024-03-14 13:36:49', NULL),
(21, 5, 3, 8, 92, '2024-03-14 13:36:49', NULL),
(22, 5, 3, 7, 95, '2024-03-14 13:36:49', NULL),
(23, 4, 3, 2, 69, '2024-03-14 13:37:06', NULL),
(24, 4, 3, 9, 90, '2024-03-14 13:37:06', NULL),
(25, 4, 3, 4, 98, '2024-03-14 13:37:06', NULL),
(26, 4, 3, 8, 80, '2024-03-14 13:37:06', NULL),
(27, 4, 3, 7, 85, '2024-03-14 13:37:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) NOT NULL,
  `RollId` varchar(100) NOT NULL,
  `StudentEmail` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `DOB`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(1, 'Chayan Bain', '1', 'chayanbain3@gmail.com', 'Male', '2004-06-14', 1, '2024-03-14 08:13:34', NULL, 1),
(2, 'Supriya Roy', '2', 'chayanbain3@gmail.com', 'Male', '2024-03-14', 2, '2024-03-14 13:31:28', NULL, 1),
(3, 'Sandip Debnath', '3', 'chayanbain3@gmail.com', 'Male', '2024-03-14', 2, '2024-03-14 13:31:47', NULL, 1),
(4, 'Soumik Das', '50', 'chayanbain3@gmail.com', 'Male', '2024-03-13', 3, '2024-03-14 13:32:06', NULL, 1),
(5, 'Shri', '55', 'chayanbain3@gmail.com', 'Female', '2024-02-29', 3, '2024-03-14 13:32:34', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjectcombination`
--

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjectcombination`
--

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(1, 1, 1, 1, '2024-03-14 08:14:10', '2024-03-14 08:14:10'),
(2, 2, 9, 1, '2024-03-14 13:28:11', '2024-03-14 13:28:11'),
(3, 2, 2, 1, '2024-03-14 13:28:17', '2024-03-14 13:28:17'),
(4, 2, 4, 1, '2024-03-14 13:28:24', '2024-03-14 13:28:24'),
(5, 2, 7, 1, '2024-03-14 13:28:32', '2024-03-14 13:28:32'),
(6, 3, 2, 1, '2024-03-14 13:28:38', '2024-03-14 13:28:38'),
(7, 3, 4, 1, '2024-03-14 13:28:45', '2024-03-14 13:28:45'),
(8, 3, 7, 1, '2024-03-14 13:28:51', '2024-03-14 13:28:51'),
(9, 3, 8, 1, '2024-03-14 13:28:56', '2024-03-14 13:28:56'),
(10, 3, 9, 1, '2024-03-14 13:29:01', '2024-03-14 13:29:01'),
(11, 2, 8, 1, '2024-03-14 13:30:01', '2024-03-14 13:30:01'),
(12, 1, 2, 1, '2024-03-14 13:33:00', '2024-03-14 13:33:00'),
(13, 1, 4, 1, '2024-03-14 13:33:05', '2024-03-14 13:33:05'),
(14, 1, 3, 1, '2024-03-14 13:33:10', '2024-03-14 13:33:10'),
(15, 1, 5, 1, '2024-03-14 13:33:16', '2024-03-14 13:33:16'),
(16, 1, 6, 1, '2024-03-14 13:33:45', '2024-03-14 13:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) NOT NULL,
  `Creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Bengali', 'BEN_10', '2024-03-14 08:13:08', '0000-00-00 00:00:00'),
(2, 'English', 'Eng_10', '2024-03-14 13:24:58', '0000-00-00 00:00:00'),
(3, 'Physics', 'Phy_10', '2024-03-14 13:25:32', '0000-00-00 00:00:00'),
(4, 'Mathematics', 'Math_10', '2024-03-14 13:25:48', '0000-00-00 00:00:00'),
(5, 'Chemistry', 'Che_10', '2024-03-14 13:25:57', '0000-00-00 00:00:00'),
(6, 'Computer', 'com_10', '2024-03-14 13:26:06', '0000-00-00 00:00:00'),
(7, 'Social Science', 'S_10', '2024-03-14 13:27:19', '0000-00-00 00:00:00'),
(8, 'Science', 'Sci_10', '2024-03-14 13:27:29', '0000-00-00 00:00:00'),
(9, 'Hindi', 'H_10', '2024-03-14 13:27:39', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclasses`
--
ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblclasses`
--
ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
