-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 20 Gru 2023, 17:23
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
-- Baza danych: `admin`
--
DROP DATABASE IF EXISTS `admin`;
CREATE DATABASE IF NOT EXISTS `admin` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `admin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint NOT NULL,
  `username` varchar(228) DEFAULT NULL,
  `status` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `last_login` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `character_slots` int NOT NULL DEFAULT '10',
  `coin_current` int NOT NULL,
  `coin_total` int DEFAULT NULL,
  `coin_used` int NOT NULL DEFAULT '0',
  `islands_available` int NOT NULL DEFAULT '1',
  `last_logout` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_character`
--

DROP TABLE IF EXISTS `account_character`;
CREATE TABLE IF NOT EXISTS `account_character` (
  `characterId` bigint NOT NULL,
  `characterName` varchar(45) NOT NULL,
  `accountId` bigint NOT NULL,
  PRIMARY KEY (`characterId`)
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
  `itemPurchaseDate` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `itemClaims` text,
  `used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achivement_data`
--

DROP TABLE IF EXISTS `achivement_data`;
CREATE TABLE IF NOT EXISTS `achivement_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `playerOid` bigint NOT NULL,
  `type` int NOT NULL,
  `obj` varchar(200) NOT NULL,
  `rankingId` int NOT NULL,
  `achievementId` int NOT NULL,
  `acquired` tinyint(1) NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auction_house`
--

DROP TABLE IF EXISTS `auction_house`;
CREATE TABLE IF NOT EXISTS `auction_house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startbid` bigint NOT NULL,
  `currency_id` int NOT NULL,
  `expire_date` datetime NOT NULL,
  `auctioneer_oid` bigint NOT NULL,
  `owner_oid` bigint NOT NULL,
  `bidder_oid` bigint NOT NULL,
  `race_group_id` int NOT NULL,
  `bid` int NOT NULL,
  `buyout` bigint NOT NULL,
  `status` int NOT NULL,
  `mode` int NOT NULL,
  `item_oid` bigint NOT NULL,
  `item_count` int NOT NULL,
  `item_template_id` int NOT NULL,
  `item_enchant_level` int NOT NULL,
  `item_sockets_info` text NOT NULL,
  `world_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auction_house_ended`
--

DROP TABLE IF EXISTS `auction_house_ended`;
CREATE TABLE IF NOT EXISTS `auction_house_ended` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `startbid` int NOT NULL,
  `currency_id` int NOT NULL,
  `expire_date` datetime NOT NULL,
  `auctioneer_oid` bigint NOT NULL,
  `owner_oid` bigint NOT NULL,
  `bidder_oid` bigint NOT NULL,
  `race_group_id` int NOT NULL,
  `bid` int NOT NULL,
  `buyout` bigint NOT NULL,
  `status` int NOT NULL,
  `mode` int NOT NULL,
  `item_oid` bigint NOT NULL,
  `item_count` int NOT NULL,
  `item_template_id` int NOT NULL,
  `item_enchant_level` int NOT NULL,
  `item_sockets_info` text NOT NULL,
  `world_name` varchar(64) NOT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `auction_house_ended`
--
DROP TRIGGER IF EXISTS `history_auction_house_ended`;
DELIMITER ;;
CREATE TRIGGER `history_auction_house_ended` BEFORE UPDATE ON `auction_house_ended` FOR EACH ROW BEGIN
  IF NEW.status = 7 THEN
    INSERT INTO history_auction_house_ended (auction_id,
    startbid,
    currency_id,
    expire_date,
    auctioneer_oid,
    owner_oid,
    bidder_oid,
    race_group_id,
    bid,
    buyout,
    status,
    mode,
    item_oid,
    item_count,
    item_template_id,
    item_enchant_level,
    item_sockets_info,
    world_name,
    creationtimestamp,
    updatetimestamp)
      VALUES (NEW.id, NEW.startbid, NEW.currency_id, NEW.expire_date, NEW.auctioneer_oid, NEW.owner_oid, NEW.bidder_oid, NEW.race_group_id, NEW.bid, NEW.buyout, NEW.status, NEW.mode, NEW.item_oid, NEW.item_count, NEW.item_template_id, NEW.item_enchant_level, NEW.item_sockets_info, NEW.world_name, NEW.creationtimestamp, NEW.updatetimestamp);
  END IF;
END
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_block_list`
--

DROP TABLE IF EXISTS `character_block_list`;
CREATE TABLE IF NOT EXISTS `character_block_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `block_player_id` bigint NOT NULL,
  `friend_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `block_player_id` (`block_player_id`),
  KEY `character_id` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_friends`
--

DROP TABLE IF EXISTS `character_friends`;
CREATE TABLE IF NOT EXISTS `character_friends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `friend_id` bigint NOT NULL,
  `friend_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  KEY `friend_id` (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_mail`
--

DROP TABLE IF EXISTS `character_mail`;
CREATE TABLE IF NOT EXISTS `character_mail` (
  `mailId` int NOT NULL AUTO_INCREMENT,
  `mailArchive` tinyint(1) NOT NULL,
  `isAccountMail` tinyint(1) NOT NULL DEFAULT '0',
  `recipientId` bigint NOT NULL,
  `recipientName` varchar(255) DEFAULT NULL,
  `senderId` bigint NOT NULL,
  `senderName` varchar(255) DEFAULT NULL,
  `mailRead` tinyint(1) NOT NULL,
  `mailSubject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mailMessage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `currencyType` int DEFAULT NULL,
  `currencyAmount` bigint DEFAULT NULL,
  `currencyTaken` tinyint(1) DEFAULT '0',
  `CoD` tinyint(1) NOT NULL DEFAULT '0',
  `mailAttachmentItemId1Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId1` bigint DEFAULT NULL,
  `mailAttachmentItemId2Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId2` bigint DEFAULT NULL,
  `mailAttachmentItemId3Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId3` bigint DEFAULT NULL,
  `mailAttachmentItemId4Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId4` bigint DEFAULT NULL,
  `mailAttachmentItemId5Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId5` bigint DEFAULT NULL,
  `mailAttachmentItemId6Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId6` bigint DEFAULT NULL,
  `mailAttachmentItemId7Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId7` bigint DEFAULT NULL,
  `mailAttachmentItemId8Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId8` bigint DEFAULT NULL,
  `mailAttachmentItemId9Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId9` bigint DEFAULT NULL,
  `mailAttachmentItemId10Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId10` bigint DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `dateUpdated` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mailId`),
  KEY `expiry` (`expiry`),
  KEY `isAccountMail` (`isAccountMail`),
  KEY `isAccountMail_recipientId_mailArchive` (`isAccountMail`,`recipientId`,`mailArchive`),
  KEY `mailArchive` (`mailArchive`),
  KEY `recipientId` (`recipientId`),
  KEY `recipientId_mailArchive_expiry` (`recipientId`,`mailArchive`,`expiry`),
  KEY `senderId` (`senderId`),
  KEY `senderId_mailArchive_expiry` (`senderId`,`mailArchive`,`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `character_mail`
--
DROP TRIGGER IF EXISTS `history_character_mail_trigger`;
DELIMITER ;;
CREATE TRIGGER `history_character_mail_trigger` BEFORE UPDATE ON `character_mail` FOR EACH ROW BEGIN
  IF NEW.mailArchive = 1 THEN
    INSERT INTO history_character_mail (mailId,
    mailArchive,
    isAccountMail,
    recipientId,
    recipientName,
    senderId,
    senderName,
    mailRead,
    mailSubject,
    mailMessage,
    currencyType,
    currencyAmount,
    currencyTaken,
    CoD,
    mailAttachmentItemId1Taken,
    mailAttachmentItemId1,
    mailAttachmentItemId2Taken,
    mailAttachmentItemId2,
    mailAttachmentItemId3Taken,
    mailAttachmentItemId3,
    mailAttachmentItemId4Taken,
    mailAttachmentItemId4,
    mailAttachmentItemId5Taken,
    mailAttachmentItemId5,
    mailAttachmentItemId6Taken,
    mailAttachmentItemId6,
    mailAttachmentItemId7Taken,
    mailAttachmentItemId7,
    mailAttachmentItemId8Taken,
    mailAttachmentItemId8,
    mailAttachmentItemId9Taken,
    mailAttachmentItemId9,
    mailAttachmentItemId10Taken,
    mailAttachmentItemId10,
    expiry,
    dateCreated,
    dateUpdated)
      VALUES (NEW.mailId, NEW.mailArchive, NEW.isAccountMail, NEW.recipientId, NEW.recipientName, NEW.senderId, NEW.senderName, NEW.mailRead, NEW.mailSubject, NEW.mailMessage, NEW.currencyType, NEW.currencyAmount, NEW.currencyTaken, NEW.CoD, NEW.mailAttachmentItemId1Taken, NEW.mailAttachmentItemId1, NEW.mailAttachmentItemId2Taken, NEW.mailAttachmentItemId2, NEW.mailAttachmentItemId3Taken, NEW.mailAttachmentItemId3, NEW.mailAttachmentItemId4Taken, NEW.mailAttachmentItemId4, NEW.mailAttachmentItemId5Taken, NEW.mailAttachmentItemId5, NEW.mailAttachmentItemId6Taken, NEW.mailAttachmentItemId6, NEW.mailAttachmentItemId7Taken, NEW.mailAttachmentItemId7, NEW.mailAttachmentItemId8Taken, NEW.mailAttachmentItemId8, NEW.mailAttachmentItemId9Taken, NEW.mailAttachmentItemId9, NEW.mailAttachmentItemId10Taken, NEW.mailAttachmentItemId10, NEW.expiry, NEW.dateCreated, NEW.dateUpdated);
  END IF;
END
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_purchases`
--

DROP TABLE IF EXISTS `character_purchases`;
CREATE TABLE IF NOT EXISTS `character_purchases` (
  `character_id` bigint NOT NULL,
  `itemID` int DEFAULT NULL,
  `itemPurchaseDate` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `id` int NOT NULL AUTO_INCREMENT,
  `used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `chat_logs`
--

DROP TABLE IF EXISTS `chat_logs`;
CREATE TABLE IF NOT EXISTS `chat_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `world` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source` bigint NOT NULL,
  `target` bigint NOT NULL,
  `channel` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=124 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim`
--

DROP TABLE IF EXISTS `claim`;
CREATE TABLE IF NOT EXISTS `claim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `instance` int NOT NULL DEFAULT '-1',
  `instanceOwner` bigint NOT NULL DEFAULT '0',
  `instanceGuild` bigint NOT NULL DEFAULT '-1',
  `locX` float NOT NULL,
  `locY` float NOT NULL,
  `locZ` float NOT NULL,
  `claimType` int NOT NULL DEFAULT '0',
  `owner` bigint DEFAULT NULL,
  `size` int DEFAULT '30',
  `sizeZ` int DEFAULT '30',
  `sizeY` int DEFAULT '30',
  `forSale` tinyint(1) DEFAULT '0',
  `sellerName` varchar(45) DEFAULT NULL,
  `cost` bigint DEFAULT '0',
  `currency` int DEFAULT '1',
  `purchaseItemReq` varchar(45) DEFAULT '',
  `taxPaidUntil` timestamp NULL DEFAULT NULL,
  `claimItemTemplate` int DEFAULT '-1',
  `bondItemTemplate` int DEFAULT '-1',
  `bondPaidUntil` timestamp NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `upgrade` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '-1',
  `permanent` tinyint(1) NOT NULL DEFAULT '0',
  `org_cost` bigint NOT NULL,
  `org_currency` int NOT NULL,
  `object_limit_profile` int NOT NULL DEFAULT '-1',
  `taxCurrency` int NOT NULL DEFAULT '-1',
  `taxAmount` bigint NOT NULL DEFAULT '0',
  `taxInterval` bigint NOT NULL DEFAULT '0',
  `taxPeriodPay` bigint NOT NULL DEFAULT '0',
  `taxPeriodSell` bigint NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `claim`
--

INSERT INTO `claim` (`id`, `name`, `instance`, `instanceOwner`, `instanceGuild`, `locX`, `locY`, `locZ`, `claimType`, `owner`, `size`, `sizeZ`, `sizeY`, `forSale`, `sellerName`, `cost`, `currency`, `purchaseItemReq`, `taxPaidUntil`, `claimItemTemplate`, `bondItemTemplate`, `bondPaidUntil`, `priority`, `upgrade`, `parent`, `permanent`, `org_cost`, `org_currency`, `object_limit_profile`, `taxCurrency`, `taxAmount`, `taxInterval`, `taxPeriodPay`, `taxPeriodSell`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(21, 'AtavismBuildingAreaMW', 29, 0, -1, -128.98, 64.12, 143.01, 401, -1, 10, 10, 30, 1, '', 1, 2, '', NULL, -1, -1, NULL, 1, 0, -1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-06-26 13:48:36');

--
-- Wyzwalacze `claim`
--
DROP TRIGGER IF EXISTS `claim_trigger`;
DELIMITER ;;
CREATE TRIGGER `claim_trigger` BEFORE UPDATE ON `claim` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim_action`
--

DROP TABLE IF EXISTS `claim_action`;
CREATE TABLE IF NOT EXISTS `claim_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `claimID` int DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `brushType` varchar(45) NOT NULL,
  `locX` float NOT NULL,
  `locY` float NOT NULL,
  `locZ` float NOT NULL,
  `material` smallint NOT NULL,
  `normalX` float NOT NULL,
  `normalY` float NOT NULL,
  `normalZ` float NOT NULL,
  `sizeX` float NOT NULL,
  `sizeY` float NOT NULL,
  `sizeZ` float NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `claim_action`
--
DROP TRIGGER IF EXISTS `claim_action_trigger`;
DELIMITER ;;
CREATE TRIGGER `claim_action_trigger` BEFORE UPDATE ON `claim_action` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim_object`
--

DROP TABLE IF EXISTS `claim_object`;
CREATE TABLE IF NOT EXISTS `claim_object` (
  `id` int NOT NULL AUTO_INCREMENT,
  `claimID` int DEFAULT NULL,
  `template` int DEFAULT NULL,
  `stage` int NOT NULL DEFAULT '0',
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int DEFAULT '-1',
  `parents` varchar(256) NOT NULL DEFAULT '',
  `gameObject` varchar(256) DEFAULT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `orientX` float DEFAULT NULL,
  `orientY` float DEFAULT NULL,
  `orientZ` float DEFAULT NULL,
  `orientW` float DEFAULT NULL,
  `itemID` int DEFAULT NULL,
  `objectState` varchar(64) DEFAULT NULL,
  `health` int DEFAULT '1',
  `maxHealth` int DEFAULT '1',
  `item1` int DEFAULT '-1',
  `item1Count` int DEFAULT '0',
  `item2` int DEFAULT '-1',
  `item2Count` int DEFAULT '0',
  `item3` int DEFAULT '-1',
  `item3Count` int DEFAULT '0',
  `item4` int DEFAULT '-1',
  `item4Count` int DEFAULT '0',
  `item5` int DEFAULT '-1',
  `item5Count` int DEFAULT '0',
  `item6` int DEFAULT '-1',
  `item6Count` int DEFAULT '0',
  `lockTemplateID` int DEFAULT '-1',
  `lockDurability` int DEFAULT '0',
  `start_build_time` bigint NOT NULL DEFAULT '0',
  `progress` int NOT NULL DEFAULT '0',
  `taskCurrentTime` bigint NOT NULL DEFAULT '0',
  `taskLastTimeUpdate` bigint NOT NULL DEFAULT '0',
  `ownerStat` int NOT NULL DEFAULT '0',
  `taskPlayerOid` bigint NOT NULL DEFAULT '0',
  `finalStage` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `claim_object`
--
DROP TRIGGER IF EXISTS `claim_object_trigger`;
DELIMITER ;;
CREATE TRIGGER `claim_object_trigger` BEFORE UPDATE ON `claim_object` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim_permission`
--

DROP TABLE IF EXISTS `claim_permission`;
CREATE TABLE IF NOT EXISTS `claim_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `claimID` int NOT NULL,
  `playerOid` bigint DEFAULT NULL,
  `playerName` varchar(45) DEFAULT NULL,
  `permissionLevel` int DEFAULT NULL,
  `dateGiven` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `claim_permission`
--
DROP TRIGGER IF EXISTS `claim_permission_trigger`;
DELIMITER ;;
CREATE TRIGGER `claim_permission_trigger` BEFORE UPDATE ON `claim_permission` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim_resource`
--

DROP TABLE IF EXISTS `claim_resource`;
CREATE TABLE IF NOT EXISTS `claim_resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `claimID` int NOT NULL,
  `itemID` int NOT NULL,
  `count` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim_upgrade`
--

DROP TABLE IF EXISTS `claim_upgrade`;
CREATE TABLE IF NOT EXISTS `claim_upgrade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `claimID` int NOT NULL,
  `locX` float NOT NULL,
  `locY` float NOT NULL,
  `locZ` float NOT NULL,
  `sizeX` int DEFAULT '30',
  `sizeZ` int DEFAULT '30',
  `sizeY` int DEFAULT '30',
  `cost` bigint DEFAULT '0',
  `currency` int DEFAULT '1',
  `purchaseItemReq` varchar(45) DEFAULT '',
  `object_limit_profile` int NOT NULL,
  `taxCurrency` int NOT NULL,
  `taxAmount` bigint NOT NULL,
  `taxInterval` bigint NOT NULL,
  `taxPeriodPay` bigint NOT NULL,
  `taxPeriodSell` bigint NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cooldowns`
--

DROP TABLE IF EXISTS `cooldowns`;
CREATE TABLE IF NOT EXISTS `cooldowns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) NOT NULL,
  `duration` int NOT NULL,
  `startTime` bigint NOT NULL,
  `obj_oid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_oid` (`obj_oid`)
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data_logs`
--

DROP TABLE IF EXISTS `data_logs`;
CREATE TABLE IF NOT EXISTS `data_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `world_name` varchar(64) NOT NULL,
  `data_name` varchar(64) NOT NULL,
  `data_timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `source_oid` bigint NOT NULL,
  `target_oid` bigint NOT NULL DEFAULT '0',
  `account_id` bigint NOT NULL DEFAULT '0',
  `additional_data` text,
  `process_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild`
--

DROP TABLE IF EXISTS `guild`;
CREATE TABLE IF NOT EXISTS `guild` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `faction` int NOT NULL,
  `motd` varchar(256) NOT NULL,
  `omotd` varchar(256) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `level` smallint NOT NULL DEFAULT '1',
  `warehouse` bigint NOT NULL DEFAULT '0',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_level_resources`
--

DROP TABLE IF EXISTS `guild_level_resources`;
CREATE TABLE IF NOT EXISTS `guild_level_resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guild_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_member`
--

DROP TABLE IF EXISTS `guild_member`;
CREATE TABLE IF NOT EXISTS `guild_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guildID` int NOT NULL,
  `memberOid` bigint NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `guildRank` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_rank`
--

DROP TABLE IF EXISTS `guild_rank`;
CREATE TABLE IF NOT EXISTS `guild_rank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guildID` int NOT NULL,
  `guildRank` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `permissions` varchar(256) NOT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `history_auction_house_ended`
--

DROP TABLE IF EXISTS `history_auction_house_ended`;
CREATE TABLE IF NOT EXISTS `history_auction_house_ended` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auction_id` bigint NOT NULL,
  `startbid` int NOT NULL,
  `currency_id` int NOT NULL,
  `expire_date` datetime NOT NULL,
  `auctioneer_oid` bigint NOT NULL,
  `owner_oid` bigint NOT NULL,
  `bidder_oid` bigint NOT NULL,
  `race_group_id` int NOT NULL,
  `bid` int NOT NULL,
  `buyout` bigint NOT NULL,
  `status` int NOT NULL,
  `mode` int NOT NULL,
  `item_oid` bigint NOT NULL,
  `item_count` int NOT NULL,
  `item_template_id` int NOT NULL,
  `item_enchant_level` int NOT NULL,
  `item_sockets_info` text NOT NULL,
  `world_name` varchar(64) NOT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `history_auction_house_ended`
--
DROP TRIGGER IF EXISTS `history_auction_house_ended_trigger`;
DELIMITER ;;
CREATE TRIGGER `history_auction_house_ended_trigger` BEFORE UPDATE ON `history_auction_house_ended` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `history_character_mail`
--

DROP TABLE IF EXISTS `history_character_mail`;
CREATE TABLE IF NOT EXISTS `history_character_mail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mailId` int NOT NULL,
  `mailArchive` tinyint(1) NOT NULL,
  `isAccountMail` tinyint(1) NOT NULL DEFAULT '0',
  `recipientId` bigint NOT NULL,
  `recipientName` varchar(255) DEFAULT NULL,
  `senderId` bigint NOT NULL,
  `senderName` varchar(255) DEFAULT NULL,
  `mailRead` tinyint(1) NOT NULL,
  `mailSubject` varchar(255) NOT NULL,
  `mailMessage` text NOT NULL,
  `currencyType` int DEFAULT NULL,
  `currencyAmount` int DEFAULT NULL,
  `currencyTaken` tinyint(1) DEFAULT '0',
  `CoD` tinyint(1) NOT NULL DEFAULT '0',
  `mailAttachmentItemId1Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId1` bigint DEFAULT NULL,
  `mailAttachmentItemId2Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId2` bigint DEFAULT NULL,
  `mailAttachmentItemId3Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId3` bigint DEFAULT NULL,
  `mailAttachmentItemId4Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId4` bigint DEFAULT NULL,
  `mailAttachmentItemId5Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId5` bigint DEFAULT NULL,
  `mailAttachmentItemId6Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId6` bigint DEFAULT NULL,
  `mailAttachmentItemId7Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId7` bigint DEFAULT NULL,
  `mailAttachmentItemId8Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId8` bigint DEFAULT NULL,
  `mailAttachmentItemId9Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId9` bigint DEFAULT NULL,
  `mailAttachmentItemId10Taken` tinyint(1) DEFAULT NULL,
  `mailAttachmentItemId10` bigint DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `dateUpdated` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
CREATE TABLE IF NOT EXISTS `instance_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `island_name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  `administrator` int NOT NULL,
  `category` int NOT NULL,
  `status` varchar(32) NOT NULL,
  `subscription` datetime DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(64) NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `islandType` int NOT NULL DEFAULT '0',
  `globalWaterHeight` float NOT NULL DEFAULT '0',
  `createOnStartup` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(64) NOT NULL,
  `recommendedLevel` int NOT NULL,
  `description` text NOT NULL,
  `size` int NOT NULL,
  `populationLimit` int NOT NULL DEFAULT '-1',
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `island_name` (`island_name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `instance_template`
--

INSERT INTO `instance_template` (`id`, `island_name`, `template`, `administrator`, `category`, `status`, `subscription`, `public`, `password`, `rating`, `islandType`, `globalWaterHeight`, `createOnStartup`, `style`, `recommendedLevel`, `description`, `size`, `populationLimit`, `lastUpdate`, `dateCreated`) VALUES
(29, 'MainWorld', '', 1, 1, 'Active', NULL, 1, '', 0, 0, 51, 1, '', 0, '', -1, -1, '2022-10-13 11:29:28', '2000-01-01 00:00:00'),
(39, 'InstanceSinglePlayer', '', 1, 1, 'Active', NULL, 1, '', 0, 1, -200, 1, '', 0, '', -1, 1, '2018-01-12 14:51:34', '2000-01-01 00:00:00'),
(40, 'InstanceGroup', '', 1, 1, 'Active', NULL, 1, '', 0, 2, -200, 1, '', 0, '', -1, 4, '2018-01-12 14:51:59', '2000-01-01 00:00:00'),
(41, 'Arena1v1', '', 1, 1, 'Active', NULL, 1, '', 0, 4, -200, 1, '', 0, '', -1, -1, '2018-01-12 14:53:09', '2000-01-01 00:00:00'),
(42, 'Arena2v2', '', 1, 1, 'Active', NULL, 1, '', 0, 4, -200, 1, '', 0, '', -1, -1, '2018-01-12 14:53:30', '2000-01-01 00:00:00'),
(43, 'SinglePlayerPrivate', '', 0, 1, 'Active', NULL, 1, '', 0, 3, -200, 1, '', 0, '', -1, -1, '2018-03-20 00:14:05', '2000-01-01 00:00:00'),
(44, 'GuildPrivate', '', 0, 1, 'Active', NULL, 1, '', 0, 5, -200, 0, '', 0, '', -1, -1, '2018-03-20 15:13:03', '2000-01-01 00:00:00'),
(45, 'Click2MoveWorld', '', 0, 1, 'Active', NULL, 1, '', 0, 0, -100, 1, '', 0, '', -1, -1, '2021-09-16 00:01:02', '2021-09-16 00:01:02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `island_developers`
--

DROP TABLE IF EXISTS `island_developers`;
CREATE TABLE IF NOT EXISTS `island_developers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `island` int NOT NULL,
  `developer` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `island_friends`
--

DROP TABLE IF EXISTS `island_friends`;
CREATE TABLE IF NOT EXISTS `island_friends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `island` int NOT NULL,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `island_portals`
--

DROP TABLE IF EXISTS `island_portals`;
CREATE TABLE IF NOT EXISTS `island_portals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `island` int NOT NULL,
  `portalType` int NOT NULL,
  `faction` int NOT NULL,
  `locX` decimal(65,2) NOT NULL,
  `locY` decimal(65,2) NOT NULL,
  `locZ` decimal(65,2) NOT NULL,
  `orientX` int NOT NULL,
  `orientY` int NOT NULL,
  `orientZ` int NOT NULL,
  `orientW` int NOT NULL,
  `displayID` int NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `gameObject` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `island_portals`
--

INSERT INTO `island_portals` (`id`, `island`, `portalType`, `faction`, `locX`, `locY`, `locZ`, `orientX`, `orientY`, `orientZ`, `orientW`, `displayID`, `name`, `gameObject`) VALUES
(7, 29, 0, 0, '-170.00', '74.00', '154.00', 0, 0, 0, 1, 0, 'spawn', ''),
(21, 39, 0, 0, '0.00', '0.00', '0.00', 0, 0, 0, 1, 0, 'spawn', NULL),
(22, 40, 0, 0, '0.00', '0.00', '0.00', 0, 0, 0, 1, 0, 'spawn', NULL),
(23, 41, 0, 0, '0.00', '0.00', '0.00', 0, 0, 0, 1, 0, 'spawn', NULL),
(24, 42, 0, 0, '0.00', '0.00', '0.00', 0, 0, 0, 1, 0, 'spawn', NULL),
(25, 43, 0, 0, '-170.00', '74.00', '154.00', 0, 0, 0, 1, 0, 'spawn', NULL),
(26, 44, 0, 0, '-170.00', '74.00', '154.00', 0, 0, 0, 1, 0, 'spawn', NULL),
(27, 45, 0, 0, '0.00', '1.00', '0.00', 0, 0, 0, 0, 0, 'spawn', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `memory_data_stats`
--

DROP TABLE IF EXISTS `memory_data_stats`;
CREATE TABLE IF NOT EXISTS `memory_data_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `value` bigint DEFAULT NULL,
  `world` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `memory_data_stats`
--

INSERT INTO `memory_data_stats` (`id`, `type`, `value`, `world`) VALUES
(1, 'mobs', 78, 'world'),
(2, 'instances', 2, 'world'),
(3, 'shops', 0, 'world'),
(4, 'players', 2, 'world');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_shop`
--

DROP TABLE IF EXISTS `player_shop`;
CREATE TABLE IF NOT EXISTS `player_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_oid` bigint NOT NULL,
  `player_oid` bigint NOT NULL,
  `tag` varchar(256) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `end_player_logout` tinyint(1) NOT NULL DEFAULT '1',
  `createtime` bigint NOT NULL DEFAULT '0',
  `timeout` int NOT NULL,
  `player` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_oid` (`player_oid`),
  KEY `shop_oid` (`shop_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_shop_items`
--

DROP TABLE IF EXISTS `player_shop_items`;
CREATE TABLE IF NOT EXISTS `player_shop_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_oid` bigint NOT NULL,
  `item_oid` bigint NOT NULL,
  `price` bigint NOT NULL,
  `currency` int NOT NULL,
  `template_id` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '0',
  `sell` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `shop_oid` (`shop_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rankings`
--

DROP TABLE IF EXISTS `rankings`;
CREATE TABLE IF NOT EXISTS `rankings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pos` int NOT NULL,
  `player` bigint NOT NULL,
  `ranking` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ranking_run`
--

DROP TABLE IF EXISTS `ranking_run`;
CREATE TABLE IF NOT EXISTS `ranking_run` (
  `world` varchar(50) NOT NULL,
  `last_run` bigint NOT NULL,
  PRIMARY KEY (`world`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `ranking_run`
--

INSERT INTO `ranking_run` (`world`, `last_run`) VALUES
('world', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server`
--

DROP TABLE IF EXISTS `server`;
CREATE TABLE IF NOT EXISTS `server` (
  `action` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MEMORY AVG_ROW_LENGTH=33 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_stats`
--

DROP TABLE IF EXISTS `server_stats`;
CREATE TABLE IF NOT EXISTS `server_stats` (
  `players_online` int NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `logins_since_restart` int NOT NULL DEFAULT '0',
  `last_restart` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`players_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_status`
--

DROP TABLE IF EXISTS `server_status`;
CREATE TABLE IF NOT EXISTS `server_status` (
  `server` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MEMORY AVG_ROW_LENGTH=33 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_version`
--

DROP TABLE IF EXISTS `server_version`;
CREATE TABLE IF NOT EXISTS `server_version` (
  `server_version` varchar(10) NOT NULL,
  `installation_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`server_version`)
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `server_version`
--

INSERT INTO `server_version` (`server_version`, `installation_type`) VALUES
('10.9.0', 'Core');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shopitems`
--

DROP TABLE IF EXISTS `shopitems`;
CREATE TABLE IF NOT EXISTS `shopitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `cost` int NOT NULL,
  `category` varchar(32) NOT NULL,
  `imageAddress` varchar(128) NOT NULL,
  `newItem` tinyint(1) DEFAULT NULL,
  `costImage` varchar(128) DEFAULT NULL,
  `buyImage` varchar(128) DEFAULT NULL,
  `purchaseType` varchar(32) DEFAULT NULL,
  `objectName` varchar(32) DEFAULT NULL,
  `purchaselimit` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shop_spawn_data`
--

DROP TABLE IF EXISTS `shop_spawn_data`;
CREATE TABLE IF NOT EXISTS `shop_spawn_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL DEFAULT '1',
  `name` varchar(64) NOT NULL,
  `mobTemplate` int NOT NULL DEFAULT '-1',
  `mobTemplate2` int NOT NULL DEFAULT '-1',
  `mobTemplate3` int NOT NULL DEFAULT '-1',
  `mobTemplate4` int NOT NULL DEFAULT '-1',
  `mobTemplate5` int NOT NULL DEFAULT '-1',
  `markerName` varchar(64) DEFAULT NULL,
  `locX` float(8,2) DEFAULT NULL,
  `locY` float(8,2) DEFAULT NULL,
  `locZ` float(8,2) DEFAULT NULL,
  `orientX` float(8,4) DEFAULT NULL,
  `orientY` float(8,4) DEFAULT NULL,
  `orientZ` float(8,4) DEFAULT NULL,
  `orientW` float(8,4) DEFAULT NULL,
  `instance` int DEFAULT NULL,
  `numSpawns` int DEFAULT NULL,
  `spawnRadius` int DEFAULT NULL,
  `respawnTime` int DEFAULT NULL,
  `respawnTimeMax` int DEFAULT NULL,
  `corpseDespawnTime` int DEFAULT NULL,
  `spawnActiveStartHour` int DEFAULT '-1',
  `spawnActiveEndHour` int DEFAULT '-1',
  `alternateSpawnMobTemplate` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate2` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate3` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate4` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate5` int NOT NULL DEFAULT '-1',
  `combat` tinyint(1) NOT NULL,
  `roamRadius` int NOT NULL,
  `startsQuests` varchar(256) NOT NULL,
  `endsQuests` varchar(256) NOT NULL,
  `startsDialogues` varchar(256) NOT NULL,
  `otherActions` varchar(256) NOT NULL,
  `baseAction` varchar(32) NOT NULL,
  `weaponSheathed` tinyint(1) NOT NULL,
  `merchantTable` int NOT NULL,
  `patrolPath` int NOT NULL DEFAULT '-1',
  `questOpenLootTable` int NOT NULL,
  `isChest` tinyint(1) NOT NULL DEFAULT '0',
  `pickupItem` int DEFAULT NULL,
  `shop_owner` bigint NOT NULL DEFAULT '0',
  `shop_oid` bigint NOT NULL DEFAULT '0',
  `shop_message` varchar(512) NOT NULL DEFAULT '',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `shop_oid` (`shop_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `templateportals`
--

DROP TABLE IF EXISTS `templateportals`;
CREATE TABLE IF NOT EXISTS `templateportals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `templateID` int NOT NULL,
  `portalType` int NOT NULL,
  `faction` int NOT NULL,
  `locX` int NOT NULL,
  `locY` int NOT NULL,
  `locZ` int NOT NULL,
  `displayID` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE IF NOT EXISTS `templates` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `world_time`
--

DROP TABLE IF EXISTS `world_time`;
CREATE TABLE IF NOT EXISTS `world_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `world_name` varchar(50) NOT NULL,
  `year` int NOT NULL DEFAULT '1',
  `month` int NOT NULL DEFAULT '1',
  `day` int NOT NULL DEFAULT '1',
  `hour` int NOT NULL DEFAULT '0',
  `minute` int NOT NULL DEFAULT '0',
  `second` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `world_name_2` (`world_name`),
  KEY `world_name` (`world_name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
