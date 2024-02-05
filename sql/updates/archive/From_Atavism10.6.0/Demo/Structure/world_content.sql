-- 
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 28.11.2022 19:42:51
-- Server version: 5.7.20
-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE world_content;

--
-- Create column `tags` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN tags TEXT NOT NULL;

--
-- Create column `behavior_profile_id` on table `mob_templates`
--
ALTER TABLE mob_templates 
  ADD COLUMN behavior_profile_id INT(11) NOT NULL DEFAULT 0;

--
-- Create table `mob_behavior_profile`
--
CREATE TABLE mob_behavior_profile (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  isactive TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `mob_behavior_points`
--
CREATE TABLE mob_behavior_points (
  id INT(11) NOT NULL AUTO_INCREMENT,
  behavior_id INT(11) NOT NULL,
  loc_x FLOAT NOT NULL,
  loc_y FLOAT NOT NULL,
  loc_z FLOAT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `behavior_id` on table `mob_behavior_points`
--
ALTER TABLE mob_behavior_points 
  ADD INDEX behavior_id(behavior_id);

--
-- Create table `mob_behaviors`
--
CREATE TABLE mob_behaviors (
  id INT(11) NOT NULL AUTO_INCREMENT,
  profile_id INT(11) NOT NULL,
  behavior_order INT(11) NOT NULL,
  type INT(11) NOT NULL COMMENT '0-Melee; 1-Offensive; 2-Defensive; 3-Defend; 4-Flee; 5-Heal',
  flee_type INT(11) NOT NULL COMMENT '0-Opposite direction;1-Defined position;2-To group friendly mobs',
  flee_loc_x FLOAT DEFAULT NULL,
  flee_loc_y FLOAT DEFAULT NULL,
  flee_loc_z FLOAT DEFAULT NULL,
  ability_interval INT(11) NOT NULL,
  mob_tag INT(11) NOT NULL,
  ignore_chase_distance TINYINT(1) NOT NULL DEFAULT 1,
  weapon INT(11) NOT NULL DEFAULT -1,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `profile_id` on table `mob_behaviors`
--
ALTER TABLE mob_behaviors 
  ADD INDEX profile_id(profile_id);

--
-- Create table `mob_ability_conditions_group`
--
CREATE TABLE mob_ability_conditions_group (
  id INT(11) NOT NULL AUTO_INCREMENT,
  group_order INT(11) NOT NULL,
  mob_ability_id INT(11) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `mob_ability_id` on table `mob_ability_conditions_group`
--
ALTER TABLE mob_ability_conditions_group 
  ADD INDEX mob_ability_id(mob_ability_id);

--
-- Create table `mob_ability_conditions`
--
CREATE TABLE mob_ability_conditions (
  id INT(11) NOT NULL AUTO_INCREMENT,
  conditions_group_id INT(11) NOT NULL,
  type INT(11) NOT NULL COMMENT '0-Event; 1-Distance; 2-Stat; 3-Effect; 4-CombatState; 5-DeathState; 6-NumberOfTargets',
  distance FLOAT NOT NULL,
  less TINYINT(1) NOT NULL,
  stat_name VARCHAR(256) NOT NULL,
  stat_value FLOAT NOT NULL,
  stat_vitality_percentage TINYINT(1) NOT NULL,
  target INT(11) NOT NULL COMMENT '0-Caster; 1-Target',
  effect_tag_id INT(11) NOT NULL,
  on_target TINYINT(1) NOT NULL,
  combat_state TINYINT(1) NOT NULL,
  death_state TINYINT(1) NOT NULL,
  trigger_event_Id INT(11) NOT NULL COMMENT '0-Parry; 1-Dodge; 2-Miss; 3-Damage; 4-Heal; 5-Critical; 6-Kill; 7-Stun; 8-Sleep',
  target_number INT(11) NOT NULL,
  target_ally TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `conditions_group_id` on table `mob_ability_conditions`
--
ALTER TABLE mob_ability_conditions 
  ADD INDEX conditions_group_id(conditions_group_id);

--
-- Create table `mob_ability`
--
CREATE TABLE mob_ability (
  id INT(11) NOT NULL AUTO_INCREMENT,
  mob_ability_order INT(11) NOT NULL,
  behavior_id INT(11) NOT NULL,
  abilities TEXT NOT NULL,
  minAbilityRangePercentage FLOAT NOT NULL,
  maxAbilityRangePercentage FLOAT NOT NULL,
  mob_ability_type INT(11) NOT NULL COMMENT '0-Abilites; 1-Start Abiliies; 2-End Abilities',
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `behavior_id` on table `mob_ability`
--
ALTER TABLE mob_ability 
  ADD INDEX behavior_id(behavior_id);

--
-- Alter column `name` on table `game_setting`
--
ALTER TABLE game_setting 
  CHANGE COLUMN name name VARCHAR(101) NOT NULL;

--
-- Create column `show_effect` on table `effects`
--
ALTER TABLE effects 
  ADD COLUMN show_effect TINYINT(1) NOT NULL DEFAULT 1;

--
-- Change columns order on table `effects`
--
ALTER TABLE effects 
 MODIFY show_effect TINYINT(1) NOT NULL DEFAULT 1 AFTER interruption_all;

--
-- Create table `behavior_conditions_group`
--
CREATE TABLE behavior_conditions_group (
  id INT(11) NOT NULL AUTO_INCREMENT,
  group_order INT(11) NOT NULL,
  behavior_id INT(11) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `behavior_id` on table `behavior_conditions_group`
--
ALTER TABLE behavior_conditions_group 
  ADD INDEX behavior_id(behavior_id);

--
-- Create table `behavior_conditions`
--
CREATE TABLE behavior_conditions (
  id INT(11) NOT NULL AUTO_INCREMENT,
  conditions_group_id INT(11) NOT NULL,
  type INT(11) NOT NULL COMMENT '0-Event; 1-Distance; 2-Stat; 3-Effect; 4-CombatState; 5-DeathState; 6-NumberOfTargets',
  distance FLOAT NOT NULL,
  less TINYINT(1) NOT NULL,
  stat_name VARCHAR(256) NOT NULL,
  stat_value FLOAT NOT NULL,
  stat_vitality_percentage TINYINT(1) NOT NULL,
  target INT(11) NOT NULL DEFAULT 1 COMMENT '0-Caster; 1-Target',
  effect_tag_id INT(11) NOT NULL,
  on_target TINYINT(1) NOT NULL,
  combat_state TINYINT(1) NOT NULL,
  death_state TINYINT(1) NOT NULL,
  trigger_event_Id INT(11) NOT NULL COMMENT '0-Parry; 1-Dodge; 2-Miss; 3-Damage; 4-Heal; 5-Critical; 6-Kill; 7-Stun; 8-Sleep',
  target_number INT(11) NOT NULL,
  target_ally TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `conditions_group_id` on table `behavior_conditions`
--
ALTER TABLE behavior_conditions 
  ADD INDEX conditions_group_id(conditions_group_id);

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;