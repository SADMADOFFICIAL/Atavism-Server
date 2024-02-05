from java.util import *
from java.lang import *
from atavism.agis import *
from atavism.agis.core import *
from atavism.agis.objects import *
from atavism.agis.util import *
from atavism.agis.plugins import AgisProxyPlugin
from atavism.agis.plugins import *
from atavism.msgsys import MessageType
from atavism.msgsys import *
from atavism.server.math import *
from atavism.server.plugins import FlashPolicyPlugin
from atavism.server.plugins import ProxyPlugin
from atavism.server.plugins import *
from atavism.server.events import *
from atavism.server.objects import *
from atavism.server.engine import *
from atavism.server.util import *
from java.lang import Float
from java.lang import Boolean

False=0
True=1

flashPolicyPlugin = FlashPolicyPlugin()
Engine.registerPlugin(flashPolicyPlugin)
Engine.MAX_NETWORK_BUF_SIZE = 1400

global proxyPlugin
proxyPlugin = None
proxyClassName = Engine.getProperty("atavism.proxy_plugin_class_name")
if proxyClassName == None:
    proxyPlugin = AgisProxyPlugin()
else:
    proxyClass = Class.forName(proxyClassName)
    if proxyClass == None:
        Log.error("Unknown proxy class "+proxyClassName+" found in property atavism.proxy_plugin_class_name")
    else:
        proxyPlugin = proxyClass.newInstance()


class DevModeAccess (ProxyPlugin.CommandAccessCheck):
    def allowed(self, cmdEvent, proxy):
	return proxy.isDevMode()

global devModeAccess
devModeAccess = DevModeAccess()

#proxyPlugin.maxByteCountBeforeConnectionReset=4000000
#proxyPlugin.maxMessagesBeforeConnectionReset=30000
# register messages that are to be forwarded from the client to the server
proxyPlugin.registerExtensionSubtype("proxy.DYNAMIC_INSTANCE", MessageType.intern("proxy.DYNAMIC_INSTANCE"))
proxyPlugin.registerExtensionSubtype("ao.TRADE_OFFER_REQ", AgisInventoryClient.MSG_TYPE_TRADE_OFFER_REQ)
proxyPlugin.registerExtensionSubtype("ao.TRADE_START_REQ_RESPONSE", AgisInventoryClient.MSG_TYPE_TRADE_START_REQ_RESPONSE)
#proxyPlugin.registerExtensionSubtype("ao.SWAP_ITEM", AgisInventoryClient.MSG_TYPE_SWAP_ITEM)
proxyPlugin.registerExtensionSubtype("ao.DESTROY_ITEM", InventoryClient.MSG_TYPE_DESTROY_ITEM)
proxyPlugin.registerExtensionSubtype("ao.REQ_TRAINER_INFO", TrainerClient.MSG_TYPE_REQ_TRAINER_INFO)
proxyPlugin.registerExtensionSubtype("ao.REQ_SKILL_TRAINING", TrainerClient.MSG_TYPE_REQ_SKILL_TRAINING)
proxyPlugin.registerExtensionSubtype("ao.GROUP_INVITE", GroupClient.MSG_TYPE_GROUP_INVITE)
proxyPlugin.registerExtensionSubtype("ao.GROUP_REMOVE_MEMBER", GroupClient.MSG_TYPE_GROUP_REMOVE_MEMBER)
proxyPlugin.registerExtensionSubtype("ao.GROUP_CHAT", GroupClient.MSG_TYPE_GROUP_CHAT)
proxyPlugin.registerExtensionSubtype("ao.GROUP_INVITE_RESPONSE", GroupClient.MSG_TYPE_GROUP_INVITE_RESPONSE)
proxyPlugin.registerExtensionSubtype("ao.GROUP_SET_ALLOWED_SPEAKER", GroupClient.MSG_TYPE_GROUP_SET_ALLOWED_SPEAKER)
proxyPlugin.registerExtensionSubtype("ao.GROUP_MUTE_VOICE_CHAT", GroupClient.MSG_TYPE_GROUP_MUTE_VOICE_CHAT)
proxyPlugin.registerExtensionSubtype("ao.GROUP_VOICE_CHAT_STATUS", GroupClient.MSG_TYPE_GROUP_VOICE_CHAT_STATUS)
proxyPlugin.registerExtensionSubtype("ao.GROUP_PROMOTE_LEADER", GroupClient.MSG_TYPE_GROUP_PROMOTE_LEADER)
proxyPlugin.registerExtensionSubtype("ao.ITEM_PURCHASE", VendorClient.MSG_TYPE_ITEM_PURCHASE)
proxyPlugin.registerExtensionSubtype("ao.VENDOR_GET_BALANCE", VendorClient.MSG_TYPE_VENDOR_GET_BALANCE)
proxyPlugin.registerExtensionSubtype("ao.VENDOR_INFO_REQ", VendorClient.MSG_TYPE_VENDOR_INFO_REQ)

# register messages that are to be forwarded from the server to the client
proxyPlugin.addExtraPlayerExtensionMessageType(AgisInventoryClient.MSG_TYPE_TRADE_START)
proxyPlugin.addExtraPlayerExtensionMessageType(AgisInventoryClient.MSG_TYPE_TRADE_COMPLETE)
proxyPlugin.addExtraPlayerExtensionMessageType(AgisInventoryClient.MSG_TYPE_TRADE_OFFER_UPDATE)
proxyPlugin.addExtraPlayerExtensionMessageType(QuestClient.MSG_TYPE_QUEST_LOG_INFO)
#proxyPlugin.addExtraPlayerExtensionMessageType(QuestClient.MSG_TYPE_QUEST_HISTORY_LOG_INFO)
proxyPlugin.addExtraPlayerExtensionMessageType(QuestClient.MSG_TYPE_QUEST_INFO)
proxyPlugin.addExtraPlayerExtensionMessageType(QuestClient.MSG_TYPE_REMOVE_QUEST_RESP)
proxyPlugin.addExtraPlayerExtensionMessageType(TrainerClient.MSG_TYPE_TRAINING_INFO)
proxyPlugin.addExtraPlayerExtensionMessageType(CombatClient.MSG_TYPE_TRAINING_FAILED)
proxyPlugin.addExtraPlayerExtensionMessageType(ClassAbilityClient.MSG_TYPE_STAT_XP_UPDATE)
proxyPlugin.addExtraPlayerExtensionMessageType(VendorClient.MSG_TYPE_VENDOR_BALANCE)
proxyPlugin.addExtraPlayerExtensionMessageType(VendorClient.MSG_TYPE_VENDOR_INFO)
proxyPlugin.addExtraPlayerExtensionMessageType(VendorClient.MSG_TYPE_VENDOR_INFO_REQ)

Engine.registerPlugin(proxyPlugin)

# Properties that wont be sent to the client
proxyPlugin.addFilteredProperty("factionData")
proxyPlugin.addFilteredProperty("lootTables")
proxyPlugin.addFilteredProperty("nonCombatPet")
proxyPlugin.addFilteredProperty("CombatPet")

def checkGMAccess(oid):
    adminLevel = EnginePlugin.getObjectProperty(oid, WorldManagerClient.NAMESPACE, "adminLevel")
    if adminLevel is None:
        return False
    if adminLevel < gmLevelReq:
        return False
    return True

class PersistCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()

        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        objOid = int(splitCmd[1])

        Log.debug("PersistCommand: playerOid=" + str(playerOid) + ", objOid=" + str(objOid))

        # send out a set persist message
        ObjectManagerClient.setPersistenceFlag(objOid,
                                               Boolean.TRUE)
        
        ChatClient.sendObjChatMsg(playerOid, 1, "persisted obj " + str(objOid))

class GenerateCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        # The args are template name
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        templateName = splitCmd[1]
        Log.debug("GenerateCommand: player=" + str(playerOid) + ", template=" + templateName)
        # get the player's loc
        objInfo = WorldManagerClient.getObjectInfo(playerOid)
        loc = objInfo.loc
        loc.add(1000,0,0)
        Log.debug("GenerateCommand: player=" + str(playerOid) + ", loc=" + loc.toString())
        
        # generate the object
        objOid = ObjectManagerClient.generateObject(templateName, loc)
        Log.debug("GenerateCommand: player=" + str(playerOid) + ", generated obj oid=" + str(objOid))

        # spawn object
        rv = WorldManagerClient.spawn(objOid)
        Log.debug("GenerateCommand: player=" + str(playerOid) + ", spawned obj rv=" + str(rv))
        ChatClient.sendObjChatMsg(playerOid, 1, "generated oid=" + str(objOid))

class ThreadStatsCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        Log.debug("ThreadStatsCommand: playerOid=" + str(playerOid) + ", " + proxyPlugin.getCurrentThreads().toString())
        InventoryClient.activateObject(targetOid,
                                       playerOid)
        ChatClient.sendObjChatMsg(playerOid, 1, "threadstats=" + proxyPlugin.getCurrentThreads().toString())

class ConcludeCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()

        Log.debug("ConcludeCommand: cmd=" + cmd)

        rv = QuestClient.requestConclude(targetOid,
                                         playerOid)
        
class LootCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()

        Log.debug("LootCommand: cmd=" + cmd)

        rv = InventoryClient.lootAll(playerOid,
                                     targetOid)
        #WorldManagerClient.sendObjChatMsg(playerOid, 0, "proxy.py:lootAll=" + str(rv))

class SetLocCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        Log.debug("SetLocCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        x = int(splitCmd[1])
        y = int(splitCmd[2])
        z = int(splitCmd[3])
        wnode = BasicWorldNode()
        wnode.setLoc(Point(x,y,z))

        # tell the worldmanager we've moved
        # this should update everyone near me
        WorldManagerClient.updateWorldNode(cmdEvent.getObjectOid(), wnode, True)
    
class GotoCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        Log.debug("GotoCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        markerName = splitCmd[1]
        Log.debug("GotoCommand: got goto command, to marker=" + markerName)
        current = WorldManagerClient.getWorldNode(playerOid)
        instanceOid = current.getInstanceOid()
        marker = InstanceClient.getMarker(instanceOid, markerName)
        if (marker == None):
            ChatClient.sendObjChatMsg(playerOid, 0, "Unknown marker")
            return

        Log.debug("GotoCommand: marker " + markerName + "=" + marker.toString())
        wnode = BasicWorldNode()
        wnode.setLoc(marker.getPoint())
        wnode.setOrientation(marker.getOrientation())

        # tell the worldmanager we've moved
        # this should update everyone near me
        WorldManagerClient.updateWorldNode(playerOid, wnode, True)

class GotoPositionCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        Log.debug("GotoPositionCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        locX = float(splitCmd[1])
        locY = float(splitCmd[2])
        locZ = float(splitCmd[3])
        current = WorldManagerClient.getWorldNode(playerOid)
        instanceOid = current.getInstanceOid()
        
        wnode = BasicWorldNode()
        wnode.setLoc(Point(locX, locY, locZ))
        wnode.setOrientation(current.getOrientation())

        # tell the worldmanager we've moved
        # this should update everyone near me
        WorldManagerClient.updateWorldNode(playerOid, wnode, True)
        
class GotoPlayerCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None 
        Log.debug("GotoPlayerCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        name = splitCmd[1]
        current = WorldManagerClient.getWorldNode(playerOid)
        instanceOid = current.getInstanceOid()
        if splitCmd[1].startswith('"',0,1):
            args2 = cmd.split('"', 2)
            name = args2[1]
        targetOid = GroupClient.getPlayerByName(name);
        if (targetOid == None):
            return
        target = WorldManagerClient.getWorldNode(targetOid)
        
        wnode = BasicWorldNode()
        wnode.setLoc(target.getLoc())
        wnode.setInstanceOid(target.getInstanceOid())
        wnode.setOrientation(current.getOrientation())

        # tell the worldmanager we've moved
        # this should update everyone near me
        # WorldManagerClient.updateWorldNode(playerOid, wnode, True) 
        Log.error("GotoPlayerCommand: targetOid="+str(targetOid)+" wnode="+str(wnode))
        InstanceClient.objectInstanceEntry(playerOid, wnode, InstanceClient.InstanceEntryReqMessage.FLAG_NONE)
      
		
		
class TeleportPlayerCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        Log.debug("GotoPlayerCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        name = splitCmd[1]
        current = WorldManagerClient.getWorldNode(playerOid)
        instanceOid = current.getInstanceOid()
        if splitCmd[1].startswith('"',0,1):
            args2 = cmd.split('"', 2)
            name = args2[1]
       
        targetOid = GroupClient.getPlayerByName(name);
        if (targetOid == None):
            return
        player = WorldManagerClient.getWorldNode(playerOid)
        
        wnode = BasicWorldNode()
        wnode.setLoc(player.getLoc())
        wnode.setOrientation(current.getOrientation())
        wnode.setInstanceOid(player.getInstanceOid())
       
        # tell the worldmanager we've moved
        # this should update everyone near me
        # WorldManagerClient.updateWorldNode(targetOid, wnode, True) 
        Log.error("TeleportPlayerCommand: targetOid="+str(targetOid)+" wnode="+str(wnode))
        InstanceClient.objectInstanceEntry(targetOid, wnode, InstanceClient.InstanceEntryReqMessage.FLAG_NONE)
 

class CreateItemCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()

        # the template name is whatever is after the space
        template = cmd[cmd.index(' ')+1:]
        Log.debug("CreateItemSubObjCommand: template=" + template)
        playerOid = cmdEvent.getObjectOid()

        bagOid = WorldManagerClient.getObjectProperty(playerOid, InventoryPlugin.INVENTORY_PROP_BAG_KEY)
        Log.debug("CreateItemSubObjCommand: bagOid=" + str(bagOid))

        # generate the object
        Log.debug("CreateItemSubObjCommand: templ=" + template + ", generating object")
        #itemOid = ObjectManagerClient.generateObject(template, Template())
        overrideTemplate = Template()
        overrideTemplate.put(Namespace.OBJECT_MANAGER, ObjectManagerClient.TEMPL_PERSISTENT, Boolean(True))
        itemOid = ObjectManagerClient.generateObject(template, overrideTemplate)

        # add to inventory
        Log.debug("CreateItemSubObjCommand: createitem: oid=" + str(itemOid) + ", bagOid=" + str(bagOid) + ", adding to inventory")
        rv = InventoryClient.addItem(playerOid, playerOid, playerOid, itemOid)
        Log.debug("CommandPlugin: createitem: oid=" + str(itemOid) + ", added, rv=" + str(rv))
        ChatClient.sendObjChatMsg(playerOid, 1, "added item" + str(rv))
        
class SetMeshCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        mesh = cmd[cmd.index(' ')+1:]
        submeshes = LinkedList()
        Log.debug("/setmesh: oid=" + str(playerOid) + " to: " + mesh)
        WorldManagerClient.modifyDisplayContext(playerOid,
                                                WorldManagerClient.modifyDisplayContextActionReplace,
                                                mesh,
                                                submeshes)

class ReleaseCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/release: oid=" + str(playerOid))
        CombatClient.releaseObject(playerOid, False)
        
class ReleaseToSpiritCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/release: oid=" + str(playerOid))
        CombatClient.releaseObject(playerOid, True)

class WhoCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        playerOid = cmdEvent.getObjectOid()
	if checkGMAccess(playerOid) == False:
            return None
        playerNames = proxyPlugin.getPlayerNames()
        Log.debug("/who: oid=" + str(playerOid) + ": returning "+str(playerNames.size())+" players")
        response = "players\n------------\n"
#        playerNames.sort(1)
        for name in playerNames:
            response = response + name + "\n"
        response = response + str(playerNames.size()) + " players\n"
        ChatClient.sendObjChatMsg(playerOid, 0, response)
        
class Who2Command (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        playerOids = proxyPlugin.getPlayerOids()
        Log.error("/who2: oid=" + str(playerOid) + ": returning "+str(playerOids.size())+" players")
        response = "\nplayers\n------------\n"
        for playerOidd in playerOids:
            current = WorldManagerClient.getWorldNode(playerOidd)
            instanceOid = current.getInstanceOid()
            player = proxyPlugin.getPlayer(playerOidd)
            instanceInfo = InstanceClient.getInstanceInfo(instanceOid, InstanceClient.FLAG_ALL_INFO)
            response = response + str(player.getName()) + " : " +str(playerOidd)+  " - (" + str(instanceInfo.name) + " "+str(instanceInfo.templateName)+ " : " + str(instanceOid) + ")\n"
#            response = player.getName() + " : " +  " - (" +  " : " + str(instanceOid) + ")\n"
        response = response + str(playerOids.size()) + " players\n"
	ChatClient.sendObjChatMsg(playerOid, 0, response)
        
class Who3Command (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        playerNames = proxyPlugin.getAllPlayerNames()
        Log.debug("/who: oid=" + str(playerOid) + ": returning "+str(playerNames.size())+" players")
        response = "players\n------------\n"
#        playerNames.sort(1)
        for name in playerNames:
            response = response + name + "\n"
        response = response + str(playerNames.size()) + " players\n"
        ChatClient.sendObjChatMsg(playerOid, 0, response)

class Who4Command (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        cmd = cmdEvent.getCommand()
        args = cmd.split(None, 2)
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        playerNames = proxyPlugin.getAllPlayerNames()
        Log.debug("/who: oid=" + str(playerOid) + ": returning "+str(playerNames.size())+" players")
        response = "\n------------\n"
        if len(args) > 1:
           i=0
           for name in playerNames:
              if name.find(args[1]) > -1:
                 i = i + 1
           response =  response + " found " + str(i) + " / "
#        playerNames.sort(1)
#        for name in playerNames:
#            response = response + name + "\n"
        response =  response + str(playerNames.size()) + " players online\n"
        ChatClient.sendObjChatMsg(playerOid, 0, response)
        
class PlayerCountCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        playerOid = cmdEvent.getObjectOid()
        playerNames = proxyPlugin.getPlayerNames()
        Log.debug("/playercount: oid=" + str(playerOid) + ": returning "+str(playerNames.size())+" players")
        response = str(playerNames.size()) + " players\n"
        ChatClient.sendObjChatMsg(playerOid, 0, response)

class ParmCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        count = (len(splitCmd) - 1) / 2
        i = -1
        msg = WorldManagerClient.TargetedExtensionMessage(playerOid)
        msg.setProperty("ext_msg_subtype", "ClientParameter")
        for s in splitCmd:
            if (i != -1):
                if ((i & 1) == 0):
                    n = s
                else:
                    msg.setProperty(n, s)
            i = i + 1
        Engine.getAgent().sendBroadcast(msg)


#
# separated this out of SysCommand so other worlds can call in after
# world-specific processing (i.e. testing for admin status in Places)
#
def handleSysCommand(cmdEvent):
        cmd = cmdEvent.getCommand()
        msg = cmd[cmd.index(' ')+1:]
        Log.debug("SysCommand: msg=" + msg)

        ChatClient.sendSysChatMsg("System: " + msg)

class SysCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        handleSysCommand(cmdEvent)


class DirLightCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global proxyPlugin;
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        x = Float.valueOf(splitCmd[1])
        y = Float.valueOf(splitCmd[2])
        z = Float.valueOf(splitCmd[3])
        Log.debug("DirLightCommand: playerOid=" + str(playerOid) +
                  ", x=" + str(x) +
                  ", y=" + str(y) +
                  ", z=" + str(z))
        grey = Color(140, 128, 128)
        dirlight = DirectionalLight("dirlight")
        dirlight.setDiffuse(grey)
        dirlight.setSpecular(grey)
        dirlight.setAttenuationRange(1000000)
        dirlight.setAttenuationConstant(1)
        dirlight.setAttenuationLinear(0)
        dirlight.setAttenuationQuadradic(0)
        vector = AOVector(x,y,z)
        dirlight.setLightOrientation(Quaternion.fromAngleAxis(-1, vector))
        lightEvent = NewLightEvent()
        lightEvent.setObjectOid(playerOid)
        lightEvent.setLight(dirlight)
        playerOids = proxyPlugin.getPlayerOids()
        for oid in playerOids:
            conMap = proxyPlugin.getConnectionMap()
            con = conMap.getConnection(oid)
            Log.debug("DirLightCommand: sending light " +
                      dirlight.toString() +
                      " to oid " + str(oid))
            con.send(lightEvent.toBytes())

class FindCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        itemTemplate = cmd[cmd.index(' ')+1:]
        itemOid = InventoryClient.findItem(playerOid, itemTemplate)
        if (itemOid == None):
            ChatClient.sendObjChatMsg(playerOid, 0, "item not found")
        else:
            ChatClient.sendObjChatMsg(playerOid, 0, itemTemplate + ":" + str(itemOid))

class FindWeaponCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
'''        itemOid = AgisInventoryClient.findItem(playerOid, AgisEquipSlot.PRIMARYWEAPON)
        if (itemOid == None):
            ChatClient.sendObjChatMsg(playerOid, 0, "item not found")
        else:
            ChatClient.sendObjChatMsg(playerOid, 0, "weapon:" + str(itemOid))
'''


class RemoveCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        itemTemplate = cmd[cmd.index(' ')+1:]
        itemOid = InventoryClient.removeItem(playerOid, itemTemplate)
        if (itemOid == None):
            ChatClient.sendObjChatMsg(playerOid, 0, "item not found")
        else:
            ChatClient.sendObjChatMsg(playerOid, 0, itemTemplate + ":" + str(itemOid))

class AbilityCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
#        Log.error("proxy.py AbilityCommand: playerOid=" + str(playerOid) + ", cmd=" + cmd)
        splitCmd = cmd.split(" ")
        abilityID = int(splitCmd[1])
        claimID = int(splitCmd[2])
        claimObjID = int(splitCmd[3])
        if len(splitCmd) > 4:
           x = Float.valueOf(splitCmd[4])
           y = Float.valueOf(splitCmd[5])
           z = Float.valueOf(splitCmd[6])
           Log.error("AbilityCommand: playerOid=" + str(playerOid) + " targetOid=" + str(targetOid)+ " Ability=" + str(abilityID)+", x=" + str(x) +", y=" + str(y) +", z=" + str(z))
#          abilityID = int(cmd[cmd.index(' ')+1:])
           loc = Point(x,y,z)
           CombatClient.startAbility(abilityID, playerOid, targetOid, None, Boolean(True), claimID, claimObjID, loc)
        else:
#          Log.error("proxy.py AbilityCommand: playerOid=" + str(playerOid) + ", cmd=" + cmd + ", ability=" + str(abilityID) + " targetOid=" + str(targetOid)+" claim="+str(claimID)+" claimOj="+str(claimObjID))
           CombatClient.startAbility(abilityID, playerOid, targetOid, None, Boolean(True), claimID, claimObjID)

class AbilityCommand2 (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        abilityID = int(cmd[cmd.index(' ')+1:])
        Log.debug("proxy.py AbilityCommand: playerOid=" + str(playerOid) + ", cmd=" + cmd + ", ability=" + str(abilityID))
        CombatClient.startAbility(abilityID, playerOid, targetOid, None, Boolean(False), -1, -1)

class AbilityCommand3 (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        abilityID = int(splitCmd[1])
        x = Float.valueOf(splitCmd[2])
        y = Float.valueOf(splitCmd[3])
        z = Float.valueOf(splitCmd[4])
        Log.debug("AbilityCommand3: playerOid=" + str(playerOid) + " Ability=" + str(abilityID)+", x=" + str(x) +", y=" + str(y) +", z=" + str(z))
#        abilityID = int(cmd[cmd.index(' ')+1:])
        loc = Point(x,y,z)
        Log.debug("proxy.py AbilityCommand: playerOid=" + str(playerOid) + ", cmd=" + cmd + ", ability=" + str(abilityID))
        CombatClient.startAbility(abilityID, playerOid, targetOid, None, loc)

class NoMoveCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        nomove = cmd[cmd.index(' ')+1:]
        if nomove == "on":
            WorldManagerClient.setObjectProperty(targetOid, "world.nomove", Boolean(True))
        else:
            WorldManagerClient.setObjectProperty(targetOid, "world.nomove", Boolean(False))

class ResetQuestCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        QuestClient.resetQuests(playerOid)

class DumpStacksCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        msg = Message(EnginePlugin.MSG_TYPE_DUMP_ALL_THREAD_STACKS)
        Engine.getAgent().sendBroadcast(msg)

class TradeStartCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        AgisInventoryClient.tradeStart(playerOid, targetOid)

class StuckCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        wnode = BasicWorldNode()
        playerOid = cmdEvent.getObjectOid()
        current = WorldManagerClient.getWorldNode(playerOid)
        instanceOid = current.getInstanceOid()
        spawn = InstanceClient.getMarker(instanceOid, "spawn")
        if(spawn == None) :
            Log.error("StuckCommand: spawn is null ")
            return
        wnode.setLoc(spawn.getPoint())
        '''marker = InstanceClient.getMarker(instanceOid, "stuck")
        if (marker != None):
            wnode.setLoc(marker.getPoint())
            wnode.setOrientation(marker.getOrientation())
            Log.debug("StuckCommand: marker stuck = " + marker.toString())
        else:
            wnode.setLoc(Point(0, 0, 0))
            Log.debug("StuckCommand: no marker stuck, so going to (0, 0, 0)")'''
       # hearthLoc = EnginePlugin.getObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "hearthLoc")
      #  wnode.setLoc(hearthLoc)
        # tell the worldmanager we've moved
        WorldManagerClient.updateWorldNode(cmdEvent.getObjectOid(), wnode, True)


# tests should send a chat message back with "test success" or "test failure"
class TestCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()

        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        testName = splitCmd[1]
        if (testName == "persistKey") :
            # example /test persistKey testKey
            key = splitCmd[2]
            self.testKeywordPersistence(playerOid, key)
        else :
            Log.error("TestCommand: unknown test " + testName)

    def testKeywordPersistence(self, playerOid, key) :
        testNamespace = Namespace.intern("testNamespace")
        saveEntity = Entity("saveEntity")
        saveEntity.setProperty("sample_property", "sample_value")
        if (not ObjectManagerClient.saveObjectData(key,
                                                   saveEntity,
                                                   testNamespace)) :
            Log.error("testKeywordPersistence failed on saving")
            CHatClient.sendObjChatMsg(playerOid, 0, "test failure")
            return
        loadEntity = ObjectManagerClient.loadObjectData(key)
        if (loadEntity == None) :
            Log.error("testKeywordPersistence failed on loading, got null")
            ChatClient.sendObjChatMsg(playerOid, 0, "test failure")
            return
        val = loadEntity.getProperty("sample_property")
        if (val != "sample_value") :
            Log.error("testKeywordPersistence failed, value=" + val)
            ChatClient.sendObjChatMsg(playerOid, 0, "test failure")
            return
        Log.error("testKeywordPersistence: test passed")
        ChatClient.sendObjChatMsg(playerOid, 0, "test success")
        
# Display the server's notion of the orientation of a targeted entity as a chat message
class OrientationCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        if targetOid is None:
            targetOid = playerOid
        targetObj = WorldManagerClient.getObjectInfo(targetOid)
        ChatClient.sendObjChatMsg(playerOid, 0, "Orientation: " + str(targetObj.orient))

class DebugOidCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand().split(" ");
        if len(cmd) > 1:
            cmd = cmd[1]
        else:
            cmd = ""
        objOid = 0
        try:
            if cmd != "":
                objOid = int(cmd)
        except ValueError:
            ChatClient.sendObjChatMsg(playerOid, 0, "Invalid OID");
            return
        except TypeError:
            pass
        if objOid == 0:
            World.DEBUG_OID = cmdEvent.getTarget()
        else:
            World.DEBUG_OID = objOid
        ChatClient.sendObjChatMsg(playerOid, 0, "DEBUG_OID = "+str(World.DEBUG_OID))

class TemplatesCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        templateNames = ObjectManagerClient.getTemplateNames()
        Log.debug("/templates: oid=" + str(playerOid) + ": returning "+str(templateNames.size())+" templates")
        response = "Templates\n------------\n"
        for name in templateNames:
            response = response + name + "\n"
        response = response + str(templateNames.size()) + " templates\n"
        ChatClient.sendObjChatMsg(playerOid, 0, response)

class TellCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        args = cmd.split(None, 2)
        playerOid = cmdEvent.getObjectOid()
        player = proxyPlugin.getPlayer(playerOid)
        db = Engine.getDatabase()
        if len(args) < 3:
            ChatClient.sendObjChatMsg(playerOid, 2, args[0] + " <player name> <message>")
            return
        m = args[2]
        targetName = args[1]
        if args[1].startswith('"',0,1):
            args2 = cmd.split('"', 2)
            targetName = args2[1]
            m = args2[2]
        
        targetOid = db.getOidByName(targetName, Namespace.WORLD_MANAGER)

        if (targetOid is None):
            ChatClient.sendObjChatMsg(playerOid, 2, targetName + " is not a valid character name.")
        else:
            if (playerOid.toLong() == targetOid.toLong()):
                ChatClient.sendObjChatMsg(playerOid, 2, "Can not send to yourself.")
                return
            targetOid = ObjectManagerClient.getNamedObject(None,targetName,ObjectTypes.player)
            if (targetOid != None):
                proxy = Engine.getCurrentPlugin()
                proxy.incrementPrivateChatCount()
#                isOnBlockList = SocialClient.isOnBlockList(playerOid,targetOid)
                # isOnBlockList = proxy.isOnBlockList(playerOid,targetOid)
            #    Log.error("proxy.py l623 isOnBlockList: "+str(isOnBlockList))
                if (SocialClient.isOnBlockList(playerOid,targetOid)):
                    #WorldManagerClient.sendObjChatMsg(playerOid, 2, "You are on block list.")
                    Log.info("Player on BlockList")
                else:    
                    Log.info("ProxyPlugin: CHAT_SENT player=" + player.toString() +
                    " to=" + str(targetOid) + " toName=" + targetName +
                    " private=true msg=[" +m + "]")
                    ChatClient.sendObjChatMsg(playerOid, player.getName(), 6, "[to " + targetName + "]: " + m)
                    ChatClient.sendObjChatMsg(targetOid, player.getName(), 6, "[from " + player.getName() + "]: " + m)
            else:
                ChatClient.sendObjChatMsg(playerOid, 2, targetName + " is not available for chat.")

class GetRegionCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        args = cmd.split(" ")
        format = "xyz"
        ii = 1
        while ii < len(args):
          arg = args[ii]
          if arg == "-pxz":
            format = "xz"
          elif len(arg) > 0 and arg[0] != "-":
           break
          ii = ii + 1
        playerOid = cmdEvent.getObjectOid()
        current = WorldManagerClient.getWorldNode(playerOid)
        instanceOid = current.getInstanceOid()
        region = InstanceClient.getRegion(instanceOid,args[ii],InstanceClient.REGION_BOUNDARY)
        if region == None:
         ChatClient.sendObjChatMsg(playerOid, 0, "Unknown region "+args[ii])
         return None
        points = region.getBoundary().getPoints()
        pointString = ""
        for point in points:
         if pointString != "":
            pointString = pointString + ","
         if format == "xz":
            pointString = pointString + str(point.getX()) + "," + str(point.getZ())
         else:
            pointString = pointString + str(point.getX()) + "," + str(point.getY()) + "," + str(point.getZ())
        ChatClient.sendObjChatMsg(playerOid, 0, "POINTS: "+pointString)

class UnknownCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        ChatClient.sendObjChatMsg(playerOid, 0, "Unknown command " + cmdEvent.getCommand())
        
class SetRotatingDirectionPropertyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        propertyValue = Float(splitCmd[1])
        EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "rotating", propertyValue)
        return None

class clearChatCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()

class SetWorldTimeCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        Log.debug("SetWorldTimeCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        year = int(splitCmd[1])
        month = int(splitCmd[2])
        day = int(splitCmd[3])
        hour = int(splitCmd[4])
        minute = int(splitCmd[5])
        WeatherClient.SetWorldTime(year,month,day,hour,minute)

class SetWeatherProfileCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        Log.debug("SetWeatherProfileCommand: cmd=" + cmd)
        splitCmd = cmd.split(" ")
        profile = int(splitCmd[1])
        WeatherClient.SetWeatherProfile(playerOid,profile)

proxyPlugin.registerCommand("/setWeatherProfile", SetWeatherProfileCommand(), devModeAccess)
proxyPlugin.registerCommand("/setWorldTime", SetWorldTimeCommand(), devModeAccess)
proxyPlugin.registerCommand("/clearChat", clearChatCommand())
proxyPlugin.registerCommand("/resetquests", ResetQuestCommand(), devModeAccess)
proxyPlugin.registerCommand("/nomove", NoMoveCommand())
proxyPlugin.registerCommand("/goto", GotoCommand(), devModeAccess)
proxyPlugin.registerCommand("/gotoplayer", GotoPlayerCommand(), devModeAccess)
proxyPlugin.registerCommand("/gotopos", GotoPositionCommand(), devModeAccess)
proxyPlugin.registerCommand("/summon", TeleportPlayerCommand(), devModeAccess)
proxyPlugin.registerCommand("/createitem", CreateItemCommand(), devModeAccess)
proxyPlugin.registerCommand("/setmesh", SetMeshCommand(), devModeAccess)
proxyPlugin.registerCommand("/setloc", SetLocCommand(), devModeAccess)
proxyPlugin.registerCommand("/lootall", LootCommand())
proxyPlugin.registerCommand("/release", ReleaseCommand(), devModeAccess)
proxyPlugin.registerCommand("/releaseToSpirit", ReleaseToSpiritCommand(), devModeAccess)
proxyPlugin.registerCommand("/conclude", ConcludeCommand())
proxyPlugin.registerCommand("/who", WhoCommand())
proxyPlugin.registerCommand("/who2", Who2Command())
proxyPlugin.registerCommand("/who3", Who3Command())
proxyPlugin.registerCommand("/who4", Who4Command())
proxyPlugin.registerCommand("/playercount", PlayerCountCommand())
proxyPlugin.registerCommand("/parm", ParmCommand(), devModeAccess)
proxyPlugin.registerCommand("/sys", SysCommand(), devModeAccess)
proxyPlugin.registerCommand("/dirlight", DirLightCommand(), devModeAccess)
proxyPlugin.registerCommand("/threadstats", ThreadStatsCommand(), devModeAccess)
proxyPlugin.registerCommand("/find", FindCommand())
proxyPlugin.registerCommand("/remove", RemoveCommand())
proxyPlugin.registerCommand("/findweapon", FindWeaponCommand())
proxyPlugin.registerCommand("/ability", AbilityCommand())
proxyPlugin.registerCommand("/ability2", AbilityCommand2())
proxyPlugin.registerCommand("/abilityloc", AbilityCommand3())
proxyPlugin.registerCommand("/generate", GenerateCommand(), devModeAccess)
proxyPlugin.registerCommand("/persist", PersistCommand(), devModeAccess)
proxyPlugin.registerCommand("/dumpstacks", DumpStacksCommand(), devModeAccess)
proxyPlugin.registerCommand("/trade", TradeStartCommand())
proxyPlugin.registerCommand("/stuck", StuckCommand())
proxyPlugin.registerCommand("/test", TestCommand(), devModeAccess)
proxyPlugin.registerCommand("/orientation", OrientationCommand())
proxyPlugin.registerCommand("/debugoid", DebugOidCommand(), devModeAccess)
proxyPlugin.registerCommand("/templates", TemplatesCommand(), devModeAccess)
proxyPlugin.registerCommand("/getregion", GetRegionCommand(), devModeAccess)
proxyPlugin.registerCommand("/tell", TellCommand())
proxyPlugin.registerCommand("/t", TellCommand())
proxyPlugin.registerCommand("/whisper", TellCommand())
proxyPlugin.registerCommand("/w", TellCommand())
proxyPlugin.registerCommand("/pm", TellCommand())
proxyPlugin.registerCommand("/im", TellCommand())
proxyPlugin.registerCommand("/unknowncmd", UnknownCommand())
proxyPlugin.registerCommand("/rotating", SetRotatingDirectionPropertyCommand())
