/*
    File: fn_battlegroup_ai.sqf
    Authors: Violets
    Date: 2025-11-01
    Last Update: 2025-11-07
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
params [
    ["_grp", grpNull, [grpNull]]
];

if (isNull _grp) exitWith {};

private _leader = leader _grp;
private _startpos = getPos _leader;
private _objPos = [_startPos] call KPLIB_fnc_getNearestBluforObjective;

[_grp] call CBA_fnc_clearWaypoints;

[
    { 
        private _return = [_this] call KPLIB_server_fnc_battlegroup_ai_create_waypoints;
        private _isFinished = _return select 0;
        private _index      = _return select 1;
    },
    0.25,
    [_grp, _objPos],
    { private _isFinished = false; private _index = 0; },
    {},
    { !_isFinished },
    { _isFinished },
    ["_isFinished", "_index"]
] call CBA_fnc_createPerFrameHandlerObject;
