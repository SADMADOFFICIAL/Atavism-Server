-- 
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 27.06.2021 00:31:59
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
-- Alter column `description` on table `quests`
--
ALTER TABLE quests 
  CHANGE COLUMN description description VARCHAR(2048) NOT NULL;

--
-- Alter column `objectiveText` on table `quests`
--
ALTER TABLE quests 
  CHANGE COLUMN objectiveText objectiveText VARCHAR(2048) NOT NULL;

--
-- Alter column `progressText` on table `quests`
--
ALTER TABLE quests 
  CHANGE COLUMN progressText progressText VARCHAR(2048) NOT NULL;

--
-- Alter column `completionText` on table `quests`
--
ALTER TABLE quests 
  CHANGE COLUMN completionText completionText VARCHAR(2048) DEFAULT NULL;

--
-- Create table `claim_profile`
--
CREATE TABLE claim_profile (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  isactive TINYINT(1) NOT NULL,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Alter column `validClaimType` on table `build_object_template`
--
ALTER TABLE build_object_template 
  CHANGE COLUMN validClaimType validClaimType VARCHAR(2000) NOT NULL DEFAULT '';

--
-- Create column `buildSolo` on table `build_object_template`
--
ALTER TABLE build_object_template 
  ADD COLUMN buildSolo TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `fixedTime` on table `build_object_template`
--
ALTER TABLE build_object_template 
  ADD COLUMN fixedTime TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `claim_object_category` on table `build_object_template`
--
ALTER TABLE build_object_template 
  ADD COLUMN claim_object_category INT(11) NOT NULL DEFAULT -1;

--
-- Create column `attackable` on table `build_object_template`
--
ALTER TABLE build_object_template 
  ADD COLUMN attackable TINYINT(1) NOT NULL DEFAULT 0;

--
-- Create column `repairable` on table `build_object_template`
--
ALTER TABLE build_object_template 
  ADD COLUMN repairable TINYINT(1) NOT NULL DEFAULT 1;

--
-- Change columns order on table `build_object_template`
--
ALTER TABLE build_object_template 
 MODIFY buildSolo TINYINT(1) NOT NULL DEFAULT 0 AFTER buildTaskReqPlayer;
ALTER TABLE build_object_template 
 MODIFY fixedTime TINYINT(1) NOT NULL DEFAULT 0 AFTER buildSolo;
ALTER TABLE build_object_template 
 MODIFY claim_object_category INT(11) NOT NULL DEFAULT -1 AFTER lockLimit;
ALTER TABLE build_object_template 
 MODIFY attackable TINYINT(1) NOT NULL DEFAULT 0 AFTER claim_object_category;
ALTER TABLE build_object_template 
 MODIFY repairable TINYINT(1) NOT NULL DEFAULT 1 AFTER attackable;

--
-- Create table `build_object_stage_progress`
--
CREATE TABLE build_object_stage_progress (
  id INT(11) NOT NULL AUTO_INCREMENT,
  stage_id INT(11) NOT NULL,
  progress SMALLINT(6) NOT NULL,
  prefab VARCHAR(1000) NOT NULL,
  trimesh LONGBLOB DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `build_object_stage_items`
--
CREATE TABLE build_object_stage_items (
  id INT(11) NOT NULL AUTO_INCREMENT,
  stage_id INT(11) NOT NULL,
  item INT(11) NOT NULL,
  count INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `build_object_stage_damaged`
--
CREATE TABLE build_object_stage_damaged (
  id INT(11) NOT NULL AUTO_INCREMENT,
  stage_id INT(11) NOT NULL,
  progress SMALLINT(6) NOT NULL,
  prefab VARCHAR(1000) NOT NULL,
  trimesh LONGBLOB DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create column `repairTimeReq` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN repairTimeReq FLOAT NOT NULL DEFAULT 0;

--
-- Create column `interactionType` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN interactionType VARCHAR(256) NOT NULL;

--
-- Create column `interactionID` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN interactionID INT(11) NOT NULL;

--
-- Create column `interactionData1` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN interactionData1 VARCHAR(256) NOT NULL;

--
-- Create column `health` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN health INT(11) NOT NULL DEFAULT 0;

--
-- Create column `lootTable` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN lootTable INT(11) NOT NULL;

--
-- Create column `lootMinPercentage` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN lootMinPercentage FLOAT NOT NULL;

--
-- Create column `lootMaxPercentage` on table `build_object_stage`
--
ALTER TABLE build_object_stage 
  ADD COLUMN lootMaxPercentage FLOAT NOT NULL;

--
-- Change columns order on table `build_object_stage`
--
ALTER TABLE build_object_stage 
 MODIFY repairTimeReq FLOAT NOT NULL DEFAULT 0 AFTER buildTimeReq;
ALTER TABLE build_object_stage 
 MODIFY interactionType VARCHAR(256) NOT NULL AFTER repairTimeReq;
ALTER TABLE build_object_stage 
 MODIFY interactionID INT(11) NOT NULL AFTER interactionType;
ALTER TABLE build_object_stage 
 MODIFY interactionData1 VARCHAR(256) NOT NULL AFTER interactionID;
ALTER TABLE build_object_stage 
 MODIFY health INT(11) NOT NULL DEFAULT 0 AFTER interactionData1;
ALTER TABLE build_object_stage 
 MODIFY lootTable INT(11) NOT NULL AFTER health;
ALTER TABLE build_object_stage 
 MODIFY lootMinPercentage FLOAT NOT NULL AFTER lootTable;
ALTER TABLE build_object_stage 
 MODIFY lootMaxPercentage FLOAT NOT NULL AFTER lootMinPercentage;

--
-- Create table `build_object_limits`
--
CREATE TABLE build_object_limits (
  id INT(11) NOT NULL AUTO_INCREMENT,
  profile_id INT(11) NOT NULL,
  object_category INT(11) NOT NULL,
  count INT(11) NOT NULL,
  isactive INT(11) NOT NULL DEFAULT 1,
  creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updatetimestamp DATETIME DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `profile_id` on table `build_object_limits`
--
ALTER TABLE build_object_limits 
  ADD INDEX profile_id(profile_id);

--
-- Create index `profile_id_2` on table `build_object_limits`
--
ALTER TABLE build_object_limits 
  ADD INDEX profile_id_2(profile_id, isactive);

--
-- Create column `attack_building` on table `abilities`
--
ALTER TABLE abilities 
  ADD COLUMN attack_building TINYINT(1) NOT NULL DEFAULT 0;

--
-- Change columns order on table `abilities`
--
ALTER TABLE abilities 
 MODIFY attack_building TINYINT(1) NOT NULL DEFAULT 0 AFTER aoe_target_count;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;