-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2015 at 07:07 AM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teams_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accrual_policies`
--

CREATE TABLE IF NOT EXISTS `accrual_policies` (
  `id` int(10) unsigned NOT NULL,
  `accrual_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accrual_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `day_of_month` int(11) NOT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_exceptions`
--

CREATE TABLE IF NOT EXISTS `assign_exceptions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `exception_id` int(11) NOT NULL,
  `severity` varchar(255) NOT NULL,
  `grace` time DEFAULT NULL,
  `watch_window` time DEFAULT NULL,
  `email_notification` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assign_exceptions`
--

INSERT INTO `assign_exceptions` (`id`, `group_id`, `exception_id`, `severity`, `grace`, `watch_window`, `email_notification`) VALUES
(1, 1, 1, 'Critical', '00:00:15', '00:30:00', 'Both'),
(2, 1, 2, 'Critical', '00:00:15', '00:30:00', 'Both'),
(3, 1, 3, 'Medium', NULL, NULL, 'Both'),
(4, 1, 4, 'Medium', '00:00:15', '00:30:00', 'Both'),
(5, 1, 5, 'Medium', '00:00:15', '00:30:00', 'Both'),
(6, 1, 6, 'High', '00:00:15', '00:30:00', 'Both'),
(7, 1, 7, 'Low', '00:00:15', '00:30:00', 'Both'),
(8, 1, 8, 'Medium', '00:00:15', '00:30:00', 'Both'),
(9, 1, 9, 'Critical', '00:00:15', '00:30:00', 'Both'),
(10, 1, 10, 'High', '00:00:15', '00:30:00', 'Both'),
(11, 1, 11, 'Critical', NULL, NULL, 'Both'),
(12, 1, 12, 'Low', '00:00:15', '00:30:00', 'Both'),
(13, 1, 13, 'High', '00:00:15', '00:30:00', 'Both'),
(14, 1, 14, 'High', '00:00:15', '00:30:00', 'Both'),
(15, 1, 15, 'Low', '00:00:15', '00:30:00', 'Both'),
(16, 1, 16, 'Medium', NULL, NULL, 'Both');

-- --------------------------------------------------------

--
-- Table structure for table `assign_overtimes`
--

CREATE TABLE IF NOT EXISTS `assign_overtimes` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `range_from` date NOT NULL,
  `range_to` date NOT NULL,
  `overtime_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(10) unsigned NOT NULL,
  `branch_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_name`, `status`, `code`, `address`, `city`, `country`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Sta.Mesa', 'Enabled', 'B1', 'Teresa St.', 'MANILA', 'Philippines', 'sta.mesa_company@gmail.com', '2015-07-29 08:36:26', '2015-07-29 08:36:26'),
(2, 'Makati', 'Enabled', 'B2', 'Cembo St.', 'Makati', 'Philippines', 'makati_company@email.com', '2015-07-29 08:37:07', '2015-07-29 08:37:07'),
(3, 'Ortigas', 'Enabled', 'B3', 'Uno St.', 'Manila', 'Philippines', 'ortigas_company@email.com', '2015-07-29 08:38:39', '2015-07-29 08:38:39'),
(4, 'Eastwood', 'Enabled', 'B4', 'santolan rd', 'Pasig', 'Philippines', 'eastwood_company@email.com', '2015-07-29 08:39:26', '2015-07-29 08:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `breaks`
--

CREATE TABLE IF NOT EXISTS `breaks` (
  `id` int(10) unsigned NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `break_in` time NOT NULL,
  `break_out` time NOT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `breaks`
--

INSERT INTO `breaks` (`id`, `schedule_id`, `break_in`, `break_out`, `day`, `created_at`, `updated_at`) VALUES
(3, 1, '12:00:00', '13:30:00', 'Monday', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `break_policies`
--

CREATE TABLE IF NOT EXISTS `break_policies` (
  `id` int(10) unsigned NOT NULL,
  `break_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active_after` time NOT NULL,
  `autodetect_breaksby` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(10) unsigned NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int(10) unsigned NOT NULL,
  `contract_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `contract_name`, `description`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 'regular type employee', 99999, '2015-07-29 08:55:07', '2015-07-29 08:55:07'),
(2, 'Contractual', 'Contractual type employee', 6, '2015-07-29 08:55:32', '2015-07-29 08:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `create_requests`
--

CREATE TABLE IF NOT EXISTS `create_requests` (
  `id` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request_date` date NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `create_requests`
--

INSERT INTO `create_requests` (`id`, `status`, `request_date`, `start_date`, `start_time`, `end_date`, `end_time`, `message`, `request_type`, `employee_id`, `created_at`, `updated_at`) VALUES
(8, 'declined', '2015-09-17', '2015-09-08', '00:00:00', '2015-09-16', '00:00:00', 'Sore Eyes', 'Sick Leave', 10, '2015-09-16 21:19:55', '2015-09-16 21:19:55'),
(11, 'changed', '2015-09-24', '2015-09-01', '00:00:00', '2015-09-02', '00:00:00', 'This is It', 'Sick Leave', 10, '2015-09-23 09:31:05', '2015-09-23 09:31:05'),
(15, 'changed', '2015-09-24', '2015-09-01', '00:00:00', '2015-09-02', '00:00:00', 'THis is the ice cold', 'Sick Leave', 10, '2015-09-24 00:36:57', '2015-09-24 00:36:57'),
(16, 'changed', '2015-09-24', '2015-09-02', '00:00:00', '2015-09-03', '00:00:00', 'this is', 'Emergency Leave', 10, '2015-09-24 00:37:28', '2015-09-24 00:37:28'),
(17, 'changed', '2015-09-24', '2015-09-02', '00:00:00', '2015-09-03', '00:00:00', 'this is', 'Sick Leave', 10, '2015-09-24 01:42:18', '2015-09-24 01:42:18'),
(18, 'changed', '2015-09-24', '2015-09-01', '00:00:00', '2015-09-03', '00:00:00', 'has cough', 'Sick Leave', 10, '2015-09-24 07:20:39', '2015-09-24 07:20:39'),
(19, 'approved', '2015-09-25', '2015-09-01', '00:00:00', '2015-09-03', '00:00:00', 'This is an emergency', 'Emergency Leave', 10, '2015-09-24 08:21:41', '2015-09-24 08:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `credit_policies`
--

CREATE TABLE IF NOT EXISTS `credit_policies` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `credit_reset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preset_basis` date DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_value` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `withdrawable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_leaves` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credit_policies`
--

INSERT INTO `credit_policies` (`id`, `name`, `description`, `credit_reset`, `preset_basis`, `frequency`, `start_value`, `rate`, `withdrawable`, `allowed_leaves`, `created_at`, `updated_at`) VALUES
(1, 'Maternal Leave', 'leave for pregnancy', '4', '0000-00-00', '', 0, 0, 'no', 0, '2015-06-30 03:14:23', '2015-06-30 03:14:23'),
(2, 'Sick Leave', 'For those employees with illness', NULL, NULL, 'Monthly', 0, 1.25, NULL, NULL, '2015-09-24 09:10:20', '2015-09-24 09:10:20'),
(3, 'Vacation Leave', '', NULL, NULL, 'Monthly', 0, 1.25, NULL, NULL, '2015-09-24 09:12:04', '2015-09-24 09:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `custom_assign_overtimes`
--

CREATE TABLE IF NOT EXISTS `custom_assign_overtimes` (
  `id` int(10) unsigned NOT NULL,
  `active_after` int(11) NOT NULL,
  `Allowed_number_of_hours` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `range_from` date NOT NULL,
  `range_to` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `status`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Sales', 'D1', 'Enabled', 1, '2015-07-29 09:03:01', '2015-07-29 09:03:01'),
(2, 'Quality Assurance', 'D2', 'Enabled', 2, '2015-07-29 09:16:20', '2015-07-29 09:16:20'),
(3, 'Information Technology', 'D3', 'Enabled', 3, '2015-07-29 09:16:52', '2015-07-29 09:16:52'),
(4, 'Marketing', 'D4', 'Enabled', 4, '2015-07-29 09:17:05', '2015-07-29 09:17:05'),
(5, 'Human Resource', 'D5', 'Enabled', 1, '2015-07-29 09:17:25', '2015-07-29 09:17:25'),
(6, 'Executive', 'D6', 'Enabled', 2, '2015-07-29 10:01:59', '2015-07-29 10:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE IF NOT EXISTS `downloads` (
  `id` int(10) unsigned NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`id`, `file_name`, `path`, `created_at`, `updated_at`) VALUES
(7, 'Census', 'forms/Census.pdf', '2015-09-01 02:50:52', '2015-09-01 02:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `empdownloads`
--

CREATE TABLE IF NOT EXISTS `empdownloads` (
  `id` int(10) unsigned NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employeefiles`
--

CREATE TABLE IF NOT EXISTS `employeefiles` (
  `id` int(10) unsigned NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employs`
--

CREATE TABLE IF NOT EXISTS `employs` (
  `id` int(10) unsigned NOT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `midinit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hire_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` blob,
  `qr_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jobtitle_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employs`
--

INSERT INTO `employs` (`id`, `employee_number`, `lname`, `fname`, `midinit`, `picture_path`, `date_of_birth`, `street`, `barangay`, `city`, `phone`, `email`, `hire_date`, `status`, `fingerprint`, `qr_code`, `password`, `jobtitle_id`, `department_id`, `contract_id`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 'EMP-00001', 'Ramos', 'Rock Well', 'L', 'employees/1RamosRockWell.jpg', '1995-05-15', '49-A Santolan Rd.', 'Brgy. Valencia', 'Quezon City', '09368195923', 'kwellramos015@gmail.com', '2013-07-31', 'Active', 0x00f83401c82ae3735cc0413709ab71b09f145592e94be1040021e8b18f68d77242cb50fbc7400b77ff9ee26caa90b16ad74ebdf4d53475b7b44cbb6617eb678d9144eb7b5ee01fab49394166251507604ab5186b2fd70b0b20b0b17f2829908a52f8c2aab4e99a3c610dfa0339b4ec4bc104d32f5ad74a69df2ae2b606e7b8240b8ff7ed9828d3355668a2e89319ea0de95755eec78ac47fa7d5b8941a8ae88128a7f2001898a6ec6b9761ff2072a0ac168963494a95007970b9c7f3f05b8daebea627ff33a5c41d2ccbdbbfc61d58184025e35339a0231e794db63d78b61600cd6145eb9712ba9acf1084a34fade66ff3eecd6ca2bcc67c08c21be6b0e3784664612341c22daea93989cbcaf78f69a52959d5800d4a08ef77dbc87e6a4f1644372700b0d530f4f75320fc5069febe0fa1803b03f37a04a06f00f84401c82ae3735cc0413709ab717087145592b3ac220b59afe9cf9f3966d06395445da3e0777b3c419c3311a961e5a3ea56d925351ad7715416a278ce99f3f7223d7934d335e52a9c2ff05bfb8e06f12c1460e19f95ac04f8a1cd066b464f827d9ebb52e5baa4be2134a1d4fe55fa122d509780e1cd714e31d6328f2142e40c7360290449d0bc1e51a70e0f1b975258dc4864451d333537cde221fb59ae9a7667c8416c95270f4dac63da86b391b7d397270d8700f79cbf2a94003c9905613c42fa0dd7500c4de988785e09dd4c216b2980f089fe401f98d9d4d7719eb0c4eaf374aad11e94f751010e73cd62098c09400390d4045f8fc8fba70807e7b6732541c8432525e7ce564f5abd2090ac75cec27e5ac41b35e8f2a21cd8f27a0f7b6ccf38b656f71daa12581969986562d128654b46f2aacef953ccf07eee0c9ee98b555a12810c93616f00f83901c82ae3735cc0413709ab7130ab14559291d744929d1468b79a7f0e93604a9955d5c827be3a67ac91e000b251b8de9595648d91fcda9f67259d7f68f07d712791ba739ba0e573406e5dbc587cb2752e5f36aa494e687ca24d8e293b3e2637e3a8a3f70db64ac4787e983328aee7a9cc0ae12f578bdb6244154a91cacc78f1e4aacf1d05223133ddfd0a426833e322f4ed155e116126bf0ab1590544689ea278b2cd815aff8a8e0d9e29d3742bce9fca747aee75a48fb6a7ade2893b06b3fef78ae6d1235503d997b7bcbfb2ff65ba3ebd185580b1a21408355ddef9b6fabb61497485e50fd79b843e859db644b24473d9552da294014b9b0dea63a4a518506689f894de5774ecbe97c1fdb8272bb3328204daec78c75a529501bf6535840a1b570cb29be5f89132e60852714c73b47d213320e374686df7d76e6f00e8f600c82ae3735cc0413709ab71f0d714559271d59f9f81f387ef2efa146d72bfe3941a672d1c708e54d75415d8629f69fc622c779603809eb00e1048a3c9d4da8ae27d02c5c5bdd39d28c15712ebd2f71fb78fc8994ff33c1c25c424ad0b99483ed0da7af0a507983bb982253005e56c4d003c255ebd9ec3c40f92b929bcea54ec3a2243212ef0f79b09a4c0665211f7e51ef6dc58abc2dc56fc8ba992056f7b48ace8a839baa57c0163900d5feb19231dc1345d1a8cbde7198db11e10cc68c03458873ba5572ecaf4c632f4f4a0c88b39faf061ec8d3abfd41461e714a0ab841f8ec21530182806930d1668a49853524b27ea597fb806766f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/1RamosRockWell.png', 'rock123', 3, 1, 1, 3, '2015-07-29 09:07:54', '2015-09-24 10:46:25'),
(2, 'EMP-00002', 'Mante', 'Joshua Elijah', 'T', 'employees/2ManteJoshuaElijah.jpg', '1996-04-29', '266-A Alley 2 Teresa St.', 'Brgy. 591', 'MANILA', '09268475323', 'excelsior.mante@gmail.com', '2015-07-31', 'Active', 0x00f87601c82ae3735cc0413709ab71f0811455923f58f43c54e6586370ec15830df49ac26bfd510fb4a81928b0adbf83b9b719141fd189b765e6eaa7b66247b3beb16ceb9f8efcafadd7d1eef48c155332b8bd2bff0d4274e29c0171c6abfe83ea8f128800127ac3843eadb6e7f6d21c694cc9ebef7b45f86d1114e1440fc30f2b84432456cff5dd99ba82348d88fa2b14187096954e357a070f569ed1c5f8ac6d5229d863e7bb179b9931e6f6c340b97fb300202b1ab516b7cb1263c8e3b4edaf149691315fb488f089024ba8e426e566bf65571c5646afa1bb1abbe50f5a5f3f50d0bda88ef4e99fc1322559f679473512024447905e86beb283a03dbda64b3a31f2f244af4540a8de2e7bdcf86159603b540bb98435d8c3076c6cd246aaaf1e9aee1ce8947c208bc96cde49bc1b924e731c7a5da79284fa07f7006bfefb32542eae78e08c335c33f380fcb387e265a8bfee0d1373588df7efab3b82f06cc4acc22a638efdf82b012fa6fefcc2ab4a02d0c08f65815568ecc66f00f85f01c82ae3735cc0413709ab7170f2145592addffa75badaa22c02ab891c5fea618339ecfd87f5207f16bb4bea0bd65dcd5d87fb81e48864d654f7bdb6c5bdc2560a443eb8a2945f51a4cb1f3ca1e846681251ad888ab28af76d098d9396e133a0c3ad9b4944185a8023d091255f286ecb8757926213408916c1116ebfb5c9be6d39cae770e55c6fd533962b3c7e3391d221148e6a062665cf63312f156c8a8ef56eb1887146c0e789590f711adc79921966aa353a405cfaa6ce532993fcd2ac1455dba26908c70313ffc209ef5efcf233b6beb2af9d7851ddc82494c1c5d297a78767962be899f381b26389a56e0cbaeca17b27c5bcc81992959d333ecd0b950c38c9a35d28aeec73cdb8a587be6f1c532fb4e4a332681594234f3e309b221e45caa7c772568b54e75239a7e4f9f8be15d0099c82029c21aa36936a2ee7f24bef3d7678fabbce577e23d7ba09542d1768d792d8d5ae12b73d9cb3df60f38733236f00f87801c82ae3735cc0413709ab71f0851455925ec96d88daaa3c0a819c1ca00d7edc841c03efa67a46c3521f2c39189e00bfbbc5ced08da26d2c17c179f88eb9a1ffecb2acfed36cc65e2cb7d1c609a6c82ef52a6c4032985d8b9231e11bddb73bffa428076e993ec1148a9a07ed54b916087862408c538a0f68092afde386de3530e7e812b8bb31a14cd43790778231559347a3125aef1dd74818c4da2748f33a975c35a8c56cd3eee8aaba3e2c521409def7f12122afc5171daea1ce9a6194bda4379f2b6705f5252a275e1462b7daf6ccf8d1e2a87275476d70a045db8941cbff565034259ae1a54b9b9aab7d6cc9fc83464d86ba0e08edc2fbe13e4936f4a8815f48c1d701e39830dab8e076b688180e291e90ead4f96eedbedbaec10a4dba12c916e0058108f8693fb12f7d7644f9ab37f0e22b66fffdb407811652a95a94ce38289df1f405efd123b5f18cfda1489245098a60f33b07452a0bc4d468d9703b13b9f55419b3a79c4a2452bad008fc8bf61575e531a927a6316f00e88001c82ae3735cc0413709ab71709b145592deea14c937580a9e2eec5bfe552a8b5d7126e4014e8d800f76e5431ca1b3afb2c3ff53113a6781de04fe7bcc1e1049c73bc93acb30346537c528d03729dd1f1d931481db217c09c4776f3ae2bad8178a990ac112ceeb5c085b181b45e006c5540021fa0536e36ae53a2f34fa606ae5a30dd2c433d270041d07d57592ed1b62d0810fe234c412529160481370033c47bcae3901373d9b9b9b2638cb0ab5bb3cfd1bbc36dea2dee89bce818f88b71ff998499f320371043e567d9edfdcc0f2c8994b6c693a4d02e5eb371c510246aaf85d84c9d1e4a1005918f52ce064a42de40df00c9615028bd2f345b5be1e3ff51cdace702c235f82d8dc0d2132d1368937cbd340674c81e5a140b6d7360df470bea5677debb8f55ee39de1f391725087267256133734b7cdf8fcbb6ffa4cb0aaec4c54c38fa4165b3302fd97c498eab9d4c2835c48dfa44d3ebee861a562c77630b775c036661e14cb14842044c36e2275fa5a528e27f09ec856578efeda1e4f56a66f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/2ManteJoshuaElijah.png', 'joshgay', 6, 6, 1, 2, '2015-07-29 09:12:59', '2015-07-29 10:03:01'),
(3, 'EMP-00003', 'Fernandez', 'Denimar', 'F', 'employees/3FernandezDenimar.jpg', '1995-06-23', '1128 Interior Ricky', 'Brgy. Jaypee Deleon', 'Valenzuela', '09123456789', 'fdenimar@gmail.com', '2015-08-01', 'Active', 0x00f87e01c82ae3735cc0413709ab71f0a9145592b4ea0cefaa655b234f225f438cd82cfd0792ea1724b36919d7cf2cafc5b75d9e2248ca70a3d43b5bb17c99be0ae97bfac0a94fb994333854867056aff1790c2c07eaaae06f1fc768c9f50732ec6e0e7d7bea0d8e1e4a22514921194c2864002c340ef56cb94a2df9f0bd120f8f16f5ae7c0017182353ac416d885cea460fcb2503c354d8966739e2a85163ad7c376c18a0ca17082b5786758d996980ea0ddc85c0c1a16faa476a0ba63dee7884309997048a7d6caf45236349fe47d41927215399584a3459b3ed70a151c256fcce615d952003b1ce7e376c12051d9659a36f9f823412ea039c7dd5d43b4d1c83bc1b117f8308d3d1dc7e4b7726999ff32a6d988ae56de9503e9ed1ee00719e82a144f7129a83e5c2b53f790a775d45be6b919b1908e95fc8404dad9509939ee0685434265ec20689dbacc6b2695641a3618be50ee3749995809548ff5831f4c4a17673375836e01a7f3b38d5380957ffb925529cdd8c61a6622d2419e25afc02a16f00f88001c82ae3735cc0413709ab71f0a2145592c4a6b62edfecfe224476c26f4de97b25e9d9a8f6aebbc01e11a1ee71f3c5f8adb38e7251ad1b31b7a0eb4de546db986f2ceb719e0696e843b480afba7e32dcda3c5313b33dccc022a3fc6c263d8b0f92fed7c1e5953c4594d97d5b9d7293d264d2ae8960aec757afc59b4799feedb787de0b30ef772d6e0c9106ef2613d714ed7a8d75920b4897c25788109fb04410b0e5dd390c12efb43adb18db8d108569223fa306144851787a123d62b556a6f8cbf8909c9109e85c51aeebadf954b265c0aab93f1ff623d08a62572c5d133d2715bb700bc0b2eb1a058a184f4d2893e859cc835676c088beade561cb250e1a11da415b143530d685b953423220a912295e63e4c8c0a4d21940d0717787104a53cb85da231544555b5599062cb19a2e6d668327706ef7644998b76c55abb3670e1f66d3db2b41f4bdd5ed822ac3146c0c5988f04dd3c4dc3c7f7cf4fb08c0646594a0a65f4e47183e859634e17f9e2a1e54bbfa9a0a884b81e5c0d87140c98ae3666f00f88101c82ae3735cc0413709ab71309e14559242e7c4b6ec0494c875f6fe835fcb82e6713b44dbae4208d05908ba010fbca26e4165bfd6915f4488459009e093576f84cf80dfc885f0e7150c1f76771f6a38140be2b4c47b0764ee9329dc9a207db0fa1893830304a1081a98d4f50e1eb706d47a9d0ed633acf1ea4c880c87e433c094b1a402155f221a61eba392c9acb25af4913e36e7dbc29c1e010d4f1f2915ca9c7c0133cb466d630c4dcdf353ff4232983e27cfb735c187377b16620cf1ba69762257d84959ad7f2338814efd04c8be11257b7dad2ffafbf5f9ef6c3a9b4c7f1f2ba2ea3ab1a2b81dae3589d6d9528eee70b52e9246da231f215f9e4115c0347d86a17a061bbe31cde5c42d43faa19bea170aedad23463636d5263ea3e5048cd56da1cded60d829eea7797bfdf532fc1268a908e2aaf63be5f390134bd106a774c218bfb7a885e34e883043c51817f1703c9d69fdb0a74a0d1aff6b628882b6944c919406d73b8d6e7954691825eaeaf70d57a192f4ccc27d6f91d0ddd84eb819526f00e88101c82ae3735cc0413709ab71b09f145592fc4be1e0f8c1e349887b17de89254c6402fe454f02feb247343739c751760d68e444d9997a3c1eacf4b2a80c8f82e2ba64e059fc3278333b5151ae3c77ee38bfa7034079c6baeb0784f954c13f8c358cde7d769a6fdca4eb9e0afb602a344aa320e9a2abc8959f183764de46249b19488286b97fccdebef82d99e8779d4cf603127e10a21f2f1bca343447fbaa50672786aa17c7b89c24a4810b2b71646621942e8aad6dba60d50a0a44cc75ba392d8a5a05e731eb20de1810fab49e5096579f80f6fce39ea59855f6c52c5b5b5bf80792f221647f970038c3a23c1b1b6064a41fed449877bba5d348b39110dacdd16810f120d1c2e7dba285de898375634f8889b0a6134d22f7df6285175b18e13b03004ca06a2fd2cc474b94c68da9a4909b4c3eed5e3320892c72bcef8026fc1afd4ec68bab3b72cf4e809d226b155108642bff7692a6f11e9cf144b87bc5437581b5fcbf9cd4bf02739b4d55d0f00b26791362e8968b8b5bad978269deb29ea557e26f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/3FernandezDenimar.png', 'RIh7s34g', 2, 6, 1, 1, '2015-07-29 10:01:09', '2015-07-29 10:02:33'),
(4, 'EMP-00004', 'Alvarez', 'Jose Antonio', 'A', 'employees/4AlvarezJoseAntonio.jpg', '1995-07-22', 'Marinduque St.', 'Brgy. LadLad', 'Marinduque', '09123456789', 'jose.alvarez5522@gmail.com', '2014-07-11', 'Active', 0x00f88101c82ae3735cc0413709ab71b0a4145592935d3f637fffb821d26fe5d4d0b52bc7d64e33a66e597405785c515e341ab578dd12bdc5f005a1ff34943938a19f62289bb07c0ea351aec344a12b53f0f935d0e4ad708fb4a6565b091c689c1258575af5da466aec7f80f7f2225f4ba468a2903448880c91455e8148ecfaf85e3165ececb90a1e2cee785b7d4865ce6100d8ae1f8753ddf29ba644c1272111af5f58a6ab4183ca07f6bdbdde9e0b946da5fc84290a92631450a7ea8b871654c95de28b5c9ddf969fd498a95c207bf52da434a1da5eb3b4198fd83c85da12c40884398a4738ea9f94e5df47f0afe9926933a220c2898185cd6bffe33cb85e865a65b3e3428aab298a4de9c9503bb922b44c3385c4102e2836697a9c5f73016a5fc9114d32ecf3bd3190701f43574c418231840843e1081fd5b2afd7d8e38ff7337d04103ea92374d1173bf869d05e121025ac8ee3905fc2a4c4b56fb2fe5eb5dba947fd96697e510e6b43c17fe8285715c0251b98ef9bd3da837e2f8ddaf245b6c8f1f8056f00f88101c82ae3735cc0413709ab71f0a9145592b5f83b0e4f6c6640bdd8ee46717bb97b8773d6834a205b492ed37d22c46b22218cbce4b33a75a5692fa82052ac9aa7c78764f581da9202e84ddb2e94a2ad5c3f1580ba15d315017c4c86dd2aa4b9ac6d46e21a9a52f54126af7c59b6dca95eedc673aa9ee93b9d10928717d8589614ab073d25eec8698e3d0dd4cd9b999311916932b80e31c456e016d21092597b28eb04b1bc28b4501141b701d5b6e44ed244e69e9a991af672c5440860105d9286b82f746f0e529a2bb91defd6a403e2df74a07b63fdc79c48c84694e9dbbc8447d2396d994aba9d2794d15b4967fec83aaf99db122546477048b1f0897fbb5b4bf91f99eddaf8fa23eaef5c48db2331e4fbcaaf8b1b72d48ddc6bca0962e5a8f0e35092605d6df2b2313f47045e30c91e6fabfc72d6eb3c45af42562f1ae832e51c4fe4ad8e3684f3b49706233caaa720bb216c4924148cf87e0e0054ac680e0fa6822cb2ee0616134590187b1f5dd59476afa3b18580e976ea797ed6b00a29979f4d6f00f88001c82ae3735cc0413709ab71f0ac14559205d1a387305eb6c3fa43646c9f80af749fc8975e05723cd04162eefcc9550fbb4a1977472557b2221c8108087fbd0a606d0d939412180cf3bf2460914d7691c04d2e5227c231a98fb772ee6e1a48b6f27fb2db8975be9250fb0505843a0184c0805edd700818d7838be243498dc068efe77e4cef43ea2b65956c0de43ec3174bf3571f4d0e4c6483dd12ffa668e01268f7e4e19a1aa310172f195b548f579f84c51f1e02f5c1edc8f0c41092897c6fe77f506a7fbd857d08454366f88d7f3a0f234fdff943b301d62e3115ff4523f6b52732160418f5498ed10d95e92d76dd7bb87eb543dba5675d09a6a61080e034f0f21fb991d70480cd4c2ee4a94f1cdb0441a4fb90c034ec054404dc67049de10cf1200dfe1cfef2591802e44d5c7f56fe0699b11f58a3a18927fb46b6519f2e74cb888bf428bae15418b0f8cbdbcddce8fe7dbbe671c036c6ebf0c1b7e4edd1f3263c040e54e29fc83f9569e562bcc896bf9c26cd80e2a30da56f5fb2543c75d76f00e88001c82ae3735cc0413709ab71f0ab145592522176059d042f196555de1010b4cdc4a3ccc032243c1e16e4d1e3844c4104c8653d0f50639453dde75e777d5cdf3c9f920d16f62ae73270f3472b93b6ac8a301340e6fdf14d60e7193f7de841b5a535e5ad14b36aaa270e18a8abb47814a123583fb35615d5da5719da5c03e2b994b96e4ca97f09a4f4acd27ff07d86daa98d5956266b6bc6a33a4b15e8d6dd873dc99078bd1eb485de05e238b845226cf3b1454ed7501a1970e9d055da5a4c45682673feec97932296836d3c09fb46de06778db4519687dfb96bd6b672b478d90f76a2bf1f058a4d26afc4886223f7a8d899446f6d907d317259f92aa56871dfba3d453c2b4de63e375822359b7f4600a665c7dad7cebf2e5c4de78b813749216ade7b55e09139078c3ff5d146864737fd65ed76fbc9d60f71a85bde4c006f64ef5cc6af665b021044b0d135e5d6bccc2a0e747fed6c76f786ac6e9a27841d2acd781b1fb6ed1e6143d11fff1a82d854d68a2c810bd7151110b10655a7246e684e316f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/4AlvarezJoseAntonio.png', 'alvarez22', 4, 1, 1, 4, '2015-07-29 10:06:26', '2015-09-24 11:18:54'),
(5, 'EMP-00005', 'Viovicente', 'Lorenzo Joshua', 'M', 'employees/5ViovicenteLorenzoJoshua.jpg', '1996-01-26', 'Kanor St.', 'Brgy Cembo', 'Makati', '09123456789', 'lorenzoviovicente@gmail.com', '2015-07-31', 'Active', 0x00f87e01c82ae3735cc0413709ab713096145592a859d4002b54412a997baaa777eb136f72655b581de7f2024d930b6ba8cb0bc7d9beacc0cb208c2e396c7b8a079fba8c583bf36c398cdbbd70eb8edc8efdcb6e8e9e8633845ef60721826a274da6a74e881679fe53302cc4af64c99187e7c54c486cd7cfac2b917da1dcca9ba835992e1ca3ea7d6d871a66495f5196e33819d75795b50b6af485e370c946b3a8ca7eabb6e59dc194257c4185824394157b1b84fcd99eb0af1f258fc52fac52500e3bc3fe3b70ad67033aaa386862eedb2e3710ebe1dde20ee70331cd8e66f31447e378457524165a64037fb56d346e72eded06d880cba749539d80e4b727e16ef308d99bff64df90c7f1384d9b539258aa35376b27583d30f98b825e19eb1fa40c0ce17e4b731e33456bb1cb6cc872bd891369583a580026539d517a12cce4a73663c498a6a1863851e1dda7576a0d3bc10eaceac3565231e72b98ffb8ab6ac63e181db110df67ff044508ca1f908c087b73d8dad1c9b0ccb579f8029b8a2838826f00f86601c82ae3735cc0413709ab71b0851455929b1fd5ce3f0328079e655bb22f255b4f492ba351d9c684218840f6866c6947b1463f4db4c13d1493df9a6c00ff5330b312a74890341f2909acb55bc75eec7dd9b588a8ed6155388eae06e4bb4879f1853fa0ae553186e33ae6f9ed5fe81d14dd0887fa8ff9d85c8b9337eea1e847e1dedba7f1279cb92339f35b80d710631478f21eca0946541889c73ecea90735e7491ad68a843373b80c5780b35e5be4d2c66c192b7ceb71cf3f5e0b592f4ab77d72249b45a2bad858b0213adfcb74a4b73130cb23dd7905408ef5921ad69b1e6cac42594cc7b04590ab00c3d388379df8533d0c1df768838853993fc3a95d79451a5f4162863221596840fe2d7a00c298b6a883d2991eb51010035ca8b96ec8a59b9f637d08e0b46a353eb3f3d8db62daba80c7487671c414223c7f8f6d5a4890c2d354aa1a637e2cabc7f98b5d0ca114ddfde09b08cf5b37d53910f2306487ff3324ff0a1a3be56f00f86b01c82ae3735cc0413709ab71b083145592588632221417950fa8313867e0d6a0312d43a28dd9f35a4b95c146322c23588e94791b826d44addf81ae459ab29c5588c33681cddfd7dedb07f676bc01cb3a83be747d0fd57fa8e673f50901a86b5aff17b36c356c1a07da3ff620abcbadf2b9583420991868efc62c9b760712a60c448b935d46d7fc5e3bbf79e10593a69d81737bca7047dceea425fb31505c9eb6253ebe627fe2d1b8974276a71342533ea5ae65645572eb12d3a301067c5d270d21c3e44d057927b0ef27260ddf5ae3ec1fd351debd20aac2762bcfb23bf53af320d806828f078068c3883f4958bbb91535e547917d92e887990f6f583c6de57a7ce920206eae69f622e48fcb71dc4fdc2aa5f62632b5037a95e79f0024507d340fc55d65a724371dbcb128b36d2aee55aebccc1c30ec91ffc2f792f9b3f649bcb0b0c69b6a58ddc1b0c8b1bb1ee3f833875ca16494267de6660212944b998d73c899ffc1d874719cdae991466f00e87301c82ae3735cc0413709ab713093145592a169879d509fba5c8ef22fd5d2ceaf926a8f73af6bd6c01c4a52bfb7870a6c63535862628e84c3c2fa07bf560ae2fc290264285e35caa558a1dd04255fc8d1b9b32b02e9d79448cc6a220b78effebab26eee7c529f47dd5ead294aa65f3ae1101a9f72acf29bef160a0591166b65846db52db408a4ecab69a31126e4aa990eac27696e7cb13613df650ed4b01b0d9bdca0fc4bfaabe61d907e73316f53a1bb17e611320bef6e79d5e024c74eb437e1b7647693b5bfd7a4d0cf521872fc6b459d5f1ce89c3aabfe67cc06fba0d13223999be2e1e87be329e9743f038beff4f7ebfca6401850bd6098a1b5a24446332a93609d6ca655d5407916b2492a97253da15e05362834d99483a51daef4582bd58e7b375a3418f4302d70c66d381b915e44415f75438e3596cc0d617886f27197cc2cf149fff6735e0561205981d5d4a25302af8192f9767ff05de24a7aec8359961e9bd9093b9365f0ea002c6122209d6780131c6f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/5ViovicenteLorenzoJoshua.png', 'lorenzopogi', 5, 1, 1, 5, '2015-07-29 10:08:14', '2015-07-29 10:08:14'),
(6, 'EMP-00006', 'Sierra', 'Harrold', 'S', 'employees/6SierraHarrold.jpg', '1984-07-19', 'Antipolo St.', 'Brgy. Antipolo', 'Antipolo', '09123456789', 'harroldsierra@yahoo.com', '2015-08-21', 'Active', NULL, 'qrcodes/6SierraHarrold.png', 'harroldgay', 11, 1, 1, 0, '2015-07-29 10:13:34', '2015-07-29 10:13:34'),
(7, 'EMP-00007', 'Avecilla', 'Kenneth', 'S', 'employees/7AvecillaKenneth.jpg', '1993-07-21', 'Mongoloid St.', 'Brgy Abnoy', 'Quezon', '09784561235', 'kennethavecilla@outlook.com', '2015-08-02', 'Active', NULL, 'qrcodes/7AvecillaKenneth.png', '3rkl4nrd', 11, 1, 1, 0, '2015-07-29 10:15:17', '2015-07-29 10:15:17'),
(8, 'EMP-00008', 'Cantoria', 'Pablo', 'V', 'employees/8CantoriaPablo.jpg', '1994-11-29', 'Tata St.', 'Brgy. Tagay', 'Pasig', '09356547894', 'pablocantoria@senior.com', '2015-08-02', 'Active', NULL, 'qrcodes/8CantoriaPablo.png', 'CNdt1aaS', 9, 2, 1, 0, '2015-07-29 10:17:44', '2015-07-29 10:17:44'),
(9, 'EMP-00009', 'Grava', 'Eugene', 'S', 'employees/9GravaEugene.jpg', '1994-12-16', '123 Dingba St.', 'Brgy. Singma', 'Pasig', '09324567894', 'huge_in@lgbt.com', '2015-08-03', 'Active', NULL, 'qrcodes/9GravaEugene.png', 'rDoCU2HP', 9, 2, 1, 0, '2015-07-29 10:19:03', '2015-07-29 10:19:03'),
(10, 'EMP-00010', 'Ramos', 'Shaira May', 'A', 'employees/10RamosShairaMae.jpg', '1995-07-20', '143 Rock St.', 'Brgy. Ramos', 'Makati', '09154747561', 'saiaveros@yahoo.com', '2013-08-03', 'Active', 0x00f84f01c82ae3735cc0413709ab71f08014559203f01fa4fb425fe8459fc1945066c44c8acaa53a0e4629ebbc3d755d51c74c5bded05e0e6ac5b339053fc9f1a279a0a96c5b3c547d26ea14554efdf4328e2c58e220b4d8aa02059863d13d5aa47af092f4b21e1ce9dbb2aec807e69d5738547813313cacf972c2fb532d9471c80c794fd131edf53684583bd12963a9e342164bcd56834093b3fd2852780b93f2f91c23763016a9d97cf6e17a1ab3ae376f13cd8904c64bc7702d0d4866b71ea13fcf9a77a479bb5013e1a69d27bf8a426637938cbc5ce019270c70f305912e99cb961dd974a46ee0e7f9534bd3c1f7f20cae474b997b6efd9ce02faa72c718897dad5827999ff26908a4c1df3bf85e8c196b0837d261320d3b02b2bcaa3fba8b4440d612182a78a7ea1e153c1e840fcc33f05e951d6f01bbf4de5fddf4ad1fe3c284ac417ec28b35a90e5d9b066ae0616dfe6f00f88001c82ae3735cc0413709ab71b09e14559268e2fffa65ba3a35b7f0038f5721796bc2ad920a9f81b33368c5d8c000fbc369a82e498e2bf84e80e2869d17e8478d6111a4a422623f927b7552663dff24b7a35637b389622ebfcbb7cee04be76489d9837219fbbae401f645435a4261913992c5d7394ff658ff07c56a41151240eef0f0c2c84225ab5d815fcba645693f1eecdf73f824c1c1429b7354187719cc125914599bfa3a25d5d56a2b10443f47ff83ec3bc9389de2ce03f64e2f7560013549826dff1938ef0de66a8aff7f035473236b68f83f454506be827880342de158e82ae0625e9e3a5840a638abdcb00a51b8ea90985fc393681c486143964e853e4e9637f4311387fee3254d6e45e1e5750774fb1250b86aa1a894790a74cf1db4c53e2d8f60b9af0f0cbf410cb94e14db9596259842e624b13c6af31e67ba70924179342e37dadb59ec04b1ea93c36aeff85abf9825711f201e7c2c1f4486282be76d81b8c4f82cf38dc10bc51842a4d2959f7362f0d601ae2cf8a5e612c9e933786f00f87001c82ae3735cc0413709ab71f0811455923858c51843e54649ca1649f5e68e77a2f3741945eb5d74d8ea54abc376e4e887e6cfd3bf2afc5c81756d04c4bad1e9019ac56998347df32d1f20a1df98f0546181811aac3214fd6d0b08b00f1cc4c3c9292d50da8de08c51a8f5291a44d04a3532d3d9c8fb475edee82225a99e61b83075d8bada3ad66a96a88e66c0247602e2324e3a267c15f9028f74062765a18a8d96a292467b8aa24b300415dadc45d986da4925baed9f4994fbd9975d5ba40d4f0a873dfb78e7b069d7cd9a4732c258ae0326d9dcd261f9ff50149f4cd62fbefcf0bd5624048261c78045673b3056a6e61ad123284b42fd67200a52c445077b900a8f7208f350cf8a1b6a4fb291200812d7ff608fbf3da7ae898789b0e1090e3ea7e06bcdfd9642bccd0d5176d55d209e60c7bc0bea5815d5369b3e1f4c9d7a61f62b7b9d78839ce3958deb3464c7ca6498c70405ff231f7a10ec71626bde78c119d03c4bb5b41f737dbf46075cb23b0a6f00e87e01c82ae3735cc0413709ab7130f01455925c2dd0f759efd051d6db3784d73dc984f3d3bc5bafc510dca766c2fee1ef34266588b1211e2558091a37b3dc4cccf6526a20a8c53cc8b9c796cf1e23cbb15b077f060328d2a32825ceaa8624c8e8c17a5248856f2b999313ac8f22a879f562a0f3aa6af0bb013b5301164ce7502215de9929815de204a235c4f292d979ad0d468439d3cf55aff97efc9c783697776fba09d71282ab8f9cb76ee7e7a6ae794832e9e570d7b5cdc238c7bcc1c0d84cd67e960524ffd3713c7f96f0d5688145a1f35559e7ec17b17b1d98fcecd5698f9db492bc01341cd3490d8d667169bbf5e5886e8a8df59e8c874ec75db8881009de988feb3c6ae61718e0b5d68e793dfb6dafbbb56bf4f7a8da113e7e58c8b316b9f2ba3829d8f28d801da51595867a218460be0c3ed75381c26c9cc5b942fd6d5979a47432c907eb6ff8ef7172e2af26c4829713aed8bb5a582701988926fd39bb3a6b5bb44794e068f346be3aa0b8db15c48cb4d75e02b20a866d7cd95ec8066f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/10RamosShairaMae.png', 'ryancatapang', 10, 3, 1, 0, '2015-07-29 10:21:59', '2015-07-29 10:21:59'),
(11, 'EMP-00011', 'Alzate', 'Joshua', 'F', 'employees/11AlzateJoshua.jpg', '1940-06-25', '654 oyeah st.', 'Brgy. Nayon', 'Pasay', '09854561235', 'joshuaalzate@yahoo.com', '2015-08-02', 'Active', NULL, 'qrcodes/11AlzateJoshua.png', 'zJg2pRYx', 11, 4, 1, 0, '2015-07-29 10:27:13', '2015-07-29 10:27:13'),
(12, 'EMP-00012', 'Mataac', 'Christell Ann', 'C', 'employees/12MataacChristellAnn.jpg', '1995-08-22', '85 ehem St.', 'Brgy. Friendzone', 'Taguig', '09478543264', 'christellmataac@gmail.com', '2015-08-10', 'Active', NULL, 'qrcodes/12MataacChristellAnn.png', 'bakodserye', 8, 3, 1, 0, '2015-07-29 10:29:26', '2015-07-29 10:29:26'),
(13, 'EMP-00013', 'Escano', 'Pristine', 'A', 'employees/13EscanoPristine.jpg', '1994-05-17', '15 Binibini St.', 'Brgy. Rampa', 'Quezon', '09486538549', 'projectrunway@yahoo.com', '2015-07-30', 'Active', 0x00f80e01c82ae3735cc0413709ab7170d0145592b7e4a3ca14a47c494d8b30db9163a6c1d44d86ae2b8c02ac1958443f4698b24ecc5f1d8d8bd8fde29bf23909df4d707d27865a93ea1bf52a04aecf287b7a632b16dc0a0023e14f05e28aec2d6500ba943ed95ead890201530c8c4623a4e96adf5f02f1091954a002dec7f0db69f0c6728b74c3ebeb7811ee5e2e206ddf79dffe26d089b0952c0bb1f91e61365a65642d610a0c37abb96f108c89da72a3e75c35cd7809b296801187ca6e19f9435a490b90e39c3af06df22fdc0300ba7db228ff08eeb98ca18ffaafe6af2b6d12977d81a1d3d3ca3c3d591851d5cb66a12dd22ba6cc984a00a8db6984ed0619d52d47eb3e9a42fc9451efd7d7220faa949d6f00f80201c82ae3735cc0413709ab7170d114559253786d8217d27862cd63ecc7f0478fc1ba852c0fd1cd24776106b414c3132c9379f859c89f160815dee412ae76472f399209bbbf46ebee03b4b7641d9bd6bdac9a5b5f04585dbfd2a426e9551722f9d81ef53fa25c39bb729c4b8ca9ab1882dbe80e24b8452b0a240c7908f5b4daa5c2ed47550bf6ae1354c009e55d92759a41279cb5d5872b5a7beaa243c2a6c538dbcc191b40363390af9f2bffb46dbf0670c55fc232c45b0aa64ece84d3079b27213dd572b81aacb5e2f8ea5e8df614ae4322d2517507af528ace24ee0c52dcc948a5d2a098863c5aa74ddfcac08d39a662094fac5ba5fc76cf7f6f5ae10b8a3dce891e6f00f80b01c82ae3735cc0413709ab7130db145592245a0864b6cded7000fa48915224ccca24da1cfa47bfe4ee81e8546835dfb3fa7c78a2f33e2ccb81d3d05f9f5f93dc2116e84eb6a91ad6209acf56cb19f2141692973c09e80b4ccf598a8c0fce80cbeb53a86c7e003948d83d80e482be68ab639200997b71a19a1018f7643741a325024e31bf3ba89e7bea1d0d1303308c956e0bb038b632ff7de5c288e215f0aa42e36faf0bc201b698d3ddc2a2f36f6a45140deca5b8f791dbb469a4d7fc1fd8759fc15820002366252802f30af147584b67104ad2054dceb2c77108e0ffaf35b1643c3c3fefa17ddde792151ebc7c30fb479a0ddeccda7418b8c41d351874ecb558421c352e1de570558f6df66f00e83101c82ae3735cc0413709ab7170ed14559289786bc75bc5c88df7d3dd8cef560fb67265eacdfd89db7da0685813eb8bfff70b4f1f43b1a28817f7b3a66e2e9144b86e8cd61a83ed0c52f2d8078911aa75c46865ecf8d586affdee36555f5bf77ec296614711287190673c3fd2560de5e66996eb3eb0e26c646f01c921fab0079b2a4ddaf771d0c347862d74db883584bd7264dc6617a5b4f48bd2f0d043e581e50d1482ecdc62b68863198392207c019dabe8112d55fdd523ab4ebf944342706143b46ef26c3b92295b683e8059da7c3baf7af0428d63f1807a905a9f88ed956fd3972944777e91311a59f5d054035c55d83c5dbdc322f929e3567c446ff5e3d02184170e200dda76ee2893d91a1c2bfcd88d0d9443497a2003c41cb231231559f4978b41b1f264c525b0d94d4f6ff48222396f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/13EscanoPristine.png', 'rr34uW2g', 11, 4, 1, 0, '2015-07-29 10:32:08', '2015-07-29 10:32:08'),
(14, 'EMP-00014', 'Pascual', 'Francis Eric', 'B', 'employees/14PascualFrancisEric.jpg', '1995-01-04', '25 Pogi St.', 'Brgy. Chickboy', 'Cainta', '09854851562', 'francispascual@gmail.com', '2015-08-04', 'Active', NULL, 'qrcodes/14PascualFrancisEric.png', 'I1LL1ATx', 11, 5, 1, 0, '2015-07-29 10:34:46', '2015-07-29 10:34:46'),
(15, 'EMP-00015', 'Aquino', 'Morriel', '', 'employees/15AquinoMorriel.jpg', '1996-03-01', '1174 Sa Puso ni Melody', 'San Laan', 'Manila', '09162451291', 'melody.legaspi@gmail.com', '2015-09-10', 'Active', NULL, 'qrcodes/15AquinoMorriel.png', '59wjY2b9', 5, 5, 1, 0, '2015-08-23 20:14:34', '2015-08-23 20:14:34'),
(16, 'EMP-00016', 'Bocauto', 'Christine Isabel', 'V', 'employees/16BocautoChristineIsabel.jpg', '1996-12-25', 'P Bonifacio', 'Sumilang', 'Pasig', '09151432163', 'christinebocauto@gmail.com', '2015-09-15', 'Active', NULL, 'qrcodes/16BocautoChristineIsabel.png', 'u4zoSWEY', 5, 2, 1, 0, '2015-08-23 20:41:36', '2015-08-23 20:41:36'),
(17, 'EMP-00017', 'Mante', 'Elaine', 'P', 'employees/17ManteElaine.jpg', '1996-12-10', '143 Affection St.', 'Brgy. Forever', 'Tagaytay City', '09069566510', 'elai_sca@yahoo.com', '2015-08-26', 'Active', 0x00f87e01c82ae3735cc0413709ab71f0a71455926628c6017abdb0649a7914be833a75854a0c9bca6080517725d4615547c7950440a49544136b709b774cea9ce166da6ef74540d196f3ce103d61a3d4d64621983a8bf6a4143717dca50fe829086a77d9488ac8ea1bd28716c7ae5333a3858ca28c3af354a960bdb4ac39e3c5fcd255bf32bfb7451d0e06c30e793ddc888a8f2f9d05c40f6edd1d922514b5edaa2ca1652438be390d93cfc03eb18001880462bfc8c914be366f005716e161c7d23473b7ffba7812a3b6d977d8a3dedffaf2a8bf2314e344c07290b7088668d8c5e046965871958727e46b98e86c8ec467c41d6fd2bf5694fdcfece8304cf2cbe99f8fab801c8ab04f488795ed98362f3e9ad745f298e2821e9fc7033588ab663f2812fd4926fe456a939c42094d929144074ba20ab1da48d6f7fee7512020f6e27b3dd39499de949d1c1157c3580ae7d09415e018d53c04179f1913ffbee7bf4c592e716ee0f75824fdbe89085737645bd53613dc8b7e719f34fd79a6b20ec428eb6f00f88001c82ae3735cc0413709ab7170a71455928063c727e5ccd768bd246e3182868df5a9fe06d33e6939244331e9a01a046c02101c6520c974462ca8e64f3bc4c7445454b7f66728b936c46f97415d69f11670c7a1f3c18788198825d500266f0ab087fb6739261d37c2459c3ef489e5a56145592833ccb46e9d0f72068112916db3dd24f1612e6cbaca3363239b4ca382e1ff7147310aa53c1d5b0b5168b68c6ec312b486e24471b4dfeebba1ce6256b0c3806861855df4a25c947b80dd34629d6b9029880ecd5ffd24f377d402e5d23d220f70b772a064f7ee3bdf7096a8da08578e38f8462313bc116f151038176da9faead1f5add3805c0764c4f49e121dc2d67809cbd99fa06be7d63c7e6c9e9dcee5af3a35f8a9a2671b67a808937cb109e0e73eaa767489224d8487197abb4094746cdf71fe929f1c51129b0e14a80689c616f1a37972909337b97e1e61f2510dfc7d86d89fd8e9223552d228557b3ad2ebeb48553ec8e5aa4eececf8240e1839036d3c2231b7d0f6b1084cdf305fd4be66146f00f88001c82ae3735cc0413709ab71f09614559210a7344f2044d9b0ee0ad8bc3421995cacdd63aeacc6ad10c64fcd42f43fe2d1296bfdead14f75cb0a23402199e56de1e227237af44557b5bc4da0af4de1af5ba5a35071f252b6df79e3cb248a2c5453107a12002c58acbe6b8a3e015707f2f828ceec687f22d69278f1058dbcb8c4490003a6866f3eccccc65d749aadd0dce02e15ac17b6a03a9e30f7ba2cfea01b2a4f243ec249ef864c1d8f1365441f6b0a2994353cd222b1177782af4894a69f5044e5f4ca054afe08ad7cbeb5040872b9858ec28fa4d7e2a47cfb1f44bff24073da0ec33e6dfe2f21af5feba7612a9555dfd28e691d042a4b7cb205f36f1dab43061c5f6ba758dbf8cd437b4cf8c0ccbadf6605fc602a04a7eed319f43ae0de74051e6a5eb3ee225a47838a1942973db81db967d235824b05e9c15e277d2b269ed394ba0cb40f24032d8e6f4dd28714fa1f2805fef53308c177827481d188a09f81ca5fe5eb50110c1858f5e9cd779a9ae5514a1846bfd45f6f70f8d24d9cc9956f00e87e01c82ae3735cc0413709ab7170a014559243955e3e8e5820e3f97e86f08b2bcdcb7d125c231a0a7d6b4ac8350d17900380287e1d3f3be710d0cbc453f81523272fd112a93aa93006080d01197fbd0971934c966531369726484db8d61f27d63694d9b56d2b8beb25445f5e9a003d5ff83e6ff6d8b0bf6ab208cb9086ad3b24da12c90349a78de8dfc024fb556224c5560fd05ca48fea7a71eaaf6f70f5de9516dc1293c61a338abe285e4465a8abaf8420306aa96c76e050873c3134c12858edd5036c3b53cd15e31e9ae72bbee1ceaa4612df7be774a5f6ffa4cc6588f1833d128cde35664d8de76f8aa2cc6b1bed298ca961c97da192169207b07bef1d0471939f1df60a77946e9d709b312db59c619ec74516ad74c1a5bb720b14ca42cc9be9e5f593c097b2b70b5872e3b26d72905e6529946109281127cc0f11f5ceb5290e946f5a617cb0462c405cb2537e07168c772d5b39c2e9cd14b12af0f05180dd5c69e8aaa0acef0f41975288fbd109609559e9f062216810f6ce37650471976f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/17ManteElaine.png', 'Gj78JdJF', 11, 5, 1, 0, '2015-08-26 04:52:46', '2015-08-26 04:52:46'),
(18, 'EMP-00018', 'Villareal', 'Daniel Franco', 'B', 'employees/18VillarealDanielFranco.jpg', '1996-09-20', '1234 Pogi St,', 'Brgy. Pugay', 'Antipolo, Rizal', '09123456874', 'daniel_franco_20@yahoo.com', '2015-08-29', 'Active', 0x00f84301c82ae3735cc0413709ab71b0f2145592c7e859a8cf92e67d1fe2f59261a5e7def863cbe5d578a6f802606e7ccb0cdc839ad1aa93101a338dc34d47be684cbb8caa04dc5f07aa1549ebfb0e2a8b48b98ef20aba2505751d3990b319f8c1439883c5692a852b2be870e6f8bfd39822b4feb5cf9fa8eddb720d06cb37b16e99a9b6273fce662317ca68c23b2117f7fdead1a6413e84609e0588147f7225c8f42ed9eca128e1f393cae5ab22550f5f6694324f8f0b5f43b794f9d8facaa34a70e68e50daa8c2ea9c6d6cc3f68d1512536eacc3ee5c2aabb229588aa34897c490a8955e43812e83d5bc028414dbc85caa1fa9c9b54d4df8d5b27636c3cb0919584b97302bb8a6c8f8ea016ff7d85909dd87a9cc3f92327a14d2ba3bc297adb7d2104dd06315504c3bce1e92b7cfa2e6ce34ce918579956b7205fd8d9a18f3eae2e5d943d22d6f00f84901c82ae3735cc0413709ab7170f6145592e227861d4e05d69a9f4d4f8c18843c56956c30b359a879c6dc06574c989bf71b221b09c2b5e1230e6b2ac6180dc0fcfc1579144ab218978294b47dc2d243e935504d105f2801b19c7359fdd6e8e304885eb9b57e480f7909b3c12ec2cfb8d17058ab0cda5817ea052762a3885a46b29f40b137477b2a20cffc073b8d60dec57dfb483c679c617c9c2fce2b9e9c3fdc82733210c78c7856dc2da6d4c920cc32ac9e9e982c649d236c4469bc13e54e017bd128b8368c150de28a86d77f4346304a4400fdb0d5a374fc898e8bd21c3e68d9990286ede97112b828d30572bf0c0e93fc2d0808110bc264b57b4cc6c262087396f4c4d74009ff108f1ad89a0a36734c19a587796897c4543c28032a1105014eeb41173ef81597931cf0114057e76ce7c18e35eb319bb569cbcff18e40a3e15d954bb320d2eca97fbc6f00f84101c82ae3735cc0413709ab71f0e614559286363632a89cd2d5394b7ac5fc75b61f679eb61b1df23b9551f8824d992a20b158c9c16dbf8ac415c8f31a9a53d2f63c3eb264cf83b478beb285c6f3782039db17e4b56cfe14cda9c1712ff7e6743a9d0e031f664be88d670b7bef51b44345e0ea6e07dd941d765e0cbdd546234cecb9d203a8c686734139cab916089e599c2a370eb3a9d4ca3498b3b5efda151c61f5df98af5ceb15b7c9a3e367d8e83a3e71281da0552420e17af983d7c7cb2979679bb56e0ab714460149ef5c38877d310b01361e1e4f0d1ec69fbaaf2656cb4b5296cbd37368bc91f46f8e25926cf3ca5ddcfe9c2fdad0d9a91557cc9864b253ec76ea6b4865b6ec6206862ef8abb7b4dacdb0df302c9161c760a348719c8434a432e876b64ffec0f9bd58f5f8f2c231179b3bf6cb76ed4e75ed7d8c4258a43dd5086f00e81c01c82ae3735cc0413709ab71f03d14559255be964860853b184cb212024b78e935b5463e493dcef84b8b4d36c7556bd0c1478028b7fdc2d7423d1b723c1870714111de4ad5f806f0e8daf80312567fc37cc8af7e95d5355b98e003d1dd262cdcb2042e255ba541190416d66c566d5f65b4ea1b92c094195689117d07a647be1a0d837d47d315c9f2e2958ba349f315a98171f373670b5e300b4e47cbffa42f234430879a6d54294ae5005893873107d12c2c7d318a1325b57acaf873b57f75ae8034cb7a7e0cce7236ce31bc6519696bc2fe74b183665bdf2e5c8a7c82a8a244a5ac073b7428642d071220010c40d372631da61114adc43e5e7fb4b084b5a02a0a67b90e20e4eb01515862d20f9ee06b648ffb79c4f427828bac4ca02a6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'qrcodes/18VillarealDanielFranco.png', 'TwRGTf6z', 3, 1, 1, 0, '2015-08-28 17:34:49', '2015-08-28 17:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `empschedules`
--

CREATE TABLE IF NOT EXISTS `empschedules` (
  `id` int(10) unsigned NOT NULL,
  `employee_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `empschedules`
--

INSERT INTO `empschedules` (`id`, `employee_id`, `schedule_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 10, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 5, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `exception_groups`
--

CREATE TABLE IF NOT EXISTS `exception_groups` (
  `id` int(10) unsigned NOT NULL,
  `exceptiongroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exception_groups`
--

INSERT INTO `exception_groups` (`id`, `exceptiongroup_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'Default Exception triggers', '2015-07-29 11:12:45', '2015-07-29 11:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `exception_policies`
--

CREATE TABLE IF NOT EXISTS `exception_policies` (
  `id` int(10) unsigned NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exception_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exception_policies`
--

INSERT INTO `exception_policies` (`id`, `is_active`, `exception_name`, `created_at`, `updated_at`) VALUES
(1, '1', 'Missing Out Punch', '2015-02-26 20:38:10', '2015-03-02 02:25:28'),
(2, '1', 'Unscheduled Absence', '2015-02-26 20:38:43', '2015-02-26 20:38:43'),
(3, '1', 'No Branch or Department', '2015-02-26 20:40:24', '2015-02-26 20:40:24'),
(4, '1', 'No Break', '2015-02-26 20:40:58', '2015-02-26 20:40:58'),
(5, '1', 'Too Few Breaks', '2015-02-26 20:41:45', '2015-02-26 20:41:45'),
(6, '1', 'Too Many Breaks', '2015-02-26 20:42:39', '2015-02-26 20:42:39'),
(7, '1', 'Short Break', '2015-02-26 20:43:18', '2015-02-26 20:44:46'),
(8, '1', 'Long Break', '2015-02-26 20:44:20', '2015-02-26 20:44:20'),
(9, '1', 'Missing In Punch', '2015-02-26 20:49:25', '2015-02-26 20:49:25'),
(10, '1', 'Missing Break In/Out Punch', '2015-02-26 20:53:29', '2015-02-26 20:53:29'),
(11, '1', 'Not Scheduled', '2015-02-26 20:53:53', '2015-02-26 20:53:53'),
(12, '1', 'In Early', '2015-02-26 20:56:17', '2015-02-26 20:56:17'),
(13, '1', 'In Late', '2015-02-26 20:58:56', '2015-02-26 20:58:56'),
(14, '1', 'Out Early', '2015-02-26 21:10:22', '2015-02-26 21:10:22'),
(15, '1', 'Out Late', '2015-02-26 21:12:09', '2015-02-26 21:12:09'),
(16, '1', 'TimeSheet Not Verified', '2015-02-26 21:19:32', '2015-02-26 21:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `hierarchies`
--

CREATE TABLE IF NOT EXISTS `hierarchies` (
  `id` int(10) unsigned NOT NULL,
  `hierarchy_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hierarchies`
--

INSERT INTO `hierarchies` (`id`, `hierarchy_name`, `supervisor_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Team 1 Quality Assurance', 5, 'This is a team of Quality Assurance', '2015-09-02 06:46:00', '2015-09-02 06:46:00'),
(2, 'Team 2 Project Management', 3, 'They handle business projects', '2015-09-24 09:20:40', '2015-09-24 09:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `hierarchy_subordinates`
--

CREATE TABLE IF NOT EXISTS `hierarchy_subordinates` (
  `id` int(11) NOT NULL,
  `hierarchy_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hierarchy_subordinates`
--

INSERT INTO `hierarchy_subordinates` (`id`, `hierarchy_id`, `employee_id`) VALUES
(9, 1, 15),
(10, 1, 16),
(11, 1, 13),
(12, 1, 17),
(13, 1, 12),
(14, 1, 10),
(15, 2, 11),
(16, 2, 8),
(17, 2, 9),
(18, 2, 6),
(19, 2, 18);

-- --------------------------------------------------------

--
-- Table structure for table `holiday_policies`
--

CREATE TABLE IF NOT EXISTS `holiday_policies` (
  `id` int(10) unsigned NOT NULL,
  `holiday_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `default_schedule_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recurring` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day_of_month` int(11) NOT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holiday_policies`
--

INSERT INTO `holiday_policies` (`id`, `holiday_name`, `description`, `default_schedule_status`, `recurring`, `day_of_month`, `month`, `created_at`, `updated_at`) VALUES
(1, 'All Souls Day', 'Awooo!', 'Non-working', 'true', 1, 'November', '2015-07-29 09:32:15', '2015-07-29 09:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `itechs`
--

CREATE TABLE IF NOT EXISTS `itechs` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itechs`
--

INSERT INTO `itechs` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'IT_00001', 'jose123', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jobtitles`
--

CREATE TABLE IF NOT EXISTS `jobtitles` (
  `id` int(10) unsigned NOT NULL,
  `jobtitle_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobtitles`
--

INSERT INTO `jobtitles` (`id`, `jobtitle_name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'CEO', 'This is the ice cold Michelle Pfeiffer that white gold.', '2015-06-29 07:11:06', '2015-06-29 07:11:06'),
(3, 'Sales Manager', 'manager for sales department', '2015-07-29 08:56:33', '2015-07-29 08:56:33'),
(4, 'Assistant Sales Manager', 'Assistant manager for sales', '2015-07-29 08:57:54', '2015-07-29 08:57:54'),
(5, 'QA Supervisor', 'Supervisor for Quality Assurance', '2015-07-29 08:58:34', '2015-07-29 08:58:34'),
(6, 'Executive Head', 'head executive', '2015-07-29 09:57:17', '2015-07-29 09:57:17'),
(7, 'Programmer', 'programmer', '2015-07-29 10:10:34', '2015-07-29 10:10:34'),
(8, 'Database Administrator', 'Database Administrator', '2015-07-29 10:11:03', '2015-07-29 10:11:03'),
(9, 'QA Tester', 'QA Tester', '2015-07-29 10:11:25', '2015-07-29 10:11:25'),
(10, 'Technical Writer', 'Technical Writer', '2015-07-29 10:11:42', '2015-07-29 10:11:42'),
(11, 'Researcher', 'Researcher', '2015-07-29 10:11:55', '2015-07-29 10:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `leavecredits`
--

CREATE TABLE IF NOT EXISTS `leavecredits` (
  `id` int(10) unsigned NOT NULL,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sick_leave` float(8,2) NOT NULL,
  `vacation_leave` float(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leavecredits`
--

INSERT INTO `leavecredits` (`id`, `employee_id`, `sick_leave`, `vacation_leave`, `created_at`, `updated_at`) VALUES
(5, '1', 1.00, 7.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '4', 1.00, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '10', 7.00, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `leavesummaries`
--

CREATE TABLE IF NOT EXISTS `leavesummaries` (
  `id` int(10) unsigned NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `request_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leavesummaries`
--

INSERT INTO `leavesummaries` (`id`, `employee_id`, `start_date`, `end_date`, `request_type`, `created_at`, `updated_at`) VALUES
(4, 10, '2015-09-02', '2015-09-03', 'Emergency Leave', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 10, '2015-09-02', '2015-09-03', 'Sick Leave', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 10, '2015-09-01', '2015-09-03', 'Sick Leave', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_grants`
--

CREATE TABLE IF NOT EXISTS `leave_grants` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_leave` int(11) NOT NULL,
  `grant_automatically` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `withrawable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(10) unsigned NOT NULL,
  `number` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `number`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Senior Top Management', 'company highest level', '2015-07-29 08:50:08', '2015-07-29 08:50:08'),
(2, 2, 'Top Management', 'Company 2nd highest level', '2015-07-29 08:50:45', '2015-07-29 08:50:45'),
(3, 3, 'Managerial', 'Company 3rd highest level', '2015-07-29 08:51:20', '2015-07-29 08:51:20'),
(4, 4, 'Assistant Managerial', 'Company 4th level', '2015-07-29 08:51:50', '2015-07-29 08:51:50'),
(5, 5, 'Supervisory', 'Company 5th level', '2015-07-29 08:52:30', '2015-07-29 08:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_02_12_071336_create_users_table', 1),
('2015_02_25_075258_create_branches_table', 1),
('2015_02_25_093616_create_request_types_table', 1),
('2015_02_25_112415_create_attendances_table', 1),
('2015_02_25_120912_create_hierarchies_table', 1),
('2015_02_25_123324_create_holiday_policies_table', 1),
('2015_02_25_130802_create_overtime_policies_table', 1),
('2015_02_25_153322_create_exception_policies_table', 1),
('2015_02_25_162051_create_permissions_table', 1),
('2015_02_27_073932_create_create_requests_table', 1),
('2015_02_27_105217_create_contracts_table', 1),
('2015_02_27_122840_create_companies_table', 3),
('2015_02_27_151859_create_schedules_table', 6),
('2015_03_03_013658_create_stations_table', 8),
('2015_03_03_025853_create_policy_groups_table', 10),
('2015_03_03_062151_create_exception_groups_table', 12),
('2015_03_03_065130_create_assign_exceptions_table', 13),
('2015_03_03_082240_create_leave_grants_table', 14),
('2015_03_05_135453_create_pay_periods_table', 15),
('2015_06_16_022757_create_empschedules_table', 16),
('2015_02_25_145540_create_premium_policies_table', 17),
('2015_02_26_134008_create_accrual_policies_table', 18),
('2015_03_03_021058_create_departments_table', 19),
('2015_06_16_112748_create_credit_policies_table', 20),
('2015_02_27_124201_create_jobtitles_table', 21),
('2015_06_30_044133_create_itechs_table', 25),
('2015_02_25_134604_create_break_policies_table', 26),
('2015_06_30_062249_create_breaks_table', 26),
('2015_07_07_042404_create_levels_table', 27),
('2015_03_03_034419_create_employs_table', 28),
('2015_07_23_145234_create_assign_overtimes_table', 29),
('2015_07_23_173313_create_overtime_subordinates_table', 30),
('2015_07_24_053357_create_custom_overtimes_table', 31),
('2015_07_24_062226_create_custom_assign_overtimes_table', 32),
('2015_08_18_164445_create_downloads_table', 33),
('2015_09_02_181938_create_employeefiles_table', 35),
('2015_09_02_124121_create_leavecredits_table', 36),
('2015_09_16_113310_create_empdownloads_table', 37),
('2015_09_24_072811_create_leavesummaries_table', 38);

-- --------------------------------------------------------

--
-- Table structure for table `overtime_policies`
--

CREATE TABLE IF NOT EXISTS `overtime_policies` (
  `id` int(10) unsigned NOT NULL,
  `overtime_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active_after` int(11) NOT NULL,
  `Allowed_number_of_hours` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `overtime_policies`
--

INSERT INTO `overtime_policies` (`id`, `overtime_name`, `description`, `active_after`, `Allowed_number_of_hours`, `created_at`, `updated_at`) VALUES
(1, 'Daily Overtime', 'Default Daily overtime allowed', 0, 4, '2015-07-29 08:27:53', '2015-07-29 08:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `overtime_subordinates`
--

CREATE TABLE IF NOT EXISTS `overtime_subordinates` (
  `id` int(10) unsigned NOT NULL,
  `overtime_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `active_after` int(50) DEFAULT NULL,
  `Allowed_number_of_hours` int(50) DEFAULT NULL,
  `range_from` date NOT NULL,
  `range_to` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_periods`
--

CREATE TABLE IF NOT EXISTS `pay_periods` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payperiod_day` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `initial_payperiod` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pay_periods`
--

INSERT INTO `pay_periods` (`id`, `name`, `description`, `type`, `payperiod_day`, `initial_payperiod`, `created_at`, `updated_at`) VALUES
(1, 'bi-weekly', 'weekly pay period', 'Bi-Weekly', 'Sunday', '2015-03-08', '2015-03-05 08:28:10', '2015-03-05 08:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `permissiongroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permissiongroup_name`, `description`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Permission', 'This is a description for Permission', 'Supervisor(Subordinates only)', '2015-02-27 05:55:47', '2015-02-27 05:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `policygroup_employees`
--

CREATE TABLE IF NOT EXISTS `policygroup_employees` (
  `id` int(11) NOT NULL,
  `policygroup_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy_groups`
--

CREATE TABLE IF NOT EXISTS `policy_groups` (
  `id` int(10) unsigned NOT NULL,
  `policygroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `exception_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policy_groups`
--

INSERT INTO `policy_groups` (`id`, `policygroup_name`, `description`, `exception_id`, `created_at`, `updated_at`) VALUES
(1, 'Hourly Employees', 'Policy Group for hourly employees', 1, '2015-03-06 11:34:31', '2015-03-06 11:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_accrual`
--

CREATE TABLE IF NOT EXISTS `policy_group_accrual` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `accrual_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy_group_accrual`
--

INSERT INTO `policy_group_accrual` (`id`, `policy_group_id`, `accrual_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_break`
--

CREATE TABLE IF NOT EXISTS `policy_group_break` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `break_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_credit`
--

CREATE TABLE IF NOT EXISTS `policy_group_credit` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `credit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_holiday`
--

CREATE TABLE IF NOT EXISTS `policy_group_holiday` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `holiday_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_leavegrants`
--

CREATE TABLE IF NOT EXISTS `policy_group_leavegrants` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `leavegrant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_overtime`
--

CREATE TABLE IF NOT EXISTS `policy_group_overtime` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `overtime_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy_group_overtime`
--

INSERT INTO `policy_group_overtime` (`id`, `policy_group_id`, `overtime_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `policy_group_premium`
--

CREATE TABLE IF NOT EXISTS `policy_group_premium` (
  `id` int(11) NOT NULL,
  `policy_group_id` int(11) NOT NULL,
  `premium_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `premium_policies`
--

CREATE TABLE IF NOT EXISTS `premium_policies` (
  `id` int(10) unsigned NOT NULL,
  `premium_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sun_timein` time DEFAULT NULL,
  `sun_timeout` time DEFAULT NULL,
  `m_timein` time DEFAULT NULL,
  `m_timeout` time DEFAULT NULL,
  `t_timein` time DEFAULT NULL,
  `t_timeout` time DEFAULT NULL,
  `w_timein` time DEFAULT NULL,
  `w_timeout` time DEFAULT NULL,
  `th_timein` time DEFAULT NULL,
  `th_timeout` time DEFAULT NULL,
  `f_timein` time DEFAULT NULL,
  `f_timeout` time DEFAULT NULL,
  `sat_timein` time DEFAULT NULL,
  `sat_timeout` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punches`
--

CREATE TABLE IF NOT EXISTS `punches` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `employee_id` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `punches`
--

INSERT INTO `punches` (`id`, `date`, `time`, `employee_id`) VALUES
(1, '2015-09-02', '05:56:07', '2'),
(2, '2015-09-02', '11:57:35', '5'),
(3, '2015-09-15', '08:05:44', '2'),
(4, '2015-09-16', '05:22:16', '2'),
(5, '2015-09-16', '05:24:31', '2'),
(6, '2015-09-16', '05:28:14', '2'),
(7, '2015-09-16', '05:28:47', '2'),
(8, '2015-09-16', '05:29:16', '2'),
(9, '2015-09-16', '05:29:49', '2'),
(10, '2015-09-17', '02:41:03', '2'),
(11, '2015-09-17', '02:42:10', '2'),
(12, '2015-09-17', '03:05:46', '2'),
(13, '2015-09-17', '03:08:18', '2'),
(14, '2015-09-17', '03:10:50', '2'),
(15, '2015-09-17', '04:18:33', '2'),
(16, '2015-09-17', '04:26:52', '2'),
(17, '2015-09-17', '08:00:29', '2'),
(18, '2015-09-17', '08:01:33', '2'),
(19, '2015-09-17', '08:02:48', '2'),
(20, '2015-09-17', '08:04:34', '2'),
(21, '2015-09-17', '08:05:15', '2'),
(22, '2015-09-17', '08:05:34', '2'),
(23, '2015-09-17', '08:05:48', '2'),
(24, '2015-09-17', '08:05:49', '2'),
(25, '2015-09-17', '08:05:59', '2'),
(26, '2015-09-17', '08:06:00', '2'),
(27, '2015-09-17', '08:09:01', '2'),
(28, '2015-09-17', '08:10:22', '2'),
(29, '2015-09-17', '08:11:11', '2'),
(30, '2015-09-17', '08:11:14', '2'),
(31, '2015-09-17', '08:11:38', '2'),
(32, '2015-09-17', '08:13:11', '2'),
(33, '2015-09-17', '08:14:00', '2'),
(34, '2015-09-17', '08:17:47', '2'),
(35, '2015-09-17', '08:22:42', '2'),
(36, '2015-09-17', '08:23:56', '2'),
(37, '2015-09-17', '08:24:58', '2'),
(38, '2015-09-17', '08:26:20', '2'),
(39, '2015-09-17', '08:00:19', '2'),
(40, '2015-09-17', '08:00:34', '2'),
(41, '2015-09-17', '08:00:36', '2'),
(42, '2015-09-17', '08:07:00', '2'),
(43, '2015-09-17', '11:07:30', '2'),
(44, '2015-09-17', '12:38:49', '2'),
(45, '2015-09-17', '12:40:28', '2'),
(46, '2015-09-17', '12:45:58', '2'),
(47, '2015-09-17', '01:39:35', '2'),
(48, '2015-09-17', '01:41:28', '2'),
(49, '2015-09-17', '01:41:49', '2'),
(50, '2015-09-17', '01:42:27', '2'),
(51, '2015-09-17', '01:43:26', '2'),
(52, '2015-09-17', '01:44:20', '2'),
(53, '2015-09-17', '01:45:24', '2'),
(54, '2015-09-17', '01:46:07', '2'),
(55, '2015-09-17', '01:47:47', '2'),
(56, '2015-09-17', '01:48:55', '2'),
(57, '2015-09-17', '01:49:08', '2'),
(58, '2015-09-17', '01:53:00', '2'),
(59, '2015-09-17', '01:53:44', '2'),
(60, '2015-09-17', '01:55:15', '2'),
(61, '2015-09-17', '01:55:49', '2'),
(62, '2015-09-17', '01:57:13', '2'),
(63, '2015-09-17', '02:02:55', '2'),
(64, '2015-09-17', '08:08:08', '2'),
(65, '2015-09-17', '08:08:36', '2'),
(66, '2015-09-17', '09:43:06', '2'),
(67, '2015-09-17', '07:29:36', '4'),
(68, '2015-09-17', '07:30:14', '4'),
(69, '2015-09-17', '07:34:24', '2'),
(70, '2015-09-17', '07:50:57', '2'),
(71, '2015-09-17', '08:05:43', '2'),
(72, '2015-09-17', '08:06:11', '4'),
(73, '2015-09-17', '08:06:28', '4'),
(74, '2015-09-17', '08:08:34', '4'),
(75, '2015-09-17', '08:08:44', '2'),
(76, '2015-09-17', '08:12:07', '4'),
(77, '2015-09-17', '08:12:38', '2'),
(78, '2015-09-17', '08:13:01', '2'),
(79, '2015-09-17', '08:13:46', '4'),
(80, '2015-09-17', '08:28:18', '6'),
(81, '2015-09-17', '08:29:33', '2'),
(82, '2015-09-17', '08:33:14', '2'),
(83, '2015-09-17', '08:33:43', '2'),
(84, '2015-09-17', '08:33:45', '6'),
(85, '2015-09-17', '08:33:49', '2'),
(86, '2015-09-17', '08:38:24', '15'),
(87, '2015-09-17', '08:42:19', '7'),
(88, '2015-09-17', '08:42:21', '2'),
(89, '2015-09-17', '08:48:53', '6'),
(90, '2015-09-17', '08:53:02', '2'),
(91, '2015-09-17', '08:53:06', '6'),
(92, '2015-09-17', '08:53:10', '2'),
(93, '2015-09-17', '08:53:12', '6'),
(94, '2015-09-17', '08:56:07', '2'),
(95, '2015-09-17', '08:56:09', '6'),
(96, '2015-09-17', '08:56:29', '2'),
(97, '2015-09-17', '08:56:31', '6'),
(98, '2015-09-17', '08:56:48', '2'),
(99, '2015-09-17', '08:56:50', '6'),
(100, '2015-09-17', '08:57:11', '2'),
(101, '2015-09-17', '08:57:13', '6'),
(102, '2015-09-17', '08:57:39', '2'),
(103, '2015-09-17', '08:57:41', '6'),
(104, '2015-09-17', '08:57:59', '2'),
(105, '2015-09-17', '08:58:01', '6'),
(106, '2015-09-17', '08:58:13', '2'),
(107, '2015-09-17', '08:58:15', '6'),
(108, '2015-09-17', '08:58:33', '6'),
(109, '2015-09-17', '08:58:35', '2'),
(110, '2015-09-22', '08:08:58', '2'),
(111, '2015-09-22', '08:09:20', '6'),
(112, '2015-09-22', '08:11:02', '6'),
(113, '2015-09-22', '08:12:35', '6'),
(114, '2015-09-22', '08:13:18', '6'),
(115, '2015-09-22', '08:13:47', '6'),
(116, '2015-09-22', '08:14:21', '6'),
(117, '2015-09-22', '08:15:08', '6'),
(118, '2015-09-22', '08:10:58', '6'),
(119, '2015-09-22', '08:11:28', '6'),
(120, '2015-09-22', '08:13:24', '2'),
(121, '2015-09-22', '08:16:18', '6'),
(122, '2015-09-22', '08:16:35', '6'),
(123, '2015-09-22', '08:19:20', '6'),
(124, '2015-09-22', '08:19:36', '6'),
(125, '2015-09-22', '08:39:07', '6'),
(126, '2015-09-22', '08:39:23', '6'),
(127, '2015-09-22', '09:02:46', '6'),
(128, '2015-09-22', '09:03:41', '2'),
(129, '2015-09-22', '09:04:48', '2'),
(130, '2015-09-22', '09:06:52', '2'),
(131, '2015-09-22', '09:07:13', '2'),
(132, '2015-09-22', '09:08:11', '2'),
(133, '2015-09-22', '09:08:36', '2'),
(134, '2015-09-22', '09:08:49', '2'),
(135, '2015-09-22', '09:10:41', '2'),
(136, '2015-09-22', '09:11:07', '2'),
(137, '2015-09-22', '09:11:27', '2'),
(138, '2015-09-22', '03:00:00', '2'),
(139, '2015-09-23', '08:00:00', '2'),
(140, '2015-09-23', '03:00:00', '2');

-- --------------------------------------------------------

--
-- Table structure for table `punchstatus`
--

CREATE TABLE IF NOT EXISTS `punchstatus` (
  `id` int(11) NOT NULL,
  `time_in` varchar(50) NOT NULL,
  `time_in_punch_id` int(11) DEFAULT NULL,
  `break_in` varchar(50) DEFAULT NULL,
  `break_in_punch_id` int(11) DEFAULT NULL,
  `break_out` varchar(50) DEFAULT NULL,
  `break_out_punch_id` int(11) DEFAULT NULL,
  `time_out` varchar(50) DEFAULT NULL,
  `time_out_punch_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `punchstatus`
--

INSERT INTO `punchstatus` (`id`, `time_in`, `time_in_punch_id`, `break_in`, `break_in_punch_id`, `break_out`, `break_out_punch_id`, `time_out`, `time_out_punch_id`, `date`, `employee_id`) VALUES
(14, 'On-time', 110, 'early break', 135, NULL, NULL, 'On-time', 138, '2015-09-22', 2),
(16, 'Late', 127, NULL, NULL, NULL, NULL, NULL, NULL, '2015-09-22', 6),
(17, 'On-Time', 139, '', NULL, NULL, NULL, 'On-Time', 140, '2015-09-23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `request_types`
--

CREATE TABLE IF NOT EXISTS `request_types` (
  `id` int(10) unsigned NOT NULL,
  `request_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_types`
--

INSERT INTO `request_types` (`id`, `request_type`, `description`, `created_at`, `updated_at`) VALUES
(0, 'Emergency Leave', 'This is for Emergencies only\r\n', '2015-09-23 22:50:17', '2015-09-23 22:50:17'),
(1, 'Sick Leave', 'for sick only', '2015-09-12 08:02:47', '2015-09-12 08:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(10) unsigned NOT NULL,
  `schedule_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sun_timein` time DEFAULT NULL,
  `sun_timeout` time DEFAULT NULL,
  `m_timein` time DEFAULT NULL,
  `m_timeout` time DEFAULT NULL,
  `t_timein` time DEFAULT NULL,
  `t_timeout` time DEFAULT NULL,
  `w_timein` time DEFAULT NULL,
  `w_timeout` time DEFAULT NULL,
  `th_timein` time DEFAULT NULL,
  `th_timeout` time DEFAULT NULL,
  `f_timein` time DEFAULT NULL,
  `f_timeout` time DEFAULT NULL,
  `sat_timein` time DEFAULT NULL,
  `sat_timeout` time DEFAULT NULL,
  `require_break_punches` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `schedule_name`, `description`, `sun_timein`, `sun_timeout`, `m_timein`, `m_timeout`, `t_timein`, `t_timeout`, `w_timein`, `w_timeout`, `th_timein`, `th_timeout`, `f_timein`, `f_timeout`, `sat_timein`, `sat_timeout`, `require_break_punches`, `created_at`, `updated_at`) VALUES
(1, 'Regular Day Shift', 'regular government day shift schedule', '00:00:00', '00:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', 'Yes', '2015-07-29 08:41:21', '2015-09-15 02:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
  `id` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `station_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `status`, `station_name`, `type`, `source`, `description`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Enabled', 'Terminal 1 Sta.Mesa', 'PC', '192.168.254.100', 'Terminal 1 Sta. Mesa', 1, '2015-07-29 09:19:17', '2015-07-29 09:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Denimar Fernandez', 'admin', 'teams@FareMatrix.com', '$2y$10$ZmBeM8hPVvlIFFlt9HC/OOXHYJKHGhklmJmz3dMir7Vj3LWrrtI8u', 'vBBOfIaqjJbXPBjufIWrlVj2JMHx8RiH3zM4crEiwqjy5UcxJ6EIlUeOQxcn', '2015-02-27 03:21:49', '2015-09-24 20:32:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accrual_policies`
--
ALTER TABLE `accrual_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_exceptions`
--
ALTER TABLE `assign_exceptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_overtimes`
--
ALTER TABLE `assign_overtimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breaks`
--
ALTER TABLE `breaks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `break_policies`
--
ALTER TABLE `break_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_requests`
--
ALTER TABLE `create_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_policies`
--
ALTER TABLE `credit_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_assign_overtimes`
--
ALTER TABLE `custom_assign_overtimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empdownloads`
--
ALTER TABLE `empdownloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeefiles`
--
ALTER TABLE `employeefiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employs`
--
ALTER TABLE `employs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empschedules`
--
ALTER TABLE `empschedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exception_groups`
--
ALTER TABLE `exception_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exception_policies`
--
ALTER TABLE `exception_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hierarchies`
--
ALTER TABLE `hierarchies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hierarchy_subordinates`
--
ALTER TABLE `hierarchy_subordinates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday_policies`
--
ALTER TABLE `holiday_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itechs`
--
ALTER TABLE `itechs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobtitles`
--
ALTER TABLE `jobtitles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavecredits`
--
ALTER TABLE `leavecredits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavesummaries`
--
ALTER TABLE `leavesummaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_grants`
--
ALTER TABLE `leave_grants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overtime_policies`
--
ALTER TABLE `overtime_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overtime_subordinates`
--
ALTER TABLE `overtime_subordinates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_periods`
--
ALTER TABLE `pay_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policygroup_employees`
--
ALTER TABLE `policygroup_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_groups`
--
ALTER TABLE `policy_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_accrual`
--
ALTER TABLE `policy_group_accrual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_break`
--
ALTER TABLE `policy_group_break`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_credit`
--
ALTER TABLE `policy_group_credit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_holiday`
--
ALTER TABLE `policy_group_holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_leavegrants`
--
ALTER TABLE `policy_group_leavegrants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_overtime`
--
ALTER TABLE `policy_group_overtime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_group_premium`
--
ALTER TABLE `policy_group_premium`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `premium_policies`
--
ALTER TABLE `premium_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `punches`
--
ALTER TABLE `punches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `punchstatus`
--
ALTER TABLE `punchstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_types`
--
ALTER TABLE `request_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accrual_policies`
--
ALTER TABLE `accrual_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assign_exceptions`
--
ALTER TABLE `assign_exceptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `assign_overtimes`
--
ALTER TABLE `assign_overtimes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `breaks`
--
ALTER TABLE `breaks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `break_policies`
--
ALTER TABLE `break_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `create_requests`
--
ALTER TABLE `create_requests`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `credit_policies`
--
ALTER TABLE `credit_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `custom_assign_overtimes`
--
ALTER TABLE `custom_assign_overtimes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `empdownloads`
--
ALTER TABLE `empdownloads`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeefiles`
--
ALTER TABLE `employeefiles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employs`
--
ALTER TABLE `employs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `empschedules`
--
ALTER TABLE `empschedules`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exception_groups`
--
ALTER TABLE `exception_groups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exception_policies`
--
ALTER TABLE `exception_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `hierarchies`
--
ALTER TABLE `hierarchies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hierarchy_subordinates`
--
ALTER TABLE `hierarchy_subordinates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `holiday_policies`
--
ALTER TABLE `holiday_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `itechs`
--
ALTER TABLE `itechs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jobtitles`
--
ALTER TABLE `jobtitles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `leavecredits`
--
ALTER TABLE `leavecredits`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `leavesummaries`
--
ALTER TABLE `leavesummaries`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `leave_grants`
--
ALTER TABLE `leave_grants`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `overtime_policies`
--
ALTER TABLE `overtime_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `overtime_subordinates`
--
ALTER TABLE `overtime_subordinates`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pay_periods`
--
ALTER TABLE `pay_periods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `policygroup_employees`
--
ALTER TABLE `policygroup_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `policy_groups`
--
ALTER TABLE `policy_groups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `policy_group_accrual`
--
ALTER TABLE `policy_group_accrual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `policy_group_break`
--
ALTER TABLE `policy_group_break`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `policy_group_credit`
--
ALTER TABLE `policy_group_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `policy_group_holiday`
--
ALTER TABLE `policy_group_holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `policy_group_leavegrants`
--
ALTER TABLE `policy_group_leavegrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `policy_group_overtime`
--
ALTER TABLE `policy_group_overtime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `policy_group_premium`
--
ALTER TABLE `policy_group_premium`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `premium_policies`
--
ALTER TABLE `premium_policies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `punches`
--
ALTER TABLE `punches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `punchstatus`
--
ALTER TABLE `punchstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
