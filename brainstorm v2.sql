-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2019 at 03:18 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brainstorm`
--
CREATE DATABASE IF NOT EXISTS `brainstorm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `brainstorm`;

-- --------------------------------------------------------

--
-- Table structure for table `bestelling`
--

CREATE TABLE `bestelling` (
  `bestellings_id` int(11) NOT NULL,
  `allergien` text NOT NULL,
  `besteld_eten` text NOT NULL,
  `gerecht_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bestelling`
--

INSERT INTO `bestelling` (`bestellings_id`, `allergien`, `besteld_eten`, `gerecht_id`) VALUES
(0, '', '2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gerechten`
--

CREATE TABLE `gerechten` (
  `gerecht_id` int(11) NOT NULL,
  `omschrijving` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gerechten`
--

INSERT INTO `gerechten` (`gerecht_id`, `omschrijving`) VALUES
(0, 'Spaghetti Bolognese\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `klant_id` int(11) NOT NULL,
  `voornaam` text NOT NULL,
  `achternaam` text NOT NULL,
  `tussenvoegsel` text NOT NULL,
  `e-mail_adres` varchar(50) NOT NULL,
  `tel_nr` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klant`
--

INSERT INTO `klant` (`klant_id`, `voornaam`, `achternaam`, `tussenvoegsel`, `e-mail_adres`, `tel_nr`) VALUES
(0, 'Hans', 'Haroldsen', '', 'gjergj@.nl', 68152935);

-- --------------------------------------------------------

--
-- Table structure for table `reserveringen`
--

CREATE TABLE `reserveringen` (
  `reserverings_id` int(11) NOT NULL,
  `klant_id` int(11) NOT NULL,
  `bestellings_id` int(11) NOT NULL,
  `tafel_id` int(11) NOT NULL,
  `aantal_gasten` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserveringen`
--

INSERT INTO `reserveringen` (`reserverings_id`, `klant_id`, `bestellings_id`, `tafel_id`, `aantal_gasten`) VALUES
(1, 0, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tafels`
--

CREATE TABLE `tafels` (
  `tafel_id` int(11) NOT NULL,
  `beschikbaar` tinyint(1) NOT NULL,
  `aantal_gasten` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tafels`
--

INSERT INTO `tafels` (`tafel_id`, `beschikbaar`, `aantal_gasten`) VALUES
(2, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD PRIMARY KEY (`bestellings_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexes for table `gerechten`
--
ALTER TABLE `gerechten`
  ADD PRIMARY KEY (`gerecht_id`);

--
-- Indexes for table `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`klant_id`);

--
-- Indexes for table `reserveringen`
--
ALTER TABLE `reserveringen`
  ADD PRIMARY KEY (`reserverings_id`),
  ADD KEY `klant_id` (`klant_id`),
  ADD KEY `bestellings_id` (`bestellings_id`),
  ADD KEY `tafel_id` (`tafel_id`),
  ADD KEY `aantal_gasten` (`aantal_gasten`);

--
-- Indexes for table `tafels`
--
ALTER TABLE `tafels`
  ADD PRIMARY KEY (`tafel_id`),
  ADD KEY `beschikbaar` (`beschikbaar`),
  ADD KEY `aantal_gasten` (`aantal_gasten`),
  ADD KEY `aantal_gasten_2` (`aantal_gasten`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klant`
--
ALTER TABLE `klant`
  MODIFY `klant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reserveringen`
--
ALTER TABLE `reserveringen`
  MODIFY `reserverings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tafels`
--
ALTER TABLE `tafels`
  MODIFY `tafel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerechten` (`gerecht_id`) ON UPDATE CASCADE;

--
-- Constraints for table `reserveringen`
--
ALTER TABLE `reserveringen`
  ADD CONSTRAINT `reserveringen_ibfk_1` FOREIGN KEY (`bestellings_id`) REFERENCES `bestelling` (`bestellings_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserveringen_ibfk_2` FOREIGN KEY (`tafel_id`) REFERENCES `tafels` (`tafel_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserveringen_ibfk_3` FOREIGN KEY (`klant_id`) REFERENCES `klant` (`klant_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserveringen_ibfk_4` FOREIGN KEY (`aantal_gasten`) REFERENCES `tafels` (`aantal_gasten`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
