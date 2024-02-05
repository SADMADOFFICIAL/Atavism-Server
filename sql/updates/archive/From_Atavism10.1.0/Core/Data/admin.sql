--
-- Script date 28.08.2020 20:29:18
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
DELETE FROM server_version WHERE server_version = '10.1.0';

--
-- Inserting data into table server_version
--
INSERT INTO server_version(server_version, installation_type) VALUES
('10.2.0', 'Core');

--
-- Updating data of table world_time
--
UPDATE world_time SET hour = 1, minute = 1 WHERE id = 2;
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;