from atavism.agis import *
from atavism.agis.core import *
from atavism.agis.objects import *
from atavism.agis.util import *
from atavism.agis.plugins import *
from atavism.agis.behaviors import *
from atavism.msgsys import *
from atavism.server.math import *
from atavism.server.plugins import *
from atavism.server.objects import *
from atavism.server.engine import *
from atavism.server.util import *
from java.lang import *

Log.debug("done with mobserver.py")


# Set the loot object mob template
#AgisMobPlugin.setLootObjectTmpl(8)

# Set how long it hangs around for (in seconds)
#AgisMobPlugin.setLootObjectDespawn(60)

Engine.registerPlugin("atavism.agis.plugins.AgisMobPlugin")
