--
-- Script date 28.08.2020 16:21:05
-- Source server version: 5.7.31
--

SET NAMES 'utf8';
USE `world_content`;

--
-- Disabling DML triggers for abilities
--
DROP TRIGGER IF EXISTS abilities_trigger;

--
-- Disabling DML triggers for build_object_template
--
DROP TRIGGER IF EXISTS build_object_template_trigger;

--
-- Disabling DML triggers for character_create_items
--
DROP TRIGGER IF EXISTS character_create_items_trigger;

--
-- Disabling DML triggers for character_create_skills
--
DROP TRIGGER IF EXISTS character_create_skills_trigger;

--
-- Disabling DML triggers for character_create_stats
--
DROP TRIGGER IF EXISTS character_create_stats_trigger;

--
-- Disabling DML triggers for character_create_template
--
DROP TRIGGER IF EXISTS character_create_template_trigger;

--
-- Disabling DML triggers for coordinated_effects
--
DROP TRIGGER IF EXISTS coordinated_effects_trigger;

--
-- Disabling DML triggers for crafting_recipes
--
DROP TRIGGER IF EXISTS crafting_recipes_trigger;

--
-- Disabling DML triggers for currencies
--
DROP TRIGGER IF EXISTS currencies_trigger;

--
-- Disabling DML triggers for editor_option
--
DROP TRIGGER IF EXISTS editor_option_trigger;

--
-- Disabling DML triggers for editor_option_choice
--
DROP TRIGGER IF EXISTS editor_option_choice_trigger;

--
-- Disabling DML triggers for effects
--
DROP TRIGGER IF EXISTS effects_trigger;

--
-- Disabling DML triggers for game_setting
--
DROP TRIGGER IF EXISTS game_setting_trigger;

--
-- Disabling DML triggers for item_templates
--
DROP TRIGGER IF EXISTS item_templates_trigger;

--
-- Disabling DML triggers for mob_templates
--
DROP TRIGGER IF EXISTS mob_templates_trigger;

--
-- Disabling DML triggers for skills
--
DROP TRIGGER IF EXISTS skills_trigger;

--
-- Disabling DML triggers for stat
--
DROP TRIGGER IF EXISTS stat_trigger;
--
-- -- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;



--
-- Inserting data into table character_create_stats
--
INSERT INTO character_create_stats(id, character_create_id, stat, value, levelIncrease, levelPercentIncrease, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 1, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 1, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 1, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 2, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 2, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 3, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 3, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 4, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 4, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 5, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 5, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2000-01-01 00:00:00'),
(null, 6, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00'),
(null, 6, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2000-01-01 00:00:00');

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
132, 142);


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
-- Deleting data from table game_setting
--
DELETE FROM game_setting WHERE id = 123;

--
-- Inserting data into table game_setting
--
INSERT INTO game_setting(id, name, datatype, value, isactive, creationtimestamp, updatetimestamp) VALUES
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
UPDATE stat SET stat_function = 'Attack Speed', maxstat = '', onMaxHit = '', onMinHit = '', shiftReq1 = '', shiftReq2 = '', shiftReq3 = '', updatetimestamp = '2020-08-28 13:25:53' WHERE name = 'attack_speed';
UPDATE stat SET stat_function = 'Health', updatetimestamp = '2020-08-28 13:24:17' WHERE name = 'health';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:21:33' WHERE name = 'magical_critic';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:21:36' WHERE name = 'magical_evasion';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:22:07' WHERE name = 'magical_resistance';
UPDATE stat SET stat_function = 'Movement Speed', maxstat = '', onMaxHit = '', onMinHit = '', shiftReq1 = '', shiftReq2 = '', shiftReq3 = '', updatetimestamp = '2020-08-28 13:26:07' WHERE name = 'movement_speed';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:20:38' WHERE name = 'parry';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:21:39' WHERE name = 'physical_critic';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:21:47' WHERE name = 'physical_defense';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:21:49' WHERE name = 'physical_evasion';
UPDATE stat SET stat_function = '~ none ~', updatetimestamp = '2020-08-28 13:23:46' WHERE name = 'pierce_resistance';
UPDATE stat SET stat_function = '~ none ~', updatetimestamp = '2020-08-28 13:23:43' WHERE name = 'slash_resistance';
UPDATE stat SET maxstat = '', updatetimestamp = '2020-08-28 13:21:06' WHERE name = 'weight-max';

--
-- Inserting data into table stat
--
INSERT INTO stat(name, type, stat_function, mob_base, mob_level_increase, mob_level_percent_increase, min, maxstat, canExceedMax, sharedWithGroup, shiftTarget, shiftValue, shiftReverseValue, shiftInterval, isShiftPercent, onMaxHit, onMinHit, shiftReq1, shiftReq1State, shiftReq1SetReverse, shiftReq2, shiftReq2State, shiftReq2SetReverse, shiftReq3, shiftReq3State, shiftReq3SetReverse, startPercent, deathResetPercent, releaseResetPercent, isactive, creationtimestamp, updatetimestamp) VALUES
('cast_time', 0, 'Ability Cast Time', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:34:32', '2020-08-28 13:20:51'),
('cooldown', 0, 'Ability Cooldown', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:31:29', '2020-08-28 13:20:46'),
('cost', 0, 'Ability Cost', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:31:04', '2020-08-28 13:20:36'),
('damage_dealt', 0, 'Ability Health Dealt', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:29:30', '2020-08-28 13:21:17'),
('damage_rec', 0, 'Ability Damage Receive', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:29:02', '2020-08-28 13:20:54'),
('glob_cooldown', 0, 'Ability Global Cooldown', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:33:30', '2020-08-28 13:21:30'),
('health_dealt', 0, 'Ability Health Dealt', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:30:09', '2020-08-28 13:21:18'),
('health_rec', 0, 'Ability Health Receive', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:29:52', '2020-08-28 13:20:58'),
('health_shift', 0, '~ none ~', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-21 20:22:38', '2020-08-28 13:21:21'),
('magical_crit_power', 0, 'Magical Critic Power', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:32:28', '2020-08-28 13:21:54'),
('perception-stealth', 0, 'Perception Stealth', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-05-21 19:43:23', '2020-08-28 13:21:56'),
('physical_crit_power', 0, 'Physical Critic Power', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:32:53', '2020-08-28 13:21:58'),
('range', 0, 'Ability Range', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:28:31', '2020-08-28 13:20:41'),
('sleep_chance', 0, 'Sleep Chance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-06-14 20:33:22', '2020-08-28 13:21:28'),
('sleep_resistance', 0, 'Sleep Resistance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-06-14 20:34:33', '2020-08-28 13:21:51'),
('stamina', 2, '~ none ~', 0, 0, 0, 0, 'stamina-max', 0, 0, 1, 5, 0, 2, 1, '~ none ~', '~ none ~', 'sprint', 0, 0, '~ none ~', 0, 0, '~ none ~', 0, 0, 50, -1, -1, 1, '2020-06-29 15:10:06', '2020-06-29 18:21:13'),
('stamina-max', 0, '~ none ~', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-06-29 15:10:19', '2020-08-28 13:21:09'),
('stealth', 0, 'Stealth', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-05-21 19:43:36', '2020-08-28 13:20:44'),
('stun_chance', 0, 'Stun Chance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-06-14 20:33:38', '2020-08-28 13:21:14'),
('stun_resistance', 0, 'Stun Resistance', 0, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-06-14 20:34:54', '2020-08-28 13:21:41'),
('weapon_cooldown', 0, 'Ability Weapon Cooldown', 100, 0, 0, 0, '', 0, 0, 2, 0, 0, 2, 1, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '2020-04-16 13:35:04', '2020-08-28 13:21:43');
--
-- -- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

--
-- Enabling DML triggers for 
--
DELIMITER ;;

--
-- Enabling DML triggers for abilities
--
CREATE 
TRIGGER abilities_trigger
	BEFORE UPDATE
	ON abilities
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for build_object_template
--
CREATE 
TRIGGER build_object_template_trigger
	BEFORE UPDATE
	ON build_object_template
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for character_create_items
--
CREATE 
TRIGGER character_create_items_trigger
	BEFORE UPDATE
	ON character_create_items
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for character_create_skills
--
CREATE 
TRIGGER character_create_skills_trigger
	BEFORE UPDATE
	ON character_create_skills
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

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
-- Enabling DML triggers for coordinated_effects
--
CREATE 
TRIGGER coordinated_effects_trigger
	BEFORE UPDATE
	ON coordinated_effects
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for crafting_recipes
--
CREATE 
TRIGGER crafting_recipes_trigger
	BEFORE UPDATE
	ON crafting_recipes
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for currencies
--
CREATE 
TRIGGER currencies_trigger
	BEFORE UPDATE
	ON currencies
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
-- Enabling DML triggers for effects
--
CREATE 
TRIGGER effects_trigger
	BEFORE UPDATE
	ON effects
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
-- Enabling DML triggers for item_templates
--
CREATE 
TRIGGER item_templates_trigger
	BEFORE UPDATE
	ON item_templates
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for mob_templates
--
CREATE 
TRIGGER mob_templates_trigger
	BEFORE UPDATE
	ON mob_templates
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Enabling DML triggers for skills
--
CREATE 
TRIGGER skills_trigger
	BEFORE UPDATE
	ON skills
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