-- 
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 13.09.2021 22:47:25
-- Server version: 5.7.35
-- Run this script against `1040D_world_content` to synchronize it with dev_1050D_world_content
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
-- Alter column `skillExp` on table `resource_node_template`
--
ALTER TABLE resource_node_template 
  CHANGE COLUMN skillExp skillExp INT(11) DEFAULT 0;

--
-- Create column `profileId` on table `resource_node_template`
--
ALTER TABLE resource_node_template 
  ADD COLUMN profileId INT(11) NOT NULL DEFAULT -1;

--
-- Change columns order on table `resource_node_template`
--
ALTER TABLE resource_node_template 
 MODIFY profileId INT(11) NOT NULL DEFAULT -1 AFTER harvestTimeReq;

--
-- Create table `resource_node_sub_profile`
--
CREATE TABLE resource_node_sub_profile (
  id INT(11) NOT NULL AUTO_INCREMENT,
  profileId INT(11) NOT NULL,
  priority INT(11) NOT NULL,
  priorityMax INT(11) NOT NULL,
  skill INT(11) DEFAULT NULL,
  skillLevel INT(11) DEFAULT NULL,
  skillLevelMax INT(11) DEFAULT NULL,
  skillExp INT(11) NOT NULL DEFAULT 0,
  weaponReq VARCHAR(45) DEFAULT NULL,
  equipped TINYINT(1) DEFAULT NULL,
  gameObject VARCHAR(128) DEFAULT NULL,
  harvestCoordEffect VARCHAR(256) DEFAULT NULL,
  activateCoordeffect VARCHAR(256) NOT NULL DEFAULT '',
  deactivateCoordeffect VARCHAR(256) NOT NULL DEFAULT '',
  respawnTime INT(11) DEFAULT NULL,
  respawnTimeMax INT(11) DEFAULT NULL,
  harvestCount INT(11) DEFAULT NULL,
  harvestTimeReq FLOAT DEFAULT 0,
  cooldown FLOAT NOT NULL,
  deactivationDelay FLOAT NOT NULL,
  cursorIcon VARCHAR(1024) NOT NULL DEFAULT '',
  cursorIcon2 MEDIUMTEXT NOT NULL,
  selectedIcon VARCHAR(1024) NOT NULL DEFAULT '',
  selectedIcon2 MEDIUMTEXT NOT NULL,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `resource_node_profile`
--
CREATE TABLE resource_node_profile (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  spawnPercentage FLOAT NOT NULL DEFAULT 100,
  spawnPecentageMax FLOAT NOT NULL DEFAULT 100,
  maxHarvestDistance FLOAT NOT NULL,
  isactive TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Drop column `resource_template` from table `resource_drop`
--
ALTER TABLE resource_drop 
  DROP COLUMN resource_template;

--
-- Alter column `item` on table `resource_drop`
--
ALTER TABLE resource_drop 
  CHANGE COLUMN item item INT(11) NOT NULL;

--
-- Alter column `min` on table `resource_drop`
--
ALTER TABLE resource_drop 
  CHANGE COLUMN min min INT(11) NOT NULL;

--
-- Alter column `max` on table `resource_drop`
--
ALTER TABLE resource_drop 
  CHANGE COLUMN max max INT(11) NOT NULL;

--
-- Alter column `chance` on table `resource_drop`
--
ALTER TABLE resource_drop 
  CHANGE COLUMN chance chance FLOAT NOT NULL DEFAULT 100;

--
-- Create column `resourceSubProfileId` on table `resource_drop`
--
ALTER TABLE resource_drop 
  ADD COLUMN resourceSubProfileId INT(11) NOT NULL;

--
-- Create column `chanceMax` on table `resource_drop`
--
ALTER TABLE resource_drop 
  ADD COLUMN chanceMax FLOAT NOT NULL DEFAULT 100;

--
-- Change columns order on table `resource_drop`
--
ALTER TABLE resource_drop 
 MODIFY resourceSubProfileId INT(11) NOT NULL AFTER id;
ALTER TABLE resource_drop 
 MODIFY chanceMax FLOAT NOT NULL DEFAULT 100 AFTER chance;

--
-- Create table `item_slots_in_group`
--
CREATE TABLE item_slots_in_group (
  id INT(11) NOT NULL AUTO_INCREMENT,
  slot_group_id INT(32) NOT NULL,
  slot_id INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `item_slots_group`
--
CREATE TABLE item_slots_group (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  all_slots TINYINT(1) NOT NULL,
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `item_slots`
--
CREATE TABLE item_slots (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  type VARCHAR(256) NOT NULL,
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `global_events_bonuses`
--
CREATE TABLE global_events_bonuses (
  id INT(11) NOT NULL AUTO_INCREMENT,
  global_event_id INT(11) NOT NULL,
  bonus_settings_id INT(11) NOT NULL,
  value INT(11) NOT NULL,
  valuep FLOAT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `global_events`
--
CREATE TABLE global_events (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  description TEXT NOT NULL,
  start_year INT(11) NOT NULL DEFAULT -1,
  start_month INT(11) NOT NULL DEFAULT -1,
  start_day INT(11) NOT NULL DEFAULT -1,
  start_hour INT(11) NOT NULL,
  start_minute INT(11) NOT NULL,
  end_year INT(11) NOT NULL DEFAULT -1,
  end_month INT(11) NOT NULL DEFAULT -1,
  end_day INT(11) NOT NULL DEFAULT -1,
  end_hour INT(11) NOT NULL,
  end_minute INT(11) NOT NULL,
  icon VARCHAR(256) NOT NULL,
  icon2 MEDIUMTEXT NOT NULL,
  isactive TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2010-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create column `power_stat` on table `damage_type`
--
ALTER TABLE damage_type 
  ADD COLUMN power_stat VARCHAR(256) NOT NULL;

--
-- Create column `accuracy_stat` on table `damage_type`
--
ALTER TABLE damage_type 
  ADD COLUMN accuracy_stat VARCHAR(256) NOT NULL;

--
-- Create column `evasion_stat` on table `damage_type`
--
ALTER TABLE damage_type 
  ADD COLUMN evasion_stat VARCHAR(256) NOT NULL;

--
-- Create column `critic_chance_stat` on table `damage_type`
--
ALTER TABLE damage_type 
  ADD COLUMN critic_chance_stat VARCHAR(256) NOT NULL;

--
-- Create column `critic_power_stat` on table `damage_type`
--
ALTER TABLE damage_type 
  ADD COLUMN critic_power_stat VARCHAR(64) NOT NULL;

--
-- Change columns order on table `damage_type`
--
ALTER TABLE damage_type 
 MODIFY isactive TINYINT(1) DEFAULT 1 AFTER critic_power_stat;
ALTER TABLE damage_type 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;
ALTER TABLE damage_type 
 MODIFY updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00' AFTER creationtimestamp;

--
-- Create column `race_icon` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN race_icon VARCHAR(256) NOT NULL DEFAULT '';

--
-- Create column `race_icon2` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN race_icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `class_icon` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN class_icon VARCHAR(256) NOT NULL DEFAULT '';

--
-- Create column `class_icon2` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN class_icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `race_description` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN race_description VARCHAR(2048) NOT NULL DEFAULT '';

--
-- Create column `class_description` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN class_description VARCHAR(2048) NOT NULL DEFAULT '';

--
-- Change columns order on table `character_create_template`
--
ALTER TABLE character_create_template 
 MODIFY race_icon VARCHAR(256) NOT NULL DEFAULT '' AFTER autoAttack;
ALTER TABLE character_create_template 
 MODIFY race_icon2 MEDIUMTEXT NOT NULL AFTER race_icon;
ALTER TABLE character_create_template 
 MODIFY class_icon VARCHAR(256) NOT NULL DEFAULT '' AFTER race_icon2;
ALTER TABLE character_create_template 
 MODIFY class_icon2 MEDIUMTEXT NOT NULL AFTER class_icon;
ALTER TABLE character_create_template 
 MODIFY race_description VARCHAR(2048) NOT NULL DEFAULT '' AFTER class_icon2;
ALTER TABLE character_create_template 
 MODIFY class_description VARCHAR(2048) NOT NULL DEFAULT '' AFTER race_description;

--
-- Create table `character_create_gender`
--
CREATE TABLE character_create_gender (
  id INT(11) NOT NULL AUTO_INCREMENT,
  character_create_id INT(11) NOT NULL,
  gender INT(11) NOT NULL,
  model VARCHAR(256) NOT NULL DEFAULT '',
  icon VARCHAR(512) NOT NULL DEFAULT '',
  icon2 MEDIUMTEXT NOT NULL,
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `auction_profile`
--
CREATE TABLE auction_profile (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  cost_price_value INT(11) NOT NULL,
  cost_price_value_percentage FLOAT NOT NULL,
  currency INT(11) NOT NULL,
  duration INT(11) NOT NULL,
  display_limit INT(11) NOT NULL,
  own_limit INT(11) NOT NULL,
  start_price_value INT(11) NOT NULL,
  start_price_percentage FLOAT NOT NULL,
  isactive TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Alter column `weaponRequired` on table `abilities`
--
ALTER TABLE abilities 
  CHANGE COLUMN weaponRequired weaponRequired VARCHAR(2048) DEFAULT NULL;

--
-- Create column `damageType` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN damageType VARCHAR(256) NOT NULL DEFAULT '';

--
-- Change columns order on table `abilities`
--
ALTER TABLE abilities 
 MODIFY damageType VARCHAR(256) NOT NULL DEFAULT '' AFTER attack_building;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;