-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2024 at 03:33 AM
-- Server version: 8.0.36
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmarine_automation`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `AssessID` varchar(25) NOT NULL,
  `CLID` varchar(50) NOT NULL,
  `Question_Type` tinytext NOT NULL,
  `Option1` tinytext NOT NULL,
  `Option2` tinytext NOT NULL,
  `Option3` tinytext NOT NULL,
  `Option4` tinytext NOT NULL,
  `Correct_Option` int NOT NULL,
  `Correct_Answer` tinytext NOT NULL,
  `Deadline_date` date NOT NULL,
  `Deadline_time` time NOT NULL,
  `Created_at` datetime NOT NULL,
  `Updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_submission`
--

CREATE TABLE `assessment_submission` (
  `StudID` bigint NOT NULL,
  `AssessID` varchar(25) NOT NULL,
  `CLID` varchar(50) NOT NULL,
  `Selected_Option` int NOT NULL,
  `Answer` tinytext NOT NULL,
  `Created_at` datetime NOT NULL,
  `Updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `AssignID` varchar(25) NOT NULL,
  `CLID` varchar(50) NOT NULL,
  `Question` longtext NOT NULL,
  `Option1` tinytext NOT NULL,
  `Option2` tinytext NOT NULL,
  `Option3` tinytext NOT NULL,
  `Option4` tinytext NOT NULL,
  `Correct_Option` int NOT NULL,
  `Deadline_date` date NOT NULL,
  `Deadline_Time` time NOT NULL,
  `Created_at` datetime NOT NULL,
  `Updated_at` datetime NOT NULL,
  `Question_Type` tinytext NOT NULL,
  `Correct_Answer` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submission`
--

CREATE TABLE `assignment_submission` (
  `StudID` bigint NOT NULL,
  `AssignID` varchar(25) NOT NULL,
  `CLID` varchar(50) NOT NULL,
  `Selected_Option` int NOT NULL,
  `Answer` tinytext NOT NULL,
  `Created_at` datetime NOT NULL,
  `Updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `CLID` varchar(50) NOT NULL,
  `TID` bigint NOT NULL,
  `CLName` tinytext NOT NULL,
  `CLDesc` tinytext NOT NULL,
  `CL_Schedule` tinytext NOT NULL,
  `CL_Created_at` datetime NOT NULL,
  `CL_Updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_students`
--

CREATE TABLE `class_students` (
  `CSID` varchar(25) NOT NULL,
  `CLID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StudID` bigint NOT NULL,
  `CS_ClassTime` time NOT NULL,
  `CS_ClassDay` varchar(5) NOT NULL,
  `CS_Visit_Count` int NOT NULL,
  `CS_Created_at` datetime NOT NULL,
  `CS_Updated_at` datetime NOT NULL,
  `TID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `TID` bigint NOT NULL,
  `EmpNum` bigint DEFAULT NULL COMMENT 'Employee ID Number',
  `TFName` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TLName` tinytext NOT NULL,
  `TGender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TEmail` tinytext NOT NULL,
  `TPassword` tinytext NOT NULL,
  `TVCode` varchar(5) DEFAULT NULL COMMENT 'used to store tempporary code for first login & confirmation',
  `TStatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'P-Pending / R-Rejected / A-Accepted',
  `TCreated_at` datetime NOT NULL,
  `TUpdated_at` datetime NOT NULL,
  `UserID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppsx_lessons`
--

CREATE TABLE `ppsx_lessons` (
  `LID` int NOT NULL,
  `Week_Duration` varchar(255) DEFAULT NULL,
  `Title_Lesson` varchar(255) DEFAULT NULL,
  `Lesson_URL` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ppsx_lessons`
--

INSERT INTO `ppsx_lessons` (`LID`, `Week_Duration`, `Title_Lesson`, `Lesson_URL`) VALUES
(1, 'PPT 1 week 1 day1\r\n', 'Automation 1\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vQd9TRlPcSQHSUWrAAeaJIW963YvN4mPbTJs6BlQ0S3y4Njk6YRmQUzRaVxJayEiKeEOsIg4vtiHMlF/embed?start=false&loop=false&delayms=3000\"'),
(2, 'PPT 2 week1 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vTLjqimK8-GSvqf8fYl6we3nYUYb1-fPewkX6l4ThClyeG7S_hbdBbvvhlKa6Cmf3wN7Zxd9Nn2xgFb/embed?start=false&loop=false&delayms=3000'),
(3, 'PPT 3 week2 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vR-9Dl1BVyzlJcZLhqgK332yGQ5sE4eQtTNiBm2iQfxMz-P9UJmajSqADCQIh3lc0PlY9gJynLFxgDo/embed?start=false&loop=false&delayms=3000'),
(4, 'PPT 4 week2 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vR-9Dl1BVyzlJcZLhqgK332yGQ5sE4eQtTNiBm2iQfxMz-P9UJmajSqADCQIh3lc0PlY9gJynLFxgDo/embed?start=false&loop=false&delayms=3000'),
(5, 'PPT 5 week3 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vQAm28HI6c5lDOrKi_2A_v6vEfMJnpNNfjiwJrPpKG9PzekUgWP3VLMqu4r5uDK_IOAvvO2urFYQK3R/embed?start=false&loop=false&delayms=3000'),
(6, 'PPT 6 week3 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vQy_a_ML96PWaKd_2fXxFX6PTWBt75gMmBhaU-TedMMdLprfMRTKzWa_aXy7KN5WNjP4eHeyF8Hen0H/embed?start=false&loop=false&delayms=3000'),
(7, 'PPT 7 week4 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vT1QcpNTuIJ94Yj0I-pr5hHirJrGyIPQk07j9LgTon8aMd5sEAVJY3wg2AZggeKRGK83FuCpoMOTICl/embed?start=false&loop=false&delayms=3000'),
(8, 'PPT 8 week5 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSkRjen-lgpNeTAtgdDzEBvs8nec1KWll2qpqpMs4QkJBppeHQZuMH2bPcaV7slsOJULE0vaUAC1_8w/embed?start=false&loop=false&delayms=3000'),
(9, 'PPT 9 week5 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSDJAzlBBHsOQdLQYkkUnUjpvBqTPBZQU4EKuotsDdwil34msZAfAYHz51fhC0UpDI41195m5TUGk0s/embed?start=false&loop=false&delayms=3000'),
(10, 'PPT 10 week6 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vQvoBJOEtmUazcumfp-m7G5FiP_LrfLokDukMXnT-gn-dnkw8XSl2QpXG_so0dYmsMj67ypiW923l_V/embed?start=false&loop=false&delayms=3000'),
(11, 'PPT 11 week6 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vTfby1TVpqAYIYUBg_89kHH-Lxb-tSIH0X8x2LahQAVnNHpYTK5bBDSg_lS8_pG5LLjUbnGNxljdtqI/embed?start=false&loop=false&delayms=3000'),
(12, 'PPT 12 week7 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSfrRpG072kYw2HApIQLBhatLWX8s-BFTK_fLCVtkDjwlz2J6LHa6aZp0E7dLZHvJsqX3btd6CcD-tC/embed?start=false&loop=false&delayms=3000'),
(13, 'PPT 13 week7 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vTc9BpbGv5FuYCnFCgXcXQqskAAeT5FHTEeSE4gFvHLuF3XTRvNaDdxdB3bRf_H_C9q7iKRs0qNLXo9/embed?start=false&loop=false&delayms=3000'),
(14, 'PPT 14 week8 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vT2o3LsEPiLUGUJ0t6gQ_AcirMLU9xHLzo2-f7qZMW5ftLO8i_LLVjoJOPM1WqEK9ynObjlEzGxWaEy/embed?start=false&loop=false&delayms=3000'),
(15, 'PPT 15 week9 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vTCXQrl5fLedzi9MbexHYq9ITjGhVuEyQfkwxvv7TJQJl2rUDimTqiDLvldw9qT-JwxVImv3Y1Ec7sM/embed?start=false&loop=false&delayms=3000'),
(16, 'PPT 16 week9 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSHBEd8V5wVBX1UKWismhhmq_P304yuD6kWpmZrStO3cmTD4-SqwQyyNMfsp9iVodYOHzY_GTAuYKE3/embed?start=false&loop=false&delayms=3000'),
(17, 'PPT 17 week10 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vShNHMGO0UaRp4QWFkbBqTre6Z_OMSA_wtrJSfmxrGxT8vd9dVll2oO6CBO0VHp5ZvG1enMrJuAmvLC/embed?start=false&loop=false&delayms=3000'),
(18, 'PPT 18 week10 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vTSatDy9JKizB2d9f4HLgQqyqEOpE4kN7gcE8Q0AKVF8fUQHxyxOazCAuaEgRa_Bb2gWbZvkP5ohf49/embed?start=false&loop=false&delayms=3000'),
(19, 'PPT 19 week11 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vThhCjxn7VgOfXbGigQaTbl00tLJSe9ULt4XIQa-B8ZOcBbHam5JbdzZckku5jH5az22ZHd3wEVwzsz/embed?start=false&loop=false&delayms=3000'),
(20, 'PPT 20 week11 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSuhSQUWHO_rlyprkobyTeJcx3awx0jk0AqcV6GdfbrQgqziW3f-D8f9WaQWJnMpC83PVnycPmzujIt/embed?start=false&loop=false&delayms=3000'),
(21, 'PPT 21 week12 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSSfHPmLoOvT8raACqIOki-9yTkQq1mzGISR5HlpCbrq0N38x-Y5pxq0V2VYTSuSmUk6k11G8yiwIHZ/embed?start=false&loop=false&delayms=3000'),
(22, 'PPT 22 week13 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vTbGGkXIF3SzC2QKWQpnsaH4BES0RRF6W5hivBhcxN7YXWCcZtWlvC3TuQuR1u5rLtXgwhaO1Q9MxnH/embed?start=false&loop=false&delayms=3000'),
(23, 'PPT 23 week13 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vSQxSMqrCzeuRxOE-Wr8H6LGOW_rQTnFTFOPA_XfyjJ44l6QDO5U2VtT9alu49c5jPHZRPvFHpfFjf8/embed?start=false&loop=false&delayms=3000'),
(24, 'PPT 24 week14 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vRuz2zBoh1ZsCo3QXFWXllznDjyRTuAO7ILi63_ZPnWcqUqy6-Z3x4jSuhA7o32pM0yDnsECc8ZSSGL/embed?start=false&loop=false&delayms=3000'),
(25, 'PPT 25 week14 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vQbbstyUIJpmL9nGyRqEMY9e_VgjwMIalgDeNJAWpd2VXu6iHXxQEeshCfir6C9XgtFjvyGYAlIAsb6/embed?start=false&loop=false&delayms=3000'),
(26, 'PPT 26 week15 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vRAyNi7PKknGey4hevS36ICEbvD8UawdPiaWv7oioc-N328GtZ2hbu8daORNNoapy3lS3SFL8AjDnEC/embed?start=false&loop=false&delayms=3000'),
(27, 'PPT 27 week15 day2\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vS6iJI0LBiGcs46q1MVuu7oVMBoP4hdbX3QzRgHXlDyBKHvoqEP8wbA2jPz4Dnaci56va07y1Q9y5kp/embed?start=false&loop=false&delayms=3000'),
(28, 'PPT 28 week16 day1\r\n', 'Fundamentals of Automatic Control\r\n', 'https://docs.google.com/presentation/d/e/2PACX-1vRHEYiHgxvWB4mHVNkqeA7IBXGBfi0hKkG7k6V68IsWhqkauRrTUQmf_rAAFfUpToQjkJ0ewGLxtlwI/embed?start=false&loop=false&delayms=3000');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudID` bigint NOT NULL,
  `StudSN` varchar(50) NOT NULL,
  `StudFName` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StudLName` tinytext NOT NULL,
  `Stud_Gender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Stud_email` tinytext NOT NULL,
  `Stud_Password` tinytext NOT NULL,
  `Stud_VCode` int DEFAULT NULL COMMENT 'used to store verification code for first time registrant',
  `Stud_Status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'P-Pending / R - Rejected / A - Accepted',
  `Stud_Created_at` datetime DEFAULT NULL,
  `Stud_Updated_at` datetime DEFAULT NULL,
  `UserID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_performance`
--

CREATE TABLE `student_performance` (
  `StudID` bigint NOT NULL,
  `CLID` varchar(50) NOT NULL,
  `CSID` varchar(25) NOT NULL,
  `AssignID` varchar(25) NOT NULL,
  `AssessID` varchar(25) NOT NULL,
  `Assign_TS` int NOT NULL COMMENT 'Assignment Total Score',
  `Assign_Stud_RS` double NOT NULL COMMENT 'Assignment Student Raw Score',
  `Assess_TS` int NOT NULL COMMENT 'Assessment Total Score',
  `Assess_Stud_RS` double NOT NULL COMMENT 'Assessment Student Raw Score',
  `Recorded_at` datetime NOT NULL,
  `Updated_at` datetime NOT NULL COMMENT 'In case of corrections'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `email_verification_link` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `password`, `status`, `email_verification_link`, `email_verified_at`) VALUES
(1, 'Drick Lamanilao Moniza', 'decgmoniza@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', 0, '859c71f36a0f6fe531e5c9847b4c21a29070', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_login_history`
--

CREATE TABLE `users_login_history` (
  `StudID` bigint NOT NULL,
  `TID` bigint NOT NULL,
  `LogDate` date NOT NULL,
  `LogTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_type`
--

CREATE TABLE `users_type` (
  `UserID` int NOT NULL,
  `UDesc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_type`
--

INSERT INTO `users_type` (`UserID`, `UDesc`) VALUES
(1, 'Student'),
(2, 'Instructor'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `video_lessons`
--

CREATE TABLE `video_lessons` (
  `VID` int NOT NULL,
  `VNum` varchar(25) DEFAULT NULL,
  `VTitle` varchar(255) DEFAULT NULL,
  `VUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `video_lessons`
--

INSERT INTO `video_lessons` (`VID`, `VNum`, `VTitle`, `VUrl`) VALUES
(1, 'V1', 'V1-Alert! Maritime Education Training\r\n', 'https://drive.google.com/file/d/1J9PmhwWf4aRGWLhGEynTZ8YQVnwbrrba/preview'),
(2, 'V2', 'V2-Basics of Automation\r\n', 'https://drive.google.com/file/d/1dsjxeKAgO25ELO67rLj53sWvKHD8U7fT/preview'),
(3, 'V3', 'V3-Feedback Control Systems\r\n', 'https://drive.google.com/file/d/130XKoUNjxC7gmJuk95ahXkrbNZNc2ADQ/preview'),
(4, 'V4', 'V4-Feedback and Feedforward\r\n', 'https://drive.google.com/file/d/12FcemjfAnrhStbThaxukvwER_4zJ6UEP/preview'),
(5, 'V5', 'V5-How To Adjust a Pressure Switch\r\n', 'https://drive.google.com/file/d/14Sog4LFcZhKG_OAe99T-w3zC_jDJTzHb/preview'),
(6, 'V6', 'V6-Hydrophore unit\r\n', 'https://drive.google.com/file/d/1ZUCRfb3e8vf5TcBzWJpR4rQhHYC9ZSfK/preview'),
(7, 'V7', 'V7-PID Controller\r\n', 'https://drive.google.com/file/d/1fxv0i7ryUHnI3Er8TMR1Zn2sSskP7nAS/preview'),
(8, 'V8', 'V8-Proportional Gain\r\n', 'https://drive.google.com/file/d/1Jf9zIHU6RDiKcoKQ47Eh7BM_2iIR0xAw/preview'),
(9, 'V9', 'V9-PIDs Simplified\r\n', 'https://drive.google.com/file/d/1ozSwv8xbISHIgFTx_4E45s7s43ImOJLM/preview'),
(10, 'V10', 'V10-How Bimetallic Thermometer Works\r\n', 'https://drive.google.com/file/d/171Vm2pCCNQF9IhhXBFKm98VeHKW7IGVq/preview'),
(11, 'V11', 'V11-How the bulb thermometer works\r\n', 'https://drive.google.com/file/d/1vFlnRj5qBllbN0zvgwqASwVzHyL7YlxT/preview'),
(12, 'V12', 'V12-How fluid pressure is measured\r\n', 'https://drive.google.com/file/d/1E1mK2onpp-DEoKA1KTri91Jf31GIFMEc/preview'),
(13, 'V13', 'V13-How a Bourdon Type Pressure Gauge Works\r\n', 'https://drive.google.com/file/d/1zv6fEjeJ_2NY-P5l4PIN6qN0gOD7XbjK/preview'),
(14, 'V14', 'V14-Ball Float Liquid Level Sensor\r\n', 'https://drive.google.com/file/d/1NJmP_ne8GP39tBxlV02ede8tShmVsMrh/preview'),
(15, 'V15', 'V15-Level Measurement using DP Transmitter\r\n', 'https://drive.google.com/file/d/1mDOMRof1yGj3rtG14_ZgQ04Owhmo7RKC/preview'),
(16, 'V16', 'V16-DP Flow Measurements venturi\r\n', 'https://drive.google.com/file/d/1zXVu9GdlxP5tFyLZAWk4CXN8SvDdwZo4/preview'),
(17, 'V17', 'V17-DP Flow measurement Pitot\r\n', 'https://drive.google.com/file/d/15C3dYFBK9bG-k5c9O2V5c7Mg3KWZvYgv/preview'),
(18, 'V18', 'V18-Rotameter Working Principle\r\n', 'https://drive.google.com/file/d/1z__5ZTW9sza3KW16MCzVFrlm2wz8IWot/preview'),
(19, 'V19', 'V19-Inductive Type Tachometer\r\n', 'https://drive.google.com/file/d/1PssZO9Uj1da__dv11ODhxOUdvfC96Ap9/preview'),
(20, 'V20', 'V20-Vibration Monitoring\r\n', 'https://drive.google.com/file/d/1s3zQSrZrrFMf1KS7uLnLrwomMR6pkKOW/preview'),
(21, 'V21', 'V21-Open Tank Level Measurement\r\n', 'https://drive.google.com/file/d/1LKNSXZJZLWgV2CPjOntpqkqaZhSILGjo/preview'),
(22, 'V22', 'V22-Why 4 to 20 mA\r\n', 'https://drive.google.com/file/d/1VsxHChGsFfFWYWNW6brLAnMhgicK0ex1/preview'),
(23, 'V23', 'V23-3 basic Pneumatic mechanism for pneumatic controller\r\n', 'https://drive.google.com/file/d/1I9J_JynbrtoRhsNgo6ntAINL0IBxLYXX/preview'),
(24, 'V24', 'V24-Control valves\r\n', 'https://drive.google.com/file/d/1FMB13g02yd6sEEhhgiTveXPGGs5_0rpt/preview'),
(25, 'V25', 'V25-How Diaphragm Control Valves Work\r\n', 'https://drive.google.com/file/d/1irv4R7TA-cCz6DTwzgl74_iU3k1nll0-/preview'),
(26, 'V26', 'V26-What are valve positioners\r\n', 'https://drive.google.com/file/d/1ESyTHdz1-q5xnOToW-kxxOgC8KVtvIO4/preview'),
(27, 'V27', 'V27-Calibration of positioner\r\n', 'https://drive.google.com/file/d/13Xrqefq8k53se8qKxjTYZ26vvU20B14P/preview'),
(28, 'V28', 'V28-Swash plate pump\r\n', 'https://drive.google.com/file/d/1rfT-UELOlg-hfyn4IxL60UYADKGAB8ZR/preview');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`AssessID`),
  ADD KEY `CLID` (`CLID`);

--
-- Indexes for table `assessment_submission`
--
ALTER TABLE `assessment_submission`
  ADD KEY `StudID` (`StudID`),
  ADD KEY `AssessID` (`AssessID`),
  ADD KEY `CLID` (`CLID`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`AssignID`),
  ADD KEY `CLID` (`CLID`);

--
-- Indexes for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD KEY `StudID` (`StudID`),
  ADD KEY `AssignID` (`AssignID`),
  ADD KEY `CLID` (`CLID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`CLID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `class_students`
--
ALTER TABLE `class_students`
  ADD PRIMARY KEY (`CSID`),
  ADD KEY `CLID` (`CLID`),
  ADD KEY `StudID` (`StudID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`TID`),
  ADD KEY `UID` (`UserID`);

--
-- Indexes for table `ppsx_lessons`
--
ALTER TABLE `ppsx_lessons`
  ADD PRIMARY KEY (`LID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudID`),
  ADD UNIQUE KEY `StudID_2` (`StudID`),
  ADD KEY `UID` (`UserID`),
  ADD KEY `UID_2` (`UserID`),
  ADD KEY `StudID` (`StudID`);

--
-- Indexes for table `student_performance`
--
ALTER TABLE `student_performance`
  ADD KEY `StudID` (`StudID`,`CLID`,`CSID`,`AssignID`,`AssessID`),
  ADD KEY `CLID` (`CLID`),
  ADD KEY `CSID` (`CSID`),
  ADD KEY `AssignID` (`AssignID`),
  ADD KEY `AssessID` (`AssessID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_login_history`
--
ALTER TABLE `users_login_history`
  ADD KEY `StudID` (`StudID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `users_type`
--
ALTER TABLE `users_type`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `UID` (`UserID`);

--
-- Indexes for table `video_lessons`
--
ALTER TABLE `video_lessons`
  ADD PRIMARY KEY (`VID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `TID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppsx_lessons`
--
ALTER TABLE `ppsx_lessons`
  MODIFY `LID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `video_lessons`
--
ALTER TABLE `video_lessons`
  MODIFY `VID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`CLID`) REFERENCES `classes` (`CLID`);

--
-- Constraints for table `assessment_submission`
--
ALTER TABLE `assessment_submission`
  ADD CONSTRAINT `assessment_submission_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `students` (`StudID`);

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`CLID`) REFERENCES `classes` (`CLID`);

--
-- Constraints for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD CONSTRAINT `assignment_submission_ibfk_2` FOREIGN KEY (`AssignID`) REFERENCES `assignment` (`AssignID`),
  ADD CONSTRAINT `assignment_submission_ibfk_3` FOREIGN KEY (`CLID`) REFERENCES `classes` (`CLID`),
  ADD CONSTRAINT `assignment_submission_ibfk_4` FOREIGN KEY (`StudID`) REFERENCES `students` (`StudID`);

--
-- Constraints for table `class_students`
--
ALTER TABLE `class_students`
  ADD CONSTRAINT `class_students_ibfk_2` FOREIGN KEY (`CLID`) REFERENCES `classes` (`CLID`),
  ADD CONSTRAINT `class_students_ibfk_3` FOREIGN KEY (`StudID`) REFERENCES `students` (`StudID`);

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users_type` (`UserID`);

--
-- Constraints for table `student_performance`
--
ALTER TABLE `student_performance`
  ADD CONSTRAINT `student_performance_ibfk_2` FOREIGN KEY (`CLID`) REFERENCES `classes` (`CLID`),
  ADD CONSTRAINT `student_performance_ibfk_3` FOREIGN KEY (`CSID`) REFERENCES `class_students` (`CSID`),
  ADD CONSTRAINT `student_performance_ibfk_4` FOREIGN KEY (`AssignID`) REFERENCES `assignment` (`AssignID`),
  ADD CONSTRAINT `student_performance_ibfk_5` FOREIGN KEY (`AssessID`) REFERENCES `assessment` (`AssessID`),
  ADD CONSTRAINT `student_performance_ibfk_6` FOREIGN KEY (`StudID`) REFERENCES `students` (`StudID`);

--
-- Constraints for table `users_login_history`
--
ALTER TABLE `users_login_history`
  ADD CONSTRAINT `users_login_history_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `students` (`StudID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
