from atavism.server.engine import Engine
from atavism.server.engine import *
from atavism.agis.plugins import AgisWorldManagerPlugin
from atavism.agis.plugins import *
from atavism.agis.objects import *

wmgr = AgisWorldManagerPlugin()

Engine.registerPlugin(wmgr)
