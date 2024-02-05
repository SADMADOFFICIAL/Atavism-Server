-- 
-- 

--
-- Disable foreign keys
--

SET NAMES 'utf8';

--
-- Set default database
--
USE `atavism`;

ALTER TABLE `player_items` CHANGE `inv.backref` `inv.backref` BIGINT(20) NOT NULL;

ALTER TABLE `player_items` ADD `boundPlayerOid` BIGINT(20) NOT NULL DEFAULT '0' AFTER `durability`;

--
-- Enable foreign keys
--
