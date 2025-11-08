/*
    File: fn_sector_setup_military.sqf
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

_squad1 = ([] call KPLIB_fnc_getSquadComp);
_squad2 = ([] call KPLIB_fnc_getSquadComp);
_squad10 = ([] call KPLIB_fnc_getSquadComp);
_squad11 = ([] call KPLIB_fnc_getSquadComp);
_squad12 = ([] call KPLIB_fnc_getSquadComp);
_squad13 = ([] call KPLIB_fnc_getSquadComp);
if (GRLIB_unitcap >= 1.5) then {_squad3 = ([] call KPLIB_fnc_getSquadComp);};

_vehtospawn = [([] call KPLIB_fnc_getAdaptiveVehicle),([] call KPLIB_fnc_getAdaptiveVehicle)];

if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {
    _vehtospawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    _squad4 = ([] call KPLIB_fnc_getSquadComp);
};
if ((random 100) > (66 / GRLIB_difficulty_modifier)) then {_vehtospawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);};

_spawncivs = false;

_building_ai_max = round ((floor (18 + (round (SLKLIB_combat_readiness / 4 )))) * _popfactor);
_building_range = MAX_BUILDING_RANGE_STANDARD;