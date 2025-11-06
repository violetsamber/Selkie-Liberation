// This script will be executed once for each mission, once the mission has started.

#include "script_component.hpp"

["[XEH_sharedPostInit] SharedPostInit","INIT"] call KPLIB_fnc_log;

// CBA EVENT HANDLERS GO HERE
//[QGVAR(myEvent), LINKFUNC(handleMyEvent)] call CFUNC(addEventHandler); // Registers CBA XEH event QGVAR(myEvent) which calls handleMyEvent.

//Chat Commands
["spawnbattlegroup", {
    [] call KPLIB_server_fnc_spawn_battlegroup;
}, "admin"] call CBA_fnc_registerChatCommand;
