/*
    File: fn_spawn_battlegroup_update.sqf
    Authors: Violets
    Date: 2025-11-05
    Last Update: 2025-11-13
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
    ["_pfh", objNull]
];

["[BATTLEGROUP] Update"] call KPLIB_fnc_log;

PFH_GETVAR(_pfh,"_battlegroup_vehicles",[])
PFH_GETVAR(_pfh,"_battlegroup_infantry",[])
PFH_GETVAR(_pfh,"_bg_groups",[])

PFH_GETPARAM(_pfh,_spawnMarkerPos,2)

private _isFinished = false;
private _didSpawn = false;


if(_battlegroup_infantry isNotEqualTo []) then {
    
    private _grp = createGroup [GRLIB_side_enemy, true];

    {
        [format ["[BATTLEGROUP] Spawning... Unit: %1 At: %2 Into: %3", _x, _spawnMarkerPos, _grp]] call KPLIB_fnc_log;
        [_x, _spawnMarkerPos, _grp] call KPLIB_fnc_createManagedUnit;
    } 
    forEach (_battlegroup_infantry select 0);

    [_grp] call KPLIB_fnc_LAMBS_enableReinforcements;
    [_grp] call KPLIB_server_fnc_battlegroup_ai;
    _grp setVariable ["KPLIB_isBattleGroup",true];

    _battlegroup_infantry deleteAt 0;
    _didSpawn = true;
};

if(_battlegroup_vehicles isNotEqualTo [] && !_didSpawn) then {
    private _vehicleClass = _battlegroup_vehicles select 0;
    _battlegroup_vehicles deleteAt 0; //Remove Here in the case that the spawn fails at KPLIB_fnc_spawnVehicle
    [format ["[BATTLEGROUP] Spawning... %1", _vehicleClass]] call KPLIB_fnc_log;

    private _nextgrp = createGroup [GRLIB_side_enemy, true];
    private _vehicle = [_spawnMarkerPos, _vehicleClass] call KPLIB_fnc_spawnVehicle;

    if (isNull _vehicle) exitWith { 
        [format ["[BATTLEGROUP] Failed to spawn %1 at %2", _vehicleClass, _spawnMarkerPos]] call KPLIB_fnc_log;
    };

    (crew _vehicle) joinSilent _nextgrp;
    [_nextgrp] call KPLIB_server_fnc_battlegroup_ai;
    _nextgrp setVariable ["KPLIB_isBattleGroup",true];
    _bg_groups pushBack _nextgrp;

    if ((_vehicleClass in opfor_troup_transports) && ([] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap)) then {
        if (_vehicle isKindOf "Air") then {
            [[_spawnMarkerPos] call KPLIB_fnc_getNearestBluforObjective, _vehicle] call KPLIB_server_fnc_send_paratroopers;
        } else {
            [_vehicle] spawn KPLIB_server_fnc_troup_transport;
        };
    };
    _didSpawn = true;
};

if(_battlegroup_vehicles isEqualTo [] && _battlegroup_infantry isEqualTo []) then {
    _isFinished = true;
};

[_bg_groups, _isFinished]
