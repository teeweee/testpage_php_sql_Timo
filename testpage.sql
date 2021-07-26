-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2021 at 11:22 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testpage`
--
CREATE DATABASE IF NOT EXISTS `testpage` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `testpage`;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `Id` int(11) NOT NULL,
  `Name` text DEFAULT NULL,
  `Surname` text DEFAULT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`Id`, `Name`, `Surname`, `Grade`) VALUES
(9, 'Timo', 'Wiedmer', 5),
(10, 'Joel', 'Wiedmer', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`,`Surname`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
