--
-- Script date 27.09.2020 20:58:46
-- Source server version: 5.7.31
--

SET NAMES 'utf8';
USE `world_content`;

--
-- Disabling DML triggers for game_setting
--
DROP TRIGGER IF EXISTS game_setting_trigger;
--
-- -- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

--
-- Updating data of table game_setting
--
UPDATE game_setting SET value = 'true' WHERE name like 'MAGICAL_ATTACKS_USE_WEAPON_DAMAGE';
UPDATE game_setting SET datatype = 'int' WHERE name like 'GROUP_DISCONNECT_TIMEOUT';
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

--
-- Enabling DML triggers for 
--
DELIMITER ;;

--
-- Enabling DML triggers for game_setting
--
CREATE 
TRIGGER game_setting_trigger
	BEFORE UPDATE
	ON game_setting
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for 
--
DELIMITER ;