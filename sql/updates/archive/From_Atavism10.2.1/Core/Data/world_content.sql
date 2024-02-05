
SET NAMES 'utf8';
USE `world_content`;

--
-- Disabling DML triggers for editor_option_choice
--
DROP TRIGGER IF EXISTS editor_option_choice_trigger;

--
-- Disabling DML triggers for game_setting
--
DROP TRIGGER IF EXISTS game_setting_trigger;
--
-- -- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

--
-- Inserting data into table editor_option_choice
--
INSERT INTO editor_option_choice(id, optionTypeID, choice, deletable, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 8, 'Merchant', 0, 1, '2020-10-16 01:32:24', '2020-10-21 22:44:57'),
(null, 8, 'Bank', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(null, 8, 'QuestProgess', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(null, 8, 'Auction', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(null, 8, 'Mail', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(null, 8, 'GearModification', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(null, 8, 'GuildWarehouse', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(null, 8, 'GuildMerchant', 0, 1, '2020-10-21 22:44:34', '2020-10-21 22:44:57'),
(400, 16, 'Guild Level', 0, 1, '2020-08-30 21:18:36', '2020-11-15 00:08:56');

--
-- Updating data of table game_setting
--
UPDATE game_setting SET name = 'SAVE_COOLDOWN_LIMIT_DURATION' WHERE name = 'SAVE_COOLDOWN_LIMT_DURATION';
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

--
-- Enabling DML triggers for 
--
DELIMITER ;;

--
-- Enabling DML triggers for editor_option_choice
--
CREATE 
TRIGGER editor_option_choice_trigger
	BEFORE UPDATE
	ON editor_option_choice
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

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