/*
    File: fn_send_paratroopers_waypoints_fly.sqf
    Authors: Violets
    Date: 2025-11-06
    Last Update: 2025-11-14
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

[format ["[PARATROOPERS] FlyTo _para_group: %1, workerIndex_0: %2", _para_group, _stageWorkerIndex_0]] call KPLIB_fnc_log;

switch (_stageWorkerIndex_0) do {
    case 0: { 
        _vehicle flyInHeight 100;

        private _targetDir = (_targetPos vectorDiff getPos _vehicle);
        _targetDir = vectorNormalized _targetDir;
        _targetDir = _targetDir vectorMultiply 400;

        private _wind = wind vectorMultiply 100;

        //Unsteerable parashutes seem to fall at a rate of 3 m/s

        private _targetWaypointPos =  (_targetDir vectorAdd _targetPos);
        _targetWaypointPos = (_targetWaypointPos vectorDiff _wind);

        [format ["[PARATROOPERS] Drop point calc _targetDir: %1, _wind: %2, _targetWaypointPos %3", _targetDir, _wind, _targetWaypointPos]] call KPLIB_fnc_log;

        //_targetWaypointPos = (_targetDir vectorDiff _wind);
        

        [_pilot_group, _targetWaypointPos, 50, "MOVE", "AWARE", "WHITE", "FULL", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        _pilot_group setCurrentWaypoint [_pilot_group, 1];
        INCREMENT(_stageWorkerIndex_0)
    };
    case 1: {
        [_pilot_group, _targetPos, 100, "MOVE", "AWARE", "WHITE", "FULL", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 2: {
        [_pilot_group, _targetPos, 100, "MOVE", "AWARE", "WHITE", "FULL", "NO CHANGE", "", [0,0,0], 100] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    case 2: {
        [_para_group, _targetPos, 10, "MOVE", "AWARE", "WHITE", "FULL", "NO CHANGE", "", [0,0,0], 0] call CBA_fnc_addWaypoint;
        INCREMENT(_stageWorkerIndex_0)
    };
    default {
        [format ["[PARATROOPERS] FlyTo FINISHED _para_group: %1 workerIndex_0: %2", _para_group, _stageWorkerIndex_0]] call KPLIB_fnc_log;
        _stageWorkerIndex_0 = 0;
        INCREMENT(_stageIndex)
    };
};

[_stageIndex, _stageWorkerIndex_0]
