-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2024 at 10:45 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flightdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `admintb` (
  `adminid` int(11) NOT NULL,
  `names` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(20) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`adminid`, `names`, `phone`, `email`, `password`, `date`) VALUES
(1, 'Muhire Emmanuel', '0781110784', 'admin@gmail.com', '1234567', '2024-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `bookingtb`
--

CREATE TABLE `bookingtb` (
  `bookingid` int(11) NOT NULL,
  `bookingcode` varchar(255) NOT NULL,
  `flightcode` varchar(20) NOT NULL,
  `names` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `birthdate` varchar(255) NOT NULL,
  `passportnbr` varchar(20) NOT NULL,
  `issuedate` varchar(255) NOT NULL,
  `expiredate` varchar(255) NOT NULL,
  `issuectry` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `specialservice` varchar(50) NOT NULL,
  `classtype` varchar(20) NOT NULL,
  `tripoption` varchar(20) NOT NULL,
  `assignedSeat` varchar(80) DEFAULT NULL,
  `totalprice` varchar(200) NOT NULL,
  `discount` varchar(100) NOT NULL,
  `paidtotal` varchar(100) NOT NULL,
  `bookstatus` varchar(20) NOT NULL,
  `paymentStatus` varchar(20) NOT NULL,
  `booking_timestamp` varchar(255) NOT NULL,
  `doneon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingtb`
--

INSERT INTO `bookingtb` (`bookingid`, `bookingcode`, `flightcode`, `names`, `email`, `phone`, `birthdate`, `passportnbr`, `issuedate`, `expiredate`, `issuectry`, `gender`, `specialservice`, `classtype`, `tripoption`, `assignedSeat`, `totalprice`, `discount`, `paidtotal`, `bookstatus`, `paymentStatus`, `booking_timestamp`, `doneon`) VALUES
(1, '98539', '6531', 'Samuel Ndatimana', 'ndatimanasamuel2@gmail.com', '0781110784', '2024-04-27', '098765', '2024-04-27', '2024-04-27', 'Uganda', 'male', 'No Special Services', 'Business Class', 'One Way', '99', '800', '0', '800', 'Cancelled', 'Cancelled', '2024-04-26 18:03:00', '2024-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `customertb`
--

CREATE TABLE `customertb` (
  `customerid` int(11) NOT NULL,
  `names` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `doneon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customertb`
--

INSERT INTO `customertb` (`customerid`, `names`, `email`, `phone`, `password`, `doneon`) VALUES
(1, 'Ndatimana Samuel', 'user@gmail.com', '0781110784', '1234567', '2024-04-25'),
(2, 'Ndatiamana Samuel', 'usertwo@gmail.com', '0781110784', '1234567', '2024-04-25'),
(3, 'Emmanuel Ndahinduka', 'userfour@gmail.com', '0781110784', '1234567', '2024-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `flighttb`
--

CREATE TABLE `flighttb` (
  `flightid` int(11) NOT NULL,
  `flightcode` varchar(100) NOT NULL,
  `flightname` varchar(20) NOT NULL,
  `flightseats` varchar(100) NOT NULL,
  `flightdescr` varchar(100) NOT NULL,
  `flighturl` varchar(255) NOT NULL,
  `flightdeparturedate` varchar(255) NOT NULL,
  `flightarrivaldate` varchar(255) NOT NULL,
  `flightstarttime` varchar(30) NOT NULL,
  `flightendtime` varchar(30) NOT NULL,
  `flightfrom` varchar(100) NOT NULL,
  `flightto` varchar(100) NOT NULL,
  `flightclassone` varchar(20) NOT NULL,
  `flightclasstwo` varchar(20) NOT NULL,
  `flightclassthree` varchar(20) NOT NULL,
  `priceone` varchar(80) NOT NULL,
  `pricetwo` varchar(80) NOT NULL,
  `pricethree` varchar(80) NOT NULL,
  `doneon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flighttb`
--

INSERT INTO `flighttb` (`flightid`, `flightcode`, `flightname`, `flightseats`, `flightdescr`, `flighturl`, `flightdeparturedate`, `flightarrivaldate`, `flightstarttime`, `flightendtime`, `flightfrom`, `flightto`, `flightclassone`, `flightclasstwo`, `flightclassthree`, `priceone`, `pricetwo`, `pricethree`, `doneon`) VALUES
(1, '6531', 'Rwanda Air', '99', 'none more nice journey', 'https://miradalogos.net/wp-content/uploads/2021/01/RwandAir-Logo-768x432.png', '2024-04-26', '2024-04-27', '22:05', '23:06', 'Kigali', 'Johannesburg', 'FirstClass', 'BusinessClass', 'EconomyClass', '1000', '800', '600', '2024-04-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admintb`
--
ALTER TABLE `admintb`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `bookingtb`
--
ALTER TABLE `bookingtb`
  ADD PRIMARY KEY (`bookingid`);

--
-- Indexes for table `customertb`
--
ALTER TABLE `customertb`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `flighttb`
--
ALTER TABLE `flighttb`
  ADD PRIMARY KEY (`flightid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admintb`
--
ALTER TABLE `admintb`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookingtb`
--
ALTER TABLE `bookingtb`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customertb`
--
ALTER TABLE `customertb`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flighttb`
--
ALTER TABLE `flighttb`
  MODIFY `flightid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
