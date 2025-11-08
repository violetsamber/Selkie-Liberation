/*
    File: fn_battlegroup_ai_create_waypoints.sqf
    Authors: 
    Date: 2025-11-05
    Last Update: 2025-11-07
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

PFH_GETVAR(_pfh,"_index",0)

PFH_GETPARAM(_pfh,_grp,0)
PFH_GETPARAM(_pfh,_objPos,1)

private _isFinished = false;

[format ["[BATTLEGROUP_AI] _index: %1", _index]] call KPLIB_fnc_log;

switch (_index) do
{
    case 0: { 
        [_grp, _objPos, 100, "MOVE", "AWARE", "YELLOW", "NORMAL", "NO CHANGE", "", [0,0,0], 30] call CBA_fnc_addWaypoint;
        INCREMENT(_index)
    };
	case 1: { 
        [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint;
        INCREMENT(_index)
    };
	case 2: { 
        [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint; 
        INCREMENT(_index)
    };
    case 3: { 
        [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint;
        INCREMENT(_index)
    };
    case 4: { 
        [_grp, _objPos, 100, "CYCLE"] call CBA_fnc_addWaypoint;
        INCREMENT(_index)
    };
    case default {
        _isFinished = true;
    };
};

[_isFinished, _index]
