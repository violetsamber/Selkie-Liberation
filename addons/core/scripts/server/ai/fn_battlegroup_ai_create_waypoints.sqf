/*
    File: fn_battlegroup_ai_create_waypoints.sqf
    Authors: 
    Date: 2025-11-05
    Last Update: 2025-11-05
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

[_pfh getVariable "_index"] params [["_index", 0, [0]]];

private _grp    = _pfh getVariable "params" select 0;
private _objPos = _pfh getVariable "params" select 1;
private _isFinished = false;

switch (_index) do
{
    case 0: { [_grp, _objPos, 100, "MOVE", "AWARE", "YELLOW", "NORMAL", "NO CHANGE", "", [0,0,0], 30] call CBA_fnc_addWaypoint };
	case 1: { [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint };
	case 2: { [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint };
    case 3: { [_grp, _objPos, 100, "SAD"] call CBA_fnc_addWaypoint };
    case 4: { [_grp, _objPos, 100, "CYCLE"] call CBA_fnc_addWaypoint };
};
_index = (1 + _index);
if(_index >= 4) then { _isFinished = true; };

[_isFinished, _index]
