/*
    File: fn_send_paratroopers_waypoints_fly.sqf
    Authors: Violets
    Date: 2025-11-06
    Last Update: 2025-11-06
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

PFH_GETPARAM(_pfh,_targetPos,PARA_VAR_TARGET_POS)

switch (_stageWorkerIndex_0) do {
    case 0: { 
        _vehicle flyInHeight 100;
        [_pilot_group, _targetPos, 25, "MOVE", "CARELESS", "BLUE", "FULL", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 1: {
        [_pilot_group, _targetPos, 25, "MOVE", "CARELESS", "BLUE", "FULL", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 2: {
        [_pilot_group, _targetPos, 700, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 3: {
        [_pilot_group, _targetPos, 700, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 4: {
        [_pilot_group, _targetPos, 700, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        _pilot_group setCurrentWaypoint [_pilot_group, 1];
        INCREMENT(_stageWorkerIndex_0)
    };
    case 5: {
        [_para_group, _targetPos, 100, "MOVE", "COMBAT", "YELLOW", "NORMAL", "NO CHANGE", "", [0,0,0], 50] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 6: {
        [_para_group, _targetPos, 100, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [0,0,0], 50] call CBA_fnc_addWaypoint;
        _pilot_group setCurrentWaypoint [_para_group, 1];
        INCREMENT(_stageWorkerIndex_0)
    };
    default {
        _stageWorkerIndex_0 = 0;
        INCREMENT(_stageIndex)
    };
};

[_stageIndex, _stageWorkerIndex_0]
