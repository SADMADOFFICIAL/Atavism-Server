#!/bin/bash
(shopt -s igncr) 2>/dev/null && shopt -s igncr; # Workaround Cygwin line-ending issue

# This batch file runs the atavism sever processes on Linux in bash shell
# or on Windows/Cygwin.  You must have installed Java, a database, JDBC driver,
# and the Atavism servers.

# Variable catalog:
# AO_HOME (exported)
# AO_BIN
# AO_COMMON_CONFIG
# AO_WORLD_CONFIG (exported)
# AO_WORLD_NAME
# AO_RUN
# AO_LOGS

# Optional: Set AO_HOME env. variable to be able to run this script from an
# arbitrary directory.  Otherwise, this script assumes it is being run from
# AO_HOME/bin working directory
export AO_HOME=${AO_HOME:-".."}

# Optional: Set DEFAULT_AO_PROPERTY_FILE env. variable to set the default property file, otherwise use world.properties
# when no property file is specified as final argument on command line.
DEFAULT_AO_PROPERTY_FILE=${DEFAULT_AO_PROPERTY_FILE:-"world.properties"}

### Set to true to enable JMX management and monitoring (either here or in env. variable.
ENABLE_MGMT=${ENABLE_MGMT:-"false"}
ENABLE_RECAST4J=${ENABLE_RECAST4J:-"true"}

function kill_process () {
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    if [ $verbose -gt 0 ]; then
        echo -en "stopping $1 "
    fi
    kill $2 > /dev/null 2>&1
    result=$?
    if [ $verbose -gt 0 ]; then
        if [ -e /proc/$2 ]; then
            printf "Process $1 still running. Stopping..."
        fi

        while [ -e /proc/$2 ]; do
            printf '.' > /dev/tty
            sleep 0.1
        done

        if [ $result = 0 ]; then
            printf "${RED}STOPPED${NC}\n"
        else
            printf "${RED}NOT RUNNING${NC}\n"
        fi
    fi
}

function check_process () {
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    GREEN='\033[0;32m'
    ps -e ho pid | grep $1 > /dev/null 2>&1
    result=$?
    if [ $result = 1 ]; then
        printf "${RED}FAILED{NC}\n"
#        printf '\n'
    else
        printf "${GREEN}SUCCESS${NC}\n"
#        printf '\n'
    fi
}

function status_process () {
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    GREEN='\033[0;32m'
    if [ x$2 == x ]; then
	return 0
    fi
    ps -e ho pid | grep $2 > /dev/null 2>&1
    result=$?
    if [ $result = 0 ]; then
        printf "$1 ${GREEN}RUNNING${NC}\n"
    else
        printf "$1 ${RED}NOT RUNNING${NC}\n"
    fi
    return $result
}

function write_pid () {
    agent_name=$1
    pid=$2

    echo $pid > "${AO_RUN}"/${agent_name}.pid
    if [ $(uname -o) == "Cygwin" ]; then
	winpid=`ps -eW | grep ' \+ '$pid' \+[0-9]\+ \+[0-9]\+ \+\([0-9]\+\) \+.*' | sed -e s/' \+ '$pid' \+[0-9]\+ \+[0-9]\+ \+\([0-9]\+\) \+.*'/\\\\1/`
	echo $winpid > "${AO_RUN}"/${agent_name}.winpid
    fi
}

function alloc_domain_name () {

    type=$1
    name=$2

    if [ $(uname -o) == "Cygwin" ]; then
	CMD_CLASSPATH="$AO_JAR;$GETOPT;$LOG4J;$LOG4JCORE;$BCEL;."
    else
	CMD_CLASSPATH="${AO_JAR}:${GETOPT}:${LOG4J}:${LOG4JCORE}:${BCEL}:."
    fi

    # not currently using CMD_CLASSPATH

    java ${JAVA_DOMAIN} \
	    -Datavism.disable_logs=true \
	    -Datavism.log_level=3 \
	    -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
            -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
            atavism.msgsys.DomainCommand \
	    $CMDLINE_PROPS \
	    -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
	    -n ${type},${name}

    if [ $? -ne 0 ]; then
	echo "alloc_domain_name failed" 1>&2
	exit 1
    fi
}

function start_world_manager () {

    AGENT_TYPE=wmgr
    #AGENT_NAME=$(alloc_domain_name AGENT ${AGENT_TYPE}_# )
    AGENT_NAME="wmgr_${id}"

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME ...     \t"
    fi

    java \
        ${JAVA_WMGR} \
	$JMX_FLAGS \
        -Datavism.agenttype=${AGENT_TYPE} \
        -Datavism.loggername=${AGENT_NAME} \
	-Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
         atavism.server.engine.Engine \
	$CMDLINE_PROPS \
        -i "${AO_BIN}"/wmgr_local1.py \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
	"${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_COMMON_CONFIG}"/world_mgr1.py \
        "${AO_WORLD_CONFIG}"/extensions_wmgr.py \
        &

    PID=$!
    write_pid ${AGENT_NAME} $PID

    if [ $verbose -gt 0 ]; then
        check_process $PID
    fi
}


function start_proxy () {

    AGENT_TYPE=proxy
    #AGENT_NAME=$(alloc_domain_name AGENT ${AGENT_TYPE}_# )
    AGENT_NAME="proxy_${id}"

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME ...     \t"
    fi

    java  \
        ${JAVA_PROXY} \
	$JMX_FLAGS \
        -Datavism.agenttype=$AGENT_TYPE \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
	$CMDLINE_PROPS \
        -i "${AO_BIN}"/proxy.py \
        -i "${AO_COMMON_CONFIG}"/events.py \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/proxy.py \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/extensions_proxy.py \
        &

    PID=$!
    write_pid ${AGENT_NAME} $PID

    if [ $verbose -gt 0 ]; then
        check_process $PID
    fi
}

function start_domain () {

#     AGENT_NAMES="-a quest -a combat_1  -a wmgr_1 -a wmgr_2 -a mobserver_1  -a objmgr -a login_manager -a proxy_1  -a proxy_2  -a instance -a arena -a builder  -a auction -a weather -a faction -a chat -a prefab_manager"
#     AGENT_NAMES="-a quest -a combat_1  -a wmgr_1  -a wmgr_2  -a mobserver_1  -a mobserver_2  -a objmgr -a login_manager -a proxy_1  -a instance -a arena -a builder  -a auction -a weather -a faction -a chat -a prefab_manager"
     AGENT_NAMES="-a quest -a combat_1 -a wmgr_1 -a mobserver_1 -a objmgr -a login_manager -a proxy_1 -a instance -a arena -a builder  -a auction -a weather -a faction -a chat -a prefab_manager"
    PLUGIN_TYPES="-p Login,1 -p Proxy,1 -p ObjectManager,1 -p WorldManager,1 -p Inventory,1 -p MobManager,1 -p Quest,1 -p Faction,1 -p Instance,1 -p Group,1 -p Combat,1 -p ClassAbility,1 -p Domain,1 -p DataLogger,1 -p Arena,1 -p Social,1 -p Crafting,1 -p Voxel,1 -p Guild,1 -p Weather,1 -p Auction,1 -p Chat,1 -p Bonus,1 -p Achievements,1 -p Ranking,1 -p Prefab,1 -p FlashPolicy,1"

    if [ $verbose -gt 0 ]; then
        echo -en "Starting domain server: \t"
    fi

    java ${JAVA_DOMAIN} \
        -Datavism.loggername=domain \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
         atavism.msgsys.DomainServer \
         $CMDLINE_PROPS \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        ${AGENT_NAMES} ${PLUGIN_TYPES} \
        &

    write_pid domain $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/domain.pid)
    fi
    
}

function start_combat () {

    AGENT_TYPE=combat
    AGENT_NAME="combat_${id}"

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
    java \
        ${JAVA_COMBAT} \
        -Datavism.agenttype=$AGENT_TYPE \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
	$CMDLINE_PROPS \
        -i "${AO_BIN}"/wmgr_local1.py \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_COMMON_CONFIG}"/skill_db.py \
        "${AO_WORLD_CONFIG}"/skill_db.py \
        "${AO_COMMON_CONFIG}"/ability_db.py \
        "${AO_WORLD_CONFIG}"/ability_db.py \
        "${AO_WORLD_CONFIG}"/classabilityplugin.py \
        "${AO_WORLD_CONFIG}"/combat.py \
        "${AO_WORLD_CONFIG}"/extensions_combat.py \
        "${AO_COMMON_CONFIG}"/profession_db.py \
        "${AO_WORLD_CONFIG}"/profession_db.py \
		&

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_instance () {

    AGENT_TYPE=instance
    AGENT_NAME=instance

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
    java \
        ${JAVA_INSTANCE} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
         atavism.server.engine.Engine \
        $CMDLINE_PROPS \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_COMMON_CONFIG}"/instance.py \
        "${AO_WORLD_CONFIG}"/startup_instance.py \
        &


    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_object_manager () {

    AGENT_TYPE=objmgr
    AGENT_NAME=objmgr

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
   java \
        ${JAVA_OBJMGR} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        $CMDLINE_PROPS \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/templates.py \
        "${AO_COMMON_CONFIG}"/obj_manager.py \
        "${AO_WORLD_CONFIG}"/mobs_db.py \
        "${AO_WORLD_CONFIG}"/items_db.py \
        "${AO_WORLD_CONFIG}"/craftingplugin.py \
        "${AO_WORLD_CONFIG}"/extensions_objmgr.py \
        "${AO_COMMON_CONFIG}"/datalogger.py \
        "${AO_WORLD_CONFIG}"/guildplugin.py \
        &


    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_login () {

    AGENT_TYPE=login_manager
    AGENT_NAME=login_manager

    if [ $verbose -gt 0 ]; then
        echo -en "Starting login manager: \t"
    fi
	
   if [ -f "${AO_WORLD_CONFIG}/login_manager.py" ]; then
         java \
            ${JAVA_LOGIN} \
            -Datavism.loggername=$AGENT_NAME \
            -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
            -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
            atavism.server.engine.Engine \
         $CMDLINE_PROPS \
            -i "${AO_COMMON_CONFIG}"/aomessages.py \
            -i "${AO_WORLD_CONFIG}"/worldmessages.py \
            -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
            "${AO_BIN}"/login_manager.py \
            "${AO_COMMON_CONFIG}"/global_props.py \
            "${AO_WORLD_CONFIG}"/global_props.py \
            "${AO_WORLD_CONFIG}"/login_manager.py \
            "${AO_COMMON_CONFIG}"/character_factory.py \
            "${AO_WORLD_CONFIG}"/character_factory.py \
            "${AO_WORLD_CONFIG}"/extensions_login.py \
            &
    else
        java \
            ${JAVA_LOGIN} \
            -Datavism.loggername=$AGENT_NAME \
            -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
            -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
            atavism.server.engine.Engine \
         $CMDLINE_PROPS \
            -i "${AO_COMMON_CONFIG}"/aomessages.py \
            -i "${AO_WORLD_CONFIG}"/worldmessages.py \
            -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
            "${AO_BIN}"/login_manager.py \
            "${AO_COMMON_CONFIG}"/global_props.py \
            "${AO_WORLD_CONFIG}"/global_props.py \
            "${AO_COMMON_CONFIG}"/login_manager.py \
            "${AO_COMMON_CONFIG}"/character_factory.py \
            "${AO_WORLD_CONFIG}"/character_factory.py \
            "${AO_WORLD_CONFIG}"/extensions_login.py \
            &
    fi

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_mob () {

    AGENT_TYPE=mobserver
    AGENT_NAME="mobserver_${id}"

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_MOB} \
        -Datavism.agenttype=$AGENT_TYPE \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
	$CMDLINE_PROPS \
        -i "${AO_BIN}"/mobserver_local.py \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_COMMON_CONFIG}"/mobserver_init.py \
        "${AO_WORLD_CONFIG}"/mobserver_init.py \
        "${AO_COMMON_CONFIG}"/mobserver.py \
        "${AO_WORLD_CONFIG}"/mobserver.py \
        "${AO_WORLD_CONFIG}"/extensions_mobserver.py \
        &

#        "${AO_WORLD_CONFIG}"/factionplugin.py \

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_quest () {

    AGENT_TYPE=quest
    AGENT_NAME=quest

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_QUEST} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
    $CMDLINE_PROPS \
        -i "${AO_BIN}"/mobserver_local.py \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_COMMON_CONFIG}"/questplugin.py \
        "${AO_WORLD_CONFIG}"/socialplugin.py \
        &

#        "${AO_WORLD_CONFIG}"/factionplugin.py \

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_arena () {

    AGENT_TYPE=arena
    AGENT_NAME=arena

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_ARENA} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/arenaplugin.py \
        &

  
    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/"$AGENT_NAME".pid)
     fi
	
}

function start_faction () {

    AGENT_TYPE=faction
    AGENT_NAME=faction

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_FACTION} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/factionplugin.py \
        "${AO_COMMON_CONFIG}"/groupplugin.py \
        "${AO_WORLD_CONFIG}"/group.py \
     &

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/"$AGENT_NAME".pid)
     fi

}


function start_chat () {

    AGENT_TYPE=chat
    AGENT_NAME=chat

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_CHAT} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/chatplugin.py \
        &

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/"$AGENT_NAME".pid)
     fi
}


function start_auction_house () {

    AGENT_TYPE=auction
    AGENT_NAME=auction

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_AUCTION} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/auctionplugin.py \
        &

  
    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/"$AGENT_NAME".pid)
     fi
	
}

function start_weather () {

    AGENT_TYPE=weather
    AGENT_NAME=weather

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_WEATHER} \
        -Datavism.loggername=$AGENT_NAME \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
         "${AO_WORLD_CONFIG}"/weatherplugin.py \
         "${AO_WORLD_CONFIG}"/bonusplugin.py \
         "${AO_WORLD_CONFIG}"/achievementsplugin.py \
         "${AO_WORLD_CONFIG}"/rankingplugin.py \
        &

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/"$AGENT_NAME".pid)
     fi
}

function start_builder () {

    AGENT_TYPE=builder
    AGENT_NAME=builder

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_BUILDER} \
        -Datavism.loggername=builder \
	-Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.server.engine.Engine \
        -i "${AO_COMMON_CONFIG}"/aomessages.py \
        -i "${AO_WORLD_CONFIG}"/worldmessages.py \
        -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
        "${AO_COMMON_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/global_props.py \
        "${AO_WORLD_CONFIG}"/voxelplugin.py \
        &
  
    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_prefab () {

    AGENT_TYPE=prefab_manager
    AGENT_NAME=prefab_manager

    if [ $verbose -gt 0 ]; then
        echo -en "Starting prefab manager: \t"
    fi
	
   if [ -f "${AO_WORLD_CONFIG}/prefab_manager.py" ]; then
	java \
            ${JAVA_PREFAB} \
            -Datavism.loggername=$AGENT_NAME \
	    -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
            -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
            atavism.server.engine.Engine \
	    $CMDLINE_PROPS \
            -i "${AO_COMMON_CONFIG}"/aomessages.py \
            -i "${AO_WORLD_CONFIG}"/worldmessages.py \
            -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
            "${AO_BIN}"/prefab_manager.py \
            "${AO_COMMON_CONFIG}"/global_props.py \
            "${AO_WORLD_CONFIG}"/global_props.py \
            "${AO_WORLD_CONFIG}"/prefab_manager.py \
            &
    else
	java \
            ${JAVA_PREFAB} \
            -Datavism.loggername=$AGENT_NAME \
	    -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
            -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
            atavism.server.engine.Engine \
	    $CMDLINE_PROPS \
            -i "${AO_COMMON_CONFIG}"/aomessages.py \
            -i "${AO_WORLD_CONFIG}"/worldmessages.py \
            -t "${AO_COMMON_CONFIG}"/typenumbers.txt \
            "${AO_BIN}"/prefab_manager.py \
            "${AO_COMMON_CONFIG}"/global_props.py \
            "${AO_WORLD_CONFIG}"/global_props.py \
            "${AO_COMMON_CONFIG}"/prefab_manager.py \
            &
    fi

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
	
}

function start_all_in_one () {

    AGENT_TYPE=all_in_one
    AGENT_NAME=all_in_one

    if [ $verbose -gt 0 ]; then
        echo -en "Starting $AGENT_NAME server: \t"
    fi
  java \
        ${JAVA_ALL_IN_ONE} \
        -Datavism.loggername=all_in_one \
        -Dlog4j.configurationFile=${AO_BIN}/worldlog.xml \
        -DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector \
        atavism.agis.server.AllInOneServer \
        &

    write_pid $AGENT_NAME $!

    if [ $verbose -gt 0 ]; then
        check_process $(cat "${AO_RUN}"/${AGENT_NAME}.pid)
     fi
}

function archive_log_dir () {
    rm -rf "${AO_LOGS}.old"/*
    mkdir -p "${AO_LOGS}".old
    mv "${AO_LOGS}"/* "${AO_LOGS}".old
}

function start_server () {
    date
    if [ X$ARCHIVE_LOG_DIR = X"true" ]; then
	if [ -d "${AO_LOGS}" ]; then
	    echo "*** Archiving logs ***"
	    archive_log_dir
	fi
    fi

    # Do marshalling code injection if USE_CLASS_FILES is true
    if [ X$USE_CLASS_FILES = X"true" ]; then
        echo "*** Performing injection for $AO_WORLD_NAME ***"
        ./performinjection.sh $AO_WORLD_NAME
    fi
	
    # Use these flags for profiling
    HPROF_FLAGS="-agentlib:hprof=heap=sites,depth=8"
    GCDETAILS_FLAGS="-XX:+PrintGC -XX:+PrintGCDetails"

    # Linux: Use strace with the following flags to monitor one of the
    # atavism server processes.
    #    strace -f -e trace=\!futex,gettimeofday,clock_gettime java \

    echo "*** Starting world $AO_WORLD_NAME ***"
    if [ ! -d "${AO_RUN}" ]
        then
        mkdir -p "${AO_RUN}"
    fi

    if [ ! -d "${AO_LOGS}" ]
        then
        mkdir -p "${AO_LOGS}"
    fi

    rm -f ${AO_RUN}/*.pid
    rm -f ${AO_RUN}/*.winpid

    if [ X$DELETE_LOGS_ON_STARTUP = X"true" ]; then
        rm "${AO_LOGS}"/*.out*
    fi

    if [ X$ENABLE_MGMT = X"true" ]; then
        echo "Enabling JMX mgmt & monitoring"
        JAVA_FLAGS="${JAVA_FLAGS} $JMX_FLAGS"
    fi        

    if [ $verbose -gt 0 ]; then
        echo AO_HOME is $AO_HOME
        if [ X$USE_CLASS_FILES = X"true" ]; then
            echo "Using .class files from the /build hierarchy"
        else
            echo "Using .jar files from the /dist hierarchy"
        fi
        echo Using property file $AO_PROPERTY_FILE  
        echo Using world file $AOW_FILENAME
        echo Using world script directory $AO_WORLD
        echo Using log directory $AO_LOGS
        echo Using common directory $AO_COMMON_CONFIG, bin directory $AO_BIN     
        echo "JAVA_FLAGS=\"${JAVA_FLAGS}\""
    fi

    # Increase the file descriptor limit up to the hard limit
    # Linux: Use /etc/security/limits.conf to set the hard limit
    ulimit -n hard
	 if [ X$RUN_ALL_IN_ONE = X"true" ]; then
	 start_all_in_one
	 fi
	 if [ X$RUN_ALL_IN_ONE = X"false" ]; then
    start_domain
    sleep 5
    start_world_manager
    id="2"
#    start_world_manager
    id="1"
	start_combat
	start_instance
	start_object_manager
	start_login
	fi
    start_proxy
	 if [ X$RUN_ALL_IN_ONE = X"false" ]; then
    start_mob
    id="2"
#    start_mob
    id="1"
	start_quest
    start_faction
	start_arena
	start_builder
	start_auction_house
	start_weather
	start_chat
 	start_prefab
	fi
    echo "Wait for finished initializing msg... "
}

function stop_server () {
    echo "*** Stopping world $AO_WORLD_NAME ***"
	 if [ X$RUN_ALL_IN_ONE = X"false" ]; then
    if [ -e "${AO_RUN}"/login_manager.pid ]; then
		kill_process "login server   " $(cat "${AO_RUN}"/login_manager.pid)
	fi
    if [ -e "${AO_RUN}"/combat_1.pid ]; then
		kill_process "combat server  " $(cat "${AO_RUN}"/combat_1.pid)
    fi
    if [ -e "${AO_RUN}"/instance.pid ]; then
		kill_process "instance       " $(cat "${AO_RUN}"/instance.pid)
    fi
    if [ -e "${AO_RUN}"/objmgr.pid ]; then
		kill_process "object manager " $(cat "${AO_RUN}"/objmgr.pid)
    fi
    if [ -e "${AO_RUN}"/wmgr_1.pid ]; then
		kill_process "world manager  " $(cat "${AO_RUN}"/wmgr_1.pid)
    fi
    if [ -e "${AO_RUN}"/wmgr_2.pid ]; then
		kill_process "world manager  " $(cat "${AO_RUN}"/wmgr_2.pid)
    fi
	fi
    if [ -e "${AO_RUN}"/proxy_1.pid ]; then
		kill_process "proxy server   " $(cat "${AO_RUN}"/proxy_1.pid)
    fi
	 if [ X$RUN_ALL_IN_ONE = X"false" ]; then
    if [ -e "${AO_RUN}"/mobserver_1.pid ]; then
		kill_process "mob server 1   " $(cat "${AO_RUN}"/mobserver_1.pid)
    fi
    if [ -e "${AO_RUN}"/mobserver_2.pid ]; then
		kill_process "mob server 2   " $(cat "${AO_RUN}"/mobserver_2.pid)
    fi
    if [ -e "${AO_RUN}"/quest.pid ]; then
		kill_process "quest server   " $(cat "${AO_RUN}"/quest.pid)
    fi
   if [ -e "${AO_RUN}"/faction.pid ]; then
		kill_process "faction server " $(cat "${AO_RUN}"/faction.pid)
    fi
     if [ -e "${AO_RUN}"/arena.pid ]; then
		kill_process "arena server   " $(cat "${AO_RUN}"/arena.pid)
    fi
    if [ -e "${AO_RUN}"/builder.pid ]; then
		kill_process "builder server " $(cat "${AO_RUN}"/builder.pid)
    fi
     if [ -e "${AO_RUN}"/auction.pid ]; then
		kill_process "auction server " $(cat "${AO_RUN}"/auction.pid)
    fi
     if [ -e "${AO_RUN}"/weather.pid ]; then
		kill_process "weather server " $(cat "${AO_RUN}"/weather.pid)
    fi
     if [ -e "${AO_RUN}"/chat.pid ]; then
		kill_process "chat server    " $(cat "${AO_RUN}"/chat.pid)
    fi
    if [ -e "${AO_RUN}"/domain.pid ]; then
		kill_process "domain server  " $(cat "${AO_RUN}"/domain.pid)
	fi
    if [ -e "${AO_RUN}"/prefab_manager.pid ]; then
		kill_process "prefab server  " $(cat "${AO_RUN}"/prefab_manager.pid)
	fi
	fi
	 if [ X$RUN_ALL_IN_ONE = X"true" ]; then
	 if [ -e "${AO_RUN}"/all_in_one.pid ]; then
        kill_process "all_in_one server  " $(cat "${AO_RUN}"/all_in_one.pid)
    fi
fi
	
}

function status_server () {
    down=0
	if [ X$RUN_ALL_IN_ONE = X"false" ]; then
    status_process "domain server  " $(cat "${AO_RUN}"/domain.pid)  
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "login server   " $(cat "${AO_RUN}"/login_manager.pid) 
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "combat server  " $(cat "${AO_RUN}"/combat_1.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "instance       " $(cat "${AO_RUN}"/instance.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "object manager " $(cat "${AO_RUN}"/objmgr.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "world manager 1 " $(cat "${AO_RUN}"/wmgr_1.pid)
    if [ $? -ne 0 ]; then down=1 ; fi

    if [ -e "${AO_RUN}"/wmgr_2.pid ]; then
    status_process "world manager 2 " $(cat "${AO_RUN}"/wmgr_2.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    fi
	fi
    status_process "proxy server   " $(cat "${AO_RUN}"/proxy_1.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
	 if [ X$RUN_ALL_IN_ONE = X"false" ]; then
    status_process "mob server 1   " $(cat "${AO_RUN}"/mobserver_1.pid)
    if [ $? -ne 0 ]; then down=1 ; fi

    if [ -e "${AO_RUN}"/mobserver_2.pid ]; then
    status_process "mob server 2   " $(cat "${AO_RUN}"/mobserver_2.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    fi

    status_process "faction server  " $(cat "${AO_RUN}"/faction.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "quest server   " $(cat "${AO_RUN}"/quest.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "arena server   " $(cat "${AO_RUN}"/arena.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "builder server " $(cat "${AO_RUN}"/builder.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "auction server " $(cat "${AO_RUN}"/auction.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
   status_process "weather server " $(cat "${AO_RUN}"/weather.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
   status_process "chat server " $(cat "${AO_RUN}"/chat.pid)
    if [ $? -ne 0 ]; then down=1 ; fi
    status_process "prefab server   " $(cat "${AO_RUN}"/prefab_manager.pid) 
    if [ $? -ne 0 ]; then down=1 ; fi
fi
 if [ X$RUN_ALL_IN_ONE = X"true" ]; then
 status_process "AIO server   " $(cat "${AO_RUN}"/all_in_one.pid) 
 fi
    exit ${down}
}

function import_property_file () {
    for file
    do
        if [ -f $file ]; then
            files="$files $file"
        fi
    done
    if [ -n "$files" ]; then
        awk -f "$AO_BIN/prop2sh.awk" $files > "$AO_BIN/_javaprops_"
        . "$AO_BIN/_javaprops_"
        rm -f "$AO_BIN/_javaprops_"
    fi
}

verbose=0
rm -f _cmdline_props_
while getopts "hvw:p:CMP:Aac:R" arg; do
    case "$arg" in
        h)
            echo "$0: usage: $0 [-hvCM] [-w worldname] [-p propertyfilename] (start|stop|status|test)"
            ;;
        v)
            let verbose++
            ;;
	w)
	    AO_WORLD_NAME=$OPTARG
	    if [ -z "$AO_WORLD_CONFIG" ]; then
		export AO_WORLD_CONFIG="$AO_HOME/config/$AO_WORLD_NAME"
	    fi
	    ;;
	p)
	    if [ -z $AO_PROPERTY_FILE ]; then
		AO_PROPERTY_FILE=$OPTARG
	    else
		CMDLINE_PROPS="$CMDLINE_PROPS -p $OPTARG"
		PROPERTY_FILES="$PROPERTY_FILES $OPTARG"
	    fi
	    ;;
	C)
	    JVM_FLAG="-server -XX:+UseG1GC "
#	    JVM_FLAG="-server -Xmx4096m"
#	    JVM_FLAG="-server -Xmx8096m -Xms512m -XX:+UseG1GC "
	    ;;
	M)
	    ENABLE_MGMT=true
	    JMX_FLAGS="-Dcom.sun.management.jmxremote"
	    ;;
	P)
	    CMDLINE_PROPS="$CMDLINE_PROPS -P$OPTARG"
	    echo $OPTARG >> _cmdline_props_
	    ;;
	A)
	    AGGRESIVE="-XX:CompileThreshold=200 -Xnoclassgc -XX:+RelaxAccessControlCheck"
	    ;;
	a)
	    ARCHIVE_LOG_DIR=true
	    ;;
	c)
	    AO_WORLD_CONFIG="$OPTARG"
	    ;;
	R)
	    ENABLE_RECAST4J=true
	    ;;

	esac
done
shift $((OPTIND-1))

if [ $(uname -o) = "Cygwin" ]; then
    AO_HOME_UNIX=$(cygpath -u "${AO_HOME}")
else
    AO_HOME_UNIX="$AO_HOME"
fi

# where the local startup configs are stored, such as the port number
# and log level
AO_BIN=${AO_BIN:-"${AO_HOME}/bin"}

# where common config files are stored, such as plugin logic
AO_COMMON_CONFIG=${AO_COMMON_CONFIG:-"${AO_HOME}/config/common"}

AO_PROPERTY_FILE=${AO_PROPERTY_FILE:-"${AO_BIN}/${DEFAULT_AO_PROPERTY_FILE}"}

import_property_file $AO_PROPERTY_FILE
import_property_file "$AO_WORLD_CONFIG/world.properties" $PROPERTY_FILES _cmdline_props_
rm -f _cmdline_props_

if [ -n "$AO_WORLD_NAME" ] ; then
    atavism_worldname=$AO_WORLD_NAME
fi

JAVA_FLAGS="$JAVA_FLAGS -Datavism.worldname=$atavism_worldname"
CMDLINE_PROPS="$CMDLINE_PROPS -Patavism.worldname=$atavism_worldname"

if [ -z "$ARCHIVE_LOG_DIR" -a -n "$atavism_archive_logs_on_startup" ] ; then
    ARCHIVE_LOG_DIR=$atavism_archive_logs_on_startup
fi

# Determine if we should use .class files from the build hierarchy,
# or .jar files from the dist hierarchy.  To run the property getter
# before AO_JAR is set, we always use the dist version of the property
# getter.
USE_CLASS_FILES=${USE_CLASS_FILES:-$atavism_use_class_files}

#RHINO=${RHINO:-"${AO_HOME}/other/rhino1_5R5/js.jar"}
#GETOPT=${GETOPT:-"${AO_HOME}/other/java-getopt-1.0.11.jar"}
#JYTHON=${JYTHON:-"${AO_HOME}/other/jython.jar"}
#LOG4J=${LOG4J:-"${AO_HOME}/other/log4j-api-2.17.1.jar"}
#LOG4JCORE=${LOG4JCORE:-"${AO_HOME}/other/log4j-core-2.17.1.jar"}
#DISRUPTOR=${DISRUPTOR:-"${AO_HOME}/other/disruptor-3.4.2.jar"}
#BCEL=${BCEL:-"${AO_HOME}/other/bcel-6.2.jar"}
#SHIRO=${SHIRO:-"${AO_HOME}/other/shiro-core-1.0-incubating-SNAPSHOT.jar"}
#SLF4J=${SLF4J:-"${AO_HOME}/other/slf4j-api-1.7.36.jar"}
#JSON=${JSON:-"${AO_HOME}/other/json_simple-1.1.jar"}

#RECAST4J=${RECAST4J:-"${AO_HOME}/other/recast-1.4.2.jar"}
#RECAST4J_DETOUR=${RECAST4J_DETOUR:-"${AO_HOME}/other/recast4j-detour-1.4.2.jar"}
#RECAST4J_DETOUR_EXTRA=${RECAST4J_DETOUR_EXTRA:-"${AO_HOME}/other/recast4j-detour-extras-1.4.2.jar"}
#RECAST4J_DETOUR_CROWD=${RECAST4J_DETOUT_CRAWD:-"${AO_HOME}/other/recast4j-detour-crowd-1.4.2.jar"}
#RECAST4J_DETOUR_DYNAMIC=${RECAST4J_DETOUR_DYNAMIC:-"${AO_HOME}/other/recast4j-detour-dynamic-1.4.2.jar"}
#GSON=${GSON:-"${AO_HOME}/other/gson-2.8.6.jar"}
MANAGED=${MANAGED:-"${AO_HOME}/other/managed/*"}

if  [ X$USE_CLASS_FILES = X"true" ]; then
    AO_JAR=${AO_JAR:-"${AO_HOME}/build"}
    AGIS_JAR=${AGIS_JAR:-"${AO_HOME}/build"}
    INJECTED_JAR=${INJECTED_JAR:-"${AO_HOME}/inject"}
else
    AO_JAR=${AO_JAR:-"${AO_HOME}/dist/lib/atavism.jar"}
    AGIS_JAR=${AGIS_JAR:-"${AO_HOME}/dist/lib/agis.jar"}
    INJECTED_JAR=${INJECTED_JAR:-"${AO_HOME}/dist/lib/injected.jar"}
fi

#Get world name from properties file, and construct path to world script dir if not set from env var.
AO_WORLD_NAME=${AO_WORLD_NAME:-$atavism_worldname}
export AO_WORLD_CONFIG=${AO_WORLD_CONFIG:-"$AO_HOME/config/$AO_WORLD_NAME"}

EXT_JAR=${EXT_JAR:="${AO_WORLD_CONFIG}/${AO_WORLD_NAME}.jar"}
JDBC=${JDBC:-$atavism_jdbcJarPath}
AO_CLASSPATH=""
if [ $(uname -o) == "Cygwin" ]; then
    export PATH=$(cygpath "$JAVA_HOME"/bin):.:$PATH
#    AO_CLASSPATH="$RHINO;$JDBC;$INJECTED_JAR;$AO_JAR;$AGIS_JAR;$EXT_JAR;$GETOPT;$JYTHON;$LOG4J;$LOG4JCORE;$DISRUPTOR;$BCEL;$MBS;$SLF4J;$SHIRO;$JSON;$MANAGED;."
    AO_CLASSPATH="$RHINO;$JDBC;$AO_JAR;$AGIS_JAR;$EXT_JAR;$MBS;$SHIRO;$JSON;$MANAGED;."
else
#    AO_CLASSPATH="${RHINO}:${JDBC}:${INJECTED_JAR}:${AO_JAR}:${AGIS_JAR}:${EXT_JAR}:${GETOPT}:${JYTHON}:${LOG4J}:${LOG4JCORE}:${DISRUPTOR}:${BCEL}:${MBS}:${SLF4J}:${SHIRO}:${JSON}:${MANAGED}:."
    AO_CLASSPATH="${RHINO}:${JDBC}:${AO_JAR}:${AGIS_JAR}:${EXT_JAR}:${MBS}:${SHIRO}:${JSON}:${MANAGED}:."
fi

if [ "$ENABLE_RECAST4J" = true ]; then
        echo "Enabling Recast4J"
	if [ $(uname -o) == "Cygwin" ]; then 
#		AO_CLASSPATH="$AO_CLASSPATH;$RECAST4J;$RECAST4J_DETOUR;$RECAST4J_DETOUR_EXTRA;$RECAST4J_DETOUR_CROWD;$GSON;$RECAST4J_DETOUR_DYNAMIC;."
		AO_CLASSPATH="$AO_CLASSPATH;."
	else
#		AO_CLASSPATH="${AO_CLASSPATH}:${RECAST4J}:${RECAST4J_DETOUR}:${RECAST4J_DETOUR_EXTRA}:${RECAST4J_DETOUR_CROWD}:${GSON}:${RECAST4J_DETOUR_DYNAMIC}:."
		AO_CLASSPATH="${AO_CLASSPATH}:."
	fi
fi        

JAVA_FLAGS="-cp ${AO_CLASSPATH} -Datavism.propertyfile=${AO_PROPERTY_FILE} ${JAVA_FLAGS} -XX:-OmitStackTraceInFastThrow "

JAVA_FLAGS="${JAVA_FLAGS} -Xss512k "
# -Xss256k -XX:MinHeapFreeRatio=2 -XX:MaxHeapFreeRatio=10 -XX:+UseStringDeduplication -XX:MaxMetaspaceSize=56m "

# Read Buffer size for network Agents in severs by default is 524288 (512k)
# JAVA_FLAGS="${JAVA_FLAGS}  -Datavism.AgentReadBuffer=4194304 "



# Get path to aow file if set explicitly in atavism.aow file, otherwise, construct path to aow file.
AOW_FILENAME=${AOW_FILENAME:-$atavism_aowfile}

if [ "$AOW_FILENAME" = "null" ]; then
    AOW_FILENAME=$AO_HOME/config/$AO_WORLD_NAME/$AO_WORLD_NAME.aow
fi

if [ X"$AO_HOSTNAME" != "X" ]; then
    CMDLINE_PROPS="$CMDLINE_PROPS -Patavism.hostname=${AO_HOSTNAME}"
    JAVA_FLAGS="$JAVA_FLAGS -Datavism.hostname=${AO_HOSTNAME}"
fi

# This is in local OS format
AO_LOGS=${AO_LOGS:-"${AO_HOME}/logs/${AO_WORLD_NAME}"}
DELETE_LOGS_ON_STARTUP=${DELETE_LOGS_ON_STARTUP:-$atavism_delete_logs_on_startup}
RUN_ALL_IN_ONE=${RUN_ALL_IN_ONE:-$atavism_all_in_one_enabled}

# This should always be in "unix" format
if [ $(uname -o) = "Cygwin" ]; then
    AO_RUN=${AO_RUN:-$(cygpath -w ${AO_BIN}/run/${AO_WORLD_NAME})}
else
    AO_RUN=${AO_RUN:-${AO_BIN}/run/${AO_WORLD_NAME}}
fi

JAVA_FLAGS="${JAVA_FLAGS} -Datavism.logs=${AO_LOGS}"

JAVA_FLAGS="${JAVA_FLAGS} -Dpython.console.encoding=UTF-8"
# Memory configuration seperate for each of the server

JAVA_DOMAIN="${JVM_FLAG}   -Xms$atavism_domain_Xms -Xmx$atavism_domain_Xmx ${JAVA_FLAGS} "
JAVA_PREFAB="${JVM_FLAG}   -Xms$atavism_prefab_manager_Xms -Xmx$atavism_prefab_manager_Xmx ${JAVA_FLAGS} "
JAVA_PROXY="${JVM_FLAG}    -Xms$atavism_proxy_Xms -Xmx$atavism_proxy_Xmx ${JAVA_FLAGS} "
JAVA_OBJMGR="${JVM_FLAG}   -Xms$atavism_objmgr_Xms -Xmx$atavism_objmgr_Xmx ${JAVA_FLAGS} "
JAVA_COMBAT="${JVM_FLAG}   -Xms$atavism_combat_Xms -Xmx$atavism_combat_Xmx ${JAVA_FLAGS} "
JAVA_WMGR="${JVM_FLAG}     -Xms$atavism_wmgr_Xms -Xmx$atavism_wmgr_Xmx ${JAVA_FLAGS} "
JAVA_INSTANCE="${JVM_FLAG} -Xms$atavism_instance_Xms -Xmx$atavism_instance_Xmx ${JAVA_FLAGS} "
JAVA_LOGIN="${JVM_FLAG}    -Xms$atavism_login_manager_Xms -Xmx$atavism_login_manager_Xmx ${JAVA_FLAGS} "
JAVA_MOB="${JVM_FLAG}      -Xms$atavism_mobserver_Xms -Xmx$atavism_mobserver_Xmx ${JAVA_FLAGS} "
JAVA_ARENA="${JVM_FLAG}    -Xms$atavism_arena_Xms -Xmx$atavism_arena_Xmx ${JAVA_FLAGS} "
JAVA_BUILDER="${JVM_FLAG}  -Xms$atavism_builder_Xms -Xmx$atavism_builder_Xmx ${JAVA_FLAGS} "
JAVA_AUCTION="${JVM_FLAG}  -Xms$atavism_auction_Xms -Xmx$atavism_auction_Xmx ${JAVA_FLAGS} "
JAVA_WEATHER="${JVM_FLAG}  -Xms$atavism_weather_Xms -Xmx$atavism_weather_Xmx ${JAVA_FLAGS} "
JAVA_FACTION="${JVM_FLAG}  -Xms$atavism_faction_Xms -Xmx$atavism_faction_Xmx ${JAVA_FLAGS} "
JAVA_QUEST="${JVM_FLAG}    -Xms$atavism_quest_Xms -Xmx$atavism_quest_Xmx ${JAVA_FLAGS} "
JAVA_CHAT="${JVM_FLAG}     -Xms$atavism_chat_Xms -Xmx$atavism_chat_Xmx ${JAVA_FLAGS} "
#JAVA_ALL_IN_ONE="${JVM_FLAG} -Xms$atavism_all_in_one_Xms -Xmx$atavism_all_in_one_Xmx ${JAVA_FLAGS} "
JAVA_ALL_IN_ONE="${JVM_FLAG} ${JAVA_FLAGS} "

case "$1" in

    start)
        id="1"
        start_server
        ;;
    stop)
        id="1"
        stop_server
        ;;
    status)
        id="1"
        status_server
        ;;
    restart)
        id="1"
        stop_server
        start_server
        ;;
    proxy)
        id="${2}"
        start_proxy
        ;;
    wmgr)
        id="${2}"
        start_world_manager
        ;;
    domain)
        start_domain
        ;;
    combat)
        id="${2}"
        start_combat
        ;;
    instance)
        start_instance
        ;;
    login)
        start_login
        ;;
    objmgr)
        start_object_manager
        ;;
    mob)
        id="${2}"
        start_mob
        ;;
    arena)
        start_arena
        ;;
    auction)
        start_auction_house
        ;;
    weather)
        start_weather
        ;;
    builder)
        start_builder
        ;;
    chat)
        start_chat
        ;;
    faction)
        start_faction
        ;;
    quest)
        start_quest	
        ;;
    prefab)
        start_prefab
        ;;
    all_in_one)
        start_all_in_one
        ;;
    *)
        echo "usage $0 -v -C start|stop|status|restart|proxy|wmgr|domain|combat|instance|login|objmgr|mob|arena|builder|auction|weather|faction|chat|quest|prefab|all_in_one"

esac 
 
