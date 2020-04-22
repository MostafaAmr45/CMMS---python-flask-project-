-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 02:08 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmms`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `specialty` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_name`, `username`, `password`, `age`, `phone`, `specialty`) VALUES
(1, 'yossef sameh', 'yossefsameh', '1234', 26, '01123153294', 'Technician'),
(2, 'mostafa amr', 'mostafaamr', '0000', 32, '01002858985', 'responsible for ICU department'),
(3, 'mohamed ehab', 'mohamedehab', '1111', 29, '01000129844', 'doctor'),
(4, 'sherif esam', 'sherifesam', '2222', 29, '01126241341', 'biomedical engineer'),
(5, 'mostafa abdelmohsen', 'mostafaabdelmohsen', '3333', 30, '01012241699', 'financial manager'),
(6, 'sara ahmed', 'saraahmed', '4444', 28, '01211111111', 'nurse'),
(7, 'ahmed ali', 'ahmedali', '5555', 40, '01111111111', 'head manager'),
(8, 'maria khalil', 'mariakhalil', '6666', 30, '01111111112', 'doctor'),
(9, 'mariem khaled', 'mariemkhaled', '7777', 30, '01211111112', 'nurse'),
(10, 'ali mohamed', 'alimohamed', '8888', 29, '01255555555', 'technician');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `equipment_name` varchar(30) NOT NULL,
  `manufacturer` varchar(30) NOT NULL,
  `agent` varchar(30) NOT NULL,
  `nameplate model` varchar(20) NOT NULL,
  `serial number` varchar(20) NOT NULL,
  `installation date` date NOT NULL,
  `department` varchar(20) NOT NULL,
  `contact date of agent` date DEFAULT NULL,
  `contact date of manufacturer` date DEFAULT NULL,
  `work performed on the device` varchar(1000) DEFAULT NULL,
  `ecquisition costs` int(11) NOT NULL,
  `equipment downtime` varchar(20) NOT NULL,
  `repair and PM costs` varchar(30) NOT NULL,
  `repair turn-around time` varchar(20) NOT NULL,
  `warranty expiration date` date NOT NULL,
  `Risk category` varchar(10) NOT NULL,
  `Life expectancy` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `equipment_name`, `manufacturer`, `agent`, `nameplate model`, `serial number`, `installation date`, `department`, `contact date of agent`, `contact date of manufacturer`, `work performed on the device`, `ecquisition costs`, `equipment downtime`, `repair and PM costs`, `repair turn-around time`, `warranty expiration date`, `Risk category`, `Life expectancy`) VALUES
(1, 'Ventilator', 'The Laryngeal Mask company', 'Mr.Frank Henderson', 'MONNAL T75', 'MT75-03846', '2014-06-01', 'ICU', '2013-11-01', '2013-12-01', NULL, 100000, 'every 6 months', '5000', '3 hours average', '2032-06-01', 'low', '18 year '),
(2, 'Incubator', 'BIOMED ELECTRICALS', 'Mr.Frank Henderson', 'INC - 70', '2892', '2014-05-01', 'NICU', '2013-10-01', '2013-11-01', NULL, 20000, 'every 3 months', '2000', '30 min ', '2027-06-01', 'moderate', '12 year '),
(3, 'Defibrillator', 'CPR Savers', 'Mr.Frank Henderson', 'HeartStart HS1', '69520757', '2014-06-01', 'ICU', '2013-10-01', '2013-11-01', NULL, 69500, 'every 3 months', '3000', '30 min', '2030-06-01', 'high', '14 year '),
(4, 'MRI', 'Caliper Life Science', 'Mr.Frank Henderson', 'RF f2052', '367898-084', '2014-04-01', 'radiology', '2013-06-01', '2013-07-01', NULL, 1000000, 'every 2 years', '50000', '3 hours', '2032-06-01', 'low', '18 year '),
(5, 'CT scanner', 'ADANI', 'Mr.Frank Henderson', 'ADANi-VENTUM', '67467959', '2014-08-01', 'radiology', '2013-06-01', '2013-07-01', NULL, 800000, 'every year', '40000', '3 hours', '2030-06-01', 'low', '15 year'),
(6, 'Anesthesia machine', 'Hilditch grpup', 'Mr.Frank Henderson', 'Avanta integra SL', 'SL-200', '2014-03-01', 'Anesthiology', '2013-06-20', '2013-07-30', NULL, 5000, 'every 6 months', '600', '20 min', '2032-06-01', 'low', '18 year '),
(7, 'ECG', 'CPR Savers', 'Mr.Frank Henderson', 'portable-144', '946879-3', '2014-02-01', 'CICU', '2013-11-01', '2013-12-01', NULL, 100, 'every 3 months', '', '20 min', '2025-06-01', 'moderate', '10 years'),
(8, 'Aspiration/Suction Pump', 'Sanlian Pump Company', 'Mr.Frank Henderson', 'ST', '467489-76', '2014-03-01', 'ICU', '2013-10-06', '2013-11-01', NULL, 6000, 'every 6 months', '500', '30 min', '2025-06-01', 'low', '10 years'),
(9, 'Blood Chemistry analyzer', 'Wuhan Darppon Medical Tech.', 'Mr.Frank Henderson', 'DS-301', 'B2000', '2014-08-20', 'laboratiry', '2013-10-20', '2013-11-20', NULL, 5500, 'every 6 months', '1000', '30 min', '2033-06-01', 'high', '17 year '),
(10, 'Infant Radiant Warmer', 'Nanjing Poweam Medical ', 'Mr.Frank Henderson', 'IW-4A', '56400-2', '2014-02-11', 'NICU', '2013-06-06', '2013-07-06', NULL, 30000, 'every 6 months', '', '30 min', '2027-08-01', 'moderate', '10 years');

-- --------------------------------------------------------

--
-- Table structure for table `incpection`
--

CREATE TABLE `incpection` (
  `id` int(11) NOT NULL,
  `physicalCondition` varchar(10) NOT NULL,
  `batteryWells_batteries` varchar(10) NOT NULL,
  `cablePort` varchar(10) NOT NULL,
  `functionality` varchar(10) NOT NULL,
  `wo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `incpection`
--

INSERT INTO `incpection` (`id`, `physicalCondition`, `batteryWells_batteries`, `cablePort`, `functionality`, `wo_id`) VALUES
(1, 'pass', 'pass', 'pass', 'pass', 4),
(2, 'pass', 'pass', 'pass', 'fail', 5),
(3, 'fail', 'pass', 'pass', 'fail', 6),
(4, 'pass', 'pass', 'pass', 'pass', 11),
(6, 'pass', 'pass', 'pass', 'pass', 14);

-- --------------------------------------------------------

--
-- Table structure for table `ppm`
--

CREATE TABLE `ppm` (
  `id` int(11) NOT NULL,
  `chasis_housing` varchar(5) NOT NULL DEFAULT 'Pass',
  `casters_brakes` varchar(5) NOT NULL DEFAULT 'Pass',
  `AC_plug` varchar(5) NOT NULL DEFAULT 'Pass',
  `line_cord` varchar(5) NOT NULL DEFAULT 'Pass',
  `circuitBreaker_fuse` varchar(5) NOT NULL DEFAULT 'Pass',
  `tubes_hoses_bulbs` varchar(5) NOT NULL DEFAULT 'Pass',
  `labeling` varchar(5) NOT NULL DEFAULT 'Pass',
  `transducer` varchar(5) NOT NULL DEFAULT 'Pass',
  `control_switch` varchar(5) NOT NULL DEFAULT 'Pass',
  `wo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ppm`
--

INSERT INTO `ppm` (`id`, `chasis_housing`, `casters_brakes`, `AC_plug`, `line_cord`, `circuitBreaker_fuse`, `tubes_hoses_bulbs`, `labeling`, `transducer`, `control_switch`, `wo_id`) VALUES
(1, 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 7),
(2, 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 8),
(3, 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'pass', 'fail', 9),
(4, 'pass', 'pass', 'pass', 'pass', 'fail', 'fail', 'fail', 'pass', 'pass', 12),
(5, 'pass', 'pass', 'pass', 'fail', 'fail', 'pass', 'pass', 'pass', 'pass', 15);

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `id` int(11) NOT NULL,
  `malfunction` varchar(100) NOT NULL,
  `status` char(6) NOT NULL,
  `wo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repair`
--

INSERT INTO `repair` (`id`, `malfunction`, `status`, `wo_id`) VALUES
(1, 'the green light switch doesn\'t work when the device is on and vice versa', 'done', 1),
(2, 'the device isn\'t working at all', 'active', 2),
(3, 'signals overlapped', 'done', 3),
(5, 'broken heart', 'active', 10),
(7, 'cacasca', 'done', 13);

-- --------------------------------------------------------

--
-- Table structure for table `wo`
--

CREATE TABLE `wo` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `plannedDate` date NOT NULL,
  `actualDate` date DEFAULT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'active',
  `priority` varchar(10) NOT NULL,
  `assigned_technician_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo`
--

INSERT INTO `wo` (`id`, `type`, `description`, `plannedDate`, `actualDate`, `state`, `priority`, `assigned_technician_id`, `equipment_id`) VALUES
(1, 'repair', 'light switches not working properly', '2020-01-12', '2020-02-01', 'done', 'moderate', 4, 10),
(2, 'repair', 'No response (completely switch off)', '2020-02-06', '2020-02-11', 'done', 'high', 1, 3),
(3, 'repair', 'unclear signals and readings', '2020-03-15', '2020-03-22', 'done', 'low', 10, 7),
(4, 'incpection', 'MRI need to be incpected', '2020-01-22', '2020-02-15', 'done', 'high', 5, 4),
(5, 'incpection', 'infant incupator need to be incpected', '2020-03-13', '2020-03-22', 'done', 'very high', 3, 2),
(6, 'incpection', 'CT scanner\' incpection', '2020-03-20', '2020-03-27', 'done', 'low', 7, 5),
(7, 'ppm', 'it\'s time for ventilator ppm', '2020-02-29', '2020-03-08', 'done', 'moderate', 2, 1),
(8, 'ppm', 'it\'s time for \"Aspiration\" ppm', '2020-03-01', '2020-03-12', 'done', 'high', 6, 8),
(9, 'ppm', 'it\'s time for \"Anesthesia machine\" ppm', '2020-01-14', '2020-01-23', 'done', 'high', 9, 6),
(10, 'repair', 'broken connectors', '2020-04-15', '2020-04-26', 'done', 'very high', 4, 1),
(11, 'incpection', 'Infant Radiant Warmer need to be incpected', '2020-04-20', '2020-04-30', 'done', 'moderate', 5, 6),
(12, 'ppm', 'it\'s time for \"CT scanner\" ppm', '2020-03-29', '2020-04-01', 'done', 'low', 4, 5),
(13, 'repair', 'end alarm doesn\'t work', '2020-04-22', '2020-04-22', 'done', 'very high', 10, 8),
(14, 'incpection', '\"Blood Chemistry analyzer\" need to be incpected', '2020-04-13', '2020-04-22', 'done', 'moderate', 9, 9),
(15, 'ppm', 'it\'s time for \"ECG\" ppm', '2020-04-20', '2020-04-22', 'done', 'high', 1, 7),
(16, 'ppm', 'it\'s time for \"MRI\" ppm', '2020-04-19', NULL, 'active', 'low', 8, 4),
(17, 'repair', NULL, '2020-04-08', NULL, 'active', 'very high', 8, 3),
(18, 'ppm', '', '2020-04-24', NULL, 'active', 'high', 3, 2),
(19, 'incpection', '', '2020-05-17', NULL, 'active', 'very high', 4, 1),
(20, 'repair', 'ultrasound malfunction', '2020-04-22', NULL, 'active', 'very high', 8, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incpection`
--
ALTER TABLE `incpection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wo_id` (`wo_id`);

--
-- Indexes for table `ppm`
--
ALTER TABLE `ppm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wo_id` (`wo_id`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wo_id` (`wo_id`);

--
-- Indexes for table `wo`
--
ALTER TABLE `wo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned technician id` (`assigned_technician_id`),
  ADD KEY `equipment id` (`equipment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incpection`
--
ALTER TABLE `incpection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ppm`
--
ALTER TABLE `ppm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `repair`
--
ALTER TABLE `repair`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wo`
--
ALTER TABLE `wo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incpection`
--
ALTER TABLE `incpection`
  ADD CONSTRAINT `incpection_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `wo` (`id`);

--
-- Constraints for table `ppm`
--
ALTER TABLE `ppm`
  ADD CONSTRAINT `ppm_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `wo` (`id`);

--
-- Constraints for table `repair`
--
ALTER TABLE `repair`
  ADD CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `wo` (`id`);

--
-- Constraints for table `wo`
--
ALTER TABLE `wo`
  ADD CONSTRAINT `wo_ibfk_1` FOREIGN KEY (`assigned_technician_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `wo_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
