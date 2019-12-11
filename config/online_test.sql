-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 08:07 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `aid` int(11) NOT NULL,
  `AnswerBody` varchar(45) NOT NULL,
  `correct` varchar(45) NOT NULL,
  `qid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`aid`, `AnswerBody`, `correct`, `qid`) VALUES
(1, 'log n', '1', 6),
(2, 'n^2', '0', 6),
(3, 'n', '0', 6),
(4, '(log n)^3', '0', 3),
(5, '(log n^2)', '0', 3),
(6, 'n^3', '0', 11),
(7, 'n', '0', 11),
(10, 'nlog n', '1', 3),
(11, 'n log n', '1', 11),
(12, '4', '1', 12),
(13, '5', '0', 12),
(14, '6', '0', 12),
(15, '9', '0', 12),
(16, '2*2', '1', 12),
(17, '12', '0', 0),
(18, 'asd', '0', 12),
(19, 'asd', '0', 12),
(20, 'asdasd', 'on', 5),
(21, 'asdasd', 'on', 5),
(22, 'amr', 'on', 5),
(23, 'amr', 'on', 5),
(24, 'fea', 'on', 34),
(25, '', 'on', 35),
(26, '', 'on', 35),
(27, '', 'on', 35),
(28, '', 'on', 35),
(29, '', 'on', 35),
(30, '', 'on', 35),
(31, '', 'on', 35),
(32, '', 'on', 0),
(33, '', 'on', 0),
(34, '', 'on', 0),
(35, 'aqwe', 'on', 6),
(36, 'aasdlasd', 'on', 6),
(38, '', 'on', 35);

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `applicationId` int(11) NOT NULL,
  `studentId` varchar(45) NOT NULL,
  `positionId` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `examID` int(50) NOT NULL,
  `examTitle` varchar(100) NOT NULL,
  `Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`examID`, `examTitle`, `Duration`) VALUES
(1, 'algorithm', 5),
(2, 'DS', 5),
(3, 'IA', 5),
(4, 'information System', 2),
(5, 'concept of programming', 9),
(6, 'amrr', 8),
(7, 'os', 5);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `title`, `description`, `availability`) VALUES
(1, 'sdfsdf', 'asdasdasd', 1),
(2, 'ASDQWDQ', 'ASDL,ASDASD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qid` int(11) NOT NULL,
  `questionBody` varchar(45) DEFAULT NULL,
  `examID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `questionBody`, `examID`) VALUES
(1, 'how are you', 5),
(3, 'Complexty of Quick sort?', 1),
(6, 'Complexty of Binary Search?', 1),
(11, 'Complexty of Merge Sort?', 1),
(12, '2*2', 2),
(14, 'asdasd', 9),
(15, 'sdlsdlsd', 5),
(16, 'asd', 5),
(17, 'asld,asd', 5),
(18, 'sad', 5),
(20, 'asdqweqwe', 5),
(22, 'asdqweqweqwel,fd', 5),
(24, 'amr', 5),
(26, 'ahmed', 5),
(27, 'alllll', 5),
(28, 'kk', 5),
(31, 'asdqwelpds', 5),
(33, 'amrr', 5),
(34, 'how are you manssss', 6),
(35, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `CV` varchar(200) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `password`, `email`, `user_name`, `CV`, `phone_number`) VALUES
(1, '123456', 'elkingamr46@yahoo.com', 'amr mohamed fahmy', NULL, '123456'),
(2, '123456', 'elkasdqw@yahoo.com', 'amr mohamed fahmyqweqwe', NULL, '123456'),
(3, '1234', 'kkrem551@gmail.com', 'gomma', NULL, '0101010101'),
(4, '12', 'ddgdgd@yahoo.ocm', 'gomma', NULL, '12'),
(5, '1212', 'amrfahmy300210@gmail.com', 'gomma', NULL, '123123'),
(23, '$2a$05$EWW474VpnrrDJAEpoi59/O40tbeJ5dK9AeTTkB', 'ahmed@ahmed', 'ahmed', NULL, '123'),
(24, '$2a$05$oX84RlRbNy32S1o14ssaxumGaCo40LTgy.mNSF', 'amr@amr', 'amr', NULL, '123'),
(25, '$2a$10$gTwRaNquJymHULkeNdCauOUDtxCZ/kNe7ASerN/e0HdJPd/r7AGHC', 'amr2@amr', 'amr2', NULL, '123'),
(26, '$2a$10$yaz/lM0SB7bH9b.6wNbHxekTBSGJmVOZhnNK6ne.Gf.UVBb6KIOS2', 'amr@amr', 'amr', NULL, '123'),
(27, '$2a$10$7yAYGThimR6UYd0kahrQF.dB7VSYuHwFk5WeqEzf8WBMHS8u/TDXG', 'admin@admin', 'admin', 'D:/fci/4th year/Level 4 Term 1/IS345 - Intern', '123');

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

CREATE TABLE `student_answer` (
  `sid` int(11) NOT NULL,
  `qid` int(11) DEFAULT NULL,
  `answerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_answer`
--

INSERT INTO `student_answer` (`sid`, `qid`, `answerId`) VALUES
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 11, 6),
(1, 11, 7),
(1, 11, 11),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 6, 1),
(1, 6, 2),
(1, 6, 3),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(1, 3, 4),
(1, 3, 5),
(1, 3, 10),
(2, 6, 1),
(2, 6, 2),
(2, 6, 3),
(2, 3, 4),
(2, 3, 5),
(2, 3, 10),
(2, 3, 4),
(2, 3, 5),
(2, 3, 10),
(2, 11, 6),
(2, 11, 7),
(2, 11, 11),
(2, 11, 6),
(2, 11, 7),
(2, 11, 11),
(2, 11, 6),
(2, 11, 7),
(2, 11, 11),
(4, 3, 4),
(4, 3, 5),
(4, 3, 10),
(3, 11, 6),
(3, 11, 7),
(3, 11, 11),
(5, 11, 6),
(5, 11, 7),
(5, 11, 11),
(5, 3, 4),
(5, 3, 5),
(5, 3, 10),
(5, 3, 4),
(5, 3, 5),
(5, 3, 10),
(5, 6, 1),
(5, 6, 2),
(5, 6, 3),
(6, 6, 3),
(6, 6, 2),
(6, 6, 1),
(6, 3, 5),
(6, 3, 10),
(6, 3, 4),
(6, 6, 3),
(6, 6, 1),
(6, 6, 2),
(6, 6, 2),
(6, 6, 3),
(6, 6, 1),
(6, 11, 6),
(6, 11, 7),
(6, 11, 11),
(6, 11, 11),
(6, 11, 6),
(6, 11, 7),
(6, 12, 16),
(6, 12, 12),
(6, 12, 13),
(6, 3, 10),
(6, 3, 4),
(6, 3, 5),
(6, 12, 16),
(6, 12, 14),
(6, 12, 12),
(6, 11, 7),
(6, 11, 6),
(6, 11, 11),
(6, 11, 7),
(6, 11, 6),
(6, 11, 11),
(6, 12, 16),
(6, 12, 12),
(6, 12, 13),
(7, 12, 15),
(7, 12, 14),
(7, 12, 16),
(7, 6, 3),
(7, 6, 2),
(7, 6, 1),
(7, 11, 6),
(7, 11, 7),
(7, 11, 11),
(7, 12, 13),
(7, 12, 14),
(7, 12, 16),
(7, 6, 3),
(7, 6, 2),
(7, 6, 1),
(7, 11, 7),
(7, 11, 6),
(7, 11, 11),
(7, 6, 2),
(7, 6, 3),
(7, 6, 1),
(7, 12, 14),
(7, 12, 13),
(7, 12, 12),
(8, 3, 4),
(8, 3, 5),
(8, 3, 10),
(8, 11, 6),
(8, 11, 7),
(8, 11, 11),
(8, 6, 2),
(8, 6, 3),
(8, 6, 1),
(8, 11, 7),
(8, 11, 6),
(8, 11, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`applicationId`),
  ADD UNIQUE KEY `applicationId_UNIQUE` (`applicationId`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`examID`),
  ADD UNIQUE KEY `examTitle` (`examTitle`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qid`),
  ADD UNIQUE KEY `questionBody` (`questionBody`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `applicationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `examID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
