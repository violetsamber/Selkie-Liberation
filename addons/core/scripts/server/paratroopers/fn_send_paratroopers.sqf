/*
    File: fn_send_paratroopers.sqf
    Authors: Violets
    Date: 2025-11-01
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
    ["_targetsector", "", ["",[]]],
    ["_vehicle", objNull, [objNull]]
];

if (_targetsector isEqualTo "" || opfor_choppers isEqualTo []) exitWith {false};

private _targetPos = _targetsector;
if (_targetPos isEqualType "") then {
    _targetPos = markerPos _targetsector;
};

private _spawnSector = ([sectors_airspawn, [_targetPos], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _spawnPos = markerPos _spawnSector;

_targetPos = [_targetPos, 100] call KPLIB_fnc_getRandomPointInCircle;

[format ["[PARATROOPERS] Starting script with: _targetsector: %1, _targetPos: %2, _spawnSector %3, _spawnPos %4, _vehicle: %5", _targetsector, _targetPos, _spawnSector, _spawnPos, _vehicle]] call KPLIB_fnc_log;

[
    {
        //Update
        [_isFinished, _stageIndex, _isStageFinished, _stageWorkerIndex_0, _vehicle, _pilot_group, _para_group, _maxCargo] call KPLIB_server_fnc_send_paratroopers_update;
    },
    0.5,
    [_targetsector, _targetPos, _spawnSector, _spawnPos, _vehicle],
    {
        //Start
        private _isFinished = false;
        private _isStageFinished = false;
        private _stageIndex = 0;
        private _stageWorkerIndex_0 = 0;
        private _vehicle = _this getVariable "params" select PARA_VAR_VEHICLE;
        private _pilot_group = grpNull;
        private _para_group = grpNull;
        private _maxCargo = 0;
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
