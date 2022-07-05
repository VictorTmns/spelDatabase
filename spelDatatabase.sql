-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2022 at 04:41 PM
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
-- Database: `spelDatatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `spelen`
--

CREATE TABLE `spelen` (
  `SpelID` varchar(7) NOT NULL,
  `spelnaam` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `korte beschrijving` varchar(1023) NOT NULL,
  `lange beschrijving` text NOT NULL,
  `variant` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `goedgekeurd` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='een tafel met alle spellen';

--
-- Dumping data for table `spelen`
--

INSERT INTO `spelen` (`SpelID`, `spelnaam`, `korte beschrijving`, `lange beschrijving`, `variant`, `goedgekeurd`) VALUES
('Test01', 'een testspelletje', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec dapibus diam. Nunc pharetra a urna vel tristique. Sed id dapibus magna. Duis sit amet justo at augue sagittis vulputate sed vitae elit.\r\n', 'Nunc varius, diam id euismod tempor, erat urna tempor orci, fermentum elementum quam dui et eros. Phasellus rhoncus ex massa, ac placerat dolor viverra in. Phasellus placerat nisi erat, non posuere elit ullamcorper nec. Ut sed sagittis nisl. Curabitur eget libero dolor. Fusce blandit volutpat nisi eget pellentesque. Donec facilisis porta mauris, sed imperdiet lorem lobortis congue. Mauris rhoncus diam enim. Nulla convallis dolor elementum nunc posuere, sit amet pulvinar elit fermentum. Donec et leo in nulla bibendum tempus. Quisque vel tellus ut lectus interdum dignissim eu id leo. Proin libero ligula, malesuada non turpis ut, scelerisque dignissim dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc eu quam vitae odio posuere malesuada. In ac venenatis tortor. Suspendisse eleifend neque id nunc tempor, sit amet lobortis eros facilisis.\r\n\r\n', 'Nullam tincidunt semper nunc, sagittis lobortis purus imperdiet non. Fusce faucibus pharetra libero eget consequat. Proin ex turpis, interdum at fermentum eget, faucibus sed est. Duis mollis rhoncus blandit. Phasellus nec efficitur lacus. Praesent pharetra vulputate ornare. Duis ante dui, pretium nec pellentesque at, congue consectetur ante. Duis ornare metus ac lorem suscipit tristique. Pellentesque diam lectus, facilisis nec velit et, tincidunt suscipit justo.\r\n\r\n', 1),
('Test02', 'een testspelletje2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta tristique vehicula. Ut sit amet dolor lorem. Duis posuere tellus eu erat accumsan placerat. Nam ante augue, blandit vitae ex ut, luctus aliquet dolor. Ut at arcu consequat, vulputate metus nec, fringilla nisi.', 'Curabitur semper elit porta metus porta, non efficitur eros bibendum. Praesent dapibus dolor eget odio rhoncus eleifend. Nunc in purus semper, imperdiet nulla porta, condimentum est. Curabitur scelerisque mauris vel leo sollicitudin, sagittis volutpat odio lacinia. Vestibulum erat orci, porttitor id dui sit amet, efficitur egestas felis. Nunc libero eros, molestie eu ante quis, lacinia sodales ipsum. Morbi porta nulla dolor, eu lacinia erat suscipit id. Nam ornare eros mi, vitae posuere eros blandit quis. Pellentesque enim nisl, posuere vel tempor ut, efficitur sed ante.\r\n\r\n', 'Duis pharetra id justo in viverra. Donec vel ligula est. Morbi orci mi, accumsan vel dui eu, sodales rutrum ante. Maecenas odio massa, mollis vel elit eu, vehicula ultricies sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent fringilla lectus et nisi elementum mattis. Duis porttitor nec diam et tempus. Integer quis laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi diam nunc, sodales dignissim vestibulum quis, vulputate vel mauris. Etiam sed dictum ante.\r\n\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `spelTags`
--

CREATE TABLE `spelTags` (
  `SpelID` varchar(7) NOT NULL,
  `tag` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='alle tags dat een bepaalt spel heeft';

--
-- Dumping data for table `spelTags`
--

INSERT INTO `spelTags` (`SpelID`, `tag`) VALUES
('Test01', '+/- 30 min'),
('Test02', '60+ min'),
('Test02', 'cirkel'),
('Test01', 'lopen'),
('Test01', 'nadenken');

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
  ADD PRIMARY KEY (`SpelID`);

--
-- Indexes for table `spelTags`
--
ALTER TABLE `spelTags`
  ADD PRIMARY KEY (`SpelID`,`tag`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `spelTags`
--
ALTER TABLE `spelTags`
  ADD CONSTRAINT `speltags_ibfk_1` FOREIGN KEY (`SpelID`) REFERENCES `spelen` (`SpelID`),
  ADD CONSTRAINT `speltags_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tags` (`tag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
