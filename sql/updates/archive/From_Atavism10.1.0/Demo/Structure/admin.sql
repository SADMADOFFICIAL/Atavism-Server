-- 
-- Run this script against `admin` to synchronize it with admin
-- 

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE `admin`;


DROP TRIGGER IF EXISTS history_auction_house_ended;

--
-- Alter column `mailSubject` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN mailSubject mailSubject VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

--
-- Alter column `mailMessage` on table `character_mail`
--
ALTER TABLE character_mail 
  CHANGE COLUMN mailMessage mailMessage TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

--
-- Alter column `buyout` on table `history_auction_house_ended`
--
ALTER TABLE history_auction_house_ended 
  CHANGE COLUMN buyout buyout BIGINT(20) NOT NULL;

--
-- Alter column `guildRank` on table `guild_rank`
--
ALTER TABLE guild_rank 
  CHANGE COLUMN rank guildRank INT(11) NOT NULL;

--
-- Alter column `guildRank` on table `guild_member`
--
ALTER TABLE guild_member 
  CHANGE COLUMN rank guildRank INT(11) DEFAULT NULL;

--
-- Alter column `message` on table `chat_logs`
--
ALTER TABLE chat_logs 
  CHANGE COLUMN message message TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

DELIMITER ;;

--
-- Create trigger `history_auction_house_ended`
--
CREATE TRIGGER history_auction_house_ended
	BEFORE UPDATE
	ON auction_house_ended
	FOR EACH ROW
BEGIN
  IF NEW.status = 7 THEN
    INSERT INTO history_auction_house_ended (auction_id,
    startbid,
    currency_id,
    expire_date,
    auctioneer_oid,
    owner_oid,
    bidder_oid,
    race_group_id,
    bid,
    buyout,
    status,
    mode,
    item_oid,
    item_count,
    item_template_id,
    item_enchant_level,
    item_sockets_info,
    world_name,
    creationtimestamp,
    updatetimestamp)
      VALUES (NEW.id, NEW.startbid, NEW.currency_id, NEW.expire_date, NEW.auctioneer_oid, NEW.owner_oid, NEW.bidder_oid, NEW.race_group_id, NEW.bid, NEW.buyout, NEW.status, NEW.mode, NEW.item_oid, NEW.item_count, NEW.item_template_id, NEW.item_enchant_level, NEW.item_sockets_info, NEW.world_name, NEW.creationtimestamp, NEW.updatetimestamp);
  END IF;
END
;;

DELIMITER ;

--
-- Alter column `startbid` on table `auction_house`
--
ALTER TABLE auction_house 
  CHANGE COLUMN startbid startbid BIGINT(20) NOT NULL;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;