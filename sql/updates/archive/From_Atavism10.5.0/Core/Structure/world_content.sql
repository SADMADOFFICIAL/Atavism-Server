-- 

SET NAMES 'utf8';

--
-- Set default database
--
USE `world_content`;


ALTER TABLE `item_templates` 
ADD COLUMN `repairable` TINYINT NULL DEFAULT 1 AFTER `shopTimeOut`;

ALTER TABLE `resource_node_sub_profile`
 ADD `lootCount` INT(11) NOT NULL DEFAULT '10' AFTER `deactivationDelay`, 
 ADD `ensureLoot` BOOLEAN NOT NULL DEFAULT '1' AFTER `lootCount`;


ALTER TABLE `item_templates` CHANGE `name` `name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
 CHANGE `category` `category` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `subcategory` `subcategory` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `itemType` `itemType` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `subType` `subType` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `slot` `slot` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `damageType` `damageType` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `triggerEvent` `triggerEvent` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `triggerAction1Type` `triggerAction1Type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `triggerAction1Data` `triggerAction1Data` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect1type` `effect1type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect1name` `effect1name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect2type` `effect2type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect2name` `effect2name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect3type` `effect3type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect3name` `effect3name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect4type` `effect4type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect4name` `effect4name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect5type` `effect5type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect5name` `effect5name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect6type` `effect6type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect6name` `effect6name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect7type` `effect7type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect7name` `effect7name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect8type` `effect8type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect8name` `effect8name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect9type` `effect9type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect9name` `effect9name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect10type` `effect10type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect10name` `effect10name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect11type` `effect11type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect11name` `effect11name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect12type` `effect12type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect12name` `effect12name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect13type` `effect13type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect13name` `effect13name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect14type` `effect14type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect14name` `effect14name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect15type` `effect15type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect15name` `effect15name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect16type` `effect16type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect16name` `effect16name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect17type` `effect17type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect17name` `effect17name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect18type` `effect18type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect18name` `effect18name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect19type` `effect19type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect19name` `effect19name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect20type` `effect20type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect20name` `effect20name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect21type` `effect21type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect21name` `effect21name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect22type` `effect22type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect22name` `effect22name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect23type` `effect23type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect23name` `effect23name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect24type` `effect24type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect24name` `effect24name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect25type` `effect25type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect25name` `effect25name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect26type` `effect26type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect26name` `effect26name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect27type` `effect27type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect27name` `effect27name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect28type` `effect28type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect28name` `effect28name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect29type` `effect29type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect29name` `effect29name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect30type` `effect30type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect30name` `effect30name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect31type` `effect31type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect31name` `effect31name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect32type` `effect32type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `effect32name` `effect32name` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
 CHANGE `socket_type` `socket_type` VARCHAR(86) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '';
