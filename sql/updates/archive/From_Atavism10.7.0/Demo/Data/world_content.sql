--
--


SET NAMES 'utf8';
USE `world_content`;


INSERT INTO `game_setting` (`id`, `name`, `datatype`, `value`, `isactive`, `creationtimestamp`, `updatetimestamp`) VALUES
(null, 'VIP_PER_CHARACTER', 'bool', 'true', 1, '2022-12-19 20:06:41', '2023-04-24 21:35:56'),
(null, 'AUTO_ADJUSTMENT_MEMORY_THREADS_INTERVAL', 'int', '10', 1, '2022-12-19 20:06:41', '2023-04-24 21:35:56'),
(null, 'AUTO_ADJUSTMENT_MEMORY_THREADS', 'bool', 'true', 1, '2022-12-19 20:06:41', '2023-04-24 21:35:56');


INSERT INTO editor_option_choice(id, optionTypeID, choice, deletable, isactive, creationtimestamp, updatetimestamp) VALUES
(null, 12, 'SocketAbility', 0, 1, '2023-04-25 15:33:08', '2023-04-25 15:33:08'),
(null, 12, 'SocketEffect', 0, 1, '2023-04-25 15:33:08', '2023-04-25 15:33:08');

INSERT INTO level_xp_requirements_templates values(1,'Profile1',1, now(), Now());