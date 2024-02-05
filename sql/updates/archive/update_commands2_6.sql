-- switch to the content database
use world_content;

-- 2.6
ALTER TABLE `spawn_data` 
CHANGE COLUMN `isChest` `isChest` TINYINT(1) NOT NULL DEFAULT '0' ;

ALTER TABLE `currencies` 
DROP COLUMN `subCurrency2`,
DROP COLUMN `subCurrency1`,
DROP COLUMN `isSubCurrency`,
ADD COLUMN `currencyGroup` INT NULL DEFAULT 0 AFTER `maximum`,
ADD COLUMN `currencyPosition` INT NULL DEFAULT 1 AFTER `currencyGroup`;

CREATE TABLE `currency_conversion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `currencyID` INT(11) NOT NULL,
  `currencyToID` INT(11) NOT NULL,
  `amount` INT(11) NOT NULL,
  `autoConverts` TINYINT(1) NOT NULL DEFAULT 1,
  `isactive` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));
  
ALTER TABLE `stat`
ADD COLUMN `startPercent` INT NOT NULL DEFAULT 50 AFTER `shiftReq3SetReverse`, 
ADD COLUMN `deathResetPercent` INT NULL DEFAULT -1 AFTER `startPercent`,
ADD COLUMN `releaseResetPercent` INT NULL DEFAULT -1 AFTER `deathResetPercent`,
ADD COLUMN `canExceedMax` TINYINT(1) NULL DEFAULT 0 AFTER `maxstat`,
ADD COLUMN `sharedWithGroup` TINYINT(1) NULL DEFAULT 0 AFTER `canExceedMax`;

CREATE TABLE `stat_link` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stat` VARCHAR(45) NOT NULL,
  `statTo` VARCHAR(45) NOT NULL,
  `changePerPoint` FLOAT NOT NULL,
  `isactive` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));
  
ALTER TABLE `crafting_recipes` 
ADD COLUMN `resultItem2ID` INT NULL DEFAULT -1 AFTER `resultItemCount`,
ADD COLUMN `resultItem2Count` INT NULL AFTER `resultItem2ID`,
ADD COLUMN `resultItem3ID` INT NULL DEFAULT -1 AFTER `resultItem2Count`,
ADD COLUMN `resultItem3Count` INT NULL AFTER `resultItem3ID`,
ADD COLUMN `resultItem4ID` INT NULL DEFAULT -1 AFTER `resultItem3Count`,
ADD COLUMN `resultItem4Count` INT NULL AFTER `resultItem4ID`;

ALTER TABLE `spawn_data` 
ADD COLUMN `spawnActiveStartHour` INT NULL DEFAULT -1 AFTER `corpseDespawnTime`,
ADD COLUMN `spawnActiveEndHour` INT NULL DEFAULT -1 AFTER `spawnActiveStartHour`,
ADD COLUMN `patrolPath` INT NOT NULL DEFAULT -1 AFTER `merchantTable`;

ALTER TABLE `effects` 
CHANGE COLUMN `pulseParticle` `pulseCoordEffect` VARCHAR(256) NULL;

ALTER TABLE `item_templates` 
DROP COLUMN `raceReq`,
DROP COLUMN `aspectReq`,
DROP COLUMN `levelReq`;

CREATE TABLE `item_templates_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `editor_option_type_id` int(11) NOT NULL,
  `editor_option_choice_type_id` varchar(45) NOT NULL,
  `required_value` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT NULL,
  `updatetimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));
  
ALTER TABLE `skills` 
ADD COLUMN `mainAspectOnly` TINYINT(1) NOT NULL DEFAULT 0 AFTER `oppositeAspect`;

INSERT INTO editor_option (optionType, deletable, isactive) VALUES ('Building Category', 0, 1);

ALTER TABLE `build_object_template` 
ADD COLUMN `category` INT(11) NOT NULL DEFAULT 0 AFTER `icon`;

INSERT INTO `stat` (`name`, `type`, `stat_function`, `mob_base`, `mob_level_increase`, `mob_level_percent_increase`, `min`, `canExceedMax`, `sharedWithGroup`, `shiftTarget`, `shiftValue`, `shiftReverseValue`, `shiftInterval`, `isShiftPercent`, `shiftReq1State`, `shiftReq1SetReverse`, `shiftReq2State`, `shiftReq2SetReverse`, `shiftReq3State`, `shiftReq3SetReverse`, `startPercent`, `deathResetPercent`, `releaseResetPercent`, `isactive`) VALUES ('health-max', '0', '~ none ~', '100', '20', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '-1', '-1', '1');
INSERT INTO `stat` (`name`, `type`, `stat_function`, `mob_base`, `mob_level_increase`, `mob_level_percent_increase`, `min`, `canExceedMax`, `sharedWithGroup`, `shiftTarget`, `shiftValue`, `shiftReverseValue`, `shiftInterval`, `isShiftPercent`, `shiftReq1State`, `shiftReq1SetReverse`, `shiftReq2State`, `shiftReq2SetReverse`, `shiftReq3State`, `shiftReq3SetReverse`, `startPercent`, `deathResetPercent`, `releaseResetPercent`, `isactive`) VALUES ('mana-max', '0', '~ none ~', '100', '20', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '-1', '-1', '1');

UPDATE `stat` SET `maxstat`='health-max' WHERE `name`='health';
UPDATE `stat` SET `maxstat`='mana-max' WHERE `name`='mana';

UPDATE `stat` SET `startPercent`='100', `deathResetPercent`='-1', `releaseResetPercent`='50' WHERE `name`='health';
UPDATE `stat` SET `startPercent`='100', `deathResetPercent`='-1', `releaseResetPercent`='50' WHERE `name`='mana';

ALTER TABLE `abilities` 
ADD COLUMN `ammoUsed` INT(11) NULL DEFAULT 0 AFTER `reagentConsumed`;


DROP TABLE patrol_paths;

--
-- Table structure for table `patrol_path`
--

DROP TABLE IF EXISTS `patrol_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrol_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `startingPoint` tinyint(1) NOT NULL,
  `travelReverse` tinyint(1) NOT NULL,
  `locX` float NOT NULL,
  `locY` float NOT NULL,
  `locZ` float NOT NULL,
  `lingerTime` float NOT NULL DEFAULT '0',
  `nextPoint` int(11) NOT NULL DEFAULT '-1',
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updatetimestamp` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Race and class change to id's
-- Update statement to get the current race and aspect and grab the id from the editor_options_choice table
UPDATE character_create_template CCT set race = 
  (SELECT id FROM editor_option_choice WHERE choice = CCT.race AND optionTypeID = 
    (SELECT id from editor_option WHERE optionType = 'Race'));

UPDATE character_create_template CCT set aspect = 
  (SELECT id FROM editor_option_choice WHERE choice = CCT.aspect AND optionTypeID = 
    (SELECT id from editor_option WHERE optionType = 'Class'));

ALTER TABLE `character_create_template` 
CHANGE COLUMN `race` `race` INT(11) NOT NULL DEFAULT -1 ,
CHANGE COLUMN `aspect` `aspect` INT(11) NOT NULL DEFAULT -1 ;

UPDATE skills S set aspect = 
  (SELECT id FROM editor_option_choice WHERE choice = S.aspect AND optionTypeID = 
    (SELECT id from editor_option WHERE optionType = 'Class'));
    
UPDATE skills S set oppositeAspect = 
  (SELECT id FROM editor_option_choice WHERE choice = S.oppositeAspect AND optionTypeID = 
    (SELECT id from editor_option WHERE optionType = 'Class'));  
    
ALTER TABLE `skills` 
CHANGE COLUMN `aspect` `aspect` INT NOT NULL DEFAULT -1 ,
CHANGE COLUMN `oppositeAspect` `oppositeAspect` INT NOT NULL DEFAULT -1 ;

-- Quest Requirements

CREATE TABLE `quest_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_id` int(11) NOT NULL,
  `editor_option_type_id` int(11) NOT NULL,
  `editor_option_choice_type_id` varchar(45) NOT NULL,
  `required_value` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT NULL,
  `updatetimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

ALTER TABLE `quests` 
DROP COLUMN `repLevelReq`,
DROP COLUMN `repReq`,
DROP COLUMN `skillLevelReq`,
DROP COLUMN `skillReq`,
DROP COLUMN `aspectReq`,
DROP COLUMN `raceReq`,
DROP COLUMN `levelReq`;

--
-- Table structure for table `interactive_object`
--

DROP TABLE IF EXISTS `interactive_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactive_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `gameObject` varchar(256) DEFAULT NULL,
  `instance` int(11) DEFAULT '-1',
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `interactionType` varchar(45) DEFAULT NULL,
  `interactionID` int(11) DEFAULT '-1',
  `interactionData1` varchar(45) DEFAULT NULL,
  `interactionData2` varchar(45) DEFAULT NULL,
  `interactionData3` varchar(45) DEFAULT NULL,
  `questReqID` int(11) DEFAULT '-1',
  `interactTimeReq` float DEFAULT '0',
  `coordEffect` varchar(128) DEFAULT NULL,
  `respawnTime` int(11) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT NULL,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `region`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `instance` int(11) DEFAULT '-1',
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `regionType` varchar(45) DEFAULT NULL,
  `actionID` int(11) DEFAULT '-1',
  `actionData1` varchar(45) DEFAULT NULL,
  `actionData2` varchar(45) DEFAULT NULL,
  `actionData3` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimetamp` timestamp NULL DEFAULT NULL,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `region_shape`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_shape` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regionID` int(11) NOT NULL,
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
  `creationtimetamp` timestamp NULL DEFAULT NULL,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NULL,
  PRIMARY KEY (`id`));
  
--
-- Table structure for table `graveyard`
--

DROP TABLE IF EXISTS `graveyard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graveyard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `instance` int(11) NOT NULL,
  `locX` float DEFAULT NULL,
  `locY` float DEFAULT NULL,
  `locZ` float DEFAULT NULL,
  `factionReq` int(11) DEFAULT '0',
  `factionRepReq` int(11) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `creationtimestamp` timestamp NULL DEFAULT NULL,
  `updatetimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Change all instance columns to ids rather than names  
UPDATE resource_node_template r SET instance = (SELECT id from admin.instance_template where island_name = r.instance);  
ALTER TABLE `resource_node_template` 
CHANGE COLUMN `instance` `instance` INT(11) NULL DEFAULT NULL ;

UPDATE claim c SET instance = (SELECT id from admin.instance_template where island_name = c.instance);  
ALTER TABLE `claim` 
CHANGE COLUMN `instance` `instance` INT(11) NOT NULL DEFAULT -1 ;

UPDATE spawn_data s SET instance = (SELECT id from admin.instance_template where island_name = s.instance);
ALTER TABLE `spawn_data` 
CHANGE COLUMN `instance` `instance` INT(11) NULL ;

UPDATE character_create_template s SET instanceName = (SELECT id from admin.instance_template where island_name = s.instanceName);
ALTER TABLE `character_create_template` 
CHANGE COLUMN `instanceName` `instance` INT(11) NULL ;

-- new option choices
INSERT INTO `editor_option` (optionType) VALUES ('Currency Group'), ('Requirement'), ('State'), ('Interaction Type'), ('Ammo Type');

INSERT INTO `editor_option_choice` (optionTypeID, choice) VALUES ((SELECT id from `editor_option` where optionType = 'Quest Objective Type'),'task'),
((SELECT id from `editor_option` where optionType = 'Currency Group'),'Main'),
((SELECT id from `editor_option` where optionType = 'Requirement'),'Level'),
((SELECT id from `editor_option` where optionType = 'Requirement'),'Skill Level'),
((SELECT id from `editor_option` where optionType = 'Requirement'),'Race'),
((SELECT id from `editor_option` where optionType = 'Requirement'),'Class'),
((SELECT id from `editor_option` where optionType = 'Requirement'),'Stat'),
((SELECT id from `editor_option` where optionType = 'State'),'underwater'),
((SELECT id from `editor_option` where optionType = 'Interaction Type'),'ApplyEffect'),
((SELECT id from `editor_option` where optionType = 'Interaction Type'),'PlayCoordEffect'),
((SELECT id from `editor_option` where optionType = 'Interaction Type'),'StartQuest'),
((SELECT id from `editor_option` where optionType = 'Interaction Type'),'CompleteTask'),
((SELECT id from `editor_option` where optionType = 'Interaction Type'),'InstancePortal'),
((SELECT id from `editor_option` where optionType = 'Item Type'),'Ammo'),
((SELECT id from `editor_option` where optionType = 'Item Effect Type'),'UseAmmo'),
((SELECT id from `editor_option` where optionType = 'Ammo Type'),'Arrow'),
((SELECT id from `editor_option` where optionType = 'Ammo Type'),'Bullet');

-- admin database
use admin;

ALTER TABLE `instance_template` 
ADD COLUMN `globalWaterHeight` FLOAT NOT NULL DEFAULT 0 AFTER `islandType`; 

-- master database
use master;

ALTER TABLE `world` 
ADD COLUMN `population` INT NOT NULL DEFAULT 0 AFTER `display_order`,
ADD COLUMN `max_population` INT NOT NULL DEFAULT 100 AFTER `population`,
ADD COLUMN `server_type` VARCHAR(64) NULL AFTER `max_population`,
ADD COLUMN `status` VARCHAR(64) NULL AFTER `server_type`,
ADD COLUMN `last_update` TIMESTAMP NULL AFTER `status`;

ALTER TABLE `world` 
CHANGE COLUMN `dev_id` `dev_id` INT(11) NULL DEFAULT -1 ;

CREATE TABLE `account_character` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `account_id` INT NOT NULL,
  `character_id` BIGINT NOT NULL,
  `world_server_id` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));

ALTER TABLE `account` 
ADD COLUMN `current_world_id` INT NOT NULL DEFAULT -1 AFTER `activation_key`;