-- 
-- Script date 23.04.2023 10:44:54
-- Run this script against admin 10.7.0 to synchronize it with admin 10.8.0
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
-- Create table `memory_data_stats`
--
CREATE TABLE memory_data_stats (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type VARCHAR(45) DEFAULT NULL,
  value BIGINT(64) DEFAULT NULL,
  world VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci;

--
-- Create index `type_UNIQUE` on table `memory_data_stats`
--
ALTER TABLE memory_data_stats 
  ADD UNIQUE INDEX type_UNIQUE(type);

--
-- Drop index `username` from table `account`
--
ALTER TABLE account 
   DROP INDEX username;

--
-- Alter column `username` on table `account`
--
ALTER TABLE account 
  CHANGE COLUMN username username VARCHAR(228) DEFAULT NULL;

--
-- Create index `username` on table `account`
--
ALTER TABLE account 
  ADD UNIQUE INDEX username(username);

ALTER TABLE `guild` CHANGE `updatetimestamp` `updatetimestamp` DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00';

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;