-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2019 at 02:27 AM
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
(1, 'correct-1-1', '1', 1),
(2, 'inCorrect-1-2', '0', 1),
(3, 'inCorrect-1-3', '0', 1),
(4, 'inCorrect-1-4', '0', 1),
(5, 'inCorrect-2-1', '0', 2),
(6, 'inCorrect-2-2', '0', 2),
(7, 'inCorrect-2-3', '0', 2),
(10, 'correct-2-4', '1', 2),
(11, 'correct-3-1', '1', 3),
(12, 'inCorrect-3-2', '0', 3),
(13, 'inCorrect-3-3', '0', 3),
(14, 'inCorrect-3-4', '0', 3),
(15, 'inCorrect-4-1', '0', 4),
(16, 'correct-4-2', '1', 4),
(17, 'inCorrect-4-3', '0', 4),
(18, 'inCorrect-4-4', '0', 4),
(19, 'inCorrect-5-1', '0', 5),
(20, 'inCorrect-5-2', '0', 5),
(21, 'inCorrect-5-3', '0', 5),
(22, 'correct-5-4', '1', 5),
(23, 'amr', '0', 17),
(24, 'fea', '1', 17),
(25, '', '0', 15),
(26, '', '0', 16),
(27, '', '1', 15),
(28, '', '0', 15),
(29, '', '1', 15),
(30, '', 'on', 15),
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

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`applicationId`, `studentId`, `positionId`) VALUES
(1, '26', '1'),
(5, '26', '1');

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
(1, 'algorithm', 2000),
(2, 'DS', 5),
(3, 'IA', 5),
(4, 'information System', 2),
(5, 'concept of programming', 9),
(6, 'amrr', 8),
(7, 'os', 5);

-- --------------------------------------------------------

--
-- Table structure for table `exams_process`
--

CREATE TABLE `exams_process` (
  `epid` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `Exams` text,
  `deadline` date DEFAULT NULL,
  `scores` text,
  `positionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exams_process`
--

INSERT INTO `exams_process` (`epid`, `user_name`, `Exams`, `deadline`, `scores`, `positionId`) VALUES
(1, 'admin', '1-2-3-4-5', '2012-03-13', '50', 50);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `pid` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`pid`, `title`, `description`, `availability`) VALUES
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
(1, 'Question1', 1),
(2, 'Question2', 1),
(3, 'Question3', 1),
(4, 'Question4', 1),
(5, 'Question5', 1),
(6, 'asdasd', 2),
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
(27, '$2a$10$7yAYGThimR6UYd0kahrQF.dB7VSYuHwFk5WeqEzf8WBMHS8u/TDXG', 'admin@admin', 'admin', 'D:/fci/4th year/Level 4 Term 1/IS345 - Internet Applications/project2/OnlineTest/public/CVS/admin.pdf', '123'),
(28, '$2a$10$SgviNUYDEncGF1lX6IcC4em7Dxqljz33ouk7ZTPCTgwcLwvBkO20W', 'fahmy@fahmy', 'fahmy', NULL, '123'),
(29, '$2a$10$fCPDozUEJ8pycRxcqSLLaeAMCsp1QDZ74ps.gim4rX5KeEJGyjd/q', 'elkingamr46@yahoo.com', 'elkingamr46', NULL, '123');

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
-- Indexes for table `exams_process`
--
ALTER TABLE `exams_process`
  ADD PRIMARY KEY (`epid`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`pid`);

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
  MODIFY `applicationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `examID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exams_process`
--
ALTER TABLE `exams_process`
  MODIFY `epid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
