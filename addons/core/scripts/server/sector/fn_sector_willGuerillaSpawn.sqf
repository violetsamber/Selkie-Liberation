/*
    File: fn_sector_willGuerillaSpawn.sqf
    Authors: 
    Date: 2025-11-07
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
    ["_minRepMult", 0]
];

private _guerilla = false;

if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > _minRepMult)) then {
    _guerilla = true;
};

_guerilla
