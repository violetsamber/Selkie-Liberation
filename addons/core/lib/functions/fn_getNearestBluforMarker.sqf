/*
    File: fn_getNearestBluforMarker.sqf
    Authors: Violets
    Date: 2025-11-10
    Last Update: 2025-11-10
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_pos", [0, 0, 0], [[]], [2, 3]]
];

private _bluPos = [_pos] call KPLIB_fnc_getNearestBluforObjective;
private _bluMarker = "";

{
    if([_bluPos, markerPos _x] call BIS_fnc_areEqual) exitWith {
        _bluMarker = _x;
    }
} forEach blufor_sectors;

_bluMarker
