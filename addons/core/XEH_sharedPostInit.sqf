// This script will be executed once for each mission, once the mission has started.

#include "script_component.hpp"

["[XEH_sharedPostInit] SharedPostInit","INIT"] call KPLIB_fnc_log;

// CBA EVENT HANDLERS GO HERE
//[QGVAR(myEvent), LINKFUNC(handleMyEvent)] call CFUNC(addEventHandler); // Registers CBA XEH event QGVAR(myEvent) which calls handleMyEvent.

["[XEH_sharedPostInit.sqf] Waiting for server...", "INIT"] call KPLIB_fnc_log;
if (!isServer) then {waitUntil {!isNil "KPLIB_initServer"};};

["[XEH_sharedPostInit.sqf] Initializing", "INIT"] call KPLIB_fnc_log;

[] call KPLIB_init_fnc_fetch_params;
[] call KPLIB_init_fnc_liberation_config;
[] call KPLIB_init_fnc_presets;
[] call KPLIB_init_fnc_objectInits;
[] call KPLIB_init_fnc_variables;

// Activate selected player menu. If CBA isn't loaded -> fallback to GREUH
// if (kpplm_cba && KP_liberation_playermenu) then {
//     [] call KPPLM_fnc_postInit;
// } else {
//     [] execVM "GREUH\scripts\GREUH_activate.sqf";
// };

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

// Execute fnc_reviveInit again (by default it executes in postInit)
if ((isNil {player getVariable "bis_revive_ehHandleHeal"} || isDedicated) && (bis_reviveParam_mode != 0)) then {
    [] call bis_fnc_reviveInit;
};
