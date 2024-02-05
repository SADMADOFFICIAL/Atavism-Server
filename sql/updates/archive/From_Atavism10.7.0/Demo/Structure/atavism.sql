-- 
-- Script date 23.04.2023 10:46:06
-- Run this script against atavism 10.7.0 to synchronize it with atavism 10.8.0
-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE `atavism`;


--
-- Create foreign key
--
SET @preparedStatement = (SELECT IF(
  (
   SELECT count(*)
    FROM information_schema.TABLE_CONSTRAINTS
    WHERE
        CONSTRAINT_SCHEMA = DATABASE() AND
        CONSTRAINT_NAME   = 'player_character_ibfk_1' AND
        CONSTRAINT_TYPE   = 'FOREIGN KEY'
  ) > 0,
  "SELECT 1",
  "ALTER TABLE player_character
  ADD CONSTRAINT player_character_ibfk_1 FOREIGN KEY (obj_id, namespace_int)
    REFERENCES objstore(obj_id, namespace_int)"));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;