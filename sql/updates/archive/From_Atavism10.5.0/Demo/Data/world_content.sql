--
--


SET NAMES 'utf8';
USE `world_content`;

UPDATE `item_templates` SET `updatetimestamp` = NOW();

INSERT INTO `editor_option_choice` (`id`, `optionTypeID`, `choice`, `deletable`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES 
(NULL, '7', 'Any', '0', '1', '2022-04-07 21:28:44', '2022-04-07 21:28:44');

DELETE FROM `editor_option_choice` WHERE `choice` ='BuildingMaterial';

INSERT INTO `game_setting` (`id`, `name`, `datatype`, `value`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES 
(NULL, 'SERVER_DEVELOPMENT_MODE', 'bool', 'true', '1', CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'QUEST_CHECK_EQUIPED_ITEMS', 'bool', 'false', '1', CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000');
