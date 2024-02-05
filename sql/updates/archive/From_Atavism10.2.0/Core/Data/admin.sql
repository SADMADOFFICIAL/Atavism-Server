--
-- Script date 27.09.2020 20:29:18
-- Source server version: 5.7.31
--



SET NAMES 'utf8';
USE `admin`;
--
-- -- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

--
-- Deleting data from table server_version
--
DELETE FROM server_version ;

--
-- Inserting data into table server_version
--
INSERT INTO server_version(server_version, installation_type) VALUES
('10.2.1', 'Core');

-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;