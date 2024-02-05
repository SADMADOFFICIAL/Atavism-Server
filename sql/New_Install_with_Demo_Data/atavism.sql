-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 20 Gru 2023, 17:57
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
-- Baza danych: `atavism`
--
DROP DATABASE IF EXISTS `atavism`;
CREATE DATABASE IF NOT EXISTS `atavism` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `atavism`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `backdating_tables`
--

DROP TABLE IF EXISTS `backdating_tables`;
CREATE TABLE IF NOT EXISTS `backdating_tables` (
  `DBName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `TableName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `oid_manager_Type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `DisplayName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `custom_banned`
--

DROP TABLE IF EXISTS `custom_banned`;
CREATE TABLE IF NOT EXISTS `custom_banned` (
  `name` varchar(20) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `bannedby` varchar(20) DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `custom_profanity`
--

DROP TABLE IF EXISTS `custom_profanity`;
CREATE TABLE IF NOT EXISTS `custom_profanity` (
  `name` varchar(20) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `bannedby` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `history_objstore`
--

DROP TABLE IF EXISTS `history_objstore`;
CREATE TABLE IF NOT EXISTS `history_objstore` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `obj_id` bigint DEFAULT NULL,
  `namespace_int` tinyint DEFAULT NULL,
  `world_name` varchar(64) DEFAULT NULL,
  `locX` int DEFAULT NULL,
  `locY` int DEFAULT NULL,
  `locZ` int DEFAULT NULL,
  `instance` bigint DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `persistence_key` varchar(255) DEFAULT NULL,
  `data` longblob,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `metadata` (`metadata`),
  KEY `name` (`name`),
  KEY `persistence_key` (`persistence_key`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `namespaces`
--

DROP TABLE IF EXISTS `namespaces`;
CREATE TABLE IF NOT EXISTS `namespaces` (
  `namespace_string` varchar(64) NOT NULL,
  `namespace_int` tinyint NOT NULL,
  PRIMARY KEY (`namespace_string`),
  UNIQUE KEY `namespace_int` (`namespace_int`)
) ENGINE=InnoDB AVG_ROW_LENGTH=963 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `namespaces`
--

INSERT INTO `namespaces` (`namespace_string`, `namespace_int`) VALUES
('NS.transient', 1),
('NS.master', 2),
('NS.wmgr', 3),
('NS.combat', 4),
('NS.mob', 5),
('NS.inv', 6),
('NS.item', 7),
('NS.quest', 8),
('NS.playerqueststates', 9),
('NS.voice', 10),
('NS.wminstance', 11),
('NS.instance', 12),
('NS.trainer', 13),
('NS.classability', 14),
('NS.billing', 15),
('social', 16),
('NS.faction', 17),
('NS.combatinstance', 18),
('NS.mobserverinstance', 19);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `objstore`
--

DROP TABLE IF EXISTS `objstore`;
CREATE TABLE IF NOT EXISTS `objstore` (
  `obj_id` bigint NOT NULL,
  `namespace_int` tinyint NOT NULL,
  `world_name` varchar(64) DEFAULT NULL,
  `locX` decimal(65,2) DEFAULT NULL,
  `locY` decimal(65,2) DEFAULT NULL,
  `locZ` decimal(65,2) DEFAULT NULL,
  `instance` bigint DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `persistence_key` varchar(255) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`obj_id`,`namespace_int`),
  KEY `metadata` (`metadata`),
  KEY `name` (`name`),
  KEY `persistence_key` (`persistence_key`),
  KEY `type` (`type`),
  KEY `type_name` (`type`,`name`),
  KEY `world_name_instance_namespace_int` (`world_name`,`instance`,`namespace_int`),
  KEY `world_name_namespace_int_name` (`world_name`,`namespace_int`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `objstore`
--
DROP TRIGGER IF EXISTS `history_objstore_trigger`;
DELIMITER ;;
CREATE TRIGGER `history_objstore_trigger` BEFORE UPDATE ON `objstore` FOR EACH ROW BEGIN
  IF OLD.data != NEW.data THEN
    INSERT INTO history_objstore (obj_id,
    namespace_int,
    world_name,
    locX,
    locY,
    locZ,
    instance,
    metadata,
    type,
    name,
    persistence_key,
    data)
      VALUES (NEW.obj_id, NEW.namespace_int, NEW.world_name, NEW.locX, NEW.locY, NEW.locZ, NEW.instance, NEW.metadata, NEW.type, NEW.name, NEW.persistence_key, NEW.data);
  END IF;
END
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oid_manager`
--

DROP TABLE IF EXISTS `oid_manager`;
CREATE TABLE IF NOT EXISTS `oid_manager` (
  `token` int NOT NULL,
  `free_oid` bigint DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `oid_manager`
--

INSERT INTO `oid_manager` (`token`, `free_oid`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_character`
--

DROP TABLE IF EXISTS `player_character`;
CREATE TABLE IF NOT EXISTS `player_character` (
  `account_id` bigint DEFAULT NULL,
  `world_name` varchar(64) NOT NULL,
  `obj_id` bigint NOT NULL,
  `namespace_int` tinyint NOT NULL,
  KEY `player_character_ibfk_1` (`obj_id`,`namespace_int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_items`
--

DROP TABLE IF EXISTS `player_items`;
CREATE TABLE IF NOT EXISTS `player_items` (
  `obj_id` bigint NOT NULL,
  `templateID` int NOT NULL,
  `stackSize` int NOT NULL DEFAULT '1',
  `inv.backref` bigint NOT NULL,
  `persistenceFlag` tinyint NOT NULL,
  `item_equipInfo` varchar(20) DEFAULT NULL,
  `world_name` varchar(64) NOT NULL,
  `enchant_level` int NOT NULL DEFAULT '0',
  `durability` int NOT NULL,
  `boundPlayerOid` bigint NOT NULL DEFAULT '0',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`obj_id`,`world_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_item_sockets`
--

DROP TABLE IF EXISTS `player_item_sockets`;
CREATE TABLE IF NOT EXISTS `player_item_sockets` (
  `item_oid` bigint NOT NULL,
  `socket_item_id` bigint NOT NULL DEFAULT '0',
  `socket_id` smallint NOT NULL,
  `world_name` varchar(64) NOT NULL,
  PRIMARY KEY (`socket_id`,`world_name`,`item_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plugin_status`
--

DROP TABLE IF EXISTS `plugin_status`;
CREATE TABLE IF NOT EXISTS `plugin_status` (
  `world_name` varchar(64) NOT NULL,
  `agent_name` varchar(64) NOT NULL,
  `plugin_name` varchar(64) NOT NULL,
  `plugin_type` varchar(16) NOT NULL,
  `host_name` varchar(64) NOT NULL,
  `pid` int DEFAULT NULL,
  `run_id` bigint DEFAULT NULL,
  `percent_cpu_load` int DEFAULT NULL,
  `last_update_time` bigint DEFAULT NULL,
  `next_update_time` bigint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  KEY `agent_name` (`agent_name`) USING BTREE,
  KEY `plugin_name` (`plugin_name`),
  KEY `world_name` (`world_name`) USING BTREE
) ENGINE=MEMORY AVG_ROW_LENGTH=2388 DEFAULT CHARSET=utf8mb3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `player_character`
--
ALTER TABLE `player_character`
  ADD CONSTRAINT `player_character_ibfk_1` FOREIGN KEY (`obj_id`,`namespace_int`) REFERENCES `objstore` (`obj_id`, `namespace_int`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
