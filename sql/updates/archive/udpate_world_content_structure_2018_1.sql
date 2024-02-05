-- 
-- Script was generated by Devart dbForge Studio for MySQL, Version 7.3.148.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2018-03-25 18:03:52
-- Please backup your target database before running this script
-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE `world_content`;

DELIMITER ;;

--
-- Drop trigger "updatetimestamp"
--
DROP TRIGGER IF EXISTS updatetimestamp;;

DELIMITER ;

--
-- Alter table "abilities"
--
ALTER TABLE abilities
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "achievement_categories"
--
ALTER TABLE achievement_categories
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "achievement_criteria"
--
ALTER TABLE achievement_criteria
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "achievement_subcategories"
--
ALTER TABLE achievement_subcategories
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "achievements"
--
ALTER TABLE achievements
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "arena_categories"
--
ALTER TABLE arena_categories
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "arena_teams"
--
ALTER TABLE arena_teams
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "arena_templates"
--
ALTER TABLE arena_templates
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "build_object_stage"
--
ALTER TABLE build_object_stage
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "build_object_template"
--
ALTER TABLE build_object_template
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "building_grids"
--
ALTER TABLE building_grids
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "character_create_items"
--
ALTER TABLE character_create_items
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "character_create_skills"
--
ALTER TABLE character_create_skills
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "character_create_stats"
--
ALTER TABLE character_create_stats
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "character_create_template"
--
ALTER TABLE character_create_template
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "coordinated_effects"
--
ALTER TABLE coordinated_effects
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "crafting_recipes"
--
ALTER TABLE crafting_recipes
  ADD COLUMN chance FLOAT NOT NULL DEFAULT 100 AFTER resultItem4Count,
  ADD COLUMN resultItem5ID INT(11) NOT NULL DEFAULT -1 AFTER chance,
  ADD COLUMN resultItem5Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem5ID,
  ADD COLUMN resultItem6ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem5Count,
  ADD COLUMN resultItem6Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem6ID,
  ADD COLUMN resultItem7ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem6Count,
  ADD COLUMN resultItem7Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem7ID,
  ADD COLUMN resultItem8ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem7Count,
  ADD COLUMN resultItem8Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem8ID,
  ADD COLUMN chance2 FLOAT NOT NULL DEFAULT 100 AFTER resultItem8Count,
  ADD COLUMN resultItem9ID INT(11) NOT NULL DEFAULT -1 AFTER chance2,
  ADD COLUMN resultItem9Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem9ID,
  ADD COLUMN resultItem10ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem9Count,
  ADD COLUMN resultItem10Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem10ID,
  ADD COLUMN resultItem11ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem10Count,
  ADD COLUMN resultItem11Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem11ID,
  ADD COLUMN resultItem12ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem11Count,
  ADD COLUMN resultItem12Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem12ID,
  ADD COLUMN chance3 FLOAT NOT NULL DEFAULT 100 AFTER resultItem12Count,
  ADD COLUMN resultItem13ID INT(11) NOT NULL DEFAULT -1 AFTER chance3,
  ADD COLUMN resultItem13Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem13ID,
  ADD COLUMN resultItem14ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem13Count,
  ADD COLUMN resultItem14Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem14ID,
  ADD COLUMN resultItem15ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem14Count,
  ADD COLUMN resultItem15Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem15ID,
  ADD COLUMN resultItem16ID INT(11) NOT NULL DEFAULT -1 AFTER resultItem15Count,
  ADD COLUMN resultItem16Count INT(11) NOT NULL DEFAULT 1 AFTER resultItem16ID,
  ADD COLUMN chance4 FLOAT NOT NULL DEFAULT 100 AFTER resultItem16Count,
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;

--
-- Alter table "currencies"
--
ALTER TABLE currencies
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "damage_type"
--
ALTER TABLE damage_type
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "dialogue"
--
ALTER TABLE dialogue
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "editor_option"
--
ALTER TABLE editor_option
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "editor_option_choice"
--
ALTER TABLE editor_option_choice
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "effects"
--
ALTER TABLE effects
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "events"
--
ALTER TABLE events
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "faction_stances"
--
ALTER TABLE faction_stances
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "factions"
--
ALTER TABLE factions
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "game_setting"
--
ALTER TABLE game_setting
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "graveyard"
--
ALTER TABLE graveyard
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "interactive_object"
--
ALTER TABLE interactive_object
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "item_templates"
--
ALTER TABLE item_templates
  ADD COLUMN damageMax INT(11) NOT NULL DEFAULT 0 AFTER damage,
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER isactive;

--
-- Alter table "item_templates_options"
--
ALTER TABLE item_templates_options
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CHANGE COLUMN updatetimestamp updatetimestamp TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00';

--
-- Alter table "item_weights"
--
ALTER TABLE item_weights
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "level_xp_requirements"
--
ALTER TABLE level_xp_requirements
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "loot_tables"
--
ALTER TABLE loot_tables
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "merchant_item"
--
ALTER TABLE merchant_item
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "merchant_tables"
--
ALTER TABLE merchant_tables
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "mob_display"
--
ALTER TABLE mob_display
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "mob_loot"
--
ALTER TABLE mob_loot
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "mob_stat"
--
ALTER TABLE mob_stat
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "mob_templates"
--
ALTER TABLE mob_templates
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "npcdisplay"
--
ALTER TABLE npcdisplay
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "patrol_path"
--
ALTER TABLE patrol_path
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "quest_objectives"
--
ALTER TABLE quest_objectives
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "quest_requirement"
--
ALTER TABLE quest_requirement
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CHANGE COLUMN updatetimestamp updatetimestamp TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00';

--
-- Alter table "quests"
--
ALTER TABLE quests
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "ranking1"
--
ALTER TABLE ranking1
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "region"
--
ALTER TABLE region
  CHANGE COLUMN creationtimetamp creationtimetamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "region_shape"
--
ALTER TABLE region_shape
  CHANGE COLUMN creationtimetamp creationtimetamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "resource_drop"
--
ALTER TABLE resource_drop
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "resource_grids"
--
ALTER TABLE resource_grids
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "resource_node_spawn"
--
ALTER TABLE resource_node_spawn
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "resource_node_template"
--
ALTER TABLE resource_node_template
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "skill_ability_gain"
--
ALTER TABLE skill_ability_gain
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "skills"
--
ALTER TABLE skills
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "spawn_data"
--
ALTER TABLE spawn_data
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "stat"
--
ALTER TABLE stat
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "task"
--
ALTER TABLE task
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "users"
--
ALTER TABLE users
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "voxeland_changes"
--
ALTER TABLE voxeland_changes
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter table "voxelands"
--
ALTER TABLE voxelands
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create table "weather_instance"
--
CREATE TABLE weather_instance (
  id INT(11) NOT NULL AUTO_INCREMENT,
  instance_id INT(11) NOT NULL,
  weather_profile_id INT(11) NOT NULL,
  month1 TINYINT(1) NOT NULL,
  month2 TINYINT(1) NOT NULL,
  month3 TINYINT(1) NOT NULL,
  month4 TINYINT(1) NOT NULL,
  month5 TINYINT(1) NOT NULL,
  month6 TINYINT(1) NOT NULL,
  month7 TINYINT(1) NOT NULL,
  month8 TINYINT(1) NOT NULL,
  month9 TINYINT(1) NOT NULL,
  month10 TINYINT(1) NOT NULL,
  month11 TINYINT(1) NOT NULL,
  month12 TINYINT(1) NOT NULL,
  priority INT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  INDEX instance_id (instance_id, weather_profile_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 27
AVG_ROW_LENGTH = 2340
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Create table "weather_profile"
--
CREATE TABLE weather_profile (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  temperature_min FLOAT NOT NULL,
  temperature_max FLOAT NOT NULL,
  humidity_min FLOAT NOT NULL,
  humidity_max FLOAT NOT NULL,
  wind_direction_min FLOAT NOT NULL,
  wind_direction_max FLOAT NOT NULL,
  wind_speed_min FLOAT NOT NULL,
  wind_speed_max FLOAT NOT NULL,
  wind_turbulence_min FLOAT NOT NULL,
  wind_turbulence_max FLOAT NOT NULL,
  fog_height_power_min FLOAT NOT NULL,
  fog_height_power_max FLOAT NOT NULL,
  fog_height_max FLOAT NOT NULL,
  fog_distance_power_min FLOAT NOT NULL,
  fog_distance_power_max FLOAT NOT NULL,
  fog_distance_max FLOAT NOT NULL,
  rain_power_min FLOAT NOT NULL,
  rain_power_max FLOAT NOT NULL,
  rain_power_terrain_min FLOAT NOT NULL,
  rain_power_terrain_max FLOAT NOT NULL,
  rain_min_height FLOAT NOT NULL,
  rain_max_height FLOAT NOT NULL,
  hail_power_min FLOAT NOT NULL,
  hail_power_max FLOAT NOT NULL,
  hail_power_terrain_min FLOAT NOT NULL,
  hail_power_terrain_max FLOAT NOT NULL,
  hail_min_height FLOAT NOT NULL,
  hail_max_height FLOAT NOT NULL,
  snow_power_min FLOAT NOT NULL,
  snow_power_max FLOAT NOT NULL,
  snow_power_terrain_min FLOAT NOT NULL,
  snow_power_terrain_max FLOAT NOT NULL,
  snow_min_height FLOAT NOT NULL,
  snow_age_min FLOAT NOT NULL,
  snow_age_max FLOAT NOT NULL,
  thunder_power_min FLOAT NOT NULL,
  thunder_power_max FLOAT NOT NULL,
  cloud_power_min FLOAT NOT NULL,
  cloud_power_max FLOAT NOT NULL,
  cloud_min_height FLOAT NOT NULL,
  cloud_max_height FLOAT NOT NULL,
  cloud_speed_min FLOAT NOT NULL,
  cloud_speed_max FLOAT NOT NULL,
  moon_phase_min FLOAT NOT NULL,
  moon_phase_max FLOAT NOT NULL,
  isactive INT(1) NOT NULL DEFAULT 0,
  priority INT(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Create table "weather_season"
--
CREATE TABLE weather_season (
  id INT(11) NOT NULL AUTO_INCREMENT,
  instance_id INT(11) NOT NULL,
  season INT(1) NOT NULL,
  month1 TINYINT(1) NOT NULL,
  month2 TINYINT(1) NOT NULL,
  month3 TINYINT(1) NOT NULL,
  month4 TINYINT(1) NOT NULL,
  month5 TINYINT(1) NOT NULL,
  month6 TINYINT(1) NOT NULL,
  month7 TINYINT(1) NOT NULL,
  month8 TINYINT(1) NOT NULL,
  month9 TINYINT(1) NOT NULL,
  month10 TINYINT(1) NOT NULL,
  month11 TINYINT(1) NOT NULL,
  month12 TINYINT(1) NOT NULL,
  PRIMARY KEY (id),
  INDEX instance_id (instance_id, season)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Alter table "survivalarenatemplates"
--
ALTER TABLE survivalarenatemplates
  CHANGE COLUMN creationtimestamp creationtimestamp TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

DELIMITER ;;

--
-- Create trigger "abilities_trigger"
--
CREATE TRIGGER abilities_trigger
	BEFORE UPDATE
	ON abilities
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "achievements_trigger"
--
CREATE TRIGGER achievements_trigger
	BEFORE UPDATE
	ON achievements
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "achievement_categories_trigger"
--
CREATE TRIGGER achievement_categories_trigger
	BEFORE UPDATE
	ON achievement_categories
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "achievement_criteria_trigger"
--
CREATE TRIGGER achievement_criteria_trigger
	BEFORE UPDATE
	ON achievement_criteria
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "achievement_subcategories_trigger"
--
CREATE TRIGGER achievement_subcategories_trigger
	BEFORE UPDATE
	ON achievement_subcategories
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "arena_categories_trigger"
--
CREATE TRIGGER arena_categories_trigger
	BEFORE UPDATE
	ON arena_categories
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "arena_teams_trigger"
--
CREATE TRIGGER arena_teams_trigger
	BEFORE UPDATE
	ON arena_teams
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "arena_templates_trigger"
--
CREATE TRIGGER arena_templates_trigger
	BEFORE UPDATE
	ON arena_templates
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "building_grids_trigger"
--
CREATE TRIGGER building_grids_trigger
	BEFORE UPDATE
	ON building_grids
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "build_object_stage_trigger"
--
CREATE TRIGGER build_object_stage_trigger
	BEFORE UPDATE
	ON build_object_stage
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "build_object_template_trigger"
--
CREATE TRIGGER build_object_template_trigger
	BEFORE UPDATE
	ON build_object_template
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "character_create_items_trigger"
--
CREATE TRIGGER character_create_items_trigger
	BEFORE UPDATE
	ON character_create_items
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "character_create_skills_trigger"
--
CREATE TRIGGER character_create_skills_trigger
	BEFORE UPDATE
	ON character_create_skills
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "character_create_stats_trigger"
--
CREATE TRIGGER character_create_stats_trigger
	BEFORE UPDATE
	ON character_create_stats
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "character_create_template_trigger"
--
CREATE TRIGGER character_create_template_trigger
	BEFORE UPDATE
	ON character_create_template
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "coordinated_effects_trigger"
--
CREATE TRIGGER coordinated_effects_trigger
	BEFORE UPDATE
	ON coordinated_effects
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "crafting_recipes_trigger"
--
CREATE TRIGGER crafting_recipes_trigger
	BEFORE UPDATE
	ON crafting_recipes
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "currencies_trigger"
--
CREATE TRIGGER currencies_trigger
	BEFORE UPDATE
	ON currencies
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "damage_type_trigger"
--
CREATE TRIGGER damage_type_trigger
	BEFORE UPDATE
	ON damage_type
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "dialogue_trigger"
--
CREATE TRIGGER dialogue_trigger
	BEFORE UPDATE
	ON dialogue
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "editor_option_choice_trigger"
--
CREATE TRIGGER editor_option_choice_trigger
	BEFORE UPDATE
	ON editor_option_choice
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "editor_option_trigger"
--
CREATE TRIGGER editor_option_trigger
	BEFORE UPDATE
	ON editor_option
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "effects_trigger"
--
CREATE TRIGGER effects_trigger
	BEFORE UPDATE
	ON effects
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "events_trigger"
--
CREATE TRIGGER events_trigger
	BEFORE UPDATE
	ON events
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "factions_trigger"
--
CREATE TRIGGER factions_trigger
	BEFORE UPDATE
	ON factions
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "faction_stances_trigger"
--
CREATE TRIGGER faction_stances_trigger
	BEFORE UPDATE
	ON faction_stances
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "game_setting_trigger"
--
CREATE TRIGGER game_setting_trigger
	BEFORE UPDATE
	ON game_setting
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "graveyard_trigger"
--
CREATE TRIGGER graveyard_trigger
	BEFORE UPDATE
	ON graveyard
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "interactive_object_trigger"
--
CREATE TRIGGER interactive_object_trigger
	BEFORE UPDATE
	ON interactive_object
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "item_templates_options_trigger"
--
CREATE TRIGGER item_templates_options_trigger
	BEFORE UPDATE
	ON item_templates_options
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "item_templates_trigger"
--
CREATE TRIGGER item_templates_trigger
	BEFORE UPDATE
	ON item_templates
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "item_weights_trigger"
--
CREATE TRIGGER item_weights_trigger
	BEFORE UPDATE
	ON item_weights
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "level_xp_requirements_trigger"
--
CREATE TRIGGER level_xp_requirements_trigger
	BEFORE UPDATE
	ON level_xp_requirements
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "loot_tables_trigger"
--
CREATE TRIGGER loot_tables_trigger
	BEFORE UPDATE
	ON loot_tables
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "merchant_item_trigger"
--
CREATE TRIGGER merchant_item_trigger
	BEFORE UPDATE
	ON merchant_item
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "merchant_tables_trigger"
--
CREATE TRIGGER merchant_tables_trigger
	BEFORE UPDATE
	ON merchant_tables
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "mob_display_trigger"
--
CREATE TRIGGER mob_display_trigger
	BEFORE UPDATE
	ON mob_display
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "mob_loot_trigger"
--
CREATE TRIGGER mob_loot_trigger
	BEFORE UPDATE
	ON mob_loot
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "mob_stat_trigger"
--
CREATE TRIGGER mob_stat_trigger
	BEFORE UPDATE
	ON mob_stat
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "mob_templates_trigger"
--
CREATE TRIGGER mob_templates_trigger
	BEFORE UPDATE
	ON mob_templates
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "npcdisplay_trigger"
--
CREATE TRIGGER npcdisplay_trigger
	BEFORE UPDATE
	ON npcdisplay
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "patrol_path_trigger"
--
CREATE TRIGGER patrol_path_trigger
	BEFORE UPDATE
	ON patrol_path
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "quests_trigger"
--
CREATE TRIGGER quests_trigger
	BEFORE UPDATE
	ON quests
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "quest_objectives_trigger"
--
CREATE TRIGGER quest_objectives_trigger
	BEFORE UPDATE
	ON quest_objectives
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "quest_requirement_trigger"
--
CREATE TRIGGER quest_requirement_trigger
	BEFORE UPDATE
	ON quest_requirement
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "ranking1_trigger"
--
CREATE TRIGGER ranking1_trigger
	BEFORE UPDATE
	ON ranking1
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "resource_drop_trigger"
--
CREATE TRIGGER resource_drop_trigger
	BEFORE UPDATE
	ON resource_drop
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "resource_grids_trigger"
--
CREATE TRIGGER resource_grids_trigger
	BEFORE UPDATE
	ON resource_grids
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "resource_node_spawn_trigger"
--
CREATE TRIGGER resource_node_spawn_trigger
	BEFORE UPDATE
	ON resource_node_spawn
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "resource_node_template_trigger"
--
CREATE TRIGGER resource_node_template_trigger
	BEFORE UPDATE
	ON resource_node_template
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "skills_trigger"
--
CREATE TRIGGER skills_trigger
	BEFORE UPDATE
	ON skills
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "skill_ability_gain_trigger"
--
CREATE TRIGGER skill_ability_gain_trigger
	BEFORE UPDATE
	ON skill_ability_gain
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "spawn_data_trigger"
--
CREATE TRIGGER spawn_data_trigger
	BEFORE UPDATE
	ON spawn_data
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "stat_trigger"
--
CREATE TRIGGER stat_trigger
	BEFORE UPDATE
	ON stat
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "survivalarenatemplates_trigger"
--
CREATE TRIGGER survivalarenatemplates_trigger
	BEFORE UPDATE
	ON survivalarenatemplates
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "task_trigger"
--
CREATE TRIGGER task_trigger
	BEFORE UPDATE
	ON task
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "users_trigger"
--
CREATE TRIGGER users_trigger
	BEFORE UPDATE
	ON users
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "voxelands_trigger"
--
CREATE TRIGGER voxelands_trigger
	BEFORE UPDATE
	ON voxelands
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

--
-- Create trigger "voxeland_changes_trigger"
--
CREATE TRIGGER voxeland_changes_trigger
	BEFORE UPDATE
	ON voxeland_changes
	FOR EACH ROW
SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;

DELIMITER ;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;