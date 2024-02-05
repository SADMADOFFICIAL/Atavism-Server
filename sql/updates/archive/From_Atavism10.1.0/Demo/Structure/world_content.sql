-- 
-- Run this script against `world_content` to synchronize it with world_content
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
-- Create table `stat_thresholds`
--
CREATE TABLE stat_thresholds (
  stat_function VARCHAR(64) NOT NULL,
  threshold INT(11) NOT NULL,
  num_per_point INT(11) NOT NULL,
  PRIMARY KEY (stat_function, threshold)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `stat_function` on table `stat_thresholds`
--
ALTER TABLE stat_thresholds 
  ADD INDEX stat_function(stat_function);

--
-- Create index `threshold` on table `stat_thresholds`
--
ALTER TABLE stat_thresholds 
  ADD INDEX threshold(threshold);

--
-- Create column `sendToClient` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN sendToClient SMALLINT(6) NOT NULL DEFAULT 1 COMMENT '0 none,1 all,2 owner only';

--
-- Create column `onThreshold` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN onThreshold VARCHAR(45) DEFAULT NULL;

--
-- Create column `onThreshold2` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN onThreshold2 VARCHAR(45) DEFAULT NULL;

--
-- Create column `onThreshold3` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN onThreshold3 VARCHAR(45) DEFAULT NULL;

--
-- Create column `onThreshold4` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN onThreshold4 VARCHAR(45) DEFAULT NULL;

--
-- Create column `onThreshold5` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN onThreshold5 VARCHAR(45) DEFAULT NULL;

--
-- Create column `threshold` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN threshold FLOAT NOT NULL DEFAULT -1;

--
-- Create column `threshold2` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN threshold2 FLOAT NOT NULL DEFAULT -1;

--
-- Create column `threshold3` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN threshold3 FLOAT NOT NULL DEFAULT -1;

--
-- Create column `threshold4` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN threshold4 FLOAT NOT NULL DEFAULT -1;

--
-- Create column `shiftModStat` on table `stat`
--
ALTER TABLE stat 
  ADD COLUMN shiftModStat VARCHAR(45) NOT NULL DEFAULT '';

--
-- Change columns order on table `stat`
--
ALTER TABLE stat 
 MODIFY isactive TINYINT(1) DEFAULT 1 AFTER shiftModStat;
ALTER TABLE stat 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;
ALTER TABLE stat 
 MODIFY updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00' AFTER creationtimestamp;

--
-- Create column `icon2` on table `skills`
--
ALTER TABLE skills 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Change columns order on table `skills`
--
ALTER TABLE skills 
 MODIFY talent TINYINT(1) NOT NULL DEFAULT 0 AFTER icon2;

--
-- Create table `quest_items`
--
CREATE TABLE quest_items (
  id INT(11) NOT NULL AUTO_INCREMENT,
  quest_id INT(11) NOT NULL,
  item INT(11) NOT NULL,
  count INT(11) NOT NULL,
  choose TINYINT(1) NOT NULL,
  rewardLevel INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create column `aggro_radius` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN aggro_radius INT(5) NOT NULL DEFAULT 17;

--
-- Create column `send_link_aggro` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN send_link_aggro TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `get_link_aggro` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN get_link_aggro TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `link_aggro_range` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN link_aggro_range INT(5) NOT NULL DEFAULT 0;

--
-- Create column `chasing_distance` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN chasing_distance INT(3) NOT NULL DEFAULT 60;

--
-- Create column `count` on table `mob_loot`
--
ALTER TABLE mob_loot 
  ADD COLUMN count INT(11) NOT NULL DEFAULT 1;

--
-- Change columns order on table `mob_loot`
--
ALTER TABLE mob_loot 
 MODIFY count INT(11) NOT NULL DEFAULT 1 AFTER dropChance;

--
-- Create table `loot_table_items`
--
CREATE TABLE loot_table_items (
  id INT(11) NOT NULL AUTO_INCREMENT,
  loot_table_id INT(11) NOT NULL,
  item INT(11) NOT NULL DEFAULT 1,
  count INT(11) DEFAULT 1,
  count_max INT(11) NOT NULL DEFAULT 0,
  chance FLOAT(12, 7) DEFAULT 0.0000000,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Alter column `purchaseCost` on table `item_templates`
--
ALTER TABLE item_templates 
  CHANGE COLUMN purchaseCost purchaseCost BIGINT(20) DEFAULT 0;

--
-- Create column `icon2` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `weight` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN weight INT(11) NOT NULL DEFAULT 0;

--
-- Create column `durability` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN durability INT(11) NOT NULL DEFAULT 0;

--
-- Create column `autoattack` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN autoattack INT(11) NOT NULL DEFAULT -1;

--
-- Create column `socket_type` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN socket_type VARCHAR(64) NOT NULL;

--
-- Create column `ammotype` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN ammotype INT(11) NOT NULL DEFAULT 0;

--
-- Create column `death_loss` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN death_loss INT(11) NOT NULL DEFAULT 0;

--
-- Create column `parry` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN parry TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `oadelete` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN oadelete TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `passive_ability` on table `item_templates`
--
ALTER TABLE item_templates 
  ADD COLUMN passive_ability INT(11) NOT NULL DEFAULT -1;

--
-- Change columns order on table `item_templates`
--
ALTER TABLE item_templates 
 MODIFY icon2 MEDIUMTEXT NOT NULL AFTER icon;
ALTER TABLE item_templates 
 MODIFY isactive TINYINT(1) DEFAULT 1 AFTER passive_ability;
ALTER TABLE item_templates 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;
ALTER TABLE item_templates 
 MODIFY updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00' AFTER creationtimestamp;

--
-- Create column `creationtimestamp` on table `item_set_profile`
--
ALTER TABLE item_set_profile 
  ADD COLUMN creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create column `updatetimestamp` on table `item_set_profile`
--
ALTER TABLE item_set_profile 
  ADD COLUMN updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Create table `effects_triggers_actions`
--
CREATE TABLE effects_triggers_actions (
  id INT(11) NOT NULL AUTO_INCREMENT,
  effects_triggers_id INT(11) NOT NULL,
  target INT(11) NOT NULL,
  ability INT(11) NOT NULL,
  effect INT(11) NOT NULL,
  mod_v INT(11) NOT NULL DEFAULT 0,
  mod_p FLOAT NOT NULL DEFAULT 0,
  chance_min FLOAT NOT NULL,
  chance_max FLOAT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `effects_triggers`
--
CREATE TABLE effects_triggers (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  event_type INT(11) NOT NULL,
  tags TEXT NOT NULL,
  race INT(11) NOT NULL DEFAULT -1,
  class INT(11) NOT NULL DEFAULT -1,
  action_type TINYINT(4) NOT NULL,
  chance_min FLOAT NOT NULL DEFAULT 0,
  chance_max FLOAT NOT NULL DEFAULT 100,
  isactive TINYINT(1) NOT NULL DEFAULT 1,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create column `icon2` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `stackTime` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN stackTime TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `group_tags` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN group_tags TEXT NOT NULL;

--
-- Create column `interruption_chance` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN interruption_chance FLOAT NOT NULL DEFAULT 0;

--
-- Create column `interruption_chance_max` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN interruption_chance_max FLOAT NOT NULL DEFAULT 0;

--
-- Create column `interruption_all` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN interruption_all TINYINT(1) NOT NULL DEFAULT 0;

--
-- Change columns order on table `effects`
--
ALTER TABLE effects 
 MODIFY icon2 MEDIUMTEXT NOT NULL AFTER icon;
ALTER TABLE effects 
 MODIFY stackTime TINYINT(1) NOT NULL DEFAULT 0 AFTER stackLimit;
ALTER TABLE effects 
 MODIFY isactive TINYINT(1) DEFAULT 1 AFTER interruption_all;
ALTER TABLE effects 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;
ALTER TABLE effects 
 MODIFY updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00' AFTER creationtimestamp;

--
-- Alter column `maximum` on table `currencies`
--
ALTER TABLE currencies 
  CHANGE COLUMN maximum maximum BIGINT(20) NOT NULL DEFAULT 999999;

--
-- Create column `icon2` on table `currencies`
--
ALTER TABLE currencies 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `icon2` on table `crafting_recipes`
--
ALTER TABLE crafting_recipes 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `sprint` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN sprint INT(11) NOT NULL DEFAULT -1;

--
-- Create column `icon2` on table `build_object_template`
--
ALTER TABLE build_object_template 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `coordEffect4event` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN coordEffect4event VARCHAR(32) DEFAULT NULL;

--
-- Create column `coordEffect4` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN coordEffect4 VARCHAR(64) DEFAULT NULL;

--
-- Create column `coordEffect5event` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN coordEffect5event VARCHAR(32) DEFAULT NULL;

--
-- Create column `coordEffect5` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN coordEffect5 VARCHAR(64) DEFAULT NULL;

--
-- Create column `icon2` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN icon2 MEDIUMTEXT NOT NULL;

--
-- Create column `channelling` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN channelling TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `channelling_cost` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN channelling_cost INT(11) NOT NULL DEFAULT 0;

--
-- Create column `channelling_pulse_num` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN channelling_pulse_num INT(11) NOT NULL DEFAULT 1;

--
-- Create column `channelling_pulse_time` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN channelling_pulse_time FLOAT NOT NULL DEFAULT 0.25;

--
-- Create column `channelling_in_run` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN channelling_in_run TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `projectile` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN projectile TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `projectile_speed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN projectile_speed INT(11) NOT NULL DEFAULT 0;

--
-- Create column `activationDelay` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN activationDelay FLOAT NOT NULL DEFAULT 0;

--
-- Create column `pulseCost` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseCost INT(11) DEFAULT 0;

--
-- Create column `pulseCostType` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseCostType VARCHAR(32) DEFAULT 'mana';

--
-- Create column `pulseCasterEffectRequired` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseCasterEffectRequired INT(11) DEFAULT 0;

--
-- Create column `pulseCasterEffectConsumed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseCasterEffectConsumed TINYINT(1) DEFAULT 0;

--
-- Create column `pulseTargetEffectRequired` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseTargetEffectRequired INT(11) DEFAULT 0;

--
-- Create column `pulseTargetEffectConsumed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseTargetEffectConsumed TINYINT(1) DEFAULT 0;

--
-- Create column `pulseReagentRequired` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagentRequired INT(11) NOT NULL DEFAULT -1;

--
-- Create column `pulseReagentCount` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagentCount INT(11) DEFAULT 1;

--
-- Create column `pulseReagentConsumed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagentConsumed TINYINT(1) DEFAULT 0;

--
-- Create column `pulseReagent2Required` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagent2Required INT(11) DEFAULT -1;

--
-- Create column `pulseReagent2Count` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagent2Count INT(11) DEFAULT 1;

--
-- Create column `pulseReagent2Consumed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagent2Consumed TINYINT(1) DEFAULT 1;

--
-- Create column `pulseReagent3Required` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagent3Required INT(11) DEFAULT -1;

--
-- Create column `pulseReagent3Count` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagent3Count INT(11) DEFAULT 1;

--
-- Create column `pulseReagent3Consumed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseReagent3Consumed TINYINT(1) DEFAULT 1;

--
-- Create column `pulseAmmoUsed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseAmmoUsed INT(11) DEFAULT 0;

--
-- Create column `skipChecks` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN skipChecks TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `activationCostPercentage` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN activationCostPercentage FLOAT NOT NULL DEFAULT 0;

--
-- Create column `pulseCostPercentage` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN pulseCostPercentage FLOAT NOT NULL DEFAULT 0;

--
-- Create column `aoePrefab` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN aoePrefab VARCHAR(200) NOT NULL DEFAULT '';

--
-- Create column `stealth_reduce` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN stealth_reduce TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `interruptible` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN interruptible TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `interruption_chance` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN interruption_chance FLOAT NOT NULL DEFAULT 0;

--
-- Create column `toggle` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN toggle TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `tags` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN tags TEXT NOT NULL;

--
-- Create column `tag_disable` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN tag_disable INT(11) NOT NULL DEFAULT -1;

--
-- Create column `tag_count` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN tag_count INT(11) NOT NULL DEFAULT 1;

--
-- Create column `speed` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN speed FLOAT NOT NULL DEFAULT 0;

--
-- Create column `chunk_length` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN chunk_length FLOAT NOT NULL DEFAULT 1;

--
-- Create column `prediction` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN prediction INT(11) NOT NULL DEFAULT 0;

--
-- Create column `aoe_target_count_type` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN aoe_target_count_type INT(11) NOT NULL DEFAULT 0;

--
-- Create column `aoe_target_count` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN aoe_target_count INT(11) NOT NULL DEFAULT 5;

--
-- Change columns order on table `abilities`
--
ALTER TABLE abilities 
 MODIFY coordEffect4event VARCHAR(32) DEFAULT NULL AFTER coordEffect3;
ALTER TABLE abilities 
 MODIFY coordEffect4 VARCHAR(64) DEFAULT NULL AFTER coordEffect4event;
ALTER TABLE abilities 
 MODIFY coordEffect5event VARCHAR(32) DEFAULT NULL AFTER coordEffect4;
ALTER TABLE abilities 
 MODIFY coordEffect5 VARCHAR(64) DEFAULT NULL AFTER coordEffect5event;
ALTER TABLE abilities 
 MODIFY icon2 MEDIUMTEXT NOT NULL AFTER interceptType;
ALTER TABLE abilities 
 MODIFY isactive TINYINT(1) DEFAULT 1 AFTER aoe_target_count;
ALTER TABLE abilities 
 MODIFY creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;
ALTER TABLE abilities 
 MODIFY updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00' AFTER creationtimestamp;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;