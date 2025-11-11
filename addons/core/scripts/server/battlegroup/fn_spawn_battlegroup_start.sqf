/*
    File: fn_spawn_battlegroup_start.sqf
    Authors: Violets
    Date: 2025-11-05
    Last Update: 2025-11-11
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"
#include "battlegroup_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETPARAM(_pfh,_infOnly,PFH_PARAM_INFONLY)
PFH_GETPARAM(_pfh,_battlegroupSize,PFH_PARAM_BATTLEGROUP_SIZE)

[format["[BATTLEGROUP] Starting battlegroup setup. InfOnly: %1, Battlegroup Size %2", _infOnly, _battlegroupSize]] call KPLIB_fnc_log;

private _battlegroup_vehicles = [];
private _battlegroup_infantry = [];
private _num_odst_drops = 0;

GRLIB_last_battlegroup_time = diag_tickTime;

if (_infOnly) then {
    // Infantry units to choose from
    private _infClasses = [KPLIB_o_inf_classes, militia_squad] select (SLKLIB_combat_readiness < 50);

    // Adjust target size for infantry
    ADD(_battlegroupSize,1);

    private _squadNumber = (_battlegroupSize * 2);

    for "_i" from 1 to _squadNumber do {
        private _grpList = [];
        for "_i" from 0 to 7 do {
            _grpList pushBack selectRandom _infClasses;
        };
        _battlegroup_infantry pushBack _grpList;
    };

} else {

    private _return = [];

    switch (_battlegroupSize) do 
    {
        case 0: {
            _return = [_pfh] call SLKLIB_fnc_getBattlegroupTiny;
        };
        case 1: {
            _return = [_pfh] call SLKLIB_fnc_getBattlegroupTiny;
        };
        case 2: {
            _return = [_pfh] call SLKLIB_fnc_getBattlegroupTiny;
        };
        case 3: {
            _return = [_pfh] call SLKLIB_fnc_getBattlegroupTiny;
        };
        case 4: {
            _return = [_pfh] call SLKLIB_fnc_getBattlegroupTiny;
        };
        default {
            [format ["[WARNING] battlegroup size is %1 which is an invalid number.", _battlegroupSize],"BATTLEGROUP"] call KPLIB_fnc_log;
        };
    };

    _battlegroup_vehicles = _return select 0;
    _battlegroup_infantry = _return select 1;
    _num_odst_drops = _return select 2;

    //TODO Handle diffrently
    // [_spawn_marker] spawn
    // {
    //     params ["_spawn_marker"];
    //     [_spawn_marker, [markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective, 3] call KPLIB_server_fnc_odstDrop; 
    // };

    //TODO Handle diffrently
    // if (GRLIB_csat_aggressivity > 0.5) then {
    //     [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn KPLIB_server_fnc_spawn_boat;
    // };

    //TODO Handle diffrently
    // if (GRLIB_csat_aggressivity > 0.9) then {
    //     [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn KPLIB_server_fnc_spawn_air;
    // };
};
["[BATTLEGROUP] Finished fn_spawn_battlegroup_start"] call KPLIB_fnc_log;

[_battlegroup_vehicles, _battlegroup_infantry]
