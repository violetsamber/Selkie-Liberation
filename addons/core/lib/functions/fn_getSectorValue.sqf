/*
    File: fn_getSectorType.sqf
    Authors: 
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
    ["_sectorMarker"],
    ["_index"]
];

private _return = sectors_hashmap getOrDefault [_sectorMarker, ["nil"]];

if (_return select 0 == "nil") exitWith {
    [format ["Sector Marker: %1 is not in the sectors_hashmap.", _sectorMarker], "ERROR"] call KPLIB_fnc_log;
};

_return select _index
