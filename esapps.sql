-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 28 avr. 2019 à 19:42
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `esapps`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ages`
--

CREATE TABLE `ages` (
  `id` int(10) UNSIGNED NOT NULL,
  `min` smallint(5) UNSIGNED NOT NULL,
  `max` smallint(5) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `age_exercise`
--

CREATE TABLE `age_exercise` (
  `id` int(10) UNSIGNED NOT NULL,
  `age_id` int(10) UNSIGNED NOT NULL,
  `exercise_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `anomalies`
--

CREATE TABLE `anomalies` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `cause` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `apps`
--

CREATE TABLE `apps` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `apps`
--

INSERT INTO `apps` (`id`, `name`, `description`, `slug`, `rate`, `views`, `deleted_at`, `created_at`, `updated_at`) VALUES
('1', 'device1', 'this is a test device', 'degeee-555', 1, 2, '2019-03-12 23:00:00', '2019-03-12 23:00:00', '2019-03-17 23:00:00'),
('2', 'device 2', 'this is the second device', 'device-777', 2, 1, '2019-03-20 23:00:00', '2019-03-25 23:00:00', '2019-03-20 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `method_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `children`
--

CREATE TABLE `children` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `parent_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `children`
--

INSERT INTO `children` (`id`, `first_name`, `last_name`, `gender`, `birthday`, `parent_email`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Taha', 'Nedved', 'male', '2019-02-16', 'miala69@hotmail.fr', 'vfsds-jpJaY', NULL, '2019-02-27 12:20:28', '2019-02-27 12:20:28'),
(2, 'Ahmed', 'Mobaraki', 'male', '2019-03-14', 'parentofahmed@gmail.com', 'mobaraki-54655', NULL, NULL, NULL),
(3, 'Bendir', 'Karamo', 'female', '2019-03-27', 'karamoParent@gmail.com', 'fdfsdfsd-444', NULL, NULL, NULL),
(4, 'Mamadou', 'Diakiti', 'male', '2016-06-19', 'diakitiparent@gmail.com', 'diakiti-ssss', NULL, NULL, NULL),
(5, 'mandyaye', 'fall', 'male', '2016-06-19', 'fall@gmail.com', 'fall-ssss', NULL, NULL, NULL),
(6, 'mandyaye', 'falla', 'female', '2012-06-19', 'fallaaa@gmail.com', 'fallaa-ssss', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `child_organization`
--

CREATE TABLE `child_organization` (
  `id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dates`
--

CREATE TABLE `dates` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_time` datetime NOT NULL,
  `anomaly_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `device_mac` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `child_id`, `app_id`, `device_mac`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '1', 'fdfsdfsd', 'ffdsfdsfdfs', '2019-03-04 23:00:00', '2019-03-20 23:00:00', '2019-03-17 23:00:00'),
(2, 3, 2, '1', 'device2', 'device-8888', NULL, NULL, NULL),
(3, 2, 3, '1', 'device3', 'slug-333', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `exercises`
--

CREATE TABLE `exercises` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_id` int(10) UNSIGNED NOT NULL,
  `goal_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exercise_objective`
--

CREATE TABLE `exercise_objective` (
  `id` int(10) UNSIGNED NOT NULL,
  `exercise_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `objective_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id` int(10) UNSIGNED NOT NULL,
  `successful_attempts` smallint(5) UNSIGNED NOT NULL,
  `failed_attempts` smallint(5) UNSIGNED NOT NULL,
  `min_time_succeed_sec` int(10) UNSIGNED NOT NULL,
  `avg_time_succeed_sec` int(10) UNSIGNED NOT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `app_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `exercise_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `level_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `game_date_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `game_dates`
--

CREATE TABLE `game_dates` (
  `id` int(10) UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `goals`
--

CREATE TABLE `goals` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `levels`
--

CREATE TABLE `levels` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methods`
--

CREATE TABLE `methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_19_134604_add_context_users', 1),
(4, '2018_05_02_012351_create_ages_table', 1),
(5, '2018_05_02_012351_create_apps_table', 1),
(6, '2018_05_02_012351_create_categories_table', 1),
(7, '2018_05_02_012351_create_children_table', 1),
(8, '2018_05_02_012351_create_exercises_table', 1),
(9, '2018_05_02_012351_create_game_dates_table', 1),
(10, '2018_05_02_012351_create_games_table', 1),
(11, '2018_05_02_012351_create_goals_table', 1),
(12, '2018_05_02_012351_create_methods_table', 1),
(13, '2018_05_02_012351_create_objectives_table', 1),
(14, '2018_05_02_012352_create_admins_table', 1),
(15, '2018_05_02_012352_create_anomalies_table', 1),
(16, '2018_05_02_012352_create_assignments_table', 1),
(17, '2018_05_02_012352_create_child_organization_table', 1),
(18, '2018_05_02_012352_create_dates_table', 1),
(19, '2018_05_02_012352_create_enrollments_table', 1),
(20, '2018_05_02_012352_create_exercise_objective_table', 1),
(21, '2018_05_02_012352_create_levels_table', 1),
(22, '2018_05_02_012352_create_organization_user_table', 1),
(23, '2018_05_02_012352_create_organizations_table', 1),
(24, '2018_05_07_203505_create_age_exercise_table', 1),
(25, '2018_05_07_203515_create_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Structure de la table `objectives`
--

CREATE TABLE `objectives` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `description`, `phone`, `email`, `address`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Taha Nedved', 'hello world', '645295516', 'user1@user1.com', 'Boulevard Yacoub El mansour 278 Bis\r\nC.I.L Square', 'taha-nedved-Ld22M', NULL, '2019-02-27 12:19:53', '2019-02-27 12:20:10');

-- --------------------------------------------------------

--
-- Structure de la table `organization_user`
--

CREATE TABLE `organization_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('parent','tuteur','organisme') COLLATE utf8_unicode_ci DEFAULT 'parent',
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `phone`, `adress`, `slug`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Taha Nedved', 'user1@user1.com', 'hjfkjdsfhsdkjhf', 'organisme', '645295516', 'Boulevard Yacoub El mansour 278 Bis\r\nC.I.L Square', 'taha-nedved-Ld22M', NULL, NULL, '2019-02-27 12:19:53', '2019-02-27 12:19:53'),
(2, 'parent', 'parent@gmail.com', 'parent', 'parent', '645287794', '278 bis vouldsjds dsjdqsld', 'parent-zzz', NULL, NULL, NULL, NULL),
(3, 'tutor', 'tutor@gmail.com', 'tutor', 'tuteur', '645296476', 'bdksj dsdshh dbds,ndq', 'slug-yyyy', NULL, NULL, NULL, NULL),
(4, 'mandyaye', 'Mom', 'female', 'parent', 'fallmom@gm', 'bakodo 23 dhihye', 'fallmoma-ssss', NULL, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_slug_unique` (`slug`),
  ADD KEY `admins_organization_id_foreign` (`organization_id`);

--
-- Index pour la table `ages`
--
ALTER TABLE `ages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ages_slug_unique` (`slug`);

--
-- Index pour la table `age_exercise`
--
ALTER TABLE `age_exercise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `age_exercise_slug_unique` (`slug`),
  ADD KEY `age_exercise_age_id_foreign` (`age_id`),
  ADD KEY `age_exercise_exercise_id_foreign` (`exercise_id`);

--
-- Index pour la table `anomalies`
--
ALTER TABLE `anomalies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anomalies_slug_unique` (`slug`),
  ADD KEY `anomalies_user_id_foreign` (`user_id`),
  ADD KEY `anomalies_app_id_foreign` (`app_id`);

--
-- Index pour la table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apps_slug_unique` (`slug`);

--
-- Index pour la table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assignments_app_id_user_id_child_id_organization_id_unique` (`app_id`,`user_id`,`child_id`,`organization_id`),
  ADD UNIQUE KEY `assignments_slug_unique` (`slug`),
  ADD KEY `assignments_user_id_foreign` (`user_id`),
  ADD KEY `assignments_organization_id_foreign` (`organization_id`),
  ADD KEY `assignments_child_id_foreign` (`child_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_method_id_foreign` (`method_id`);

--
-- Index pour la table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `children_slug_unique` (`slug`);

--
-- Index pour la table `child_organization`
--
ALTER TABLE `child_organization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `child_organization_slug_unique` (`slug`),
  ADD KEY `child_organization_child_id_foreign` (`child_id`),
  ADD KEY `child_organization_organization_id_foreign` (`organization_id`);

--
-- Index pour la table `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dates_slug_unique` (`slug`),
  ADD KEY `dates_anomaly_id_foreign` (`anomaly_id`);

--
-- Index pour la table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollments_app_id_user_id_child_id_unique` (`app_id`,`user_id`,`child_id`),
  ADD UNIQUE KEY `enrollments_slug_unique` (`slug`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`),
  ADD KEY `enrollments_child_id_foreign` (`child_id`);

--
-- Index pour la table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exercises_slug_unique` (`slug`),
  ADD KEY `exercises_category_id_foreign` (`category_id`),
  ADD KEY `exercises_goal_id_foreign` (`goal_id`);

--
-- Index pour la table `exercise_objective`
--
ALTER TABLE `exercise_objective`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exercise_objective_slug_unique` (`slug`),
  ADD KEY `exercise_objective_exercise_id_foreign` (`exercise_id`),
  ADD KEY `exercise_objective_objective_id_foreign` (`objective_id`);

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `games_unique_constraint` (`app_id`,`user_id`,`child_id`,`level_id`,`exercise_id`,`game_date_id`),
  ADD UNIQUE KEY `games_slug_unique` (`slug`),
  ADD KEY `games_user_id_foreign` (`user_id`),
  ADD KEY `games_child_id_foreign` (`child_id`),
  ADD KEY `games_exercise_id_foreign` (`exercise_id`),
  ADD KEY `games_level_id_foreign` (`level_id`),
  ADD KEY `games_game_date_id_foreign` (`game_date_id`);

--
-- Index pour la table `game_dates`
--
ALTER TABLE `game_dates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_dates_slug_unique` (`slug`);

--
-- Index pour la table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `goals_slug_unique` (`slug`);

--
-- Index pour la table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `levels_slug_unique` (`slug`);

--
-- Index pour la table `methods`
--
ALTER TABLE `methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `methods_slug_unique` (`slug`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `objectives_slug_unique` (`slug`);

--
-- Index pour la table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_slug_unique` (`slug`);

--
-- Index pour la table `organization_user`
--
ALTER TABLE `organization_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_user_slug_unique` (`slug`),
  ADD KEY `organization_user_organization_id_foreign` (`organization_id`),
  ADD KEY `organization_user_user_id_foreign` (`user_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD UNIQUE KEY `password_resets_slug_unique` (`slug`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ages`
--
ALTER TABLE `ages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `age_exercise`
--
ALTER TABLE `age_exercise`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `anomalies`
--
ALTER TABLE `anomalies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `children`
--
ALTER TABLE `children`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `child_organization`
--
ALTER TABLE `child_organization`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dates`
--
ALTER TABLE `dates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `exercise_objective`
--
ALTER TABLE `exercise_objective`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `game_dates`
--
ALTER TABLE `game_dates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `methods`
--
ALTER TABLE `methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `organization_user`
--
ALTER TABLE `organization_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `age_exercise`
--
ALTER TABLE `age_exercise`
  ADD CONSTRAINT `age_exercise_age_id_foreign` FOREIGN KEY (`age_id`) REFERENCES `ages` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `age_exercise_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `anomalies`
--
ALTER TABLE `anomalies`
  ADD CONSTRAINT `anomalies_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `anomalies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `assignments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `children` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `assignments_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `methods` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `child_organization`
--
ALTER TABLE `child_organization`
  ADD CONSTRAINT `child_organization_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `children` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `child_organization_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `dates`
--
ALTER TABLE `dates`
  ADD CONSTRAINT `dates_anomaly_id_foreign` FOREIGN KEY (`anomaly_id`) REFERENCES `anomalies` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `enrollments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `children` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `exercises_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `exercise_objective`
--
ALTER TABLE `exercise_objective`
  ADD CONSTRAINT `exercise_objective_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `exercise_objective_objective_id_foreign` FOREIGN KEY (`objective_id`) REFERENCES `objectives` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `games_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `children` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `games_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `games_game_date_id_foreign` FOREIGN KEY (`game_date_id`) REFERENCES `game_dates` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `games_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `games_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `organization_user`
--
ALTER TABLE `organization_user`
  ADD CONSTRAINT `organization_user_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
