-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 05, 2019 at 03:56 PM
-- Server version: 10.1.29-MariaDB-6ubuntu2
-- PHP Version: 7.2.15-0ubuntu0.18.10.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning_lara`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `_id` int(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `departmen` varchar(50) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`_id`, `name`, `position`, `departmen`, `salary`) VALUES
(1, 'mugi', 'Programmer', 'RND', 4000),
(2, 'danang', 'Analis', 'Project Manager', 4000),
(3, 'danang', 'front', 'programmer', 5000),
(4, 'udin', 'front', 'programmer', 4500),
(5, 'iman', 'developer', 'programmer', 4000),
(6, 'imin', 'programmer', 'developer', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `gambars`
--

CREATE TABLE `gambars` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gambars`
--

INSERT INTO `gambars` (`id`, `file`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '1554436982_download.png', 'tetst lagi jhon', '2019-04-04 21:03:02', '2019-04-04 21:03:02'),
(2, '1554437040_download.jpeg', 'Mainsite kepak', '2019-04-04 21:04:00', '2019-04-04 21:04:00'),
(3, '1554437321_download.jpeg', 'test', '2019-04-04 21:08:41', '2019-04-04 21:08:41'),
(4, '1554437321_download.png', 'test', '2019-04-04 21:08:41', '2019-04-04 21:08:41'),
(5, '1554437373_kepak_201903110332171471081792.jpg', 'tt', '2019-04-04 21:09:33', '2019-04-04 21:09:33'),
(6, '1554437373_kepak_201903110351281779985330.jpg', 'tt', '2019-04-04 21:09:33', '2019-04-04 21:09:33'),
(7, '1554437910_download.png', 'a', '2019-04-04 21:18:30', '2019-04-04 21:18:30'),
(8, '1554437910_Ft5_3mb.JPG', 'a', '2019-04-04 21:18:30', '2019-04-04 21:18:30'),
(9, '1554450454_download.jpeg', 'asdasd', '2019-04-05 00:47:34', '2019-04-05 00:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_04_05_032316_create_gambars_table', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `new_column`
-- (See below for the actual view)
--
CREATE TABLE `new_column` (
`departmen` varchar(50)
,`salary` double
,`programmer` bigint(21)
,`developer` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `new_column`
--
DROP TABLE IF EXISTS `new_column`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `new_column`  AS  select `employees`.`departmen` AS `departmen`,`employees`.`salary` AS `salary`,(select count(`e1`.`departmen`) from `employees` `e1` where ((`e1`.`departmen` = 'programmer') and (`e1`.`departmen` = `employees`.`departmen`))) AS `programmer`,(select count(`e1`.`departmen`) from `employees` `e1` where ((`e1`.`departmen` = 'developer') and (`e1`.`departmen` = `employees`.`departmen`))) AS `developer` from `employees` group by `employees`.`departmen` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `gambars`
--
ALTER TABLE `gambars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gambars`
--
ALTER TABLE `gambars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
