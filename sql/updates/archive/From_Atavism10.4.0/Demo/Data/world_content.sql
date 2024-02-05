--
-- Script date 19.09.2021 01:58:28
--


SET NAMES 'utf8';
USE `world_content`;

--
-- Disabling DML triggers for character_create_stats
--
DROP TRIGGER IF EXISTS character_create_stats_trigger;

--
-- Disabling DML triggers for character_create_template
--
DROP TRIGGER IF EXISTS character_create_template_trigger;

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
-- Inserting data into table auction_profile
--
INSERT INTO auction_profile(id, name, cost_price_value, cost_price_value_percentage, currency, duration, display_limit, own_limit, start_price_value, start_price_percentage, isactive, creationtimestamp, updatetimestamp) VALUES
(1, 'Default', 2, 5, 3, 8, 100, 10, 1, 10, 1, '2021-09-14 16:50:42', '2021-09-16 00:08:09');

--
-- Updating data of table bonuses_settings
--
UPDATE bonuses_settings SET param = 'vp' WHERE id = 21;
UPDATE bonuses_settings SET param = 'vp' WHERE id = 23;


--
-- Inserting data into table editor_option
--
INSERT INTO editor_option(id, optionType, deletable, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 'Gender', 0, 1, '2021-07-01 10:25:22', '2021-07-02 17:09:50'),
(null, 'Item Slot Type', 1, 1, '2021-07-17 21:34:14', '2021-08-28 13:25:59'),
(null, 'Tool Type', 1, 1, '2021-08-28 18:45:24', '2021-09-01 17:00:30');

--
-- Deleting data from table editor_option_choice
--
DELETE FROM editor_option_choice WHERE 
(choice = 'Health Mod'  OR choice = 'Mana Mod' OR choice = 'Mana' OR choice = 'Faction' OR choice = 'Tokens') and isactive = 0
 OR (choice = 'Jewelry' and optionTypeID = 1)
 OR (choice = 'Magical Critic' OR choice = 'Physical Critic' OR choice = 'Physical Evasion' OR choice = 'Sleep' OR choice = 'Magical Critic Power' OR choice = 'Physical Critic Power') and optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Stat Functions');


--
-- Updating data of table editor_option_choice
--
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:08' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Weapon Type');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:10' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Armor Type');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Race');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Class');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Crafting Station');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Currency Group');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Building Category');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Ammo Type');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Sockets Type');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Item Quality');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Ability Tags');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Claim Type');
UPDATE editor_option_choice SET deletable = 1, updatetimestamp = '2021-09-15 18:49:15' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Claim Object Category');
UPDATE editor_option_choice SET deletable = 0, updatetimestamp = '2021-09-15 18:49:20' WHERE optionTypeID = (SELECT id FROM `editor_option` where `optionType` = 'Claim Type') and choice = 'Any';

UPDATE editor_option_choice SET choice = 'Critic Power', updatetimestamp = '2021-09-15 14:39:09' WHERE choice = 'Physical Power';
UPDATE editor_option_choice SET choice = 'Critic Chance', updatetimestamp = '2021-09-15 14:39:09' WHERE choice = 'Magical Power';
UPDATE editor_option_choice SET choice = 'Accuracy', updatetimestamp = '2021-09-15 14:39:09' WHERE choice = 'Physical Accuracy';
UPDATE editor_option_choice SET choice = 'Power', updatetimestamp = '2021-09-15 14:39:09' WHERE choice = 'Magical Accuracy';
UPDATE editor_option_choice SET choice = 'Evasion', updatetimestamp = '2021-09-15 14:39:09' WHERE choice = 'Magical Evasion';
UPDATE editor_option_choice SET choice = 'QuestProgress', updatetimestamp = '2021-09-13 22:26:47' WHERE choice = 'QuestProgess';

--
-- Inserting data into table editor_option_choice
--
INSERT INTO editor_option_choice(id, optionTypeID, choice, deletable, isactive, creationtimestamp, updatetimestamp) VALUES
(null, (SELECT id FROM `editor_option` where `optionType` = 'Gender'), 'Male', 1, 1, '2021-07-02 19:09:49', '2021-07-02 19:09:49'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Gender'), 'Female', 1, 1, '2021-07-02 19:09:49', '2021-07-02 19:09:49'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type'), 'Weapon', 0, 1, '2021-07-17 21:34:15', '2021-09-15 18:55:01'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type'), 'Armor', 0, 1, '2021-07-17 21:34:15', '2021-09-15 18:55:03'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type'), 'Tool', 0, 1, '2021-07-17 21:36:18', '2021-09-15 18:55:05'),
(null, 1, 'Tool', 0, 1, '2021-08-20 00:56:08', '2021-09-15 18:48:45'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Tool Type'), 'Axe', 1, 1, '2021-08-28 18:45:24', '2021-09-01 17:00:30'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Tool Type'), 'Hammer', 1, 1, '2021-08-28 18:45:24', '2021-09-01 17:00:30'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Tool Type'), 'Saw', 1, 1, '2021-08-28 18:46:01', '2021-09-01 17:00:30'),
(null, (SELECT id FROM `editor_option` where `optionType` = 'Tool Type'), 'Pickaxe', 1, 1, '2021-09-01 19:00:19', '2021-09-01 19:00:19');

--
-- Updating data of table game_setting
--
DELETE FROM game_setting WHERE name = 'SKINNING_SKILL_ID';
DELETE FROM game_setting WHERE name = 'MAGICAL_ATTACKS_USE_WEAPON_DAMAGE';
DELETE FROM game_setting WHERE name = 'WEAPON_REQ_USES_SHARED_TYPES';
DELETE FROM game_setting WHERE name = 'SKINNING_WEAPON_REQ';
DELETE FROM game_setting WHERE name = 'AUCTION_START_PRICE_VALUE';
DELETE FROM game_setting WHERE name = 'AUCTION_START_PRICE_VALUE_PERCENTAGE';
DELETE FROM game_setting WHERE name = 'AUCTION_COST_PRICE_VALUE';
DELETE FROM game_setting WHERE name = 'AUCTION_COST_PRICE_VALUE_PERCENTAGE';
DELETE FROM game_setting WHERE name = 'AUCTION_DURATION';
DELETE FROM game_setting WHERE name = 'AUCTION_CURRENCY';
DELETE FROM game_setting WHERE name = 'AUCTION_LIMIT';
DELETE FROM game_setting WHERE name = 'AUCTION_OWN_LIMIT';

DELETE FROM game_setting WHERE name = 'REMOVE_ITEM_ON_BUILD_FAIL' and isactive = 0;
DELETE FROM game_setting WHERE name = 'ONLY_UPGRADE_CLAIM_OBJECT_WITH_ALL_ITEMS' and isactive = 0;


--
-- Inserting data into table game_setting
--
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT 'FALL_DAMAGE_TYPE', 'string', 'crash', 1, '2021-07-07 17:13:01', '2021-07-07 17:13:02') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'FALL_DAMAGE_TYPE') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'AUCTION_NPC_ONLY', 'bool', 'true', 1, '2021-07-26 21:14:39', '2021-07-26 21:14:40') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'AUCTION_NPC_ONLY') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'LOOT_DISTANCE', 'float', '7', 1, '2021-08-02 23:21:29', '2021-09-04 15:00:07') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'LOOT_DISTANCE') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'HIT_CHANCE_POINT_PER_PERCENTAGE', 'int', '10', 1, '2021-09-15 18:43:40', '2021-09-15 18:43:41') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'HIT_CHANCE_POINT_PER_PERCENTAGE') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'HIT_CHANCE_PERCENTAGE_PER_DIFF_LEVEL', 'int', '1' as value, 1, '2021-09-15 18:44:27', '2021-09-15 18:44:28') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'HIT_CHANCE_PERCENTAGE_PER_DIFF_LEVEL') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'STAT_RANDOM_HIT_STUN', 'float', '0', 1, '2021-09-15 22:37:08', '2021-09-15 22:37:09') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'STAT_RANDOM_HIT_STUN') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'STAT_RANDOM_HIT_SLEEP', 'float', '0', 1, '2021-09-15 22:37:37', '2021-09-15 22:37:38') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'STAT_RANDOM_HIT_SLEEP') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'STAT_RANDOM_HIT_INTERRUPTION', 'float', '0', 1, '2021-09-15 22:38:08', '2021-09-15 22:38:09') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'STAT_RANDOM_HIT_INTERRUPTION') LIMIT 1;
INSERT INTO game_setting( name, datatype, value, isactive, creationtimestamp, updatetimestamp) SELECT * FROM (SELECT  'SKINNING_MAX_DISTANCE', 'float', '5', 1, '2021-09-15 22:38:08', '2021-09-15 22:38:09') AS tmp WHERE NOT EXISTS (SELECT name FROM game_setting WHERE name = 'SKINNING_MAX_DISTANCE') LIMIT 1;


--
-- Inserting data into table item_slots
--
INSERT INTO item_slots(id, name, type, isactive, creationtimestamp, updatetimestamp) VALUES
(1, 'Main Hand', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Weapon'), 1, '2021-07-10 15:26:06', '2021-09-12 17:41:35'),
(2, 'Off Hand', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Weapon'), 1, '2021-07-10 15:26:06', '2000-01-01 00:00:00'),
(3, 'Head', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 15:26:36', '2000-01-01 00:00:00'),
(4, 'Chest', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 15:26:36', '2000-01-01 00:00:00'),
(5, 'Shirt', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:55:52', '2000-01-01 00:00:00'),
(6, 'Legs', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:55:52', '2000-01-01 00:00:00'),
(7, 'Feet', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:57:23', '2000-01-01 00:00:00'),
(8, 'Hands', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:57:23', '2000-01-01 00:00:00'),
(9, 'Shoulder', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:58:25', '2000-01-01 00:00:00'),
(10, 'Weist', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:58:25', '2000-01-01 00:00:00'),
(11, 'Back', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:59:09', '2021-08-20 00:38:26'),
(12, 'Neck', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:59:09', '2000-01-01 00:00:00'),
(13, 'Main Ring', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:59:35', '2000-01-01 00:00:00'),
(14, 'Off Ring', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 22:59:35', '2000-01-01 00:00:00'),
(15, 'Main Earring', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 23:00:03', '2000-01-01 00:00:00'),
(16, 'Off Earring', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 23:00:03', '2000-01-01 00:00:00'),
(17, 'Fashion', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Armor'), 1, '2021-07-10 23:01:02', '2000-01-01 00:00:00'),
(18, 'RangedWeapon', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Weapon'), 1, '2021-07-10 23:01:02', '2000-01-01 00:00:00'),
(19, 'Axe', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Tool'), 1, '2021-09-01 16:10:51', '2021-09-01 16:10:51'),
(20, 'Pickaxe', (SELECT id FROM `editor_option_choice` where `optionTypeID` = (SELECT id FROM `editor_option` where `optionType` = 'Item Slot Type') and choice = 'Tool'), 1, '2021-09-01 19:01:19', '2021-09-01 19:01:19');

--
-- Inserting data into table item_slots_group
--
INSERT INTO item_slots_group(id, name, all_slots, isactive, creationtimestamp, updatetimestamp) VALUES
(1, 'Two Hand', 1, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00'),
(2, 'Any Hand', 0, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00'),
(3, 'Ring', 0, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00'),
(4, 'Earring', 0, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00');

--
-- Inserting data into table item_slots_in_group
--
INSERT INTO item_slots_in_group(id, slot_group_id, slot_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 13),
(6, 3, 14),
(7, 4, 15),
(8, 4, 16);




--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

--
-- Enabling DML triggers for 
--
DELIMITER ;;

--
-- Enabling DML triggers for character_create_stats
--
CREATE 
TRIGGER character_create_stats_trigger
	BEFORE UPDATE
	ON character_create_stats
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for character_create_template
--
CREATE 
TRIGGER character_create_template_trigger
	BEFORE UPDATE
	ON character_create_template
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