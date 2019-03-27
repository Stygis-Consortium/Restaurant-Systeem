-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2019 at 02:59 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `bestelling`
--

CREATE TABLE `bestelling` (
  `bestellings_id` int(3) NOT NULL,
  `allergien` text NOT NULL,
  `besteld_eten` text NOT NULL,
  `gerecht_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gerechten`
--

CREATE TABLE `gerechten` (
  `gerecht_id` int(3) NOT NULL,
  `omschrijving` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `klant_id` int(3) NOT NULL,
  `voornaam` text NOT NULL,
  `achternaam` text NOT NULL,
  `tussenvoegsel` text NOT NULL,
  `e-mail_adres` varchar(50) NOT NULL,
  `tel_nr` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reserveringen`
--

CREATE TABLE `reserveringen` (
  `reserverings_id` int(3) NOT NULL,
  `klant_id` int(3) NOT NULL,
  `bestellings_id` int(3) NOT NULL,
  `tafel_id` int(3) NOT NULL,
  `aantal_gasten` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tafels`
--

CREATE TABLE `tafels` (
  `tafel_id` int(3) NOT NULL,
  `beschikbaar` tinyint(1) NOT NULL,
  `aantal_gasten` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `klant_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tafels`
--
ALTER TABLE `tafels`
  MODIFY `tafel_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`bestellings_id`) REFERENCES `reserveringen` (`bestellings_id`);

--
-- Constraints for table `gerechten`
--
ALTER TABLE `gerechten`
  ADD CONSTRAINT `gerechten_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `bestelling` (`gerecht_id`);

--
-- Constraints for table `klant`
--
ALTER TABLE `klant`
  ADD CONSTRAINT `klant_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `reserveringen` (`klant_id`);

--
-- Constraints for table `tafels`
--
ALTER TABLE `tafels`
  ADD CONSTRAINT `tafels_ibfk_1` FOREIGN KEY (`tafel_id`) REFERENCES `reserveringen` (`tafel_id`),
  ADD CONSTRAINT `tafels_ibfk_2` FOREIGN KEY (`aantal_gasten`) REFERENCES `reserveringen` (`aantal_gasten`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
