/*
    File: fn_send_paratroopers.sqf
    Authors: Violets
    Date: 2025-11-01
    Last Update: 2025-11-06
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
#include "../FunctionsInclude.hpp"

params [
    ["_targetsector", "", ["",[]]],
    ["_vehicle", objNull, [objNull]]
];

if (_targetsector isEqualTo "" || opfor_choppers isEqualTo []) exitWith {false};

private _targetPos = _targetsector;
if (_targetPos isEqualType "") then {
    _targetPos = markerPos _targetsector;
};

private _spawnSector = ([sectors_airspawn, [_targetPos], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _spawnPos = markerPos _spawnsector;

_targetPos = [_targetPos, 100] call KPLIB_fnc_getRandomPointInCircle;

[
    {
        //Update
        private _return = [];

        switch (_stageIndex) do
        {
            case 0: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_spawn_vehicle; 
                _vehicle = _return select 0;
                _pilot_group = _return select 1;
                INCREMENT(_stageIndex)
            };
            case 1: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_spawn_troops;  
                _stageIndex = _return select 0;
                _para_group = _return select 1;
            };
            case 2: {
                [_pilot_group] call KPLIB_server_fnc_clearGrpWaypoints;
                [_para_group]  call KPLIB_server_fnc_clearGrpWaypoints;
                _vehicle flyInHeight 100;
                INCREMENT(_stageIndex)
            };
            case 3: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_waypoints_flyTo;
                _stageIndex         = _return select 0;
                _stageWorkerIndex_0 = _return select 1;
            };
            case 4: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_waitUntilAtTarget;
                _stageIndex = _return select 0;
            };
            case 5: { 
                [_this] call KPLIB_server_fnc_send_paratroopers_cargoGetOut;
                INCREMENT(_stageIndex)
            };
            case 6: {
                [_pilot_group] call KPLIB_server_fnc_clearGrpWaypoints;
                [_para_group]  call KPLIB_server_fnc_clearGrpWaypoints;
                _vehicle flyInHeight 100;
                INCREMENT(_stageIndex)
            };
            case 7: {
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_waypoints_arrived;
                _stageIndex         = _return select 0;
                _stageWorkerIndex_0 = _return select 1;
            };
            default {
                _isFinished = true;
            }
        };
    },
    0.5,
    [_targetsector, _targetPos, _spawnSector, _spawnPos, _vehicle],
    {
        //Start
        _isFinished = false;
        _isStageFinished = false;
        _stageIndex = 0;
        _stageWorkerIndex_0 = 0;
        _vehicle = _this getVariable "params" select 4;
        _pilot_group = grpNull;
        _para_group = grpNull;
        _maxCargo = 0;

    },
    {
        //End
    },
    {
        //Can Run 
        !_isFinished 
    },
    {
        //Can Exit
        _isFinished 
    },
    ["_isFinished", "_stageIndex", "_isStageFinished", "_stageWorkerIndex_0", "_vehicle", "_pilot_group", "_para_group", "_maxCargo"]
] call CBA_fnc_createPerFrameHandlerObject;
