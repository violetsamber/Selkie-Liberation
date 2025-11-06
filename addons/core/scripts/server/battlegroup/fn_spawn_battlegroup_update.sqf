/*
    File: fn_spawn_battlegroup_update.sqf
    Authors: Violets
    Date: 2025-11-05
    Last Update: 2025-11-06
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_pfh", objNull]
];

["[BATTLEGROUP] Update"] call KPLIB_fnc_log;

[_pfh getVariable "_battlegroup_vehicles"] params [["_battlegroup_vehicles", []]];
[_pfh getVariable "_battlegroup_infantry"] params [["_battlegroup_infantry", []]];
[_pfh getVariable "_bg_groups"]            params [["_bg_groups", []]];

private _spawnMarkerPos = _pfh getVariable "params" select 2;

private _isFinished = false;

// //Spawn all infanty
// for "_i" from 1 to _squadNumber do {
//     // Create infantry groups with up to 8 units per squad
//     private _grp = createGroup [GRLIB_side_enemy, true];
//     for "_i" from 0 to 7 do {
//         [selectRandom _infClasses, markerPos _spawn_marker, _grp] call KPLIB_fnc_createManagedUnit;
//     };
//     [_grp] call KPLIB_fnc_LAMBS_enableReinforcements;
//     [_grp] call KPLIB_server_fnc_battlegroup_ai;
//     _grp setVariable ["KPLIB_isBattleGroup",true];
// };


//Spawn all vehicles

if(count _battlegroup_vehicles > 0) then {
    private _vehicleClass = _battlegroup_vehicles select 0;
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
            [[_spawnMarkerPos] call KPLIB_fnc_getNearestBluforObjective, _vehicle] spawn KPLIB_server_fnc_send_paratroopers;
        } else {
            [_vehicle] spawn KPLIB_server_fnc_troup_transport;
        };
    };
    _battlegroup_vehicles deleteAt 0;
} else {
    _isFinished = true;
};

[_bg_groups, _isFinished]
