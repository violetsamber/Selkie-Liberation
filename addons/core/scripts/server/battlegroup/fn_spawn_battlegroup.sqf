/*
    File: fn_spawn_battlegroup.sqf
    Authors: Violets, KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2025-11-5
    Last Update: 2025-11-13
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Spawns a battlegroup at a marker at a target objective

    Parameter(s):

    Returns:
*/

#include "battlegroup_macros.hpp"

params [
    ["_targetMarker", "", [""]],
    ["_infOnly", false, [false]],
    ["_battlegroupSize", -1],
    ["_waitTime", -1]
];

if (GRLIB_endgame == 1) exitWith {};

private _spawn_marker = [[2000, 1000] select _infOnly, 3000, false, markerPos _targetMarker] call KPLIB_fnc_getOpforSpawnPoint;

if(_targetMarker == "") then {
    _targetMarker = [markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforMarker;
};

if (_spawn_marker isEqualTo "") then { ["No valid _spawn_marker!"] call BIS_fnc_error; false };
private _spawnMarkerPos = markerPos _spawn_marker;

// private _target_size = (round (GRLIB_battlegroup_size * ([] call KPLIB_fnc_getOpforFactor) * (sqrt GRLIB_csat_aggressivity))) min 16;

// if (SLKLIB_combat_readiness < 60) then {_target_size = round (_target_size * 0.65);};

if(_battlegroupSize == -1) then {
    _battlegroupSize = [_targetMarker] call KPLIB_server_fnc_battlegroup_calculate_size;
};

if(_waitTime == -1) then {
    _waitTime = ((_battlegroupSize + 1) * 90);
};


[_spawn_marker, _battlegroupSize] remoteExec ["KPLIB_shared_fnc_remote_call_battlegroup"];

["----Starting Spawn Battlegroup----", "BATTLEGROUP"] call KPLIB_fnc_log;
[format ["_infOnly: %1, _spawn_marker: %2, _spawnMarkerPos: %3", _infOnly, _spawn_marker, _spawnMarkerPos], "BATTLEGROUP"] call KPLIB_fnc_log;
[format ["_targetMarker: %1", _targetMarker], "BATTLEGROUP"] call KPLIB_fnc_log;
[format ["_battlegroupSize %1", _battlegroupSize], "BATTLEGROUP"] call KPLIB_fnc_log;
[format ["_waitTime %1", _waitTime], "BATTLEGROUP"] call KPLIB_fnc_log;

GRLIB_last_battlegroup_time = diag_tickTime;

//Look into adding clearance for all battlegroups so they can spawn easier and remove when they leave the area
if (worldName in KP_liberation_battlegroup_clearance) then {
    [markerPos _spawn_marker, 30] call KPLIB_fnc_createClearance;
};

[
    { 
        private _return = [_this, _spawnMarkerPos] call KPLIB_server_fnc_spawn_battlegroup_update;
        _bg_groups = _return select 0;
        _isFinished = _return select 1;
        _waitTimer = _return select 2;
        _stageIndex = _return select 3;
    },
    0.5,
    [_infOnly, _spawn_marker, _spawnMarkerPos, _battlegroupSize, _waitTime],
    {
        _isFinished = false;
        _bg_groups = [];
        _battlegroup_vehicles = [];
        _battlegroup_infantry = [];
        _waitTimer = 0;
        _stageIndex = 0;
        
        private _return = [_this] call KPLIB_server_fnc_spawn_battlegroup_start;
        
        _battlegroup_vehicles = _return select 0;
        _battlegroup_infantry = _return select 1;
    },
    { [_this] call KPLIB_server_fnc_spawn_battlegroup_end; },
    { !_isFinished },
    { _isFinished },
    ["_isFinished", "_bg_groups", "_battlegroup_vehicles", "_battlegroup_infantry", "_waitTimer", "_stageIndex"]
] call CBA_fnc_createPerFrameHandlerObject;
