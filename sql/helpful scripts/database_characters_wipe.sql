delete from atavism.player_character;
delete from atavism.objstore;
delete from atavism.history_objstore;
delete from atavism.plugin_status;
delete from atavism.player_items;
delete from atavism.player_item_sockets;

delete from admin.account_character;
delete from admin.character_purchases;
delete from admin.character_friends;
delete from admin.character_block_list;
delete from admin.character_mail;
delete from admin.claim where permanent<>1;
delete from admin.claim_action;
delete from admin.claim_object;
delete from admin.claim_permission;
delete from admin.claim_resource;
delete from admin.cooldowns;
delete from admin.data_logs;
delete from admin.guild;
delete from admin.guild_member;
delete from admin.guild_rank;
delete from admin.auction_house;
delete from admin.auction_house_ended;
delete from admin.history_auction_house_ended;

delete from master.account_character;
delete from master.world;

update admin.claim set cost = org_cost, currency = org_currency, instanceOwner=0, instanceGuild=-1,owner = -1, forSale = 1, sellerName ='' where parent > -1;