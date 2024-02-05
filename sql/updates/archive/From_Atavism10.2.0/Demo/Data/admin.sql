--
-- Script date 27.09.2020 15:58:07
-- Run this script against admin to synchronize it with admin
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
('10.2.1', 'Demo');
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;