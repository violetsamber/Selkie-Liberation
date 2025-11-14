/*
    File: setup_paratroopers.sqf
    Authors: 
    Date: 2025-11-13
    Last Update: 2025-11-14
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Hashmap of paratrooper classes,
*/

private _returnHashMap = createHashMap;

_returnHashMap set ["TeamLeader",        opfor_team_leader];
_returnHashMap set ["Autoriflemaid",     opfor_machinegunner];
_returnHashMap set ["Breacher",          "Selkie_UNSC_Army_Breacher_WoodlandA"];
_returnHashMap set ["Grenadier",         opfor_grenadier];
_returnHashMap set ["Corpsmaid",         opfor_medic];
_returnHashMap set ["MissileSpecialist", opfor_rpg];
_returnHashMap set ["RiflemaidA",        opfor_rifleman];
_returnHashMap set ["RiflemaidB",        opfor_sentry];

private _returnArray = [];
{
    _returnArray pushBack _y;
} forEach _returnHashMap;

[
    _returnHashMap,
    _returnArray
]
