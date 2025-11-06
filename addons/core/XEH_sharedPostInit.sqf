// This script will be executed once for each mission, once the mission has started.

#include "script_component.hpp"

// CBA EVENT HANDLERS GO HERE
["[XEH_SharedPostInit] SharedPostInit","INIT"] call KPLIB_fnc_log;

//[QGVAR(myEvent), LINKFUNC(handleMyEvent)] call CFUNC(addEventHandler); // Registers CBA XEH event QGVAR(myEvent) which calls handleMyEvent.
