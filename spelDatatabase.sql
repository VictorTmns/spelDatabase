-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2022 at 09:34 PM
-- Server version: 8.0.26-0ubuntu0.20.04.2
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spelDatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `spelen`
--

CREATE TABLE `spelen` (
  `spelID` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spelnaam` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `beschrijving` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goedgekeurd` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='een tafel met alle spellen';

--
-- Dumping data for table `spelen`
--

INSERT INTO `spelen` (`spelID`, `spelnaam`, `beschrijving`, `goedgekeurd`) VALUES
('Test01', 'een testspelletje', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec dapibus diam. Nunc pharetra a urna vel tristique. Sed id dapibus magna. Duis sit amet justo at augue sagittis vulputate sed vitae elit.\r\n', 1),
('Test02', 'een testspelletje2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta tristique vehicula. Ut sit amet dolor lorem. Duis posuere tellus eu erat accumsan placerat. Nam ante augue, blandit vitae ex ut, luctus aliquet dolor. Ut at arcu consequat, vulputate metus nec, fringilla nisi.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `spelFotos`
--

CREATE TABLE `spelFotos` (
  `spelID` varchar(63) NOT NULL,
  `fotoFileName` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `spelFotos`
--

INSERT INTO `spelFotos` (`spelID`, `fotoFileName`) VALUES
('Test01', 'Testfoto01'),
('Test01', 'Testfoto02'),
('Test02', 'Testfoto03');

-- --------------------------------------------------------

--
-- Table structure for table `spelTags`
--

CREATE TABLE `spelTags` (
  `spelID` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='alle tags dat een bepaalt spel heeft';

--
-- Dumping data for table `spelTags`
--

INSERT INTO `spelTags` (`spelID`, `tag`) VALUES
('Test01', '+/- 30 min'),
('Test02', '60+ min'),
('Test02', 'cirkel'),
('Test01', 'lopen'),
('Test01', 'nadenken');

-- --------------------------------------------------------

--
-- Table structure for table `spelUitlegTeksten`
--

CREATE TABLE `spelUitlegTeksten` (
  `SpelID` varchar(7) NOT NULL,
  `tekstID` int NOT NULL,
  `titel` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `inhoud` text NOT NULL,
  `fotoFileName` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `spelUitlegTeksten`
--

INSERT INTO `spelUitlegTeksten` (`SpelID`, `tekstID`, `titel`, `inhoud`, `fotoFileName`) VALUES
('Test01', 0, 'een testtitel voor een testspel', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus rhoncus velit sit amet mollis. Maecenas faucibus dui et lacus ultrices, ut dapibus ante posuere. Morbi sit amet velit ac mauris interdum tincidunt quis sit amet turpis. Etiam dictum imperdiet felis. Sed eros erat, imperdiet at scelerisque id, tincidunt sed arcu. Etiam a felis ac urna ultricies venenatis. Morbi a blandit nisl. Donec vitae lobortis justo. Etiam vel lorem vel tellus dapibus posuere. Mauris pellentesque enim quis felis consequat, vitae dapibus mauris volutpat.\r\n\r\n', 'testFotoVoorTestTekstblok.png'),
('Test02', 0, 'een testtitel voor een tweede testspel', 'Mauris vulputate pellentesque tortor ac volutpat. Sed tincidunt, sem at scelerisque accumsan, risus lacus ultricies metus, sed rhoncus elit mauris in mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras quam ipsum, vehicula quis venenatis in, finibus nec mauris. Sed maximus ut nisi in posuere. Duis leo sapien, vehicula tempus efficitur sit amet, hendrerit ut mauris. Sed malesuada lectus quam, id vulputate orci mollis et.', 'testFotoVoorTestTekstblok2.png'),
('Test02', 1, 'dit wordt ooit een mooie titel', 'Cras gravida, justo id facilisis sodales, libero urna euismod risus, at porttitor leo leo non orci. Donec ut dapibus nulla, vitae pretium mi. Fusce lobortis nisi nec viverra vestibulum. Vestibulum eu viverra est. Curabitur vitae porta nulla. Aenean ornare, est et lacinia luctus, justo magna porta odio, sit amet porttitor lacus justo sit amet orci. Nam molestie aliquam facilisis. Nullam sit amet lorem tincidunt, rhoncus odio sit amet, rutrum massa.\r\n\r\n', 'nogZoEenMooieTestFoto.png'),
('Test02', 2, '', 'Nullam eu sem bibendum, auctor est at, mattis risus. In euismod dictum nunc. Sed ultricies risus sit amet dui blandit, ac suscipit lacus vestibulum. Donec sit amet vestibulum enim. In hac habitasse platea dictumst. Nunc gravida, libero a bibendum ultricies, nibh felis euismod libero, nec pretium arcu augue at orci. Nullam quis blandit felis. Phasellus porta lacinia sapien, et fringilla lorem fermentum a. Donec ac malesuada tortor, vel interdum dolor. Praesent arcu nisi, tristique non finibus eu, accumsan in ligula. Donec elit neque, vestibulum pulvinar est id, porttitor consectetur diam. Cras et felis purus. Nulla facilisi. Donec purus nunc, tempor nec nisl a, rhoncus mollis magna. Nulla facilisi.\r\n\r\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='alle mogelijke tags';

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag`) VALUES
('+/- 30 min'),
('10-20 min'),
('5-10 min'),
('60+ min'),
('balspel'),
('cirkel'),
('kracht'),
('lopen'),
('nadenken'),
('sport'),
('verstoppen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `spelen`
--
ALTER TABLE `spelen`
  ADD PRIMARY KEY (`spelID`);

--
-- Indexes for table `spelFotos`
--
ALTER TABLE `spelFotos`
  ADD PRIMARY KEY (`spelID`,`fotoFileName`);

--
-- Indexes for table `spelTags`
--
ALTER TABLE `spelTags`
  ADD PRIMARY KEY (`spelID`,`tag`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `spelUitlegTeksten`
--
ALTER TABLE `spelUitlegTeksten`
  ADD PRIMARY KEY (`tekstID`,`SpelID`),
  ADD KEY `SpelID` (`SpelID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `spelFotos`
--
ALTER TABLE `spelFotos`
  ADD CONSTRAINT `spelfotos_ibfk_1` FOREIGN KEY (`spelID`) REFERENCES `spelen` (`spelID`);

--
-- Constraints for table `spelTags`
--
ALTER TABLE `spelTags`
  ADD CONSTRAINT `speltags_ibfk_1` FOREIGN KEY (`spelID`) REFERENCES `spelen` (`spelID`),
  ADD CONSTRAINT `speltags_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tags` (`tag`);

--
-- Constraints for table `spelUitlegTeksten`
--
ALTER TABLE `spelUitlegTeksten`
  ADD CONSTRAINT `speluitlegteksten_ibfk_1` FOREIGN KEY (`SpelID`) REFERENCES `spelen` (`spelID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
