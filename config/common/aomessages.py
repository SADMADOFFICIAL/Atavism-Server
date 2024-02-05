import sys
import java.util
import java.lang
#from atavism.agis.behaviors import 
from atavism.agis.plugins import ChatClient
from atavism.agis.plugins import QuestClient
from atavism.agis.plugins import AgisInventoryClient
from atavism.agis.plugins import CombatClient
from atavism.agis.plugins import GroupClient
from atavism.agis.plugins import AnimationClient
from atavism.agis.plugins import VendorClient
from atavism.agis.plugins import RankingClient
from atavism.agis.plugins import TrainerClient
from atavism.agis.plugins import AchievementsClient
from atavism.agis.plugins import ClassAbilityClient
from atavism.agis.plugins import DataLoggerClient

from atavism.msgsys import MessageCatalog
from atavism.management import Management
import atavism.server.math
from atavism.server.plugins import WorldManagerClient
from atavism.server.plugins import ObjectManagerClient
from atavism.server.plugins import InventoryClient
from atavism.server.plugins import InstanceClient
from atavism.server.plugins import MobManagerClient
from atavism.server.plugins import ProxyPlugin
from atavism.server.plugins import VoiceClient
from atavism.server.plugins import BillingClient
import atavism.server.util
from atavism.server.util import Log
from atavism.server.objects import ObjectTracker
from atavism.server.objects import World
from atavism.server.engine import EnginePlugin
from atavism.server.engine import Behavior

from atavism.server.messages import PropertyMessage
from atavism.server.messages import LoginMessage
from atavism.server.messages import LogoutMessage
from atavism.server.messages import SearchMessage

#from atavism.server.currency import CurrencyClient

# This config file defines the catalog of message types used by the
# Atavism system.  All server plugins load this file during startup
# before _any_ message is sent, and thus can agree on the generated
# message numbers.

# Game developers can extend the list of cataloged messages by adding
# to the file config/world_name/worldmessages.py.  The startup script
# atavism.sh ensures that both aomessages.py and
# config/world_name/worldmessages.py are read by every plugin before
# any messages are generated

# Create the Atavism message catalog

aoMessageCatalog = MessageCatalog.addMsgCatalog("aoMessageCatalog", 1, 500);

# PropertyMessage
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, PropertyMessage.MSG_TYPE_PROPERTY)

# LoginMessage
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, LoginMessage.MSG_TYPE_LOGIN)

# LogoutMessage
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, LogoutMessage.MSG_TYPE_LOGOUT)

# Add the WorldManagerClient messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_ANIMATION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ChatClient.MSG_TYPE_COM)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ChatClient.MSG_TYPE_COM_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ChatClient.MSG_TYPE_COM_TARGET_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_DC_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_DESPAWNED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_DESPAWN_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_DETACH)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_DIR_LOC_ORIENT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_DISPLAY_CONTEXT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_EXTENSION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_FOG)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_FREE_REMOTE_OBJ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_GETWNODE_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_MOB_PATH)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_MOB_PATH_CORRECTION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_MOB_PATH_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_MODIFY_DC)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_NEW_DIRLIGHT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_FREE_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_NEW_REGION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_NEW_REMOTE_OBJ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_OBJINFO_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_GET_OBJECTS_IN)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_ORIENT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_ORIENT_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_PERCEIVER_REGIONS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_REFRESH_WNODE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_REPARENT_WNODE_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_ROAD)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_FREE_ROAD)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_SETWNODE_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_SET_AMBIENT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_SOUND)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_SPAWNED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_SPAWN_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_SYS_CHAT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_TARGETED_PROPERTY)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_UPDATEWNODE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_UPDATEWNODE_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_UPDATE_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_WNODECORRECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_P2P_EXTENSION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_PERCEPTION_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_PERCEPTION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_HOST_INSTANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, WorldManagerClient.MSG_TYPE_PLAYER_PATH_WM_REQ)

# Add the messages for the ObjectManager

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_SET_PERSISTENCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_SET_SUBPERSISTENCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_MODIFY_NAMESPACE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_LOAD_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_LOAD_SUBOBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_LOAD_OBJECT_DATA)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_SAVE_OBJECT_DATA)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_SAVE_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_SAVE_SUBOBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GENERATE_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GENERATE_SUB_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_SUB_OBJECT_DEPS_READY)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_REGISTER_TEMPLATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_TEMPLATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_TEMPLATE_NAMES)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_ENCHANT_PROFILE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_REGISTER_ENCHANT_PROFILE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_REGISTER_QUALITY_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_QUALITY_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_REGISTER_ITEM_SET_PROFILE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_ITEM_SET_PROFILE)

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_VIP_LEVEL)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_REGISTER_VIP_LEVEL)

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_UNLOAD_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_UNLOAD_SUBOBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_DELETE_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_DELETE_SUBOBJECT)

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_FIX_WNODE_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_NAMED_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_MATCHING_OBJECTS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectManagerClient.MSG_TYPE_GET_OBJECT_STATUS)

# Add InventoryClient messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_ADD_ITEM)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_CREATE_INV)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_INV_UPDATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_ACTIVATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_LOOTALL)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_INV_FIND)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_INV_REMOVE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InventoryClient.MSG_TYPE_DESTROY_ITEM)


# Add ObjectTracker message

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectTracker.MSG_TYPE_NOTIFY_REACTION_RADIUS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ObjectTracker.MSG_TYPE_NOTIFY_AGGRO_RADIUS)

# Add EnginePlugin messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_DUMP_ALL_THREAD_STACKS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_GET_PROPERTY)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_GET_PROPERTY_NAMES)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_PLUGIN_STATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_SET_PROPERTY)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_SET_PROPERTY_NONBLOCK)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_TRANSFER_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, EnginePlugin.MSG_TYPE_RELOAD_TEMPLATES)

# Add Behavior messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, Behavior.MSG_TYPE_COMMAND)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, Behavior.MSG_TYPE_EVENT)

# Add Quest messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_REQ_QUEST_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_REQ_CONCLUDE_QUEST)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_QUEST_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_GET_QUEST_STATUS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_QUEST_RESP)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_NEW_QUESTSTATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_CONCLUDE_QUEST)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_QUEST_STATE_STATUS_CHANGE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_QUEST_LOG_INFO)
#MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_QUEST_HISTORY_LOG_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_QUEST_STATE_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_REMOVE_QUEST_RESP)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, QuestClient.MSG_TYPE_REQ_RESET_QUESTS)

# Add AgisInventory message

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_GET_SETS_EQUIPED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_AGIS_INV_FIND)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_TRADE_START_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_TRADE_START)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_TRADE_COMPLETE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_TRADE_OFFER_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_TRADE_OFFER_UPDATE)
#MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AgisInventoryClient.MSG_TYPE_SWAP_ITEM)

# Add CombatClient messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_AUTO_ATTACK)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_START_ABILITY)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_START_ABILITY_RESPONSE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_COOLDOWN)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_ABILITY_PROGRESS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_DAMAGE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_RELEASE_OBJECT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_ABILITY_STATUS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_ABILITY_UPDATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_ADD_SKILL)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_TRAINING_FAILED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_SKILL_UPDATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_GET_ABILITY)
#MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CombatClient.MSG_TYPE_ADD_ABILITY)

# Add AnimationClient messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, AnimationClient.MSG_TYPE_INVOKE_EFFECT)

# Add InstanceClient messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_REGISTER_INSTANCE_TEMPLATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_CREATE_INSTANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_GET_INSTANCE_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_INSTANCE_ENTRY_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_GET_REGION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_LOAD_INSTANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_UNLOAD_INSTANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_DELETE_INSTANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_LOAD_INSTANCE_CONTENT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_INSTANCE_UNLOADED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_INSTANCE_DELETED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_GET_ENTITY_OIDS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_LOAD_INSTANCE_BY_ID)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_INSTANCE_LOADED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, InstanceClient.MSG_TYPE_SET_INSTANCE_GROUP)

# mob manager (temporary)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, MobManagerClient.MSG_TYPE_REMOVE_SPAWN_GEN)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, MobManagerClient.MSG_TYPE_CREATE_SPAWN_GEN)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, MobManagerClient.MSG_TYPE_SET_AGGRO_RADIUS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, MobManagerClient.MSG_TYPE_SET_REACTION_RADIUS)

# Add Proxy messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_VOICE_PARMS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_PLAYER_PATH_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_UPDATE_PLAYER_IGNORE_LIST)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_RELAY_UPDATE_PLAYER_IGNORE_LIST)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_GET_MATCHING_PLAYERS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_PLAYER_IGNORE_LIST)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_PLAYER_IGNORE_LIST_REQ)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_GET_PLAYER_LOGIN_STATUS)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_LOGOUT_PLAYER)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_ADD_STATIC_PERCEPTION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_REMOVE_STATIC_PERCEPTION)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_LOGIN_SPAWNED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_ACCOUNT_LOGIN)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_SERVER_SHUTDOWN)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ProxyPlugin.MSG_TYPE_SERVER_SHUTDOWN_MESSAGE)

# Search messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, SearchMessage.MSG_TYPE_SEARCH);

# Add TrainerClient messages

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, TrainerClient.MSG_TYPE_REQ_TRAINER_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, TrainerClient.MSG_TYPE_REQ_SKILL_TRAINING)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, TrainerClient.MSG_TYPE_TRAINING_INFO)

# Add ClassAbilityClient Messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ClassAbilityClient.MSG_TYPE_STAT_XP_UPDATE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, ClassAbilityClient.MSG_TYPE_HANDLE_EXP)

#Add GroupClient messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_INVITE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_INVITE_RESPONSE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_REMOVE_MEMBER)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_CHAT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_REQUEST_GROUP_INFO)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_INFO_RESPONSE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_SET_ALLOWED_SPEAKER)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_MUTE_VOICE_CHAT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, GroupClient.MSG_TYPE_GROUP_VOICE_CHAT_STATUS)

#Add VoiceClient messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VoiceClient.MSG_TYPE_VOICECLIENT)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VoiceClient.MSG_TYPE_VOICE_MEMBER_ADDED)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VoiceClient.MSG_TYPE_VOICE_MEMBER_REMOVED)

# atavism.management
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, Management.MSG_TYPE_GET_PLUGIN_STATUS)

#Add VendorClient messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VendorClient.MSG_TYPE_ITEM_PURCHASE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VendorClient.MSG_TYPE_VENDOR_BALANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VendorClient.MSG_TYPE_VENDOR_GET_BALANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, VendorClient.MSG_TYPE_VENDOR_INFO_REQ)

#Add BillingClient messages
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, BillingClient.MSG_TYPE_BILLING_BALANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, BillingClient.MSG_TYPE_DECREMENT_TOKEN_BALANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, BillingClient.MSG_TYPE_GET_TOKEN_BALANCE)
MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, BillingClient.MSG_GET_PLAYER)

#MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CurrencyClient.MSG_TYPE_GET_BALANCE)
#MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CurrencyClient.MSG_TYPE_UPDATE_BALANCE)
#MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, CurrencyClient.MSG_TYPE_LIST_CURRENCIES)

MessageCatalog.addMsgTypeTranslation(aoMessageCatalog, DataLoggerClient.MSG_TYPE_DATA_LOG)
