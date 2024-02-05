
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
('10.3.0', 'Demo');
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;