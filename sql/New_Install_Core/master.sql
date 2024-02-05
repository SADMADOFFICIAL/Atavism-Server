-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 20 Gru 2023, 17:24
-- Wersja serwera: 8.0.35-0ubuntu0.22.04.1
-- Wersja PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `x9core_master`
--
DROP DATABASE IF EXISTS `master`;
CREATE DATABASE IF NOT EXISTS `master` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `master`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(228) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `status` int DEFAULT '1',
  `birthdate` date DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `suspended` tinyint(1) DEFAULT NULL,
  `activation_key` varchar(32) DEFAULT NULL,
  `current_world_id` int NOT NULL DEFAULT '-1',
  `created_at` datetime DEFAULT NULL,
  `last_modified_at` datetime DEFAULT NULL,
  `coin_current` int NOT NULL DEFAULT '0',
  `coin_total` int NOT NULL DEFAULT '0',
  `external_id` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `username_2` (`username`),
  KEY `externalid` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_character`
--

DROP TABLE IF EXISTS `account_character`;
CREATE TABLE IF NOT EXISTS `account_character` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `character_id` bigint NOT NULL,
  `world_server_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_purchases`
--

DROP TABLE IF EXISTS `account_purchases`;
CREATE TABLE IF NOT EXISTS `account_purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `itemID` int DEFAULT NULL,
  `itemCount` int DEFAULT NULL,
  `itemPurchaseDate` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `itemClaimDate` timestamp NULL DEFAULT NULL,
  `itemClaims` text,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `account_purchases`
--
DROP TRIGGER IF EXISTS `account_purchases_trigger`;
DELIMITER ;;
CREATE TRIGGER `account_purchases_trigger` BEFORE UPDATE ON `account_purchases` FOR EACH ROW BEGIN
  SET NEW.itemClaimDate = CURRENT_TIMESTAMP;
END
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_setting`
--

DROP TABLE IF EXISTS `account_setting`;
CREATE TABLE IF NOT EXISTS `account_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `setting` varchar(45) NOT NULL,
  `settingValue` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bonuses`
--

DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE IF NOT EXISTS `bonuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_oid` bigint NOT NULL,
  `object` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `value` int NOT NULL,
  `valuep` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_oid` (`character_oid`,`object`,`code`),
  KEY `character_oid_2` (`character_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `developer`
--

DROP TABLE IF EXISTS `developer`;
CREATE TABLE IF NOT EXISTS `developer` (
  `dev_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `company` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `size` varchar(64) DEFAULT NULL,
  `skill` varchar(64) DEFAULT NULL,
  `prior` varchar(64) DEFAULT NULL,
  `genre` varchar(64) DEFAULT NULL,
  `idea` text,
  PRIMARY KEY (`dev_id`),
  UNIQUE KEY `email` (`email`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vip`
--

DROP TABLE IF EXISTS `vip`;
CREATE TABLE IF NOT EXISTS `vip` (
  `account_id` int NOT NULL,
  `character_oid` int NOT NULL,
  `world` varchar(20) NOT NULL,
  `vip_level` int NOT NULL,
  `vip_expire` bigint NOT NULL,
  `vip_points` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `world`
--

DROP TABLE IF EXISTS `world`;
CREATE TABLE IF NOT EXISTS `world` (
  `world_id` int NOT NULL AUTO_INCREMENT,
  `dev_id` int DEFAULT '-1',
  `world_name` varchar(64) DEFAULT NULL,
  `pretty_name` varchar(64) DEFAULT NULL,
  `description` text,
  `server_name` varchar(64) DEFAULT NULL,
  `server_ip` varchar(200) DEFAULT NULL,
  `server_port` int DEFAULT NULL,
  `public` int DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `patcher_URL` varchar(255) DEFAULT NULL,
  `media_URL` varchar(255) DEFAULT NULL,
  `logo_URL` varchar(255) DEFAULT NULL,
  `detail_URL` varchar(255) DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  `population` int NOT NULL DEFAULT '0',
  `max_population` int NOT NULL DEFAULT '100',
  `queue` int DEFAULT '0',
  `server_type` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `restriction_level` int NOT NULL DEFAULT '0',
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`world_id`),
  UNIQUE KEY `world_name` (`world_name`),
  KEY `world_name_2` (`world_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `world`
--

INSERT INTO `world` (`world_id`, `dev_id`, `world_name`, `pretty_name`, `description`, `server_name`, `server_ip`, `server_port`, `public`, `approved`, `patcher_URL`, `media_URL`, `logo_URL`, `detail_URL`, `display_order`, `population`, `max_population`, `queue`, `server_type`, `status`, `restriction_level`, `last_update`) VALUES
(1, -1, 'Local', NULL, NULL, 'local', '127.0.0.1', 5042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, NULL, 'Online', 0, '2023-12-18 20:59:01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
