-- Script date 21.11.2020 17:13:01
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
USE `admin`;

--
-- Alter column `currencyAmount` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN currencyAmount currencyAmount BIGINT(20) DEFAULT NULL;

--
-- Create table `shop_spawn_data`
--
CREATE TABLE shop_spawn_data (
  id INT(11) NOT NULL AUTO_INCREMENT,
  category INT(11) NOT NULL DEFAULT 1,
  name VARCHAR(64) NOT NULL,
  mobTemplate INT(11) NOT NULL DEFAULT -1,
  mobTemplate2 INT(11) NOT NULL DEFAULT -1,
  mobTemplate3 INT(11) NOT NULL DEFAULT -1,
  mobTemplate4 INT(11) NOT NULL DEFAULT -1,
  mobTemplate5 INT(11) NOT NULL DEFAULT -1,
  markerName VARCHAR(64) DEFAULT NULL,
  locX FLOAT(8, 2) DEFAULT NULL,
  locY FLOAT(8, 2) DEFAULT NULL,
  locZ FLOAT(8, 2) DEFAULT NULL,
  orientX FLOAT(8, 4) DEFAULT NULL,
  orientY FLOAT(8, 4) DEFAULT NULL,
  orientZ FLOAT(8, 4) DEFAULT NULL,
  orientW FLOAT(8, 4) DEFAULT NULL,
  instance INT(11) DEFAULT NULL,
  numSpawns INT(11) DEFAULT NULL,
  spawnRadius INT(11) DEFAULT NULL,
  respawnTime INT(11) DEFAULT NULL,
  respawnTimeMax INT(11) DEFAULT NULL,
  corpseDespawnTime INT(11) DEFAULT NULL,
  spawnActiveStartHour INT(11) DEFAULT -1,
  spawnActiveEndHour INT(11) DEFAULT -1,
  alternateSpawnMobTemplate INT(11) NOT NULL DEFAULT -1,
  alternateSpawnMobTemplate2 INT(11) NOT NULL DEFAULT -1,
  alternateSpawnMobTemplate3 INT(11) NOT NULL DEFAULT -1,
  alternateSpawnMobTemplate4 INT(11) NOT NULL DEFAULT -1,
  alternateSpawnMobTemplate5 INT(11) NOT NULL DEFAULT -1,
  combat TINYINT(1) NOT NULL,
  roamRadius INT(11) NOT NULL,
  startsQuests VARCHAR(256) NOT NULL,
  endsQuests VARCHAR(256) NOT NULL,
  startsDialogues VARCHAR(256) NOT NULL,
  otherActions VARCHAR(256) NOT NULL,
  baseAction VARCHAR(32) NOT NULL,
  weaponSheathed TINYINT(1) NOT NULL,
  merchantTable INT(11) NOT NULL,
  patrolPath INT(11) NOT NULL DEFAULT -1,
  questOpenLootTable INT(11) NOT NULL,
  isChest TINYINT(1) NOT NULL DEFAULT 0,
  pickupItem INT(11) DEFAULT NULL,
  shop_owner BIGINT(20) NOT NULL DEFAULT 0,
  shop_oid BIGINT(20) NOT NULL DEFAULT 0,
  shop_message VARCHAR(512) NOT NULL DEFAULT '',
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `shop_oid` on table `shop_spawn_data`
--
ALTER TABLE shop_spawn_data 
  ADD INDEX shop_oid(shop_oid);

--
-- Create table `player_shop_items`
--
CREATE TABLE player_shop_items (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  shop_oid BIGINT(20) NOT NULL,
  item_oid BIGINT(20) NOT NULL,
  price BIGINT(20) NOT NULL,
  currency INT(11) NOT NULL,
  template_id INT(11) NOT NULL DEFAULT 0,
  count INT(11) NOT NULL DEFAULT 0,
  sell TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `shop_oid` on table `player_shop_items`
--
ALTER TABLE player_shop_items 
  ADD INDEX shop_oid(shop_oid);

--
-- Create table `player_shop`
--
CREATE TABLE player_shop (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  shop_oid BIGINT(20) NOT NULL,
  player_oid BIGINT(20) NOT NULL,
  tag VARCHAR(256) NOT NULL,
  title VARCHAR(1024) NOT NULL,
  end_player_logout TINYINT(1) NOT NULL DEFAULT 1,
  createtime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  timeout INT(11) NOT NULL,
  player TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `player_oid` on table `player_shop`
--
ALTER TABLE player_shop 
  ADD INDEX player_oid(player_oid);

--
-- Create index `shop_oid` on table `player_shop`
--
ALTER TABLE player_shop 
  ADD INDEX shop_oid(shop_oid);

--
-- Create table `guild_level_resources`
--
CREATE TABLE guild_level_resources (
  id INT(11) NOT NULL AUTO_INCREMENT,
  guild_id INT(11) NOT NULL,
  item_id INT(11) NOT NULL,
  item_count INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `guild_id` on table `guild_level_resources`
--
ALTER TABLE guild_level_resources 
  ADD INDEX guild_id(guild_id);

--
-- Create column `level` on table `guild`
--
ALTER TABLE guild 
  ADD COLUMN level SMALLINT(6) NOT NULL DEFAULT 1;

--
-- Create column `warehouse` on table `guild`
--
ALTER TABLE guild 
  ADD COLUMN warehouse BIGINT(20) NOT NULL DEFAULT 0;

--
-- Create column `updatetimestamp` on table `guild`
--
ALTER TABLE guild 
  ADD COLUMN updatetimestamp DATETIME NOT NULL;

--
-- Change columns order on table `guild`
--
ALTER TABLE guild 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER warehouse;

--
-- Alter column `cost` on table `claim`
--
ALTER TABLE claim 
  CHANGE COLUMN cost cost BIGINT(20) DEFAULT 0;

--
-- Alter column `org_cost` on table `claim`
--
ALTER TABLE claim 
  CHANGE COLUMN org_cost org_cost BIGINT(20) NOT NULL;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;