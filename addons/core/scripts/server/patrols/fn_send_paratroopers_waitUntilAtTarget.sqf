/*
    File: fn_send_paratroopers_flyTo.sqf
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
#include "send_paratroopers_macros.hpp"

params [
    ["_pfh", objNull],
    ["_maxDamage", 0.4],
    ["_minDistance", 400]
];

PFH_GETVAR(_pfh,"_stageIndex",0)
PFH_GETVAR(_pfh,"_vehicle",objNull)

PFH_GETPARAM(_pfh,_targetPos,PARA_VAR_TARGET_POS)

if (!(alive _vehicle) || (damage _vehicle > _maxDamage ) || (_vehicle distance _targetPos < _minDistance )) then {
    INCREMENT(_stageIndex)
};

[_stageIndex]
