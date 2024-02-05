-- 
-- Script date 23.04.2023 11:04:30
-- Run this script against world_content 10.7.0 to synchronize it with world_content 10.8.0
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
-- Drop trigger `level_xp_requirements_trigger`
--
DROP TRIGGER IF EXISTS level_xp_requirements_trigger;

--
-- Drop index `PRIMARY` from table `level_xp_requirements`
--
ALTER TABLE level_xp_requirements 
   DROP PRIMARY KEY;

--
-- Create column `xpProfile` on table `level_xp_requirements`
--
ALTER TABLE level_xp_requirements 
  ADD COLUMN xpProfile INT(11) NOT NULL DEFAULT 1;

--
-- Create column `reward_template_id` on table `level_xp_requirements`
--
ALTER TABLE level_xp_requirements 
  ADD COLUMN reward_template_id INT(11) DEFAULT -1;

--
-- Change columns order on table `level_xp_requirements`
--
ALTER TABLE level_xp_requirements 
 MODIFY xpProfile INT(11) NOT NULL DEFAULT 1 FIRST;

--
-- Create index `PRIMARY` on table `level_xp_requirements`
--
ALTER TABLE level_xp_requirements 
  ADD PRIMARY KEY (xpProfile, level);

DELIMITER ;;

--
-- Create trigger `level_xp_requirements_trigger`
--
CREATE TRIGGER level_xp_requirements_trigger
	BEFORE UPDATE
	ON level_xp_requirements
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

DELIMITER ;

--
-- Create column `xpProfile` on table `character_create_template`
--
ALTER TABLE character_create_template 
  ADD COLUMN xpProfile INT(11) DEFAULT 1;


--
-- Create table `level_xp_requirements_templates`
--
CREATE TABLE level_xp_requirements_templates (
  xpProfile INT(11) NOT NULL AUTO_INCREMENT,
  xpProfile_name VARCHAR(86) DEFAULT NULL,
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (xpProfile)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci;

--
-- Create table `level_xp_requirements_reward_templates`
--
CREATE TABLE level_xp_requirements_reward_templates (
  reward_template_id INT(11) NOT NULL AUTO_INCREMENT,
  reward_template_name VARCHAR(86) DEFAULT NULL,
  reward_mail_subject VARCHAR(255) DEFAULT '',
  reward_mail_message TEXT DEFAULT NULL,
  isactive TINYINT(1) DEFAULT 1,
  creationtimestamp TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updatetimestamp DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (reward_template_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci;

--
-- Create table `level_xp_requirements_rewards`
--
CREATE TABLE level_xp_requirements_rewards (
  reward_id INT(11) NOT NULL AUTO_INCREMENT,
  reward_template_id INT(11) DEFAULT NULL,
  reward_type VARCHAR(86) DEFAULT NULL,
  reward_value INT(11) DEFAULT NULL,
  reward_amount INT(11) DEFAULT NULL,
  give_once TINYINT(1) NOT NULL DEFAULT 1,
  on_level_down TINYINT(1) NOT NULL DEFAULT 0,
  isactive TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (reward_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci;


ALTER TABLE `spawn_data` CHANGE `skop_owner` `shop_owner` BIGINT(20) NOT NULL DEFAULT '0';

ALTER TABLE `resource_node_template` CHANGE `coordEffect` `coordEffect` VARCHAR(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;