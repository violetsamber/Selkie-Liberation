/*
    File: fn_spawn_battlegroup.sqf
    Authors: Violets, KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2025-11-5
    Last Update: 2025-11-11
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Spawns a battlegroup at a marker at a target objective

    Parameter(s):

    Returns:
*/

#include "battlegroup_macros.hpp"

params [
    ["_targetMarker", "", [""]],
    ["_infOnly", false, [false]]
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

private _battlegroupSize = [_targetMarker] call KPLIB_server_fnc_battlegroup_calculate_size;

[_spawn_marker] remoteExec ["KPLIB_shared_fnc_remote_call_battlegroup"];

["----Starting Spawn Battlegroup----", "BATTLEGROUP"] call KPLIB_fnc_log;
[format ["_infOnly: %1, _spawn_marker: %2, _spawnMarkerPos: %3", _infOnly, _spawn_marker, _spawnMarkerPos], "BATTLEGROUP"] call KPLIB_fnc_log;
[format ["_targetMarker: %1", _targetMarker], "BATTLEGROUP"] call KPLIB_fnc_log;

//Look into adding clearance for all battlegroups so they can spawn easier and remove when they leave the area
if (worldName in KP_liberation_battlegroup_clearance) then {
    [markerPos _spawn_marker, 30] call KPLIB_fnc_createClearance;
};

[
    { 
        private _return = [_this, _spawnMarkerPos] call KPLIB_server_fnc_spawn_battlegroup_update;
        _bg_groups = _return select 0;
        _isFinished = _return select 1;
    },
    0.5,
    [_infOnly, _spawn_marker, _spawnMarkerPos, _battlegroupSize],
    {
        _isFinished = false;
        _bg_groups = [];
        _battlegroup_vehicles = [];
        _battlegroup_infantry = [];
        
        private _return = [_this] call KPLIB_server_fnc_spawn_battlegroup_start;
        
        _battlegroup_vehicles = _return select 0;
        _battlegroup_infantry = _return select 1;
    },
    { [_this] call KPLIB_server_fnc_spawn_battlegroup_end; },
    { !_isFinished },
    { _isFinished },
    ["_isFinished", "_bg_groups", "_battlegroup_vehicles", "_battlegroup_infantry"]
] call CBA_fnc_createPerFrameHandlerObject;
