-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2020 at 11:43 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `actives`
--

CREATE TABLE `actives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `active` bigint(20) NOT NULL,
  `reported` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$WMSQYylD7JvQmkPnmFoqv.pL.f2mwq4fwZxwDsv/DmN2cb1i99lnK', NULL, '2020-11-13 00:59:37', '2020-11-13 00:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'djc', '2020-12-24 16:07:46', '2020-12-24 16:07:46'),
(2, 2, 'jjhskdj', '2020-12-24 16:11:00', '2020-12-24 16:11:00'),
(3, 2, 'dskjf', '2020-12-24 16:11:00', '2020-12-24 16:11:00'),
(4, 2, 'ksjdh', '2020-12-24 16:11:01', '2020-12-24 16:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `check` int(11) NOT NULL DEFAULT 0,
  `check_out` int(11) NOT NULL DEFAULT 0,
  `check_date` datetime DEFAULT NULL,
  `check_out_date` datetime DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `check`, `check_out`, `check_date`, `check_out_date`, `sum`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2020-11-20 12:38:53', '2020-11-20 12:58:52', 6, '2020-11-20 10:38:53', '2020-11-20 10:38:53'),
(2, 2, 1, 1, '2020-11-20 12:58:14', '2020-11-20 12:58:53', 6, '2020-11-20 10:58:14', '2020-11-20 10:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Engineering', '2020-11-13 21:12:02', '2020-11-13 21:12:02'),
(4, 'Embedded Systems', '2020-11-13 21:32:57', '2020-11-13 21:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `pic`, `user_id`, `department_id`, `created_at`, `updated_at`) VALUES
(18, 'ha6oTYm8KEoKLe4gVHprh7mbEORJXlWXu1EwxHh0.jpeg', 2, 1, '2020-11-19 07:11:03', '2020-11-19 07:11:03'),
(19, 'SbnsW8u1LZJ0REyuhadfsqy9n5bpjumgKm5kT1vH.jpeg', 3, 1, '2020-11-25 17:13:05', '2020-11-25 17:13:05'),
(20, 'OtSnVEv8MzTkYTK7sUKVih4ibjy8SBjXpMZXF9XP.jpeg', 5, 1, '2020-12-24 11:27:32', '2020-12-24 11:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_12_012240_create_departments_table', 1),
(5, '2020_11_12_014935_create_admins_table', 1),
(16, '2020_11_13_030027_create_employees_table', 2),
(17, '2020_11_13_031542_create_requests_table', 2),
(19, '2020_11_13_033345_create_questions_table', 2),
(20, '2020_11_13_033636_create_answers_table', 2),
(21, '2020_11_13_032304_create_attendances_table', 3),
(22, '2020_11_13_034328_create_reports_table', 3),
(26, '2020_12_10_141851_create_notifications_table', 4),
(27, '2020_12_24_182457_create_actives_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accept` int(11) NOT NULL DEFAULT 0,
  `seen` int(11) NOT NULL DEFAULT 0,
  `seen_by_user` int(11) NOT NULL DEFAULT 0,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `accept`, `seen`, `seen_by_user`, `request_id`, `user_id`, `department_id`, `created_at`, `updated_at`) VALUES
(46, 1, 1, 0, 56, 5, 1, '2020-12-24 09:01:27', '2020-12-24 09:01:27'),
(47, 1, 1, 0, 57, 2, 1, '2020-12-24 09:27:59', '2020-12-24 09:27:59'),
(48, 1, 1, 0, 58, 5, 1, '2020-12-24 09:29:55', '2020-12-24 09:29:55'),
(49, 1, 1, 0, 59, 5, 1, '2020-12-24 09:30:01', '2020-12-24 09:30:01'),
(50, -1, 1, 0, 60, 5, 1, '2020-12-24 13:25:33', '2020-12-24 13:25:33'),
(51, -1, 1, 1, 61, 5, 1, '2020-12-24 14:25:27', '2020-12-24 14:25:27'),
(52, -1, 1, 0, 62, 5, 1, '2020-12-24 14:32:44', '2020-12-24 14:32:44'),
(53, -1, 1, 0, 63, 5, 1, '2020-12-24 14:54:55', '2020-12-24 14:54:55'),
(54, 1, 1, 0, 64, 5, 1, '2020-12-24 15:13:48', '2020-12-24 15:13:48'),
(55, -1, 1, 0, 65, 5, 1, '2020-12-24 15:26:56', '2020-12-24 15:26:56'),
(56, -1, 1, 0, 66, 5, 1, '2020-12-24 15:28:34', '2020-12-24 15:28:34'),
(57, 1, 1, 0, 67, 5, 1, '2020-12-24 20:01:40', '2020-12-24 20:01:40'),
(58, 0, 0, 0, 68, 5, 1, '2020-12-24 20:01:43', '2020-12-24 20:01:43'),
(59, 0, 0, 0, 69, 5, 1, '2020-12-24 20:01:44', '2020-12-24 20:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `department_id`, `text`, `created_at`, `updated_at`) VALUES
(2, 1, 'j', '2020-12-24 16:11:00', '2020-12-24 16:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `user_id`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'its my wedding day', 1, '2020-11-20 04:05:35', '2020-11-20 04:05:35'),
(2, 3, 'its my wedding day', 1, '2020-11-25 15:15:56', '2020-11-25 15:15:56'),
(3, 2, 'its my wedding day', 1, '2020-12-10 12:31:35', '2020-12-10 12:31:35'),
(4, 2, 'its my wedding day', 1, '2020-12-10 20:04:09', '2020-12-10 20:04:09'),
(5, 2, 'its my wedding day', 1, '2020-12-11 16:31:13', '2020-12-11 16:31:13'),
(6, 2, 'its my wedding day', 1, '2020-12-11 16:31:20', '2020-12-11 16:31:20'),
(7, 2, 'its my wedding dayhghj', 1, '2020-12-11 16:31:35', '2020-12-11 16:31:35'),
(8, 2, 'its my wedding day', 1, '2020-12-11 16:31:47', '2020-12-11 16:31:47'),
(9, 2, 'its my wedding dayhghj', 1, '2020-12-11 16:31:53', '2020-12-11 16:31:53'),
(10, 2, 'its my wedding day', 1, '2020-12-11 16:58:21', '2020-12-11 16:58:21'),
(11, 2, 'its my wedding day', 1, '2020-12-11 16:59:18', '2020-12-11 16:59:18'),
(12, 2, 'its my wedding dayhghj', 1, '2020-12-11 17:04:26', '2020-12-11 17:04:26'),
(13, 2, 'its my wedding dayhghj', 1, '2020-12-11 17:04:31', '2020-12-11 17:04:31'),
(14, 2, 'its my wedding day', 1, '2020-12-11 17:04:36', '2020-12-11 17:04:36'),
(15, 2, 'its my wedding day', 1, '2020-12-11 17:04:40', '2020-12-11 17:04:40'),
(16, 2, 'its my wedding dayhghj', 1, '2020-12-11 17:04:45', '2020-12-11 17:04:45'),
(17, 2, 'its my wedding day', 1, '2020-12-11 17:06:49', '2020-12-11 17:06:49'),
(18, 2, 'its my wedding day', 1, '2020-12-11 18:41:28', '2020-12-11 18:41:28'),
(19, 2, 'its my wedding dayhghj', 1, '2020-12-11 18:43:54', '2020-12-11 18:43:54'),
(20, 2, 'hi', 1, '2020-12-11 18:44:15', '2020-12-11 18:44:15'),
(21, 2, 'hi', 1, '2020-12-11 18:44:21', '2020-12-11 18:44:21'),
(22, 2, 'its my wedding dayhghj', 1, '2020-12-11 18:44:43', '2020-12-11 18:44:43'),
(23, 2, 'hi', 1, '2020-12-11 18:45:38', '2020-12-11 18:45:38'),
(24, 2, 'huuuuuuuuuu', 1, '2020-12-11 18:45:53', '2020-12-11 18:45:53'),
(25, 2, 'its my wedding day', 1, '2020-12-11 18:46:52', '2020-12-11 18:46:52'),
(26, 2, 'its my wedding day', 1, '2020-12-11 18:47:17', '2020-12-11 18:47:17'),
(27, 2, 'its my wedding day', 1, '2020-12-11 18:47:32', '2020-12-11 18:47:32'),
(28, 2, 'huuuuuuuuuu', 1, '2020-12-11 19:00:22', '2020-12-11 19:00:22'),
(29, 2, 'its my wedding dayhghj', 1, '2020-12-11 19:02:59', '2020-12-11 19:02:59'),
(30, 2, 'huuuuuuuuuu', 1, '2020-12-11 19:07:57', '2020-12-11 19:07:57'),
(31, 2, 'its my wedding dayhghj', 1, '2020-12-11 19:10:48', '2020-12-11 19:10:48'),
(32, 2, 'hi', 1, '2020-12-11 19:26:49', '2020-12-11 19:26:49'),
(33, 2, 'its my wedding day', 1, '2020-12-11 19:26:57', '2020-12-11 19:26:57'),
(34, 2, 'its my wedding day', 1, '2020-12-12 00:05:27', '2020-12-12 00:05:27'),
(35, 2, 'huuuuuuuuuu', 1, '2020-12-23 09:29:08', '2020-12-23 09:29:08'),
(36, 2, 'its my wedding day', 1, '2020-12-23 09:30:05', '2020-12-23 09:30:05'),
(37, 2, 'its my wedding dayhghj', 1, '2020-12-23 09:34:40', '2020-12-23 09:34:40'),
(38, 2, 'its my wedding dayhghj', 1, '2020-12-23 09:35:49', '2020-12-23 09:35:49'),
(39, 2, 'its my wedding day', 1, '2020-12-23 09:36:55', '2020-12-23 09:36:55'),
(40, 2, 'its my wedding day', 1, '2020-12-23 09:37:34', '2020-12-23 09:37:34'),
(41, 2, 'its my wedding day', 1, '2020-12-23 09:38:32', '2020-12-23 09:38:32'),
(42, 2, 'its my wedding dayhghj', 1, '2020-12-23 09:39:02', '2020-12-23 09:39:02'),
(43, 2, 'its my wedding dayhghj', 1, '2020-12-23 09:40:43', '2020-12-23 09:40:43'),
(44, 2, 'its my wedding day', 1, '2020-12-23 09:41:55', '2020-12-23 09:41:55'),
(45, 2, 'its my wedding dayhghj', 1, '2020-12-23 09:42:09', '2020-12-23 09:42:09'),
(46, 2, 'its my wedding dayhghj', 1, '2020-12-23 09:42:22', '2020-12-23 09:42:22'),
(47, 2, 'its my wedding dayhghj', 1, '2020-12-23 10:53:09', '2020-12-23 10:53:09'),
(48, 2, 'its my wedding day', 1, '2020-12-23 11:56:31', '2020-12-23 11:56:31'),
(49, 2, 'its my wedding day', 1, '2020-12-23 11:56:32', '2020-12-23 11:56:32'),
(50, 2, 'its my wedding dayhghj', 1, '2020-12-23 11:56:46', '2020-12-23 11:56:46'),
(51, 2, 'its my wedding day', 1, '2020-12-23 12:08:42', '2020-12-23 12:08:42'),
(52, 2, 'its my wedding day', 1, '2020-12-23 12:09:55', '2020-12-23 12:09:55'),
(53, 2, 'its my wedding day', 1, '2020-12-24 08:58:45', '2020-12-24 08:58:45'),
(54, 2, 'its my wedding day', 1, '2020-12-24 09:00:29', '2020-12-24 09:00:29'),
(55, 2, 'its my wedding day', 1, '2020-12-24 09:00:38', '2020-12-24 09:00:38'),
(56, 2, 'its my wedding day', 1, '2020-12-24 09:01:27', '2020-12-24 09:01:27'),
(57, 5, 'its my wedding dayhghj', 1, '2020-12-24 09:27:59', '2020-12-24 09:27:59'),
(58, 5, 'its my wedding dayhghj', 1, '2020-12-24 09:29:55', '2020-12-24 09:29:55'),
(59, 5, 'hi', 1, '2020-12-24 09:30:00', '2020-12-24 09:30:00'),
(60, 5, 'its my wedding dayhghj', -1, '2020-12-24 13:25:33', '2020-12-24 13:25:33'),
(61, 5, 'its my wedding dayhghj', -1, '2020-12-24 14:25:27', '2020-12-24 14:25:27'),
(62, 5, 'huuuuuuuuuu', -1, '2020-12-24 14:32:44', '2020-12-24 14:32:44'),
(63, 5, 'its my wedding dayhghj', -1, '2020-12-24 14:54:55', '2020-12-24 14:54:55'),
(64, 5, 'huuuuuuuuuu', 1, '2020-12-24 15:13:48', '2020-12-24 15:13:48'),
(65, 5, 'hi', -1, '2020-12-24 15:26:55', '2020-12-24 15:26:55'),
(66, 5, 'its my wedding dayhghj', -1, '2020-12-24 15:28:34', '2020-12-24 15:28:34'),
(67, 5, 'its my wedding day', 1, '2020-12-24 20:01:39', '2020-12-24 20:01:39'),
(68, 5, 'its my wedding day', 0, '2020-12-24 20:01:43', '2020-12-24 20:01:43'),
(69, 5, 'its my wedding day', 0, '2020-12-24 20:01:44', '2020-12-24 20:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `head` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `active`, `head`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nagwa Ali', 'ahmed@ghj.com', NULL, '$2y$10$xqRKlAQI5YatWqIVvJmzSeumIFl3WowGdJncDdd9VIfkcOXuob9Eu', -2, 0, NULL, '2020-11-13 21:39:08', '2020-11-20 06:32:30'),
(2, 'Salah ali', 'aa@aa.aa', NULL, '$2y$10$PtX1hFKhz48FACwUeK51s.IwDQXk5ihpjFzJd8sBGfbsNaARJnt0G', 1, 1, NULL, '2020-11-16 21:42:38', '2020-12-02 00:05:56'),
(3, 'Walaa Shamy', 'walaa@gmail.com', NULL, '$2y$10$/oPPGYdQMKGP4GDp7.1C0.KAGMLirddCS48r5v9IuPPRNOx948LT2', -2, 0, NULL, '2020-11-25 15:09:54', '2020-12-24 19:50:15'),
(4, 'Nagwa Ali', 'nnnnali123@gmail.com', NULL, '$2y$10$F5ckjx3zaOY5gRGabXLCIezmhbgfrEHBVYH5FivRhkbZWlUxRrZ4W', 0, 0, NULL, '2020-12-12 00:06:52', '2020-12-12 00:06:52'),
(5, 'Ali Mohamed', 'ALI@ALI.COM', NULL, '$2y$10$F99w8fF9VIzXPFHqliY2M.rtCH7OmruuIL4dSfQDlC.GQaPkCSCcO', -2, 0, NULL, '2020-12-24 09:26:13', '2020-12-24 19:52:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actives`
--
ALTER TABLE `actives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_user_id_foreign` (`user_id`),
  ADD KEY `employees_department_id_foreign` (`department_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_request_id_foreign` (`request_id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_department_id_foreign` (`department_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_department_id_foreign` (`department_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actives`
--
ALTER TABLE `actives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `notifications_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`),
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
