--
--


SET NAMES 'utf8';
USE `world_content`;

INSERT INTO `editor_option` (`id`, `optionType`, `deletable`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(32, 'Mob Tags', 1, 1, '2022-11-30 04:53:42', '2022-11-30 06:05:14');


INSERT INTO `game_setting` (`id`, `name`, `datatype`, `value`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(NULL, 'MOB_COMBAT_BEHAVIOR_SELECT_INTERVAL', 'int', '1000', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'MOB_COMBAT_BEHAVIOR_USE_ABILITY_TIMEOUT', 'int', '20000', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'MOB_COMBAT_BEHAVIOR_MOVE_CHECK_INTERVAL', 'int', '250', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'MOB_COMBAT_BEHAVIOR_DEFEND_CHANGE_TARGET_INTERVAL', 'int', '10000', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'STORE_BOUND_ITEM_IN_BANK', 'bool', 'false', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'EXP_GROUP_ADD_PERCENTAGE', 'float', '0.1', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'VIP_USE_TIME', 'bool', 'true', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'MOB_COMBAT_BEHAVIOR_FLEE_ALLIES_CHECK_MAX_DISTANCE', 'float', '40', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'MOB_COMBAT_BEHAVIOR_EVENT_TIMEOUT', 'int', '10000', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000'),
(NULL, 'MOB_COMBAT_BEHAVIOR_NUMBER_TARGETS_CHECK_MAX_DISTANCE', 'float', '40', 1, CURRENT_TIMESTAMP, '2000-01-01 00:00:00.000000');

UPDATE `abilities` SET `coordEffect1` = NULL WHERE `abilities`.`coordEffect1` like '~ none ~' ;
UPDATE `abilities` SET `coordEffect2` = NULL WHERE `abilities`.`coordEffect2` like '~ none ~' ;
UPDATE `abilities` SET `coordEffect3` = NULL WHERE `abilities`.`coordEffect3` like '~ none ~' ;
UPDATE `abilities` SET `coordEffect4` = NULL WHERE `abilities`.`coordEffect4` like '~ none ~' ;
UPDATE `abilities` SET `coordEffect5` = NULL WHERE `abilities`.`coordEffect5` like '~ none ~' ;