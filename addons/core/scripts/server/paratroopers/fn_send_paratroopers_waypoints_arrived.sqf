/*
    File: fn_send_paratroopers_waypoints_arrived.sqf
    Authors: 
    Date: 2025-11-06
    Last Update: 2025-11-07
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"
#include "send_paratroopers_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_vehicle",objNull)
PFH_GETVAR(_pfh,"_para_group",grpNull)
PFH_GETVAR(_pfh,"_pilot_group",grpNull)
PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_stageIndex",0)

PFH_GETPARAM(_pfh,_spawnPos,PARA_VAR_SPAWN_POS)

[format ["[PARATROOPERS] Arrived workerIndex_0: %1 _spawnPos: %2", _stageWorkerIndex_0, _spawnPos]] call KPLIB_fnc_log;

switch (_stageWorkerIndex_0) do {
    case 0: { 
        [_pilot_group, _spawnPos, 0, "MOVE", "CARELESS", "BLUE", "FULL", "NO CHANGE", "[this call CBA_fnc_getGroup] call KPLIB_fnc_deleteGroup", [0,0,0], 500] call CBA_fnc_addWaypoint;
        _vehicle flyInHeight 100;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 1: {
        [_para_group] call KPLIB_server_fnc_battlegroup_ai;
        _para_group setVariable ["KPLIB_isBattleGroup",true];
        INCREMENT(_stageWorkerIndex_0)
    };
    default {
        _stageWorkerIndex_0 = 0;
        INCREMENT(_stageIndex)
    };
};

[_stageIndex, _stageWorkerIndex_0]
