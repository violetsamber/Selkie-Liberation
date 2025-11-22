/*
    File: fn_setSectorDefenseTime.sqf
    Authors: Violets
    Date: 2025-11-21
    Last Update: 2025-11-21
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
params [
    ["_time", 0]
];

if(_time < 1) exitWith { false };
[format["Set sector defense time: %1",_time], "DEBUG"] call KPLIB_fnc_log;

GRLIB_vulnerability_timer = _time;
publicVariable "GRLIB_vulnerability_timer";
