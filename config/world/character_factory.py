from atavism.agis import *
from atavism.agis.objects import CombatInfo
from atavism.agis.objects import *
from atavism.agis.core import *
from atavism.agis.events import *
from atavism.agis.util import *
from atavism.agis.plugins import *
from atavism.server.plugins import ObjectManagerPlugin
from atavism.server.plugins import WorldManagerClient
from atavism.server.plugins import *
from atavism.server.math import *
from atavism.server.events import *
from atavism.server.objects import Template
from atavism.server.objects import ObjectTypes
from atavism.server.objects import *
from atavism.server.engine import *
from java.lang import *
from java.util import LinkedList
# SQL imports for name checking code
from com.mysql.cj.jdbc import *
from java.sql import Connection
from java.sql import DriverManager
from java.sql import SQLException
from java.lang import Float
from java.lang import Integer
from java.lang import Boolean

# default player template
player = Template("DefaultPlayer", -1, ObjectManagerPlugin.MOB_TEMPLATE)

player.put(WorldManagerClient.NAMESPACE, WorldManagerClient.TEMPL_OBJECT_TYPE, ObjectTypes.player)
player.put(WorldManagerClient.NAMESPACE, WorldManagerClient.TEMPL_RUN_THRESHOLD, Float(5000))
player.put(WorldManagerClient.NAMESPACE, WorldManagerClient.TEMPL_PERCEPTION_RADIUS, Integer(75000))

player.put(CombatClient.NAMESPACE, "combat.userflag", Boolean(True))
player.put(CombatClient.NAMESPACE, CombatInfo.COMBAT_PROP_DEADSTATE, Boolean(False))

ObjectManagerClient.registerTemplate(player)

