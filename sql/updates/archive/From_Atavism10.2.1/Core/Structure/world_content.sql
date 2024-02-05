-- Script date 21.11.2020 17:16:20
-- Server version: 5.7.32

-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE `world_content`;

--
-- Create column `shop_owner` on table `spawn_data`
--
ALTER TABLE spawn_data 
  ADD COLUMN shop_owner BIGINT(20) NOT NULL DEFAULT 0;

--
-- Create column `shop_oid` on table `spawn_data`
--
ALTER TABLE spawn_data 
  ADD COLUMN shop_oid BIGINT(20) NOT NULL DEFAULT 0;

--
-- Change columns order on table `spawn_data`
--
ALTER TABLE spawn_data 
 MODIFY shop_owner BIGINT(20) NOT NULL DEFAULT 0 AFTER pickupItem;
ALTER TABLE spawn_data 
 MODIFY shop_oid BIGINT(20) NOT NULL DEFAULT 0 AFTER shop_owner;

--
-- Create column `shopSlots` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN shopSlots INT(11) NOT NULL DEFAULT 0;

--
-- Create column `shopModel` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN shopModel VARCHAR(256) NOT NULL DEFAULT '' COMMENT 'not use';

--
-- Create column `shopTag` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN shopTag VARCHAR(256) NOT NULL DEFAULT '';

--
-- Create column `numShops` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN numShops INT(11) NOT NULL DEFAULT 1;

--
-- Create column `shopDestroyOnLogOut` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN shopDestroyOnLogOut TINYINT(1) NOT NULL DEFAULT 1;

--
-- Create column `shopMobTemplate` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN shopMobTemplate INT(11) NOT NULL DEFAULT -1;

--
-- Create column `shopTimeOut` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN shopTimeOut INT(11) NOT NULL DEFAULT 0;

--
-- Alter column `socket_type` on table `item_templates`
--
ALTER TABLE item_templates 
  ALTER COLUMN socket_type SET DEFAULT '';

--
-- Change columns order on table `item_templates`
--
ALTER TABLE item_templates 
 MODIFY isactive TINYINT(1) DEFAULT 1 AFTER shopTimeOut;
ALTER TABLE item_templates 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;
ALTER TABLE item_templates 
 MODIFY updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00' AFTER creationtimestamp;

--
-- Create table `guild_level_settings`
--
CREATE TABLE guild_level_settings (
  id INT(11) NOT NULL AUTO_INCREMENT,
  level INT(11) NOT NULL,
  members_num INT(11) NOT NULL DEFAULT 1,
  merchant_table INT(11) NOT NULL DEFAULT -1,
  warehouse_num_slots INT(11) NOT NULL DEFAULT 1,
  isactive TINYINT(1) NOT NULL DEFAULT 1,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `level` on table `guild_level_settings`
--
ALTER TABLE guild_level_settings 
  ADD UNIQUE INDEX level(level);

--
-- Create table `guild_level_requirements`
--
CREATE TABLE guild_level_requirements (
  id INT(11) NOT NULL AUTO_INCREMENT,
  level INT(11) NOT NULL,
  item_id INT(11) NOT NULL,
  count INT(11) NOT NULL,
  isactive TINYINT(1) NOT NULL DEFAULT 1,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `level` on table `guild_level_requirements`
--
ALTER TABLE guild_level_requirements 
  ADD INDEX level(level);

--
-- Create column `deletable` on table `editor_option_choice`
--
ALTER TABLE editor_option_choice 
  ADD COLUMN deletable TINYINT(1) NOT NULL DEFAULT 0;

--
-- Change columns order on table `editor_option_choice`
--
ALTER TABLE editor_option_choice 
 MODIFY deletable TINYINT(1) NOT NULL DEFAULT 0 AFTER choice;

--
-- Create table `dialogue_actions_requirement`
--
CREATE TABLE dialogue_actions_requirement (
  id INT(11) NOT NULL AUTO_INCREMENT,
  dialogue_action_id INT(11) NOT NULL,
  editor_option_type_id INT(11) NOT NULL,
  editor_option_choice_type_id VARCHAR(45) NOT NULL,
  required_value INT(11) NOT NULL DEFAULT 1,
  isactive TINYINT(1) NOT NULL DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp TIMESTAMP NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `dialogue_actions`
--
CREATE TABLE dialogue_actions (
  id INT(11) NOT NULL AUTO_INCREMENT,
  dialogueID INT(11) NOT NULL,
  actionOrder INT(11) NOT NULL,
  reqOpenedQuest INT(11) NOT NULL DEFAULT -1,
  reqCompletedQuest INT(11) NOT NULL DEFAULT -1,
  excludingQuest INT(11) NOT NULL DEFAULT -1,
  audioClip VARCHAR(256) NOT NULL DEFAULT '',
  text VARCHAR(256) DEFAULT NULL,
  action VARCHAR(45) DEFAULT NULL,
  actionID INT(11) DEFAULT NULL,
  itemReq INT(11) NOT NULL DEFAULT -1,
  itemReqConsume TINYINT(1) NOT NULL DEFAULT 0,
  currency INT(11) NOT NULL DEFAULT -1,
  currencyAmount INT(11) NOT NULL DEFAULT 0,
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create column `audioClip` on table `dialogue`
--
ALTER TABLE dialogue 
  ADD COLUMN audioClip VARCHAR(256) NOT NULL;

--
-- Change columns order on table `dialogue`
--
ALTER TABLE dialogue 
 MODIFY audioClip VARCHAR(256) NOT NULL AFTER text;

--
-- Alter column `pulseCostType` on table `abilities`
--
ALTER TABLE abilities 
  CHANGE COLUMN pulseCostType pulseCostType VARCHAR(32) DEFAULT '';

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;