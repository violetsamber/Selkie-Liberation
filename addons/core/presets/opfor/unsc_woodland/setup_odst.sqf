/*
    File: setup_odst.sqf
    Authors:Violets
    Date: 2025-11-14
    Last Update: 2025-11-14
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

private _returnHashMap = createHashMap;

_returnHashMap set ["TeamLeader",        "Selkie_UNSC_ODST_TeamLeader"];
_returnHashMap set ["Autoriflemaid",     "Selkie_UNSC_ODST_Autoriflemaid"];
_returnHashMap set ["Breacher",          "Selkie_UNSC_ODST_Breacher"];
_returnHashMap set ["Grenadier",         "Selkie_UNSC_ODST_Grenadier"];
_returnHashMap set ["Corpsmaid",         "Selkie_UNSC_ODST_Corpsmaid"];
_returnHashMap set ["MissileSpecialist", "Selkie_UNSC_ODST_MissileSpecialist"];
_returnHashMap set ["RiflemaidA",        "Selkie_UNSC_ODST_Riflemaid_BR55"];
_returnHashMap set ["RiflemaidB",        "Selkie_UNSC_ODST_Riflemaid_MA5"];

private _returnArray = [];
{
    _returnArray pushBack _y;
} forEach _returnHashMap;

[
    _returnHashMap,
    _returnArray
]
