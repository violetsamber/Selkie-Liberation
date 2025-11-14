/*
    File: fn_send_paratroopers_spawn_troops.sqf
    Authors: Violets
    Date: 2025-11-06
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
#include "send_paratroopers_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_para_group",grpNull)
PFH_GETVAR(_pfh,"_vehicle",objNull)
PFH_GETVAR(_pfh,"_maxCargo",0)
PFH_GETVAR(_pfh,"_stageIndex",0)

PFH_GETPARAM(_pfh,_spawnPos,PARA_VAR_SPAWN_POS)

//Create paratroopers

if (isNull _para_group) then {
    _para_group = createGroup [GRLIB_side_enemy, true];
    _maxCargo = ((_vehicle emptyPositions "") - 1);
    // private _additional = count fullCrew [_vehicle, "gunner", true];
    // ADD(_maxCargo,_additional);
    [format ["[PARATROOPERS] Creating Group: %1, Max Cargo: %2", _para_group, _maxCargo]] call KPLIB_fnc_log;
};

private _unitCount = count (units _para_group);
if(_unitCount <= _maxCargo) then {
    private _unitIndex = _unitCount;
    _unitIndex = (_unitIndex min (count SLKLIB_opfor_paratroopers_a));
    private _unitClass = SLKLIB_opfor_paratroopers_a select _unitIndex;

    [format ["[PARATROOPERS] Spawning Paratrooper: %1", _unitClass]] call KPLIB_fnc_log;

    private _unit = [_unitClass, _spawnPos, _para_group] call KPLIB_fnc_createManagedUnit;
    removeBackpack _unit;
    _unit addBackpack "B_parachute";
    _unit assignAsCargoIndex [_vehicle, _unitCount + 1];
    _unit moveInCargo _vehicle;
    [_unit] allowGetIn true;
    [_unit] orderGetIn true;
} else {
    INCREMENT(_stageIndex)
};

[_stageIndex, _para_group, _maxCargo]
