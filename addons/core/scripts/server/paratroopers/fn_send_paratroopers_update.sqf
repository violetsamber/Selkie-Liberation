/*
    File: fn_send_paratroopers_update.sqf
    Authors: 
    Date: 2025-11-07
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

params [
    ["_pfh"], 
    ["_isFinished"], 
    ["_stageIndex"], 
    ["_isStageFinished"], 
    ["_stageWorkerIndex_0"], 
    ["_vehicle"], 
    ["_pilot_group"], 
    ["_para_group"], 
    ["_maxCargo"]
];

private _return = [];

switch (_stageIndex) do
{
    case 0: { 
        _return = [_pfh] call KPLIB_server_fnc_send_paratroopers_spawn_vehicle; 
        _vehicle = _return select 0;
        _pilot_group = _return select 1;
        INCREMENT(_stageIndex)
    };
    case 1: { 
        _return = [_pfh] call KPLIB_server_fnc_send_paratroopers_spawn_troops;  
        _stageIndex = _return select 0;
        _para_group = _return select 1;
        _maxCargo = _return select 2;
    };
    case 2: {
        [_pilot_group] call KPLIB_fnc_clearGrpWaypoints;
        [_para_group]  call KPLIB_fnc_clearGrpWaypoints;
        _vehicle flyInHeight 100;
        INCREMENT(_stageIndex)
    };
    case 3: { 
        _return = [_pfh] call KPLIB_server_fnc_send_paratroopers_waypoints_flyTo;
        _stageIndex         = _return select 0;
        _stageWorkerIndex_0 = _return select 1;
    };
    case 4: { 
        _return = [_pfh] call KPLIB_server_fnc_send_paratroopers_waitUntilAtTarget;
        _stageIndex = _return select 0;
    };
    case 5: { 
        _return = [_pfh] call KPLIB_server_fnc_send_paratroopers_cargoGetOut;
        _stageIndex         = _return select 0;
        _stageWorkerIndex_0 = _return select 1;
    };
    case 6: {
        [_pilot_group] call KPLIB_fnc_clearGrpWaypoints;
        [_para_group]  call KPLIB_fnc_clearGrpWaypoints;
        _vehicle flyInHeight 100;
        INCREMENT(_stageIndex)
    };
    case 7: {
        _return = [_pfh] call KPLIB_server_fnc_send_paratroopers_waypoints_arrived;
        _stageIndex         = _return select 0;
        _stageWorkerIndex_0 = _return select 1;
    };
    default {
        _isFinished = true;
    }
};

[_isFinished, _stageIndex, _isStageFinished, _stageWorkerIndex_0, _vehicle, _pilot_group, _para_group, _maxCargo]
