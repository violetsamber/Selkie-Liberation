/*
    File: fn_send_paratroopers_spawn_troops.sqf
    Authors: Violets
    Date: 2025-11-06
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
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_para_group",grpNull)
PFH_GETVAR(_pfh,"_vehicle",objNull)
PFH_GETVAR(_pfh,"_maxCargo",0)
PFH_GETVAR(_pfh,"_stageIndex",0)

//Create paratroopers

if (isNull _para_group) then {
    _para_group = createGroup [GRLIB_side_enemy, true];
    _maxCargo = count fullCrew [_vehicle, "cargo", true];
};

if((count (units _para_group)) < _maxCargo) then {
    private _unit = [opfor_paratrooper, markerPos _spawnsector, _para_group] call KPLIB_fnc_createManagedUnit;
    removeBackpack _unit;
    _unit addBackpack "B_parachute";
    _unit moveInCargo _vehicle;
} else {
    INCREMENT(_stageIndex)
};

[_stageIndex, _para_group]
