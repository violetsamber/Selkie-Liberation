/*
    File: fn_sector_setup_bigtown.sqf
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

#include "../FunctionsInclude.hpp"
#include "sector_macros.hpp"

params [
    ["_pfh", objNull]
];

//PFH_GETVAR(_pfh,"_vehicle",objNull)

//PFH_GETPARAM(_pfh,_spawnPos,PARA_VAR_SPAWN_POS)


if (SLKLIB_combat_readiness < 30) then {_infsquad = "militia";};

_squad1 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad2 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad10 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad11 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad12 = ([_infsquad] call KPLIB_fnc_getSquadComp);
_squad13 = ([_infsquad] call KPLIB_fnc_getSquadComp);
if (GRLIB_unitcap >= 1) then {_squad3 = ([_infsquad] call KPLIB_fnc_getSquadComp);};
if (GRLIB_unitcap >= 1.5) then {_squad4 = ([_infsquad] call KPLIB_fnc_getSquadComp);};

_vehtospawn = [(selectRandom militia_vehicles),(selectRandom militia_vehicles)];
if ((random 100) > (66 / GRLIB_difficulty_modifier)) then {_vehtospawn pushBack (selectRandom militia_vehicles);};
if ((random 100) > (50 / GRLIB_difficulty_modifier)) then {_vehtospawn pushBack (selectRandom militia_vehicles);};
if (_infsquad == "army") then {
    _vehtospawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    _vehtospawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {_vehtospawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);};
};

_spawncivs = true;

if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > 0)) then {
    _guerilla = true;
};

_building_ai_max = round (50 * _popfactor);
_building_range = MAX_BUILDING_RANGE_LARGE;
_local_capture_size = _local_capture_size * 1.4;

if (KP_liberation_civ_rep < 0) then {
    _iedcount = round (2 + (ceil (random 4)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);
} else {
    _iedcount = 0;
};
if (_iedcount > 16) then {_iedcount = 16};