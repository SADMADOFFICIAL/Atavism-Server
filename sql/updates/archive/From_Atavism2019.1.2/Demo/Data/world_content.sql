--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.22.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 28.09.2019 02:31:40
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
UPDATE game_setting SET isactive = 0, updatetimestamp = '2019-09-25 10:52:20' WHERE id = 7;
UPDATE game_setting SET isactive = 0, updatetimestamp = '2019-09-25 10:52:25' WHERE id = 45;

--
-- Inserting data into table game_setting
--
INSERT INTO game_setting(id, name, datatype, value, isactive, creationtimestamp, updatetimestamp) VALUES
(NULL, 'AUCTION_LOAD_DELAY', '', '20', 1, '2019-08-22 18:39:56', '2000-01-01 00:00:00'),
(NULL, 'CHAT_LOG_DB', '', 'false', 1, '2019-09-27 09:11:24', '2000-01-01 00:00:00'),
(NULL, 'CHAT_LOG_FILE', '', 'false', 1, '2019-09-27 09:11:41', '2000-01-01 00:00:00');

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