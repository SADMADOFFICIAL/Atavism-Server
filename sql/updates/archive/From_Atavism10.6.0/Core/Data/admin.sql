--
-- Script date 19.09.2021 01:50:59
--

SET NAMES 'utf8';
USE `admin`;
--
-- Deleting data from table server_version
--
DELETE FROM server_version WHERE server_version = '10.6.0';

--
-- Inserting data into table server_version
--
INSERT INTO server_version(server_version, installation_type) VALUES
('10.7.0', 'Core');

