/*
    File: fn_send_paratroopers_waitUntilAtTarget.sqf
    Authors: Violets
    Date: 2025-11-06
    Last Update: 2025-11-14
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
    ["_pfh", objNull],
    ["_maxDamage", 0.4],
    ["_minDistance", 500]
];

PFH_GETVAR(_pfh,"_stageIndex",0)
PFH_GETVAR(_pfh,"_vehicle",objNull)
PFH_GETPARAM(_pfh,_targetPos,PARA_VAR_TARGET_POS)

if (!(alive _vehicle) || (damage _vehicle > _maxDamage ) || (_vehicle distance _targetPos < _minDistance )) then {
    [format ["[PARATROOPERS] At target: %1 Or Max Damage: %2 Or Vehicle Dead: %3", _targetPos, damage _vehicle, alive _vehicle]] call KPLIB_fnc_log;
    INCREMENT(_stageIndex)
};

[_stageIndex]
