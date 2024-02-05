from java.lang import *
from java.util import *
from java.util.concurrent import *
from atavism.agis import *
from atavism.agis.plugins import GuildPlugin
from atavism.agis.plugins import *
from atavism.server.engine import *

Engine.registerPlugin("atavism.agis.plugins.GuildPlugin")

###
# Possible Permissions:
# GuildPlugin.PERMISSION_INVITE
# GuildPlugin.PERMISSION_KICK
# GuildPlugin.PERMISSION_PROMOTE
# GuildPlugin.PERMISSION_DEMOTE
# GuildPlugin.PERMISSION_SET_MOTD
# GuildPlugin.PERMISSION_CHAT
###

# Define default ranks in order
gmPermissions = [GuildPlugin.PERMISSION_INVITE, GuildPlugin.PERMISSION_KICK, GuildPlugin.PERMISSION_PROMOTE, GuildPlugin.PERMISSION_DEMOTE, GuildPlugin.PERMISSION_SET_MOTD, GuildPlugin.PERMISSION_CHAT, GuildPlugin.PERMISSION_ADD_RANK, GuildPlugin.PERMISSION_EDIT_RANK, GuildPlugin.PERMISSION_DISBAND, GuildPlugin.PERMISSION_DEL_RANK, GuildPlugin.PERMISSION_ADD_CLAIM, GuildPlugin.PERMISSION_EDIT_CLAIM, GuildPlugin.PERMISSION_ACTION_CLAIM, GuildPlugin.PERMISSION_LEVEL_UP, GuildPlugin.PERMISSION_WAREHOUSE_ADD, GuildPlugin.PERMISSION_WAREHOUSE_GET]
GuildPlugin.AddGuildRank("Guild Master", gmPermissions)

officerPermissions = [GuildPlugin.PERMISSION_INVITE, GuildPlugin.PERMISSION_KICK, GuildPlugin.PERMISSION_PROMOTE, GuildPlugin.PERMISSION_DEMOTE, GuildPlugin.PERMISSION_CHAT]
GuildPlugin.AddGuildRank("Officer", officerPermissions)

officerPermissions = [GuildPlugin.PERMISSION_INVITE, GuildPlugin.PERMISSION_CHAT]
GuildPlugin.AddGuildRank("Captain", officerPermissions)

peasantPermissions = [GuildPlugin.PERMISSION_CHAT]
GuildPlugin.AddGuildRank("Peasant", peasantPermissions)