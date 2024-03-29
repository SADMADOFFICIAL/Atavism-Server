from atavism.agis import *
from atavism.server.worldmgr import *
from atavism.agis.objects import *
from atavism.agis.objects import AgisPermissionFactory
from atavism.agis.util import *
from atavism.server.math import Geometry
from atavism.server.math import *
from atavism.server.events import *
from atavism.server.objects import World
from atavism.server.objects import *
from atavism.server.engine import Engine
from atavism.server.engine import *
from atavism.server.util import *
from atavism.msgsys import *

# Uncomment if you want to set a log level for this process
# that is different from the server's default log level
#Log.setLogLevel(1)

#Engine.msgSvrHostname = "localhost"
#Engine.msgSvrPort = 20374

Engine.setBasicInterpolatorInterval(5000)

# set the world geometry for this server
worldGeo = Geometry.maxGeometry()
World.setGeometry(worldGeo)
localGeo = Geometry(-1, 2147483647, -2147483647, 2147483647)
World.setLocalGeometry(localGeo)

#World.perceiverRadius = 100000
#QuadTree.setMaxObjects(3)
World.setLocTolerance(20)

World.setDefaultPermission(AgisPermissionFactory())
