-- 
-- Script was generated by Devart dbForge Studio for MySQL, Version 8.0.40.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 25.07.2018 13:21:54
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
-- Create table `server_version`
--
CREATE TABLE server_version (
  server_version VARCHAR(10) NOT NULL,
  PRIMARY KEY (server_version)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;