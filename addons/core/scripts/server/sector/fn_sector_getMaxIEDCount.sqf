/*
    File: fn_sector_getMaxIEDCount.sqf
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
    ["_iedMin", 0],
    ["_iedMax", 0],
    ["_iedBaseRand", 0],
    ["_iedRandModi", 0]
];

private _iedcount = 0; 

if (KP_liberation_civ_rep < 0) then {
    _iedcount = round (_iedBaseRand + (ceil (random _iedRandModi)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);

    _iedCount = _iedCount max _iedMin;
    _iedCount = _iedCount min _iedMax;
} else {
    _iedcount = 0;
};

_iedCount
