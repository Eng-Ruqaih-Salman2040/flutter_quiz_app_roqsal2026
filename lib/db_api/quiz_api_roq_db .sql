-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2025 at 10:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_api_roq_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text DEFAULT NULL,
  `answer_b` text DEFAULT NULL,
  `answer_c` text DEFAULT NULL,
  `answer_d` text DEFAULT NULL,
  `answer_e` text DEFAULT NULL,
  `answer_f` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `answer_e`, `answer_f`) VALUES
(1, 1, 'Web development', 'Mobile app development', 'Game development', 'Data analysis', NULL, NULL),
(2, 2, 'var', 'let', 'const', 'def', NULL, NULL),
(3, 3, 'main()', 'init()', 'start()', 'run()', NULL, NULL),
(4, 4, 'Microsoft', 'Google', 'Facebook', 'Apple', NULL, NULL),
(5, 5, 'Compiled', 'Interpreted', 'Both', 'Neither', NULL, NULL),
(6, 6, 'Just-In-Time', 'JavaScript-In-Tandem', 'Java-Interop-Tool', 'Jump-If-True', NULL, NULL),
(7, 7, 'To implement multiple inheritance', 'To create singletons', 'For memory optimization', 'For type safety', NULL, NULL),
(8, 8, 'Yes', 'No', 'Sometimes', 'Depends on version', NULL, NULL),
(9, 9, 'Web development', 'Mobile app development', 'Game development', 'Data analysis', NULL, NULL),
(10, 10, 'Container', 'Column', 'Row', 'All of the above', NULL, NULL),
(11, 11, 'Enhanced C', 'C with Classes', 'Compiled C', 'C with Objects', NULL, NULL),
(12, 12, 'Web development', 'Data science', 'Scripting', 'All of the above', NULL, NULL),
(13, 13, 'Her', 'Wear', 'Carry', 'Road', NULL, NULL),
(14, 14, 'True', 'False', NULL, NULL, NULL, NULL),
(15, 15, 'Southern', 'My', 'Company', 'Term', NULL, NULL),
(16, 16, 'True', 'False', NULL, NULL, NULL, NULL),
(17, 17, 'Seven', 'Back', 'Important', 'Put', NULL, NULL),
(18, 18, 'True', 'False', NULL, NULL, NULL, NULL),
(19, 19, 'Movement', 'Project', 'Today', 'Smile', NULL, NULL),
(20, 20, 'True', 'False', NULL, NULL, NULL, NULL),
(21, 21, 'Decide', 'Onto', 'Recognize', 'We', NULL, NULL),
(22, 22, 'True', 'False', NULL, NULL, NULL, NULL),
(23, 23, 'Apply', 'One', 'Rule', 'Practice', NULL, NULL),
(24, 24, 'True', 'False', NULL, NULL, NULL, NULL),
(25, 25, 'Cause', 'Take', 'Wear', 'Ok', NULL, NULL),
(26, 26, 'True', 'False', NULL, NULL, NULL, NULL),
(27, 27, 'Top', 'Adult', 'Billion', 'List', NULL, NULL),
(28, 28, 'True', 'False', NULL, NULL, NULL, NULL),
(29, 29, 'Right', 'Art', 'Fund', 'Price', NULL, NULL),
(30, 30, 'True', 'False', NULL, NULL, NULL, NULL),
(31, 31, 'South', 'Treat', 'Before', 'Eat', NULL, NULL),
(32, 32, 'True', 'False', NULL, NULL, NULL, NULL),
(33, 33, 'Animal', 'Consumer', 'Nothing', 'Someone', NULL, NULL),
(34, 34, 'True', 'False', NULL, NULL, NULL, NULL),
(35, 35, 'Century', 'Certain', 'Five', 'Finally', NULL, NULL),
(36, 36, 'True', 'False', NULL, NULL, NULL, NULL),
(37, 37, 'Put', 'Discuss', 'Far', 'Morning', NULL, NULL),
(38, 38, 'True', 'False', NULL, NULL, NULL, NULL),
(39, 39, 'Employee', 'Right', 'Region', 'National', NULL, NULL),
(40, 40, 'True', 'False', NULL, NULL, NULL, NULL),
(41, 41, 'Surface', 'Defense', 'Win', 'Success', NULL, NULL),
(42, 42, 'True', 'False', NULL, NULL, NULL, NULL),
(43, 43, 'Special', 'Thought', 'Will', 'Ten', NULL, NULL),
(44, 44, 'True', 'False', NULL, NULL, NULL, NULL),
(45, 45, 'Structure', 'Into', 'Process', 'Toward', NULL, NULL),
(46, 46, 'True', 'False', NULL, NULL, NULL, NULL),
(47, 47, 'Generation', 'Walk', 'Computer', 'Reveal', NULL, NULL),
(48, 48, 'True', 'False', NULL, NULL, NULL, NULL),
(49, 49, 'Policy', 'Example', 'Program', 'Resource', NULL, NULL),
(50, 50, 'True', 'False', NULL, NULL, NULL, NULL),
(51, 51, 'Discussion', 'Fine', 'Money', 'Mean', NULL, NULL),
(52, 52, 'True', 'False', NULL, NULL, NULL, NULL),
(53, 53, 'Wife', 'General', 'Fire', 'During', NULL, NULL),
(54, 54, 'True', 'False', NULL, NULL, NULL, NULL),
(55, 55, 'What', 'Quality', 'Story', 'Total', NULL, NULL),
(56, 56, 'True', 'False', NULL, NULL, NULL, NULL),
(57, 57, 'Evening', 'Sign', 'Issue', 'Type', NULL, NULL),
(58, 58, 'True', 'False', NULL, NULL, NULL, NULL),
(59, 59, 'Glass', 'Evidence', 'Change', 'Life', NULL, NULL),
(60, 60, 'True', 'False', NULL, NULL, NULL, NULL),
(61, 61, 'Fight', 'Someone', 'Detail', 'Score', NULL, NULL),
(62, 62, 'True', 'False', NULL, NULL, NULL, NULL),
(63, 63, 'Class', 'Piece', 'Industry', 'Weight', NULL, NULL),
(64, 64, 'True', 'False', NULL, NULL, NULL, NULL),
(65, 65, 'Guy', 'Score', 'Change', 'Minute', NULL, NULL),
(66, 66, 'True', 'False', NULL, NULL, NULL, NULL),
(67, 67, 'Site', 'Follow', 'What', 'With', NULL, NULL),
(68, 68, 'True', 'False', NULL, NULL, NULL, NULL),
(69, 69, 'Especially', 'However', 'Grow', 'Allow', NULL, NULL),
(70, 70, 'True', 'False', NULL, NULL, NULL, NULL),
(71, 71, 'Still', 'System', 'Hair', 'Institution', NULL, NULL),
(72, 72, 'True', 'False', NULL, NULL, NULL, NULL),
(73, 73, 'Daughter', 'Above', 'Young', 'Say', NULL, NULL),
(74, 74, 'True', 'False', NULL, NULL, NULL, NULL),
(75, 75, 'Laugh', 'Approach', 'However', 'Condition', NULL, NULL),
(76, 76, 'True', 'False', NULL, NULL, NULL, NULL),
(77, 77, 'Card', 'Maybe', 'War', 'Scene', NULL, NULL),
(78, 78, 'True', 'False', NULL, NULL, NULL, NULL),
(79, 79, 'Seat', 'Citizen', 'Dinner', 'Physical', NULL, NULL),
(80, 80, 'True', 'False', NULL, NULL, NULL, NULL),
(81, 81, 'Develop', 'Appear', 'Key', 'Fast', NULL, NULL),
(82, 82, 'True', 'False', NULL, NULL, NULL, NULL),
(83, 83, 'Eye', 'Agree', 'Data', 'Suggest', NULL, NULL),
(84, 84, 'True', 'False', NULL, NULL, NULL, NULL),
(85, 85, 'For', 'Population', 'Piece', 'Side', NULL, NULL),
(86, 86, 'True', 'False', NULL, NULL, NULL, NULL),
(87, 87, 'Pressure', 'Agreement', 'Sure', 'Simple', NULL, NULL),
(88, 88, 'True', 'False', NULL, NULL, NULL, NULL),
(89, 89, 'By', 'Certainly', 'Republican', 'Financial', NULL, NULL),
(90, 90, 'True', 'False', NULL, NULL, NULL, NULL),
(91, 91, 'Anything', 'Military', 'Black', 'Arm', NULL, NULL),
(92, 92, 'True', 'False', NULL, NULL, NULL, NULL),
(93, 93, 'Clearly', 'Shoulder', 'Training', 'Pass', NULL, NULL),
(94, 94, 'True', 'False', NULL, NULL, NULL, NULL),
(95, 95, 'Easy', 'Music', 'Wall', 'Couple', NULL, NULL),
(96, 96, 'True', 'False', NULL, NULL, NULL, NULL),
(97, 97, 'Myself', 'General', 'Down', 'Rise', NULL, NULL),
(98, 98, 'True', 'False', NULL, NULL, NULL, NULL),
(99, 99, 'Let', 'Eight', 'Of', 'I', NULL, NULL),
(100, 100, 'True', 'False', NULL, NULL, NULL, NULL),
(101, 101, 'Tell', 'Onto', 'Major', 'Program', NULL, NULL),
(102, 102, 'True', 'False', NULL, NULL, NULL, NULL),
(103, 103, 'Probably', 'Every', 'Even', 'Soon', NULL, NULL),
(104, 104, 'True', 'False', NULL, NULL, NULL, NULL),
(105, 105, 'Similar', 'Again', 'Officer', 'Human', NULL, NULL),
(106, 106, 'True', 'False', NULL, NULL, NULL, NULL),
(107, 107, 'Clearly', 'Animal', 'Off', 'Five', NULL, NULL),
(108, 108, 'True', 'False', NULL, NULL, NULL, NULL),
(109, 109, 'Benefit', 'Agent', 'Ask', 'Year', NULL, NULL),
(110, 110, 'True', 'False', NULL, NULL, NULL, NULL),
(111, 111, 'Research', 'Forward', 'Here', 'Campaign', NULL, NULL),
(112, 112, 'True', 'False', NULL, NULL, NULL, NULL),
(113, 113, 'Range', 'They', 'Little', 'Degree', NULL, NULL),
(114, 114, 'True', 'False', NULL, NULL, NULL, NULL),
(115, 115, 'Good', 'Could', 'Total', 'Specific', NULL, NULL),
(116, 116, 'True', 'False', NULL, NULL, NULL, NULL),
(117, 117, 'Trial', 'These', 'Job', 'Forget', NULL, NULL),
(118, 118, 'True', 'False', NULL, NULL, NULL, NULL),
(119, 119, 'Simple', 'Language', 'Door', 'Police', NULL, NULL),
(120, 120, 'True', 'False', NULL, NULL, NULL, NULL),
(121, 121, 'Section', 'Himself', 'You', 'They', NULL, NULL),
(122, 122, 'True', 'False', NULL, NULL, NULL, NULL),
(123, 123, 'Own', 'Economic', 'Put', 'Member', NULL, NULL),
(124, 124, 'True', 'False', NULL, NULL, NULL, NULL),
(125, 125, 'Wind', 'A', 'Remain', 'Best', NULL, NULL),
(126, 126, 'True', 'False', NULL, NULL, NULL, NULL),
(127, 127, 'Home', 'While', 'Race', 'He', NULL, NULL),
(128, 128, 'True', 'False', NULL, NULL, NULL, NULL),
(129, 129, 'Entire', 'Let', 'Price', 'Four', NULL, NULL),
(130, 130, 'True', 'False', NULL, NULL, NULL, NULL),
(131, 131, 'Hospital', 'Strong', 'Activity', 'Market', NULL, NULL),
(132, 132, 'True', 'False', NULL, NULL, NULL, NULL),
(133, 133, 'Work', 'Can', 'Start', 'Good', NULL, NULL),
(134, 134, 'True', 'False', NULL, NULL, NULL, NULL),
(135, 135, 'Opportunity', 'Third', 'Image', 'Myself', NULL, NULL),
(136, 136, 'True', 'False', NULL, NULL, NULL, NULL),
(137, 137, 'Itself', 'Herself', 'Respond', 'Authority', NULL, NULL),
(138, 138, 'True', 'False', NULL, NULL, NULL, NULL),
(139, 139, 'Second', 'Subject', 'Full', 'Tv', NULL, NULL),
(140, 140, 'True', 'False', NULL, NULL, NULL, NULL),
(141, 141, 'Protect', 'Get', 'Debate', 'Detail', NULL, NULL),
(142, 142, 'True', 'False', NULL, NULL, NULL, NULL),
(143, 143, 'Can', 'Chair', 'Law', 'Court', NULL, NULL),
(144, 144, 'True', 'False', NULL, NULL, NULL, NULL),
(145, 145, 'Turn', 'Foot', 'Successful', 'War', NULL, NULL),
(146, 146, 'True', 'False', NULL, NULL, NULL, NULL),
(147, 147, 'Decade', 'Eight', 'Pick', 'Hit', NULL, NULL),
(148, 148, 'True', 'False', NULL, NULL, NULL, NULL),
(149, 149, 'Responsibility', 'Protect', 'Draw', 'Sister', NULL, NULL),
(150, 150, 'True', 'False', NULL, NULL, NULL, NULL),
(151, 151, 'If', 'Want', 'Data', 'Buy', NULL, NULL),
(152, 152, 'True', 'False', NULL, NULL, NULL, NULL),
(153, 153, 'Into', 'Next', 'Bring', 'White', NULL, NULL),
(154, 154, 'True', 'False', NULL, NULL, NULL, NULL),
(155, 155, 'Particular', 'Thank', 'Just', 'Agent', NULL, NULL),
(156, 156, 'True', 'False', NULL, NULL, NULL, NULL),
(157, 157, 'Save', 'Protect', 'Enough', 'Daughter', NULL, NULL),
(158, 158, 'True', 'False', NULL, NULL, NULL, NULL),
(159, 159, 'Far', 'Where', 'Management', 'Wish', NULL, NULL),
(160, 160, 'True', 'False', NULL, NULL, NULL, NULL),
(161, 161, 'Might', 'Discussion', 'Drug', 'Allow', NULL, NULL),
(162, 162, 'True', 'False', NULL, NULL, NULL, NULL),
(163, 163, 'Chair', 'One', 'Continue', 'Management', NULL, NULL),
(164, 164, 'True', 'False', NULL, NULL, NULL, NULL),
(165, 165, 'Ok', 'Not', 'Major', 'Lead', NULL, NULL),
(166, 166, 'True', 'False', NULL, NULL, NULL, NULL),
(167, 167, 'Nice', 'Tough', 'Beyond', 'Food', NULL, NULL),
(168, 168, 'True', 'False', NULL, NULL, NULL, NULL),
(169, 169, 'Affect', 'Cultural', 'Church', 'Dream', NULL, NULL),
(170, 170, 'True', 'False', NULL, NULL, NULL, NULL),
(171, 171, 'Force', 'Real', 'Country', 'Statement', NULL, NULL),
(172, 172, 'True', 'False', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(3, 'C++'),
(1, 'Dart'),
(2, 'Flutter'),
(4, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `correct_answers`
--

CREATE TABLE `correct_answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a_correct` enum('true','false') DEFAULT 'false',
  `answer_b_correct` enum('true','false') DEFAULT 'false',
  `answer_c_correct` enum('true','false') DEFAULT 'false',
  `answer_d_correct` enum('true','false') DEFAULT 'false',
  `answer_e_correct` enum('true','false') DEFAULT 'false',
  `answer_f_correct` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `correct_answers`
--

INSERT INTO `correct_answers` (`id`, `question_id`, `answer_a_correct`, `answer_b_correct`, `answer_c_correct`, `answer_d_correct`, `answer_e_correct`, `answer_f_correct`) VALUES
(1, 1, 'false', 'true', 'false', 'false', 'false', 'false'),
(2, 2, 'true', 'false', 'false', 'false', 'false', 'false'),
(3, 3, 'true', 'false', 'false', 'false', 'false', 'false'),
(4, 4, 'false', 'true', 'false', 'false', 'false', 'false'),
(5, 5, 'false', 'false', 'true', 'false', 'false', 'false'),
(6, 6, 'true', 'false', 'false', 'false', 'false', 'false'),
(7, 7, 'true', 'false', 'false', 'false', 'false', 'false'),
(8, 8, 'true', 'false', 'false', 'false', 'false', 'false'),
(9, 9, 'false', 'true', 'false', 'false', 'false', 'false'),
(10, 10, 'true', 'true', 'true', 'true', 'false', 'false'),
(11, 11, 'false', 'true', 'false', 'false', 'false', 'false'),
(12, 12, 'false', 'false', 'false', 'true', 'false', 'false'),
(13, 13, 'false', 'true', 'false', 'false', 'false', 'false'),
(14, 14, 'false', 'true', 'false', 'false', 'false', 'false'),
(15, 15, 'false', 'false', 'true', 'false', 'false', 'false'),
(16, 16, 'false', 'true', 'false', 'false', 'false', 'false'),
(17, 17, 'false', 'false', 'true', 'false', 'false', 'false'),
(18, 18, 'false', 'true', 'false', 'false', 'false', 'false'),
(19, 19, 'false', 'false', 'true', 'false', 'false', 'false'),
(20, 20, 'false', 'true', 'false', 'false', 'false', 'false'),
(21, 21, 'false', 'false', 'true', 'false', 'false', 'false'),
(22, 22, 'false', 'true', 'false', 'false', 'false', 'false'),
(23, 23, 'true', 'false', 'false', 'false', 'false', 'false'),
(24, 24, 'true', 'false', 'false', 'false', 'false', 'false'),
(25, 25, 'false', 'true', 'false', 'false', 'false', 'false'),
(26, 26, 'true', 'false', 'false', 'false', 'false', 'false'),
(27, 27, 'false', 'false', 'false', 'true', 'false', 'false'),
(28, 28, 'false', 'true', 'false', 'false', 'false', 'false'),
(29, 29, 'false', 'true', 'false', 'false', 'false', 'false'),
(30, 30, 'true', 'false', 'false', 'false', 'false', 'false'),
(31, 31, 'false', 'true', 'false', 'false', 'false', 'false'),
(32, 32, 'false', 'true', 'false', 'false', 'false', 'false'),
(33, 33, 'false', 'false', 'false', 'true', 'false', 'false'),
(34, 34, 'true', 'false', 'false', 'false', 'false', 'false'),
(35, 35, 'true', 'false', 'false', 'false', 'false', 'false'),
(36, 36, 'false', 'true', 'false', 'false', 'false', 'false'),
(37, 37, 'true', 'false', 'false', 'false', 'false', 'false'),
(38, 38, 'true', 'false', 'false', 'false', 'false', 'false'),
(39, 39, 'false', 'false', 'true', 'false', 'false', 'false'),
(40, 40, 'true', 'false', 'false', 'false', 'false', 'false'),
(41, 41, 'false', 'true', 'false', 'false', 'false', 'false'),
(42, 42, 'true', 'false', 'false', 'false', 'false', 'false'),
(43, 43, 'false', 'true', 'false', 'false', 'false', 'false'),
(44, 44, 'true', 'false', 'false', 'false', 'false', 'false'),
(45, 45, 'false', 'false', 'true', 'false', 'false', 'false'),
(46, 46, 'true', 'false', 'false', 'false', 'false', 'false'),
(47, 47, 'false', 'true', 'false', 'false', 'false', 'false'),
(48, 48, 'true', 'false', 'false', 'false', 'false', 'false'),
(49, 49, 'false', 'false', 'false', 'true', 'false', 'false'),
(50, 50, 'true', 'false', 'false', 'false', 'false', 'false'),
(51, 51, 'false', 'true', 'false', 'false', 'false', 'false'),
(52, 52, 'true', 'false', 'false', 'false', 'false', 'false'),
(53, 53, 'false', 'false', 'true', 'false', 'false', 'false'),
(54, 54, 'true', 'false', 'false', 'false', 'false', 'false'),
(55, 55, 'true', 'false', 'false', 'false', 'false', 'false'),
(56, 56, 'false', 'true', 'false', 'false', 'false', 'false'),
(57, 57, 'true', 'false', 'false', 'false', 'false', 'false'),
(58, 58, 'false', 'true', 'false', 'false', 'false', 'false'),
(59, 59, 'true', 'false', 'false', 'false', 'false', 'false'),
(60, 60, 'true', 'false', 'false', 'false', 'false', 'false'),
(61, 61, 'true', 'false', 'false', 'false', 'false', 'false'),
(62, 62, 'false', 'true', 'false', 'false', 'false', 'false'),
(63, 63, 'false', 'false', 'true', 'false', 'false', 'false'),
(64, 64, 'false', 'true', 'false', 'false', 'false', 'false'),
(65, 65, 'true', 'false', 'false', 'false', 'false', 'false'),
(66, 66, 'true', 'false', 'false', 'false', 'false', 'false'),
(67, 67, 'false', 'true', 'false', 'false', 'false', 'false'),
(68, 68, 'false', 'true', 'false', 'false', 'false', 'false'),
(69, 69, 'false', 'true', 'false', 'false', 'false', 'false'),
(70, 70, 'false', 'true', 'false', 'false', 'false', 'false'),
(71, 71, 'false', 'false', 'false', 'true', 'false', 'false'),
(72, 72, 'true', 'false', 'false', 'false', 'false', 'false'),
(73, 73, 'false', 'false', 'false', 'true', 'false', 'false'),
(74, 74, 'true', 'false', 'false', 'false', 'false', 'false'),
(75, 75, 'false', 'true', 'false', 'false', 'false', 'false'),
(76, 76, 'false', 'true', 'false', 'false', 'false', 'false'),
(77, 77, 'false', 'false', 'false', 'true', 'false', 'false'),
(78, 78, 'false', 'true', 'false', 'false', 'false', 'false'),
(79, 79, 'false', 'false', 'false', 'true', 'false', 'false'),
(80, 80, 'false', 'true', 'false', 'false', 'false', 'false'),
(81, 81, 'false', 'false', 'true', 'false', 'false', 'false'),
(82, 82, 'true', 'false', 'false', 'false', 'false', 'false'),
(83, 83, 'false', 'false', 'false', 'true', 'false', 'false'),
(84, 84, 'true', 'false', 'false', 'false', 'false', 'false'),
(85, 85, 'false', 'false', 'true', 'false', 'false', 'false'),
(86, 86, 'true', 'false', 'false', 'false', 'false', 'false'),
(87, 87, 'false', 'false', 'true', 'false', 'false', 'false'),
(88, 88, 'true', 'false', 'false', 'false', 'false', 'false'),
(89, 89, 'true', 'false', 'false', 'false', 'false', 'false'),
(90, 90, 'true', 'false', 'false', 'false', 'false', 'false'),
(91, 91, 'false', 'true', 'false', 'false', 'false', 'false'),
(92, 92, 'true', 'false', 'false', 'false', 'false', 'false'),
(93, 93, 'false', 'true', 'false', 'false', 'false', 'false'),
(94, 94, 'false', 'true', 'false', 'false', 'false', 'false'),
(95, 95, 'false', 'false', 'false', 'true', 'false', 'false'),
(96, 96, 'true', 'false', 'false', 'false', 'false', 'false'),
(97, 97, 'true', 'false', 'false', 'false', 'false', 'false'),
(98, 98, 'true', 'false', 'false', 'false', 'false', 'false'),
(99, 99, 'false', 'true', 'false', 'false', 'false', 'false'),
(100, 100, 'false', 'true', 'false', 'false', 'false', 'false'),
(101, 101, 'false', 'false', 'true', 'false', 'false', 'false'),
(102, 102, 'true', 'false', 'false', 'false', 'false', 'false'),
(103, 103, 'false', 'false', 'false', 'true', 'false', 'false'),
(104, 104, 'false', 'true', 'false', 'false', 'false', 'false'),
(105, 105, 'true', 'false', 'false', 'false', 'false', 'false'),
(106, 106, 'true', 'false', 'false', 'false', 'false', 'false'),
(107, 107, 'false', 'false', 'false', 'true', 'false', 'false'),
(108, 108, 'false', 'true', 'false', 'false', 'false', 'false'),
(109, 109, 'false', 'false', 'false', 'true', 'false', 'false'),
(110, 110, 'false', 'true', 'false', 'false', 'false', 'false'),
(111, 111, 'false', 'false', 'true', 'false', 'false', 'false'),
(112, 112, 'false', 'true', 'false', 'false', 'false', 'false'),
(113, 113, 'true', 'false', 'false', 'false', 'false', 'false'),
(114, 114, 'false', 'true', 'false', 'false', 'false', 'false'),
(115, 115, 'false', 'true', 'false', 'false', 'false', 'false'),
(116, 116, 'true', 'false', 'false', 'false', 'false', 'false'),
(117, 117, 'false', 'false', 'true', 'false', 'false', 'false'),
(118, 118, 'false', 'true', 'false', 'false', 'false', 'false'),
(119, 119, 'false', 'true', 'false', 'false', 'false', 'false'),
(120, 120, 'false', 'true', 'false', 'false', 'false', 'false'),
(121, 121, 'false', 'true', 'false', 'false', 'false', 'false'),
(122, 122, 'true', 'false', 'false', 'false', 'false', 'false'),
(123, 123, 'false', 'false', 'true', 'false', 'false', 'false'),
(124, 124, 'false', 'true', 'false', 'false', 'false', 'false'),
(125, 125, 'false', 'false', 'true', 'false', 'false', 'false'),
(126, 126, 'false', 'true', 'false', 'false', 'false', 'false'),
(127, 127, 'true', 'false', 'false', 'false', 'false', 'false'),
(128, 128, 'true', 'false', 'false', 'false', 'false', 'false'),
(129, 129, 'false', 'false', 'false', 'true', 'false', 'false'),
(130, 130, 'false', 'true', 'false', 'false', 'false', 'false'),
(131, 131, 'false', 'false', 'true', 'false', 'false', 'false'),
(132, 132, 'false', 'true', 'false', 'false', 'false', 'false'),
(133, 133, 'false', 'true', 'false', 'false', 'false', 'false'),
(134, 134, 'true', 'false', 'false', 'false', 'false', 'false'),
(135, 135, 'false', 'true', 'false', 'false', 'false', 'false'),
(136, 136, 'true', 'false', 'false', 'false', 'false', 'false'),
(137, 137, 'true', 'false', 'false', 'false', 'false', 'false'),
(138, 138, 'false', 'true', 'false', 'false', 'false', 'false'),
(139, 139, 'false', 'true', 'false', 'false', 'false', 'false'),
(140, 140, 'false', 'true', 'false', 'false', 'false', 'false'),
(141, 141, 'false', 'false', 'false', 'true', 'false', 'false'),
(142, 142, 'false', 'true', 'false', 'false', 'false', 'false'),
(143, 143, 'false', 'true', 'false', 'false', 'false', 'false'),
(144, 144, 'true', 'false', 'false', 'false', 'false', 'false'),
(145, 145, 'true', 'false', 'false', 'false', 'false', 'false'),
(146, 146, 'false', 'true', 'false', 'false', 'false', 'false'),
(147, 147, 'false', 'true', 'false', 'false', 'false', 'false'),
(148, 148, 'false', 'true', 'false', 'false', 'false', 'false'),
(149, 149, 'true', 'false', 'false', 'false', 'false', 'false'),
(150, 150, 'false', 'true', 'false', 'false', 'false', 'false'),
(151, 151, 'false', 'false', 'false', 'true', 'false', 'false'),
(152, 152, 'true', 'false', 'false', 'false', 'false', 'false'),
(153, 153, 'true', 'false', 'false', 'false', 'false', 'false'),
(154, 154, 'true', 'false', 'false', 'false', 'false', 'false'),
(155, 155, 'false', 'true', 'false', 'false', 'false', 'false'),
(156, 156, 'false', 'true', 'false', 'false', 'false', 'false'),
(157, 157, 'false', 'true', 'false', 'false', 'false', 'false'),
(158, 158, 'true', 'false', 'false', 'false', 'false', 'false'),
(159, 159, 'true', 'false', 'false', 'false', 'false', 'false'),
(160, 160, 'true', 'false', 'false', 'false', 'false', 'false'),
(161, 161, 'false', 'true', 'false', 'false', 'false', 'false'),
(162, 162, 'false', 'true', 'false', 'false', 'false', 'false'),
(163, 163, 'false', 'false', 'false', 'true', 'false', 'false'),
(164, 164, 'false', 'true', 'false', 'false', 'false', 'false'),
(165, 165, 'false', 'false', 'true', 'false', 'false', 'false'),
(166, 166, 'false', 'true', 'false', 'false', 'false', 'false'),
(167, 167, 'false', 'true', 'false', 'false', 'false', 'false'),
(168, 168, 'true', 'false', 'false', 'false', 'false', 'false'),
(169, 169, 'true', 'false', 'false', 'false', 'false', 'false'),
(170, 170, 'false', 'true', 'false', 'false', 'false', 'false'),
(171, 171, 'false', 'false', 'false', 'true', 'false', 'false'),
(172, 172, 'false', 'true', 'false', 'false', 'false', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `difficulties`
--

CREATE TABLE `difficulties` (
  `id` int(11) NOT NULL,
  `level_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `difficulties`
--

INSERT INTO `difficulties` (`id`, `level_name`) VALUES
(1, 'any'),
(2, 'easy'),
(4, 'hard'),
(3, 'medium');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `difficulty_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `explanation` text DEFAULT NULL,
  `tip` text DEFAULT NULL,
  `multiple_correct_answers` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `category_id`, `type_id`, `difficulty_id`, `question_text`, `explanation`, `tip`, `multiple_correct_answers`) VALUES
(1, 1, 2, 2, 'What is Dart primarily used for?', NULL, NULL, 'false'),
(2, 1, 2, 2, 'Which keyword is used to declare a variable in Dart?', NULL, NULL, 'false'),
(3, 1, 2, 2, 'What is the entry point of a Dart program?', NULL, NULL, 'false'),
(4, 1, 2, 2, 'Which company developed Dart?', NULL, NULL, 'false'),
(5, 1, 2, 2, 'What type of language is Dart?', NULL, NULL, 'false'),
(6, 1, 2, 3, 'What does JIT stand for in Dart?', NULL, NULL, 'false'),
(7, 1, 2, 4, 'What is the purpose of mixins in Dart?', NULL, NULL, 'false'),
(8, 1, 2, 1, 'Is Dart a statically typed language?', NULL, NULL, 'false'),
(9, 2, 2, 2, 'What is Flutter primarily used for?', NULL, NULL, 'false'),
(10, 2, 2, 3, 'What widget is used for layout in Flutter?', NULL, NULL, 'true'),
(11, 3, 2, 2, 'What does C++ stand for?', NULL, NULL, 'false'),
(12, 4, 2, 2, 'What is Python primarily used for?', NULL, NULL, 'false'),
(13, 1, 2, 2, 'Dart Easy MCQ 1: Most president enjoy federal Republican.', 'Development wonder good ten scientist American among star bit into maybe various.', 'him', 'false'),
(14, 1, 1, 2, 'Dart Easy Bool 1: Garden amount floor letter seat base require.', 'Third nice among staff already eat.', 'know', 'false'),
(15, 1, 2, 2, 'Dart Easy MCQ 2: Now hit land require occur finally relationship.', 'Others believe owner family general five.', 'discussion', 'false'),
(16, 1, 1, 2, 'Dart Easy Bool 2: Country should senior.', 'Push agency improve technology its address quite popular.', 'happy', 'false'),
(17, 1, 2, 2, 'Dart Easy MCQ 3: Herself fall kind tax character job dream thought better.', 'Article after world should certain money government blood these several.', 'rule', 'false'),
(18, 1, 1, 2, 'Dart Easy Bool 3: Ground live power gas big hand.', 'Summer never film talk home himself know this.', 'herself', 'false'),
(19, 1, 2, 2, 'Dart Easy MCQ 4: Exactly arrive few smile product purpose by company.', 'How indicate person audience prevent care court professional require.', 'operation', 'false'),
(20, 1, 1, 2, 'Dart Easy Bool 4: Nothing catch network guess play then lay.', 'Tonight though group poor act role matter.', 'tough', 'false'),
(21, 1, 2, 2, 'Dart Easy MCQ 5: Goal three onto ready resource meeting if room someone.', 'Election force strong power claim little.', 'network', 'false'),
(22, 1, 1, 2, 'Dart Easy Bool 5: Including simple who group kind court.', 'Range fear law along event four both return station difficult.', 'without', 'false'),
(23, 1, 2, 3, 'Dart Medium MCQ 1: Beautiful not pretty you point compare them mouth put.', 'Opportunity program history career particular son rich road for process.', 'true', 'false'),
(24, 1, 1, 3, 'Dart Medium Bool 1: Actually above success dark.', 'Part commercial dog break Democrat yourself end with.', 'history', 'false'),
(25, 1, 2, 3, 'Dart Medium MCQ 2: Number low quality risk shake week.', 'Sister she themselves already believe interview attack white once.', 'common', 'false'),
(26, 1, 1, 3, 'Dart Medium Bool 2: Attorney stuff other beyond wonder about trial.', 'Time nice federal under establish.', 'draw', 'false'),
(27, 1, 2, 3, 'Dart Medium MCQ 3: Few father individual standard now possible once.', 'Can hundred affect voice clear discussion address face skill yes increase foreign.', 'sound', 'false'),
(28, 1, 1, 3, 'Dart Medium Bool 3: Appear give hear.', 'Region positive reach century against health hotel manager reveal fly.', 'sort', 'false'),
(29, 1, 2, 3, 'Dart Medium MCQ 4: What suffer different something any imagine natural.', 'Option off remain model kind type mention case occur about method father.', 'buy', 'false'),
(30, 1, 1, 3, 'Dart Medium Bool 4: Including grow city.', 'Affect key father book call somebody.', 'Congress', 'false'),
(31, 1, 2, 3, 'Dart Medium MCQ 5: Level economy never learn brother.', 'Democratic feel fear think himself decide toward police to.', 'strong', 'false'),
(32, 1, 1, 3, 'Dart Medium Bool 5: Consider full so statement actually.', 'Blue test maintain seem name image Democrat despite between crime hand.', 'form', 'false'),
(33, 1, 2, 4, 'Dart Hard MCQ 1: Push president special big policy myself young finally tree.', 'None institution red particular we evidence wind respond.', 'spring', 'false'),
(34, 1, 1, 4, 'Dart Hard Bool 1: Movement audience daughter better.', 'Artist under because box at table.', 'agent', 'false'),
(35, 1, 2, 4, 'Dart Hard MCQ 2: Modern field notice evidence technology great these.', 'Realize training investment player pretty serious bank its our this.', 'century', 'false'),
(36, 1, 1, 4, 'Dart Hard Bool 2: Reflect check ability economy south already report.', 'Growth light least else seem affect suddenly feeling despite.', 'need', 'false'),
(37, 1, 2, 4, 'Dart Hard MCQ 3: Interesting plant science these short focus her million.', 'Herself point military change street middle general pay.', 'after', 'false'),
(38, 1, 1, 4, 'Dart Hard Bool 3: My why eye mind defense alone professor.', 'History line trade memory seek remember option center bit total.', 'necessary', 'false'),
(39, 1, 2, 4, 'Dart Hard MCQ 4: Physical spring ok compare account.', 'Easy husband very later claim able national officer Congress between media high.', 'let', 'false'),
(40, 1, 1, 4, 'Dart Hard Bool 4: Get available local believe or maintain arrive.', 'Need image relationship hit maybe hard which special current born.', 'exactly', 'false'),
(41, 1, 2, 4, 'Dart Hard MCQ 5: Describe guess expert share market future wonder single performance carry.', 'Enjoy politics green city performance possible push story section Congress school real.', 'last', 'false'),
(42, 1, 1, 4, 'Dart Hard Bool 5: Police stand lawyer forward next painting.', 'Friend station them focus me stuff care language.', 'political', 'false'),
(43, 1, 2, 1, 'Dart Any MCQ 1: Pull positive relationship power personal.', 'It everyone hear itself continue message power decade mother never hospital.', 'site', 'false'),
(44, 1, 1, 1, 'Dart Any Bool 1: Reason author sport particularly.', 'Food share high his music result nothing bad picture boy choice.', 'music', 'false'),
(45, 1, 2, 1, 'Dart Any MCQ 2: Modern site few who mean oil performance.', 'Great individual source modern hold including.', 'everybody', 'false'),
(46, 1, 1, 1, 'Dart Any Bool 2: Work week forward computer the network central.', 'Stay citizen little manage at still attorney.', 'government', 'false'),
(47, 1, 2, 1, 'Dart Any MCQ 3: Me conference politics design candidate her final popular.', 'Detail hope head notice class light letter politics since hospital.', 'cause', 'false'),
(48, 1, 1, 1, 'Dart Any Bool 3: Very nation visit structure start would.', 'Beautiful news boy relationship production food first follow.', 'action', 'false'),
(49, 1, 2, 1, 'Dart Any MCQ 4: Decision brother power hold pretty military entire by ten.', 'Quite mission state on close daughter.', 'sometimes', 'false'),
(50, 1, 1, 1, 'Dart Any Bool 4: Table product hear factor protect gun above.', 'Experience similar from live our.', 'effort', 'false'),
(51, 1, 2, 1, 'Dart Any MCQ 5: Sing money safe others hear outside lot reach part.', 'Free shake yeah reach decision each everyone decide risk.', 'medical', 'false'),
(52, 1, 1, 1, 'Dart Any Bool 5: Might least could subject career call relate.', 'Represent night year home local author agency cell message her eat.', 'allow', 'false'),
(53, 2, 2, 2, 'Flutter Easy MCQ 1: East alone argue worker history investment national glass.', 'Five seem watch find force on fire base language summer our young.', 'choose', 'false'),
(54, 2, 1, 2, 'Flutter Easy Bool 1: After effect someone talk throughout southern.', 'North job create dog he that against.', 'per', 'false'),
(55, 2, 2, 2, 'Flutter Easy MCQ 2: Bring so happen not matter side idea institution.', 'Outside exactly game go smile training name common coach.', 'ever', 'false'),
(56, 2, 1, 2, 'Flutter Easy Bool 2: Require class fact now decision computer accept.', 'Main realize central or lead apply.', 'check', 'false'),
(57, 2, 2, 2, 'Flutter Easy MCQ 3: He share answer issue magazine bed move month five Democrat civil.', 'Month same them down standard crime fund.', 'option', 'false'),
(58, 2, 1, 2, 'Flutter Easy Bool 3: Relationship person likely college popular.', 'Bill need way institution run coach since time executive edge.', 'attorney', 'false'),
(59, 2, 2, 2, 'Flutter Easy MCQ 4: Approach hundred set fire rule recognize woman.', 'Particular free soon well group human week nice by what.', 'various', 'false'),
(60, 2, 1, 2, 'Flutter Easy Bool 4: Worry building pretty.', 'Seat degree positive song world bed teach some.', 'page', 'false'),
(61, 2, 2, 2, 'Flutter Easy MCQ 5: Step value leader hot service kind care Republican design cover.', 'Often reach tend idea would pressure exist concern country arm though court.', 'next', 'false'),
(62, 2, 1, 2, 'Flutter Easy Bool 5: Feel allow industry energy candidate support statement make.', 'Occur hope color discuss save weight adult final.', 'number', 'false'),
(63, 2, 2, 3, 'Flutter Medium MCQ 1: Value low among beat behind data threat energy.', 'City test buy economy exist operation choice cold strategy make while.', 'inside', 'false'),
(64, 2, 1, 3, 'Flutter Medium Bool 1: Strong test begin rest fall which project back.', 'Everyone door campaign carry should might tough quickly goal.', 'today', 'false'),
(65, 2, 2, 3, 'Flutter Medium MCQ 2: Program though outside about whether save add note treatment reality watch.', 'Other remember later according focus message per.', 'to', 'false'),
(66, 2, 1, 3, 'Flutter Medium Bool 2: Listen culture month bill memory respond score.', 'Determine red movement put my share note find interest far.', 'affect', 'false'),
(67, 2, 2, 3, 'Flutter Medium MCQ 3: Sit room price know operation within thought first that dog.', 'However explain particularly enough American store process peace general.', 'as', 'false'),
(68, 2, 1, 3, 'Flutter Medium Bool 3: Practice buy none fine fall.', 'Kid prove assume start do baby reduce tend.', 'from', 'false'),
(69, 2, 2, 3, 'Flutter Medium MCQ 4: Wonder grow large data bad woman return.', 'Surface return everyone form service material evening able ready follow scientist home range.', 'guess', 'false'),
(70, 2, 1, 3, 'Flutter Medium Bool 4: Keep skill reduce likely page himself.', 'Key federal major energy someone several final moment option nor.', 'character', 'false'),
(71, 2, 2, 3, 'Flutter Medium MCQ 5: Phone impact billion we ten agreement.', 'In music just conference color something scene city.', 'stock', 'false'),
(72, 2, 1, 3, 'Flutter Medium Bool 5: Whole reduce carry economy star ten.', 'Conference today himself hear as all behind.', 'born', 'false'),
(73, 2, 2, 4, 'Flutter Hard MCQ 1: Clearly they tax party that father place particularly meet hospital world.', 'Security fall plant buy edge ever help increase itself public leg.', 'management', 'false'),
(74, 2, 1, 4, 'Flutter Hard Bool 1: Able thousand certainly action serious able issue.', 'Issue condition special cold seat market worker nearly.', 'that', 'false'),
(75, 2, 2, 4, 'Flutter Hard MCQ 2: Tree material former mother learn shake move others month.', 'Board protect standard family wear able big.', 'skill', 'false'),
(76, 2, 1, 4, 'Flutter Hard Bool 2: Less myself glass.', 'Tree method western quality simply call successful.', 'modern', 'false'),
(77, 2, 2, 4, 'Flutter Hard MCQ 3: Her yes trip two less keep dog.', 'Up appear throughout everything such rather either poor someone few not easy.', 'modern', 'false'),
(78, 2, 1, 4, 'Flutter Hard Bool 3: Study fear thousand.', 'Write but base south relate.', 'among', 'false'),
(79, 2, 2, 4, 'Flutter Hard MCQ 4: Discover movement small trial any.', 'Miss grow both tax soldier role involve religious among cut stuff little.', 'mean', 'false'),
(80, 2, 1, 4, 'Flutter Hard Bool 4: Care pick try direction how nation.', 'Standard method meeting development without among decade figure right.', 'relate', 'false'),
(81, 2, 2, 4, 'Flutter Hard MCQ 5: Note then item detail feeling address per better use.', 'Church large believe enter laugh science star form day official me.', 'word', 'false'),
(82, 2, 1, 4, 'Flutter Hard Bool 5: Performance evidence movie third.', 'That experience five enjoy.', 'military', 'false'),
(83, 2, 2, 1, 'Flutter Any MCQ 1: Rich nation experience agreement according player.', 'Learn all past some soldier out no prepare service.', 'public', 'false'),
(84, 2, 1, 1, 'Flutter Any Bool 1: Month company stuff from win create build.', 'Question student year simple administration finish too still half employee.', 'force', 'false'),
(85, 2, 2, 1, 'Flutter Any MCQ 2: Face feeling image realize budget accept seek.', 'Energy sea television color science political.', 'major', 'false'),
(86, 2, 1, 1, 'Flutter Any Bool 2: Window any language story third language call.', 'Various to including run history.', 'affect', 'false'),
(87, 2, 2, 1, 'Flutter Any MCQ 3: Baby attack sell buy blue reflect.', 'Employee great knowledge over leave act particular fight computer line.', 'safe', 'false'),
(88, 2, 1, 1, 'Flutter Any Bool 3: Congress nearly similar of security before someone.', 'Administration fast bill conference main bar exist board performance contain.', 'perform', 'false'),
(89, 2, 2, 1, 'Flutter Any MCQ 4: Lawyer think picture player next important push.', 'Ever pull general new production at dream inside.', 'end', 'false'),
(90, 2, 1, 1, 'Flutter Any Bool 4: Maybe value receive thing story bank.', 'Clearly effort front dinner of record answer market crime goal.', 'discussion', 'false'),
(91, 2, 2, 1, 'Flutter Any MCQ 5: But him able today south answer happy attention.', 'Citizen structure majority nothing certain believe religious trade coach maybe social.', 'money', 'false'),
(92, 2, 1, 1, 'Flutter Any Bool 5: Information Republican statement official white during guy his.', 'Which us idea less.', 'manage', 'false'),
(93, 3, 2, 2, 'C++ Easy MCQ 1: Reduce throw plant foreign its conference customer message data pattern.', 'Real education body today discover maybe agreement myself.', 'better', 'false'),
(94, 3, 1, 2, 'C++ Easy Bool 1: Become spring them fish close family.', 'Number care feeling benefit size gun increase.', 'similar', 'false'),
(95, 3, 2, 2, 'C++ Easy MCQ 2: Level political specific yes question two every apply remember far.', 'Letter its author model when step stage enough position few.', 'some', 'false'),
(96, 3, 1, 2, 'C++ Easy Bool 2: Bit career produce data need deep.', 'Up long evidence almost area method make.', 'ago', 'false'),
(97, 3, 2, 2, 'C++ Easy MCQ 3: Fly husband play decide house fast.', 'Wish approach establish economic once between minute painting rock make.', 'fall', 'false'),
(98, 3, 1, 2, 'C++ Easy Bool 3: Behavior social project energy type drop another.', 'Anything deep single thought else doctor drug born artist paper.', 'career', 'false'),
(99, 3, 2, 2, 'C++ Easy MCQ 4: Tonight public across teach respond.', 'Mother fast team your seem defense.', 'trade', 'false'),
(100, 3, 1, 2, 'C++ Easy Bool 4: Wife fill wish key price.', 'Child seven information three none.', 'much', 'false'),
(101, 3, 2, 2, 'C++ Easy MCQ 5: Deal unit fine receive medical.', 'Tv choice nice not into newspaper lose eight phone wind.', 'statement', 'false'),
(102, 3, 1, 2, 'C++ Easy Bool 5: Animal artist Republican before.', 'Have than process pattern also close performance research.', 'surface', 'false'),
(103, 3, 2, 3, 'C++ Medium MCQ 1: Relationship difficult interview ask reflect enjoy must.', 'Any some result center same natural career issue learn these.', 'receive', 'false'),
(104, 3, 1, 3, 'C++ Medium Bool 1: Fly break crime early lot evening himself chair.', 'East sport daughter knowledge cell party drug just quite top.', 'author', 'false'),
(105, 3, 2, 3, 'C++ Medium MCQ 2: She strong indeed us increase institution admit yourself religious.', 'New administration clear between or every any over individual region sister team.', 'edge', 'false'),
(106, 3, 1, 3, 'C++ Medium Bool 2: Deal shake deep minute none.', 'Return foot heavy room friend poor teacher rule.', 'suddenly', 'false'),
(107, 3, 2, 3, 'C++ Medium MCQ 3: Recognize power compare stay without.', 'Walk however old within land those poor must political prevent newspaper what.', 'lawyer', 'false'),
(108, 3, 1, 3, 'C++ Medium Bool 3: Western middle economy author team no wait.', 'Technology fight I until how staff necessary break.', 'personal', 'false'),
(109, 3, 2, 3, 'C++ Medium MCQ 4: Across value practice listen.', 'Cold really center check forget method nice.', 'list', 'false'),
(110, 3, 1, 3, 'C++ Medium Bool 4: Behavior behind rest test eat candidate so.', 'Include together view offer give theory class speak against.', 'like', 'false'),
(111, 3, 2, 3, 'C++ Medium MCQ 5: Position understand value like Congress so break share.', 'Ground let computer quality mean evening off.', 'story', 'false'),
(112, 3, 1, 3, 'C++ Medium Bool 5: Difference field surface laugh move.', 'Growth trial sit nearly soldier down population than.', 'finish', 'false'),
(113, 3, 2, 4, 'C++ Hard MCQ 1: Sound entire test program.', 'Pm challenge other might choice religious.', 'piece', 'false'),
(114, 3, 1, 4, 'C++ Hard Bool 1: Close environment down around.', 'Series upon add laugh thing off face community painting.', 'approach', 'false'),
(115, 3, 2, 4, 'C++ Hard MCQ 2: Home everything base laugh image game manage fight back.', 'Mention those standard truth partner floor watch because lead.', 'miss', 'false'),
(116, 3, 1, 4, 'C++ Hard Bool 2: Do fight culture size can heart.', 'Price team draw recognize beautiful happen water.', 'couple', 'false'),
(117, 3, 2, 4, 'C++ Hard MCQ 3: Analysis sing sell bank left hold.', 'Thought soon along popular choice per together hand quickly painting nature.', 'fly', 'false'),
(118, 3, 1, 4, 'C++ Hard Bool 3: Discover budget represent hear operation industry.', 'Heart summer media decide wide sometimes list main stand apply.', 'visit', 'false'),
(119, 3, 2, 4, 'C++ Hard MCQ 4: Medical election building under local staff describe play onto must.', 'Down very recognize activity cause she decision according kind news modern treat prevent report.', 'return', 'false'),
(120, 3, 1, 4, 'C++ Hard Bool 4: Than once leg while.', 'Degree office contain glass place.', 'during', 'false'),
(121, 3, 2, 4, 'C++ Hard MCQ 5: Program feeling need six or since painting fast forward leave site.', 'Poor cold defense worker close sometimes finally message morning investment base line.', 'range', 'false'),
(122, 3, 1, 4, 'C++ Hard Bool 5: Man help very society.', 'Country happen than above watch couple may employee.', 'four', 'false'),
(123, 3, 2, 1, 'C++ Any MCQ 1: Economic evidence fear I game three least really foreign.', 'Fine best also stand already music sister wait treatment never official charge hear.', 'among', 'false'),
(124, 3, 1, 1, 'C++ Any Bool 1: Condition game practice movie audience include despite.', 'Great station significant employee board food western it poor land.', 'know', 'false'),
(125, 3, 2, 1, 'C++ Any MCQ 2: Style option light threat over.', 'Keep seem land current couple he interview.', 'much', 'false'),
(126, 3, 1, 1, 'C++ Any Bool 2: We turn born until none into total.', 'Base shake think quickly science material policy investment make.', 'news', 'false'),
(127, 3, 2, 1, 'C++ Any MCQ 3: Create determine I despite huge.', 'Human your door remain increase hear themselves western.', 'individual', 'false'),
(128, 3, 1, 1, 'C++ Any Bool 3: Matter inside billion feeling instead assume.', 'Ever quality movement certainly for fly quickly rule national yeah break.', 'response', 'false'),
(129, 3, 2, 1, 'C++ Any MCQ 4: Weight political just special dark contain most new music.', 'Suffer pass happy tend fall necessary seat.', 'relate', 'false'),
(130, 3, 1, 1, 'C++ Any Bool 4: Policy west fish care standard.', 'Throw ten star admit through Mr war training great defense.', 'side', 'false'),
(131, 3, 2, 1, 'C++ Any MCQ 5: Claim discuss quality unit audience.', 'Color such door fine measure most painting why sport.', 'several', 'false'),
(132, 3, 1, 1, 'C++ Any Bool 5: Day body worker population organization what turn.', 'Ball health artist question phone son scene.', 'American', 'false'),
(133, 4, 2, 2, 'Python Easy MCQ 1: Group stage yourself physical yourself degree north clearly.', 'Back someone sometimes together listen author they trip defense five.', 'challenge', 'false'),
(134, 4, 1, 2, 'Python Easy Bool 1: Couple than very look itself.', 'Several yet protect reality weight and address.', 'discover', 'false'),
(135, 4, 2, 2, 'Python Easy MCQ 2: Through site mouth system.', 'Give recently science section party share early arm some assume away.', 'lawyer', 'false'),
(136, 4, 1, 2, 'Python Easy Bool 2: Appear send community another.', 'Instead team process themselves head themselves but order power apply.', 'top', 'false'),
(137, 4, 2, 2, 'Python Easy MCQ 3: Those site standard recently must check manager.', 'Treatment best whose address small every concern treat serious food record suddenly general.', 'situation', 'false'),
(138, 4, 1, 2, 'Python Easy Bool 3: Hotel yet require everything black war.', 'Newspaper huge beat important against sell TV offer.', 'enough', 'false'),
(139, 4, 2, 2, 'Python Easy MCQ 4: Newspaper early experience son success loss next.', 'Analysis couple financial road defense offer become.', 'assume', 'false'),
(140, 4, 1, 2, 'Python Easy Bool 4: Collection share agree until.', 'Word sometimes spring indicate feel.', 'by', 'false'),
(141, 4, 2, 2, 'Python Easy MCQ 5: What possible safe record interview.', 'Important law collection and look human play knowledge music evening least.', 'technology', 'false'),
(142, 4, 1, 2, 'Python Easy Bool 5: Score theory late black.', 'Address financial billion site guy maybe.', 'sign', 'false'),
(143, 4, 2, 3, 'Python Medium MCQ 1: Street put movie up increase hospital voice tax short green.', 'Indeed agreement already while everyone interview leg child direction dinner.', 'rest', 'false'),
(144, 4, 1, 3, 'Python Medium Bool 1: Anyone rule both onto require always.', 'Science human week company.', 'history', 'false'),
(145, 4, 2, 3, 'Python Medium MCQ 2: Do democratic your still check.', 'Life compare record third behavior this strong professor thank manage.', 'could', 'false'),
(146, 4, 1, 3, 'Python Medium Bool 2: International increase likely bank probably store.', 'Something item most offer offer their though.', 'quite', 'false'),
(147, 4, 2, 3, 'Python Medium MCQ 3: Discussion candidate plan human.', 'Major our son thank something know different Mrs modern risk within.', 'action', 'false'),
(148, 4, 1, 3, 'Python Medium Bool 3: Certain shake develop section.', 'Force loss size expert.', 'easy', 'false'),
(149, 4, 2, 3, 'Python Medium MCQ 4: Put kid suggest eight fly individual very.', 'Establish family section affect increase series.', 'phone', 'false'),
(150, 4, 1, 3, 'Python Medium Bool 4: Happen nice responsibility.', 'Information use act financial great.', 'report', 'false'),
(151, 4, 2, 3, 'Python Medium MCQ 5: Beautiful fly key land the industry.', 'What plant take right war technology education cell left must ok chair threat.', 'former', 'false'),
(152, 4, 1, 3, 'Python Medium Bool 5: Real loss answer president.', 'Run method today save look house dark trouble again.', 'act', 'false'),
(153, 4, 2, 4, 'Python Hard MCQ 1: Decision according ask writer role early.', 'Foreign music exactly open gun card.', 'administration', 'false'),
(154, 4, 1, 4, 'Python Hard Bool 1: Give whole city per.', 'Floor teach man thus firm difficult mind believe.', 'glass', 'false'),
(155, 4, 2, 4, 'Python Hard MCQ 2: From pattern many position stay sea put born moment such.', 'Smile high heart rather trip war.', 'safe', 'false'),
(156, 4, 1, 4, 'Python Hard Bool 2: Usually all suggest discover at.', 'Scene yard discover then national stay wrong.', 'wall', 'false'),
(157, 4, 2, 4, 'Python Hard MCQ 3: Group direction wonder now military visit hope.', 'Most sing will happy serious plan.', 'evidence', 'false'),
(158, 4, 1, 4, 'Python Hard Bool 3: Including listen change fast partner poor just.', 'Meeting family not around herself enough sense class decide.', 'raise', 'false'),
(159, 4, 2, 4, 'Python Hard MCQ 4: Meet property check name job far their relate.', 'Skill talk affect look position provide whether watch practice sing.', 'power', 'false'),
(160, 4, 1, 4, 'Python Hard Bool 4: Story service send boy help view.', 'Difference hear huge loss amount Democrat finally local need player with.', 'early', 'false'),
(161, 4, 2, 4, 'Python Hard MCQ 5: Heavy spend statement pay her same recently night everyone.', 'Husband main painting dog bring budget.', 'north', 'false'),
(162, 4, 1, 4, 'Python Hard Bool 5: Large low garden specific age.', 'Response win until ask individual worry.', 'race', 'false'),
(163, 4, 2, 1, 'Python Any MCQ 1: Dinner water same usually order eight bar.', 'Pressure family public soon only agree will series.', 'religious', 'false'),
(164, 4, 1, 1, 'Python Any Bool 1: Final like wrong.', 'Girl rule share necessary serious answer.', 'eight', 'false'),
(165, 4, 2, 1, 'Python Any MCQ 2: Medical town list official challenge community lawyer husband spring kind.', 'Pm election go simple she Democrat decade mother.', 'project', 'false'),
(166, 4, 1, 1, 'Python Any Bool 2: Four must black evening clear audience Mr.', 'Direction story probably type at.', 'nor', 'false'),
(167, 4, 2, 1, 'Python Any MCQ 3: Police for ten but change clearly growth.', 'Edge source bit fine design perform surface.', 'range', 'false'),
(168, 4, 1, 1, 'Python Any Bool 3: Use entire choose floor.', 'Cost hope everything professional hope.', 'rich', 'false'),
(169, 4, 2, 1, 'Python Any MCQ 4: Read develop ability majority do I degree necessary least lay property.', 'Sport write system history society tax miss political another health spring head partner.', 'young', 'false'),
(170, 4, 1, 1, 'Python Any Bool 4: Very address too will rule with.', 'Machine rise hot several they at.', 'those', 'false'),
(171, 4, 2, 1, 'Python Any MCQ 5: Player might official car student lot couple difficult.', 'Unit production walk mouth fall policy sense.', 'score', 'false'),
(172, 4, 1, 1, 'Python Any Bool 5: Certainly generation require tough.', 'Decide stage ask dinner age.', 'eat', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `question_tags`
--

CREATE TABLE `question_tags` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_types`
--

CREATE TABLE `question_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_types`
--

INSERT INTO `question_types` (`id`, `type_name`) VALUES
(1, 'boolean'),
(2, 'multiple');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_id` (`question_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `correct_answers`
--
ALTER TABLE `correct_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_id` (`question_id`);

--
-- Indexes for table `difficulties`
--
ALTER TABLE `difficulties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level_name` (`level_name`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `difficulty_id` (`difficulty_id`);

--
-- Indexes for table `question_tags`
--
ALTER TABLE `question_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_id` (`question_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `question_types`
--
ALTER TABLE `question_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `correct_answers`
--
ALTER TABLE `correct_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `difficulties`
--
ALTER TABLE `difficulties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `question_tags`
--
ALTER TABLE `question_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `correct_answers`
--
ALTER TABLE `correct_answers`
  ADD CONSTRAINT `correct_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `question_types` (`id`),
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties` (`id`);

--
-- Constraints for table `question_tags`
--
ALTER TABLE `question_tags`
  ADD CONSTRAINT `question_tags_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
