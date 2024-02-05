from java.util import *
from java.lang import *
from atavism.agis import *
from atavism.agis.core import *
from atavism.agis.objects import GenerateObjectProxyHook
from atavism.agis.objects import *
from atavism.agis.util import *
from atavism.agis.plugins import *
from atavism.agis.behaviors import *
from atavism.msgsys import *
from atavism.server.math import *
from atavism.server.plugins import *
from atavism.server.events import *
from atavism.server.objects import InstanceEntryProxyHook
from atavism.server.objects import *
from atavism.server.engine import *
from atavism.server.util import *
from java.util.concurrent import *
import time
from java.lang import Boolean
from java.lang import Runnable

Log.debug("extensions_proxy.py: Loading...")

class WaveCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/wave: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "wave")
    
class BowCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/bow: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "bow")
    
class ClapCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/clap: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "clap")
    
class CryCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/cry: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "cry")
 
class LaughCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/laugh: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "laugh")
    
class CheerCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/cheer: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "cheer")
    
class NoCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/no: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "disagree")
    
class PointCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/point: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "point")
    
class ShrugCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/shrug: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "shrug")

class SaluteCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/salute: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "salute")

class TalkCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/talk: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "talk")

class RaiseHandCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        Log.debug("/raiseHand: oid=" + str(playerOid))
        AnimationClient.playSingleAnimation(playerOid,
                                            "raiseHand")
                                                                                        
globalPoid = 0
numMoved = 0

class testExecution(Runnable):
    def run(self):
        global globalPoid
        global numMoved
        Log.debug("ANDREW - globalPoid2 = " + str(globalPoid))
        ChatClient.sendObjChatMsg(globalPoid, 1, "Scheduled Executor message: " + numMoved)
        if numMoved < 40:
            oldNode = WorldManagerClient.getWorldNode(globalPoid)
            loc = oldNode.getLoc()
            loc.add(500, 100, 0)
            tnode = BasicWorldNode()
            tnode.setLoc(loc)
            WorldManagerClient.updateWorldNode(globalPoid, tnode, true)
            numMoved = numMoved + 1
        
class ScheduleCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        global globalPoid
        cmd = cmdEvent.getCommand()
        globalPoid = cmdEvent.getObjectOid()
        Log.debug("ANDREW - globalPoid = " + str(globalPoid))
        #Engine.getExecutor().scheduleAtFixedRate(testExecution(), 5000, 500, TimeUnit.MILLISECONDS)


###
# Special Commands
###
class SetAdminLevelCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("ADMIN: splitCMD[1]=" + splitCmd[1])
        if splitCmd[1] == "admin":
            EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "adminLevel", 5)
        elif splitCmd[1] == "GM":
            EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "adminLevel", 3)
        elif splitCmd[1] == "player":
            EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "adminLevel", 1)
        return None

#proxyPlugin.registerCommand("/setAdminLevel", SetAdminLevelCommand())
        
###
# Admin Commands
# Requires adminLevel of 5+
###
adminLevelReq = 5

def checkAdminAccess(oid):
    adminLevel = EnginePlugin.getObjectProperty(oid, WorldManagerClient.NAMESPACE, "adminLevel")
    if adminLevel is None:
        return False
    if adminLevel < adminLevelReq:
        return False
    return True

class SendServerChatMessageCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkAdminAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        spaceLoc = cmd.find(" ")
        message = cmd[spaceLoc+1:]
        oids = proxyPlugin.getPlayerOids()
        for oid in oids:
            ChatClient.sendObjChatMsg(oid, 2, "[Server Message]: %s" % message)
        return None

proxyPlugin.registerCommand("/serverMessage", SendServerChatMessageCommand())

### 
# GM Commands
# Requires adminLevel of 3+
###
gmLevelReq = 3

def checkGMAccess(oid):
    adminLevel = EnginePlugin.getObjectProperty(oid, WorldManagerClient.NAMESPACE, "adminLevel")
    if adminLevel is None:
        return False
    if adminLevel < gmLevelReq:
        return False
    return True
    
class FlyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        
        movementState = AgisWorldManagerPlugin.MOVEMENT_STATE_FLYING
        # Check if it is set to stop
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        if len(splitCmd) > 1:
            stop = splitCmd[1]
            if stop == "stop" or stop == "0":
                movementState = AgisWorldManagerPlugin.MOVEMENT_STATE_RUNNING
                
        AgisWorldManagerClient.sendSetMovementStateMessage(playerOid, movementState)
        return None
    
class GainSkillPointsCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        EnginePlugin.setObjectProperty(playerOid, CombatClient.NAMESPACE, "skillPoints", 100)
        return None

class GainSkillCurrentCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        skillType = int(splitCmd[1])
        skillBoost = int(splitCmd[2])
        ClassAbilityClient.skillAlterCurrent(playerOid, skillType, skillBoost, True)
        return None

class GainExpCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        expAmount = int(splitCmd[1])
        # Send some message to increase exp by the specified amount
        QERmsg = CombatClient.alterExpMessage(playerOid, expAmount);
        Engine.getAgent().sendBroadcast(QERmsg)
        return None

class InstanceChangeCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
            
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        spaceLoc = cmd.find(" ")
        instanceName = cmd[spaceLoc+1:]
        instanceOid = InstanceClient.getInstanceOid(instanceName)
        if instanceOid == None:
            Log.debug("CHANGEI: Instance name is wrong: " + instanceName)
            return None
        Log.debug("CHANGEI: Instance name: " + instanceName + "; oid: " + str(instanceOid))
        node = BasicWorldNode()
        markerName = "spawn"
        spawn = InstanceClient.getMarker(instanceOid, markerName)
        node.setInstanceOid(instanceOid)
        node.setOrientation(spawn.getOrientation())
        node.setLoc(spawn.getPoint())
        direction = AOVector()
        node.setDir(direction)
        InstanceClient.objectInstanceEntry(playerOid, node, InstanceClient.InstanceEntryReqMessage.FLAG_NONE)
        return None

class GenerateItemCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        itemID = int(splitCmd[1])
        count = 1
        if len(splitCmd) > 2:
            count = int(splitCmd[2])
        Log.debug("CreateItemSubObjCommand: template=" + str(itemID))
        # add to inventory
        AgisInventoryClient.generateItem(playerOid, itemID, "", count, None)
        Log.debug("CommandPlugin: createitem: itemName=" + str(itemID))
        ChatClient.sendObjChatMsg(playerOid, 1, "added item: " + str(itemID))

class GainCurrencyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        currencyType = int(splitCmd[1])
        amount = int(splitCmd[2])
        AgisInventoryClient.alterCurrency(playerOid, currencyType, amount)
        return None

class LogoutUserCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):              
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        Log.debug("CommandPlugin: LogoutUserCommand start"); 
        if checkGMAccess(playerOid) == False:
            return None
        Log.debug("CommandPlugin: LogoutUserCommand I"); 
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        spaceLoc = cmd.find(" ")
        if targetOid == playerOid and len(splitCmd) == 1:
            return None
        Log.debug("CommandPlugin: LogoutUserCommand II"); 
        username = cmd[spaceLoc+1:]  
        Log.debug("CommandPlugin: LogoutUserCommand: username=" + username)
        if len(username) > 0:
            r = AgisProxyPlugin.logoutPlayer(username)
            if r==True:
                ChatClient.sendObjChatMsg(playerOid, 0, "User: " + username + " has been kicked.")
        else:
            r = AgisProxyPlugin.logoutPlayer(targetOid)
            if r==True:
                ChatClient.sendObjChatMsg(playerOid, 0, "User: " +str( targetOid) + " has been kicked.")
        Log.debug("CommandPlugin: LogoutUserCommand: username=" + username+" END")

class BanUserCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):              
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        if checkGMAccess(playerOid) == False:
            return None
        if targetOid == playerOid:
            return None
        cmd = cmdEvent.getCommand()
        spaceLoc = cmd.find(" ")
        AgisProxyPlugin.banUser(targetOid)
        r = AgisProxyPlugin.logoutPlayer(targetOid)
        if r==True:
           ChatClient.sendObjChatMsg(playerOid, 0, "User: " + str( targetOid) + " has been kicked and baned.")

class BanUserByNameCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):              
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        spaceLoc = cmd.find(" ")
#        duration = int(splitCmd[1])
        username = str(splitCmd[1])
        AgisProxyPlugin.banUser(username)
        r = AgisProxyPlugin.logoutPlayer(username)
        if r==True:
           ChatClient.sendObjChatMsg(playerOid, 0, "User: " + username + " has been kicked and baned.")

class UnbanUserCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        spaceLoc = cmd.find(" ")
        username = cmd[spaceLoc+1:]
        AgisProxyPlugin.removeUserFromBanList(username)
        ChatClient.sendObjChatMsg(playerOid, 0, "User: " + username + " is no longer banned.")


class GMCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        if checkGMAccess(playerOid) == False:
            return None
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        gmState = int(splitCmd[1])
        if gmState == 0:
            EnginePlugin.setObjectProperty(playerOid, CombatClient.NAMESPACE, "attackable", Boolean(True))
            EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "gm", Boolean(False))
            ChatClient.sendObjChatMsg(playerOid, 0, "GM Mode deactivated, you can now be attacked")
        else:
            EnginePlugin.setObjectProperty(playerOid, CombatClient.NAMESPACE, "attackable", Boolean(False))
            EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "gm", Boolean(True))
            ChatClient.sendObjChatMsg(playerOid, 0, "GM Mode activated, you can no longer be attacked")
        return None


class MoveDebugOnCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        if checkGMAccess(playerOid) == False:
            return None
        if targetOid == playerOid:
            return None
        Log.error("/moveDebugOn: ")
        Log.error("/moveDebugOn: plyOid=" + str(playerOid)+" tarOid=" + str(targetOid))
        cmd = BaseBehavior.MSG_CMD_TYPE_MOVE_DEBUG_ON + str(playerOid)
        Log.error("/moveDebugOn: "+cmd)
        Behavior.SendCommand(targetOid, cmd)
        return None

class MoveDebugOffCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        if checkGMAccess(playerOid) == False:
            return None
        if targetOid == playerOid:
            return None
        Log.error("/moveDebugOff: plyOid=" + str(playerOid)+" tarOid=" + str(targetOid))
        cmd = BaseBehavior.MSG_CMD_TYPE_MOVE_DEBUG_OFF + str(playerOid)
        Log.error("/moveDebugOff: "+cmd)
        Behavior.SendCommand(targetOid, cmd)
        return None

proxyPlugin.registerCommand("/fly", FlyCommand())
proxyPlugin.registerCommand("/getSkillPoints", GainSkillPointsCommand())
proxyPlugin.registerCommand("/getSkillCurrent", GainSkillCurrentCommand())
proxyPlugin.registerCommand("/getExp", GainExpCommand())
proxyPlugin.registerCommand("/changeInstance", InstanceChangeCommand())
proxyPlugin.registerCommand("/ci", InstanceChangeCommand())
proxyPlugin.registerCommand("/generateItem", GenerateItemCommand())
proxyPlugin.registerCommand("/gi", GenerateItemCommand())
proxyPlugin.registerCommand("/getCurrency", GainCurrencyCommand())
proxyPlugin.registerCommand("/kick", LogoutUserCommand())
proxyPlugin.registerCommand("/ban", BanUserCommand())
proxyPlugin.registerCommand("/banUserName", BanUserByNameCommand())
proxyPlugin.registerCommand("/unban", UnbanUserCommand())
proxyPlugin.registerCommand("/gm", GMCommand())

proxyPlugin.registerCommand("/moveDebugOn", MoveDebugOnCommand())
proxyPlugin.registerCommand("/moveDebugOff", MoveDebugOffCommand())


###
# Player/General Commands
###
class SkillIncreaseCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        Log.debug("SKILL: skill increase command; oid = " + str(oid))
        splitCmd = cmd.split(" ")
        skill = int(splitCmd[1])
        skillBoost = 1
        if len(splitCmd) > 2:
            skillBoost = int(splitCmd[2])
        for i in range(0, skillBoost):
          ClassAbilityClient.skillIncreased(oid, skill)

class SkillDecreaseCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        Log.debug("SKILL: skill decrease command; oid = " + str(oid))
        splitCmd = cmd.split(" ")
        skill = int(splitCmd[1])
        ClassAbilityClient.skillDecreased(oid, skill)

class SkillResetCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        Log.debug("SKILL: skill reset command; oid = " + str(oid))
        ClassAbilityClient.skillReset(oid)

class QuestResponseCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        questID = OID.fromString(splitCmd[1])
        acceptStatus = int(splitCmd[2])
        if acceptStatus == 0:
            QERmsg = QuestClient.QuestResponseMessage(targetOid, playerOid, questID, False)
        else:
            QERmsg = QuestClient.QuestResponseMessage(targetOid, playerOid, questID, True)
        Engine.getAgent().sendBroadcast(QERmsg)
        return None

class RequestQuestProgressCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        QERmsg = QuestClient.RequestQuestProgressMessage(targetOid, playerOid)
        Engine.getAgent().sendBroadcast(QERmsg)
        return None
        
class GetMerchantListCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        AgisInventoryClient.getMerchantList(playerOid, targetOid)
        return None

class AbandonQuestCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        questID = OID.fromString(splitCmd[1])
        Log.debug("AbandonQuest hit with oid: " + str(splitCmd[1]) + " and id: " + str(questID))
        QERmsg = QuestClient.AbandonQuestMessage(playerOid, questID)
        Engine.getAgent().sendBroadcast(QERmsg)
        return None

class PlayAnimationCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        animation = splitCmd[1]
        effect = CoordinatedEffect("PlayAnimation")
        effect.putArgument("animName", animation)
        effect.sendSourceOid(True)
        effect.invoke(playerOid, playerOid);
        return None
        
class GetNpcInteractionsCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        AgisMobClient.getNpcInteractions(targetOid, playerOid)
        return None
        
class StartNpcInteractionCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        interactionID = int(splitCmd[1])
        interactionType = splitCmd[2]
        AgisMobClient.startNpcInteraction(targetOid, playerOid, interactionID, interactionType)
        return None
        
class DialogueOptionChosenCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        dialogueID = int(splitCmd[1])
        interactionType = splitCmd[2]
        actionID = int(splitCmd[3])
        AgisMobClient.chooseDialogueOption(targetOid, playerOid, dialogueID, actionID, interactionType)
        return None
        
class CompleteQuestCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        questID = OID.fromString(splitCmd[1])
        itemChosen = int(splitCmd[2])
        QuestClient.completeQuest(targetOid, playerOid, questID, itemChosen)
        return None

class OpenMobCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        AgisInventoryClient.requestOpenMob(targetOid, playerOid)
        return None

class StopAutoAttackCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        Log.debug("AUTOATTACK: stopping auto attack for: " + str(oid))
        CombatClient.stopAutoAttack(oid)

class HardwareInfoCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        splitCmd = cmd.split(";")
        deviceName = splitCmd[1]
        driverVersion = splitCmd[2]
        videoMemory = splitCmd[3]
        systemMemory = splitCmd[4]
        fragmentVersion = splitCmd[5]
        vertexVersion = splitCmd[6]
        maxLights = splitCmd[7]
        textureUnits = splitCmd[8]
        windowSizeX = splitCmd[9]
        windowSizeY = splitCmd[10]
        # Write data to a file
        filename = "../compData/compData_" + str(oid) + ".txt"
        try:
            dataFile = open(filename,"r+")
        except IOError:
            dataFile = open(filename,"w")
        dataFile.readlines()
        dataFile.write("Video card: " + deviceName + "\n")
        dataFile.write("Driver version: " + driverVersion  + "\n")
        dataFile.write("Video card memory: " + videoMemory  + "\n")
        dataFile.write("System memory: " + systemMemory  + "\n")
        dataFile.write("Fragment shader version: " + fragmentVersion  + "\n")
        dataFile.write("Vertex shader version: " + vertexVersion  + "\n")
        dataFile.write("Max lights: " + maxLights  + "\n")
        dataFile.write("Texture units: " + textureUnits  + "\n")
        dataFile.write("Window size width: " + windowSizeX + "; height: " + windowSizeY + "\n")
        dataFile.write("----------"  + "\n")
        dataFile.close()
        # Write a few empty lines to the performanceData file 
        filename = "../compData/performanceData_" + str(oid) + ".csv"
        try:
            dataFile2 = open(filename,"r+")
        except IOError:
            dataFile2 = open(filename,"w")
        dataFile2.readlines()
        dataFile2.write(",,,\n")
        dataFile2.close()

class PerformanceInfoCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        splitCmd = cmd.split(" ")
        framerate = splitCmd[1]
        renders = splitCmd[2]
        bytesRecieved = splitCmd[3]
        bytesSent = splitCmd[4]
        # Write data to a file
        filename = "../compData/performanceData_" + str(oid) + ".csv"
        try:
            dataFile = open(filename,"r+")
        except IOError:
            dataFile = open(filename,"w")
        dataFile.readlines()
        dataFile.write(framerate + ",")
        dataFile.write(renders  + ",")
        dataFile.write(bytesRecieved  + ",")
        dataFile.write(bytesSent  + "\n")
        dataFile.close()

class BugReportCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        cmd = cmdEvent.getCommand()
        oid = cmdEvent.getObjectOid()
        splitCmd = cmd.split(" ")
        bugType = splitCmd[1]
        whatHappened = splitCmd[2]
        whatShouldHappen = splitCmd[3]
        howToReproduce = splitCmd[4]
        # Write data to a file
        filename = "../bugReports/report_" + str(oid) + ".txt"
        try:
            dataFile = open(filename,"r+")
        except IOError:
            dataFile = open(filename,"w")
        dataFile.readlines()
        dataFile.write("===Bug Report=== \n")
        dataFile.write("Bug Type: " + bugType + "\n")
        dataFile.write("What Happened: " + whatHappened + "\n")
        dataFile.write("What should happen: " + whatShouldHappen + "\n")
        dataFile.write("How to reproduce: " + howToReproduce + "\n")
        dataFile.close()

class DuelCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        ArenaClient.duelChallenge(playerOid, targetOid)
        return None

class DuelAcceptCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        ArenaClient.duelChallengeAccept(playerOid)
        return None

class DuelDeclineCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        ArenaClient.duelChallengeDecline(playerOid)
        return None

class GetAttitudeCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        CombatClient.getAttitude(playerOid, targetOid)
        return None

class InvitePlayerToGroupCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        args = cmd.split(None, 2)
        if len(args) <2:
            return None
        targetName = args[1]
        if args[1].startswith('"',0,1):
            args2 = cmd.split('"', 2)
            targetName = args2[1]
            m = args2[2]
        GroupClient.groupInviteByName(playerOid, targetName)

class LeaveArenaCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        ArenaClient.removePlayer(playerOid)
        return None

class DeleteItemStackCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        itemOid = OID.fromString(splitCmd[1])
        AgisInventoryClient.removeSpecificItem(playerOid, itemOid, True, 0)
        
class DeleteItemCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        itemOid = OID.fromString(splitCmd[1])
        AgisInventoryClient.removeSpecificItem(playerOid, itemOid, False, 1)

class GetItemInfoCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        itemOid = OID.fromString(splitCmd[1])
        itemOids = ArrayList()
        for i in range(0, len(splitCmd)):
            itemOids.add(splitCmd[i])
        AgisInventoryClient.getSpecificItemData(playerOid, targetOid, itemOid)

class PlaceBagCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("PLACEBAG: splitCMD[1]=" + splitCmd[1] + "; splitCMD[2]=" + splitCmd[2])
        itemOid = OID.fromString(splitCmd[1]) 
        bagSpotNum = int(splitCmd[2])
        AgisInventoryClient.placeBag(playerOid, itemOid, bagSpotNum)

class MoveBagCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("MOVEBAG: splitCMD[1]=" + splitCmd[1] + "; splitCMD[2]=" + splitCmd[2])
        bagSpotNum = int(splitCmd[1])
        newSpotNum = int(splitCmd[2])
        AgisInventoryClient.moveBag(playerOid, bagSpotNum, newSpotNum)

class RemoveBagCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("REMOVEBAG: splitCMD[1]=" + splitCmd[1] + "; splitCMD[2]=" + splitCmd[2])
        bagSpotNum = int(splitCmd[1]) 
        containerId = int(splitCmd[2])
        slotId = int(splitCmd[3])
        AgisInventoryClient.removeBag(playerOid, bagSpotNum, containerId, slotId)

class GetLootListCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        AgisInventoryClient.getLootList(playerOid, targetOid)
        return None

class LootItemCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("LOOT: splitCMD[1]=" + splitCmd[1])
        itemOid = OID.fromString(splitCmd[1])
        AgisInventoryClient.lootItem(playerOid, itemOid, targetOid)

class LootAllCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        Log.debug("LOOTALL: Proxy " +str(playerOid)+" "+str(targetOid))
        AgisInventoryClient.lootAll(playerOid, targetOid)

class UpdateActionBarCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("LOOT: splitCMD[1]=" + splitCmd[1])
        actionPosition = int(splitCmd[1])
        newAction = splitCmd[2]
        CombatClient.updateActionBar(playerOid, actionPosition, newAction)

class PurchaseItemCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("SELL: splitCMD[1]=" + splitCmd[1])
        itemID = int(splitCmd[1])
        count = int(splitCmd[2])
        AgisInventoryClient.purchaseItemFromMerchant(playerOid, targetOid, itemID, count)

class SellItemCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("SELL: splitCMD[1]=" + splitCmd[1])
        itemOid = OID.fromString(splitCmd[1])
        AgisInventoryClient.sellItem(playerOid, targetOid, itemOid)

class SendCommandToPetCommand(ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        targetOid = cmdEvent.getTarget()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("PET: splitCMD[1]=" + splitCmd[1])
        command = splitCmd[1]
        AgisMobClient.sendPetCommand(playerOid, targetOid, command)

class GetArenaStatsCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("SELL: splitCMD[1]=" + splitCmd[1])
        statsType = int(splitCmd[1])
        ArenaClient.getArenaStats(playerOid, statsType)
        return None

class SetIntPropertyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
	return None
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        propertyName = splitCmd[1]
        propertyValue = int(splitCmd[2])
        EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, propertyName, propertyValue)
        return None

class SetStringPropertyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        return None
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        propertyName = splitCmd[1]
        propertyValue = splitCmd[2]
        EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, propertyName, propertyValue)
        return None

class UpdateBreathCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        Log.debug("BREATH: splitCMD[1]=" + splitCmd[1])
        underwater = int(splitCmd[1])
        CombatClient.updateBreathStatus(playerOid, underwater)
        return None
        
class GetIslandsCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        AgisMobClient.getIslandsData(playerOid)
        return None
        
class SetJumpPropertyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        propertyValue = Boolean(splitCmd[1])
        EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "jump", propertyValue)
        return None
        
class AddFriendCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        recipient = splitCmd[1]
        if splitCmd[1].startswith('"',0,1):
            args2 = cmd.split('"')
            recipient = args2[1]
        props = HashMap()
        props.put("playerOid", playerOid)
        props.put("friend", recipient)
        eMsg = WorldManagerClient.ExtensionMessage(GroupClient.MSG_TYPE_ADD_FRIEND, playerOid, props)
        Engine.getAgent().sendBroadcast(eMsg)
        return None
        
class SetArenaDifficultyCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        propertyValue = int(splitCmd[1])
        EnginePlugin.setObjectProperty(playerOid, WorldManagerClient.NAMESPACE, "arenaDifficulty", propertyValue)
        return None
        
class ReloadItemsCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        props = HashMap()
        eMsg = WorldManagerClient.ExtensionMessage(AgisInventoryClient.MSG_TYPE_RELOAD_ITEMS, playerOid, props)
        Engine.getAgent().sendBroadcast(eMsg)
        return None       
        
proxyPlugin.registerCommand("/wave", WaveCommand())
proxyPlugin.registerCommand("/bow", BowCommand())
proxyPlugin.registerCommand("/clap", ClapCommand())
proxyPlugin.registerCommand("/cry", CryCommand())
proxyPlugin.registerCommand("/laugh", LaughCommand())
proxyPlugin.registerCommand("/cheer", CheerCommand())
proxyPlugin.registerCommand("/no", NoCommand())
proxyPlugin.registerCommand("/point", PointCommand())
proxyPlugin.registerCommand("/shrug", ShrugCommand())
proxyPlugin.registerCommand("/salute", SaluteCommand())
proxyPlugin.registerCommand("/talk", TalkCommand())
proxyPlugin.registerCommand("/raiseHand", RaiseHandCommand())
proxyPlugin.registerCommand("/schedule", ScheduleCommand())
proxyPlugin.registerCommand("/skillIncrease", SkillIncreaseCommand())
proxyPlugin.registerCommand("/skillDecrease", SkillDecreaseCommand())
proxyPlugin.registerCommand("/skillReset", SkillResetCommand())
proxyPlugin.registerCommand("/questResponse", QuestResponseCommand())
#proxyPlugin.registerCommand("/requestQuestProgress", RequestQuestProgressCommand())
proxyPlugin.registerCommand("/requestNPCInteractions", RequestQuestProgressCommand())
proxyPlugin.registerCommand("/getMerchantList", GetMerchantListCommand())
proxyPlugin.registerCommand("/purchaseItem", PurchaseItemCommand())
proxyPlugin.registerCommand("/abandonQuest", AbandonQuestCommand())
proxyPlugin.registerCommand("/playAnimation", PlayAnimationCommand())
proxyPlugin.registerCommand("/getNpcInteractions", GetNpcInteractionsCommand())
proxyPlugin.registerCommand("/startInteraction", StartNpcInteractionCommand())
proxyPlugin.registerCommand("/dialogueOption", DialogueOptionChosenCommand())
proxyPlugin.registerCommand("/completeQuest", CompleteQuestCommand())
proxyPlugin.registerCommand("/openMob", OpenMobCommand())
proxyPlugin.registerCommand("/stopAttack", StopAutoAttackCommand())
proxyPlugin.registerCommand("/hardwareInfo", HardwareInfoCommand())
proxyPlugin.registerCommand("/performanceInfo", PerformanceInfoCommand())
proxyPlugin.registerCommand("/bugReport", BugReportCommand())
proxyPlugin.registerCommand("/duel", DuelCommand())
proxyPlugin.registerCommand("/duelAccept", DuelAcceptCommand())
proxyPlugin.registerCommand("/duelDecline", DuelDeclineCommand())
proxyPlugin.registerCommand("/getAttitude", GetAttitudeCommand())
proxyPlugin.registerCommand("/invite", InvitePlayerToGroupCommand())
proxyPlugin.registerCommand("/leaveArena", LeaveArenaCommand())
proxyPlugin.registerCommand("/deleteItemStack", DeleteItemStackCommand())
proxyPlugin.registerCommand("/deleteItem", DeleteItemCommand())
proxyPlugin.registerCommand("/getSpecificItemData", GetItemInfoCommand())
proxyPlugin.registerCommand("/placeBag", PlaceBagCommand())
proxyPlugin.registerCommand("/moveBag", MoveBagCommand())
proxyPlugin.registerCommand("/removeBag", RemoveBagCommand())
proxyPlugin.registerCommand("/getLootList", GetLootListCommand())
proxyPlugin.registerCommand("/lootItem", LootItemCommand())
proxyPlugin.registerCommand("/lootAll", LootAllCommand())
proxyPlugin.registerCommand("/updateActionBar", UpdateActionBarCommand())
proxyPlugin.registerCommand("/sellItem", SellItemCommand())
proxyPlugin.registerCommand("/petCommand", SendCommandToPetCommand())
proxyPlugin.registerCommand("/getArenaStats", GetArenaStatsCommand())
proxyPlugin.registerCommand("/setIntProperty", SetIntPropertyCommand())
proxyPlugin.registerCommand("/setStringProperty", SetStringPropertyCommand())
proxyPlugin.registerCommand("/updateBreath", UpdateBreathCommand())
proxyPlugin.registerCommand("/getIslands", GetIslandsCommand())
proxyPlugin.registerCommand("/jump", SetJumpPropertyCommand())
proxyPlugin.registerCommand("/addFriend", AddFriendCommand())
proxyPlugin.registerCommand("/arenaDifficulty", SetArenaDifficultyCommand())
proxyPlugin.registerCommand("/reloadItems", ReloadItemsCommand())

###
# World Builder Commands
###
class GetMobTemplatesCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        AgisMobClient.getMobTemplates(playerOid)
        return None

class GetQuestTemplatesCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        AgisMobClient.getQuestTemplates(playerOid)
        return None

class CreateMobSpawnCommand (ProxyPlugin.CommandParser):
    def parse(self, cmdEvent):
        playerOid = cmdEvent.getObjectOid()
        cmd = cmdEvent.getCommand()
        splitCmd = cmd.split(" ")
        mobTemplate = str(splitCmd[1])
        roamRadius = int(splitCmd[2])
        Log.debug("Create spawn message: " + mobTemplate + ", radius: " + str(roamRadius))
        AgisMobClient.createMobSpawn(playerOid, mobTemplate, roamRadius)
        return None
        
proxyPlugin.registerCommand("/getMobTemplates", GetMobTemplatesCommand())
proxyPlugin.registerCommand("/getQuestTemplates", GetQuestTemplatesCommand())
proxyPlugin.registerCommand("/createMobSpawn", CreateMobSpawnCommand())  

proxyPlugin.registerExtensionSubtype("server.Shutdown", ProxyPlugin.MSG_TYPE_SERVER_SHUTDOWN)
proxyPlugin.registerExtensionSubtype("server.Reload", ProxyPlugin.MSG_TYPE_SERVER_RELOAD)

proxyPlugin.addProxyExtensionHook("proxy.INSTANCE_ENTRY", InstanceEntryProxyHook())
proxyPlugin.addProxyExtensionHook("proxy.GENERATE_OBJECT", GenerateObjectProxyHook())

proxyPlugin.registerExtensionSubtype("ao.GET_ALL_VIP", BonusClient.MSG_TYPE_GET_ALL_VIP)
proxyPlugin.registerExtensionSubtype("ao.GET_VIP", BonusClient.MSG_TYPE_GET_VIP)
proxyPlugin.registerExtensionSubtype("ao.GET_ACHIEVEMENTS", AchievementsClient.MSG_TYPE_GET_ACHIEVEMENTS)
proxyPlugin.registerExtensionSubtype("ao.SET_ACHIEVEMENTS_TITLE", AchievementsClient.MSG_TYPE_SET_ACHIEVEMENTS_TITLE)
proxyPlugin.registerExtensionSubtype("ao.GET_RANKING", RankingClient.MSG_TYPE_GET_RANKING)
proxyPlugin.registerExtensionSubtype("ao.GET_RANKING_LIST", RankingClient.MSG_TYPE_GET_RANKING_LIST)

proxyPlugin.registerExtensionSubtype("combat.PURCHASE_SKILL_POINT", ClassAbilityClient.MSG_TYPE_PURCHASE_SKILL_POINT)
proxyPlugin.registerExtensionSubtype("ao.COMPLETE_QUEST", QuestClient.MSG_TYPE_COMPLETE_QUEST)
proxyPlugin.registerExtensionSubtype("ao.DISMOUNT", CombatClient.MSG_TYPE_DISMOUNT)
proxyPlugin.registerExtensionSubtype("ao.REMOVE_BUFF", CombatClient.MSG_TYPE_REMOVE_BUFF)
proxyPlugin.registerExtensionSubtype("combat.SET_SKILL_STATE", ClassAbilityClient.MSG_TYPE_SET_SKILL_STATE)
proxyPlugin.registerExtensionSubtype("combat.UPDATE_ACTIONBAR", CombatClient.MSG_TYPE_UPDATE_ACTIONBAR)
proxyPlugin.registerExtensionSubtype("ao.FALLING_EVENT", CombatClient.MSG_TYPE_FALLING_EVENT)
proxyPlugin.registerExtensionSubtype("ao.CLIENT_LEVEL_LOADED", CombatClient.MSG_CLIENT_LEVEL_LOADED)
# Inventory Client
proxyPlugin.registerExtensionSubtype("inventory.LOOT_ROLL", AgisInventoryClient.MSG_TYPE_LOOT_ROLL)

#proxyPlugin.registerExtensionSubtype("ao.GET_ICON", AgisInventoryClient.MSG_TYPE_GET_ICON)
#proxyPlugin.registerExtensionSubtype("ao.GET_CURR_ICON", AgisInventoryClient.MSG_TYPE_GET_CURR_ICON)
#proxyPlugin.registerExtensionSubtype("ao.GET_SKILL_ICON", AgisInventoryClient.MSG_TYPE_GET_SKILL_ICON)
#pproxyPlugin.registerExtensionSubtype("ao.GET_ABILITY_ICON", AgisInventoryClient.MSG_TYPE_GET_ABILITY_ICON)
#proxyPlugin.registerExtensionSubtype("ao.GET_EFFECT_ICON", AgisInventoryClient.MSG_TYPE_GET_EFFECT_ICON)
#proxyPlugin.registerExtensionSubtype("ao.GET_BUILD_OBJ_ICON", AgisInventoryClient.MSG_TYPE_GET_BUILD_OBJ_ICON)
#proxyPlugin.registerExtensionSubtype("ao.GET_CRAFTING_RECIPE_ICON", AgisInventoryClient.MSG_TYPE_GET_CRAFTING_RECIPE_ICON)

#proxyPlugin.registerExtensionSubtype("ao.ITEM_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_ITEM_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.ISET_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_SETS_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.SKILL_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_SKILL_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.CURR_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_CURRENCY_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.CRAFT_RECIPE_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_CRAFTING_RECIPE_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.BUILD_OBJ_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_BUILD_OBJ_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.ABILITY_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_ABILITY_PREFAB_DATA)
#proxyPlugin.registerExtensionSubtype("ao.EFFECT_PREFAB_DATA", AgisInventoryClient.MSG_TYPE_EFFECT_PREFAB_DATA)



proxyPlugin.registerExtensionSubtype("inventory.DROP_ITEM_GROUND", AgisInventoryClient.MSG_TYPE_DROP_GROUND_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.LOOT_GROUND", AgisInventoryClient.MSG_TYPE_LOOT_GROUND_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.LOOT_ALL_F", AgisInventoryClient.MSG_TYPE_LOOT_ALL_F)
#proxyPlugin.registerExtensionSubtype("rep.GET_ICON", AgisInventoryClient.MSG_TYPE_GET_ICON)
proxyPlugin.registerExtensionSubtype("inventory.ENCHANTING_DETAIL", AgisInventoryClient.MSG_TYPE_ENCHANTING_DETAIL)
proxyPlugin.registerExtensionSubtype("inventory.ENCHANT", AgisInventoryClient.MSG_TYPE_ENCHANT)
proxyPlugin.registerExtensionSubtype("inventory.SOCKETING_RESET", AgisInventoryClient.MSG_TYPE_SOCKETING_RESET)
proxyPlugin.registerExtensionSubtype("inventory.SOCKETING_RESET_DETAIL", AgisInventoryClient.MSG_TYPE_SOCKETING_RESET_DETAIL)
proxyPlugin.registerExtensionSubtype("inventory.INSERT_TO_SOCKET", AgisInventoryClient.MSG_TYPE_INSERT_TO_SOCKET)
proxyPlugin.registerExtensionSubtype("inventory.SOCKETING_DETAIL", AgisInventoryClient.MSG_TYPE_SOCKETING_DETAIL)
proxyPlugin.registerExtensionSubtype("inventory.MOVE_ITEM", AgisInventoryClient.MSG_TYPE_MOVE_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.PURCHASE_ITEM", AgisInventoryClient.MSG_TYPE_PURCHASE_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.SELL_ITEM", AgisInventoryClient.MSG_TYPE_SELL_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.GET_MERCHANT_LIST", AgisInventoryClient.MSG_TYPE_GET_MERCHANT_LIST)
proxyPlugin.registerExtensionSubtype("ao.SET_WEAPON", AgisInventoryClient.MSG_TYPE_SET_WEAPON)
proxyPlugin.registerExtensionSubtype("ao.PURCHASE_SKIN", AgisInventoryClient.MSG_TYPE_PURCHASE_SKIN)
proxyPlugin.registerExtensionSubtype("ao.USE_ACCOUNT_ITEM", AgisInventoryClient.MSG_TYPE_USE_ACCOUNT_ITEM)
proxyPlugin.registerExtensionSubtype("ao.SET_SKIN_COLOUR", AgisInventoryClient.MSG_TYPE_SET_SKIN_COLOUR)
proxyPlugin.registerExtensionSubtype("ao.ALTER_ITEM_COUNT", AgisInventoryClient.MSG_TYPE_ALTER_ITEM_COUNT)
proxyPlugin.registerExtensionSubtype("inventory.GET_MAIL", AgisInventoryClient.MSG_TYPE_GET_MAIL)
proxyPlugin.registerExtensionSubtype("inventory.MAIL_READ", AgisInventoryClient.MSG_TYPE_MAIL_READ)
proxyPlugin.registerExtensionSubtype("inventory.MAIL_TAKE_ITEM", AgisInventoryClient.MSG_TYPE_MAIL_TAKE_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.RETURN_MAIL", AgisInventoryClient.MSG_TYPE_RETURN_MAIL)
proxyPlugin.registerExtensionSubtype("inventory.DELETE_MAIL", AgisInventoryClient.MSG_TYPE_DELETE_MAIL)
proxyPlugin.registerExtensionSubtype("inventory.SEND_MAIL", AgisInventoryClient.MSG_TYPE_SEND_MAIL)
proxyPlugin.registerExtensionSubtype("ao.REPAIR_ITEMS", AgisInventoryClient.MSG_TYPE_REPAIR_ITEMS)
proxyPlugin.registerExtensionSubtype("ao.GET_BANK_ITEMS", AgisInventoryClient.MSG_TYPE_GET_BANK_ITEMS)
proxyPlugin.registerExtensionSubtype("ao.STORE_ITEM_IN_BANK", AgisInventoryClient.MSG_TYPE_STORE_ITEM_IN_BANK)
proxyPlugin.registerExtensionSubtype("ao.RETRIEVE_ITEM_FROM_BANK", AgisInventoryClient.MSG_TYPE_RETRIEVE_ITEM_FROM_BANK)
proxyPlugin.registerExtensionSubtype("ao.EQUIP_ITEM_IN_SLOT", AgisInventoryClient.MSG_TYPE_EQUIP_ITEM_IN_SLOT)
proxyPlugin.registerExtensionSubtype("inventory.PURCHASE_STORE_ITEM", AgisInventoryClient.MSG_TYPE_PURCHASE_STORE_ITEM)
proxyPlugin.registerExtensionSubtype("inventory.openPlayerShop", AgisInventoryClient.MSG_TYPE_OPEN_PLAYER_SHOP)
proxyPlugin.registerExtensionSubtype("ao.PLAYER_SHOP_BUY",  AgisInventoryClient.MSG_TYPE_PLAYER_SHOP_BUY)
# Mob Client
proxyPlugin.registerExtensionSubtype("ao.CREATE_QUEST", AgisMobClient.MSG_TYPE_CREATE_QUEST)
proxyPlugin.registerExtensionSubtype("ao.EDIT_QUEST", AgisMobClient.MSG_TYPE_EDIT_QUEST)
proxyPlugin.registerExtensionSubtype("mob.CREATE_MOB_SPAWN", AgisMobClient.MSG_TYPE_CREATE_MOB_SPAWN)
proxyPlugin.registerExtensionSubtype("ao.VERIFY_ISLAND_ACCESS", AgisMobClient.MSG_TYPE_VERIFY_ISLAND_ACCESS)
proxyPlugin.registerExtensionSubtype("ao.ENTER_WORLD", AgisMobClient.MSG_TYPE_ENTER_WORLD)
proxyPlugin.registerExtensionSubtype("ao.REQUEST_DEVELOPER_ACCESS", AgisMobClient.MSG_TYPE_REQUEST_DEVELOPER_ACCESS)
proxyPlugin.registerExtensionSubtype("ao.CREATE_ISLAND", AgisMobClient.MSG_TYPE_CREATE_ISLAND)
proxyPlugin.registerExtensionSubtype("ao.VIEW_MARKERS", AgisMobClient.MSG_TYPE_VIEW_MARKERS)
proxyPlugin.registerExtensionSubtype("ao.REQUEST_SPAWN_DATA", AgisMobClient.MSG_TYPE_REQUEST_SPAWN_DATA)
proxyPlugin.registerExtensionSubtype("ao.EDIT_SPAWN_MARKER", AgisMobClient.MSG_TYPE_EDIT_SPAWN_MARKER)
proxyPlugin.registerExtensionSubtype("ao.DELETE_SPAWN_MARKER", AgisMobClient.MSG_TYPE_DELETE_SPAWN_MARKER)
proxyPlugin.registerExtensionSubtype("mob.GET_TEMPLATES", AgisMobClient.MSG_TYPE_GET_TEMPLATES)
proxyPlugin.registerExtensionSubtype("ao.CREATE_MOB", AgisMobClient.MSG_TYPE_CREATE_MOB)
proxyPlugin.registerExtensionSubtype("ao.EDIT_MOB", AgisMobClient.MSG_TYPE_EDIT_MOB)
proxyPlugin.registerExtensionSubtype("ao.CREATE_FACTION", AgisMobClient.MSG_TYPE_CREATE_FACTION)
proxyPlugin.registerExtensionSubtype("ao.EDIT_FACTION", AgisMobClient.MSG_TYPE_EDIT_FACTION)
proxyPlugin.registerExtensionSubtype("ao.CREATE_LOOT_TABLE", AgisMobClient.MSG_TYPE_CREATE_LOOT_TABLE)
proxyPlugin.registerExtensionSubtype("ao.DOME_ENQUIRY", AgisMobClient.MSG_TYPE_DOME_ENQUIRY)
proxyPlugin.registerExtensionSubtype("ao.DOME_ENTRY_REQUEST", AgisMobClient.MSG_TYPE_DOME_ENTRY_REQUEST)
proxyPlugin.registerExtensionSubtype("ao.DOME_LEAVE_REQUEST", AgisMobClient.MSG_TYPE_DOME_LEAVE_REQUEST)
proxyPlugin.registerExtensionSubtype("ao.ACTIVATE_DOME_ABILITY", AgisMobClient.MSG_TYPE_ACTIVATE_DOME_ABILITY)
proxyPlugin.registerExtensionSubtype("ao.OBJECT_ACTIVATED", AgisMobClient.MSG_TYPE_OBJECT_ACTIVATED)
proxyPlugin.registerExtensionSubtype("ao.DETECT_BUILDING_GRIDS", AgisMobClient.MSG_TYPE_DETECT_BUILDING_GRIDS)
proxyPlugin.registerExtensionSubtype("ao.GET_BUILDING_GRID_DATA", AgisMobClient.MSG_TYPE_GET_BUILDING_GRID_DATA)
proxyPlugin.registerExtensionSubtype("ao.PURCHASE_BUILDING_GRID", AgisMobClient.MSG_TYPE_PURCHASE_BUILDING_GRID)
proxyPlugin.registerExtensionSubtype("ao.CREATE_BUILDING", AgisMobClient.MSG_TYPE_CREATE_BUILDING)
proxyPlugin.registerExtensionSubtype("ao.USE_TRAP_DOOR", AgisMobClient.MSG_TYPE_USE_TRAP_DOOR)
proxyPlugin.registerExtensionSubtype("ao.HARVEST_RESOURCE_GRID", AgisMobClient.MSG_TYPE_HARVEST_RESOURCE_GRID)
proxyPlugin.registerExtensionSubtype("ao.SET_BLOCK", AgisMobClient.MSG_TYPE_SET_BLOCK)
proxyPlugin.registerExtensionSubtype("ao.GET_INTERACTION_OPTIONS", AgisMobClient.MSG_TYPE_GET_INTERACTION_OPTIONS)
proxyPlugin.registerExtensionSubtype("ao.MSG_TYPE_START_DIALOGUE", AgisMobClient.MSG_TYPE_START_DIALOGUE)
proxyPlugin.registerExtensionSubtype("ao.PLAY_COORD_EFFECT", AgisMobClient.MSG_TYPE_PLAY_COORD_EFFECT)
proxyPlugin.registerExtensionSubtype("ao.INTERACT_WITH_OBJECT", AgisMobClient.MSG_TYPE_INTERACT_WITH_OBJECT)
proxyPlugin.registerExtensionSubtype("ao.ADD_NM_OBJECT", AgisMobClient.MSG_TYPE_ADD_NM_OBJECT)
proxyPlugin.registerExtensionSubtype("ao.DEBUG_NM", AgisMobClient.MSG_TYPE_DEBUG_NM)
# Group Client
proxyPlugin.registerExtensionSubtype("ao.GROUP_LEAVE", GroupClient.MSG_TYPE_GROUP_LEAVE)
proxyPlugin.registerExtensionSubtype("ao.GROUP_SETTINGS", GroupClient.MSG_TYPE_GROUP_SETTINGS)
#proxyPlugin.registerExtensionSubtype("ao.GET_FRIENDS", GroupClient.MSG_TYPE_GET_FRIENDS)
#proxyPlugin.registerExtensionSubtype("ao.ADD_FRIEND", GroupClient.MSG_TYPE_ADD_FRIEND)
#Arena Client
proxyPlugin.registerExtensionSubtype("arena.leaveArena", ArenaClient.MSG_TYPE_LEAVE_ARENA)
proxyPlugin.registerExtensionSubtype("ao.ACTIVATE_ARENA_ABILITY", ArenaClient.MSG_TYPE_ACTIVATE_ARENA_ABILITY)
proxyPlugin.registerExtensionSubtype("ao.COMPLETE_TUTORIAL", ArenaClient.MSG_TYPE_COMPLETE_TUTORIAL)
proxyPlugin.registerExtensionSubtype("ao.CHANGE_RACE", ArenaClient.MSG_TYPE_CHANGE_RACE)
proxyPlugin.registerExtensionSubtype("arena.getTypes", ArenaClient.MSG_TYPE_GET_ARENA_TYPES)
proxyPlugin.registerExtensionSubtype("arena.joinQueue", ArenaClient.MSG_TYPE_JOIN_QUEUE)
proxyPlugin.registerExtensionSubtype("arena.getList", ArenaClient.MSG_TYPE_GET_ARENA_LIST)
proxyPlugin.registerExtensionSubtype("arena.groupJoinQueue", ArenaClient.MSG_TYPE_GROUP_JOIN_QUEUE)
proxyPlugin.registerExtensionSubtype("arena.leaveQueue", ArenaClient.MSG_TYPE_LEAVE_QUEUE)
proxyPlugin.registerExtensionSubtype("arena.groupLeaveQueue", ArenaClient.MSG_TYPE_GROUP_LEAVE_QUEUE)
proxyPlugin.registerExtensionSubtype("arena.pickupFlag", ArenaClient.MSG_TYPE_PICKUP_FLAG)
proxyPlugin.registerExtensionSubtype("arena.dropFlag", ArenaClient.MSG_TYPE_DROP_FLAG)
proxyPlugin.registerExtensionSubtype("arena.activateMachine", ArenaClient.MSG_TYPE_ACTIVATE_MACHINE)
proxyPlugin.registerExtensionSubtype("ao.SELECT_RACE", ArenaClient.MSG_TYPE_SELECT_RACE)
#Crafting Client
proxyPlugin.registerExtensionSubtype("crafting.HARVEST_RESOURCE", CraftingClient.MSG_TYPE_HARVEST_RESOURCE)
proxyPlugin.registerExtensionSubtype("crafting.GATHER_RESOURCE", CraftingClient.MSG_TYPE_GATHER_RESOURCE)
proxyPlugin.registerExtensionSubtype("crafting.CRAFT_ITEM", CraftingClient.MSG_TYPE_CRAFTING_CRAFT_ITEM)
proxyPlugin.registerExtensionSubtype("crafting.GRID_UPDATED", CraftingClient.MSG_TYPE_CRAFTING_GRID_UPDATED)
proxyPlugin.registerExtensionSubtype("crafting.GET_BLUEPRINTS", CraftingClient.MSG_TYPE_GET_BLUEPRINTS)
#Voxel Client
proxyPlugin.registerExtensionSubtype("voxel.CREATE_CLAIM", VoxelClient.MSG_TYPE_CREATE_CLAIM)
proxyPlugin.registerExtensionSubtype("voxel.UPGRADE_CLAIM", VoxelClient.MSG_TYPE_UPGRADE_CLAIM)
proxyPlugin.registerExtensionSubtype("voxel.EDIT_CLAIM", VoxelClient.MSG_TYPE_EDIT_CLAIM)
proxyPlugin.registerExtensionSubtype("voxel.PURCHASE_CLAIM", VoxelClient.MSG_TYPE_PURCHASE_CLAIM)
proxyPlugin.registerExtensionSubtype("voxel.SELL_CLAIM", VoxelClient.MSG_TYPE_SELL_CLAIM)
proxyPlugin.registerExtensionSubtype("voxel.DELETE_CLAIM", VoxelClient.MSG_TYPE_DELETE_CLAIM)
proxyPlugin.registerExtensionSubtype("voxel.CLAIM_PERMISSION", VoxelClient.MSG_TYPE_CLAIM_PERMISSION)
proxyPlugin.registerExtensionSubtype("voxel.CLAIM_ACTION", VoxelClient.MSG_TYPE_CLAIM_ACTION)
proxyPlugin.registerExtensionSubtype("voxel.PLACE_CLAIM_OBJECT", VoxelClient.MSG_TYPE_PLACE_CLAIM_OBJECT)
proxyPlugin.registerExtensionSubtype("voxel.EDIT_CLAIM_OBJECT", VoxelClient.MSG_TYPE_EDIT_CLAIM_OBJECT)
proxyPlugin.registerExtensionSubtype("voxel.GET_RESOURCES", VoxelClient.MSG_TYPE_GET_RESOURCES)
proxyPlugin.registerExtensionSubtype("voxel.NO_BUILD_CLAIM_TRIGGER", VoxelClient.MSG_TYPE_NO_BUILD_CLAIM_TRIGGER)
proxyPlugin.registerExtensionSubtype("voxel.UPGRADE_BUILDING_OBJECT", VoxelClient.MSG_TYPE_UPGRADE_BUILDING_OBJECT)
proxyPlugin.registerExtensionSubtype("voxel.GET_CLAIM_OBJECT_INFO", VoxelClient.MSG_TYPE_GET_CLAIM_OBJECT_INFO)
proxyPlugin.registerExtensionSubtype("voxel.ATTACK_BUILDING_OBJECT", VoxelClient.MSG_TYPE_ATTACK_BUILDING_OBJECT)
proxyPlugin.registerExtensionSubtype("voxel.TAKE_CLAIM_RESOURCE", VoxelClient.MSG_TYPE_TAKE_CLAIM_RESOURCE)
proxyPlugin.registerExtensionSubtype("voxel.PAY_TAX_CLAIM", VoxelClient.MSG_TYPE_PAY_TAX_CLAIM)
#Faction Client
proxyPlugin.registerExtensionSubtype("faction.UPDATE_PVP_STATE", FactionClient.MSG_TYPE_UPDATE_PVP_STATE)
#Guild Client
proxyPlugin.registerExtensionSubtype("guild.createGuild", GuildClient.MSG_TYPE_CREATE_GUILD)
proxyPlugin.registerExtensionSubtype("guild.inviteResponse", GuildClient.MSG_TYPE_INVITE_RESPONSE)
proxyPlugin.registerExtensionSubtype("guild.guildCommand", GuildClient.MSG_TYPE_GUILD_COMMAND)
proxyPlugin.registerExtensionSubtype("guild.addResource", GuildClient.MSG_TYPE_GUILD_ADD_RESOURCES)
#WorldManager Client
proxyPlugin.registerExtensionSubtype("ao.CHANGE_INSTANCE", AgisWorldManagerClient.MSG_TYPE_CHANGE_INSTANCE)
proxyPlugin.registerExtensionSubtype("ao.leaveInstance", AgisWorldManagerClient.MSG_TYPE_LEAVE_INSTANCE)
proxyPlugin.registerExtensionSubtype("ao.LOGOUT_REQUEST", AgisWorldManagerClient.MSG_TYPE_LOGOUT_REQUEST)
proxyPlugin.registerExtensionSubtype("ao.CANCEL_LOGOUT_REQUEST", AgisWorldManagerClient.MSG_TYPE_CANCEL_LOGOUT_REQUEST)
#Social Client
proxyPlugin.registerExtensionSubtype("ao.GLOBAL_CHAT", AgisWorldManagerClient.MSG_TYPE_GLOBAL_CHAT)
proxyPlugin.registerExtensionSubtype("social.ADD_BLOCK", GroupClient.MSG_TYPE_ADD_BLOCK)
proxyPlugin.registerExtensionSubtype("social.DEL_BLOCK", GroupClient.MSG_TYPE_DEL_BLOCK)
#proxyPlugin.registerExtensionSubtype("social.GET_FRIENDS", SocialClient.MSG_TYPE_GET_FRIENDS)
proxyPlugin.registerExtensionSubtype("social.INVITE_RESPONSE", GroupClient.MSG_SOCIAL_INVITE_RESPONSE)
proxyPlugin.registerExtensionSubtype("social.ADD_FRIEND", GroupClient.MSG_TYPE_SOCIAL_ADD_FRIEND)
proxyPlugin.registerExtensionSubtype("social.DEL_FRIEND", GroupClient.MSG_TYPE_SOCIAL_DEL_FRIEND)
proxyPlugin.registerExtensionSubtype("social.GET_FRIENDS", GroupClient.MSG_TYPE_SOCIAL_GET_FRIENDS)
proxyPlugin.registerExtensionSubtype("social.PRIVATE_INVITE", SocialClient.MSG_TYPE_SOCIAL_PRIVATE_INVITE)
proxyPlugin.registerExtensionSubtype("social.PRIVATE_INVITE_RESPONSE", SocialClient.MSG_TYPE_SOCIAL_PRIVATE_INVITE_RESPONSE)
#Weather 
proxyPlugin.registerExtensionSubtype("ao.GET_WEATHER", WorldManagerClient.MSG_TYPE_GET_WEATHER)
proxyPlugin.registerExtensionSubtype("weather.GET_WEATHER_PROFILE", WeatherClient.MSG_TYPE_GET_WEATHER_PROFILE)

proxyPlugin.registerExtensionSubtype("auction.createSell", AuctionClient.MSG_TYPE_AUCTION_SELL)
proxyPlugin.registerExtensionSubtype("auction.buy", AuctionClient.MSG_TYPE_AUCTION_BUY)
proxyPlugin.registerExtensionSubtype("auction.list", AuctionClient.MSG_TYPE_AUCTION_LIST)
proxyPlugin.registerExtensionSubtype("auction.ownerList", AuctionClient.MSG_TYPE_AUCTION_OWNER_LIST)
proxyPlugin.registerExtensionSubtype("auction.search", AuctionClient.MSG_TYPE_AUCTION_SEARCH)
proxyPlugin.registerExtensionSubtype("auction.getAuctionList", AuctionClient.MSG_TYPE_AUCTION_GET_AUCTIONS_LIST)
proxyPlugin.registerExtensionSubtype("auction.getAuctionForGroup", AuctionClient.MSG_TYPE_AUCTION_GET_FOR_GROUP)
proxyPlugin.registerExtensionSubtype("auction.order", AuctionClient.MSG_TYPE_AUCTION_ORDER)
proxyPlugin.registerExtensionSubtype("auction.takeAll", AuctionClient.MSG_TYPE_AUCTION_TAKE_ALL)
proxyPlugin.registerExtensionSubtype("auction.cancel", AuctionClient.MSG_TYPE_AUCTION_CANCELL)

proxyPlugin.registerExtensionSubtype("combat.SPRINT", CombatClient.MSG_TYPE_SPRINT)

proxyPlugin.registerExtensionSubtype("ao.START_SHOP",  AgisInventoryClient.MSG_TYPE_START_SHOP)
proxyPlugin.registerExtensionSubtype("ao.CANCEL_SHOP",  AgisInventoryClient.MSG_TYPE_CANCEL_SHOP)
proxyPlugin.registerExtensionSubtype("ao.STOP_SHOP",  AgisInventoryClient.MSG_TYPE_STOP_SHOP)

proxyPlugin.registerExtensionSubtype("combat.DODGE", CombatClient.MSG_TYPE_DODGE)
proxyPlugin.registerExtensionSubtype("combat.ABILITY_VECTOR", CombatClient.MSG_TYPE_ABILITY_VECTOR)
proxyPlugin.registerExtensionSubtype("inventory.SWITCH_WEAPON", AgisInventoryClient.MSG_TYPE_SWITCH_WEAPON)
proxyPlugin.registerExtensionSubtype("inventory.DRAW_WEAPON", AgisInventoryClient.MSG_TYPE_DRAW_WEAPON_CLIENT)
proxyPlugin.registerExtensionSubtype("combat.DEBUG_ABILITY", CombatClient.MSG_TYPE_DEBUG_ABILITY)
proxyPlugin.registerExtensionSubtype("ao.DEBUG_MOB", AgisMobClient.MSG_TYPE_DEBUG_MOB)


Log.debug("extensions_proxy.py: LOADED")
