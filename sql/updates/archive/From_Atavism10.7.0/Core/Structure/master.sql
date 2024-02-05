-- 
-- Script date 23.04.2023 10:46:32
-- Run this script against master 10.7.0 to synchronize it with master 10.8.0
-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE `master`;

--
-- Drop index `username_2` from table `account`
--
ALTER TABLE account 
   DROP INDEX username_2;

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

--
-- Create index `username_2` on table `account`
--
ALTER TABLE account 
  ADD INDEX username_2(username);

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;