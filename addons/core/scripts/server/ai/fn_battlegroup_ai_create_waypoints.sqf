/*
    File: fn_battlegroup_ai_create_waypoints.sqf
    Authors: 
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

#include "../FunctionsInclude.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_index",0)

PFH_GETPARAM(_pfh,_grp,0)
PFH_GETPARAM(_pfh,_objPos,1)

private _isFinished = false;

switch (_index) do
{
    case 0: { [_grp, _objPos, 100, "MOVE", "AWARE", "YELLOW", "NORMAL", "NO CHANGE", "", [0,0,0], 30] call CBA_fnc_addWaypoint };
	case 1: { [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint };
	case 2: { [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint };
    case 3: { [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint };
    case 4: { [_grp, _objPos, 100, "CYCLE"] call CBA_fnc_addWaypoint };
    case default {
        INCREMENT(_index)
        _isFinished = true;
    };
};

[_isFinished, _index]
