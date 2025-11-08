/*
    File: fn_sector_setup_town.sqf
    Authors: Violets
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

if (SLKLIB_combat_readiness < 50) then {_infsquad = "militia";};

_squad1 = ([_infsquad] call KPLIB_fnc_getSquadComp);
if (GRLIB_unitcap >= 1.25) then {_squad2 = ([_infsquad] call KPLIB_fnc_getSquadComp);};
_squad10 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad11 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad12 = ([_infsquad] call KPLIB_fnc_getSquadComp);


if ((random 100) > (66 / GRLIB_difficulty_modifier)) then {_vehtospawn pushBack (selectRandom militia_vehicles);};
if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {_vehtospawn pushBack (selectRandom militia_vehicles);};
if (_infsquad == "army") then {
    _vehtospawn pushBack (selectRandom militia_vehicles);
    if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {
        _vehtospawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
        _squad3 = ([_infsquad] call KPLIB_fnc_getSquadComp);
    };
};

_spawncivs = true;

if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > 0)) then {
    _guerilla = true;
};

_building_ai_max = round ((floor (18 + (round (SLKLIB_combat_readiness / 10 )))) * _popfactor);
_building_range = MAX_BUILDING_RANGE_STANDARD;

if (KP_liberation_civ_rep < 0) then {
    _iedcount = round ((ceil (random 4)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);
} else {
    _iedcount = 0;
};
if (_iedcount > 12) then {_iedcount = 12};