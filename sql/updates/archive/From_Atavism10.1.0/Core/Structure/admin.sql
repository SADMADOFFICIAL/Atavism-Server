-- 
-- Script date 28.08.2020 19:56:33
-- Source server version: 5.7.31
-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE `admin`;

--
-- Alter column `dateCreated` on table `history_character_mail`
--
ALTER TABLE history_character_mail 
  CHANGE COLUMN dateCreated dateCreated TIMESTAMP NOT NULL DEFAULT '2000-01-01 06:00:00';

--
-- Alter column `dateUpdated` on table `history_character_mail`
--
ALTER TABLE history_character_mail 
  CHANGE COLUMN dateUpdated dateUpdated TIMESTAMP NOT NULL DEFAULT '2000-01-01 06:00:00';

--
-- Alter column `mailSubject` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN mailSubject mailSubject VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

--
-- Alter column `mailMessage` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN mailMessage mailMessage TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

--
-- Alter column `dateCreated` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN dateCreated dateCreated TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `dateUpdated` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN dateUpdated dateUpdated TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP;

--
-- Alter column `last_login` on table `server_stats`
--
ALTER TABLE server_stats 
  CHANGE COLUMN last_login last_login TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `last_restart` on table `server_stats`
--
ALTER TABLE server_stats 
  CHANGE COLUMN last_restart last_restart TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `dateCreated` on table `instance_template`
--
ALTER TABLE instance_template 
  CHANGE COLUMN dateCreated dateCreated TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `buyout` on table `history_auction_house_ended`
--
ALTER TABLE history_auction_house_ended 
  CHANGE COLUMN buyout buyout BIGINT(20) NOT NULL;

--
-- Alter column `guildRank` on table `guild_rank`
--
ALTER TABLE guild_rank 
  CHANGE COLUMN rank guildRank INT(11) NOT NULL;

--
-- Alter column `guildRank` on table `guild_member`
--
ALTER TABLE guild_member 
  CHANGE COLUMN rank guildRank INT(11) DEFAULT NULL;

--
-- Alter column `data_timestamp` on table `data_logs`
--
ALTER TABLE data_logs 
  CHANGE COLUMN data_timestamp data_timestamp TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `message` on table `chat_logs`
--
ALTER TABLE chat_logs 
  CHANGE COLUMN message message TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

--
-- Alter column `itemPurchaseDate` on table `character_purchases`
--
ALTER TABLE character_purchases 
  CHANGE COLUMN itemPurchaseDate itemPurchaseDate TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `startbid` on table `auction_house`
--
ALTER TABLE auction_house 
  CHANGE COLUMN startbid startbid BIGINT(20) NOT NULL;

--
-- Alter column `itemPurchaseDate` on table `account_purchases`
--
ALTER TABLE account_purchases 
  CHANGE COLUMN itemPurchaseDate itemPurchaseDate TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `created` on table `account`
--
ALTER TABLE account 
  CHANGE COLUMN created created TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `last_login` on table `account`
--
ALTER TABLE account 
  CHANGE COLUMN last_login last_login TIMESTAMP NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Alter column `last_logout` on table `account`
--
ALTER TABLE account 
  CHANGE COLUMN last_logout last_logout TIMESTAMP NOT NULL DEFAULT '2014-01-01 00:00:00';

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;