/*
    File: fn_clearGrpWaypoints.sqf
    Authors: 
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

params [
    ["_grp", grpNull, [grpNull]]
];

[_grp] call CBA_fnc_clearWaypoints;
{_x doFollow leader _grp} forEach units _grp;

_grp