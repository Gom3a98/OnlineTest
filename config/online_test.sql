-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2019 at 04:11 PM
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
(22, 'correct-5-4', '1', 5);

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
(1, 'algorithm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `exams_process`
--

CREATE TABLE `exams_process` (
  `epid` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `positionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exams_process`
--

INSERT INTO `exams_process` (`epid`, `user_name`, `deadline`, `positionId`) VALUES
(9, 'kemo', '2019-12-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_status`
--

CREATE TABLE `exam_status` (
  `record_id` int(11) NOT NULL,
  `examId` varchar(45) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `finishing_date` date DEFAULT NULL,
  `process_id` varchar(45) DEFAULT NULL,
  `preference` int(11) DEFAULT NULL,
  `isFinished` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_status`
--

INSERT INTO `exam_status` (`record_id`, `examId`, `score`, `finishing_date`, `process_id`, `preference`, `isFinished`) VALUES
(9, '1', 4, NULL, '9', 1, 1),
(10, '3', 0, NULL, '9', 2, 0);

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
(5, 'Question5', 1);

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
(27, '$2a$10$7yAYGThimR6UYd0kahrQF.dB7VSYuHwFk5WeqEzf8WBMHS8u/TDXG', 'admin@admin', 'admin', 'D:/fci/4th year/Level 4 Term 1/IS345 - Internet Applications/project2/OnlineTest/public/CVS/admin.pdf', '123');

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

CREATE TABLE `student_answer` (
  `studentName` varchar(50) NOT NULL,
  `questionBody` varchar(50) DEFAULT NULL,
  `answerBody` varchar(50) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `examTitle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_answer`
--

INSERT INTO `student_answer` (`studentName`, `questionBody`, `answerBody`, `correct`, `examTitle`) VALUES
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '11', '6', NULL, NULL),
('1', '11', '7', NULL, NULL),
('1', '11', '11', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '6', '1', NULL, NULL),
('1', '6', '2', NULL, NULL),
('1', '6', '3', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('1', '3', '4', NULL, NULL),
('1', '3', '5', NULL, NULL),
('1', '3', '10', NULL, NULL),
('2', '6', '1', NULL, NULL),
('2', '6', '2', NULL, NULL),
('2', '6', '3', NULL, NULL),
('2', '3', '4', NULL, NULL),
('2', '3', '5', NULL, NULL),
('2', '3', '10', NULL, NULL),
('2', '3', '4', NULL, NULL),
('2', '3', '5', NULL, NULL),
('2', '3', '10', NULL, NULL),
('2', '11', '6', NULL, NULL),
('2', '11', '7', NULL, NULL),
('2', '11', '11', NULL, NULL),
('2', '11', '6', NULL, NULL),
('2', '11', '7', NULL, NULL),
('2', '11', '11', NULL, NULL),
('2', '11', '6', NULL, NULL),
('2', '11', '7', NULL, NULL),
('2', '11', '11', NULL, NULL),
('4', '3', '4', NULL, NULL),
('4', '3', '5', NULL, NULL),
('4', '3', '10', NULL, NULL),
('3', '11', '6', NULL, NULL),
('3', '11', '7', NULL, NULL),
('3', '11', '11', NULL, NULL),
('5', '11', '6', NULL, NULL),
('5', '11', '7', NULL, NULL),
('5', '11', '11', NULL, NULL),
('5', '3', '4', NULL, NULL),
('5', '3', '5', NULL, NULL),
('5', '3', '10', NULL, NULL),
('5', '3', '4', NULL, NULL),
('5', '3', '5', NULL, NULL),
('5', '3', '10', NULL, NULL),
('5', '6', '1', NULL, NULL),
('5', '6', '2', NULL, NULL),
('5', '6', '3', NULL, NULL),
('6', '6', '3', NULL, NULL),
('6', '6', '2', NULL, NULL),
('6', '6', '1', NULL, NULL),
('6', '3', '5', NULL, NULL),
('6', '3', '10', NULL, NULL),
('6', '3', '4', NULL, NULL),
('6', '6', '3', NULL, NULL),
('6', '6', '1', NULL, NULL),
('6', '6', '2', NULL, NULL),
('6', '6', '2', NULL, NULL),
('6', '6', '3', NULL, NULL),
('6', '6', '1', NULL, NULL),
('6', '11', '6', NULL, NULL),
('6', '11', '7', NULL, NULL),
('6', '11', '11', NULL, NULL),
('6', '11', '11', NULL, NULL),
('6', '11', '6', NULL, NULL),
('6', '11', '7', NULL, NULL),
('6', '12', '16', NULL, NULL),
('6', '12', '12', NULL, NULL),
('6', '12', '13', NULL, NULL),
('6', '3', '10', NULL, NULL),
('6', '3', '4', NULL, NULL),
('6', '3', '5', NULL, NULL),
('6', '12', '16', NULL, NULL),
('6', '12', '14', NULL, NULL),
('6', '12', '12', NULL, NULL),
('6', '11', '7', NULL, NULL),
('6', '11', '6', NULL, NULL),
('6', '11', '11', NULL, NULL),
('6', '11', '7', NULL, NULL),
('6', '11', '6', NULL, NULL),
('6', '11', '11', NULL, NULL),
('6', '12', '16', NULL, NULL),
('6', '12', '12', NULL, NULL),
('6', '12', '13', NULL, NULL),
('7', '12', '15', NULL, NULL),
('7', '12', '14', NULL, NULL),
('7', '12', '16', NULL, NULL),
('7', '6', '3', NULL, NULL),
('7', '6', '2', NULL, NULL),
('7', '6', '1', NULL, NULL),
('7', '11', '6', NULL, NULL),
('7', '11', '7', NULL, NULL),
('7', '11', '11', NULL, NULL),
('7', '12', '13', NULL, NULL),
('7', '12', '14', NULL, NULL),
('7', '12', '16', NULL, NULL),
('7', '6', '3', NULL, NULL),
('7', '6', '2', NULL, NULL),
('7', '6', '1', NULL, NULL),
('7', '11', '7', NULL, NULL),
('7', '11', '6', NULL, NULL),
('7', '11', '11', NULL, NULL),
('7', '6', '2', NULL, NULL),
('7', '6', '3', NULL, NULL),
('7', '6', '1', NULL, NULL),
('7', '12', '14', NULL, NULL),
('7', '12', '13', NULL, NULL),
('7', '12', '12', NULL, NULL),
('8', '3', '4', NULL, NULL),
('8', '3', '5', NULL, NULL),
('8', '3', '10', NULL, NULL),
('8', '11', '6', NULL, NULL),
('8', '11', '7', NULL, NULL),
('8', '11', '11', NULL, NULL),
('8', '6', '2', NULL, NULL),
('8', '6', '3', NULL, NULL),
('8', '6', '1', NULL, NULL),
('8', '11', '7', NULL, NULL),
('8', '11', '6', NULL, NULL),
('8', '11', '11', NULL, NULL),
('0', '0', '0', 1, '[object Object]'),
('0', '0', '0', 1, 'algorithm'),
('0', '0', '0', 1, 'algorithm'),
('0', '0', '0', 1, 'algorithm'),
('admin', 'Question5', 'inCorrect-5-1', 0, 'algorithm'),
('admin', 'Question5', 'inCorrect-5-1', 0, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question3', 'inCorrect-3-4', 0, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question5', 'inCorrect-5-1', 0, 'algorithm'),
('admin', 'Question3', 'inCorrect-3-3', 0, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question1', 'inCorrect-1-4', 0, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question2', 'inCorrect-2-3', 0, 'algorithm'),
('admin', 'Question5', 'inCorrect-5-1', 0, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question4', 'inCorrect-4-3', 0, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question4', 'correct-4-2', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question4', 'inCorrect-4-3', 0, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question3', 'correct-3-1', 1, 'algorithm'),
('admin', 'Question5', 'correct-5-4', 1, 'algorithm'),
('admin', 'Question2', 'correct-2-4', 1, 'algorithm'),
('admin', 'Question1', 'correct-1-1', 1, 'algorithm'),
('admin', 'Question2', 'inCorrect-2-2', 0, 'algorithm'),
('admin', 'Question2', 'inCorrect-2-2', 0, 'algorithm'),
('admin', 'undefined', '', 0, 'algorithm'),
('admin', 'undefined', '', 0, 'algorithm');

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
-- Indexes for table `exam_status`
--
ALTER TABLE `exam_status`
  ADD PRIMARY KEY (`record_id`);

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
  MODIFY `epid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `exam_status`
--
ALTER TABLE `exam_status`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
