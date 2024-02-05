-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 20 Gru 2023, 17:24
-- Wersja serwera: 8.0.35-0ubuntu0.22.04.1
-- Wersja PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `x9core_world_content`
--
DROP DATABASE IF EXISTS `world_content`;
CREATE DATABASE IF NOT EXISTS `world_content` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `world_content`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `abilities`
--

DROP TABLE IF EXISTS `abilities`;
CREATE TABLE IF NOT EXISTS `abilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `abilityType` varchar(64) DEFAULT NULL,
  `skill` int DEFAULT NULL,
  `passive` tinyint(1) DEFAULT NULL,
  `activationCost` int DEFAULT NULL,
  `activationCostType` varchar(32) DEFAULT NULL,
  `activationLength` float DEFAULT NULL,
  `attack_time` float NOT NULL DEFAULT '0',
  `activationAnimation` varchar(32) DEFAULT NULL,
  `activationParticles` varchar(32) DEFAULT NULL,
  `casterEffectRequired` int DEFAULT NULL,
  `casterEffectConsumed` tinyint(1) DEFAULT NULL,
  `targetEffectRequired` int DEFAULT NULL,
  `targetEffectConsumed` tinyint(1) DEFAULT NULL,
  `weaponRequired` varchar(2048) DEFAULT NULL,
  `reagentRequired` int NOT NULL DEFAULT '-1',
  `reagentCount` int DEFAULT '1',
  `reagentConsumed` tinyint(1) DEFAULT NULL,
  `reagent2Required` int DEFAULT '-1',
  `reagent2Count` int DEFAULT '1',
  `reagent2Consumed` tinyint(1) DEFAULT '1',
  `reagent3Required` int DEFAULT '-1',
  `reagent3Count` int DEFAULT '1',
  `reagent3Consumed` tinyint(1) DEFAULT '1',
  `ammoUsed` int DEFAULT '0',
  `maxRange` int DEFAULT NULL,
  `minRange` int DEFAULT NULL,
  `aoeRadius` int NOT NULL DEFAULT '0',
  `aoeAngle` float NOT NULL DEFAULT '360',
  `aoeType` varchar(45) DEFAULT NULL,
  `reqTarget` tinyint(1) DEFAULT '1',
  `reqFacingTarget` tinyint(1) DEFAULT '0',
  `autoRotateToTarget` tinyint(1) DEFAULT '0',
  `relativePositionReq` int DEFAULT '0',
  `targetType` varchar(32) DEFAULT NULL,
  `targetSubType` varchar(64) NOT NULL DEFAULT '',
  `targetState` int DEFAULT NULL,
  `casterState` int NOT NULL DEFAULT '1',
  `speciesTargetReq` varchar(32) DEFAULT NULL,
  `specificTargetReq` varchar(64) DEFAULT NULL,
  `globalCooldown` tinyint(1) DEFAULT NULL,
  `cooldown1Type` varchar(32) DEFAULT NULL,
  `cooldown1Duration` float DEFAULT NULL,
  `weaponCooldown` tinyint(1) DEFAULT NULL,
  `startCooldownsOnActivation` tinyint(1) DEFAULT '0',
  `activationEffect1` int DEFAULT NULL,
  `activationTarget1` varchar(32) DEFAULT NULL,
  `activationEffect2` int DEFAULT NULL,
  `activationTarget2` varchar(32) DEFAULT NULL,
  `activationEffect3` int DEFAULT NULL,
  `activationTarget3` varchar(32) DEFAULT NULL,
  `activationEffect4` int DEFAULT '0',
  `activationTarget4` varchar(32) DEFAULT '0',
  `activationEffect5` int DEFAULT '0',
  `activationTarget5` varchar(32) DEFAULT '0',
  `activationEffect6` int DEFAULT '0',
  `activationTarget6` varchar(32) DEFAULT '0',
  `coordEffect1event` varchar(32) DEFAULT NULL,
  `coordEffect1` varchar(64) DEFAULT NULL,
  `coordEffect2event` varchar(32) DEFAULT NULL,
  `coordEffect2` varchar(64) DEFAULT NULL,
  `coordEffect3event` varchar(32) DEFAULT NULL,
  `coordEffect3` varchar(64) DEFAULT NULL,
  `coordEffect4event` varchar(32) DEFAULT NULL,
  `coordEffect4` varchar(64) DEFAULT NULL,
  `coordEffect5event` varchar(32) DEFAULT NULL,
  `coordEffect5` varchar(64) DEFAULT NULL,
  `tooltip` varchar(256) DEFAULT NULL,
  `interceptType` int DEFAULT NULL,
  `icon2` mediumtext NOT NULL,
  `chance` float NOT NULL DEFAULT '0',
  `castingInRun` tinyint(1) NOT NULL DEFAULT '0',
  `exp` int NOT NULL DEFAULT '0',
  `consumeOnActivation` tinyint(1) NOT NULL DEFAULT '0',
  `channelling` tinyint(1) NOT NULL DEFAULT '0',
  `channelling_cost` int NOT NULL DEFAULT '0',
  `channelling_pulse_num` int NOT NULL DEFAULT '1',
  `channelling_pulse_time` float NOT NULL DEFAULT '0.25',
  `channelling_in_run` tinyint(1) NOT NULL DEFAULT '0',
  `projectile` tinyint(1) NOT NULL DEFAULT '0',
  `projectile_speed` int NOT NULL DEFAULT '0',
  `activationDelay` float NOT NULL DEFAULT '0',
  `pulseCost` int DEFAULT '0',
  `pulseCostType` varchar(32) DEFAULT '',
  `pulseCasterEffectRequired` int DEFAULT '0',
  `pulseCasterEffectConsumed` tinyint(1) DEFAULT '0',
  `pulseTargetEffectRequired` int DEFAULT '0',
  `pulseTargetEffectConsumed` tinyint(1) DEFAULT '0',
  `pulseReagentRequired` int NOT NULL DEFAULT '-1',
  `pulseReagentCount` int DEFAULT '1',
  `pulseReagentConsumed` tinyint(1) DEFAULT '0',
  `pulseReagent2Required` int DEFAULT '-1',
  `pulseReagent2Count` int DEFAULT '1',
  `pulseReagent2Consumed` tinyint(1) DEFAULT '1',
  `pulseReagent3Required` int DEFAULT '-1',
  `pulseReagent3Count` int DEFAULT '1',
  `pulseReagent3Consumed` tinyint(1) DEFAULT '1',
  `pulseAmmoUsed` int DEFAULT '0',
  `skipChecks` tinyint(1) NOT NULL DEFAULT '0',
  `activationCostPercentage` float NOT NULL DEFAULT '0',
  `pulseCostPercentage` float NOT NULL DEFAULT '0',
  `aoePrefab` varchar(200) NOT NULL DEFAULT '',
  `stealth_reduce` tinyint(1) NOT NULL DEFAULT '0',
  `interruptible` tinyint(1) NOT NULL DEFAULT '0',
  `interruption_chance` float NOT NULL DEFAULT '0',
  `toggle` tinyint(1) NOT NULL DEFAULT '0',
  `tags` text NOT NULL,
  `tag_disable` int NOT NULL DEFAULT '-1',
  `tag_count` int NOT NULL DEFAULT '1',
  `speed` float NOT NULL DEFAULT '0',
  `chunk_length` float NOT NULL DEFAULT '1',
  `prediction` int NOT NULL DEFAULT '0',
  `aoe_target_count_type` int NOT NULL DEFAULT '0',
  `aoe_target_count` int NOT NULL DEFAULT '5',
  `attack_building` tinyint(1) NOT NULL DEFAULT '0',
  `damageType` varchar(256) NOT NULL DEFAULT '',
  `stealth_reduction_amount` int NOT NULL DEFAULT '0',
  `stealth_reduction_percentage` float NOT NULL DEFAULT '0',
  `stealth_reduction_timeout` bigint NOT NULL DEFAULT '0',
  `skill_up_chance` int NOT NULL DEFAULT '0',
  `miss_chance` float NOT NULL DEFAULT '0.05',
  `tags_on_caster` text NOT NULL,
  `tags_on_target` text NOT NULL,
  `tags_not_on_caster` text NOT NULL,
  `tags_not_on_target` text NOT NULL,
  `pulse_tags_on_caster` text NOT NULL,
  `pulse_tags_on_target` text NOT NULL,
  `pulse_tags_not_on_caster` text NOT NULL,
  `is_child` tinyint(1) NOT NULL DEFAULT '0',
  `combatState` int NOT NULL DEFAULT '2',
  `powerUpCoordEffect` varchar(128) NOT NULL DEFAULT '',
  `makeBusy` tinyint(1) NOT NULL DEFAULT '1',
  `checkBusy` tinyint(1) NOT NULL DEFAULT '1',
  `weaponMustBeDrawn` tinyint(1) NOT NULL DEFAULT '0',
  `drawnWeaponBefore` tinyint(1) NOT NULL DEFAULT '0',
  `enemyTargetChangeToSelf` tinyint(1) NOT NULL DEFAULT '0',
  `line_of_sight` tinyint(1) NOT NULL DEFAULT '0',
  `pulse_tags_not_on_target` text NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=862 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `abilities`
--
DROP TRIGGER IF EXISTS `abilities_trigger`;
DELIMITER ;;
CREATE TRIGGER `abilities_trigger` BEFORE UPDATE ON `abilities` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `abilities_coordeffects`
--

DROP TABLE IF EXISTS `abilities_coordeffects`;
CREATE TABLE IF NOT EXISTS `abilities_coordeffects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ability_power_id` int DEFAULT NULL,
  `coordEffectEvent` varchar(64) NOT NULL DEFAULT '',
  `coordEffect` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `abilityPowerId` (`ability_power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `abilities_powerup_settings`
--

DROP TABLE IF EXISTS `abilities_powerup_settings`;
CREATE TABLE IF NOT EXISTS `abilities_powerup_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ability_id` int DEFAULT NULL,
  `thresholdMaxTime` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ability_id` (`ability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `abilities_triggers`
--

DROP TABLE IF EXISTS `abilities_triggers`;
CREATE TABLE IF NOT EXISTS `abilities_triggers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ability_power_id` int NOT NULL DEFAULT '-1',
  `trigger_id` int NOT NULL DEFAULT '-1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `abilities_triggers_actions`
--

DROP TABLE IF EXISTS `abilities_triggers_actions`;
CREATE TABLE IF NOT EXISTS `abilities_triggers_actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `abilities_triggers_id` int NOT NULL,
  `target` int NOT NULL,
  `ability` int NOT NULL,
  `effect` int NOT NULL,
  `mod_v` int NOT NULL DEFAULT '0',
  `mod_p` float NOT NULL DEFAULT '0',
  `chance_min` float NOT NULL,
  `chance_max` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `abilities_triggers_profile`
--

DROP TABLE IF EXISTS `abilities_triggers_profile`;
CREATE TABLE IF NOT EXISTS `abilities_triggers_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `event_type` int NOT NULL,
  `tags` text NOT NULL,
  `race` int NOT NULL DEFAULT '-1',
  `class` int NOT NULL DEFAULT '-1',
  `action_type` tinyint NOT NULL,
  `chance_min` float NOT NULL DEFAULT '0',
  `chance_max` float NOT NULL DEFAULT '100',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_abilities`
--

DROP TABLE IF EXISTS `ability_abilities`;
CREATE TABLE IF NOT EXISTS `ability_abilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ability_power_id` int NOT NULL,
  `target` varchar(64) NOT NULL,
  `ability` int NOT NULL,
  `delay` int NOT NULL,
  `chance_min` float NOT NULL,
  `chance_max` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ability_id` (`ability_power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_combos`
--

DROP TABLE IF EXISTS `ability_combos`;
CREATE TABLE IF NOT EXISTS `ability_combos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ability_parent_id` int NOT NULL,
  `ability_sub_id` int NOT NULL,
  `chance_min` float NOT NULL DEFAULT '0',
  `chance_max` float NOT NULL DEFAULT '100',
  `show_in_center_ui` tinyint(1) NOT NULL DEFAULT '1',
  `replace_in_slot` tinyint(1) NOT NULL DEFAULT '1',
  `check_cooldown` tinyint(1) NOT NULL DEFAULT '1',
  `time` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ability_parent_id` (`ability_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_effects`
--

DROP TABLE IF EXISTS `ability_effects`;
CREATE TABLE IF NOT EXISTS `ability_effects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ability_power_id` int NOT NULL,
  `target` varchar(64) NOT NULL,
  `effect` int NOT NULL,
  `delay` int NOT NULL,
  `chance_min` float NOT NULL,
  `chance_max` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ability_id` (`ability_power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievements`
--

DROP TABLE IF EXISTS `achievements`;
CREATE TABLE IF NOT EXISTS `achievements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category` varchar(32) NOT NULL,
  `subcategory` varchar(32) DEFAULT NULL,
  `points` int NOT NULL,
  `text` text,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `achievements`
--
DROP TRIGGER IF EXISTS `achievements_trigger`;
DELIMITER ;;
CREATE TRIGGER `achievements_trigger` BEFORE UPDATE ON `achievements` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievement_bonuses`
--

DROP TABLE IF EXISTS `achievement_bonuses`;
CREATE TABLE IF NOT EXISTS `achievement_bonuses` (
  `achievement_id` int NOT NULL,
  `bonus_settings_id` int NOT NULL,
  `value` int NOT NULL,
  `valuep` float NOT NULL,
  KEY `vip_level_id` (`achievement_id`,`bonus_settings_id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `achievement_bonuses`
--

INSERT INTO `achievement_bonuses` (`achievement_id`, `bonus_settings_id`, `value`, `valuep`) VALUES
(2, 1, 0, 10),
(1, 1, 0, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievement_categories`
--

DROP TABLE IF EXISTS `achievement_categories`;
CREATE TABLE IF NOT EXISTS `achievement_categories` (
  `name` varchar(64) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `achievement_categories`
--
DROP TRIGGER IF EXISTS `achievement_categories_trigger`;
DELIMITER ;;
CREATE TRIGGER `achievement_categories_trigger` BEFORE UPDATE ON `achievement_categories` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievement_criteria`
--

DROP TABLE IF EXISTS `achievement_criteria`;
CREATE TABLE IF NOT EXISTS `achievement_criteria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `achievementID` int NOT NULL,
  `event` varchar(32) NOT NULL,
  `eventCount` int DEFAULT NULL,
  `resetEvent1` varchar(32) DEFAULT NULL,
  `resetEvent2` varchar(32) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `achievement_criteria`
--
DROP TRIGGER IF EXISTS `achievement_criteria_trigger`;
DELIMITER ;;
CREATE TRIGGER `achievement_criteria_trigger` BEFORE UPDATE ON `achievement_criteria` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievement_settings`
--

DROP TABLE IF EXISTS `achievement_settings`;
CREATE TABLE IF NOT EXISTS `achievement_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `value` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `objects` varchar(2048) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2730 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievement_stats`
--

DROP TABLE IF EXISTS `achievement_stats`;
CREATE TABLE IF NOT EXISTS `achievement_stats` (
  `achievement_id` int NOT NULL,
  `stat` varchar(45) NOT NULL,
  `value` int NOT NULL,
  `valuep` float NOT NULL,
  KEY `vip_level_id` (`achievement_id`,`stat`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `achievement_stats`
--

INSERT INTO `achievement_stats` (`achievement_id`, `stat`, `value`, `valuep`) VALUES
(2, 'mana-max', 100, 0),
(1, 'strength', 10, 0),
(1, 'potential', 10, 0),
(3, 'health-max', 200, 0),
(4, 'weight-max', 100, 0),
(6, 'weight-max', 50, 50),
(5, 'weight-max', 300, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `achievement_subcategories`
--

DROP TABLE IF EXISTS `achievement_subcategories`;
CREATE TABLE IF NOT EXISTS `achievement_subcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB AVG_ROW_LENGTH=3276 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `achievement_subcategories`
--
DROP TRIGGER IF EXISTS `achievement_subcategories_trigger`;
DELIMITER ;;
CREATE TRIGGER `achievement_subcategories_trigger` BEFORE UPDATE ON `achievement_subcategories` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arena_categories`
--

DROP TABLE IF EXISTS `arena_categories`;
CREATE TABLE IF NOT EXISTS `arena_categories` (
  `id` int NOT NULL,
  `skin1` varchar(64) NOT NULL,
  `skin2` varchar(64) DEFAULT NULL,
  `skin3` varchar(64) DEFAULT NULL,
  `skin4` varchar(64) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `arena_categories`
--
DROP TRIGGER IF EXISTS `arena_categories_trigger`;
DELIMITER ;;
CREATE TRIGGER `arena_categories_trigger` BEFORE UPDATE ON `arena_categories` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arena_teams`
--

DROP TABLE IF EXISTS `arena_teams`;
CREATE TABLE IF NOT EXISTS `arena_teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `arenaID` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `size` int NOT NULL,
  `race` varchar(32) DEFAULT NULL,
  `goal` int DEFAULT NULL,
  `spawnX` float DEFAULT NULL,
  `spawnY` float DEFAULT NULL,
  `spawnZ` float DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2048 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `arena_teams`
--
DROP TRIGGER IF EXISTS `arena_teams_trigger`;
DELIMITER ;;
CREATE TRIGGER `arena_teams_trigger` BEFORE UPDATE ON `arena_teams` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arena_templates`
--

DROP TABLE IF EXISTS `arena_templates`;
CREATE TABLE IF NOT EXISTS `arena_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `arenaType` int DEFAULT '1',
  `name` varchar(64) NOT NULL,
  `arenaCategory` int DEFAULT '1',
  `arenaInstanceID` int NOT NULL,
  `length` int DEFAULT NULL,
  `defaultWinner` int DEFAULT NULL,
  `team1` int NOT NULL DEFAULT '-1',
  `team2` int DEFAULT '-1',
  `team3` int DEFAULT '-1',
  `team4` int DEFAULT '-1',
  `levelReq` int DEFAULT '1',
  `levelMax` int NOT NULL,
  `victoryCurrency` int DEFAULT NULL,
  `victoryPayment` int DEFAULT NULL,
  `defeatCurrency` int DEFAULT NULL,
  `defeatPayment` int DEFAULT NULL,
  `victoryExp` int DEFAULT NULL,
  `defeatExp` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `start_hour` int NOT NULL DEFAULT '0',
  `start_minute` int NOT NULL DEFAULT '0',
  `end_hour` int NOT NULL DEFAULT '0',
  `end_minute` int NOT NULL DEFAULT '0',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `arena_templates`
--
DROP TRIGGER IF EXISTS `arena_templates_trigger`;
DELIMITER ;;
CREATE TRIGGER `arena_templates_trigger` BEFORE UPDATE ON `arena_templates` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auction_profile`
--

DROP TABLE IF EXISTS `auction_profile`;
CREATE TABLE IF NOT EXISTS `auction_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `cost_price_value` int NOT NULL,
  `cost_price_value_percentage` float NOT NULL,
  `currency` int NOT NULL,
  `duration` int NOT NULL,
  `display_limit` int NOT NULL,
  `own_limit` int NOT NULL,
  `start_price_value` int NOT NULL,
  `start_price_percentage` float NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `auction_profile`
--

INSERT INTO `auction_profile` (`id`, `name`, `cost_price_value`, `cost_price_value_percentage`, `currency`, `duration`, `display_limit`, `own_limit`, `start_price_value`, `start_price_percentage`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 'Default', 2, 5, 3, 8, 100, 10, 1, 10, 1, '2021-09-14 16:50:42', '2021-09-16 00:08:09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `behavior_conditions`
--

DROP TABLE IF EXISTS `behavior_conditions`;
CREATE TABLE IF NOT EXISTS `behavior_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conditions_group_id` int NOT NULL,
  `type` int NOT NULL COMMENT '0-Event; 1-Distance; 2-Stat; 3-Effect; 4-CombatState; 5-DeathState; 6-NumberOfTargets',
  `distance` float NOT NULL,
  `less` tinyint(1) NOT NULL,
  `stat_name` varchar(256) NOT NULL,
  `stat_value` float NOT NULL,
  `stat_vitality_percentage` tinyint(1) NOT NULL,
  `target` int NOT NULL DEFAULT '1' COMMENT '0-Caster; 1-Target',
  `effect_tag_id` int NOT NULL,
  `on_target` tinyint(1) NOT NULL,
  `combat_state` tinyint(1) NOT NULL,
  `death_state` tinyint(1) NOT NULL,
  `trigger_event_Id` int NOT NULL COMMENT '0-Parry; 1-Dodge; 2-Miss; 3-Damage; 4-Heal; 5-Critical; 6-Kill; 7-Stun; 8-Sleep',
  `target_number` int NOT NULL,
  `target_ally` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `conditions_group_id` (`conditions_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `behavior_conditions_group`
--

DROP TABLE IF EXISTS `behavior_conditions_group`;
CREATE TABLE IF NOT EXISTS `behavior_conditions_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_order` int NOT NULL,
  `behavior_id` int NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `behavior_id` (`behavior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bonuses_settings`
--

DROP TABLE IF EXISTS `bonuses_settings`;
CREATE TABLE IF NOT EXISTS `bonuses_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `code` varchar(20) NOT NULL,
  `param` varchar(100) NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 AVG_ROW_LENGTH=819 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `bonuses_settings`
--

INSERT INTO `bonuses_settings` (`id`, `name`, `code`, `param`, `isactive`) VALUES
(1, 'Exp Gain', 'ExpGain', 'vp', 1),
(2, 'Exp Lost PVE', 'ExpLostPVE', 'vp', 1),
(3, 'Exp Lost PVP', 'ExpLostPVP', '', 1),
(4, 'Price Merchant', 'PriceMerchant', 'vp', 1),
(5, 'Sell Factor', 'SellFactor', 'p', 1),
(6, 'Loot Chance', 'LootChance', 'p', 1),
(7, 'Auction Cost', 'AuctionCost', 'vp', 1),
(8, 'Auction Count', 'AuctionCount', 'v', 1),
(9, 'Enchanting Cost', 'EnchantingCost', 'vp', 1),
(10, 'Enchanting Chance', 'EnchantingChance', 'p', 1),
(11, 'Enchanting Time', 'EnchantingTime', 'v', 1),
(12, 'Socketing Cost', 'SocketingCost', 'vp', 1),
(13, 'Socketing Chance', 'SocketingChance', 'p', 1),
(14, 'Socketing Time', 'SocketingTime', 'v', 1),
(15, 'Reset Sockets Cost', 'ResetSocketsCost', 'vp', 1),
(16, 'Reset Sockets Chance', 'ResetSocketsChance', 'p', 1),
(17, 'Reset Sockets Time', 'ResetSocketsTime', 'v', 1),
(21, 'Harvest Time', 'HarvestTime', 'vp', 1),
(22, 'Crafting Chance', 'CraftingChance', 'p', 1),
(23, 'Crafting Time', 'CraftingTime', 'vp', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `building_grids`
--

DROP TABLE IF EXISTS `building_grids`;
CREATE TABLE IF NOT EXISTS `building_grids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance` varchar(45) NOT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `type` int DEFAULT NULL,
  `owner` bigint DEFAULT NULL,
  `layer_count` int DEFAULT '1',
  `building1` varchar(45) DEFAULT NULL,
  `building1_rotation` float DEFAULT NULL,
  `building2` varchar(45) DEFAULT NULL,
  `building2_rotation` float DEFAULT NULL,
  `building3` varchar(45) DEFAULT NULL,
  `building3_rotation` float DEFAULT NULL,
  `building4` varchar(45) DEFAULT NULL,
  `building4_rotation` float DEFAULT NULL,
  `building5` varchar(45) DEFAULT NULL,
  `building5_rotation` float DEFAULT NULL,
  `layer_height` float DEFAULT NULL,
  `blueprint1` int DEFAULT '-1',
  `blueprint2` int DEFAULT '-1',
  `blueprint3` int DEFAULT '-1',
  `blueprint4` int DEFAULT '-1',
  `blueprint5` int DEFAULT '-1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `building_grids`
--
DROP TRIGGER IF EXISTS `building_grids_trigger`;
DELIMITER ;;
CREATE TRIGGER `building_grids_trigger` BEFORE UPDATE ON `building_grids` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `build_object_limits`
--

DROP TABLE IF EXISTS `build_object_limits`;
CREATE TABLE IF NOT EXISTS `build_object_limits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `object_category` int NOT NULL,
  `count` int NOT NULL,
  `isactive` int NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `profile_id` (`profile_id`),
  KEY `profile_id_2` (`profile_id`,`isactive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `build_object_stage`
--

DROP TABLE IF EXISTS `build_object_stage`;
CREATE TABLE IF NOT EXISTS `build_object_stage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gameObject` varchar(256) NOT NULL,
  `nextStage` int NOT NULL DEFAULT '-1',
  `buildTimeReq` float NOT NULL DEFAULT '0',
  `repairTimeReq` float NOT NULL DEFAULT '0',
  `interactionType` varchar(256) NOT NULL,
  `interactionID` int NOT NULL,
  `interactionData1` varchar(256) NOT NULL,
  `health` int NOT NULL DEFAULT '0',
  `lootTable` int NOT NULL,
  `lootMinPercentage` float NOT NULL,
  `lootMaxPercentage` float NOT NULL,
  `itemReq1` int DEFAULT NULL,
  `itemReq1Count` int DEFAULT NULL,
  `itemReq2` int DEFAULT NULL,
  `itemReq2Count` int DEFAULT NULL,
  `itemReq3` int DEFAULT NULL,
  `itemReq3Count` int DEFAULT NULL,
  `itemReq4` int DEFAULT NULL,
  `itemReq4Count` int DEFAULT NULL,
  `itemReq5` int DEFAULT NULL,
  `itemReq5Count` int DEFAULT NULL,
  `itemReq6` int DEFAULT NULL,
  `itemReq6Count` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `build_object_stage`
--
DROP TRIGGER IF EXISTS `build_object_stage_trigger`;
DELIMITER ;;
CREATE TRIGGER `build_object_stage_trigger` BEFORE UPDATE ON `build_object_stage` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `build_object_stage_damaged`
--

DROP TABLE IF EXISTS `build_object_stage_damaged`;
CREATE TABLE IF NOT EXISTS `build_object_stage_damaged` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stage_id` int NOT NULL,
  `progress` smallint NOT NULL,
  `prefab` varchar(1000) NOT NULL,
  `trimesh` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `build_object_stage_items`
--

DROP TABLE IF EXISTS `build_object_stage_items`;
CREATE TABLE IF NOT EXISTS `build_object_stage_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stage_id` int NOT NULL,
  `item` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `build_object_stage_progress`
--

DROP TABLE IF EXISTS `build_object_stage_progress`;
CREATE TABLE IF NOT EXISTS `build_object_stage_progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stage_id` int NOT NULL,
  `progress` smallint NOT NULL,
  `prefab` varchar(1000) NOT NULL,
  `trimesh` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `build_object_template`
--

DROP TABLE IF EXISTS `build_object_template`;
CREATE TABLE IF NOT EXISTS `build_object_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `icon` varchar(256) NOT NULL,
  `category` int NOT NULL DEFAULT '0',
  `skill` int NOT NULL DEFAULT '0',
  `skillLevelReq` int NOT NULL DEFAULT '0',
  `weaponReq` varchar(45) NOT NULL,
  `distanceReq` float NOT NULL DEFAULT '1',
  `buildTaskReqPlayer` tinyint(1) NOT NULL DEFAULT '1',
  `buildSolo` tinyint(1) NOT NULL DEFAULT '0',
  `fixedTime` tinyint(1) NOT NULL DEFAULT '0',
  `validClaimType` varchar(2000) NOT NULL DEFAULT '',
  `firstStageID` int NOT NULL DEFAULT '0',
  `availableFromItemOnly` tinyint(1) NOT NULL DEFAULT '0',
  `interactionType` varchar(45) DEFAULT NULL,
  `interactionID` int DEFAULT '-1',
  `interactionData1` varchar(45) DEFAULT NULL,
  `lockable` tinyint(1) DEFAULT '0',
  `lockLimit` int DEFAULT '1',
  `claim_object_category` int NOT NULL DEFAULT '-1',
  `attackable` tinyint(1) NOT NULL DEFAULT '0',
  `repairable` tinyint(1) NOT NULL DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `icon2` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `build_object_template`
--
DROP TRIGGER IF EXISTS `build_object_template_trigger`;
DELIMITER ;;
CREATE TRIGGER `build_object_template_trigger` BEFORE UPDATE ON `build_object_template` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_create_gender`
--

DROP TABLE IF EXISTS `character_create_gender`;
CREATE TABLE IF NOT EXISTS `character_create_gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_create_id` int NOT NULL,
  `gender` int NOT NULL,
  `model` varchar(256) NOT NULL DEFAULT '',
  `icon` varchar(512) NOT NULL DEFAULT '',
  `icon2` mediumtext NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `character_create_gender`
--

INSERT INTO `character_create_gender` (`id`, `character_create_id`, `gender`, `model`, `icon`, `icon2`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 1, 413, 'Assets/Resources/HumanMaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/male.png', 'iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAACXBIWXMAAAsTAAALEwEAmpwYAAAgAElEQVR4nO19B3Qb15m1k83m303ZrG1JFIEZNgAz7CSAGfYm9k6x99577713SizqvdqyFFuS1WUVW7Yk15R1iu2NncRW4p6Nu2UJ85/7ZkCCkpxd77pJxjvnHVAkBYD47vv6d99ddxmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcRmXcX2XFs3yd1EGG/+mWU56/GY2ZfBoXF/xom4JgG8ABMxiAOjfi3F9/QD4fzTDmdAsr6JZ3p5mefVXvJ1olrehWd6MZvl/o1j++4bvx7i+4kUvfNjfo1j+hzTLQ/ieNMun0yxfQbN8I83wzeTxy91N0vPW0ixfQLN8JM3yDMXyPwYI9NrAuL4GANDi/mea5WU0y/M065JKMVyjqZVjzzIzm4FlZjaD0uOXufGcgyYWdn1ypaadZvkSmuWDAAJoAiMAvqZF6209w/+YZjk3muUzaWuXOorhukzMbTvvWW7ZereJRSsev8x993IL8rxL5Kp2mcK5m2ZdWkUQcJGSOTBqgK8VACz/M5rlI3DyZQqnLjNr134n36QZ79iqrT7xtdvw+KXuuOpteF7XsIL1Kk3gGEAgaYICyScwAuBrNgF30yyfSKm0vffKFJ2WDt4DMSVTx4tHTl4pmzj7VvHIqSv4+svaJWOPvI7nzerY90uAAJoA5gA+ASU6hkYAfM0AuIdm+TS5SjP8s6V0p8LJbyCteeflhg2/FJo2/0bAY8P6/8PesHg3bvoPoXnzb4SyiXNv+cbXboM5gE9As8QxRHRgBMA3AIBUuUoz9O/LzEQANO28WL/+F0LT5ucFPP5ftyj8X5HdtOl5oXnLb4WyyfOv+ywGQJMRAN+cCUiRq7SDd5uYd1o5+g4k1W16vHrmklC79hmheuby5+xL/6NdhT19Uahc/YRQufpx8nX17GWhYODIFc+Y8q33mFq1mpjbDkgholEDfFMAoFTawXtMLTutHHwGVpaufrxo6LhQOvaIUDx8UigeOSWU6PfoKaF45KRQNHxCKBo+LuD3brnJz08IBQNHhbyeg0J2534ho3WvkNG6R8hsu09IqFp7hQvK3rqEYlqXW9h/dwFAzadDOQPP/MZ07MK/59O2DH8Xha1P6EgpVfLIYH9eSpe7i1r8fPMAuFem7LS09xoIzel/HILK6nhAyGq/X8jq2CdkdzwgZHdKu2u/kNN1QMjp/rl+66Q9/73cngeFnO4DRNgpDduEhOr1wsqyaSGmdJWwsnS1EJbTd8XZN2nrMjObVlMrx+8uAERB6oXPEcGJ/75ZcJ9XOJkXvMEjPf9zfbxvKHTuJieQYrTDSymm08Lec8A/ufnJuIpZIaF6nZBQtY4IL7Fmg7hrNxKBZrbfL+R0Pyjk9R4U8voO6/L6DmEL+f2Hyc7tfYic+vSWXUJS3SYhvmqtEFsxK8SWT5Mdljtwxdkv+bsHgEXFj5sELQLAQGDfw0a6lma571EsJ/6b4b5PMyR3Pr9pcZOf04v+H9n/qNgjagCGQ5au08LWY8AzquxCaHbvtfC8QSE8d/B6eN7QtYj8YXEXjF6LLZ+9nt66hwi9cPCYTq/uxX1SKBw6LgAM0BZpzTsJAEQAAUjrCbAiCkavqFekbl1GW7eaWjp8hwBwUzVsPiNnAAruXyTByCiWt5ISJIiROQpZO4bzpBjem2J4H4rF5rxphveiWd6dZpDS5Z1phrelWF5Bs7ycZrl7aYb/EQ3g3GwWfkqzfAzFcB1SImjA0Tt+l1t44TmPqNIL7pEleCTbLaLoEdewglOBae2XUxq2vprXd+iDouET10rGHhFKx88IJWOnhaKRk3DwiBmAGUlt2i4k128hIEiqxd5IwBBZOHZF7S8CYPl3FQCL1LXoB/xAEghFsxwqch40y4eRRA3L5dAsX0oxXI1UqEEKtZ1i+HaK5doohmuSCixlNMPn0SyfjAwfzfLeNMs50gxnTrP8v9Ms98PF5V/+JzTL+1MMV0YxXBvN8r0069JvZu3aZ2bj2kcerV17seUqbQ/FaHtdwwo2J9Vteja//+F3SkZPXy2bOCuUTZ4jIIADmNvzEDEROP2pjdvJTmnYKgFhMwFCVNH4FbV/2taldzoAbjxxsL+U3taz/L/SLH8vzfI0xXAsxXCcXKX1M1U4hS23sI9dZm6btszMOm8pzZYtpZiaJRTTuESualsiV3Uukau6l8hVPdLulr7XtoRimpZSTO1Smi1fRlsXLDOzzTCxsIs3tXIMl6s0ELQrxXC2eE0REPwSScP406xLjlQMQmzevJS2xm6628S8/mdLqHoLO88e1/DC9VFF48ezOx/4Q/HIyQ/KJs5dK588L5SNnyXRQX7fYdHjb9srpDXvEtKadpBtCILkus1CdPHEFc13EQAG+wcUOem8hmb5YIrh0iiGq8QplKs0KJS0mlo5wT62LbewbzOxsGszMbdtx15mZnPrLf3cxMKO/J/llg5tplZObXguuUoDLdEODUIxXBbN8uEwKbRoJpaKWocPpBiumGK4ZorhuilG20OptN0mFnYdplaOXW7hhTj5z+T1HX6jZPT0JxB8xdRjAh7nhd8lCj+9dY+0d88DIbVxGwFBSv0WIaZk6oomIH3rUpq98wBwKzUvqd0fSiXP5RTD2chV2hUyhXPickv7PBNzu2oTc9sOmZXTkKW994StW+S0s1/KWpfQvE0e0WXbfOJrdq5IatoTkNp2X1BG577gzO4HQrJ69mPj66CMrn2Bae33+yc37/GNr9vlGVO+zTUsf7PGP22dnUf0jMLJb1KuVA+bmNt2mZjb1S63sC+QKZyS5SoNwAf/AlphBcVw6RJIupdbOnSbWjl2WruEjXqtrNwaX7nmXOHg0b+WTz76WcWqC0LFKlH4JaOndQX9D+sQGiLsS2vZRQQPIGS07dWlt+7WEXPQtH0eBN8ZACzE5rDv3DKp2yaEYrhMSqWtlinVrSYW9i0Ih5bR1m00w/U6+SSu9kus3xmRP3wooXrdufSWXU/ndB/4TcHAkT8UjZx8rWTszBtl4+feLp84/y522cS5d0rHzr6Jwk3B4NFXcnse/F1G655nk2o3PhZVNH7EP6V5jzYgY87C1qN/GU20RauJuV0LNAOl0tZSDJdNs3wczfJRFMPFUQwHX6N7mZlNl1yp7vKJr92e0bb3WRRyqqYvflIz+yTJ6FVMPkoSQwUDRyB8XSZR+6KgAQICgPb7dAQELbsXmYI7CgA32/lFfXb/JNlaqFp3uVIdY2rlWGBq5dQgV2l6Le29x+w8oqf54Ox1XjEVWwPT2u+LKZk6mtK47Ynszv2/Lhw4+nLp2COvV6x67L+qZy59XLPm6et1a58T6tf9Yr7ggq/r1j0n1K55Rlc9e/nTylUX3isdP/tG4dCxP+Z0//z5tOYdl2LLZ06GZHbv84mt3uYSmrfBwSsOWmGCYrg+mcKpwdTKsUSmVGdRjDZzuaV9hVyp6bLmQ8c9o8s2JdZsOF86fuaN6tnLn0H4SPFWTEH4p3X55OT/XMhsv48IP7Fm/bW4irmryfWbr0HwcAaJSfguAOAG71q/4eSh4SKBZvlymcK5aZmZTRNsNDxrJ5+E6eCMrgeS6zZdyO156Pclo6f/Wj55/t2KVRf+XjX9xAdE6LNPfloz99RntWueuV679hld3dpnicAXbXxv7bMAwfXaNU9fq5l78mr1zOWPq6Yvfli56vH3yqcefRdCzO8//FJq47ZL4XmDB7WBmWss7Dz74Ssso62blls6NMpV2ualFNNEMdpuv8SGXRmte58pGTv9l6qZS58ghw/Vr/f283oP6bI6H9Ah3EPCJ7lhixBVOPZBSGb3O7Fl0x9ktO7RIZNIft68S0ht3CGkNtxBJmA+JXuLRIuZtQtCun+nGE5NMdoUmVJdI1M49ZhZu44y2uAJ9YrUWe/Yqm2RBSOHMlp2P1U8fOLPVdMXP9ILtHbNM0LN3FNCtXTioHLJJkUVsbBy48bPqqaxL4rFmNnL5Dlq1zwt1K17Vqhb/xy+d7Vk9PRfsjr2/QKaBqYGQLB2CZ8ws3GDIPpVmsAR94iiDUm1m86Xjp99s3rm0mfk1K++QGJ9qPzcngd1We37yMlOadxG4vvY8ulPAlJa/+AVXf5sZMHoqxmtuyUAiI6gePq3CSn1dxIAbgzxxMQO1L6FGF9rM+VKTR3s7r0yRTujCRr3S2zYHV+55gxsden4mdcrVl0g6r12zdM44URwlasvoGQqIMlCii9Dx4XCwaOkuFLQ/zBJtyLbtpB+fZgkYAoHjgqFQ8dIQgb/t2ziHHHW9NU9aJDq2cufVK5+/L2yibNvQiMk1W16DI6lrVvkuLmtW59fYsPO9JbdT5WMnr5SPXPpE1T08Dx4TrxWdtcBXUbrXl1a006i1hHXRxdPfBaU3vEGH5R93N5j5ebQ7L7L6S27rwMARP2TnMC2OxAAizUA0q7/QjGcKcVofSlGW0iptC00y/dZOXiP2HtET+LDTarb/FjBwNFXqmYufkJO+9pnBL1txUkumzyng3NVOHxclz9whOTYxeLKzwXY2+zOAyTNmmWwEXvjZ9i5PWKOPn/gYYBBVzx6Slc2cVYHUEGY0CqiVnhOqJl78lrxyMnX0pp3PRmU3nGfV0zFZry/0omzb1XNXLpaPXtJKJ96lIAqt/chovIR3uE0I55HVm9l6epPgtM7/+oRUfwMow5cb27t1huc0XkqvWXXNfgGMA+LwsA7zwTMV9gQ5jEUw4XKlM55MoVzo6mlY6e5jXu/R2TxpoSqtWdyex76LU491H3N3FO6mrknSSyN0yqWT4/glOnyxdNN8u25vQdJcQWbFF/+wdb/Xi4p0ojPkY/df1hHNMTQcThvQvnko/Mmomrm4kflk+ffLhw8+nJe76EX8P6qZy99Wjn9hA72vnDwGAFfZvt9urSWXTp4+RAiikRRheOfBaV1vO4eXnTOzi1qs6mlY48Z69ITnNH1SFrzrmskLCSRgQiAO8IHWJzLX2ivphgO8T2SKRVIvCCNymiCxlyCc9bElk2jz+7V6pnLn+L0kQ9++iLiaF3R8Eldft/DupzuB3XZXQegYsWSKgQOIUoVNpxoCLFg8CgRyuIN83BEKBiQzINkIgh4oD3I8+4npVtU74qGjuvKJs7poHGgffCe4HeI+2kCDqR48XwI8eDQ4RRDeGJxZ70QUzr1SWBa+xvuEcXP2rlFb6WU2q67l5nXm9m49QZndp0DADJuBMCdkAfQO3r6sqqFnSceLSiG85cpnHPlSg3i6x5GGzTqn9y0J61px2Xi5M1c/BAnnqh52FTxxBOBwKPO7XkIW1TffYdFmz54jDReFI+cIL5A8SiaMk4LJaOPEK1BNr4ePS0UY+N3RsRmDahtSaPAYyc5evIavQfJa+K18R4gaAIEOIxrnyFmAt8DqEhmr3W3LrVxm06fy4+vXINizmeB6e1/cQsvPG/nHr3d0t57VKZw7rjbxEIEQFbPufSW3dfQSwAfIN0wLdy0XVhZtvqKNiDj9gLAjaEeHD5p/5RiOG+K4QoR5uHkkxg6qnRTSv2WxysmH/177dxTsLfkg9Z70jk94onPgdCJmn5YVNMosRp01YhCvcUm3Tqfv4v0JVriQB4jAsdriGblIX3jBvk+AAQvv2rm4vzJz+7arxOFj4reZtILEF+9TogqnvgkILX1TbeIomdsXCM3USotEkadCB3vlSubzG3c+oLSO86lNG67DvuvP/WkDlC/+b+vBTDfUgDcKHzJ219GMZyGUmmRy29B6lTh5Dfsn9yyF44VQq7q2cvX4OChYAKBQJXn9R5cOPHiadfBYcPPS0ZP6XCqIUScYnj4+D2ocTh8SK7Atoqp1vvI15nt+8jP8Du5PQ+RU4//i+cQNcZpXfHwSV3h0HFdweBR+AR6v4H4Bzjt+L0Fm38A8bsupXGbjgivYQuaOnSRhaNXA9LarriGFeDk77K09xpHGVmuVJPawVKabTazcevzjq2+EFU0DjMBYaP6hxyBEFkwKkQWjAhB6R1vOfokbFtmbouGkMVdwd9WAOiXQcyPUqoLxXCpcqW6lrZ26bO09xrSBmbOJuPkr7rwvmjrL+lKx88StU48+Z4HiX2HEETH7Nj8SYf3LwmMqGDYbwgcNpSo3+p1QlzFnBBbNk1aq9BmFVs+I8RVzpFGC4RkqY3bCTDwOvAXSE8fec6Ffj44g/N+A0JIKYwE2CSHT6rlbxZSGraQWD+2fObTgLS2t9zCC5+ycQnbgEIRTr9YOBK3ibldMzQgH5xzbkVS07WA1FbBP6VZ8E9uEvyTmoQVSY2CX2KD4BFddsXGLXLrckuHVpnC+fYwAfreO6nvDjN1qLHHylWauqUU22pu44Zumi3xlWtOFw4e+2P17JM6OHo4zYjfySnuflC0wRD+4BGoZ13xiHjiISDYbinWhu28llS3+e9xFbN/jSoa/0NYTv9vgtI7nvNPbn7KL6H+om983RO+8fUXVyQ2Xg5IaXk6KKPzF6E5fc9HFoy+FFs+cyWxdtPf0pp3XYVmgEN4s0Y4IZqaoWMkf4DXBWjEtK7o8BEAEOdtOxy3192jSh6zcY3YaW7jPmJq6dAkV6orpNoBCkjNqC+gnwDagQvKvsCH5D7JBWc/js0HZT/OBWVf5IKyLjv5Jh1XOK+YkSnVnXKVpkcaSLX/VgPAIOHzz5Lq5ymGK6JU2r6lFNvJciEjceUzJ0tGT/2lcvXjH1eufpwIFl2xJD6X+uckdS85dyd1pWNnyO8VDZ0gahlOE0Ks6OLJv4Vm973on9x8ySum/AgfnLXH0TtuvTUfukrhtGLUyt5nWOHoN8KoAydsXCNmHH3iN3JBmbs9okoOrUhsuBCS2fO7qKLxt+Kr1l6DBsHJLtCrevKap3WivyACDyABWFDI0Zdt8ShW8bZDjb/g7JeyGX8vxWj7KUaLsnGmVEBKl0rJOMloIBkwt3X/3K3POmIWUfw/XLo0mv7tA8AtmjR/RLO8nVyliVpu6VBjZu06YuMSPuWXULc9u+OBX1ZNP4FMG/mg9e1ROPkGwscHTwRAvHepjSqr44HPkuu3vBdTMvVacGb3877xdRfcwguPaPzT9tp7xGxiNIHTFnYeo3KlemC5hX3PMjNS2u2WWTn2Ugw3aGHnOa7SBEzbuUdtcPZL2e0amn/YO7b60aD0jl9GFY3/MbF2498y2u77FKYIDiTavkvHz5D3gveFDN98kqdeTNiQ0E0q4sSUrnrZPaL4PmQzIWBThVOjXKlBb0EUSsnoJ6BZHk0l6EHoMrGw68SgqYk5Hu06yb/J9+w6TS0dcPK7aJavw2CKOJpO+Am+fQBY6N3jDDtpA2RKdcFSmq2H04fCCTJomH+rmn5Ch/BMVPn6eP6wrnDgKIm/i0dOEOGXjp8lAIBAUEqNr1zz99Dsvpe8YipPOvkkbmK1wVNWjj4j5rYeQ+a27kNmNq5DNOsyRLP8IARuuPE92tplyMzalfwutqWD9wijCZx08Ixd7xFZcjg4o+v5lWXTb6c377oOTSM6fWcJIBGRIL07n6+X9kJL1zY4gW+H5fRf9ogq3adSB06YWNg1yRTOJVIp2VZqKtG3l3Wg0ZRiuOEb3uuQ9L1eSVtkiqPpvAkFkopvJwCkuF9M+yLho6QYLkWu1DSamNu22nvETMZWzJ4qHDz6StnE2Q8R48OTJkkdkng5RMI72Fty8sdOYxPVC6crvWXXR7HlM38NSu/8hVt40VF7j5jNFrbuw6ZWjujuaTAxt6sytXIslSmcC3DiKJUW6hZRB+b5UylGmyZXaTPkSnW2TOGcb2rlVGJiYVdpYm5bZ2rp0Gpm7TJg4xK+ziUk92BASsuTK0um/pzauO2DnO4Hr4sRxoNCZsc+XVrzLt0Ngifxv/g9aIPtH6c17XwtpmTqgnpF6hqZwqlNpnRuQD+B1FSydKG9jI9BtzFazqVH/U6VvpdIehYZjKZz4Cf44beWIWS+Yxd5fpaXUyqtt1ylKaMZrs+M5XvdwgrWZXfu/2XV9MWrxNtHXzxJujwo5PUdnLf5SNBA+KUTZ5GfJyc/vWX3Z9HFEy/7JdSdV69I2a5w8hvFKaZZl0GK0aKVq0yu0qTKVdpQSqV1pVRapJrlFMPBB1kiPaL2YEaptCyl0vKUShskV2mS5CpNMaXSolkUTZ7oNBp29E7Y6B1bdSo8d+D3CdXrPoJ6R5ImvWUXunZ0RN1LKl8PAH38Dv+gdPzs9bzeQ//pm1C/09LOEza8D00l6CySeh7QY/gTqbn1bklb3m2w7zH4HkbTf0yyqGIb+7cLALdo28YbdpYp1StNrRzrLe29Rp19kmZCs/v2Fwwc+RMyaFCr+kkZZPekgoxQRNT+KWIaYHsBivSW3Z8gI+aX2HDeySdxh6Wd59gyc1v0/zXKVZpqycEKpVnelWZ5a5rlltNoJL3F4AjFYC6A+5HUdaSS+v2QlgZ4KlDrX2ZmjUhlyMEzdrNnVNnJkKyel2NKpj5KrF5/XXT2diBti5SvblEjZ90mXVLdJh0KTqghFI+ceiu6ePIYF5S1RuG0YgKeP9rLpNdE88tdX3TfyFn0rVi3eKP4cANMrZxyltLWDdZ86ERwRte+tKbtlwsHj74F4cLLhvCR5CnoP4LBCcnbJ8InNh/eflbHA59EF0++7BtfC+FvsbDzHKZU2mG5Ut0nV6pLKUYL0gYHnHLplPxIKjZB0LcAAPFRvi9FKP8q/f7dUrdxkFypyZMp1V0UoyU+ha1b5DqX0NyT/slNv48unvhAP/EjCp+AYD6DB+En1mzQIauX30dyBu9ltOz+ZWTByEFHn4QZtJeZWNgXSI2m9B3DErYwsiVqAorhzCmGSzS1ckSLdpOjT8LqhOp1ZwsGHv5T4eCxD2HnpdKtLh9Onzg1I3r8xOMWM4EICZNqNr65IqnpUUev+B0Wdp6j6BAytXJqluJh0KXY0gz/s8/pMrpho818cUMKvThiUUo8PMVypbppuaU9ZgqGWG3wZj44+1RwRtefV5atvo6mDjFfr+/nJ1lAnR4ACAvR3ZPTdeCT/L7Df0WNwzWsYIPUY4jewiy0nM9HTfqZR4a767ZcIiLnBza/J/1xxaZWTt1LKaaNC8qay+q4/5dlk+c+ljxpMQ1Lwr2jkvCR5DmtQxoYzmFB/8OfJdVu/FtoVu+vtQEZO81tPYblKs2ITKnukCs1cJJcJK4c2NDv3zjrd2v1qQfALQdCv0eJIICjpZartCtlSnUTXpNm+WFb14iNntFlT4Zkdr8dVzH7KQSvB0BKwzZdMgHAZgKARMwIVq+H34K/62pe36H/9Imr2bbc3A7OapeUDHKhxCTZooHX23KJmT9y8jGX92O5SsPLVdo6qFGkO8F5k9d78A/ok4Odh9ePkM/A4ycZNyRdAADk2bM7978fkT/8gntE0XGVOmBKHI50QjyMiR8vSmwju2Ge74upRfpWIBG12U+kdGsxYnATC7tWmB4n36SHvGOrfh1VNP4uHD6DUJBoADiA0A5kwLNsmvwMM4AFA0ffCM7o3Gfl4N0P80Ux2nYyfCL+DZhf/MLv/Vu1DCZvMasnkymc/GQK53orB59xZ7/k6bCcvgdzex68UjIu2f4eMdmzkHI9BYcPTRXE9sMfSG3c8bpvfN1xG5fw9eY2bqOmVo4tMqW6SFL7VhTDocC0qNz8ZQCAXng+aIJAuUqbZ2rlhDh8SOG0Yk4bkPFgaE7fK8hAIgmkjwIAAKj+5LpNqDXoYitmoRGE3O4HUS18N6pw7AQfnD2nVPtPYqDF1MoR42jmFGYR/xfv/Vu1DP4AeP+2yy0dIpZbOtRZ86FTvvG1O+IqZs/ldB94U1+xk+J9UtFDjC9l2sQK29BxoiFiy2dfQh1crnDulSs1CKPqKYaLpBjehmK5RTx5X8aHR82HsPO+DCIFpb5xhWK0fTIrpx5rl7BZ/5Tm52JKV11LrBEdQskPmK8JwAygIog2MDR5pDXteC+ucu5SYFr7Hgev2BlEAyYW9vEUwzlTDAkH7xgAIMHhttzCPsnE3LbB3jN2Ojxv8KHUph3P5XQd+BtpzOwjjZnz49Jivv0RUgIGAPL7Dl1Nrt/ybmhW75N27tGzJmY2qIK1UAyXRzqHWe6n0vj3/AdGzM//8cOjbxhDJ+aF4f5Vig4QIjbBi1c4+Y55RJWeDc3ueyO2YvZTfVi4CAC1G3Tx1esAAtILmFS78cPk+i2/WVm66igXlLUOY2iYRaRZ3lfKCi76e25nAMjhRZtY2OUsM7NudPZLmYutmD2d1fHASzldP/8A6hAg0Jd2FypuAIA4NZvTtf+96OKJF71XVp5gtEGrTMztGmUK5zKa5aMltSyZnK/GaaLmB1PnQy0kYgIplbZ4uaU9Bj+HNf5pD/kl1P9HdPHEO8QXuAEA8ANQckZHEErQ8VVrPklr3vmn5PrNF9wjijaT+QIz6wKaIeZMKfETEADelsvg1FjQLLfSxMKudCnNNmkCMtYm1mx4AvY/p/vnHwMApIVr8Ki+wrdYA4w9glz/m8EZXZe0ARn7rBx9J5Zb2NfKlM5pEj/v3f9be/+F/xZ2UXiopVRahLWVSBDZuUXtdI8oOh+RP/yqCAAxEbQAAJHogQCgbFqIr5y7mt6y+82Uxm3PekaXbZcGTMrFlC+ZQAaxxe2vASiWQ2YtzcTCrmYpxTRzQVnrk+u3PJvXd+jd3J6HriLlq+/AkTp65gFAiBNGT8NmvuobV3vM1i1yk4WdBxgyq+VKTZiUO//pjQL6qv4WemEjWaSgGK2/TOlcjFSx0tl/ncY//cGwnP4XIfBFI90SyQMBAKIBUQNcS2/Z9V5Kw9bfeUaX75I0ADgKwE/gfOeYAIazoRku38TCrnkJxbTwITkbUxq3/ya//+GP8noPXkedP19qub6xq6d07AxxCFMbt6OUer/CySC7HLcAABr6SURBVG81poPkSnW5XKXx+LqrYDSzaDz9XorRquVKdR6qjBZ2nlOO3vHbQ7N7fw1hoxFEL3x9QygyhuANIhxCVWuvpzXv/DS5fssrnjHle5db2mPwFGzg5TTDocKH3MkdAQB7lDgxJ79ErmrByHZq886XCgaOXNe3X4vq/8Si9ispDCSgSGnY+oJLcM5WM2vXYZrlR+QqTYlcpXGQTuLXdlJogwQRqcAxWiu5SoOS7CDNugzbuUevCcnqwWTxotM/z/BB/ID1UP8ECJj3S6zd+BfP6PL7JQCA97eOZnj3O0cDsLwjzfLVJhZ2YOJodQnN35zavOOV+ZZr0t5lCIAFPj2S+x8+gU7Y32pWpK41RfOGmDRBpW6+A+brBwCnH2WTSeXlQZnCGd3Mk8EZnU+i719/6he0gOgIIhsIPwAAkCjg3vSMLtsnAQBJLaS0wVl0e/P/LziBhKCp1sTCrlcEQN6W1Mbtf0bsr6dFWwCAaAJQ7tW3W8E0JNZufN7RJ2F6GW3dKVeq0RRRRDGc1TcHAF7v4C6T+grA4d+tdF4xEpjWfpE0mILPB+ROEghEfh+QPK0nfgAaVPH9+Mo173hElT6w3NIBLCXdNMu3USzvrb8F5E4AgDPF8vUmFvZ9egBILFnzg5li1W9xD7+eNg3gSKjZ8LyDV/zqpRTbYQAAy28UAAwBwBI9AHB6rRx9hgJSW5+AgInTV7txHgQLAIAjuI5sMhVcNv2ue0TxfgDAxNwWDZ7tInvZba4BRBUpAgB2bbkEAD4kd0tS3eZXpcKPUNCPYQ4MckDo4qlHz53YcYs5gKNCQvWG5518EmdA0QJiZhEA2nkNoA8DvwENsGReA5jZdCkcfYf8U1qeiKtcQ4R/MwDESADqHyDBY3Tx5LuuYQUSAOx6aJG5zIcUs75N9f0vugw+JCeK5cCr0wtuWy44e0tizfo/oayb14vefoxkLwBA3CfEmb0htHk/DA3wW61/+hpKqUYvHGr/xXKVVnVDlu5r+5voeYpZmAAy1DIos3LsYTRBowGpbRdjK+bm2UFvBoDeEVxDooHIgpF3XEJyHzAFACzsYAJaYQL0PsBtnwiiGQ5OYNVyC/tu9P9rAzM3x1XMvYK5NzRXAgA46UXzql8/fHGMqH84iYm1G3/vFl6wycrea9DM2mVYrtSUyJUaJEvQY/i1mQDKQOOQVLNKK5erNGjJHjSzce2394iZCkrvkKhiRYpYqHkifDiBklkgAKiYk3h/B97kgrL2ST2MnTRDLobyWiCmvE0BoOfzoxnOjma4Uqi4pbR1i9o/bVNMydSLGNyAGTB0AA2ZtMnkzSCaRA7iw3vJJ65ml41L+IS5rfsI0sAypVpDkSvTFiqAX/WiF8wN4TKQqzQqmcI5y8zadZDRBI6Cqyg0q/c5JHrmeYLnzYC4iWmoXk9Of3TRhC44swuTvvcBAGhsoRmuVqLF+Z6euPq2XNLpx0lBP16u2Fdn0+Lkm7gxIm/o+ZT6LR/mdB24jqma+WHOGwGAOcCegwiXXglK7zwAahgrBx+UgStkCmfYSQrNpl83ACiWg+ZZJldpOFNLx3y0iYGdzDe+Duxkz5NMH0K96nUGZmCB6pUAoHzmekT+yCf+Ka1/cPZL3mOqcGrHZwRGU6k/EIWn2xcABnlzJc1yKaaWjuDya0affXBG1zMJVWvfye544OoiAEjqf57SRRrsTG/edSW6aOKkZ3T5FqU6YHy5hX21TOEUKY1D/dtiSvgv/wOjbr4iFgkoRq7UBJmY25VgptEtomhDeO7goZiSqZcwc4h5Q+Lo1UhaoHYxAGLLpj8Lyxn4L9+Eut84eMfvlCmcQU6JxpYcioXfJCWCvu3Dnp+3DJwlc5rho02tHItNLOybbN2i1q5Iarywsmz1a1nt938MQRtqAENOH0QJKBZlte97O7l+y9PBmd37WT50YinF1plaOWZKpdN7b7zG9cte1KJiE/kajaYucqU6ZQnFVFk5+Az5J7fsTqhefyG+au0VAoCK2cUAkDRAksT8HVs2/WlIZvfrXjEVT9u5R28DAEytHFHhTJJqHFIm8DbVAAYes0zqBs6CirPmQ+e8YspPRhaOvpDZtvd9EQBkFp+wfRhqAD0Acrof/CC768DLK8umTzt4xSIf0IQqnDRXR+7LuxEAX4ZZoOazfguxv0H4F4IO5CUUUw9msIj84cMZrXt/l1y/5W8ry2akgs8iAOiSajfqRAAQbqCPg9LaX3YLKzhv4xK+SaZUAwD56A6WWM5vfw0gddSgu4WXKZwSTK2c6lXqgGk+JOdAaHbv0+ktu9+d1wBDx0kj6CIAgJlDLBdfKxo+8V5q0/ZntQEZa5aZ2bRhskZKCLlQLH8PnEF93f5LAwCzmM2EElvH/40S6xuZcpWmFSwdNq4R43EVc4/m9R58J61552e3BACEX7tRR5zAmg2YFfzAP7kZza2HGU3QWrlS02aqcEqX0sCyOwIA0tUsuNyYlSmcw2QK5zorB+9JR+/4rf4pzY+kNm5/Yz4TKCV+yOy9BABQsyBfgFCxdOIs+uhe9omr2WHl4E3m+eQqDcgZY1FvkK5v+UpNACVO7VhTjDYMwyc06zJgYefez4fkrE1u2PIr1DcwnQzh42aPeQDow0FJ+HAOo4sn/+4TV/uEo1f8ToWj7zTAJFM4Y07QgWL4eww7mm/LZUD0jLk1E7lS4yNXaerNbFzHlc7+U57RZfsTqte/SgRMQHBcVzR0AiwcJAdAANB3iEwJASSoEeT1HXorrmLuLDqKlc4rRlFeXm5hjyaKeJp1QZsWCCZvStl+kQ+R/pz/L7acucDcRMgUTiVL5KpGeP/ukcUboorGj6a37vkzhlnRByBe7TJDegANAEA0AIQfWzEjhOcNIQV8lNEErTa3cZsgXcFijwNFM8TJvL0BoM9iib153L9QjFaL3ndcsihXqns0/mmboosnX8I8PTx9kg4emufkkXwAkeMvD+3iIhPHh3m9B19OqFl/xnlFympw/CPDKDFkrKBYfqkhCAxO7hd439ytUr7/RLHcv0tzBxUyhVMfiCutXcJHV5atPpLddeCFrI59fyd8v7UbCADiKmZu0gD4GUrB0UXjQnB6x181/un3gQ9AriTp7TaK0frRImfSfBh9e5sAg5u8kA+gGK4AbFgm5nataO4MTGt/Nr5yzftZHQ9cF9PBJAVMmkMLRS4eMiamv02roP/ItdLxM+/n9R78XXBG1/02rhETNOsystzCHpz8YO1eAU1As9zdN2qDG9vG9DeH/aObwSjMNDAIM13glHnJFM6paGyhGG4EFHa+CXXbsjv3P1cy9sh/ZXXs+wynG94/hB9XMStqgOr1ZDBEBAAp/lwPze792Ce2+vf2HjFbyZSwwhnj4HBquYX3vXAZ1m25Fn3oYuUMN3vEypTqyuWW9k0qTeAq9/Ci02E5/X9Ib9n1wWIAHJ0HAIiY0BIOIifM1mGQBBTvqY3bLwWmtu21dY0cRyMFQCBpggTE0TTL3fNFALCIxIrVN4DiNJKQDDmHGlMrp86lFNumVPsP+8bXbk+s2XCuZOyRv4ANNKNtDyF1iimZ1PMOLQIAagDQBNHFkx/7JTa8qg3MusBogtaR4VClM4ZZ0VdgfYPmub0BcMNGe7ivXKnJNLVybLC095pw9Irb6xtf+3hizcY30RpGSByHjhHSBQAAah9lY8Kn374PYCCdwuWTj14tGjr+alrzzosrkpt2snzoGIpEMAfwCeQqTSzFaEFAZSYxjiNljPH0RRM3NwDke1J72U/nL51iOGe5ShNpaulQhPEtuVIzrHT2H/GKqdiUXLf5XEH/w6Cj/whmK6VxqxBVPK6LLpnUkRyAlAlMqBEBgLQwkkPheUN/d48sRey/39Lee1qmVLfIlWqEfyGGw6H6yarb2gSIp27+5GFww55SaaNADGVm7TJq5eC9igvKug+TvqBXAQhEABwXASB1DWFgNLtzP+HWFx3C02AKvV4+ef7NlIZtj4NDmOVCxqR7f1pAPiGFiHFSssieYjm0p/8EU8C3ED4+8B9RLI8Rchup2zgacwdwXJHCxjWtVo6+Q57R5ZsTqtaeLh0782rV6ic+A0hh+yHwmJJJ3crS1TowkRH7L6aCcfp1+Dko34LTO9/QBmYcsnL0nTazdhmjVOAx0CZK198ArIaFtNvXCbwFQcQPKZYzoRjOTSRE0vbIFM49du5RawLT2p+Jr1r7ESjdRC0gOoIYEiXkjL0HiQ8AEGQRTXCIcARXrX7iWuHg0T+mNGy9EJTesdfZL2VaqQ4YQ5euTOmMUatKU0vHTKSNZQpnb7lSjRPNopdAmlbGtpSrNIxcqXaUKZw9EK6aWjmmISuH4ROa5QcUTn5jDl5xU36JDTsSa9afye87/AKIrPAewOgdXzlHBL+ydJUQWybVAarW6RLF009Sv6j8hWb3fuoTR2z/NtwghmvnKYaD+gdHkJxa5P3fpqr/xmU4ek2YLMQPPQGDopjtUzqvmHANyz8aktn9AkieCCWbxOELUkaRoRPEjA/hGlbw8BCqdSSI0DhSserCpxVTj72T13vodwlV684iT6BSB4KGrQMZwyUUg2aUalJAUqpLCfOHqB3mt1ylLcbPTK2cypdb2lcvpdjaJZSq0cTCrh05B/eI4k0rS1efyOk68KvyyfOvQ/iYW0T0AscuunhSF1MypSO8g3ACRfUvAkCq/UfkD3/kG1/7R21gxlmVOmBWpnTGBVcNEpEFOqd/8FXPN3wj6xb2FrOCvnKVNsfUyrHO3MZt2NYtcptHZMnpmOLJP2W07iUkTKRRhGgBkQEcZgDsm8SeVq3F0KUOtO8YGwehZOXqxz8oHDz2SlLdpkcDUlr3uITkrnPwilvNciETSmf/MTCSmNm4jsBXQFuZTOE8JFM4DcnQYqbSDoOtDFwDCqcVY4w2eNzOI2YKLB5+CfU74irmTuHUV0w99jfyWqsuCHk9D6HbV7eybLUuqnBMF10ypUPsLzl/pBSMEBB2H6o/KL3jdZeQ3As2LuF7LOw8wAyCMfMCyfYvX5RyvhMBYIBuqDmo4VAxm8YPm9u4jdl7rtwIwsbY8pmP4A9gVkDfGUSuV+nYR6hX4yrmxNNWMkVOF/wCzA9UTV+8VjP75IcVU4+9XTh07JWMtr3PrSybOR2U0bXfPap0i6NP4oxK7Q+b27+UYrruNrFov9vEvB13BqKjV+HoO2LvGbvaNbxwY0Bq2/3RJVMn0pp3PlUw8PB/lk+ex50/7+P2DwAOJgicvStLV+lw+rEBBEz/xleuEQGAa15r1gvRJZNCcEbnVa/o8t/au8fsMrd1H6dZfhRzhRSjXYnMn+Qf/a8nmm+LZVCwQZx7j3gdDJcPXwCq1sLec9AlJPdIcEbnKwnV694H757YOSzSr+LalMTajbrY8mkdEimR+cNCTPGkLrlusy6n8wCZIQBNO7n7Z+0zMA3v5fcfeTm9ZTdAdSIku3e/b3zddrfwgvUa/7QZR5+EKWz1ipRpl9C8tT6x1VuRW4gpWXU0tXHHpbzeQy+WTZ5/V39lDMiqIXyo/dSGbbD3OvD2RhdNwL7rTz8mfoSEqjVE7a8snxZCc/o/8l5Z9ZrGP+2slYPvlKmlI3gAemiWq6BZzoNmCGnmD+9IoRsuw9BGJGUiBQ9w+YDGrYW2dhmw5sPWu4bmHQ7N6X8xsWYDLlmev0lTolonAEC8TQiUi8Z1K0tW6dB9A7YuEiZKJqFm7ulrVTOXPoBGKBl75LXCoeOv5PcffjG356Hf4Taw7K4D/5Hdtf8/croOPI+LKPL7Dr9YOHjs5eLRU6+WTz76ZtX0xfdq5p66CgDA2QNhFWJ9qZKnQzcPIXQumULmD6Ef8fTJAGjVWpIPCM3uE3wT6l7V+KefYLmQzWY2buhmagMzmET1pqAZciDuzFNvuAzLtVICBgOW0ALxlEpbRbN8D8Vw/Zj+9YypOBueN/hOXMXcteT6LTjlYhNluZhlwwcuqV+JQXuUqOCkuo0kZ1AydoZcDqW/3kV/oUPdWmzcGmZ4c5h4Y5hec9RKv48TD65i5B2QjEpp2ELAB3uvP/kxpavI98TM35y4K+dAQq0Ly+m/7pdQ/55LcM6TjDZ4LejmcP0NxYAlhQPfH6Z/5gtY3wkA3PDHotz5M3jAiArAfImUKKFi84rb7hlVdi4wte2V8LyhzyBoMlGL+BpAqJwjHzzCLpzCSDhh0Aalq4n3jbk8NJ0ieigZOSVe8TJ9kQi2fv1zQsOGXwmNG38tNG76tdCw8VdC/fpfEICId/o9JhFUHyHaB2Pe8OZjy6Z10cUTBABRRWM3nXw9QGGecPL9Eur/wgdnP27nFrUXA63inQBci+T1q6WY/6bi1R2/5tOwC380evqQG8hB0gWawMLOY9iaC1nDBWae9Y6tfjsovfM61D1JsUqnDNk2AoKyVST7JgkH4ZYQUTCCWzVIFw6YueCxI1tXNn6G3AKGix3gL2CDn5DcMjZxVijGfQS9h8gdApjawetFFo6S58RzA2R4rUUnn7yXOfT4EZ8kJKvnum983Xt8cM5llg/dZG7rPkpOvkqL5FShxARK+AAND8V3Zi3OwPF3Wdp7ka4hiuHcyZydSttMqTQ9CA+t+dBtmhVpZzyjy18MTGt7Pzx3QHS65nvu1pATCPWPyIA4hwUjosCKxgkIcDLRj4cBTdC4oV4PnwK07mTj8ojWPSSbR+7wq9uEyV2icRC+AUzYor3Xe/so9c4Rpw8ggYaKyBuCt48izytcUNYFW7eoPSCglq6Nh90Hm4mvdCXed+/k69fnFGe+TzHcvfiA9DdwQxOY2biBhGmVk0/iYY/I4ldWJDV8FJLdcz2ycIx42HGVa0jcDQ8cdjemdBVRzRAIhBetv2kDp5gAQwSHuPX/NvhewQj5Xem0E7DhufCceG4ifHj7FbM6vDbq+lHF40JYTr/OP7n5E8/osr9oVqSeVmkCZ81t3Iclm98q8glxYRgmlW5KuekgfOeWoSmQwPAD6fIoH2gCmAO5Ut1BM1y/Sh2w3tE7/ohraN7TPvG1fwpMb38vLLefCAsCgu0XzQPMAgGDEFMCJxGe+pgQUTgihOcPC+F5g0JYLvbALfagEJ4/JJ52AKB4AoLXGQidvAa0CmJ7gBDPF5TR+aFfYv0Vt4jCXzr7Jp1ktcFbkIqWKzWd4BqmVFpQwIMKnhHNnVQfuZ0LPV+RLwCn8AcUwyFHQHwCiRIdA5MD5jZug9Z86EZNQPpp98iSF3zjaz8KTG0jDhciATiEcZWIEmaJrwCNQEwD7t0pgUaYFKKKJv7hJlqjZJKUdfF8eI6FE0+8eyGykJx4ISitHY7eVc+oMqj8x2zdIrdb2HmCQBKXOfRJDl8h8vy4Eg9TTPo+P8My+Xd23aokK1UO8SFBVQIECRSjrURRBgkUZAxZPnSbk0/iUT445xnPqLKX/RIa3gxM73g/LKf/WmSB6KyJwpwUoqG6ifrW71WiKsd9QQZb/31xT4lmxMCUkEijYBSaQheU0fXRiqSmt71iKv7kGpr3K2e/5FM2rhG7wBCCfgFTK6cWiiHXymNm0Fuy+f9syPypF/53yvbfuAw/BPEuAUkt4i5BWw8SHUghYpzULQNNMGJm4zZs5eAzwWqD1zh4xd7HB2Vf8Igq/YNPXM37K5KahMC0diE0q4eodNh3A3UumgoUbKSu3fmtv0QKYCkWBR5RMEpUfGh2L/L4gn9ys+ATXws7/2eXkNwnnXwSDlhzoesVjr6Tkr1HnQEnH8JPIbehMdxPzaxdb+iOWgT2b1oM3/z6bwidCcU8uRyB5fNRO5ApnOokjsAeKwefKVvXyD3OvkmnuMCsZ13DCl/yiql4zS+h/g3/lJZ3oRmCM7s/Cs3uvRqeO3Adnjqcvcj8kUWbOIB5QwJ+Jyy772pIZs/HQemd7wektP5tRWLDW94rK6+4RRS9zAVn/0rtl3LOzj36AaWT3yxUPfr5ZQqnerlKA65fsJYivw+OH6R45y/LMkiFfzedvi8CgBv8gnmyZvD/i04VyaaR6+RRWbNy9F2lVPvPWruEbXL0TtjPBWaecQ3Lf9ojquT3XjEVr/rEVb/tm1D7oV9iwzVcvYYr2Aw3vrciseG6X0LdRz5x1e96ray44hlV+qJbeMFzXFDWefAB27hGbFWpA+ZAVGVh7zlhZu06Jnn5jZRKW0AxXBQuwpJuQ/uJFNkYzBYs/tuM63PW5/TooZXrHsmT9pUyhyBthjZoMLVywqQQbgiBVlhlzYdts/eIOeDsm3hC4596gQvKfIYPyXneNTTvRbewglfcwgv/7BZe+Jq0/+wWVvBH19D8l1xCcn/DBWU9qwlIewJaxcEz9iEbl/AdCie/GaSpTa0cCS09XhNRinS/D1jKA3ARFjn1orN3E6iN63+4bnSSDHrjfiCVkn8mNZW4UQxpL8uSqzSVcpWmg2JIXX/cws5j0srBe1rh5DerVPuvVWkC1zPa4I0sF7LJmg/dbM2HbVm8QzfjZywXvJHRBK5XqQPWKp385qwcfabh3JnZuE6gE1iu0nRD1ctVmlxKpY2VrrzFfQL3SJoK17fc0pwZ1/9i3eqDJB+wSAlvIk0H+0mOItRwDaXS1suVmjqZUl1PrqBXQDs4NaPiaGrp2ILbNm+18TPyO1b4XSfc6NUoU6ob8FwizT1XJyWpkqQT70yjz3Ce33/BodW/d6Ot/z+uf+AbYP9QaqRYKrWcY+5AK1dpMYEUJleqE2RKdZZMqUa7VzURqMK5XaZw7kYDiEzh3C9tfI3+xA6ZwrlZplTXyJTqEplSnSNXqpPkSk2EXKXxky66xKUX5tL1Nz+TIpWbPHzD925cX+ISTcMtJncWeuj/RWIPZeGJUyznTzMcCKVhp3NxTSvNcFUUQy5crKdYvoESL19EZ1IZzfBoz06jWH4lxXKBFMu5UixvS8EJZfgfQ/MYklLPl7bvhO7d22EZ+gZ6MCzuMyDNJj+UBlIxlSyjWXJiYaetCV2NSFzpJNHXYTuJPEYczIkNLXIbg+BaTrHcUmrhpBvcRHJz/95tS+Z0O6+brqWV8uuLhz8W/858WCb9noH2+DxTc9didhB9Lt944r/x9Tmp5Plq44K6FjkLDW8Ik24yXahJ3GRauBsdz0UAMqp84zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu4zIu47qd1v8HI9nPARV74soAAAAASUVORK5CYII=', 1, '2021-09-15 18:46:34', '2023-10-27 01:39:50'),
(2, 1, 414, 'Assets/Resources/HumanFemaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/famale.png', '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', 1, '2021-09-15 18:46:34', '2023-10-27 01:39:50');
INSERT INTO `character_create_gender` (`id`, `character_create_id`, `gender`, `model`, `icon`, `icon2`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(3, 2, 413, 'Assets/Resources/HumanMaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/male.png', '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', 1, '2021-09-15 18:47:23', '2021-09-15 18:47:23'),
(4, 2, 414, 'Assets/Resources/HumanFemaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/famale.png', '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', 1, '2021-09-15 18:47:23', '2021-09-15 18:47:23');
INSERT INTO `character_create_gender` (`id`, `character_create_id`, `gender`, `model`, `icon`, `icon2`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(5, 3, 413, 'Assets/Resources/HumanMaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/male.png', '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', 1, '2021-09-15 18:48:38', '2021-09-15 18:48:38'),
(6, 3, 414, 'Assets/Resources/HumanFemaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/famale.png', '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', 1, '2021-09-15 18:48:38', '2021-09-15 18:48:38');
INSERT INTO `character_create_gender` (`id`, `character_create_id`, `gender`, `model`, `icon`, `icon2`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(7, 4, 413, 'Assets/Resources/OrcMaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/male.png', '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', 1, '2021-09-15 18:56:14', '2021-09-15 18:56:14'),
(8, 4, 414, 'Assets/Resources/OrcFemaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/famale.png', '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', 1, '2021-09-15 18:56:14', '2021-09-15 18:56:14');
INSERT INTO `character_create_gender` (`id`, `character_create_id`, `gender`, `model`, `icon`, `icon2`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(9, 5, 413, 'Assets/Resources/OrcMaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/male.png', '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', 1, '2021-09-15 18:57:23', '2021-09-15 18:57:23'),
(10, 5, 414, 'Assets/Resources/OrcFemaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/famale.png', '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', 1, '2021-09-15 18:57:23', '2021-09-15 18:57:23');
INSERT INTO `character_create_gender` (`id`, `character_create_id`, `gender`, `model`, `icon`, `icon2`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(11, 6, 413, 'Assets/Resources/OrcMaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/male.png', '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', 1, '2021-09-15 18:58:25', '2021-09-15 18:58:25'),
(12, 6, 414, 'Assets/Resources/OrcFemaleNonUma.prefab', 'Assets/Dragonsan/AtavismObjects/Textures/NewUi/Character Selection/famale.png', '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', 1, '2021-09-15 18:58:25', '2021-09-15 18:58:25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_create_items`
--

DROP TABLE IF EXISTS `character_create_items`;
CREATE TABLE IF NOT EXISTS `character_create_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_create_id` int NOT NULL,
  `item_id` int NOT NULL,
  `count` int NOT NULL DEFAULT '1',
  `equipped` tinyint(1) DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `character_create_items`
--
DROP TRIGGER IF EXISTS `character_create_items_trigger`;
DELIMITER ;;
CREATE TRIGGER `character_create_items_trigger` BEFORE UPDATE ON `character_create_items` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_create_skills`
--

DROP TABLE IF EXISTS `character_create_skills`;
CREATE TABLE IF NOT EXISTS `character_create_skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_create_id` int NOT NULL,
  `skill` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=442 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `character_create_skills`
--
DROP TRIGGER IF EXISTS `character_create_skills_trigger`;
DELIMITER ;;
CREATE TRIGGER `character_create_skills_trigger` BEFORE UPDATE ON `character_create_skills` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_create_stats`
--

DROP TABLE IF EXISTS `character_create_stats`;
CREATE TABLE IF NOT EXISTS `character_create_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_create_id` int NOT NULL,
  `stat` varchar(45) NOT NULL,
  `value` int NOT NULL,
  `levelIncrease` float NOT NULL DEFAULT '0',
  `levelPercentIncrease` float NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 AVG_ROW_LENGTH=210 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `character_create_stats`
--

INSERT INTO `character_create_stats` (`id`, `character_create_id`, `stat`, `value`, `levelIncrease`, `levelPercentIncrease`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 1, 'attack_speed', 2000, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(2, 1, 'crush_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(3, 1, 'dexterity', 10, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(4, 1, 'endurance', 15, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(5, 1, 'health', 2000000, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(6, 1, 'health-max', 2000000, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(7, 1, 'intelligence', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(8, 1, 'mana', 1200, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(9, 1, 'mana-max', 1200, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(10, 1, 'movement_speed', 7, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(11, 1, 'pierce_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(12, 1, 'potential', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(13, 1, 'slash_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(14, 1, 'strength', 15, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(15, 1, 'willpower', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(16, 2, 'attack_speed', 2000, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(17, 2, 'crush_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(18, 2, 'dexterity', 5, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(19, 2, 'endurance', 10, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(20, 2, 'health', 1500, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(21, 2, 'health-max', 1500, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(22, 2, 'intelligence', 15, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(23, 2, 'mana', 2000, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(24, 2, 'mana-max', 2000, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(25, 2, 'movement_speed', 7, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(26, 2, 'pierce_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(27, 2, 'potential', 15, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(28, 2, 'slash_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(29, 2, 'strength', 5, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(30, 2, 'willpower', 15, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(75, 1, 'critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:48'),
(76, 1, 'evasion', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(77, 1, 'magical_critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(78, 1, 'magical_evasion', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(79, 1, 'magical_resistance', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(80, 1, 'parry', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(81, 1, 'physical_critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(82, 1, 'physical_defense', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(83, 1, 'physical_evasion', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(84, 2, 'critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:09:38'),
(85, 2, 'evasion', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:22'),
(86, 2, 'magical_critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(87, 2, 'magical_evasion', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(88, 2, 'magical_resistance', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(89, 2, 'parry', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(90, 2, 'physical_critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(91, 2, 'physical_defense', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(92, 2, 'physical_evasion', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(93, 1, 'weight-max', 1000, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(94, 2, 'weight-max', 600, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(95, 1, 'weight', 1, 0, 0, 1, '2000-01-01 00:00:00', '2023-10-26 23:39:49'),
(96, 2, 'weight', 0, 0, 0, 1, '2000-01-01 00:00:00', '2021-09-15 16:47:23'),
(97, 3, 'attack_speed', 2000, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(98, 3, 'critic', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(99, 3, 'crush_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(100, 3, 'dexterity', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(101, 3, 'endurance', 10, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(102, 3, 'evasion', 20, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(103, 3, 'health', 1800, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(104, 3, 'health-max', 1800, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(105, 3, 'intelligence', 15, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(106, 3, 'magical_critic', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(107, 3, 'magical_evasion', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(108, 3, 'magical_resistance', 5, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(109, 3, 'mana', 1800, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(110, 3, 'mana-max', 1800, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(111, 3, 'movement_speed', 7, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(112, 3, 'parry', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(113, 3, 'physical_critic', 30, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(114, 3, 'physical_defense', 10, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(115, 3, 'physical_evasion', 20, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(116, 3, 'pierce_resistance', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:32'),
(117, 3, 'potential', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:33'),
(118, 3, 'slash_resistance', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:33'),
(119, 3, 'strength', 20, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:33'),
(120, 3, 'weight', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:33'),
(121, 3, 'weight-max', 800, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:33'),
(122, 3, 'willpower', 0, 0, 0, 1, '2000-01-01 00:00:00', '2023-04-24 20:57:33'),
(123, 4, 'attack_speed', 2000, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(124, 4, 'crush_resistance', 5, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(125, 4, 'dexterity', 10, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(126, 4, 'endurance', 15, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(127, 4, 'health', 2000, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(128, 4, 'health-max', 2000, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(129, 4, 'intelligence', 5, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(130, 4, 'mana', 1200, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(131, 4, 'mana-max', 1200, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(132, 4, 'movement_speed', 7, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(133, 4, 'pierce_resistance', 5, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(134, 4, 'potential', 5, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(135, 4, 'slash_resistance', 5, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(136, 4, 'strength', 15, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(137, 4, 'willpower', 5, 0, 0, 1, '2019-04-17 09:09:31', '2021-09-15 16:56:13'),
(138, 4, 'critic', 0, 0, 0, 1, '2019-04-17 09:09:32', '2023-01-18 00:09:38'),
(139, 4, 'evasion', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:13'),
(140, 4, 'magical_critic', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(141, 4, 'magical_evasion', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(142, 4, 'magical_resistance', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(143, 4, 'parry', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(144, 4, 'physical_critic', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(145, 4, 'physical_defense', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(146, 4, 'physical_evasion', 0, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(147, 4, 'weight-max', 1000, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(148, 4, 'weight', 1, 0, 0, 1, '2019-04-17 09:09:32', '2021-09-15 16:56:14'),
(149, 5, 'attack_speed', 2000, 0, 0, 1, '2019-04-17 09:09:42', '2021-09-15 16:57:22'),
(150, 5, 'crush_resistance', 5, 0, 0, 1, '2019-04-17 09:09:42', '2021-09-15 16:57:22'),
(151, 5, 'dexterity', 5, 0, 0, 1, '2019-04-17 09:09:42', '2021-09-15 16:57:22'),
(152, 5, 'endurance', 10, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:22'),
(153, 5, 'health', 1500, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:22'),
(154, 5, 'health-max', 1500, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:22'),
(155, 5, 'intelligence', 15, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(156, 5, 'mana', 2000, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(157, 5, 'mana-max', 2000, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(158, 5, 'movement_speed', 7, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(159, 5, 'pierce_resistance', 5, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(160, 5, 'potential', 15, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(161, 5, 'slash_resistance', 5, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(162, 5, 'strength', 5, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(163, 5, 'willpower', 15, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(164, 5, 'critic', 0, 0, 0, 1, '2019-04-17 09:09:43', '2023-01-18 00:09:38'),
(165, 5, 'evasion', 0, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(166, 5, 'magical_critic', 0, 0, 0, 1, '2019-04-17 09:09:43', '2021-09-15 16:57:23'),
(167, 5, 'magical_evasion', 0, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(168, 5, 'magical_resistance', 0, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(169, 5, 'parry', 0, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(170, 5, 'physical_critic', 0, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(171, 5, 'physical_defense', 0, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(172, 5, 'physical_evasion', 0, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(173, 5, 'weight-max', 600, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(174, 5, 'weight', 1, 0, 0, 1, '2019-04-17 09:09:44', '2021-09-15 16:57:23'),
(175, 6, 'attack_speed', 2000, 0, 0, 1, '2019-04-17 09:09:52', '2022-08-03 07:23:19'),
(176, 6, 'critic', 0, 0, 0, 1, '2019-04-17 09:09:52', '2023-01-18 00:09:38'),
(177, 6, 'crush_resistance', 5, 0, 0, 1, '2019-04-17 09:09:52', '2022-08-03 07:23:19'),
(178, 6, 'dexterity', 5, 0, 0, 1, '2019-04-17 09:09:52', '2022-08-03 07:23:19'),
(179, 6, 'endurance', 10, 0, 0, 1, '2019-04-17 09:09:52', '2022-08-03 07:23:19'),
(180, 6, 'evasion', 20, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(181, 6, 'health', 1800, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(182, 6, 'health-max', 1800, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(183, 6, 'intelligence', 15, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(184, 6, 'magical_critic', 5, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(185, 6, 'magical_evasion', 5, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(186, 6, 'magical_resistance', 5, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(187, 6, 'mana', 1800, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:19'),
(188, 6, 'mana-max', 1800, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:20'),
(189, 6, 'movement_speed', 7, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:20'),
(190, 6, 'parry', 0, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:20'),
(191, 6, 'physical_critic', 30, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:20'),
(192, 6, 'physical_defense', 10, 0, 0, 1, '2019-04-17 09:09:53', '2022-08-03 07:23:20'),
(193, 6, 'physical_evasion', 20, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(194, 6, 'pierce_resistance', 0, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(195, 6, 'potential', 0, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(196, 6, 'slash_resistance', 0, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(197, 6, 'strength', 20, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(198, 6, 'weight', 1, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(199, 6, 'weight-max', 800, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(200, 6, 'willpower', 0, 0, 0, 1, '2019-04-17 09:09:54', '2022-08-03 07:23:20'),
(201, 1, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(202, 1, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(203, 1, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(204, 1, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(205, 1, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(206, 1, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(207, 1, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:49'),
(208, 1, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:50'),
(209, 1, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:50'),
(210, 1, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:50'),
(211, 1, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:50'),
(212, 1, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-10-26 23:39:50'),
(213, 1, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(214, 1, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(215, 1, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(216, 1, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(217, 1, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(218, 1, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(219, 1, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(220, 1, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(221, 1, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-10-26 23:39:50'),
(222, 2, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(223, 2, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(224, 2, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(225, 2, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(226, 2, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(227, 2, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(228, 2, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(229, 2, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(230, 2, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:47:23'),
(231, 2, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(232, 2, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(233, 2, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(234, 2, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(235, 2, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(236, 2, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(237, 2, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(238, 2, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(239, 2, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(240, 2, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(241, 2, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(242, 2, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:47:23'),
(243, 3, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(244, 3, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(245, 3, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(246, 3, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(247, 3, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(248, 3, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(249, 3, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(250, 3, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(251, 3, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2023-04-24 20:57:33'),
(252, 3, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(253, 3, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(254, 3, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(255, 3, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(256, 3, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(257, 3, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(258, 3, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:33'),
(259, 3, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:34'),
(260, 3, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:34'),
(261, 3, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:34'),
(262, 3, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:34'),
(263, 3, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2023-04-24 20:57:34'),
(264, 4, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(265, 4, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(266, 4, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(267, 4, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(268, 4, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(269, 4, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(270, 4, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(271, 4, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(272, 4, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:56:14'),
(273, 4, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(274, 4, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(275, 4, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(276, 4, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(277, 4, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(278, 4, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(279, 4, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(280, 4, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(281, 4, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(282, 4, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(283, 4, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(284, 4, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:56:14'),
(285, 5, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(286, 5, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(287, 5, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(288, 5, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(289, 5, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(290, 5, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(291, 5, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(292, 5, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(293, 5, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2021-09-15 16:57:23'),
(294, 5, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(295, 5, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(296, 5, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(297, 5, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(298, 5, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(299, 5, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(300, 5, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(301, 5, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(302, 5, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(303, 5, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(304, 5, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(305, 5, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2021-09-15 16:57:23'),
(306, 6, 'weapon_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(307, 6, 'stun_resistance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(308, 6, 'stun_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(309, 6, 'stealth', 0, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(310, 6, 'stamina-max', 100, 1, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(311, 6, 'stamina', 100, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(312, 6, 'sleep_resistance', 0, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(313, 6, 'sleep_chance', 100, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(314, 6, 'range', 100, 0, 0, 1, '2020-08-28 11:21:06', '2022-08-03 07:23:20'),
(315, 6, 'physical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(316, 6, 'perception-stealth', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(317, 6, 'magical_crit_power', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(318, 6, 'health_shift', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(319, 6, 'health_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(320, 6, 'health_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(321, 6, 'glob_cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(322, 6, 'damage_rec', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(323, 6, 'damage_dealt', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(324, 6, 'cost', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(325, 6, 'cooldown', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(326, 6, 'cast_time', 100, 0, 0, 1, '2020-08-28 11:21:05', '2022-08-03 07:23:20'),
(327, 1, 'build_stat', 100, 0, 0, 1, '2021-06-26 16:41:06', '2023-10-26 23:39:50'),
(328, 2, 'build_stat', 100, 0, 0, 1, '2021-06-26 16:41:21', '2021-09-15 16:47:23'),
(329, 3, 'build_stat', 100, 0, 0, 1, '2021-06-26 16:41:39', '2023-04-24 20:57:34'),
(330, 4, 'build_stat', 100, 0, 0, 1, '2021-06-26 16:41:39', '2021-09-15 16:56:14'),
(331, 5, 'build_stat', 100, 0, 0, 1, '2021-06-26 16:41:39', '2021-09-15 16:57:23'),
(332, 6, 'build_stat', 100, 0, 0, 1, '2021-06-26 16:41:39', '2022-08-03 07:23:20');

--
-- Wyzwalacze `character_create_stats`
--
DROP TRIGGER IF EXISTS `character_create_stats_trigger`;
DELIMITER ;;
CREATE TRIGGER `character_create_stats_trigger` BEFORE UPDATE ON `character_create_stats` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `character_create_template`
--

DROP TABLE IF EXISTS `character_create_template`;
CREATE TABLE IF NOT EXISTS `character_create_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `race` int NOT NULL DEFAULT '-1',
  `aspect` int NOT NULL DEFAULT '-1',
  `instance` int NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `orientation` float NOT NULL,
  `faction` int NOT NULL DEFAULT '1',
  `autoAttack` int NOT NULL DEFAULT '-1',
  `race_icon` varchar(256) NOT NULL DEFAULT '',
  `race_icon2` mediumtext NOT NULL,
  `class_icon` varchar(256) NOT NULL DEFAULT '',
  `class_icon2` mediumtext NOT NULL,
  `race_description` varchar(2048) NOT NULL DEFAULT '',
  `class_description` varchar(2048) NOT NULL DEFAULT '',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `respawnInstance` int NOT NULL DEFAULT '-1',
  `respawnPosX` float(8,2) NOT NULL DEFAULT '0.00',
  `respawnPosY` float(8,2) NOT NULL DEFAULT '0.00',
  `respawnPosZ` float(8,2) NOT NULL DEFAULT '0.00',
  `startingLevel` int NOT NULL DEFAULT '1',
  `sprint` int NOT NULL DEFAULT '-1',
  `xpProfile` int DEFAULT '1',
  `dodge` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`race`,`aspect`)
) ENGINE=InnoDB AUTO_INCREMENT=7 AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `character_create_template`
--

INSERT INTO `character_create_template` (`id`, `race`, `aspect`, `instance`, `pos_x`, `pos_y`, `pos_z`, `orientation`, `faction`, `autoAttack`, `race_icon`, `race_icon2`, `class_icon`, `class_icon2`, `race_description`, `class_description`, `isactive`, `creationtimestamp`, `updatetimestamp`, `respawnInstance`, `respawnPosX`, `respawnPosY`, `respawnPosZ`, `startingLevel`, `sprint`, `xpProfile`, `dodge`) VALUES
(1, 22, 23, 29, -170, 74, 154, 0, 1, -1, 'Assets/Resources/Portraits/ChallengerT.png', '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', 'Assets/Dragonsan/AtavismObjects/Icons/Custom/Weapons/Greatsword/TwoHand00T.png', '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', 'Human Race Description', 'Warrior Class Description', 1, '2000-01-01 00:00:00', '2023-10-26 23:39:51', 29, -170.00, 74.00, 154.00, 1, 220018, 1, 220047);
INSERT INTO `character_create_template` (`id`, `race`, `aspect`, `instance`, `pos_x`, `pos_y`, `pos_z`, `orientation`, `faction`, `autoAttack`, `race_icon`, `race_icon2`, `class_icon`, `class_icon2`, `race_description`, `class_description`, `isactive`, `creationtimestamp`, `updatetimestamp`, `respawnInstance`, `respawnPosX`, `respawnPosY`, `respawnPosZ`, `startingLevel`, `sprint`, `xpProfile`, `dodge`) VALUES
(2, 22, 24, 29, -170, 74, 154, 0, 1, -1, 'Assets/Resources/Portraits/ChallengerT.png', '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', 'Assets/Dragonsan/AtavismObjects/Icons/Custom/Weapons/Staff/Staff00T.png', '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', 'Human Race Description', 'Mage Class Description', 1, '2000-01-01 00:00:00', '2023-10-26 23:39:52', 29, -170.00, 74.00, 154.00, 1, 220018, 1, -1);
INSERT INTO `character_create_template` (`id`, `race`, `aspect`, `instance`, `pos_x`, `pos_y`, `pos_z`, `orientation`, `faction`, `autoAttack`, `race_icon`, `race_icon2`, `class_icon`, `class_icon2`, `race_description`, `class_description`, `isactive`, `creationtimestamp`, `updatetimestamp`, `respawnInstance`, `respawnPosX`, `respawnPosY`, `respawnPosZ`, `startingLevel`, `sprint`, `xpProfile`, `dodge`) VALUES
(3, 22, 25, 29, -170, 74, 154, 0, 1, -1, 'Assets/Resources/Portraits/ChallengerT.png', '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', 'Assets/Dragonsan/AtavismObjects/Icons/Custom/Weapons/Bow/Bow02T.png', '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', 'Human Race Description', 'Rogue Class Description', 1, '2000-01-01 00:00:00', '2023-10-26 23:39:52', 29, -170.00, 74.00, 154.00, 1, 220018, 1, -1);
INSERT INTO `character_create_template` (`id`, `race`, `aspect`, `instance`, `pos_x`, `pos_y`, `pos_z`, `orientation`, `faction`, `autoAttack`, `race_icon`, `race_icon2`, `class_icon`, `class_icon2`, `race_description`, `class_description`, `isactive`, `creationtimestamp`, `updatetimestamp`, `respawnInstance`, `respawnPosX`, `respawnPosY`, `respawnPosZ`, `startingLevel`, `sprint`, `xpProfile`, `dodge`) VALUES
(4, 143, 23, 29, -170, 74, 154, 0, 1, -1, 'Assets/Resources/Portraits/OrcRace4A.jpg', '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', 'Assets/Dragonsan/AtavismObjects/Icons/Custom/Weapons/Greatsword/TwoHand00T.png', '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', 'Orc Race Description', 'Warrior Class Description', 1, '2019-04-17 09:09:30', '2021-09-15 16:56:13', 29, -170.00, 74.00, 154.00, 1, 220018, 1, -1),
(5, 143, 24, 29, -170, 74, 154, 0, 1, -1, 'Assets/Resources/Portraits/OrcRace4A.jpg', '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', 'Assets/Dragonsan/AtavismObjects/Icons/Custom/Weapons/Staff/Staff00T.png', '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', 'Orc Race Description ', 'Mage Class Description ', 1, '2019-04-17 09:09:42', '2021-09-15 16:57:22', 29, -170.00, 74.00, 154.00, 1, 220018, 1, -1),
(6, 143, 25, 29, -170, 74, 154, 0, 1, -1, 'Assets/Resources/Portraits/OrcRace4A.jpg', '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', 'Assets/Dragonsan/AtavismObjects/Icons/Custom/Weapons/Bow/Bow02T.png', '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', 'Orc Race Description ', 'Rouge Class Description ', 1, '2019-04-17 09:09:52', '2021-09-15 16:58:24', 29, -170.00, 74.00, 154.00, 1, 220018, 1, -1);

--
-- Wyzwalacze `character_create_template`
--
DROP TRIGGER IF EXISTS `character_create_template_trigger`;
DELIMITER ;;
CREATE TRIGGER `character_create_template_trigger` BEFORE UPDATE ON `character_create_template` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `claim_profile`
--

DROP TABLE IF EXISTS `claim_profile`;
CREATE TABLE IF NOT EXISTS `claim_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `coordinated_effects`
--

DROP TABLE IF EXISTS `coordinated_effects`;
CREATE TABLE IF NOT EXISTS `coordinated_effects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `prefab` varchar(256) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1260 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `coordinated_effects`
--
DROP TRIGGER IF EXISTS `coordinated_effects_trigger`;
DELIMITER ;;
CREATE TRIGGER `coordinated_effects_trigger` BEFORE UPDATE ON `coordinated_effects` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crafting_recipes`
--

DROP TABLE IF EXISTS `crafting_recipes`;
CREATE TABLE IF NOT EXISTS `crafting_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `resultItemID` int DEFAULT NULL,
  `resultItemCount` int DEFAULT '1',
  `resultItem2ID` int DEFAULT '-1',
  `resultItem2Count` int DEFAULT NULL,
  `resultItem3ID` int DEFAULT '-1',
  `resultItem3Count` int DEFAULT NULL,
  `resultItem4ID` int DEFAULT '-1',
  `resultItem4Count` int DEFAULT NULL,
  `chance` float NOT NULL DEFAULT '100',
  `resultItem5ID` int NOT NULL DEFAULT '-1',
  `resultItem5Count` int NOT NULL DEFAULT '1',
  `resultItem6ID` int NOT NULL DEFAULT '-1',
  `resultItem6Count` int NOT NULL DEFAULT '1',
  `resultItem7ID` int NOT NULL DEFAULT '-1',
  `resultItem7Count` int NOT NULL DEFAULT '1',
  `resultItem8ID` int NOT NULL DEFAULT '-1',
  `resultItem8Count` int NOT NULL DEFAULT '1',
  `chance2` float NOT NULL DEFAULT '100',
  `resultItem9ID` int NOT NULL DEFAULT '-1',
  `resultItem9Count` int NOT NULL DEFAULT '1',
  `resultItem10ID` int NOT NULL DEFAULT '-1',
  `resultItem10Count` int NOT NULL DEFAULT '1',
  `resultItem11ID` int NOT NULL DEFAULT '-1',
  `resultItem11Count` int NOT NULL DEFAULT '1',
  `resultItem12ID` int NOT NULL DEFAULT '-1',
  `resultItem12Count` int NOT NULL DEFAULT '1',
  `chance3` float NOT NULL DEFAULT '100',
  `resultItem13ID` int NOT NULL DEFAULT '-1',
  `resultItem13Count` int NOT NULL DEFAULT '1',
  `resultItem14ID` int NOT NULL DEFAULT '-1',
  `resultItem14Count` int NOT NULL DEFAULT '1',
  `resultItem15ID` int NOT NULL DEFAULT '-1',
  `resultItem15Count` int NOT NULL DEFAULT '1',
  `resultItem16ID` int NOT NULL DEFAULT '-1',
  `resultItem16Count` int NOT NULL DEFAULT '1',
  `chance4` float NOT NULL DEFAULT '100',
  `skillID` int DEFAULT NULL,
  `skillLevelReq` int DEFAULT NULL,
  `skillLevelMax` int DEFAULT NULL,
  `stationReq` varchar(45) DEFAULT NULL,
  `creationTime` int DEFAULT '0',
  `recipeItemID` int DEFAULT NULL,
  `layoutReq` tinyint(1) DEFAULT '1',
  `qualityChangeable` tinyint(1) DEFAULT NULL,
  `allowDyes` tinyint(1) DEFAULT NULL,
  `allowEssences` tinyint(1) DEFAULT NULL,
  `crafting_xp` int NOT NULL,
  `component1` int DEFAULT '-1',
  `component1count` int DEFAULT NULL,
  `component2` int DEFAULT '-1',
  `component2count` int DEFAULT NULL,
  `component3` int DEFAULT '-1',
  `component3count` int DEFAULT NULL,
  `component4` int DEFAULT '-1',
  `component4count` int DEFAULT NULL,
  `component5` int DEFAULT '-1',
  `component5count` int DEFAULT NULL,
  `component6` int DEFAULT '-1',
  `component6count` int DEFAULT NULL,
  `component7` int DEFAULT '-1',
  `component7count` int DEFAULT NULL,
  `component8` int DEFAULT '-1',
  `component8count` int DEFAULT NULL,
  `component9` int DEFAULT '-1',
  `component9count` int DEFAULT '1',
  `component10` int DEFAULT '-1',
  `component10count` int DEFAULT '1',
  `component11` int DEFAULT '-1',
  `component11count` int DEFAULT '1',
  `component12` int DEFAULT '-1',
  `component12count` int DEFAULT '1',
  `component13` int DEFAULT '-1',
  `component13count` int DEFAULT '1',
  `component14` int DEFAULT '-1',
  `component14count` int DEFAULT '1',
  `component15` int DEFAULT '-1',
  `component15count` int DEFAULT '1',
  `component16` int DEFAULT '-1',
  `component16count` int DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `icon2` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `crafting_recipes`
--
DROP TRIGGER IF EXISTS `crafting_recipes_trigger`;
DELIMITER ;;
CREATE TRIGGER `crafting_recipes_trigger` BEFORE UPDATE ON `crafting_recipes` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `icon` varchar(256) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `maximum` bigint NOT NULL DEFAULT '999999',
  `currencyGroup` int DEFAULT '0',
  `currencyPosition` int DEFAULT '1',
  `external` tinyint(1) DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `icon2` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `currencies`
--
DROP TRIGGER IF EXISTS `currencies_trigger`;
DELIMITER ;;
CREATE TRIGGER `currencies_trigger` BEFORE UPDATE ON `currencies` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `currency_conversion`
--

DROP TABLE IF EXISTS `currency_conversion`;
CREATE TABLE IF NOT EXISTS `currency_conversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currencyID` int NOT NULL,
  `currencyToID` int NOT NULL,
  `amount` int NOT NULL,
  `autoConverts` tinyint(1) NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `damage_type`
--

DROP TABLE IF EXISTS `damage_type`;
CREATE TABLE IF NOT EXISTS `damage_type` (
  `name` varchar(45) NOT NULL,
  `resistance_stat` varchar(45) NOT NULL,
  `power_stat` varchar(256) NOT NULL,
  `accuracy_stat` varchar(256) NOT NULL,
  `evasion_stat` varchar(256) NOT NULL,
  `critic_chance_stat` varchar(256) NOT NULL,
  `critic_power_stat` varchar(64) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `damage_type`
--

INSERT INTO `damage_type` (`name`, `resistance_stat`, `power_stat`, `accuracy_stat`, `evasion_stat`, `critic_chance_stat`, `critic_power_stat`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
('crush', 'crush_resistance', 'strength', 'dexterity', 'physical_evasion', 'physical_critic', 'physical_crit_power', 1, '2000-01-01 00:00:00', '2021-09-15 14:38:18'),
('magical', 'magical_resistance', 'potential', 'intelligence', 'magical_evasion', 'magical_critic', 'magical_crit_power', 1, '2000-01-01 00:00:00', '2021-09-15 14:38:18'),
('pierce', 'pierce_resistance', 'strength', 'dexterity', 'physical_evasion', 'physical_critic', 'physical_crit_power', 1, '2000-01-01 00:00:00', '2021-09-15 14:38:18'),
('slash', 'slash_resistance', 'strength', 'dexterity', 'physical_evasion', 'physical_critic', 'physical_crit_power', 1, '2000-01-01 00:00:00', '2021-09-15 14:38:18');

--
-- Wyzwalacze `damage_type`
--
DROP TRIGGER IF EXISTS `damage_type_trigger`;
DELIMITER ;;
CREATE TRIGGER `damage_type_trigger` BEFORE UPDATE ON `damage_type` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dialogue`
--

DROP TABLE IF EXISTS `dialogue`;
CREATE TABLE IF NOT EXISTS `dialogue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `openingDialogue` tinyint(1) DEFAULT '1',
  `repeatable` tinyint(1) DEFAULT '0',
  `prereqDialogue` int DEFAULT '-1',
  `prereqQuest` int DEFAULT '-1',
  `prereqFaction` int DEFAULT '-1',
  `prereqFactionStance` int DEFAULT '1',
  `reactionAutoStart` tinyint(1) DEFAULT '0',
  `text` text,
  `audioClip` varchar(256) NOT NULL,
  `option1text` varchar(256) DEFAULT NULL,
  `option1action` varchar(45) DEFAULT NULL,
  `option1actionID` int DEFAULT NULL,
  `option1itemReq` int DEFAULT '-1',
  `option2text` varchar(256) DEFAULT NULL,
  `option2action` varchar(45) DEFAULT NULL,
  `option2actionID` int DEFAULT NULL,
  `option2itemReq` int DEFAULT '-1',
  `option3text` varchar(256) DEFAULT NULL,
  `option3action` varchar(45) DEFAULT NULL,
  `option3actionID` int DEFAULT NULL,
  `option3itemReq` int DEFAULT '-1',
  `option4text` varchar(256) DEFAULT NULL,
  `option4action` varchar(45) DEFAULT NULL,
  `option4actionID` int DEFAULT NULL,
  `option4itemReq` int DEFAULT '-1',
  `option5text` varchar(256) DEFAULT NULL,
  `option5action` varchar(45) DEFAULT NULL,
  `option5actionID` int DEFAULT NULL,
  `option5itemReq` int DEFAULT '-1',
  `option6text` varchar(256) DEFAULT NULL,
  `option6action` varchar(45) DEFAULT NULL,
  `option6actionID` int DEFAULT NULL,
  `option6itemReq` int DEFAULT '-1',
  `option7text` varchar(256) DEFAULT NULL,
  `option7action` varchar(45) DEFAULT NULL,
  `option7actionID` int DEFAULT NULL,
  `option7itemReq` int DEFAULT '-1',
  `option8text` varchar(256) DEFAULT NULL,
  `option8action` varchar(45) DEFAULT NULL,
  `option8actionID` int DEFAULT NULL,
  `option8itemReq` int DEFAULT '-1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `dialogue`
--
DROP TRIGGER IF EXISTS `dialogue_trigger`;
DELIMITER ;;
CREATE TRIGGER `dialogue_trigger` BEFORE UPDATE ON `dialogue` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dialogue_actions`
--

DROP TABLE IF EXISTS `dialogue_actions`;
CREATE TABLE IF NOT EXISTS `dialogue_actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dialogueID` int NOT NULL,
  `actionOrder` int NOT NULL,
  `reqOpenedQuest` int NOT NULL DEFAULT '-1',
  `reqCompletedQuest` int NOT NULL DEFAULT '-1',
  `excludingQuest` int NOT NULL DEFAULT '-1',
  `audioClip` varchar(256) NOT NULL DEFAULT '',
  `text` varchar(256) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `actionID` int DEFAULT NULL,
  `itemReq` int NOT NULL DEFAULT '-1',
  `itemReqConsume` tinyint(1) NOT NULL DEFAULT '0',
  `currency` int NOT NULL DEFAULT '-1',
  `currencyAmount` int NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dialogue_actions_requirement`
--

DROP TABLE IF EXISTS `dialogue_actions_requirement`;
CREATE TABLE IF NOT EXISTS `dialogue_actions_requirement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dialogue_action_id` int NOT NULL,
  `editor_option_type_id` int NOT NULL,
  `editor_option_choice_type_id` varchar(45) NOT NULL,
  `required_value` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` timestamp NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `editor_option`
--

DROP TABLE IF EXISTS `editor_option`;
CREATE TABLE IF NOT EXISTS `editor_option` (
  `id` int NOT NULL AUTO_INCREMENT,
  `optionType` varchar(45) NOT NULL,
  `deletable` tinyint(1) DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `optionType_UNIQUE` (`optionType`)
) ENGINE=InnoDB AUTO_INCREMENT=36 AVG_ROW_LENGTH=744 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `editor_option`
--

INSERT INTO `editor_option` (`id`, `optionType`, `deletable`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 'Item Type', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(2, 'Weapon Type', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(3, 'Armor Type', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(4, 'Species', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(5, 'Race', 0, 1, '2000-01-01 00:00:00', '2023-11-16 00:29:31'),
(6, 'Class', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(7, 'Crafting Station', 0, 1, '2000-01-01 00:00:00', '2021-06-07 23:38:47'),
(8, 'Dialogue Action', 0, 1, '2000-01-01 00:00:00', '2021-06-07 23:38:47'),
(9, 'Mob Type', 0, 1, '2000-01-01 00:00:00', '2021-06-07 23:38:47'),
(10, 'Stat Functions', 0, 1, '2000-01-01 00:00:00', '2021-06-26 13:41:27'),
(11, 'Target Type', 0, 1, '2000-01-01 00:00:00', '2020-08-28 10:22:55'),
(12, 'Item Effect Type', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(13, 'Quest Objective Type', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(14, 'Stat Shift Requirement', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(15, 'Stat Shift Action', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(16, 'Requirement', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(17, 'Currency Group', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(18, 'Building Category', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(19, 'State', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:22'),
(20, 'Interaction Type', 0, 1, '2000-01-01 00:00:00', '2021-06-07 23:38:47'),
(21, 'Ammo Type', 0, 1, '2000-01-01 00:00:00', '2021-06-07 23:38:47'),
(22, 'Claim Object Interaction Type', 0, 1, '2000-01-01 00:00:00', '2021-06-07 23:38:47'),
(23, 'Sockets Type', 0, 1, '2000-01-01 05:00:00', '2018-08-03 20:42:50'),
(24, 'Item Quality', 0, 1, '2000-01-01 05:00:00', '2023-12-16 22:28:05'),
(25, 'Effects Tags', 0, 1, '2020-08-23 12:01:29', '2000-01-01 00:00:00'),
(26, 'Ability Tags', 0, 1, '2020-08-23 12:01:29', '2020-08-28 11:11:28'),
(27, 'Claim Type', 0, 1, '2021-06-26 12:24:56', '2021-06-26 12:27:38'),
(28, 'Claim Object Category', 0, 1, '2021-06-26 12:24:56', '2021-06-26 12:29:31'),
(29, 'Gender', 0, 1, '2021-07-01 10:25:22', '2021-07-02 17:09:50'),
(30, 'Item Slot Type', 1, 1, '2021-07-17 21:34:14', '2021-08-28 13:25:59'),
(31, 'Tool Type', 1, 1, '2021-08-28 18:45:24', '2021-09-01 17:00:30'),
(32, 'Mob Tags', 1, 1, '2022-07-31 04:53:42', '2022-08-09 06:05:14'),
(33, 'Target Sub Type', 0, 1, '2023-10-06 13:55:02', '2000-01-01 00:00:00'),
(34, 'Slots Sets', 0, 1, '2023-10-18 19:24:03', '2023-11-10 19:48:33'),
(35, 'Weapon Actions', 0, 1, '2023-11-13 23:25:19', '2023-11-17 21:43:19');

--
-- Wyzwalacze `editor_option`
--
DROP TRIGGER IF EXISTS `editor_option_trigger`;
DELIMITER ;;
CREATE TRIGGER `editor_option_trigger` BEFORE UPDATE ON `editor_option` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `editor_option_choice`
--

DROP TABLE IF EXISTS `editor_option_choice`;
CREATE TABLE IF NOT EXISTS `editor_option_choice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `optionTypeID` int NOT NULL,
  `choice` varchar(45) NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 AVG_ROW_LENGTH=128 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `editor_option_choice`
--

INSERT INTO `editor_option_choice` (`id`, `optionTypeID`, `choice`, `deletable`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 1, 'Weapon', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(2, 1, 'Armor', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(3, 1, 'Consumable', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(4, 1, 'Material', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(5, 2, 'Sword', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:08'),
(6, 2, 'Axe', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:10'),
(7, 2, 'Mace', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:15'),
(8, 2, 'Staff', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:20'),
(9, 2, 'Bow', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:04'),
(10, 2, 'Gun', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:18'),
(11, 3, 'Cloth', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:10'),
(12, 3, 'Leather', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:08'),
(13, 3, 'Mail', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:06'),
(14, 3, 'Plate', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:00'),
(15, 1, 'Junk', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:08'),
(16, 4, 'Humanoid', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:08'),
(17, 4, 'Beast', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:08'),
(18, 4, 'Dragon', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:08'),
(19, 4, 'Elemental', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:12'),
(20, 4, 'Undead', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:08'),
(22, 5, 'Human', 1, 1, '2000-01-01 00:00:00', '2023-11-16 00:29:31'),
(23, 6, 'Warrior', 1, 1, '2000-01-01 00:00:00', '2022-08-03 07:23:53'),
(24, 6, 'Mage', 1, 1, '2000-01-01 00:00:00', '2022-08-03 07:23:53'),
(25, 6, 'Rogue', 1, 1, '2000-01-01 00:00:00', '2022-08-03 07:23:53'),
(26, 7, 'Anvil', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:39'),
(27, 7, 'Smelter', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:51:00'),
(28, 7, 'Pot', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:40'),
(29, 7, 'Oven', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:58'),
(30, 7, 'Cauldron', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:55'),
(31, 7, 'Sawmill', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:53'),
(32, 7, 'Loom', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:48'),
(33, 7, 'Sewing', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:50'),
(34, 7, 'Tannery', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:45'),
(35, 7, 'Masonry', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:42'),
(36, 8, 'Dialogue', 0, 1, '2000-01-01 00:00:00', '2019-11-24 00:18:16'),
(37, 8, 'Quest', 0, 1, '2000-01-01 00:00:00', '2019-11-24 00:18:16'),
(38, 8, 'Ability', 0, 1, '2000-01-01 00:00:00', '2019-11-24 00:18:16'),
(39, 9, 'Normal', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(40, 9, 'Untargetable', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(41, 9, 'Boss', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(42, 9, 'Rare', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(45, 10, 'Critic Power', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(46, 10, 'Critic Chance', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(47, 10, 'Accuracy', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(48, 10, 'Power', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(49, 33, 'Enemy', 0, 1, '2000-01-01 00:00:00', '2023-10-06 13:55:02'),
(50, 33, 'Self', 0, 1, '2000-01-01 00:00:00', '2023-10-06 13:55:02'),
(51, 33, 'Friendly', 0, 1, '2000-01-01 00:00:00', '2023-10-06 13:55:02'),
(52, 33, 'Friend Not Self', 0, 1, '2000-01-01 00:00:00', '2023-10-06 13:55:02'),
(53, 11, 'Group', 0, 1, '2000-01-01 00:00:00', '2020-08-28 10:22:55'),
(54, 11, 'Single Target', 0, 1, '2000-01-01 00:00:00', '2023-10-06 13:55:02'),
(55, 11, 'AoE', 0, 1, '2000-01-01 00:00:00', '2023-10-06 13:55:02'),
(56, 1, 'Quest', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(57, 12, 'Stat', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(58, 12, 'UseAbility', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(60, 13, 'item', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(61, 13, 'mob', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(62, 1, 'Bag', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(63, 1, 'Container', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(64, 12, 'ClaimObject', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(65, 12, 'CreateClaim', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(66, 12, 'StartQuest', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(67, 14, 'combatstate', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(68, 14, 'deadstate', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(69, 15, 'death', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(72, 12, 'Currency', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:07'),
(74, 16, 'Level', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(75, 16, 'Skill Level', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(76, 16, 'Race', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(77, 16, 'Class', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(78, 16, 'Stat', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(80, 17, 'Gold', 1, 1, '2000-01-01 00:00:00', '2023-02-25 22:30:54'),
(82, 18, 'Wood', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:57:29'),
(83, 18, 'Stone', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:57:31'),
(84, 15, 'effect', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(85, 13, 'task', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(86, 19, 'underwater', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:22'),
(87, 19, 'chilled', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:23'),
(88, 19, 'exposed', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:23'),
(89, 20, 'ApplyEffect', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(90, 20, 'PlayCoordEffect', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(91, 20, 'StartQuest', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(92, 20, 'CompleteTask', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(93, 20, 'InstancePortal', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(94, 1, 'Ammo', 0, 1, '2000-01-01 00:00:00', '2021-09-14 09:57:04'),
(96, 21, 'Arrow', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:53:12'),
(97, 21, 'Bullet', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:53:20'),
(98, 2, 'Greatsword', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:49:06'),
(99, 19, 'satisfied', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:23'),
(100, 10, 'Weight', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(103, 22, 'Chest', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(104, 22, 'Resource', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(105, 22, 'NPC', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(106, 20, 'PvP', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(107, 20, 'Sanctuary', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(108, 12, 'CraftsItem', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:33:08'),
(109, 19, 'vip', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:23'),
(110, 3, 'Fashion', 1, 1, '2000-01-01 00:00:00', '2021-09-15 18:50:03'),
(111, 22, 'Effect', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(112, 22, 'Instance', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(113, 22, 'LeaveInstance', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(114, 20, 'LeaveInstance', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(116, 3, 'Jewelry', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:09'),
(117, 9, 'World Boss', 0, 1, '2000-01-01 00:00:00', '2021-09-15 14:39:09'),
(120, 10, 'Evasion', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(122, 10, 'Parry', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(123, 10, 'Sleep Resistance', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(124, 10, 'Stun Resistance', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(125, 10, 'Slowdown Resistance', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(126, 10, 'Immobilize Resistance', 0, 1, '2000-01-01 00:00:00', '2023-01-18 00:10:33'),
(128, 13, 'mobCategory', 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(129, 19, 'satisfied', 0, 1, '2000-01-01 00:00:00', '2023-04-25 13:13:23'),
(131, 12, 'Sockets', 0, 1, '2018-08-03 19:12:02', '2023-04-25 13:33:08'),
(133, 23, 'Gems', 1, 1, '2018-08-04 00:42:50', '2021-09-15 18:53:34'),
(134, 23, 'Runes', 1, 1, '2018-08-04 00:42:50', '2021-09-15 18:53:36'),
(135, 24, 'Poor', 1, 1, '2018-08-04 00:42:50', '2023-12-16 22:28:05'),
(136, 24, 'Common', 1, 1, '2018-08-14 23:12:34', '2023-12-16 22:28:05'),
(137, 24, 'Uncommon', 1, 1, '2018-08-14 23:12:34', '2023-12-16 22:28:05'),
(138, 24, 'Rare', 1, 1, '2018-08-14 23:12:34', '2023-12-16 22:28:06'),
(139, 24, 'Epic', 1, 1, '2018-08-14 23:12:34', '2023-12-16 22:28:06'),
(140, 24, 'Legendary', 1, 1, '2018-08-14 23:12:34', '2023-12-16 22:28:06'),
(141, 12, 'Blueprint', 0, 1, '2018-08-03 19:12:02', '2023-04-25 13:33:08'),
(143, 5, 'Orc', 1, 1, '2019-04-17 08:40:30', '2023-11-16 00:29:31'),
(144, 12, 'VipPoints', 0, 1, '2019-10-08 16:29:02', '2023-04-25 13:33:08'),
(145, 12, 'VipTime', 0, 1, '2019-10-08 16:29:02', '2023-04-25 13:33:08'),
(146, 12, 'Bonus', 0, 1, '2019-10-22 13:17:47', '2023-04-25 13:33:08'),
(148, 12, 'SkillPoints', 0, 1, '2019-11-16 11:27:12', '2023-04-25 13:33:08'),
(149, 12, 'TalentPoints', 0, 1, '2019-11-16 11:27:12', '2023-04-25 13:33:08'),
(150, 12, 'SkillReset', 0, 1, '2019-11-18 17:57:15', '2023-04-25 13:33:08'),
(151, 12, 'TalentReset', 0, 1, '2019-11-18 17:57:15', '2023-04-25 13:33:08'),
(152, 12, 'Achievement', 0, 1, '2019-11-20 16:55:28', '2023-04-25 13:33:08'),
(153, 8, 'Repair', 0, 1, '2019-11-24 00:18:16', '2000-01-01 00:00:00'),
(154, 10, 'Health', 0, 1, '2019-12-03 12:52:59', '2023-01-18 00:10:33'),
(155, 10, 'Movement Speed', 0, 1, '2019-12-03 12:52:59', '2023-01-18 00:10:33'),
(156, 10, 'Attack Speed', 0, 1, '2019-12-08 13:48:41', '2023-01-18 00:10:33'),
(157, 10, 'Ability Cost', 0, 1, '2020-04-09 20:22:28', '2023-01-18 00:10:33'),
(158, 10, 'Ability Cooldown', 0, 1, '2020-04-09 20:22:28', '2023-01-18 00:10:33'),
(159, 10, 'Ability Cast Time', 0, 1, '2020-04-09 20:22:28', '2023-01-18 00:10:33'),
(160, 10, 'Ability Global Cooldown', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(161, 10, 'Ability Weapon Cooldown', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(162, 10, 'Ability Health Receive', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(163, 10, 'Ability Health Dealt', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(164, 10, 'Ability Damage Receive', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(165, 10, 'Ability Damage Dealt', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(166, 10, 'Ability Range', 0, 1, '2020-04-15 10:14:49', '2023-01-18 00:10:33'),
(169, 10, 'Stealth', 0, 1, '2020-05-21 19:43:00', '2023-01-18 00:10:33'),
(170, 10, 'Perception Stealth', 0, 1, '2020-05-21 19:43:00', '2023-01-18 00:10:33'),
(171, 10, 'Sleep Chance', 0, 1, '2020-06-14 14:19:20', '2023-01-18 00:10:33'),
(172, 10, 'Stun Chance', 0, 1, '2020-06-14 14:19:20', '2023-01-18 00:10:34'),
(173, 10, 'Interuption Resistance', 0, 1, '2020-06-18 20:12:01', '2023-01-18 00:10:34'),
(174, 10, 'Interuption Chance', 0, 1, '2020-06-18 20:12:01', '2023-01-18 00:10:34'),
(175, 11, 'Location(Trap)', 0, 1, '2020-08-28 10:22:55', '2023-10-06 13:55:44'),
(176, 26, 'Sprint', 1, 1, '2020-08-28 11:08:06', '2021-09-15 18:54:08'),
(177, 2, 'Unarmed', 1, 1, '2020-08-28 12:54:21', '2021-09-15 18:49:13'),
(178, 8, 'Merchant', 0, 1, '2020-10-16 01:32:24', '2020-10-21 22:44:57'),
(179, 8, 'Bank', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(180, 8, 'QuestProgress', 0, 1, '2020-10-21 18:01:09', '2021-09-13 22:26:47'),
(181, 8, 'Auction', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(182, 8, 'Mail', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(183, 8, 'GearModification', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(184, 8, 'GuildWarehouse', 0, 1, '2020-10-21 18:01:09', '2020-10-21 22:44:57'),
(185, 8, 'GuildMerchant', 0, 1, '2020-10-21 22:44:34', '2020-10-21 22:44:57'),
(400, 16, 'Guild Level', 0, 1, '2020-08-30 21:18:36', '2020-11-15 00:08:56'),
(401, 27, 'Any', 0, 1, '2021-06-26 14:27:38', '2021-06-26 13:39:57'),
(402, 27, 'Residential', 1, 1, '2021-06-26 14:27:38', '2021-06-26 14:27:38'),
(403, 27, 'Farm', 1, 1, '2021-06-26 14:27:38', '2021-06-26 14:27:38'),
(404, 28, 'Wall', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(405, 28, 'Foundation', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(406, 28, 'Roof', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(407, 28, 'Window', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(408, 28, 'Door', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(409, 28, 'Floor', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(410, 28, 'Tradehouse', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(411, 28, 'House', 1, 1, '2021-06-26 14:29:31', '2021-06-26 14:29:31'),
(412, 10, 'Build Speed', 0, 1, '2021-06-26 15:41:28', '2023-01-18 00:10:34'),
(413, 29, 'Male', 1, 1, '2021-07-02 19:09:49', '2021-07-02 19:09:49'),
(414, 29, 'Female', 1, 1, '2021-07-02 19:09:49', '2021-07-02 19:09:49'),
(415, 30, 'Weapon', 0, 1, '2021-07-17 21:34:15', '2021-09-15 18:55:01'),
(416, 30, 'Armor', 0, 1, '2021-07-17 21:34:15', '2021-09-15 18:55:03'),
(417, 30, 'Tool', 0, 1, '2021-07-17 21:36:18', '2021-09-15 18:55:05'),
(418, 1, 'Tool', 0, 1, '2021-08-20 00:56:08', '2021-09-15 18:48:45'),
(419, 31, 'Axe', 1, 1, '2021-08-28 18:45:24', '2021-09-01 17:00:30'),
(420, 31, 'Hammer', 1, 1, '2021-08-28 18:45:24', '2021-09-01 17:00:30'),
(421, 31, 'Saw', 1, 1, '2021-08-28 18:46:01', '2021-09-01 17:00:30'),
(422, 31, 'Pickaxe', 1, 1, '2021-09-01 19:00:19', '2021-09-01 19:00:19'),
(423, 7, 'Any', 0, 1, '2022-04-07 21:28:44', '2022-04-07 21:28:44'),
(438, 12, 'SocketAbility', 0, 1, '2023-04-25 15:33:08', '2023-04-25 15:33:08'),
(439, 12, 'SocketEffect', 0, 1, '2023-04-25 15:33:08', '2023-04-25 15:33:08'),
(440, 33, 'Friendly or Enemy', 0, 1, '2023-10-06 13:55:02', '2000-01-01 00:00:00'),
(441, 34, 'Set 1', 1, 1, '2023-11-10 20:48:34', '2023-11-10 20:48:34'),
(442, 34, 'Set 2', 1, 1, '2023-11-10 20:48:34', '2023-11-10 20:48:34'),
(443, 35, 'Action1', 1, 1, '2023-11-14 00:31:35', '2023-11-17 21:43:19'),
(444, 35, 'Action2', 1, 1, '2023-11-15 19:29:01', '2023-11-17 21:43:19'),
(445, 35, 'terst1', 1, 0, '2023-11-16 01:14:18', '2023-11-16 00:34:45'),
(446, 35, 'test3', 1, 0, '2023-11-16 01:14:35', '2023-11-16 00:34:45'),
(447, 35, 'ters4', 1, 0, '2023-11-16 01:28:00', '2023-11-16 00:34:45'),
(448, 5, 'ttt', 1, 1, '2023-11-16 01:29:30', '2023-11-16 01:29:30'),
(449, 35, 'aaa', 1, 0, '2023-11-16 01:34:25', '2023-11-16 00:34:45'),
(450, 35, 'Action3', 1, 1, '2023-11-16 01:34:44', '2023-11-17 21:43:20'),
(451, 35, 'Action4', 1, 1, '2023-11-16 01:34:59', '2023-11-17 21:43:20'),
(452, 35, 'Action5', 1, 1, '2023-11-16 01:35:12', '2023-11-17 21:43:20'),
(453, 24, 'Coins', 1, 1, '2023-12-16 23:28:05', '2023-12-16 23:28:05');

--
-- Wyzwalacze `editor_option_choice`
--
DROP TRIGGER IF EXISTS `editor_option_choice_trigger`;
DELIMITER ;;
CREATE TRIGGER `editor_option_choice_trigger` BEFORE UPDATE ON `editor_option_choice` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `effects`
--

DROP TABLE IF EXISTS `effects`;
CREATE TABLE IF NOT EXISTS `effects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `displayName` varchar(64) DEFAULT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `icon2` mediumtext NOT NULL,
  `effectMainType` varchar(64) DEFAULT NULL,
  `effectType` varchar(64) DEFAULT NULL,
  `isBuff` tinyint(1) NOT NULL DEFAULT '0',
  `skillType` int DEFAULT NULL,
  `skillLevelMod` float DEFAULT '0',
  `passive` tinyint(1) DEFAULT NULL,
  `stackLimit` int DEFAULT NULL,
  `stackTime` tinyint(1) NOT NULL DEFAULT '0',
  `allowMultiple` tinyint(1) DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `pulseCount` int DEFAULT NULL,
  `tooltip` varchar(255) DEFAULT NULL,
  `bonusEffectReq` int NOT NULL DEFAULT '-1',
  `bonusEffectReqConsumed` tinyint(1) DEFAULT NULL,
  `bonusEffect` int NOT NULL DEFAULT '-1',
  `removeBonusWhenEffectRemoved` tinyint(1) NOT NULL DEFAULT '0',
  `pulseCoordEffect` varchar(256) DEFAULT NULL,
  `intValue1` int NOT NULL DEFAULT '0',
  `intValue2` int NOT NULL DEFAULT '0',
  `intValue3` int NOT NULL DEFAULT '0',
  `intValue4` int NOT NULL DEFAULT '0',
  `intValue5` int NOT NULL DEFAULT '0',
  `floatValue1` float NOT NULL DEFAULT '0',
  `floatValue2` float NOT NULL DEFAULT '0',
  `floatValue3` float NOT NULL DEFAULT '0',
  `floatValue4` float NOT NULL DEFAULT '0',
  `floatValue5` float NOT NULL DEFAULT '0',
  `stringValue1` varchar(256) NOT NULL,
  `stringValue2` varchar(256) NOT NULL,
  `stringValue3` varchar(256) NOT NULL,
  `stringValue4` varchar(256) NOT NULL,
  `stringValue5` varchar(256) NOT NULL,
  `boolValue1` tinyint(1) NOT NULL DEFAULT '0',
  `boolValue2` tinyint(1) NOT NULL DEFAULT '0',
  `boolValue3` tinyint(1) NOT NULL DEFAULT '0',
  `boolValue4` tinyint(1) NOT NULL DEFAULT '0',
  `boolValue5` tinyint(1) NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `group_tags` text NOT NULL,
  `interruption_chance` float NOT NULL DEFAULT '0',
  `interruption_chance_max` float NOT NULL DEFAULT '0',
  `interruption_all` tinyint(1) NOT NULL DEFAULT '0',
  `show_effect` tinyint(1) NOT NULL DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=564 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `effects`
--
DROP TRIGGER IF EXISTS `effects_trigger`;
DELIMITER ;;
CREATE TRIGGER `effects_trigger` BEFORE UPDATE ON `effects` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `effects_triggers`
--

DROP TABLE IF EXISTS `effects_triggers`;
CREATE TABLE IF NOT EXISTS `effects_triggers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `event_type` int NOT NULL,
  `tags` text NOT NULL,
  `race` int NOT NULL DEFAULT '-1',
  `class` int NOT NULL DEFAULT '-1',
  `action_type` tinyint NOT NULL,
  `chance_min` float NOT NULL DEFAULT '0',
  `chance_max` float NOT NULL DEFAULT '100',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `effects_triggers_actions`
--

DROP TABLE IF EXISTS `effects_triggers_actions`;
CREATE TABLE IF NOT EXISTS `effects_triggers_actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effects_triggers_id` int NOT NULL,
  `target` int NOT NULL,
  `ability` int NOT NULL,
  `effect` int NOT NULL,
  `mod_v` int NOT NULL DEFAULT '0',
  `mod_p` float NOT NULL DEFAULT '0',
  `chance_min` float NOT NULL,
  `chance_max` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `data_type` varchar(32) DEFAULT NULL,
  `save_data` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(256) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=862 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `events`
--
DROP TRIGGER IF EXISTS `events_trigger`;
DELIMITER ;;
CREATE TRIGGER `events_trigger` BEFORE UPDATE ON `events` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `factions`
--

DROP TABLE IF EXISTS `factions`;
CREATE TABLE IF NOT EXISTS `factions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `factionGroup` varchar(64) DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `defaultStance` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 AVG_ROW_LENGTH=2730 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `factions`
--

INSERT INTO `factions` (`id`, `category`, `name`, `factionGroup`, `public`, `defaultStance`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 1, 'Human', '', 1, 1, 1, '2000-01-01 00:00:00', '2019-09-23 22:08:13'),
(2, 1, 'Haters', '', 0, 1, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(3, 1, 'Friendly', NULL, 0, 1, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(4, 1, 'Neutral', NULL, 0, 0, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(5, 1, 'Haters1', '', 0, 1, 1, '2000-01-01 00:00:00', '2018-03-14 21:07:34'),
(6, 1, 'NPCFaction', '', 1, 1, 1, '2000-01-01 00:00:00', '2019-09-25 12:35:36'),
(7, 1, 'Pet', '', 1, 1, 1, '2000-01-01 00:00:00', '2018-03-23 12:25:13');

--
-- Wyzwalacze `factions`
--
DROP TRIGGER IF EXISTS `factions_trigger`;
DELIMITER ;;
CREATE TRIGGER `factions_trigger` BEFORE UPDATE ON `factions` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faction_stances`
--

DROP TABLE IF EXISTS `faction_stances`;
CREATE TABLE IF NOT EXISTS `faction_stances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `factionID` int NOT NULL,
  `otherFaction` int NOT NULL DEFAULT '-1',
  `defaultStance` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 AVG_ROW_LENGTH=1820 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `faction_stances`
--

INSERT INTO `faction_stances` (`id`, `factionID`, `otherFaction`, `defaultStance`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 2, 1, 1, 0, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(2, 5, 2, -2, 0, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(3, 1, 2, -2, 1, '2000-01-01 00:00:00', '2019-09-23 22:08:13'),
(4, 2, 1, -2, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(5, 6, 1, 1, 1, '2000-01-01 00:00:00', '2019-09-25 12:35:36'),
(6, 5, 1, -2, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(7, 7, 4, 0, 1, '2000-01-01 00:00:00', '2018-03-23 12:25:13'),
(8, 7, 2, -2, 1, '2000-01-01 00:00:00', '2018-03-23 12:25:13'),
(9, 7, 5, -2, 1, '2000-01-01 00:00:00', '2018-03-23 12:25:13'),
(10, 1, 5, -2, 1, '2000-01-01 00:00:00', '2019-09-23 22:08:13'),
(11, 1, 4, 0, 1, '2000-01-01 00:00:00', '2019-09-23 22:08:13'),
(12, 1, 6, 1, 1, '2019-09-23 22:08:13', '2000-01-01 00:00:00');

--
-- Wyzwalacze `faction_stances`
--
DROP TRIGGER IF EXISTS `faction_stances_trigger`;
DELIMITER ;;
CREATE TRIGGER `faction_stances_trigger` BEFORE UPDATE ON `faction_stances` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `game_setting`
--

DROP TABLE IF EXISTS `game_setting`;
CREATE TABLE IF NOT EXISTS `game_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(101) NOT NULL,
  `datatype` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 AVG_ROW_LENGTH=227 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `game_setting`
--

INSERT INTO `game_setting` (`id`, `name`, `datatype`, `value`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 'PLAYER_BAG_COUNT', 'int', '4', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(2, 'PLAYER_DEFAULT_BAG_SIZE', 'int', '16', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(3, 'MOB_DEATH_EXP', 'bool', 'true', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(4, 'PLAYER_CORPSE_LOOT_DURATION', 'int', '0', 1, '2000-01-01 00:00:00', '2019-11-26 10:43:51'),
(5, 'PLAYER_CORPSE_SAFE_LOOT_DURATION', 'int', '0', 1, '2000-01-01 00:00:00', '2019-11-26 10:43:55'),
(6, 'PLAYER_CORPSE_MOB_TEMPLATE', 'int', '0', 1, '2000-01-01 00:00:00', '2019-11-26 10:44:04'),
(7, 'SKINNING_SKILL_ID', 'int', '-1', 0, '2000-01-01 00:00:00', '2019-11-17 19:00:59'),
(8, 'USE_SKILL_PURCHASE_POINTS', 'bool', 'true', 1, '2000-01-01 00:00:00', '2019-11-19 16:22:48'),
(9, 'SKILL_POINTS_GIVEN_PER_LEVEL', 'int', '3', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(11, 'EXP_MAX_LEVEL_DIFFERENCE', 'int', '10', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(12, 'SELL_FACTOR', 'float', '0.25', 1, '2000-01-01 00:00:00', '2019-04-13 17:00:55'),
(13, 'REPAIR_RATE', 'float', '0.5', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(14, 'PLAYER_CORPSE_DROPS_EQUIPMENT', 'bool', 'false', 1, '2000-01-01 00:00:00', '2019-10-02 15:54:24'),
(15, 'RANGE_CHECK_VERTICAL', 'bool', 'true', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(16, 'RELEASE_ON_LOGIN', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(17, 'MAGICAL_ATTACKS_USE_WEAPON_DAMAGE', 'bool', 'true', 0, '2000-01-01 00:00:00', '2021-09-15 21:03:22'),
(18, 'EXP_BASED_ON_DAMAGE_DEALT', 'bool', 'true', 1, '2000-01-01 00:00:00', '2018-03-17 23:57:04'),
(19, 'RESOURCE_DROPS_ON_FAIL', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(20, 'AUTO_PICKUP_RESOURCES', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(21, 'RESOURCE_GATHER_DISTANCE', 'int', '4', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(22, 'RESOURCE_GATHER_CAN_FAIL', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(23, 'GROUP_MAX_SIZE', 'int', '4', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(24, 'REMOVE_ITEM_ON_BUILD_FAIL', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(25, 'BUILD_CAN_FAIL', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(26, 'USE_CLAIM_RESOURCES', 'bool', 'true', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(27, 'ONLY_UPGRADE_CLAIM_OBJECT_WITH_ALL_ITEMS', 'bool', 'false', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(28, 'COMBAT_TIMEOUT', 'int', '20', 1, '2000-01-01 00:00:00', '2019-11-26 11:09:09'),
(29, 'LOGOUT_TIME', 'int', '10', 1, '2000-01-01 00:00:00', '2019-11-17 19:01:17'),
(30, 'LOGOUT_TO_CHARACTER_SELECTION', 'bool', 'true', 1, '2000-01-01 00:00:00', '2018-03-07 16:15:31'),
(31, 'FALL_SAFE_HEIGHT', 'float', '10', 1, '2000-01-01 00:00:00', '2019-11-26 11:12:00'),
(32, 'FALL_DEATH_HEIGHT', 'float', '50', 1, '2000-01-01 00:00:00', '2019-11-26 11:12:51'),
(33, 'FALL_DAMAGE_STAT', 'string', 'health', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(34, 'MOB_AGGRO_MELEE_THREAT_THRESHOLD', 'float', '1.1', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(35, 'MOB_AGGRO_RANGED_THREAT_THRESHOLD', 'float', '1.3', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(36, 'TOTAL_SKILL_MAX', 'int', '1000000', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(37, 'SPIRIT_EFFECT', 'int', '-1', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(38, 'USE_PLAYER_SET_RESPAWN_LOCATIONS', 'bool', 'true', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(39, 'WEAPON_REQ_USES_SHARED_TYPES', 'bool', 'true', 0, '2000-01-01 00:00:00', '2021-09-15 21:03:11'),
(42, 'SKILL_STARTING_MAX', 'int', '5', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(43, 'AUTO_ADD_ABILITIES_TO_ACTION_BAR', 'bool', 'true', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(44, 'CAN_HARVEST_WHILE_MOUNTED', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(45, 'SKINNING_WEAPON_REQ', 'string', '', 0, '2000-01-01 00:00:00', '2019-09-25 10:52:25'),
(46, 'USE_RESOURCE_GROUPS', 'bool', 'true', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(47, 'RESOURCE_GROUP_SIZE', 'int', '50', 1, '2000-01-01 00:00:00', '2018-03-19 21:01:55'),
(48, 'GRID_SIZE', 'int', '4', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(49, 'CAN_CRAFT_WHILE_MOUNTED', 'bool', 'false', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(50, 'WORLD_TIME_SPEED', 'float', '1', 1, '2000-01-01 00:00:00', '2019-11-26 11:24:41'),
(51, 'REMOVE_ITEM_ON_BUILD_FAIL', 'bool', 'false', 0, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(52, 'ONLY_UPGRADE_CLAIM_OBJECT_WITH_ALL_ITEMS', 'bool', 'false', 0, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(53, 'RESISTANCE_STAT_MAX', 'int', '10000', 1, '2000-01-01 00:00:00', '2019-11-17 19:01:45'),
(54, 'PLAYER_PERCEPTION_RADIUS', 'int', '75', 1, '2000-01-01 00:00:00', '2019-11-26 11:26:50'),
(55, 'AGGRO_RADIUS', 'int', '18', 1, '2000-01-01 00:00:00', '2019-11-17 19:01:55'),
(56, 'MOB_AGGRO_CLOSE_RANGE_CHECK', 'float', '2', 1, '2000-01-01 00:00:00', '2019-11-26 11:29:56'),
(57, 'MOB_EXP_RATE_NORMAL', 'float', '1.0', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(58, 'MOB_EXP_RATE_RARE', 'float', '1.5', 1, '2000-01-01 00:00:00', '2019-11-26 11:31:48'),
(59, 'MOB_EXP_RATE_BOSS', 'float', '2.5', 1, '2000-01-01 00:00:00', '2019-11-26 11:31:54'),
(60, 'SKILL_UP_RATE', 'float', '1.0', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(61, 'FLAT_ARMOR_DAMAGE_CALCULATIONS', 'bool', 'true', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(62, 'SKILL_PRIMARY_STAT_GAIN_INCREMENT', 'int', '4', 0, '2000-01-01 00:00:00', '2023-12-17 20:45:56'),
(63, 'SKILL_SECONDARY_STAT_GAIN_INCREMENT', 'int', '5', 0, '2000-01-01 00:00:00', '2023-12-17 20:45:57'),
(64, 'SKILL_THIRD_STAT_GAIN_INCREMENT', 'int', '6', 0, '2000-01-01 00:00:00', '2023-12-17 20:45:58'),
(65, 'SKILL_FOURTH_STAT_GAIN_INCREMENT', 'int', '7', 0, '2000-01-01 00:00:00', '2023-12-17 20:45:55'),
(66, 'GROUP_DISCONNECT_TIMEOUT', 'int', '30', 1, '2000-01-01 00:00:00', '2019-11-26 11:35:07'),
(67, 'EXP_LOST_FROM_MOB_DEATH', 'int', '5', 1, '2000-01-01 00:00:00', '2022-10-22 00:01:07'),
(68, 'BANK_SLOTS_COUNT', 'int', '20', 1, '2000-01-01 00:00:00', '2022-10-15 15:53:34'),
(69, 'GIVE_QUEST_ITEMS_TO_ALL_IN_GROUP', 'bool', 'true', 1, '2000-01-01 00:00:00', '2018-03-02 23:25:43'),
(70, 'DAMAGE_HITROLL_MODIFIER', 'int', '35', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(71, 'LOOT_BASED_ON_DAMAGE_DEALT', 'bool', 'true', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(72, 'WEATHER_UPDATE_PERIOD', 'int', '600', 1, '2000-01-01 00:00:00', '2019-11-26 11:42:24'),
(73, 'WEATHER_MONTH_SERVER_TIME', 'bool', 'true', 1, '2000-01-01 00:00:00', '2019-11-26 11:42:44'),
(74, 'WORLD_TIME_ZONE', 'string', 'UTC', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
(75, 'PLAYER_SILENCE_TIMEOUT', 'int', '30', 1, '2018-07-20 23:30:33', '2019-11-26 11:43:25'),
(76, 'DISTANCE_REQ_BETWEEN_CLAIMS', 'int', '10', 1, '2018-07-20 23:30:50', '2019-11-26 11:43:43'),
(77, 'PET_DISTANCE_DESPAWN', 'float', '50', 1, '2018-07-20 23:31:07', '2019-11-26 11:44:03'),
(78, 'MOB_FORCE_DESPAWN_IN_COMBAT', 'bool', 'false', 1, '2018-07-20 23:31:26', '2019-11-26 11:44:30'),
(79, 'DURABILITY_LOSS_CHANCE_FROM_ATTACK', 'int', '10', 1, '2018-11-14 00:16:05', '2019-11-26 11:44:57'),
(80, 'DURABILITY_LOSS_CHANCE_FROM_DEFEND', 'int', '5', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(81, 'DURABILITY_LOSS_CHANCE_FROM_GATHER', 'int', '50', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(82, 'DURABILITY_LOSS_CHANCE_FROM_CRAFT', 'int', '50', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(83, 'DURABILITY_DESTROY_BROKEN_ITEMS', 'bool', 'false', 1, '2018-11-14 00:16:05', '2000-01-01 00:00:00'),
(84, 'AUCTION_START_PRICE_VALUE', 'int', '1', 0, '2018-11-14 00:16:05', '2021-09-15 14:45:38'),
(85, 'AUCTION_START_PRICE_VALUE_PERCENTAGE', 'float', '10', 0, '2018-11-14 00:16:05', '2021-09-15 14:45:38'),
(86, 'AUCTION_COST_PRICE_VALUE', 'int', '2', 0, '2018-11-14 00:16:05', '2021-09-15 14:45:38'),
(87, 'AUCTION_COST_PRICE_VALUE_PERCENTAGE', 'float', '5', 0, '2018-11-14 00:16:06', '2021-09-15 14:45:38'),
(88, 'AUCTION_DURATION', 'int', '8', 0, '2018-11-14 00:16:06', '2021-09-15 14:45:38'),
(89, 'AUCTION_CURRENCY', 'int', '3', 0, '2018-11-14 00:16:06', '2021-09-15 14:45:38'),
(90, 'AUCTION_LIMIT', 'int', '100', 0, '2018-11-14 00:16:06', '2021-09-15 14:45:38'),
(91, 'AUCTION_OWN_LIMIT', 'int', '10', 0, '2018-11-14 00:16:06', '2021-09-15 14:45:38'),
(92, 'ENCHANTING_TIME', 'int', '4', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(93, 'SOCKET_FAILED_CLEAR', 'bool', 'false', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(94, 'SOCKET_CHANCE', 'float', '60', 1, '2018-11-14 00:16:07', '2019-11-26 11:48:57'),
(95, 'SOCKET_CREATE_TIME', 'int', '4', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(96, 'SOCKET_PRICE_CURRENCY', 'int', '3', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(97, 'SOCKET_PRICE_BASE', 'int', '1500', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(98, 'SOCKET_PRICE_PER_GRADE', 'int', '50000', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(99, 'SOCKET_RESET_TIME', 'int', '4', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(100, 'SOCKET_RESET_PRICE_CURRENCY', 'int', '3', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(101, 'SOCKET_RESET_PRICE_BASE', 'int', '1500', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(102, 'SOCKET_RESET_PRICE_PER_GRADE', 'int', '50000', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(103, 'CHARACTER_NAME_MIN_LENGTH', 'int', '3', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(104, 'CHARACTER_NAME_MAX_LENGTH', 'int', '14', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(105, 'CHARACTER_NAME_ALLOW_SPACES', 'bool', 'true', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(106, 'CHARACTER_NAME_ALLOW_NUMBERS', 'bool', 'true', 1, '2018-11-14 00:16:07', '2000-01-01 00:00:00'),
(107, 'HIT_CHANCE_PERCENTAGE_CAP', 'float', '30', 1, '2019-04-13 16:56:30', '2019-11-26 11:59:14'),
(108, 'PARRY_PERCENTAGE_CAP', 'float', '40', 1, '2019-04-13 16:56:57', '2019-11-26 12:00:13'),
(109, 'RESOURCE_HARVEST_XP_REWARD', 'int', '0', 1, '2019-04-13 16:59:37', '2019-11-26 12:01:08'),
(110, 'UPGRADE_CLAIM_OBJECT_ITEMS_FROM_INVENTORY', 'bool', 'true', 1, '2019-04-13 17:01:13', '2021-06-26 18:48:46'),
(111, 'CHAT_LOG_DB', 'bool', 'false', 1, '2019-08-21 10:29:12', '2019-11-26 12:02:19'),
(112, 'CHAT_LOG_FILE', 'bool', 'false', 1, '2019-08-21 10:29:25', '2019-11-26 12:02:23'),
(113, 'AUCTION_LOAD_DELAY', 'int', '10', 1, '2019-08-22 18:39:56', '2019-11-26 12:03:05'),
(116, 'DEATH_PERMANENTLY', 'bool', 'false', 1, '2019-10-06 21:09:59', '2019-11-26 12:04:15'),
(117, 'COLLECTION_SAVE_INTERVAL', 'int', '60', 1, '2019-11-16 00:15:51', '2000-01-01 00:00:00'),
(118, 'RANKING_CALCULATION_INTERVAL', 'int', '1440', 1, '2019-11-16 00:16:32', '2019-11-26 12:04:52'),
(119, 'USE_TALENT_PURCHASE_POINTS', 'bool', 'true', 1, '2019-11-19 16:23:35', '2000-01-01 00:00:00'),
(120, 'TALENT_POINTS_GIVEN_PER_LEVEL', 'int', '3', 1, '2019-11-19 16:23:52', '2000-01-01 00:00:00'),
(121, 'SOCKET_RESET_CHANCE', 'float', '60', 1, '2018-11-14 00:16:07', '2019-11-26 11:48:57'),
(122, 'LOOT_FOR_ALL', 'bool', 'false', 1, '2019-08-21 10:29:25', '2019-11-26 12:02:23'),
(124, 'DEATH_LOST_EXP', 'bool', 'false', 1, '2019-08-21 10:29:25', '2019-11-26 12:02:23'),
(125, 'DEATH_LOST_EXP_PERCENTAGE', 'float', '10', 1, '2018-11-14 00:16:07', '2019-11-26 11:48:57'),
(126, 'LOST_LEVEL', 'bool', 'false', 1, '2019-08-21 10:29:25', '2019-11-26 12:02:23'),
(127, 'LOOT_DICE_TIMEOUT', 'int', '30', 1, '2019-11-19 16:23:52', '2000-01-01 00:00:00'),
(128, 'GROUP_LOOT_DEFAULT_ROLL', 'int', '2', 1, '2019-11-19 16:23:52', '2023-12-17 23:45:01'),
(129, 'GROUP_LOOT_DEFAULT_DICE', 'int', '0', 1, '2019-11-19 16:23:52', '2000-01-01 00:00:00'),
(130, 'GROUP_LOOT_DEFAULT_GRADE', 'int', '3', 1, '2019-11-19 16:23:52', '2000-01-01 00:00:00'),
(131, 'SAVE_COOLDOWN_LIMIT_DURATION', 'int', '60', 1, '2020-08-23 11:24:14', '2020-11-21 17:52:44'),
(132, 'ABILITY_WEAPON_COOLDOWN_ATTACK_SPEED', 'bool', 'false', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(133, 'WEAPON_COOLDOWN', 'float', '3', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(134, 'GLOBAL_COOLDOWN', 'float', '1', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(135, 'COMBAT_MISS_CHANCE', 'float', '5', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(136, 'DUEL_DURATION', 'int', '120', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(137, 'FACTION_HATED_REP', 'int', '-3000', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(138, 'FACTION_DISLIKE_REP', 'int', '-1500', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(139, 'FACTION_NEUTRAL_REP', 'int', '0', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(140, 'FACTION_FRIENDLY_REP', 'int', '500', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(141, 'FACTION_HONOURED_REP', 'int', '1500', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(142, 'FACTION_EXALTED_REP', 'int', '3000', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(143, 'ABILITY_SKILL_UP_CHANCE', 'int', '80', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(144, 'MOB_SPAWN_TICK', 'int', '300', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(145, 'MOB_SPAWN_DELAY', 'int', '10000', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(146, 'FLAT_REPAIR_RATE', 'int', '25', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(147, 'FLAT_REPAIR_RATE_GRADE_MODIFIER', 'int', '10', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(148, 'USE_FLAT_REPAIR_RATE', 'bool', 'false', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(150, 'EXP_MAX_DISTANCE', 'float', '40', 1, '2020-08-23 11:57:27', '2000-01-01 00:00:00'),
(151, 'USE_ABILITY_STEALTH_REDUCTION', 'int', '0', 1, '2021-06-08 01:29:52', '2021-06-08 01:29:52'),
(152, 'USE_ABILITY_STEALTH_REDUCTION_PERCENTAGE', 'float', '0', 1, '2021-06-08 01:30:12', '2021-06-08 01:30:12'),
(153, 'USE_ABILITY_STEALTH_REDUCTION_TIMEOUT', 'int', '60', 1, '2021-06-08 01:30:32', '2021-06-08 01:30:32'),
(154, 'DYNAMIC_NAVMESH_UPDATE_SAVE', 'bool', 'false', 1, '2021-06-26 20:37:57', '2021-06-26 20:37:57'),
(155, 'DYNAMIC_NAVMESH_UPDATE_INTERVAL', 'int', '1000', 1, '2021-06-26 20:38:24', '2021-06-26 20:38:24'),
(156, 'PRIVATE_INVITE_TIMEOUT', 'int', '60', 1, '2021-06-26 20:38:52', '2021-06-26 20:38:52'),
(157, 'PREFAB_LOAD_ELEMENT_LIMIT', 'int', '100', 1, '2021-06-26 20:39:23', '2021-06-26 20:39:23'),
(158, 'PVP_DAMAGE_REDUCTION_PERCENT', 'float', '0.1', 1, '2021-06-26 20:42:16', '2021-06-26 20:42:16'),
(159, 'PVP_DAMAGE_REDUCTION_USE', 'bool', 'true', 1, '2021-06-26 20:42:41', '2021-06-26 20:42:41'),
(160, 'AUTO_PAY_TAX_SYSTEM', 'bool', 'true', 1, '2021-06-26 20:53:11', '2021-06-26 18:53:53'),
(161, 'USE_TAX_SYSTEM', 'bool', 'true', 1, '2021-06-26 20:53:37', '2021-06-26 20:53:37'),
(162, 'BUILDING_CORPSE_LOOT_DURATION', 'int', '60', 1, '2021-06-26 20:54:27', '2021-06-26 20:54:27'),
(163, 'BUILDING_CORPSE_MOB_TEMPLATE', 'int', '10009', 1, '2021-06-26 20:54:51', '2021-06-26 20:54:51'),
(164, 'FALL_DAMAGE_TYPE', 'string', 'crash', 1, '2021-07-07 17:13:02', '2021-07-07 17:13:02'),
(165, 'AUCTION_NPC_ONLY', 'bool', 'false', 1, '2021-07-26 21:14:40', '2022-11-09 23:32:26'),
(166, 'LOOT_DISTANCE', 'float', '7', 1, '2021-08-02 23:21:29', '2021-09-04 15:00:07'),
(167, 'HIT_CHANCE_POINT_PER_PERCENTAGE', 'int', '10', 1, '2021-09-15 18:43:41', '2021-09-15 18:43:41'),
(168, 'HIT_CHANCE_PERCENTAGE_PER_DIFF_LEVEL', 'int', '1', 1, '2021-09-15 18:44:28', '2021-09-15 18:44:28'),
(169, 'STAT_RANDOM_HIT_STUN', 'float', '0', 1, '2021-09-15 22:37:09', '2021-09-15 22:37:09'),
(170, 'STAT_RANDOM_HIT_SLEEP', 'float', '0', 1, '2021-09-15 22:37:38', '2021-09-15 22:37:38'),
(171, 'STAT_RANDOM_HIT_INTERRUPTION', 'float', '0', 1, '2021-09-15 22:38:09', '2021-09-15 22:38:09'),
(172, 'SKINNING_MAX_DISTANCE', 'float', '5', 1, '2021-09-15 22:38:09', '2021-09-15 22:38:09'),
(173, 'SERVER_DEVELOPMENT_MODE', 'bool', 'true', 1, '2022-04-08 18:22:51', '2000-01-01 00:00:00'),
(174, 'QUEST_CHECK_EQUIPED_ITEMS', 'bool', 'false', 1, '2022-04-08 18:22:51', '2000-01-01 00:00:00'),
(175, 'MOB_COMBAT_BEHAVIOR_SELECT_INTERVAL', 'int', '1000', 1, '2022-09-18 16:24:41', '2022-09-18 18:24:41'),
(176, 'MOB_COMBAT_BEHAVIOR_USE_ABILITY_TIMEOUT', 'int', '20000', 1, '2022-09-18 16:31:47', '2022-09-18 18:31:47'),
(177, 'MOB_COMBAT_BEHAVIOR_MOVE_CHECK_INTERVAL', 'int', '250', 1, '2022-09-18 19:03:32', '2022-09-27 23:58:44'),
(178, 'MOB_COMBAT_BEHAVIOR_DEFEND_CHANGE_TARGET_INTERVAL', 'int', '10000', 1, '2022-10-04 15:20:06', '2022-11-06 20:34:02'),
(180, 'STORE_BOUND_ITEM_IN_BANK', 'bool', 'false', 1, '2022-10-15 13:49:06', '2022-10-15 15:54:47'),
(181, 'EXP_GROUP_ADD_PERCENTAGE', 'float', '0.1', 1, '2022-10-21 22:04:37', '2022-10-22 00:04:37'),
(182, 'VIP_USE_TIME', 'bool', 'true', 1, '2022-11-10 12:27:24', '2023-04-24 22:06:17'),
(183, 'MOB_COMBAT_BEHAVIOR_FLEE_ALLIES_CHECK_MAX_DISTANCE', 'float', '40', 1, '2022-09-18 16:24:41', '2023-04-24 21:34:33'),
(184, 'MOB_COMBAT_BEHAVIOR_EVENT_TIMEOUT', 'int', '10000', 1, '2023-04-22 14:13:08', '2000-01-01 00:00:00'),
(185, 'MOB_COMBAT_BEHAVIOR_NUMBER_TARGETS_CHECK_MAX_DISTANCE', 'float', '40', 1, '2023-04-22 14:13:08', '2000-01-01 00:00:00'),
(186, 'VIP_PER_CHARACTER', 'bool', 'true', 1, '2022-12-19 20:06:41', '2023-04-24 21:35:56'),
(188, 'AUTO_ADJUSTMENT_MEMORY_THREADS_INTERVAL', 'int', '10', 1, '2023-04-25 16:04:45', '2023-04-25 16:04:45'),
(189, 'AUTO_ADJUSTMENT_MEMORY_THREADS', 'bool', 'false', 1, '2023-04-25 16:05:07', '2023-09-03 19:15:53'),
(190, 'PREFAB_MAX_INCOMING_MESSAGE_LENGTH', 'int', '500000', 1, '2023-09-04 20:33:23', '2000-01-01 00:00:00'),
(191, 'LOGIN_QUEUE_MAX_INTERVAL', 'int', '5000', 1, '2023-11-10 20:47:05', '2023-11-10 20:47:05'),
(192, 'LOGIN_QUEUE_MAX_USERS', 'int', '2', 1, '2023-11-10 20:47:56', '2023-11-10 20:47:56'),
(193, 'LOGIN_QUEUE_RATE', 'float', '0.1', 1, '2023-11-10 20:48:15', '2023-11-10 20:03:37'),
(194, 'INVENTORY_LOOT_ON_GROUND', 'bool', 'true', 1, '2023-12-10 19:39:17', '2023-12-10 19:39:17'),
(195, 'INVENTORY_LOOT_ON_GROUND_TIMEOUT', 'int', '600', 1, '2023-12-12 19:11:30', '2023-12-12 19:11:30'),
(196, 'INVENTORY_LOOT_ON_GROUND_TIMEOUT_INTERVAL', 'int', '5', 1, '2023-12-12 19:11:59', '2023-12-17 20:26:48'),
(197, 'INVENTORY_LOOT_ON_GROUND_MAX_DISTANCE', 'int', '10', 1, '2023-12-14 14:17:56', '2023-12-14 14:17:56'),
(198, 'INVENTORY_LOOT_ON_GROUND_LOGOUT_QUALITY_MAIL', 'string', '5;6', 1, '2023-12-14 16:52:13', '2023-12-16 22:49:01');

--
-- Wyzwalacze `game_setting`
--
DROP TRIGGER IF EXISTS `game_setting_trigger`;
DELIMITER ;;
CREATE TRIGGER `game_setting_trigger` BEFORE UPDATE ON `game_setting` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `global_events`
--

DROP TABLE IF EXISTS `global_events`;
CREATE TABLE IF NOT EXISTS `global_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `start_year` int NOT NULL DEFAULT '-1',
  `start_month` int NOT NULL DEFAULT '-1',
  `start_day` int NOT NULL DEFAULT '-1',
  `start_hour` int NOT NULL,
  `start_minute` int NOT NULL,
  `end_year` int NOT NULL DEFAULT '-1',
  `end_month` int NOT NULL DEFAULT '-1',
  `end_day` int NOT NULL DEFAULT '-1',
  `end_hour` int NOT NULL,
  `end_minute` int NOT NULL,
  `icon` varchar(256) NOT NULL,
  `icon2` mediumtext NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2010-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `global_events_bonuses`
--

DROP TABLE IF EXISTS `global_events_bonuses`;
CREATE TABLE IF NOT EXISTS `global_events_bonuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `global_event_id` int NOT NULL,
  `bonus_settings_id` int NOT NULL,
  `value` int NOT NULL,
  `valuep` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `graveyard`
--

DROP TABLE IF EXISTS `graveyard`;
CREATE TABLE IF NOT EXISTS `graveyard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `instance` int NOT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `factionReq` int DEFAULT '0',
  `factionRepReq` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `graveyard`
--
DROP TRIGGER IF EXISTS `graveyard_trigger`;
DELIMITER ;;
CREATE TRIGGER `graveyard_trigger` BEFORE UPDATE ON `graveyard` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_level_requirements`
--

DROP TABLE IF EXISTS `guild_level_requirements`;
CREATE TABLE IF NOT EXISTS `guild_level_requirements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NOT NULL,
  `item_id` int NOT NULL,
  `count` int NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_level_settings`
--

DROP TABLE IF EXISTS `guild_level_settings`;
CREATE TABLE IF NOT EXISTS `guild_level_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NOT NULL,
  `members_num` int NOT NULL DEFAULT '1',
  `merchant_table` int NOT NULL DEFAULT '-1',
  `warehouse_num_slots` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `guild_level_settings`
--

INSERT INTO `guild_level_settings` (`id`, `level`, `members_num`, `merchant_table`, `warehouse_num_slots`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 1, 20, 42, 5, 1, '2020-11-23 07:37:25', '2020-11-23 01:37:25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `interactive_object`
--

DROP TABLE IF EXISTS `interactive_object`;
CREATE TABLE IF NOT EXISTS `interactive_object` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `gameObject` varchar(256) DEFAULT NULL,
  `instance` int DEFAULT '-1',
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `interactionType` varchar(45) DEFAULT NULL,
  `interactionID` int DEFAULT '-1',
  `interactionData1` varchar(45) DEFAULT NULL,
  `interactionData2` varchar(45) DEFAULT NULL,
  `interactionData3` varchar(45) DEFAULT NULL,
  `questReqID` int DEFAULT '-1',
  `interactTimeReq` float DEFAULT '0',
  `coordEffect` varchar(128) DEFAULT NULL,
  `respawnTime` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `interactive_object`
--
DROP TRIGGER IF EXISTS `interactive_object_trigger`;
DELIMITER ;;
CREATE TRIGGER `interactive_object_trigger` BEFORE UPDATE ON `interactive_object` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_audio_profile`
--

DROP TABLE IF EXISTS `item_audio_profile`;
CREATE TABLE IF NOT EXISTS `item_audio_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(68) NOT NULL DEFAULT '',
  `use_event` varchar(256) NOT NULL DEFAULT '',
  `drag_begin_event` varchar(256) NOT NULL DEFAULT '',
  `drag_end_event` varchar(256) NOT NULL DEFAULT '',
  `delete_event` varchar(256) NOT NULL DEFAULT '',
  `broke_event` varchar(256) NOT NULL DEFAULT '',
  `pick_up_event` varchar(256) NOT NULL DEFAULT '',
  `fall_event` varchar(256) NOT NULL DEFAULT '',
  `drop_event` varchar(256) NOT NULL DEFAULT '',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_enchant_profile`
--

DROP TABLE IF EXISTS `item_enchant_profile`;
CREATE TABLE IF NOT EXISTS `item_enchant_profile` (
  `id` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  `level` int NOT NULL,
  `percentage` tinyint(1) NOT NULL,
  `all_stats` tinyint(1) NOT NULL,
  `add_not_exist` tinyint(1) NOT NULL,
  `stat_value` int NOT NULL,
  `chance` float NOT NULL,
  `lower_by` tinyint DEFAULT NULL,
  `lower_to` smallint DEFAULT NULL,
  `cost` int NOT NULL,
  `currency` int NOT NULL,
  `damage` int NOT NULL,
  `damagep` int NOT NULL,
  `effect1valuep` int DEFAULT '0',
  `effect1name` varchar(45) DEFAULT NULL,
  `effect1value` int DEFAULT '0',
  `effect2valuep` int DEFAULT '0',
  `effect2name` varchar(45) DEFAULT NULL,
  `effect2value` int DEFAULT '0',
  `effect3valuep` int DEFAULT '0',
  `effect3name` varchar(45) DEFAULT NULL,
  `effect3value` int DEFAULT '0',
  `effect4valuep` int DEFAULT '0',
  `effect4name` varchar(45) DEFAULT NULL,
  `effect4value` int DEFAULT '0',
  `effect5valuep` int DEFAULT '0',
  `effect5name` varchar(45) DEFAULT NULL,
  `effect5value` int DEFAULT '0',
  `effect6valuep` int DEFAULT '0',
  `effect6name` varchar(45) DEFAULT NULL,
  `effect6value` int DEFAULT '0',
  `effect7valuep` int DEFAULT '0',
  `effect7name` varchar(45) DEFAULT NULL,
  `effect7value` int DEFAULT '0',
  `effect8valuep` int DEFAULT '0',
  `effect8name` varchar(45) DEFAULT NULL,
  `effect8value` int DEFAULT '0',
  `effect9valuep` int DEFAULT '0',
  `effect9name` varchar(45) DEFAULT NULL,
  `effect9value` int DEFAULT '0',
  `effect10valuep` int DEFAULT '0',
  `effect10name` varchar(45) DEFAULT NULL,
  `effect10value` int DEFAULT '0',
  `effect11valuep` int DEFAULT '0',
  `effect11name` varchar(45) DEFAULT NULL,
  `effect11value` int DEFAULT '0',
  `effect12valuep` int DEFAULT '0',
  `effect12name` varchar(45) DEFAULT NULL,
  `effect12value` int DEFAULT '0',
  `effect13valuep` int DEFAULT '0',
  `effect13name` varchar(45) DEFAULT NULL,
  `effect13value` int DEFAULT '0',
  `effect14valuep` int DEFAULT '0',
  `effect14name` varchar(45) DEFAULT NULL,
  `effect14value` int DEFAULT '0',
  `effect15valuep` int DEFAULT '0',
  `effect15name` varchar(45) DEFAULT NULL,
  `effect15value` int DEFAULT '0',
  `effect16valuep` int DEFAULT '0',
  `effect16name` varchar(45) DEFAULT NULL,
  `effect16value` int DEFAULT '0',
  `effect17valuep` int DEFAULT '0',
  `effect17name` varchar(45) DEFAULT NULL,
  `effect17value` int DEFAULT '0',
  `effect18valuep` int DEFAULT '0',
  `effect18name` varchar(45) DEFAULT NULL,
  `effect18value` int DEFAULT '0',
  `effect19valuep` int DEFAULT '0',
  `effect19name` varchar(45) DEFAULT NULL,
  `effect19value` int DEFAULT '0',
  `effect20valuep` int DEFAULT '0',
  `effect20name` varchar(45) DEFAULT NULL,
  `effect20value` int DEFAULT '0',
  `effect21valuep` int DEFAULT '0',
  `effect21name` varchar(45) DEFAULT NULL,
  `effect21value` int DEFAULT '0',
  `effect22valuep` int DEFAULT '0',
  `effect22name` varchar(45) DEFAULT NULL,
  `effect22value` int DEFAULT '0',
  `effect23valuep` int DEFAULT '0',
  `effect23name` varchar(45) DEFAULT NULL,
  `effect23value` int DEFAULT '0',
  `effect24valuep` int DEFAULT '0',
  `effect24name` varchar(45) DEFAULT NULL,
  `effect24value` int DEFAULT '0',
  `effect25valuep` int DEFAULT '0',
  `effect25name` varchar(45) DEFAULT NULL,
  `effect25value` int DEFAULT '0',
  `effect26valuep` int DEFAULT '0',
  `effect26name` varchar(45) DEFAULT NULL,
  `effect26value` int DEFAULT '0',
  `effect27valuep` int DEFAULT '0',
  `effect27name` varchar(45) DEFAULT NULL,
  `effect27value` int DEFAULT '0',
  `effect28valuep` int DEFAULT '0',
  `effect28name` varchar(45) DEFAULT NULL,
  `effect28value` int DEFAULT '0',
  `effect29valuep` int DEFAULT '0',
  `effect29name` varchar(45) DEFAULT NULL,
  `effect29value` int DEFAULT '0',
  `effect30valuep` int DEFAULT '0',
  `effect30name` varchar(45) DEFAULT NULL,
  `effect30value` int DEFAULT '0',
  `effect31valuep` int DEFAULT '0',
  `effect31name` varchar(45) DEFAULT NULL,
  `effect31value` int DEFAULT '0',
  `effect32valuep` int DEFAULT '0',
  `effect32name` varchar(45) DEFAULT NULL,
  `effect32value` int DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `gear_score` int NOT NULL DEFAULT '0',
  `gear_scorep` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`level`)
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_quality`
--

DROP TABLE IF EXISTS `item_quality`;
CREATE TABLE IF NOT EXISTS `item_quality` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `cost` int NOT NULL,
  `chance` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2730 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_set_items`
--

DROP TABLE IF EXISTS `item_set_items`;
CREATE TABLE IF NOT EXISTS `item_set_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `set_id` int NOT NULL,
  `template_id` int NOT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=910 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_set_level`
--

DROP TABLE IF EXISTS `item_set_level`;
CREATE TABLE IF NOT EXISTS `item_set_level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `set_id` int NOT NULL,
  `number_of_parts` int NOT NULL,
  `damage` int DEFAULT '0',
  `damagep` int DEFAULT '0',
  `effect1valuep` int DEFAULT '0',
  `effect1name` varchar(45) DEFAULT NULL,
  `effect1value` int DEFAULT '0',
  `effect2valuep` int DEFAULT '0',
  `effect2name` varchar(45) DEFAULT NULL,
  `effect2value` int DEFAULT '0',
  `effect3valuep` int DEFAULT '0',
  `effect3name` varchar(45) DEFAULT NULL,
  `effect3value` int DEFAULT '0',
  `effect4valuep` int DEFAULT '0',
  `effect4name` varchar(45) DEFAULT NULL,
  `effect4value` int DEFAULT '0',
  `effect5valuep` int DEFAULT '0',
  `effect5name` varchar(45) DEFAULT NULL,
  `effect5value` int DEFAULT '0',
  `effect6valuep` int DEFAULT '0',
  `effect6name` varchar(45) DEFAULT NULL,
  `effect6value` int DEFAULT '0',
  `effect7valuep` int DEFAULT '0',
  `effect7name` varchar(45) DEFAULT NULL,
  `effect7value` int DEFAULT '0',
  `effect8valuep` int DEFAULT '0',
  `effect8name` varchar(45) DEFAULT NULL,
  `effect8value` int DEFAULT '0',
  `effect9valuep` int DEFAULT '0',
  `effect9name` varchar(45) DEFAULT NULL,
  `effect9value` int DEFAULT '0',
  `effect10valuep` int DEFAULT '0',
  `effect10name` varchar(45) DEFAULT NULL,
  `effect10value` int DEFAULT '0',
  `effect11valuep` int DEFAULT '0',
  `effect11name` varchar(45) DEFAULT NULL,
  `effect11value` int DEFAULT '0',
  `effect12valuep` int DEFAULT '0',
  `effect12name` varchar(45) DEFAULT NULL,
  `effect12value` int DEFAULT '0',
  `effect13valuep` int DEFAULT '0',
  `effect13name` varchar(45) DEFAULT NULL,
  `effect13value` int DEFAULT '0',
  `effect14valuep` int DEFAULT '0',
  `effect14name` varchar(45) DEFAULT NULL,
  `effect14value` int DEFAULT '0',
  `effect15valuep` int DEFAULT '0',
  `effect15name` varchar(45) DEFAULT NULL,
  `effect15value` int DEFAULT '0',
  `effect16valuep` int DEFAULT '0',
  `effect16name` varchar(45) DEFAULT NULL,
  `effect16value` int DEFAULT '0',
  `effect17valuep` int DEFAULT '0',
  `effect17name` varchar(45) DEFAULT NULL,
  `effect17value` int DEFAULT '0',
  `effect18valuep` int DEFAULT '0',
  `effect18name` varchar(45) DEFAULT NULL,
  `effect18value` int DEFAULT '0',
  `effect19valuep` int DEFAULT '0',
  `effect19name` varchar(45) DEFAULT NULL,
  `effect19value` int DEFAULT '0',
  `effect20valuep` int DEFAULT '0',
  `effect20name` varchar(45) DEFAULT NULL,
  `effect20value` int DEFAULT '0',
  `effect21valuep` int DEFAULT '0',
  `effect21name` varchar(45) DEFAULT NULL,
  `effect21value` int DEFAULT '0',
  `effect22valuep` int DEFAULT '0',
  `effect22name` varchar(45) DEFAULT NULL,
  `effect22value` int DEFAULT '0',
  `effect23valuep` int DEFAULT '0',
  `effect23name` varchar(45) DEFAULT NULL,
  `effect23value` int DEFAULT '0',
  `effect24valuep` int DEFAULT '0',
  `effect24name` varchar(45) DEFAULT NULL,
  `effect24value` int DEFAULT '0',
  `effect25valuep` int DEFAULT '0',
  `effect25name` varchar(45) DEFAULT NULL,
  `effect25value` int DEFAULT '0',
  `effect26valuep` int DEFAULT '0',
  `effect26name` varchar(45) DEFAULT NULL,
  `effect26value` int DEFAULT '0',
  `effect27valuep` int DEFAULT '0',
  `effect27name` varchar(45) DEFAULT NULL,
  `effect27value` int DEFAULT '0',
  `effect28valuep` int DEFAULT '0',
  `effect28name` varchar(45) DEFAULT NULL,
  `effect28value` int DEFAULT '0',
  `effect29valuep` int DEFAULT '0',
  `effect29name` varchar(45) DEFAULT NULL,
  `effect29value` int DEFAULT '0',
  `effect30valuep` int DEFAULT '0',
  `effect30name` varchar(45) DEFAULT NULL,
  `effect30value` int DEFAULT '0',
  `effect31valuep` int DEFAULT '0',
  `effect31name` varchar(45) DEFAULT NULL,
  `effect31value` int DEFAULT '0',
  `effect32valuep` int DEFAULT '0',
  `effect32name` varchar(45) DEFAULT NULL,
  `effect32value` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1820 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_set_profile`
--

DROP TABLE IF EXISTS `item_set_profile`;
CREATE TABLE IF NOT EXISTS `item_set_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_slots`
--

DROP TABLE IF EXISTS `item_slots`;
CREATE TABLE IF NOT EXISTS `item_slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `type` varchar(256) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `item_slots`
--

INSERT INTO `item_slots` (`id`, `name`, `type`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 'Main Hand', '415;417', 1, '2021-07-10 15:26:06', '2023-11-10 20:51:59'),
(2, 'Off Hand', '415', 1, '2021-07-10 15:26:06', '2023-10-30 18:43:39'),
(3, 'Head', '416', 1, '2021-07-10 15:26:36', '2000-01-01 00:00:00'),
(4, 'Chest', '416', 1, '2021-07-10 15:26:36', '2000-01-01 00:00:00'),
(5, 'Shirt', '416', 1, '2021-07-10 22:55:52', '2000-01-01 00:00:00'),
(6, 'Legs', '416', 1, '2021-07-10 22:55:52', '2000-01-01 00:00:00'),
(7, 'Feet', '416', 1, '2021-07-10 22:57:23', '2000-01-01 00:00:00'),
(8, 'Hands', '416', 1, '2021-07-10 22:57:23', '2000-01-01 00:00:00'),
(9, 'Shoulder', '416', 1, '2021-07-10 22:58:25', '2000-01-01 00:00:00'),
(10, 'Weist', '416', 1, '2021-07-10 22:58:25', '2000-01-01 00:00:00'),
(11, 'Back', '415', 1, '2021-07-10 22:59:09', '2021-08-20 00:38:26'),
(12, 'Neck', '416', 1, '2021-07-10 22:59:09', '2000-01-01 00:00:00'),
(13, 'Main Ring', '416', 1, '2021-07-10 22:59:35', '2000-01-01 00:00:00'),
(14, 'Off Ring', '416', 1, '2021-07-10 22:59:35', '2000-01-01 00:00:00'),
(15, 'Main Earring', '416', 1, '2021-07-10 23:00:03', '2000-01-01 00:00:00'),
(16, 'Off Earring', '416', 1, '2021-07-10 23:00:03', '2000-01-01 00:00:00'),
(17, 'Fashion', '416', 1, '2021-07-10 23:01:02', '2000-01-01 00:00:00'),
(18, 'RangedWeapon', '415', 1, '2021-07-10 23:01:02', '2000-01-01 00:00:00'),
(19, 'TestWeapon', '415', 1, '2021-08-27 16:02:13', '2021-08-28 00:13:46'),
(20, 'TestArmor', '416', 1, '2021-08-27 16:04:57', '2021-08-27 16:04:57'),
(21, 'TestSlot', '415', 1, '2021-08-27 16:23:24', '2021-08-28 00:14:15'),
(22, 'toolslot', '417', 1, '2021-08-28 15:08:04', '2021-08-28 15:08:04'),
(23, 'test', '415', 1, '2021-08-28 15:23:48', '2021-08-28 15:23:48'),
(24, 'Axe', '417', 1, '2021-09-01 16:10:51', '2021-09-01 16:10:51'),
(25, 'Pickaxe', '417', 1, '2021-09-01 19:01:19', '2021-09-01 19:01:19'),
(26, 'test11', '415', 1, '2023-11-15 19:29:30', '2023-11-15 19:29:30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_slots_group`
--

DROP TABLE IF EXISTS `item_slots_group`;
CREATE TABLE IF NOT EXISTS `item_slots_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `all_slots` tinyint(1) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `item_slots_group`
--

INSERT INTO `item_slots_group` (`id`, `name`, `all_slots`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 'Two Hand', 1, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00'),
(2, 'Any Hand', 0, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00'),
(3, 'Ring', 0, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00'),
(4, 'Earring', 0, 1, '2021-07-10 15:27:18', '2000-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_slots_in_group`
--

DROP TABLE IF EXISTS `item_slots_in_group`;
CREATE TABLE IF NOT EXISTS `item_slots_in_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slot_group_id` int NOT NULL,
  `slot_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `item_slots_in_group`
--

INSERT INTO `item_slots_in_group` (`id`, `slot_group_id`, `slot_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 13),
(6, 3, 14),
(7, 4, 15),
(8, 4, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_slots_sets`
--

DROP TABLE IF EXISTS `item_slots_sets`;
CREATE TABLE IF NOT EXISTS `item_slots_sets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slot_id` int DEFAULT NULL,
  `set_id` int DEFAULT NULL,
  `race` int DEFAULT NULL,
  `class` int DEFAULT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `slot_id` (`slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_templates`
--

DROP TABLE IF EXISTS `item_templates`;
CREATE TABLE IF NOT EXISTS `item_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(86) NOT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `icon2` mediumtext NOT NULL,
  `category` varchar(86) DEFAULT NULL,
  `subcategory` varchar(86) DEFAULT NULL,
  `itemType` varchar(86) DEFAULT NULL,
  `subType` varchar(86) DEFAULT NULL,
  `slot` varchar(86) DEFAULT NULL,
  `display` varchar(128) DEFAULT NULL,
  `slot1` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect1` text NOT NULL,
  `drawWeaponTime1` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect1` text NOT NULL,
  `holsteringWeaponTime1` int NOT NULL DEFAULT '1',
  `slot2` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect2` text NOT NULL,
  `drawWeaponTime2` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect2` text NOT NULL,
  `holsteringWeaponTime2` int NOT NULL DEFAULT '1',
  `slot3` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect3` text NOT NULL,
  `drawWeaponTime3` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect3` text NOT NULL,
  `holsteringWeaponTime3` int NOT NULL DEFAULT '1',
  `slot4` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect4` text NOT NULL,
  `drawWeaponTime4` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect4` text NOT NULL,
  `holsteringWeaponTime4` int NOT NULL DEFAULT '1',
  `slot5` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect5` text NOT NULL,
  `drawWeaponTime5` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect5` text NOT NULL,
  `holsteringWeaponTime5` int NOT NULL DEFAULT '1',
  `slot6` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect6` text NOT NULL,
  `drawWeaponTime6` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect6` text NOT NULL,
  `holsteringWeaponTime6` int NOT NULL DEFAULT '1',
  `slot7` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect7` text NOT NULL,
  `drawWeaponTime7` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect7` text NOT NULL,
  `holsteringWeaponTime7` int NOT NULL DEFAULT '1',
  `slot8` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect8` text NOT NULL,
  `drawWeaponTime8` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect8` text NOT NULL,
  `holsteringWeaponTime8` int NOT NULL DEFAULT '1',
  `slot9` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect9` text NOT NULL,
  `drawWeaponTime9` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect9` text NOT NULL,
  `holsteringWeaponTime9` int NOT NULL DEFAULT '1',
  `slot10` varchar(86) NOT NULL DEFAULT '',
  `drawWeaponEffect10` text NOT NULL,
  `drawWeaponTime10` int NOT NULL DEFAULT '1',
  `holsteringWeaponEffect10` text NOT NULL,
  `holsteringWeaponTime10` int NOT NULL DEFAULT '1',
  `itemQuality` tinyint DEFAULT NULL,
  `binding` tinyint DEFAULT NULL,
  `isUnique` tinyint(1) DEFAULT NULL,
  `stackLimit` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `purchaseCurrency` tinyint DEFAULT NULL,
  `purchaseCost` bigint DEFAULT '0',
  `sellable` tinyint(1) DEFAULT '1',
  `damage` int NOT NULL DEFAULT '0',
  `damageMax` int NOT NULL DEFAULT '0',
  `damageType` varchar(86) DEFAULT NULL,
  `delay` float DEFAULT NULL,
  `toolTip` varchar(255) DEFAULT NULL,
  `triggerEvent` varchar(86) DEFAULT NULL,
  `triggerAction1Type` varchar(86) DEFAULT NULL,
  `triggerAction1Data` varchar(86) DEFAULT NULL,
  `effect1type` varchar(86) DEFAULT NULL,
  `effect1name` varchar(86) DEFAULT NULL,
  `effect1value` varchar(86) DEFAULT '0',
  `effect2type` varchar(86) DEFAULT NULL,
  `effect2name` varchar(86) DEFAULT NULL,
  `effect2value` varchar(86) DEFAULT '0',
  `effect3type` varchar(86) DEFAULT NULL,
  `effect3name` varchar(86) DEFAULT NULL,
  `effect3value` varchar(86) DEFAULT '0',
  `effect4type` varchar(86) DEFAULT NULL,
  `effect4name` varchar(86) DEFAULT NULL,
  `effect4value` varchar(86) DEFAULT '0',
  `effect5type` varchar(86) DEFAULT NULL,
  `effect5name` varchar(86) DEFAULT NULL,
  `effect5value` varchar(86) DEFAULT '0',
  `effect6type` varchar(86) DEFAULT NULL,
  `effect6name` varchar(86) DEFAULT NULL,
  `effect6value` varchar(86) DEFAULT '0',
  `effect7type` varchar(86) DEFAULT NULL,
  `effect7name` varchar(86) DEFAULT NULL,
  `effect7value` varchar(86) DEFAULT '0',
  `effect8type` varchar(86) DEFAULT NULL,
  `effect8name` varchar(86) DEFAULT NULL,
  `effect8value` varchar(86) DEFAULT '0',
  `effect9type` varchar(86) DEFAULT NULL,
  `effect9name` varchar(86) DEFAULT NULL,
  `effect9value` varchar(86) DEFAULT '0',
  `effect10type` varchar(86) DEFAULT NULL,
  `effect10name` varchar(86) DEFAULT NULL,
  `effect10value` varchar(86) DEFAULT '0',
  `effect11type` varchar(86) DEFAULT NULL,
  `effect11name` varchar(86) DEFAULT NULL,
  `effect11value` varchar(86) DEFAULT '0',
  `effect12type` varchar(86) DEFAULT NULL,
  `effect12name` varchar(86) DEFAULT NULL,
  `effect12value` varchar(86) DEFAULT '0',
  `effect13type` varchar(86) DEFAULT NULL,
  `effect13name` varchar(86) DEFAULT NULL,
  `effect13value` varchar(86) DEFAULT '0',
  `effect14type` varchar(86) DEFAULT NULL,
  `effect14name` varchar(86) DEFAULT NULL,
  `effect14value` varchar(86) DEFAULT '0',
  `effect15type` varchar(86) DEFAULT NULL,
  `effect15name` varchar(86) DEFAULT NULL,
  `effect15value` varchar(86) DEFAULT '0',
  `effect16type` varchar(86) DEFAULT NULL,
  `effect16name` varchar(86) DEFAULT NULL,
  `effect16value` varchar(86) DEFAULT '0',
  `effect17type` varchar(86) DEFAULT NULL,
  `effect17name` varchar(86) DEFAULT NULL,
  `effect17value` varchar(86) DEFAULT '0',
  `effect18type` varchar(86) DEFAULT NULL,
  `effect18name` varchar(86) DEFAULT NULL,
  `effect18value` varchar(86) DEFAULT '0',
  `effect19type` varchar(86) DEFAULT NULL,
  `effect19name` varchar(86) DEFAULT NULL,
  `effect19value` varchar(86) DEFAULT '0',
  `effect20type` varchar(86) DEFAULT NULL,
  `effect20name` varchar(86) DEFAULT NULL,
  `effect20value` varchar(86) DEFAULT '0',
  `effect21type` varchar(86) DEFAULT NULL,
  `effect21name` varchar(86) DEFAULT NULL,
  `effect21value` varchar(86) DEFAULT '0',
  `effect22type` varchar(86) DEFAULT NULL,
  `effect22name` varchar(86) DEFAULT NULL,
  `effect22value` varchar(86) DEFAULT '0',
  `effect23type` varchar(86) DEFAULT NULL,
  `effect23name` varchar(86) DEFAULT NULL,
  `effect23value` varchar(86) DEFAULT '0',
  `effect24type` varchar(86) DEFAULT NULL,
  `effect24name` varchar(86) DEFAULT NULL,
  `effect24value` varchar(86) DEFAULT '0',
  `effect25type` varchar(86) DEFAULT NULL,
  `effect25name` varchar(86) DEFAULT NULL,
  `effect25value` varchar(86) DEFAULT '0',
  `effect26type` varchar(86) DEFAULT NULL,
  `effect26name` varchar(86) DEFAULT NULL,
  `effect26value` varchar(86) DEFAULT '0',
  `effect27type` varchar(86) DEFAULT NULL,
  `effect27name` varchar(86) DEFAULT NULL,
  `effect27value` varchar(86) DEFAULT '0',
  `effect28type` varchar(86) DEFAULT NULL,
  `effect28name` varchar(86) DEFAULT NULL,
  `effect28value` varchar(86) DEFAULT '0',
  `effect29type` varchar(86) DEFAULT NULL,
  `effect29name` varchar(86) DEFAULT NULL,
  `effect29value` varchar(86) DEFAULT '0',
  `effect30type` varchar(86) DEFAULT NULL,
  `effect30name` varchar(86) DEFAULT NULL,
  `effect30value` varchar(86) DEFAULT '0',
  `effect31type` varchar(86) DEFAULT NULL,
  `effect31name` varchar(86) DEFAULT NULL,
  `effect31value` varchar(86) DEFAULT '0',
  `effect32type` varchar(86) DEFAULT NULL,
  `effect32name` varchar(86) DEFAULT NULL,
  `effect32value` varchar(86) DEFAULT '0',
  `actionBarAllowed` tinyint(1) NOT NULL DEFAULT '0',
  `enchant_profile_id` int NOT NULL DEFAULT '-1',
  `weapon_profile_id` int NOT NULL DEFAULT '-1',
  `auctionHouse` tinyint(1) NOT NULL DEFAULT '1',
  `skillExp` int NOT NULL DEFAULT '0',
  `gear_score` int NOT NULL DEFAULT '0',
  `weight` int NOT NULL DEFAULT '0',
  `durability` int NOT NULL DEFAULT '0',
  `autoattack` int NOT NULL DEFAULT '-1',
  `socket_type` varchar(86) NOT NULL DEFAULT '',
  `ammotype` int NOT NULL DEFAULT '0',
  `death_loss` int NOT NULL DEFAULT '0',
  `parry` tinyint(1) NOT NULL DEFAULT '0',
  `oadelete` tinyint(1) NOT NULL DEFAULT '0',
  `passive_ability` int NOT NULL DEFAULT '-1',
  `shopSlots` int NOT NULL DEFAULT '0',
  `shopModel` varchar(256) NOT NULL DEFAULT '' COMMENT 'not use',
  `shopTag` varchar(256) NOT NULL DEFAULT '',
  `numShops` int NOT NULL DEFAULT '1',
  `shopDestroyOnLogOut` tinyint(1) NOT NULL DEFAULT '1',
  `shopMobTemplate` int NOT NULL DEFAULT '-1',
  `shopTimeOut` int NOT NULL DEFAULT '0',
  `repairable` tinyint DEFAULT '1',
  `ground_prefab` varchar(128) NOT NULL DEFAULT '',
  `audio_profile_id` int NOT NULL DEFAULT '-1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=840 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Wyzwalacze `item_templates`
--
DROP TRIGGER IF EXISTS `item_templates_trigger`;
DELIMITER ;;
CREATE TRIGGER `item_templates_trigger` BEFORE UPDATE ON `item_templates` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_templates_options`
--

DROP TABLE IF EXISTS `item_templates_options`;
CREATE TABLE IF NOT EXISTS `item_templates_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `editor_option_type_id` int NOT NULL,
  `editor_option_choice_type_id` varchar(45) NOT NULL,
  `required_value` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` timestamp NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=744 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `item_templates_options`
--
DROP TRIGGER IF EXISTS `item_templates_options_trigger`;
DELIMITER ;;
CREATE TRIGGER `item_templates_options_trigger` BEFORE UPDATE ON `item_templates_options` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `item_weights`
--

DROP TABLE IF EXISTS `item_weights`;
CREATE TABLE IF NOT EXISTS `item_weights` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `prefix` tinyint(1) DEFAULT NULL,
  `stat1` varchar(64) DEFAULT NULL,
  `weight1` int DEFAULT NULL,
  `stat2` varchar(64) DEFAULT NULL,
  `weight2` int DEFAULT NULL,
  `stat3` varchar(64) DEFAULT NULL,
  `weight3` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `item_weights`
--
DROP TRIGGER IF EXISTS `item_weights_trigger`;
DELIMITER ;;
CREATE TRIGGER `item_weights_trigger` BEFORE UPDATE ON `item_weights` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `level_xp_requirements`
--

DROP TABLE IF EXISTS `level_xp_requirements`;
CREATE TABLE IF NOT EXISTS `level_xp_requirements` (
  `xpProfile` int NOT NULL DEFAULT '1',
  `level` int NOT NULL,
  `xpRequired` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `reward_template_id` int DEFAULT '-1',
  PRIMARY KEY (`xpProfile`,`level`)
) ENGINE=InnoDB AVG_ROW_LENGTH=546 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `level_xp_requirements`
--

INSERT INTO `level_xp_requirements` (`xpProfile`, `level`, `xpRequired`, `isactive`, `creationtimestamp`, `updatetimestamp`, `reward_template_id`) VALUES
(1, 1, 200, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 2, 500, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 3, 800, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 4, 1100, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 5, 1400, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 6, 1700, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 7, 2000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 8, 10000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 9, 20000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 10, 50000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 11, 100000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 12, 200000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 13, 400000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 14, 800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 15, 1600000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 16, 3200000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 17, 6400000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 18, 12800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 19, 25600000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 20, 51200000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 21, 102400000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 22, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 23, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 24, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 25, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 26, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 27, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 28, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 29, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1),
(1, 30, 204800000, 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00', -1);

--
-- Wyzwalacze `level_xp_requirements`
--
DROP TRIGGER IF EXISTS `level_xp_requirements_trigger`;
DELIMITER ;;
CREATE TRIGGER `level_xp_requirements_trigger` BEFORE UPDATE ON `level_xp_requirements` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `level_xp_requirements_rewards`
--

DROP TABLE IF EXISTS `level_xp_requirements_rewards`;
CREATE TABLE IF NOT EXISTS `level_xp_requirements_rewards` (
  `reward_id` int NOT NULL AUTO_INCREMENT,
  `reward_template_id` int DEFAULT NULL,
  `reward_type` varchar(86) DEFAULT NULL,
  `reward_value` int DEFAULT NULL,
  `reward_amount` int DEFAULT NULL,
  `give_once` tinyint(1) NOT NULL DEFAULT '1',
  `on_level_down` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `level_xp_requirements_reward_templates`
--

DROP TABLE IF EXISTS `level_xp_requirements_reward_templates`;
CREATE TABLE IF NOT EXISTS `level_xp_requirements_reward_templates` (
  `reward_template_id` int NOT NULL AUTO_INCREMENT,
  `reward_template_name` varchar(86) DEFAULT NULL,
  `reward_mail_subject` varchar(255) DEFAULT '',
  `reward_mail_message` text,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`reward_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `level_xp_requirements_templates`
--

DROP TABLE IF EXISTS `level_xp_requirements_templates`;
CREATE TABLE IF NOT EXISTS `level_xp_requirements_templates` (
  `xpProfile` int NOT NULL AUTO_INCREMENT,
  `xpProfile_name` varchar(86) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`xpProfile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `level_xp_requirements_templates`
--

INSERT INTO `level_xp_requirements_templates` (`xpProfile`, `xpProfile_name`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(1, 'Profile1', 1, '2023-09-03 12:50:16', '2023-09-03 12:50:16');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loot_tables`
--

DROP TABLE IF EXISTS `loot_tables`;
CREATE TABLE IF NOT EXISTS `loot_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `item1` int NOT NULL DEFAULT '-1',
  `item1count` int DEFAULT '0',
  `item1chance` float(10,7) DEFAULT '0.0000000',
  `item2` int NOT NULL DEFAULT '-1',
  `item2count` int DEFAULT '0',
  `item2chance` float(10,7) DEFAULT '0.0000000',
  `item3` int NOT NULL DEFAULT '-1',
  `item3count` int DEFAULT '0',
  `item3chance` float(10,7) DEFAULT '0.0000000',
  `item4` int NOT NULL DEFAULT '-1',
  `item4count` int DEFAULT '0',
  `item4chance` float(10,7) DEFAULT '0.0000000',
  `item5` int NOT NULL DEFAULT '-1',
  `item5count` int DEFAULT '0',
  `item5chance` float(10,7) DEFAULT '0.0000000',
  `item6` int NOT NULL DEFAULT '-1',
  `item6count` int DEFAULT '0',
  `item6chance` float(10,7) DEFAULT '0.0000000',
  `item7` int NOT NULL DEFAULT '-1',
  `item7count` int DEFAULT '0',
  `item7chance` float(10,7) DEFAULT '0.0000000',
  `item8` int NOT NULL DEFAULT '-1',
  `item8count` int DEFAULT '0',
  `item8chance` float(10,7) DEFAULT '0.0000000',
  `item9` int NOT NULL DEFAULT '-1',
  `item9count` int DEFAULT '0',
  `item9chance` float(10,7) DEFAULT '0.0000000',
  `item10` int NOT NULL DEFAULT '-1',
  `item10count` int DEFAULT '0',
  `item10chance` float(10,7) DEFAULT '0.0000000',
  `category` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `item1` (`item1`)
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `loot_tables`
--
DROP TRIGGER IF EXISTS `loot_tables_trigger`;
DELIMITER ;;
CREATE TRIGGER `loot_tables_trigger` BEFORE UPDATE ON `loot_tables` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loot_table_items`
--

DROP TABLE IF EXISTS `loot_table_items`;
CREATE TABLE IF NOT EXISTS `loot_table_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loot_table_id` int NOT NULL,
  `item` int NOT NULL DEFAULT '1',
  `count` int DEFAULT '1',
  `count_max` int NOT NULL DEFAULT '0',
  `chance` float(12,7) DEFAULT '0.0000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `merchant_item`
--

DROP TABLE IF EXISTS `merchant_item`;
CREATE TABLE IF NOT EXISTS `merchant_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tableID` int NOT NULL,
  `itemID` int NOT NULL,
  `count` int DEFAULT '-1',
  `refreshTime` int DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=364 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `merchant_item`
--
DROP TRIGGER IF EXISTS `merchant_item_trigger`;
DELIMITER ;;
CREATE TRIGGER `merchant_item_trigger` BEFORE UPDATE ON `merchant_item` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `merchant_tables`
--

DROP TABLE IF EXISTS `merchant_tables`;
CREATE TABLE IF NOT EXISTS `merchant_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=3276 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `merchant_tables`
--
DROP TRIGGER IF EXISTS `merchant_tables_trigger`;
DELIMITER ;;
CREATE TRIGGER `merchant_tables_trigger` BEFORE UPDATE ON `merchant_tables` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_ability`
--

DROP TABLE IF EXISTS `mob_ability`;
CREATE TABLE IF NOT EXISTS `mob_ability` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mob_ability_order` int NOT NULL,
  `behavior_id` int NOT NULL,
  `abilities` text NOT NULL,
  `minAbilityRangePercentage` float NOT NULL,
  `maxAbilityRangePercentage` float NOT NULL,
  `mob_ability_type` int NOT NULL COMMENT '0-Abilites; 1-Start Abiliies; 2-End Abilities',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `behavior_id` (`behavior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_ability_conditions`
--

DROP TABLE IF EXISTS `mob_ability_conditions`;
CREATE TABLE IF NOT EXISTS `mob_ability_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conditions_group_id` int NOT NULL,
  `type` int NOT NULL COMMENT '0-Event; 1-Distance; 2-Stat; 3-Effect; 4-CombatState; 5-DeathState; 6-NumberOfTargets',
  `distance` float NOT NULL,
  `less` tinyint(1) NOT NULL,
  `stat_name` varchar(256) NOT NULL,
  `stat_value` float NOT NULL,
  `stat_vitality_percentage` tinyint(1) NOT NULL,
  `target` int NOT NULL COMMENT '0-Caster; 1-Target',
  `effect_tag_id` int NOT NULL,
  `on_target` tinyint(1) NOT NULL,
  `combat_state` tinyint(1) NOT NULL,
  `death_state` tinyint(1) NOT NULL,
  `trigger_event_Id` int NOT NULL COMMENT '0-Parry; 1-Dodge; 2-Miss; 3-Damage; 4-Heal; 5-Critical; 6-Kill; 7-Stun; 8-Sleep',
  `target_number` int NOT NULL,
  `target_ally` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `conditions_group_id` (`conditions_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_ability_conditions_group`
--

DROP TABLE IF EXISTS `mob_ability_conditions_group`;
CREATE TABLE IF NOT EXISTS `mob_ability_conditions_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_order` int NOT NULL,
  `mob_ability_id` int NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mob_ability_id` (`mob_ability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_behaviors`
--

DROP TABLE IF EXISTS `mob_behaviors`;
CREATE TABLE IF NOT EXISTS `mob_behaviors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `behavior_order` int NOT NULL,
  `type` int NOT NULL COMMENT '0-Melee; 1-Ranged Offensive; 2-Ranged Defensive; 3-Defend; 4-Flee; 5-Heal',
  `flee_type` int NOT NULL COMMENT '0-Opposite direction;1-Defined position;2-To group friendly mobs',
  `flee_loc_x` float DEFAULT NULL,
  `flee_loc_y` float DEFAULT NULL,
  `flee_loc_z` float DEFAULT NULL,
  `ability_interval` int NOT NULL,
  `mob_tag` int NOT NULL,
  `ignore_chase_distance` tinyint(1) NOT NULL DEFAULT '1',
  `weapon` int NOT NULL DEFAULT '-1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_behavior_points`
--

DROP TABLE IF EXISTS `mob_behavior_points`;
CREATE TABLE IF NOT EXISTS `mob_behavior_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `behavior_id` int NOT NULL,
  `loc_x` float NOT NULL,
  `loc_y` float NOT NULL,
  `loc_z` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `behavior_id` (`behavior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_behavior_profile`
--

DROP TABLE IF EXISTS `mob_behavior_profile`;
CREATE TABLE IF NOT EXISTS `mob_behavior_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_display`
--

DROP TABLE IF EXISTS `mob_display`;
CREATE TABLE IF NOT EXISTS `mob_display` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `prefab` varchar(64) NOT NULL,
  `race` varchar(64) DEFAULT NULL,
  `gender` varchar(32) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `mob_display`
--
DROP TRIGGER IF EXISTS `mob_display_trigger`;
DELIMITER ;;
CREATE TRIGGER `mob_display_trigger` BEFORE UPDATE ON `mob_display` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_loot`
--

DROP TABLE IF EXISTS `mob_loot`;
CREATE TABLE IF NOT EXISTS `mob_loot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL DEFAULT '1',
  `mobTemplate` int NOT NULL,
  `lootTable` int DEFAULT NULL,
  `dropChance` float(10,7) DEFAULT NULL,
  `count` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mobTemplate` (`mobTemplate`)
) ENGINE=InnoDB AVG_ROW_LENGTH=780 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `mob_loot`
--
DROP TRIGGER IF EXISTS `mob_loot_trigger`;
DELIMITER ;;
CREATE TRIGGER `mob_loot_trigger` BEFORE UPDATE ON `mob_loot` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_stat`
--

DROP TABLE IF EXISTS `mob_stat`;
CREATE TABLE IF NOT EXISTS `mob_stat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobTemplate` int NOT NULL,
  `stat` varchar(45) NOT NULL,
  `value` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `mob_stat`
--
DROP TRIGGER IF EXISTS `mob_stat_trigger`;
DELIMITER ;;
CREATE TRIGGER `mob_stat_trigger` BEFORE UPDATE ON `mob_stat` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mob_templates`
--

DROP TABLE IF EXISTS `mob_templates`;
CREATE TABLE IF NOT EXISTS `mob_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `displayName` varchar(200) NOT NULL DEFAULT '',
  `subTitle` varchar(64) DEFAULT NULL,
  `mobType` int NOT NULL,
  `display1` varchar(128) NOT NULL DEFAULT '-1',
  `display2` varchar(128) DEFAULT NULL,
  `display3` varchar(128) DEFAULT NULL,
  `display4` varchar(128) DEFAULT NULL,
  `scale` float DEFAULT NULL,
  `hitbox` int DEFAULT NULL,
  `baseAnimationState` int NOT NULL DEFAULT '1',
  `faction` int NOT NULL DEFAULT '0',
  `attackable` tinyint(1) NOT NULL,
  `minLevel` int NOT NULL,
  `maxLevel` int DEFAULT NULL,
  `species` varchar(64) NOT NULL,
  `subSpecies` varchar(64) NOT NULL,
  `skinningLootTable` int DEFAULT '-1',
  `skinningLevelReq` int DEFAULT '0',
  `skinningLevelMax` int NOT NULL DEFAULT '0',
  `skinningSkillId` int NOT NULL DEFAULT '-1',
  `skinningSkillExp` int NOT NULL DEFAULT '0',
  `skinningWeaponReq` varchar(200) NOT NULL DEFAULT '',
  `skinningHarvestTime` decimal(20,1) NOT NULL DEFAULT '2.0',
  `questCategory` varchar(32) DEFAULT NULL,
  `specialUse` varchar(32) DEFAULT NULL,
  `speed_walk` float DEFAULT NULL,
  `speed_run` float DEFAULT NULL,
  `minDmg` int DEFAULT NULL,
  `maxDmg` int DEFAULT NULL,
  `attackSpeed` float DEFAULT NULL,
  `dmgType` varchar(20) DEFAULT NULL,
  `primaryWeapon` int DEFAULT NULL,
  `secondaryWeapon` int DEFAULT NULL,
  `autoAttack` int NOT NULL DEFAULT '-1',
  `attackDistance` float DEFAULT '0',
  `ability0` int DEFAULT '-1',
  `abilityStatReq0` varchar(45) DEFAULT NULL,
  `abilityStatPercent0` int DEFAULT '0',
  `ability1` int DEFAULT '-1',
  `abilityStatReq1` varchar(45) DEFAULT NULL,
  `abilityStatPercent1` int DEFAULT '0',
  `ability2` int DEFAULT '-1',
  `abilityStatReq2` varchar(45) DEFAULT NULL,
  `abilityStatPercent2` int DEFAULT '0',
  `exp` int NOT NULL DEFAULT '0',
  `addExplev` int NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `aggro_radius` int NOT NULL DEFAULT '17',
  `send_link_aggro` tinyint(1) NOT NULL DEFAULT '0',
  `get_link_aggro` tinyint(1) NOT NULL DEFAULT '0',
  `link_aggro_range` int NOT NULL DEFAULT '0',
  `chasing_distance` int NOT NULL DEFAULT '60',
  `tags` text NOT NULL,
  `behavior_profile_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `mob_templates`
--
DROP TRIGGER IF EXISTS `mob_templates_trigger`;
DELIMITER ;;
CREATE TRIGGER `mob_templates_trigger` BEFORE UPDATE ON `mob_templates` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `npcdisplay`
--

DROP TABLE IF EXISTS `npcdisplay`;
CREATE TABLE IF NOT EXISTS `npcdisplay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `race` varchar(64) DEFAULT NULL,
  `gender` varchar(32) NOT NULL,
  `skinColour` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=910 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `npcdisplay`
--
DROP TRIGGER IF EXISTS `npcdisplay_trigger`;
DELIMITER ;;
CREATE TRIGGER `npcdisplay_trigger` BEFORE UPDATE ON `npcdisplay` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `patrol_path`
--

DROP TABLE IF EXISTS `patrol_path`;
CREATE TABLE IF NOT EXISTS `patrol_path` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `startingPoint` tinyint(1) NOT NULL,
  `travelReverse` tinyint(1) NOT NULL,
  `locX` float NOT NULL,
  `locY` float NOT NULL,
  `locZ` float NOT NULL,
  `lingerTime` float NOT NULL DEFAULT '0',
  `nextPoint` int NOT NULL DEFAULT '-1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `patrol_path`
--
DROP TRIGGER IF EXISTS `patrol_path_trigger`;
DELIMITER ;;
CREATE TRIGGER `patrol_path_trigger` BEFORE UPDATE ON `patrol_path` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `quests`
--

DROP TABLE IF EXISTS `quests`;
CREATE TABLE IF NOT EXISTS `quests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `faction` int NOT NULL,
  `chain` varchar(64) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `zone` varchar(64) DEFAULT NULL,
  `numGrades` int NOT NULL,
  `repeatable` tinyint(1) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `objectiveText` varchar(2048) NOT NULL,
  `progressText` varchar(2048) NOT NULL,
  `deliveryItem1` int NOT NULL DEFAULT '-1',
  `deliveryItem2` int NOT NULL DEFAULT '-1',
  `deliveryItem3` int NOT NULL DEFAULT '-1',
  `questPrereq` int NOT NULL DEFAULT '-1',
  `questStartedReq` int NOT NULL DEFAULT '-1',
  `completionText` varchar(2048) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `item1` int DEFAULT NULL,
  `item1count` int DEFAULT NULL,
  `item2` int DEFAULT NULL,
  `item2count` int DEFAULT NULL,
  `item3` int DEFAULT NULL,
  `item3count` int DEFAULT NULL,
  `item4` int DEFAULT NULL,
  `item4count` int DEFAULT NULL,
  `item5` int DEFAULT NULL,
  `item5count` int DEFAULT NULL,
  `item6` int DEFAULT NULL,
  `item6count` int DEFAULT NULL,
  `item7` int DEFAULT NULL,
  `item7count` int DEFAULT NULL,
  `item8` int DEFAULT NULL,
  `item8count` int DEFAULT NULL,
  `chooseItem1` int DEFAULT NULL,
  `chooseItem1count` int DEFAULT NULL,
  `chooseItem2` int DEFAULT NULL,
  `chooseItem2count` int DEFAULT NULL,
  `chooseItem3` int DEFAULT NULL,
  `chooseItem3count` int DEFAULT NULL,
  `chooseItem4` int DEFAULT NULL,
  `chooseItem4count` int DEFAULT NULL,
  `chooseitem5` int DEFAULT NULL,
  `chooseitem5count` int DEFAULT NULL,
  `chooseitem6` int DEFAULT NULL,
  `chooseitem6count` int DEFAULT NULL,
  `chooseitem7` int DEFAULT NULL,
  `chooseitem7count` int DEFAULT NULL,
  `chooseitem8` int DEFAULT NULL,
  `chooseitem8count` int DEFAULT NULL,
  `currency1` int DEFAULT NULL,
  `currency1count` int DEFAULT NULL,
  `currency2` int DEFAULT NULL,
  `currency2count` int DEFAULT NULL,
  `rep1` int DEFAULT NULL,
  `rep1gain` int DEFAULT NULL,
  `rep2` int DEFAULT NULL,
  `rep2gain` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `quests`
--
DROP TRIGGER IF EXISTS `quests_trigger`;
DELIMITER ;;
CREATE TRIGGER `quests_trigger` BEFORE UPDATE ON `quests` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `quest_items`
--

DROP TABLE IF EXISTS `quest_items`;
CREATE TABLE IF NOT EXISTS `quest_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quest_id` int NOT NULL,
  `item` int NOT NULL,
  `count` int NOT NULL,
  `choose` tinyint(1) NOT NULL,
  `rewardLevel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `quest_objectives`
--

DROP TABLE IF EXISTS `quest_objectives`;
CREATE TABLE IF NOT EXISTS `quest_objectives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questID` int NOT NULL,
  `primaryObjective` tinyint(1) NOT NULL,
  `objectiveType` varchar(16) NOT NULL,
  `target` int NOT NULL DEFAULT '-1',
  `targetCount` int NOT NULL,
  `targetText` varchar(64) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `targets` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1820 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `quest_objectives`
--
DROP TRIGGER IF EXISTS `quest_objectives_trigger`;
DELIMITER ;;
CREATE TRIGGER `quest_objectives_trigger` BEFORE UPDATE ON `quest_objectives` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `quest_requirement`
--

DROP TABLE IF EXISTS `quest_requirement`;
CREATE TABLE IF NOT EXISTS `quest_requirement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quest_id` int NOT NULL,
  `editor_option_type_id` int NOT NULL,
  `editor_option_choice_type_id` varchar(45) NOT NULL,
  `required_value` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` timestamp NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `quest_requirement`
--
DROP TRIGGER IF EXISTS `quest_requirement_trigger`;
DELIMITER ;;
CREATE TRIGGER `quest_requirement_trigger` BEFORE UPDATE ON `quest_requirement` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ranking1`
--

DROP TABLE IF EXISTS `ranking1`;
CREATE TABLE IF NOT EXISTS `ranking1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `obj_id` int DEFAULT NULL,
  `data` int DEFAULT NULL,
  `blobdata` blob,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `ranking1`
--
DROP TRIGGER IF EXISTS `ranking1_trigger`;
DELIMITER ;;
CREATE TRIGGER `ranking1_trigger` BEFORE UPDATE ON `ranking1` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ranking_settings`
--

DROP TABLE IF EXISTS `ranking_settings`;
CREATE TABLE IF NOT EXISTS `ranking_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int NOT NULL,
  `description` varchar(2048) NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2048 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `instance` int DEFAULT '-1',
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `regionType` varchar(45) DEFAULT NULL,
  `actionID` int DEFAULT '-1',
  `actionData1` varchar(45) DEFAULT NULL,
  `actionData2` varchar(45) DEFAULT NULL,
  `actionData3` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimetamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `region_shape`
--

DROP TABLE IF EXISTS `region_shape`;
CREATE TABLE IF NOT EXISTS `region_shape` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regionID` int NOT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `shape` varchar(45) NOT NULL,
  `size1` float DEFAULT '0',
  `size2` float DEFAULT '0',
  `size3` float DEFAULT '0',
  `loc2X` float NOT NULL DEFAULT '0',
  `loc2Y` float NOT NULL DEFAULT '0',
  `loc2Z` float NOT NULL DEFAULT '0',
  `orientX` float NOT NULL DEFAULT '0',
  `orientY` float NOT NULL DEFAULT '0',
  `orientZ` float NOT NULL DEFAULT '0',
  `orientW` float NOT NULL DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimetamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=3276 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_drop`
--

DROP TABLE IF EXISTS `resource_drop`;
CREATE TABLE IF NOT EXISTS `resource_drop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resourceSubProfileId` int NOT NULL,
  `item` int NOT NULL,
  `min` int NOT NULL,
  `max` int NOT NULL,
  `chance` float NOT NULL DEFAULT '100',
  `chanceMax` float NOT NULL DEFAULT '100',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `resource_drop`
--
DROP TRIGGER IF EXISTS `resource_drop_trigger`;
DELIMITER ;;
CREATE TRIGGER `resource_drop_trigger` BEFORE UPDATE ON `resource_drop` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_grids`
--

DROP TABLE IF EXISTS `resource_grids`;
CREATE TABLE IF NOT EXISTS `resource_grids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `rotation` float DEFAULT NULL,
  `instance` varchar(45) DEFAULT NULL,
  `resource1_type` varchar(45) DEFAULT NULL,
  `resource1_chance` int DEFAULT NULL,
  `resource2_type` varchar(45) DEFAULT NULL,
  `resource2_chance` int DEFAULT NULL,
  `resource3_type` varchar(45) DEFAULT NULL,
  `resource3_chance` int DEFAULT NULL,
  `resource4_type` varchar(45) DEFAULT NULL,
  `resource4_chance` int DEFAULT NULL,
  `resource5_type` varchar(45) DEFAULT NULL,
  `resource5_chance` int DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `resource_grids`
--
DROP TRIGGER IF EXISTS `resource_grids_trigger`;
DELIMITER ;;
CREATE TRIGGER `resource_grids_trigger` BEFORE UPDATE ON `resource_grids` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_node_profile`
--

DROP TABLE IF EXISTS `resource_node_profile`;
CREATE TABLE IF NOT EXISTS `resource_node_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `spawnPercentage` float NOT NULL DEFAULT '100',
  `spawnPecentageMax` float NOT NULL DEFAULT '100',
  `maxHarvestDistance` float NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_node_spawn`
--

DROP TABLE IF EXISTS `resource_node_spawn`;
CREATE TABLE IF NOT EXISTS `resource_node_spawn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance` varchar(45) DEFAULT NULL,
  `resourceTemplate` int DEFAULT NULL,
  `respawnTime` int DEFAULT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `resource_node_spawn`
--
DROP TRIGGER IF EXISTS `resource_node_spawn_trigger`;
DELIMITER ;;
CREATE TRIGGER `resource_node_spawn_trigger` BEFORE UPDATE ON `resource_node_spawn` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_node_sub_profile`
--

DROP TABLE IF EXISTS `resource_node_sub_profile`;
CREATE TABLE IF NOT EXISTS `resource_node_sub_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `priority` int NOT NULL,
  `priorityMax` int NOT NULL,
  `skill` int DEFAULT NULL,
  `skillLevel` int DEFAULT NULL,
  `skillLevelMax` int DEFAULT NULL,
  `skillExp` int NOT NULL DEFAULT '0',
  `weaponReq` varchar(45) DEFAULT NULL,
  `equipped` tinyint(1) DEFAULT NULL,
  `gameObject` varchar(128) DEFAULT NULL,
  `harvestCoordEffect` varchar(256) DEFAULT NULL,
  `activateCoordeffect` varchar(256) NOT NULL DEFAULT '',
  `deactivateCoordeffect` varchar(256) NOT NULL DEFAULT '',
  `respawnTime` int DEFAULT NULL,
  `respawnTimeMax` int DEFAULT NULL,
  `harvestCount` int DEFAULT NULL,
  `harvestTimeReq` float DEFAULT '0',
  `cooldown` float NOT NULL,
  `deactivationDelay` float NOT NULL,
  `lootCount` int NOT NULL DEFAULT '10',
  `ensureLoot` tinyint(1) NOT NULL DEFAULT '1',
  `cursorIcon` varchar(1024) NOT NULL DEFAULT '',
  `cursorIcon2` mediumtext NOT NULL,
  `selectedIcon` varchar(1024) NOT NULL DEFAULT '',
  `selectedIcon2` mediumtext NOT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_node_template`
--

DROP TABLE IF EXISTS `resource_node_template`;
CREATE TABLE IF NOT EXISTS `resource_node_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `skill` int DEFAULT NULL,
  `skillLevel` int DEFAULT NULL,
  `skillLevelMax` int DEFAULT NULL,
  `skillExp` int DEFAULT '0',
  `weaponReq` varchar(45) DEFAULT NULL,
  `equipped` tinyint(1) DEFAULT NULL,
  `gameObject` varchar(128) DEFAULT NULL,
  `coordEffect` varchar(128) DEFAULT NULL,
  `instance` int DEFAULT NULL,
  `respawnTime` int DEFAULT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `harvestCount` int DEFAULT NULL,
  `harvestTimeReq` float DEFAULT '0',
  `profileId` int NOT NULL DEFAULT '-1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `resource_node_template`
--
DROP TRIGGER IF EXISTS `resource_node_template_trigger`;
DELIMITER ;;
CREATE TRIGGER `resource_node_template_trigger` BEFORE UPDATE ON `resource_node_template` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `aspect` int DEFAULT '-1',
  `oppositeAspect` int DEFAULT '-1',
  `mainAspectOnly` tinyint(1) NOT NULL DEFAULT '0',
  `primaryStat` varchar(45) NOT NULL,
  `primaryStatValue` int NOT NULL DEFAULT '0',
  `primaryStatInterval` int NOT NULL DEFAULT '0',
  `secondaryStat` varchar(45) NOT NULL,
  `secondaryStatValue` int NOT NULL DEFAULT '0',
  `secondaryStatInterval` int NOT NULL DEFAULT '0',
  `thirdStat` varchar(45) NOT NULL,
  `thirdStatValue` int NOT NULL DEFAULT '0',
  `thirdStatInterval` int NOT NULL DEFAULT '0',
  `fourthStat` varchar(45) NOT NULL,
  `fourthStatValue` int NOT NULL DEFAULT '0',
  `fourthStatInterval` int NOT NULL DEFAULT '0',
  `maxLevel` int DEFAULT '1',
  `automaticallyLearn` tinyint(1) DEFAULT '1',
  `skillPointCost` int DEFAULT '0',
  `parentSkill` int DEFAULT '0',
  `parentSkillLevelReq` int DEFAULT '1',
  `prereqSkill1` int DEFAULT '0',
  `prereqSkill1Level` int DEFAULT '1',
  `prereqSkill2` int DEFAULT '0',
  `prereqSkill2Level` int DEFAULT '1',
  `prereqSkill3` int DEFAULT '0',
  `prereqSkill3Level` int DEFAULT '1',
  `playerLevelReq` int DEFAULT '1',
  `skill_profile_id` int NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  `icon2` mediumtext NOT NULL,
  `talent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1365 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `skills`
--
DROP TRIGGER IF EXISTS `skills_trigger`;
DELIMITER ;;
CREATE TRIGGER `skills_trigger` BEFORE UPDATE ON `skills` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skill_ability_gain`
--

DROP TABLE IF EXISTS `skill_ability_gain`;
CREATE TABLE IF NOT EXISTS `skill_ability_gain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skillID` int DEFAULT NULL,
  `skillLevelReq` int DEFAULT '1',
  `abilityID` int DEFAULT NULL,
  `automaticallyLearn` tinyint(1) DEFAULT '1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1820 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `skill_ability_gain`
--
DROP TRIGGER IF EXISTS `skill_ability_gain_trigger`;
DELIMITER ;;
CREATE TRIGGER `skill_ability_gain_trigger` BEFORE UPDATE ON `skill_ability_gain` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skill_profile`
--

DROP TABLE IF EXISTS `skill_profile`;
CREATE TABLE IF NOT EXISTS `skill_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `profile_name` varchar(64) NOT NULL,
  `level_diff` text NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skill_profile_levels`
--

DROP TABLE IF EXISTS `skill_profile_levels`;
CREATE TABLE IF NOT EXISTS `skill_profile_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `level` int NOT NULL,
  `required_xp` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `spawn_data`
--

DROP TABLE IF EXISTS `spawn_data`;
CREATE TABLE IF NOT EXISTS `spawn_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL DEFAULT '1',
  `name` varchar(64) NOT NULL,
  `mobTemplate` int NOT NULL DEFAULT '-1',
  `mobTemplate2` int NOT NULL DEFAULT '-1',
  `mobTemplate3` int NOT NULL DEFAULT '-1',
  `mobTemplate4` int NOT NULL DEFAULT '-1',
  `mobTemplate5` int NOT NULL DEFAULT '-1',
  `markerName` varchar(64) DEFAULT NULL,
  `locX` float(8,2) DEFAULT NULL,
  `locY` float(8,2) DEFAULT NULL,
  `locZ` float(8,2) DEFAULT NULL,
  `orientX` float(8,4) DEFAULT NULL,
  `orientY` float(8,4) DEFAULT NULL,
  `orientZ` float(8,4) DEFAULT NULL,
  `orientW` float(8,4) DEFAULT NULL,
  `instance` int DEFAULT NULL,
  `numSpawns` int DEFAULT NULL,
  `spawnRadius` int DEFAULT NULL,
  `respawnTime` int DEFAULT NULL,
  `respawnTimeMax` int DEFAULT NULL,
  `corpseDespawnTime` int DEFAULT NULL,
  `spawnActiveStartHour` int DEFAULT '-1',
  `spawnActiveEndHour` int DEFAULT '-1',
  `alternateSpawnMobTemplate` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate2` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate3` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate4` int NOT NULL DEFAULT '-1',
  `alternateSpawnMobTemplate5` int NOT NULL DEFAULT '-1',
  `combat` tinyint(1) NOT NULL,
  `roamRadius` int NOT NULL,
  `startsQuests` varchar(256) NOT NULL,
  `endsQuests` varchar(256) NOT NULL,
  `startsDialogues` varchar(256) NOT NULL,
  `otherActions` varchar(256) NOT NULL,
  `baseAction` varchar(32) NOT NULL,
  `weaponSheathed` tinyint(1) NOT NULL,
  `merchantTable` int NOT NULL,
  `patrolPath` int NOT NULL DEFAULT '-1',
  `questOpenLootTable` int NOT NULL,
  `isChest` tinyint(1) NOT NULL DEFAULT '0',
  `pickupItem` int DEFAULT NULL,
  `shop_owner` bigint NOT NULL DEFAULT '0',
  `shop_oid` bigint NOT NULL DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=287 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `spawn_data`
--
DROP TRIGGER IF EXISTS `spawn_data_trigger`;
DELIMITER ;;
CREATE TRIGGER `spawn_data_trigger` BEFORE UPDATE ON `spawn_data` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stat`
--

DROP TABLE IF EXISTS `stat`;
CREATE TABLE IF NOT EXISTS `stat` (
  `name` varchar(45) NOT NULL,
  `type` int DEFAULT '0',
  `stat_function` varchar(45) DEFAULT NULL,
  `mob_base` int DEFAULT NULL,
  `mob_level_increase` int DEFAULT NULL,
  `mob_level_percent_increase` float DEFAULT NULL,
  `min` int NOT NULL DEFAULT '0',
  `maxstat` varchar(45) DEFAULT NULL,
  `canExceedMax` tinyint(1) DEFAULT '0',
  `sharedWithGroup` tinyint(1) DEFAULT '0',
  `shiftTarget` smallint DEFAULT '0',
  `shiftValue` int DEFAULT NULL,
  `shiftReverseValue` int DEFAULT NULL,
  `shiftInterval` int DEFAULT NULL,
  `isShiftPercent` tinyint(1) NOT NULL DEFAULT '0',
  `onMaxHit` varchar(45) DEFAULT NULL,
  `onMinHit` varchar(45) DEFAULT NULL,
  `shiftReq1` varchar(45) DEFAULT NULL,
  `shiftReq1State` tinyint(1) NOT NULL DEFAULT '0',
  `shiftReq1SetReverse` tinyint(1) NOT NULL DEFAULT '0',
  `shiftReq2` varchar(45) DEFAULT NULL,
  `shiftReq2State` tinyint(1) NOT NULL DEFAULT '0',
  `shiftReq2SetReverse` tinyint(1) NOT NULL DEFAULT '0',
  `shiftReq3` varchar(45) DEFAULT NULL,
  `shiftReq3State` tinyint(1) NOT NULL DEFAULT '0',
  `shiftReq3SetReverse` tinyint(1) NOT NULL DEFAULT '0',
  `startPercent` int NOT NULL DEFAULT '50',
  `deathResetPercent` int DEFAULT '-1',
  `releaseResetPercent` int DEFAULT '-1',
  `sendToClient` smallint NOT NULL DEFAULT '1' COMMENT '0 none,1 all,2 owner only',
  `onThreshold` varchar(45) DEFAULT NULL,
  `onThreshold2` varchar(45) DEFAULT NULL,
  `onThreshold3` varchar(45) DEFAULT NULL,
  `onThreshold4` varchar(45) DEFAULT NULL,
  `onThreshold5` varchar(45) DEFAULT NULL,
  `threshold` float NOT NULL DEFAULT '-1',
  `threshold2` float NOT NULL DEFAULT '-1',
  `threshold3` float NOT NULL DEFAULT '-1',
  `threshold4` float NOT NULL DEFAULT '-1',
  `shiftModStat` varchar(45) NOT NULL DEFAULT '',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AVG_ROW_LENGTH=630 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `stat`
--

INSERT INTO `stat` (`name`, `type`, `stat_function`, `mob_base`, `mob_level_increase`, `mob_level_percent_increase`, `min`, `maxstat`, `canExceedMax`, `sharedWithGroup`, `shiftTarget`, `shiftValue`, `shiftReverseValue`, `shiftInterval`, `isShiftPercent`, `onMaxHit`, `onMinHit`, `shiftReq1`, `shiftReq1State`, `shiftReq1SetReverse`, `shiftReq2`, `shiftReq2State`, `shiftReq2SetReverse`, `shiftReq3`, `shiftReq3State`, `shiftReq3SetReverse`, `startPercent`, `deathResetPercent`, `releaseResetPercent`, `sendToClient`, `onThreshold`, `onThreshold2`, `onThreshold3`, `onThreshold4`, `onThreshold5`, `threshold`, `threshold2`, `threshold3`, `threshold4`, `shiftModStat`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
('attack_speed', 0, 'Attack Speed', 2000, 0, 0, 1000, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-08-28 13:25:53'),
('build_stat', 0, 'Build Speed', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2021-06-26 16:34:37', '2021-06-26 16:34:37'),
('cast_time', 0, 'Ability Cast Time', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:34:32', '2020-09-16 13:46:41'),
('cooldown', 0, 'Ability Cooldown', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:31:29', '2020-09-16 13:46:45'),
('cost', 0, 'Ability Cost', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:31:04', '2020-09-16 13:46:48'),
('critic', 0, '', 25, 2, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2023-01-18 00:10:38'),
('crush_resistance', 1, '~ none ~', 2, 1, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
('damage_dealt', 0, 'Ability Damage Dealt', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:29:30', '2021-06-17 09:36:56'),
('damage_rec', 0, 'Ability Damage Receive', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:29:02', '2020-09-16 13:46:59'),
('dexterity', 0, '', 10, 1, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('endurance', 0, '~ none ~', 10, 2, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00'),
('evasion', 0, '~ none ~', 10, 1, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:47:04'),
('glob_cooldown', 0, 'Ability Global Cooldown', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:33:30', '2020-09-16 13:47:08'),
('health', 2, 'Health', 1000, 100, 0, 0, 'health-max', 0, 1, 0, 3, 0, 2, 1, '', 'death', 'deadstate', 0, 0, 'combatstate', 0, 0, '~ none ~', 0, 0, 100, -1, 50, 1, '', '', '', '', '', -1, -1, -1, -1, 'health_shift', 1, '2000-01-01 00:00:00', '2021-06-17 21:29:42'),
('health-max', 0, '~ none ~', 1000, 100, 0, 0, '', 0, 1, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:47:12'),
('health_dealt', 0, 'Ability Health Dealt', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:30:09', '2020-09-16 13:47:17'),
('health_rec', 0, 'Ability Health Receive', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:29:52', '2020-09-16 13:47:22'),
('health_shift', 0, '~ none ~', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-21 20:22:38', '2020-09-16 13:47:25'),
('intelligence', 0, '', 20, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('magical_critic', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('magical_crit_power', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:32:28', '2021-09-16 15:52:59'),
('magical_evasion', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('magical_resistance', 1, '~ none ~', 200, 6, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:45:14'),
('mana', 2, NULL, 0, 0, 0, 0, 'mana-max', 0, 1, 0, 3, 0, 2, 1, '', '', 'deadstate', 0, 0, '~ none ~', 0, 0, '~ none ~', 0, 0, 100, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-06-17 21:31:14'),
('mana-max', 0, '~ none ~', 10, 5, 0, 0, '', 0, 1, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:47:42'),
('movement_speed', 0, 'Movement Speed', 7, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-08-28 13:26:07'),
('parry', 0, 'Parry', 10, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:47:46'),
('perception-stealth', 0, 'Perception Stealth', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-05-21 19:43:23', '2020-09-16 13:47:51'),
('physical_critic', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('physical_crit_power', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:32:53', '2021-09-16 15:52:59'),
('physical_defense', 0, '~ none ~', 10, 1, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:45:37'),
('physical_evasion', 0, '', 10, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('pierce_resistance', 1, '~ none ~', 5, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-08-28 13:23:46'),
('potential', 0, '', 20, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('range', 0, 'Ability Range', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:28:31', '2020-09-16 13:45:45'),
('slash_resistance', 1, '~ none ~', 5, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-08-28 13:23:43'),
('sleep_chance', 0, 'Sleep Chance', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:33:22', '2020-09-16 13:45:49'),
('sleep_resistance', 0, 'Sleep Resistance', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:34:33', '2020-09-16 13:45:53'),
('stamina', 2, NULL, 0, 0, 0, 0, 'stamina-max', 0, 0, 1, 5, 0, 2, 1, '', '', 'sprint', 0, 0, '~ none ~', 0, 0, '~ none ~', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '~ none ~', 1, '2020-06-29 15:10:06', '2021-06-17 21:31:24'),
('stamina-max', 0, '~ none ~', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-29 15:10:19', '2020-09-16 13:45:58'),
('stealth', 0, 'Stealth', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-05-21 19:43:36', '2020-09-16 13:46:03'),
('strength', 0, '', 20, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-16 15:52:59'),
('stun_chance', 0, 'Stun Chance', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:33:38', '2020-09-16 13:46:08'),
('stun_resistance', 0, 'Stun Resistance', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-06-14 20:34:54', '2020-09-16 13:46:13'),
('weapon_cooldown', 0, 'Ability Weapon Cooldown', 100, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2020-04-16 13:35:04', '2020-09-16 13:46:17'),
('weight', 2, 'Weight', 0, 0, 0, 0, 'weight-max', 1, 0, 1, 0, 0, 2, 1, 'effect:220012', '', '~ none ~', 0, 0, '~ none ~', 0, 0, '~ none ~', 0, 0, 0, -1, -1, 1, '', '', '', '', '', -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2021-09-15 16:30:48'),
('weight-max', 0, '~ none ~', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '~ none ~', '~ none ~', '~ none ~', 0, 0, '~ none ~', 0, 0, '~ none ~', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2020-09-16 13:46:21'),
('willpower', 0, '~ none ~', 10, 2, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', 0, 0, '', 0, 0, 50, -1, -1, 1, NULL, NULL, NULL, NULL, NULL, -1, -1, -1, -1, '', 1, '2000-01-01 00:00:00', '2000-01-01 00:00:00');

--
-- Wyzwalacze `stat`
--
DROP TRIGGER IF EXISTS `stat_trigger`;
DELIMITER ;;
CREATE TRIGGER `stat_trigger` BEFORE UPDATE ON `stat` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stat_link`
--

DROP TABLE IF EXISTS `stat_link`;
CREATE TABLE IF NOT EXISTS `stat_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stat` varchar(45) NOT NULL,
  `statTo` varchar(45) NOT NULL,
  `changePerPoint` float NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `stat_link`
--

INSERT INTO `stat_link` (`id`, `stat`, `statTo`, `changePerPoint`, `isactive`) VALUES
(1, 'endurance', 'health-max', 10, 1),
(2, 'willpower', 'mana-max', 10, 1),
(4, 'physical_defense', 'pierce_resistance', 1, 1),
(5, 'physical_defense', 'slash_resistance', 1, 1),
(6, 'evasion', 'physical_evasion', 1, 1),
(7, 'evasion', 'magical_evasion', 1, 1),
(8, 'critic', 'magical_critic', 1, 1),
(9, 'critic', 'physical_critic', 1, 1),
(10, 'physical_defense', 'crush_resistance', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stat_thresholds`
--

DROP TABLE IF EXISTS `stat_thresholds`;
CREATE TABLE IF NOT EXISTS `stat_thresholds` (
  `stat_function` varchar(64) NOT NULL,
  `threshold` int NOT NULL,
  `num_per_point` int NOT NULL,
  PRIMARY KEY (`stat_function`,`threshold`),
  KEY `stat_function` (`stat_function`),
  KEY `threshold` (`threshold`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `stat_thresholds`
--

INSERT INTO `stat_thresholds` (`stat_function`, `threshold`, `num_per_point`) VALUES
('Critic Chance', 440, 10),
('Critic Chance', 660, 20),
('Critic Power', 440, 10),
('Critic Power', 560, 20),
('Critic Power', 660, 50),
('Critic Power', 20000, 100),
('Power', 440, 10),
('Power', 560, 20),
('Power', 660, 50),
('Power', 20000, 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `survivalarenatemplates`
--

DROP TABLE IF EXISTS `survivalarenatemplates`;
CREATE TABLE IF NOT EXISTS `survivalarenatemplates` (
  `id` int NOT NULL,
  `numRounds` int NOT NULL,
  `round1Spawns` varchar(128) NOT NULL,
  `round2Spawns` varchar(128) DEFAULT NULL,
  `round3Spawns` varchar(128) DEFAULT NULL,
  `round4Spawns` varchar(128) DEFAULT NULL,
  `round5Spawns` varchar(128) DEFAULT NULL,
  `round6Spawns` varchar(128) DEFAULT NULL,
  `round7Spawns` varchar(128) DEFAULT NULL,
  `round8Spawns` varchar(128) DEFAULT NULL,
  `round9Spawns` varchar(128) DEFAULT NULL,
  `round10Spawns` varchar(128) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `survivalarenatemplates`
--
DROP TRIGGER IF EXISTS `survivalarenatemplates_trigger`;
DELIMITER ;;
CREATE TRIGGER `survivalarenatemplates_trigger` BEFORE UPDATE ON `survivalarenatemplates` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2730 DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `task`
--
DROP TRIGGER IF EXISTS `task_trigger`;
DELIMITER ;;
CREATE TRIGGER `task_trigger` BEFORE UPDATE ON `task` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `users`
--
DROP TRIGGER IF EXISTS `users_trigger`;
DELIMITER ;;
CREATE TRIGGER `users_trigger` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vip_level`
--

DROP TABLE IF EXISTS `vip_level`;
CREATE TABLE IF NOT EXISTS `vip_level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `max_points` bigint NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=3276 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vip_level_bonuses`
--

DROP TABLE IF EXISTS `vip_level_bonuses`;
CREATE TABLE IF NOT EXISTS `vip_level_bonuses` (
  `vip_level_id` int NOT NULL,
  `bonus_settings_id` int NOT NULL,
  `value` int NOT NULL,
  `valuep` float NOT NULL,
  KEY `vip_level_id` (`vip_level_id`,`bonus_settings_id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1092 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `voxelands`
--

DROP TABLE IF EXISTS `voxelands`;
CREATE TABLE IF NOT EXISTS `voxelands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance` varchar(45) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `voxelands`
--
DROP TRIGGER IF EXISTS `voxelands_trigger`;
DELIMITER ;;
CREATE TRIGGER `voxelands_trigger` BEFORE UPDATE ON `voxelands` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `voxeland_changes`
--

DROP TABLE IF EXISTS `voxeland_changes`;
CREATE TABLE IF NOT EXISTS `voxeland_changes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voxelandid` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `z` int NOT NULL,
  `type` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Wyzwalacze `voxeland_changes`
--
DROP TRIGGER IF EXISTS `voxeland_changes_trigger`;
DELIMITER ;;
CREATE TRIGGER `voxeland_changes_trigger` BEFORE UPDATE ON `voxeland_changes` FOR EACH ROW SET NEW.updatetimestamp = CURRENT_TIMESTAMP
;;
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weapon_action_settings`
--

DROP TABLE IF EXISTS `weapon_action_settings`;
CREATE TABLE IF NOT EXISTS `weapon_action_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL DEFAULT '1',
  `action_id` int DEFAULT NULL,
  `slot` varchar(256) DEFAULT '',
  `ability_id` int DEFAULT '-1',
  `action_type` int DEFAULT '1',
  `coordeffect` varchar(256) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weapon_templates_profile`
--

DROP TABLE IF EXISTS `weapon_templates_profile`;
CREATE TABLE IF NOT EXISTS `weapon_templates_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(86) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weather_instance`
--

DROP TABLE IF EXISTS `weather_instance`;
CREATE TABLE IF NOT EXISTS `weather_instance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_id` int NOT NULL,
  `weather_profile_id` int NOT NULL,
  `month1` tinyint(1) NOT NULL,
  `month2` tinyint(1) NOT NULL,
  `month3` tinyint(1) NOT NULL,
  `month4` tinyint(1) NOT NULL,
  `month5` tinyint(1) NOT NULL,
  `month6` tinyint(1) NOT NULL,
  `month7` tinyint(1) NOT NULL,
  `month8` tinyint(1) NOT NULL,
  `month9` tinyint(1) NOT NULL,
  `month10` tinyint(1) NOT NULL,
  `month11` tinyint(1) NOT NULL,
  `month12` tinyint(1) NOT NULL,
  `priority` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`,`weather_profile_id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=2340 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weather_profile`
--

DROP TABLE IF EXISTS `weather_profile`;
CREATE TABLE IF NOT EXISTS `weather_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `temperature_min` float NOT NULL,
  `temperature_max` float NOT NULL,
  `humidity_min` float NOT NULL,
  `humidity_max` float NOT NULL,
  `wind_direction_min` float NOT NULL,
  `wind_direction_max` float NOT NULL,
  `wind_speed_min` float NOT NULL,
  `wind_speed_max` float NOT NULL,
  `wind_turbulence_min` float NOT NULL,
  `wind_turbulence_max` float NOT NULL,
  `fog_height_power_min` float NOT NULL,
  `fog_height_power_max` float NOT NULL,
  `fog_height_max` float NOT NULL,
  `fog_distance_power_min` float NOT NULL,
  `fog_distance_power_max` float NOT NULL,
  `fog_distance_max` float NOT NULL,
  `rain_power_min` float NOT NULL,
  `rain_power_max` float NOT NULL,
  `rain_power_terrain_min` float NOT NULL,
  `rain_power_terrain_max` float NOT NULL,
  `rain_min_height` float NOT NULL,
  `rain_max_height` float NOT NULL,
  `hail_power_min` float NOT NULL,
  `hail_power_max` float NOT NULL,
  `hail_power_terrain_min` float NOT NULL,
  `hail_power_terrain_max` float NOT NULL,
  `hail_min_height` float NOT NULL,
  `hail_max_height` float NOT NULL,
  `snow_power_min` float NOT NULL,
  `snow_power_max` float NOT NULL,
  `snow_power_terrain_min` float NOT NULL,
  `snow_power_terrain_max` float NOT NULL,
  `snow_min_height` float NOT NULL,
  `snow_age_min` float NOT NULL,
  `snow_age_max` float NOT NULL,
  `thunder_power_min` float NOT NULL,
  `thunder_power_max` float NOT NULL,
  `cloud_power_min` float NOT NULL,
  `cloud_power_max` float NOT NULL,
  `cloud_min_height` float NOT NULL,
  `cloud_max_height` float NOT NULL,
  `cloud_speed_min` float NOT NULL,
  `cloud_speed_max` float NOT NULL,
  `moon_phase_min` float NOT NULL,
  `moon_phase_max` float NOT NULL,
  `isactive` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weather_season`
--

DROP TABLE IF EXISTS `weather_season`;
CREATE TABLE IF NOT EXISTS `weather_season` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_id` int NOT NULL,
  `season` int NOT NULL,
  `month1` tinyint(1) NOT NULL,
  `month2` tinyint(1) NOT NULL,
  `month3` tinyint(1) NOT NULL,
  `month4` tinyint(1) NOT NULL,
  `month5` tinyint(1) NOT NULL,
  `month6` tinyint(1) NOT NULL,
  `month7` tinyint(1) NOT NULL,
  `month8` tinyint(1) NOT NULL,
  `month9` tinyint(1) NOT NULL,
  `month10` tinyint(1) NOT NULL,
  `month11` tinyint(1) NOT NULL,
  `month12` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`,`season`)
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `survivalarenatemplates`
--
ALTER TABLE `survivalarenatemplates`
  ADD CONSTRAINT `survivalArenaTemplates_ibfk_1` FOREIGN KEY (`id`) REFERENCES `arena_templates` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
