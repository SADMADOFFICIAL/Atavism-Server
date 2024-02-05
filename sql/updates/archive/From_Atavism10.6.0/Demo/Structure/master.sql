-- 
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 28.11.2022 19:41:51
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
USE master;

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
  CHANGE COLUMN username username VARCHAR(200) DEFAULT NULL;

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