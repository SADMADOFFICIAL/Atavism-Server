--
-- Script date 28.08.2020 20:31:40
-- Source server version: 5.7.31
--



SET NAMES 'utf8';
USE `world_content`;

--
-- Disabling DML triggers for arena_categories
--
DROP TRIGGER IF EXISTS arena_categories_trigger;

--
-- Disabling DML triggers for damage_type
--
DROP TRIGGER IF EXISTS damage_type_trigger;

--
-- Disabling DML triggers for editor_option
--
DROP TRIGGER IF EXISTS editor_option_trigger;

--
-- Disabling DML triggers for editor_option_choice
--
DROP TRIGGER IF EXISTS editor_option_choice_trigger;

--
-- Disabling DML triggers for factions
--
DROP TRIGGER IF EXISTS factions_trigger;

--
-- Disabling DML triggers for faction_stances
--
DROP TRIGGER IF EXISTS faction_stances_trigger;

--
-- Disabling DML triggers for game_setting
--
DROP TRIGGER IF EXISTS game_setting_trigger;

--
-- Disabling DML triggers for stat
--
DROP TRIGGER IF EXISTS stat_trigger;
--
-- -- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;


--
-- Inserting data into table editor_option
--
INSERT INTO editor_option(id, optionType, deletable, isactive, creationtimestamp, updatetimestamp) VALUES
(25, 'Effects Tags', 0, 1, '2020-08-23 12:01:29', '2000-01-01 00:00:00'),
(26, 'Ability Tags', 0, 1, '2020-08-23 12:01:29', '2020-08-28 11:11:28');

--
-- Deleting data from table editor_option_choice
--
DELETE FROM editor_option_choice WHERE id IN(59, 95, 101, 102, 130, 
132, 142, 147);

--
-- Inserting data into table editor_option_choice
--
INSERT INTO editor_option_choice(id, optionTypeID, choice, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 10, 'Health', 1, '2019-12-03 12:52:59', '2020-08-28 13:09:04'),
(null, 10, 'Movement Speed', 1, '2019-12-03 12:52:59', '2020-08-28 13:09:04'),
(null, 10, 'Attack Speed', 1, '2019-12-08 13:48:41', '2020-08-28 13:09:04'),
(null, 10, 'Ability Cost', 1, '2020-04-09 20:22:28', '2020-08-28 13:09:04'),
(null, 10, 'Ability Cooldown', 1, '2020-04-09 20:22:28', '2020-08-28 13:09:04'),
(null, 10, 'Ability Cast Time', 1, '2020-04-09 20:22:28', '2020-08-28 13:09:04'),
(null, 10, 'Ability Global Cooldown', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:04'),
(null, 10, 'Ability Weapon Cooldown', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:04'),
(null, 10, 'Ability Health Receive', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:04'),
(null, 10, 'Ability Health Dealt', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:04'),
(null, 10, 'Ability Damage Receive', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:04'),
(null, 10, 'Ability Damage Dealt', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:04'),
(null, 10, 'Ability Range', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:05'),
(null, 10, 'Magical Critic Power', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:05'),
(null, 10, 'Physical Critic Power', 1, '2020-04-15 10:14:49', '2020-08-28 13:09:05'),
(null, 10, 'Stealth', 1, '2020-05-21 19:43:00', '2020-08-28 13:09:05'),
(null, 10, 'Perception Stealth', 1, '2020-05-21 19:43:00', '2020-08-28 13:09:05'),
(null, 10, 'Sleep Chance', 1, '2020-06-14 14:19:20', '2020-08-28 13:09:05'),
(null, 10, 'Stun Chance', 1, '2020-06-14 14:19:20', '2020-08-28 13:09:05'),
(null, 10, 'Interuption Resistance', 1, '2020-06-18 20:12:01', '2020-08-28 13:09:05'),
(null, 10, 'Interuption Chance', 1, '2020-06-18 20:12:01', '2020-08-28 13:09:05'),
(null, 11, 'Self Location', 1, '2020-08-28 10:22:55', '2000-01-01 00:00:00'),
(null, 26, 'Sprint', 1, '2020-08-28 11:08:06', '2020-08-28 11:11:28'),
(null, 2, 'Unarmed', 1, '2020-08-28 12:54:21', '2000-01-01 00:00:00');

--
-- Inserting data into table faction_stances
--
INSERT INTO faction_stances(id, factionID, otherFaction, defaultStance, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 1, 6, 1, 1, '2019-09-23 22:08:13', '2000-01-01 00:00:00');

--
-- Updating data of table game_setting
--

UPDATE game_setting SET isactive = 0, creationtimestamp = '2000-01-01 00:00:00' WHERE id = 7;
UPDATE game_setting SET isactive = 0, creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2019-09-25 10:52:25' WHERE id = 45;


--
-- Inserting data into table game_setting
--
INSERT INTO game_setting(id, name, datatype, value, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 'CHAT_LOG_DB', 'bool', 'false', 1, '2019-08-21 10:29:12', '2019-11-26 12:02:19'),
(null, 'CHAT_LOG_FILE', 'bool', 'false', 1, '2019-08-21 10:29:25', '2019-11-26 12:02:23'),
(null, 'SAVE_COOLDOWN_LIMT_DURATION', 'int', '60', 1, '2020-08-23 11:24:14', '2000-01-01 00:00:00'),
(null, 'ABILITY_WEAPON_COOLDOWN_ATTACK_SPEED', 'bool', 'false', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'WEAPON_COOLDOWN', 'float', '3', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'GLOBAL_COOLDOWN', 'float', '1', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'COMBAT_MISS_CHANCE', 'float', '5', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'DUEL_DURATION', 'int', '120', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FACTION_HATED_REP', 'int', '-3000', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FACTION_DISLIKE_REP', 'int', '-1500', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FACTION_NEUTRAL_REP', 'int', '0', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FACTION_FRIENDLY_REP', 'int', '500', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FACTION_HONOURED_REP', 'int', '1500', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FACTION_EXALTED_REP', 'int', '3000', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'ABILITY_SKILL_UP_CHANCE', 'int', '80', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'MOB_SPAWN_TICK', 'int', '300', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'MOB_SPAWN_DELAY', 'int', '10000', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FLAT_REPAIR_RATE', 'int', '25', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'FLAT_REPAIR_RATE_GRADE_MODIFIER', 'int', '10', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'USE_FLAT_REPAIR_RATE', 'bool', 'false', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'POINTS_PER_SKILL_LEVEL', 'int', '10', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(null, 'EXP_MAX_DISTANCE', 'float', '40', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00');

--
-- Updating data of table stat
--
UPDATE stat SET stat_function = 'Attack Speed', maxstat = '', onMaxHit = '', onMinHit = '', shiftReq1 = '', shiftReq2 = '', shiftReq3 = '', onThreshold = '', onThreshold2 = '', onThreshold3 = '', onThreshold4 = '', onThreshold5 = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:25:53' WHERE name = 'attack_speed';

UPDATE stat SET stat_function = 'Health', onThreshold = '', onThreshold2 = '', onThreshold3 = '', onThreshold4 = '', onThreshold5 = 'effect:0', shiftModStat = 'health_shift', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:24:17' WHERE name = 'health';

UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:21:33' WHERE name = 'magical_critic';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:21:36' WHERE name = 'magical_evasion';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:22:07' WHERE name = 'magical_resistance';
UPDATE stat SET stat_function = 'Movement Speed', maxstat = '', onMaxHit = '', onMinHit = '', shiftReq1 = '', shiftReq2 = '', shiftReq3 = '', onThreshold = '', onThreshold2 = '', onThreshold3 = '', onThreshold4 = '', onThreshold5 = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:26:07' WHERE name = 'movement_speed';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:20:38' WHERE name = 'parry';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:21:39' WHERE name = 'physical_critic';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:21:47' WHERE name = 'physical_defense';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:21:49' WHERE name = 'physical_evasion';
UPDATE stat SET stat_function = '~ none ~', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:23:46' WHERE name = 'pierce_resistance';
UPDATE stat SET stat_function = '~ none ~', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:23:43' WHERE name = 'slash_resistance';
UPDATE stat SET maxstat = '', creationtimestamp = '2000-01-01 00:00:00', updatetimestamp = '2020-08-28 13:21:06' WHERE name = 'weight-max';

--
-- Inserting data into table stat
--
INSERT INTO stat(name, type, stat_function, mob_base, mob_level_increase, mob_level_percent_increase, min, maxstat, canExceedMax, sharedWithGroup, shiftTarget, shiftValue, shiftReverseValue, shiftInterval, isShiftPercent, onMaxHit, onMinHit, shiftReq1, shiftReq1State, shiftReq1SetReverse, shiftReq2, shiftReq2State, shiftReq2SetReverse, shiftReq3, shiftReq3State, shiftReq3SetReverse, startPercent, deathResetPercent, releaseResetPercent, sendToClient, onThreshold, onThreshold2, onThreshold3, onThreshold4, onThreshold5, threshold, threshold2, threshold3, threshold4, shiftModStat, isactive, creationtimestamp, updatetimestamp) VALUES
('cast_time', 0, 'Ability Cast Time', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:34:32', '2020-08-28 13:20:51'),
('cooldown', 0, 'Ability Cooldown', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:31:29', '2020-08-28 13:20:46'),
('cost', 0, 'Ability Cost', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:31:04', '2020-08-28 13:20:36'),
('damage_dealt', 0, 'Ability Health Dealt', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:29:30', '2020-08-28 13:21:17'),
('damage_rec', 0, 'Ability Damage Receive', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:29:02', '2020-08-28 13:20:54'),
('glob_cooldown', 0, 'Ability Global Cooldown', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:33:30', '2020-08-28 13:21:30'),
('health_dealt', 0, 'Ability Health Dealt', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:30:09', '2020-08-28 13:21:18'),
('health_rec', 0, 'Ability Health Receive', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:29:52', '2020-08-28 13:20:58'),
('health_shift', 0, '~ none ~', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-21 20:22:38', '2020-08-28 13:21:21'),
('magical_crit_power', 0, 'Magical Critic Power', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:32:28', '2020-08-28 13:21:54'),
('perception-stealth', 0, 'Perception Stealth', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-05-21 19:43:23', '2020-08-28 13:21:56'),
('physical_crit_power', 0, 'Physical Critic Power', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:32:53', '2020-08-28 13:21:58'),
('range', 0, 'Ability Range', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:28:31', '2020-08-28 13:20:41'),
('sleep_chance', 0, 'Sleep Chance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:33:22', '2020-08-28 13:21:28'),
('sleep_resistance', 0, 'Sleep Resistance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:34:33', '2020-08-28 13:21:51'),
('stamina', 2, '~ none ~', 0, 0, 0, 0, 'stamina-max', 0, 0, 1, 5, 0, 2, 1, '~ none ~', '~ none ~', 'sprint', 0, 0, '~ none ~', 0, 0, '~ none ~', 0, 0, 50, -1, -1, 1, '', '', '', '', 'effect:0', -1, -1, -1, -1, '~ none ~', 1, '2020-06-29 15:10:06', '2020-06-29 18:21:13'),
('stamina-max', 0, '~ none ~', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-29 15:10:19', '2020-08-28 13:21:09'),
('stealth', 0, 'Stealth', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-05-21 19:43:36', '2020-08-28 13:20:44'),
('stun_chance', 0, 'Stun Chance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:33:38', '2020-08-28 13:21:14'),
('stun_resistance', 0, 'Stun Resistance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:34:54', '2020-08-28 13:21:41'),
('weapon_cooldown', 0, 'Ability Weapon Cooldown', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:35:04', '2020-08-28 13:21:43');

--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

--
-- Enabling DML triggers for 
--
DELIMITER ;;

--
-- Enabling DML triggers for arena_categories
--
CREATE 
TRIGGER arena_categories_trigger
	BEFORE UPDATE
	ON arena_categories
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for damage_type
--
CREATE 
TRIGGER damage_type_trigger
	BEFORE UPDATE
	ON damage_type
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for editor_option
--
CREATE 
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
TRIGGER editor_option_choice_trigger
	BEFORE UPDATE
	ON editor_option_choice
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for factions
--
CREATE 
TRIGGER factions_trigger
	BEFORE UPDATE
	ON factions
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for faction_stances
--
CREATE 
TRIGGER faction_stances_trigger
	BEFORE UPDATE
	ON faction_stances
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
-- Enabling DML triggers for stat
--
CREATE 
TRIGGER stat_trigger
	BEFORE UPDATE
	ON stat
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for 
--
DELIMITER ;