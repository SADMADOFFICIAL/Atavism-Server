--
-- Script was generated by Devart dbForge Studio for MySQL, Version 8.0.108.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 14.11.2018 00:45:05
--



SET NAMES 'utf8';
USE `world_content`;

--
-- Disabling DML triggers for editor_option
--
DROP TRIGGER IF EXISTS editor_option_trigger;

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
-- Inserting data into table editor_option
--
-- INSERT INTO editor_option(id, optionType, deletable, isactive, creationtimestamp, updatetimestamp) VALUES
-- (23, 'Sockets Type', 0, 1, '2000-01-01 05:00:00', '2018-08-03 20:42:50'),
-- (24, 'Item Quality', 0, 1, '2000-01-01 05:00:00', '2018-08-03 20:42:50');

--
-- Inserting data into table editor_option_choice
--
INSERT INTO editor_option_choice(id, optionTypeID, choice, isactive, creationtimestamp, updatetimestamp) VALUES
(NULL, 12, 'Sockets', 1, '2018-08-03 19:12:02', '2000-01-01 00:00:00'),
(NULL, 12, 'SocketsEffect', 1, '2018-08-03 19:12:02', '2000-01-01 00:00:00'),
(NULL, 23, 'Gems', 1, '2018-08-04 00:42:50', '2000-01-01 00:00:00'),
(NULL, 23, 'Runes', 1, '2018-08-04 00:42:50', '2000-01-01 00:00:00'),
(NULL, 24, 'Poor', 1, '2018-08-04 00:42:50', '2018-08-17 11:01:23'),
(NULL, 24, 'Common', 1, '2018-08-14 23:12:34', '2018-08-17 11:01:23'),
(NULL, 24, 'Uncommon', 1, '2018-08-14 23:12:34', '2018-08-17 11:01:23'),
(NULL, 24, 'Rare', 1, '2018-08-14 23:12:34', '2018-08-17 11:01:23'),
(NULL, 24, 'Epic', 1, '2018-08-14 23:12:34', '2018-08-17 11:01:23'),
(NULL, 24, 'Legendary', 1, '2018-08-14 23:12:34', '2018-08-17 11:01:23'),
(NULL, 12, 'Blueprint', 1, '2018-08-03 19:12:02', '2000-01-01 00:00:00'),
(NULL, 12, 'Parry', 1, '2018-08-03 19:12:02', '2000-01-01 00:00:00');

--
-- Inserting data into table game_setting
--
INSERT INTO game_setting(id, name, datatype, value, isactive, creationtimestamp, updatetimestamp) VALUES
(NULL, 'DURABILITY_LOSS_CHANCE_FROM_ATTACK', 'int', '10', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'DURABILITY_LOSS_CHANCE_FROM_DEFEND', 'int', '5', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'DURABILITY_LOSS_CHANCE_FROM_GATHER', 'int', '50', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'DURABILITY_LOSS_CHANCE_FROM_CRAFT', 'int', '50', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'DURABILITY_DESTROY_BROKEN_ITEMS', 'bool', 'false', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_START_PRICE_VALUE', 'int', '1', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_START_PRICE_VALUE_PERCENTAGE', 'int', '10', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_COST_PRICE_VALUE', 'int', '2', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_COST_PRICE_VALUE_PERCENTAGE', 'int', '5', 1, '2018-11-14 00:16:06', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_DURATION', 'int', '8', 1, '2018-11-14 00:16:06', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_CURRENCY', 'int', '3', 1, '2018-11-14 00:16:06', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_LIMIT', 'int', '100', 1, '2018-11-14 00:16:06', '2000-01-01 00:00:00'),
(NULL, 'AUCTION_OWN_LIMIT', 'int', '10', 1, '2018-11-14 00:16:06', '2000-01-01 00:00:00'),
(NULL, 'ENCHANTING_TIME', 'int', '4', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_FAILED_CLEAR', 'bool', 'false', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_CHANCE', 'int', '60', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_CREATE_TIME', 'int', '4', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_PRICE_CURRENCY', 'int', '3', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_PRICE_BASE', 'int', '1500', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_PRICE_PER_GRADE', 'int', '50000', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_RESET_TIME', 'int', '4', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_RESET_PRICE_CURRENCY', 'int', '3', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_RESET_PRICE_BASE', 'int', '1500', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'SOCKET_RESET_PRICE_PER_GRADE', 'int', '50000', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'CHARACTER_NAME_MIN_LENGTH', 'int', '3', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'CHARACTER_NAME_MAX_LENGTH', 'int', '14', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'CHARACTER_NAME_ALLOW_SPACES', 'bool', 'true', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(NULL, 'CHARACTER_NAME_ALLOW_NUMBERS', 'bool', 'true', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00');

--
-- Updating data of table weather_profile
--
UPDATE weather_profile SET fog_height_power_min = 0.7, fog_height_power_max = 1, fog_distance_power_min = 0.7, fog_distance_power_max = 1 WHERE id = 6;
UPDATE weather_profile SET fog_height_power_min = 0.9, fog_height_power_max = 1, fog_distance_power_min = 0.9, fog_distance_power_max = 1 WHERE id = 7;
UPDATE weather_profile SET fog_height_power_min = 0.8, fog_height_power_max = 0.9, fog_distance_power_min = 0.8, fog_distance_power_max = 0.9 WHERE id = 8;
UPDATE weather_profile SET fog_height_power_min = 0.7, fog_height_power_max = 0.8, fog_distance_power_min = 0.7, fog_distance_power_max = 0.8 WHERE id = 9;
UPDATE weather_profile SET fog_height_power_min = 0.9, fog_height_power_max = 1, fog_distance_power_min = 0.9, fog_distance_power_max = 1 WHERE id = 10;
UPDATE weather_profile SET fog_height_power_min = 0.8, fog_height_power_max = 0.9, fog_distance_power_min = 0.8, fog_distance_power_max = 0.9 WHERE id = 11;
UPDATE weather_profile SET fog_height_power_min = 0.7, fog_height_power_max = 0.8, fog_distance_power_min = 0.7, fog_distance_power_max = 0.8 WHERE id = 12;
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

--
-- Enabling DML triggers for 
--
DELIMITER ;;

--
-- Enabling DML triggers for editor_option
--
CREATE 
	DEFINER = 'root'@'localhost'
TRIGGER editor_option_trigger
	BEFORE UPDATE
	ON editor_option
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for editor_option_choice
--
CREATE 
	DEFINER = 'root'@'localhost'
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
	DEFINER = 'root'@'localhost'
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