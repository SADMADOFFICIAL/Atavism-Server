from java.lang import *
from java.util import *
from atavism.agis import *
from atavism.agis.core import *
from atavism.agis.objects import AgisStatDef
from atavism.agis.objects import *
from atavism.agis.util import *
from atavism.agis.plugins import *
from atavism.server.math import *
from atavism.agis.plugins import CombatPlugin
from atavism.server.plugins import *
from atavism.server.events import *
from atavism.server.objects import *
from atavism.server.engine import *
from atavism.server.util import *
from math import sqrt

False=0
True=1

# Derived stats do not have a min/max since they are based off of other values

class ExperienceStat (AgisStatDef):
    def update(self, stat, info):
        xpMax = info.statGetCurrentValue("experience-max")
        stat.max = xpMax  
        stat.min = 0
        stat.setDirty(True)
        AgisStatDef.update(self, stat, info)

class ExpMaxStat (AgisStatDef):
    def update(self, stat, info):
        stat.max = 2000000000
        stat.min = 0
        stat.setDirty(True)
        AgisStatDef.update(self, stat, info)


class DmgBaseStat (AgisStatDef):
    def update(self, stat, info):
        stat.max = 2000
        stat.min = 0
        stat.setDirty(True)
        AgisStatDef.update(self, stat, info)

class LevelBaseStat (AgisStatDef):
    def update(self, stat, info):
        stat.max = 10000
        stat.min = 0
        stat.setDirty(True)
        AgisStatDef.update(self, stat, info)
        
# Temp base stat Defs
class DmgModifierStat (AgisStatDef):
    def update(self, stat, info):
        stat.max = 100
        stat.min = -100
        stat.setDirty(True)
        AgisStatDef.update(self, stat, info)

class GearScoreStat (AgisStatDef):
    def update(self, stat, info):
        stat.max = 1000000000
        stat.min = 0
        stat.setDirty(True)
        AgisStatDef.update(self, stat, info)

# Register                Class               Stat                Dependencies
CombatPlugin.registerStat(DmgBaseStat("dmg-base"))
CombatPlugin.registerStat(DmgBaseStat("dmg-max"))
CombatPlugin.registerStat(DmgModifierStat("dmg-dealt-mod"))
CombatPlugin.registerStat(DmgModifierStat("dmg-taken-mod"))
CombatPlugin.registerStat(ExpMaxStat("experience-max"))
CombatPlugin.registerStat(ExperienceStat("experience"), False, ["experience-max"])
CombatPlugin.registerStat(LevelBaseStat("level"), True)
CombatPlugin.registerStat(GearScoreStat("gearScore"))
# Skills and Abilities also can gain experience, so we need to setup the catch for their Ranks

Engine.registerPlugin("atavism.agis.plugins.CombatPlugin");
