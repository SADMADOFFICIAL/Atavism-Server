-- 
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 26.11.2019 11:20:30
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
-- Create table `vip`
--
CREATE TABLE vip (
  account_id INT(11) NOT NULL,
  character_oid INT(11) NOT NULL,
  world VARCHAR(20) NOT NULL,
  vip_level INT(11) NOT NULL,
  vip_expire BIGINT(20) NOT NULL,
  vip_points INT(11) NOT NULL
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `bonuses`
--
CREATE TABLE bonuses (
  id INT(11) NOT NULL AUTO_INCREMENT,
  character_oid BIGINT(20) NOT NULL,
  object VARCHAR(60) NOT NULL,
  code VARCHAR(60) NOT NULL,
  value INT(11) NOT NULL,
  valuep FLOAT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `character_oid` on table `bonuses`
--
ALTER TABLE bonuses 
  ADD INDEX character_oid(character_oid, object, code);

--
-- Create index `character_oid_2` on table `bonuses`
--
ALTER TABLE bonuses 
  ADD INDEX character_oid_2(character_oid);

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;