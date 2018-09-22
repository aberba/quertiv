-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 22, 2018 at 08:13 PM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quertiv`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(2) UNSIGNED NOT NULL,
  `category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `category_banner` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_published` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `category_banner`, `is_published`) VALUES
(1, 'Landscaping', 'The beauty of designing a convenient and attractive eenvironment', '', '1'),
(2, 'Makeup', 'Beautiful makeups that bring the inner beauty out of people', '', '1'),
(3, 'Craft', 'All craft work from leather to crochet needle.', '', '1'),
(4, 'Digital Art', 'Art done on an electronic device to make work nice.', '', '1'),
(5, 'Photography', 'Explore the beauty of amazing photographs from ', '', '1'),
(6, 'Sculptures', 'Explore figures, designs or models of real-world objects.', '', '1'),
(7, 'Cusine', 'Delicious meals with unique take.', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `category_follows`
--

CREATE TABLE `category_follows` (
  `category_follow_id` int(15) UNSIGNED NOT NULL,
  `user_id_fk` int(15) UNSIGNED NOT NULL,
  `category_id_fk` int(15) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_follows`
--

INSERT INTO `category_follows` (`category_follow_id`, `user_id_fk`, `category_id_fk`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(4) UNSIGNED NOT NULL,
  `country_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_published` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `is_published`) VALUES
(1, '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(15) UNSIGNED NOT NULL,
  `user_id_fk` int(15) UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `logged_in_on` int(15) UNSIGNED NOT NULL,
  `cookie_verify_token` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `cookie_token_changed_on` int(15) UNSIGNED NOT NULL,
  `account_verify_token` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password_verify_token` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_blocked` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `user_id_fk`, `email`, `password`, `logged_in_on`, `cookie_verify_token`, `cookie_token_changed_on`, `account_verify_token`, `password_verify_token`, `is_blocked`) VALUES
(1, 1, 'karabutaworld@gmail.com', 'test', 0, '', 0, '', '', '0'),
(2, 2, 'exmaple@mail.com', '', 0, '', 0, '', '', '0'),
(3, 3, 'user@gmail.com', 'quertiv.COM1', 0, '', 0, 'xxxaccountxxx', '', '0'),
(4, 4, 'user2@gmail.com', 'quertiv.COM1', 0, '', 0, 'xxxaccountxxx', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(15) UNSIGNED NOT NULL,
  `tiv_id_fk` int(15) UNSIGNED NOT NULL,
  `media_file_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_5` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_1_caption` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_2_caption` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_3_caption` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_4_caption` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_5_caption` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `tiv_id_fk`, `media_file_1`, `media_file_2`, `media_file_3`, `media_file_4`, `media_file_5`, `media_file_1_caption`, `media_file_2_caption`, `media_file_3_caption`, `media_file_4_caption`, `media_file_5_caption`) VALUES
(5, 1, 'media1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 'media2.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 'media3.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 4, 'media4.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 5, 'media5.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(3) UNSIGNED NOT NULL,
  `category_id_fk` int(2) UNSIGNED NOT NULL,
  `skill_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_published` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `category_id_fk`, `skill_name`, `is_published`) VALUES
(1, 1, 'Digital Art', '0'),
(2, 1, 'Computer Programming', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(3) UNSIGNED NOT NULL,
  `category_id_fk` int(2) UNSIGNED NOT NULL,
  `tag_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `is_published` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tivs`
--

CREATE TABLE `tivs` (
  `tiv_id` int(15) UNSIGNED NOT NULL,
  `user_id_fk` int(15) UNSIGNED NOT NULL,
  `category_id_fk` int(2) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `published` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `is_blocked` set('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `added_on` int(15) UNSIGNED NOT NULL,
  `updated_on` int(15) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tivs`
--

INSERT INTO `tivs` (`tiv_id`, `user_id_fk`, `category_id_fk`, `title`, `description`, `published`, `is_blocked`, `added_on`, `updated_on`) VALUES
(1, 1, 6, 'Sculpturing the statue of Godam Mahasmatta with white clay and limestone', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '1', '0', 1, 1),
(2, 1, 7, 'Best artwork of the year', 'descrition here for tiv', '1', '0', 2, 2),
(3, 1, 1, 'Bumper harvest from mechanized agriculture', 'Best artwork of the year', '1', '0', 3, 2),
(4, 1, 4, 'Panic web app UI remake', 'Best artwork of the year', '1', '0', 0, 0),
(5, 1, 3, 'Best of all the arts', 'bases for end', '1', '0', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tiv_tags`
--

CREATE TABLE `tiv_tags` (
  `tiv_tag_id` int(15) UNSIGNED NOT NULL,
  `tiv_id_fk` int(15) UNSIGNED NOT NULL,
  `tag_id_fk` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(15) UNSIGNED NOT NULL,
  `skill_id_fk` int(3) UNSIGNED NOT NULL,
  `country_id_fk` int(4) UNSIGNED NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` set('M','F') COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` tinytext COLLATE utf8_unicode_ci,
  `website_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_cordinates` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `skill_id_fk`, `country_id_fk`, `full_name`, `gender`, `avatar`, `phone_number`, `bio`, `website_url`, `location`, `location_cordinates`) VALUES
(1, 2, 1, 'Lawrence Aberba', 'M', 'avatar.jpg', '050xxxxxx', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis', 'https://aberba.github.io/portfolio', 'Sunyani', '222,3333'),
(2, 1, 1, 'Genesis', 'M', '', '', '', '', 'Sunyani', ''),
(3, 1, 1, 'John Doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 1, 'John Doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_follows`
--

CREATE TABLE `user_follows` (
  `tiv_follow_id` int(15) UNSIGNED NOT NULL,
  `user_main_id_fk` int(15) UNSIGNED NOT NULL,
  `user_follower_id_fk` int(15) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_follows`
--

INSERT INTO `user_follows` (`tiv_follow_id`, `user_main_id_fk`, `user_follower_id_fk`) VALUES
(1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`category_name`);

--
-- Indexes for table `category_follows`
--
ALTER TABLE `category_follows`
  ADD PRIMARY KEY (`category_follow_id`),
  ADD KEY `user_id_fk` (`user_id_fk`,`category_id_fk`),
  ADD KEY `category_id_fk` (`category_id_fk`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country_name` (`country_name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_id_fk_2` (`user_id_fk`),
  ADD KEY `user_id_fk` (`user_id_fk`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD UNIQUE KEY `file_name` (`media_file_5`),
  ADD UNIQUE KEY `media_file_1` (`media_file_1`,`media_file_2`,`media_file_3`,`media_file_4`),
  ADD KEY `tiv_id_fk` (`tiv_id_fk`),
  ADD KEY `media_file_2` (`media_file_2`),
  ADD KEY `media_file_3` (`media_file_3`),
  ADD KEY `media_file_2_2` (`media_file_2`),
  ADD KEY `media_file_4` (`media_file_4`),
  ADD KEY `media_file_4_2` (`media_file_4`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `category_id_fk` (`category_id_fk`),
  ADD KEY `category_id_fk_2` (`category_id_fk`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `tag_name` (`tag_name`),
  ADD KEY `category_id_fk` (`category_id_fk`);

--
-- Indexes for table `tivs`
--
ALTER TABLE `tivs`
  ADD PRIMARY KEY (`tiv_id`),
  ADD KEY `user_id_fk` (`user_id_fk`,`category_id_fk`),
  ADD KEY `category_id_fk` (`category_id_fk`);

--
-- Indexes for table `tiv_tags`
--
ALTER TABLE `tiv_tags`
  ADD PRIMARY KEY (`tiv_tag_id`),
  ADD KEY `tiv_id_fk` (`tiv_id_fk`),
  ADD KEY `tag_id_fk` (`tag_id_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `skill_id_fk` (`skill_id_fk`),
  ADD KEY `country_id_fk` (`country_id_fk`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD PRIMARY KEY (`tiv_follow_id`),
  ADD KEY `user_main_id_fk` (`user_main_id_fk`,`user_follower_id_fk`),
  ADD KEY `user_follower_id_fk` (`user_follower_id_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `category_follows`
--
ALTER TABLE `category_follows`
  MODIFY `category_follow_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tivs`
--
ALTER TABLE `tivs`
  MODIFY `tiv_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tiv_tags`
--
ALTER TABLE `tiv_tags`
  MODIFY `tiv_tag_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_follows`
--
ALTER TABLE `user_follows`
  MODIFY `tiv_follow_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_follows`
--
ALTER TABLE `category_follows`
  ADD CONSTRAINT `category_follows_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `category_follows_ibfk_2` FOREIGN KEY (`category_id_fk`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`tiv_id_fk`) REFERENCES `tivs` (`tiv_id`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`category_id_fk`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`category_id_fk`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `tivs`
--
ALTER TABLE `tivs`
  ADD CONSTRAINT `tivs_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tivs_ibfk_2` FOREIGN KEY (`category_id_fk`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `tiv_tags`
--
ALTER TABLE `tiv_tags`
  ADD CONSTRAINT `tiv_tags_ibfk_1` FOREIGN KEY (`tiv_id_fk`) REFERENCES `tivs` (`tiv_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tiv_tags_ibfk_2` FOREIGN KEY (`tag_id_fk`) REFERENCES `tags` (`tag_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`skill_id_fk`) REFERENCES `skills` (`skill_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`country_id_fk`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD CONSTRAINT `user_follows_ibfk_1` FOREIGN KEY (`user_main_id_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_follows_ibfk_2` FOREIGN KEY (`user_follower_id_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
